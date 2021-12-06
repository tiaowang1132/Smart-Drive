
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `success` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1494 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_photo
-- ----------------------------
DROP TABLE IF EXISTS `admin_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_photo
-- ----------------------------
INSERT INTO `admin_photo` VALUES (3, '6958819_pear-admin_1607443454_1.png', 'http://127.0.0.1:5000/_uploads/photos/6958819_pear-admin_1607443454_1.png', 'image/png', '2204','Shanghai', '2021-011-19 18:53:02');
INSERT INTO `admin_photo` VALUES (17, '1617291580000.jpg', 'http://127.0.0.1:5000/_uploads/photos/1617291580000.jpg', 'image/png', '94211','Shanghai', '2021-11-01 23:39:41');

-- ----------------------------
-- Table structure for admin_power
-- ----------------------------
DROP TABLE IF EXISTS `admin_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_power` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名称',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限类型',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限路径',
  `open_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打开方式',
  `parent_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父类编号',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` int DEFAULT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_power
-- ----------------------------
INSERT INTO `admin_power` VALUES (1,'System MGT','0','',NULL,NULL,'0','layui-icon layui-icon-set-fill',1,NULL,NULL,1),(3,'User MGT','1','admin:user:main','/admin/user/','_iframe','1','layui-icon layui-icon layui-icon layui-icon layui-icon-rate',1,NULL,NULL,1),(4,'Right MGT','1','admin:power:main','/admin/power/','_iframe','1',NULL,2,NULL,NULL,1),(9,'Role MGT','1','admin:role:main','/admin/role','_iframe','1','layui-icon layui-icon-username',2,'2021-03-16 22:24:58','2021-03-25 19:15:24',1),(17,'File MGT','0','','','','0','layui-icon layui-icon-camera',2,'2021-03-19 18:56:23','2021-03-25 19:15:08',1),(18,'File VIew','1','admin:file:main','/admin/file','_iframe','17','layui-icon layui-icon-camera',5,'2021-03-19 18:57:19','2021-03-25 19:15:13',1),(21,'权限增加','2','admin:power:add','','','4','layui-icon layui-icon-add-circle',1,'2021-03-22 19:43:52','2021-03-25 19:15:22',1),(22,'用户增加','2','admin:user:add','','','3','layui-icon layui-icon-add-circle',1,'2021-03-22 19:45:40','2021-03-25 19:15:17',1),(23,'用户编辑','2','admin:user:edit','','','3','layui-icon layui-icon-rate',2,'2021-03-22 19:46:15','2021-03-25 19:15:18',1),(24,'用户删除','2','admin:user:remove','','','3','layui-icon None',3,'2021-03-22 19:46:51','2021-03-25 19:15:18',1),(25,'权限编辑','2','admin:power:edit','','','4','layui-icon layui-icon-edit',2,'2021-03-22 19:47:36','2021-03-25 19:15:22',1),(26,'用户删除','2','admin:power:remove','','','4','layui-icon layui-icon-delete',3,'2021-03-22 19:48:17','2021-03-25 19:15:23',1),(27,'用户增加','2','admin:role:add','','','9','layui-icon layui-icon-add-circle',1,'2021-03-22 19:49:09','2021-03-25 19:15:24',1),(28,'角色编辑','2','admin:role:edit','','','9','layui-icon layui-icon-edit',2,'2021-03-22 19:49:41','2021-03-25 19:15:25',1),(29,'角色删除','2','admin:role:remove','','','9','layui-icon layui-icon-delete',3,'2021-03-22 19:50:15','2021-03-25 19:15:26',1),(30,'角色授权','2','admin:role:power','','','9','layui-icon layui-icon-component',4,'2021-03-22 19:50:54','2021-03-25 19:15:26',1),(31,'图片增加','2','admin:file:add','','','18','layui-icon layui-icon-add-circle',1,'2021-03-22 19:58:05','2021-03-25 19:15:28',1),(32,'图片删除','2','admin:file:delete','','','18','layui-icon layui-icon-delete',2,'2021-03-22 19:58:45','2021-03-25 19:15:29',1),(53,'图片查看','1','admin:file:main','/admin/file2','_iframe','17','layui-icon ',1,'2021-06-22 21:15:00','2021-06-22 21:15:00',0),(54,'图片下载','2','admin:file:delete','','','18','layui-icon layui-icon-download-circle',4,'2021-06-22 22:20:54','2021-06-22 22:20:54',1),(55,'任务修改','2','admin:task:edit','','','53','layui-icon ',2,'2021-06-22 22:21:34','2021-06-22 22:21:34',1),(56,'任务删除','2','admin:task:remove','','','53','layui-icon ',3,'2021-06-22 22:22:18','2021-06-22 22:22:18',1);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详情',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` int DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1,'管理员','admin',NULL,'管理员',1,NULL,NULL,1),(2,'普通用户','common',NULL,'只有查看，没有增删改权限',2,'2021-03-22 20:02:38','2021-04-01 22:29:56',1);

-- ----------------------------
-- Table structure for admin_role_power
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_power` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识',
  `power_id` int DEFAULT NULL COMMENT '用户编号',
  `role_id` int DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `power_id` (`power_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `admin_role_power_ibfk_1` FOREIGN KEY (`power_id`) REFERENCES `admin_power` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_role_power_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_role_power
-- ----------------------------
INSERT INTO `admin_role_power` VALUES (265,1,2),(266,3,2),(267,4,2),(268,9,2),(271,17,2),(272,18,2),(334,1,1),(335,3,1),(336,4,1),(337,9,1),(340,17,1),(341,18,1),(342,21,1),(343,22,1),(344,23,1),(345,24,1),(346,25,1),(347,26,1),(348,27,1),(349,28,1),(350,29,1),(351,30,1),(352,31,1),(353,32,1),(364,54,1),(365,55,1),(366,56,1);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password_hash` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '哈希密码',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '创建时间',
  `enable` int DEFAULT NULL COMMENT '启用',
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实名字',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `dept_id` int DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1,'admin','pbkdf2:sha256:150000$raM7mDSr$58fe069c3eac01531fc8af85e6fc200655dd2588090530084d182e6ec9d52c85',NULL,'2021-12-02 21:04:52',1,'Super Admin','hehe','http://127.0.0.1:5000/_uploads/photos/1617291580000.jpg',1),(7,'test','pbkdf2:sha256:150000$cRS8bYNh$adb57e64d929863cf159f924f74d0634f1fecc46dba749f1bfaca03da6d2e3ac','2021-03-22 20:03:42','2021-06-01 17:29:47',1,'Super Admin','haha','/static/admin/admin/images/avatar.jpg',1),(8,'wind','pbkdf2:sha256:150000$skME1obT$6a2c20cd29f89d7d2f21d9e373a7e3445f70ebce3ef1c3a555e42a7d17170b37','2021-06-01 17:30:39','2021-06-01 17:30:52',1,'wind',NULL,'/static/admin/admin/images/avatar.jpg',7);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识',
  `user_id` int DEFAULT NULL COMMENT '用户编号',
  `role_id` int DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `admin_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (21, 1, 1);
INSERT INTO `admin_user_role` VALUES (22, 7, 2);
INSERT INTO `admin_user_role` VALUES (24, 8, 2);

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('7634e028e338');

SET FOREIGN_KEY_CHECKS = 1;
