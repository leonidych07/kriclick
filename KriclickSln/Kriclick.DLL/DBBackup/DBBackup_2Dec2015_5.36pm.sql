USE [master]
GO
/****** Object:  Database [KriclickDB]    Script Date: 12/2/2015 5:40:56 PM ******/
CREATE DATABASE [KriclickDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KriclickDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KriclickDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KriclickDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KriclickDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KriclickDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KriclickDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KriclickDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KriclickDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KriclickDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KriclickDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KriclickDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KriclickDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KriclickDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KriclickDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KriclickDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KriclickDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KriclickDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KriclickDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KriclickDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KriclickDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KriclickDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KriclickDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KriclickDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KriclickDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KriclickDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KriclickDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KriclickDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KriclickDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KriclickDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KriclickDB] SET  MULTI_USER 
GO
ALTER DATABASE [KriclickDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KriclickDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KriclickDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KriclickDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KriclickDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KriclickDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CMSPage]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMSPage](
	[PageID] [int] NULL,
	[PageContent] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactUSID] [int] NULL,
	[FullName] [nchar](10) NULL,
	[Username] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[TopicID] [int] NULL,
	[Message] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponPhotos]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CouponPhotos](
	[CouponPhotoID] [int] NULL,
	[PhotoURL] [varchar](50) NULL,
	[CouponID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponID] [int] NOT NULL,
	[UserID] [int] NULL,
	[IndustryTypeID] [int] NULL,
	[URL] [varchar](50) NULL,
	[CouponTitle] [varchar](100) NULL,
	[CouponPrice] [money] NULL,
	[Description] [varchar](500) NULL,
	[FinePrint] [varchar](50) NULL,
	[CouponCode] [varchar](50) NULL,
	[CouponExpiryDate] [date] NULL,
	[CouponLikes] [int] NULL,
	[CouponUnlikes] [int] NULL,
	[Impressions] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponTags]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CouponTags](
	[CouponTagID] [int] NULL,
	[CouponID] [int] NULL,
	[Tag] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAQ](
	[FAQID] [int] NULL,
	[FAQCategoryID] [int] NULL,
	[Question] [varchar](50) NULL,
	[Answer] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQCategory]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAQCategory](
	[FAQCategoryID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[FAQCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FavouritePosts]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavouritePosts](
	[FavouritePostID] [int] NULL,
	[PostID] [int] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedbackComments]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedbackComments](
	[FeedbackCommentID] [int] NULL,
	[FeedbackID] [int] NULL,
	[Comment] [varchar](50) NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[email] [varchar](50) NULL,
	[votes] [int] NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostingPhotos]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostingPhotos](
	[PostingPhotoID] [int] NOT NULL,
	[PostingID] [int] NULL,
	[PostingPhotoURL] [varchar](50) NULL,
 CONSTRAINT [PK_PostingPhotos] PRIMARY KEY CLUSTERED 
(
	[PostingPhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostingProperty]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostingProperty](
	[VehiclePostingID] [int] NULL,
	[PostingID] [int] NULL,
	[Bedrooms] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Postings]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Postings](
	[PostingID] [int] NOT NULL,
	[PostDate] [datetime] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[TotalPrice] [money] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[YouTubeURL] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK_Postings] PRIMARY KEY CLUSTERED 
(
	[PostingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostingTags]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostingTags](
	[PostingTagID] [int] NULL,
	[PostingID] [int] NULL,
	[Tag] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostingVehicle]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostingVehicle](
	[VehiclePostingID] [int] NULL,
	[PostingID] [int] NULL,
	[year] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[SubCategory] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserID] [int] NULL,
	[UserLogoURL] [varchar](500) NULL,
	[FullName] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[fb] [varchar](50) NULL,
	[twitter] [varchar](50) NULL,
	[Instagram] [varchar](50) NULL,
	[googleplus] [varchar](50) NULL,
	[pinterest] [varchar](50) NULL,
	[IsVerified] [bit] NULL,
	[OverallRating] [decimal](18, 0) NULL,
	[UserTypeID] [int] NULL,
	[IndustryTypeID] [int] NULL,
	[PhoneNo] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[StateID] [int] NULL,
	[City] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[IsSpotFinder] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserReview]    Script Date: 12/2/2015 5:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReview](
	[UserReviewID] [int] NULL,
	[Rating] [decimal](18, 0) NULL,
	[Title] [nchar](10) NULL,
	[Note] [nchar](10) NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [KriclickDB] SET  READ_WRITE 
GO
