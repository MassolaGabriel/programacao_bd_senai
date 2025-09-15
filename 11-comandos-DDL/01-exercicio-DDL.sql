create database cinema_database;
use cinema_database;

create table filmes
(
	id int primary key auto_increment,
    titulo varchar(100) not null,
    diretor varchar(50),
    ano_lancamento char(4) not null,
    duracao_minutos int 
);

alter table filmes drop column diretor;

drop table filmes;

drop database cinema_database
