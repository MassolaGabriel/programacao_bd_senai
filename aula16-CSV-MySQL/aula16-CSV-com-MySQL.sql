create database sales;
use sales;

create table products(
ProductID int primary key not null auto_increment,
ProductName varchar(30) not null,
SupplierID int not null,
CategoryID int not null,
Unit varchar(100),
Price  double not null
);

create table order_detail(
OrderDetailID int primary key not null auto_increment,
OrderID int not null,
ProductID int not null,
Quantity  int not null
);

create table categories(
CategoryID int primary key not null auto_increment,
CategoryName varchar(30) not null,
Description varchar(100) not null
);

create table suppliers(
SupplierID int primary key not null auto_increment,
SupplierName varchar(100) not null,
ContactName varchar(60) not null,
Address varchar(100) not null,
City varchar(30) not null,
PostalCode varchar(15) not null,
Country varchar(20) not null,
Phone  varchar(20) not null
);

create table orders(
OrderID int primary key not null auto_increment,
CustomerID int not null,
EmployeeID int not null,
OrderDate date,
ShipperID  int not null 
);

create table customers(
CustomerID int not null primary key auto_increment,
CustomerName varchar(60),
ContactName varchar(60),
Address varchar(100),
City varchar(20),
PostalCode varchar(20),
Country varchar(20)
);

create table shippers(
	ShipperID int not null primary key auto_increment,
    CompanyName varchar(30),
    Phone varchar(20)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;    

-- FK OF PRODUCTS

ALTER TABLE products ADD CONSTRAINT fk_supplier FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID);
ALTER TABLE products ADD CONSTRAINT fk_category FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID);

-- FK FOR ORDER_DETAIL

ALTER TABLE order_detail ADD CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES orders(OrderID);
ALTER TABLE order_detail ADD CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES products(ProductID); -- faio

-- FK FOR ORDERS:

ALTER TABLE orders ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);
ALTER TABLE orders ADD CONSTRAINT fk_shipper FOREIGN KEY (ShipperID) REFERENCES shippers(ShipperID);
-- deixar aceitar null, apagar ids inexistentes

DELETE FROM order_detail
WHERE OrderID IN (
  SELECT OrderID FROM orders
  WHERE CustomerID NOT IN (SELECT CustomerID FROM customers)
);

DELETE FROM orders
WHERE CustomerID NOT IN (SELECT CustomerID FROM customers);

SELECT DISTINCT CustomerID
FROM orders
WHERE CustomerID NOT IN (SELECT CustomerID FROM customers);

