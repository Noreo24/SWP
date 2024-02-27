USE [Phone_Shop_Online_3]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[gender] [bit] NULL,
	[password] [varchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[author_id] [int] NULL,
	[updated_date] [date] NULL,
	[content] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](max) NULL,
	[brief_infor] [nvarchar](max) NULL,
	[categoryBlog_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_blog]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_blog](
	[categoryBlog_id] [int] IDENTITY(1,1) NOT NULL,
	[categoryBlog_name] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Category_blog] PRIMARY KEY CLUSTERED 
(
	[categoryBlog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[gender] [bit] NULL,
	[password] [varchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__User__CB9A1CFF404D73E0] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedBack_id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[rated_star] [float] NULL,
	[feedback] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[product_id] [int] NULL,
	[userId] [int] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK__Feedback__7012E843FBF9D24D] PRIMARY KEY CLUSTERED 
(
	[feedBack_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Headphone_detail]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Headphone_detail](
	[connect] [nchar](500) NULL,
	[headphone_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
	[using_time] [nvarchar](500) NULL,
	[sound_tech] [nvarchar](500) NULL,
	[micro] [bit] NULL,
	[control_method] [nvarchar](500) NULL,
	[waterproof] [nvarchar](500) NULL,
	[product_id] [int] NULL,
	[other_feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_Headphone_detail] PRIMARY KEY CLUSTERED 
(
	[headphone_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptop_detail]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop_detail](
	[laptop_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
	[screen_size] [nvarchar](500) NULL,
	[screen_tech] [nvarchar](500) NULL,
	[chip] [nvarchar](500) NULL,
	[ram] [nvarchar](500) NULL,
	[pin] [nvarchar](500) NULL,
	[operation_system] [nvarchar](500) NULL,
	[screen_feature] [nvarchar](500) NULL,
	[product_id] [int] NULL,
	[other_feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_Laptop_detail] PRIMARY KEY CLUSTERED 
(
	[laptop_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Management]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Management](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[gender] [bit] NULL,
	[password] [varchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[admin_create_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Management] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[total_cost] [int] NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[status_order] [int] NULL,
	[userId] [int] NULL,
	[saler_id] [int] NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK__Order__46596229CBCF2098] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[orderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_price] [int] NULL,
	[quantity] [int] NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[total_cost] [int] NULL,
 CONSTRAINT [PK__Order_De__317953247CDC0CB7] PRIMARY KEY CLUSTERED 
(
	[orderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone_detail]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone_detail](
	[phone_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[screen_size] [nvarchar](500) NULL,
	[screen_tech] [nvarchar](500) NULL,
	[camera_rear] [nvarchar](max) NULL,
	[front_camera] [nvarchar](max) NULL,
	[chip] [nvarchar](500) NULL,
	[ram] [nvarchar](500) NULL,
	[rom] [nvarchar](500) NULL,
	[pin] [nvarchar](500) NULL,
	[sim] [nvarchar](500) NULL,
	[operation_system] [nvarchar](500) NULL,
	[screen_feature] [nvarchar](500) NULL,
	[product_id] [int] NULL,
	[other_feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phone_detail] PRIMARY KEY CLUSTERED 
(
	[phone_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[original_prices] [int] NULL,
	[sale] [bit] NULL,
	[sale_prices] [int] NULL,
	[product_highlights] [nvarchar](max) NULL,
	[product_description] [nvarchar](max) NULL,
	[trademark_id] [int] NULL,
	[status] [bit] NULL,
	[quantity] [int] NULL,
	[guarantee] [int] NULL,
	[category_id] [int] NULL,
	[update_date] [date] NULL,
	[sole] [int] NULL,
	[management_id] [int] NULL,
	[avr_rated_star] [int] NULL,
 CONSTRAINT [PK__Product__47027DF56173B414] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Images]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Images](
	[products_images_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[status] [bit] NULL,
	[images] [varchar](max) NULL,
 CONSTRAINT [PK__Products__5C0F95CEB6C25817] PRIMARY KEY CLUSTERED 
(
	[products_images_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tablet_detail]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablet_detail](
	[tablet_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[screen_size] [nvarchar](500) NULL,
	[screen_tech] [nvarchar](500) NULL,
	[camera_rear] [nvarchar](max) NULL,
	[front_camera] [nvarchar](max) NULL,
	[chip] [nvarchar](500) NULL,
	[ram] [nvarchar](500) NULL,
	[rom] [nvarchar](500) NULL,
	[pin] [nvarchar](500) NULL,
	[sim] [nvarchar](500) NULL,
	[operation_system] [nvarchar](500) NULL,
	[screen_feature] [nvarchar](500) NULL,
	[product_id] [int] NULL,
	[other_feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tablet_detail] PRIMARY KEY CLUSTERED 
(
	[tablet_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trademark]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trademark](
	[trademark_id] [int] IDENTITY(1,1) NOT NULL,
	[trademark_name] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Trademark] PRIMARY KEY CLUSTERED 
(
	[trademark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Whistlist]    Script Date: 2/27/2024 12:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whistlist](
	[whistlist_id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
 CONSTRAINT [PK_Whistlist] PRIMARY KEY CLUSTERED 
(
	[whistlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [status]) VALUES (3, N'Chau Lan', N'TXGTQCZQZA_LanChauAdmin_Admin.jpeg', 1, N'1', N'LanChauAdmin', N'LanChau@1998.com', N'0895625982', N'Ha Noi', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Mobile')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Laptop')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Tablet')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Headphone')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([userId], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [status]) VALUES (1, N'Nguyễn Hà Dương21', N'FFQWLXTTKM_tung123_Customer.jpeg', 0, N'1', N'tung123', N'duong123@gmail.com', N'09461728741', N'Phủ Lý, Hà Nam21', 1)
INSERT [dbo].[Customer] ([userId], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [status]) VALUES (2, N'tran tung', N'FXIKJAWQYF_tung111.jpeg', 0, N'1', N'tung111', N'tung050903@gmail.com', N'0987583729', N'Ha Nam', 1)
INSERT [dbo].[Customer] ([userId], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [status]) VALUES (3, N'Chau Lan', N'https://th.bing.com/th?id=OIP.idxieg0qmCadLdK1muY5bgHaJo&w=219&h=285&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2', 1, N'123', N'LanChau', N'LanChau@1998.com', N'0895625982', N'Ha Noi', 1)
INSERT [dbo].[Customer] ([userId], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [status]) VALUES (4, N'Nguyễn Hà Dương', NULL, 1, N'123456', N'duong123', N'duong123@gmail.com', N'0946172874', N'Phủ Lý, Hà Nam', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (1, N'Bùi Anh Tuấn', 5, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (2, N'Trần Thị Phương Thảo', 4, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (3, N'Nguyễn Tùng Dương', 3, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (4, N'Trần Đoàn Nguyên Khánh', 3, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (5, N'Tạ Trường Giang', 2, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (6, N'Dương Thị Hạnh', 1, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (7, N'Ngô Duy Hiếu', 5, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (8, N'Trần Thanh Huyền', 4, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (9, N'Nguyễn Minh Khoa', 5, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (10, N'Bùi Tiến Dũng', 4, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (11, N'Nguyễn Minh Đức', 5, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 1, CAST(N'2024-01-16' AS Date))
INSERT [dbo].[Feedback] ([feedBack_id], [fullName], [rated_star], [feedback], [image], [status], [product_id], [userId], [date]) VALUES (12, N'Nguyễn Hải Nam', 4, N'Sản phẩm tốt, dễ sử dụng, giao hàng nhanh,...', N'No image', 1, 5, 2, CAST(N'2024-01-14' AS Date))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Headphone_detail] ON 

INSERT [dbo].[Headphone_detail] ([connect], [headphone_detail_id], [color], [using_time], [sound_tech], [micro], [control_method], [waterproof], [product_id], [other_feature]) VALUES (N'Bluetooth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1, NULL, N'Tai nghe: Dùng 6 giờ <br> Hộp sạc: Dùng 30 giờ', N'Active Noise Cancellation <br> Chip Apple H2 <br> Adaptive EQ', 1, N'Cảm ứng chạm', N'IP54 (trên cả hộp sạc và tai nghe)', 9, N'Chip Apple U1 trong Hộp Sạc MagSafe (USB‑C)')
INSERT [dbo].[Headphone_detail] ([connect], [headphone_detail_id], [color], [using_time], [sound_tech], [micro], [control_method], [waterproof], [product_id], [other_feature]) VALUES (N'Bluetooth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 2, NULL, N'Tai nghe: Dùng 5 giờ <br> Hộp sạc: Dùng 24 giờ', NULL, 1, N'Chạm 2 lần', N'Không chống nước', 10, NULL)
SET IDENTITY_INSERT [dbo].[Headphone_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Laptop_detail] ON 

INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (1, NULL, N'13.3 inches', N'Độ sáng 400 nits
<br>Hỗ trợ dải màu P3<br>
True-Tone', N'8 nhân với 4 nhân hiệu năng cao và 4 nhân tiết kiệm điện', N'8GB', N'49.9-watt lithium-polymer, củ sạc công suất 30W', N'macOS Big Sur', N'2560 x 1600 pixels (2K)', 6, N'Cảm biến vân tay Touch ID, 720p FaceTime HD camera')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (2, NULL, N'13.6 inches', N'Liquid Retina Display', N'Apple M2', N'8GB', N'52,6 Wh', N'MacOS', N'2560 x 1664 pixels', 5, N'Ổ cứng SSD')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (3, NULL, N'13.3 inches', N'Công nghệ chống chói', N'i5-1145G7', N'16GB', N'3 Cell, 41 Wh', N'Windows 11', N'1080 x 1920 pixels (FullHD)', 3, N'Ổ cứng SSD, Wi-Fi 6')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (4, NULL, N'15.6 inches', N'Tấm nền Led', N'Intel Core i5-1135G7 (8 MB cache, 4 nhân, 8 luồng, xung nhịp tốt đa 4.20 GHz Turbo)', N'8GB', N'3 Cell, 41 Wh', N'Windows 11 Home', N'1080 x 1920 pixels (FullHD)', 4, N'Ổ cứng SSD, Wi-Fi 6')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (5, NULL, N'14 inches', N'Độ sáng tối đa 250nits. Độ phủ màu 45% NTSC. Màn hình chống chó', N'AMD Ryzen 5 7520U (4MB cache, up to 4.3 GHz, 4 lõi/8 luồng)', N'16GB', N'42WHrs, 3S1P, Li-ion 3 cell', N'Windows 11 Home', N'1920 x 1080 pixels (FullHD)', 7, N'Ổ cứng SSD, Wi-Fi 6, Bảo mật vân tay')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (6, NULL, N'14 inches', N'Thời gian phản hồi 0.2ms<br>Độ sáng tối đa 600nits HDR<br>Độ phủ màu 100% DCI-P3<br>Display HDR True Black 600<br>1.07 tỷ màu<br>PANTONE Validated<br>Glossy display<br>Giảm ánh sáng xanh 70%<br>
SGS Eye Care Displa', N'AMD Ryzen 5 7530U (2.0GHz, 6 lõi / 12 luồng, 16MB cache, up to 4.5 GHz max boost)', N'16GB', N'75WHrs, 2S2P, 4-cell Li-ion', N'Windows 11 Home', N'2880 x 1800 pixels', 8, N'Ổ cứng SSD, Wi-Fi 6, Bảo mật vân tay, Màn hình Oled')
SET IDENTITY_INSERT [dbo].[Laptop_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Phone_detail] ON 

INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (1, N'6.7 inches', N'Super Retina XDR OLED', N'Camera chính: 48MP, 24 mm, ƒ/1.78,
		Camera góc siêu rộng: 12 MP, 13 mm, ƒ/2.2
		Camera Tele 5x: 12 MP, 120 mm, ƒ/2.8
		Camera Tele 2x: 12 MP, 48 mm, ƒ/1.78', N'12MP, ƒ/1.9', N'A17 Pro', N'8 GB', N'256 GB', N'4422 mAh', N'2 SIM (Nano‑SIM và eSIM)', N'iOS 17', N'Tốc độ làm mới 120Hz
		460 ppi
		HDR
		True Tone
		Dải màu rộng (P3)
		Haptic Touch
		Tỷ lệ tương phản 2.000.000:1', 1, NULL)
INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (2, N'6.67 inches', N'AMOLED', N'Camera chính: 50MP, f/1.8
		Camera góc rộng: 8MP, f/2.2
		Camera Macro: 2MP, f/2.4', N'13MP, f/2.45', N'Qualcomm Snapdragon 685', N'4 GB', N'128 GB', N'5000 mAh', N'2 SIM (Nano-SIM)', N'Android 12', N'Tần số quét 120Hz, độ sáng 1200nits Corning® Gorilla® Glass 3', 2, NULL)
INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (3, N'6.7 inches', N'Dynamic AMOLED 2X', N'Camera siêu rộng: 12MP, F2.2, 123°, 1.12 μm, FF
		Camera chính: 12MP, F1.8, Dual Pixel, 1.8μm, OIS', N'10MP, F2.4, 1.22μm', N'Snapdragon 8 Gen 2 for Galaxy', N'8 GB', N'256 GB', N'3700 mAh', N'2 SIM (Nano‑SIM và eSIM)', N'Android 13', N'Màn hình trong: Dynamic AMOLED 2X, FHD+ (2640 x 1080 Pixels), 120 Hz, Ultra Thin Glass, độ sáng tối đa 1000nits. Màn hình phụ: 3.4" (720x748) Super AMOLED, 60Hz, 306ppi, Corning Gorilla Glass Victus 2', 3, NULL)
INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (4, N'6.5 inches', N'Super AMOLED', N'Camera chính: 50MP
		Camera phụ: 5 MP, 2MP', N'13MP', N'MediaTek Helio G99 8 nhân', N'8 GB', N'128 GB', N'5000 mAh', N'2 SIM (Nano‑SIM)', N'Android 14', N'Tần số quét 90 Hz
		Độ sáng tối đa: 800 nits
		Mặt kính cảm ứng: Kính cường lực', 4, NULL)
INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (5, N'6.67 inches', N'AMOLED', N'Camera chính: 108MP, f/1.9, 1/1.52"
		Camera góc siêu rộng: 8MP, f/2.2, FOV 120°
		Camera cận cảnh: 2MP, f/2.4
		Camera chiều sâu: 2MP, f/2.4', N'16MP, f/2.45', N'Qualcomm SM7150 Snapdragon 732G (8 nm)', N'8 GB', N'256 GB', N'5000 mAh', N'2 SIM (Nano-SIM)', N'MIUI 13 dựa trên Android 11', N'Tần số quét 120Hz, Độ sáng tối đa 1100 nits Corning® Gorilla® Glass 5', 5, NULL)
INSERT [dbo].[Phone_detail] ([phone_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (6, N'6.8 inches', N'AMOLED', N'Camera góc rộng: 50MP, f/1.8, 23mm, PDAF
		Camera góc siêu rộng 8MP, f/2.2, 112˚', N'Camera góc rộng: 32MP, f/2.4, 22mm, AF', N'MediaTek 9000+ (4nm)', N'8 GB', N'256 GB', N'4300 mAh', N'2 SIM (Nano-SIM)', N'Android 13', N'Có thể gập lại
		Màn hình chính: FHD+ (2520×1080), 120Hz, 16,7 triệu màu, 403 PPI, 1200nit, AMOLED, Kính siêu mỏng UTG
		Màn hình phụ: 720×382, 30/60Hz, 250 PPI, 800nit, Corning Gorilla Glass 5', 6, NULL)
SET IDENTITY_INSERT [dbo].[Phone_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (1, N'iPhone 15 Pro Max 256GB', 34990000, 1, 32990000, N'<li> - Thiết kế khung viền từ titan chuẩn hàng không vũ trụ - Cực nhẹ, bền cùng viền cạnh mỏng cầm nắm thoải mái</li>
		<li> - Hiệu năng Pro chiến game thả ga - Chip A17 Pro mang lại hiệu năng đồ họa vô cùng sống động và chân thực</li>
		<li> - Thoả sức sáng tạo và quay phim chuyên nghiệp - Cụm 3 camera sau đến 48MP và nhiều chế độ tiên tiến</li>
		<li> - Nút tác vụ mới giúp nhanh chóng kích hoạt tính năng yêu thích của bạn</li>', N'<p style="text-align: justify;"><strong style="color: red">Xiaomi Redmi Note 12 </strong>sở hữu <strong>màn hình Super AMOLED </strong>với <strong>tần số quét 120Hz </strong>giúp trải nghiệm chạm vuốt diễn ra mượt mà, <strong>camera AI 50MP </strong>chất lượng. Bên cạnh đó, điện thoại sẽ được chạy trên con <strong>chip Qualcomm Snapdragon 685 </strong>kêt hợp với <strong>card đồ họa GPU Qualcomm Adreno 610 </strong>mang lại trải nghiệm dùng ổn định. Điện thoại Xiaomi Redmi Note 12 mang lại thời gian sử dụng vượt trội với viên <strong>pin 5000mAh </strong>cùng <strong>sạc nhanh công suất 33W</strong>.', 1, 1, 203, NULL, 1, CAST(N'2024-01-08' AS Date), 17, NULL, 5)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (2, N'Xiaomi Redmi Note 12 4GB 128GB', 4990000, 1, 3790000, N'<li> - Trải nghiệm thị giác siêu đã với màn hình 6.67 inch cùng tấm nền AMOLED thời thượng</li>
		<li> - Chiến game cực mượt với chip Snapdragon mạnh mẽ cùng màn hình tần số quét 120Hz</li>
		<li> - Năng lượng cho cả ngày dài nhờ vào viên pin lên đến 5000mAh đi kèm sạc nhanh 33W</li>
		<li> - Lưu giữ mọi khoảnh khắc với 3 camera sau 50 MP và tính năng làm đẹp AI thông minh</li>', N'<p style="text-align: justify;"><strong style="color: red">Xiaomi Redmi Note 12 </strong>sở hữu <strong>màn hình Super AMOLED </strong>với <strong>tần số quét 120Hz </strong>giúp trải nghiệm chạm vuốt diễn ra mượt mà, <strong>camera AI 50MP </strong>chất lượng. Bên cạnh đó, điện thoại sẽ được chạy trên con <strong>chip Qualcomm Snapdragon 685 </strong>kêt hợp với <strong>card đồ họa GPU Qualcomm Adreno 610 </strong>mang lại trải nghiệm dùng ổn định. Điện thoại Xiaomi Redmi Note 12 mang lại thời gian sử dụng vượt trội với viên <strong>pin 5000mAh </strong>cùng <strong>sạc nhanh công suất 33W</strong>.</p>', 5, 1, 135, NULL, 1, CAST(N'2024-01-08' AS Date), 85, NULL, 4)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (3, N'Samsung Galaxy Z Flip5 256GB', 25990000, 1, 16890000, N'<li> - Thần thái nổi bật, cân mọi phong cách- Lấy cảm hứng từ thiên nhiên với màu sắc thời thượng, xu hướng</li>
		<li> - Thiết kế thu hút ánh nhìn - Gập không kẽ hỡ, dẫn đầu công nghệ bản lề Flex</li>
		<li> - Tuyệt tác selfie thoả sức sáng tạo - Camera sau hỗ trợ AI xử lí cực sắc nét ngay cả trên màn hình ngoài</li>
		<li> - Bền bỉ bất chấp mọi tình huống - Đạt chuẩn kháng bụi và nước IP68 cùng chất liệu nhôm Armor Aluminum giúp hạn chế cong và xước</li>', N'<p style="text-align: justify;"><strong>Samsung Galaxy Z Flip 5 </strong>có thiết kế màn hình rộng <strong>6.7 inch </strong>và độ phân giải <strong>Full HD+ (1080 x 2640 Pixels) </strong>, dung lượng <strong>RAM 8GB </strong>, bộ nhớ trong <strong>256GB </strong>. Màn hình <strong>Dynamic AMOLED 2X </strong>của điện thoại này hiển thị rõ nét và sắc nét, mang đến trải nghiệm ấn tượng khi sử dụng.</p>', 2, 1, 191, NULL, 1, CAST(N'2024-01-08' AS Date), 69, NULL, 4)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (4, N'Laptop Dell Inspirion 15 3511 PDP3H', 14990000, 1, 13490000, N'<li> - Sở hữu thiết kế mỏng nhẹ, trọng lượng chỉ 1.12kg thích hợp bỏ trong balo mang theo bên người</li>
		<li> - CPU&nbsp;i5-1145G7 giúp bạn giải quyết được các công việc văn phòng cũng như chỉnh sửa hình ảnh nhẹ trên PTS</li>
		<li> - Ổ cứng SSD 256GB cho phép bạn lưu trữ một lượng lớn dữ liệu trên máy tính mà không cần copy ra USB</li>
		<li> - RAM 16GB giúp bạn mở liên tục các cửa sổ công việc mà không lo bị giật lag, đứng máy</li>', N'Laptop Dell Inspiron 15 3511 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.', 10, 1, 14, NULL, 2, CAST(N'2024-01-07' AS Date), 30, NULL, 3)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (5, N'Apple Macbook Air M2 2022 8GB 256GB', 32900000, 1, 26490000, N'<li> - Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg</li>
		<li> - Hiệu năng hàng đầu - Chip Apple M2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier</li>
		<li> - Đa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc</li>
		<li> - Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits</li>
		<li> - Âm thanh sống động - 4 loa tramg bị công nghệ Dolby Atmos và âm thanh đa chiều</li>', N'Macbook Air M2 2022 với thiết kế sang trọng, vẻ ngoài siêu mỏng đầy lịch lãm. Mẫu Macbook Air mới với những nâng cấp về thiết kế và cấu hình cùng giá bán phải chăng, đây sẽ là một thiết bị lý tưởng cho công việc và giải trí.', 1, 1, 30, NULL, 2, CAST(N'2024-01-07' AS Date), 4, NULL, 3)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (6, N'Apple MacBook Air M1 256GB 2020 ', 22990000, 1, 19190000, N'<li> - Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân van phòng</li>
		<li> - Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel, chỉnh sửa ảnh trên các phần mềm nhu AI, PTS</li>
		<li> - Ða nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm</li>
		<li> - Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng</li>
		<li> - Chất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc</li>
		<li> - Thiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi</li>', N'Macbook Air M1 2020 - Sang trọng, tinh tế, hiệu nang khủng. Macbook Air M1 là dòng sản phẩm có thiết kế mỏng nhẹ, sang trọng và tinh tế cùng với đó là giá thành phải chăng nên MacBook Air dã thu hút được đông đảo người dùng yêu thích. Ðây cũng là một trong những phiên bản Macbook Air mới nhất mà khách hàng không thể bỏ qua.', 1, 1, 110, NULL, 2, CAST(N'2024-01-07' AS Date), 12, NULL, 5)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (7, N'Laptop Asus VivoBook Go 14 E1404FA-NK177W', 14490000, 1, 12790000, N'<li> - Sở hữu thiết kế sang trọng, trọng lượng nhẹ, dễ dàng mang theo bên mình</li>
		<li> - RAM 16GB giúp bạn dễ dàng các tab mà không lo lag máy</li>
		<li> - Ở cứng SSD 512GB giúp bạn có không gian lưu trữ lớn</li>
		<li> - Sở hữu cảm biến vân tay giúp thao tác mở màn hình thuận tiện hơn</li>', N'Là một sản phẩm thuộc series Asus Vivobook do đó laptop Asus Vivobook Go 14 E1404FA-NK177W sở hữu nhiều đặc điểm của series này. Bên cạnh đó là nhiều tính năng được nâng cấp, hỗ trợ tối ưu trong quá trình sử dụng của người dùng.', 7, 1, 23, NULL, 2, CAST(N'2024-01-08' AS Date), 4, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (8, N'Laptop Asus Zenbook 14 OLED UM3402YA-KM405W', 24990000, 1, 20990000, N'<li> - CPU AMD Ryzen 5 7530U xử lý nhanh chóng mọi tác vụ học tập, văn phòng.</li>
		<li> - Màn hình 14 inch OLED 2.8K cho màu sắc hiển thị rực rỡ, chân thực cùng công nghệ lọc ánh sáng xanh lên đến 70%.</li>
		<li> - Đồ họa AMD Radeon Graphics dễ dàng chỉnh sửa hình ảnh cơ bản hay chơi các tựa game nhẹ.</li>
		<li> - Bộ nhớ RAM 16GB LPDDR4X chạy nhiều ứng dụng cùng lúc mà không lo lag giật.</li>
		<li> - Ổ cứng SSD 512GB cho tốc độc truy cập dữ liệu nhanh chóng.</li>
		<li> - Lớp vỏ được làm từ kim loại cao cấp, khối lượng gọn nhẹ chỉ 1.39 kg.</li>', N'Laptop Asus Zenbook 14 OLED UM3402YA-KM405W sở hữu sức mạnh đỉnh cao với vi xử lý AMD Ryzen 5 - 7530 2.0 GHz, RAM 16GB LPDDR4X ổn định trong mọi tác vụ. Với ổ SSD 512GB M.2 NVMe™ PCIe® 3.0, Zenbook 14 đảm bảo dung lượng lớn để lưu trữ dữ liệu. Màn hình laptop Asus Zenbook 14" NanoEdge OLED 2.8K của máy mang lại trải nghiệm hiển thị tuyệt vời với khả năng lọc ánh sáng xanh đến 70%. ', 7, 1, 20, NULL, 2, CAST(N'2024-01-08' AS Date), 9, NULL, 4)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (9, N'Tai nghe Bluetooth Apple AirPods Pro 2 2023 USB-C', 5990000, 0, 5990000, N'<li> - Tích hợp chip Apple H2 mang đến chất âm sống động cùng khả năng tái tạo âm thanh 3 chiều vượt trội</li>
		<li> - Công nghệ Bluetooth 5.3 kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp tiết kiệm pin đáng kể</li>
		<li> - Chống ồn chủ động loại bỏ tiếng ồn hiệu quả gấp đôi thế hệ trước, giúp nâng cao trải nghiệm nghe nhạc</li>
		<li> - Chống nước chuẩn IP54 trên tai nghe và hộp sạc, giúp bạn thỏa sức tập luyện không cần lo thấm mồ hôi</li>', N'Airpods Pro 2 Type-C với công nghệ khử tiếng ồn chủ động mang lại khả năng khử ồn lên gấp 2 lần mang lại trải nghiệm nghe - gọi và trải nghiệm âm nhạc ấn tượng. Cùng với đó, điện thoại còn được trang bị công nghệ âm thanh không gian giúp trải nghiệm âm nhạc thêm phần sống động. Airpods Pro 2 Type-C với cổng sạc Type C tiện lợi cùng viên pin mang lại thời gian trải nghiệm lên đến 6 giờ tiện lợi.', 1, 1, 3, NULL, 4, CAST(N'2024-01-08' AS Date), 2, NULL, 5)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (10, N'Tai nghe Bluetooth Apple AirPods 2', 3990000, 1, 2790000, N'<li> - Phản hồi nhanh hơn và tiết kiệm năng lượng nhờ vào con chip Apple H1</li>
		<li> - Thiết kế sang trọng, gọn nhẹ tạo cảm giác thoải mái khi đeo hàng giờ liền</li>
		<li> - Tích hợp 2 micro khử tiếng ồn cho chất lượng âm thanh tốt khi đàm thoại</li>
		<li> - Hỗ trợ công nghệ sạc nhanh, chỉ mất 15 phút là đã có ngay 3 giờ sử dụng</li>', N'Vừa qua, Apple đã chính thức cho ra mắt chiếc tai nghe Apple Airpods 2 sở hữu chip H1 được dành riêng giúp chuyển nhanh các cuộc gọi từ iPhone sang Airpods cũng như giảm mức tiêu thụ điện năng cực kỳ thấp. Thời gian sử dụng đến 5 giờ nghe nhạc hoặc 3 giờ đàm thoại và khi kết hợp với hộp sạc cho thời gian đến 24 giờ. Kết nối không dây chất lượng cao, tự động bật và luôn kết nối giúp sẵn sàng theo bạn đến bất kỳ đâu. Cùng tham khảo thêm về chiếc Airpod 2 này nhé.', 1, 1, 23, NULL, 4, CAST(N'2024-01-08' AS Date), 23, NULL, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (11, N'Xiaomi Pad 5 (6GB/256GB)', 10490000, 1, 7490000, N'<li> - Thiết kế mỏng nhẹ, tinh tế - Thiết kế vuông vức, chỉ dày khoảng 7mm và nặng 500g</li>
		<li> - Trải nghiệm không gian không giới hạn - Màn hình 11" IPS LCD, độ phân giải 2K, hỗ trợ HDR10 và 120Hz</li>
		<li> - Hiệu năng vượt trội - Chip Snapdragon 860 mạnh mẽ, RAM 6 GB, GPU Adreno 640</li>
		<li> - Dung lượng pin dồi dào - Viên pin khủng 8720mAh, hỗ trợ sạc nhanh 33W</li>', N'<p style="text-align: justify;"><strong>Xiaomi Mi Pad 5 </strong>được cung cấp sức mạnh bởi con <strong>chip Snapdragon 860 </strong>kết hợp <strong>RAM 6GB </strong>mang lại hiệu năng mạnh mẽ cùng <strong>bộ nhớ trong lên đến 256GB </strong>giúp bạn tha hồ lưu trữ dữ liệu, hình ảnh và video.</p>', 5, 1, 31, NULL, 3, CAST(N'2024-01-08' AS Date), 69, NULL, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (12, N'Nokia T21 4GB 128GB', 5990000, 1, 5750000, N'<li> - Bền bỉ vượt thời gian - Vật liệu bền bỉ chắc chắn, pin sử dụng đến 3 ngày và cập nhật bảo mật hàng tháng trong 3 năm</li>
		<li> - Dễ dàng giải trí với màn hình chuẩn 2K - Kích thước 10,36 inch vừa vặn cùng độ phân giải 2K và hỗ trợ Netflix HD</li>
		<li> - Kết nối với bất kỳ ai, ở bất kỳ đâu - Gọi video HD, gọi thoại và SMS nhanh chóng với WiFi+4G và hỗ trợ SIM</li>
		<li> - Phác thảo ý tưởng đơn giản và dễ dàng - Hỗ trợ và tương thích với công nghệ bút Wacom WGP và Wacom Active ES™ 2.0</li>', N'<p style="text-align: justify;"><strong>Nokia T21 </strong>sở hữu cho mình một <strong>bộ vi xử lý và đồ hoạ cực kỳ mạnh mẽ là Unisoc Tiger T612 và Mali-G57</strong>. Với thiết kế màn hình lên tới <strong>10.4 inches</strong>, <strong>độ phân giải FHD</strong>, <strong>pin 8200mAh </strong>cùng <strong>sạc nhanh 18W</strong>, chiếc máy tính bảng Nokia này sẵn sàng đáp ứng mọi nhu cầu của người dùng về xử lý công việc, lướt web, xem phim, chơi game, giải trí…</p>', 4, 1, 14, NULL, 3, CAST(N'2024-01-08' AS Date), 86, NULL, 4)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (13, N'Samsung Galaxy A15 LTE 8GB 128GB', 4990000, 0, 4990000, N'<li> - Giải trí đa nội dung - Màn hình lớn 6.5inch với công nghệ Super AMOLED cho hình ảnh sắc nét</li>
		<li> - Dễ dàng xử lí mọi tác vụ - Chip MediaTek Helio G99 cùng RAM 8GB cực chiến</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 5000mAh với công nghệ sạc nhanh 25W</li>
		<li> - Quay chụp chuẩn điện ảnh - Cụm 3 camera sau lên đến 50MP cho hình ảnh chất lượng</li>', N'<p style="text-align: justify;"><strong style="color: red">Samsung Galaxy A15 </strong>được trang bị công nghệ màn hình cao cấp <strong>Super AMOLED </strong>, với độ phân giải <strong>FHD+ 1080 x 2340 pixel</strong>. Màn hình của sản phẩm lớn <strong>6.5inch </strong>kết hợp với tần số quét nhanh, hạn chế tình trạng bị chớp màn hình hay bị nhòe khi sử dụng. Chiếc điện thoại mới của dòng <strong>Samsung Galaxy A </strong>này còn có cụm camera sắc nét và bộ nhớ lớn <strong>8B+128GB </strong>sử dụng thả ga.</p>', 2, 1, 154, NULL, 1, CAST(N'2024-01-08' AS Date), 78, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (14, N'Xiaomi Redmi Note 12 Pro 4G 8GB 256GB', 7990000, 1, 6790000, N'<li> - Màn hình 6.67 inch và tấm nền AMOLED mang đến không gian hiển thị hình ảnh đẹp mắt</li>
		<li> - Vi xử lý  Snapdragon® 732G kết hợp chip đồ hoạ Adreno 618 giúp chiến game mượt mà</li>
		<li> - Thoả niềm đam mê nhiếp ảnh cùng hệ thống 3 camera với ống kính chính lên đến 50 MP</li>
		<li> - Viên pin dung lượng 5000 mAh cho khả năng hoạt động cả ngày dài ở các tác vụ cơ bản</li>', N'<p style="text-align: justify;"><strong>Xiaomi Redmi Note 12 Pro 4G </strong>là mẫu điện thoại tầm trung mới của hãng Xiaomi vừa được ra mắt vào tháng 4 năm 2023. Mẫu điện thoại Xiaomi mới này được trang bị <strong>màn hình 6.67 inch </strong>cùng <strong>tần số quét tới 120Hz </strong>giúp các chuyển động mượt mà, đặc biệt trong các trận chiến game. Xiaomi Redmi Note 12 Pro 4G cũng sẽ hoạt động ổn định với con <strong>chip Snapdragon® 732G </strong>cùng <strong>bộ nhớ RAM 6GB</strong>. Điện thoại cũng đáp ứng tốt nhu cầu nhiếp ảnh của người dùng với <strong>cụm bốn camera sau</strong>, trong đó ống kính chính sở hữu độ phân giải tới 50MP.</p>', 5, 1, 157, NULL, 1, CAST(N'2024-01-08' AS Date), 63, NULL, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (15, N'OPPO Find N2 Flip', 19990000, 1, 16990000, N'<li> - Thiết kế bền bỉ cho phép gập đến 400.000 lần, giúp dễ dàng gấp gọn và mang theo</li>
		<li> - Màn hình phụ kích thước 3.26 inch cho khả năng hiển thị trực quan và nhiều chi tiết</li>
		<li> - Hệ thống ống kính chất lượng cao với cảm biến Sony IMX890 có độ phân giải 50MP</li>
		<li> - Hiệu năng mạnh mẽ với vi xử lý MediaTek 9000+ kết hợp RAM 8GB và ROM 256GB</li>', N'<p style="text-align: justify;"><strong>OPPO Find N2 Flip </strong>có kích thước 3.26 inch ở màn hình ngoài và bên trong là <strong>6.8 inch</strong>, đặc biệt là <strong>GẬP KHÔNG NÊP GẤP </strong>và công nghệ hình ảnh chuyên nghiệp - <strong>MariSilicon X</strong>. Ngoài ra smartphone sẽ được vận hành bởi con chip <strong>Dimensity 9000+</strong>, kèm dung lượng pin <strong>4.300 mAh </strong>và sạc siêu nhanh <strong>Super VOOC 44W</strong>.</p>', 6, 1, 123, NULL, 1, CAST(N'2024-01-08' AS Date), 77, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (16, N'iPad mini 6 WiFi 256GB', 17990000, 1, 16490000, N'<li> - Mạnh mẽ bứt phá - Chip xử lý Apple A15 Bionic 6 nhân</li>
		<li> - Hiển thị sắc nét, mượt mà hơn - Màn hình IPS LCD 8,3 inch hỗ trợ True Tone</li>
		<li> - Phá vỡ giới hạn sáng tạo - Hỗ trợ Apple Pencil 2, iPadOS 15 tiện ích hơn</li>
		<li> - Camera bắt trọn mọi khoảnh khắc - Camera trước và sau 12MP</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 19.3 Wh, cổng sạc USB-C</li>', N'<p style="text-align: justify;"><strong>Apple iPad mini 6 256GB </strong>là phiên bản iPad mini 6 có dung lượng lớn, rất thích hợp để lưu trữ nhiều dữ liệu. Phiên bản sử dụng kết nối Wifi, thuận tiện khi sử dụng tại nhà.</p>', 1, 1, 21, NULL, 3, CAST(N'2024-01-08' AS Date), 89, NULL, 3)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (17, N'Samsung Galaxy Tab S9 FE WIFI 6GB 128GB', 9990000, 1, 8490000, N'<li> - Thiết kế sang trọng với mặt lưng và bộ khung được hoàn thiện bằng chất liệu nhôm nguyên khối cao cấp.</li>
		<li> - Bộ vi xử lý Exynos 1380 - Cho khả năng vận hành mượt mà, trơn tru đa nhiệm các tác vụ.</li>
		<li> - Công nghệ tiên tiến cho khả năng hiển thị hình ảnh sống động, chi tiết.</li>
		<li> - Màn hình 10.9 inch mang lại một không gian hiển thị rộng lớn cho người dùng, thoải mái xem phim, chơi game và làm việc.</li>', N'<p style="text-align: justify;"><strong>Samsung Galaxy Tab S9 Wifi </strong>sử dụng <strong>màn hình IPS LCD, chống nước/bụi IP68 </strong>và sở hữu hiệu năng ổn định nhờ con <strong>chip Exynos 1380 </strong>và bộ nhớ <strong>RAM 6GB</strong>. Chiếc tablet Samsung Tab S9 này còn được trang bị viên <strong>pin 8000 mAh </strong>và hỗ trợ <strong>sạc nhanh 15W </strong>. Ngoài ra, máy tích hợp <strong>bút S-Pen </strong>giúp bạn tạo ra các tác phẩm nghệ thuật độc đáo.</p>', 2, 1, 54, NULL, 3, CAST(N'2024-01-08' AS Date), 46, NULL, 5)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (18, N'iPad mini 6 LTE 4GB 64GB', 17990000, 1, 15690000, N'<li> - Mạnh mẽ bứt phá - Chip xử lý Apple A15 Bionic 6 nhân</li>
		<li> - Hiển thị sắc nét, mượt mà hơn - Màn hình IPS LCD 8,3 inch hỗ trợ True Tone</li>
		<li> - Phá vỡ giới hạn sáng tạo - Hỗ trợ Apple Pencil 2, iPadOS 15 tiện ích hơn</li>
		<li> - Camera bắt trọn mọi khoảnh khắc - Camera trước và sau 12MP</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 19.3 Wh, cổng sạc USB-C</li>', N'<p style="text-align: justify;"><strong>Apple iPad mini 6 4G 64GB </strong>là một trong số các phiên bản iPad mini 6 2021 mà Apple tung ra trong năm 2021 cho các người hâm mộ của nhà Táo. Máy sử dụng <strong>kết nối Wifi </strong>kết hợp với <strong>4G </strong>, phù hợp khi sử dụng trong nhà lẫn ngoài đường.</p>', 1, 1, 65, NULL, 3, CAST(N'2024-01-08' AS Date), 35, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [management_id], [avr_rated_star]) VALUES (19, N'Samsung Galaxy Tab A9 WIFI 4GB 64GB', 3990000, 1, 3290000, N'<li> - Hiệu năng mạnh mẽ vượt trội với chip MediaTek Helio G99 hỗ trợ người dùng thực hiện nhiều tác vụ hơn.</li>
		<li> - Sử dụng màn hình lớn kích thước 8.7 inch với tấm nền TFT LCD mang lại những trải nghiệm hình ảnh sống động.</li>
		<li> - Máy được trang bị camera sau 8 MP - cho phép người dùng dễ dàng chụp tài liệu văn bản và tạo bản sao chất lượng cao.</li>
		<li> - Tích hợp pin lớn 5100 mAh - Sử dụng thoải mái suốt cả ngày với nhiều tác vụ khác nhau mà không cần lo lắng về việc sạc lại pin.</li>', N'<p style="text-align: justify;"><strong>Samsung Galaxy Tab A9 wifi </strong>với màn hình kích thước lớn <strong>8.7 inch WXGA+ </strong>cùng với thiết kế nhôm nguyên khối cứng cáp siêu mỏng 8mm, trọng lượng nhẹ chỉ 332g. Galaxy Tab A9 wifi với <strong>âm thanh Dolby Atmos </strong>cùng <strong>chip Helio G99 </strong>mang lại trải nghiệm dùng ổn định. Mẫu tablet Samsung này cũng hỗ trợ chụp ảnh và gọi video call với <strong>camera chính 8MP </strong>và <strong>camera selfie 2MP</strong>.</p>', 2, 1, 72, NULL, 3, CAST(N'2024-01-08' AS Date), 28, NULL, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Products_Images] ON 

INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (1, 6, 1, N'image/tab-s9-fe-plus-xanh.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (2, 5, 1, N'image/text_d_i_1__1_3.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (3, 3, 1, N'image/xiaomi-mi-pad-5-256gb.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (4, 4, 1, N'image/text_ng_n_-_2023-06-08t005130.908.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (5, 7, 1, N'image/samsung-galaxy-z-flip5-kem-4_2.jpg')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (6, 8, 1, N'image/samsung-galaxy-tab-a9-gia-re-3.jpg')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (7, 9, 1, N'iamge/samsung-galaxy-a15-black-231211051106.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (8, 10, 1, N'image/redmi-note-12-pro-4g-1-xanh-nhat.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (9, 1, 1, N'image/15pmxanh.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (10, 2, 1, N'image/dien-thoai-xiao_multi_1_838_450.png.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (11, 11, 1, N'image/oppo-find-n2-fl_multi_4_408_450.png.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (12, 12, 1, N'image/nokia-t21_1_1.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (13, 13, 1, N'image/macbook_air_m22.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (14, 14, 1, N'image/group_169_2.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (15, 15, 1, N'image/apple-airpods-pro-2-usb-c_1_.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (16, 16, 1, N'image/air_m2.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (17, 17, 1, N'image/7efbd23a-5394-4002-9d67-8fad17c18121.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (18, 18, 1, N'image/3_229_3.webp')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (19, 19, 1, N'image/1_256_1.webp')
SET IDENTITY_INSERT [dbo].[Products_Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Tablet_detail] ON 

INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (1, N'8.3 inches', N'Liquid Retina', N'12MP khẩu độ f/1.8', N'12MP góc rộng', N'A15 Bionic', N'4 GB', N'256 GB', N'19.3 Wh', NULL, N'iPadOS', N'Độ phủ màu: DCP-P3
		Độ sáng 500 nits
		Công nghệ True Tone', 7, N'Tương thích Apple Pencil (thế hệ thứ 2) và Smart Folio')
INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (2, N'10.9 inches', NULL, N'8 MP', N'12 MP (góc siêu rộng)', N'Exynos 1380', N'6 GB', N'128 GB', N'8000 mAh', NULL, N'Android 13', N'Tần số quét 90Hz, 249PPI', 8, N'Tương thích S Pen (đi kèm trong hộp)')
INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (3, N'8.3 inches', N'Liquid Retina', N'12MP khẩu độ f/1.8', N'12MP góc rộng', N'A15 Bionic', N'4 GB', N'64 GB', N'19.3 Wh', N'Nano-SIM + eSIM', N'iPadOS', N'Độ phủ màu: DCP-P3
		Độ sáng 500 nits
		Công nghệ True Tone
		Lớp phủ màn hình chống lóa', 9, N'Tương thích Apple Pencil (thế hệ thứ 2) và Smart Folio')
INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (4, N'8.7 inches', N'TFT LCD', N'8 MP, AF', N'2 MP', N'MediaTek Helio G99 8 nhân', N'4 GB', N'64 GB', N'5100 mAh', NULL, N'Android 13', N'Tần số quét 60 Hz', 10, NULL)
INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (5, N'11 inches', N'IPS LCD', N'13 MP, f/2.0', N'8 MP, f/2.0', N'Qualcomm Snapdragon 860 (7 nm)', N'6 GB', N'256 GB', N'Li-Po 8720 mAh', NULL, N'Android 11, MIUI 12.5', N'120Hz, HDR10, Dolby Vision', 11, NULL)
INSERT [dbo].[Tablet_detail] ([tablet_detail_id], [screen_size], [screen_tech], [camera_rear], [front_camera], [chip], [ram], [rom], [pin], [sim], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (6, N'10.36 inches', N'IPS LCD', N'8 MP, AF', N'8 MP', N'Unisoc Tiger T612 (12 nm)', N'4 GB', N'128 GB', N'8200 mAh', N'Nano-SIM', N'Android 12', N'IPS LCD, 360 nits (typ)', 12, NULL)
SET IDENTITY_INSERT [dbo].[Tablet_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Trademark] ON 

INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (1, N'Apple', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (2, N'Samsung', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (3, N'Sony', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (4, N'Nokia', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (5, N'Xiaomi', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (6, N'Oppo', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (7, N'Asus', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (8, N'Realme', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (9, N'Lenovo', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (10, N'Dell', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (11, N'LG', NULL)
INSERT [dbo].[Trademark] ([trademark_id], [trademark_name], [status]) VALUES (12, N'Huawei', NULL)
SET IDENTITY_INSERT [dbo].[Trademark] OFF
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_updated_date_1]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_orderDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_update_date]  DEFAULT (getdate()) FOR [update_date]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Category_blog] FOREIGN KEY([categoryBlog_id])
REFERENCES [dbo].[Category_blog] ([categoryBlog_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Category_blog]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__produc__3F466844] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__produc__3F466844]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__userId__403A8C7D] FOREIGN KEY([userId])
REFERENCES [dbo].[Customer] ([userId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__userId__403A8C7D]
GO
ALTER TABLE [dbo].[Headphone_detail]  WITH CHECK ADD  CONSTRAINT [FK_Headphone_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Headphone_detail] CHECK CONSTRAINT [FK_Headphone_detail_Product]
GO
ALTER TABLE [dbo].[Laptop_detail]  WITH CHECK ADD  CONSTRAINT [FK_Laptop_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Laptop_detail] CHECK CONSTRAINT [FK_Laptop_detail_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__userId__412EB0B6] FOREIGN KEY([userId])
REFERENCES [dbo].[Customer] ([userId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__userId__412EB0B6]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__order__4222D4EF] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__order__4222D4EF]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__produ__4316F928] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__produ__4316F928]
GO
ALTER TABLE [dbo].[Phone_detail]  WITH CHECK ADD  CONSTRAINT [FK_Phone_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Phone_detail] CHECK CONSTRAINT [FK_Phone_detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__440B1D61] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__440B1D61]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Trademark] FOREIGN KEY([trademark_id])
REFERENCES [dbo].[Trademark] ([trademark_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Trademark]
GO
ALTER TABLE [dbo].[Products_Images]  WITH CHECK ADD  CONSTRAINT [FK__Products___produ__46E78A0C] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Products_Images] CHECK CONSTRAINT [FK__Products___produ__46E78A0C]
GO
ALTER TABLE [dbo].[Tablet_detail]  WITH CHECK ADD  CONSTRAINT [FK_Tablet_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Tablet_detail] CHECK CONSTRAINT [FK_Tablet_detail_Product]
GO
ALTER TABLE [dbo].[Whistlist]  WITH CHECK ADD  CONSTRAINT [FK_Whistlist_Customer] FOREIGN KEY([userId])
REFERENCES [dbo].[Customer] ([userId])
GO
ALTER TABLE [dbo].[Whistlist] CHECK CONSTRAINT [FK_Whistlist_Customer]
GO
ALTER TABLE [dbo].[Whistlist]  WITH CHECK ADD  CONSTRAINT [FK_Whistlist_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Whistlist] CHECK CONSTRAINT [FK_Whistlist_Product]
GO
