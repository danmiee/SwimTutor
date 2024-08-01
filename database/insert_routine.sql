INSERT INTO routine (oauth_login_id, oauth_login_platform, routine_name, pool_length, target_distance, sel_strokes, created, updated) VALUES
# ('tgk2541@gmail.com', 'google', 'Morning Swim', 25, 1000, '자유형, 배영', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
# ('tgk2541@gmail.com', 'google', 'Evening Swim', 50, 1500, '자유형', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
('redfox9202@gmail.com', 'google', 'Rehab Routine', 25, 1000, '배영', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
('redfox9202@gmail.com', 'google', 'Morning Routine', 25, 1200, '자유형, 접영', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
# ('ekmbjh@gmail.com', 'google', 'Weight Loss Program', 50, 2000, '평영, 자유형', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
('redfox9202@gmail.com', 'google', 'Endurance Swim', 25, 2500, '자유형', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
('redfox9202@gmail.com', 'google', 'Fitness Routine', 50, 1200, '접영, 자유형', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
# ('tgk2541@gmail.com', 'google', 'Evening Swim', 50, 1500, '자유형', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
('redfox9202@gmail.com', 'google', 'Morning Swim', 25, 1000, '자유형, 접영', '2024-06-01 07:25:44', '2024-06-01 07:25:44')
# ('ekmbjh@gmail.com', 'google', 'Muscle Building', 50, 2000, '평영', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
# ('ekmbjh@gmail.com', 'google', 'Cardio Session', 25, 2500, '자유형, 배영', '2024-06-06 11:42:30', '2024-06-06 11:42:30')
;

-- training_for_routine
INSERT INTO training_for_routine (routine_no, oauth_login_id, oauth_login_platform, session, training_id, created, updated) VALUES
# -- tgk2541@gmail.com - Morning Swim
# (1, 'tgk2541@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
# (1, 'tgk2541@gmail.com', 'google', '코어', 'fcbn0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
# (1, 'tgk2541@gmail.com', 'google', '코어', 'fcbn0002', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
# (1, 'tgk2541@gmail.com', 'google', '코어', 'fcbd0001', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
# (1, 'tgk2541@gmail.com', 'google', '쿨다운', 'fcbe0003', '2024-05-31 07:12:12', '2024-05-31 07:12:12'),
#
# -- tgk2541@gmail.com - Evening Swim
# (2, 'tgk2541@gmail.com', 'google', '워밍업', 'fcbe0002', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
# (2, 'tgk2541@gmail.com', 'google', '코어', 'fcbn0003', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
# (2, 'tgk2541@gmail.com', 'google', '코어', 'fcbd0002', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
# (2, 'tgk2541@gmail.com', 'google', '코어', 'fcbd0003', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
# (2, 'tgk2541@gmail.com', 'google', '쿨다운', 'fcbe0001', '2024-06-01 09:34:10', '2024-06-01 09:34:10'),
#
-- redfox9202@gmail.com - Rehab Routine
(1, 'redfox9202@gmail.com', 'google', '워밍업', 'bkbe0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(1, 'redfox9202@gmail.com', 'google', '코어', 'bkbn0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(1, 'redfox9202@gmail.com', 'google', '코어', 'bkbn0002', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(1, 'redfox9202@gmail.com', 'google', '코어', 'bkbd0001', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),
(1, 'redfox9202@gmail.com', 'google', '쿨다운', 'bkbe0002', '2024-05-30 06:55:18', '2024-05-30 06:55:18'),

-- redfox9202@gmail.com - Morning Routine
(2, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(2, 'redfox9202@gmail.com', 'google', '코어', 'fcin0001', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(2, 'redfox9202@gmail.com', 'google', '코어', 'bfid0002', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(2, 'redfox9202@gmail.com', 'google', '코어', 'bfid0003', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
(2, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-05-31 08:25:10', '2024-05-31 08:25:10'),
#
# -- ekmbjh@gmail.com - Weight Loss Program
# (1, 'ekmbjh@gmail.com', 'google', '워밍업', 'brbe0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
# (1, 'ekmbjh@gmail.com', 'google', '코어', 'fcbn0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
# (1, 'ekmbjh@gmail.com', 'google', '코어', 'brbd0001', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
# (1, 'ekmbjh@gmail.com', 'google', '코어', 'brbd0002', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),
# (1, 'ekmbjh@gmail.com', 'google', '쿨다운', 'brbe0002', '2024-06-01 14:12:19', '2024-06-01 14:12:19'),

-- redfox9202@gmail.com - Endurance Swim
(3, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'fcid0001', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'fcid0002', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(3, 'redfox9202@gmail.com', 'google', '코어', 'fcid0003', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),
(3, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-03 10:20:28', '2024-06-03 10:20:28'),

-- redfox9202@gmail.com - Fitness Routine
(4, 'redfox9202@gmail.com', 'google', '워밍업', 'bfbe0001', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'bfid0001', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'bfid0002', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(4, 'redfox9202@gmail.com', 'google', '코어', 'bfid0003', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
(4, 'redfox9202@gmail.com', 'google', '쿨다운', 'bfbe0002', '2024-06-04 18:05:30', '2024-06-04 18:05:30'),
#
# -- tgk2541@gmail.com - Evening Swim
# (3, 'tgk2541@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
# (3, 'tgk2541@gmail.com', 'google', '코어', 'fcbn0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
# (3, 'tgk2541@gmail.com', 'google', '코어', 'fcbn0002', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
# (3, 'tgk2541@gmail.com', 'google', '코어', 'fcbd0001', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
# (3, 'tgk2541@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-02 20:22:15', '2024-06-02 20:22:15'),
#
-- redfox9202@gmail.com - Morning Swim
(5, 'redfox9202@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(5, 'redfox9202@gmail.com', 'google', '코어', 'fcid0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(5, 'redfox9202@gmail.com', 'google', '코어', 'bfid0001', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(5, 'redfox9202@gmail.com', 'google', '코어', 'fcid0002', '2024-06-01 07:25:44', '2024-06-01 07:25:44'),
(5, 'redfox9202@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-01 07:25:44', '2024-06-01 07:25:44')
#
# -- ekmbjh@gmail.com - Muscle Building
# (2, 'ekmbjh@gmail.com', 'google', '워밍업', 'brbe0001', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
# (2, 'ekmbjh@gmail.com', 'google', '코어', 'brin0001', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
# (2, 'ekmbjh@gmail.com', 'google', '코어', 'brin0002', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
# (2, 'ekmbjh@gmail.com', 'google', '코어', 'brin0003', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
# (2, 'ekmbjh@gmail.com', 'google', '쿨다운', 'brbe0002', '2024-06-05 09:15:50', '2024-06-05 09:15:50'),
#
# -- ekmbjh@gmail.com - Cardio Session
# (3, 'ekmbjh@gmail.com', 'google', '워밍업', 'fcbe0001', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
# (3, 'ekmbjh@gmail.com', 'google', '코어', 'fcid0001', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
# (3, 'ekmbjh@gmail.com', 'google', '코어', 'fcid0002', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
# (3, 'ekmbjh@gmail.com', 'google', '코어', 'fcid0003', '2024-06-06 11:42:30', '2024-06-06 11:42:30'),
# (3, 'ekmbjh@gmail.com', 'google', '쿨다운', 'fcbe0002', '2024-06-06 11:42:30', '2024-06-06 11:42:30')
;
