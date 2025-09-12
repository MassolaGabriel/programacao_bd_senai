-- --------------------------------
-- comandos DDL
-- --------------------------------
 -- CREATE DATABASE fatura;
use fatura;

CREATE TABLE cliente
(
	id int auto_increment primary key,
    nome varchar(30) not null,
    sobrenome varchar(30) not null
);

CREATE TABLE telefone
(
	id int auto_increment primary key,
    numero varchar(13) not null
);

CREATE TABLE endereco
(
	id int auto_increment primary key,
    cep varchar(13) not null,
    rua varchar (30) not null,
    numero varchar(5) not null,
    complemento varchar(50),
    estado char(2)
);

CREATE TABLE vendedor
(
	id int auto_increment primary key,
    nome varchar(20) not null
);

CREATE TABLE produto
(
	id int auto_increment primary key,
    descricao text not null,
    preco double not null
);

CREATE TABLE fatura
(
	id int auto_increment primary key,
    data_fatura date not null,
    data_vencimento date not null,
    subtotal double not null,
    imposto double not null,
    total_fatura double not null
);

CREATE TABLE itens_fatura
(
	id int auto_increment primary key,
    quantidade int not null,
    total_linha double not null
)