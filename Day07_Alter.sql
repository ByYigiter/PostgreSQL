/*
					ALTER TABLE STATEMENT
					
	ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns
	islemleri icin kullanilir.
	ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.
 */
 drop table personel;
 CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda')
select * from personel;

--1) ADD default deger ile tabloya bir field ekleme
Alter table personel add ulke varchar(30);
Alter table personel add adres varchar(50) default 'Turkiye';
ALTER TABLE personel add zipcode varchar(30)
--2 ) drop tablodan sutun silme 
alter table personel drop zipcode;
alter table personel drop ulke , drop adres;
--3 )RENAME COLUMN sutun adi degistirme
alter table personel rename column sehir to il; -- drop ve add den sonrada column yazılabilir 
alter table personel rename to isciler;
select * from isciler;
--TYPE/SET(modify) sutunlarin ozelliklerini degistirme
alter table isciler alter column il type varchar(30), alter column maas set not null;
alter table isciler alter il type varchar(25), alter  maas set not null;
-- int string using kullanmadan dönusür ama string int olması için using gerekir data casting oluyor
alter table isciler alter column maas type varchar (35) using (maas::varchar(35));


/*
			TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT
	Transaction veritabani sistemlerinde bir islem basladiginda baslar ve bitince sona erer. Bu
	islemler veritabani olusturma, veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.
 */
-- TRANSACTION 
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

