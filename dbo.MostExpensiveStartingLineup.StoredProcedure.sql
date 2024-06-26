USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[MostExpensiveStartingLineup]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Most Expensive Starting Lineup
CREATE PROCEDURE [dbo].[MostExpensiveStartingLineup]
    @TeamID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SeasonYear INT = 2024;

    -- Select the most expensive player for each position
    SELECT
        P.PlayerName,
        Pos.PositionName,
        MaxContracts.MaxContractValue AS ContractValue
    FROM
        (
            SELECT
                PP.PositionID,
                MAX(C.ContractValue) AS MaxContractValue
            FROM
                Contract C
                JOIN PlayerPosition PP ON C.PlayerID = PP.PlayerID
            WHERE
                C.TeamID = @TeamID
                AND C.SeasonYear = @SeasonYear
            GROUP BY
                PP.PositionID
        ) AS MaxContracts
        JOIN PlayerPosition PP ON MaxContracts.PositionID = PP.PositionID
        JOIN Contract C ON PP.PlayerID = C.PlayerID AND C.ContractValue = MaxContracts.MaxContractValue AND C.TeamID = @TeamID AND C.SeasonYear = @SeasonYear
        JOIN Player P ON PP.PlayerID = P.PlayerID
        JOIN Position Pos ON PP.PositionID = Pos.PositionID
    ORDER BY
        CASE Pos.PositionName
            WHEN 'Point Guard' THEN 1
            WHEN 'Shooting Guard' THEN 2
            WHEN 'Small Forward' THEN 3
            WHEN 'Power Forward' THEN 4
            WHEN 'Center' THEN 5
            ELSE 6
        END;
END;
GO
