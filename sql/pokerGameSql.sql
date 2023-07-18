

USE pokergamedb;

/* 用户表 */
CREATE TABLE `user`(
	userId INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,/* 用户id，并且从 1 开始自增 */
	`name` VARCHAR(20) NOT NULL,/* 昵称 */
	username VARCHAR(20) UNIQUE NOT NULL,/* 用户名 */
	`password` VARCHAR(20) NOT NULL,/* 密码 */
	photo BLOB, /* 用户头像 */
	`status` INT(1) DEFAULT(1) NOT NULL /* 状态 0：未生效  1：使用中    默认：1*/
);

/* 用户胜负情况 */
CREATE TABLE userGameInfo(
	userId INT(2) UNIQUE NOT NULL,/*用户id 外码*/
	win INT(2) DEFAULT(0) NOT NULL,/*胜场*/
	lost INT(2) DEFAULT(0) NOT NULL,/*败场*/
	raceNum INT(2) DEFAULT(0) NOT NULL,/*比赛场次*/
	CONSTRAINT `userGameInfo_userId` FOREIGN KEY (userId) REFERENCES `user`(userId)
);

/* 历史比赛信息 */
CREATE TABLE raceInfo(
	raceId INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,/* 比赛id */
	player1 INT(2) NOT NULL,/* 玩家1 */
	player2 INT(2) NOT NULL,/* 玩家2 */
	player3 INT(2) NOT NULL,/* 玩家3 */
	player4 INT(2) NOT NULL,/* 玩家4 */
	winner1 INT(2) NOT NULL,/* 胜利者1 */
	winner2 INT(2) NOT NULL /* 胜利者2 */
);




