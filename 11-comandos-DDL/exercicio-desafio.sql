create database fazenda_integrada;
use fazenda_integrada;

create table fornecedores_insumos
(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
contato VARCHAR(100),
telefone VARCHAR(20),
);

create table insumos
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo ENUM('fertilizante', 'defensivo', 'semente', 'outros') NOT NULL,
	unidade_medida VARCHAR(10),
	custo_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE culturas
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome_cultura VARCHAR(50) NOT NULL UNIQUE,
	tempo_colheita_dias INT,
	condicoes_ideais VARCHAR(255)
);

CREATE TABLE equipamentos
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(50),
	data_aquisicao DATE,
	status ENUM('ativo', 'manutencao', 'inativo') DEFAULT 'ativo'
);

CREATE TABLE funcionarios
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	funcao VARCHAR(50),
	salario DECIMAL(10,2) NOT NULL CHECK(salario > 0),
	data_contratacao DATE
);

CREATE TABLE lotes_plantio 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	fk_cultura INT NOT NULL (FK para culturas),
	area_plantada_m2 DECIMAL(10,2) NOT NULL CHECK(area_plantada_m2 > 0),
	data_plantio DATE NOT NULL,
	data_colheita_prevista DATE,
	observacoes VARCHAR(255),
-- Adicione FK para culturas.
);

CREATE TABLE estoque_geral
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	fk_item_tipo ENUM('insumo','produto_colhido') NOT NULL,
-- fk_item_id INT NOT NULL (Explique como modelar estoque genérico para insumos e produtos colhidos. Não crie uma tabela produtos_colhidos explicitamente; use a tabela culturas como referência para o fk_item_id quando fk_item_tipo for 'produto_colhido')
	quantidade DECIMAL(10,3) NOT NULL DEFAULT  0,
	data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE movimentacao_estoque
(
	id INT AUTO_INCREMENT PRIMARY KEY,
-- fk_estoque INT NOT NULL (FK para estoque_geral)
	tipo_mov ENUM('entrada','saida','ajuste') NOT NULL,
	quantidade DECIMAL(10,3) NOT NULL,
	data_mov DATETIME NOT NULL,
	-- referencia VARCHAR(100) (Ex: "Compra fornecedor X", "Colheita lote Y", "Aplicação cultura Z")
-- Adicione FK para estoque_geral.
)