-- 1 - Quais são os produtos mais vendidos?
-- Instrução: Analise a tabela PedidoProduto e conte a frequência de cada ProdutoID para identificar os produtos mais vendidos.

SELECT
    p.Nome,
    SUM(pp.Quantidade) AS TotalUnidadesVendidas
FROM
    PedidoProduto AS pp
INNER JOIN
    Produto AS p ON pp.ProdutoID = p.ProdutoID
GROUP BY
    p.ProdutoID, p.Nome
ORDER BY
    TotalUnidadesVendidas DESC;
    
-- 2- Qual é o valor médio de um pedido?
-- Instrução: Calcule a média do campo PrecoTotal na tabela PedidoProduto.

SELECT AVG(ValorTotalPedido) AS ValorMedioPorPedido
FROM (
    SELECT
        PedidoID,
        SUM(PrecoTotal) AS ValorTotalPedido
    FROM
        PedidoProduto
    GROUP BY
        PedidoID
) AS TotaisDosPedidos;

-- 3 - Quais clientes fizeram mais pedidos?
-- Instrução: Conte o número de pedidos na tabela Pedido para cada ClienteID para identificar os clientes que fizeram mais pedidos.

SELECT
    c.Nome,
    COUNT(p.PedidoID) AS NumeroDePedidos
FROM
    Cliente AS c
INNER JOIN
    Pedido AS p ON c.ClienteID = p.ClienteID
GROUP BY
    c.ClienteID, c.Nome
ORDER BY
    NumeroDePedidos DESC;

-- 4. Quantos pedidos ainda estão em processamento?
-- Contamos todos os pedidos cujo status é 'Em Processamento'.

SELECT COUNT(*) AS PedidosEmProcessamento
FROM Pedido
WHERE Status = 'Em Processamento';

-- 5. Qual é a distribuição geográfica dos clientes?
-- Contamos o número de clientes por cada estado.

SELECT
    e.Estado,
    COUNT(c.ClienteID) AS NumeroDeClientes
FROM
    Cliente AS c
INNER JOIN
    Endereco AS e ON c.EnderecoID = e.EnderecoID
GROUP BY
    e.Estado
ORDER BY
    NumeroDeClientes DESC;

-- 6. Qual é o produto menos vendido?
-- Fazemos a mesma análise dos mais vendidos, mas ordenamos de forma ascendente.

SELECT
    p.Nome,
    SUM(pp.Quantidade) AS TotalUnidadesVendidas
FROM
    PedidoProduto AS pp
INNER JOIN
    Produto AS p ON pp.ProdutoID = p.ProdutoID
GROUP BY
    p.ProdutoID, p.Nome
ORDER BY
    TotalUnidadesVendidas ASC
LIMIT 1;

-- 7. Quais pedidos foram cancelados e por quais clientes?
-- Filtramos os pedidos com status 'Cancelado' e juntamos com a tabela de clientes para obter o nome.

SELECT
    p.PedidoID,
    c.Nome AS NomeCliente
FROM
    Pedido AS p
INNER JOIN
    Cliente AS c ON p.ClienteID = c.ClienteID
WHERE
    p.Status = 'Cancelado';

-- 8. Qual é o valor total de vendas de um determinado produto?
-- Somamos o PrecoTotal para um ProdutoID específico. (Exemplo: ProdutoID = 2).

-- Para o produto com ID = 2 (Notebook)
SELECT
    p.Nome,
    SUM(pp.PrecoTotal) AS ValorTotalVendas
FROM
    PedidoProduto AS pp
INNER JOIN
    Produto AS p ON pp.ProdutoID = p.ProdutoID
WHERE
    pp.ProdutoID = 2
GROUP BY
    p.Nome;


-- 9. Quais clientes compraram um produto específico?
-- Identificamos todos os clientes que fizeram um pedido contendo um produto específico. (Exemplo: ProdutoID = 3).

-- Para o produto com ID = 3 (Tablet)
SELECT DISTINCT
    c.Nome
FROM
    Cliente AS c
INNER JOIN Pedido AS p ON c.ClienteID = p.ClienteID
INNER JOIN PedidoProduto AS pp ON p.PedidoID = pp.PedidoID
WHERE
    pp.ProdutoID = 3;

-- 10. Quanto estoque resta para cada produto?
-- Consultamos diretamente a coluna de estoque na tabela de produtos.

SELECT Nome, QuantidadeEstoque
FROM Produto
ORDER BY Nome;

-- 11. Quantos clientes estão cadastrados na tabela Cliente?
-- Fazemos uma contagem simples de todas as linhas da tabela Cliente.

SELECT COUNT(*) AS TotalDeClientes
FROM Cliente;

-- 12. Quais são os nomes dos produtos que têm um preço superior a R$1000,00?
-- Filtramos a tabela Produto por preços maiores que 1000.

SELECT Nome, Preco
FROM Produto
WHERE Preco > 1000.00;

-- 13. Quem é o cliente que fez o pedido número 7?
-- Localizamos o pedido e juntamos com a tabela Cliente para obter o nome.

SELECT
    c.Nome
FROM
    Cliente AS c
INNER JOIN
    Pedido AS p ON c.ClienteID = p.ClienteID
WHERE
    p.PedidoID = 7;

-- 14. Qual é o endereço completo do cliente chamado 'Ana Lima'?
-- Encontramos a cliente e juntamos com a tabela Endereco.

SELECT
    c.Nome,
    e.Rua,
    e.Numero,
    e.Cidade,
    e.Estado,
    e.CEP
FROM
    Cliente AS c
INNER JOIN
    Endereco AS e ON c.EnderecoID = e.EnderecoID
WHERE
    c.Nome = 'Ana Lima';

-- 15. Liste todos os produtos que foram pedidos no pedido número 1.
-- Filtramos a tabela PedidoProduto pelo PedidoID e buscamos os nomes na tabela Produto.

SELECT
    p.Nome,
    pp.Quantidade,
    pp.PrecoTotal
FROM
    PedidoProduto AS pp
INNER JOIN
    Produto AS p ON pp.ProdutoID = p.ProdutoID
WHERE
    pp.PedidoID = 1;

-- 16. Quantos clientes estão localizados no estado de São Paulo?
-- Contamos os clientes cujo endereço está no estado de 'SP' ou 'São Paulo'.
-- Devo atualizar o Estado para unir SP com São Paulo

SELECT COUNT(c.ClienteID) AS ClientesEmSaoPaulo
FROM Cliente AS c
INNER JOIN Endereco AS e ON c.EnderecoID = e.EnderecoID
WHERE e.Estado IN ('SP', 'São Paulo');

-- 18. Qual é o valor total de todos os produtos no estoque?
-- Multiplicamos o preço pela quantidade em estoque para cada produto e somamos tudo.

SELECT SUM(Preco * QuantidadeEstoque) AS ValorTotalEstoque
FROM Produto;

-- 19. Quantos diferentes tipos de produtos foram pedidos pelo cliente 'João Silva'?
-- Contamos os produtos distintos nos pedidos feitos pelo cliente 'João Silva'.

SELECT
    COUNT(DISTINCT pp.ProdutoID) AS TiposDeProdutosDiferentes
FROM
    Cliente AS c
INNER JOIN Pedido AS p ON c.ClienteID = p.ClienteID
INNER JOIN PedidoProduto AS pp ON p.PedidoID = pp.PedidoID
WHERE
    c.Nome = 'João Silva';



