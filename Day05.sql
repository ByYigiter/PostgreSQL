drop table personel
CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1)Isme gore toplam maaslari bulun
select isim,sum(maas) from personel group by isim;
--2)Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket, count(*) from personel where maas>5000 group by sirket ;
--3) sehre gore toplam personel sayısını bulun
select sehir, count (isim) from personel group by sehir; --count(id) de olur
--4) her şirket için min max maası bulun
select sirket,min(maas),max(maas) from personel group by sirket;

-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.

-- Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket,min(maas) from personel group by sirket;
--eger gruplamadan sonra yeniden sart istenirse having kullanıllr
-- where kullanımı group by dan sonra yapılamaz
/*
	Having komutu yalnizca GROUP BY komutu ile kullanilir
	Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir
*/
select sirket,min(maas) from personel group by sirket having min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise 
-- ismi ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas) from personel group by isim having sum(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select count(isim) as personel_sayisi,sehir  from personel group by sehir having count(isim)>1;

-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir, max(maas) from personel group by sehir having max(maas)<5000;

--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir.

-- 1) Maasi 4000’den cok olan isci isimlerini ve 
	--5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_sehir,maas from personel where maas>4000
union
select sehir,maas from personel where maas>5000;

-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve 
-- Istanbul’daki personelin maaslarinibir tabloda gosteren sorgu yaziniz
select isim, maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir ='Istanbul'













