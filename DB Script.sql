USE [master]
GO
/****** Object:  Database [Milele]    Script Date: 2/10/2023 2:39:56 AM ******/
CREATE DATABASE [Milele]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Milele', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Milele.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Milele_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Milele_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Milele] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Milele].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Milele] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Milele] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Milele] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Milele] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Milele] SET ARITHABORT OFF 
GO
ALTER DATABASE [Milele] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Milele] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Milele] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Milele] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Milele] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Milele] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Milele] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Milele] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Milele] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Milele] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Milele] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Milele] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Milele] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Milele] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Milele] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Milele] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Milele] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Milele] SET RECOVERY FULL 
GO
ALTER DATABASE [Milele] SET  MULTI_USER 
GO
ALTER DATABASE [Milele] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Milele] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Milele] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Milele] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Milele] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Milele', N'ON'
GO
ALTER DATABASE [Milele] SET QUERY_STORE = OFF
GO
USE [Milele]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Milele]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_id] [int] NULL,
	[Whole_Seller_id] [int] NULL,
	[Steering_Type_id] [int] NULL,
	[Model_id] [int] NULL,
	[SFX_id] [int] NULL,
	[Variant_id] [int] NULL,
	[Color_id] [int] NULL,
	[Quantity] [int] NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SFX]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SFX](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Steering_Type]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Steering_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/10/2023 2:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 2/10/2023 2:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Whole_Seller]    Script Date: 2/10/2023 2:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whole_Seller](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Color] ON 
GO
INSERT [dbo].[Color] ([id], [Name]) VALUES (1, N'Black')
GO
INSERT [dbo].[Color] ([id], [Name]) VALUES (2, N'White')
GO
INSERT [dbo].[Color] ([id], [Name]) VALUES (3, N'Blue')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 10, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (2, 1, 1, 1, 1, 1, 1, 1, 4, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (3, 1, 1, 1, 1, 1, 1, 1, 10, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (4, 1, 1, 1, 1, 1, 1, 1, 20, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (5, 1, 1, 1, 1, 1, 1, 1, 15, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (6, 1, 1, 1, 1, 1, 1, 1, 0, CAST(N'2023-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (7, 1, 1, 1, 1, 1, 1, 1, 5, CAST(N'2023-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (8, 1, 1, 1, 1, 1, 1, 1, 12, CAST(N'2023-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (9, 1, 1, 1, 1, 1, 1, 1, 15, CAST(N'2023-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (10, 1, 1, 1, 1, 1, 1, 1, 18, CAST(N'2023-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (11, 1, 1, 1, 1, 1, 1, 1, 20, CAST(N'2023-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (12, 1, 1, 1, 1, 1, 1, 1, 14, CAST(N'2023-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (13, 2, 2, 2, 1, 2, 2, 2, 6, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (14, 2, 2, 2, 1, 2, 2, 2, 5, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (15, 2, 2, 2, 1, 2, 2, 2, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (16, 2, 2, 2, 1, 2, 2, 2, 8, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (17, 2, 2, 2, 1, 2, 2, 2, 9, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (18, 2, 2, 2, 1, 2, 2, 2, 10, CAST(N'2023-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (19, 2, 2, 2, 1, 2, 2, 2, 12, CAST(N'2023-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (20, 2, 2, 2, 1, 2, 2, 2, 0, CAST(N'2023-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (21, 2, 2, 2, 1, 2, 2, 2, 16, CAST(N'2023-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (22, 2, 2, 2, 1, 2, 2, 2, 18, CAST(N'2023-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (23, 2, 2, 2, 1, 2, 2, 2, 10, CAST(N'2023-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (24, 2, 2, 2, 1, 2, 2, 2, 10, CAST(N'2023-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (25, 3, 3, 1, 2, 1, 1, 3, 6, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (26, 3, 3, 1, 2, 1, 1, 3, 7, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (27, 3, 3, 1, 2, 1, 1, 3, 8, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (28, 3, 3, 1, 2, 1, 1, 3, 2, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (29, 3, 3, 1, 2, 1, 1, 3, 9, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (30, 3, 3, 1, 2, 1, 1, 3, 0, CAST(N'2023-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (31, 3, 3, 1, 2, 1, 1, 3, 12, CAST(N'2023-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (32, 3, 3, 1, 2, 1, 1, 3, 0, CAST(N'2023-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (33, 3, 3, 1, 2, 1, 1, 3, 14, CAST(N'2023-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (34, 3, 3, 1, 2, 1, 1, 3, 10, CAST(N'2023-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (35, 3, 3, 1, 2, 1, 1, 3, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inventory] ([id], [Supplier_id], [Whole_Seller_id], [Steering_Type_id], [Model_id], [SFX_id], [Variant_id], [Color_id], [Quantity], [Date]) VALUES (36, 3, 3, 1, 2, 1, 1, 3, 12, CAST(N'2023-12-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 
GO
INSERT [dbo].[Model] ([id], [Name]) VALUES (1, N'Model One')
GO
INSERT [dbo].[Model] ([id], [Name]) VALUES (2, N'Model Two')
GO
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[SFX] ON 
GO
INSERT [dbo].[SFX] ([id], [Name]) VALUES (1, N'A1')
GO
INSERT [dbo].[SFX] ([id], [Name]) VALUES (2, N'B1')
GO
SET IDENTITY_INSERT [dbo].[SFX] OFF
GO
SET IDENTITY_INSERT [dbo].[Steering_Type] ON 
GO
INSERT [dbo].[Steering_Type] ([id], [Type]) VALUES (1, N'Left Hand Driven (LHD)')
GO
INSERT [dbo].[Steering_Type] ([id], [Type]) VALUES (2, N'Right Hand Driven (RHD)')
GO
SET IDENTITY_INSERT [dbo].[Steering_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'Supplier One')
GO
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'Supplier Two')
GO
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (3, N'Supplier Three')
GO
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Variant] ON 
GO
INSERT [dbo].[Variant] ([id], [Name]) VALUES (1, N'SomeCar_1')
GO
INSERT [dbo].[Variant] ([id], [Name]) VALUES (2, N'SomeCar_2')
GO
SET IDENTITY_INSERT [dbo].[Variant] OFF
GO
SET IDENTITY_INSERT [dbo].[Whole_Seller] ON 
GO
INSERT [dbo].[Whole_Seller] ([Id], [Name]) VALUES (1, N'Whole Seller One')
GO
INSERT [dbo].[Whole_Seller] ([Id], [Name]) VALUES (2, N'Whole Seller Two')
GO
INSERT [dbo].[Whole_Seller] ([Id], [Name]) VALUES (3, N'Whole Seller Three')
GO
SET IDENTITY_INSERT [dbo].[Whole_Seller] OFF
GO
USE [master]
GO
ALTER DATABASE [Milele] SET  READ_WRITE 
GO
