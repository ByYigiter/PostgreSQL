-- ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar where marka_isim in (select isyeri from calisanlar2 where sehir ='Ankara');
select * from markalar;

--									ALIASES
-- Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.
CREATE TABLE calisanlar01 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar01 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar01 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar01 VALUES(345678901, 'Mine Bulut','Izmir');
select * from calisanlar01;

select calisan_id as id from calisanlar01;-- as ile sütun ismini geçici olarak değiştiriyoruz
select calisan_id as id, calisan_isim||' '||calisan_dogdugu_sehir as isim_sehir from calisanlar01; --concat ile iki sutun birleşir ve 1 isim veririz
--2 yol
select calisan_id as id, concat(calisan_isim,' ',calisan_dogdugu_sehir) as isim_sehir from calisanlar01;-- ,' ' ile araya ara verir

--										IS NULL CONDITION
-- Arama yapilan field’da NULL degeri almis kayitlari getirir
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar;

-- name sutununda  null degerleri listeleyin
select * from insanlar where name is null;
select NAME from insanlar where name is not null;

-- insanlar tablosunda null deger almiş  nameleri no name olarak değiştririniz.
update insanlar set name='no name' where name is null;

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
drop table if exists insanlar;-- varsa siler

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar ORDER by adres;-- order by natural sıralama yapar
select * from insanlar ORDER by isim desc; -- sonuna asc(natural sıralama) yada desc(ters sıralama) oolarak sıramalama yapr

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar where isim='Mine' order by ssn asc;

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar where soyisim='Bulut' order by 2;--2 sutun sırası 2= isim sutunu 4 =aedres sutununa karşılık gelmektedir.

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * from insanlar order  by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar order by isim asc, soyisim desc;-- ilk şart isim ler sıralanır sonra aynı isimlerden soyisimleri tersten sıralar

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,  soyisim from insanlar order by length (soyisim);
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' '||soyisim as isim_soyisim from insanlar order by length(isim||soyisim);
select concat(isim,' ',soyisim) as isim_soyisim from insanlar order by length(concat (isim,soyisim));

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
select * from manav;

--Isme gore alinan toplam urunleri bulun

select sum (urun_miktar) from manav;-- tum urunlerın toplamını gönderir.
select isim,sum(urun_miktar) from manav group by isim; -- isimleri grup yap ve 2 sutun getir 1 sutun isim 2. sutun urun miktar toplamı sum şeklimde  
--Isme gore alinan toplam urunleri bulun ürünleri buyukten kucuğe sıralayın
select isim,sum(urun_miktar) from manav group by isim order by sum desc;--geçici isim(sum) burada kabul ediyor as ile tanımlamayapıp yazabilirdik

-- Urun ismine gore urunu alan toplam kisi sayisi
select  urun_adi,sum(urun_miktar) from manav GROUP by urun_adi; --** grup yaptığın sutunu (urun_adi) mutlaka select te olmalı ***








