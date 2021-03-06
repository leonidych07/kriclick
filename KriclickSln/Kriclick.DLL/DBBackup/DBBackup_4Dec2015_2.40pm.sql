USE [master]
GO
/****** Object:  Database [KriclickDB]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[CMSPage]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [smallint] NOT NULL,
	[CountryName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponPhotos]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[Coupons]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[CouponTags]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[FAQ]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[FAQId] [int] IDENTITY(1,1) NOT NULL,
	[FAQCategoryId] [int] NULL,
	[Question] [nvarchar](256) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_FAQ_1] PRIMARY KEY CLUSTERED 
(
	[FAQId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FAQCategory]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQCategory](
	[FAQCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](128) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[FAQCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavouritePosts]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[FeedbackComments]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[IndustryTypes]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndustryTypes](
	[IndustryTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[IndustryType] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_IndustryTypes] PRIMARY KEY CLUSTERED 
(
	[IndustryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostingPhotos]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[PostingProperty]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[Postings]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[PostingTags]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[PostingVehicle]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] NOT NULL,
	[StateName] [nvarchar](128) NOT NULL,
	[Abbreviation] [nvarchar](4) NOT NULL,
	[CountryId] [smallint] NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/4/2015 2:40:29 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[UserTypeId] [tinyint] NULL,
	[IndustryTypeId] [smallint] NULL,
	[FullName] [nvarchar](128) NULL,
	[LogoURL] [nvarchar](128) NULL,
	[CompanyName] [nvarchar](128) NULL,
	[PhoneNo] [varchar](50) NULL,
	[Address] [nvarchar](256) NULL,
	[StateId] [int] NULL,
	[City] [nvarchar](64) NULL,
	[ZipCode] [nvarchar](64) NULL,
	[Website] [nvarchar](64) NULL,
	[IsSpotFinder] [bit] NULL,
	[IsVerified] [bit] NULL,
	[OverallRating] [decimal](3, 1) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[Location] [varchar](50) NULL,
	[fb] [varchar](50) NULL,
	[twitter] [varchar](50) NULL,
	[Instagram] [varchar](50) NULL,
	[googleplus] [varchar](50) NULL,
	[pinterest] [varchar](50) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserReview]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReview](
	[UserReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserProfileId] [bigint] NULL,
	[Rating] [decimal](3, 1) NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Notes] [nvarchar](512) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserReview] PRIMARY KEY CLUSTERED 
(
	[UserReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/4/2015 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [tinyint] NOT NULL,
	[UserTypeName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201512030641186_InitialCreate', N'KriclickWebApp.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2FD0FF20E8A92D522B97EE624F606F913A491B7473C13ABBA76F0B5AA21D61254A95A834C1C1F965E7E1FCA4F317CE50A264F1A68BADD84EB1C0222287DF0C874372381CFA7FFFF9EFF8E7A730B01E7192FA1199D847A343DBC2C48D3C9F2C277646173FBEB37F7EFFED37E30B2F7CB23E9774278C0E5A9274623F501A9F3A4EEA3EE010A5A3D07793288D1674E446A183BCC8393E3CFC877374E46080B001CBB2C61F3342FD10E71FF0398D888B639AA1E03AF27090F272A899E5A8D60D0A711A23174FECDF13DF0D7CF7EB3FF1FC2C8E474503DB3A0B7C04C2CC70B0B02D4448441105514F3FA5784693882C673114A0E0FE39C640B740418A79174E57E45D7B7378CC7AE3AC1A96506E96D228EC097874C2D5E3C8CDD752B25DA90F1478018AA6CFACD7B91227F69587F3A28F51000A90199E4E8384114FECEB8AC5591ADF603A2A1B8E0AC8CB04E0FE8A92AFA33AE281D5B9DD41654EC7A343F6EFC09A6601CD123C2138A3090A0EACBB6C0E63FD3B7EBE8FBE623239399A2F4EDEBD798BBC93B73FE19337F59E425F814E2880A2BB248A7102B2E145D57FDB72C4768EDCB06A566B5368056C0966866D5DA3A70F982CE903CC99E377B675E93F61AF2CE1C6F589F83091A0114D32F8BCC98200CD035CD53B8D3CD9FF0D5C8FDFBC1D84EB0D7AF497F9D04BFC61E22430AF3EE220AF4D1FFCB8985EC2787FE164974914B26FD1BE8ADA2FB3284B5CD699C848728F9225A6A274636765BC9D4C9A410D6FD625EAFE9B369354356F2D29EBD03A33A164B1EDD950CAFBB27C3B5B1CEC3C3078B969318D34199C76BF1A4900079648B632A0A3AE0644A0637FE7F5F022447E30C082D8810BB8230B3F0971D5CB5F22303F447ACB7C87D214D603EF37943E34880E7F0E20FA0CBB5902663AA3288C5F9CDBDD4344F04D16CE99F56F8FD7604373FF5774895C1A251784B5DA18EF43E47E8D327A41BC7344F127EA9680ECF3DE0FBB030C22CE99EBE234BD0463C6DE34026FBB04BC22F4E4B8371C5BA376ED904C03E4877A8F445A4DBF94A42BAF444FA1782606329D77D224EA8768E9936EA296A466510B8A565139595F511958374939A559D09CA055CE826A307F2F1FA1E11DBE1C76FF3DBECD366FD35A5053E30C5648FC2B26388165CCBB4394E284AC46A0CBBAB10B67211F3EC6F4C5F7A69CD367146443B35A6B36E48BC0F0B32187DDFFD9908B09C58FBEC7BC920EC7A09218E03BD1EB4F58ED734E926CDBD341E8E6B6996F670D304D97B3348D5C3F9F059A00180F5F88F2830F67B5C7328ADEC8F110E81818BACFB63C2881BED9B251DD92731C608AAD33B708104E51EA224F552374C8EB2158B9A36A045BC54544E17E507882A5E3843542EC1094C24CF50955A7854F5C3F4641AB96A4961DB730D6F78A875C738E634C18C3564D7461AE0F8330012A3ED2A0B46968ECD42CAED9100D5EAB69CCDB5CD8D5B82BD189ADD8648BEF6CB04BEEBFBD8861366B6C0BC6D9AC922E0218437ABB30507E56E96A00F2C165DF0C543A31190C94BB545B315051633B30505125AFCE408B236AD7F197CEABFB669EE24179FBDB7AA3BA76609B823EF6CC340BDF13DA50688113D53CCFE7AC123F51CDE10CE4E4E7B394BBBAB28930F019A662C866E5EF6AFD50A7194436A226C095A1B580F2CB40054899503D842B63798DD2712FA2076C19776B84E56BBF045BB30115BB7E295A23345F9DCAC6D9E9F451F5ACB206C5C83B1D166A381A8390172FB1E31D94628ACBAA8AE9E20BF7F1866B1DE383D1A0A016CFD5A0A4B233836BA934CD762DE91CB23E2ED9465A92DC278396CACE0CAE256EA3ED4AD238053DDC828D54246EE1034DB632D251ED3655DDD829D2A578C1D831E4558DAF511CFB6459CBB3E225D6AC48B29AFE38EB9F7A1416188E9B6A32902A692B4E344AD0124BB5C01A24BDF493949E238AE688C579A65EA89069F756C3F25FB2AC6F9FEA2096FB4049CDFE2E5AE8AFF085ED56F54738CC257432644E4D1E49D79880BEB9C552DF5080124DF07E1A055948CC3E96B9757185576F5F94A8086347925FF1A11485299EAEA8FD4E63A3CE8BE1C6A9F262D61F2B338449E3A50F5AD7B9C92F35A39461AA3A8A2974B5B3B133B9337DC74B7616FB0F572BC2CBCC2E9EA15207E0453D316A490E0A58ADAE3BAA988752C7146BBA234AC9267548A9AA8794F5941241C87AC55A78068DEA29BA73509348EAE86A6D77644D3A491D5A53BD06B64666B9AE3BAA26E3A40EACA9EE8EBD4A3F91D7D13DDEBF8C47984D36B0E2A0BBD90E66C078994571980DB0769F5F07AA15F7C4E237F60A182FDF4B83329EF63631A822C4B199411930CCEB8F70192E2E3F8D37F8664CE1865B58E29B6EF8CD78FDCCF6458D4339EFC92415F7EADC279DEFC6FCACD5FEB846397C1524B655AA11B6F7E794E270C40846B33F8369E063B6989704D788F80B9CD222ABC33E3E3C3A961EE7ECCF4319274DBD40735635BD9611C76C0B095AE41125EE034AD474890D1E93AC409548F415F1F0D3C4FE57DEEA340F6AB0BFF2E203EB2AFD44FC3F33A8B84F326CFD5B4DFF1C26B9BEF9B4B5A74F21BA6BF5EA8F2F45D303EB368119736A1D4ABA5C6784C50712BDA4299A6E20CDDACF265EEF84125E236851A509B1FEE383B94F077978504AF95D889EBEEF2B9AF671C146889A070443E10DA242D3038175B08C8F033CF8A4F9E3807E9DD53F16584734E343019FF407939F09745F86CA963BDC6A34C7A26D2C49B99E5BD3AC37CAB9DCF5DEA464636F34D1D58CEB1E701B6455AF6119AF2C2179B0DD51936F3C18F62E4DFBC5938CF725AF7895F1B1DB74E26D661037DC0FFDAD1287F720D54D93BAB3FBF4E06DDB9A2994BBE73996FD9280F7CCD87842D7EE537DB76D6CA630EF9E1B5BAF84DE3DB3B55DED9F3BB6B4CE5BE8CED373D54C23C3958C2E16DC967E5B04CEE1843F8FC0080A8FB27835A9CFF76ACA556D61B822313335279AC98C9589A3F055289AD9F6EB2BDFF01B3BCB699AD91AD2339B78F3F5BF9137A769E66D487ADC45E2B036ED5097CCDDB28E356543BDA64461A1272D79E96D3E6BE3FDFA6BCA0B1E4429C2EC31DC11BF9E34E0415432E4D4E991F6AB5EF7C2DE59FBC545D8BF537FB98260BFBF48B02BEC9A15CD155944E5E62D49549248119A6B4C91075BEA5942FD05722954B31873FEEC3B8FDBB19B8E39F6AEC86D46E38C429771380F84801773029AF8E7B9CDA2CCE3DB38FF059321BA0062FA2C367F4B7EC9FCC0ABE4BED4C4840C10CCBBE0115D369694457697CF15D24D443A0271F5554ED13D0EE300C0D25B32438F781DD9C0FC3EE025729F5711401348FB40886A1F9FFB6899A030E518ABF6F00936EC854FEFFF0FBD12795B78540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'102748585184462539992', N'94c84bc4-04f8-42d3-9092-93436ed1969c')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'101190588988706781564', N'a201fc24-4d17-411b-b2c3-68d8ddac9a3a')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'130271767339593', N'd49cbfe4-f85e-45e5-ba06-9c68a1940d53')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'94c84bc4-04f8-42d3-9092-93436ed1969c', NULL, 0, NULL, N'b20f6118-90f7-4223-83db-7c4aa165aaed', NULL, 0, 0, NULL, 0, 0, N'Pardeepsingh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a201fc24-4d17-411b-b2c3-68d8ddac9a3a', NULL, 0, NULL, N'5ee3084a-9025-467b-a163-0f4f30758b69', NULL, 0, 0, NULL, 0, 0, N'Piyush.Xpress')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd49cbfe4-f85e-45e5-ba06-9c68a1940d53', NULL, 0, NULL, N'45d4c145-1f85-470f-9ba8-42b93b1e1f61', NULL, 0, 0, NULL, 0, 0, N'Philip.Decosta')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (1, N'USA')
SET IDENTITY_INSERT [dbo].[IndustryTypes] ON 

INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (1, N'Community')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (2, N'Vehicles')
SET IDENTITY_INSERT [dbo].[IndustryTypes] OFF
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (1, N'Alabama', N'AL', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (2, N'Alaska', N'AK', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (3, N'Arizona', N'AZ', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (4, N'Arkansas', N'AR', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (5, N'California', N'CA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (6, N'Colorado', N'CO', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (7, N'Connecticut', N'CT', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (8, N'Delaware', N'DE', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (9, N'Florida', N'FL', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (10, N'Georgia', N'GA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (11, N'Hawaii', N'HI', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (12, N'Idaho', N'ID', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (13, N'Illinois', N'IL', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (14, N'Indiana', N'IN', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (15, N'Iowa', N'IA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (16, N'Kansas', N'KS', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (17, N'Kentucky', N'KY', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (18, N'Louisiana', N'LA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (19, N'Maine', N'ME', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (20, N'Maryland', N'MD', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (21, N'Massachusetts', N'MA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (22, N'Michigan', N'MI', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (23, N'Minnesota', N'MN', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (24, N'Mississippi', N'MS', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (25, N'Missouri', N'MO', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (26, N'Montana', N'MT', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (27, N'Nebraska', N'NE', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (28, N'Nevada', N'NV', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (29, N'New Hampshire', N'NH', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (30, N'New Jersey', N'NJ', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (31, N'New Mexico', N'NM', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (32, N'New York', N'NY', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (34, N'North Dakota', N'ND', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (35, N'Ohio', N'OH', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (36, N'Oklahoma', N'OK', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (37, N'Oregon', N'OR', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (38, N'Pennsylvania', N'PA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (39, N'Rhode Island', N'RI', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (40, N'South Carolina', N'SC', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (41, N'South Dakota', N'SD', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (42, N'Tennessee', N'TN', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (43, N'Texas', N'TX', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (44, N'Utah', N'UT', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (45, N'Vermont', N'VT', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (46, N'Virginia', N'VA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (47, N'Washington', N'WA', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (48, N'West Virginia', N'WV', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (49, N'Wisconsin', N'WI', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (50, N'Wyoming', N'WY', 1)
INSERT [dbo].[States] ([StateId], [StateName], [Abbreviation], [CountryId]) VALUES (51, N'North Carolina', N'NC', 1)
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (1, N'Personal')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (2, N'Business')
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/4/2015 2:40:29 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[FAQ]  WITH CHECK ADD  CONSTRAINT [FK_FAQ_FAQCategory] FOREIGN KEY([FAQCategoryId])
REFERENCES [dbo].[FAQCategory] ([FAQCategoryId])
GO
ALTER TABLE [dbo].[FAQ] CHECK CONSTRAINT [FK_FAQ_FAQCategory]
GO
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_States_Countries]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_IndustryTypes] FOREIGN KEY([IndustryTypeId])
REFERENCES [dbo].[IndustryTypes] ([IndustryTypeId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_IndustryTypes]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_States] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_States]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([UserTypeId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserTypes]
GO
ALTER TABLE [dbo].[UserReview]  WITH CHECK ADD  CONSTRAINT [FK_UserReview_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([UserProfileId])
GO
ALTER TABLE [dbo].[UserReview] CHECK CONSTRAINT [FK_UserReview_UserProfile]
GO
USE [master]
GO
ALTER DATABASE [KriclickDB] SET  READ_WRITE 
GO
