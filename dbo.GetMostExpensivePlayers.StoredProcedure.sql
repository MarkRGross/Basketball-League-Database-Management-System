USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[GetMostExpensivePlayers]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Most Expensive Players
CREATE PROCEDURE [dbo].[GetMostExpensivePlayers]
AS
BEGIN
    SELECT P.PlayerName, T.TeamName, C.ContractValue
    FROM Player P
    JOIN Contract C ON P.PlayerID = C.PlayerID
    JOIN Team T ON C.TeamID = T.TeamID
    WHERE C.SeasonYear = 2024 AND C.IsInjured = 0
    ORDER BY C.ContractValue DESC;
END;
GO
