-- 								LIKE Condition
/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
	imkani verir.
*/
drop table musteriler cascade;
CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
INSERT INTO musteriler  VALUES (1016, 'ahet', 83000);

select * from musteriler;
-- 1) % => 0 veya birden fazla karakter belirtir
-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like 'A%';
select * from musteriler where isim ilike 'A%';
select * from musteriler where isim  ~~ 'A%';
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz
ilike yerine ~~* sembollerini kullanabiliriz
LIKE = ~~ 
ILIKE = ~~* 
NOT LIKE = !~~
NOT ILIKE = !~~* 
NOT REGEXP_LIKE = !~* 
NOT REGEXP_LIKE = !~
*/
--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler where isim ~~'%e';
--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler where isim ~~'%er%'; --başında sonunda ne olursa olsun er varmı
-- 2) _=> sadece bir karakteri gosterir.
-- SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~'_atma';-- tek karakter ne olursa olsun getir.
--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~'_a%';
--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~'__s%';

-- LIKE Condition
/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 3);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin
select * from kelimeler where kelime ~'h[ai]t';
select * from kelimeler where kelime ~*'h[ai]t';
--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin
select * from kelimeler where kelime ~'h[a-k]t';
--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler  where kelime ~'^[as]';-- ^ işareti başlayan demek regex ile yapımı $ işareti ile biten demek

-- UPPPER LOWER INITCAP kullanımı
-- Kelimeler tablosundaki kelime sütunundaki verileri önce hepsini büyük harf, sonra küçük harf ve ilk harfleri
-- büyük olucak şekilde yazdıralım
select upper (kelime) from kelimeler;
select lower (kelime) from kelimeler;
select initcap (kelime) from kelimeler;
update kelimeler set kelime =upper(kelime);






