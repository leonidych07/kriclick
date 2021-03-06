USE [master]
GO
/****** Object:  Database [KriclickDB]    Script Date: 12/18/2015 12:59:04 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/18/2015 12:59:04 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[CMSPage]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[CouponPhotos]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[Coupons]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[CouponTags]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[FAQ]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[FAQCategory]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[FavouritePosts]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[FeedbackComments]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[IndustryTypes]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[PostingPhotos]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[PostingProperty]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[Postings]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[PostingTags]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[PostingVehicle]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/18/2015 12:59:05 PM ******/
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
	[FirstName] [nvarchar](128) NULL,
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
	[LastName] [nvarchar](128) NULL,
	[ProfileHeaderURL] [nvarchar](128) NULL,
	[youtubeurl] [nvarchar](256) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserReview]    Script Date: 12/18/2015 12:59:05 PM ******/
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/18/2015 12:59:05 PM ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'24385463-3f1c-4c31-85c5-2fe1d51d54b6', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2aa4960-9ef1-4a81-8816-1cff76977b82', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'24385463-3f1c-4c31-85c5-2fe1d51d54b6', N'jatinder.xpress@gmail.com', 0, N'ADEuNYV1pgEmTxNIVFh0JcesG+SDjXlmg/bvMozYEG+gRDm4aUviaL9n6Op2tEBwEQ==', N'ce58bea5-ced4-4b1a-8a0d-00f574b62018', NULL, 0, 0, NULL, 0, 0, N'jatinder.xpress@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c2aa4960-9ef1-4a81-8816-1cff76977b82', N'piyush.xpress@gmail.com', 0, N'AMI9I3Ku9NY3X0nHPEEyNb9UhAA24gtWo03vrlrB/wK3KhW+VuukvIXH4HvYNAJ51Q==', N'fe82927a-d7f8-418f-8890-a2bcebffbe0f', NULL, 0, 0, NULL, 0, 0, N'piyush.xpress@gmail.com')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (1, N'USA')
SET IDENTITY_INSERT [dbo].[IndustryTypes] ON 

INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (1, N'Accommodations')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (2, N'Accounting')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (3, N'Advertising')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (4, N'Aerospace')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (5, N'Agriculture & Agribusiness')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (6, N'Air Transportation')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (7, N'Apparel & Accessories')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (8, N'Auto')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (9, N'Banking')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (10, N'Beauty & Cosmetics')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (11, N'Biotechnology')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (12, N'Chemical')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (13, N'Communications')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (14, N'Computer')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (15, N'Construction')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (16, N'Consulting')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (17, N'Consumer Products')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (18, N'Education')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (19, N'Electronics')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (20, N'Employment')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (21, N'Energy')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (22, N'Entertainment & Recreation')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (23, N'Fashion')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (24, N'Financial Services')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (25, N'Food & Beverage')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (26, N'Health')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (27, N'Information')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (28, N'Journalism & News')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (29, N'Legal Services')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (30, N'Manufacturing')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (31, N'Media & Broadcasting')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (32, N'Medical Devices & Supplies')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (33, N'Motion Pictures & Video')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (34, N'Music')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (35, N'Pharmaceutical')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (36, N'Public Administration')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (37, N'Publishing')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (38, N'Real Estate')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (39, N'Retail')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (40, N'Service')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (41, N'Sports')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (42, N'Technology')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (43, N'Telecommunications')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (44, N'Transportation')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (45, N'Travel')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (46, N'Utilities')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (47, N'Video Game')
INSERT [dbo].[IndustryTypes] ([IndustryTypeId], [IndustryType]) VALUES (48, N'Web Services')
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
/****** Object:  Index [RoleNameIndex]    Script Date: 12/18/2015 12:59:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/18/2015 12:59:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/18/2015 12:59:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/18/2015 12:59:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/18/2015 12:59:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/18/2015 12:59:05 PM ******/
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
