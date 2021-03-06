USE [master]
GO
/****** Object:  Database [Livescreen]    Script Date: 10/15/2014 00:32:29 ******/
CREATE DATABASE [Livescreen] ON  PRIMARY 
( NAME = N'Livescreenz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Livescreen.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Livescreenz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Livescreen.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Livescreen] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Livescreen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Livescreen] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Livescreen] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Livescreen] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Livescreen] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Livescreen] SET ARITHABORT OFF
GO
ALTER DATABASE [Livescreen] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Livescreen] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Livescreen] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Livescreen] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Livescreen] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Livescreen] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Livescreen] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Livescreen] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Livescreen] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Livescreen] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Livescreen] SET  DISABLE_BROKER
GO
ALTER DATABASE [Livescreen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Livescreen] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Livescreen] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Livescreen] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Livescreen] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Livescreen] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Livescreen] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Livescreen] SET  READ_WRITE
GO
ALTER DATABASE [Livescreen] SET RECOVERY FULL
GO
ALTER DATABASE [Livescreen] SET  MULTI_USER
GO
ALTER DATABASE [Livescreen] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Livescreen] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Livescreen', N'ON'
GO
USE [Livescreen]
GO
/****** Object:  Table [dbo].[Ip_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ip_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userPhno] [nvarchar](50) NULL,
	[userIp] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ip_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ip_tbl] ON
INSERT [dbo].[Ip_tbl] ([id], [userPhno], [userIp]) VALUES (1, N'9656761101', N'192.168.1.4')
SET IDENTITY_INSERT [dbo].[Ip_tbl] OFF
/****** Object:  Table [dbo].[FileShare]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileShare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](150) NULL,
	[userPhone] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[seen] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FileShare] ON
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (5, N'~/UpImages/DSCF0016.JPG', N'9656761101', CAST(0xFD380B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (6, N'~/UpImages/DSCF0024.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (7, N'~/UpImages/DSCF0009.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (8, N'~/UpImages/DSCF0010.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (9, N'~/UpImages/DSCF0012.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (10, N'~/UpImages/DSCF0031.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
INSERT [dbo].[FileShare] ([Id], [FilePath], [userPhone], [Date], [seen]) VALUES (11, N'~/UpImages/DSCF0008.JPG', N'9656761101', CAST(0x1B390B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[FileShare] OFF
/****** Object:  Table [dbo].[chat_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userphn] [nvarchar](50) NULL,
	[clientip] [nvarchar](50) NULL,
	[message] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[roomId] [int] NULL,
 CONSTRAINT [PK_chat_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chat_tbl] ON
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (11, N'9656761101', NULL, N'podaa', NULL, 11)
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (12, N'9656761101', NULL, N'jhgg', NULL, 12)
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (13, N'9656761101', NULL, N'jhgg', NULL, 12)
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (14, N'9656761101', NULL, N'jhgg', NULL, 12)
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (15, N'9656761101', NULL, N'jhgg', NULL, 12)
INSERT [dbo].[chat_tbl] ([id], [userphn], [clientip], [message], [status], [roomId]) VALUES (16, N'9656761101', NULL, N'jhgg', NULL, 12)
SET IDENTITY_INSERT [dbo].[chat_tbl] OFF
/****** Object:  Table [dbo].[Chat_RoomTbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat_RoomTbl](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[senderId] [nvarchar](50) NULL,
	[ReciverId] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chat_RoomTbl] ON
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (1, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (2, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (3, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (4, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (5, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (6, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (7, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (8, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (9, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (10, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (11, N'Admin', N'9656761101', N'Open')
INSERT [dbo].[Chat_RoomTbl] ([room_id], [senderId], [ReciverId], [Status]) VALUES (12, N'Admin', N'9656761101', N'Open')
SET IDENTITY_INSERT [dbo].[Chat_RoomTbl] OFF
/****** Object:  Table [dbo].[superadmin_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[superadmin_tbl](
	[id] [int] NOT NULL,
	[username] [nchar](50) NULL,
	[password] [nchar](50) NULL,
	[email] [nchar](50) NULL,
 CONSTRAINT [PK_superadmin_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sms_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sms_tbl](
	[id] [int] NOT NULL,
	[sender] [nchar](10) NULL,
	[status] [nchar](10) NULL,
	[mode] [nvarchar](50) NULL,
 CONSTRAINT [PK_sms_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[screenz]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[screenz](
	[id] [int] NOT NULL,
	[userphn] [nvarchar](50) NULL,
	[userip] [nvarchar](50) NULL,
	[screenshot] [nvarchar](250) NULL,
 CONSTRAINT [PK_screenz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_tbl](
	[username] [nvarchar](50) NOT NULL,
	[password] [nchar](10) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login_tbl] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Login_tbl] ([username], [password], [status]) VALUES (N'9656761101', N'1         ', N'Online')
INSERT [dbo].[Login_tbl] ([username], [password], [status]) VALUES (N'9656761111', N'2         ', N'Online')
/****** Object:  Table [dbo].[Task_tbl]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_tbl](
	[taskId] [int] IDENTITY(1,1) NOT NULL,
	[action] [int] NULL,
	[status] [int] NULL,
	[phoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Task_tbl] PRIMARY KEY CLUSTERED 
(
	[taskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Task_tbl] ON
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (1, 5, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (2, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (3, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (4, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (5, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (6, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (7, 7, 1, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (8, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (9, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (10, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (11, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (12, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (13, 6, 0, N'9656761111')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (14, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (15, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (16, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (17, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (18, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (19, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (20, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (21, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (22, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (23, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (24, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (25, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (26, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (27, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (28, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (29, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (30, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (31, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (32, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (33, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (34, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (35, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (36, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (37, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (38, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (39, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (40, 6, 0, N'9656761101')
INSERT [dbo].[Task_tbl] ([taskId], [action], [status], [phoneNumber]) VALUES (41, 6, 0, N'9656761101')
SET IDENTITY_INSERT [dbo].[Task_tbl] OFF
/****** Object:  Table [dbo].[Livescreenz]    Script Date: 10/15/2014 00:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livescreenz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[emailid] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Livescreenz_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Livescreenz] ON
INSERT [dbo].[Livescreenz] ([id], [name], [emailid], [phonenumber], [password]) VALUES (4, N'sumith', N'snairsumith@gmail.com', N'9656761101', N'1')
SET IDENTITY_INSERT [dbo].[Livescreenz] OFF
/****** Object:  Default [DF_FileShare_seen]    Script Date: 10/15/2014 00:32:32 ******/
ALTER TABLE [dbo].[FileShare] ADD  CONSTRAINT [DF_FileShare_seen]  DEFAULT ((0)) FOR [seen]
GO
/****** Object:  Default [DF_Login_tbl_status]    Script Date: 10/15/2014 00:32:32 ******/
ALTER TABLE [dbo].[Login_tbl] ADD  CONSTRAINT [DF_Login_tbl_status]  DEFAULT (N'Ofline') FOR [status]
GO
/****** Object:  ForeignKey [FK_Task_tbl_Login_tbl]    Script Date: 10/15/2014 00:32:32 ******/
ALTER TABLE [dbo].[Task_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Task_tbl_Login_tbl] FOREIGN KEY([phoneNumber])
REFERENCES [dbo].[Login_tbl] ([username])
GO
ALTER TABLE [dbo].[Task_tbl] CHECK CONSTRAINT [FK_Task_tbl_Login_tbl]
GO
/****** Object:  ForeignKey [FK_Livescreenz_Login_tbl]    Script Date: 10/15/2014 00:32:32 ******/
ALTER TABLE [dbo].[Livescreenz]  WITH CHECK ADD  CONSTRAINT [FK_Livescreenz_Login_tbl] FOREIGN KEY([phonenumber])
REFERENCES [dbo].[Login_tbl] ([username])
GO
ALTER TABLE [dbo].[Livescreenz] CHECK CONSTRAINT [FK_Livescreenz_Login_tbl]
GO
