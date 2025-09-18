SELECT * FROM lotes_plantio;
SELECT * FROM culturas;

SELECT lotes_plantio.id, area_plantada_m2;

/* Consulta que calcula a necessidade total de cada insumo (nome do insumo, tipo, unidade de medida e quantidade total necessária) para todos os lotes_plantio ativos (assuma que 'ativo' significa data_colheita_prevista ainda no futuro ou nula), com base nas receitas_aplicacao. */

SELECT * FROM insumos;
SELECT * FROM receitas_aplicacao;

select nome, quantidade_por_m2, nome_cultura, tipo, custo_unitario, quantidade_por_m2 * custo_unitario as total
from receitas_aplicacao as r
inner join culturas as c on c.id = r.fk_cultura
inner join insumos as i on i.id = r.fk_insumo;

/* Consulta que mostra o estoque atual de cada insumo, incluindo seu valor total (quantidade * custo_unitario). */

