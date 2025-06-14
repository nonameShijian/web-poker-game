/*
 Navicat Premium Data Transfer

 Source Server         : 本机MariaDB
 Source Server Type    : MariaDB
 Source Server Version : 110202
 Source Host           : localhost:3307
 Source Schema         : 404game

 Target Server Type    : MariaDB
 Target Server Version : 110202
 File Encoding         : 65001

 Date: 02/06/2025 16:21:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
                              `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
                              `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
                              `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
                              `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                              `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
                              `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
                              `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
                              `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
                              `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
                              `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                              `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
                              `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'poker_race_info', '历史比赛信息', NULL, NULL, 'PokerRaceInfo', 'crud', 'com.webPokerGame', 'raceInfoAdmin', 'raceInfoAdmin', '历史比赛信息', 'lwy', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47', NULL);
INSERT INTO `gen_table` VALUES (2, 'poker_user_game_info', '用户胜负情况', NULL, NULL, 'PokerUserGameInfo', 'crud', 'com.webPokerGame', 'userGameInfo', 'userGameInfo', '用护胜负情况', 'lwy', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:54', NULL);
INSERT INTO `gen_table` VALUES (3, 'poker_chat_message', '游戏房间聊天记录表', NULL, NULL, 'PokerChatMessage', 'crud', 'com.webPokerGame', 'message', 'messageAdmin', '游戏房间聊天记录', 'lwy', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07', NULL);
INSERT INTO `gen_table` VALUES (4, 'poker_room', '游戏房间信息表', NULL, NULL, 'PokerRoom', 'crud', 'com.webPokerGame', 'room', 'roomAdmin', '游戏房间信息', 'lwy', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
                                     `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                     `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                     `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                     `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '比赛信息id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (2, '1', 'race_id', '比赛id', 'int(2)', 'Integer', 'raceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (3, '1', 'player_a', '玩家A', 'int(2)', 'Integer', 'playerA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (4, '1', 'player_b', '玩家B', 'int(2)', 'Integer', 'playerB', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (5, '1', 'player_c', '玩家C', 'int(2)', 'Integer', 'playerC', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (6, '1', 'player_d', '玩家D', 'int(2)', 'Integer', 'playerD', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (7, '1', 'winner_a', '胜者A', 'int(2)', 'Integer', 'winnerA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (8, '1', 'winner_b', '胜者B', 'int(2)', 'Integer', 'winnerB', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (9, '2', 'id', '信息id', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:54');
INSERT INTO `gen_table_column` VALUES (10, '2', 'user_id', '用户id', 'int(2)', 'Integer', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:54');
INSERT INTO `gen_table_column` VALUES (11, '2', 'win', '胜场次数', 'int(2)', 'Integer', 'win', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:54');
INSERT INTO `gen_table_column` VALUES (12, '2', 'lost', '败场次数', 'int(2)', 'Integer', 'lost', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-15 21:15:20', '', '2025-05-25 22:50:54');
INSERT INTO `gen_table_column` VALUES (14, '1', 'race_time', '比赛时间', 'datetime', 'Date', 'raceTime', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'datetime', '', 9, '', '2025-05-25 22:30:14', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (15, '1', 'winner_score', '赢家积分情况', 'int(11)', 'Long', 'winnerScore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2025-05-25 22:30:14', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (16, '1', 'loser_score', '输家积分情况', 'int(11)', 'Long', 'loserScore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2025-05-25 22:30:14', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (17, '1', 'status', '记录状态：0-已删除，1-正常', 'tinyint(1)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, '', '2025-05-25 22:30:14', '', '2025-05-25 22:50:47');
INSERT INTO `gen_table_column` VALUES (18, '2', 'race_num', '比赛场次', 'int(2)', 'Integer', 'raceNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2025-05-25 22:31:26', '', '2025-05-25 22:50:54');
INSERT INTO `gen_table_column` VALUES (19, '3', 'messageId', '消息ID', 'int(11)', 'Long', 'messageId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07');
INSERT INTO `gen_table_column` VALUES (20, '3', 'roomId', '所属房间ID', 'int(11)', 'Long', 'roomId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07');
INSERT INTO `gen_table_column` VALUES (21, '3', 'userId', '发送者ID', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07');
INSERT INTO `gen_table_column` VALUES (22, '3', 'message', '消息内容', 'text', 'String', 'message', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'textarea', '', 4, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07');
INSERT INTO `gen_table_column` VALUES (23, '3', 'sent_time', '发送时间', 'timestamp', 'Date', 'sentTime', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'datetime', '', 5, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:07');
INSERT INTO `gen_table_column` VALUES (24, '4', 'roomId', '房间ID', 'int(11)', 'Long', 'roomId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11');
INSERT INTO `gen_table_column` VALUES (25, '4', 'ownerId', '房间创建者ID', 'int(11)', 'Long', 'ownerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11');
INSERT INTO `gen_table_column` VALUES (26, '4', 'max_players', '最大玩家数（固定4人）', 'tinyint(1)', 'Integer', 'maxPlayers', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11');
INSERT INTO `gen_table_column` VALUES (27, '4', 'current_players', '当前玩家数', 'tinyint(1)', 'Integer', 'currentPlayers', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11');
INSERT INTO `gen_table_column` VALUES (28, '4', 'created_at', '房间创建时间', 'timestamp', 'Date', 'createdAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-05-25 22:31:41', '', '2025-05-25 22:51:11');

-- ----------------------------
-- Table structure for poker_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `poker_chat_message`;
CREATE TABLE `poker_chat_message`  (
                                       `messageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
                                       `roomId` int(11) NOT NULL COMMENT '所属房间ID',
                                       `userId` int(11) NOT NULL COMMENT '发送者ID',
                                       `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
                                       `sent_time` timestamp NULL DEFAULT current_timestamp() COMMENT '发送时间',
                                       PRIMARY KEY (`messageId`) USING BTREE,
                                       INDEX `roomId`(`roomId`) USING BTREE,
                                       INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏房间聊天记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poker_chat_message
-- ----------------------------
INSERT INTO `poker_chat_message` VALUES (1, 1, 100, '测试111', '2025-05-24 00:00:00');
INSERT INTO `poker_chat_message` VALUES (2, 1, 100, '测试22222', '2025-05-24 00:00:00');
INSERT INTO `poker_chat_message` VALUES (3, 1, 101, '测', '2025-05-24 00:00:00');

-- ----------------------------
-- Table structure for poker_race_info
-- ----------------------------
DROP TABLE IF EXISTS `poker_race_info`;
CREATE TABLE `poker_race_info`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '比赛信息id',
                                    `race_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比赛id',
                                    `player_a` int(11) NULL DEFAULT NULL COMMENT '玩家A',
                                    `player_b` int(11) NULL DEFAULT NULL COMMENT '玩家B',
                                    `player_c` int(11) NULL DEFAULT NULL COMMENT '玩家C',
                                    `player_d` int(11) NULL DEFAULT NULL COMMENT '玩家D',
                                    `winner_a` int(11) NULL DEFAULT NULL COMMENT '胜者A',
                                    `winner_b` int(11) NULL DEFAULT NULL COMMENT '胜者B',
                                    `race_time` datetime NULL DEFAULT NULL COMMENT '比赛时间',
                                    `winner_score` int(11) NULL DEFAULT NULL COMMENT '赢家积分情况',
                                    `loser_score` int(11) NULL DEFAULT NULL COMMENT '输家积分情况',
                                    `status` tinyint(1) NULL DEFAULT 1 COMMENT '记录状态：0-已删除，1-正常',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史比赛信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poker_race_info
-- ----------------------------
INSERT INTO `poker_race_info` VALUES (2, '1', 100, 101, 102, 2, 100, 101, '2025-05-24 00:00:00', 14, 10, 1);

-- ----------------------------
-- Table structure for poker_room
-- ----------------------------
DROP TABLE IF EXISTS `poker_room`;
CREATE TABLE `poker_room`  (
                               `roomId` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间ID',
                               `ownerId` int(11) NOT NULL COMMENT '房间创建者ID',
                               `max_players` tinyint(1) NOT NULL DEFAULT 4 COMMENT '最大玩家数（固定4人）',
                               `current_players` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当前玩家数',
                               `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '房间创建时间',
                               PRIMARY KEY (`roomId`) USING BTREE,
                               INDEX `ownerId`(`ownerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏房间信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poker_room
-- ----------------------------
INSERT INTO `poker_room` VALUES (1, 100, 4, 4, '2025-05-24 00:00:00');

-- ----------------------------
-- Table structure for poker_user_game_info
-- ----------------------------
DROP TABLE IF EXISTS `poker_user_game_info`;
CREATE TABLE `poker_user_game_info`  (
                                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息id',
                                         `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
                                         `win` int(11) NULL DEFAULT 0 COMMENT '胜场次数',
                                         `lost` int(11) NULL DEFAULT 0 COMMENT '败场次数',
                                         `race_num` int(11) NULL DEFAULT 0 COMMENT '比赛场次',
                                         PRIMARY KEY (`id`) USING BTREE,
                                         UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户胜负情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poker_user_game_info
-- ----------------------------
INSERT INTO `poker_user_game_info` VALUES (2, 100, 1, 0, 1);
INSERT INTO `poker_user_game_info` VALUES (3, 101, 1, 0, 1);
INSERT INTO `poker_user_game_info` VALUES (4, 102, 0, 1, 1);
INSERT INTO `poker_user_game_info` VALUES (5, 2, 0, 1, 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
                                       `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                       `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `blob_data` blob NULL DEFAULT NULL COMMENT '存放持久化Trigger对象',
                                       PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                       CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
                                   `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                   `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
                                   `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                   PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
                                       `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                       `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
                                       `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
                                       PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                       CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
                                        `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                        `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
                                        `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
                                        `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
                                        `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
                                        `priority` int(11) NOT NULL COMMENT '优先级',
                                        `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
                                        `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
                                        `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
                                        `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
                                        `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
                                        PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
                                     `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                     `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                                     `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                                     `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
                                     `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
                                     `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
                                     `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
                                     `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
                                     `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
                                     `job_data` blob NULL DEFAULT NULL COMMENT '存放持久化job对象',
                                     PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
                               `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                               `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
                               PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
                                             `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                             `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                             PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
                                         `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                         `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
                                         `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
                                         `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
                                         PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
                                         `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
                                         `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
                                         `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
                                         PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                         CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
                                          `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                          `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                          `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                          `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                          `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                          `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                          `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                          `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                          `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                          `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                          `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                          `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                          `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                          `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                          PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                          CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
                                  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
                                  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
                                  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
                                  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
                                  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
                                  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
                                  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
                                  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
                                  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
                                  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
                                  `job_data` blob NULL DEFAULT NULL COMMENT '存放持久化job对象',
                                  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
                                  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
                               `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                               `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
                               `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
                               `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
                               `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                               `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-03-15 20:28:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-15 20:28:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-15 20:28:50', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 17:18:33', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 22:15:08', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
                             `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
                             `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
                             `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
                             `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
                             `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
                             `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
                             `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '角色定位', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-03-15 20:28:50', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '玩家', 2, NULL, NULL, NULL, '0', '0', 'admin', '2025-05-28 17:21:29', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '开发', 1, NULL, NULL, NULL, '0', '0', 'admin', '2025-05-28 17:21:51', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
                                  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
                                  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
                                  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
                                  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
                                  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
                                  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_id`) USING BTREE,
                                  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
                            `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                            `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
                            `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                            `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                            `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
                            `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                            `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                            `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                            `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
                            PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-03-15 20:28:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
                                `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                                `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                                `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                                `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                                `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
                                `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                                `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
                                   `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                   `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
                                   `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
                                   `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                   `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
                                   `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
                                   PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-15 21:10:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 21:10:25');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 21:43:58');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-25 22:20:30');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '密码输入错误1次', '2025-05-25 22:20:30');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-25 22:20:35');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-28 22:14:45');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-28 22:14:49');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-28 22:15:12');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-28 22:19:30');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-28 22:20:32');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-28 22:20:40');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 15:48:53');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 15:51:54');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 16:06:43');
INSERT INTO `sys_logininfor` VALUES (115, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-05-29 16:12:17');
INSERT INTO `sys_logininfor` VALUES (116, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 16:12:25');
INSERT INTO `sys_logininfor` VALUES (117, 'Xiaoyu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-05-29 16:22:58');
INSERT INTO `sys_logininfor` VALUES (118, 'Xiaoyu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 16:23:05');
INSERT INTO `sys_logininfor` VALUES (119, '测试ing', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '注册成功', '2025-05-29 16:24:47');
INSERT INTO `sys_logininfor` VALUES (120, '测试ing', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-05-29 16:25:09');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 20:20:23');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 20:20:44');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 20:20:48');
INSERT INTO `sys_logininfor` VALUES (124, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 20:21:04');
INSERT INTO `sys_logininfor` VALUES (125, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 20:21:17');
INSERT INTO `sys_logininfor` VALUES (126, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 20:21:24');
INSERT INTO `sys_logininfor` VALUES (127, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 20:54:36');
INSERT INTO `sys_logininfor` VALUES (128, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 20:54:42');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 21:04:20');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 21:04:24');
INSERT INTO `sys_logininfor` VALUES (131, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-29 21:46:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-29 21:46:05');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 00:37:00');
INSERT INTO `sys_logininfor` VALUES (134, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 00:40:22');
INSERT INTO `sys_logininfor` VALUES (135, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 01:02:46');
INSERT INTO `sys_logininfor` VALUES (136, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 01:02:54');
INSERT INTO `sys_logininfor` VALUES (137, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 01:42:04');
INSERT INTO `sys_logininfor` VALUES (138, 'Song', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 01:42:11');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-01 20:36:21');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-02 16:00:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                             `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
                             `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
                             `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
                             `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
                             `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
                             `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
                             `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
                             `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                             `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                             `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
                             `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2049 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-15 20:28:50', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-03-15 20:28:50', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-03-15 20:28:50', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-03-15 20:28:50', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-15 20:28:50', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-15 20:28:50', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-15 20:28:50', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-29 15:49:48', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-29 15:49:53', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-03-15 20:28:50', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-03-15 20:28:50', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-03-15 20:28:50', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-03-15 20:28:50', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-03-15 20:28:50', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-03-15 20:28:50', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-03-15 20:28:50', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-03-15 20:28:50', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-03-15 20:28:50', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-03-15 20:28:50', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-03-15 20:28:50', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-03-15 20:28:50', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-03-15 20:28:50', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-03-15 20:28:50', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-03-15 20:28:50', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-03-15 20:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '比赛模块', 0, 5, 'raceInfo', NULL, NULL, 1, 0, 'M', '0', '0', '', 'date-range', 'admin', '2025-03-15 21:16:15', 'admin', '2025-03-15 21:50:30', '');
INSERT INTO `sys_menu` VALUES (2025, '历史比赛信息', 2000, 1, 'raceInfoAdmin', 'raceInfo/raceInfoAdmin/index', NULL, 1, 0, 'C', '0', '0', 'raceInfoAdmin:raceInfoAdmin:list', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '历史比赛信息菜单');
INSERT INTO `sys_menu` VALUES (2026, '历史比赛信息查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'raceInfoAdmin:raceInfoAdmin:query', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '历史比赛信息新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'raceInfoAdmin:raceInfoAdmin:add', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '历史比赛信息修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'raceInfoAdmin:raceInfoAdmin:edit', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '历史比赛信息删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'raceInfoAdmin:raceInfoAdmin:remove', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '历史比赛信息导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'raceInfoAdmin:raceInfoAdmin:export', '#', 'admin', '2025-05-25 22:51:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '用户胜负情况', 2000, 1, 'userGameInfo', 'raceInfo/userGameInfo/index', NULL, 1, 0, 'C', '0', '0', 'userGameInfo:userGameInfo:list', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '用护胜负情况菜单');
INSERT INTO `sys_menu` VALUES (2032, '用户胜负情况查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'userGameInfo:userGameInfo:query', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '用户胜负情况新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'userGameInfo:userGameInfo:add', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '用户胜负情况修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'userGameInfo:userGameInfo:edit', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '用户胜负情况删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'userGameInfo:userGameInfo:remove', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '用户胜负情况导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'userGameInfo:userGameInfo:export', '#', 'admin', '2025-05-25 22:55:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '游戏房间聊天记录', 2000, 1, 'messageAdmin', 'raceInfo/messageAdmin/index', NULL, 1, 0, 'C', '0', '0', 'message:messageAdmin:list', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '游戏房间聊天记录菜单');
INSERT INTO `sys_menu` VALUES (2038, '游戏房间聊天记录查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'message:messageAdmin:query', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '游戏房间聊天记录新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'message:messageAdmin:add', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '游戏房间聊天记录修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'message:messageAdmin:edit', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '游戏房间聊天记录删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'message:messageAdmin:remove', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '游戏房间聊天记录导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'message:messageAdmin:export', '#', 'admin', '2025-05-25 22:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '游戏房间信息', 2000, 1, 'roomAdmin', 'raceInfo/roomAdmin/index', NULL, 1, 0, 'C', '0', '0', 'room:roomAdmin:list', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '游戏房间信息菜单');
INSERT INTO `sys_menu` VALUES (2044, '游戏房间信息查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'room:roomAdmin:query', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '游戏房间信息新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'room:roomAdmin:add', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '游戏房间信息修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'room:roomAdmin:edit', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '游戏房间信息删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'room:roomAdmin:remove', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '游戏房间信息导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'room:roomAdmin:export', '#', 'admin', '2025-05-25 23:11:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
                               `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                               `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
                               `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
                               `notice_content` longblob NULL DEFAULT NULL COMMENT '公告内容',
                               `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                               `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-03-15 20:28:50', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-03-15 20:28:50', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
                                 `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                 `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
                                 `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                 `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
                                 `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
                                 `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                 `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
                                 `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
                                 `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
                                 `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
                                 `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
                                 `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
                                 `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
                                 `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
                                 `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
                                 `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
                                 PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.webPockerGame.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"pocker_user_game_info,pocker_race_info\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:15:20');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.webPockerGame.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"比赛模块\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/raceInfoAdmin\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:16:15');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.webPockerGame.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-15 21:16:15\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"比赛模块\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"raceInfoAdmin\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:16:30');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.webPockerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"PockerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerB\",\"javaType\":\"Integer\",\"list\":true,\"params\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:19:03');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.webPockerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PockerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:19:03\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:19:03\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:19:03\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:23:46');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.webPockerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PockerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:46\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:46\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:46\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:23:55');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.webPockerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_race_info\"}', NULL, 0, NULL, '2025-03-15 21:23:58');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.webPokerGame.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-15 21:16:15\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"比赛模块\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"raceInfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:50:30');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PockerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:55\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:55\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:23:55\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:57:16');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_race_info\"}', NULL, 0, NULL, '2025-03-15 21:57:49');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PokerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:57:16\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:57:16\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 21:57:16\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:59:29');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_race_info\"}', NULL, 0, NULL, '2025-03-15 21:59:50');
INSERT INTO `sys_oper_log` VALUES (112, '历史比赛信息', 1, 'com.webPokerGame.controller.PokerRaceInfoController.add()', 'POST', 1, 'admin', NULL, '/raceInfoAdmin/raceInfoAdmin', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"playerA\":1,\"playerB\":1,\"playerC\":11,\"playerD\":1,\"winnerA\":1,\"winnerB\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:09:04');
INSERT INTO `sys_oper_log` VALUES (113, '历史比赛信息', 2, 'com.webPokerGame.controller.PokerRaceInfoController.edit()', 'PUT', 1, 'admin', NULL, '/raceInfoAdmin/raceInfoAdmin', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"playerA\":1,\"playerB\":1,\"playerC\":2,\"playerD\":1,\"winnerA\":1,\"winnerB\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:09:08');
INSERT INTO `sys_oper_log` VALUES (114, '历史比赛信息', 3, 'com.webPokerGame.controller.PokerRaceInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/raceInfoAdmin/raceInfoAdmin/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:09:09');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"lost\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"requir', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:12:37');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:12:37\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:12:37\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:12:37\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:13:20');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userGameInfo\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:13:20\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:13:20\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:13:20\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:14:02');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_user_game_info\"}', NULL, 0, NULL, '2025-03-15 22:14:06');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userGameInfo\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:02\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:02\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:02\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:14:37');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_user_game_info\"}', NULL, 0, NULL, '2025-03-15 22:14:44');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userGameInfo\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:37\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:37\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 22:14:37\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:15:19');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_user_game_info\"}', NULL, 0, NULL, '2025-03-15 22:15:27');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.webPokerGame.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"raceInfo/userGameInfo/index\",\"createTime\":\"2025-03-15 22:16:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"用护胜负情况\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"userGameInfo\",\"perms\":\"userGameInfo:userGameInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:18:34');
INSERT INTO `sys_oper_log` VALUES (124, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":1,\"params\":{},\"raceNum\":1,\"win\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\404project\\WebPokerGame\\WebPokerGame\\webPokerGame-raceInfo\\target\\classes\\mapper\\userGameInfo\\PokerUserGameInfoMapper.xml]\r\n### The error may involve com.webPokerGame.mapper.PokerUserGameInfoMapper.insertPokerUserGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pocker_user_game_info          ( win,             lost,             raceNum )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-03-15 22:18:46');
INSERT INTO `sys_oper_log` VALUES (125, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":1,\"params\":{},\"raceNum\":1,\"win\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:19:13');
INSERT INTO `sys_oper_log` VALUES (126, '用护胜负情况', 3, 'com.webPokerGame.controller.PokerUserGameInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/userGameInfo/userGameInfo/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:19:16');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pocker_race_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:26:30');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pocker_user_game_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:26:32');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pocker_race_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:30:14');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pocker_user_game_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:30:16');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PokerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"比赛信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:14\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:14\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:14\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:30:41');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pocker_user_game_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:31:26');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 6, 'com.webPokerGame.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"pocker_room,pocker_chat_message\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:31:41');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"room\",\"className\":\"PockerRoom\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"房间ID\",\"columnId\":24,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerId\",\"columnComment\":\"房间创建者ID\",\"columnId\":25,\"columnName\":\"ownerId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaxPlayers\",\"columnComment\":\"最大玩家数（固定4人）\",\"columnId\":26,\"columnName\":\"max_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maxPlayers\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CurrentPlayers\",\"columnComment\":\"当前玩家数\",\"columnId\":27,\"columnName\":\"current_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:31:57');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message\",\"className\":\"PockerChatMessage\",\"columns\":[{\"capJavaField\":\"MessageId\",\"columnComment\":\"消息ID\",\"columnId\":19,\"columnName\":\"messageId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomId\",\"columnComment\":\"所属房间ID\",\"columnId\":20,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发送者ID\",\"columnId\":21,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"消息内容\",\"columnId\":22,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"message\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:33:06');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"messageAdmin\",\"className\":\"PockerChatMessage\",\"columns\":[{\"capJavaField\":\"MessageId\",\"columnComment\":\"消息ID\",\"columnId\":19,\"columnName\":\"messageId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:06\",\"usableColumn\":false},{\"capJavaField\":\"RoomId\",\"columnComment\":\"所属房间ID\",\"columnId\":20,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:06\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发送者ID\",\"columnId\":21,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:06\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"消息内容\",\"columnId\":22,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:33:48');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"room\",\"className\":\"PockerRoom\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"房间ID\",\"columnId\":24,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:57\",\"usableColumn\":false},{\"capJavaField\":\"OwnerId\",\"columnComment\":\"房间创建者ID\",\"columnId\":25,\"columnName\":\"ownerId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:57\",\"usableColumn\":false},{\"capJavaField\":\"MaxPlayers\",\"columnComment\":\"最大玩家数（固定4人）\",\"columnId\":26,\"columnName\":\"max_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maxPlayers\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:57\",\"usableColumn\":false},{\"capJavaField\":\"CurrentPlayers\",\"columnComment\":\"当前玩家数\",\"columnId\":27,\"columnName\":\"current_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"inser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:33:59');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"roomAdmin\",\"className\":\"PockerRoom\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"房间ID\",\"columnId\":24,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:59\",\"usableColumn\":false},{\"capJavaField\":\"OwnerId\",\"columnComment\":\"房间创建者ID\",\"columnId\":25,\"columnName\":\"ownerId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:59\",\"usableColumn\":false},{\"capJavaField\":\"MaxPlayers\",\"columnComment\":\"最大玩家数（固定4人）\",\"columnId\":26,\"columnName\":\"max_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maxPlayers\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:59\",\"usableColumn\":false},{\"capJavaField\":\"CurrentPlayers\",\"columnComment\":\"当前玩家数\",\"columnId\":27,\"columnName\":\"current_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:34:21');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_race_info\"}', NULL, 0, NULL, '2025-05-25 22:34:26');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_chat_message\"}', NULL, 0, NULL, '2025-05-25 22:34:27');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_race_info\"}', NULL, 0, NULL, '2025-05-25 22:34:31');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_chat_message\"}', NULL, 0, NULL, '2025-05-25 22:39:21');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"messageAdmin\",\"className\":\"PockerChatMessage\",\"columns\":[{\"capJavaField\":\"MessageId\",\"columnComment\":\"消息ID\",\"columnId\":19,\"columnName\":\"messageId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:48\",\"usableColumn\":false},{\"capJavaField\":\"RoomId\",\"columnComment\":\"所属房间ID\",\"columnId\":20,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:48\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发送者ID\",\"columnId\":21,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:33:48\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"消息内容\",\"columnId\":22,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:41:50');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_chat_message\"}', NULL, 0, NULL, '2025-05-25 22:42:05');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"messageAdmin\",\"className\":\"PockerChatMessage\",\"columns\":[{\"capJavaField\":\"MessageId\",\"columnComment\":\"消息ID\",\"columnId\":19,\"columnName\":\"messageId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:41:50\",\"usableColumn\":false},{\"capJavaField\":\"RoomId\",\"columnComment\":\"所属房间ID\",\"columnId\":20,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:41:50\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发送者ID\",\"columnId\":21,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:41:50\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"消息内容\",\"columnId\":22,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:42:55');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_chat_message\"}', NULL, 0, NULL, '2025-05-25 22:43:07');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pocker_room\"}', NULL, 0, NULL, '2025-05-25 22:48:20');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"roomAdmin\",\"className\":\"PokerRoom\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"房间ID\",\"columnId\":24,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:34:21\",\"usableColumn\":false},{\"capJavaField\":\"OwnerId\",\"columnComment\":\"房间创建者ID\",\"columnId\":25,\"columnName\":\"ownerId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:34:21\",\"usableColumn\":false},{\"capJavaField\":\"MaxPlayers\",\"columnComment\":\"最大玩家数（固定4人）\",\"columnId\":26,\"columnName\":\"max_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maxPlayers\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:34:21\",\"usableColumn\":false},{\"capJavaField\":\"CurrentPlayers\",\"columnComment\":\"当前玩家数\",\"columnId\":27,\"columnName\":\"current_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:49:51');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"raceInfoAdmin\",\"className\":\"PokerRaceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"比赛信息id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:41\",\"usableColumn\":false},{\"capJavaField\":\"RaceId\",\"columnComment\":\"比赛id\",\"columnId\":2,\"columnName\":\"race_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"raceId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:41\",\"usableColumn\":false},{\"capJavaField\":\"PlayerA\",\"columnComment\":\"玩家A\",\"columnId\":3,\"columnName\":\"player_a\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"playerA\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:30:41\",\"usableColumn\":false},{\"capJavaField\":\"PlayerB\",\"columnComment\":\"玩家B\",\"columnId\":4,\"columnName\":\"player_b\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:50:47');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"userGameInfo\",\"className\":\"PokerUserGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"信息id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:26\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:26\",\"usableColumn\":false},{\"capJavaField\":\"Win\",\"columnComment\":\"胜场次数\",\"columnId\":11,\"columnName\":\"win\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"win\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:31:26\",\"usableColumn\":false},{\"capJavaField\":\"Lost\",\"columnComment\":\"败场次数\",\"columnId\":12,\"columnName\":\"lost\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:15:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:50:54');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"messageAdmin\",\"className\":\"PokerChatMessage\",\"columns\":[{\"capJavaField\":\"MessageId\",\"columnComment\":\"消息ID\",\"columnId\":19,\"columnName\":\"messageId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"messageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:42:55\",\"usableColumn\":false},{\"capJavaField\":\"RoomId\",\"columnComment\":\"所属房间ID\",\"columnId\":20,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:42:55\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发送者ID\",\"columnId\":21,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:42:55\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"消息内容\",\"columnId\":22,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:51:07');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.webPokerGame.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"roomAdmin\",\"className\":\"PokerRoom\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"房间ID\",\"columnId\":24,\"columnName\":\"roomId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:49:51\",\"usableColumn\":false},{\"capJavaField\":\"OwnerId\",\"columnComment\":\"房间创建者ID\",\"columnId\":25,\"columnName\":\"ownerId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:49:51\",\"usableColumn\":false},{\"capJavaField\":\"MaxPlayers\",\"columnComment\":\"最大玩家数（固定4人）\",\"columnId\":26,\"columnName\":\"max_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"maxPlayers\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-05-25 22:49:51\",\"usableColumn\":false},{\"capJavaField\":\"CurrentPlayers\",\"columnComment\":\"当前玩家数\",\"columnId\":27,\"columnName\":\"current_players\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-25 22:31:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-25 22:51:11');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_race_info\"}', NULL, 0, NULL, '2025-05-25 22:51:14');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_user_game_info\"}', NULL, 0, NULL, '2025-05-25 22:54:53');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_chat_message\"}', NULL, 0, NULL, '2025-05-25 22:59:39');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_room\"}', NULL, 0, NULL, '2025-05-25 23:10:58');
INSERT INTO `sys_oper_log` VALUES (157, '参数管理', 2, 'com.webPokerGame.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:18:33');
INSERT INTO `sys_oper_log` VALUES (158, '参数管理', 9, 'com.webPokerGame.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:19:20');
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-15 20:28:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:19:51');
INSERT INTO `sys_oper_log` VALUES (160, '角色管理', 1, 'com.webPokerGame.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:17');
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 2, 'com.webPokerGame.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:22');
INSERT INTO `sys_oper_log` VALUES (162, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-15 20:28:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:30');
INSERT INTO `sys_oper_log` VALUES (163, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-15 20:28:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:51');
INSERT INTO `sys_oper_log` VALUES (164, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:57');
INSERT INTO `sys_oper_log` VALUES (165, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:20:59');
INSERT INTO `sys_oper_log` VALUES (166, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:01');
INSERT INTO `sys_oper_log` VALUES (167, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:04');
INSERT INTO `sys_oper_log` VALUES (168, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:06');
INSERT INTO `sys_oper_log` VALUES (169, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:08');
INSERT INTO `sys_oper_log` VALUES (170, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:10');
INSERT INTO `sys_oper_log` VALUES (171, '部门管理', 1, 'com.webPokerGame.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"玩家\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:29');
INSERT INTO `sys_oper_log` VALUES (172, '部门管理', 1, 'com.webPokerGame.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"开发\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:21:51');
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-15 20:28:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:22:16');
INSERT INTO `sys_oper_log` VALUES (174, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:15');
INSERT INTO `sys_oper_log` VALUES (175, '部门管理', 3, 'com.webPokerGame.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:17');
INSERT INTO `sys_oper_log` VALUES (176, '岗位管理', 3, 'com.webPokerGame.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:26');
INSERT INTO `sys_oper_log` VALUES (177, '岗位管理', 3, 'com.webPokerGame.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:28');
INSERT INTO `sys_oper_log` VALUES (178, '岗位管理', 2, 'com.webPokerGame.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"开发\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:35');
INSERT INTO `sys_oper_log` VALUES (179, '岗位管理', 2, 'com.webPokerGame.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"flag\":false,\"params\":{},\"postCode\":\"dev\",\"postId\":1,\"postName\":\"开发\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:39');
INSERT INTO `sys_oper_log` VALUES (180, '岗位管理', 2, 'com.webPokerGame.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"flag\":false,\"params\":{},\"postCode\":\"player\",\"postId\":4,\"postName\":\"玩家\",\"postSort\":4,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 17:24:50');
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_chat_message\"}', NULL, 0, NULL, '2025-05-28 17:31:14');
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_room\"}', NULL, 0, NULL, '2025-05-28 17:31:52');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 8, 'com.webPokerGame.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"poker_chat_message\"}', NULL, 0, NULL, '2025-05-28 17:35:14');
INSERT INTO `sys_oper_log` VALUES (184, '参数管理', 2, 'com.webPokerGame.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 20:28:50\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-28 22:15:08');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.webPokerGame.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-03-15 20:28:50\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 15:49:48');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.webPokerGame.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-03-15 20:28:50\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 15:49:53');
INSERT INTO `sys_oper_log` VALUES (187, '个人信息', 2, 'com.webPokerGame.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'Song', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"\",\"createTime\":\"2025-05-29 16:12:17\",\"delFlag\":\"0\",\"email\":\"2955500055@qq.com\",\"loginIp\":\"\",\"nickName\":\"Song\",\"params\":{},\"phonenumber\":\"13122223333\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"Song\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:13:39');
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:12:17\",\"delFlag\":\"0\",\"email\":\"2955500055@qq.com\",\"loginDate\":\"2025-05-29 16:12:25\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Song\",\"params\":{},\"phonenumber\":\"13122223333\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"Song\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:17:18');
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:12:17\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"2955500055@qq.com\",\"loginDate\":\"2025-05-29 16:12:25\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Song\",\"params\":{},\"phonenumber\":\"13122223333\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"Song\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:17:31');
INSERT INTO `sys_oper_log` VALUES (190, '个人信息', 2, 'com.webPokerGame.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'Xiaoyu', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"\",\"createTime\":\"2025-05-29 16:22:58\",\"delFlag\":\"0\",\"email\":\"1234567890@qq.com\",\"loginIp\":\"\",\"nickName\":\"Xiaoyu\",\"params\":{},\"phonenumber\":\"15122233344\",\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"Xiaoyu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:23:33');
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:22:58\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"1234567890@qq.com\",\"loginDate\":\"2025-05-29 16:23:05\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Xiaoyu\",\"params\":{},\"phonenumber\":\"15122233344\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"Xiaoyu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:23:52');
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:24:47\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"1234567890@qq.com\",\"loginDate\":\"2025-05-29 16:25:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"测试ing\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"测试ing\"}', '{\"msg\":\"修改用户\'测试ing\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-05-29 16:25:41');
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:24:47\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"1234567790@qq.com\",\"loginDate\":\"2025-05-29 16:25:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"测试ing\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"测试ing\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:25:46');
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 2, 'com.webPokerGame.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-05-29 16:24:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"玩家\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"1234567790@qq.com\",\"loginDate\":\"2025-05-29 16:25:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"测试ing\",\"params\":{},\"phonenumber\":\"13122233322\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"测试ing\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 16:26:07');
INSERT INTO `sys_oper_log` VALUES (195, '游戏房间信息', 1, 'com.webPokerGame.controller.PokerRoomController.add()', 'POST', 1, 'admin', NULL, '/room/roomAdmin', '127.0.0.1', '内网IP', '{\"createdAt\":\"2025-05-24\",\"currentPlayers\":4,\"maxPlayers\":4,\"ownerId\":100,\"params\":{},\"roomId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:18:04');
INSERT INTO `sys_oper_log` VALUES (196, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":0,\"params\":{},\"raceNum\":1,\"userId\":100,\"win\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:19:05');
INSERT INTO `sys_oper_log` VALUES (197, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":0,\"params\":{},\"raceNum\":1,\"userId\":101,\"win\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:19:26');
INSERT INTO `sys_oper_log` VALUES (198, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":1,\"params\":{},\"raceNum\":1,\"userId\":102,\"win\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:19:38');
INSERT INTO `sys_oper_log` VALUES (199, '用护胜负情况', 1, 'com.webPokerGame.controller.PokerUserGameInfoController.add()', 'POST', 1, 'admin', NULL, '/userGameInfo/userGameInfo', '127.0.0.1', '内网IP', '{\"lost\":1,\"params\":{},\"raceNum\":1,\"userId\":2,\"win\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:19:45');
INSERT INTO `sys_oper_log` VALUES (200, '历史比赛信息', 1, 'com.webPokerGame.controller.PokerRaceInfoController.add()', 'POST', 1, 'admin', NULL, '/raceInfoAdmin/raceInfoAdmin', '127.0.0.1', '内网IP', '{\"id\":2,\"loserScore\":10,\"params\":{},\"playerA\":100,\"playerB\":101,\"playerC\":102,\"playerD\":2,\"raceId\":1,\"raceTime\":\"2025-05-24\",\"winnerA\":100,\"winnerB\":101,\"winnerScore\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:20:37');
INSERT INTO `sys_oper_log` VALUES (201, '游戏房间聊天记录', 1, 'com.webPokerGame.controller.PokerChatMessageController.add()', 'POST', 1, 'admin', NULL, '/message/messageAdmin', '127.0.0.1', '内网IP', '{\"message\":\"测试111\",\"messageId\":1,\"params\":{},\"roomId\":1,\"sentTime\":\"2025-05-24\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:57:53');
INSERT INTO `sys_oper_log` VALUES (202, '游戏房间聊天记录', 1, 'com.webPokerGame.controller.PokerChatMessageController.add()', 'POST', 1, 'admin', NULL, '/message/messageAdmin', '127.0.0.1', '内网IP', '{\"message\":\"测试22222\",\"messageId\":2,\"params\":{},\"roomId\":1,\"sentTime\":\"2025-05-24\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:58:05');
INSERT INTO `sys_oper_log` VALUES (203, '游戏房间聊天记录', 1, 'com.webPokerGame.controller.PokerChatMessageController.add()', 'POST', 1, 'admin', NULL, '/message/messageAdmin', '127.0.0.1', '内网IP', '{\"message\":\"测\",\"messageId\":3,\"params\":{},\"roomId\":1,\"sentTime\":\"2025-05-24\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-29 17:58:16');
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.webPokerGame.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-05-28 17:20:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000],\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 01:35:39');
INSERT INTO `sys_oper_log` VALUES (205, '角色管理', 2, 'com.webPokerGame.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-05-28 17:20:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2025,2026,2030,2031,2032,2036,2037,2042,2043,2044,2048],\"params\":{},\"roleId\":100,\"roleKey\":\"player\",\"roleName\":\"玩家\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 01:38:15');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
                             `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                             `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
                             `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
                             `post_sort` int(11) NOT NULL COMMENT '显示顺序',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'dev', '开发', 1, '0', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 17:24:39', '');
INSERT INTO `sys_post` VALUES (4, 'player', '玩家', 4, '0', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 17:24:50', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                             `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                             `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
                             `role_sort` int(11) NOT NULL COMMENT '显示顺序',
                             `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                             `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
                             `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-15 20:28:50', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '1', '0', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 17:20:22', '普通角色');
INSERT INTO `sys_role` VALUES (100, '玩家', 'player', 1, '1', 0, 1, '0', '0', 'admin', '2025-05-28 17:20:17', 'admin', '2025-05-30 01:38:14', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2048);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                             `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
                             `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
                             `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
                             `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
                             `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
                             `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
                             `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                             `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
                             `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
                             `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
                             `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 201, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-02 16:00:31', 'admin', '2025-03-15 20:28:50', '', '2025-06-02 16:00:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 200, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-15 20:28:50', 'admin', '2025-03-15 20:28:50', 'admin', '2025-05-28 17:22:16', '测试员');
INSERT INTO `sys_user` VALUES (100, 200, 'Song', 'Song', '00', '2955500055@qq.com', '13122223333', '0', '', '$2a$10$jdRZNZFcpRiQvUvCe35Px.KR6jWkOk7A872fBmH/VqTLpvkaifPbu', '0', '0', '127.0.0.1', '2025-05-30 01:42:12', '', '2025-05-29 16:12:17', 'admin', '2025-05-30 01:42:11', NULL);
INSERT INTO `sys_user` VALUES (101, 200, 'Xiaoyu', 'Xiaoyu', '00', '1234567890@qq.com', '15122233344', '0', '', '$2a$10$vbkEHC1y33qZ/aA126UhPOn0BwRNeiJYm3UOwXovZqq/Dnw6qAPQq', '0', '0', '127.0.0.1', '2025-05-29 16:23:05', '', '2025-05-29 16:22:58', 'admin', '2025-05-29 16:23:52', NULL);
INSERT INTO `sys_user` VALUES (102, 200, '测试ing', '测试ing', '00', '1234567790@qq.com', '13122233322', '0', '', '$2a$10$7eG6zQq/E4acT94nHV/eou5zwq2YLTrvuuCfgq.52Sj8b/oxRiExO', '0', '0', '127.0.0.1', '2025-05-29 16:25:09', '', '2025-05-29 16:24:47', 'admin', '2025-05-29 16:26:07', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 4);
INSERT INTO `sys_user_post` VALUES (102, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 100);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 100);

SET FOREIGN_KEY_CHECKS = 1;
