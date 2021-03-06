USE [master]
GO
/****** Object:  Database [ShoppingDatabase]    Script Date: 10/30/2021 8:04:29 PM ******/
CREATE DATABASE [ShoppingDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShoppingDatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShoppingDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShoppingDatabase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[UserID] [nvarchar](50) NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[OrderID] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductID] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductImage] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/30/2021 8:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (N'cu', N'Cu')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (N'rau', N'Rau')
GO
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (189, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (1881, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (3827, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 30)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (4745, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 30)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (5921, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (6282, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (6591, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (8059, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (12060, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (15384, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 54)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (15921, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 0)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (17763, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 539)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (18054, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (19482, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 60)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (19592, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 334)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (22507, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (23501, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 10)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (24798, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 24)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (26287, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (26721, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (28271, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 434)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (30137, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (30255, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 5)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (32629, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 37)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (33984, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 10)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (35541, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 20)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (35691, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 573)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (36503, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (39817, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 25)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (39976, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 545)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (43963, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user10', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (46037, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 0)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (46450, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 462)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (49776, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user10', 54)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (49830, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (50384, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 0)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (52780, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (53903, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 0)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (59230, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 24)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (60311, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (60498, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 754)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (60826, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user10', 15)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (63998, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (67238, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 45)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (69091, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 0)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (71313, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 25)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (72454, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user10', 40)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (76967, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (79023, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (85457, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 45)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (87356, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (90610, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 24)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (92964, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user10', 27)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (98743, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'user2', 14)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (99014, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'user2', 525)
INSERT [dbo].[tblOrder] ([OrderID], [Date], [UserID], [Total]) VALUES (99241, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'user2', 15)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (19, N'1', 50384, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (20, N'10', 50384, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (21, N'5', 19482, 35, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (22, N'7', 19482, 25, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (23, N'2', 92964, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (24, N'3', 92964, 5, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (25, N'6', 92964, 12, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (26, N'2', 49776, 10, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (27, N'3', 49776, 5, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (28, N'6', 49776, 12, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (29, N'4', 4745, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (30, N'8', 4745, 20, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (31, N'2', 90610, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (32, N'10', 90610, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (33, N'2', 59230, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (34, N'10', 59230, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (35, N'1', 99241, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (36, N'10', 30137, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (37, N'10', 52780, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (38, N'2', 67238, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (39, N'5', 67238, 35, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (40, N'10', 8059, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (41, N'1', 15384, 15, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (42, N'2', 15384, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (43, N'10', 15384, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (44, N'2', 24798, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (45, N'10', 24798, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (46, N'1', 60826, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (47, N'10', 43963, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (48, N'1', 99014, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (49, N'1', 18054, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (50, N'1', 79023, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (51, N'1', 87356, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (52, N'1', 76967, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (53, N'1', 26721, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (54, N'1', 22507, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (55, N'10', 28271, 14, 31)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (56, N'1', 17763, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (57, N'10', 17763, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (58, N'2', 19592, 10, 32)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (59, N'10', 19592, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (60, N'10', 46450, 14, 33)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (61, N'1', 35691, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (62, N'2', 35691, 10, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (63, N'10', 35691, 14, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (64, N'1', 39976, 15, 35)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (65, N'2', 39976, 10, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (66, N'10', 63998, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (67, N'10', 98743, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (68, N'10', 26287, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (69, N'10', 6591, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (70, N'10', 36503, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (71, N'2', 33984, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (72, N'2', 23501, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (73, N'1', 39817, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (74, N'4', 39817, 10, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (75, N'7', 85457, 25, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (76, N'8', 85457, 20, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (77, N'6', 32629, 12, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (78, N'7', 32629, 25, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (79, N'8', 35541, 20, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (80, N'10', 60311, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (81, N'9', 6282, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (82, N'7', 71313, 25, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (83, N'9', 189, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (84, N'1', 3827, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (85, N'9', 3827, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (86, N'7', 72454, 25, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (87, N'9', 72454, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (88, N'8', 60498, 20, 37)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (89, N'10', 60498, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (90, N'10', 5921, 14, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (91, N'1', 49830, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (92, N'1', 1881, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (93, N'1', 12060, 15, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [ProductID], [OrderID], [Price], [Quantity]) VALUES (94, N'3', 30255, 5, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'1', N'Cai Thia', N'image\rau_cai_thia.jpg', 30, 15, N'rau')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'10', N'Khoai Tu', N'image\khoai_tu.jpg', 25, 14, N'cu')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'2', N'Rau Day', N'image\rau_day.jpg', 29, 10, N'rau')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'3', N'Rau Muong', N'image\rau_muong.jpg', 36, 5, N'rau')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'4', N'Rau Salad', N'image\salad.jpg', 38, 10, N'rau')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'5', N'Sup Lo', N'image\sup_lo.jpg', 38, 35, N'rau')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'6', N'Ca Rot', N'image\carot.jpg', 36, 12, N'cu')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'7', N'Cu Den', N'image\cu_den.jpg', 35, 25, N'cu')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'8', N'Khoai Mo', N'image\khoai_mo.jpg', 30, 20, N'cu')
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductImage], [Quantity], [Price], [CategoryID]) VALUES (N'9', N'Khoai Tay', N'image\khoai_tay.jpg', 36, 15, N'cu')
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (N'US', N'user')
GO
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Address], [Phone], [RoleID]) VALUES (N'admin', N'administration ne', N'123', N'123fpt', N'0909', N'AD')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Address], [Phone], [RoleID]) VALUES (N'user1', N'JohnnyMC', N'234', N'234fpt', N'0808', N'AD')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Address], [Phone], [RoleID]) VALUES (N'user10', N'user ne', N'aaaaa', N'456fpt', N'0907', N'US')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Address], [Phone], [RoleID]) VALUES (N'user2', N'Trinh Tam', N'1', N'345fpt', N'0707', N'US')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Address], [Phone], [RoleID]) VALUES (N'user5', N'Tran Khac Dai', N'123', N'123fpt rrrrrr', N'0908731453', N'US')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_Category]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRole]
GO
USE [master]
GO
ALTER DATABASE [ShoppingDatabase] SET  READ_WRITE 
GO
