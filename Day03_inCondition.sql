CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
select * from musteriler; 

-- Musteriler tablosundan urun ismi orange, apple veya apricot olan dataları listeleyiniz
select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot'
-- in condition 
select * from musteriler where urun_isim in('Orange','Apple','Apricot')
-- not in condition
select * from musteriler where urun_isim not in('Orange','Apple','Apricot')
/*BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir */ 
select * from musteriler where urun_id>=20 and urun_id<=40; --40>=urun_id  seklinde de olur
select * from musteriler where urun_id between 20 and 40;
select * from musteriler where urun_id not between 20 and 40;

--SUBQUERIES(ALT SORGU) Iki tablodan gecici olarak tek bir tabloda sorgulama--> sorgu icinde sorgu

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
insert into markalar values(104,'Nike',19000)-- calisanlarda nike olmadığı için bağlantı kuramadı ve göstemez subqueriesde

select * from calisanlar2;
select * from markalar;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve  (şart koşulan tablo farklı dikkat et)
-- bu markada calisanlarin isimlerini ve maaşlarini listeleyin. (ortak olanları bul marka_isim ler isyeri ortak)
select isim,maas,isyeri from calisanlar2 where isyeri in(select marka_isim from markalar where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select isim,maas,sehir from calisanlar2 where isyeri in(select marka_isim from markalar where marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

select marka_id,calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara');
--aggregate method 
select max(maas) from calisanlar2;
select max(maas) as maksimum_maas from calisanlar2; --as komutu sütunun ismini tanımlama yaparız  maksimum_maas gibi
select min(maas) as minimum_maas from calisanlar2
select sum(maas) from calisanlar2
select avg(maas) from calisanlar2
select round (avg(maas)) from calisanlar2-- virgulden sonrasını kaldırır yada yuvarlar
select round (avg(maas),2) from calisanlar2-- virgulden sonrası 2 rakam olması için bu komut kullanılır
select count(*) from calisanlar2-- bize satır sayısını verir (içerisi ne olursa olsun) toplam satırı verir
								-- ama null olan bir headers say dediğimizde null degeri saymaz

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
select marka_id,marka_isim ,(select count(sehir) from calisanlar2 where marka_isim=isyeri)from markalar; 

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_id,marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 where marka_isim=isyeri) from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_id,calisan_sayisi, 
(select max(maas) from calisanlar2 where marka_isim=isyeri),-- bağlantı olan sutunlar için eşitlik şartı koyulmalı. 
(select min(maas) from calisanlar2 where marka_isim=isyeri) from markalar

-- view kullanımı

create view max_min_maas as 
select marka_id,calisan_sayisi, 
(select max(maas) from calisanlar2 where marka_isim=isyeri),
(select min(maas) from calisanlar2 where marka_isim=isyeri) from markalar

select * from max_min_maas;-- method mantığı view bir isim atama da işlem yap  ve çağırma işlemi


