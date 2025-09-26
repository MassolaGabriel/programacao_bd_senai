-- 1 - Quais são os produtos mais vendidos?
SELECT
    p.ProdutoID,
    p.Nome,
    sum(pedidop.Quantidade) AS total_vendido
FROM
    pedidoproduto AS pedidop
INNER JOIN
    produto AS p ON pedidop.ProdutoID = p.ProdutoID
GROUP BY
    p.ProdutoID,
    p.Nome
ORDER BY
    total_vendido DESC
    limit 3;
    
-- 2- Qual é o valor médio de um pedido?
-- Instrução: Calcule a média do campo PrecoTotal na tabela PedidoProduto.
select
	pp.PedidoID,
    avg(pp.PrecoTotal)
from pedidoproduto as pp

group by pp.PedidoID
limit 1;

-- 3 - Quais clientes fizeram mais pedidos?
-- Instrução: Conte o número de pedidos na tabela Pedido para cada ClienteID para identificar os clientes que fizeram mais pedidos.

