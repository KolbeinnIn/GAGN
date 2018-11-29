create database 0908002640_TinyVideo;
use 0908002640_TinyVideo;

CREATE TABLE MEMBERSHIP(
	MEM_NUM int NOT NULL PRIMARY KEY,
	MEM_FNAME varchar(17),
	MEM_LNAME varchar(17),
	MEM_STREET varchar(50),
	MEM_CITY varchar(40),
	MEM_STATE CHAR(2),
	MEM_ZIP int(5),
	MEM_BALANCE int(2)
);

CREATE TABLE RENTAL(
	RENT_NUM int NOT NULL PRIMARY KEY,
	RENT_DATE date,
	MEM_NUM INT,
	FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP (MEM_NUM)
);
    
CREATE TABLE PRICE(
	PRICE_CODE int NOT NULL PRIMARY KEY,
	PRICE_DESCRIPTION varchar(30),
	PRICE_RENTFEE double,
	PRICE_DAILYLATEFEE double
);

CREATE TABLE MOVIE(
	MOVIE_NUM int NOT NULL PRIMARY KEY,
	MOVIE_TITLE varchar(60),
	MOVIE_YEAR int(4),
	MOVIE_COST double,
	MOVIE_GENRE varchar(30),
	PRICE_CODE int,
	FOREIGN KEY (PRICE_CODE) REFERENCES PRICE (PRICE_CODE)
);

CREATE TABLE VIDEO(
	VID_NUM int NOT NULL PRIMARY KEY,
	VID_INDATE date,
    MOVIE_NUM int,
    FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE (MOVIE_NUM)
);

CREATE TABLE DETAILRENTAL(
	RENT_NUM int,
    VID_NUM int,
    FOREIGN KEY (RENT_NUM) REFERENCES RENTAL (RENT_NUM),
    FOREIGN KEY (VID_NUM) REFERENCES VIDEO (VID_NUM),
	DETAIL_FEE double,
    DETAIL_DUEDATE date,
    DETAIL_RETURNDATE date,
	DETAIL_DAILYLATEFEE int,
	PRIMARY KEY (RENT_NUM, VID_NUM)
);

