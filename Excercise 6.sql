use 0908002640_Themepark;

select * from employee;
select * from themepark;
select * from sales;

/*1*/
select emp_fname, emp_lname, emp_dob from employee
where DAY(EMP_DOB) = 14;

/*2*/
select concat(emp_fname," ",emp_lname) as "Name", TRUNCATE(DATEDIFF("2008-11-25", EMP_DOB)/365, 0) as "Age at 10th anniversary" from employee;

/*3*/
select concat(emp_fname," ",emp_lname) as "Name" ,concat(substr(emp_phone,1,3), lower(substr(emp_fname,1,2))) as "USER_PASSWORD" from employee;

/*4*/
select park_name, date_format(sale_date, "%D of %M %Y") as sale_dates from sales
join themepark on themepark.park_code = sales.park_code
where sale_date in (select max(sale_date) from sales group by park_code)
group by park_name;


select park_name, max(date_format(sale_date, "%D of %M %Y")) as sale_dates from 
sales s
join themepark t
on s.park_code = t.park_code
group by park_name;





