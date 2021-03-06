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

ALTER TABLE LINE ADD CONSTRAINT FOREIGN KEY(LINE_PROD_CODE) REFERENCES PRODUCT(PROD_CODE);/* ON UPDATE SET NULL;*/
ALTER TABLE LINE ADD CONSTRAINT FOREIGN KEY(LINE_INV_NUMBER) REFERENCES INVOICE(INV_NUMBER) ON DELETE CASCADE;
ALTER TABLE INVOICE ADD CONSTRAINT FOREIGN KEY(INV_CUS_CODE) REFERENCES CUSTOMER(CUS_CODE) ON UPDATE CASCADE;
ALTER TABLE PRODUCT ADD CONSTRAINT FOREIGN KEY(PROD_V_CODE) REFERENCES VENDOR(VEND_CODE);
ALTER TABLE INVOICE ADD INV_EMP_NUM INT NOT NULL; /*ATH*/
ALTER TABLE INVOICE ADD CONSTRAINT INV_EMP_NUM FOREIGN KEY(INV_EMP_NUM) REFERENCES EMPLOYEE(EMP_NUM); /*ATH*/




INSERT INTO CUSTOMER
VALUES
	(10010,'Ramas','Alfred','A','0181','844-2573',0),
	(10011,'Dunne','Leona','K','0161','894-1238',0),
	(10012,'Smith','Kathy','W','0181','894-2285',345.86);
    
    
INSERT INTO INVOICE(INV_NUMBER, INV_CUS_CODE, INV_DATE)
VALUES (1001,10010,'2008-01-16'),
(1002,10011,'2008-01-16'),
(1003,10012,'2008-01-16');



INSERT INTO LINE
VALUES (1001,1,1,14.99,'13-Q2/P2'),
(1001,2,1,9.95,'23109-HB'),
(1002,1,2,4.99,'54778-2T');




INSERT INTO VENDOR
VALUES
(21225,'Bryson, Inc.','Smithson','0181','223-3234','UK','Y'),
(21226,'SuperLoo, Inc.','Flushing','0113','215-8995','SA','N'),
(21231,'D\&E Supply','Singh','0181','228-3245','UK','Y');

INSERT INTO PRODUCT
VALUES 
('11QER/31','Power painter, 15 psi., 3-nozzle','2007-11-07',8, 5,109.99,0.00,25595),
('13-Q2/P2','7.25-cm. pwr. saw blade','2007-12-14', 32, 15, 14.99,0.05,21344),
('14-Q1/L3','9.00-cm. pwr. saw blade','2007-11-13', 18, 12, 17.49,0.00,21344);


