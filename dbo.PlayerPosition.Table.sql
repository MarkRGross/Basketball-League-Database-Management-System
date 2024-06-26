USE [BasketballLeague]
GO
/****** Object:  Table [dbo].[PlayerPosition]    Script Date: 6/22/2024 9:53:09 PM ******/
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
ALTER TABLE [dbo].[PlayerPosition]  WITH NOCHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[PlayerPosition]  WITH NOCHECK ADD  CONSTRAINT [FK__PlayerPos__Posit__797309D9] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[PlayerPosition] CHECK CONSTRAINT [FK__PlayerPos__Posit__797309D9]
GO
