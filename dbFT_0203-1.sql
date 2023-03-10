USE [master]
GO
/****** Object:  Database [dbFT]    Script Date: 2023/2/3 下午 03:33:56 ******/
CREATE DATABASE [dbFT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbFT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbFT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbFT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFT] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbFT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFT] SET RECOVERY FULL 
GO
ALTER DATABASE [dbFT] SET  MULTI_USER 
GO
ALTER DATABASE [dbFT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbFT', N'ON'
GO
ALTER DATABASE [dbFT] SET QUERY_STORE = OFF
GO
USE [dbFT]
GO
/****** Object:  Table [dbo].[ActDetail]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActDetail](
	[活動ID] [int] IDENTITY(1,1) NOT NULL,
	[營區ID] [int] NULL,
	[活動方式] [nvarchar](30) NULL,
	[活動種類] [nvarchar](30) NULL,
	[活動名稱] [nvarchar](200) NULL,
	[開始日期] [datetime] NULL,
	[結束日期] [datetime] NULL,
	[預計人數] [int] NULL,
	[活動介紹] [nvarchar](500) NULL,
	[門票價格] [int] NULL,
	[活動圖片] [nvarchar](50) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tLocalCampaign] PRIMARY KEY CLUSTERED 
(
	[活動ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camp]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camp](
	[營區ID] [int] IDENTITY(1,1) NOT NULL,
	[營區名稱] [nvarchar](20) NULL,
	[營區地址] [nvarchar](80) NULL,
	[地區] [nvarchar](10) NULL,
	[縣市] [nvarchar](10) NULL,
	[營區介紹] [nvarchar](300) NULL,
	[容納人數] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tCampSite] PRIMARY KEY CLUSTERED 
(
	[營區ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampDetail]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampDetail](
	[營區細項ID] [int] IDENTITY(1,1) NOT NULL,
	[營區ID] [int] NULL,
	[活動ID] [int] NULL,
	[露營形式ID] [int] NULL,
	[詳細內容] [nvarchar](200) NULL,
	[圖片] [nvarchar](200) NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tCarPark] PRIMARY KEY CLUSTERED 
(
	[營區細項ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampStyle]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampStyle](
	[露營形式ID] [int] IDENTITY(1,1) NOT NULL,
	[項目內容] [nvarchar](50) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_項目] PRIMARY KEY CLUSTERED 
(
	[露營形式ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInfo](
	[會員ID] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [nvarchar](50) NULL,
	[性別] [bit] NULL,
	[出生日期] [date] NULL,
	[電話號碼] [nvarchar](50) NULL,
	[連絡信箱] [nvarchar](50) NULL,
	[會員帳號] [nvarchar](50) NULL,
	[會員密碼] [nvarchar](50) NULL,
	[照片] [nvarchar](500) NULL,
	[權限] [bit] NULL,
	[建立時間] [datetime] NULL,
	[修改時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
 CONSTRAINT [PK_會員資料庫] PRIMARY KEY CLUSTERED 
(
	[會員ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentDetail]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentDetail](
	[租賃商店ID] [int] IDENTITY(1,1) NOT NULL,
	[產品名稱] [nvarchar](100) NULL,
	[產品說明] [nvarchar](300) NULL,
	[庫存] [int] NULL,
	[圖片] [nvarchar](500) NULL,
	[數量] [int] NULL,
	[單日租金] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_租賃商店] PRIMARY KEY CLUSTERED 
(
	[租賃商店ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelfFood]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfFood](
	[自選飲食ID] [int] IDENTITY(1,1) NOT NULL,
	[圖片] [nvarchar](50) NULL,
	[需求人數] [int] NULL,
	[需求份數] [int] NULL,
	[商品名稱] [nvarchar](50) NULL,
	[商品內容] [nvarchar](300) NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_自選飲食編號ID] PRIMARY KEY CLUSTERED 
(
	[自選飲食ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelfOrder]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfOrder](
	[自選訂單ID] [int] IDENTITY(1,1) NOT NULL,
	[會員ID] [int] NULL,
	[自選訂單編號] [nvarchar](50) NULL,
	[入住時間] [datetime] NULL,
	[退住時間] [datetime] NULL,
	[露營天數] [int] NULL,
	[預計人數] [int] NULL,
	[營區細項ID] [int] NULL,
	[自選飲食ID] [int] NULL,
	[租賃商店ID] [int] NULL,
	[租借總價] [int] NULL,
	[自選訂單總價] [int] NULL,
	[評論] [nvarchar](500) NULL,
	[評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_自選訂單編號ID] PRIMARY KEY CLUSTERED 
(
	[自選訂單ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetFood]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetFood](
	[餐廳ID] [int] IDENTITY(1,1) NOT NULL,
	[餐廳名] [nvarchar](50) NULL,
	[餐廳電話] [nvarchar](50) NULL,
	[地址] [nvarchar](100) NULL,
	[餐點細項] [nvarchar](300) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set餐廳] PRIMARY KEY CLUSTERED 
(
	[餐廳ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOrder]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOrder](
	[套裝訂單ID] [int] IDENTITY(1,1) NOT NULL,
	[套裝行程ID] [int] NULL,
	[會員ID] [int] NULL,
	[套裝訂單編號] [nvarchar](50) NULL,
	[入住時間] [datetime] NULL,
	[退住時間] [datetime] NULL,
	[預計人數] [int] NULL,
	[合計總價] [int] NULL,
	[評論] [nvarchar](500) NULL,
	[評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set訂單] PRIMARY KEY CLUSTERED 
(
	[套裝訂單ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOrderDetail]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOrderDetail](
	[套裝行程ID] [int] IDENTITY(1,1) NOT NULL,
	[營地ID] [int] NULL,
	[營區細項ID] [int] NULL,
	[餐廳ID] [int] NULL,
	[套裝方案] [nvarchar](300) NULL,
	[套裝細項] [nvarchar](300) NULL,
	[套裝行程價格] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set行程] PRIMARY KEY CLUSTERED 
(
	[套裝行程ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopDetail]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopDetail](
	[商品細項ID] [int] IDENTITY(1,1) NOT NULL,
	[品牌名稱] [nvarchar](100) NULL,
	[產品名稱] [nvarchar](100) NULL,
	[產品說明] [nvarchar](300) NULL,
	[產品圖片] [nvarchar](500) NULL,
	[庫存] [int] NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_購物商店] PRIMARY KEY CLUSTERED 
(
	[商品細項ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopOrder]    Script Date: 2023/2/3 下午 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopOrder](
	[商店ID] [int] IDENTITY(1,1) NOT NULL,
	[商品細項ID] [int] NULL,
	[會員ID] [int] NULL,
	[商店訂單編號] [nvarchar](50) NULL,
	[成立時間] [datetime] NULL,
	[細項] [nvarchar](1000) NULL,
	[總價] [int] NULL,
	[購物評價] [nvarchar](200) NULL,
	[購物評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_購物訂單] PRIMARY KEY CLUSTERED 
(
	[商店ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActDetail] ON 

INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 4, N'行程', N'溫泉', N'宜蘭太平山鳩之澤溫泉', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-05T00:00:00.000' AS DateTime), 10, N'走訪如仙境般的太平山國家森林', 1500, N'35f3988f-aa25-4035-aac6-d1706cc53f5f.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 5, N'團康', N'手作', N'多肉花式編織掛繩', CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 5, N'運用繩編的技巧組合創造不同織紋，搭配簡單造型的陶盆與垂墜式的多肉植物', 500, N'e3284c47-6bb8-4ff8-a00f-671c8a906d26.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 6, N'行程', N'登山', N'合歡山日出團', CAST(N'2022-12-25T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 20, N'凌晨出發的日出團可沿途觀賞繁星點點與日出微光', 1200, N'db41c08a-f542-4609-84df-033fc3bf5e6b.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 7, N'景點', N'賞螢', N'園區夜間生態導賞', CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime), 50, N'螢火蟲季大自然的星光大道', 300, N'a9f230ed-3d53-4936-b027-c74b38d3bbba.jpg', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Camp] ON 

INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'福山緣營地', N'新北市烏來區', N'北區', N'新北市', N'小包區 有雨棚 有遊戲設施 近溪流 螢火蟲季', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'長青谷大自然園區', N'新北新店區', N'北區', N'新北市', N'新北沁涼溪流旁 團露同樂與大自然親密接觸', 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'玉峰遇見嵨繞', N'新竹尖石', N'北區', N'新竹縣', N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'一畝田', N'苗栗南庄', N'北區', N'苗栗縣', N'南庄一畝田，以豪華露營模式，規劃完善設備，讓提供渡假的好選擇', 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'日月潭 九蛙秘境露營王國', N'南投魚池 ', N'中區', N'南投縣', N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', 120, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Camp] OFF
GO
SET IDENTITY_INSERT [dbo].[CampDetail] ON 

INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 4, 4, 1, N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', N'c647ec31-7678-4783-b6fb-bfc2573509b1.jpg', 2500, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 5, 5, 2, N'規劃完善設備，讓提供渡假的好選擇', N'9ee70db7-cfa8-4327-9d04-54e64c4b554b.jpg', 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 6, 6, 3, N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', N'8c2b6e84-53f7-4665-b583-b16e72cb1752.jpg', 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 7, 7, 4, N'茶園與蘭陽溪相伴，飽覽360°壯麗山景，入夜有蘭陽平原百萬夜景登場', N'639577fd-d440-4dc7-8713-7639ca331c82.jpg', 1200, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CampDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CampStyle] ON 

INSERT [dbo].[CampStyle] ([露營形式ID], [項目內容], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'露營車', NULL, NULL, NULL, NULL)
INSERT [dbo].[CampStyle] ([露營形式ID], [項目內容], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'懶人露營(有床)', NULL, NULL, NULL, NULL)
INSERT [dbo].[CampStyle] ([露營形式ID], [項目內容], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'懶人露營(無床)', NULL, NULL, NULL, NULL)
INSERT [dbo].[CampStyle] ([露營形式ID], [項目內容], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'自搭帳棚', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CampStyle] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberInfo] ON 

INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (2, N'Allen', 1, CAST(N'1995-02-15' AS Date), N'0983756489', N'allen@gmail.com', N'123', N'123', N'31615c02-d9f2-42bb-965f-7c468b40d7e2.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (4, N'Eric', 1, CAST(N'1992-12-12' AS Date), N'0912345678', N'eric@yahoo.com.tw', N'123', N'123', N'4fa2f5bd-ccdf-4711-874e-9ce96b9f1b3c.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (5, N'Joy', 0, CAST(N'1989-01-31' AS Date), N'0985444562', N'joy@gmail.com', N'123', N'123', N'76b3fe04-4799-4b10-b8a9-1a32ae1ab327.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (6, N'Tina', 0, CAST(N'1976-11-05' AS Date), N'0963541223', N'tina@gmail.com', N'123', N'123', N'8277dca2-bf03-4f88-bb8d-ad456e7aaa90.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (7, N'Paul', 1, CAST(N'1991-10-10' AS Date), N'0976444123', N'paul@gmail.com', N'123', N'123', N'2bda9bb3-df05-4eaf-a26d-fb52ac525f13.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (8, N'Irene', 0, CAST(N'1990-05-25' AS Date), N'0912333000', N'irene@yahoo.com.tw', N'123', N'123', N'5be34769-a6f6-45a8-9c7d-21ffbe3279d2.jpg', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MemberInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[RentDetail] ON 

INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'鈦金屬單層杯', N'單層杯300mlx2', 50, NULL, 5, 100, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'露營天幕', N'280 X 300 cm', 100, NULL, 2, 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'方型工具箱', N'鋼1.6 kg', 200, NULL, 1, 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'雙人自立小帳', N'長 232 x 寬 230 x 高 128 cm', 200, NULL, 2, 500, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RentDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[SelfFood] ON 

INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'2e86acb9-7359-4ac0-96a4-48b766782811.jpg', 20, 4, N'日本和牛組合', N'霜降黑毛和牛、美國安格斯牛排', 5500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'0f3fe1a1-c52c-42d5-829e-721f1f525976.jpg', 8, 2, N'豪華海鮮組合', N'干貝、魷魚、蛤蠣、帝王蟹', 3800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'2570a011-2800-428d-a149-879ba524f332.jpg', 10, 3, N'經典嫩雞咖哩組合包', N'雞肉、馬鈴薯、紅蘿蔔', 3000, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SelfFood] OFF
GO
SET IDENTITY_INSERT [dbo].[SelfOrder] ON 

INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 2, N'Self001', CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 2, 10, 3, 2, 1, 100, 25000, N'讓人感到非常放鬆自然', 95, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 4, N'Self002', CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-20T00:00:00.000' AS DateTime), 7, 10, 4, 4, 2, 250, 55000, N'舒服，大自然，餐點也還行，服務到位', 89, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SelfOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[SetFood] ON 

INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'蟬說：夕陽漫漫園區', N'04-37022557', N'台中市清水區美堤街8號', N'園區Buffet 下午茶：14:30-16:30 晚餐時間：18:00-19:30 (最晚入場18:30) 早餐時間：08:00-09:30', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetFood] OFF
GO
SET IDENTITY_INSERT [dbo].[SetOrder] ON 

INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (16, 4, 2, N'set001', CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), 8, 2500, N'景色悠美讓身心放鬆', 90, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (17, 3, 5, N'set002', CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), 10, 80000, N'美好的回憶，值得', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[SetOrderDetail] ON 

INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 4, 5, 1, N'豪華露營體驗一泊二食', N'全台獨家樓中樓星空帳篷，一次坐擁絕美星空及山景', 5800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 5, 3, 1, N'輕奢露營濕地探險', N'免裝備、免搭帳，輕鬆體驗露營的樂趣', 6500, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopDetail] ON 

INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'TheCatFace', N'露營車', N'出門在外好夥伴', N'bae3d49b-b5ca-44f1-b05d-78fce1c6be60.jpg', 99, 100000, N'123', CAST(N'2023-02-01T21:10:00.000' AS DateTime), N'123123', CAST(N'2023-02-02T22:25:00.000' AS DateTime))
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'sigma', N'博派露營車', N'會變機器人', N'896a424e-299d-4de8-8b55-1b58c30f1c8c.jpg', 1, 9999999, N'321', CAST(N'2023-01-29T21:13:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'12', N'123', N'123', N'c03e85bc-0d58-41df-9818-7c84a8394e93.jpg', 99, 88, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShopDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopOrder] ON 

INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 4, 2, N'shop001', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'露營帳篷軍綠', 5000, N'品質很棒!', 90, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 4, 4, N'shop002', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'琺瑯碗600ml2入', 720, N'質感優質，持續回購', 88, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 5, 5, N'shop003', CAST(N'2023-01-31T00:00:00.000' AS DateTime), N'露營睡墊', 4700, N'像睡在家裡一樣舒適', 95, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShopOrder] OFF
GO
ALTER TABLE [dbo].[ActDetail]  WITH CHECK ADD  CONSTRAINT [FK_tLocalCampaign_tCampSite] FOREIGN KEY([營區ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[ActDetail] CHECK CONSTRAINT [FK_tLocalCampaign_tCampSite]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_tCampSite] FOREIGN KEY([營區ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_tCampSite]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_tLocalCampaign] FOREIGN KEY([活動ID])
REFERENCES [dbo].[ActDetail] ([活動ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_tLocalCampaign]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_項目] FOREIGN KEY([露營形式ID])
REFERENCES [dbo].[CampStyle] ([露營形式ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_項目]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_tCampDetale] FOREIGN KEY([營區細項ID])
REFERENCES [dbo].[CampDetail] ([營區細項ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_tCampDetale]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_租賃商店] FOREIGN KEY([租賃商店ID])
REFERENCES [dbo].[RentDetail] ([租賃商店ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_租賃商店]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_飲食] FOREIGN KEY([自選飲食ID])
REFERENCES [dbo].[SelfFood] ([自選飲食ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_飲食]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_會員資料庫]
GO
ALTER TABLE [dbo].[SetOrder]  WITH CHECK ADD  CONSTRAINT [FK_set訂單_set行程] FOREIGN KEY([套裝行程ID])
REFERENCES [dbo].[SetOrderDetail] ([套裝行程ID])
GO
ALTER TABLE [dbo].[SetOrder] CHECK CONSTRAINT [FK_set訂單_set行程]
GO
ALTER TABLE [dbo].[SetOrder]  WITH CHECK ADD  CONSTRAINT [FK_set訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[SetOrder] CHECK CONSTRAINT [FK_set訂單_會員資料庫]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_set餐廳] FOREIGN KEY([餐廳ID])
REFERENCES [dbo].[SetFood] ([餐廳ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_set餐廳]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_tCampDetale] FOREIGN KEY([營區細項ID])
REFERENCES [dbo].[CampDetail] ([營區細項ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_tCampDetale]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_tCampSite] FOREIGN KEY([營地ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_tCampSite]
GO
ALTER TABLE [dbo].[ShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_購物訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[ShopOrder] CHECK CONSTRAINT [FK_購物訂單_會員資料庫]
GO
ALTER TABLE [dbo].[ShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_購物訂單_購物商店] FOREIGN KEY([商品細項ID])
REFERENCES [dbo].[ShopDetail] ([商品細項ID])
GO
ALTER TABLE [dbo].[ShopOrder] CHECK CONSTRAINT [FK_購物訂單_購物商店]
GO
USE [master]
GO
ALTER DATABASE [dbFT] SET  READ_WRITE 
GO
