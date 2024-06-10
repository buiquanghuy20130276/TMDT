/*
 Navicat Premium Data Transfer

 Source Server         : DrComputer
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : happyhome

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 10/06/2024 19:59:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `data_create` datetime(6) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1jmmes8jgfucx2uxfuh8k4n2q`(`category_id` ASC) USING BTREE,
  CONSTRAINT `FK1jmmes8jgfucx2uxfuh8k4n2q` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for blog_seq
-- ----------------------------
DROP TABLE IF EXISTS `blog_seq`;
CREATE TABLE `blog_seq`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_seq
-- ----------------------------
INSERT INTO `blog_seq` VALUES (1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_46ccwnsi9409t36lurvtyljak`(`name` ASC) USING BTREE,
  UNIQUE INDEX `UK_of374byd4rs8xcu0kru1xs30f`(`value` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (0, 'Bàn', 'table');
INSERT INTO `category` VALUES (1, 'Ghế', 'chair');
INSERT INTO `category` VALUES (2, 'Tủ', 'storage');
INSERT INTO `category` VALUES (3, 'Đèn', 'lamp');
INSERT INTO `category` VALUES (4, 'Đồ trang trí', 'decorate');
INSERT INTO `category` VALUES (5, 'Giường', 'bed');
INSERT INTO `category` VALUES (6, 'Nội thất văn phòng', 'funiture');

-- ----------------------------
-- Table structure for category_seq
-- ----------------------------
DROP TABLE IF EXISTS `category_seq`;
CREATE TABLE `category_seq`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_seq
-- ----------------------------
INSERT INTO `category_seq` VALUES (1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `comment_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK30naumyn3o9w24uxf7lsmv2c8`(`comment_id` ASC) USING BTREE,
  INDEX `FKlo59icyee0u6jucfb68x22o3v`(`product_id` ASC) USING BTREE,
  INDEX `FKsn1eiuccx1w2fdlj42s1kl75w`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK30naumyn3o9w24uxf7lsmv2c8` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKlo59icyee0u6jucfb68x22o3v` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FKsn1eiuccx1w2fdlj42s1kl75w` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `quality` enum('GOOD','BAD') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `rate` int NOT NULL,
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `roles` tinyint NULL DEFAULT NULL,
  `updated_at` date NULL DEFAULT NULL,
  `order_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8j2ws7jvjdto5uytrj2qi2m8c`(`order_id` ASC) USING BTREE,
  INDEX `FKofjvahd5i60lafo8k4952yl3y`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK8j2ws7jvjdto5uytrj2qi2m8c` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKofjvahd5i60lafo8k4952yl3y` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL,
  `created_at` date NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_paied` bit(1) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `number_house` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `payment_method` enum('online','offline') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reward_points` bigint NOT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total_amount` decimal(38, 2) NULL DEFAULT NULL,
  `updated_at` date NULL DEFAULT NULL,
  `ward` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5ds52cnxjw9c99ovccne0axk0`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK5ds52cnxjw9c99ovccne0axk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE,
  INDEX `FKsxgfmcie6oo67uxtk9hqk02mq`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FKl1bqqbilx1hdy29vykrqkgu3p` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsxgfmcie6oo67uxtk9hqk02mq` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` bigint NOT NULL,
  `sale` int NOT NULL,
  `storage` int NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `category_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7l29ekt1x29jup80y2iigimyy`(`category_id` ASC) USING BTREE,
  CONSTRAINT `FK7l29ekt1x29jup80y2iigimyy` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Ghế sofa băng 1m2 nệm vải nhiều màu SFB68071 được ưa chuộng sử dụng tại các quán cafe, quán ăn, nhà hàng... bởi thiết kế hiện đại, tinh tế kết hợp với ưu điểm nệm bọc vải nhiều màu sắc đẹp mắt phù hợp với hầu hết các không gian có concept khác nhau. Ngoài', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-05.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-06.jpg', 2950000, 25, 64, 'Ghế sofa băng 1m2 nệm vải nhiều màu SFB68071', 1);
INSERT INTO `product` VALUES (2, 'Đèn ngủ, đèn cảm ứng silicon mèo mini với hình dáng dễ thương, bề mặt dẻo mềm mại sẽ trở thành một người bạn nhỏ trong phòng ngủ của người dùng, đặc biệt là trẻ em. Ánh đèn dịu nhẹ, không chói mắt, đổi màu từ từ khiến tinh thần thư giãn, đưa bạn vào giấc ', 'https://muasam365.net/pictures/picfullsizes/2021/10/05/hrf1633425690.jpg', 'https://muasam365.net/pictures/picfullsizes/2021/10/05/bfc1633425690.jpg', 250000, 10, 10, 'ĐÈN NGỦ, ĐÈN CẢM ỨNG SILICON MÈO MINI N278', 3);
INSERT INTO `product` VALUES (3, 'Thiết kế thông minh các ngăn tủ đều có bản lề xoay, giúp đóng mở theo chiều dọc với một góc nghiêng phù hợp giúp bạn lấy hoặc đặt giày một cách thuận tiện hơn.Ngăn tủ rộng rãi: thiết kế với ngăn tủ 1 tầng, tối ưu hóa diện tích để giày, dép của bạn. Giúp b', 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_1_6e7c124153fb4356b875a83fd8da49ad_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_4_30494f0d458143b3ace631419107c607_master.jpg', 1590000, 35, 0, 'Tủ Giày 3 Ngăn Marcell - Màu Đá Xanh', 2);
INSERT INTO `product` VALUES (4, 'Veneer gỗ sồi tự nhiên\r\nBề mặt sản phẩm Bàn Sofa Gỗ Tròn MOHO OSLO 901 phủ Veneer gỗ sồi tự nhiên cho bề mặt vân gỗ tinh tế, bền màu, nhẵn và sáng bóng. Đồng thời, giúp sản phẩm không bị co ngót, nứt khi thời tiết thay đổi.Chất liệu cao su tự nhiên đảm bả', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_1_263a4ddc3999406b8c3ad6fe4120b654_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_2_e36fb60e3892425bbad5ccb58590c8a1_master.jpg', 1290000, 30, 0, 'Bàn Sofa – Bàn Cafe – Bàn Trà Tròn Gỗ MOHO OSLO 901', 0);
INSERT INTO `product` VALUES (5, 'Gỗ tràm tự nhiên sử dụng gỗ tràm tự nhiên đảm bảo vệ độ chắc chắn cao, chống công vênh, mối mọt cho giường ngủ của bạn.Sử dụng chất liệu gỗ thông giúp giường ngủ VLINE 601 có khả năng chịu lực tốt và độ bền cao.\r\nGiường ngủ VLINE có kích thước chiều ngang', 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_1_5211e7d2a3da44f58070de291c446400_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_2_09e6f0afa7684efcbb049ae74aa0c183_master.jpg', 5990000, 40, 0, 'Giường Ngủ Gỗ Tràm MOHO VLINE 601 Nhiều Kích Thước', 5);
INSERT INTO `product` VALUES (6, ' Phần khung lưng và tựa tay được làm bằng chất liệu nhựa cao cấp kết hợp cùng kết cấu bo cong từng đường nét vừa tạo sự mềm mại trong thiết kế nhưng lại vô cùng chắc chắn và độ bền cao.Vải lưới mềm mại thoáng khí Với chất liệu vải nhập cao cấp, thoáng khí', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_1_e2e0f1d592c34753b5c755af1444ecc2_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_2_847c0e08233e4c02bb7aef01493dacfe_master.jpg', 899000, 10, 12, 'Ghế Văn Phòng Chân Quỳ MOHO CALLOSO 701', 1);
INSERT INTO `product` VALUES (7, 'Ghế sofa đơn có thể kết hợp đa dạng phong cách có thiết kế tối giản, dễ dàng kết hợp với ghế sofa VLINE thông thường và sofa góc để tạo thành một bộ sản phẩm hoàn chỉnh cho nội thất phòng khách nhà bạn thêm hoàn thiện, nâng tầm không gian sống nhà bạn. Vi', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_4_25293fd64e1146188437415b13cf2353_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_1_d25e7a0c9a874e9399c7b3ccaa137167_master.jpg', 1990000, 30, 0, 'Ghế Đôn Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 1);
INSERT INTO `product` VALUES (8, 'Ghế ăn gia đình NEXO sở hữu thiết kế tối giản, không cầu kỳ, mang đậm phong cách Scannadivian đẹp đẽ và hiện đại. Các chi tiết trên từng góc cạnh của ghế được xử lý bo tròn vô cùng hoàn hảo, tạo nên một điểm nhấn tinh tế và êm ái trong thiết kế. Ngoài ra,', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_1_6a5ac2217241473cb6978eac22fe5189_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_2_4404f143e77e4c8e90c5dbbff8abfa26_master.jpg', 1790000, 30, 3, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO NEXO 601', 1);
INSERT INTO `product` VALUES (9, 'Bàn ăn đẹp mang kiểu dáng tinh tế, tối giản thiết kế bàn ăn toát lên vẻ ngoài đây tinh tế nhờ vào đường cong và bo tròn góc cạnh, mặt bàn có kích thước lớn kết hợp với khung chân bàn được tiện thanh mảnh nhưng vẫn đảm bảo độ chắc chắn.Kết cấu bàn ăn gỗ ch', 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_1_792c0ebcacf24ab49f42e3b55eab0cff_master.jpg', 4990000, 40, 0, 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO ODENSE 601', 0);
INSERT INTO `product` VALUES (10, 'Ghế ăn VIBORG mang trong mình thiết kế tinh tế và hiện đại.Ghế ăn VIBORG sở hữu thiết kế tối giản, không cầu kỳ nhưng các chi tiết trên từng góc cạnh của ghế được xử lý một cách hoàn hảo. Chúng mang đường bo cong hoàn hảo, từ đường bo cong của tựa lưng đế', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_3_4af19c496b754183a4577bc8b558762d_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_481442b439dc489692b8cf66ecc49e4f_master.jpg', 1290000, 35, 0, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO VIBORG 601', 1);
INSERT INTO `product` VALUES (11, 'Ghế ăn gia đình có thiết kế tối giản Đặc trưng của bộ sưu tập NYBORG là sự tối giản trong từng món đồ nội thất gỗ. Sự đồng bộ với những đường nét thiết kế của bàn ăn, ghế ăn NYBORG tạo nên bộ bàn ăn 4 ghế mang lại cảm giác đơn giản nhưng không kém sang tr', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_1_3466d41532124dee8fdaf9a0c314f9bf_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_3_b391054648704f86b7aba316cc976d81_master.jpg', 1290000, 10, 0, 'Ghế Ăn Gỗ Cao Su Tự Nhiên 601 MOHO NYBORG', 1);
INSERT INTO `product` VALUES (12, 'Thiết kế mạnh mẽ và tối giản với thiết kế khác biệt so với các bộ sưu tập hiện tại của MOHO, bàn ăn NYBORG mang trong mình một thiết kế mạnh mẽ, đơn giản nhưng cùng với màu sắc vintage, đen bóng hòa với màu của gỗ tràm tạo nên một thiết kế rất đẹp mắt và ', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_6_c55ca9a6feab482991c5e641fab21ba7_master.jpg', 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_1_260a21deeddc4d3fb8a2b5c38f0ca3c7_master.jpg', 4990000, 10, 0, 'Bàn Ăn Gỗ Tràm Tự Nhiên MOHO NYBORG 301', 0);
INSERT INTO `product` VALUES (13, 'Ghế sofa băng Loveseats 01 SFB68041 là một trong những mẫu ghế băng toát lên nét đẹp cổ điển được nhiều khách hàng ưa chuộng và sử dụng trong các thiết kế có hơi hướng retro. Nệm mút D40 có độ đàn hồi êm ái, mang đến sự thoải mái khi ngồi. Nệm bọc simili ', 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-01.jpg', 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-02.jpg', 10450000, 10, 0, 'Ghế sofa băng 200x90cm Loveseats 01 nệm bọc simili cao cấp SFB68041', 1);
INSERT INTO `product` VALUES (14, 'Ghế sofa đơn, ghế cafe nệm simili khung sắt TTG014 toát lên vẻ đẹp tinh tế với khung ghế được làm từ sắt tròn thanh mảnh nhưng có khả năng chịu lực tốt kết hợp với phần nệm bọc simili sang trọng, nệm mút êm ái mang đến sự thoải mái khi ngồi lâu. Ghế sofa ', 'https://homeoffice.com.vn/images/detailed/61/ghe-sofa-boc-nem-khung-sat.jpg', 'https://homeoffice.com.vn/images/detailed/61/ghe-banh-khung-sat-boc-nem-vai-simili-3.jpg', 1794000, 15, 0, 'Ghế sofa đơn, ghế cafe nệm simili khung sắt TTG014', 1);
INSERT INTO `product` VALUES (15, 'Ghế sofa đơn Napa nệm bọc vải tay viền gỗ GSD68064 với phần lưng, nệm ghế được làm từ chất liệu vải dày dặn, có độ đàn hồi cao mang đến sự thoải mái cho người ngồi trong quá trình sử dụng kết hợp cùng khung chân được chế tác từ sắt mang đến sự vững chãi v', 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-02a.jpg', 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-03a.jpg', 1980000, 40, 0, 'Ghế sofa đơn Napa nệm bọc vải tay viền gỗ GSD68064', 1);
INSERT INTO `product` VALUES (16, 'Tủ trang trí cửa kính gỗ cao su chân sắt KTB68123 sử dụng chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp các hệ hộc kéo và ngăn mở đẹp mắt phối màu hợp lý sẽ giúp không gian nhà bạn thêm đẹp hơn. Chân sắt sơn tĩn', 'https://homeoffice.com.vn/images/detailed/60/tu-trang-tri-ktb68123-04a.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trang-tri-ktb68123-05a.jpg', 6400000, 15, 0, 'Tủ trang trí cửa kính gỗ cao su chân sắt KTB68123', 2);
INSERT INTO `product` VALUES (17, 'Tủ trang trí cửa mây đế chân sắt KTB68119 có kích thước tương đối nhỏ gọn, dễ di chuyển phù hợp với không gian có diện tích vừa và nhỏ. Chất liệu chính được sử dụng là gỗ cao su tiêu chuẩn AA được xử lý và hoàn thiện chống thấm đảm bảo bền bỉ theo thời gi', 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-12.jpg', 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-11.png', 2450000, 20, 0, 'Tủ trang trí cửa mây đế chân sắt KTB68119', 2);
INSERT INTO `product` VALUES (18, 'Sofa băng 1m7 nệm bọc vải chân gỗ SFB68060 là mẫu ghế vừa mang phong cách hiện đại vừa toát lên vẻ đẹp cổ điển khó mà cưỡng lại nên được rất nhiều khách yêu thích và lựa chọn cho phòng khách của mình. Lưng ghế với thiết kế giật nút kết hợp chân gỗ tiện là', 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-04.jpg', 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-05.jpg', 6600000, 10, 0, 'Sofa băng 1m7 nệm bọc vải chân gỗ SFB68060', 1);
INSERT INTO `product` VALUES (19, 'Bàn Sofa Olivia 2 tầng chân sắt TT68132 mẫu bàn là sự kết hợp của 3 vật liệu chính gồm Gỗ Tràm dày 25mm, Gỗ cao su dày 17mm và khung chân sắt với kích thước mặt bàn trên là tròn 60cm được làm từ gỗ cao su tiêu chuẩn AA dày 17mm sơn Pu Trắng hoàn thiện, mặ', 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-07.jpg', 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-02.jpg', 1495000, 25, 0, 'Bàn Sofa Olivia 2 tầng chân sắt TT68132', 0);
INSERT INTO `product` VALUES (20, 'Giường ngủ Ferro GN68004 có kích thước Queen Size 206x160x35 (cm) phù hợp dành cho hai người sử dụng. Nếu bạn đang tìm kiếm một mẫu giường ngủ có thiết kế độc đáo và sáng tạo thì Giường Ngủ Ferro GN68004 sẽ là một sự lựa chọn tuyệt vời. Phong cách kết hợp', 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-2.jpg', 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-1.jpg', 5500000, 30, 0, 'Giường ngủ khung sắt Ferrro - 206x160x35 (cm) GN68004', 5);
INSERT INTO `product` VALUES (25, 'Sở hữu kiểu dáng đơn giản, đẹp mắt với phần mặt bàn được mở rộng thêm viền gỗ giúp tăng thêm chất mộc cho góc làm việc. Với chất gỗ keo dày dặn đem lại sự chắc chắn và bền bỉ theo thời gian, với đó là chất vân gỗ độc đáo rất phù hợp để trang trí cho căn phòng làm việc thêm sinh động hơn.', 'https://homeoffice.com.vn/images/detailed/67/ban-lam-viec-don-gian-go-keo-2.jpg', 'https://homeoffice.com.vn/images/detailed/67/ban-lam-viec-don-gian-go-keo-3.jpg', 165000, 15, 10, 'Bàn làm việc 120x60cm gỗ tràm chân sắt sơn tĩnh điện SPD68200', 0);
INSERT INTO `product` VALUES (26, 'Bàn làm việc gỗ Tràm SPD68201 với mặt bàn làm từ gỗ tràm 25mm tiêu chuẩn AA  được xử lý PU hoàn thiện cho bề mặt sản phẩm rất đẹp mắt, chống nước tuyệt đối. Kết hợp với mặt bàn là hệ khung chân sắt chữ A hệ Minimal có cơ cấu lắp ráp ngàm vô cùng chắc chắn và tiện lợi khi có thể dễ dàng tháo lắp và vận chuyển. ', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-5.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-10.jpg', 1820000, 35, 10, 'Bàn làm việc 120x60cm gỗ tràm chân sắt chữ A hệ Minimal SPD68201', 0);
INSERT INTO `product` VALUES (27, ' Với mặt bàn làm từ gỗ tràm 25mm tiêu chuẩn AA  được xử lý PU hoàn thiện cho bề mặt sản phẩm rất đẹp mắt, chống nước tuyệt đối. Kết hợp với mặt bàn là hệ khung chân sắt hệ Aconcept có cơ cấu lắp ráp ngàm vô cùng chắc chắn và tiện lợi khi có thể dễ dàng tháo lắp và vận chuyển. Mặt bàn nhiều kích thước từ nhỏ gọn 100x60cm đến kích thước lớn hơn 140x60cm giúp bạn có sự lựa chọn phù hợp với nhu cầu sử dụng.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-02.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-01.jpg', 1710000, 25, 10, 'Bàn làm việc gỗ Tràm dày 25mm màu cánh gián chân sắt Aconcept HBWD046', 0);
INSERT INTO `product` VALUES (28, 'Bàn làm việc 120x60cm gỗ Plywood HBYC013 thuộc hệ bàn YCHI với khung chân sắt được lấy ý tưởng từ chữ Y kiểu dáng độc đáo, đẹp mắt. Khung chân sắt sử dụng sắt vuông 40mm và sắt hộp 40x80mm mang đến sự chắc chắn, đặc biệt hệ YCHI sử dụng 3 thanh giằng cực kỳ chắc chắn. Mặt bàn gỗ Pywood cốt gỗ tự nhiên ề mặt phủ melamin nhiều vân màu sắc lựa chọn. Mặt bàn kích thước 120x60cm theo tiêu chuẩn bàn làm việc hiện nay.', 'https://homeoffice.com.vn/images/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-02.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-03.jpg', 1760000, 15, 10, 'Bàn làm việc 120x60cm gỗ Plywood hệ YCHI HBYC013', 0);
INSERT INTO `product` VALUES (29, 'Ghế giám đốc chân xoay có ngả lưng HOGVP149 được chú trọng thiết kế cùng kiểu dáng sang trọng phù hợp với người dùng là doanh nhân. Ghế được gia công tỉ mỉ với các đường chỉ may cẩn thận, đẹp mắt. Lưng cao có thể ngả lưng kết hợp tựa đầu thư giãn dễ dàng chống mệt mỏi tăng năng suất công việc và giúp bạn nghỉ ngơi sau những giờ làm việc căng thẳng.', 'https://noithatvuongphat.vn/wp-content/uploads/2023/03/ghe-giam-doc-chan-xoay-co-nga-lung-hogvp149-600-x-600.jpg', 'https://homeoffice.com.vn/images/detailed/60/ghe-chan-xoay-hogvp149-07a.jpg', 3700000, 10, 10, 'Ghế giám đốc chân xoay có ngả lưng HOGVP149', 1);
INSERT INTO `product` VALUES (30, 'Ghế làm việc chân xoay nệm simili GAKJB-673X có cấu tạo gồm 2 phần nệm ngồi và chân xoay có bánh xe cùng kích thước nhỏ gọn phù hợp với không gian làm việc có diện tích khiêm tốn. Thiết kế tối giản nhưng không kém phần đẹp mắt kết hợp phần nệm ngồi bọc simili nhiều màu sắc chắc chắn sẽ là điểm nhấn cho không gian làm việc của bạn thêm phần ấn tượng.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak673x-01a.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak673x-02a.jpg', 1150000, 10, 10, 'Ghế làm việc chân xoay nệm simili GAKJB-673X', 1);
INSERT INTO `product` VALUES (31, 'Ghế làm việc chân xoay Iris nệm nhiều màu GAK188 với phần lưng và nệm ghế bọc simili cao cấp hạn chế trầy xước, chống thấm nước dễ dàng vệ sinh. Chân ghế được làm bằng chất liệu sắt sơn tĩnh điện tạo sự chắc chắn khi ngồi, bánh xe di chuyển linh hoạt, thuận tiện khi cần lấy đồ. Bên cạnh đó ghế làm việc GAK188 với kiểu dáng đẹp mắt chắc chắn là sẽ là điểm nhấn cho không gian làm việc của bạn.', 'https://homeoffice.com.vn/images/detailed/60/ghe-lam-viec-gak188-02a.jpg', 'https://homeoffice.com.vn/images/detailed/60/ghe-lam-viec-gak188-04a.jpg', 1750000, 15, 10, 'Ghế làm việc chân xoay Iris nệm nhiều màu GAK188', 1);
INSERT INTO `product` VALUES (32, 'Kệ sách di động 2 tầng KS68198 sử dụng hoàn toàn bằng gỗ cao su tự nhiên được xử lý và hoàn thiện chống thấm nước, chống cong vênh và có vân màu sắc đẹp mắt, ngoài màu gỗ tự nhiên bạn có thể lựa chọn những màu sắc khác trong bảng màu gỗ tại HomeOffice. Dưới chân kệ trang bị bánh xe có khoá dễ dàng di chuyển khi cần. Kiểu dáng kệ độc đáo phù hợp nhiều không gian từ phòng khách gia đình đến văn phòng công ty hay sảnh chờ khu vực công cộng,...', 'https://homeoffice.com.vn/images/detailed/66/ke-go-di-dong-2-tang-2.jpg', 'https://homeoffice.com.vn/images/detailed/66/ke-go-di-dong-2-tang-5.jpg', 1200000, 40, 0, 'Kệ sách gỗ di động nhỏ gọn hình tròn 2 tầng KS68198', 4);
INSERT INTO `product` VALUES (33, 'Tủ trang trí gỗ tự nhiên KTB68127  sử dụng chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp các hệ hộc kéo và ngăn mở đẹp mắt phối màu hợp lý sẽ giúp không gian nhà bạn thêm đẹp hơn. Bên cạnh đó, dưới chân tủ gắn bánh xe có khoá chắc chắn giúp việc di chuyển thuận tiện dễ dàng hơn.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-01.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-02.jpg', 4950000, 35, 0, 'Tủ trang trí gỗ tự nhiên KTB68127', 2);
INSERT INTO `product` VALUES (34, 'Với kiểu dáng nhỏ gọn và đơn giản, mẫu kệ gỗ KS68195 mang lại cho không gian lưu trữ linh động, giup đánh thức sự sáng tạo của bạn. Nếu có nhiều ý tưởng trang trí cho không gian sống và làm việc, bạn có thể bố trí thêm 2 hoặc 3 chiếc kệ gỗ KS68195 để bạn có thể vừa trang trí lại căn phòng thêm sinh động, vừa có thêm không gian lưu trữ. Kệ có 2 ngăn để đồ có khoảng rộng có kích thước vừa những cuốn sách cỡ 30cm. Bạn có thể đặt vài món đồ trang trí, sách vở hoặc chậu cây lên đó.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-1.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-2.jpg', 790000, 10, 0, 'Kệ sách nhỏ đơn giản 2 ngăn gỗ cao su KS68195', 4);
INSERT INTO `product` VALUES (35, 'Ghế cafe GAK626 là dòng ghế ngồi bọc nệm cao cấp, có phần lưng tựa vừa vặn và êm ái. Với phần nệm ngồi và lưng tựa được bọc nệm dày dặn, tạo cảm giác thoải mái và dễ chịu khi ngồi lâu. Bên ngoài được bọp lớp vải bố có tông màu xám trắng trung tính, trang nhã phù hợp với nhiều không gian nội thất, dễ dàng phối đồ nội thất hơn. Chiều cao ghế được căn chỉnh đúng tiêu chuẩn, thích hợp sử dụng cho nhiều mục đích khác nhau, làm ghế bàn ăn, ghế cafe hoặc ghế làm việc. Hệ khung chân sắt được gia công chắc chắn, mối hàng được xử lý tỉ mỉ trên từng chi tiết.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-2.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-2.jpg', 1650000, 15, 0, 'Ghế cafe lưng tựa bọc nệm chân sắt sơn tĩnh điện GAK626', 1);
INSERT INTO `product` VALUES (36, 'Ghế xếp lưới cafe GCF156 là loại ghế chuyên dụng cho quán cafe, trà sữa, khách sạn resort, hoặc những hàng quán cần sự linh hoạt. Với chất liệu khung lưới dày dặn, chịu tải trọng tốt, ngồi nhiều vẫn giữ được dáng ghế. Khung sắt được làm chắc chắn, với loại sắt dày dặn, đảm bảo cho người ngồi cảm giác thoải mái, không bị ọp ẹp và rung lắc. Bề mặt khung sắt được sơn tĩnh điện chống gỉ, giúp đảm bảo tính thẩm mỹ và độ bền cho sản phẩm. ', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-xep-cafe-lung-cao-2.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-xep-cafe-lung-cao-5.jpg', 169000, 25, 0, 'Ghế xếp lưới lưng cao khung sắp sơn tĩnh điện GCF156', 1);
INSERT INTO `product` VALUES (38, 'Mặt bàn được làm từ gỗ cao su tự nhiên, dày 17m sơn PU hoàn thiện tiêu chuẩn của HomeOfice với 5 màu giúp bạn có được sự lựa chọn hợp với nhu cầu và sở thích của bản thân, đây là một trong những ưu điểm của HomeOffice được nhiều khách hàng yêu thích. Chân sắt được gia công tỉ mỉ từng góc độ cho ra đời khung chân bàn có độ hoàn thiện cao và khả năng chịu lực tốt, bề mặt sắt phủ lớp sơn tĩnh điện cao cấp chống rỉ sét đảm bảo độ bền theo thời gian. Mẫu bàn ăn tròn được nhiều người dùng ưa chuộng vì khả năng tiết kiệm diện tích bày trí mang đến không gian nhà bếp thoải mái, thoáng đãng mà gần gũi sẽ góp phần giúp bạn tạo nên không gian nhà bếp lý tưởng.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-1.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-2.jpg', 2365000, 20, 0, 'Bàn ăn tròn 1m VERA mặt gỗ nhiều màu chân sắt sơn tĩnh điện BA68044', 0);
INSERT INTO `product` VALUES (39, 'Bàn ăn Mini gỗ cao su chân sắt lắp ráp BA68041 mặt bàn gỗ cao su tự nhiên được hoàn thiện PU chống thấm nước, cong vênh. Chân bàn cơ cấu lắp ráp hướng đến sự tiện lợi, giúp bạn thuận tiện khi tháo lắp hay vận chuyển. Kích thước mặt bàn 70x70(cm) tương đối nhỏ gọn phù hợp với không gian có diện tích vừa và nhỏ, bàn BA68041 có thể là bàn ăn giúp tiết kiệm diện tích tạo sự thoáng đãng cho nhà bếp của bạn.', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/21/ban-an-vuong-70cm.jpeg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/21/ban-cafe-uban-CFD68033-02.jpg', 1345000, 35, 0, 'Bàn ăn Mini gỗ cao su chân sắt lắp ráp BA68041', 0);
INSERT INTO `product` VALUES (40, 'Giường tầng khung sắt lắp ráp GT013 với hệ khung sắt lắp ráp chắc chắn từ sắt hộp dày 1.2mm với hệ khung ngàm hiện đại, gia công hoàn thiện ở mức cực cao, sơn tĩnh điện đẹp mắt. Các hệ gỗ cao su dày 18mm tiêu chuẩn AA được xử lý PU hoàn thiện bề mặt đẹp. Đây là sản phẩm thông minh giúp vận chuyển vào các căn nhà diện tích khiêm tốn. Bên cạnh công năng thì chất lượng sản phẩm, vẻ thẩm mỹ cũng được HomeOffice chú ý đến trong các chi tiết sản xuất hoàn thiện. Mẫu giường phù hợp với nệm kích thước 1mx2m 2 tầng cho hai người nằm ngủ thoải mái .', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-5.jpg', 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-2.jpg', 8500000, 25, 0, 'Giường tầng khung sắt lắp ráp mặt gỗ tự nhiên GT013', 5);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `quality` enum('GOOD','BAD') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `rate` int NOT NULL,
  `updated_at` date NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8ldiblkvx92d9i5yn9qqeuk8j`(`product_id` ASC) USING BTREE,
  INDEX `FKp62gdxif9h9dtdwcyf5b7gdi8`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK8ldiblkvx92d9i5yn9qqeuk8j` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKp62gdxif9h9dtdwcyf5b7gdi8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` int NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `token_type` enum('BEARER') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_pddrhgwxnms2aceeku9s2ewy5`(`token` ASC) USING BTREE,
  INDEX `FKn1okjowqyw7r2nl4hci3kahm6`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKn1okjowqyw7r2nl4hci3kahm6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for token_seq
-- ----------------------------
DROP TABLE IF EXISTS `token_seq`;
CREATE TABLE `token_seq`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token_seq
-- ----------------------------
INSERT INTO `token_seq` VALUES (1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reset_password_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reward_points` bigint NOT NULL,
  `roles` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_ob8kqyqqgmefl0aco34akdtpe`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
