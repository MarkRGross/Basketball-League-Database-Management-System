USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[ClearData]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create or Alter Procedure to Clear Data and Reset Identity
CREATE   PROCEDURE [dbo].[ClearData]
AS
BEGIN
    SET NOCOUNT ON;

    -- Disable foreign key constraints
    ALTER TABLE TradeDetails NOCHECK CONSTRAINT ALL;
    ALTER TABLE Trade NOCHECK CONSTRAINT ALL;
    ALTER TABLE Contract NOCHECK CONSTRAINT ALL;
    ALTER TABLE LuxuryTax NOCHECK CONSTRAINT ALL;
    ALTER TABLE PlayerPosition NOCHECK CONSTRAINT ALL;
    ALTER TABLE Player NOCHECK CONSTRAINT ALL;
    ALTER TABLE Team NOCHECK CONSTRAINT ALL;
    ALTER TABLE League NOCHECK CONSTRAINT ALL;
    ALTER TABLE Position NOCHECK CONSTRAINT ALL;

    -- Delete data from tables
    DELETE FROM TradeDetails;
    DELETE FROM Trade;
    DELETE FROM Contract;
    DELETE FROM LuxuryTax;
    DELETE FROM PlayerPosition;
    DELETE FROM Player;
    DELETE FROM Team;
    DELETE FROM League;
    DELETE FROM Position;

    -- Reset identity values only for tables that have identity columns
    DECLARE @TableName NVARCHAR(128);
    DECLARE IdentityCursor CURSOR FOR
    SELECT TABLE_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE COLUMNPROPERTY(object_id(TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 1;

    OPEN IdentityCursor;
    FETCH NEXT FROM IdentityCursor INTO @TableName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC('DBCC CHECKIDENT (''' + @TableName + ''', RESEED, 0)');
        FETCH NEXT FROM IdentityCursor INTO @TableName;
    END

    CLOSE IdentityCursor;
    DEALLOCATE IdentityCursor;

    -- Enable foreign key constraints
    ALTER TABLE TradeDetails CHECK CONSTRAINT ALL;
    ALTER TABLE Trade CHECK CONSTRAINT ALL;
    ALTER TABLE Contract CHECK CONSTRAINT ALL;
    ALTER TABLE LuxuryTax CHECK CONSTRAINT ALL;
    ALTER TABLE PlayerPosition CHECK CONSTRAINT ALL;
    ALTER TABLE Player CHECK CONSTRAINT ALL;
    ALTER TABLE Team CHECK CONSTRAINT ALL;
    ALTER TABLE League CHECK CONSTRAINT ALL;
    ALTER TABLE Position CHECK CONSTRAINT ALL;
END;
GO
