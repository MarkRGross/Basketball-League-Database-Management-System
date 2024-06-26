USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[AddPosition]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Add a New Position
CREATE   PROCEDURE [dbo].[AddPosition]
    @PositionName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the new position into the Position table
    INSERT INTO Position (PositionName)
    VALUES (@PositionName);
END;
GO
