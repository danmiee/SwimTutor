-- 데이터베이스 생성
DROP DATABASE IF EXISTS `test_st`;
CREATE DATABASE `test_st`;
USE `test_st`;

-- 기존 테이블 삭제
DROP TABLE IF EXISTS `level`;
DROP TABLE IF EXISTS `training_for_routine`;
DROP TABLE IF EXISTS `record`;
DROP TABLE IF EXISTS `meta`;
DROP TABLE IF EXISTS `oauth_data`;
DROP TABLE IF EXISTS `oauth_login`;
DROP TABLE IF EXISTS `training`;
DROP TABLE IF EXISTS `level_classification`;
DROP TABLE IF EXISTS `routine`;
DROP TABLE IF EXISTS `performance`;
DROP TABLE IF EXISTS `level_log`;
DROP TABLE IF EXISTS `users`;

-- 테이블 생성
CREATE TABLE `meta` (
`section` VARCHAR(255) NOT NULL,
`item` VARCHAR(255) NOT NULL,
`value` VARCHAR(255) NOT NULL,
`description` VARCHAR(255) NULL,
PRIMARY KEY (`section`, `item`, `value`)
);

CREATE TABLE `oauth_login` (
`oauth_login_id` varchar(255) NOT NULL COMMENT '플랫폼에서 제공하는 id (ex. 구글이메일)',
`oauth_login_platform` varchar(32) NOT NULL,
`id_token` text NOT NULL,
`access_token` text NOT NULL,
`login_refresh_token` text NOT NULL,
`login_token_expiry` datetime NOT NULL COMMENT '플랫폼별 토큰 수명에 맞춰 계산',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`oauth_login_id`, `oauth_login_platform`)
);
CREATE TABLE `training` (
`training_id` varchar(8) NOT NULL COMMENT '약어 알파벳 4자리 + 숫자 4자리 0001~',
`training_name` varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
`user_level` varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
`training_level` varchar(3) NOT NULL COMMENT 'meta참조 - routine - training_level',
`distance` int NOT NULL COMMENT '세트 당 훈련 거리',
`sets` int NOT NULL COMMENT '훈련 반복 횟수',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`training_id`)
);
CREATE TABLE `level_classification` (
`lc_training_name` varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
`user_level` varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
`standard_name` varchar(10) NOT NULL COMMENT 'meta참조 - training - standard_name',
`content` varchar(255) NOT NULL COMMENT '설문내용',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`lc_training_name`, `user_level`, `standard_name`)
);

CREATE TABLE `users` (
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`name` varchar(32) NOT NULL,
`gender` char(1) NOT NULL,
`birth` date NOT NULL,
`height` float NULL,
`weight` float NULL,
`preference` varchar(16) NOT NULL,
`goal` varchar(16) NOT NULL COMMENT '다이어트 / 재활 / 근력강화 등등',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`oauth_login_id`, `oauth_login_platform`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `oauth_login` (`oauth_login_id`, `oauth_login_platform`)
);
CREATE TABLE `oauth_data` (
`data_type` varchar(10) NOT NULL COMMENT 'meta참조 - oauth',
`oauth_login_id` varchar(255) NOT NULL COMMENT '난수생성',
`oauth_login_platform` varchar(32) NOT NULL,
`data_sync_id` varchar(255) NOT NULL COMMENT '헬스커넥트 id ( id + 변경토큰 + 생성일시 기준으로 데이터 동기화 변경사항 검색함)',
`data_refresh_token` text NOT NULL COMMENT '데이터 유형별 토큰 (다음 요청을 위해서 저장)',
`data_token_expiry` date NOT NULL COMMENT '토큰 유효기간 30일 (매일 back에서 토큰 유효기간이 7일 이내인 데이터 확인필요)',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '업데이트시 가장 최근 기록을 불러오는 용도',
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`data_type`, `oauth_login_id`, `oauth_login_platform`, `data_sync_id`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `users` (`oauth_login_id`, `oauth_login_platform`)
);
CREATE TABLE `routine` (
`routine_id` int NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT / 유저명 넘버링',
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`routine_name` varchar(20) NOT NULL COMMENT '사용자가 수정 가능한 루틴명',
`pool_length` int NOT NULL COMMENT '루틴 생성 시 선택한 레인 길이',
`target_distance` int NOT NULL DEFAULT 1000 COMMENT '루틴 생성 시 선택한 목표 거리',
`sel_strokes` text NOT NULL COMMENT '루틴 생성 시 선택한 영법 목록',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`routine_id`, `oauth_login_id`, `oauth_login_platform`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `users` (`oauth_login_id`, `oauth_login_platform`)
);
CREATE TABLE `performance` (
`performance_name` varchar(10) NOT NULL COMMENT 'meta참조',
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`performance_name`, `oauth_login_id`, `oauth_login_platform`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `users` (`oauth_login_id`, `oauth_login_platform`)
);

-- record : starttime & stoptime 기준으로 데이터 가져오기
-- 영법정보 안 넘어와서 관련 내용은 기록 불가
CREATE TABLE `record` (
`starttime` datetime NOT NULL,
`stoptime` datetime NOT NULL,
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`category` varchar(10) NOT NULL COMMENT 'meta 참조 - oauth - data_type',
`value` bigint NOT NULL,
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`starttime`, `oauth_login_id`, `oauth_login_platform`, `category`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `users` (`oauth_login_id`, `oauth_login_platform`)
);
CREATE TABLE `training_for_routine` (
`routine_id` int NOT NULL,
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`session` varchar(10) NOT NULL COMMENT 'meta참조 - routine - session',
`training_id` varchar(8) NOT NULL,
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`routine_id`, `oauth_login_id`, `oauth_login_platform`, `training_id`),
FOREIGN KEY (`routine_id`, `oauth_login_id`, `oauth_login_platform`) REFERENCES `routine` (`routine_id`, `oauth_login_id`, `oauth_login_platform`),
FOREIGN KEY (`training_id`) REFERENCES `training` (`training_id`)
);
CREATE TABLE `level_log` (
`levellog_id` int NOT NULL AUTO_INCREMENT,
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`lc_training_name` varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
`user_level` varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`levellog_id`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `users` (`oauth_login_id`, `oauth_login_platform`),
FOREIGN KEY (`lc_training_name`, `user_level`) REFERENCES `level_classification` (`lc_training_name`, `user_level`)
);

CREATE TABLE `level` (
`levellog_id` int NOT NULL,
`oauth_login_id` varchar(255) NOT NULL,
`oauth_login_platform` varchar(32) NOT NULL,
`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`levellog_id`),
FOREIGN KEY (`levellog_id`) REFERENCES `level_log` (`levellog_id`),
FOREIGN KEY (`oauth_login_id`, `oauth_login_platform`) REFERENCES `level_log` (`oauth_login_id`, `oauth_login_platform`)
);