create database 0908002640_SaleCo;

use 0908002640_SaleCo;

create table CUSTOMER(
	CUS_CODE INT(5) PRIMARY KEY,
    CUS_LNAME VARCHAR(10) NOT NULL,
    CUS_FNAME VARCHAR(10) NOT NULL,
    CUS_INITAL CHAR(1) NOT NULL,
    CUS_AREACODE INT(5) NOT NULL,
    CUS_PHONE VARCHAR(8),
    CUS_BALANCE DOUBLE
);

create table LINE(
	INV_NUMBER INT(4) PRIMARY KEY,
    INV_DATE DATE,
    INV_CUS_CODE INT(5),
    FOREIGN KEY (INV_CUS_CODE) REFERENCES customer(CUS_CODE)
);

create table line(
    LINE_INV_NUMBER INT(4),
	LINE_NUMBER INT(3),
    PRIMARY KEY(LINE_INV_NUMBER, LINE_NUMBER),
    LINE_UNITS INT(3) NOT NULL,
    LINE_PRICE DOUBLE NOT NULL,
    LINE_PROD_CODE VARCHAR(8) NOT NULL
);

create table PRODUCT(

);