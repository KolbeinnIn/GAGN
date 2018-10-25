use 0908002640_Northwind;

select * from customers;
select * from `order details` where OrderId = 10255;
/*12.*/
select *
from customers
where region = "WA" OR region = "MA" OR region = "IL" OR region = "FL";

/*14*/
select OrderId, sum(UnitPrice * quantity) from `order details`
group by OrderId;

/*15*/
select avg(Freight) from orders;

/*16*/
select count(*) from `order details`
group by OrderId;

/*17*/
select CustomerID, count(*) from orders
group by CustomerID;

/*19*/
select * from `order details`
order by Quantity DESC
LIMIT 1;

/*all previous answers are from excercise 4. After this line they are from excercise 5*/
/*1*/
select ProductName, QuantityPerUnit from Products;

/*2*/
select ProductID, ProductName from Products
where Discontinued = 0;

/*3*/
select * from Products;

select * from Products
where Discontinued = 1;

/*4*/
select * from Products
where UnitPrice in (select MAX(UnitPrice) from products) OR UnitPrice in (select MIN(UnitPrice) from products);

/*5*/