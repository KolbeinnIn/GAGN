/*Kolbeinn Ingólfsson*/
use 0908002640_sale;

/*1.*/
SELECT * FROM customer
WHERE CUS_AREACODE='0181' and CUS_LNAME='Smith';

/*2.*/
select * from product;
select v_code from product
where p_qoh<p_min*2 and v_code is not null;

/*3.*/
select p_code,p_descript from product
where v_code is not null;

/*4.*/
select v_code from product
where v_code is not null;

/*5.*/
select distinct v_code from product
where v_code is not null;

/*6.*/
select v_code, v_name from vendor
where
exists (select v_code from product where v_code is null);

/*7.*/
select v_code, v_name from vendor
where v_code
not in (select v_code from product where v_code is not null);

/*8.*/
alter table product modify p_price decimal(9,2);

/*9.*/
alter table product add p_salecode char(1);

/*10.*/
alter table product drop p_salecode;

/*11.*/
CREATE VIEW p_to_order AS
SELECT p_code,p_descript,p_qoh
FROM product
WHERE p_qoh < (p_min+10);

select * from p_to_order;

/*12.*/
CREATE INDEX p_index on product(p_code,v_code);
/*how to drop index:
alter table product drop index index_name; */

show index from product;