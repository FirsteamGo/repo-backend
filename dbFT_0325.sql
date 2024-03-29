USE [master]
GO
/****** Object:  Database [dbFT]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[ActDetail]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[Camp]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[CampDetail]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[CampStyle]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[RentDetail]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[SelfFood]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[SelfOrder]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[SetFood]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[SetOrder]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[SetOrderDetail]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[ShopDetail]    Script Date: 2023/3/25 下午 12:30:48 ******/
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
/****** Object:  Table [dbo].[ShopOrder]    Script Date: 2023/3/25 下午 12:30:48 ******/
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

INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 9, N'景點', N'溫泉', N'宜蘭太平山鳩之澤溫泉', NULL, NULL, 10, N'走訪如仙境般的太平山國家森林', 200, N'94d7182a-15fb-482d-b5c8-f2689af256de.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 1, N'運動', N'攀岩', N'新北龍洞攀岩體驗', NULL, NULL, 10, N'熱血攀岩的同時，也能享受東北角海岸美景，登頂後，龍洞浩瀚的海岸線就在腳下', 300, N'180e801c-c929-475b-905e-51d28cc89e6f.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 3, N'文化', N'工作坊', N'多肉花式編織掛繩', NULL, NULL, 5, N'運用繩編的技巧組合創造不同織紋，搭配簡單造型的陶盆與垂墜式的多肉植物', 400, N'c66fdf6c-7f71-4cf3-80be-18957378a592.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 5, N'運動', N'健行', N'合歡山日出團', NULL, NULL, 20, N'凌晨出發的日出團可沿途觀賞繁星點點與日出微光', 500, N'c70f5c69-bccb-4f84-bfd5-95de3c24dee6.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 17, N'景點', N'賞螢', N'園區夜間生態導賞', NULL, NULL, 50, N'螢火蟲季大自然的星光大道', 600, N'61890a1b-e947-4905-93f6-c9705cd761be.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 15, N'運動', N'溯溪', N'桑樹溪秘境溯溪體驗', NULL, NULL, 10, N'領略台東桑樹溪河岸風光，深入瀑布深潭，零經驗也沒問題', 700, N'e1d596f2-96f0-43b5-aa4a-0e6fc3094106.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 8, N'水上', N'獨木舟', N'小琉球獨木舟', NULL, NULL, 5, N'切換不同視角，從海上欣賞小琉球的熱帶島嶼景緻', 800, N'a69b2566-b496-4d1a-a69d-b30ea9097ec4.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 7, N'水上', N'釣魚', N'夜間捕撈魚體驗', NULL, NULL, 20, N'探索豐富海洋生態、絕美海岸景觀與住民風情', 900, N'8136e70c-b61d-43cd-951d-eb868fa295fb.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 9, N'水上', N'潛水', N'PADI OW開放水域潛水員證照課程', NULL, NULL, 50, N'水下實作教練與學生比例1:1或1:2，享受完善的高品質教學', 1000, N'05139b3c-aee0-4482-be52-1aa8c0ac5c1f.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, 10, N'觀光', N'遊船觀光', N'賞鯨華棋268遊艇賞鯨導覽體驗', NULL, NULL, 20, N'觀賞可愛野生鯨豚悠游海上，捕捉珍貴畫面', 1100, N'3fe764ac-0443-42b2-a814-7af233fa6311.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, 14, N'景點', N'博物館', N'典藏博物館', NULL, NULL, 60, N'博物館典藏西洋藝術品為主，展出藝術、樂器、兵器與自然史四大領域，必遊景點！', 1200, N'fa6a51c3-90c2-47b6-960c-b3d508a7d73d.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (12, 7, N'景點', N'動物園', N'水豚君農場', NULL, NULL, 100, N'呆萌水豚君泡澡、兔豚、袋鼠、草泥馬，療癒登場！', 1300, N'b37e7381-7e90-4f34-863d-1c3ef7ca6fd7.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (13, 6, N'景點', N'纜車', N'日月潭纜車', NULL, NULL, 150, N'從纜車上享受360度零死角的山嵐景致，俯瞰日月潭全景', 1400, N'2649f32f-97c5-4a55-83f0-bf1fe462edc7.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (14, 9, N'景點', N'遊樂園', N'OUTLET雪樂地', NULL, NULL, 50, N'台灣第一家室內恆溫雪場OUTLET SNOWTOWN 雪樂地，免出國就能自在玩雪', 1500, N'38c175f1-5d46-45fc-b50b-9b885248d016.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (15, 4, N'活動', N'嘉年華', N'漫度情人白色春艷電音派對', NULL, NULL, 30, N'三方聯合舉辦的音樂派對，第二次舉辦了，會有更精彩的內容、卡司更強更辣的DJ！ 讓您享受音樂饗宴之餘', 1600, N'6e4b4cb5-6294-4756-9e5a-3e52a7b22455.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (16, 3, N'活動', N'展演', N'動漫怪物學', NULL, NULL, 80, N'海影城事—入圍法國新影像藝術節 XR 競賽的蒸汽龐克VR動畫作品', 1700, N'fe8dece8-d3f5-4c5a-8d9d-802a46d2be07.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (17, 2, N'文化', N'料理課程', N'山村烹飪教室', NULL, NULL, 70, N'針對個人進度做專業指導，做出美味的料理', 1800, N'19652d8f-464d-4937-a5c7-677a9f1afae4.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (18, 11, N'文化', N'攝影', N'富田農場攝影體驗', NULL, NULL, 30, N'桃園富田花園農場以北海道富田農場為設計藍圖，打造充滿歐風氣息的秘境花園', 395, N'25855109-b29a-4770-862e-47a4bfc35b3c.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (19, 12, N'活動', N'小火車體驗', N'紙箱王創意園區小火車體驗', NULL, NULL, 10, N'以紙為主題的親子觀光創意園區，將紙的創意無限延伸，打破你的想像，打造全世界的知名景點。出國不一定要搭飛機 ，來到紙箱王就可以搭乘紙箱小火車環遊世界，探索這變化萬千的異想紙的王國。', 200, N'32a7aa97-026a-43fe-a91c-6b427680080c.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (20, 13, N'活動', N'城堡展演', N'佐登妮絲城堡', NULL, NULL, 10, N'參觀台灣最具亮點的歐風美學城堡，全台最高 50 公尺巴洛克穹頂', 300, N'beba781e-fe0d-44d6-bcad-537324dd332b.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (21, 15, N'水上', N'SUP立槳', N'東清灣SUP立槳體驗', NULL, NULL, 15, N'專業教練帶領教學，輕鬆上手SUP，站在板上眺望海洋', 1200, N'ccaf7d3a-2a55-41d3-87b0-2db3293e0a73.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (22, 16, N'觀光', N'觀光車導覽', N'太魯閣景觀步道一日遊', NULL, NULL, 20, N'前往因「百燕鳴谷」的景觀而得「燕子口」美名，欣賞周邊壯麗的太魯閣峽谷峭壁', 1100, N'034be348-c162-4c28-abc0-f22c5b8d5271.jpg', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Camp] ON 

INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'福山緣營地', N'新北烏來區', N'北部', N'新北市', N'充滿翠綠草地及蟲鳴鳥叫聲，有著森林系之稱的露營地，林蔭圍繞滿滿大自然氣息以及大山泉戲水池', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'長青谷大自然園區', N'新北新店區', N'北部', N'新北市', N'新北沁涼溪流旁 團露同樂與大自然親密接觸', 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'玉峰遇見嵨繞', N'新竹尖石', N'北部', N'新竹縣', N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'一畝田', N'苗栗南庄', N'中部', N'苗栗縣', N'南庄一畝田，以豪華露營模式，規劃完善設備，讓提供渡假的好選擇', 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'日月潭 九蛙秘境露營王國', N'南投魚池', N'中部', N'南投縣', N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'峇嵐杉丘', N'南投魚池', N'中部', N'南投縣', N'峇嵐杉丘帳篷以希臘12主神為題的星空帳與經典車款為題的11台馬車', 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'斷橋部落露營地', N'苗栗三義', N'中部', N'苗栗縣', N'提供鐘型帳、春日帳等多種帳篷選擇，內部空間寬敞舒適，外型優美適合拍照', 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'貓鼻頭露營莊園', N'高雄岡山', N'南部', N'高雄市', N'Ocean Glamping位於臺灣左腳最南端貓鼻頭公園旁，占地總面積約4公頃', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'幸福城景觀露營區', N'宜蘭大同', N'東部', N'宜蘭縣', N'風光明媚的宜蘭縣大同鄉，絕佳景觀無死角，令人心曠神怡', 200, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, N'遠山望月溫泉風呂露營區', N'高雄六龜區', N'南部', N'高雄市', N'遠山望月溫泉風呂露營區位於高雄六龜寶來花賞公園', 260, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, N'朋趣露營車體驗', N'桃園龍潭區', N'北部', N'桃園市', N'朋趣打造多款豪華露營車，內部包含獨立衛浴空間、舒適床寢、智能設備及專屬南方松木棧板，以活潑設計與自然特色融合妝點空間', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (12, N'森渼原ALIVE豪華露營', N'台中外埔區', N'中部', N'台中市', N'結合在地的人文及自然生態，愜意的高質享受、舒適寬敞的野趣露營環境', 90, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (13, N'秋之林自然生態露營區', N'嘉義竹崎鄉', N'南部', N'嘉義縣', N'嘉義竹崎的秋之林自然生態露營區可見璀璨星空、綿延雲海以及壯麗城市夜景', 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (14, N'漫度漁光露營樂', N'台南安平區', N'南部', N'台南市', N'寵物友善，適合毛小孩一同露營，園區有兒童遊戲池、戲水池，是親子露營的最佳首選！ ', 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (15, N'美山晴小木屋露營地', N'台東成功鎮', N'東部', N'台東縣', N'廣闊的台東藍就在眼前，擁有 180 度絕佳無敵海景', 100, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (16, N'花蓮七星潭踏浪星辰露營區', N'花蓮新城鄉', N'東部', N'花蓮縣', N'七星潭人氣露營區，只需簡單行李，免搭篷輕鬆入住', 200, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (17, N'享靜靜露營區', N'新北三峽區', N'北部', N'新北市', N'30分鐘就可以逃離城市喧囂，盡情享受野外露營樂趣', 50, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Camp] OFF
GO
SET IDENTITY_INSERT [dbo].[CampDetail] ON 

INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 5, 4, 2, N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', N'7303f8ff-d511-4dae-8388-428865756040.jpg', 2500, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 1, 2, 2, N'充滿翠綠草地及蟲鳴鳥叫聲，有著森林系之稱的露營地，林蔭圍繞滿滿大自然氣息以及大山泉戲水池', N'444a7872-3c8b-4eda-8cd6-0e1049667f2c.jpg', 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 3, 3, 4, N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', N'a0b558d1-de60-4460-a754-e9168953cb83.jpg', 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 9, 9, 1, N'茶園與蘭陽溪相伴，飽覽360°壯麗山景，入夜有蘭陽平原百萬夜景登場', N'21051172-e097-4c13-b64b-35a1ea54887f.jpg', 1200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 6, 13, 3, N'每一間帳篷與馬車帳除了特製的專屬鑰匙木牌， 不同的房間有他獨特的主題元素與室內裝飾來襯托所代表的意涵。 希望帶給每頂帳篷、馬車的村民都有不同的住宿體驗。 不同的帳篷主題、不同的氛圍，帶給你與眾不同的露營體驗。', N'8237da75-f5fe-47d7-b965-3972cbf8e408.jpg', 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 7, 15, 2, N'享受三義這座浪漫的山城，從營區徒步10分鐘就能到龍騰斷橋，慢步調遊走歷史古蹟、走訪步道享受山林秘境，再騎著鐵道自行車，欣賞沿途的壯麗美景，感舊時代的風情，再踏上老街品嚐道地鮮美的客家料理，附近還有許多在地的文化與景點等著你，讓你的旅程增添許多驚喜', N'6af5e157-20d0-43a8-a9e2-91246dd375cb.jpg', 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 8, 7, 3, N'O''Glamping 推出適合懶人的頂級露營，豪華露營設備全都幫你準備好，免裝備就能入住！擁有台灣最南邊的風情酒吧，也是台灣南邊最佳觀賞銀河星星地點，可在園區內私人五星級 Villa 露營營地享受海角第一排百萬美景；於黑潮市-綜合服務中心品嚐異國風情古巴美食饗宴，可看海、可觀星、可享受大自然環境與美食，輕輕鬆鬆就能感受到自然生活的浪漫', N'58287fd8-c617-4fff-8630-41c63013da64.jpg', 2400, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 2, 17, 4, N'新北沁涼溪流旁 團露同樂與大自然親密接觸，位於新北 風景優美生態豐富 夏日賞閃閃螢光，離大台北地區車程20分鐘 交通方便 適合親子 團露 迎新活動', N'2dcf426a-8a2a-43b7-826d-ff9dd17a9f58.jpg', 2200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 10, 10, 1, N'園區內一年四季皆有不同的花卉，蝴蝶、蜻蜓、鳥兒隨之翩翩飛舞，相當賞心悅目。園區內 3 種不同體驗的住宿型態，除湯屋VILLA營車及豪華狩獵帳外，也有自搭帳篷，可供旅客自行選擇。不論何種住宿形式，均可享受溫泉大眾池的泡湯樂趣', N'b2afeb32-9b2d-4834-8911-370938582ae2.jpg', 2800, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, 4, 12, 2, N'一畝田位在苗栗南庄豪華露營住宿，帳內有桌椅、二大床、電風扇、冷暖器等設備，免搭帳輕鬆即可體驗露營的樂趣，且營區設置不少遊憩設施，就是要小朋友忙著玩。', N'62d63613-a3b0-4612-9380-a4096ece0fd7.jpg', 3500, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, 11, 18, 1, N'朋趣打造多款豪華露營車，內部包含獨立衛浴空間、舒適床寢、智能設備及專屬南方松木棧板，以活潑設計與自然特色融合妝點空間', N'21fc2dbb-16bd-4b50-afff-66e15667ec01.jpg', 3800, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (12, 12, 19, 3, N'採用國內外頂級品牌的各式造型帳篷之外，更配備有舒適的寢具用品、設計精緻的浴廁空間，更有在地食材異國料理的餐飲服務與量身訂製打造的各項體驗', N'c2b1cd7d-6a9a-40ad-ad13-aa833d72e396.jpg', 3600, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (13, 13, 20, 4, N'四面環山，自然資源與景觀豐富，園區可眺嘉南平原夜景，阿里山森林鐵路火車駛出樟腦車站後以「之字形」三進三出獨立山，也盡收眼底，吸引愛好露營者來體驗住宿與自然人文風情。', N'12a2dcba-4508-4acd-9ff6-3a71009b66d9.jpg', 2400, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (14, 14, 11, 3, N'徜徉安平最美夕陽，漁光島就在前方1、右側億載金城、右前德陽艦園區、亞果遊艇碼頭在左側!豪華露營區，讓小孩放鬆去玩、讓男人放心放空、讓女孩開心拍照的好地方', N'9badaa04-c7be-4467-8f2c-5ab8064c6f5b.jpg', 3600, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (15, 15, 21, 3, N'擁有180 度絕佳無敵海景 · 知名地標三仙台即在眼前，迎接早晨的第一道曙光', N'a9553cae-c4ba-4f95-98c3-1e015f4a8db3.jpg', 2800, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (16, 16, 22, 1, N'觀星看海欣賞七星潭的日出，在踏浪星辰露營一次都能看到！鄰近花蓮七星潭的踏浪星辰擁有豪華的露營帳篷、附早餐，踏著七星潭的浪', N'9501f92e-edae-403c-a3ea-77991c2e2c67.jpg', 2980, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (17, 17, 5, 3, N'30分鐘就可以逃離城市喧囂，盡情享受野外露營樂趣，提供狩獵帳、蒙古包，皆備有空調設施完善', N'e89266a5-df26-4ed1-988c-5f510c3bbbbb.jpg', 3800, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (1, N'陳奶油', 1, CAST(N'2011-07-07' AS Date), N'092234567', N'aws@gmail.com', N'aws', N'123', N'e97f01e9-7ba7-4198-a268-f6510b17da56.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (2, N'陳瓊珠', 0, CAST(N'1978-08-09' AS Date), N'091212337', N'apple@gmail.com', N'apple', N'123', N'8bba2887-0797-4b6c-b52e-fb490b55bbbc.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (3, N'田雅倫', 0, CAST(N'1982-10-05' AS Date), N'091334453', N'amoz@gmail.com', N'amoz', N'123', N'289ed93d-33c5-43a4-9a81-76da87b7f485.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (4, N'張惠珍', 0, CAST(N'1976-05-03' AS Date), N'095624567', N'rkijj11@gmail.com', N'rkijj11', N'123', N'0a966464-bbc4-461e-b842-a1af01e5625c.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (5, N'方駿凱', 1, CAST(N'1983-04-27' AS Date), N'091333567', N'afokmm@gmail.com', N'afokmm', N'123', N'b8462cfe-33ab-403c-8ef5-9038ea16e851.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (6, N'李瑞奇', 1, CAST(N'1988-01-06' AS Date), N'099403567', N'bws@gmail.com', N'bws', N'123', N'f1428dd7-8b3a-4a49-8d15-e38827a101db.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (7, N'黃炯偉', 1, CAST(N'1991-04-23' AS Date), N'098735673', N'kmcjh@gmail.com', N'kmcjh', N'123', N'6e315b22-9182-43e6-8510-49cd49dfe0f6.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (8, N'李孟如', 0, CAST(N'1986-08-02' AS Date), N'090938753', N'dkkjs@gmail.com', N'dkkjs', N'123', N'b483a223-8986-4960-b702-36dfc7965c6d.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (9, N'宏市鎮', 1, CAST(N'1973-11-12' AS Date), N'091233455', N'fkuinm@yahoo.com', N'fkuinm', N'123', N'4202f956-50b8-4775-8f5f-66c163fdd3e9.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (10, N'江珮允', 0, CAST(N'1971-10-01' AS Date), N'092984769', N'kijl@hotmail.com', N'kijl', N'123', N'82a85e8f-5ca2-43f8-8296-45f9c63903dc.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (11, N'王雅婷', 0, CAST(N'1976-03-13' AS Date), N'092984444', N'okuj@outlook.com', N'okuj', N'123', N'b12f2ba7-ea17-4478-aeb5-d73e59cec5c6.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (12, N'王育', 0, CAST(N'1977-10-08' AS Date), N'092985643', N'kocp@yahoo.com', N'kocp', N'123', N'8136509d-fef3-4654-b984-f317b4eb1fab.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (13, N'賴信洪', 1, CAST(N'1965-12-07' AS Date), N'090984769', N'okie@yahoo.com', N'okie', N'123', N'c81c9241-94ca-47ec-b7c3-99a2cf1a7566.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (14, N'李孟生', 1, CAST(N'1969-11-11' AS Date), N'092984369', N'asd@gmail.com', N'asd', N'123', N'53674a57-7485-446a-83d6-8cb7259bcb60.jpg', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MemberInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[RentDetail] ON 

INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'野營帳', N'老闆真心推薦好用', 999, NULL, 1, 700, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'收納箱', N'便宜好用且耐重', 999, NULL, 1, 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'月亮椅', N'耐重且耐看', 999, NULL, 1, 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'煤油燈', N'省電又環保', 999, NULL, 1, 230, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'保冷保溫袋', N'擁有分層空間，好清洗', 999, NULL, 1, 560, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'調焦頭燈', N'可快速調焦，終身保證維修', 999, NULL, 1, 560, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'帳篷', N'採特殊布料，防水且遮光', 999, NULL, 1, 1200, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'行動馬桶', N'給你絕佳特殊體驗', 999, NULL, 1, 780, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'牛皮工作手套', N'好工作或是扎營會用到', 999, NULL, 1, 540, NULL, NULL, NULL, NULL)
INSERT [dbo].[RentDetail] ([租賃商店ID], [產品名稱], [產品說明], [庫存], [圖片], [數量], [單日租金], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, N'睡袋', N'輕量且體積小 好保暖', 999, NULL, 1, 620, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RentDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[SelfFood] ON 

INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'f5615427-cb86-43cd-a7f2-4d1f4d8f4545.jpg', 5, 3, N'日本和牛組合', N'霜降黑毛和牛、美國安格斯牛排', 5500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'e03b98f3-82cc-4830-9752-0d264b4fdee3.jpg', 10, 5, N'豪華海鮮組合', N'干貝、魷魚、蛤蠣、帝王蟹', 4800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'209148da-ff1c-42c1-b17b-d5bc5e172a7b.jpg', 8, 5, N'經典咖哩組合包', N'燉煮雞肉咖哩、醣心蛋、皮蛋豆腐、毛豆', 1200, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'd5a4f557-c24c-49fa-b304-753d06fdbc59.jpg', 3, 1, N'暖心進補組合', N'養生藥膳雞湯、麻油炙燒豬、酒香爆嫩雞腿丁', 1800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'7aad162d-d2fa-4984-a6e8-90a2a1bc68cf.jpg', 6, 5, N'泰式開胃組合', N'清蒸酸辣檸檬魚、西西里雞腿排、月亮蝦餅', 1800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'6c2b76c5-0261-466d-9601-8dced991ac39.jpg', 12, 8, N'道地韓式料理組合', N'韓式炸雞、炸醬麵、炒冬粉、泡菜豆腐鍋', 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'93aadcb4-5740-4691-b0e0-f6f051d08622.jpg', 20, 15, N'家常拌麵組合(麻醬)', N'麻醬麵、紅酒燉牛肉、香菇炒食蔬', 1500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'1dd9424a-dc77-4141-ab78-805bb5cd8321.jpg', 9, 9, N'家常拌麵組合(麻辣)', N'麻辣拌麵、三杯雞、番茄豆腐', 1500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'909a3539-63c7-4f1b-acb0-833ab7473cdd.jpg', 8, 3, N'香燉牛肉組合', N'半筋半肉牛肉湯麵、紅燒牛腩、蔥燒牛肉', 2500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, N'f94e8e95-e12d-4e05-a3d3-b5b6cef70e8d.jpg', 25, 20, N'經典港式組合', N'荷葉糯米雞、鮮蝦燒賣、韭菜腐皮、蘿蔔糕', 2200, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, N'758be8fb-92ca-4c83-a096-6f302a8f6167.jpg', 12, 8, N'日式烏龍麵組合', N'豬肉炒烏龍麵、醣心蛋、皮蛋豆腐、毛豆', 2200, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SelfFood] OFF
GO
SET IDENTITY_INSERT [dbo].[SelfOrder] ON 

INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 5, N'sef001', CAST(N'2019-05-01T00:00:00.000' AS DateTime), CAST(N'2019-05-05T00:00:00.000' AS DateTime), 5, 10, 8, 5, 6, 2500, 18000, N'讓人感到非常放鬆自然', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 1, N'sef002', CAST(N'2019-12-23T00:00:00.000' AS DateTime), CAST(N'2019-12-25T00:00:00.000' AS DateTime), 3, 5, 4, 4, 4, 1200, 9900, N'舒服，大自然，餐點也還行，服務到位', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 2, N'sef003', CAST(N'2020-03-15T00:00:00.000' AS DateTime), CAST(N'2020-03-20T00:00:00.000' AS DateTime), 6, 8, 6, 7, 2, 300, 12000, N'離市區近的風景露營區', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 5, N'sef004', CAST(N'2020-04-08T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime), 3, 6, 7, 10, 3, 6000, 9000, N'服務人員也很有耐心為體驗客戶解決問題、下午的夕陽也很美', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 7, N'sef005', CAST(N'2020-11-03T00:00:00.000' AS DateTime), CAST(N'2020-11-05T00:00:00.000' AS DateTime), 3, 12, 9, 6, 5, 7800, 25000, N'早餐跟晚餐都很好吃。', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 9, N'sef006', CAST(N'2021-03-20T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), 5, 5, 5, 6, 5, 1200, 8900, N'營區的環境、地點都很優秀，離附近的各大景點也都很近', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 10, N'sef007', CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-14T00:00:00.000' AS DateTime), 3, 2, 6, 11, 7, 900, 5500, N'帳棚內也有暖氣供冬天使用，滿舒服的。', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 13, N'sef008', CAST(N'2021-07-24T00:00:00.000' AS DateTime), CAST(N'2021-07-27T00:00:00.000' AS DateTime), 4, 8, 2, 3, 6, 4000, 15000, N'露營車外面都有屬於自己的溫泉池，很方便！', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 11, N'sef009', CAST(N'2021-10-10T00:00:00.000' AS DateTime), CAST(N'2021-10-14T00:00:00.000' AS DateTime), 5, 9, 3, 5, 9, 6500, 16500, N'場地乾淨漂亮，非常適合拍網美照', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, 2, N'sef010', CAST(N'2021-12-31T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 3, 7, 4, 2, 1, 1000, 17000, N'營區衛浴設備乾淨 ', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, 4, N'sef011', CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2022-06-03T00:00:00.000' AS DateTime), 3, 5, 9, 8, 5, 2500, 6000, N'露營區無光害，晚上很漂亮且清幽', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (12, 6, N'sef012', CAST(N'2022-09-25T00:00:00.000' AS DateTime), CAST(N'2022-09-27T00:00:00.000' AS DateTime), 3, 10, 2, 7, 8, 3300, 16800, N'整體舒服，適合新手露營者', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (13, 7, N'sef013', CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-16T00:00:00.000' AS DateTime), 2, 4, 1, 6, 9, 4500, 6500, N'場地乾淨器材棒，交通需要自行開車', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfOrder] ([自選訂單ID], [會員ID], [自選訂單編號], [入住時間], [退住時間], [露營天數], [預計人數], [營區細項ID], [自選飲食ID], [租賃商店ID], [租借總價], [自選訂單總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (14, 9, N'sef014', CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), 3, 14, 4, 4, 10, 5000, 19000, N'星空帳有些人會失望，但帳內窗簾遮光效果很好', 3, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SelfOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[SetFood] ON 

INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'馬家堡', N'0226617873', N'新北市烏來區大羅蘭47號', N'10人合菜--牧草雞、炸苦瓜於、炸溪蝦、炒山豬肉等，原住民小炒', NULL, NULL, NULL, NULL)
INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'梅后秘境-咖啡廳', N'0903491832', N'新竹縣五峰鄉', N'泰雅族原住民風味餐', NULL, NULL, NULL, NULL)
INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'營主私房風味', N'0912345678', N'苗栗縣南庄5鄰64-2號', N'營主私房風味桶仔雞、清蒸鱒魚等，營主私房菜', NULL, NULL, NULL, NULL)
INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'阿豐師餐廳', N'049285006', N'南投縣魚池鄉中山路406巷2號', N'創意合菜', NULL, NULL, NULL, NULL)
INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'米瑪咖啡Mima Kafeo', N'0975258555', N'高雄市那瑪夏區平和巷236號', N'米瑪定食', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetFood] OFF
GO
SET IDENTITY_INSERT [dbo].[SetOrder] ON 

INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 1, 5, N'set001', CAST(N'2019-05-01T00:00:00.000' AS DateTime), CAST(N'2019-05-02T00:00:00.000' AS DateTime), 5, 6400, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 4, 4, N'set002', CAST(N'2019-12-23T00:00:00.000' AS DateTime), CAST(N'2019-12-25T00:00:00.000' AS DateTime), 5, 14000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 2, 6, N'set003', CAST(N'2020-03-15T00:00:00.000' AS DateTime), CAST(N'2020-03-17T00:00:00.000' AS DateTime), 3, 6000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 1, 7, N'set004', CAST(N'2020-04-08T00:00:00.000' AS DateTime), CAST(N'2020-04-09T00:00:00.000' AS DateTime), 3, 3200, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrder] ([套裝訂單ID], [套裝行程ID], [會員ID], [套裝訂單編號], [入住時間], [退住時間], [預計人數], [合計總價], [評論], [評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 5, 9, N'set005', CAST(N'2020-11-03T00:00:00.000' AS DateTime), CAST(N'2020-11-07T00:00:00.000' AS DateTime), 4, 10000, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[SetOrderDetail] ON 

INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 10, 9, 5, N'兩天一夜', N'固定式帳棚(有床)', 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 2, 8, 3, N'三天兩夜', N'固定式帳棚(有床)', 6000, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 5, 1, 2, N'四天三夜', N'固定式帳棚(有床)', 8500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 5, 1, 2, N'三天兩夜', N'露營車', 7000, NULL, NULL, NULL, NULL)
INSERT [dbo].[SetOrderDetail] ([套裝行程ID], [營地ID], [營區細項ID], [餐廳ID], [套裝方案], [套裝細項], [套裝行程價格], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 7, 6, 1, N'五天四夜', N'露營車', 10000, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopDetail] ON 

INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'TheNorthFace', N'瑯磁吸杯', N'耐溫度達800度C以上 琺瑯材質不僅美觀 更具備食物料理不留殘味的特點', N'c3a8c983-ddd9-4a89-af28-642953f8c4e6.jpg', 999, 230, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'Snowpeak', N'支撐三腳架', N'多功能小型支架，可固定在各種桌子上，通過安裝軸可進行高度調整', N'4dd62dec-d764-4126-afd2-5d10e8ec4030.jpg', 999, 235, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'SADOMAIN', N'折疊水桶', N'極度耐用也可以折疊', N'e4f93816-8472-4a62-8f73-87687b9eaaa9.jpg', 999, 550, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'ForestOutdoor', N'小森椅', N'超寬椅面提升舒適感，椅腳結構夠寬超穩固', N'afe4bc5a-3965-4d80-a1d6-be06bac62747.jpg', 999, 350, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'LifeCode', N'熱壺', N'鍋具採用陽極硬質氧化，硬質氧化鋁層耐磨、耐高溫、耐腐蝕、易清洗', N'88da6d15-6f81-48fe-9afa-d87a14506dd0.jpg', 999, 220, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'Naturehike', N'隨身酒壺', N'鈦為親生物金屬，無化學物質釋出，防腐蝕，防銹，長時間保持酒感', N'aed246bc-7621-4b74-b386-0d331364739b.jpg', 999, 490, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'PolarStar', N'羊毛睡袋', N'具高保暖性、高彈性和導熱性低的特性，能阻絕外在冷空氣', N'd9be62dd-91d5-4d35-b5a0-972d75bf8427.jpg', 999, 4600, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'IVECO', N'科技綿睡袋', N'舒適度及澎鬆度佳，透氣性優，不悶熱', N'e154326c-ac03-45f9-a60e-81580a1d007e.jpg', 999, 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'TyumenTitan', N'客廳帳', N'自由利用空間，安裝簡單，只需3支營柱', N'5e5d4f9f-fb24-4813-8ae1-c1e57ea11b99.jpg', 999, 4600, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShopDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopOrder] ON 

INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 1, 5, N'shop001', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'瑯磁吸杯,客廳帳', 4830, N'帳篷品質不錯 杯子小貴', 87, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 7, 7, N'shop002', CAST(N'2020-02-11T00:00:00.000' AS DateTime), N'羊毛睡袋,熱壺', 4820, N'睡袋保暖 下次會回購', 77, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 4, 8, N'shop003', CAST(N'2019-03-16T00:00:00.000' AS DateTime), N'折疊水桶,小森椅', 900, N'水桶有破洞 客服態度良好', 77, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 5, 9, N'shop004', CAST(N'2019-04-24T00:00:00.000' AS DateTime), N'支撐三腳架,瑯磁吸杯', 465, N'杯子好用 不燙手', 81, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 9, 4, N'shop005', CAST(N'2019-01-08T00:00:00.000' AS DateTime), N'熱壺,羊毛睡袋', 4820, N'睡袋很暖 會推薦給朋友', 89, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 3, 6, N'shop006', CAST(N'2022-09-18T00:00:00.000' AS DateTime), N'折疊水桶,客廳帳', 5150, N'帳篷很棒 即使下雨也能活動', 75, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 6, 2, N'shop007', CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'隨身酒壺,科技綿睡袋', 3690, N'酒壺質感很好', 66, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 9, 10, N'shop008', CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'折疊水桶,客廳帳', 5150, N'讚！！', 75, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 6, 11, N'shop009', CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'隨身酒壺,小森椅', 840, N'椅子好坐 即使我很胖', 91, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopOrder] ([商店ID], [商品細項ID], [會員ID], [商店訂單編號], [成立時間], [細項], [總價], [購物評價], [購物評分], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, 5, 13, N'shop010', CAST(N'2020-06-04T00:00:00.000' AS DateTime), N'熱壺,隨身酒壺', 710, N'酒壺手感很棒 只是蓋子不好開', 65, NULL, NULL, NULL, NULL)
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
