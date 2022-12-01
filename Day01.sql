--DDL  -DATA DEFINITION LANG.
-- CREATE  - TABLO OLUŞTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
	soyisim varchar(25),
	not_ort real,-- ondalıklıl sayılar için kullanılır
	kayit_tarihi date  -- en son headersdan sonra , koyulmaz
);-- ; mysql ve oracle için zorunlu ama postgre için zorunlu değil

--VAR OLAN TABLODAN YENİ BİR TABLO OLUŞTURMAK İÇİN

create table ogrenci_notlari
as -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
select isim,soyisim,not_ort from ogrenciler;

-- DML  data manupilatıon
-- INSERT (database e veri ekleme)
insert into ogrenciler values('1234567','yigit', 'er',85.5,now()); --now() bugünün tarihini atar
insert into ogrenciler values('1234567','recep', 'er',85.5,'2022-12-01');

-- BİR TABLOYA PARCALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler (isim,soyisim) values ('erol','evren');

--DQL data query lang. 
-- select

select * from ogrenciler-- ogrenciler den tum bilgileri getir
select * from ogrenciler1