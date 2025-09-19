create table cliente(
	id int primary key not null auto_increment,
    nome varchar(20) not null,
    sobrenome varchar(40) not null,
    fk_id_endereco int not null,
    fk_id_telefone int not null,
    fk_id_email int not null
);

create table endereco(
	id int primary key not null auto_increment,
    fk_id_cliente int not null,
    rua varchar(30),
    numero varchar(30),
    bairro varchar(30),
    cidade varchar(30),
    estado varchar(30)
);

create table telefone(
	id int primary key not null auto_increment,
    fk_id_cliente int not null,
    numero varchar(13)
);

create table email(
	id int primary key not null auto_increment,
    fk_id_cliente int not null,
    email varchar(40)
);

create table produto(
	id int primary key not null auto_increment,
    descricao varchar(100),
    preco_unitario decimal(10,2) not null
);

create table meio_pagamento(
	id int primary key not null auto_increment,
    meio_pagamento enum()
)



