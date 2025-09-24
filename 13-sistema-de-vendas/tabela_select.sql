create table cliente as select
	distinct cliente_id as id,
    substring_index(cliente_nome, " ", 1) as nome,
    substring_index(cliente_nome, " ", -1) as sobrenome,
    cliente_email as email
from pedidos;

alter table cliente add column fk_id_endereco int not null;
alter table cliente modify id int primary key not null auto_increment;


-- TABELA TELEFONE
create table telefone as
select distinct cliente_id as fk_id_cliente, cliente_telefone as telefone
from pedidos;

alter table telefone add column id int primary key auto_increment first;
alter table telefone add constraint fk_cliente foreign key(fk_id_cliente) references cliente(id);

-- TABELA PRODUTO
-- create table produto as 
select distinct produto_id as id, 
produto_descricao as descricao,
preco_unitario
-- Adicionar ID da categoria
from pedidos;

