import mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="senai",
    database="senai"
)

if conn.is_connected():
    print("Conectado com sucesso!")

cursor = conn.cursor()

id = input("Digite o id do que deletaremos: ")

sql = f"""
        DELETE FROM produto WHERE id={id};
"""

cursor.execute(sql)
conn.commit()

print(cursor.rowcount, "Produto deletado com sucesso!")
cursor.close()
conn.close()
