-- 데이터 삽입
-- meta
insert into meta (`section`, `item`, `value`, `description`) values
-- oauth - data_type
('oauth', 'data_type', '랩 횟수', ''),
('oauth', 'data_type', '랩 횟수 전체', ''),
('oauth', 'data_type', '스트로크', ''),
('oauth', 'data_type', '스트로크 전체', ''),
('oauth', 'data_type', '속도', ''),
('oauth', 'data_type', '평균 속도', ''),
('oauth', 'data_type', '칼로리', ''),
('oauth', 'data_type', '일일 활동 칼로리', ''),
('oauth', 'data_type', '총 칼로리', ''),
('oauth', 'data_type', '심박수', ''),
('oauth', 'data_type', '평균 심박수', ''),
('oauth', 'data_type', '페이스', ''),
('oauth', 'data_type', '평균 페이스', ''),
('oauth', 'data_type', '운동 횟수', ''),
('oauth', 'data_type', '운동 횟수 전체', ''),
('oauth', 'data_type', '운동 거리', ''),
('oauth', 'data_type', '데일리 운동 거리', ''),
('oauth', 'data_type', '운동 거리 전체', ''),
-- routine - training_name
('routine', 'training_name', '자유형', ''),
('routine', 'training_name', '배영', ''),
('routine', 'training_name', '평영', ''),
('routine', 'training_name', '접영', ''),
-- routine - user_level
('routine', 'user_level', '초급', ''),
('routine', 'user_level', '중급', ''),
('routine', 'user_level', '상급', ''),
-- routine - session
('routine', 'session', '워밍업', ''),
('routine', 'session', '코어', ''),
('routine', 'session', '쿨다운', ''),
-- training - standard_name
('training', 'standard_name', '거리', ''),
('training', 'standard_name', '속도', ''),
('training', 'standard_name', '기술', ''),
-- training - training_level
('training', 'training_level', '쉬움', ''),
('training', 'training_level', '보통', ''),
('training', 'training_level', '어려움', ''),
-- goal
('goal', '성과지표명', '기준(스트로크, 칼로리 등)', '');

-- oauth_login
INSERT INTO oauth_login (oauth_login_id, oauth_login_platform, id_token, access_token, login_refresh_token, login_token_expiry, created, updated) VALUES
('tgk@gmail.com', 'google', 'id_token1', 'access_token', 'login_refresh_token1', DATE_ADD('2024-05-18 14:35:24', INTERVAL 30 DAY), '2024-05-18 14:35:24', '2024-05-18 14:35:24'),
('redfox9202@gmail.com', 'google', 'id_token2', 'access_token', 'login_refresh_token2', DATE_ADD('2024-05-20 09:15:36', INTERVAL 30 DAY), '2024-05-20 09:15:36', '2024-05-20 09:15:36'),
('emkbjh@gmail.com', 'google', 'id_token3', 'access_token', 'login_refresh_token3', DATE_ADD('2024-05-22 17:45:50', INTERVAL 30 DAY), '2024-05-22 17:45:50', '2024-05-22 17:45:50'),
('tgk@gmail.com', 'google', 'id_token4', 'access_token', 'login_refresh_token4', DATE_ADD('2024-05-24 23:05:12', INTERVAL 30 DAY), '2024-05-24 23:05:12', '2024-05-24 23:05:12'),
('redfox9202@gmail.com', 'google', 'id_token5', 'access_token', 'login_refresh_token5', DATE_ADD('2024-05-26 06:25:38', INTERVAL 30 DAY), '2024-05-26 06:25:38', '2024-05-26 06:25:38'),
('emkbjh@gmail.com', 'google', 'id_token6', 'access_token', 'login_refresh_token6', DATE_ADD('2024-05-28 12:35:44', INTERVAL 30 DAY), '2024-05-28 12:35:44', '2024-05-28 12:35:44'),
('tgk@gmail.com', 'google', 'id_token7', 'access_token', 'login_refresh_token7', DATE_ADD('2024-05-30 19:55:09', INTERVAL 30 DAY), '2024-05-30 19:55:09', '2024-05-30 19:55:09'),
('redfox9202@gmail.com', 'google', 'id_token8', 'access_token', 'login_refresh_token8', DATE_ADD('2024-06-01 03:15:20', INTERVAL 30 DAY), '2024-06-01 03:15:20', '2024-06-01 03:15:20'),
('emkbjh@gmail.com', 'google', 'id_token9', 'access_token', 'login_refresh_token9', DATE_ADD('2024-06-03 08:25:55', INTERVAL 30 DAY), '2024-06-03 08:25:55', '2024-06-03 08:25:55'),
('tgk0@gmail.com', 'google', 'id_token10', 'access_token', 'login_refresh_token10', DATE_ADD('2024-06-05 15:45:33', INTERVAL 30 DAY), '2024-06-05 15:45:33', '2024-06-05 15:45:33');

