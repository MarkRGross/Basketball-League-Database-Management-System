USE [BasketballLeague]
GO
/****** Object:  Table [dbo].[TradeDetails]    Script Date: 6/22/2024 9:53:09 PM ******/
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
