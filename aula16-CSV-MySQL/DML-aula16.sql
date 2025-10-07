-- Consultas de Clientes e Geografia
/* 1 - Localização Geográfica Específica: Liste o nome (CustomerName) e o endereço (Address) de todos os clientes localizados nas cidades de Berlim (Berlin) ou Paris. */

select CustomerName, Address from customers where City in("Berlin", "Paris");

/* 2 - Clientes com Maior Engajamento: Quais clientes (CustomerName) estão associados aos pedidos com os IDs mais antigos? 
Considere apenas os pedidos com OrderID de 10248 a 10252. 
(Requer JOIN entre Customers e Orders). */

SELECT
    c.CustomerName
FROM
    customers c
INNER JOIN
    orders o ON c.CustomerID = o.CustomerID
WHERE
    o.OrderID BETWEEN 10248 AND 10252;
    
/* 3 - Países Atendidos: Baseado nos dados de clientes, exiba uma lista distinta de todos os países nos quais a empresa possui clientes. */

SELECT DISTINCT Country FROM customers;

/* 4- Produtos de Alto Custo: Identifique o nome do produto (ProductName) e o preço (Price) dos produtos com preço igual ou superior a 25.
Dica: Pelo menos dois produtos têm preço $30.00: Grilled Chicken e Vanilla Extract. */

select ProductName, Price from products where Price >= 25.0;

/* 5- Distribuição de Produtos por Categoria: Para cada categoria de produto (CategoryName), 
calcule o número total de produtos associados a ela. (Requer JOIN entre Categories e Products e GROUP BY). */

SELECT
    c.CategoryName,
    COUNT(p.ProductID) AS TotalProducts
FROM
    categories c
INNER JOIN
    products p ON c.CategoryID = p.CategoryID
GROUP BY
    c.CategoryName;
    
/* 6- Fornecedores de Produtos Específicos: Quais fornecedores (SupplierName) 
fornecem exclusivamente produtos da categoria "Condiments" (Categoria 2)? Liste o nome do fornecedor e seu país (Country).
Nota: O fornecedor Cooperativa de Quesos 'Las Cabras' (ID 5) fornece produtos dessa categoria.*/

SELECT
    s.SupplierName,
    s.Country
FROM
    suppliers s
INNER JOIN
    products p ON s.SupplierID = p.SupplierID
INNER JOIN
    categories c ON p.CategoryID = c.CategoryID
WHERE
    c.CategoryName = 'Condiments'
GROUP BY
    s.SupplierName, s.Country
HAVING
    COUNT(DISTINCT c.CategoryName) = 1;
    
/* 7- Volume Total de Vendas de um Item: Calcule a quantidade total (Quantity)
vendida do produto Chocolate Sauce (ProductID 11) 
em todos os pedidos registrados na tabela OrderDetails */

-- Tenho que carregar o CSV novamente, sumiram os dados quando apaguei GG
SELECT
    SUM(Quantity) AS TotalQuantitySold
FROM
    order_detail
WHERE
    ProductID = 11;