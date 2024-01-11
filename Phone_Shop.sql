USE [Phone_Shop_Online]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/11/2024 12:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[gender] [bit] NULL,
	[email] [varchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[roleId] [bit] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Category_blog]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 1/11/2024 12:13:11 PM ******/
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
	[roleId] [bit] NULL,
 CONSTRAINT [PK__User__CB9A1CFF404D73E0] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Headphone_detail]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Laptop_detail]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Phone_detail]    Script Date: 1/11/2024 12:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone_detail](
	[phone_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
	[screen_size] [nvarchar](500) NULL,
	[screen_tech] [nvarchar](500) NULL,
	[camera_rear] [nvarchar](max) NULL,
	[front_cameta] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 1/11/2024 12:13:11 PM ******/
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
	[avr_rated_star] [int] NULL,
 CONSTRAINT [PK__Product__47027DF56173B414] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Images]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 1/11/2024 12:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [bit] NOT NULL,
	[role_name] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tablet_detail]    Script Date: 1/11/2024 12:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablet_detail](
	[tablet_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
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
	[screen_resolution] [nvarchar](500) NULL,
	[screen_feature] [nvarchar](500) NULL,
	[product_id] [int] NULL,
	[other_feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tablet_detail] PRIMARY KEY CLUSTERED 
(
	[tablet_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trademark]    Script Date: 1/11/2024 12:13:11 PM ******/
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
/****** Object:  Table [dbo].[Whistlist]    Script Date: 1/11/2024 12:13:11 PM ******/
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

INSERT [dbo].[Admin] ([adminId], [fullName], [avatar], [gender], [email], [user_name], [password], [phone], [address], [roleId]) VALUES (1, N'Trần Sơn Tùng', NULL, 1, N'tung123@gmail.com', N'tung123', N'123456', N'0941998765', N'Phủ Lý, Hà Nam', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Mobile')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Laptop')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Tablet')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Headphone')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Accessory')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([userId], [fullName], [avatar], [gender], [password], [user_name], [email], [phone], [address], [roleId]) VALUES (1, N'Nguyễn Hà Dương', NULL, 1, N'123456', N'duong123', N'duong123@gmail.com', N'0946172874', N'Phủ Lý, Hà Nam', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Headphone_detail] ON 

INSERT [dbo].[Headphone_detail] ([connect], [headphone_detail_id], [color], [using_time], [sound_tech], [micro], [control_method], [waterproof], [product_id], [other_feature]) VALUES (N'Bluetooth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1, NULL, N'Tai nghe: Dùng 6 giờ<br>
Hộp sạc: Dùng 30 giờ', N'Active Noise Cancellation<br>
Chip Apple H2<br>
Adaptive EQ', 1, N'Cảm ứng chạm', N'IP54 (trên cả hộp sạc và tai nghe)', 9, N'Chip Apple U1 trong Hộp Sạc MagSafe (USB‑C)')
INSERT [dbo].[Headphone_detail] ([connect], [headphone_detail_id], [color], [using_time], [sound_tech], [micro], [control_method], [waterproof], [product_id], [other_feature]) VALUES (N'Bluetooth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 2, NULL, N'Tai nghe: Dùng 5 giờ<br>
Hộp sạc: Dùng 24 giờ', NULL, 1, N'Chạm 2 lần', N'Không chống nước', 10, NULL)
SET IDENTITY_INSERT [dbo].[Headphone_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Laptop_detail] ON 

INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (1, NULL, N'13.3 inches', N'Độ sáng 400 nits
<br>Hỗ trợ dải màu P3<br>
True-Tone', N'8 nhân với 4 nhân hiệu năng cao và 4 nhân tiết kiệm điện', N'8GB', N'49.9-watt lithium-polymer, củ sạc công suất 30W', N'macOS Big Sur', N'2560 x 1600 pixels (2K)', 6, N'Cảm biến vân tay Touch ID, 720p FaceTime HD camera')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (2, NULL, N'13.6 inches', N'Liquid Retina Display', N'Apple M2', N'8GB', N'
52,6 Wh', N'MacOS', N'2560 x 1664 pixels', 5, N'Ổ cứng SSD')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (3, NULL, N'13.3 inches', N'
Công nghệ chống chói', N'i5-1145G7', N'16GB', N'3 Cell, 41 Wh', N'
Windows 11', N'1080 x 1920 pixels (FullHD)', 3, N'Ổ cứng SSD, Wi-Fi 6')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (4, NULL, N'15.6 inches', N'Tấm nền Led', N'Intel Core i5-1135G7 (8 MB cache, 4 nhân, 8 luồng, xung nhịp tốt đa 4.20 GHz Turbo)', N'
8GB', N'3 Cell, 41 Wh', N'
Windows 11 Home', N'1080 x 1920 pixels (FullHD)
', 4, N'Ổ cứng SSD, Wi-Fi 6')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (5, NULL, N'14 inches', N'Độ sáng tối đa 250nits
Độ phủ màu 45% NTSC
Màn hình chống chó', N'AMD Ryzen 5 7520U (4MB cache, up to 4.3 GHz, 4 lõi/8 luồng)', N'
16GB', N'42WHrs, 3S1P, Li-ion 3 cell', N'Windows 11 Home', N'1920 x 1080 pixels (FullHD)', 7, N'Ổ cứng SSD, Wi-Fi 6, Bảo mật vân tay')
INSERT [dbo].[Laptop_detail] ([laptop_detail_id], [color], [screen_size], [screen_tech], [chip], [ram], [pin], [operation_system], [screen_feature], [product_id], [other_feature]) VALUES (6, NULL, N'14 inches', N'Thời gian phản hồi 0.2ms
<br>Độ sáng tối đa 600nits HDR<br>
Độ phủ màu 100% DCI-P3<br>
Display HDR True Black 600<br>
1.07 tỷ màu<br>
PANTONE Validated<br>
Glossy display<br>
Giảm ánh sáng xanh 70%<br>
SGS Eye Care Displa', N'AMD Ryzen 5 7530U (2.0GHz, 6 lõi / 12 luồng, 16MB cache, up to 4.5 GHz max boost)', N'16GB', N'75WHrs, 2S2P, 4-cell Li-ion', N'Windows 11 Home', N'2880 x 1800 pixels', 8, N'Ổ cứng SSD, Wi-Fi 6, Bảo mật vân tay, Màn hình Oled')
SET IDENTITY_INSERT [dbo].[Laptop_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (1, N'iPhone 15 Pro Max 256GB', 34990000, 1, 32990000, N'<li> - Thiết kế khung viền từ titan chuẩn hàng không vũ trụ - Cực nhẹ, bền cùng viền cạnh mỏng cầm nắm thoải mái</li>
                                        <li> - Hiệu năng Pro chiến game thả ga - Chip A17 Pro mang lại hiệu năng đồ họa vô cùng sống động và chân thực</li>
                                        <li> - Thoả sức sáng tạo và quay phim chuyên nghiệp - Cụm 3 camera sau đến 48MP và nhiều chế độ tiên tiến</li>
                                        <li> - Nút tác vụ mới giúp nhanh chóng kích hoạt tính năng yêu thích của bạn</li>', N'                                            <p style="text-align: justify;"><strong style="color: red">iPhone 15 Pro Max</strong> thiết kế mới với <strong>chất liệu&nbsp;titan</strong> chuẩn hàng không vũ trụ bền bỉ, trọng lượng nhẹ, đồng thời trang bị <strong>nút Action</strong> và cổng sạc <strong>USB-C</strong> tiêu chuẩn giúp nâng cao tốc độ sạc. Khả năng chụp ảnh đỉnh cao của <strong>iPhone 15</strong> bản Pro Max đến từ&nbsp;<strong>camera chính 48MP</strong>, camera <strong>UltraWide 12MP</strong> và camera telephoto có khả năng zoom quang học đến <strong>5x</strong>. Bên cạnh đó, <strong>iPhone 15 ProMax</strong> sử dụng chip <strong>A17 Pro</strong> mới mạnh mẽ. Xem thêm chi tiết những điểm nổi bật của sản phẩm qua thông tin sau!</p>               
', 1, 1, 1000, NULL, 1, CAST(N'2024-01-06' AS Date), 48, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (2, N'iPhone 15 128GB', 22990000, 1, 21890000, N'<li> - Thiết kế thời thượng và bền bỉ - Mặt lưng kính được pha màu xu hướng cùng khung viền nhôm bền bỉ</li><li> - Dynamic Island hiển thị linh động mọi thông báo ngay lập tức giúp bạn nắm bắt mọi thông tin</li><li> - Chụp ảnh đẹp nức lòng - Camera chính 48MP, Độ phân giải lên đến 4x và Tele 2x chụp chân dung hoàn hảo</li><li> - Pin dùng cả ngày không lắng lo - Thời gian xem video lên đến 20 giờ và sạc nhanh qua cổng USB-C tiện lợi</li><li> - Cải tiến hiệu năng vượt bậc - A16 Bionic mạnh mẽ giúp bạn cân mọi tác vụ dù có yêu cầu đồ hoạ cao</li>
', N'                                            <p style="text-align: justify;"><strong style="color: red">iPhone 15 128GB</strong> được trang bị <strong>màn hình Dynamic Island kích thước 6.1 inch</strong> với công nghệ hiển thị <strong>Super Retina XDR</strong> màn lại trải nghiệm hình ảnh vượt trội. Điện thoại với mặt lưng kính nhám chống bám mồ hôi cùng <strong>5 phiên bản màu sắc</strong> lựa chọn: <strong>Hồng, Vàng, Xanh lá, Xanh dương và đen</strong>. Camera trên <strong>iPhone 15 series</strong> cũng được nâng cấp lên <strong>cảm biến 48MP</strong> cùng tính năng chụp<strong> zoom quang học tới 2x</strong>. Cùng với thiết kế cổng sạc thay đổi từ lightning sang USB-C vô cùng ấn tượng.</p>                                   
', 1, 1, 558, NULL, 1, CAST(N'2024-01-06' AS Date), 93, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (3, NULL, NULL, NULL, NULL, N'                                        <li> Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh</li><li> Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh</li><li> Nâng cao hiệu suất làm việc với Siêu bút S Pen tích hợp, dễ dàng đánh dấu sự kiện từ hình ảnh hoặc video</li><li> Thiết kế bền bỉ, thân thiện - Màu sắc lấy cảm hứng từ thiên nhiên, chất liệu kính và lớp phim phủ PET tái chế</li>
', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-07' AS Date), NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (4, N'Laptop Dell Inspirion 15 3511 PDP3H', 14990000, 1, 13490000, N'<li>Sở hữu thiết kế mỏng nhẹ, trọng lượng chỉ 1.12kg thích hợp bỏ trong balo mang theo bên người</li><li>CPU&nbsp;i5-1145G7 giúp bạn giải quyết được các công việc văn phòng cũng như chỉnh sửa hình ảnh nhẹ trên PTS</li><li>Ổ cứng SSD 256GB cho phép bạn lưu trữ một lượng lớn dữ liệu trên máy tính mà không cần copy ra USB</li><li>RAM 16GB giúp bạn mở liên tục các cửa sổ công việc mà không lo bị giật lag, đứng máy</li>', N'Laptop Dell Inspiron 15 3511 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.', 10, 1, 14, NULL, 2, CAST(N'2024-01-07' AS Date), 30, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (5, N'Apple Macbook Air M2 2022 8GB 256GB', 32900000, 1, 26490000, N'<li>Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg</li><li>Hiệu năng hàng đầu - Chip Apple M2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier</li><li>Đa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc</li><li>Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits</li><li>Âm thanh sống động - 4 loa tramg bị công nghệ Dolby Atmos và âm thanh đa chiều</li>', N'Macbook Air M2 2022 với thiết kế sang trọng, vẻ ngoài siêu mỏng đầy lịch lãm. Mẫu Macbook Air mới với những nâng cấp về thiết kế và cấu hình cùng giá bán phải chăng, đây sẽ là một thiết bị lý tưởng cho công việc và giải trí.', 1, 1, 30, NULL, 2, CAST(N'2024-01-07' AS Date), 4, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (6, N'Apple MacBook Air M1 256GB 2020 ', 22990000, 1, 19190000, N'<li>Phù h?p cho l?p trình viên, thi?t k? d? h?a 2D, dân van phòng</li><li>Hi?u nang vu?t tr?i - Cân m?i tác v? t? word, exel d?n ch?nh s?a ?nh trên các ph?n m?m nhu AI, PTS</li><li>Ða nhi?m mu?t mà - Ram 8GB cho phép v?a m? trình duy?t d? tra c?u thông tin, v?a làm vi?c trên ph?n m?m</li><li>Trang b? SSD 256GB - Cho th?i gian kh?i d?ng nhanh chóng, t?i uu hoá th?i gian load ?ng d?ng</li><li>Ch?t lu?ng hình ?nh s?c nét - Màn hình Retina cao c?p cùng công ngh? TrueTone cân b?ng màu s?c</li><li>Thi?t k? sang tr?ng - N?ng ch? 1.29KG, d? dày 16.1mm. Ti?n l?i mang theo m?i noi</li>', N'Macbook Air M1 2020 - Sang tr?ng, tinh t?, hi?u nang kh?ng
Macbook Air M1 là dòng s?n ph?m có thi?t k? m?ng nh?, sang tr?ng và tinh t? cùng v?i dó là giá thành ph?i chang nên MacBook Air dã thu hút du?c dông d?o ngu?i dùng yêu thích và l?a ch?n. Ðây cung là m?t trong nh?ng phiên b?n Macbook Air m?i nh?t mà khách hàng không th? b? qua khi d?n v?i CellphoneS. Du?i dây là chi ti?t v? thi?t k?, c?u hình c?a máy.', 1, 1, 110, NULL, 2, CAST(N'2024-01-07' AS Date), 12, 5)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (7, N'Laptop Asus VivoBook Go 14 E1404FA-NK177W', 14490000, 1, 12790000, N'<li>Sở hữu thiết kế sang trọng, trọng lượng nhẹ, dễ dàng mang theo bên mình</li><li>RAM 16GB giúp bạn dễ dàng các tab mà không lo lag máy</li><li>Ở cứng SSD 512GB giúp bạn có không gian lưu trữ lớn</li><li>Sở hữu cảm biến vân tay giúp thao tác mở màn hình thuận tiện hơn</li>', N'Là một sản phẩm thuộc series Asus Vivobook do đó laptop Asus Vivobook Go 14 E1404FA-NK177W sở hữu nhiều đặc điểm của series này. Bên cạnh đó là nhiều tính năng được nâng cấp, hỗ trợ tối ưu trong quá trình sử dụng của người dùng.', 7, 1, 23, NULL, 2, CAST(N'2024-01-08' AS Date), 4, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (8, N'Laptop Asus Zenbook 14 OLED UM3402YA-KM405W', 24990000, 1, 20990000, N'<li>CPU AMD Ryzen 5 7530U xử lý nhanh chóng mọi tác vụ học tập, văn phòng.</li><li>Màn hình 14 inch OLED 2.8K cho màu sắc hiển thị rực rỡ, chân thực cùng công nghệ lọc ánh sáng xanh lên đến 70%.</li><li>Đồ họa AMD Radeon Graphics dễ dàng chỉnh sửa hình ảnh cơ bản hay chơi các tựa game nhẹ.</li><li>Bộ nhớ RAM 16GB LPDDR4X chạy nhiều ứng dụng cùng lúc mà không lo lag giật.</li><li>Ổ cứng SSD 512GB cho tốc độc truy cập dữ liệu nhanh chóng.</li><li>Lớp vỏ được làm từ kim loại cao cấp, khối lượng gọn nhẹ chỉ 1.39 kg.</li>', N'Laptop Asus Zenbook 14 OLED UM3402YA-KM405W sở hữu sức mạnh đỉnh cao với vi xử lý AMD Ryzen 5 - 7530 2.0 GHz, RAM 16GB LPDDR4X ổn định trong mọi tác vụ. Với ổ SSD 512GB M.2 NVMe™ PCIe® 3.0, Zenbook 14 đảm bảo dung lượng lớn để lưu trữ dữ liệu. Màn hình laptop Asus Zenbook 14" NanoEdge OLED 2.8K của máy mang lại trải nghiệm hiển thị tuyệt vời với khả năng lọc ánh sáng xanh đến 70%. ', 7, 1, 20, NULL, 2, CAST(N'2024-01-08' AS Date), 9, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (9, N'Tai nghe Bluetooth Apple AirPods Pro 2 2023 USB-C', 5990000, 0, NULL, N'<li>Tích hợp chip Apple H2 mang đến chất âm sống động cùng khả năng tái tạo âm thanh 3 chiều vượt trội</li><li>Công nghệ Bluetooth 5.3 kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp tiết kiệm pin đáng kể</li><li>Chống ồn chủ động loại bỏ tiếng ồn hiệu quả gấp đôi thế hệ trước, giúp nâng cao trải nghiệm nghe nhạc</li><li>Chống nước chuẩn IP54 trên tai nghe và hộp sạc, giúp bạn thỏa sức tập luyện không cần lo thấm mồ hôi</li>', N'Airpods Pro 2 Type-C với công nghệ khử tiếng ồn chủ động mang lại khả năng khử ồn lên gấp 2 lần mang lại trải nghiệm nghe - gọi và trải nghiệm âm nhạc ấn tượng. Cùng với đó, điện thoại còn được trang bị công nghệ âm thanh không gian giúp trải nghiệm âm nhạc thêm phần sống động. Airpods Pro 2 Type-C với cổng sạc Type C tiện lợi cùng viên pin mang lại thời gian trải nghiệm lên đến 6 giờ tiện lợi.', 1, 1, 3, NULL, 4, CAST(N'2024-01-08' AS Date), 2, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [guarantee], [category_id], [update_date], [sole], [avr_rated_star]) VALUES (10, N'Tai nghe Bluetooth Apple AirPods 2', 3990000, 1, 2790000, N'<li>Phản hồi nhanh hơn và tiết kiệm năng lượng nhờ vào con chip Apple H1</li><li>Thiết kế sang trọng, gọn nhẹ tạo cảm giác thoải mái khi đeo hàng giờ liền</li><li>Tích hợp 2 micro khử tiếng ồn cho chất lượng âm thanh tốt khi đàm thoại</li><li>Hỗ trợ công nghệ sạc nhanh, chỉ mất 15 phút là đã có ngay 3 giờ sử dụng</li>', N'Vừa qua, Apple đã chính thức cho ra mắt chiếc tai nghe Apple Airpods 2 sở hữu chip H1 được dành riêng giúp chuyển nhanh các cuộc gọi từ iPhone sang Airpods cũng như giảm mức tiêu thụ điện năng cực kỳ thấp. Thời gian sử dụng đến 5 giờ nghe nhạc hoặc 3 giờ đàm thoại và khi kết hợp với hộp sạc cho thời gian đến 24 giờ. Kết nối không dây chất lượng cao, tự động bật và luôn kết nối giúp sẵn sàng theo bạn đến bất kỳ đâu. Cùng tham khảo thêm về chiếc Airpod 2 này nhé.', 1, 1, 23, NULL, 4, CAST(N'2024-01-08' AS Date), 23, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Products_Images] ON 

INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (1, 6, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/i/air_m2.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (2, 5, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_air_m22.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (3, 3, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-dell-latitude-7320-9ppwv.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (4, 4, 1, N'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/e/7efbd23a-5394-4002-9d67-8fad17c18121.jpg')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (5, 7, 1, N'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005130.908.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (6, 8, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_1__1_3.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (7, 9, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_1_.png')
INSERT [dbo].[Products_Images] ([products_images_id], [product_id], [status], [images]) VALUES (8, 10, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_169_2.png')
SET IDENTITY_INSERT [dbo].[Products_Images] OFF
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
