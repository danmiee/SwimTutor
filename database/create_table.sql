DROP DATABASE IF EXISTS swimtutor;
CREATE DATABASE swimtutor;
USE swimtutor;

-- swimtutor.level_classification definition

CREATE TABLE level_classification (
lc_training_name varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
user_level varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
standard_name varchar(10) NOT NULL COMMENT 'meta참조 - training - standard_name',
content varchar(255) NOT NULL COMMENT '설문내용',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (lc_training_name, user_level, standard_name)
) ENGINE=InnoDB;

-- swimtutor.meta definition

CREATE TABLE meta (
section varchar(255) NOT NULL,
item varchar(255) NOT NULL,
value varchar(255) NOT NULL,
description varchar(255) DEFAULT NULL,
PRIMARY KEY (section, item, value)
) ENGINE=InnoDB;

-- swimtutor.oauth_login definition

CREATE TABLE oauth_login (
oauth_login_id varchar(255) NOT NULL COMMENT '플랫폼에서 제공하는 id (ex. 구글이메일)',
oauth_login_platform varchar(32) NOT NULL,
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.training definition

CREATE TABLE training (
training_id varchar(8) NOT NULL COMMENT '약어 알파벳 4자리 + 숫자 4자리 0001~',
training_name varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
user_level varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
training_level varchar(3) NOT NULL COMMENT 'meta참조 - routine - training_level',
distance int NOT NULL COMMENT '세트 당 훈련 거리',
sets int NOT NULL COMMENT '훈련 반복 횟수',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (training_id)
) ENGINE=InnoDB;

-- swimtutor.users definition

CREATE TABLE users (
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
name varchar(32) NOT NULL,
gender char(1) NOT NULL,
birth date NOT NULL,
height float DEFAULT NULL,
weight float DEFAULT NULL,
preference varchar(16) NOT NULL,
goal varchar(16) NOT NULL COMMENT '다이어트 / 재활 / 근력강화 등등',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (oauth_login_id, oauth_login_platform),
CONSTRAINT users_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES oauth_login (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.exercise_record definition

CREATE TABLE exercise_record (
start_time datetime NOT NULL,
stop_time datetime NOT NULL,
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
category varchar(10) NOT NULL COMMENT 'meta 참조 - oauth - data_type',
value bigint NOT NULL,
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (start_time, oauth_login_id, oauth_login_platform, category),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
CONSTRAINT exercise_record_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES users (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.level_log definition

CREATE TABLE level_log (
levellog_id int NOT NULL AUTO_INCREMENT,
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
lc_training_name varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
user_level varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (levellog_id),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
KEY lc_training_name (lc_training_name, user_level),
CONSTRAINT level_log_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES users (oauth_login_id, oauth_login_platform),
CONSTRAINT level_log_ibfk_2 FOREIGN KEY (lc_training_name, user_level) REFERENCES level_classification (lc_training_name, user_level)
) ENGINE=InnoDB;

-- swimtutor.oauth_data definition

CREATE TABLE oauth_data (
data_type varchar(10) NOT NULL COMMENT 'meta참조 - oauth',
oauth_login_id varchar(255) NOT NULL COMMENT '난수생성',
oauth_login_platform varchar(32) NOT NULL,
data_sync_id varchar(255) NOT NULL COMMENT '헬스커넥트 id ( id + 변경토큰 + 생성일시 기준으로 데이터 동기화 변경사항 검색함)',
data_refresh_token text NOT NULL COMMENT '데이터 유형별 토큰 (다음 요청을 위해서 저장)',
data_token_expiry date NOT NULL COMMENT '토큰 유효기간 30일 (매일 back에서 토큰 유효기간이 7일 이내인 데이터 확인필요)',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '업데이트시 가장 최근 기록을 불러오는 용도',
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (data_type, oauth_login_id, oauth_login_platform, data_sync_id),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
CONSTRAINT oauth_data_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES users (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.performance definition

CREATE TABLE performance (
performance_name varchar(10) NOT NULL COMMENT 'meta참조',
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (performance_name, oauth_login_id, oauth_login_platform),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
CONSTRAINT performance_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES users (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.routine definition

CREATE TABLE routine (
routine_no int NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT / 유저명 넘버링',
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
routine_name varchar(20) NOT NULL COMMENT '사용자가 수정 가능한 루틴명',
pool_length int NOT NULL COMMENT '루틴 생성 시 선택한 레인 길이',
target_distance int NOT NULL DEFAULT '1000' COMMENT '루틴 생성 시 선택한 목표 거리',
sel_strokes text NOT NULL COMMENT '루틴 생성 시 선택한 영법 목록',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (routine_no, oauth_login_id, oauth_login_platform),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
CONSTRAINT routine_ibfk_1 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES users (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.training_for_routine definition

CREATE TABLE training_for_routine (
routine_no int NOT NULL,
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
session varchar(10) NOT NULL COMMENT 'meta참조 - routine - session',
training_id varchar(8) NOT NULL,
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (routine_no, oauth_login_id, oauth_login_platform, training_id),
KEY training_id (training_id),
CONSTRAINT training_for_routine_ibfk_1 FOREIGN KEY (routine_no, oauth_login_id, oauth_login_platform) REFERENCES routine (routine_no, oauth_login_id, oauth_login_platform),
CONSTRAINT training_for_routine_ibfk_2 FOREIGN KEY (training_id) REFERENCES training (training_id)
) ENGINE=InnoDB;

-- swimtutor.level definition

CREATE TABLE level (
levellog_id int NOT NULL,
oauth_login_id varchar(255) NOT NULL,
oauth_login_platform varchar(32) NOT NULL,
lc_training_name varchar(10) NOT NULL COMMENT 'meta참조 - routine - training_name',
user_level varchar(3) NOT NULL COMMENT 'meta참조 - routine - user_level',
created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (levellog_id),
KEY oauth_login_id (oauth_login_id, oauth_login_platform),
CONSTRAINT level_ibfk_1 FOREIGN KEY (levellog_id) REFERENCES level_log (levellog_id),
CONSTRAINT level_ibfk_2 FOREIGN KEY (oauth_login_id, oauth_login_platform) REFERENCES level_log (oauth_login_id, oauth_login_platform)
) ENGINE=InnoDB;

-- swimtutor.level_log_updated_trigger definition

DELIMITER //
CREATE TRIGGER level_log_updated_trigger
AFTER UPDATE ON level_log
FOR EACH ROW
BEGIN
DECLARE v_user_level varchar(3);

-- 가장 최근 업데이트된 user_level을 찾는다
SELECT user_level INTO v_user_level
FROM level_log
WHERE oauth_login_id = NEW.oauth_login_id
AND oauth_login_platform = NEW.oauth_login_platform
AND lc_training_name = NEW.lc_training_name
ORDER BY updated DESC
LIMIT 1;

-- level 테이블에 업데이트된 정보를 반영한다
UPDATE level
SET user_level = v_user_level,
lc_training_name = NEW.lc_training_name
WHERE levellog_id = NEW.levellog_id;
END;
//
DELIMITER ;
