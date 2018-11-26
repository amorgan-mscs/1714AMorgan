USE [master]
GO
/****** Object:  Database [CandleStore]    Script Date: 11/25/2018 8:37:18 PM ******/
CREATE DATABASE [CandleStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CandleStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CandleStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CandleStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CandleStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CandleStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CandleStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CandleStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CandleStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CandleStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CandleStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CandleStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CandleStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CandleStore] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [CandleStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CandleStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CandleStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CandleStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CandleStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CandleStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CandleStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CandleStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CandleStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CandleStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CandleStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CandleStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CandleStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CandleStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CandleStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CandleStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CandleStore] SET  MULTI_USER 
GO
ALTER DATABASE [CandleStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CandleStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CandleStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CandleStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CandleStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CandleStore', N'ON'
GO
ALTER DATABASE [CandleStore] SET QUERY_STORE = OFF
GO
USE [CandleStore]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 11/25/2018 8:37:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Zip] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/25/2018 8:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Location_BuildingID] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/25/2018 8:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductsID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Amount] [nvarchar](max) NOT NULL,
	[Location_BuildingID] [int] NOT NULL,
	[Receipt_ReceiptID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 11/25/2018 8:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptDate] [datetime] NOT NULL,
	[Amount] [nvarchar](max) NOT NULL,
	[Employee_PersonID] [int] NOT NULL,
	[Customer_PersonID] [int] NOT NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([BuildingID], [Address], [City], [State], [Zip]) VALUES (1, N'4567 Penn Ave S', N'Richfield', N'MN', N'55423')
GO
INSERT [dbo].[Locations] ([BuildingID], [Address], [City], [State], [Zip]) VALUES (2, N'9563 Amerivan Ave', N'Bloomington', N'MN', N'55632')
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email], [Location_BuildingID]) VALUES (1, N'Sarah', N'Johnson', N'789563204', N'sarahjohnson@gmail.com', 1)
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email], [Location_BuildingID]) VALUES (2, N'Alice', N'Wonderland', N'4561239365', N'alicewonderland@gmail.com', 2)
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email], [Location_BuildingID]) VALUES (3, N'John', N'Adams', N'4567891234', N'johnadams@yahoo.com', 1)
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email], [Location_BuildingID]) VALUES (5, N'Josh ', N'Washington', N'1235687414', N'joshwashington@aol.com', 2)
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email], [Location_BuildingID]) VALUES (6, N'Walter', N'Jones', N'7895612345', N'walterjones@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (9, N'Large Candle', N'25', 1, 1)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (10, N'Medium Candle', N'20', 1, 1)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (11, N'Small Candle', N'15', 1, 1)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (12, N'Candle Melt', N'10', 1, 1)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (13, N'Large Candle', N'25', 2, 4)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (14, N'Medium Candle', N'20', 2, 4)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (15, N'Small Candle', N'15', 2, 4)
GO
INSERT [dbo].[Products] ([ProductsID], [Description], [Amount], [Location_BuildingID], [Receipt_ReceiptID]) VALUES (16, N'Candle Melt', N'10', 2, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipts] ON 
GO
INSERT [dbo].[Receipts] ([ReceiptID], [ReceiptDate], [Amount], [Employee_PersonID], [Customer_PersonID]) VALUES (1, CAST(N'2018-11-25T00:00:00.000' AS DateTime), N'36', 1, 3)
GO
INSERT [dbo].[Receipts] ([ReceiptID], [ReceiptDate], [Amount], [Employee_PersonID], [Customer_PersonID]) VALUES (4, CAST(N'2018-11-05T00:00:00.000' AS DateTime), N'15', 5, 2)
GO
INSERT [dbo].[Receipts] ([ReceiptID], [ReceiptDate], [Amount], [Employee_PersonID], [Customer_PersonID]) VALUES (5, CAST(N'2018-11-10T00:00:00.000' AS DateTime), N'20', 1, 6)
GO
SET IDENTITY_INSERT [dbo].[Receipts] OFF
GO
/****** Object:  Index [IX_FK_LocationPerson]    Script Date: 11/25/2018 8:37:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LocationPerson] ON [dbo].[People]
(
	[Location_BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LocationProducts]    Script Date: 11/25/2018 8:37:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LocationProducts] ON [dbo].[Products]
(
	[Location_BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ReceiptProducts]    Script Date: 11/25/2018 8:37:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ReceiptProducts] ON [dbo].[Products]
(
	[Receipt_ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonReceipt]    Script Date: 11/25/2018 8:37:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonReceipt] ON [dbo].[Receipts]
(
	[Employee_PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonReceipt1]    Script Date: 11/25/2018 8:37:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonReceipt1] ON [dbo].[Receipts]
(
	[Customer_PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_LocationPerson] FOREIGN KEY([Location_BuildingID])
REFERENCES [dbo].[Locations] ([BuildingID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_LocationPerson]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_LocationProducts] FOREIGN KEY([Location_BuildingID])
REFERENCES [dbo].[Locations] ([BuildingID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_LocationProducts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptProducts] FOREIGN KEY([Receipt_ReceiptID])
REFERENCES [dbo].[Receipts] ([ReceiptID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ReceiptProducts]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_PersonReceipt] FOREIGN KEY([Employee_PersonID])
REFERENCES [dbo].[People] ([PersonID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_PersonReceipt]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_PersonReceipt1] FOREIGN KEY([Customer_PersonID])
REFERENCES [dbo].[People] ([PersonID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_PersonReceipt1]
GO
USE [master]
GO
ALTER DATABASE [CandleStore] SET  READ_WRITE 
GO
