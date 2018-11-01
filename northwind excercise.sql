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
select * from Products
where Discontinued = 1;

/*4*/
select * from Products
where UnitPrice in (select MAX(UnitPrice) from products) OR UnitPrice in (select MIN(UnitPrice) from products);

/*5*/
select ProductID, ProductName, UnitPrice from Products
where UnitPrice < 20;

/*6*/
select ProductID, ProductName, UnitPrice from Products
where UnitPrice < 25
and UnitPrice > 15;

/*7*/
select ProductName, UnitPrice from Products
where UnitPrice > (select avg(UnitPrice) from Products);

/*8*/
select ProductName, UnitPrice from Products
order by UnitPrice DESC
limit 10;

/*9*/
select count(*) from Products
group by Discontinued;

/*10*/
select ProductName, UnitsInStock, UnitsOnOrder from Products
where UnitsInStock < UnitsOnOrder;


/*Human Resources*/
use 0908002640_HumanResources;
select * from employees;
select * from departments;
select * from jobs;
select * from locations;
select * from regions;
select * from countries;

/*1*/
select first_name, last_name,salary from employees
where salary > (select salary from employees where last_name = "Bull");

/*2*/
select first_name, last_name from employees
natural join departments
where Department_Name = "IT";

/*3*/
select distinct first_name,last_name from employees
natural join locations
where manager_id != 0 and country_id = "US";

/*4*/
select first_name, last_name, job_id,jobs.job_title from employees
natural join jobs
where job_id like "%MGR%" or job_id like "%MAN%";

/*5*/
select first_name, last_name, salary from employees
where salary > (select avg(salary) from employees);

/*JOIN*/

/*1*/
select department_name,street_address,city,state_province,location_id,country_name from locations
natural join departments, countries
where locations.country_id = countries.country_id;

/*2*/
select first_name, last_name, department_id from employees
natural join departments
where departments.department_id = department_id;

/*3*/
select first_name, last_name, job_title, department_id, city from employees
natural join jobs, locations
where city = "London"; 

/*4*/
select emp.employee_id, emp.last_name, man.employee_id as manager_id, man.last_name 'Manager' 
from employees emp 
join employees man 
where (emp.manager_id = man.employee_id);

/*5*/
SELECT emp.first_name, emp.last_name, emp.hire_date FROM employees as emp 
JOIN employees as nofn
WHERE nofn.last_name = 'Jones' and nofn.hire_date < emp.hire_date;

/*6*/
select department_name, department_id, employee_id, first_name, last_name from departments
natural join employees
where employees.department_id = departments.department_id;



