USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FinalProject.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/12/2017 2:38:21 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/12/2017 2:38:21 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/12/2017 2:38:21 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/12/2017 2:38:21 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/12/2017 2:38:21 PM ******/
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
	[StreetAddress] [nvarchar](max) NULL,
	[AboutMe] [nvarchar](300) NULL,
	[NumTimesHelped] [int] NULL,
	[Testimonial] [nvarchar](300) NULL,
	[ProfilePhoto] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/12/2017 2:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageContent] [nvarchar](300) NULL,
	[TimeStamp] [datetime] NOT NULL,
	[TaskID] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task2]    Script Date: 12/12/2017 2:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task2](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[TaskDescription] [nvarchar](300) NOT NULL,
	[TaskTitle] [nvarchar](100) NOT NULL,
	[IsDone] [bit] NULL CONSTRAINT [DF_Task2_IsDone]  DEFAULT ((0)),
	[TimeStamp] [datetime] NOT NULL,
	[IsAssigned] [bit] NULL CONSTRAINT [DF_Task2_IsAssigned]  DEFAULT ((0)),
	[HelpProviderID] [nvarchar](128) NULL,
	[TaskCreatorID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Task2] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'5a5f063f-f391-49cd-89db-db180395d835', N'fnorris@domain3.com', 0, N'AGJW9aGxQpcgq4Qug2o03Q2SB92+kGWP9qHUZ8WprGWWuY0YnEqBkAZEAP3n1t9Gdw==', N'fa85f8f4-5c8c-4ac1-ab3f-7c91a58ff23b', NULL, 0, 0, NULL, 1, 0, N'Fred Norris', N'3023 Somerton Road, Cleveland Heights, OH, 44118 ', NULL, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'5dcf2e3e-64e0-476a-a280-43e0e5c3b302', N'sallyw@domain2.com', 0, N'AAtSPoFELuizO/xB4S7N5UI7YA6nJ4cyXqoCtFB7QYwLVuKTlccbe+InMGZ3OzM7YA==', N'ca3b06ec-0175-4447-8cf4-27bea70824e1', NULL, 0, 0, NULL, 1, 0, N'Sally Weston', N'3060 Somerton Road, Cleveland, OH, 44118', NULL, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'65232c8e-2847-4d05-ae8c-6e22fb0f3219', N'hjones@domain1.com', 0, N'AEZxAW3QYtHkZZ8BIDXuh8JnqPYTf4Tg2gdpzIxpLYGqyWc9WImppH4TONAoY7rsBw==', N'8c9f9872-0dd6-4b61-ad6c-8e86d4bee741', NULL, 0, 0, NULL, 1, 0, N'Henry Jones', N'3051 Euclid Heights Boulevard, Cleveland Heights, OH, 44118', NULL, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'6bd43c6e-6f14-4a78-86bb-a32124ea5253', N'bonrob@domain6.com', 0, N'ABlCzGRK13a14t+cy40DL6m4uYWkoXB0lWdmR/p1C1j25qEkdRzBl6VVy/pbhiQ2NA==', N'cdea8cbf-3182-4b54-8b68-f98a54214adc', NULL, 0, 0, NULL, 1, 0, N'Bonnie Roberts', N'3003 Lincoln Boulevard, Cleveland Heights, OH, 44118', NULL, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'711d6053-1595-458e-a16c-369b5e9e3a09', N'jwheels@domain4.com', 0, N'AMjCZAHl5Yj3fsGGgut6MJlbFr6PHBkeIL+mw5RPoLz8HlQaXL8VTq3kRCQoEBcApw==', N'13e210c0-b44b-489d-9543-3ed7c0602eeb', NULL, 0, 0, NULL, 1, 0, N'Jeanette Wheeler', N'2976 Lincoln Boulevard, Clevelan Heights, OH, 44118', NULL, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [StreetAddress], [AboutMe], [NumTimesHelped], [Testimonial], [ProfilePhoto]) VALUES (N'938ea6ad-cde4-4d53-86bb-6fc12d7ebb92', N'earlB@domain5.com', 0, N'ANJGFRVXyYpZYU+fZXvr79r8Cp9K0z0MrS7y5TvJn5usUTGUuHNb4pnojBs0WMpPaQ==', N'e10e3911-879f-442f-895c-7781467c4b0b', NULL, 0, 0, NULL, 1, 0, N'Earl Butler', N'1898 Woodward Avenue, Cleveland Heights, OH, 44118', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Task2] ON 

INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (9, N'Need help hanging balloons and setting up chairs.  The party is Saturday afternoon.  Looking to setup Saturday morning at 10.', N'Party Decorations', 0, CAST(N'2017-12-12 10:37:28.403' AS DateTime), 0, NULL, N'65232c8e-2847-4d05-ae8c-6e22fb0f3219')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (10, N'I would like my garage power washed before winter.  I have moved items to the shed and can provide a power washer, but need an experienced user.  I am looking for help either Saturday or Sunday morning at 7.  Thank you.', N'Garage Wash', 0, CAST(N'2017-12-12 10:46:58.737' AS DateTime), 0, NULL, N'5dcf2e3e-64e0-476a-a280-43e0e5c3b302')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (11, N'Hello.  I have a long driveway and front walk way and I would like to have assistance removing snow this winter.  I have a snow blower and different shovels.  I do not have specified times to help, other than when I am removing the snow.  Happy Winter to All.', N'Snow Removal', 0, CAST(N'2017-12-12 10:52:04.043' AS DateTime), 0, NULL, N'5a5f063f-f391-49cd-89db-db180395d835')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (13, N'Hi.  I am looking to prepare my winter vehicle for use and I have a flat tire.  The tire can be changed where it is parked.  Please have a car jack, mine is not reliable.  I am looking for immediate assistance either on the weekend or after 5 during the week.', N'Flat Tire', 0, CAST(N'2017-12-12 11:08:41.117' AS DateTime), 0, NULL, N'711d6053-1595-458e-a16c-369b5e9e3a09')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (14, N'I would like to hang some holiday lights, but I am not tall enough.  If you have a ladder that would be great.  I do not have many lights and can provide hanging supplies.  Looking for help this week after 4:30 PM.  Also looking for the lights to be removed the weekend of January 6th.', N'Holiday Decorations', 0, CAST(N'2017-12-12 11:15:54.967' AS DateTime), 0, NULL, N'6bd43c6e-6f14-4a78-86bb-a32124ea5253')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (15, N'I have 2 or 3 tree branches I would like to cut before heavy snow falls.  I have the equipment, but would like someone to hold the ladder as I climb.  You are welcome to have the branches.  I am looking for assistance Friday afternoon, we can set details through messaging.', N'Branch Removal', 0, CAST(N'2017-12-12 11:21:04.307' AS DateTime), 0, NULL, N'938ea6ad-cde4-4d53-86bb-6fc12d7ebb92')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (16, N'Hi.  I am looking for some assistance organizing my garage.  There are bicycles that need to be hung and tool boxes moved.  There is not a much heavy lifting.  I am looking for help this Saturday morning after 8.', N'Garage Organization', 0, CAST(N'2017-12-12 11:30:16.540' AS DateTime), 0, NULL, N'938ea6ad-cde4-4d53-86bb-6fc12d7ebb92')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (17, N'Greetings.  A billiards table is being delivered 12/23 and I would like help moving into the house and assembling.  I have the tools, just need more hands.  Planning for noon on the 23rd.  Message with details.', N'Billiards Table', 0, CAST(N'2017-12-12 13:11:54.817' AS DateTime), 0, NULL, N'5a5f063f-f391-49cd-89db-db180395d835')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (18, N'Hi, I would like assistance with my storm windows.  They are already installed, but some of them stick when pulling in place; roughly 15 windows.  I am seeking assistance ASAP.  We can coordinate with messages.', N'Storm Windows', 0, CAST(N'2017-12-12 13:18:15.903' AS DateTime), 0, NULL, N'5dcf2e3e-64e0-476a-a280-43e0e5c3b302')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (19, N'Between Christmas and New Year''s Eve I want to remove carpet from a spare bedroom.  2nd story room.  Planning to begin 12/26 at 8 AM.', N'Carpet Removal', 0, CAST(N'2017-12-12 13:52:51.693' AS DateTime), 0, NULL, N'65232c8e-2847-4d05-ae8c-6e22fb0f3219')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (21, N'I have a Nest thermostat, but not familiar with programming or connecting to other devices.  Seeking assistance in the next few days.  Can message to confirm date/time. ', N'Nest Thermostat', 0, CAST(N'2017-12-12 14:02:43.053' AS DateTime), 0, NULL, N'711d6053-1595-458e-a16c-369b5e9e3a09')
INSERT [dbo].[Task2] ([TaskID], [TaskDescription], [TaskTitle], [IsDone], [TimeStamp], [IsAssigned], [HelpProviderID], [TaskCreatorID]) VALUES (22, N'Old fridge in patio room.  I am not able to move and do not have a hand truck.  The fridge works and the helper can be the new owner.  Want to complete by 12/23.', N'Fridge Removal', 0, CAST(N'2017-12-12 14:06:40.300' AS DateTime), 0, NULL, N'6bd43c6e-6f14-4a78-86bb-a32124ea5253')
SET IDENTITY_INSERT [dbo].[Task2] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/12/2017 2:38:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
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
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Task2] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task2] ([TaskID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Task2]
GO
ALTER TABLE [dbo].[Task2]  WITH CHECK ADD  CONSTRAINT [FK_Task2_AspNetUsers] FOREIGN KEY([TaskCreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Task2] CHECK CONSTRAINT [FK_Task2_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
