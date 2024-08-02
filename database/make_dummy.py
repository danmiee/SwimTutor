import mysql.connector
import json
import random
import datetime
import os

# 입력 가능 목록
ids =[
  'tgk2541@gmail.com',
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

# 생성일시
start_date = datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S')
end_date = datetime.datetime.strptime('2024-08-01 00:00:00', '%Y-%m-%d %H:%M:%S')
delta_seconds = int((end_date - start_date).total_seconds())
random_seconds = random.randint(0, delta_seconds)

create_time = start_date + datetime.timedelta(seconds=random_seconds)

# 입력해야할 데이터

## level_log
### Level Log 테이블에 삽입할 데이터 생성
def generate_level_log():
    oauth_login_id = random.choice(ids)
    oauth_login_platform = platform
    lc_training_name = random.choice(strokes)
    user_level = random.choice(levels)
    created = create_time
    return [oauth_login_id, oauth_login_platform, lc_training_name, user_level, created]

### SQL 삽입문 생성
def generate_sql_inserts_level_log():
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
        insert_statements.append(insert_statement)
    # print(insert_statements)
    return insert_statements

## routine
# Load JSON file
def load_names():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, 'json/routine_names.json')
    with open(file_path, 'r') as file:
        return json.load(file)

### Routine 테이블에 삽입할 데이터 생성
def generate_routine():
    statements = []
    for user_id in ids:
        oauth_login_id = user_id
        for _ in range(random.randint(15, 25)):
            routine_no = _ + 1
            oauth_login_platform = platform
            routine_names = load_names()['titles']
            routine_name = str(random.choice(routine_names))
            pool_length = random.choice([25, 50])
            target_distance = random.randint(500, 5000)
            target_distance = int(target_distance / 100) * 100
            sel_strokes = random.sample(strokes, random.randint(1, len(strokes)))
            created = datetime.datetime.strptime(random.choice([
                str(datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S') + datetime.timedelta(
                    seconds=random.randint(0, int((
                        datetime.datetime.strptime('2024-08-01 00:00:00', '%Y-%m-%d %H:%M:%S') 
                        - datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S')
                    ).total_seconds()))
                ))
            ]), '%Y-%m-%d %H:%M:%S')
            updated = created
            statements.append([routine_no, oauth_login_id, oauth_login_platform, routine_name, pool_length, target_distance, sel_strokes, created, updated])
    return statements

### SQL 삽입문 생성
def generate_sql_inserts_routine():
    for routine in generate_routine():
        insert_statements = []
        # 디버깅을 위해 target_distance 출력
        print(f"Debug - target_distance: {type(routine[5])}")
        insert_statement = f"""
            INSERT INTO routine (routine_no, oauth_login_id, oauth_login_platform, 
            routine_name, pool_length, target_distance, sel_strokes, created, updated
            ) VALUES (
            {routine[0]}, '{routine[1]}', '{routine[2]}', '{routine[3]}', {routine[4]}, {routine[5]}, '{routine[6]}', {routine[7]}, {routine[8]});
            """
        insert_statements.append(insert_statement)
    print(insert_statements)
    return insert_statements

## training_for_routine
training_names = {'자유형': 'FC', '배영': 'BK', '평영': 'BR', '접영': 'BF'}
user_levels = {'초급': 'B', '중급': 'I', '상급': 'A'}
training_levels = {'쉬움': 'E', '보통': 'N', '어려움': 'D'}

