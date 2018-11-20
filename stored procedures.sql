
create database 0908002640_db5;
use 0908002640_db5;


create table t (s1 int);
insert into t values (5);

delimiter //


create procedure p1()
	select * from t //

delimiter ;

call p1();

delimiter //

CREATE PROCEDURE p2 ()
LANGUAGE SQL  
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'A Procedure' 
SELECT CURRENT_DATE, RAND() FROM t; //
//
delimiter //
/*meikar ekki sens*/
create procedure hello_world()
begin
	select "Hello world";
end //
    
delimiter ;
call hello_world();
drop procedure hello_world;

delimiter //
CREATE PROCEDURE p7() 
BEGIN 
     SET @a = 5; 
     SET @b = 5; 
     INSERT INTO t VALUES (@a); 
     SELECT s1 * @a FROM t WHERE s1 >= @b; 
END; //
delimiter ;
call p7();

delimiter //

CREATE PROCEDURE p12 (IN parameter1 INT) 
BEGIN 
     DECLARE variable1 INT; 
     SET variable1 = parameter1 + 1; 
     IF variable1 = 0 THEN 
       INSERT INTO t VALUES (17); 
     END IF; 
     IF parameter1 = 0 THEN 
       UPDATE t SET s1 = s1 + 1; 
     ELSE 
       UPDATE t SET s1 = s1 + 2;
     END IF; 
END; // 

delimiter ;
call p12(2);


drop procedure p14;

delimiter //
CREATE PROCEDURE p14 ()
BEGIN
  DECLARE v INT;
  SET v = 0;
  WHILE v < 1000 DO
     INSERT INTO t VALUES (v);
     SET v = v + 1;
END WHILE;
END; //
delimiter ;
call p14();

select * from t;




