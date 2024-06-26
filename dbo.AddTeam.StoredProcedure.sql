USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[AddTeam]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Add a New Team
CREATE   PROCEDURE [dbo].[AddTeam]
    @TeamName NVARCHAR(100),
    @LeagueID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the new team into the Team table
    INSERT INTO Team (TeamName, LeagueID)
    VALUES (@TeamName, @LeagueID);
END;
GO