### Training for Routine 테이블에 삽입할 데이터 생성
def generate_training_for_routine(cursor):
  training_for_routine_list = []

  for routine_no in range(1, 81):
    # Fetching sel_strokes from routine table for the same routine_no
    cursor.execute(f"SELECT sel_strokes FROM routine WHERE routine_no = {routine_no}")
    result = cursor.fetchone()
    print(result)
    
    # sel_strokes = cursor.fetchone()[0].get('sel_strokes')
    # user_level = user_levels.get(cursor.fetchone()[0].get('user_level'))

    sel_stroke = random.choice(sel_strokes)
    training_name = training_names.get(sel_stroke)

    oauth_login_id = random.choice(ids)
    oauth_login_platform = platform
    created = datetime.datetime.strptime(random.choice([
        str(datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S') + datetime.timedelta(
            seconds=random.randint(0, int((
                datetime.datetime.strptime('2024-08-01 00:00:00', '%Y-%m-%d %H:%M:%S')
                - datetime.datetime.strptime('2024-05-18 00:00:00', '%Y-%m-%d %H:%M:%S')
            ).total_seconds()))
        ))
    ]), '%Y-%m-%d %H:%M:%S')

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

      for _ in range(repeat):
          if session == '코어':
            if _ == middle_index:
              training_level = 'D'
            else:
              training_levels = 'N'
          training_id = training_name + user_level + training_level + str(random.randint(0, 1092)).zfill(4)
          training_for_routine_list.append([routine_no, oauth_login_id, oauth_login_platform, session, training_id, created])
  return training_for_routine_list

### SQL 삽입문 생성
def generate_sql_inserts_training_for_routine():
  training_for_routine = generate_training_for_routine()
  # training_for_routine을 반복문으로 돌려서 insert_statements에 추가
  insert_statements = []
  for training_for_routine in training_for_routine:
    insert_statement = f"INSERT INTO training_for_routine (routine_no, oauth_login_id, oauth_login_platform, session, training_id, created) VALUES ({training_for_routine[0]}, '{training_for_routine[1]}', '{training_for_routine[2]}', '{training_for_routine[3]}', '{training_for_routine[4]}', '{training_for_routine[5]}');"
    insert_statements.append(insert_statement)
  return insert_statements

# 데이터베이스 접속 정보 불러오기
def load_secrets():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, 'test-security.json')
    # file_path = os.path.join(script_dir, 'security.json')
    with open(file_path, 'r') as file:
        return json.load(file)

# 데이터베이스 연결
def connect_database(secrets):
    try:
        connection = mysql.connector.connect(
            host=secrets['DB_HOST'],
            user=secrets['DB_USER'],
            password=secrets['DB_PASS'],
            database=secrets['DB_NAME']
        )
        print(f"Successfully connected to the database: {secrets['DB_HOST']}")
    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL: {e}")
    return connection

# 입력된 SQL 문장을 실행
def execute_inserts(connection, insert_statements):
    if connection is not None:
        cursor = connection.cursor()
        print(cursor)
        try:
            for statement in insert_statements:
                print(statement)
                cursor.execute(statement)
            connection.commit()
            print(f"Successfully executed {len(insert_statements)} insert statements.")
        except mysql.connector.Error as e:
            connection.rollback()
            print(f"Error executing insert statements: {e}")
        finally:
            cursor.close()

# 데이터베이스 연결 종료
def close_connection(connection):
    if connection is not None:
        connection.close()
        print("Database connection closed.")


# 주요 기능을 실행하는 메인 함수
def main():
  # 데이터베이스 접속 정보 불러오기
  secrets = load_secrets()

  # 데이터베이스 연결
  connection = connect_database(secrets)

  # level_log 테이블 데이터 삽입
  level_log_insert_statements = generate_sql_inserts_level_log()
  execute_inserts(connection, level_log_insert_statements)

  # routine 테이블 데이터 삽입
#   routine_insert_statements = generate_sql_inserts_routine()
#   execute_inserts(connection, routine_insert_statements)

  # training_for_routine 테이블 데이터 삽입
#   training_for_routine_insert_statements = generate_sql_inserts_training_for_routine()
#   execute_inserts(connection, training_for_routine_insert_statements)

  # 데이터베이스 연결 종료
  close_connection(connection)

# 메인 함수 실행
if __name__ == "__main__":
    main()
