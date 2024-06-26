USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[MonthlyBudgetValidation]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure for Monthly Budget Validation
CREATE PROCEDURE [dbo].[MonthlyBudgetValidation]
AS
BEGIN
    DECLARE @ContractLimit DECIMAL(18, 2) = 50000000; -- Assuming the budget limit is $50,000,000

    INSERT INTO LuxuryTax (TeamID, SeasonYear, TaxAmount)
    SELECT TeamID, 2024, SUM(ContractValue) - @ContractLimit
    FROM Contract
    WHERE SeasonYear = 2024 AND IsInjured = 0
    GROUP BY TeamID
    HAVING SUM(ContractValue) > @ContractLimit;
END;
GO
