create database 0908002640_school;
use 0908002640_school;

show tables;

drop table students;
drop table class;
drop table enroll;

create table students(
	Reg_no VARCHAR(10),
    Name CHAR(30),
    dob DATE,
    City VARCHAR(50)
);

create table enroll(
    Enroll_grade int(2) not null
);

create table class(
	class_code Varchar(10),
    class_section varchar(20),
    class_time time,
    class_room char(3)
);


insert into stu values('abc123','Kolbeinn Ingólfsson', '2018-12-01','Reykjavík');

select * from stu;

truncate table stu;

rename table students to stu;

alter table stu add age int not null,
add marks int not null;

alter table stu modify Name Varchar(40);

alter table stu drop age,
drop marks;


alter table students add constraint PRIMARY KEY (Reg_no);
alter table class add constraint PRIMARY KEY (class_code);
alter table enroll add reg_no_fk varchar(10) not null;
alter table enroll add constraint reg_no_fk foreign key(reg_no_fk) references students(Reg_no); 









