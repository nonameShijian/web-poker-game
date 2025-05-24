/*
Navicat MySQL Data Transfer

Source Server         : localhost3306
Source Server Version : 80034
Source Host           : localhost:3306
Source Database       : pokergamedb

Target Server Type    : MYSQL
Target Server Version : 80034
File Encoding         : 65001

Date: 2025-05-24 16:51:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat_message
-- ----------------------------
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE `chat_message` (
  `messageId` int NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `roomId` int NOT NULL COMMENT '所属房间ID',
  `userId` int NOT NULL COMMENT '发送者ID',
  `message` text NOT NULL COMMENT '消息内容',
  `sent_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`messageId`),
  KEY `roomId` (`roomId`),
  KEY `userId` (`userId`),
  CONSTRAINT `chat_message_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE,
  CONSTRAINT `chat_message_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='游戏房间聊天记录表';

-- ----------------------------
-- Records of chat_message
-- ----------------------------

-- ----------------------------
-- Table structure for race_info
-- ----------------------------
DROP TABLE IF EXISTS `race_info`;
CREATE TABLE `race_info` (
  `raceId` int NOT NULL AUTO_INCREMENT COMMENT '比赛ID',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '比赛时间',
  `winner1` int NOT NULL COMMENT '赢家1',
  `winner2` int NOT NULL COMMENT '赢家2',
  `loser1` int NOT NULL COMMENT '输家1',
  `loser2` int NOT NULL COMMENT '输家2',
  `winner_score` int DEFAULT NULL COMMENT '赢家积分情况',
  `loser_score` int DEFAULT NULL COMMENT '输家积分情况',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '记录状态：0-已删除，1-正常',
  PRIMARY KEY (`raceId`),
  KEY `winner1` (`winner1`),
  KEY `winner2` (`winner2`),
  KEY `loser1` (`loser1`),
  KEY `loser2` (`loser2`),
  CONSTRAINT `race_info_ibfk_1` FOREIGN KEY (`winner1`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `race_info_ibfk_2` FOREIGN KEY (`winner2`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `race_info_ibfk_3` FOREIGN KEY (`loser1`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `race_info_ibfk_4` FOREIGN KEY (`loser2`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='历史比赛结果记录表';

-- ----------------------------
-- Records of race_info
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `roomId` int NOT NULL AUTO_INCREMENT COMMENT '房间ID',
  `ownerId` int NOT NULL COMMENT '房间创建者ID',
  `max_players` tinyint(1) NOT NULL DEFAULT '4' COMMENT '最大玩家数（固定4人）',
  `current_players` tinyint(1) NOT NULL DEFAULT '0' COMMENT '当前玩家数',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '房间创建时间',
  PRIMARY KEY (`roomId`),
  KEY `ownerId` (`ownerId`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='游戏房间信息表';

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT COMMENT '用户ID，自增主键',
  `username` varchar(20) NOT NULL COMMENT '登录用户名',
  `sex` tinyint(1) DEFAULT '0',
  `password` varchar(255) NOT NULL COMMENT '加密后的密码',
  `photo` blob COMMENT '用户头像图片数据',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户状态：0-禁用，1-正常，默认1',
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '角色：0-普通用户，1-管理员',
  `email` varchar(255) NOT NULL COMMENT '用户邮箱地址',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户基础信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '0', '$2a$10$rrn3BZzycgQVCKyk3ZpuHud0NrQFuv5F/F8hoYMSech9QnpS7hk7O', null, '1', '1', '2954700422@qq.com');
INSERT INTO `user` VALUES ('3', '小小小鱼', '1', '$2a$10$Vklrrch2feLhD80FS0IhK.31iPWBGE5oZxluvwdCjJviMmB3BgAfi', null, '1', '0', 'shijian2954700422@gmail.com');
INSERT INTO `user` VALUES ('4', '测试ing', '0', '$2a$10$BZXg2.244OeKt3EzMh2i.eRKxXS2rL7xKMI4o.BGBL1ggD98YcNJq', null, '1', '0', '844514528@qq.com');
INSERT INTO `user` VALUES ('5', '小洛克111', '0', '$2a$10$eaIz6dd62ZLD0bBfEV1SiuElAMKmLisqw/LWetjwjER/4dIvk0fwa', null, '1', '0', '1805644267@qq.com');
INSERT INTO `user` VALUES ('6', '鱼小小小', '0', '$2a$10$.zvXkmURflMzFwSLRehp0.h/9IkgsLNNFo3R1dysGJkc4KKtV6kZe', null, '1', '0', '474382129@qq.com');

-- ----------------------------
-- Table structure for user_game_stats
-- ----------------------------
DROP TABLE IF EXISTS `user_game_stats`;
CREATE TABLE `user_game_stats` (
  `userId` int NOT NULL COMMENT '用户ID',
  `total_win` int NOT NULL DEFAULT '0' COMMENT '累计胜利场次',
  `total_lost` int NOT NULL DEFAULT '0' COMMENT '累计失败场次',
  `total_games` int NOT NULL DEFAULT '0' COMMENT '总参与场次',
  PRIMARY KEY (`userId`),
  CONSTRAINT `user_game_stats_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户游戏胜负统计表';

-- ----------------------------
-- Records of user_game_stats
-- ----------------------------
