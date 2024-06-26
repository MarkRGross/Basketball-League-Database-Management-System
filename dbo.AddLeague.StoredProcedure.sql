USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[AddLeague]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Add a New League
CREATE   PROCEDURE [dbo].[AddLeague]
    @LeagueName NVARCHAR(100),
    @SeasonYear INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the new league into the League table
    INSERT INTO League (LeagueName, SeasonYear)
    VALUES (@LeagueName, @SeasonYear);
END;
GO
