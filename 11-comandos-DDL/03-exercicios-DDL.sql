create database senai;
use senai;

create table produto
(
	id int,
    nome varchar(5)
);

insert into produto(nome) values ("Abacaxi");
insert into produto(nome) values ("Maça");
insert into produto(nome, fk_categoria) values ("Pera", 1);

create table categoria 
(
	id int auto_increment primary key,
    nome varchar(20) not null,
    descricao varchar(100)
);

insert into categoria(nome, descricao) value("Frutas", "Frutas veganas do sul de Minas");
insert into categoria(nome, descricao) value("Verduras", "Verduras verdes veganas do sul de Minas");

desc produto;

alter table produto modify nome varchar(20);
alter table produto modify nome varchar(20) not null;
alter table produto modify id int primary key auto_increment;

alter table produto add column preco numeric(10,2) not null check(preco > 0) default 1;
alter table produto add column quantidade int not null check(quantidade >= 0) default 0 after nome;

alter table produto add column fk_categoria int;
alter table produto add constraint fk_cat foreign key(fk_categoria) references categoria(id);
alter table categoria change nome nome_categoria varchar(20) not null;

rename table categoria to categorias;

select * from produto;
select * from categorias;