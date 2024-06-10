import pyzipper
import pandas as pd
import os

# 압축 파일 경로 및 암호
zip_file_path = 'C:/Users/redfo/sesac/samsungcloud_gk000044495274_20240603_access.zip'
# zip_file_path = 'C:/Users/redfo/sesac/samsunghealth_gk000044495274_20240603_access.zip'
unzip_path = 'C:/Users/redfo/sesac/samsungcloud'
# unzip_path = 'C:/Users/redfo/sesac/samsunghealth'
os.makedirs(unzip_path, exist_ok=True)
zip_password = 'lwXJtpK64l'  # 여기서 암호를 설정합니다

# 압축 파일 열기 및 해제
with pyzipper.AESZipFile(zip_file_path) as zip_ref:
	zip_ref.pwd = bytes(zip_password, 'utf-8')
	zip_ref.extractall(unzip_path)

# 제외된 파일 목록
excluded_files = []

# 모든 CSV 파일을 변환
for root, _, files in os.walk(unzip_path):
	for file in files:
		if file.endswith('.csv'):
			csv_file_path = os.path.join(root, file)
			
			try:
				# 다양한 구분자를 시도하여 CSV 파일을 읽기
				df = pd.read_csv(csv_file_path, encoding='utf-8')

				# DataFrame을 JSON 형식으로 변환
				json_data = df.to_json(orient='records', force_ascii=False)
				
				# JSON 데이터에서 "["를 "[["로, "]"를 "]]"로 변환
				if '"[' in json_data or ']"' in json_data:
					json_data = json_data.replace('"[', '[').replace(']"', ']')
					json_data = json_data.replace('"{', '{').replace('}"', '}')
					json_data = json_data.replace('\\"', '"')

				# JSON 파일 이름 설정
				json_file_name = os.path.splitext(file)[0] + '.json'
				json_file_path = os.path.join(root, json_file_name)
				
				# JSON 데이터를 파일로 저장
				with open(json_file_path, 'w', encoding='utf-8') as json_file:
					json_file.write(json_data)

			except (pd.errors.ParserError, UnicodeDecodeError):
				# 실패하면 제외된 파일 목록에 추가
				excluded_files.append(csv_file_path)

# 제외된 파일 목록 출력
print(excluded_files)