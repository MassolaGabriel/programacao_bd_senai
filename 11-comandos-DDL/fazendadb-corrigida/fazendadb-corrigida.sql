create database fazenda_integrada ;
use fazenda_integrada ;

create table fornecedores_insumos
(
	id int auto_increment primary key,
	nome varchar(100) not null,
	contato varchar(100),
	telefone varchar(20)
);

create table insumos
(
	id int auto_increment primary key,
	nome varchar(100) not null,
	tipo enum('fertilizante', 'defensivo', 'semente', 'outros') not null,
	unidade_medida varchar(10),
	custo_unitario decimal(10,2) not null
);

create table culturas
(
	id int auto_increment primary key,
	nome_cultura varchar(50) not null unique,
	tempo_colheita_dias int,
	condicoes_ideais varchar(255)
);

create table aquipamentos
(
	id int auto_increment primary key,
	nome varchar(100) not null,
	tipo varchar(50),
	data_aquisicao date,
	status enum('ativo', 'manutencao', 'inativo') default 'ativo'
);

create table funcionarios
(
	id int auto_increment primary key,
	nome varchar(100) not null,
	funcao varchar(50),
	salario decimal(10,2) not null check(salario > 0),
	data_contratacao date
);

create table lotes_plantio
(
	id int auto_increment primary key,
	fk_cultura int not null,
	area_plantada_m2 decimal(10,2) not null check(area_plantada_m2 > 0),
	data_plantio date not null,
	data_colheita_prevista date,
	observacoes varchar(255),
    foreign key(fk_cultura) references culturas(id)
);

create table estoque_geral
(
	id int auto_increment primary key,
    fk_item_tipo enum('insumo','produto_colhido') not null,
	fk_item_id int not null,
	quantidade decimal(10,3) not null default 0,
	data_atualizacao datetime not null default current_timestamp on update current_timestamp
);

create table movimentacao_estoque
(
	id int auto_increment primary key,
    fk_estoque int not null,
	tipo_mov enum('entrada','saida','ajuste') not null,
	quantidade decimal(10,3) not null,
	data_mov datetime not null,
	referencia varchar(100),
    foreign key(fk_estoque) references estoque_geral(id)
);

create table receitas_aplicacao
(
	id int auto_increment primary key, 
	fk_cultura int, 
    fk_insumo int, 
	quantidade_por_m2 DECIMAL(10,3), 
	frequencia_dias INT,
    foreign key(fk_cultura) references culturas(id),
    foreign key(fk_insumo) references insumos(id)
);

