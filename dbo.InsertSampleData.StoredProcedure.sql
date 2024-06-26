USE [BasketballLeague]
GO
/****** Object:  StoredProcedure [dbo].[InsertSampleData]    Script Date: 6/22/2024 9:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Insert Sample Data
CREATE   PROCEDURE [dbo].[InsertSampleData]
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert leagues using AddLeague
    EXEC AddLeague @LeagueName = 'Mark Basketball League', @SeasonYear = 2024;
    EXEC AddLeague @LeagueName = 'Vic Basketball League', @SeasonYear = 2024;

    -- Insert positions using AddPosition
    EXEC AddPosition @PositionName = 'Point Guard';
    EXEC AddPosition @PositionName = 'Shooting Guard';
    EXEC AddPosition @PositionName = 'Small Forward';
    EXEC AddPosition @PositionName = 'Power Forward';
    EXEC AddPosition @PositionName = 'Center';


    -- Insert teams using AddTeam
    EXEC AddTeam @TeamName = 'Bakers',  @LeagueID = 1;
    EXEC AddTeam @TeamName = 'Groncos', @LeagueID = 1;
    EXEC AddTeam @TeamName = 'Nicks',   @LeagueID = 2;
    EXEC AddTeam @TeamName = 'Dulls',   @LeagueID = 2;

    -- Insert players using AddPlayer
    EXEC AddPlayer 
        @PlayerName = 'LeBron Flames',
        @PositionIDs = '1,2', -- Point Guard and Shooting Guard
        @TeamID = 1,
        @SeasonYear = 2024,
        @ContractValue = 5000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2025;

    EXEC AddPlayer 
        @PlayerName = 'Shaquille O''Steel',
        @PositionIDs = '5,1', -- Center and Point Guard
        @TeamID = 1,
        @SeasonYear = 2024,
        @ContractValue = 9000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2028;

    EXEC AddPlayer 
        @PlayerName = 'Kobe Beef',
        @PositionIDs = '1,3', -- Point Guard and Small Forward
        @TeamID = 1,
        @SeasonYear = 2024,
        @ContractValue = 2000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2029;

    EXEC AddPlayer 
        @PlayerName = 'Magic Janson',
        @PositionIDs = '1,2', -- Point Guard and Shooting Guard
        @TeamID = 1,
        @SeasonYear = 2024,
        @ContractValue = 5000000.00,
        @IsInjured = 1,
        @StartYear = 2024,
        @EndYear = 2027;

    EXEC AddPlayer 
        @PlayerName = 'Michael Swish',
        @PositionIDs = '2,3', -- Shooting Guard and Small Forward
        @TeamID = 2,
        @SeasonYear = 2024,
        @ContractValue = 7000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2025;

    EXEC AddPlayer 
        @PlayerName = 'Dunkin Donuts',
        @PositionIDs = '2,4', -- Shooting Guard and Power Forward
        @TeamID = 2,
        @SeasonYear = 2024,
        @ContractValue = 3000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2026;

    EXEC AddPlayer 
        @PlayerName = 'Larry Beard',
        @PositionIDs = '3,4', -- Small Forward and Power Forward
        @TeamID = 3,
        @SeasonYear = 2024,
        @ContractValue = 6000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2025;

    EXEC AddPlayer 
        @PlayerName = 'Wilt Chamberpot',
        @PositionIDs = '1,5', -- Point Guard and Center
        @TeamID = 3,
        @SeasonYear = 2024,
        @ContractValue = 4000000.00,
        @IsInjured = 1,
        @StartYear = 2024,
        @EndYear = 2030;

    EXEC AddPlayer 
        @PlayerName = 'Steph Flurry',
        @PositionIDs = '4,5', -- Power Forward and Center
        @TeamID = 4,
        @SeasonYear = 2024,
        @ContractValue = 8000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2025;

    EXEC AddPlayer 
        @PlayerName = 'Timmy Dunkin',
        @PositionIDs = '3,4', -- Small Forward and Power Forward
        @TeamID = 4,
        @SeasonYear = 2024,
        @ContractValue = 6000000.00,
        @IsInjured = 0,
        @StartYear = 2024,
        @EndYear = 2026;

--Charles Sparkly
--Karl Maulone
--Dennis Rodmad
--Kevin Durrant
--Dirk NoHitSki
--Kyrie Swerving
--James Hearden
--Russell Wrest-brook
--Giannis Antetokunbo
--Carmelo Candy
--Paul Georgeous
--Dwyane Wade-a-minute
--Chris Toss
--Allen Iverseen
--Blake Grizzly
--Vince Carder
--Damian Liller
--Zion Wilkerson
--Jayson Slam
--Jimmy Buckets


END;
GO
