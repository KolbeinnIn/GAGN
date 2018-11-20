/*1*/
create database 0908002640_company;
use 0908002640_company;

drop table deptsal;

/*2*/
create table deptsal as select dept_no, 0 as totalsalary from dept;

/*quickly execute commands
----------------------------*/
select * from deptsal;
select * from dept;
select * from employee;
/*--------------------------*/
/*3.1*/
delimiter //

/*3.2*/
create procedure updateSalary(in department_number int)
begin
	update deptsal
	set totalsalary = (select sum(salary) from employee where department_number = dept_no)
    where department_number = dept_no; 
end //
/*3.3*/
delimiter ;

/*3.4*/
call updateSalary(3);

/*3.5*/
select * from deptsal;

/*4*/
select * from information_schema.routines 
where routine_type = 'PROCEDURE'
and routine_schema = "0908002640_company";

/*5*/
drop procedure updateSalary;

/*6*/
update deptsal
set totalsalary = 0;


/*7*/
delimiter //
CREATE PROCEDURE updateSalaryLoop()
BEGIN
	DECLARE v INT;
	DECLARE total int;
	SET v = 1;
	WHILE v < (select (count(*)+1) from dept) DO
		set total = (select sum(salary) from employee where v = dept_no);
		if total is not null then
			update deptsal
			set totalsalary = (select sum(salary) from employee where v = dept_no)
			where v = dept_no; 
		else
			update deptsal
            set totalsalary = 0
            where v = dept_no;
		end if;
     SET v = v + 1;
END WHILE;
END; //
delimiter ;
call updateSalaryLoop;

/*8*/
delimiter //
create procedure updateSalaryCursor()
	begin
	   declare done int default 0;
	   declare current_dept_no int;
       declare total int;
	   declare dept_no_cursor CURSOR FOR SELECT dept_no FROM deptsal;
	   declare continue handler for not found set done = 1;
	   open dept_no_cursor;
	   repeat
		 fetch dept_no_cursor into current_dept_no;
         set total = (select sum(salary) from employee where dept_no = current_dept_no);
         if total is not null then
			 update deptsal
			 set totalsalary = total
			 where dept_no = current_dept_no;
		 else
			 update deptsal
			 set totalsalary = 0
			 where dept_no = current_dept_no;
		 end if;
	   until done
	   end repeat;
		close dept_no_cursor;
	end //

delimiter ;
drop procedure updateSalaryCursor;
call updateSalaryCursor;
/*9*/
delimiter //
create procedure raise10()
BEGIN
	update deptsal
    set totalsalary = (totalsalary * 1.10);
END //
delimiter ;
call raise10();

/*10. a*/
delimiter //
create trigger update_salaryA
after insert on employee
for each row 
begin      
	if new.dept_no is not null then
		update deptsal           
		set totalsalary = totalsalary + new.salary          
		where dept_no = new.dept_no;	  
	end if;      
end ; //

delimiter ;
/*test deptsal before insert into employee*/
select * from deptsal;

insert into employee
values (9, "Kolbeinn Ingólfsson", NULL, 4, 500000);

/*test deptsal after insert into employee*/
select * from deptsal;


/*10. b*/
delimiter //
create trigger update_salaryB
after delete on employee
for each row 
begin
	update deptsal
	set totalsalary = 0;
    call updateSalaryLoop;
end ; //
delimiter ;

/*test deptsal before deleting an employee*/
select * from deptsal;

delete from employee where emp_id = 9;

/*test deptsal after deleting an employee*/
select * from deptsal;