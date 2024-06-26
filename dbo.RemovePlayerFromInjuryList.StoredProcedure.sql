USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[RemovePlayerFromInjuryList]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Remove a Player from Injury List
CREATE PROCEDURE [dbo].[RemovePlayerFromInjuryList]
    @PlayerID INT
AS
BEGIN
    UPDATE Contract
    SET IsInjured = 0
    WHERE PlayerID = @PlayerID AND SeasonYear = 2024;
END;
GO
