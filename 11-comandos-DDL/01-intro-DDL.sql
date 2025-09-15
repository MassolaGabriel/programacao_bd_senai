create database senai;

use senai;

create table produto
(
	codigo int primary key auto_increment,
    nome varchar(30) not null,
    preco decimal(10,2) not null,
    fk_categoria int not null,
    foreign key(fk_categoria) references categoria(codigo) 
);

drop table produto;

desc produto;

create table categoria
(
	codigo int primary key auto_increment,
	nome varchar(30) not null
)