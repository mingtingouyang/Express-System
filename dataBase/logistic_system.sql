/*
 Navicat Premium Data Transfer

 Source Server         : DigitalOcean
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : 167.71.143.69:3306
 Source Schema         : logistic_system

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 02/08/2019 16:24:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_basicdata
-- ----------------------------
DROP TABLE IF EXISTS `t_basicdata`;
CREATE TABLE `t_basicdata`  (
  `base_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `base_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据名称',
  `base_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据描述',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_basicdata
-- ----------------------------
INSERT INTO `t_basicdata` VALUES (1, '区间管理', '物流能运送的区间范围', NULL);
INSERT INTO `t_basicdata` VALUES (2, '大陆', '国内', 1);
INSERT INTO `t_basicdata` VALUES (3, '香港', '香港', 1);
INSERT INTO `t_basicdata` VALUES (4, '美国', '', 1);
INSERT INTO `t_basicdata` VALUES (5, '取件方式', '', NULL);
INSERT INTO `t_basicdata` VALUES (6, '上门取件', '', 5);
INSERT INTO `t_basicdata` VALUES (7, '客户自行配送到仓库', '', 5);
INSERT INTO `t_basicdata` VALUES (8, '货运方式', '', NULL);
INSERT INTO `t_basicdata` VALUES (9, '海运', '', 8);
INSERT INTO `t_basicdata` VALUES (10, '空运', '坐飞机', 8);
INSERT INTO `t_basicdata` VALUES (11, '陆运', '', 8);
INSERT INTO `t_basicdata` VALUES (12, '付款方式', '', NULL);
INSERT INTO `t_basicdata` VALUES (13, '预付全款', '', 12);
INSERT INTO `t_basicdata` VALUES (14, '预付定金&到付全款', '', 12);
INSERT INTO `t_basicdata` VALUES (15, '到付', '到付', 12);
INSERT INTO `t_basicdata` VALUES (16, '单位', '描述货品单位', NULL);
INSERT INTO `t_basicdata` VALUES (17, 'kg', '千克', 16);
INSERT INTO `t_basicdata` VALUES (18, '吨', '吨', 16);
INSERT INTO `t_basicdata` VALUES (19, '只', '只', 16);
INSERT INTO `t_basicdata` VALUES (20, '个', '个', 16);
INSERT INTO `t_basicdata` VALUES (21, '件', '件', 16);
INSERT INTO `t_basicdata` VALUES (22, '桶', '', 16);
INSERT INTO `t_basicdata` VALUES (23, '台', '', 16);
INSERT INTO `t_basicdata` VALUES (24, '箱', '', 16);
INSERT INTO `t_basicdata` VALUES (25, '快递邮政', '', 5);
INSERT INTO `t_basicdata` VALUES (26, '新加坡', '', 1);
INSERT INTO `t_basicdata` VALUES (27, '澳大利亚', NULL, 1);
INSERT INTO `t_basicdata` VALUES (28, '仓库', '仓库列表', NULL);
INSERT INTO `t_basicdata` VALUES (29, '仓库1', '仓库列表', 28);
INSERT INTO `t_basicdata` VALUES (30, '仓库2', '仓库列表', 28);
INSERT INTO `t_basicdata` VALUES (31, '仓库3', '仓库列表', 28);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别 1男 2女',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `user_id` bigint(20) NOT NULL COMMENT '业务员id',
  `location_id` bigint(20) NOT NULL COMMENT '基础数据id',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '张无忌', '13553421632', 'zhangwuji@qq.com', '光明顶', 1, '我是张无忌', '234243243212323', 27, 2);
INSERT INTO `t_customer` VALUES (2, '乔峰', '13553334444', 'qiaof@qq.com', '襄阳', 1, '乔帮主厉害', '4353453234324', 27, 4);
INSERT INTO `t_customer` VALUES (3, '东方不败', '13552431234', 'dongfang@qq.com', '黑木崖', 0, '搞不清楚性别的客户', '234324234324324', 27, 4);
INSERT INTO `t_customer` VALUES (4, '西门吹雪', '13212344321', 'xumen@qq.com', '不知道', 1, '厉害的角色', '2343234543535', 29, 2);
INSERT INTO `t_customer` VALUES (9, '哪吒', '17608009029', 'nezha@qq.com', '广州', 1, '魔丸', '123123123123123123', 29, 27);
INSERT INTO `t_customer` VALUES (10, '陈德祥', '12345678910', 'cdx@qq.com', '广州', 1, '土豪', '123456789111111111', 30, 2);

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info`  (
  `order_id` bigint(20) NOT NULL,
  `total_volume` double(255, 2) NULL DEFAULT NULL,
  `total_weight` double(255, 2) NULL DEFAULT NULL,
  `total_value` double(255, 2) NULL DEFAULT NULL,
  `tax_rate` double(255, 2) NULL DEFAULT NULL,
  `weight_fee` double(255, 2) NULL DEFAULT NULL,
  `volume_fee` double(255, 2) NULL DEFAULT NULL,
  `tax_fee` double(255, 2) NULL DEFAULT NULL,
  `total_fee` double(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES (11, 8.00, 340.00, 13000.00, 0.00, 48000.00, 5600.00, 0.00, 55100.00);
INSERT INTO `t_info` VALUES (17, 2.00, 100.00, 10000.00, 0.00, 40000.00, 300.00, 0.00, 40500.00);
INSERT INTO `t_info` VALUES (20, 1.00, 100.00, 20000.00, 0.07, 20000.00, 100.00, 1400.00, 22500.00);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `shipping_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `shipping_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `shipping_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  `take_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取件联系人',
  `take_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `take_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取件电话',
  `order_status` int(11) NULL DEFAULT 0 COMMENT '订单状态 1 取件 2 运送中 3 完成',
  `payment_method_id` bigint(20) NULL DEFAULT NULL COMMENT '付款方式',
  `interval_id` bigint(20) NULL DEFAULT NULL COMMENT '到达区域',
  `take_method_id` bigint(20) NULL DEFAULT NULL COMMENT '取件方式',
  `freight_method_id` bigint(20) NULL DEFAULT NULL COMMENT '货运方式',
  `order_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (6, 29, 3, '广州', '张三', '23123213', '', '', '', 1, 13, 26, 6, 9, '国际物流');
INSERT INTO `t_order` VALUES (11, 29, 9, 'unit 13, 16 Courtney st., North Melbourne', '吴亦凡', '474878608', '', '', '', 1, 15, 27, 7, 11, '');
INSERT INTO `t_order` VALUES (17, 27, 1, '上海', '小敬哥', '12345678910', '', '', '', 1, 13, 2, 25, 9, '');
INSERT INTO `t_order` VALUES (20, 29, 4, '广州', '小敬', '12345678910', '', '', '', 1, 13, 27, 6, 9, '');

-- ----------------------------
-- Table structure for t_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE `t_orderdetail`  (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单明细id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `goods_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物名称',
  `goods_number` int(11) NULL DEFAULT NULL COMMENT '货物数量',
  `goods_unit` bigint(20) NULL DEFAULT NULL COMMENT '货物单位',
  `goods_unit_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '货物单价',
  `goods_total` decimal(10, 0) NULL DEFAULT NULL COMMENT '获取总价',
  `goods_remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderdetail
-- ----------------------------
INSERT INTO `t_orderdetail` VALUES (1, 6, '冰箱', 1, 23, 1000, 1000, '格力');
INSERT INTO `t_orderdetail` VALUES (2, 6, '红酒', 2, 24, 10000, 20000, '82年拉菲');
INSERT INTO `t_orderdetail` VALUES (3, 6, '小汽车', 1, 23, 1000000, 1000000, '保时捷');
INSERT INTO `t_orderdetail` VALUES (6, 11, '钻石', 2, 23, 1500, 3000, '2吨买不起，换1吨');
INSERT INTO `t_orderdetail` VALUES (8, 11, '汽车', 10, 24, 1000, 10000, '黄金不要了，换汽车');
INSERT INTO `t_orderdetail` VALUES (9, 17, '电脑', 2, 23, 5000, 10000, '无');
INSERT INTO `t_orderdetail` VALUES (10, 20, '电脑', 2, 23, 10000, 20000, '');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限类型(menu 菜单权限，permission：普通权限)',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限跳转url地址',
  `expression` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限表达式（shiro权限判断使用）',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父权限',
  `sort` int(11) NULL DEFAULT NULL COMMENT '菜单权限显示时候排序',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '管理员管理', 'menu', 'admin', 'admin:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (10, '系统操作', 'menu', 'index', 'system:index', -1, NULL);
INSERT INTO `t_permission` VALUES (11, '角色管理', 'menu', 'role', 'role:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (12, '权限管理', 'menu', 'permission', 'permission:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (13, '管理员列表', 'permission', 'admin/list', 'admin:list', 1, NULL);
INSERT INTO `t_permission` VALUES (15, '添加管理员', 'permission', 'admin/add', 'admin:insert', 1, NULL);
INSERT INTO `t_permission` VALUES (16, '删除管理员', 'permission', 'admin/delete', 'admin:delete', 1, NULL);
INSERT INTO `t_permission` VALUES (17, '修改管理员', 'permission', '', 'admin:update', 1, NULL);
INSERT INTO `t_permission` VALUES (18, '添加角色', 'permission', '', 'role:insert', 11, NULL);
INSERT INTO `t_permission` VALUES (19, '删除角色', 'permission', '', 'role:delete', 11, NULL);
INSERT INTO `t_permission` VALUES (20, '修改角色', 'permission', '', 'role:update', 11, NULL);
INSERT INTO `t_permission` VALUES (21, '角色列表', 'permission', '', 'role:list', 11, NULL);
INSERT INTO `t_permission` VALUES (22, '权限列表', 'permission', '', 'permission:list', 12, NULL);
INSERT INTO `t_permission` VALUES (23, '添加权限', 'permission', '', 'permission:insert', 12, NULL);
INSERT INTO `t_permission` VALUES (24, '删除权限', 'permission', '', 'permission:delete', 12, NULL);
INSERT INTO `t_permission` VALUES (25, '修改权限', 'permission', '', 'permission:update', 12, NULL);
INSERT INTO `t_permission` VALUES (31, '客户管理', 'menu', '/customer/customerPage.do', 'customer:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (32, '新增客户', 'permission', '', 'customer:insert', 31, NULL);
INSERT INTO `t_permission` VALUES (33, '删除客户', 'permission', '', 'customer:delete', 31, NULL);
INSERT INTO `t_permission` VALUES (34, '修改客户', 'permission', '', 'customer:update', 31, NULL);
INSERT INTO `t_permission` VALUES (36, '客户列表', 'permission', '', 'customer:list', 31, NULL);
INSERT INTO `t_permission` VALUES (49, '基础数据管理', 'menu', NULL, 'basicData:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (50, '基础数据列表', 'permission', NULL, 'basicData:list', 49, NULL);
INSERT INTO `t_permission` VALUES (51, '基础数据删除', 'permission', NULL, 'basicData:delete', 49, NULL);
INSERT INTO `t_permission` VALUES (52, '基础数据添加', 'permission', NULL, 'basicData:insert', 49, NULL);
INSERT INTO `t_permission` VALUES (53, '基础数据修改', 'permission', NULL, 'basicData:update', 49, NULL);
INSERT INTO `t_permission` VALUES (54, '订单管理', 'menu', '/order', 'order:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (55, '订单列表', 'permission', '/order/list', 'order:list', 54, NULL);
INSERT INTO `t_permission` VALUES (56, '订单删除', 'permission', '/order/delete', 'order:delete', 54, NULL);
INSERT INTO `t_permission` VALUES (57, '订单修改', 'permission', '/order/update', 'order:update', 54, NULL);
INSERT INTO `t_permission` VALUES (58, '订单添加', 'permission', '/order/insert', 'order:insert', 54, NULL);
INSERT INTO `t_permission` VALUES (59, '业务处理', 'menu', 'transaction', 'transaction:menu', 10, NULL);
INSERT INTO `t_permission` VALUES (60, '报价入库', 'permission', 'transaction/deal', 'transaction:deal', 59, NULL);
INSERT INTO `t_permission` VALUES (61, '财务审核', 'permission', 'transaction/export', 'transaction:export', 59, NULL);
INSERT INTO `t_permission` VALUES (62, '报价', 'permission', 'transaction/deal', 'transaction:quote', 59, NULL);
INSERT INTO `t_permission` VALUES (63, '入库', 'permission', 'transaction/deal', 'transaction:storage', 59, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色备注',
  `permission_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色id，多个角色使用逗号隔开 1,2,3,4',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', '最高权限', '10,1,13,15,16,17,11,18,19,20,21,12,22,23,24,25,31,32,33,34,36,49,50,51,52,53,54,55,56,57,58,59,60,62,63,61');
INSERT INTO `t_role` VALUES (2, '总经理', '领导', '10,1,13,11,21,12,22,31,36,49,50,54,55,59,61');
INSERT INTO `t_role` VALUES (3, '业务员', '拉单', '10,31,32,36,54,55,58,59,60,62');
INSERT INTO `t_role` VALUES (4, '业务经理', '操作人员', '10,31,32,33,34,36,54,55,56,57,58,59,60,62,63');
INSERT INTO `t_role` VALUES (5, '财务', '管钱的', '10,31,36,54,55,59,61');
INSERT INTO `t_role` VALUES (6, '仓管员', '入库处理', '10,59,60,63');
INSERT INTO `t_role` VALUES (7, '人事', '管人的', NULL);
INSERT INTO `t_role` VALUES (9, '前台', '前台小姐姐', '10,1,13,15,16,17,11,18,19,20,21,12,22,23,24,25');

-- ----------------------------
-- Table structure for t_transaction
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction`;
CREATE TABLE `t_transaction`  (
  `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `pick_up_fee` int(255) NULL DEFAULT NULL,
  `volume_rate` double(255, 0) NULL DEFAULT NULL,
  `weight_rate` double NULL DEFAULT NULL,
  `storage_id` bigint(255) NULL DEFAULT NULL,
  `total_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_transaction
-- ----------------------------
INSERT INTO `t_transaction` VALUES (2, 11, 115, 1500, 700, 30, 31, NULL);
INSERT INTO `t_transaction` VALUES (3, 6, 31, 123, 100, 100, 30, NULL);
INSERT INTO `t_transaction` VALUES (4, 20, 31, 1000, 100, 100, 29, NULL);
INSERT INTO `t_transaction` VALUES (5, 17, 31, 200, 150, 100, 29, NULL);

-- ----------------------------
-- Table structure for t_transaction_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_detail`;
CREATE TABLE `t_transaction_detail`  (
  `transaction_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_detail_id` bigint(20) NULL DEFAULT NULL,
  `length` bigint(255) NULL DEFAULT NULL,
  `width` bigint(20) NULL DEFAULT NULL,
  `height` bigint(20) NULL DEFAULT NULL,
  `volume` double(255, 0) NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_transaction_detail
-- ----------------------------
INSERT INTO `t_transaction_detail` VALUES (2, 6, 800, 800, 1000, 4, 300);
INSERT INTO `t_transaction_detail` VALUES (3, 8, 2000, 1000, 1000, 4, 40);
INSERT INTO `t_transaction_detail` VALUES (8, 1, 1000, 1000, 1000, 1, 12);
INSERT INTO `t_transaction_detail` VALUES (9, 2, 1000, 1000, 1000, 1, 12);
INSERT INTO `t_transaction_detail` VALUES (10, 3, 1000, 1000, 1000, 1, 12);
INSERT INTO `t_transaction_detail` VALUES (11, 10, 1000, 1000, 1000, 1, 100);
INSERT INTO `t_transaction_detail` VALUES (12, 9, 1000, 2000, 1000, 2, 100);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实名称',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐(密码加密用)',
  `status` int(11) NULL DEFAULT 1 COMMENT '用户状态 1 可用，2,锁定，3离职',
  `create_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (13, 'admin', 'Oza', '1093d2913f3c13a56e42279c331260fa', 'abcd', 1, '2019-07-17', 1);
INSERT INTO `t_user` VALUES (25, 'carlos', 'Carlos', '1ada7bd1901fce4bc9099421ecf69d6f', '62e7', 1, '2019-07-17', 2);
INSERT INTO `t_user` VALUES (27, 'lucy', 'lucy', 'd9db0dd54bcbd6b6811a8c778f40610f', 'ca4f', 1, '2019-07-17', 3);
INSERT INTO `t_user` VALUES (28, 'kitty', 'kitty', '686714c471734aa84171ff4a3da83cd5', '4935', 1, '2019-07-17', 4);
INSERT INTO `t_user` VALUES (29, 'carol', 'carol', '0c577fce2470bbcf611d1e32cd72e4b3', '095a', 1, '2019-07-17', 3);
INSERT INTO `t_user` VALUES (30, 'jack', 'jack', '2a47d88df0daf0537bb064783af8e798', '8f5b', 1, '2019-07-17', 3);
INSERT INTO `t_user` VALUES (31, 'lucas', 'lucas', '3dd41f2926f7fcacc2fec8d889614d68', 'e555', 1, '2019-07-17', 6);
INSERT INTO `t_user` VALUES (32, 'mike', 'mike', '188f9c61a31d1a782bb7279a2efa8ef0', '8b23', 1, '2019-07-17', 5);
INSERT INTO `t_user` VALUES (115, 'dragonlee', '李小龙', 'bfd26945551f65f3f281f675a1e27c51', '77a9', NULL, '2019-08-01', 6);

-- ----------------------------
-- View structure for v_customer
-- ----------------------------
DROP VIEW IF EXISTS `v_customer`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_customer` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_name` AS `customer_name`,`c`.`phone` AS `phone`,`c`.`email` AS `email`,`c`.`address` AS `address`,`c`.`gender` AS `gender`,`c`.`remark` AS `remark`,`c`.`id_card` AS `id_card`,`c`.`user_id` AS `user_id`,`c`.`location_id` AS `location_id`,`u`.`username` AS `username`,`b`.`base_name` AS `area` from ((`t_customer` `c` join `t_user` `u`) join `t_basicdata` `b`) where ((`c`.`user_id` = `u`.`user_id`) and (`c`.`location_id` = `b`.`base_id`));

-- ----------------------------
-- View structure for v_export
-- ----------------------------
DROP VIEW IF EXISTS `v_export`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_export` AS select `t_order`.`order_id` AS `order_id`,`area`.`base_name` AS `area`,`t_order`.`shipping_address` AS `shipping_address`,`payment`.`base_name` AS `payment`,`pickup_method`.`base_name` AS `pickup_mehtod`,`t_user`.`username` AS `storage_staff`,`t_info`.`weight_fee` AS `weight_fee`,`t_info`.`volume_fee` AS `volume_fee`,`t_info`.`tax_fee` AS `tax_fee`,`t_transaction`.`pick_up_fee` AS `pick_up_fee`,`t_info`.`total_fee` AS `total_fee`,`t_info`.`total_volume` AS `total_volume`,`t_info`.`total_weight` AS `total_weight`,`t_info`.`total_value` AS `total_value`,`t_order`.`shipping_name` AS `shipping_name`,`t_order`.`shipping_phone` AS `shipping_phone`,`shipping_method`.`base_name` AS `shipping_method`,`storage`.`base_name` AS `storage`,`staff`.`username` AS `staff`,`t_customer`.`customer_name` AS `customer_name` from ((((((((((`t_order` join `t_basicdata` `area` on(('' = ''))) join `t_basicdata` `payment`) join `t_basicdata` `pickup_method`) join `t_transaction`) join `t_user`) join `t_info`) join `t_basicdata` `shipping_method`) join `t_basicdata` `storage`) join `t_user` `staff`) join `t_customer`) where ((`t_order`.`interval_id` = `area`.`base_id`) and (`t_order`.`payment_method_id` = `payment`.`base_id`) and (`t_order`.`take_method_id` = `pickup_method`.`base_id`) and (`t_transaction`.`order_id` = `t_order`.`order_id`) and (`t_transaction`.`user_id` = `t_user`.`user_id`) and (`t_info`.`order_id` = `t_order`.`order_id`) and (`t_order`.`freight_method_id` = `shipping_method`.`base_id`) and (`t_transaction`.`storage_id` = `storage`.`base_id`) and (`staff`.`user_id` = `t_order`.`user_id`) and (`t_order`.`customer_id` = `t_customer`.`customer_id`));

-- ----------------------------
-- View structure for v_exportdetail
-- ----------------------------
DROP VIEW IF EXISTS `v_exportdetail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_exportdetail` AS select `t_orderdetail`.`goods_name` AS `goods_name`,`t_orderdetail`.`goods_number` AS `goods_number`,`t_basicdata`.`base_name` AS `goods_unit`,`t_transaction_detail`.`length` AS `length`,`t_transaction_detail`.`width` AS `width`,`t_transaction_detail`.`height` AS `height`,`t_transaction_detail`.`volume` AS `volume`,`t_transaction_detail`.`weight` AS `weight`,`t_orderdetail`.`goods_total` AS `goods_total`,`t_orderdetail`.`order_id` AS `order_id` from ((`t_orderdetail` join `t_basicdata`) join `t_transaction_detail`) where ((`t_orderdetail`.`goods_unit` = `t_basicdata`.`base_id`) and (`t_orderdetail`.`order_detail_id` = `t_transaction_detail`.`order_detail_id`));

-- ----------------------------
-- View structure for v_order
-- ----------------------------
DROP VIEW IF EXISTS `v_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_order` AS select `t_order`.`order_id` AS `order_id`,`t_order`.`customer_id` AS `customer_id`,`t_customer`.`customer_name` AS `customer_name`,`t_customer`.`phone` AS `customer_phone`,`t_order`.`shipping_name` AS `shipping_name`,`t_order`.`shipping_address` AS `shipping_address`,`t_order`.`shipping_phone` AS `shipping_phone`,`t_order`.`order_status` AS `order_status`,`t_user`.`username` AS `username` from ((`t_order` join `t_customer`) join `t_user`) where ((`t_order`.`customer_id` = `t_customer`.`customer_id`) and (`t_order`.`user_id` = `t_user`.`user_id`));

SET FOREIGN_KEY_CHECKS = 1;
