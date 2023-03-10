USE [master]
GO
/****** Object:  Database [dbFT]    Script Date: 2023/3/9 上午 11:54:25 ******/
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
/****** Object:  Table [dbo].[ActDetail]    Script Date: 2023/3/9 上午 11:54:25 ******/
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
/****** Object:  Table [dbo].[Camp]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[CampDetail]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[CampStyle]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[RentDetail]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[SelfFood]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[SelfOrder]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[SetFood]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[SetOrder]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[SetOrderDetail]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[ShopDetail]    Script Date: 2023/3/9 上午 11:54:26 ******/
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
/****** Object:  Table [dbo].[ShopOrder]    Script Date: 2023/3/9 上午 11:54:26 ******/
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

INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 6, N'景點', N'溫泉', N'宜蘭太平山鳩之澤溫泉', NULL, NULL, 10, N'走訪如仙境般的太平山國家森林', 200, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 5, N'運動', N'攀岩', N'新北龍洞攀岩體驗', NULL, NULL, 10, N'熱血攀岩的同時，也能享受東北角海岸美景，登頂後，龍洞浩瀚的海岸線就在腳下', 300, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 3, N'文化', N'工作坊', N'多肉花式編織掛繩', NULL, NULL, 5, N'運用繩編的技巧組合創造不同織紋，搭配簡單造型的陶盆與垂墜式的多肉植物', 400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 4, N'運動', N'健行', N'合歡山日出團', NULL, NULL, 20, N'凌晨出發的日出團可沿途觀賞繁星點點與日出微光', 500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 7, N'景點', N'賞螢', N'園區夜間生態導賞', NULL, NULL, 50, N'螢火蟲季大自然的星光大道', 600, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 9, N'運動', N'溯溪', N'台東桑樹溪秘境溯溪體驗', NULL, NULL, 10, N'領略台東桑樹溪河岸風光，深入瀑布深潭，零經驗也沒問題', 700, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 8, N'水上', N'獨木舟', N'屏東小琉球獨木舟＆日出獨木舟＆透明獨木舟體驗', NULL, NULL, 5, N'切換不同視角，從海上欣賞小琉球的熱帶島嶼景緻', 800, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 7, N'水上', N'釣魚', N'台東夜間捕撈飛魚體驗', NULL, NULL, 20, N'探索豐富海洋生態、絕美海岸景觀與住民風情', 900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 9, N'水上', N'潛水', N'新北龍洞2日PADI OW開放水域潛水員證照課程', NULL, NULL, 50, N'水下實作教練與學生比例1:1或1:2，享受完善的高品質教學', 1000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, 10, N'觀光', N'遊船觀光', N'花蓮賞鯨華棋268遊艇賞鯨導覽體驗', NULL, NULL, 20, N'觀賞可愛野生鯨豚悠游海上，捕捉珍貴畫面', 1100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, 8, N'景點', N'博物館', N'台南奇美博物館', NULL, NULL, 60, N'博物館典藏西洋藝術品為主，展出藝術、樂器、兵器與自然史四大領域，台南必遊景點！', 1200, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (12, 7, N'景點', N'動物園', N'宜蘭張美阿嬤農場', NULL, NULL, 100, N'呆萌水豚君泡澡、兔豚、袋鼠、草泥馬，療癒登場！', 1300, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (13, 6, N'景點', N'纜車', N'南投日月潭纜車', NULL, NULL, 150, N'從纜車上享受360度零死角的山嵐景致，俯瞰日月潭全景', 1400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (14, 9, N'景點', N'遊樂園', N'台中三井 OUTLET SNOWTOWN 雪樂地', NULL, NULL, 50, N'台灣第一家室內恆溫雪場－三井 OUTLET SNOWTOWN 雪樂地，免出國就能自在玩雪', 1500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (15, 4, N'活動', N'嘉年華', N'漫度情人 白色·春艷電音派對', NULL, NULL, 30, N'台南最美露營區-漫度漁光」要舉辦春季白色電音派對囉！有著安平最美夕陽之外，還有傳奇酒館團隊、有艇俱樂部的遊艇團隊進駐！', 1600, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (16, 3, N'活動', N'展演', N'高雄這。不會考3－動漫怪物學', NULL, NULL, 80, N'海影城事—入圍法國新影像藝術節 XR 競賽的蒸汽龐克VR動畫作品', 1700, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ActDetail] ([活動ID], [營區ID], [活動方式], [活動種類], [活動名稱], [開始日期], [結束日期], [預計人數], [活動介紹], [門票價格], [活動圖片], [建立人], [建立時間], [修改人], [修改時間]) VALUES (17, 2, N'文化', N'料理課程', N'台南山村烹飪教室', NULL, NULL, 70, N'針對個人進度做專業指導，做出美味的料理', 1800, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Camp] ON 

INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'福山緣營地', N'新北市烏來區', N'北區', N'新北市', N'小包區 有雨棚 有遊戲設施 近溪流 螢火蟲季', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'長青谷大自然園區', N'新北新店區', N'北區', N'新北市', N'新北沁涼溪流旁 團露同樂與大自然親密接觸', 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'玉峰遇見嵨繞', N'新竹尖石', N'北區', N'新竹縣', N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'一畝田', N'苗栗南庄', N'北區', N'苗栗縣', N'南庄一畝田，以豪華露營模式，規劃完善設備，讓提供渡假的好選擇', 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'日月潭 九蛙秘境露營王國', N'南投魚池', N'中區', N'南投縣', N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', 120, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'峇嵐杉丘', N'南投魚池', N'中區', N'南投縣', N'峇嵐杉丘擁有23頂帳篷－以希臘12主神為題的星空帳與經典車款為題的11台馬車', 250, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'斷橋部落露營地', N'苗栗三義', N'北區', N'苗栗縣', N'苗栗三義的龍騰斷橋旁出現了一個網美部落', 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'貓鼻頭露營莊園', N'屏東縣恆春鎮下泉路90號', N'南區', N'屏東縣', N'O’Glamping (Ocean Glamping) 位於臺灣左腳最南端貓鼻頭公園旁，占地總面積約4公頃', 150, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'幸福城景觀露營區', N'宜蘭大同', N'東區', N'宜蘭縣', N'風光明媚的宜蘭縣大同鄉，絕佳景觀無死角~令人心曠神怡', 200, NULL, NULL, NULL, NULL)
INSERT [dbo].[Camp] ([營區ID], [營區名稱], [營區地址], [地區], [縣市], [營區介紹], [容納人數], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, N'NU遠山望月溫泉風呂露營區LL', N'高雄市六龜區', N'南區', N'高雄市', N'遠山望月溫泉風呂露營區位於高雄六龜寶來花賞公園', 260, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Camp] OFF
GO
SET IDENTITY_INSERT [dbo].[CampDetail] ON 

INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, 5, 3, 2, N'九蛙秘境得天獨厚，在日月潭水社壩堤公園旁有絕佳的賞螢秘境', NULL, 2500, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, 1, 4, 2, N'規劃完善設備，讓提供渡假的好選擇', NULL, 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, 3, 6, 4, N'宛如歌劇院觀賞般華麗景緻，一起跟著遇見嵨繞見證震撼於星空的浩瀚', NULL, 3000, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, 9, 7, 1, N'茶園與蘭陽溪相伴，飽覽360°壯麗山景，入夜有蘭陽平原百萬夜景登場', NULL, 1200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, 6, 9, 3, N'每一間帳篷與馬車帳除了特製的專屬鑰匙木牌， 不同的房間有他獨特的主題元素與室內裝飾來襯托所代表的意涵。 希望帶給每頂帳篷、馬車的村民都有不同的住宿體驗。 不同的帳篷主題、不同的氛圍，帶給你與眾不同的露營體驗。', NULL, 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, 7, 10, 2, N'享受三義這座浪漫的山城，從營區徒步10分鐘就能到龍騰斷橋，慢步調遊走歷史古蹟、走訪步道享受山林秘境，再騎著鐵道自行車，欣賞沿途的壯麗美景，感舊時代的風情，再踏上老街品嚐道地鮮美的客家料理，附近還有許多在地的文化與景點等著你，讓你的旅程增添許多驚喜', NULL, 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, 8, 11, 3, N'O''Glamping 推出適合懶人的頂級露營，豪華露營設備全都幫你準備好，免裝備就能入住！擁有台灣最南邊的風情酒吧，也是台灣南邊最佳觀賞銀河星星地點，可在園區內私人五星級 Villa 露營營地享受海角第一排百萬美景；於黑潮市-綜合服務中心品嚐異國風情古巴美食饗宴，可看海、可觀星、可享受大自然環境與美食，輕輕鬆鬆就能感受到自然生活的浪漫', NULL, 2400, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, 2, 8, 4, N'新北沁涼溪流旁 團露同樂與大自然親密接觸，位於新北 風景優美生態豐富 夏日賞閃閃螢光，離大台北地區車程20分鐘 交通方便 適合親子 團露 迎新活動', NULL, 2200, NULL, NULL, NULL, NULL)
INSERT [dbo].[CampDetail] ([營區細項ID], [營區ID], [活動ID], [露營形式ID], [詳細內容], [圖片], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, 10, 6, 1, N'園區內一年四季皆有不同的花卉，蝴蝶、蜻蜓、鳥兒隨之翩翩飛舞，相當賞心悅目。園區內 3 種不同體驗的住宿型態，除湯屋VILLA營車及豪華狩獵帳外，也有自搭帳篷，可供旅客自行選擇。不論何種住宿形式，均可享受溫泉大眾池的泡湯樂趣', NULL, 2800, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (1, N'陳奶油', 1, CAST(N'2011-07-07' AS Date), N'092234567', N'aws@gmail.com', N'aws', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (2, N'陳瓊珠', 0, CAST(N'1978-08-09' AS Date), N'091212337', N'apple@gmail.com', N'apple', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (3, N'田雅倫', 0, CAST(N'1982-10-05' AS Date), N'091334453', N'amoz@gmail.com', N'amoz', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (4, N'張惠珍', 0, CAST(N'1976-05-03' AS Date), N'095624567', N'rkijj11@gmail.com', N'rkijj11', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (5, N'方駿凱', 1, CAST(N'1983-04-27' AS Date), N'091333567', N'afokmm@gmail.com', N'afokmm', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (6, N'李瑞奇', 1, CAST(N'1988-01-06' AS Date), N'099403567', N'bws@gmail.com', N'bws', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (7, N'黃炯偉', 1, CAST(N'1991-04-23' AS Date), N'098735673', N'kmcjh@gmail.com', N'kmcjh', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (8, N'李孟如', 0, CAST(N'1986-08-02' AS Date), N'090938753', N'dkkjs@gmail.com', N'dkkjs', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (9, N'宏市鎮', 1, CAST(N'1973-11-12' AS Date), N'091233455', N'fkuinm@yahoo.com', N'fkuinm', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (10, N'江珮允', 0, CAST(N'1971-10-01' AS Date), N'092984769', N'kijl@hotmail.com', N'kijl', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (11, N'王雅婷', 0, CAST(N'1976-03-13' AS Date), N'092984444', N'okuj@outlook.com', N'okuj', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (12, N'王育', 0, CAST(N'1977-10-08' AS Date), N'092985643', N'kocp@yahoo.com', N'kocp', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (13, N'賴信洪', 1, CAST(N'1965-12-07' AS Date), N'090984769', N'okie@yahoo.com', N'okie', N'123', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[MemberInfo] ([會員ID], [姓名], [性別], [出生日期], [電話號碼], [連絡信箱], [會員帳號], [會員密碼], [照片], [權限], [建立時間], [修改時間], [修改人]) VALUES (14, N'李孟生', 1, CAST(N'1969-11-11' AS Date), N'092984369', N'asd@gmail.com', N'asd', N'123', NULL, 1, NULL, NULL, NULL)
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

INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, NULL, 5, 3, N'日本和牛組合', N'霜降黑毛和牛、美國安格斯牛排', 5500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, NULL, 10, 5, N'豪華海鮮組合', N'干貝、魷魚、蛤蠣、帝王蟹', 4800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, NULL, 8, 5, N'經典咖哩組合包', N'燉煮雞肉咖哩、醣心蛋、皮蛋豆腐、毛豆', 1200, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, NULL, 3, 1, N'暖心進補組合', N'養生藥膳雞湯、麻油炙燒豬、酒香爆嫩雞腿丁', 1800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, NULL, 6, 5, N'泰式開胃組合', N'清蒸酸辣檸檬魚、西西里雞腿排、月亮蝦餅', 1800, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, NULL, 12, 8, N'道地韓式料理組合', N'韓式炸雞、炸醬麵、炒冬粉、泡菜豆腐鍋', 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, NULL, 20, 15, N'家常拌麵組合(麻醬)', N'麻醬麵、紅酒燉牛肉、香菇炒食蔬', 1500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, NULL, 9, 9, N'家常拌麵組合(麻辣)', N'麻辣拌麵、三杯雞、番茄豆腐', 1500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, NULL, 8, 3, N'香燉牛肉組合', N'半筋半肉牛肉湯麵、紅燒牛腩、蔥燒牛肉', 2500, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (10, NULL, 25, 20, N'經典港式組合', N'荷葉糯米雞、鮮蝦燒賣、韭菜腐皮、蘿蔔糕', 2200, NULL, NULL, NULL, NULL)
INSERT [dbo].[SelfFood] ([自選飲食ID], [圖片], [需求人數], [需求份數], [商品名稱], [商品內容], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (11, NULL, 12, 8, N'日式烏龍麵組合', N'豬肉炒烏龍麵、醣心蛋、皮蛋豆腐、毛豆', 2200, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'營主私房風味', NULL, N'苗栗縣南庄5鄰64-2號', N'營主私房風味桶仔雞、清蒸鱒魚等，營主私房菜', NULL, NULL, NULL, NULL)
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

INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'仙德曼', N'瑯磁吸杯', N'耐溫度達800度C以上 琺瑯材質不僅美觀 更具備食物料理不留殘味的特點', NULL, 999, 230, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (2, N'山趣', N'支撐三腳架', N'多功能小型支架，可固定在各種桌子上，通過安裝軸可進行高度調整', NULL, 999, 235, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (3, N'山趣', N'折疊水桶', N'極度耐用也可以折疊', NULL, 999, 550, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (4, N'Forest Outdoor', N'小森椅', N'超寬椅面提升舒適感，椅腳結構夠寬超穩固', NULL, 999, 350, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (5, N'火楓', N'熱壺', N'鍋具採用陽極硬質氧化，硬質氧化鋁層耐磨、耐高溫、耐腐蝕、易清洗', NULL, 999, 220, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (6, N'火楓', N'隨身酒壺', N'鈦為親生物金屬，無化學物質釋出，防腐蝕，防銹，長時間保持酒感', NULL, 999, 490, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (7, N'Polar Star', N'羊毛睡袋', N'具高保暖性、高彈性和導熱性低的特性，能阻絕外在冷空氣', NULL, 999, 4600, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (8, N'Litume', N'科技綿睡袋', N'舒適度及澎鬆度佳，透氣性優，不悶熱', NULL, 999, 3200, NULL, NULL, NULL, NULL)
INSERT [dbo].[ShopDetail] ([商品細項ID], [品牌名稱], [產品名稱], [產品說明], [產品圖片], [庫存], [單價], [建立人], [建立時間], [修改人], [修改時間]) VALUES (9, N'Coleman', N'客廳帳', N'自由利用空間，安裝簡單，只需3支營柱', NULL, 999, 4600, NULL, NULL, NULL, NULL)
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
