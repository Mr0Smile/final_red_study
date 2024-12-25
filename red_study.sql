/*
 Navicat Premium Data Transfer

 Source Server         : wang
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : red_study

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 25/12/2024 20:00:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'wgx', '2545', 'Lovancair', 'http://localhost:9090/files/download/1733308123830-屏幕截图 2024-12-03 203347.png', 'ADMIN');
INSERT INTO `admin` VALUES (2, 'admin', 'admin', 'admin', NULL, 'ADMIN');

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(22) NOT NULL,
  `submit_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (1, '1', '1', 1, '');
INSERT INTO `articles` VALUES (2, '1', '# 胡志迪大雾', 2, '');
INSERT INTO `articles` VALUES (6, '蜂箱支架', '<h3>Lovancair</h3>\n<h3>Features:</h3>\n1. Lightweight and convenient for easy movement<br>\n2. Widely used in gardens, farms, and yards<br>\n3. Provides safe and secure holding during inspections<br>\n4. Easy to clean and maintain<br>\n5. Made of stainless steel for durability<br>\n6. Can hold up to 4 frames of honey and brood<br>\n7. Durable and break-proof construction<br>\n8. Beehive hanger for organizing frames and tools<br>\n9. Easy to use and hang directly on the beehive<br>\n\n<h3>Specification:</h3>\n\n<h5>Name:</h5> Beehive Inspection Bracket\n<h5>Material:</h5> Stainless steel\n<h5>Color: </h5>Yellow,Black,Blue,Green\n<h5>Package includes:</h5>\n2pcs * Beehive Inspection Bracket\n\n\n\n![13.jpg](http://localhost:9090/files/download/1731413817624-13.jpg)', 1, '2024/11/12 12:17');
INSERT INTO `articles` VALUES (7, '杀杀杀', '<h3>Lovancair</h3>\n<h3>Features:</h3>\n1. Lightweight and convenient for easy movement<br>\n2. Widely used in gardens, farms, and yards<br>\n3. Provides safe and secure holding during inspections<br>\n4. Easy to clean and maintain<br>\n5. Made of stainless steel for durability<br>\n6. Can hold up to 4 frames of honey and brood<br>\n7. Durable and break-proof construction<br>\n8. Beehive hanger for organizing frames and tools<br>\n9. Easy to use and hang directly on the beehive<br>\n\n<h3>Specification:</h3>\n\n<h5>Name:</h5> Beehive Inspection Bracket\n<h5>Material:</h5> Stainless steel\n<h5>Color: </h5>Yellow,Black,Blue,Green\n<h5>Package includes:</h5>\n2pcs * Beehive Inspection Bracket\n\n\n\n![13.jpg](http://localhost:9090/files/download/1731413817624-13.jpg)', 1, '2024-11-12T12:17:45.432Z');
INSERT INTO `articles` VALUES (8, '炮打胡志迪——我的一张大字报', '胡志迪，原名蒋志迪，男，浙江宁波奉化人，从小接受资本主义反革命教育，幼年，跟随同乡蒋介石卖国贼于1928-1933年在上海外滩嫖娼，后炒股失败，于和平饭店连同克拉拉一同被抓，然而此人阴险狡诈，利用美色诱骗狱警，遂逃脱，更名胡志迪，字愚夫。隐于浙江师范大学杏园男寝5幢509。\n![微信图片_20241112202212.jpg](http://localhost:9090/files/download/1731414154539-微信图片_20241112202212.jpg)', 1, '2024/11/12 12:26');
INSERT INTO `articles` VALUES (9, '钱钱钱', '强强强强', 1, '2024-11-12T12:34:52.587Z');
INSERT INTO `articles` VALUES (11, 'ssssssdwdas', '叶阳，原名蒋志迪，男，浙江宁波奉化人，从小接受资本主义反革命教育，幼年，跟随同乡蒋介石卖国贼于1928-1933年在上海外滩嫖娼，后炒股失败，于和平饭店连同克拉拉一同被抓，然而此人阴险狡诈，利用美色诱骗狱警，遂逃脱，更名胡志迪，字愚夫。隐于浙江师范大学杏园男寝5幢509。\n![微信图片_20241112202212.jpg](http://localhost:9090/files/download/1731414154539-微信图片_20241112202212.jpg)', 14, '2024-11-12T12:37:23.298Z');
INSERT INTO `articles` VALUES (13, '1234', '1234', 1, '2024-11-27T04:37:49.512Z');
INSERT INTO `articles` VALUES (14, '1234444', '4444', 1, '2024-11-27T05:01:45.130Z');
INSERT INTO `articles` VALUES (15, 'tttt', 'tttt', 1, '2024-11-27T05:04:59.316Z');
INSERT INTO `articles` VALUES (16, '33333333', '333333333', 1, '2024-11-27T06:59:15.506Z');
INSERT INTO `articles` VALUES (17, '测试', '睡了一觉写的，看看效果![7.jpg](http://localhost:9090/files/download/1732729675345-7.jpg)', 1, '2024/11/28 01:47');
INSERT INTO `articles` VALUES (18, '新的', '撒大苏打撒', 1, '2024/11/27 18:14');
INSERT INTO `articles` VALUES (19, '222', '223', 1, '2024/11/28 01:46');
INSERT INTO `articles` VALUES (20, '娃娃大啊', '12', 1, '2024/12/04 14:07');
INSERT INTO `articles` VALUES (21, '胡志迪没有牛牛', '1', 1, '2024/12/04 18:23');
INSERT INTO `articles` VALUES (22, '法国投入商业航天人', '他如果他惹我他', 1, '2024/12/04 18:39');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '书籍分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Java Web');
INSERT INTO `category` VALUES (3, 'C');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `content_type` int(11) NULL DEFAULT NULL COMMENT '内容类型',
  `order` int(11) NULL DEFAULT NULL COMMENT '内容顺序',
  `show_type` int(11) NULL DEFAULT NULL COMMENT '展示方式',
  `special_column_id` int(11) NULL DEFAULT NULL COMMENT '专栏ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '内容库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, 1, '1', 0, 0, 0, NULL);
INSERT INTO `content` VALUES (2, 1, '2', 1, 0, 1, NULL);
INSERT INTO `content` VALUES (3, 1, '3', 0, 0, 2, NULL);
INSERT INTO `content` VALUES (4, 2, '1', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品简介',
  `specials` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品特色',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `discount` double NULL DEFAULT 1 COMMENT '折扣',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品单位',
  `stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (12, 'C语言：从入门到精通', 'http://localhost:9090/files/download/1725368644124-C.jpg', 'C语言基础教材', '通俗易懂，快速入门', 40.50, 1, '本', '97', 3);
INSERT INTO `goods` VALUES (14, 'java web', NULL, NULL, NULL, 38.20, 1, '本', '48', 1);

-- ----------------------------
-- Table structure for goods_in
-- ----------------------------
DROP TABLE IF EXISTS `goods_in`;
CREATE TABLE `goods_in`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `num` int(11) NULL DEFAULT NULL COMMENT '进货数量',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进货渠道',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进货日期',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品进货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_in
-- ----------------------------
INSERT INTO `goods_in` VALUES (2, 12, 100, '出版社', '2024-09-04 09:08:20', '');
INSERT INTO `goods_in` VALUES (3, 14, 11, '出版社', '2024-09-04 09:17:15', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '测试公告', '测试公告', '2024-09-03 14:29:53');
INSERT INTO `notice` VALUES (4, '系统维护公告', '系统将于2024-09-01 09:00到2024-09-01 14:00进行更新维护', '2024-09-03 14:36:01');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单编号',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '下单人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, '2cb099dae2a14af0967cbf56cb084c9d', 12, 1, 1, '已取消', '2024-09-18 14:24:09');
INSERT INTO `orders` VALUES (3, '35f1a3fe1c414bbcb8c25ee6a79e4f0c', 12, 0, 1, '已收货', '2024-09-18 14:26:53');
INSERT INTO `orders` VALUES (5, '95a7b9bf4f6f49b38e70454ba2578a2f', 12, 1, 13, '待支付', '2024-09-18 14:56:01');
INSERT INTO `orders` VALUES (6, 'b219ee1ab0fe45489694fd178484b504', 12, 0, 1, '已取消', '2024-09-19 13:27:52');
INSERT INTO `orders` VALUES (13, '29d2bf49fbc5476c882cf6c16d2558d8', 12, 1, 1, '待支付', '2024-09-19 13:33:25');
INSERT INTO `orders` VALUES (14, '79193c2c42f94dfe8db607717ca852e4', 12, 3, 2, '已取消', '2024-09-19 14:33:32');
INSERT INTO `orders` VALUES (15, 'bb4b797eb32442eb84cd712f6c6d03ee', 12, 1, 2, '待发货', '2024-09-19 14:33:50');
INSERT INTO `orders` VALUES (16, '202327eacd774cef85113207f78f190b', 12, 1, 1, '待发货', '2024-12-04 18:21:05');

-- ----------------------------
-- Table structure for study_base
-- ----------------------------
DROP TABLE IF EXISTS `study_base`;
CREATE TABLE `study_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '研学基地ID',
  `study_base_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地名字',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地介绍',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章ID',
  `special_column_id` int(11) NULL DEFAULT NULL COMMENT '专栏ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '研学基地表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_base
-- ----------------------------
INSERT INTO `study_base` VALUES (1, '1号研学基地', '1111', 1, NULL);
INSERT INTO `study_base` VALUES (2, '2号研学基地', NULL, 2, NULL);

-- ----------------------------
-- Table structure for study_basefrom
-- ----------------------------
DROP TABLE IF EXISTS `study_basefrom`;
CREATE TABLE `study_basefrom`  (
  `id` int(11) NOT NULL COMMENT '研学基地ID',
  `study_baseform_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地名字',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地介绍',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章ID',
  `special_column_id` int(11) NULL DEFAULT NULL COMMENT '专栏ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '研学基地表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_basefrom
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', 'user', '普通用户', 'http://localhost:9090/files/download/avatar.png', 'USER', '不愿透露', '13362991597', '17721453389@163.com', '2024-09-05 15:44:40');
INSERT INTO `user` VALUES (2, 'user2', 'user2', '普通用户2', NULL, 'USER', '女', '17721453389', '2469724709@qq.com', '2024-09-05 15:43:43');
INSERT INTO `user` VALUES (13, 'user3', 'user3', 'user3', NULL, 'USER', NULL, NULL, NULL, '2024-09-18 08:12:06');
INSERT INTO `user` VALUES (14, 'hzd_dsb', '123', 'hzd_dsb', NULL, 'USER', NULL, NULL, NULL, '2024-11-12 20:35:31');

SET FOREIGN_KEY_CHECKS = 1;
