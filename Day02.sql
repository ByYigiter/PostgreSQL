CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
	soyisim varchar(25),
	not_ort real,-- ondalıklıl sayılar için kullanılır
	kayit_tarihi date  -- en son headersdan sonra , koyulmaz
);-- ; mysql ve oracle için zorunlu ama postgre için zorunlu değil

-- varolan bir tablodan yeni tablo oluşturma,
create table Notlar
as
select isim,not_ort from ogrenciler2;

select * from notlar

-- insert tablo içine veri ekleme
insert into notlar values ('yigit',95);-- value degerleri uzerinde degiştir codu seç ve f5 yap eklendi 
										--yukarıdan  select * from notlar seç f5 yap görünür
select isim from notlar

-- constraint
-- unique ve not null

CREATE TABLE ogrenciler3
(
ogrenci_no char(7) unique,-- unique yapınca tekrarsız olur bakmak için-> tablo sağ tıkla-> properties ->constraint
isim varchar(20) not null,
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date 
);
select * from ogrenciler3

insert into ogrenciler3 values('123456','yigit','er',89.5,now())
insert into ogrenciler3 values('123456','Ali','er',89.5,now()); --duplicate key value violates unique constraint "ogrenciler3_ogrenci_no_key"
-- parcalı ekleme   
insert into ogrenciler3 (ogrenci_no,soyisim,kayit_tarihi) values ('12345','recep',now());--null value in column "isim" of relation "ogrenciler3" violates not-null constraint
																-- isim null olamaz o sebeple hat verir yukarıdaki satır
																
-- PRIMARY KEY OLUŞTURMA

CREATE TABLE ogrenciler4
(
ogrenci_no char(7) primary key,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarihi date 
);
-- PRIMARY KEY OLUŞTURMA 2 yol

CREATE TABLE ogrenciler5
(
ogrenci_no char(7) ,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarihi date, 
	constraint ogr primary key(ogrenci_no) -- yada sadece  primary key(ogrenci_no) şeklinde oluşturulavilir 
											--constraint sadece bir isim ataması yapar belli etmek için
);


/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
-- foreign key primary key bağlanti
create table tedarikciler3
(
tedarikci_id char(5) primary key,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20)
);

create table urunler (
tedarikci_id char(5),
	urun_id char(5),
	foreign key (tedarikci_id) references tedarikciler3(tedarikci_id) 
);
select * from tedarikciler3
select * from urunler
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/
create table calisanlar (
id char (15) primary key,
	isim varchar (30)unique,
	maas int not null,
	ise_baslama date
);
create table adresler(
adres_id char(5),
	sokak varchar (15),
	cadde varchar (15),
	sehir varchar (15),
	foreign key (adres_id) references calisanlar (id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');-- isim null kabul etti 
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--isimden dolayı hata verir. isim unique 
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--maas null olamaz maas =not null 
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--2 tane can olmaz 
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- syntax hatası  maas int ama maası string yzzdık 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');-- 1 defa hiçlik primary key kabul eder
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--2 hiçliği kabul etmez 
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key null kabul etmez

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');--10012 id yok ekleme yapamaz Key (adres_id)=(10012) is not present in table "calisanlar".
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;

-- check constraint ekleme 
create table calisanlar1 (
id char (15) primary key,
	isim varchar (30)unique,
	maas int check(maas>10000),
	ise_baslama date
	);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
 
 -- DQL -- where kullanımı
 
 select * from calisanlar
 select isim from calisanlar where maas>5000;
 
 -- calisanmlardan ismi Veli Han olan tüm verileri getir
select * from calisanlar where isim ='Veli Han';

-- calisanlardan maas =5000 olan tüm bilgileri getir
select * from calisanlar where maas =5000

-- DML -- delete  komutu

delete from adresler;-- içindeki biligielri siler tabloyu silmez
select * from adresler;
-- şartlı silme
delete from adresler where sehir ='Antep';



 

