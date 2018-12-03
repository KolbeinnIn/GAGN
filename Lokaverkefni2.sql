/Lokaverkefni - Ágúst og Kolbeinn/

CREATE DATABASE 2808002950_TinyVideo;

use 2808002950_TinyVideo;

drop database 2808002950_TinyVideo;

/1/ CREATE TABLE MEMBERSHIP( MEM_NUM int NOT NULL PRIMARY KEY, MEM_FNAME varchar(17), MEM_LNAME varchar(17), MEM_STREET varchar(50), MEM_CITY varchar(40), MEM_STATE CHAR(2), MEM_ZIP int(5), MEM_BALANCE int(2) );

CREATE TABLE RENTAL( RENT_NUM int NOT NULL PRIMARY KEY, RENT_DATE date, MEM_NUM INT, FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP (MEM_NUM) );

CREATE TABLE PRICE( PRICE_CODE int NOT NULL PRIMARY KEY, PRICE_DESCRIPTION varchar(30), PRICE_RENTFEE double, PRICE_DAILYLATEFEE double );

CREATE TABLE MOVIE( MOVIE_NUM int NOT NULL PRIMARY KEY, MOVIE_TITLE varchar(60), MOVIE_YEAR int(4), MOVIE_COST double, MOVIE_GENRE varchar(30), PRICE_CODE int, FOREIGN KEY (PRICE_CODE) REFERENCES PRICE (PRICE_CODE) );

CREATE TABLE VIDEO( VID_NUM int NOT NULL PRIMARY KEY, VID_INDATE date, MOVIE_NUM int, FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE (MOVIE_NUM) );




/3/ select MOVIE_TITLE,MOVIE_YEAR,MOVIE_COST from movie where upper(MOVIE_TITLE) like '%HOPE%' order by MOVIE_TITLE;

/4/ select MOVIE_TITLE,MOVIE_YEAR,MOVIE_GENRE from movie where upper(MOVIE_GENRE)="ACTION";

/5/ select movie_num,movie_title,movie_cost from movie where movie_cost>40;

/6/ select movie_num,movie_title,movie_cost,movie_genre from movie where (upper(MOVIE_GENRE)="ACTION" or upper(MOVIE_GENRE)="COMEDY") and movie_cost<50 order by movie_genre;

/7./ select movie_num, concat(movie_title , " (", movie_year, ") " , movie_genre) as "Movie Description" from movie;

/8/ select movie_genre, count(*) from movie group by movie_genre;

/9/ select round(avg(movie_cost),4) from movie;

/10/ select movie_genre, round(avg(movie_cost),2) from movie group by movie_genre;

/11/ select movie_title, movie_genre, price.price_description, price.price_rentfee from movie natural join price;

/12/ select movie_genre, round(avg(price.price_rentfee),2) from movie natural join price group by movie_genre;

/13/ select movie_title, movie_year, round((movie_cost/price.price_rentfee),2) as "Breakeven Rentals" from movie natural join price;

/14/ select movie_title, movie_year from movie where price_code is not null;

/15/

/16/ select movie_title,movie_year,PRICE_DESCRIPTION, price_rentfee,movie_genre from movie natural join price where upper(movie_genre)="FAMILY" or upper(movie_genre)="COMEDY" or upper(movie_genre)="DRAMA";

/17/

/18/ select concat(MEM_FNAME," ",MEM_LNAME) as "name", concat(MEM_STREET," ",MEM_CITY," ",MEM_STATE," ",MEM_ZIP) as membership_address from membership;

/19/

/20/

/21/

/22/ select * from membership; select * from detailrental; select * from rental;

select membership.MEM_NUM,MEM_LNAME,MEM_FNAME,sum(DETAIL_FEE) from membership natural join detailrental, rental where rental.rent_num = detailrental.rent_num and rental.mem_num = membership.mem_num group by membership.mem_num;

/23/ select MOVIE_NUM,MOVIE_GENRE as Genre, (select avg(MOVIE_COST) from movie where movie_genre=Genre)as Average_Cost,MOVIE_COST, ((movie_cost-(select avg(MOVIE_COST) from movie where movie_genre=Genre))/(select avg(MOVIE_COST) from movie where movie_genre=Genre)*100)as Percent from movie;

/24/ ALTER TABLE DETAILRENTAL ADD DETAIL_DAYSLATE INT(4);/*HAD to add 4 because there are 4 digit numbers */

/25/ ALTER table video ADD VID_STATUS enum('IN','OUT','LOST') not null default "IN";

/26/ update video set vid_status='OUT' where vid_num in(select vid_num from detailrental where DETAIL_RETURNDATE is null);

select * from price;

/27/ alter table price add price_rentdays int(2) default 3 not null;

/28/ update price set price_rentdays=;

/29 a/ delimiter // CREATE TRIGGER TRG_MEM_BALANCE AFTER UPDATE of DETAIL_DUEDATE, DETAIL_RETURNDATE ON DETAILRENTAL FOR EACH ROW DECLARE PRIOR_LATEFEE NUMBER; NEW_LATEFEE NUMBER; UPDATE_AMOUNT NUMBER; RENTAL_MEMBER RENTAL.MEM_NUM%TYPE; BEGIN PRIOR_LATEFEE := :OLD.DETAIL_DAYSLATE * :OLD.DETAIL_DAILYLATEFEE; IF PRIOR_LATEFEE IS NULL THEN PRIOR_LATEFEE := 0; END IF; NEW_LATEFEE := :NEW.DETAIL_DAYSLATE * :NEW.DETAIL_DAILYLATEFEE; IF NEW_LATEFEE IS NULL THEN NEW_LATEFEE := 0; END IF; UPDATE_AMOUNT := NEW_LATEFEE - PRIOR_LATEFEE; IF UPDATE_AMOUNT <> 0 THEN SELECT MEM_NUM INTO RENTAL_MEMBER FROM RENTAL WHERE RENT_NUM = :NEW.RENT_NUM;

    UPDATE MEMBERSHIP
    SET MEM_BALANCE = MEM_BALANCE + UPDATE_AMOUNT
    WHERE MEM_NUM = RENTAL_MEMBER;
END IF;//