-- user
INSERT INTO users (oauth_login_id, oauth_login_platform, name, gender, birth, height, weight, preference, goal, created, updated) VALUES
('tgk@gmail.com', 'google', 'John Doe', 'M', '1990-01-01', 180, 75, '자유형', 'fitness', '2024-05-17 14:25:36', '2024-05-17 14:25:36'),
('redfox9202@gmail.com', 'google', 'Jane Smith', 'F', '1985-05-12', 165, 60, 'backstroke', 'rehabilitation', '2024-05-19 11:20:48', '2024-05-19 11:20:48'),
('emkbjh@gmail.com', 'google', 'Alice Johnson', 'F', '1992-07-23', 170, 65, 'BReaststroke', 'weight loss', '2024-05-21 09:35:20', '2024-05-21 09:35:20'),
('tgk@gmail.com', 'google', 'Bob Brown', 'M', '1988-11-03', 175, 70, 'butterfly', 'strength', '2024-05-23 19:45:30', '2024-05-23 19:45:30'),
('redfox9202@gmail.com', 'google', 'Charlie Davis', 'M', '1995-03-15', 182, 80, '자유형', 'endurance', '2024-05-25 03:30:15', '2024-05-25 03:30:15'),
('emkbjh@gmail.com', 'google', 'Emily Clark', 'F', '1991-09-09', 168, 58, 'backstroke', 'fitness', '2024-05-27 08:15:22', '2024-05-27 08:15:22'),
('tgk@gmail.com', 'google', 'David Wilson', 'M', '1987-07-07', 178, 72, 'butterfly', 'rehabilitation', '2024-05-29 16:05:30', '2024-05-29 16:05:30'),
('redfox9202@gmail.com', 'google', 'Emma Moore', 'F', '1983-11-11', 162, 55, 'BReaststroke', 'weight loss', '2024-05-31 00:10:45', '2024-05-31 00:10:45'),
('emkbjh@gmail.com', 'google', 'James Taylor', 'M', '1994-04-04', 185, 78, '자유형', 'strength', '2024-06-02 05:20:50', '2024-06-02 05:20:50'),
('tgk0@gmail.com', 'google', 'Sophia Anderson', 'F', '1989-06-06', 172, 63, 'backstroke', 'endurance', '2024-06-04 12:10:12', '2024-06-04 12:10:12');

