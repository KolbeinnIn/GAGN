create database 0908002640_company;
use 0908002640_company;


/*
create table deptsal(
	dept_no int primary key,
    totalsalary int,
    foreign key dept_no (dept_no) references dept(dept_no) on delete no action on update no action
);*/

drop table deptsal;

create table deptsal as select dept_no, 0 as totalsalary from dept;


select * from deptsal;
select * from dept;
select * from employee;

delimiter //

create procedure updateSalary(in department_number int)
begin
	update deptsal
	set totalsalary = (select sum(salary) from employee where department_number = dept_no)
    where department_number = dept_no; 
end //
delimiter ;
call updateSalary(2);


drop procedure updateSalary;
drop procedure updateSalaryLoop;

select * from information_schema.routines 
where routine_type = 'PROCEDURE'
and routine_schema = "0908002640_company";

delimiter //
CREATE PROCEDURE updateSalaryLoop()
BEGIN
  DECLARE v INT;
  SET v = 1;
  WHILE v < (select count(*) from dept) DO
	update deptsal
     set totalsalary = (select sum(salary) from employee where v = dept_no)
     where v = dept_no; 
     SET v = v + 1;
END WHILE;
END; //

call updateSalaryLoop();





