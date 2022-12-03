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

-- ismi 'Nesibe Yilmaz' or isim='Mustafa Bak' sil
delete from ogrenciler6 where isim='Nesibe Yilmaz' or isim='Mustafa Bak';

delete  from ogrenciler6 where id=125;
delete from ogrenciler6 where isim='Kemal Yasa';

delete from ogrenciler6 where isim='Ali Can' And  id =123;

-- truncate tablodakii tüm verileri geri alamayacağımız şekilde siler şartlı silme yapmaz(Where)

truncate table ogrenciler6

-- ON DELETE CASCADE KULLANIMI
drop table if exists talebeler -- eğer talebeler varsa siler yeni oluşturacağımız table hata olayı kalkar

CREATE TABLE talebeler ( 
	id CHAR(3) primary key, 
	isim VARCHAR(50), 
	veli_isim VARCHAR(50), 
	yazili_notu int 
);

CREATE TABLE notlar2(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar2 VALUES ('123','kimya',75);
INSERT INTO notlar2 VALUES ('124', 'fizik',65);
INSERT INTO notlar2 VALUES ('125', 'tarih',90);
INSERT INTO notlar2 VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar2
-- notlar2 tablosundan talebe_id 123 olan data silme
delete from notlar2 where talebe_id='123';
--talebeler tablosundan id si 126 olan datayı silme
delete from talebeler where id='126';-- foreign tablede on delete cascade yazıldığı için talebelerdeki id=126 siler
									  -- sonra childdaki (notlar2) de 126 olan id de silinir 
									  -- on delete cascade olduğu için yazılmaz ise parentde silme yapılamaz






