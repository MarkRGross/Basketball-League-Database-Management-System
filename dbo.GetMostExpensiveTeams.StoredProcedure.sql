USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[GetMostExpensiveTeams]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Most Expensive Teams
CREATE PROCEDURE [dbo].[GetMostExpensiveTeams]
AS
BEGIN
    SELECT T.TeamName, SUM(C.ContractValue) AS TotalContracts
    FROM Team T
    JOIN Contract C ON T.TeamID = C.TeamID
    WHERE C.SeasonYear = 2024 AND C.IsInjured = 0
    GROUP BY T.TeamName
    ORDER BY TotalContracts DESC;
END;
GO
