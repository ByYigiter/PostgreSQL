

select * from Customers where country like 'S_____'


select * from  Customers where CompanyName  like '__[^A-D]_%'


select * from Customers where Country ='Brazil' or Country ='USA';  --  a���dak� ile fark� h�z fark� vard�r bu daha yava�t�r
select * from Customers where Country in('Brazil','USA','Spain');

select * from Products where ProductName like '% %' -- 1 den fazla kelime olanlar aradak� o�luk �eklinde sorgulan�r

select CompanyName,City as sehir from Customers where Country='USA' order by  sehir desc, CompanyName asc; -- order by en son cali��r yani as i�lemini kabul etmeisi ondan
																								-- �nde select where sonucular� al�n�r c�kan sonu�cu s�ralama demek olur

		select CompanyName,City as sehir from Customers where Country='USA' order by  1 desc -- yaz�lacak sutun say�s� ka� ise yazd���n s�ralamadan se�er sutunu

select top 1 *  from Customers  order by  NEWID() -- random se�im yapmak i�in kullan�l�r random s�ralar

select top 1 FirstName, LastName from Employees order by HireDate desc
