USE [master]
GO
/****** Object:  Database [NextCMS]    Script Date: 2015/11/23 0:05:01 ******/
CREATE DATABASE [NextCMS] ON  PRIMARY 
( NAME = N'NextCMS', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NextCMS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NextCMS_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NextCMS_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NextCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NextCMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NextCMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NextCMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NextCMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NextCMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [NextCMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NextCMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NextCMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NextCMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NextCMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NextCMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NextCMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NextCMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NextCMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NextCMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NextCMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NextCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NextCMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NextCMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NextCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NextCMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NextCMS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NextCMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NextCMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NextCMS] SET  MULTI_USER 
GO
ALTER DATABASE [NextCMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NextCMS] SET DB_CHAINING OFF 
GO
USE [NextCMS]
GO
/****** Object:  Table [dbo].[Authen_Permission]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authen_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Area] [nvarchar](50) NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[DisplayOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Authen_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authen_Role]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authen_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[IsSystemRole] [bit] NOT NULL,
	[SystemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.Authen_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authen_RolePermission_Mapping]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authen_RolePermission_Mapping](
	[PermissionId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Authen_RolePermission_Mapping] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authen_User]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authen_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[LastIpAddress] [nvarchar](200) NULL,
	[LastLoginDate] [datetime] NULL,
	[LastActivityDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Authen_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authen_UserRole_Mapping]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authen_UserRole_Mapping](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Authen_UserRole_Mapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_Article]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](200) NULL,
	[MetaDescription] [nvarchar](200) NULL,
	[MetaTitle] [nvarchar](200) NULL,
	[PictureId] [int] NOT NULL,
	[Views] [int] NOT NULL,
	[CommentCount] [int] NOT NULL,
	[Favor] [int] NOT NULL,
	[Hate] [int] NOT NULL,
	[AllowComment] [bit] NOT NULL,
	[ShowOnTop] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_dbo.Catalog_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_ArticleTag_Mapping]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ArticleTag_Mapping](
	[ArticleId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Catalog_ArticleTag_Mapping] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_Category]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](200) NULL,
	[MetaDescription] [nvarchar](200) NULL,
	[MetaTitle] [nvarchar](200) NULL,
	[ParentId] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[IncludeInTopMenu] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
	[UpdatedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Catalog_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_Comment]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[CommentText] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
	[ArticleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Catalog_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_Tag]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Catalog_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog_Vote]    Script Date: 2015/11/23 0:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](100) NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
	[ArticleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Catalog_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Common_ActivityLog]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Common_ActivityLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityLogTypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Common_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Common_ActivityLogType]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Common_ActivityLogType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemKeyword] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Common_ActivityLogType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Common_Log]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Common_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogLevelId] [int] NOT NULL,
	[ShortMessage] [nvarchar](max) NOT NULL,
	[FullMessage] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](200) NULL,
	[UserId] [int] NULL,
	[PageUrl] [nvarchar](max) NULL,
	[ReferrerUrl] [nvarchar](max) NULL,
	[CreatedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Common_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration_EmailAccount]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_EmailAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Host] [nvarchar](200) NOT NULL,
	[Port] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[EnableSsl] [bit] NOT NULL,
	[UseDefaultCredentials] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Configuration_EmailAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration_QueuedEmail]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_QueuedEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [int] NOT NULL,
	[From] [nvarchar](200) NULL,
	[FromName] [nvarchar](200) NULL,
	[To] [nvarchar](200) NOT NULL,
	[ToName] [nvarchar](200) NULL,
	[ReplyTo] [nvarchar](200) NULL,
	[ReplyToName] [nvarchar](200) NULL,
	[CC] [nvarchar](200) NULL,
	[Bcc] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Body] [nvarchar](max) NULL,
	[AttachmentFilePath] [nvarchar](500) NULL,
	[AttachmentFileName] [nvarchar](500) NULL,
	[CreatedOnDate] [datetime] NOT NULL,
	[SentTries] [int] NOT NULL,
	[SentOnDate] [datetime] NULL,
	[EmailAccountId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Configuration_QueuedEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration_ScheduleTask]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_ScheduleTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Seconds] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[StopOnError] [bit] NOT NULL,
	[LastStartDate] [datetime] NULL,
	[LastEndDate] [datetime] NULL,
	[LastSuccessDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Configuration_ScheduleTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration_Setting]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_dbo.Configuration_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media_Picture]    Script Date: 2015/11/23 0:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media_Picture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MimeType] [nvarchar](40) NOT NULL,
	[SeoFilename] [nvarchar](300) NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Media_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Authen_Permission] ON 

INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (1, 0, N'网站管理', N'Admin', NULL, NULL, N'fa-adjust', 1, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (2, 1, N'角色管理', N'Admin', N'Role', N'List', N'fa-anchor', 1, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (3, 1, N'用户管理', N'Admin', N'User', N'List', N'fa-anchor', 2, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (4, 1, N'访问控制', N'Admin', N'Permission', N'Access', NULL, 4, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (5, 0, N'内容管理', NULL, NULL, NULL, N'', 2, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (6, 5, N'类别管理', N'Admin', N'Category', N'List', N'', 1, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (7, 5, N'文章管理', N'Admin', N'Article', N'List', N'fa-asterisk', 3, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (8, 5, N'标签管理', N'Admin', N'Tag', N'List', NULL, 2, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (9, 1, N'权限管理', N'Admin', N'Permission', N'List', NULL, 3, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (10, 0, N'设置管理', N'Admin', NULL, NULL, NULL, 4, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (11, 10, N'综合设置', N'Admin', N'Setting', N'GeneralCommon', NULL, 1, 1, 0)
INSERT [dbo].[Authen_Permission] ([Id], [ParentId], [Name], [Area], [Controller], [Action], [Icon], [DisplayOrder], [Active], [Deleted]) VALUES (12, 10, N'文章设置', N'Admin', N'Setting', N'Article', NULL, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[Authen_Permission] OFF
SET IDENTITY_INSERT [dbo].[Authen_Role] ON 

INSERT [dbo].[Authen_Role] ([Id], [Name], [Active], [IsSystemRole], [SystemName]) VALUES (1, N'注册会员', 1, 0, N'Member')
INSERT [dbo].[Authen_Role] ([Id], [Name], [Active], [IsSystemRole], [SystemName]) VALUES (2, N'超级管理员', 1, 1, N'SupperManager')
SET IDENTITY_INSERT [dbo].[Authen_Role] OFF
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (2, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (4, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (5, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (6, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (7, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (8, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (9, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (10, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (11, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (12, 1)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (5, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (6, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (7, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (8, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (9, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (10, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (11, 2)
INSERT [dbo].[Authen_RolePermission_Mapping] ([PermissionId], [RoleId]) VALUES (12, 2)
SET IDENTITY_INSERT [dbo].[Authen_User] ON 

INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (1, N'admin', N'admin@qq.com', N'PGAKUiaO3yxdC+CffInjHw==', N'13726280898', 1, 0, CAST(0x0000A47300D28AEE AS DateTime), CAST(0x0000A47300D28AEE AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (2, N'test', N'test@qq.com', N'XhfFsiU4SMKsLo84B49Cvg==', N'13726280898', 1, 0, CAST(0x0000A47300D28AEE AS DateTime), CAST(0x0000A47300D28AEE AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (3, N'123', N'123@qq.com', N'A3msIDOikcc=', N'123456', 0, 1, CAST(0x0000A47601220129 AS DateTime), CAST(0x0000A47601220129 AS DateTime), NULL, NULL, CAST(0x0000A47601220129 AS DateTime))
INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (4, N'admin1', N'admin', N'w1Isw8UkIDyyff+KqOGmVQ==', N'123456', 0, 1, CAST(0x0000A476014419FA AS DateTime), CAST(0x0000A476014419FA AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (5, N'admin2', N'1234@qq.com', N'w1Isw8UkIDyyff+KqOGmVQ==', N'12345', 1, 0, CAST(0x0000A4760145B5A3 AS DateTime), CAST(0x0000A4760145B5A3 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Authen_User] ([Id], [UserName], [Email], [Password], [Phone], [Active], [Deleted], [RegisterDate], [UpdateDate], [LastIpAddress], [LastLoginDate], [LastActivityDate]) VALUES (6, N'admin3', N'admin3@qq.com', N'A3msIDOikcc=', N'123', 1, 0, CAST(0x0000A4760145DD81 AS DateTime), CAST(0x0000A476014A6A63 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Authen_User] OFF
INSERT [dbo].[Authen_UserRole_Mapping] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[Authen_UserRole_Mapping] ([UserId], [RoleId]) VALUES (6, 1)
INSERT [dbo].[Authen_UserRole_Mapping] ([UserId], [RoleId]) VALUES (6, 2)
SET IDENTITY_INSERT [dbo].[Catalog_Article] ON 

INSERT [dbo].[Catalog_Article] ([Id], [Title], [ShortDescription], [FullDescription], [MetaKeywords], [MetaDescription], [MetaTitle], [PictureId], [Views], [CommentCount], [Favor], [Hate], [AllowComment], [ShowOnTop], [Published], [Deleted], [CreateDate], [UpdateDate], [CategoryId]) VALUES (1, N'同步推安卓版v1.2：最新游戏礼包、评测攻略，统统到碗里来', N'最新手游礼包、最全手游攻略，游戏世界畅玩到底。', N'<p>时隔近一个季度，新的同步推安卓版终于和大家见面了！此次更新，我们不仅在界面风格上有做重大调整，更是在内容上不断进行充实，同时，礼包的加入更是众多游戏玩家的一个天外福音！同步推安卓版v1.2，将游戏世界畅玩到底！</p>', NULL, NULL, NULL, 0, 24, 0, 0, 0, 0, 1, 1, 0, CAST(0x0000A4760179E716 AS DateTime), CAST(0x0000A47D00C706C0 AS DateTime), 1)
INSERT [dbo].[Catalog_Article] ([Id], [Title], [ShortDescription], [FullDescription], [MetaKeywords], [MetaDescription], [MetaTitle], [PictureId], [Views], [CommentCount], [Favor], [Hate], [AllowComment], [ShowOnTop], [Published], [Deleted], [CreateDate], [UpdateDate], [CategoryId]) VALUES (3, N'test', N'11111', N'<p>12312312312312</p>', NULL, NULL, NULL, 0, 28, 0, 0, 0, 0, 1, 1, 0, CAST(0x0000A47A00F8C9AF AS DateTime), CAST(0x0000A47D00C6F9ED AS DateTime), 2)
INSERT [dbo].[Catalog_Article] ([Id], [Title], [ShortDescription], [FullDescription], [MetaKeywords], [MetaDescription], [MetaTitle], [PictureId], [Views], [CommentCount], [Favor], [Hate], [AllowComment], [ShowOnTop], [Published], [Deleted], [CreateDate], [UpdateDate], [CategoryId]) VALUES (4, N'test2', N'test2', N'<p>12321</p>', NULL, NULL, NULL, 0, 11, 0, 0, 0, 0, 1, 1, 0, CAST(0x0000A47C00EE46C3 AS DateTime), CAST(0x0000A47D00C701C3 AS DateTime), 2)
INSERT [dbo].[Catalog_Article] ([Id], [Title], [ShortDescription], [FullDescription], [MetaKeywords], [MetaDescription], [MetaTitle], [PictureId], [Views], [CommentCount], [Favor], [Hate], [AllowComment], [ShowOnTop], [Published], [Deleted], [CreateDate], [UpdateDate], [CategoryId]) VALUES (5, N'test3', N'12312312312312', N'<p>123123312312</p>', NULL, NULL, NULL, 0, 7, 0, 0, 0, 0, 1, 1, 0, CAST(0x0000A47D00F51A16 AS DateTime), CAST(0x0000A47D00F51A16 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Catalog_Article] OFF
INSERT [dbo].[Catalog_ArticleTag_Mapping] ([ArticleId], [TagId]) VALUES (3, 1)
INSERT [dbo].[Catalog_ArticleTag_Mapping] ([ArticleId], [TagId]) VALUES (4, 1)
INSERT [dbo].[Catalog_ArticleTag_Mapping] ([ArticleId], [TagId]) VALUES (5, 1)
INSERT [dbo].[Catalog_ArticleTag_Mapping] ([ArticleId], [TagId]) VALUES (4, 2)
SET IDENTITY_INSERT [dbo].[Catalog_Category] ON 

INSERT [dbo].[Catalog_Category] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentId], [PictureId], [ShowOnHomePage], [IncludeInTopMenu], [Published], [DisplayOrder], [Deleted], [CreatedOnDate], [UpdatedOnDate]) VALUES (1, N'安卓新闻', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 0, CAST(0x0000A476015B3E84 AS DateTime), CAST(0x0000A47A00F383C6 AS DateTime))
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentId], [PictureId], [ShowOnHomePage], [IncludeInTopMenu], [Published], [DisplayOrder], [Deleted], [CreatedOnDate], [UpdatedOnDate]) VALUES (2, N'业界资讯', N'program development开发', NULL, NULL, NULL, 0, 0, 1, 1, 1, 2, 0, CAST(0x0000A476015BDC9B AS DateTime), CAST(0x0000A47D01125436 AS DateTime))
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentId], [PictureId], [ShowOnHomePage], [IncludeInTopMenu], [Published], [DisplayOrder], [Deleted], [CreatedOnDate], [UpdatedOnDate]) VALUES (3, N'test1', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 0, CAST(0x0000A47A00ECDE4A AS DateTime), CAST(0x0000A47A00ECE7FB AS DateTime))
SET IDENTITY_INSERT [dbo].[Catalog_Category] OFF
SET IDENTITY_INSERT [dbo].[Catalog_Tag] ON 

INSERT [dbo].[Catalog_Tag] ([Id], [Name], [Description]) VALUES (1, N'test1', NULL)
INSERT [dbo].[Catalog_Tag] ([Id], [Name], [Description]) VALUES (2, N'test2', NULL)
SET IDENTITY_INSERT [dbo].[Catalog_Tag] OFF
SET IDENTITY_INSERT [dbo].[Configuration_Setting] ON 

INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (1, N'articlesettings.articlepagesize', N'10')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (2, N'articlesettings.toparticlepagesize', N'5')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (3, N'articlesettings.hotcommentpagesize', N'5')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (4, N'articlesettings.latestcommentpagesize', N'5')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (5, N'articlesettings.commentpagesize', N'5')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (6, N'articlesettings.allowcomment', N'True')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (7, N'articlesettings.hotarticlepagesize', N'5')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (8, N'generalsettings.sitetitle', N'NextCMS')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (9, N'generalsettings.separator', N'|')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (10, N'generalsettings.metatitle', N'NextCMS Seo')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (11, N'generalsettings.metakeywords', N'NextCMS Key')
INSERT [dbo].[Configuration_Setting] ([Id], [Name], [Value]) VALUES (12, N'generalsettings.metadescription', N'NextCMS Description')
SET IDENTITY_INSERT [dbo].[Configuration_Setting] OFF
/****** Object:  Index [IX_PermissionId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_PermissionId] ON [dbo].[Authen_RolePermission_Mapping]
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[Authen_RolePermission_Mapping]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[Authen_UserRole_Mapping]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Authen_UserRole_Mapping]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Catalog_Article]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[Catalog_ArticleTag_Mapping]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TagId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_TagId] ON [dbo].[Catalog_ArticleTag_Mapping]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[Catalog_Comment]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[Catalog_Vote]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityLogTypeId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_ActivityLogTypeId] ON [dbo].[Common_ActivityLog]
(
	[ActivityLogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Common_ActivityLog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Common_Log]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailAccountId]    Script Date: 2015/11/23 0:05:03 ******/
CREATE NONCLUSTERED INDEX [IX_EmailAccountId] ON [dbo].[Configuration_QueuedEmail]
(
	[EmailAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authen_RolePermission_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authen_RolePermission_Mapping_dbo.Authen_Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Authen_Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authen_RolePermission_Mapping] CHECK CONSTRAINT [FK_dbo.Authen_RolePermission_Mapping_dbo.Authen_Permission_PermissionId]
GO
ALTER TABLE [dbo].[Authen_RolePermission_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authen_RolePermission_Mapping_dbo.Authen_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Authen_Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authen_RolePermission_Mapping] CHECK CONSTRAINT [FK_dbo.Authen_RolePermission_Mapping_dbo.Authen_Role_RoleId]
GO
ALTER TABLE [dbo].[Authen_UserRole_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authen_UserRole_Mapping_dbo.Authen_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Authen_Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authen_UserRole_Mapping] CHECK CONSTRAINT [FK_dbo.Authen_UserRole_Mapping_dbo.Authen_Role_RoleId]
GO
ALTER TABLE [dbo].[Authen_UserRole_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authen_UserRole_Mapping_dbo.Authen_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Authen_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authen_UserRole_Mapping] CHECK CONSTRAINT [FK_dbo.Authen_UserRole_Mapping_dbo.Authen_User_UserId]
GO
ALTER TABLE [dbo].[Catalog_Article]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Catalog_Article_dbo.Catalog_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Catalog_Category] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Article] CHECK CONSTRAINT [FK_dbo.Catalog_Article_dbo.Catalog_Category_CategoryId]
GO
ALTER TABLE [dbo].[Catalog_ArticleTag_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Catalog_ArticleTag_Mapping_dbo.Catalog_Article_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Catalog_Article] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog_ArticleTag_Mapping] CHECK CONSTRAINT [FK_dbo.Catalog_ArticleTag_Mapping_dbo.Catalog_Article_ArticleId]
GO
ALTER TABLE [dbo].[Catalog_ArticleTag_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Catalog_ArticleTag_Mapping_dbo.Catalog_Tag_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Catalog_Tag] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog_ArticleTag_Mapping] CHECK CONSTRAINT [FK_dbo.Catalog_ArticleTag_Mapping_dbo.Catalog_Tag_TagId]
GO
ALTER TABLE [dbo].[Catalog_Comment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Catalog_Comment_dbo.Catalog_Article_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Catalog_Article] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Comment] CHECK CONSTRAINT [FK_dbo.Catalog_Comment_dbo.Catalog_Article_ArticleId]
GO
ALTER TABLE [dbo].[Catalog_Vote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Catalog_Vote_dbo.Catalog_Article_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Catalog_Article] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Vote] CHECK CONSTRAINT [FK_dbo.Catalog_Vote_dbo.Catalog_Article_ArticleId]
GO
ALTER TABLE [dbo].[Common_ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Common_ActivityLog_dbo.Authen_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Authen_User] ([Id])
GO
ALTER TABLE [dbo].[Common_ActivityLog] CHECK CONSTRAINT [FK_dbo.Common_ActivityLog_dbo.Authen_User_UserId]
GO
ALTER TABLE [dbo].[Common_ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Common_ActivityLog_dbo.Common_ActivityLogType_ActivityLogTypeId] FOREIGN KEY([ActivityLogTypeId])
REFERENCES [dbo].[Common_ActivityLogType] ([Id])
GO
ALTER TABLE [dbo].[Common_ActivityLog] CHECK CONSTRAINT [FK_dbo.Common_ActivityLog_dbo.Common_ActivityLogType_ActivityLogTypeId]
GO
ALTER TABLE [dbo].[Common_Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Common_Log_dbo.Authen_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Authen_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Common_Log] CHECK CONSTRAINT [FK_dbo.Common_Log_dbo.Authen_User_UserId]
GO
ALTER TABLE [dbo].[Configuration_QueuedEmail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Configuration_QueuedEmail_dbo.Configuration_EmailAccount_EmailAccountId] FOREIGN KEY([EmailAccountId])
REFERENCES [dbo].[Configuration_EmailAccount] ([Id])
GO
ALTER TABLE [dbo].[Configuration_QueuedEmail] CHECK CONSTRAINT [FK_dbo.Configuration_QueuedEmail_dbo.Configuration_EmailAccount_EmailAccountId]
GO
USE [master]
GO
ALTER DATABASE [NextCMS] SET  READ_WRITE 
GO
