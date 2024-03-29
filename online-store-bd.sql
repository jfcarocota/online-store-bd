USE [db_onlineStore]
GO
/****** Object:  User [store]    Script Date: 10/10/2019 1:01:04 PM ******/
CREATE USER [store] FOR LOGIN [store] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [store]
GO
/****** Object:  Table [dbo].[tbl_categories]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_vendors]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vendors](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_vendors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[price] [float] NULL,
	[category_id] [bigint] NULL,
	[vendor_id] [bigint] NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_costumer]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_costumer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](20) NULL,
	[secondName] [varchar](20) NULL,
	[middleName] [varchar](20) NULL,
	[lastName] [varchar](20) NULL,
	[adress] [varchar](300) NULL,
 CONSTRAINT [PK_tbl_costumer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[order_date] [datetime] NULL,
	[orderArrive] [datetime] NULL,
	[costumer_id] [bigint] NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_order]    Script Date: 10/10/2019 1:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_order]
AS
SELECT dbo.tbl_order.id, dbo.tbl_order.order_date, dbo.tbl_order.orderArrive AS order_arrive, dbo.tbl_categories.category, dbo.tbl_costumer.firstName, dbo.tbl_costumer.secondName, dbo.tbl_costumer.middleName, dbo.tbl_costumer.lastName, 
                  dbo.tbl_product.name AS productName, dbo.tbl_product.price, dbo.tbl_vendors.name AS vendor, dbo.tbl_costumer.adress
FROM     dbo.tbl_categories INNER JOIN
                  dbo.tbl_costumer ON dbo.tbl_categories.id = dbo.tbl_costumer.id INNER JOIN
                  dbo.tbl_order ON dbo.tbl_costumer.id = dbo.tbl_order.costumer_id INNER JOIN
                  dbo.tbl_product ON dbo.tbl_categories.id = dbo.tbl_product.category_id INNER JOIN
                  dbo.tbl_vendors ON dbo.tbl_product.vendor_id = dbo.tbl_vendors.id
GO
SET IDENTITY_INSERT [dbo].[tbl_categories] ON 

INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (1, N'book')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (2, N'manga')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (3, N'tutotial')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (4, N'assets')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (5, N'art')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (6, N'cupon')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (7, N'game')
INSERT [dbo].[tbl_categories] ([id], [category]) VALUES (8, N'electronic')
SET IDENTITY_INSERT [dbo].[tbl_categories] OFF
SET IDENTITY_INSERT [dbo].[tbl_costumer] ON 

INSERT [dbo].[tbl_costumer] ([id], [firstName], [secondName], [middleName], [lastName], [adress]) VALUES (1, N'Jesus', N'Francisco', N'Caro', N'Cota', N'cedro 1, calle hibisco 1001')
INSERT [dbo].[tbl_costumer] ([id], [firstName], [secondName], [middleName], [lastName], [adress]) VALUES (2, N'Jesus', N'Arnulfo', N'Marquez', N'Navarro', N'Calle yaqui')
SET IDENTITY_INSERT [dbo].[tbl_costumer] OFF
SET IDENTITY_INSERT [dbo].[tbl_order] ON 

INSERT [dbo].[tbl_order] ([id], [product_id], [order_date], [orderArrive], [costumer_id]) VALUES (1, 1, CAST(N'2019-10-09T20:08:29.183' AS DateTime), NULL, 1)
INSERT [dbo].[tbl_order] ([id], [product_id], [order_date], [orderArrive], [costumer_id]) VALUES (2, 2, CAST(N'2019-10-09T20:08:50.587' AS DateTime), NULL, 1)
INSERT [dbo].[tbl_order] ([id], [product_id], [order_date], [orderArrive], [costumer_id]) VALUES (3, 3, CAST(N'2019-10-09T20:09:05.837' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[tbl_order] OFF
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([id], [name], [price], [category_id], [vendor_id]) VALUES (1, N'my cool book', 50, 1, 1)
INSERT [dbo].[tbl_product] ([id], [name], [price], [category_id], [vendor_id]) VALUES (2, N'super manga history', 80, 2, 2)
INSERT [dbo].[tbl_product] ([id], [name], [price], [category_id], [vendor_id]) VALUES (3, N'poster animacion', 200, 5, 2)
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
SET IDENTITY_INSERT [dbo].[tbl_vendors] ON 

INSERT [dbo].[tbl_vendors] ([id], [name], [description]) VALUES (1, N'vendor1', N'no description yet')
INSERT [dbo].[tbl_vendors] ([id], [name], [description]) VALUES (2, N'vendor2', N'not description yet')
SET IDENTITY_INSERT [dbo].[tbl_vendors] OFF
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_tbl_costumer] FOREIGN KEY([costumer_id])
REFERENCES [dbo].[tbl_costumer] ([id])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_tbl_costumer]
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_tbl_order] FOREIGN KEY([id])
REFERENCES [dbo].[tbl_order] ([id])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_tbl_order]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_categories] ([id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_categories]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_vendors] FOREIGN KEY([vendor_id])
REFERENCES [dbo].[tbl_vendors] ([id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_vendors]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_categories"
            Begin Extent = 
               Top = 144
               Left = 9
               Bottom = 263
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_costumer"
            Begin Extent = 
               Top = 10
               Left = 238
               Bottom = 173
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbl_order"
            Begin Extent = 
               Top = 0
               Left = 534
               Bottom = 163
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_product"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_vendors"
            Begin Extent = 
               Top = 7
               Left = 1016
               Bottom = 148
               Right = 1210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1968
         Alias = 3372
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_order'
GO
