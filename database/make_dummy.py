import mysql.connector
import json
import random
import datetime
import os

# 입력 가능 목록
ids =[
#   'tgk2541@gmail.com',
  'ekmbjh@gmail.com',
  'redfox9202@gmail.com'
]
platform = 'google'
strokes = [
  '자유형',
  '배영',
  '평영',
  '접영'
]
levels = [
  '초급',
  '중급',
  '상급'
]
training_names = {'자유형': 'FC', '배영': 'BK', '평영': 'BR', '접영': 'BF'}
user_levels = {'초급': 'B', '중급': 'I', '상급': 'A'}
training_levels = {'쉬움': 'E', '보통': 'N', '어려움': 'D'}

# 생성일시
start_date = datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S')
end_date = datetime.datetime.strptime('2024-08-01 00:00:00', '%Y-%m-%d %H:%M:%S')
delta_seconds = int((end_date - start_date).total_seconds())

# 레벨 로그 입력
def generate_level_log():
    oauth_login_id = random.choice(ids)
    oauth_login_platform = platform
    lc_training_name = random.choice(strokes)
    user_level = random.choice(levels)
    random_seconds = random.randint(0, delta_seconds)
    created = start_date + datetime.timedelta(seconds=random_seconds)
    return [oauth_login_id, oauth_login_platform, lc_training_name, user_level, created]

def generate_sql_inserts_level_log():
    # print('generate_sql_inserts_level_log')
    insert_statements = []
    for _ in range(15):
        level_log = generate_level_log()
        insert_statement = f"""
          INSERT INTO level_log (
            oauth_login_id, oauth_login_platform, lc_training_name, user_level, created, updated
            ) VALUES (
            '{level_log[0]}', '{level_log[1]}', '{level_log[2]}', '{level_log[3]}', '{level_log[4]}', '{level_log[4]}'
            );
          """
        # print('insert_statement:', insert_statement)
        insert_statements.append(insert_statement)
    return insert_statements

# 루틴 이름 샘플 로드
def load_names():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, 'json/routine_names.json')
    with open(file_path, 'r') as file:
        return json.load(file)

# 루틴 입력 - 유저별 routine_no 관리
def generate_routine(cursor):
    statements = []
    for user_id in ids:
        oauth_login_id = user_id
        # print('oauth_login_id:', oauth_login_id)

        cursor.execute(f"SELECT MAX(routine_no) AS max_routine_no FROM routine WHERE oauth_login_id = '{oauth_login_id}'")
        max_routine_no = cursor.fetchone()[0]
        if max_routine_no is None:
            max_routine_no = 0
        # print('max_routine_no:', max_routine_no)

        cursor.execute(f"SELECT lc_training_name FROM level WHERE oauth_login_id = '{oauth_login_id}'")
        result = cursor.fetchall()
        stroke_names = []
        for row in result:
            stroke_name = row[0]
            stroke_names.append(stroke_name)
        # print('stroke_names:', stroke_names)

        if len(stroke_names) == 0:
            continue

        for _ in range(random.randint(10, 15)):
            routine_no = max_routine_no + 1
            max_routine_no += 1
            oauth_login_platform = platform
            routine_names = load_names()['titles']
            routine_name = str(random.choice(routine_names))
            pool_length = random.choice([25, 50])
            target_distance = random.randint(500, 5000)
            target_distance = int(target_distance / 100) * 100
            sel_strokes = random.sample(stroke_names, random.randint(1, len(stroke_names)))
            sel_strokes = ', '.join(sel_strokes)
            random_seconds = random.randint(0, delta_seconds)
            created = start_date + datetime.timedelta(seconds=random_seconds)
            statements.append([routine_no, oauth_login_id, oauth_login_platform, routine_name, pool_length, target_distance, sel_strokes, created])
        # print('statements:', statements)
    return statements

def generate_sql_inserts_routine(cursor):
    print('generate_sql_inserts_routine')
    insert_statements = []
    try:
        for routine in generate_routine(cursor):
            print('routine:', routine)
            insert_statement = f"""
                INSERT INTO routine (routine_no, oauth_login_id, oauth_login_platform, 
                routine_name, pool_length, target_distance, sel_strokes, created, updated
                ) VALUES (
                {routine[0]}, '{routine[1]}', '{routine[2]}', '{routine[3]}', {routine[4]}, {routine[5]}, '{routine[6]}', '{routine[7]}', '{routine[7]}');
                """
            insert_statements.append(insert_statement)
        # print('insert_statements:', insert_statements)
        return insert_statements
    except:
        print('Error generating routine data')

