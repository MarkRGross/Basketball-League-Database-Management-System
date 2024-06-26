USE [master]
GO
/****** Object:  Database [BasketballLeague]    Script Date: 6/22/2024 9:38:28 PM ******/
CREATE DATABASE [BasketballLeague]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BasketballLeague', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BasketballLeague.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BasketballLeague_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BasketballLeague_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BasketballLeague] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BasketballLeague].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BasketballLeague] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BasketballLeague] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BasketballLeague] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BasketballLeague] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BasketballLeague] SET ARITHABORT OFF 
GO
ALTER DATABASE [BasketballLeague] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BasketballLeague] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BasketballLeague] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BasketballLeague] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BasketballLeague] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BasketballLeague] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BasketballLeague] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BasketballLeague] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BasketballLeague] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BasketballLeague] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BasketballLeague] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BasketballLeague] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BasketballLeague] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BasketballLeague] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BasketballLeague] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BasketballLeague] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BasketballLeague] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BasketballLeague] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BasketballLeague] SET  MULTI_USER 
GO
ALTER DATABASE [BasketballLeague] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BasketballLeague] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BasketballLeague] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BasketballLeague] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BasketballLeague] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BasketballLeague] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BasketballLeague] SET QUERY_STORE = ON
GO
ALTER DATABASE [BasketballLeague] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BasketballLeague]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[SeasonYear] [int] NOT NULL,
	[ContractValue] [decimal](18, 2) NOT NULL,
	[IsInjured] [bit] NOT NULL,
	[StartYear] [int] NULL,
	[EndYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[League]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[League](
	[LeagueID] [int] IDENTITY(1,1) NOT NULL,
	[LeagueName] [nvarchar](100) NOT NULL,
	[SeasonYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuxuryTax]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuxuryTax](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[SeasonYear] [int] NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerPosition]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerPosition](
	[PlayerID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC,
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NOT NULL,
	[LeagueID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade](
	[TradeID] [int] IDENTITY(1,1) NOT NULL,
	[TradeDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradeDetails]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradeDetails](
	[TradeDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TradeID] [int] NOT NULL,
	[PlayerID] [int] NOT NULL,
	[FromTeamID] [int] NOT NULL,
	[ToTeamID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract] ADD  DEFAULT ((0)) FOR [IsInjured]
GO
ALTER TABLE [dbo].[Contract]  WITH NOCHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[Contract]  WITH NOCHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[LuxuryTax]  WITH NOCHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[PlayerPosition]  WITH NOCHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[PlayerPosition]  WITH NOCHECK ADD  CONSTRAINT [FK__PlayerPos__Posit__797309D9] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[PlayerPosition] CHECK CONSTRAINT [FK__PlayerPos__Posit__797309D9]
GO
ALTER TABLE [dbo].[Team]  WITH NOCHECK ADD FOREIGN KEY([LeagueID])
REFERENCES [dbo].[League] ([LeagueID])
GO
ALTER TABLE [dbo].[TradeDetails]  WITH NOCHECK ADD FOREIGN KEY([FromTeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TradeDetails]  WITH NOCHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[TradeDetails]  WITH NOCHECK ADD FOREIGN KEY([ToTeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TradeDetails]  WITH NOCHECK ADD FOREIGN KEY([TradeID])
REFERENCES [dbo].[Trade] ([TradeID])
GO
/****** Object:  StoredProcedure [dbo].[AddLeague]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPlayer]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Add a New Player
CREATE   PROCEDURE [dbo].[AddPlayer]
    @PlayerName NVARCHAR(100),
    @PositionIDs NVARCHAR(MAX), -- Comma-separated list of PositionIDs
    @TeamID INT,
    @SeasonYear INT,
    @ContractValue DECIMAL(18, 2),
    @IsInjured BIT,
    @StartYear INT,
    @EndYear INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PlayerID INT;
    DECLARE @PositionID INT;
    DECLARE @PositionIDList TABLE (PositionID INT);

    -- Insert the new player into the Player table
    INSERT INTO Player (PlayerName)
    VALUES (@PlayerName);

    -- Get the newly inserted PlayerID
    SET @PlayerID = SCOPE_IDENTITY();

    -- Parse the comma-separated list of PositionIDs and insert into @PositionIDList table
    WHILE CHARINDEX(',', @PositionIDs) > 0
    BEGIN
        SET @PositionID = CAST(LEFT(@PositionIDs, CHARINDEX(',', @PositionIDs) - 1) AS INT);
        INSERT INTO @PositionIDList (PositionID) VALUES (@PositionID);
        SET @PositionIDs = RIGHT(@PositionIDs, LEN(@PositionIDs) - CHARINDEX(',', @PositionIDs));
    END;
    SET @PositionID = CAST(@PositionIDs AS INT);
    INSERT INTO @PositionIDList (PositionID) VALUES (@PositionID);

    -- Insert the player positions into the PlayerPosition table
    INSERT INTO PlayerPosition (PlayerID, PositionID)
    SELECT @PlayerID, PositionID
    FROM @PositionIDList;

    -- Insert the contract details into the Contract table
    INSERT INTO Contract (PlayerID, TeamID, SeasonYear, ContractValue, IsInjured, StartYear, EndYear)
    VALUES (@PlayerID, @TeamID, @SeasonYear, @ContractValue, @IsInjured, @StartYear, @EndYear);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddPosition]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddTeam]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClearData]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMostExpensivePlayers]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMostExpensiveTeams]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Most Expensive Teams
CREATE PROCEDURE [dbo].[GetMostExpensiveTeams]
AS
BEGIN
    SELECT T.TeamName, SUM(C.ContractValue) AS TotalContracts
    FROM Team T
    JOIN Contract C ON T.TeamID = C.TeamID
    WHERE C.SeasonYear = 2024 AND C.IsInjured = 0
    GROUP BY T.TeamName
    ORDER BY TotalContracts DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsOverBudgetLimit]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertSampleData]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MonthlyBudgetValidation]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MostExpensiveStartingLineup]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure for Most Expensive Starting Lineup
CREATE PROCEDURE [dbo].[MostExpensiveStartingLineup]
    @TeamID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SeasonYear INT = 2024;

    -- Select the most expensive player for each position
    SELECT
        P.PlayerName,
        Pos.PositionName,
        MaxContracts.MaxContractValue AS ContractValue
    FROM
        (
            SELECT
                PP.PositionID,
                MAX(C.ContractValue) AS MaxContractValue
            FROM
                Contract C
                JOIN PlayerPosition PP ON C.PlayerID = PP.PlayerID
            WHERE
                C.TeamID = @TeamID
                AND C.SeasonYear = @SeasonYear
            GROUP BY
                PP.PositionID
        ) AS MaxContracts
        JOIN PlayerPosition PP ON MaxContracts.PositionID = PP.PositionID
        JOIN Contract C ON PP.PlayerID = C.PlayerID AND C.ContractValue = MaxContracts.MaxContractValue AND C.TeamID = @TeamID AND C.SeasonYear = @SeasonYear
        JOIN Player P ON PP.PlayerID = P.PlayerID
        JOIN Position Pos ON PP.PositionID = Pos.PositionID
    ORDER BY
        CASE Pos.PositionName
            WHEN 'Point Guard' THEN 1
            WHEN 'Shooting Guard' THEN 2
            WHEN 'Small Forward' THEN 3
            WHEN 'Power Forward' THEN 4
            WHEN 'Center' THEN 5
            ELSE 6
        END;
END;
GO
/****** Object:  StoredProcedure [dbo].[PlacePlayerOnInjuryList]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RemovePlayerFromInjuryList]    Script Date: 6/22/2024 9:38:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TradePlayers]    Script Date: 6/22/2024 9:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TradePlayers]
    @TradeDate DATE,
    @FromTeamID INT,
    @ToTeamID INT,
    @FromPlayerIDs NVARCHAR(MAX), -- Comma-separated list of player IDs from the first team
    @ToPlayerIDs NVARCHAR(MAX)    -- Comma-separated list of player IDs from the second team
AS
BEGIN
    DECLARE @TradeID INT;
    DECLARE @PlayerID INT;
    DECLARE @FromTeamTotal DECIMAL(18, 2);
    DECLARE @ToTeamTotal DECIMAL(18, 2);
    DECLARE @MaxDifference DECIMAL(18, 2);
    DECLARE @FromTeamRosterCount INT;
    DECLARE @ToTeamRosterCount INT;

    -- Parse the comma-separated list of player IDs and insert into temporary tables
    DECLARE @FromPlayerTable TABLE (PlayerID INT);
    DECLARE @ToPlayerTable TABLE (PlayerID INT);

    -- Parse FromPlayerIDs
    WHILE CHARINDEX(',', @FromPlayerIDs) > 0
    BEGIN
        SET @PlayerID = LEFT(@FromPlayerIDs, CHARINDEX(',', @FromPlayerIDs) - 1);
        INSERT INTO @FromPlayerTable (PlayerID) VALUES (@PlayerID);
        SET @FromPlayerIDs = RIGHT(@FromPlayerIDs, LEN(@FromPlayerIDs) - CHARINDEX(',', @FromPlayerIDs));
    END;
    INSERT INTO @FromPlayerTable (PlayerID) VALUES (@FromPlayerIDs);

    -- Parse ToPlayerIDs
    WHILE CHARINDEX(',', @ToPlayerIDs) > 0
    BEGIN
        SET @PlayerID = LEFT(@ToPlayerIDs, CHARINDEX(',', @ToPlayerIDs) - 1);
        INSERT INTO @ToPlayerTable (PlayerID) VALUES (@PlayerID);
        SET @ToPlayerIDs = RIGHT(@ToPlayerIDs, LEN(@ToPlayerIDs) - CHARINDEX(',', @ToPlayerIDs));
    END;
    INSERT INTO @ToPlayerTable (PlayerID) VALUES (@ToPlayerIDs);

    -- Calculate total contract values for the players being traded
    SELECT @FromTeamTotal = SUM(ContractValue)
    FROM Contract
    WHERE PlayerID IN (SELECT PlayerID FROM @FromPlayerTable);

    SELECT @ToTeamTotal = SUM(ContractValue)
    FROM Contract
    WHERE PlayerID IN (SELECT PlayerID FROM @ToPlayerTable);

    -- Calculate the maximum allowed difference
    SET @MaxDifference = (@FromTeamTotal + @ToTeamTotal) * 0.20;

    -- Check if the difference between the contract values is within the allowed range
    IF ABS(@FromTeamTotal - @ToTeamTotal) > @MaxDifference
    BEGIN
        RAISERROR('The difference in contract values between the traded players exceeds the allowed limit of 20%%.', 16, 1);
        RETURN;
    END;

    -- Check if both teams have enough empty spots on their rosters
    SELECT @FromTeamRosterCount = COUNT(*) FROM Contract WHERE TeamID = @FromTeamID AND SeasonYear = YEAR(@TradeDate);
    SELECT @ToTeamRosterCount = COUNT(*) FROM Contract WHERE TeamID = @ToTeamID AND SeasonYear = YEAR(@TradeDate);

    IF (@FromTeamRosterCount - (SELECT COUNT(*) FROM @FromPlayerTable) + (SELECT COUNT(*) FROM @ToPlayerTable)) > 15
       OR (@ToTeamRosterCount - (SELECT COUNT(*) FROM @ToPlayerTable) + (SELECT COUNT(*) FROM @FromPlayerTable)) > 15
    BEGIN
        RAISERROR('One of the teams does not have enough empty spots on the roster.', 16, 1);
        RETURN;
    END;

    -- Create a new trade record
    INSERT INTO Trade (TradeDate) VALUES (@TradeDate);
    SET @TradeID = SCOPE_IDENTITY();

    -- Insert into TradeDetails table and update the Contract table for each player from FromTeamID to ToTeamID
    DECLARE TradeCursor CURSOR FOR
    SELECT PlayerID FROM @FromPlayerTable;
    OPEN TradeCursor;
    FETCH NEXT FROM TradeCursor INTO @PlayerID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO TradeDetails (TradeID, PlayerID, FromTeamID, ToTeamID)
        VALUES (@TradeID, @PlayerID, @FromTeamID, @ToTeamID);

        -- Update the player's team in the Contract table
        UPDATE Contract
        SET TeamID = @ToTeamID
        WHERE PlayerID = @PlayerID;

        FETCH NEXT FROM TradeCursor INTO @PlayerID;
    END;

    CLOSE TradeCursor;
    DEALLOCATE TradeCursor;

    -- Insert into TradeDetails table and update the Contract table for each player from ToTeamID to FromTeamID
    DECLARE TradeCursor2 CURSOR FOR
    SELECT PlayerID FROM @ToPlayerTable;
    OPEN TradeCursor2;
    FETCH NEXT FROM TradeCursor2 INTO @PlayerID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO TradeDetails (TradeID, PlayerID, FromTeamID, ToTeamID)
        VALUES (@TradeID, @PlayerID, @ToTeamID, @FromTeamID);

        -- Update the player's team in the Contract table
        UPDATE Contract
        SET TeamID = @FromTeamID
        WHERE PlayerID = @PlayerID;

        FETCH NEXT FROM TradeCursor2 INTO @PlayerID;
    END;

    CLOSE TradeCursor2;
    DEALLOCATE TradeCursor2;
END;
GO
USE [master]
GO
ALTER DATABASE [BasketballLeague] SET  READ_WRITE 
GO
