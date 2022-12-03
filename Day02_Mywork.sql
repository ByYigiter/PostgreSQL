Create table ogrenciler6
(
id int,
	isim varchar (50),
	veli_isim varchar (50),
	yazili_notu int
);

INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler6;

delete  from ogrenciler6 where id=125;
delete from ogrenciler6 where isim='Kemal Yasa';
delete from ogrenciler6 where isim='Nesibe Yilmaz' or isim='Mustafa Bak';
delete from ogrenciler6 where isim='Ali Can' And  id =123;