# 루틴 상세 입력 - 유저별 routine_no 관리
def generate_training_for_routine(cursor):
    training_for_routine_list = []
    cursor.execute(f"""
        WITH LatestRoutine AS (
            SELECT oauth_login_id, MAX(routine_no) AS routine_no, MAX(created) AS created
            FROM routine
            GROUP BY oauth_login_id
        ),
        LatestTrainingForRoutine AS (
            SELECT oauth_login_id, MAX(routine_no) AS routine_no
            FROM training_for_routine
            GROUP BY oauth_login_id
        ),
        LatestLevelLog AS (
            SELECT oauth_login_id, MAX(user_level) AS user_level, MAX(created) AS created
            FROM level_log
            GROUP BY oauth_login_id
        )
        SELECT 
            r.oauth_login_id, r.sel_strokes, r.target_distance, r.pool_length,
            lr.routine_no AS lr_routine_no, lr.created AS lr_created, 
            ltfr.routine_no AS ltfr_routine_no,
            lll.user_level, lll.created AS lll_created
        FROM routine r
        JOIN LatestRoutine lr
            ON r.oauth_login_id = lr.oauth_login_id 
            AND r.routine_no = lr.routine_no
        LEFT JOIN LatestTrainingForRoutine ltfr
            ON r.oauth_login_id = ltfr.oauth_login_id
            AND r.routine_no = ltfr.routine_no
        LEFT JOIN LatestLevelLog lll
            ON r.oauth_login_id = lll.oauth_login_id
    """)
    results = cursor.fetchall()
    # print('results:', results)

    for result in results:
        # print('result:', result)
        lr_routine_no = result[4] if result[4] is not None else 0
        tfr_routine_no = result[6] if result[6] is not None else 0

        for no in range(tfr_routine_no, lr_routine_no):
            routine_no = no + 1
            oauth_login_id = result[0]
            oauth_login_platform = platform
            created = result[5]

            sel_strokes = result[1].split(', ')
            sel_stroke = training_names.get(random.choice(sel_strokes))

            # routine에 관련 정보가 있는지 확인하는 쿼리
            cursor.execute(f"""
                SELECT COUNT(*) 
                FROM routine 
                WHERE routine_no = {routine_no} 
                AND oauth_login_id = '{oauth_login_id}' 
                AND oauth_login_platform = '{oauth_login_platform}';
            """)
            isRoutineExist = cursor.fetchone()[0]
            
            user_level = result[7]
            user_level = user_levels.get(user_level)

            training_level = ''

            for session in ['워밍업', '코어', '쿨다운']:
                if session == '워밍업':
                    repeat = random.randint(1, 2)
                    training_level = 'E'
                elif session == '코어':
                    repeat = random.randint(4, 6)
                    middle_index = repeat // 2
                else:
                    repeat = 1
                    training_level = 'E'

                for i in range(repeat):
                    if session == '코어' and i == middle_index:
                        training_level = 'D'
                    elif session == '코어':
                        training_level = 'N'
                    training_id = f"{sel_stroke}{user_level}{training_level}{str(random.randint(0, 1092)).zfill(4)}"
                    training_for_routine = [routine_no, oauth_login_id, oauth_login_platform, session, training_id, created]

                    cursor.execute(f"""
                        SELECT COUNT(*)
                        FROM training
                        WHERE training_id = '{training[4]}';
                    """)
                    isTrainingExist = cursor.fetchone()[0]

                    exists = isRoutineExist and isTrainingExist

                    if exists:
                    print('training_for_routine:', training_for_routine)
                    training_for_routine_list.append(training_for_routine)
    return training_for_routine_list

def generate_sql_inserts_training_for_routine(cursor):
    # print('generate_sql_inserts_training_for_routine')
    training_for_routine = generate_training_for_routine(cursor)
    insert_statements = []
    for training in training_for_routine:
        print('training:', training)

        insert_statement = cursor.execute(f"""
            INSERT INTO training_for_routine (routine_no, oauth_login_id, oauth_login_platform, session, training_id, created, updated) 
            VALUES ({training[0]}, '{training[1]}', '{training[2]}', '{training[3]}', '{training[4]}', '{training[5]}', '{training[5]}');
        """)
        insert_statements.append(insert_statement)
        print('insert_statements:', insert_statements)
    return insert_statements

def load_secrets():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    # file_path = os.path.join(script_dir, 'test-security.json')
    file_path = os.path.join(script_dir, 'security.json')
    with open(file_path, 'r') as file:
        return json.load(file)

def connect_database(secrets):
    try:
        connection = mysql.connector.connect(
            host=secrets['DB_HOST'],
            user=secrets['DB_USER'],
            password=secrets['DB_PASS'],
            database=secrets['DB_NAME'],
            buffered=True  # 커서를 버퍼링하도록 설정
        )
        print(f"Successfully connected to the database: {secrets['DB_HOST']}")
        return connection
    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

def execute_inserts(connection, cursor, insert_statements):
    try:
        for statement in insert_statements:
            cursor.execute(statement)
        connection.commit()
        print(f"Successfully executed {len(insert_statements)} insert statements.")
    except mysql.connector.Error as e:
        connection.rollback()
        print(f"Error executing insert statements: {e}")

def close_connection(connection):
    if connection is not None:
        connection.close()
        print("Database connection closed.")

def main():
    secrets = load_secrets()
    connection = connect_database(secrets)

    if connection is not None:
        cursor = connection.cursor()
        
        # # # level_log 테이블 데이터 삽입
        # level_log_insert_statements = generate_sql_inserts_level_log()
        # execute_inserts(connection, cursor, level_log_insert_statements)

        # routine 테이블 데이터 삽입
        # routine_insert_statements = generate_sql_inserts_routine(cursor)
        # execute_inserts(connection, cursor, routine_insert_statements)

        # training_for_routine 테이블 데이터 삽입
        training_for_routine_insert_statements = generate_sql_inserts_training_for_routine(cursor)
        execute_inserts(connection, cursor, training_for_routine_insert_statements)

        cursor.close()
        close_connection(connection)

if __name__ == "__main__":
    main()
