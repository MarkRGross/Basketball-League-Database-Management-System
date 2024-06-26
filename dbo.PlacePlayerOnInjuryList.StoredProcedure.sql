USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[PlacePlayerOnInjuryList]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Place a Player on Injury List
CREATE PROCEDURE [dbo].[PlacePlayerOnInjuryList]
    @PlayerID INT
AS
BEGIN
    UPDATE Contract
    SET IsInjured = 1
    WHERE PlayerID = @PlayerID AND SeasonYear = 2024;
END;
GO
