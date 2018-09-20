create database 0908002640_company;
use 0908002640_company;

drop table DEPARTMENT;
drop table EMPLOYEE;


create table EMPLOYEE(
	eid int not null primary key
    );

CREATE TABLE DEPARTMENT(
	dname VARCHAR(10) NOT NULL,
    did INTEGER Default 0,
	managerid INTEGER,
	budget REAL,
	PRIMARY KEY (did),
	UNIQUE (dname),
    FOREIGN KEY (managerid) REFERENCES EMPLOYEE(eid)
    );
    
alter table EMPLOYEE add did int not null;
alter table EMPLOYEE add constraint did foreign key(did) references DEPARTMENT(did);
    
/*
1. Default 0 makes the default value 0 if nothing is specified.

2. UNIQUE makes everything in that column unique

3. the foreign key references a table that does not exist.

4.  alter table EMPLOYEE add did int not null;
	alter table EMPLOYEE add constraint did foreign key(did) references DEPARTMENT(did);
 	
*/
    
    

    
    
