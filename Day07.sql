drop table musteri_urun;
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
select * from musteri_urun;
-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
select distinct (urun_isim) from musteri_urun;
select urun_isim from musteri_urun group by urun_isim;-- yukarıdaki kod ile aynı sonucu verir
-- Tabloda kac farkli meyve vardir ?
select count(urun_isim),urun_isim from musteri_urun group by urun_isim;
select count(distinct urun_isim),urun_isim  from musteri_urun group by urun_isim;

-- FETCH NEXT (SAYI) ROW ONLY- OFFSET-- LIMIT
-- 1) Tabloyu urun_id ye gore siralayiniz
-- 2) Sirali tablodan ilk 3 kaydi listeleyin
-- 3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin

-- Musteri urun tablosundan ilk 3 kaydi listeleyiniz.
select * from musteri_urun order by urun_id fetch next(3)row only;
select * from musteri_urun order by urun_id limit (3);
-- Musteri urun tablosundan ilk kaydi listeleyiniz.
select * from musteri_urun order by urun_id limit 1;

drop table maas;
CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
);
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);
select * from maas;

-- en yuksek maas ı alın
select * from maas order by maas desc limit 1;
-- en yuksek 2 maas ı bulun
select * from maas order by maas desc offset 1 limit 1;
select * from maas order by maas desc fetch next 1 row only offset 1
-- Maas tablosundan en dusuk 4. maasi listeleyiniz
select * from maas order by maas desc offset 3 limit 1 ;

--Maas tablosundan en en yuksek 4. ve 7. maasi listeleyiniz
select * from maas
   where maas   in
   ((select maas from maas order by maas desc  offset 3 limit 1),
	(select maas from maas order by maas desc  offset 6 limit 1))
