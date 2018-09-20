create database 0908002640_bus_db;
use 0908002640_bus_db;


create table Routes(
	route_nr int auto_increment primary key,
    ppd int not null
);

create table Drivers(
	employee_nr int auto_increment primary key,
    f_name varchar(18) not null,
    l_name varchar(18) not null,
    street_name varchar(25) not null,
    house_nr int not null,
    phone_nr varchar(20) NULL,
    stage_id int not null,
    foreign key(stage_id) references Stage(stage_id)
);

create table Busses(
	r_number char(5) primary key,
    passengers int not null,
    decks int not null,
    route_nr int not null,
    foreign key (route_nr) references Routes(route_nr) 
);

create table Garage(
	garage_nr int auto_increment primary key,
    capacity int not null,
    street_name varchar(25) not null,
    house_nr int not null
);

create table Towns(
	town_nr int auto_increment primary key,
	town_name varchar(25) not null,
    zip_code char(3) not null,
    garage_number int null,
    foreign key(garage_number) references Garage(garage_nr)
);

create table Stage(
	stage_id int auto_increment primary key,
    route_id int not null,
    foreign key(route_id) references Routes(route_nr)
);

create table Stage_Town(
	stage_nr int auto_increment primary key,
    town_nr int not null,
    foreign key(stage_nr) references Stage(stage_id),
    foreign key(town_nr) references Towns(town_nr)
);