SET IDENTITY_INSERT [dbo].[Product] ON
-- 6 Phone
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (1, N'iPhone 15 Pro Max 256GB', 34990000, 1, 32990000, 
		N'<li> - Thiết kế khung viền từ titan chuẩn hàng không vũ trụ - Cực nhẹ, bền cùng viền cạnh mỏng cầm nắm thoải mái</li>
		<li> - Hiệu năng Pro chiến game thả ga - Chip A17 Pro mang lại hiệu năng đồ họa vô cùng sống động và chân thực</li>
		<li> - Thoả sức sáng tạo và quay phim chuyên nghiệp - Cụm 3 camera sau đến 48MP và nhiều chế độ tiên tiến</li>
		<li> - Nút tác vụ mới giúp nhanh chóng kích hoạt tính năng yêu thích của bạn</li>',
		N'<p style="text-align: justify;"><strong style="color: red">Xiaomi Redmi Note 12 </strong>sở hữu <strong>màn hình Super AMOLED </strong>với <strong>tần số quét 120Hz </strong>giúp trải nghiệm chạm vuốt diễn ra mượt mà, <strong>camera AI 50MP </strong>chất lượng. Bên cạnh đó, điện thoại sẽ được chạy trên con <strong>chip Qualcomm Snapdragon 685 </strong>kêt hợp với <strong>card đồ họa GPU Qualcomm Adreno 610 </strong>mang lại trải nghiệm dùng ổn định. Điện thoại Xiaomi Redmi Note 12 mang lại thời gian sử dụng vượt trội với viên <strong>pin 5000mAh </strong>cùng <strong>sạc nhanh công suất 33W</strong>.',
	  1, 1, 203, 1, CAST(N'2024-01-08' AS Date), 17, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (2, N'Xiaomi Redmi Note 12 4GB 128GB', 4990000, 1, 3790000, 
		N'<li> - Trải nghiệm thị giác siêu đã với màn hình 6.67 inch cùng tấm nền AMOLED thời thượng</li>
		<li> - Chiến game cực mượt với chip Snapdragon mạnh mẽ cùng màn hình tần số quét 120Hz</li>
		<li> - Năng lượng cho cả ngày dài nhờ vào viên pin lên đến 5000mAh đi kèm sạc nhanh 33W</li>
		<li> - Lưu giữ mọi khoảnh khắc với 3 camera sau 50 MP và tính năng làm đẹp AI thông minh</li>',
		N'<p style="text-align: justify;"><strong style="color: red">Xiaomi Redmi Note 12 </strong>sở hữu <strong>màn hình Super AMOLED </strong>với <strong>tần số quét 120Hz </strong>giúp trải nghiệm chạm vuốt diễn ra mượt mà, <strong>camera AI 50MP </strong>chất lượng. Bên cạnh đó, điện thoại sẽ được chạy trên con <strong>chip Qualcomm Snapdragon 685 </strong>kêt hợp với <strong>card đồ họa GPU Qualcomm Adreno 610 </strong>mang lại trải nghiệm dùng ổn định. Điện thoại Xiaomi Redmi Note 12 mang lại thời gian sử dụng vượt trội với viên <strong>pin 5000mAh </strong>cùng <strong>sạc nhanh công suất 33W</strong>.</p>',
		5, 1, 135, 1, CAST(N'2024-01-08' AS Date), 85, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (3, N'Samsung Galaxy Z Flip5 256GB', 25990000, 1, 16890000, 
		N'<li> - Thần thái nổi bật, cân mọi phong cách- Lấy cảm hứng từ thiên nhiên với màu sắc thời thượng, xu hướng</li>
		<li> - Thiết kế thu hút ánh nhìn - Gập không kẽ hỡ, dẫn đầu công nghệ bản lề Flex</li>
		<li> - Tuyệt tác selfie thoả sức sáng tạo - Camera sau hỗ trợ AI xử lí cực sắc nét ngay cả trên màn hình ngoài</li>
		<li> - Bền bỉ bất chấp mọi tình huống - Đạt chuẩn kháng bụi và nước IP68 cùng chất liệu nhôm Armor Aluminum giúp hạn chế cong và xước</li>',
		N'<p style="text-align: justify;"><strong>Samsung Galaxy Z Flip 5 </strong>có thiết kế màn hình rộng <strong>6.7 inch </strong>và độ phân giải <strong>Full HD+ (1080 x 2640 Pixels) </strong>, dung lượng <strong>RAM 8GB </strong>, bộ nhớ trong <strong>256GB </strong>. Màn hình <strong>Dynamic AMOLED 2X </strong>của điện thoại này hiển thị rõ nét và sắc nét, mang đến trải nghiệm ấn tượng khi sử dụng.</p>',
		2, 1, 191, 1, CAST(N'2024-01-08' AS Date), 69, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (4, N'Samsung Galaxy A15 LTE 8GB 128GB', 4990000, 0, 4990000, 
		N'<li> - Giải trí đa nội dung - Màn hình lớn 6.5inch với công nghệ Super AMOLED cho hình ảnh sắc nét</li>
		<li> - Dễ dàng xử lí mọi tác vụ - Chip MediaTek Helio G99 cùng RAM 8GB cực chiến</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 5000mAh với công nghệ sạc nhanh 25W</li>
		<li> - Quay chụp chuẩn điện ảnh - Cụm 3 camera sau lên đến 50MP cho hình ảnh chất lượng</li>',
		N'<p style="text-align: justify;"><strong style="color: red">Samsung Galaxy A15 </strong>được trang bị công nghệ màn hình cao cấp <strong>Super AMOLED </strong>, với độ phân giải <strong>FHD+ 1080 x 2340 pixel</strong>. Màn hình của sản phẩm lớn <strong>6.5inch </strong>kết hợp với tần số quét nhanh, hạn chế tình trạng bị chớp màn hình hay bị nhòe khi sử dụng. Chiếc điện thoại mới của dòng <strong>Samsung Galaxy A </strong>này còn có cụm camera sắc nét và bộ nhớ lớn <strong>8B+128GB </strong>sử dụng thả ga.</p>',
		2, 1, 154, 1, CAST(N'2024-01-08' AS Date), 78, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (5, N'Xiaomi Redmi Note 12 Pro 4G 8GB 256GB', 7990000, 1, 6790000, 
		N'<li> - Màn hình 6.67 inch và tấm nền AMOLED mang đến không gian hiển thị hình ảnh đẹp mắt</li>
		<li> - Vi xử lý  Snapdragon® 732G kết hợp chip đồ hoạ Adreno 618 giúp chiến game mượt mà</li>
		<li> - Thoả niềm đam mê nhiếp ảnh cùng hệ thống 3 camera với ống kính chính lên đến 50 MP</li>
		<li> - Viên pin dung lượng 5000 mAh cho khả năng hoạt động cả ngày dài ở các tác vụ cơ bản</li>',
		N'<p style="text-align: justify;"><strong>Xiaomi Redmi Note 12 Pro 4G </strong>là mẫu điện thoại tầm trung mới của hãng Xiaomi vừa được ra mắt vào tháng 4 năm 2023. Mẫu điện thoại Xiaomi mới này được trang bị <strong>màn hình 6.67 inch </strong>cùng <strong>tần số quét tới 120Hz </strong>giúp các chuyển động mượt mà, đặc biệt trong các trận chiến game. Xiaomi Redmi Note 12 Pro 4G cũng sẽ hoạt động ổn định với con <strong>chip Snapdragon® 732G </strong>cùng <strong>bộ nhớ RAM 6GB</strong>. Điện thoại cũng đáp ứng tốt nhu cầu nhiếp ảnh của người dùng với <strong>cụm bốn camera sau</strong>, trong đó ống kính chính sở hữu độ phân giải tới 50MP.</p>',
		5, 1, 157, 1, CAST(N'2024-01-08' AS Date), 63, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (6, N'OPPO Find N2 Flip', 19990000, 1, 16990000, 
		N'<li> - Thiết kế bền bỉ cho phép gập đến 400.000 lần, giúp dễ dàng gấp gọn và mang theo</li>
		<li> - Màn hình phụ kích thước 3.26 inch cho khả năng hiển thị trực quan và nhiều chi tiết</li>
		<li> - Hệ thống ống kính chất lượng cao với cảm biến Sony IMX890 có độ phân giải 50MP</li>
		<li> - Hiệu năng mạnh mẽ với vi xử lý MediaTek 9000+ kết hợp RAM 8GB và ROM 256GB</li>',
		N'<p style="text-align: justify;"><strong>OPPO Find N2 Flip </strong>có kích thước 3.26 inch ở màn hình ngoài và bên trong là <strong>6.8 inch</strong>, đặc biệt là <strong>GẬP KHÔNG NÊP GẤP </strong>và công nghệ hình ảnh chuyên nghiệp - <strong>MariSilicon X</strong>. Ngoài ra smartphone sẽ được vận hành bởi con chip <strong>Dimensity 9000+</strong>, kèm dung lượng pin <strong>4.300 mAh </strong>và sạc siêu nhanh <strong>Super VOOC 44W</strong>.</p>',
		6, 1, 123, 1, CAST(N'2024-01-08' AS Date), 77, NULL)

-- 6 Tablet
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (7, N'iPad mini 6 WiFi 256GB', 17990000, 1, 16490000, 
		N'<li> - Mạnh mẽ bứt phá - Chip xử lý Apple A15 Bionic 6 nhân</li>
		<li> - Hiển thị sắc nét, mượt mà hơn - Màn hình IPS LCD 8,3 inch hỗ trợ True Tone</li>
		<li> - Phá vỡ giới hạn sáng tạo - Hỗ trợ Apple Pencil 2, iPadOS 15 tiện ích hơn</li>
		<li> - Camera bắt trọn mọi khoảnh khắc - Camera trước và sau 12MP</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 19.3 Wh, cổng sạc USB-C</li>',
		N'<p style="text-align: justify;"><strong>Apple iPad mini 6 256GB </strong>là phiên bản iPad mini 6 có dung lượng lớn, rất thích hợp để lưu trữ nhiều dữ liệu. Phiên bản sử dụng kết nối Wifi, thuận tiện khi sử dụng tại nhà.</p>',
		1, 1, 21, 3, CAST(N'2024-01-08' AS Date), 89, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (8, N'Samsung Galaxy Tab S9 FE WIFI 6GB 128GB', 9990000, 1, 8490000, 
		N'<li> - Thiết kế sang trọng với mặt lưng và bộ khung được hoàn thiện bằng chất liệu nhôm nguyên khối cao cấp.</li>
		<li> - Bộ vi xử lý Exynos 1380 - Cho khả năng vận hành mượt mà, trơn tru đa nhiệm các tác vụ.</li>
		<li> - Công nghệ tiên tiến cho khả năng hiển thị hình ảnh sống động, chi tiết.</li>
		<li> - Màn hình 10.9 inch mang lại một không gian hiển thị rộng lớn cho người dùng, thoải mái xem phim, chơi game và làm việc.</li>',
		N'<p style="text-align: justify;"><strong>Samsung Galaxy Tab S9 Wifi </strong>sử dụng <strong>màn hình IPS LCD, chống nước/bụi IP68 </strong>và sở hữu hiệu năng ổn định nhờ con <strong>chip Exynos 1380 </strong>và bộ nhớ <strong>RAM 6GB</strong>. Chiếc tablet Samsung Tab S9 này còn được trang bị viên <strong>pin 8000 mAh </strong>và hỗ trợ <strong>sạc nhanh 15W </strong>. Ngoài ra, máy tích hợp <strong>bút S-Pen </strong>giúp bạn tạo ra các tác phẩm nghệ thuật độc đáo.</p>',
		2, 1, 54, 3, CAST(N'2024-01-08' AS Date), 46, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (9, N'iPad mini 6 LTE 4GB 64GB', 17990000, 1, 15690000, 
		N'<li> - Mạnh mẽ bứt phá - Chip xử lý Apple A15 Bionic 6 nhân</li>
		<li> - Hiển thị sắc nét, mượt mà hơn - Màn hình IPS LCD 8,3 inch hỗ trợ True Tone</li>
		<li> - Phá vỡ giới hạn sáng tạo - Hỗ trợ Apple Pencil 2, iPadOS 15 tiện ích hơn</li>
		<li> - Camera bắt trọn mọi khoảnh khắc - Camera trước và sau 12MP</li>
		<li> - Thoải mái sử dụng cả ngày - Pin 19.3 Wh, cổng sạc USB-C</li>',
		N'<p style="text-align: justify;"><strong>Apple iPad mini 6 4G 64GB </strong>là một trong số các phiên bản iPad mini 6 2021 mà Apple tung ra trong năm 2021 cho các người hâm mộ của nhà Táo. Máy sử dụng <strong>kết nối Wifi </strong>kết hợp với <strong>4G </strong>, phù hợp khi sử dụng trong nhà lẫn ngoài đường.</p>',
		1, 1, 65, 3,  CAST(N'2024-01-08' AS Date), 35, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (10, N'Samsung Galaxy Tab A9 WIFI 4GB 64GB', 3990000, 1, 3290000, 
		N'<li> - Hiệu năng mạnh mẽ vượt trội với chip MediaTek Helio G99 hỗ trợ người dùng thực hiện nhiều tác vụ hơn.</li>
		<li> - Sử dụng màn hình lớn kích thước 8.7 inch với tấm nền TFT LCD mang lại những trải nghiệm hình ảnh sống động.</li>
		<li> - Máy được trang bị camera sau 8 MP - cho phép người dùng dễ dàng chụp tài liệu văn bản và tạo bản sao chất lượng cao.</li>
		<li> - Tích hợp pin lớn 5100 mAh - Sử dụng thoải mái suốt cả ngày với nhiều tác vụ khác nhau mà không cần lo lắng về việc sạc lại pin.</li>',
		N'<p style="text-align: justify;"><strong>Samsung Galaxy Tab A9 wifi </strong>với màn hình kích thước lớn <strong>8.7 inch WXGA+ </strong>cùng với thiết kế nhôm nguyên khối cứng cáp siêu mỏng 8mm, trọng lượng nhẹ chỉ 332g. Galaxy Tab A9 wifi với <strong>âm thanh Dolby Atmos </strong>cùng <strong>chip Helio G99 </strong>mang lại trải nghiệm dùng ổn định. Mẫu tablet Samsung này cũng hỗ trợ chụp ảnh và gọi video call với <strong>camera chính 8MP </strong>và <strong>camera selfie 2MP</strong>.</p>',
		2, 1, 72, 3, CAST(N'2024-01-08' AS Date), 28, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (11, N'Xiaomi Pad 5 (6GB/256GB)', 10490000, 1, 7490000, 
		N'<li> - Thiết kế mỏng nhẹ, tinh tế - Thiết kế vuông vức, chỉ dày khoảng 7mm và nặng 500g</li>
		<li> - Trải nghiệm không gian không giới hạn - Màn hình 11" IPS LCD, độ phân giải 2K, hỗ trợ HDR10 và 120Hz</li>
		<li> - Hiệu năng vượt trội - Chip Snapdragon 860 mạnh mẽ, RAM 6 GB, GPU Adreno 640</li>
		<li> - Dung lượng pin dồi dào - Viên pin khủng 8720mAh, hỗ trợ sạc nhanh 33W</li>',
		N'<p style="text-align: justify;"><strong>Xiaomi Mi Pad 5 </strong>được cung cấp sức mạnh bởi con <strong>chip Snapdragon 860 </strong>kết hợp <strong>RAM 6GB </strong>mang lại hiệu năng mạnh mẽ cùng <strong>bộ nhớ trong lên đến 256GB </strong>giúp bạn tha hồ lưu trữ dữ liệu, hình ảnh và video.</p>',
		5, 1, 31, 3, CAST(N'2024-01-08' AS Date), 69, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [original_prices], [sale], [sale_prices], [product_highlights], [product_description], [trademark_id], [status], [quantity], [category_id], [update_date], [sole], [avr_rated_star]) 
VALUES (12, N'Nokia T21 4GB 128GB', 5990000, 1, 5750000,
		N'<li> - Bền bỉ vượt thời gian - Vật liệu bền bỉ chắc chắn, pin sử dụng đến 3 ngày và cập nhật bảo mật hàng tháng trong 3 năm</li>
		<li> - Dễ dàng giải trí với màn hình chuẩn 2K - Kích thước 10,36 inch vừa vặn cùng độ phân giải 2K và hỗ trợ Netflix HD</li>
		<li> - Kết nối với bất kỳ ai, ở bất kỳ đâu - Gọi video HD, gọi thoại và SMS nhanh chóng với WiFi+4G và hỗ trợ SIM</li>
		<li> - Phác thảo ý tưởng đơn giản và dễ dàng - Hỗ trợ và tương thích với công nghệ bút Wacom WGP và Wacom Active ES™ 2.0</li>',
		N'<p style="text-align: justify;"><strong>Nokia T21 </strong>sở hữu cho mình một <strong>bộ vi xử lý và đồ hoạ cực kỳ mạnh mẽ là Unisoc Tiger T612 và Mali-G57</strong>. Với thiết kế màn hình lên tới <strong>10.4 inches</strong>, <strong>độ phân giải FHD</strong>, <strong>pin 8200mAh </strong>cùng <strong>sạc nhanh 18W</strong>, chiếc máy tính bảng Nokia này sẵn sàng đáp ứng mọi nhu cầu của người dùng về xử lý công việc, lướt web, xem phim, chơi game, giải trí…</p>',
		4, 1, 14, 3, CAST(N'2024-01-08' AS Date), 86, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO