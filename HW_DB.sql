USE [master]
GO
/****** Object:  Database [DB_NoamMayBatelOfri]    Script Date: 07/01/2021 19:29:18 ******/
CREATE DATABASE [DB_NoamMayBatelOfri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_NoamMayBatelOfri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_NoamMayBatelOfri.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_NoamMayBatelOfri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_NoamMayBatelOfri_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_NoamMayBatelOfri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET  MULTI_USER 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_NoamMayBatelOfri]
GO
/****** Object:  Table [dbo].[tblIngredients]    Script Date: 07/01/2021 19:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIngredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NULL,
	[image] [text] NULL,
	[calories] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblingredientsInRecipes]    Script Date: 07/01/2021 19:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblingredientsInRecipes](
	[recipeId] [int] NOT NULL,
	[ingredientId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recipeId] ASC,
	[ingredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrecipes]    Script Date: 07/01/2021 19:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecipes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NULL,
	[image] [text] NULL,
	[cookingMethod] [text] NULL,
	[time] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblIngredients] ON 

INSERT [dbo].[tblIngredients] ([id], [name], [image], [calories]) VALUES (1, N'egg', N'https://wi-images.condecdn.net/image/XaokWbALmwZ/crop/2040/f/egg-insta.jpg', 155)
INSERT [dbo].[tblIngredients] ([id], [name], [image], [calories]) VALUES (2, N'onion', N'https://www.theguardian.pe.ca/media/photologue/photos/cache/Screen_Shot_2020-08-04_at_4.30.33_PM_large.png', 40)
SET IDENTITY_INSERT [dbo].[tblIngredients] OFF
INSERT [dbo].[tblingredientsInRecipes] ([recipeId], [ingredientId]) VALUES (1, 1)
INSERT [dbo].[tblingredientsInRecipes] ([recipeId], [ingredientId]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[tblrecipes] ON 

INSERT [dbo].[tblrecipes] ([id], [name], [image], [cookingMethod], [time]) VALUES (1, N'omlet', N'https://img.mako.co.il/2017/11/14/shutterstock_518490661_i.jpg', N'Cut the onion, mix with the egg and put on the pan', N'5 minutes')
SET IDENTITY_INSERT [dbo].[tblrecipes] OFF
ALTER TABLE [dbo].[tblingredientsInRecipes]  WITH CHECK ADD FOREIGN KEY([ingredientId])
REFERENCES [dbo].[tblIngredients] ([id])
GO
ALTER TABLE [dbo].[tblingredientsInRecipes]  WITH CHECK ADD FOREIGN KEY([recipeId])
REFERENCES [dbo].[tblrecipes] ([id])
GO
USE [master]
GO
ALTER DATABASE [DB_NoamMayBatelOfri] SET  READ_WRITE 
GO