-- oauth_data
INSERT INTO oauth_data (data_type, oauth_login_id, oauth_login_platform, data_sync_id, data_refresh_token, data_token_expiry, created, updated) VALUES
('랩 횟수', 'tgk@gmail.com', 'google', 'sync1', 'refresh_token1', DATE_ADD('2024-06-01', INTERVAL 30 DAY), '2024-05-30 14:12:15', '2024-05-30 14:12:15'),
('스트로크', 'tgk@gmail.com', 'google', 'sync2', 'refresh_token2', DATE_ADD('2024-06-01', INTERVAL 30 DAY), '2024-05-31 09:47:23', '2024-05-31 09:47:23'),
('속도', 'tgk@gmail.com', 'google', 'sync3', 'refresh_token3', DATE_ADD('2024-06-01', INTERVAL 30 DAY), '2024-06-01 08:55:10', '2024-06-01 08:55:10'),
('칼로리', 'tgk@gmail.com', 'google', 'sync4', 'refresh_token4', DATE_ADD('2024-06-01', INTERVAL 30 DAY), '2024-06-02 16:43:33', '2024-06-02 16:43:33'),
('심박수', 'tgk@gmail.com', 'google', 'sync5', 'refresh_token5', DATE_ADD('2024-06-01', INTERVAL 30 DAY), '2024-06-03 11:58:22', '2024-06-03 11:58:22'),
('랩 횟수', 'redfox9202@gmail.com', 'google', 'sync6', 'refresh_token6', DATE_ADD('2024-06-02', INTERVAL 30 DAY), '2024-05-30 07:34:44', '2024-05-30 07:34:44'),
('스트로크', 'redfox9202@gmail.com', 'google', 'sync7', 'refresh_token7', DATE_ADD('2024-06-02', INTERVAL 30 DAY), '2024-05-31 11:55:13', '2024-05-31 11:55:13'),
('속도', 'redfox9202@gmail.com', 'google', 'sync8', 'refresh_token8', DATE_ADD('2024-06-02', INTERVAL 30 DAY), '2024-06-01 10:22:35', '2024-06-01 10:22:35'),
('칼로리', 'redfox9202@gmail.com', 'google', 'sync9', 'refresh_token9', DATE_ADD('2024-06-02', INTERVAL 30 DAY), '2024-06-02 15:12:29', '2024-06-02 15:12:29'),
('심박수', 'redfox9202@gmail.com', 'google', 'sync10', 'refresh_token10', DATE_ADD('2024-06-02', INTERVAL 30 DAY), '2024-06-03 14:55:47', '2024-06-03 14:55:47'),
('랩 횟수', 'emkbjh@gmail.com', 'google', 'sync11', 'refresh_token11', DATE_ADD('2024-06-03', INTERVAL 30 DAY), '2024-05-31 13:17:09', '2024-05-31 13:17:09'),
('스트로크', 'emkbjh@gmail.com', 'google', 'sync12', 'refresh_token12', DATE_ADD('2024-06-03', INTERVAL 30 DAY), '2024-06-01 12:43:55', '2024-06-01 12:43:55'),
('속도', 'emkbjh@gmail.com', 'google', 'sync13', 'refresh_token13', DATE_ADD('2024-06-03', INTERVAL 30 DAY), '2024-06-02 09:34:28', '2024-06-02 09:34:28'),
('칼로리', 'emkbjh@gmail.com', 'google', 'sync14', 'refresh_token14', DATE_ADD('2024-06-03', INTERVAL 30 DAY), '2024-06-03 16:25:15', '2024-06-03 16:25:15'),
('심박수', 'emkbjh@gmail.com', 'google', 'sync15', 'refresh_token15', DATE_ADD('2024-06-03', INTERVAL 30 DAY), '2024-06-04 11:47:38', '2024-06-04 11:47:38'),
('랩 횟수', 'redfox9202@gmail.com', 'google', 'sync16', 'refresh_token16', DATE_ADD('2024-06-05', INTERVAL 30 DAY), '2024-05-30 17:35:22', '2024-05-30 17:35:22'),
('스트로크', 'redfox9202@gmail.com', 'google', 'sync17', 'refresh_token17', DATE_ADD('2024-06-05', INTERVAL 30 DAY), '2024-05-31 14:22:55', '2024-05-31 14:22:55'),
('속도', 'redfox9202@gmail.com', 'google', 'sync18', 'refresh_token18', DATE_ADD('2024-06-05', INTERVAL 30 DAY), '2024-06-01 18:15:30', '2024-06-01 18:15:30'),
('칼로리', 'redfox9202@gmail.com', 'google', 'sync19', 'refresh_token19', DATE_ADD('2024-06-05', INTERVAL 30 DAY), '2024-06-02 19:35:28', '2024-06-02 19:35:28'),
('심박수', 'redfox9202@gmail.com', 'google', 'sync20', 'refresh_token20', DATE_ADD('2024-06-05', INTERVAL 30 DAY), '2024-06-03 13:12:18', '2024-06-03 13:12:18'),
('랩 횟수', 'tgk@gmail.com', 'google', 'sync21', 'refresh_token21', DATE_ADD('2024-06-07', INTERVAL 30 DAY), '2024-06-01 08:13:34', '2024-06-01 08:13:34'),
('스트로크', 'tgk@gmail.com', 'google', 'sync22', 'refresh_token22', DATE_ADD('2024-06-07', INTERVAL 30 DAY), '2024-06-02 12:47:39', '2024-06-02 12:47:39'),
('속도', 'tgk@gmail.com', 'google', 'sync23', 'refresh_token23', DATE_ADD('2024-06-07', INTERVAL 30 DAY), '2024-06-03 09:22:15', '2024-06-03 09:22:15'),
('칼로리', 'tgk@gmail.com', 'google', 'sync24', 'refresh_token24', DATE_ADD('2024-06-07', INTERVAL 30 DAY), '2024-06-04 18:55:40', '2024-06-04 18:55:40'),
('심박수', 'tgk@gmail.com', 'google', 'sync25', 'refresh_token25', DATE_ADD('2024-06-07', INTERVAL 30 DAY), '2024-06-05 11:44:50', '2024-06-05 11:44:50'),
('랩 횟수', 'redfox9202@gmail.com', 'google', 'sync26', 'refresh_token26', DATE_ADD('2024-06-08', INTERVAL 30 DAY), '2024-06-02 13:34:19', '2024-06-02 13:34:19'),
('스트로크', 'redfox9202@gmail.com', 'google', 'sync27', 'refresh_token27', DATE_ADD('2024-06-08', INTERVAL 30 DAY), '2024-06-03 08:23:25', '2024-06-03 08:23:25'),
('속도', 'redfox9202@gmail.com', 'google', 'sync28', 'refresh_token28', DATE_ADD('2024-06-08', INTERVAL 30 DAY), '2024-06-04 19:48:30', '2024-06-04 19:48:30'),
('칼로리', 'redfox9202@gmail.com', 'google', 'sync29', 'refresh_token29', DATE_ADD('2024-06-08', INTERVAL 30 DAY), '2024-06-05 12:15:32', '2024-06-05 12:15:32'),
('심박수', 'redfox9202@gmail.com', 'google', 'sync30', 'refresh_token30', DATE_ADD('2024-06-08', INTERVAL 30 DAY), '2024-06-06 11:35:37', '2024-06-06 11:35:37'),
('랩 횟수', 'emkbjh@gmail.com', 'google', 'sync31', 'refresh_token31', DATE_ADD('2024-06-09', INTERVAL 30 DAY), '2024-06-03 16:22:25', '2024-06-03 16:22:25'),
('스트로크', 'emkbjh@gmail.com', 'google', 'sync32', 'refresh_token32', DATE_ADD('2024-06-09', INTERVAL 30 DAY), '2024-06-04 15:25:12', '2024-06-04 15:25:12'),
('속도', 'emkbjh@gmail.com', 'google', 'sync33', 'refresh_token33', DATE_ADD('2024-06-09', INTERVAL 30 DAY), '2024-06-05 08:57:10', '2024-06-05 08:57:10'),
('칼로리', 'emkbjh@gmail.com', 'google', 'sync34', 'refresh_token34', DATE_ADD('2024-06-09', INTERVAL 30 DAY), '2024-06-06 13:45:30', '2024-06-06 13:45:30'),
('심박수', 'emkbjh@gmail.com', 'google', 'sync35', 'refresh_token35', DATE_ADD('2024-06-09', INTERVAL 30 DAY), '2024-06-07 16:30:35', '2024-06-07 16:30:35');