INSERT INTO MEMBERSHIP
values
	(102, 'Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
    (103, 'Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
    (104, 'Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
    (105, 'Iva', 'Mcclain', '6045 Musket Ball Circle', 'Summit', 'KY', 42783, 15),
    (106, 'Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 38183, 0),
    (107, 'Rosario', 'Elliott', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5),
    (108, 'Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'Ky', 40740, 0),
    (109, 'Clint', 'Ochoa', '1711 Elm Street', 'Greeneville', 'TN', 37745, 10),
    (110, 'Lewis', 'Rosales', '4524 Southwind Circle', 'Counce', 'TN', '38326', 0),
    (111, 'Stacy', 'Mann', '3789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8),
    (112, 'Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3),
    (113, 'Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0);
    
    
INSERT INTO PRICE
values
	(1,"Standard",2,1),
	(2,"New Release",3.5,3),
	(3,"Discount",1.5,1),
	(4,"Weekly Special",1,.5);
    
INSERT INTO MOVIE
values
	(1234,"The Cesar Family Christmas",2007,39.95,"FAMILY",2),
	(1235,"Smokey Mountain Wildlife",2004,59.95,"ACTION",1),
	(1236,"Richard Goodhope",2008,59.95,"DRAMA",2),
	(1237,"Beatnik Fever",2007,29.95,"COMEDY",2),
	(1238,"Constant Companion",2008,89.95,"DRAMA",2),
	(1239,"Where Hope Dies",1998,25.49,"DRAMA",3),
	(1245,"Time to Burn",2005,45.49,"ACTION",1),
	(1246,"What He Doesn't Know",2006,58.29,"COMEDY",1);


INSERT INTO VIDEO
values
	(54321,"18-06-08",1234),
	(54324,"18-06-08",1234),
	(54325,"18-06-08",1234),
	(34341,"22-01-07",1235),
	(34342,"22-01-07",1235),
	(34366,"02-03-09",1236),
	(34367,"02-03-09",1236),
	(34368,"02-03-09",1236),
	(34369,"02-03-09",1236),
	(44392,"21-10-08",1237),
	(44397,"21-10-08",1237),
	(59237,"14-02-09",1237),
	(61388,"25-01-07",1239),
	(61353,"28-01-06",1245),
	(61354,"28-01-06",1245),
	(61367,"30-07-08",1246),
	(61369,"30-07-08",1246);


INSERT INTO RENTAL
values
	(1001,"01-03-09",103),
	(1002,"01-03-09",105),
	(1003,"02-03-09",102),
	(1004,"02-03-09",110),
	(1005,"02-03-09",111),
	(1006,"02-03-09",107),
	(1007,"02-03-09",104),
	(1008,"03-03-09",105),
	(1009,"03-03-09",111);

INSERT INTO DETAILRENTAL
values
	(1001,34342,2,"04-03-09","02-03-09",1),
	(1001,61353,2,"04-03-09","03-03-09",1),
	(1002,59237,3.5,"04-03-09","04-03-09",3),
	(1003,54325,3.5,"04-03-09","09-03-09",3),
	(1003,61369,2,"06-03-09","09-03-09",1),
	(1003,61388,0,"06-03-09","09-03-09",1),
	(1004,44392,3.5,"05-03-09","07-03-09",3),
	(1004,34367,3.5,"05-03-09","07-03-09",3),
	(1004,34341,2,"07-03-09","07-03-09",1),
	(1005,34342,2,"07-03-09","05-03-09",1),
	(1005,44397,3.5,"05-03-09","05-03-09",3),
	(1006,34366,3.5,"05-03-09","04-03-09",3),
	(1006,61367,2,"07-03-09",NULL,1),
	(1007,34368,3.5,"05-03-09",NULL,3),
	(1008,34369,3.5,"05-03-09","05-03-09",3),
	(1009,54324,3.5,"05-03-09",NULL,3),
	(1001,34366,3.5,"04-03-09","02-03-09",3);




/*quick executes*/
select * from membership;
select * from rental;
select * from price;
select * from movie;
select * from video;
select * from detailrental;

/*3*/
select MOVIE_TITLE,MOVIE_YEAR,MOVIE_COST from movie where upper(MOVIE_TITLE) like '%HOPE%' order by MOVIE_TITLE;

/*4*/
select MOVIE_TITLE,MOVIE_YEAR,MOVIE_GENRE from movie where upper(MOVIE_GENRE)="ACTION";

/*5*/
select movie_num,movie_title,movie_cost from movie where movie_cost>40;

/*6*/
select movie_num,movie_title,movie_cost,movie_genre from movie
where (MOVIE_GENRE="ACTION" or MOVIE_GENRE="COMEDY")
	and movie_cost < 50 order by movie_genre;
    
/*7.*/
select movie_num, concat(movie_title , " (", movie_year, ") " , movie_genre) as "Movie Description" from movie;

/*8*/
select movie_genre, count(*) from movie
group by movie_genre;

/*9*/
select round(avg(movie_cost),4) from movie;

/*10*/
select movie_genre, round(avg(movie_cost),2) from movie
group by movie_genre;

/*11*/
select movie_title, movie_genre, price.price_description, price.price_rentfee from movie
natural join price;

/*12*/
select movie_genre, round(avg(price.price_rentfee),2) from movie
natural join price
group by movie_genre;

/*13*/
select movie_title, movie_year, round((movie_cost/price.price_rentfee),2) as "Breakeven Rentals" from movie
natural join price;

/*14*/


/*15*/
select movie_title, movie_year, movie_cost from movie
where movie_cost < 49.99
	and movie_cost > 44.99;
    
    
/*16*/


/*17*/
select min(mem_balance), max(mem_balance), avg(mem_balance) from membership, rental
where membership.mem_num = rental.mem_num;

/*18*/



/*19*/
select rental.rent_num, rental.rent_date, movie_title, detail_duedate, detail_returndate from detailrental, movie, rental, video
where datediff(detail_duedate, detail_returndate) < 0
	and movie.movie_num = video.movie_num
	and detailrental.vid_num = video.vid_num
    and detailrental.rent_num = rental.rent_num;
    
    
/*20*/
select rental.rent_num, rental.rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate, detail_fee, datediff(detail_returndate, detail_duedate) as days_past_due from detailrental, movie,rental,video
where datediff(detail_duedate, detail_returndate) < 0
	and movie.movie_num = video.movie_num
	and detailrental.vid_num = video.vid_num
    and detailrental.rent_num = rental.rent_num;
    
    
/*21*/
select rental.rent_num, rental.rent_date, movie_title, detail_fee from detailrental, movie,rental,video
where datediff(detail_duedate, detail_returndate) >= 0
	and movie.movie_num = video.movie_num
	and detailrental.vid_num = video.vid_num
    and detailrental.rent_num = rental.rent_num;
    
/*22*/



/*23*/



/*24*/
alter table detailrental
add DETAIL_DAYSLATE int(4) GENERATED ALWAYS AS (datediff(detail_returndate, detail_duedate));

select * from detailrental;

/*25*/


/*26*/

/*27*/


































    
    