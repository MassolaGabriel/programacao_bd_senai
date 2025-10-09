import  mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="senai",
    database="senai"
)

if conn.is_connected():
    print("Conectado!")

sql = "SELECT * FROM produto;"


cursor = conn.cursor()
cursor.execute(sql)
dados = cursor.fetchall()

for dado in dados:
    print(dado[1], dado[3])

