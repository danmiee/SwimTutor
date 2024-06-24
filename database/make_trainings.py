import mysql.connector
import json
# 데이터베이스 접속 정보 불러오기
def load_secrets():
    with open('security.json', 'r') as file:
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

def execute_inserts(connection, insert_statements):
    if connection is not None:
        cursor = connection.cursor()
        try:
            for statement in insert_statements:
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
# 사용자 레벨, 거리, 세트 수에 따라 트레이닝 레벨 결정
def determine_training_level(user_level, distance, sets, max_distance, max_sets):
    if distance == max_distance and sets == 1:
        return '보통', 'N'
    else:
        scale = distance / max_distance
        intensity = sets / max_sets
        if scale < 0.5:
            if intensity <= 0.33:
                return '쉬움', 'E'
            elif intensity <= 0.66:
                return '보통', 'N'
            else:
                return '어려움', 'D'
        elif scale < 0.75:
            if intensity <= 0.5:
                return '쉬움', 'E'
            else:
                return '보통', 'N'
        else:
            return '어려움', 'D'
# SQL 삽입문 생성
def generate_sql_inserts(training_names, user_levels, training_levels, user_level_max_distances, user_level_max_sets):
    sql_statements = []
    training_id_counters = {}
    used_ids = set()

    for name, name_code in training_names.items():
        for level, level_code in user_levels.items():
            for training_lvl, training_lvl_code in training_levels.items():
                for distance in range(50, user_level_max_distances[level_code] + 50, 50):
                    for sets in [1] if distance == user_level_max_distances[level_code] else range(1, user_level_max_sets[level_code] + 1):
                        training_level, level_code_used = determine_training_level(level, distance, sets, user_level_max_distances[level_code], user_level_max_sets[level_code])
                        training_id = f"{name_code}{level_code}{level_code_used}0001"
                        counter = 1
                        while training_id in used_ids:
                            counter += 1
                            training_id = f"{name_code}{level_code}{level_code_used}{counter:04d}"
                        used_ids.add(training_id)
                        sql_statement = f"INSERT INTO training (training_id, training_name, user_level, training_level, distance, sets) VALUES ('{training_id}', '{name}', '{level}', '{training_level}', {distance}, {sets});"
                        sql_statements.append(sql_statement)

    return sql_statements
# 주요 기능을 실행하는 메인 함수
def main():
    secrets = load_secrets()
    connection = connect_database(secrets)
    training_names = {'자유형': 'FC', '배영': 'BK', '평영': 'BR', '접영': 'BF'}
    user_levels = {'초급': 'B', '중급': 'I', '상급': 'A'}
    training_levels = {'쉬움': 'E', '보통': 'N', '어려움': 'D'}
    user_level_max_distances = {'B': 500, 'I': 1000, 'A': 1500}
    user_level_max_sets = {'B': 10, 'I': 20, 'A': 30}
    insert_statements = generate_sql_inserts(training_names, user_levels, training_levels, user_level_max_distances, user_level_max_sets)
    execute_inserts(connection, insert_statements)
    close_connection(connection)

if __name__ == "__main__":
    main()
