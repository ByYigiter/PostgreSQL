-- INNER JOIN 
/*NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, '2020-04-21');

select * from sirketler;
select * from siparisler;

-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;

/*
 NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */
-- left join 
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler left join siparisler on sirketler.sirket_id=siparisler.sirket_id;
-- not from siparisler left join sirketler yazarsak right join ile aynı işlem olur cunku sol kumenin yeri değisince sağa geçer mantık bu
-- right join
/*
	NOT :
	1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
	2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
	ancak ortak olmayan datalar icin o kisimlar bos kalir
 */
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler right join siparisler on sirketler.sirket_id=siparisler.sirket_id;

/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler full join siparisler on sirketler.sirket_id=siparisler.sirket_id;

-- self join
drop table personel; -- eger iliski varsa drop table personel cascade ile silinecek

CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select p1.isim as per_isim, p2.isim as yon_isim from personel p1 inner join personel p2 on p1.yonetici_id=p2.id;





