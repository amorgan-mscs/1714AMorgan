USE [master]
GO
/****** Object:  Database [Photography ]    Script Date: 10/9/2018 10:40:23 PM ******/
CREATE DATABASE [Photography ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Photography', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Photography .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Photography _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Photography _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Photography ] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Photography ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Photography ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Photography ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Photography ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Photography ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Photography ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Photography ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Photography ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Photography ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Photography ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Photography ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Photography ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Photography ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Photography ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Photography ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Photography ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Photography ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Photography ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Photography ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Photography ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Photography ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Photography ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Photography ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Photography ] SET RECOVERY FULL 
GO
ALTER DATABASE [Photography ] SET  MULTI_USER 
GO
ALTER DATABASE [Photography ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Photography ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Photography ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Photography ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Photography ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Photography ', N'ON'
GO
ALTER DATABASE [Photography ] SET QUERY_STORE = OFF
GO
USE [Photography ]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/9/2018 10:40:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 10/9/2018 10:40:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[Package Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/9/2018 10:40:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [nchar](10) NOT NULL,
	[Last Name] [nchar](10) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prints]    Script Date: 10/9/2018 10:40:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prints](
	[PrintID] [int] IDENTITY(1,1) NOT NULL,
	[Print Name] [nvarchar](50) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Prints] PRIMARY KEY CLUSTERED 
(
	[PrintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [Address], [City], [State], [Zip]) VALUES (1, N'5689 Penn Ave S', N'Richfield', N'MN', 55423)
INSERT [dbo].[Address] ([AddressID], [Address], [City], [State], [Zip]) VALUES (2, N'1452 Goldenrod Ln N', N'Maple Grove', N'MN', 55369)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Packages] ON 

INSERT [dbo].[Packages] ([PackageID], [Package Name], [Description], [Amount]) VALUES (1, N'Mini Session', N'30 MIN up to 5 adults. Digital Pictures', 60.0000)
INSERT [dbo].[Packages] ([PackageID], [Package Name], [Description], [Amount]) VALUES (2, N'Family Session', N'1HR up to 5 adults. Digital Pictures', 100.0000)
INSERT [dbo].[Packages] ([PackageID], [Package Name], [Description], [Amount]) VALUES (3, N'Large Group', N'1HR and 30 MINS up to 10 adults. Digital Pictures', 150.0000)
INSERT [dbo].[Packages] ([PackageID], [Package Name], [Description], [Amount]) VALUES (4, N'Wedding Partial', N'4HR coverage. Digital pictures, highlight book.', 500.0000)
INSERT [dbo].[Packages] ([PackageID], [Package Name], [Description], [Amount]) VALUES (10, N'Wedding Full', N'8HR coverage. Digital Pictures, highlight book', 1500.0000)
SET IDENTITY_INSERT [dbo].[Packages] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (1, N'Sarah     ', N'Morgan    ', 1234569632, N'Saramorgan@gmail.com')
INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (2, N'Patrick   ', N'Johnson   ', 1478523698, N'patrickjohnson@gmail.com')
INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (3, N'John      ', N'Johnson   ', 456785415, N'johnjohnson@gmail.com')
INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (5, N'Josh      ', N'Washington', 789456789, N'joshwashington@gmail.com')
INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (6, N'Jada      ', N'Martin    ', 789632147, N'jadamartin@gmail.com')
INSERT [dbo].[Person] ([PersonID], [First Name], [Last Name], [Phone], [Email]) VALUES (7, N'Abree     ', N'Stein     ', 789632214, N'abreestein@gmail.com')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Prints] ON 

INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (1, N'4x6', 0.1200)
INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (2, N'5x7', 0.7900)
INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (3, N'8x10', 3.1900)
INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (4, N'11x14', 6.3900)
INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (5, N'12x36', 13.5900)
INSERT [dbo].[Prints] ([PrintID], [Print Name], [Amount]) VALUES (6, N'16x20', 14.3900)
SET IDENTITY_INSERT [dbo].[Prints] OFF
USE [master]
GO
ALTER DATABASE [Photography ] SET  READ_WRITE 
GO
