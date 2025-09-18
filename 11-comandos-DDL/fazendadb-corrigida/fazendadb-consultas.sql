/*
Consulta que mostra todos os lotes_plantio com 
as culturas correspondentes e a área plantada.
*/

select * from lotes_plantio;
select * from culturas;

select lotes_plantio.id, area_plantada_m2, nome_cultura, observacoes from lotes_plantio
inner join culturas on lotes_plantio.fk_cultura = culturas.id;


/*
Consulta que calcula a necessidade total de cada insumo 
(nome do insumo, tipo, unidade de medida e quantidade total necessária) 
para todos os lotes_plantio ativos 
(assuma que 'ativo' significa data_colheita_prevista ainda no futuro ou nula), 
com base nas receitas_aplicacao.
*/

select * from insumos;
select * from lotes_plantio;
select * from receitas_aplicacao;

select 
	nome, 
	quantidade_por_m2, 
	nome_cultura, tipo, 
	custo_unitario, 
    quantidade_por_m2 * custo_unitario as total

from receitas_aplicacao as r
inner join culturas as c on c.id = r.fk_cultura
inner join insumos as i on i.id = r.fk_insumo;


/*
Consulta que mostra o estoque atual de cada insumo, 
incluindo seu valor total (quantidade * custo_unitario).
*/
select * from insumos;
select * from receitas_aplicacao;
select * from culturas;

select * from receitas_aplicacao r
inner join insumos i on r.fk_insumo = i.id
join culturas c on r.fk_cultura = c.id;