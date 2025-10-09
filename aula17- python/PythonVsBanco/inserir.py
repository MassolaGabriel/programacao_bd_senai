import  mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="senai",
    database="senai"
)

if conn.is_connected():
    print("Conectado!")

nome = input("Informe o nome do produto: ")
descricao = input("Informe o descricao: ")
preco = input("Informe o preco do produto: ")
quantidade_estoque = input("Informe o quantidade de estoque: ")
data_cadastro = input("Informe o data de cadastro: (aaaa-mm-dd) ")
ativo = input("Está ativo 1 sim 0 não ")


cursor = conn.cursor()


sql = "INSERT INTO produto (nome, descricao, preco, quantidade_estoque, data_cadastro, ativo) VALUES (%s, %s, %s, %s, %s, %s);"

val = (nome, descricao, preco, quantidade_estoque, data_cadastro, ativo)

cursor.execute(sql, val)
conn.commit()

print(cursor.rowcount, "Produto inserido com sucesso!")
cursor.close()
conn.close()