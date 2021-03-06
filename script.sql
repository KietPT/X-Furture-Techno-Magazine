USE [master]
GO
/****** Object:  Database [X-Future]    Script Date: 11/21/2017 2:00:31 PM ******/
CREATE DATABASE [X-Future]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Student.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Student_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Student_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [X-Future] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [X-Future].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [X-Future] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [X-Future] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [X-Future] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [X-Future] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [X-Future] SET ARITHABORT OFF 
GO
ALTER DATABASE [X-Future] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [X-Future] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [X-Future] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [X-Future] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [X-Future] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [X-Future] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [X-Future] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [X-Future] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [X-Future] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [X-Future] SET  DISABLE_BROKER 
GO
ALTER DATABASE [X-Future] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [X-Future] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [X-Future] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [X-Future] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [X-Future] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [X-Future] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [X-Future] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [X-Future] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [X-Future] SET  MULTI_USER 
GO
ALTER DATABASE [X-Future] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [X-Future] SET DB_CHAINING OFF 
GO
ALTER DATABASE [X-Future] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [X-Future] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [X-Future] SET DELAYED_DURABILITY = DISABLED 
GO
USE [X-Future]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[ContentOfComment] [nvarchar](max) NOT NULL,
	[TimeOfComment] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[UserId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[ContentOfPost] [nvarchar](max) NOT NULL,
	[Collaborator] [nvarchar](50) NOT NULL,
	[TitleOfPost] [nvarchar](max) NOT NULL,
	[PostedDay] [datetime] NOT NULL,
	[PublishedDay] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SymolPic] [nvarchar](max) NOT NULL,
	[MainContent] [nvarchar](max) NOT NULL,
	[Moderator] [nvarchar](50) NULL,
	[NumberOfView] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostDetail]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostDetail](
	[PostId] [varchar](10) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_PostDetail] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RolePermission](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/21/2017 2:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Role] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([ID], [CategoryName], [Status]) VALUES (1, N'Laptop', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [Status]) VALUES (2, N'Camera', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [Status]) VALUES (3, N'Mobile', 1)
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (6, 116, N'dasdasd', CAST(N'2017-11-01 23:22:23.533' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (7, 114, N'acbaabcjacbakjbck
cacmakcmckmck
cacockoakcokaok', CAST(N'2017-11-01 23:44:31.363' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (270, 115, N'abc abc abc', CAST(N'2017-11-02 11:15:54.070' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (271, 117, N'anh nhớ em 
abc 
abc a
abc 
abc
', CAST(N'2017-11-02 11:25:29.523' AS DateTime), 1, N'reader1')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (273, 124, N'sao mac vay', CAST(N'2017-11-02 12:49:40.063' AS DateTime), 1, N'reader1')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (274, 124, N'sadsasdasd', CAST(N'2017-11-02 14:26:59.737' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (275, 124, N'sadsasdasd', CAST(N'2017-11-02 14:28:48.040' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (276, 113, N'abc', CAST(N'2017-11-02 14:29:46.510' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (277, 114, N'abc', CAST(N'2017-11-02 14:34:27.887' AS DateTime), 1, N'reader1')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (278, 123, N'abc asdas
asDa
sDa
', CAST(N'2017-11-02 14:36:47.343' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (279, 123, N'a
cA
cA
cA
cA
cA
cA
cA
cA
c', CAST(N'2017-11-02 14:36:57.553' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (280, 126, N'camer bao nhiue v', CAST(N'2017-11-02 23:00:02.430' AS DateTime), 1, N'reader1')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (284, 127, N'abc', CAST(N'2017-11-02 23:22:34.577' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (285, 127, N'abc', CAST(N'2017-11-02 23:22:39.493' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (289, 127, N'camer la sao vie', CAST(N'2017-11-04 01:30:39.013' AS DateTime), 1, N'reader1')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (290, 131, N'aaa', CAST(N'2017-11-04 10:23:27.060' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (291, 131, N'aaaa', CAST(N'2017-11-04 10:23:29.433' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (292, 131, N'a', CAST(N'2017-11-04 10:23:35.683' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (293, 114, N'sđa', CAST(N'2017-11-05 15:52:30.147' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (294, 141, N'tao lao

tao lao', CAST(N'2017-11-06 17:14:07.200' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (295, 126, N'asd', CAST(N'2017-11-06 17:14:42.290' AS DateTime), 1, N'reader2')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (296, 142, N'cha b', CAST(N'2017-11-06 17:24:53.797' AS DateTime), 1, N'trang')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (297, 142, N'asdasdasd', CAST(N'2017-11-06 18:02:51.597' AS DateTime), 1, N'reader')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (299, 150, N'asdasdasd', CAST(N'2017-11-11 07:47:27.187' AS DateTime), 1, N'kiet')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (300, 150, N'asdasdasd', CAST(N'2017-11-11 07:47:31.213' AS DateTime), 1, N'kiet')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (301, 152, N'anh nhớ em nhiều lắm
', CAST(N'2017-11-21 10:40:04.443' AS DateTime), 1, N'phạm tuấn kiệt')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (302, 152, N'anh nhớ em nhiều lắm
', CAST(N'2017-11-21 10:40:18.607' AS DateTime), 1, N'phạm tuấn kiệt')
INSERT [dbo].[Comment] ([ID], [PostID], [ContentOfComment], [TimeOfComment], [status], [UserId]) VALUES (303, 149, N'tào lao', CAST(N'2017-11-21 10:40:57.620' AS DateTime), 1, N'phạm tuấn kiệt')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (113, N'<p><img src="/Project/MainControllerfiles/b5aa116d-b16f-4098-9ecc-6543e8c203f6.jpeg" style="width: 841px; height: 473.468px;" class="fr-fic fr-dib"></p><h2><span style="font-size: 14px;">The New iPad l&agrave; biệt danh của mẫu <a href="https://www.thegioididong.com/may-tinh-bang-apple-ipad" target="_blank" title="Đặt mua iPad tại Thegioididong.com" type="Đặt mua iPad tại Thegioididong.com">iPad&nbsp;</a>thế hệ thứ 3 được Apple ra mắt v&agrave;o năm 2012 v&agrave; n&oacute; sẽ bị &quot;khai tử&quot; v&agrave;o cuối th&aacute;ng n&agrave;y sau nhiều năm được hỗ trợ.</span></h2><p><span style="font-size: 14px;">Th&ocirc;ng tin n&agrave;y được ph&aacute;t hiện trong một bản th&ocirc;ng b&aacute;o nội bộ được gửi tới c&aacute;c nh&acirc;n vi&ecirc;n của Apple v&agrave; c&aacute;c nh&agrave; cung cấp dịch vụ được uỷ quyền của h&atilde;ng. Theo đ&oacute;, cả hai phi&ecirc;n bản New iPad Wifi v&agrave; 3G đều sẽ bị đưa ra khỏi danh s&aacute;ch c&aacute;c thiết bị được Apple hỗ trợ ch&iacute;nh thức.</span></p><p><span style="font-size: 14px;">Đồng nghĩa với việc nếu bạn hiện đang sở hữu New iPad th&igrave; c&aacute;c trung t&acirc;m sửa chữa ch&iacute;nh thức của Apple sẽ c&oacute; quyền từ chối sửa chữa, bảo h&agrave;nh cho bạn, trừ c&aacute;c trung t&acirc;m tại bang California v&agrave; Thổ Nhĩ Kỳ (do c&oacute; sự kh&aacute;c biệt ở mặt ph&aacute;p l&yacute;).</span></p><p><span style="font-size: 14px;">New iPad l&agrave; t&ecirc;n gọi kh&aacute;c của iPad 3 - chiếc iPad cuối c&ugrave;ng sở hữu cổng sạc 30 ch&acirc;n độc quyền của Apple, với viền d&agrave;y đặc trưng m&agrave; sau đ&oacute; đ&atilde; kh&ocirc;ng c&ograve;n xuất hiện tr&ecirc;n<a href="https://www.thegioididong.com/may-tinh-bang/ipad-air-cellular-64gb" target="_blank" title="Chi tiết iPad Air" type="Chi tiết iPad Air">&nbsp;iPad Air</a> nữa.</span></p><p><img src="/Project/MainControllerfiles/94cae677-7cba-4a9b-a46a-b23b64a6644e.jpeg" style="width: 840px; height: 560px;" class="fr-fic fr-dib"></p><p><br></p><p>Tuy l&agrave; chiếc iPad đầu ti&ecirc;n được Apple trang bị m&agrave;n h&igrave;nh si&ecirc;u sắc n&eacute;t Retina, nhưng New iPad lại l&agrave; một sản phẩm c&oacute; v&ograve;ng đời kh&aacute; ngắn, bởi chỉ khoảng 7 th&aacute;ng sau khi xuất hiện, n&oacute; đ&atilde; bị thay thế bởi chiếc<a href="https://www.thegioididong.com/may-tinh-bang/ipad-4-wifi-cellular-32gb" target="_blank" title="Chi tiết iPad 4" type="Chi tiết iPad 4">&nbsp;iPad 4</a> với cổng sạc Lightning nhỏ gọn.</p><p>Nhưng điều nghịch l&yacute; nhất ch&iacute;nh l&agrave; d&ugrave; ra đời sau, nhưng iPad 3 lại bị &quot;x&oacute;a sổ&quot; sớm hơn cả iPad 2. Chiếc iPad 2 vẫn được Apple b&aacute;n ra cho đến tận năm 2014 với vai tr&ograve; l&agrave; mẫu tablet gi&aacute; rẻ d&agrave;nh cho người d&ugrave;ng mới, v&agrave; thậm ch&iacute; n&oacute; vẫn được hỗ trợ ch&iacute;nh thức &iacute;t nhất l&agrave; đến năm 2019.</p><p>Theo: <a href="https://www.macrumors.com/2017/10/27/ipad-3rd-generation-obsolete-october-31/" rel="nofollow" target="_blank" title="Apple to Classify Third-Generation iPad as Obsolete Later This Month" type="Apple to Classify Third-Generation iPad as Obsolete Later This Month">Macrumors</a></p><p>Xem th&ecirc;m: <a href="https://www.thegioididong.com/tin-tuc/ipad-pro-duoc-trang-bi-cong-nghe-nhan-dang-khuon-mat-face-id-1031760" target="_blank" title="iPad Pro cũng sẽ được trang bị công nghệ nhận dạng khuôn mặt Face ID" type="iPad Pro cũng sẽ được trang bị công nghệ nhận dạng khuôn mặt Face ID">iPad Pro cũng sẽ được trang bị c&ocirc;ng nghệ nhận dạng khu&ocirc;n mặt Face&nbsp;</a></p>', N'CO-kiet-123', N'Apple sẽ đưa iPad thế hệ thứ 3 vào dạng ', CAST(N'2017-10-30 09:17:36.403' AS DateTime), CAST(N'2017-10-30 09:16:33.387' AS DateTime), 1, 3, N'/Project/MainControllerfiles/b1af4a0d-4b86-43bf-922f-e0300caf4cbb.jpeg', N'The New iPad là biệt danh của mẫu iPad thế hệ thứ 3 được Apple ra mắt vào năm 2012 và nó sẽ bị "khai tử" vào cuối tháng này sau nhiều năm được hỗ trợ.', N'MO-elly-123', 12)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (114, N'<p><img src="/Project/MainControllerfiles/bfe66383-29bf-4db0-8379-33d37c97deec.jpeg" style="width: 813px; height: 457.649px;" class="fr-fic fr-dib fr-rounded"></p><p><br></p><h2><a href="https://www.thegioididong.com/phone-moi" target="_blank" title="iPhone X"><span style="font-size: 14px;">iPhone X</span></a><span style="font-size: 14px;">&nbsp;đ&atilde; cho đặt h&agrave;ng từ 27/10 v&agrave; sẽ l&ecirc;n kệ v&agrave;o 3/11 tới đ&acirc;y. Mặc d&ugrave; chưa đến tay người d&ugrave;ng nhưng video, h&igrave;nh ảnh đập hộp iPhone X đ&atilde; được chia sẻ tr&ecirc;n c&aacute;c trang mạng.</span></h2><p>Theo <a href="https://9to5mac.com/2017/10/28/iphone-x-unboxing-packaging/" rel="nofollow" target="_blank" title="iPhone X">9to5mac</a>, c&aacute;c bức ảnh được chia sẻ tr&ecirc;n Twitter của Benjamin Geskin v&agrave; n&oacute; c&oacute; nguồn tốc từ Instagram. Những h&igrave;nh ảnh cho ch&uacute;ng ta thấy rất nhiều chiếc iPhone X đang chuẩn bị để l&ecirc;n kệ hoặc chuyển tới tay người d&ugrave;ng. Trong khi video ngắn cho biết qu&aacute; tr&igrave;nh mở hộp iPhone X.</p><p><img src="/Project/MainControllerfiles/31aac93e-d017-4137-a0d0-0ac8b86b4484.jpeg" style="width: 765px; height: 772.856px;" class="fr-fic fr-dib"></p><p>Được biết, chiếc iPhone X xuất hiện trong video tr&ecirc;n Instagram l&agrave; phi&ecirc;n bản Space Gray. Khi mở nắp hộp ra, ch&uacute;ng ta sẽ thấy một quyển s&aacute;ch nhỏ tr&ecirc;n đ&oacute; ghi &ldquo;Designed by Apple in California&rdquo;. Sau đ&oacute; l&agrave; chiếc iPhone X với m&agrave;n h&igrave;nh tr&agrave;n cạnh m&agrave; nhiều người đang ao ước sở hữu.</p><p>Tất nhi&ecirc;n, h&igrave;nh ảnh v&agrave; video n&agrave;y kh&ocirc;ng phải l&agrave; điều g&igrave; đ&oacute; qua to t&aacute;t, dẫu vậy cũng rất th&uacute; vị khi thấy smartphone HOT nhất hiện nay đang sẵn s&agrave;ng l&ecirc;n kệ.</p><p>Xem th&ecirc;m: <a href="https://www.thegioididong.com/tin-tuc/iphone-x-bi-doi-gia-len-6-000-usd-tren-ebay-1036702" target="_blank" title=" iPhone X bị đội giá lên hơn 130 triệu đồng trên eBay">iPhone X bị đội gi&aacute; l&ecirc;n hơn 130 triệu đồng tr&ecirc;n eBay</a></p>', N'CO-duc-123', N'iPhone X lộ ảnh và video đập hộp trước ngày lên kệ', CAST(N'2017-10-30 09:21:43.703' AS DateTime), CAST(N'2017-10-30 09:19:55.240' AS DateTime), 1, 3, N'/Project/MainControllerfiles/ee71802f-5206-4846-8985-83e84c3c70b6.jpeg', N'iPhone X đã cho đặt hàng từ 27/10 và sẽ lên kệ vào 3/11 tới đây. Mặc dù chưa đến tay người dùng nhưng video, hình ảnh đập hộp iPhone X đã được chia sẻ trên các trang mạng.', N'MO-ha-123', 9)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (115, N'<h2><span style="font-size: 18px;">Chỉ v&agrave;i ng&agrave;y nữa th&ocirc;i l&agrave; <a href="https://www.thegioididong.com/tin-tuc/su-kien/oppo-f5-ra-mat-tai-viet-nam-101" target="_blank" title="OPPO F5 sẽ được giới thiệu chính thức ở Việt Nam (4/11)" type="OPPO F5 sẽ được giới thiệu chính thức ở Việt Nam (4/11)">OPPO F5 sẽ được giới thiệu ch&iacute;nh thức ở Việt Nam (4/11)</a>. V&agrave; ch&uacute;ng ta h&atilde;y c&ugrave;ng chi&ecirc;m ngưỡng vẻ đẹp của chiếc m&aacute;y n&agrave;y. Cảm gi&aacute;c như <a href="https://www.thegioididong.com/tin-tuc/tim-kiem?key=OPPO+F5" target="_blank" title="OPPO F5" type="OPPO F5">OPPO F5</a> ch&iacute;nh l&agrave; sự kết hợp ho&agrave;n hảo của <a href="https://www.thegioididong.com/tin-tuc/tim-kiem?key=iPhone+7" target="_blank" title="iPhone 7" type="iPhone 7">iPhone 7</a> với <a href="https://www.thegioididong.com/tin-tuc/tim-kiem?key=Galaxy+S8" target="_blank" title="Galaxy S8" type="Galaxy S8">Galaxy S8</a>.</span></h2><p><em>Lưu &yacute;: H&igrave;nh ảnh v&agrave; th&ocirc;ng tin trong b&agrave;i m&igrave;nh sử dụng từ Gadgetmatch. Phi&ecirc;n bản OPPO F5 n&agrave;y l&agrave; của thị trường nước ngo&agrave;i, c&oacute; thể bản OPPO F5 khi ra mắt tại Việt Nam sẽ tương tự, hoặc cũng c&oacute; thể kh&aacute;c đ&ocirc;i ch&uacute;t (chưa chắc chắn).</em></p><p>Trước hết, ch&uacute;ng ta h&atilde;y c&ugrave;ng xem qua cấu h&igrave;nh của chiếc m&aacute;y n&agrave;y.<img src="/Project/MainControllerfiles/68d511bd-6052-4360-8663-94419dbecb07.jpeg" style="width: 827px; height: 465.877px;" class="fr-fic fr-dib"></p><p>C&oacute; vẻ như ti&ecirc;u chuẩn điện thoại của năm 2017 l&agrave; những m&agrave;n h&igrave;nh &quot;si&ecirc;u d&agrave;i&quot; với tỉ lệ tăng từ 16:9 l&ecirc;n th&agrave;nh 18:9. M&agrave;n h&igrave;nh của OPPO F5 gần như đ&atilde; chiếm trọn vẹn mặt trước với những đường viền m&aacute;y rất mỏng v&agrave; đẹp đẽ.</p><p><img src="/Project/MainControllerfiles/6eff9746-5cf1-4c00-9db2-fdb0bf2e8a77.jpeg" style="width: 841px; height: 473.763px;" class="fr-fic fr-dib"></p><p>Đ&aacute;ng tiếc l&agrave; d&ugrave; mặt sau tr&ocirc;ng kh&aacute; giống iPhone 7 của Apple nhưng F5 lại sử dụng vỏ nhựa. Ph&iacute;a mặt lưng cũng đi k&egrave;m một cảm biến v&acirc;n tay nhưng c&oacute; lẽ bạn sẽ kh&ocirc;ng d&ugrave;ng tới n&oacute; nhiều đ&acirc;u khi m&agrave; mặt trước m&aacute;y được trang bị c&ocirc;ng nghệ mở kh&oacute;a bằng khu&ocirc;n mặt.</p><p><img src="/Project/MainControllerfiles/c9dbe88a-1519-4b78-8edd-ef225c9de000.jpeg" style="width: 839px; height: 472.637px;" class="fr-fic fr-dib"></p><p><br></p>', N'CO-kiet-123', N'Trên tay OPPO F5: Màn hình tràn, không camera kép, có tích hợp AI', CAST(N'2017-10-30 09:30:39.757' AS DateTime), CAST(N'2017-10-30 09:27:31.690' AS DateTime), 1, 1, N'/Project/MainControllerfiles/0349c063-8f8c-410f-9220-94bd5c01c6f6.jpeg', N'Chỉ vài ngày nữa thôi là OPPO F5 sẽ được giới thiệu chính thức ở Việt Nam (4/11). Và chúng ta hãy cùng chiêm ngưỡng vẻ đẹp của chiếc máy này. Cảm giác như OPPO F5 chính là sự kết hợp hoàn hảo của iPhone 7 với Galaxy S8.', N'MO-hung-123', 8)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (116, N'<p>cbjhbacjhbqjhbjchqbjhbcjhqbechbqec</p><p>cjnckqjcnkqjcnkjqcnkqjcnkjqcn</p><p>kcmqlkcmqlkcm</p><p>ckqmlcqkmclk</p><p>cmlqkcmlqkcmqc;lkm</p><p>qkcmlqkcmlqkcmlkqcmlqkcmlkqcmlkm<img src="/Project/MainControllerfiles/b7823136-153e-40fe-8ecb-c2ac60bfb3e7.jpeg" style="width: 717px; height: 403.402px;" class="fr-fic fr-dib"></p>', N'Co-huy-123', N'cbahcbjachbajchbj', CAST(N'2017-10-30 09:38:19.763' AS DateTime), CAST(N'2017-10-30 09:37:23.317' AS DateTime), 1, 2, N'/Project/MainControllerfiles/c684c5c3-17cf-47ed-9129-79a1e0775300.jpeg', N'chjbqjhcbjqhbjhqbcjhbbzcjhbajsbcjasbdbasdj', N'Mo-ha-123', 6)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (117, N'<p>asdasdasd</p>', N'CO-kiet-123', N'dasdad', CAST(N'2017-10-30 10:05:00.403' AS DateTime), CAST(N'2017-10-30 10:04:27.880' AS DateTime), 1, 1, N'/Project/MainControllerfiles/f9cceb34-635f-4aec-b074-ffa2377adbc4.jpeg', N'asdadsasd', N'MO-hung-123', 36)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (118, N'<p><img src="/Project/MainControllerfiles/ee201e69-f8a6-4a40-a4c4-773f4178f2ee.jpeg" style="width: 300px;" class="fr-fic fr-dib"></p>', N'CO-kiet-123', N'kiet dap chai', CAST(N'2017-11-04 00:41:53.217' AS DateTime), CAST(N'2017-10-30 10:54:17.757' AS DateTime), 1, 3, N'/Project/MainControllerfiles/c99a6e63-a7bf-467c-a6ed-13af4bc0069b.jpeg', N'Chó Kiệt', N'MO-ha-123', 1)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (119, N'<p>asdasd</p>', N'CO-kiet-123', N'anh nhớ em nhiều lắm', CAST(N'2017-11-02 22:34:19.830' AS DateTime), CAST(N'2017-11-01 12:46:39.877' AS DateTime), 4, 1, N'/Project/MainControllerfiles/39d34486-8019-4220-83fc-6a9b325422b0.jpeg', N'asd', N'MO-ha-123', 0)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (122, N'<p><img src="/Project/MainControllerfiles/4ab0821b-5f85-498a-a4b4-65bcb0fcccd1.jpeg" style="width: 710px; height: 395.233px;" class="fr-fic fr-dib"></p><p><br></p><h2><a href="https://www.thegioididong.com/tin-tuc/tim-kiem?key=iCloud" target="_blank" title="iCloud" type="iCloud">iCloud</a> l&agrave; dịch vụ lưu trữ trực tuyến được Apple cung cấp nhằm đồng bộ v&agrave; sao lưu dữ liệu. V&agrave; một l&uacute;c n&agrave;o đ&oacute;, bạn sẽ bắt gặp th&ocirc;ng b&aacute;o bộ nhớ iCloud đầy. Vậy nguy&ecirc;n nh&acirc;n v&agrave; c&aacute;ch giải quyết vấn đề n&agrave;y như thế n&agrave;o, h&atilde;y c&ugrave;ng m&igrave;nh t&igrave;m hiểu c&acirc;u trả lời nh&eacute;!</h2><p>Mặc định Apple sẽ cung cấp cho bạn 5 GB để lưu trữ, đồng bộ th&ocirc;ng tin c&aacute; nh&acirc;n như: email, tin nhắn, danh bạ, ghi ch&uacute;, dữ liệu ứng dụng, ảnh...Tất nhi&ecirc;n 5 GB l&agrave; kh&ocirc;ng bao giờ đủ cả, v&igrave; thế bạn cần can thiệp v&agrave; loại bỏ bớt dữ liệu &iacute;t d&ugrave;ng đến.</p><h3><strong>Kiểm tra nguy&ecirc;n nh&acirc;n iCloud đầy</strong></h3><p>Tr&ecirc;n iPhone/iPad bạn truy cập v&agrave;o <strong>C&agrave;i đặt</strong> &gt; <strong>ID Apple, iCloud</strong> &gt; <strong>iCloud&nbsp;</strong>&gt; <strong>Quản l&yacute; dung lượng</strong>.</p>', N'CO-duc-123', N'iCloud báo đầy bộ nhớ, phải làm thế nào?', CAST(N'2017-11-02 11:21:13.470' AS DateTime), CAST(N'2017-11-02 11:19:36.433' AS DateTime), 1, 3, N'/Project/MainControllerfiles/f3ac0c95-3724-43e4-b328-25beb07fb433.jpeg', N'iCloud là dịch vụ lưu trữ trực tuyến được Apple cung cấp nhằm đồng bộ và sao lưu dữ liệu. Và một lúc nào đó, bạn sẽ bắt gặp thông báo bộ nhớ iCloud đầy. Vậy nguyên nhân và cách giải quyết vấn đề này như thế nào, hãy cùng mình tìm hiểu câu trả lời nhé!', N'MO-hung-123', 7)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (123, N'<h2>Cả 3 mẫu <a href="https://www.thegioididong.com/laptop-asus" target="_blank" title="Đặt mua laptop Asus tại Thegioididong.com" type="Đặt mua laptop Asus tại Thegioididong.com">laptop Asus</a> trong b&agrave;i đều được trang bị CPU Intel Core i5 Kabylake Refresh mạnh mẽ c&ugrave;ng ổ cứng HDD l&ecirc;n tới 1 TB. V&agrave; hiện c&aacute;c model n&agrave;y đ&atilde; l&ecirc;n kệ Thế Giới Di Động.</h2><p>D&ograve;ng&nbsp;CPU Kaby Lake Refresh nổi bật với khả năng ti&ecirc;u thụ điện năng cực thấp, chỉ 15W. D&ugrave; kh&ocirc;ng c&oacute; thay đổi về vi kiến tr&uacute;c, c&aacute;c CPU thế hệ 8 n&agrave;y lại c&oacute; số nh&acirc;n v&agrave; luồng nhiều gấp đ&ocirc;i thế hệ trước.</p><p>Ngo&agrave;i ra, CPU Kaby Lake Refresh cũng sẽ được trang bị chip đồ hoạ mới, UHD 620 với khả năng chơi c&aacute;c video độ ph&acirc;n giải 4K.</p><p>Dưới đ&acirc;y l&agrave; 3 mẫu laptop của Asus d&ugrave;ng CPU Intel Core i5 Kabylake Refresh, đ&aacute;ng để bạn c&acirc;n nhắc chọn mua:</p><p><img src="/Project/MainControllerfiles/91fb946a-bb3e-4339-ac78-c7ff0a7729bb.jpeg" style="width: 810px; height: 456.3px;" class="fr-fic fr-dib"></p>', N'CO-duc-123', N'3 laptop Asus Core i thế hệ thứ 8 vừa lên kệ TGDĐ: Chip mới, giá tốt', CAST(N'2017-11-02 12:47:09.537' AS DateTime), CAST(N'2017-11-02 12:37:30.010' AS DateTime), 1, 1, N'/Project/MainControllerfiles/c9e17124-7fc6-4b05-a7b1-935483e7f825.jpeg', N'Cả 3 mẫu laptop Asus trong bài đều được trang bị CPU Intel Core i5 Kabylake Refresh mạnh mẽ cùng ổ cứng HDD lên tới 1 TB. Và hiện các model này đã lên kệ Thế Giới Di Động.', N'MO-elly-123', 7)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (124, N'<p><img src="/Project/MainControllerfiles/8a5c309c-7a06-4168-a779-881c5deacbaf.jpeg" style="width: 644px; height: 367.08px;" class="fr-fic fr-dib"></p><p><br></p><h2>H&ocirc;m qua (31/10) HMD đ&atilde; ch&iacute;nh thức ra mắt Nokia 2 tại Ấn Độ. Sản phẩm n&agrave;y c&oacute; thiết kế với bộ khung bằng nh&ocirc;m, mặt sau bằng polycabonate v&agrave; c&oacute; thể th&aacute;o rời để thay thế pin nếu cần thiết.</h2><p>Dưới đ&acirc;y l&agrave; những h&igrave;nh ảnh tr&ecirc;n tay <a href="https://www.thegioididong.com/dtdd/nokia-2" target="_blank" title="Nokia 2">Nokia 2</a>, m&aacute;y c&oacute; 3 phi&ecirc;n bản m&agrave;u sắc kh&aacute;c nhau gồm: Đen, trắng v&agrave; khung viền m&agrave;u đồng kết hợp m&agrave;u đen. Mời c&aacute;c bạn c&ugrave;ng xem:</p>', N'CO-trung-123', N'Trên tay nhanh Nokia 2 và xem ảnh, video chụp từ camera của máy', CAST(N'2017-11-02 12:48:21.013' AS DateTime), CAST(N'2017-11-02 12:46:06.927' AS DateTime), 1, 2, N'/Project/MainControllerfiles/ee6a6748-9184-451f-b82f-c0c4ac07bc47.jpeg', N'Hôm qua (31/10) HMD đã chính thức ra mắt Nokia 2 tại Ấn Độ. Sản phẩm này có thiết kế với bộ khung bằng nhôm, mặt sau bằng polycabonate và có thể tháo rời để thay thế pin nếu cần thiết.', N'MO-sang-123', 17)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (126, N'<h2><strong>H&igrave;nh như c&ocirc;ng nghệ zoom tr&ecirc;n camera đ&atilde; trở n&ecirc;n h&ugrave;ng mạnh v&agrave; n&oacute; đ&atilde; c&oacute; thể l&agrave;m những việc m&agrave; ch&uacute;ng ta kh&oacute; tưởng tượng. Một v&iacute; dụ mới nhất về điều n&agrave;y ch&iacute;nh l&agrave; m&aacute;y ảnh Nikon Coolpix P900, một chiếc m&aacute;y vừa tr&igrave;nh l&agrave;ng v&agrave;o th&aacute;ng 3 vừa qua.</strong></h2><p>Chiếc m&aacute;y ảnh n&agrave;y đ&atilde; được c&ocirc;ng bố với chứng nhận &quot;Super Zoom&quot; nhưng c&oacute; lẽ bạn sẽ kh&ocirc;ng thể tưởng tượng ra khả năng thực sự của n&oacute; nếu kh&ocirc;ng xem video dưới đ&acirc;y.<img src="/Project/MainControllerfiles/d39422d3-c9f2-4f6d-ba10-2c2611ac2105.jpeg" style="width: 790px; height: 445.033px;" class="fr-fic fr-dib"></p><p>Chỉ trong 1 ph&uacute;t 50 gi&acirc;y, đoạn video được một nhiếp ảnh gia người Đức, Lothar Lenz đăng tải đ&atilde; thu h&uacute;t sự ch&uacute; &yacute; cực lớn v&igrave; n&oacute; chứng minh được rằng c&ocirc;ng nghệ zoom của m&aacute;y ảnh đ&atilde; c&oacute; thể gi&uacute;p người d&ugrave;ng n&oacute; chụp ảnh cận cảnh &lsquo;chị Hằng&rsquo; hay mặt trăng ngay từ Tr&aacute;i Đất.</p><p>Để l&agrave;m được điều n&agrave;y, P900 đ&atilde; phải mở rộng khả năng zoom từ 83x l&ecirc;n 166x với t&iacute;nh năng Dynamic Fine Zoom. Với phạm vi 2000mm zoom của n&oacute;, Nikon Coolpix P900 r&otilde; r&agrave;ng đang l&agrave; chiếc camera c&oacute; <a href="https://www.thegioididong.com/tin-tuc/mot-ngay-nao-do-chiec-smartphone-cua-chung-ta-se-c-618007" target="_blank" title="Một ngày nào đó chiếc smartphone của chúng ta sẽ có khả năng zoom ''đáng sợ'' đến mức này?">khả năng zoom lợi hại nhất</a> hiện nay.<img src="/Project/MainControllerfiles/91a2481d-950a-4e78-b31e-e3e728299ad5.jpeg" style="width: 823px; height: 463.623px;" class="fr-fic fr-dib"></p>', N'CO-kiet-123', N'Liệu ngày nào đó camera smartphone cũng có khả năng zoom thấu ''chị Hằng'' như thế này?', CAST(N'2017-11-02 22:59:25.227' AS DateTime), CAST(N'2017-11-02 22:56:55.563' AS DateTime), 1, 2, N'/Project/MainControllerfiles/3d09eb79-0889-4446-8eaa-4e28cbc2404c.jpeg', N'Hình như công nghệ zoom trên camera đã trở nên hùng mạnh và nó đã có thể làm những việc mà chúng ta khó tưởng tượng. Một ví dụ mới nhất về điều này chính là máy ảnh Nikon Coolpix P900, một chiếc máy vừa trình làng vào tháng 3 vừa qua.', N'MO-sang-123', 33)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (127, N'<h2>H&ocirc;m nay OPPO đ&atilde; ch&iacute;nh thức giới thiệu đến người d&ugrave;ng 2 mẫu smartphone mới: <a href="https://www.thegioididong.com/dtdd/oppo-r11s" target="_blank" title="đặt mua oppo r11s" type="đặt mua oppo r11s">R11s</a> v&agrave; R11s Plus. Bộ đ&ocirc;i n&agrave;y l&agrave; bản n&acirc;ng cấp của mẫu R11 v&agrave; R11 Plus được ra mắt v&agrave;o hồi th&aacute;ng 6 năm nay.</h2><p>Sự thay đổi lớn nhất tr&ecirc;n R11s v&agrave; R11s Plus ch&iacute;nh l&agrave; phần m&agrave;n h&igrave;nh. OPPO đ&atilde; trang bị m&agrave;n h&igrave;nh tỉ lệ 18:9 thay cho m&agrave;n h&igrave;nh 16:9 trước đ&acirc;y. Camera v&agrave; dung lượng pin kh&ocirc;ng c&oacute; sự thay đổi nhiều so với thế hệ tiền nhiệm.</p><p>Việc sở hữu m&agrave;n h&igrave;nh c&oacute; xu hướng v&ocirc; cực đ&atilde; l&agrave;m cảm biến v&acirc;n tay phải dời chỗ sang mặt lưng. C&aacute;c cổng kết nối vẫn được đặt ở phần cạnh dưới của sản phẩm.</p><p>Về phần cấu h&igrave;nh, m&agrave;n h&igrave;nh của OPPO R1s c&oacute; độ lớn 6.01 inch c&ugrave;ng độ ph&acirc;n giải 2160 x 1080 px. M&aacute;y sở hữu chip Snapdragon 660 c&ugrave;ng với 4 GB RAM v&agrave; 64 GB bộ nhớ trong.</p><p>Mặt sau vẫn l&agrave; cụm camera k&eacute;p c&oacute; độ ph&acirc;n giải 20 MP + 16 MP v&agrave; được t&iacute;ch hợp tr&iacute; tuệ nh&acirc;n tạo (AI) để chụp h&igrave;nh đẹp hơn. OPPO đ&atilde; loại bỏ đường viền antena k&eacute;p v&agrave; thay bằng đường antena đơn được l&agrave;m cong l&ecirc;n để tr&ocirc;ng thời trang hơn.&nbsp;</p><p>Mẫu OPPO R11s c&oacute; dung lượng pin 3.250 mAh v&agrave; sở hữu c&ocirc;ng nghệ sạc nhanh VOOC độc quyền. M&aacute;y sẽ chạy Color OS 3.2 dựa tr&ecirc;n nền tảng Android 7.1.2 c&ugrave;ng với nhữn t&iacute;nh năng mới như mở kh&oacute;a bằng khu&ocirc;n mặt, sắp xếp h&igrave;nh ảnh theo thời gian, địa điểm,...<img src="/Project/MainControllerfiles/6c9d4acc-24e3-4f90-ac37-db6cbcfe8d6a.jpeg" style="width: 864px; height: 486.96px;" class="fr-fic fr-dib"></p><p><br></p><p>C&ograve;n OPPO R11s Plus, m&aacute;y sẽ c&oacute; m&agrave;n h&igrave;nh 6.43 inch, vẫn sở hữu chip Snapdragon 660 nhưng c&oacute; đến 6 GB RAM, bộ nhớ trong vẫn 64 GB như OPPO R11s. Th&ocirc;ng số camera cũng giống hệt với OPPO R11s nhưng vi&ecirc;n pin của m&aacute;y c&oacute; dung lượng l&ecirc;n tới 4.000 mAh.</p><p>OPPO R11s sẽ c&oacute; gi&aacute; khoảng 455 USD, phi&ecirc;n bản m&agrave;u đỏ c&oacute; gi&aacute; 485 USD. OPPO R11s Plus dự kiến b&aacute;n với gi&aacute; 560 USD. Bộ đ&ocirc;i n&agrave;y sẽ l&ecirc;n kệ v&agrave;o ng&agrave;y 10/11 nhưng đến ng&agrave;y 24/11 th&igrave; người d&ugrave;ng mới mua được m&aacute;y.</p>', N'CO-trung-123', N'OPPO trình làng R11s, R11s Plus: Màn hình 18:9, Camera selfie AI Beauty 20 MP', CAST(N'2017-11-04 09:35:27.203' AS DateTime), CAST(N'2017-11-02 23:20:49.137' AS DateTime), 3, 2, N'/Project/MainControllerfiles/c474de53-4e65-488f-b801-5302ccf57a4d.jpeg', N'Hôm nay OPPO đã chính thức giới thiệu đến người dùng 2 mẫu smartphone mới: R11s và R11s Plus. Bộ đôi này là bản nâng cấp của mẫu R11 và R11 Plus được ra mắt vào hồi tháng 6 năm nay.', N'MO-hung-123', 6)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (128, N'<h2>Card đồ hoạ AMD l&agrave; g&igrave;? Tại sao lại c&oacute; c&aacute;c mẫu <a href="https://www.thegioididong.com/laptop?f=card-do-hoa-roi" target="_blank" title="đặt mua laptop có card đồ họa rời" type="đặt mua laptop có card đồ họa rời">laptop t&iacute;ch hợp card đồ họa rời</a> từ AMD, ch&uacute;ng sẽ gi&uacute;p &iacute;ch g&igrave; cho việc trải nghiệm của ch&uacute;ng ta? Ngay sau đ&acirc;y m&igrave;nh sẽ giải đ&aacute;p thắc mắc đ&oacute; của c&aacute;c bạn.</h2><h3><strong>Card đồ họa AMD l&agrave; g&igrave;?</strong></h3><p>Card đồ họa (Graphics card) hay một số nơi c&ograve;n gọi l&agrave; card m&agrave;n h&igrave;nh l&agrave; một loại thiết bị chuy&ecirc;n xử l&yacute; c&aacute;c th&ocirc;ng tin về h&igrave;nh ảnh trong m&aacute;y t&iacute;nh cụ thể như m&agrave;u sắc, chi tiết độ ph&acirc;n giải, độ tương phản của h&igrave;nh ảnh, từ đ&oacute; gi&uacute;p&nbsp;hiển thị h&igrave;nh ảnh đẹp hơn.</p><p>Bất k&igrave; chiếc laptop n&agrave;o cũng c&oacute; card đồ họa. Thế nhưng những d&ograve;ng gi&aacute; rẻ thường chỉ sử dụng card đồ họa onbard - tức card đồ họa được t&iacute;ch hợp v&agrave;o thẳng vi xử l&iacute; của m&aacute;y t&iacute;nh.</p><p><img src="/Project/AddPostCollaborator.jspfiles/3932a5a8-9da3-4eea-a3b7-3681e8bc88bc.jpeg" style="width: 743px; height: 416.08px;" class="fr-fic fr-dib"></p>', N'CO-huy-123', N'Card đồ hoạ AMD là gì? Những ưu điểm laptop dùng card này', CAST(N'2017-11-03 23:44:59.683' AS DateTime), CAST(N'2017-11-03 23:44:59.683' AS DateTime), 3, 1, N'/Project/AddPostCollaborator.jspfiles/376d8c4c-7b3f-4e09-adea-f85bfefbfa2b.jpeg', N'Card đồ hoạ AMD là gì? Tại sao lại có các mẫu laptop tích hợp card đồ họa rời từ AMD, chúng sẽ giúp ích gì cho việc trải nghiệm của chúng ta? Ngay sau đây mình sẽ giải đáp thắc mắc đó của các bạn.Card đồ hoạ AMD là gì? Tại sao lại có các mẫu laptop tích hợp card đồ họa rời từ AMD, chúng sẽ giúp ích gì cho việc trải nghiệm của chúng ta? Ngay sau đây mình sẽ giải đáp thắc mắc đó của các bạn.

Card đồ họa AMD là gì?

Card đồ họa (Graphics card) hay một số nơi còn gọi là card màn hình là một loại thiết bị chuyên xử lý các thông tin về hình ảnh trong máy tính cụ thể như màu sắc, chi tiết độ phân giải, độ tương phản của hình ảnh, từ đó giúp hiển thị hình ảnh đẹp hơn.

Bất kì chiếc laptop nào cũng có card đồ họa. Thế nhưng những dòng giá rẻ thường chỉ sử dụng card đồ họa onbard - tức card đồ họa được tích hợp vào thẳng vi xử lí của máy tính.', N'MO-hung-123', 0)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (131, N'<p>anh nhớ em nhiều lắm</p>', N'CO-trung-123', N'anh nhớ em nhiều lắm', CAST(N'2017-11-04 10:20:03.230' AS DateTime), CAST(N'2017-11-04 00:43:53.177' AS DateTime), 1, 2, N'/Project/AddPostCollaborator.jspfiles/75c1b526-0823-411b-b55e-f8c49bcbd39e.jpeg', N'subUpdatePost', N'MO-sang-123', 5)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (138, N'<p><img src="/Project/AddPostCollaborator.jspfiles/fcd9ff5e-155f-43ce-8b0d-384adae85849.jpeg" style="width: 300px;" class="fr-fic fr-dib"></p><p>ajksdkjasdh</p>', N'CO-huy-123', N'huy dap chaii', CAST(N'2017-11-06 17:08:53.130' AS DateTime), CAST(N'2017-11-06 17:07:07.010' AS DateTime), 1, 1, N'/Project/AddPostCollaborator.jspfiles/12eedb8f-0463-4553-9c78-87d9b5be75ef.jpeg', N'huy dap chai', N'MO-ha-123', 1)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (140, N'<p>chqbchbhcbah<img src="/Project/MainControllerfiles/c24d1ef4-43e5-48a7-894b-6c089928eb40.jpeg" style="width: 300px;" class="fr-fic fr-dib"></p>', N'CO-huy-123', N'abcabcabh', CAST(N'2017-11-06 17:09:05.833' AS DateTime), CAST(N'2017-11-06 17:08:23.150' AS DateTime), 1, 3, N'/Project/MainControllerfiles/14959065-618a-41d4-a0a7-810eb9c9f022.jpeg', N'dbhcabhcaqb', N'MO-ha-123', 3)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (141, N'<h2>Nếu bạn đang sử dụng phi&ecirc;n bản <a href="https://www.thegioididong.com/tin-tuc/tim-kiem?key=android+8.1" target="_blank" title="Android 8.1" type="Android 8.1">Android 8.1</a> d&agrave;nh cho nh&agrave; ph&aacute;t triển, h&atilde;y c&acirc;n nhắc việc đặt m&atilde; PIN trước khi kh&ocirc;i phục c&agrave;i đặt gốc tr&ecirc;n thiết bị Android của bạn.&nbsp;</h2><p>Tom Bolger, người đ&atilde; chia sẻ tr&ecirc;n trang Reddit cho hay anh đ&atilde; gặp phải một số vấn đề tr&ecirc;n bản Android Beta mới ph&aacute;t h&agrave;nh n&agrave;y khi anh đ&atilde; qu&ecirc;n mẫu h&igrave;nh để mở kh&oacute;a điện thoại của m&igrave;nh. V&igrave; t&iacute;nh năng T&igrave;m thiết bị của bạn (Find my device) kh&ocirc;ng cho ph&eacute;p mở kh&oacute;a thiết bị từ xa n&ecirc;n anh ấy đ&atilde; quyết định kh&ocirc;i phục c&agrave;i đặt gốc v&agrave; kh&ocirc;ng may l&agrave; n&oacute; y&ecirc;u cầu nhập m&atilde; PIN trước đ&oacute; để mở kh&oacute;a.</p><p>Nếu như bạn qu&ecirc;n m&atilde; PIN tr&ecirc;n thiết bị của m&igrave;nh v&agrave; sau đ&oacute; kh&ocirc;i phục c&agrave;i đặt gốc (Factory reset) th&igrave; việc n&agrave;y sẽ kh&ocirc;ng gi&uacute;p &iacute;ch g&igrave;. Đội ngũ hỗ trợ của Google đ&atilde; thừa nhận vấn đề n&agrave;y v&agrave; đ&atilde; đổi cho anh ấy một chiếc Pixel 2 XL kh&aacute;c.</p><p>V&agrave; dường như c&aacute;c thiết bị Pixel C cũng c&oacute; một lỗi ngớ ngẩn l&agrave; thiết bị của họ bỗng nhi&ecirc;n qu&ecirc;n đi mẫu h&igrave;nh m&agrave; người d&ugrave;ng đ&atilde; c&agrave;i sẵn tr&ecirc;n m&aacute;y. Google cũng thừa nhận v&agrave; đang tiến h&agrave;nh v&aacute; lỗi.</p><p>Giả sử ch&uacute;ng ta kết hợp cả 2 lỗi tr&ecirc;n tr&ecirc;n c&ugrave;ng một thiết bị th&igrave; kh&oacute; ai c&oacute; thể lường trước được mức độ nghi&ecirc;m trọng của n&oacute;. V&igrave; vậy m&agrave; người d&ugrave;ng c&aacute;c thiết bị Pixel C kh&ocirc;ng n&ecirc;n tham gia chương tr&igrave;nh beta của phi&ecirc;n bản Android n&agrave;y<img src="/Project/AddPostCollaborator.jspfiles/db9f2a3e-cdad-4fd7-895f-4b53df6ee018.jpeg" style="width: 766px; height: 431.513px;" class="fr-fic fr-dib"></p>', N'CO-kiet-123', N'Nếu bạn đang dùng Android 8.1, hãy cẩn thận khi khôi phục cài đặt gốc', CAST(N'2017-11-06 17:13:02.780' AS DateTime), CAST(N'2017-11-06 17:11:58.947' AS DateTime), 1, 3, N'/Project/MainControllerfiles/bc891c94-b621-419d-897e-91a45ca39a8d.jpeg', N'Nếu bạn đang sử dụng phiên bản Android 8.1 dành cho nhà phát triển, hãy cân nhắc việc đặt mã PIN trước khi khôi phục cài đặt gốc trên thiết bị Android của bạn. ', N'MO-hung-123', 4)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (142, N'<p><img src="/Project/AddPostCollaborator.jspfiles/1790e804-7fac-4237-9143-a9369bfecd7e.jpeg" style="width: 657px; height: 370.11px;" class="fr-fic fr-dib"></p><p><br></p><h2>M&agrave;n h&igrave;nh tr&agrave;n cạnh đ&atilde; trở th&agrave;nh một cơn sốt n&ecirc;n những nh&agrave; sản xuất smartphone lu&ocirc;n muốn bắt kịp xu hướng. V&agrave; <a href="https://www.thegioididong.com/tim-kiem?key=Gionee" target="_blank" title="Gionee " type="Gionee ">Gionee</a> cũng kh&ocirc;ng phải một ngoại lệ khi mới đ&acirc;y, c&oacute; nguồn tin cho biết h&atilde;ng sẽ tung ra đến 8 smartphone m&agrave;n h&igrave;nh loại n&agrave;y v&agrave;o ng&agrave;y 26/11.</h2><p>Th&ocirc;ng tin n&agrave;y được tiết lộ từ mạng x&atilde; hội Weibo (Trung Quốc), tại đ&acirc;y Gionee đ&atilde; chia sẻ lời mời tham dự sự kiện của họ v&agrave;o ng&agrave;y 26/11 ở Th&acirc;m Quyến, Trung Quốc. H&atilde;ng c&ograve;n cho biết th&ecirc;m sự kiện cũng được trực tiếp bởi đ&agrave;i truyền h&igrave;nh vệ tinh Th&acirc;m Quyến.</p><p><br></p>', N'trang', N'Gionee sẽ tung ra 8 smartphone màn hình tràn cạnh vào ngày 26/11', CAST(N'2017-11-06 17:24:08.250' AS DateTime), CAST(N'2017-11-06 17:20:20.393' AS DateTime), 1, 1, N'/Project/MainControllerfiles/7880ec36-7f39-40da-ba37-b7cc11bacffc.jpeg', N'Màn hình tràn cạnh đã trở thành một cơn sốt nên những nhà sản xuất smartphone luôn muốn bắt kịp xu hướng. Và Gionee cũng không phải một ngoại lệ khi mới đây, có nguồn tin cho biết hãng sẽ tung ra đến 8 smartphone màn hình loại này vào ngày 26/11.', N'MO-ha-123', 11)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (144, N'<p>xvasdsasdsadksalkdj aksldj askljd kaslj askldjk asddsaf</p><p>ds</p><p>fsd</p><p>af</p><p>sadfsdaf</p><p>ds</p><p>af</p><p>sad</p><p>fsdf<img src="/Project/AddPostCollaborator.jspfiles/55faa3fa-adc7-4920-8243-44debcafaea5.jpeg" style="width: 300px;" class="fr-fic fr-dib"></p><p>asdasdasd45</p><p>55asd</p><p>asdas3d1a32s1da32sd1a3s2das</p><p>dasd</p><p><img src="/Project/AddPostCollaborator.jspfiles/8dbdc12d-3f4c-4d9b-a35a-1d3d21ed07bb.png" style="width: 300px;" class="fr-fic fr-dib"></p>', N'CO-kiet-123', N'T Đức nè', CAST(N'2017-11-08 12:42:25.350' AS DateTime), CAST(N'2017-11-08 12:38:52.987' AS DateTime), 1, 1, N'/Project/MainControllerfiles/2ef977b9-157e-4304-bf94-c847f550cc58.png', N'T Đức nè', N'MO-elly-123', 3)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (147, N'<h2>Như vậy sau một thời gian đồn đo&aacute;n, <a href="https://www.thegioididong.com/dtdd/samsung-galaxy-note-fe" target="_blank" title="thông tin về note fe" type="thông tin về note fe">Note FE</a> đ&atilde; ch&iacute;nh thức được x&aacute;c nhận sẽ được b&aacute;n ch&iacute;nh h&atilde;ng ngay trong th&aacute;ng 11 n&agrave;y. V&agrave; với việc Note FE xuất hiện tại thị trường Việt Nam với mức gi&aacute; 13.99 triệu, n&oacute; sẽ l&agrave;m ph&acirc;n kh&uacute;c cao cấp m&ugrave;a cuối năm th&ecirc;m phần s&ocirc;i động.</h2><p>Note FE l&agrave; một phi&ecirc;n bản ho&agrave;n to&agrave;n mới chứ kh&ocirc;ng phải l&agrave; một chiếc smartphone lấy lại những linh kiện cũ từ Note 7 t&acirc;n trang. FE trong chữ &quot;Note FE&quot; ch&iacute;nh l&agrave; Fan Edition, ngụ &yacute; rằng đ&acirc;y l&agrave; phi&ecirc;n bản d&agrave;nh cho c&aacute;c fan của chiếc Note 7 n&oacute;i ri&ecirc;ng v&agrave; d&ograve;ng Galaxy Note của Samsung n&oacute;i chung.</p><p>Trong lần mở b&aacute;n trở lại n&agrave;y, những điểm nhấn, cấu h&igrave;nh của Note FE sẽ y hệt như mẫu Note 7 được mở b&aacute;n hồi th&aacute;ng 8/2016 ở nước ta. Chỉ kh&aacute;c hai chỗ: Một l&agrave; phần mặt lưng c&oacute; chữ &quot;Galaxy Note Fan Edition&quot; v&agrave; hai l&agrave; dung lượng pin của m&aacute;y chỉ c&ograve;n 3.200 mAh.</p><p>Vậy theo bạn, với những điểm nhấn như khả năng viết bằng b&uacute;t S-Pen dưới nước, qu&eacute;t mống mắt, cấu h&igrave;nh vẫn thuộc dạng đỉnh. Note FE với mức gi&aacute; 13.99 triệu c&oacute; đủ sức thuyết phục bạn chọn mua? H&atilde;y để lại &yacute; kiến bằng c&aacute;ch comment v&agrave; đưa ra b&igrave;nh chọn của bạn nh&eacute;.<img src="/Project/AddPostCollaborator.jspfiles/ff6296d4-0c18-4def-a21e-553b9ce6a867.jpeg" style="width: 867px; height: 484.956px;" class="fr-fic fr-dib"></p>', N'CO-trung-123', N'Note FE chính hãng sắp mở bán với giá 13.99 triệu, bạn sẽ mua?', CAST(N'2017-11-08 16:18:25.243' AS DateTime), CAST(N'2017-11-08 16:16:44.277' AS DateTime), 1, 3, N'/Project/MainControllerfiles/a6b8648c-797f-496b-a917-b7705b29b60d.jpeg', N'Như vậy sau một thời gian đồn đoán, Note FE đã chính thức được xác nhận sẽ được bán chính hãng ngay trong tháng 11 này. Và với việc Note FE xuất hiện tại thị trường Việt Nam với mức giá 13.99 triệu, nó sẽ làm phân khúc cao cấp mùa cuối năm thêm phần sôi động.', N'MO-ha-123', 0)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (149, N'<p>anh nhớ em nhiều lắm</p><p><br>lacla,cla<br><img src="/Project/AddPostCollaborator.jspfiles/87919227-f91c-44ce-a7a4-83fe116aa881.jpeg" style="width: 704px; height: 396.587px;" class="fr-fic fr-dib"></p>', N'CO-duc-123', N'anh nhớ em nhiều lắm', CAST(N'2017-11-10 09:45:22.180' AS DateTime), CAST(N'2017-11-10 08:55:01.897' AS DateTime), 1, 2, N'/Project/MainControllerfiles/f0c2056f-39e3-4162-b168-f9555b872deb.jpeg', N'anh nhớ em nhiều lắm', N'MO-elly-123', 23)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (150, N'<h2>chiếc m&aacute;y đang nhận được những sự ch&uacute; &yacute; v&agrave; thảo luận từ giới c&ocirc;ng nghệ v&agrave; người d&ugrave;ng. Lần trước m&igrave;nh đ&atilde; tr&ecirc;n tay một chiếc iPhone X m&agrave;u trắng, lần n&agrave;y mời c&aacute;c bạn c&ugrave;ng m&igrave;nh mở hộp phi&ecirc;n bản m&agrave;u đen nh&eacute;.</h2><p>Vỏ hộp t&ocirc;ng trắng với h&igrave;nh ảnh iPhone X đặc trưng.<img src="/Project/AddPostCollaborator.jspfiles/b60d68e2-f4fb-498a-872c-77b120038e28.jpeg" style="width: 785px; height: 442.217px;" class="fr-fic fr-dib"></p><p>Phụ kiện đi k&egrave;m gồm s&aacute;ch hướng dẫn d&agrave;nh ri&ecirc;ng cho iPhone X, củ sạc v&agrave; c&aacute;p sạc Lightning, jack chuyển 3.5 mm sang cổng Lightning, que lấy sim.<img src="/Project/AddPostCollaborator.jspfiles/20f54f05-6d6e-4130-bd58-ce56030f48e6.jpeg" style="width: 768px; height: 432.64px;" class="fr-fic fr-dib"></p><p>123123123</p>', N'CO-trung-123', N'Mở hộp iPhone X màu đen: Nhìn sang hơn màu trắng123123', CAST(N'2017-11-10 10:11:11.450' AS DateTime), CAST(N'2017-11-10 10:09:13.800' AS DateTime), 1, 3, N'/Project/MainControllerfiles/6bc4f1d2-33d4-4733-8108-df3fe3111f7b.jpeg', N'chiếc máy đang nhận được những sự chú ý và thảo luận từ giới công nghệ và người dùng. Lần trước mình đã trên tay một chiếc iPhone X màu trắng, lần này mời các bạn cùng mình mở hộp phiên bản màu đen nhé.123123', N'MO-ha-123', 4)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (151, N'<p>asdasdasdasdasd<br>cjncjkqjcnqkj<br>cqnjcqnckqjc<br>cmqicqocikjqo<img src="/Project/MainControllerfiles/59276d68-6e7f-4240-a617-b2d54885f4ad.jpeg" style="width: 300px;" class="fr-fic fr-dib"></p>', N'CO-kiet-123', N'abcasndakjsd', CAST(N'2017-11-10 10:19:21.520' AS DateTime), CAST(N'2017-11-10 10:16:14.003' AS DateTime), 1, 2, N'/Project/MainControllerfiles/06f62db3-a445-4ffe-b293-7504d57d43ea.jpeg', N'janskdjnasdkjn', N'MO-ha-123', 9)
INSERT [dbo].[Post] ([PostId], [ContentOfPost], [Collaborator], [TitleOfPost], [PostedDay], [PublishedDay], [status], [CategoryId], [SymolPic], [MainContent], [Moderator], [NumberOfView]) VALUES (152, N'<p>kiet de chai</p><h1>5 l&yacute; do n&ecirc;n mua Macbook Air (2017): H&agrave;ng &quot;T&aacute;o&quot; gi&aacute; tốt, nhiều khuyến m&atilde;i<img src="/Project/AddPostCollaborator.jspfiles/fcb6b347-493f-4541-84e9-5a196906ec60.jpeg" style="width: 702px; height: 395.46px;" class="fr-fic fr-dib"></h1><h2>Nếu bạn đang cần t&igrave;m mua một mẫu laptop trong tầm gi&aacute; hơn 20 triệu, <a href="https://www.thegioididong.com/laptop/apple-macbook-air-mqd32sa-a-i5-5350u" target="_blank" title="Laptop Apple Macbook Air MQD32SA/A i5 1.8GHz/8GB/128GB (2017)" type="Laptop Apple Macbook Air MQD32SA/A i5 1.8GHz/8GB/128GB (2017)">Macbook Air MQD32SA/A i5 (2017)</a> l&agrave; sự lựa chọn đ&aacute;ng c&acirc;n nhắc. Thực tế, đ&atilde; c&oacute; rất nhiều người d&ugrave;ng tin tưởng v&agrave; gắn b&oacute; với d&ograve;ng Macbook Air để l&agrave;m việc lẫn giải tr&iacute;.</h2><p>V&igrave; sao vậy? M&igrave;nh sẽ chia sẻ cho c&aacute;c bạn những ưu điểm nổi bật của chiếc m&aacute;y n&agrave;y ngay sau đ&acirc;y.</p><p><br></p>', N'CO-duc-123', N'kiet dep chai quá', CAST(N'2017-11-21 09:36:25.550' AS DateTime), CAST(N'2017-11-21 09:34:54.960' AS DateTime), 1, 1, N'/Project/AddPostCollaborator.jspfiles/78c23ebe-aa5c-4e5f-ac0c-493d2b39c764.jpeg', N'kiet dep chai', N'MO-ha-123', 4)
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[RolePermission] ([RoleId], [RoleName], [Description]) VALUES (1, N'member', N'member')
INSERT [dbo].[RolePermission] ([RoleId], [RoleName], [Description]) VALUES (2, N'collaborator', N'collaborator')
INSERT [dbo].[RolePermission] ([RoleId], [RoleName], [Description]) VALUES (3, N'moderator', N'moderator')
INSERT [dbo].[RolePermission] ([RoleId], [RoleName], [Description]) VALUES (4, N'admin', N'admin')
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'admin', N'123', N'admin', CAST(N'2017-07-18 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 1, 4, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-abc-123', N'123', N'abc', CAST(N'3333-02-12 00:00:00.000' AS DateTime), N'1234567891', N'123', N'aca', 0, 1, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-duc-001', N'0903925777', N'kiet', CAST(N'2017-02-01 00:00:00.000' AS DateTime), N'0903925777', N'asd', N'abc123@abc.com', 1, 3, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-duc-123', N'123', N'Nguyễn Hồng Đức', CAST(N'2017-03-30 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'duc@yahoo.com', 1, 2, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-huy-123', N'123', N'Phạm Gia Huy', CAST(N'2017-07-19 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 1, 2, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-kiet-123', N'123', N'kiet dap chai', CAST(N'2017-03-20 00:00:00.000' AS DateTime), N'1234567891', N'456', N'aca123@yaho.com', 1, 2, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'CO-trung-123', N'123', N'Nguyễn Hoàng Anh Trung', CAST(N'2016-02-13 00:00:00.000' AS DateTime), N'1234567891', N'q3 tphcm', N'trung123@gmail.com', 0, 2, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'kiet', N'123', N'pham tuan kiet', CAST(N'2017-11-11 00:00:00.000' AS DateTime), N'1234567891', N'asdasd', N'asdasd@asd.com', 1, 1, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'MO-elly-123', N'123', N'Elly Trần Phú Hà Nội', CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'1234567891', N'q2 tphcm', N'ellytran123@yahoo.com', 0, 3, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'MO-ha-123', N'123', N'Hồ Ngọc Hà', CAST(N'2014-02-06 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 0, 3, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'MO-hung-123', N'123', N'Đàm Vĩnh Hưng', CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 1, 3, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'MO-sang-123', N'123', N'Phạm Văn Sang', CAST(N'1993-03-30 00:00:00.000' AS DateTime), N'1234567891', N'q3 tphcm', N'sang@yahoo.com', 1, 3, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'phạm tuấn kiệt', N'123456', N'Phạm Tuấn Kiệt', CAST(N'1997-07-17 00:00:00.000' AS DateTime), N'1234567891', N'asdasd', N'kiet@yahoo.com', 1, 1, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'reader', N'456', N'Hồ Hoàn Kiếm', CAST(N'1930-07-17 00:00:00.000' AS DateTime), N'1234567891', N'q4 tphcm', N'kiem@gmail.com', 1, 1, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'reader1', N'123', N'reader1', CAST(N'1997-02-03 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 0, 2, 0)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'reader2', N'123', N'reader2', CAST(N'2013-03-23 00:00:00.000' AS DateTime), N'1234567891', N'abc', N'abc', 1, 1, 1)
INSERT [dbo].[Users] ([UserId], [Password], [Fullname], [Birthday], [Phone], [Address], [Mail], [Sex], [Role], [StatusId]) VALUES (N'trang', N'123', N'trang', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'12345678921', N'asd', N'asd', 1, 1, 1)
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Users] FOREIGN KEY([Collaborator])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Users]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Users1] FOREIGN KEY([Moderator])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_RolePermission] FOREIGN KEY([Role])
REFERENCES [dbo].[RolePermission] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_RolePermission]
GO
USE [master]
GO
ALTER DATABASE [X-Future] SET  READ_WRITE 
GO
