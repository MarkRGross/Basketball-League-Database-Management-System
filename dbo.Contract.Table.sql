USE [BasketballLeague]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 6/22/2024 9:53:09 PM ******/
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
ALTER TABLE [dbo].[Contract] ADD  DEFAULT ((0)) FOR [IsInjured]
GO
ALTER TABLE [dbo].[Contract]  WITH NOCHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[Contract]  WITH NOCHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
