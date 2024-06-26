USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[AddPlayer]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Add a New Player
CREATE   PROCEDURE [dbo].[AddPlayer]
    @PlayerName NVARCHAR(100),
    @PositionIDs NVARCHAR(MAX), -- Comma-separated list of PositionIDs
    @TeamID INT,
    @SeasonYear INT,
    @ContractValue DECIMAL(18, 2),
    @IsInjured BIT,
    @StartYear INT,
    @EndYear INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PlayerID INT;
    DECLARE @PositionID INT;
    DECLARE @PositionIDList TABLE (PositionID INT);

    -- Insert the new player into the Player table
    INSERT INTO Player (PlayerName)
    VALUES (@PlayerName);

    -- Get the newly inserted PlayerID
    SET @PlayerID = SCOPE_IDENTITY();

    -- Parse the comma-separated list of PositionIDs and insert into @PositionIDList table
    WHILE CHARINDEX(',', @PositionIDs) > 0
    BEGIN
        SET @PositionID = CAST(LEFT(@PositionIDs, CHARINDEX(',', @PositionIDs) - 1) AS INT);
        INSERT INTO @PositionIDList (PositionID) VALUES (@PositionID);
        SET @PositionIDs = RIGHT(@PositionIDs, LEN(@PositionIDs) - CHARINDEX(',', @PositionIDs));
    END;
    SET @PositionID = CAST(@PositionIDs AS INT);
    INSERT INTO @PositionIDList (PositionID) VALUES (@PositionID);

    -- Insert the player positions into the PlayerPosition table
    INSERT INTO PlayerPosition (PlayerID, PositionID)
    SELECT @PlayerID, PositionID
    FROM @PositionIDList;

    -- Insert the contract details into the Contract table
    INSERT INTO Contract (PlayerID, TeamID, SeasonYear, ContractValue, IsInjured, StartYear, EndYear)
    VALUES (@PlayerID, @TeamID, @SeasonYear, @ContractValue, @IsInjured, @StartYear, @EndYear);
END;
GO
