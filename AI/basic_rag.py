import os
from fastapi import FastAPI
from pydantic import BaseModel
import openai
from langchain.chat_models import ChatOpenAI
from langchain.chains import LLMChain
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from langchain_core.runnables import RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser

openai.__version__

# 질문 템플릿 형식 정의
template = """
{stroke}의 경우 50분 동안 완주할 수 있는 거리는 {distance} 50m 완주 시 소요되는 시간은 {speed} 기술적인 부분 중 본인이 가장 최근에 배운 것은 {technique}입니다.
나의 수영 레벨과 산정 이유를 알려주세요.
"""

# 템플릿 완성
prompt = PromptTemplate.from_template(template)
prompt

# llm 객체 생성
llm = ChatOpenAI(
    temperature=0.1,  # 창의성 (0.0 ~ 2.0)
    max_tokens=2048,  # 최대 토큰수
    model_name="gpt-4o-mini",  # 모델명
)

llm_chain = LLMChain(prompt=prompt, llm=llm)

# 데이터베이스 접속 정보 불러오기
def load_secrets():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, '../test-security.json')
    # file_path = os.path.join(script_dir, '../security.json')
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

def get_llm_model(name="llama3.1:70b"):

  return llm
    
######################

TEMPLATE = """Answer the question based only on the following context:
              {context} 
              Question: {question} 
              """
PROMPT = PromptTemplate.from_template(TEMPLATE)



# Pydantic model to define the expected structure of the JSON payload
class Query(BaseModel):
    prompt: str

app = FastAPI()

@app.post("/prompt/")
async def create_item(item: Query):
    chain = (
        {"context": get_oracle_retriever(), 
         "question": RunnablePassthrough()}
        | PROMPT
        | get_llm_model()
        | StrOutputParser())
    
    response = chain.invoke(item.prompt)
    return {"completion": response}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)