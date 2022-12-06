CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

 select * from personel
 select * from personel where id>'1003' and id<'1005';
 select * from personel where id between '1003' and '1005';
 select * from personel where isim between 'D' and 'Y';
  select * from personel where isim not between 'D' and 'Y';
   select * from personel where isim ='Sena' and maas=70000;
   
update personel set isim=' Can' where id='1002'; -- güncelleme yapar en sona atar
-- maasları lar 10 artır tüm listenin
update personel set maas =10;  