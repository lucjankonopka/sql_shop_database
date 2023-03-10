-- Creating database
create database Shop;
use Shop;


-- Creating table with customers, setting primary key
create table Customers
	(
    CustomerId int primary key auto_increment,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    City varchar(50)
    );
    

-- Adding Customers
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Max', 'Mustermann', 35, 'Berlin');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Alan', 'Parker', 42, 'London');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Maria', 'Solska', 32, 'Warsaw');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Martina', 'Mueller', 27, 'Dortmund');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Uwe', 'Hermann', 51, 'Berlin');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Celine', 'McColley', 19, 'Berlin');
insert into Customers
	(FirstName, LastName, Age, City)
    values ('Max', 'Mueller', 27, 'Berlin');


------------------------------TEST--------------------------------------
-- Selecting customers that name starts with "Max M...."
select * 
from customers
where FirstName='Max'
and LastName like 'M%';

-- Updating age of a customer
update customers
set Age=28
where FirstName='Max'
and LastName like 'Mue%';
------------------------------------------------------------------------


-- Creating table with products, setting primary key
create table Products
(
	ProductId int primary key auto_increment,
    ProductName varchar(50)
);

alter table Products
add Price float;


-- Adding products with prices
insert into Products
	(ProductName, Price)
    values ('FG Shoes', 129.99);
insert into Products
	(ProductName, Price)
    values ('SG Shoes', 139.90);
insert into Products
	(ProductName, Price)
    values ('AG Shoes', 99.95);
insert into Products
	(ProductName, Price)
    values ('TF Shoes', 84.95);
insert into Products
	(ProductName, Price)
    values ('IC Shoes', 79.99);


-- Creating table with orders, setting primary key
create table Orders
(
	OrderId int primary key auto_increment,
    OrderDate Datetime,
    CustomerId int,
    ProductId int
);


-- Setting relations to the tables (foreign keys):
alter table orders
add foreign key (CustomerId) references customers(CustomerId);

alter table orders
add foreign key (ProductId) references products(ProductId);


-- Adding orders with actual date and all ID's (to simplify, one order for each product)
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 2, 3);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 7, 5);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 1, 4);
------------------------------CHECK-------------------------------------
/* does not work because there is no CustomerId = 8 -> relation    
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 8, 4);
*/
------------------------------------------------------------------------
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 4, 4);
------------------------------CHECK-------------------------------------
/* does not work because there is no ProductId = 6 -> relation
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 3, 6);
*/
------------------------------------------------------------------------
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 3, 3);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 1, 1);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 1, 2);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 5, 1);
insert into Orders
	(OrderDate, CustomerId, ProductId)
    values (current_timestamp(), 6, 3);

