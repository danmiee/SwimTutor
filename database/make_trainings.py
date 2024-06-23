import mysql.connector
import json

# 데이터베이스 접속 정보를 불러옵니다.
def load_secrets():
    with open('security.json', 'r') as file:
        return json.load(file)

# 데이터베이스에 연결을 시도합니다.
def connect_database(secrets):
    try:
        connection = mysql.connector.connect(
            host=secrets['DB_HOST'],
            user=secrets['DB_USER'],
            password=secrets['DB_PASS'],
            database=secrets['DB_NAME']
        )
        print(f"Successfully connected to the database: {secrets['DB_HOST']}")
        return connection
    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

# SQL 삽입문을 실행합니다.
def execute_inserts(connection, insert_statements):
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

# 데이터베이스 연결을 종료합니다.
def close_connection(connection):
    connection.close()
    print("Database connection closed.")

# 사용자 레벨, 거리, 세트 수에 따라 트레이닝 레벨을 결정합니다.
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

# SQL 삽입문을 생성합니다.
def generate_sql_inserts():
    training_names = {'자유형': 'FC', '배영': 'BK', '평영': 'BR', '접영': 'BF'}
    user_levels = {'초급': 'B', '중급': 'I', '상급': 'A'}
    training_levels = {'쉬움': 'E', '보통': 'N', '어려움': 'D'}
    user_level_max_distances = {'B': 500, 'I': 1000, 'A': 1500}
    user_level_max_sets = {'B': 10, 'I': 20, 'A': 30}
    sql_statements = []
    training_id_counters = {}

    for name, name_code in training_names.items():
        for level, level_code in user_levels.items():
            for training_lvl, training_lvl_code in training_levels.items():
                training_id_counter_key = (name_code, level_code, training_lvl_code)
                max_distance = user_level_max_distances[level_code]
                max_sets = user_level_max_sets[level_code]

                for distance in range(50, max_distance + 50, 50):
                    set_options = [1] if distance == max_distance else range(1, max_sets + 1)
                    for sets in set_options:
                        if training_id_counter_key not in training_id_counters:
                            training_id_counters[training_id_counter_key] = 1
                        else:
                            training_id_counters[training_id_counter_key] += 1
                        training_level, level_code_used = determine_training_level(level, distance, sets, max_distance, max_sets)
                        training_id = f"{name_code}{level_code}{level_code_used}{training_id_counters[training_id_counter_key]:04d}"
                        sql_statement = f"INSERT INTO training (training_id, training_name, user_level, training_level, distance, sets) VALUES ('{training_id}', '{name}', '{level}', '{training_level}', {distance}, {sets});"
                        sql_statements.append(sql_statement)

    return sql_statements

# 주요 기능을 실행하는 메인 함수입니다.
def main():
    secrets = load_secrets()
    connection = connect_database(secrets)
    if connection:
        insert_statements = generate_sql_inserts()
        execute_inserts(connection, insert_statements)
        close_connection(connection)

if __name__ == "__main__":
    main()
