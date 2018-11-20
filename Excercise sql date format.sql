use 0908002640_Themepark;

/*
Fri-18-5-07
18/05/2017
Friday-18th of May 07
*/
select * from employee;

/*1*/
select distinct date_format(sale_date, "%a - %d - %m - %y") as sale_date from sales;
/*2*/
select distinct date_format(sale_date, "%d/%m/%Y") as sale_date from sales;
/*3*/
select distinct date_format(sale_date, "%W-%d of %M %y") as sale_date from sales;

/*eh meira*/
SELECT emp_fname, emp_lname, (CASE MONTH(EMP_DOB) WHEN 11 THEN 'NOVEMBER') as asd FROM EMPLOYEE WHERE MONTH(EMP_DOB) = 11;

SELECT DATEDIFF("2018-12-25","2018-11-08") as days_until_christmas;

select emp_fname as "first name",emp_lname as "last name", emp_hire_date as "hire date", date_add(emp_hire_date, interval 1 year) as "first appraisal" from employee;

select transaction_no, line_price, MOD(line_price, 10)
from sales_line where line_qty > 2;


select * from employee;

select concat(DAY(emp_dob),substr(upper(emp_lname),1,6)) as "user ID" from employee;

SELECT PARK_CODE, PARK_COUNTRY, 
(CASE PARK_COUNTRY WHEN 'UK' THEN 'United Kingdom' WHEN 'FR' THEN 'France' WHEN 'NL' THEN 'The Netherlands' WHEN 'SP' THEN 'Spain' WHEN 'ZA' THEN 'South Africa' WHEN 'SW' THEN 'Switzerland' ELSE' Unknown' END) AS COUNTRY 
FROM THEMEPARK; 



