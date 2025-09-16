create database estoque_db;
use estoque_db;

create table produtos 
(
	id int auto_increment primary key,
    nome varchar(100) not null,
    preco decimal not null,
    quantidade int not null
);

insert into produtos(nome, preco, quantidade)
values ("Notebook", 3500.00, 10 );

insert into produtos(nome, preco, quantidade)
values ("Smartphone", 1200.50, 20 );

insert into produtos(nome, preco, quantidade)
values ("Impressora", 500.99, 5);

alter table produtos add column descricao varchar(200);

update produtos set preco = 3200.00 where id = 1;

alter table produtos drop column quantidade;

drop table produtos;

drop database estoque_db



