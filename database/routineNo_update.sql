-- 헬퍼 테이블 생성
CREATE TABLE routine_sequence_update (
	oauth_login_id VARCHAR(255) NOT NULL,
	oauth_login_platform VARCHAR(32) NOT NULL,
	current_no INT NOT NULL DEFAULT 0,
	PRIMARY KEY (oauth_login_id, oauth_login_platform)
);


-- 트리거 설정
DELIMITER $$

CREATE TRIGGER before_routine_delete
	BEFORE DELETE ON routine
	FOR EACH ROW
BEGIN
	-- 동일한 키가 존재하는지 확인하고, 존재하면 업데이트, 존재하지 않으면 삽입
	INSERT INTO routine_sequence_update (oauth_login_id, oauth_login_platform, current_no)
	VALUES (OLD.oauth_login_id, OLD.oauth_login_platform, OLD.routine_no)
	ON DUPLICATE KEY UPDATE current_no = VALUES(current_no);
END $$

DELIMITER ;


-- 프로시저 구현
DELIMITER $$

CREATE PROCEDURE process_routine_update_queue()
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE current_oauth_login_id VARCHAR(255);
	DECLARE current_oauth_login_platform VARCHAR(32);
	DECLARE current_no INT;
	DECLARE last_routine_no INT;

	-- 커서 선언
	DECLARE cur CURSOR FOR SELECT oauth_login_id, oauth_login_platform, current_no FROM routine_sequence_update;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN cur;

	read_loop: LOOP
		FETCH cur INTO current_oauth_login_id, current_oauth_login_platform, current_no;
		IF done THEN
			LEAVE read_loop;
		END IF;

		-- current_no가 삭제된 번호 이후의 모든 routine_no를 하나씩 앞으로 당기기
		UPDATE routine
		SET routine_no = routine_no - 1
		WHERE oauth_login_id = current_oauth_login_id
			AND oauth_login_platform = current_oauth_login_platform
			AND routine_no > current_no;

		-- 마지막 routine_no 가져오기
		SELECT MAX(routine_no) INTO last_routine_no
		FROM routine
		WHERE oauth_login_id = current_oauth_login_id
			AND oauth_login_platform = current_oauth_login_platform;

		-- routine_sequence 테이블 업데이트
		UPDATE routine_sequence
		SET current_no = IFNULL(last_routine_no, 0)
		WHERE oauth_login_id = current_oauth_login_id
			AND oauth_login_platform = current_oauth_login_platform;

		-- 임시 테이블에서 해당 행 삭제
		DELETE FROM routine_sequence_update
		WHERE oauth_login_id = current_oauth_login_id
			AND oauth_login_platform = current_oauth_login_platform
			AND current_no = current_no;
	END LOOP;

	CLOSE cur;
END $$

DELIMITER ;


