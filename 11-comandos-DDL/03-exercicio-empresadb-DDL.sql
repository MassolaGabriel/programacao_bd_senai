create database empresa_db;
use empresa_db;

create table funcionarios
(
	id int primary key auto_increment,
    nome varchar(100) not null,
    cargo varchar(50),
    data_admissao date,
    salario decimal(10,2)
);

insert into funcionarios (nome, cargo, data_admissao, salario) 
values 
("João da Silva", "Analista de TI", "2023-01-15", 4500.00),
( "Maria Souza", "Assistente Administrativo", "2022-09-02", 3000.50),
("Pedro Santos", "Gerente de Vendas", "2023-03-10", 6500.75),
("Ana Oliveira", "Engenheira de Produção", "2021-11-20", 5800.25),
("Lucas Mendes", "Analista Financeiro", "2022-05-07", 4000.00);

alter table funcionarios add column departamento varchar(50);

-- alterando salario func 3
update funcionarios set salario = 7000.00 where id = 3;

-- apagando registros func 2
delete from funcionarios where id = 2; 

-- Exclusão Da Coluna "Cargo" Na Tabela "Funcionarios":
alter table funcionarios drop column cargo;

-- Exclusão Da Tabela "Funcionarios":
drop table funcionarios;

-- Exclusão Do Banco De Dados:
drop database empresa_db;

select * from funcionarios;

