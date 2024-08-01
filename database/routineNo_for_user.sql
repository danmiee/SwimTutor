-- 헬퍼 테이블 생성
CREATE TABLE routine_sequence (
	oauth_login_id VARCHAR(255) NOT NULL,
	oauth_login_platform VARCHAR(32) NOT NULL,
	current_no INT NOT NULL DEFAULT 0,
	PRIMARY KEY (oauth_login_id, oauth_login_platform)
);

-- 저장 프로시저 생성
DELIMITER //

CREATE PROCEDURE generate_routine_no (
	IN p_oauth_login_id VARCHAR(255),
	IN p_oauth_login_platform VARCHAR(32),
	OUT p_routine_no INT
)
BEGIN
	DECLARE seq_no INT;

	-- 기존 시퀀스가 있는지 확인하고 시퀀스를 업데이트
	SELECT current_no INTO seq_no
	FROM routine_sequence
	WHERE oauth_login_id = p_oauth_login_id
		AND oauth_login_platform = p_oauth_login_platform
		FOR UPDATE;

	IF seq_no IS NULL THEN
		-- 시퀀스가 없는 경우 새로 생성
		SET seq_no = 1;
		INSERT INTO routine_sequence (oauth_login_id, oauth_login_platform, current_no)
		VALUES (p_oauth_login_id, p_oauth_login_platform, seq_no);
	ELSE
		-- 시퀀스가 있는 경우 업데이트
		SET seq_no = seq_no + 1;
		UPDATE routine_sequence
		SET current_no = seq_no
		WHERE oauth_login_id = p_oauth_login_id
			AND oauth_login_platform = p_oauth_login_platform;
	END IF;

	SET p_routine_no = seq_no;
END //

DELIMITER ;

-- 트리거 생성
DELIMITER //

CREATE TRIGGER before_routine_insert
	BEFORE INSERT ON routine
	FOR EACH ROW
BEGIN
	DECLARE new_routine_no INT;

	-- 새로운 routine_no를 생성
	CALL generate_routine_no(NEW.oauth_login_id, NEW.oauth_login_platform, new_routine_no);

	-- 생성된 routine_no를 행에 설정
	SET NEW.routine_no = new_routine_no;
END //

DELIMITER ;


DELIMITER $$

CREATE TRIGGER before_routine_delete
	BEFORE DELETE ON routine
	FOR EACH ROW
BEGIN
	DELETE FROM training_for_routine WHERE routine_no = OLD.routine_no;
END $$

DELIMITER ;
