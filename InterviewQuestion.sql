create Table  Employee 
(
employee_id int primary key,
firstname varchar(20),
lastname varchar(20),
city char(15),
state   char(15)
);
select * from payments
INSERT INTO employee values (10330,'John','John','NY','NY')
insert into employee values (10449,'Sarah','Lebat','Melbourne','Bourke')
insert into employee values (11012,'Jon','Dallas','NY','NY')
insert into employee values (11013,'Gheorghe','Honey','NY','NY')
insert into employee values (11014,'Anton','Savar','NY','NY')
select * from employee
select * from payments
delete from payments
drop table payments
create table payments 
(
employee_id int ,
salary_date char(10),
month_id int,
valuef int,
constraint  f_k5 foreign key(employee_id) references Employee(employee_id)
    
);
insert into payments values (10330,'June',6,128);
insert into payments values (10330,'July',7,158);
insert into payments values (10330,'August',8,133);
insert into payments values (10330,'September',9,120);
insert into payments values (10330,'October',10,188);
insert into payments values (10330,'November',11,160);
insert into payments values (10330,'December',12,105);
insert into payments values (10449,'September',9,150);
insert into payments values (10449,'October',10,158);
insert into payments values (10449,'November',11,160);
insert into payments values (10449,'December',12,180);

-- Soru1: Her çalışanın adı ve soyadına göre kazanılan toplam tutarı görüntülemek için SQL sorgularını yazın.
select employee_id,firstname,lastname,(select sum(valuef) from payments where Employee.employee_id=employee_id) from employee;
-- 2 yol
Select firstname, lastname, employee_id,
(Select Sum(valuef) As sum_value From payments Where payments.employee_id = employee.employee_id)
From employee Where (Select Sum(valuef) From payments Where payments.employee_id = employee.employee_id) is not null;
-- 3 yol 
Select firstname, lastname, employee_id,
(Select Sum(valuef) As sum_value From payments Where payments.employee_id = employee.employee_id)
From employee Where employee_id In(Select employee_id From payments)

-- Soru2: Adları J harfi ile başlayan tüm çalışanları görüntüleyin.
select * from employee where firstname ~~'J%';

CREATE TABLE personel (
id int, isim varchar(50), sehir varchar(50), maas int, sirket varchar(20) );
CREATE TABLE isciler
(id int, isim varchar(50), sehir varchar(50), maas int, sirket varchar(20));

INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500,'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500,'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLSFARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000,'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TDBANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500,'IBM');

INSERT INTO isciler VALUES(123456789,'JohnWalker','Florida',2500,'IBM');
INSERT INTO isciler VALUES(234567890,'BradPitt','Florida',1500,'APPLE');
INSERT INTO isciler VALUES(345678901,'EddieMurphy','Texas',3000,'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500,'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500,'IBM');
select * from personel;
select * from isciler;
--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen queryyaziniz

select isim as Personel_isim, id as ortak_id from personel where id in(
SELECT id FROM isciler WHERE isciler.id=personel.id); 


