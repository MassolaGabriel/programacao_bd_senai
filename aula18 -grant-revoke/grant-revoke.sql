create user "roberto"@"localhost" identified by "123";
create user "simonsen"@"localhost" identified by "456";
create user "mange"@"localhost" identified by "123";

grant all privileges on vendas_db.* to "roberto"@"localhost" with grant option;

revoke select on vendas_db.cliente from "simonsen"@"localhost";

grant select(nome) on vendas_db.cliente to "simonsen"@"localhost";

show grants for "simonsen"@"localhost";


grant select, insert on vendas_db.* to "mange"@"localhost";

create view dados_gerais as 
select * from 
db_financeiro.clientes,
db_financeiro.contas,
db_financeiro.enderecos,
db_financeiro.tipostransacao,
db_financeiro.transacoes,
empresa_db.funcionarios,
vendas_db.categoria,
vendas_db.cliente,
vendas_db.endereco,
vendas_db.forma_pagamento,
vendas_db.log_mudanca_preco,
vendas_db.pedido,
vendas_db.produto;	


