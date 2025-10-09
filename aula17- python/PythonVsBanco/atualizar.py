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

id = input("Digite o ID do produto que deseja atualizar: ")

nome = input("Informe o novo nome do produto: ")
descricao = input("Informe a nova descricao: ")
preco = input("Informe o novo preco do produto: ")
quantidade_estoque = input("Informe a nova quantidade em estoque: ")
data_cadastro = input("Informe a nova data de cadastro (aaaa-mm-dd): ")
ativo = input("Está ativo? Digite 1 para sim ou 0 para não: ")

sql = "UPDATE produto SET nome = %s, descricao = %s, preco = %s, quantidade_estoque = %s, data_cadastro = %s, ativo = %s WHERE id_produto = %s"

val = (nome, descricao, preco, quantidade_estoque, data_cadastro, ativo, id)

cursor.execute(sql, val)

conn.commit()

print(cursor.rowcount, "registro(s) atualizado(s) com sucesso!")