-- routine
INSERT INTO routine (oauth_login_id, oauth_login_platform, routine_name, pool_length, target_distance, sel_strokes, created, updated) VALUES
('tgk@gmail.com', 'google', 'Morning Swim', 25, 1000, '자유형, 배영', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
('tgk@gmail.com', 'google', 'Evening Swim', 50, 1500, '자유형', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
('redfox9202@gmail.com', 'google', 'Rehab Routine', 25, 1000, '배영', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
('redfox9202@gmail.com', 'google', 'Morning Routine', 25, 1200, '자유형, 접영', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
('emkbjh@gmail.com', 'google', 'Weight Loss Program', 50, 2000, '평영, 자유형', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
('redfox9202@gmail.com', 'google', 'Endurance Swim', 25, 2500, '자유형', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
('redfox9202@gmail.com', 'google', 'Fitness Routine', 50, 1200, '접영, 자유형', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
('tgk@gmail.com', 'google', 'Evening Swim', 50, 1500, '자유형', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
('redfox9202@gmail.com', 'google', 'Morning Swim', 25, 1000, '자유형, 접영', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
('emkbjh@gmail.com', 'google', 'Muscle Building', 50, 2000, '평영', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
('emkbjh@gmail.com', 'google', 'Cardio Session', 25, 2500, '자유형, 배영', '2024-06-06 11:42:30', '2024-06-06 11:42:30');

-- training
-- training_id 기준
-- 영법 : 자유형(FC, Front Crawl), 배영(BK, Backstroke), 평영(BR, Breaststroke), 접영(BF, Butterfly)
-- 수영수준 : 초급(B, Beginner), 중급(I, Intermediate), 상급(A, Advanced)
-- 훈련수준 : 쉬움(E, Easy), 보통(N, Normal), 어려움(D, Difficult)
-- 숫자 : 영법, 수영수준, 훈련수준별 0001부터 시작하여 1씩 증가

-- training_for_routine
INSERT INTO training_for_routine (routine_no, oauth_login_id, oauth_login_platform, session, training_id, created, updated) VALUES
-- tgk@gmail.com - Morning Swim
(1, 'tgk@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
(1, 'tgk@gmail.com', 'google', '코어', 'fcbn0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
(1, 'tgk@gmail.com', 'google', '코어', 'fcbn0002', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
(1, 'tgk@gmail.com', 'google', '코어', 'fcbd0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
(1, 'tgk@gmail.com', 'google', '쿨다운', 'fcbe0003', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),

-- tgk@gmail.com - Evening Swim
(2, 'tgk@gmail.com', 'google', '워밍업', 'fcbe0002', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
(2, 'tgk@gmail.com', 'google', '코어', 'fcbn0003', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
(2, 'tgk@gmail.com', 'google', '코어', 'fcbd0002', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
(2, 'tgk@gmail.com', 'google', '코어', 'fcbd0003', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
(2, 'tgk@gmail.com', 'google', '쿨다운', 'fcbe0001', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),

-- redfox9202@gmail.com - Rehab Routine
(3, 'redfox9202@gmail.com', 'google', '워밍업', 'bkbe0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'bkbn0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'bkbn0002', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'bkbd0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(3, 'redfox9202@gmail.com', 'google', '쿨다운', 'bkbe0002', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),

-- redfox9202@gmail.com - Morning Routine
(4, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'fcin0001', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'bfid0002', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'bfid0003', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(4, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),

-- emkbjh@gmail.com - Weight Loss Program
(5, 'emkbjh@gmail.com', 'google', '워밍업', 'brbe0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
(5, 'emkbjh@gmail.com', 'google', '코어', 'fcbn0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
(5, 'emkbjh@gmail.com', 'google', '코어', 'brbd0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
(5, 'emkbjh@gmail.com', 'google', '코어', 'brbd0002', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
(5, 'emkbjh@gmail.com', 'google', '쿨다운', 'brbe0002', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),

-- redfox9202@gmail.com - Endurance Swim
(6, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(6, 'redfox9202@gmail.com', 'google', '코어', 'fcid0001', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(6, 'redfox9202@gmail.com', 'google', '코어', 'fcid0002', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(6, 'redfox9202@gmail.com', 'google', '코어', 'fcid0003', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(6, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),

-- redfox9202@gmail.com - Fitness Routine
(7, 'redfox9202@gmail.com', 'google', '워밍업', 'bfbe0001', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(7, 'redfox9202@gmail.com', 'google', '코어', 'bfid0001', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(7, 'redfox9202@gmail.com', 'google', '코어', 'bfid0002', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(7, 'redfox9202@gmail.com', 'google', '코어', 'bfid0003', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(7, 'redfox9202@gmail.com', 'google', '쿨다운', 'bfbe0002', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),

-- tgk@gmail.com - Evening Swim
(8, 'tgk@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
(8, 'tgk@gmail.com', 'google', '코어', 'fcbn0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
(8, 'tgk@gmail.com', 'google', '코어', 'fcbn0002', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
(8, 'tgk@gmail.com', 'google', '코어', 'fcbd0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
(8, 'tgk@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),

-- redfox9202@gmail.com - Morning Swim
(9, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(9, 'redfox9202@gmail.com', 'google', '코어', 'fcid0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(9, 'redfox9202@gmail.com', 'google', '코어', 'bfid0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(9, 'redfox9202@gmail.com', 'google', '코어', 'fcid0002', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(9, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),

-- emkbjh@gmail.com - Muscle Building
(10, 'emkbjh@gmail.com', 'google', '워밍업', 'brbe0001', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
(10, 'emkbjh@gmail.com', 'google', '코어', 'brin0001', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
(10, 'emkbjh@gmail.com', 'google', '코어', 'brin0002', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
(10, 'emkbjh@gmail.com', 'google', '코어', 'brin0003', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
(10, 'emkbjh@gmail.com', 'google', '쿨다운', 'brbe0002', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),

-- emkbjh@gmail.com - Cardio Session
(11, 'emkbjh@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
(11, 'emkbjh@gmail.com', 'google', '코어', 'fcid0001', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
(11, 'emkbjh@gmail.com', 'google', '코어', 'fcid0002', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
(11, 'emkbjh@gmail.com', 'google', '코어', 'fcid0003', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
(11, 'emkbjh@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-06 11:42:30', '2024-06-06 11:42:30');

-- record
INSERT INTO record (starttime, stoptime, oauth_login_id, oauth_login_platform, category, value, created, updated) VALUES
('2024-06-01 06:22:10', '2024-06-01 07:15:22', 'tgk@gmail.com', 'google', '랩 횟수', 20, '2024-06-01 07:18:22', '2024-06-01 07:18:22'),
('2024-06-01 06:22:10', '2024-06-01 07:15:22', 'tgk@gmail.com', 'google', '속도', 2, '2024-06-01 07:20:10', '2024-06-01 07:20:10'),
('2024-06-01 06:22:10', '2024-06-01 07:15:22', 'tgk@gmail.com', 'google', '칼로리', 500, '2024-06-01 07:21:22', '2024-06-01 07:21:22'),
('2024-06-01 06:22:10', '2024-06-01 07:15:22', 'tgk@gmail.com', 'google', '심박수', 150, '2024-06-01 07:22:33', '2024-06-01 07:22:33'),

('2024-06-02 06:32:15', '2024-06-02 07:12:20', 'redfox9202@gmail.com', 'google', '랩 횟수', 25, '2024-06-02 07:17:12', '2024-06-02 07:17:12'),
('2024-06-02 06:32:15', '2024-06-02 07:12:20', 'redfox9202@gmail.com', 'google', '속도', 2.2, '2024-06-02 07:19:30', '2024-06-02 07:19:30'),
('2024-06-02 06:32:15', '2024-06-02 07:12:20', 'redfox9202@gmail.com', 'google', '칼로리', 480, '2024-06-02 07:20:45', '2024-06-02 07:20:45'),
('2024-06-02 06:32:15', '2024-06-02 07:12:20', 'redfox9202@gmail.com', 'google', '심박수', 140, '2024-06-02 07:21:55', '2024-06-02 07:21:55'),

('2024-06-03 06:45:10', '2024-06-03 07:25:10', 'emkbjh@gmail.com', 'google', '랩 횟수', 22, '2024-06-03 07:29:33', '2024-06-03 07:29:33'),
('2024-06-03 06:45:10', '2024-06-03 07:25:10', 'emkbjh@gmail.com', 'google', '속도', 2.1, '2024-06-03 07:31:15', '2024-06-03 07:31:15'),
('2024-06-03 06:45:10', '2024-06-03 07:25:10', 'emkbjh@gmail.com', 'google', '칼로리', 490, '2024-06-03 07:32:22', '2024-06-03 07:32:22'),
('2024-06-03 06:45:10', '2024-06-03 07:25:10', 'emkbjh@gmail.com', 'google', '심박수', 145, '2024-06-03 07:33:33', '2024-06-03 07:33:33'),

('2024-06-05 06:14:18', '2024-06-05 07:18:22', 'redfox9202@gmail.com', 'google', '랩 횟수', 18, '2024-06-05 07:20:45', '2024-06-05 07:20:45'),
('2024-06-05 06:14:18', '2024-06-05 07:18:22', 'redfox9202@gmail.com', 'google', '속도', 2.3, '2024-06-05 07:22:33', '2024-06-05 07:22:33'),
('2024-06-05 06:14:18', '2024-06-05 07:18:22', 'redfox9202@gmail.com', 'google', '칼로리', 470, '2024-06-05 07:23:12', '2024-06-05 07:23:12'),
('2024-06-05 06:14:18', '2024-06-05 07:18:22', 'redfox9202@gmail.com', 'google', '심박수', 155, '2024-06-05 07:24:25', '2024-06-05 07:24:25'),

('2024-06-06 06:25:15', '2024-06-06 07:15:30', 'tgk@gmail.com', 'google', '랩 횟수', 20, '2024-06-06 07:17:20', '2024-06-06 07:17:20'),
('2024-06-06 06:25:15', '2024-06-06 07:15:30', 'tgk@gmail.com', 'google', '속도', 2.5, '2024-06-06 07:19:45', '2024-06-06 07:19:45'),
('2024-06-06 06:25:15', '2024-06-06 07:15:30', 'tgk@gmail.com', 'google', '칼로리', 460, '2024-06-06 07:20:33', '2024-06-06 07:20:33'),
('2024-06-06 06:25:15', '2024-06-06 07:15:30', 'tgk@gmail.com', 'google', '심박수', 150, '2024-06-06 07:21:25', '2024-06-06 07:21:25'),

('2024-06-07 06:12:20', '2024-06-07 07:20:12', 'redfox9202@gmail.com', 'google', '랩 횟수', 21, '2024-06-07 07:23:33', '2024-06-07 07:23:33'),
('2024-06-07 06:12:20', '2024-06-07 07:20:12', 'redfox9202@gmail.com', 'google', '속도', 2.4, '2024-06-07 07:25:33', '2024-06-07 07:25:33'),
('2024-06-07 06:12:20', '2024-06-07 07:20:12', 'redfox9202@gmail.com', 'google', '칼로리', 475, '2024-06-07 07:26:12', '2024-06-07 07:26:12'),
('2024-06-07 06:12:20', '2024-06-07 07:20:12', 'redfox9202@gmail.com', 'google', '심박수', 155, '2024-06-07 07:27:22', '2024-06-07 07:27:22'),

('2024-06-08 06:32:12', '2024-06-08 07:18:10', 'emkbjh@gmail.com', 'google', '랩 횟수', 23, '2024-06-08 07:20:25', '2024-06-08 07:20:25'),
('2024-06-08 06:32:12', '2024-06-08 07:18:10', 'emkbjh@gmail.com', 'google', '속도', 2.7, '2024-06-08 07:22:33', '2024-06-08 07:22:33'),
('2024-06-08 06:32:12', '2024-06-08 07:18:10', 'emkbjh@gmail.com', 'google', '칼로리', 490, '2024-06-08 07:23:25', '2024-06-08 07:23:25'),
('2024-06-08 06:32:12', '2024-06-08 07:18:10', 'emkbjh@gmail.com', 'google', '심박수', 160, '2024-06-08 07:24:12', '2024-06-08 07:24:12');

-- performance
INSERT INTO performance (performance_name, oauth_login_id, oauth_login_platform, created, updated) VALUES
('Speed', 'tgk@gmail.com', 'google', '2024-06-01 08:12:15', '2024-06-01 08:12:15'),
('Stroke', 'tgk@gmail.com', 'google', '2024-06-01 10:35:20', '2024-06-01 10:35:20'),
('Calorie', 'tgk@gmail.com', 'google', '2024-06-01 12:45:25', '2024-06-01 12:45:25'),
('Heart Rate', 'redfox9202@gmail.com', 'google', '2024-06-02 09:12:10', '2024-06-02 09:12:10'),
('Speed', 'emkbjh@gmail.com', 'google', '2024-06-03 08:22:25', '2024-06-03 08:22:25'),
('Stroke', 'emkbjh@gmail.com', 'google', '2024-06-03 09:45:30', '2024-06-03 09:45:30'),
('Speed', 'redfox9202@gmail.com', 'google', '2024-06-05 09:12:22', '2024-06-05 09:12:22'),
('Stroke', 'redfox9202@gmail.com', 'google', '2024-06-05 11:30:10', '2024-06-05 11:30:10'),
('Calorie', 'redfox9202@gmail.com', 'google', '2024-06-05 13:55:33', '2024-06-05 13:55:33'),
('Heart Rate', 'tgk@gmail.com', 'google', '2024-06-06 10:22:18', '2024-06-06 10:22:18'),
('Speed', 'redfox9202@gmail.com', 'google', '2024-06-07 08:15:30', '2024-06-07 08:15:30'),
('Stroke', 'redfox9202@gmail.com', 'google', '2024-06-07 10:45:20', '2024-06-07 10:45:20'),
('Heart Rate', 'emkbjh@gmail.com', 'google', '2024-06-08 09:30:25', '2024-06-08 09:30:25');

-- level_classification;
INSERT INTO level_classification (lc_training_name, user_level, standard_name, content) VALUES
-- 자유형
('자유형', '초급', '거리', '400m 미만')
, ('자유형', '초급', '속도', '1분 이상')
, ('자유형', '초급', '기술', '턴 동작을 배우지 않았다.')
, ('자유형', '중급', '거리', '800m 미만')
, ('자유형', '중급', '속도', '1분 미만')
, ('자유형', '중급', '기술', '사이드 턴을 할 수 있다.')
, ('자유형', '상급', '거리', '800m 이상')
, ('자유형', '상급', '속도', '45초 미만')
, ('자유형', '상급', '기술', '플립 턴을 할 수 있다.')
-- 배영
, ('배영', '초급', '거리', '300m 미만')
, ('배영', '초급', '속도', '1분 15초 이상')
, ('배영', '초급', '기술', '물 속 스타트를 배우지 않았다.')
, ('배영', '중급', '거리', '500m 미만')
, ('배영', '중급', '속도', '1분 15초 미만')
, ('배영', '중급', '기술', '바사로킥 및 물 속 스타트를 할 수 있다.')
, ('배영', '상급', '거리', '500m 이상')
, ('배영', '상급', '속도', '55초 미만')
, ('배영', '상급', '기술', '배영 턴을 할 수 있다.')
-- 평영
, ('평영', '초급', '거리', '300m 미만')
, ('평영', '초급', '속도', '1분 20초 이상')
, ('평영', '초급', '기술', '물 속 스타트를 배우지 않았다.')
, ('평영', '중급', '거리', '500m 미만')
, ('평영', '중급', '속도', '1분 20초 미만')
, ('평영', '중급', '기술', '두 손으로 벽을 잡고 턴 한 후, 물 속 스타트를 할 수 있다.')
, ('평영', '상급', '거리', '500m 이상')
, ('평영', '상급', '속도', '1분 미만')
, ('평영', '상급', '기술', '평영 대시를 할 수 있다.')
-- 접영
, ('접영', '초급', '거리', '100m 미만')
, ('접영', '초급', '속도', '1분 10초 이상')
, ('접영', '초급', '기술', '양팔 접영을 할 수 있다.')
, ('접영', '중급', '거리', '300m 미만')
, ('접영', '중급', '속도', '1분 10초 미만')
, ('접영', '중급', '기술', '2번 팔 동작 후 1번 호흡 패턴을 유지할 수 있다.')
, ('접영', '상급', '거리', '300m 이상')
, ('접영', '상급', '속도', '50초 미만')
, ('접영', '상급', '기술', '장비없이 무호흡으로 접영 25m를 완주할 수 있다.');
-- level_log
INSERT INTO level_log (oauth_login_id, oauth_login_platform, lc_training_name, user_level, created, updated) VALUES
('tgk@gmail.com', 'google', '자유형', '초급', '2024-06-01 09:12:22', '2024-06-01 09:12:22'),
('tgk@gmail.com', 'google', '자유형', '중급', '2024-06-02 11:25:30', '2024-06-02 11:25:30'),
('redfox9202@gmail.com', 'google', '배영', '초급', '2024-06-03 09:55:33', '2024-06-03 09:55:33'),
('redfox9202@gmail.com', 'google', '배영', '중급', '2024-06-04 12:15:40', '2024-06-04 12:15:40'),
('emkbjh@gmail.com', 'google', '평영', '상급', '2024-06-05 10:30:22', '2024-06-05 10:30:22'),
('redfox9202@gmail.com', 'google', '자유형', '초급', '2024-06-06 09:45:18', '2024-06-06 09:45:18'),
('redfox9202@gmail.com', 'google', '자유형', '중급', '2024-06-07 11:20:25', '2024-06-07 11:20:25'),
('tgk@gmail.com', 'google', '배영', '초급', '2024-06-08 13:22:30', '2024-06-08 13:22:30'),
('tgk@gmail.com', 'google', '배영', '중급', '2024-06-09 15:45:35', '2024-06-09 15:45:35'),
('redfox9202@gmail.com', 'google', '접영', '초급', '2024-06-10 08:55:45', '2024-06-10 08:55:45'),
('redfox9202@gmail.com', 'google', '접영', '중급', '2024-06-11 10:10:20', '2024-06-11 10:10:20'),
('emkbjh@gmail.com', 'google', '자유형', '초급', '2024-06-12 11:25:12', '2024-06-12 11:25:12'),
('emkbjh@gmail.com', 'google', '자유형', '중급', '2024-06-13 12:45:50', '2024-06-13 12:45:50');

-- level
-- 첫 번째 기록을 level 테이블에 삽입
INSERT INTO level (levellog_id, oauth_login_id, oauth_login_platform, created, updated)
SELECT levellog_id, oauth_login_id, oauth_login_platform, created, updated
FROM level_log
WHERE (oauth_login_id, oauth_login_platform, lc_training_name, created) IN (
	SELECT oauth_login_id, oauth_login_platform, lc_training_name, MIN(created)
	FROM level_log
	GROUP BY oauth_login_id, oauth_login_platform, lc_training_name
);

# 테이블 생성부터 적용해야하는데 sql문으로 적용하는 코드라 원활하지 못함
# -- 두 번째 기록부터는 level 테이블의 기존 데이터를 업데이트
# UPDATE level l
# 	JOIN (
# 		SELECT levellog_id, oauth_login_id, oauth_login_platform, lc_training_name, created, updated
# 		FROM level_log
# 		WHERE (oauth_login_id, oauth_login_platform, lc_training_name, created) NOT IN (
# 			SELECT oauth_login_id, oauth_login_platform, lc_training_name, MIN(created)
# 			FROM level_log
# 			GROUP BY oauth_login_id, oauth_login_platform, lc_training_name
# 		)
# 	) ll
# 	ON l.oauth_login_id = ll.oauth_login_id
# 			AND l.oauth_login_platform = ll.oauth_login_platform
# SET l.levellog_id = ll.levellog_id,
# 		l.updated = ll.updated
# WHERE l.oauth_login_id = ll.oauth_login_id
# 	AND l.oauth_login_platform = ll.oauth_login_platform;
