create database 0908002640_SaleCo;

use 0908002640_SaleCo;

create table CUSTOMER(
	CUS_CODE INT(5) PRIMARY KEY,
    CUS_LNAME VARCHAR(10) NOT NULL,
    CUS_FNAME VARCHAR(10) NOT NULL,
    CUS_INITAL CHAR(1),
    CUS_AREACODE INT(5) DEFAULT '0181',
    CUS_PHONE VARCHAR(8),
    CUS_BALANCE DOUBLE DEFAULT 0.00
);

create table INVOICE(
	INV_NUMBER INT(4) PRIMARY KEY,
    INV_DATE DATE,
    INV_CUS_CODE INT(5)
);

create table LINE(
    LINE_INV_NUMBER INT(4),
	LINE_NUMBER INT(3),
    PRIMARY KEY(LINE_INV_NUMBER, LINE_NUMBER),
    LINE_UNITS INT(3) DEFAULT 0,
    LINE_PRICE DOUBLE DEFAULT 0.00,
    LINE_PROD_CODE VARCHAR(8) NOT NULL /*soon to be foreign key*/
);

create table PRODUCT(
	PROD_CODE VARCHAR(8) PRIMARY KEY,
    PROD_DESCRIPT VARCHAR(32),
    PROD_INDATE DATE,
    PROD_MIN INT(2),
    PROD_Q_ON_HAND INT(4),
    PROD_PRICE DOUBLE NOT NULL,
    PROD_DISCOUNT DOUBLE DEFAULT 0.00,
    PROD_V_CODE INT(5) NOT NULL
);

create table VENDOR(
	VEND_CODE INT(5) PRIMARY KEY,
	VEND_NAME VARCHAR(20) NOT NULL,
    VEND_CONTACT VARCHAR(8) NOT NULL,
    VEND_AREACODE CHAR(4),
    VEND_PHONE VARCHAR(8),
    VEND_COUNTRY_CODE CHAR(2) NOT NULL,
    VEND_ORDER ENUM('Y','N') NOT NULL
);

create table EMPLOYEE(
	EMP_NUM INT AUTO_INCREMENT PRIMARY KEY,
    EMP_TITLE CHAR (10),
    EMP_LNAME VARCHAR(15),
    EMP_FNAME VARCHAR(15),
    EMP_INITIAL CHAR(1),
    EMP_DOB DATETIME,
    EMP_HIR_DATE DATETIME,
    EMP_AREACODE CHAR(5),
    EMP_PHONE CHAR(8),
    EMP_MGR INT
);

ALTER TABLE LINE ADD CONSTRAINT FOREIGN KEY(LINE_PROD_CODE) REFERENCES PRODUCT(PROD_CODE) ON UPDATE SET NULL;
ALTER TABLE LINE ADD CONSTRAINT FOREIGN KEY(LINE_INV_NUMBER) REFERENCES INVOICE(INV_NUMBER) ON DELETE CASCADE;
ALTER TABLE INVOICE ADD CONSTRAINT FOREIGN KEY(INV_CUS_CODE) REFERENCES CUSTOMER(CUS_CODE) ON UPDATE CASCADE;
ALTER TABLE PRODUCT ADD CONSTRAINT FOREIGN KEY(PROD_V_CODE) REFERENCES VENDOR(VEND_CODE);
ALTER TABLE INVOICE ADD INV_EMP_NUM INT NOT NULL;
ALTER TABLE INVOICE ADD CONSTRAINT FOREIGN KEY(INV_EMP_NUM) REFERENCES EMPLOYEE(EMP_NUM);

DROP DATABASE 0908002640_SaleCo;



