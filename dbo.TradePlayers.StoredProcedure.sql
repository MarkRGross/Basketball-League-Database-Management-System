USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[TradePlayers]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TradePlayers]
    @TradeDate DATE,
    @FromTeamID INT,
    @ToTeamID INT,
    @FromPlayerIDs NVARCHAR(MAX), -- Comma-separated list of player IDs from the first team
    @ToPlayerIDs NVARCHAR(MAX)    -- Comma-separated list of player IDs from the second team
AS
BEGIN
    DECLARE @TradeID INT;
    DECLARE @PlayerID INT;
    DECLARE @FromTeamTotal DECIMAL(18, 2);
    DECLARE @ToTeamTotal DECIMAL(18, 2);
    DECLARE @MaxDifference DECIMAL(18, 2);
    DECLARE @FromTeamRosterCount INT;
    DECLARE @ToTeamRosterCount INT;

    -- Parse the comma-separated list of player IDs and insert into temporary tables
    DECLARE @FromPlayerTable TABLE (PlayerID INT);
    DECLARE @ToPlayerTable TABLE (PlayerID INT);

    -- Parse FromPlayerIDs
    WHILE CHARINDEX(',', @FromPlayerIDs) > 0
    BEGIN
        SET @PlayerID = LEFT(@FromPlayerIDs, CHARINDEX(',', @FromPlayerIDs) - 1);
        INSERT INTO @FromPlayerTable (PlayerID) VALUES (@PlayerID);
        SET @FromPlayerIDs = RIGHT(@FromPlayerIDs, LEN(@FromPlayerIDs) - CHARINDEX(',', @FromPlayerIDs));
    END;
    INSERT INTO @FromPlayerTable (PlayerID) VALUES (@FromPlayerIDs);

    -- Parse ToPlayerIDs
    WHILE CHARINDEX(',', @ToPlayerIDs) > 0
    BEGIN
        SET @PlayerID = LEFT(@ToPlayerIDs, CHARINDEX(',', @ToPlayerIDs) - 1);
        INSERT INTO @ToPlayerTable (PlayerID) VALUES (@PlayerID);
        SET @ToPlayerIDs = RIGHT(@ToPlayerIDs, LEN(@ToPlayerIDs) - CHARINDEX(',', @ToPlayerIDs));
    END;
    INSERT INTO @ToPlayerTable (PlayerID) VALUES (@ToPlayerIDs);

    -- Calculate total contract values for the players being traded
    SELECT @FromTeamTotal = SUM(ContractValue)
    FROM Contract
    WHERE PlayerID IN (SELECT PlayerID FROM @FromPlayerTable);

    SELECT @ToTeamTotal = SUM(ContractValue)
    FROM Contract
    WHERE PlayerID IN (SELECT PlayerID FROM @ToPlayerTable);

    -- Calculate the maximum allowed difference
    SET @MaxDifference = (@FromTeamTotal + @ToTeamTotal) * 0.20;

    -- Check if the difference between the contract values is within the allowed range
    IF ABS(@FromTeamTotal - @ToTeamTotal) > @MaxDifference
    BEGIN
        RAISERROR('The difference in contract values between the traded players exceeds the allowed limit of 20%%.', 16, 1);
        RETURN;
    END;

    -- Check if both teams have enough empty spots on their rosters
    SELECT @FromTeamRosterCount = COUNT(*) FROM Contract WHERE TeamID = @FromTeamID AND SeasonYear = YEAR(@TradeDate);
    SELECT @ToTeamRosterCount = COUNT(*) FROM Contract WHERE TeamID = @ToTeamID AND SeasonYear = YEAR(@TradeDate);

    IF (@FromTeamRosterCount - (SELECT COUNT(*) FROM @FromPlayerTable) + (SELECT COUNT(*) FROM @ToPlayerTable)) > 15
       OR (@ToTeamRosterCount - (SELECT COUNT(*) FROM @ToPlayerTable) + (SELECT COUNT(*) FROM @FromPlayerTable)) > 15
    BEGIN
        RAISERROR('One of the teams does not have enough empty spots on the roster.', 16, 1);
        RETURN;
    END;

    -- Create a new trade record
    INSERT INTO Trade (TradeDate) VALUES (@TradeDate);
    SET @TradeID = SCOPE_IDENTITY();

    -- Insert into TradeDetails table and update the Contract table for each player from FromTeamID to ToTeamID
    DECLARE TradeCursor CURSOR FOR
    SELECT PlayerID FROM @FromPlayerTable;
    OPEN TradeCursor;
    FETCH NEXT FROM TradeCursor INTO @PlayerID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO TradeDetails (TradeID, PlayerID, FromTeamID, ToTeamID)
        VALUES (@TradeID, @PlayerID, @FromTeamID, @ToTeamID);

        -- Update the player's team in the Contract table
        UPDATE Contract
        SET TeamID = @ToTeamID
        WHERE PlayerID = @PlayerID;

        FETCH NEXT FROM TradeCursor INTO @PlayerID;
    END;

    CLOSE TradeCursor;
    DEALLOCATE TradeCursor;

    -- Insert into TradeDetails table and update the Contract table for each player from ToTeamID to FromTeamID
    DECLARE TradeCursor2 CURSOR FOR
    SELECT PlayerID FROM @ToPlayerTable;
    OPEN TradeCursor2;
    FETCH NEXT FROM TradeCursor2 INTO @PlayerID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO TradeDetails (TradeID, PlayerID, FromTeamID, ToTeamID)
        VALUES (@TradeID, @PlayerID, @ToTeamID, @FromTeamID);

        -- Update the player's team in the Contract table
        UPDATE Contract
        SET TeamID = @FromTeamID
        WHERE PlayerID = @PlayerID;

        FETCH NEXT FROM TradeCursor2 INTO @PlayerID;
    END;

    CLOSE TradeCursor2;
    DEALLOCATE TradeCursor2;
END;
GO
