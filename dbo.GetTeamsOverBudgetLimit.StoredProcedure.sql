USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsOverBudgetLimit]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Teams Over Budget Limit
CREATE PROCEDURE [dbo].[GetTeamsOverBudgetLimit]
AS
BEGIN
    SELECT distinct T.TeamName, SUM(C.ContractValue) AS TotalContracts, 
           SUM(C.ContractValue) - 50000000 AS OverBudgetAmount
    FROM Team T
    JOIN Contract C ON T.TeamID = C.TeamID
    WHERE C.SeasonYear = 2024 AND C.IsInjured = 0
    GROUP BY T.TeamName
    HAVING SUM(C.ContractValue) > 50000000;
END;
GO
