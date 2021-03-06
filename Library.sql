USE [master]
GO
/****** Object:  Database [Library]    Script Date: 06/09/2018 22:27:20 ******/
CREATE DATABASE [Library] ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Library] SET ARITHABORT OFF
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Library] SET  READ_WRITE
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Library] SET  MULTI_USER
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'信息工程学院')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'园林学院')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'理学院')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (4, N'艺设学院')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (5, N'英语系')
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  Table [dbo].[Class]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Class] ON
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (1, N'计算机151')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (2, N'计算机152')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (3, N'计算机153')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (4, N'物联网151')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (5, N'电子151')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (6, N'信管151')
SET IDENTITY_INSERT [dbo].[Class] OFF
/****** Object:  Table [dbo].[BookType]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookType](
	[BookTypeId] [int] IDENTITY(1,1) NOT NULL,
	[BookTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookType] ON
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (1, N'计算机软件')
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (2, N'计算机硬件')
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (3, N'文学')
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (4, N'化学')
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (5, N'数学')
INSERT [dbo].[BookType] ([BookTypeId], [BookTypeName]) VALUES (6, N'天文')
SET IDENTITY_INSERT [dbo].[BookType] OFF
/****** Object:  Table [dbo].[BookInfo]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookInfo](
	[BookId] [nvarchar](50) NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[Author] [nvarchar](50) NULL,
	[PinYinCode] [nvarchar](50) NULL,
	[Translator] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[BookNumber] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[Layout] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ISBN] [nvarchar](50) NULL,
	[Versions] [nvarchar](50) NULL,
	[BookRemark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000001', N'计算机网络', CAST(0x0000A8FA00B4AB77 AS DateTime), 1, N'谢希仁', N'JSJWL', N'佚名', N'中文', N'24', N'32', N'精装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000002', N'汇编语言', CAST(0x0000A8FA00B4AB77 AS DateTime), 2, N'张三', N'HBYY', N'佚名', N'中文', N'57', N'24', N'精装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000003', N'第一行代码Android', CAST(0x0000A8FA00B4AB77 AS DateTime), 3, N'李四', N'DYHDM', N'佚名', N'中文', N'25', N'15', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000004', N'数据结构', CAST(0x0000A8FA00B4AB77 AS DateTime), 4, N'王五', N'SJJG', N'佚名', N'中文', N'47', N'7', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000005', N'计算机组成原理', CAST(0x0000A8FA00B4AB77 AS DateTime), 5, N'赵六', N'JSJZCYL', N'佚名', N'中文', N'24', N'57', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000006', N'JSP实用教程', CAST(0x0000A8FA00B4AB77 AS DateTime), 6, N'张大三', N'JSPSYJC', N'佚名', N'中文', N'67', N'24', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000007', N'Linux操作系统', CAST(0x0000A8FA00B4AB77 AS DateTime), 1, N'李达斯', N'LINUXCZXT', N'佚名', N'中文', N'85', N'96', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000008', N'C程序设计', CAST(0x0000A8FA00B4AB77 AS DateTime), 2, N'王大武', N'CCXSJ', N'佚名', N'中文', N'45', N'32', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000009', N'Socket编程', CAST(0x0000A8FA00B4AB77 AS DateTime), 3, N'赵大柳', N'SOCKETBC', N'佚名', N'中文', N'46', N'85', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000010', N'微机技术', CAST(0x0000A8FA00B4AB77 AS DateTime), 4, N'张小三', N'WJJS', N'佚名', N'中文', N'78', N'72', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000011', N'数据库系统', CAST(0x0000A8FA00B4AB77 AS DateTime), 5, N'李小四', N'SJKXT', N'佚名', N'中文', N'757', N'27', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000012', N'数字图像处理', CAST(0x0000A8FA00B4AB77 AS DateTime), 6, N'王小五', N'SZTXCL', N'佚名', N'中文', N'89', N'62', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000013', N'软件工程导论', CAST(0x0000A8FA00B4AB77 AS DateTime), 1, N'赵小刘', N'RJGCDL', N'佚名', N'中文', N'124', N'27', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000014', N'计算机图形学', CAST(0x0000A8FA00B4AB77 AS DateTime), 2, N'张大鹏', N'JSJTXX', N'佚名', N'中文', N'77', N'18', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000015', N'软件测试教程', CAST(0x0000A8FA00B4AB77 AS DateTime), 3, N'李大炮', N'RJCSJC', N'佚名', N'中文', N'245', N'31', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000016', N'面向对象', CAST(0x0000A8FA00B4AB77 AS DateTime), 4, N'王大狗', N'MXDX', N'佚名', N'中文', N'24', N'51', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000017', N'单片机原理', CAST(0x0000A8FA00B4AB77 AS DateTime), 5, N'许大熊', N'DPJYL', N'佚名', N'中文', N'75', N'54', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000018', N'.net程序设计', CAST(0x0000A8FA00B4AB77 AS DateTime), 6, N'吴二鸟', N'DNETCXSJ', N'佚名', N'中文', N'27', N'36', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000019', N'计算机操作系统', CAST(0x0000A8FA00B4AB77 AS DateTime), 1, N'朱云鹏', N'JSJCZXT', N'佚名', N'中文', N'27', N'37', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
INSERT [dbo].[BookInfo] ([BookId], [BookName], [TimeIn], [BookTypeId], [Author], [PinYinCode], [Translator], [Language], [BookNumber], [Price], [Layout], [Address], [ISBN], [Versions], [BookRemark]) VALUES (N'ZAFU-00000020', N'深入剖析ARM', CAST(0x0000A8FA00B4AB77 AS DateTime), 2, N'厉凌峰', N'SRPXARM', N'佚名', N'中文', N'754', N'84', N'简装版', N'中国', N'978-7-302-38599-8', N'1.0', N'无')
/****** Object:  Table [dbo].[Admin]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[LoginId] [nvarchar](50) NOT NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
	[LoginType] [nvarchar](50) NOT NULL,
	[LoginRemark] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([LoginId], [LoginPwd], [LoginType], [LoginRemark]) VALUES (N'123456', N'123456', N'管理员', N'123456')
INSERT [dbo].[Admin] ([LoginId], [LoginPwd], [LoginType], [LoginRemark]) VALUES (N'aaaaaa', N'aaaaaa', N'管理员', N'')
INSERT [dbo].[Admin] ([LoginId], [LoginPwd], [LoginType], [LoginRemark]) VALUES (N'admin', N'admin', N'超管', N'不能删除')
/****** Object:  Table [dbo].[ReaderType]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReaderType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReaderType] ON
INSERT [dbo].[ReaderType] ([UserTypeId], [UserTypeName]) VALUES (1, N'老师')
INSERT [dbo].[ReaderType] ([UserTypeId], [UserTypeName]) VALUES (2, N'其他')
INSERT [dbo].[ReaderType] ([UserTypeId], [UserTypeName]) VALUES (3, N'学生')
INSERT [dbo].[ReaderType] ([UserTypeId], [UserTypeName]) VALUES (4, N'员工')
SET IDENTITY_INSERT [dbo].[ReaderType] OFF
/****** Object:  Table [dbo].[Reader]    Script Date: 06/09/2018 22:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[UserId] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[TimeOut] [datetime] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[DepartmentId] [int] NULL,
	[ClassId] [int] NULL,
	[IdentityCard] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[UserRemark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000001', N'厉凌峰', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 1, 1, 1, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'a1', N'小天才')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000002', N'朱钏', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 2, 2, 2, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'a1', N'小机灵鬼')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000003', N'寿肖飞', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 3, 3, 3, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'a1', N'小睿智')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000004', N'张英杰', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 4, 4, 4, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'a1', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000005', N'凌立峰', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 1, 5, 5, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'c2', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000006', N'朱召', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 2, 1, 6, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'c2', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000007', N'朱烈', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 3, 2, 1, N'330424199701230024', N'女', N'455808519', N'18058431855', N'455808519@qq.com', N'c2', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000008', N'朱迅', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 4, 3, 2, N'330424199701230024', N'女', N'455808519', N'18058431855', N'455808519@qq.com', N'c2', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000009', N'王俊凯', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 1, 4, 3, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'b3', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000010', N'王源', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 2, 5, 4, N'330424199701230024', N'女', N'455808519', N'18058431855', N'455808519@qq.com', N'b3', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000011', N'易烊千玺', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 3, 1, 5, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'b3', N'无')
INSERT [dbo].[Reader] ([UserId], [UserName], [TimeIn], [TimeOut], [UserTypeId], [DepartmentId], [ClassId], [IdentityCard], [Gender], [QQ], [Phone], [Email], [Address], [UserRemark]) VALUES (N'STU-00000012', N'范冰冰', CAST(0x0000A50700F098EA AS DateTime), CAST(0x0000A8F300F098EA AS DateTime), 4, 2, 6, N'330424199701230024', N'男', N'455808519', N'18058431855', N'455808519@qq.com', N'b3', N'无')
/****** Object:  StoredProcedure [dbo].[proc_addDepartment]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_addDepartment]
	@DepartmentId int output,
	@DepartmentName nvarchar(50)
as
	insert into Department select @DepartmentName
	set @DepartmentId=@@IDENTITY
	
	return 0;
GO
/****** Object:  StoredProcedure [dbo].[proc_addClass]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_addClass]
	@ClassId int output,
	@ClassName nvarchar(50)
as
	insert into Class select @ClassName
	set @ClassId=@@IDENTITY
	
	return 0;
GO
/****** Object:  StoredProcedure [dbo].[proc_AddBookTypeInfo]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_AddBookTypeInfo]
	@BookTypeId int output,
	@BookTypeName nvarchar(50)
as
	insert into BookType select @BookTypeName
	set @BookTypeId=@@IDENTITY
	return 0
GO
/****** Object:  StoredProcedure [dbo].[proc_addReaderType]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_addReaderType]
	@ReaderTypeId int output,
	@ReaderTypeName nvarchar(50)
as
	insert into ReaderType select @ReaderTypeName
	set @ReaderTypeId=@@IDENTITY
	
	return 0;
GO
/****** Object:  StoredProcedure [dbo].[proc_AddReader]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_AddReader]
	@ReaderId nvarchar(50),
	@ReaderName nvarchar(50),
	@TimeIn datetime,
	@TimeOut datetime,
	@ReaderTypeId int,
	@DepartmentId int,
	@ClassId int,
	@IdentityCard nvarchar(50),
	@Gender nvarchar(50),
	@Special nvarchar(50),
	@Phone nvarchar(50),
	@Email nvarchar(50),
	@Address nvarchar(50),
	@ReaderRemark nvarchar(50)
as
	insert into Reader select @ReaderId,@ReaderName,@TimeIn,@TimeOut,@ReaderTypeId,@DepartmentId,
				@ClassId,@IdentityCard,@Gender,@Special,@Phone,@Email,@Address,@ReaderRemark
	return 0;
GO
/****** Object:  Table [dbo].[BorrowReturn]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowReturn](
	[BorrowId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[BorrowTime] [datetime] NOT NULL,
	[ReturnTime] [datetime] NOT NULL,
	[FactReturnTime] [datetime] NULL,
	[Fine] [decimal](18, 0) NOT NULL,
	[RenewCount] [int] NOT NULL,
	[BorrowRemark] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BorrowReturn] ON
INSERT [dbo].[BorrowReturn] ([BorrowId], [BookId], [UserId], [BorrowTime], [ReturnTime], [FactReturnTime], [Fine], [RenewCount], [BorrowRemark]) VALUES (1, N'ZAFU-00000002', N'STU-00000001', CAST(0x0000A8FA016098AC AS DateTime), CAST(0x0000A956016098AC AS DateTime), NULL, CAST(0 AS Decimal(18, 0)), 0, N'')
INSERT [dbo].[BorrowReturn] ([BorrowId], [BookId], [UserId], [BorrowTime], [ReturnTime], [FactReturnTime], [Fine], [RenewCount], [BorrowRemark]) VALUES (2, N'ZAFU-00000009', N'STU-00000001', CAST(0x0000A8FA01626735 AS DateTime), CAST(0x0000A95601626735 AS DateTime), NULL, CAST(0 AS Decimal(18, 0)), 0, N'')
INSERT [dbo].[BorrowReturn] ([BorrowId], [BookId], [UserId], [BorrowTime], [ReturnTime], [FactReturnTime], [Fine], [RenewCount], [BorrowRemark]) VALUES (3, N'ZAFU-00000012', N'STU-00000002', CAST(0x0000A8FA0163861E AS DateTime), CAST(0x0000A9B10163861E AS DateTime), NULL, CAST(0 AS Decimal(18, 0)), 1, N'')
SET IDENTITY_INSERT [dbo].[BorrowReturn] OFF
/****** Object:  StoredProcedure [dbo].[proc_BorrowBook]    Script Date: 06/09/2018 22:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_BorrowBook]
	@BorrowId int output,
	@BookId nvarchar(50),
	@UserId nvarchar(50),
	@BorrowTime datetime,
	@ReturnTime datetime,
	@Fine decimal,
	@RenewCount int,
	@BorrowRemark nvarchar(50)
as
	set @ReturnTime=DATEADD(MONTH,3,@ReturnTime);
	insert into BorrowReturn(BookId,UserId,BorrowTime,ReturnTime,Fine,RenewCount,BorrowRemark) 
	values(@BookId,@UserId,@BorrowTime,@ReturnTime,@Fine,@RenewCount,@BorrowRemark)
	set @BorrowId=@@IDENTITY
	update BorrowReturn set FactReturnTime=null where BorrowId=@BorrowId
	return 0
GO
/****** Object:  Default [CK_FactReturnTime]    Script Date: 06/09/2018 22:27:22 ******/
ALTER TABLE [dbo].[BorrowReturn] ADD  CONSTRAINT [CK_FactReturnTime]  DEFAULT (NULL) FOR [FactReturnTime]
GO
/****** Object:  Check [CK_LoginId]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [CK_LoginId] CHECK  ((len(rtrim(ltrim([LoginId])))>(4)))
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [CK_LoginId]
GO
/****** Object:  Check [CK_LoginPwd]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [CK_LoginPwd] CHECK  ((len(rtrim(ltrim([LoginPwd])))>(4)))
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [CK_LoginPwd]
GO
/****** Object:  Check [CK_Gender]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [CK_Gender] CHECK  (([gender]='' OR [gender]='女' OR [gender]='男'))
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [CK_Gender]
GO
/****** Object:  ForeignKey [FK_ClassId]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK_ClassId]
GO
/****** Object:  ForeignKey [FK_DepartmentId]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK_DepartmentId]
GO
/****** Object:  ForeignKey [FK_UserTypeId]    Script Date: 06/09/2018 22:27:21 ******/
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[ReaderType] ([UserTypeId])
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK_UserTypeId]
GO
/****** Object:  ForeignKey [FK_BookId]    Script Date: 06/09/2018 22:27:22 ******/
ALTER TABLE [dbo].[BorrowReturn]  WITH CHECK ADD  CONSTRAINT [FK_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[BookInfo] ([BookId])
GO
ALTER TABLE [dbo].[BorrowReturn] CHECK CONSTRAINT [FK_BookId]
GO
/****** Object:  ForeignKey [FK_UserId]    Script Date: 06/09/2018 22:27:22 ******/
ALTER TABLE [dbo].[BorrowReturn]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Reader] ([UserId])
GO
ALTER TABLE [dbo].[BorrowReturn] CHECK CONSTRAINT [FK_UserId]
GO
