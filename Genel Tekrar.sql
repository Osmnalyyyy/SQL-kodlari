select * from personel;
alter table personel drop column isim;
alter table personel add isim varchar(20);
alter table personel drop column isim;
select * from personel;
alter table personel rename to isciler;
select * from isciler;
alter table isciler rename to personel;
drop table personel;

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);
select * from calisanlar;
CREATE TABLE calisanlar2
(
id CHAR(5) , -- not null + unique
isim VARCHAR(50) ,
maas int NOT NULL,
ise_baslama DATE,
	CONSTRAINT pk_id primary key(id),
	CONSTRAINT ism_unq unique(isim)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); -- unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- unique
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key

select * from calisanlar;

delete from calisanlar
where isim ='osman';

CREATE table adresler(
adres_id char(5),
	sokak varchar(20),
	cadde varchar(30),
	sehir varchar(20),
	constraint adres_fk foreign key (adres_id) references calisanlar(id)
	);

drop table adresler;

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;
INSERT INTO adresler VALUES(null,'Ağa Sok', '30.Cad.','Antep');
--calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin
select * from calisanlar,adresler where calisanlar.id=adresler.adres_id;
drop table calisanlar;-- önce child tabloyu silmemiz lazım

drop table adresler;
drop table calisanlar;
CREATE TABLE calisanlar--parent  primary key olan parent table olur
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

create table calisanlar(
id char(6) primary key,
	isim varchar(20) unique,
	maas int not null,
	ise_baslama date
);
drop table calisanlar;

select * from calisanlar;
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

update  calisanlar 
set isim='sevgi' where isim is null;
update calisanlar
set id='10001' where isim='osman';
select * from calisanlar order by id;
CREATE TABLE adresler--child  foreign key olan child olur
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
	constraint adres_fk foreign key (adres_id) references calisanlar (id)
);
select * from adresler;
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler,calisanlar where adresler.adres_id=calisanlar.id;


CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);


CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade --bunu ekleyınce parent tabloyu silebiliriz
);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

CREATE TABLE talebeler
(
id CHAR(3)  ,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

alter table talebeler
add constraint talebe_pk primary key (id);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int
);
alter table notlar
add constraint notlar_fk foreign key (talebe_id) references talebeler(id);

delete from notlar where talebe_id='123';

select * from notlar;
select * from talebeler;
alter table talebeler
add constraint sinir check(yazili_notu>60)
insert into talebeler values('99','osman','ali',61);
select * from talebeler;

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);
create table ogrenci_adres
as select id,isim from ogrenciler;

select * from ogrenci_adres;

create table ogr_bilgi
as
select isim,yazili_notu from ogrenciler;
 select * from ogr_bilgi;

select * from ogrenciler;

alter table ogrenciler
add constraint ogr_pk primary key (id);

select * from talebeler;
select * from talebeler where yazili_notu>85;


create table personel
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

select * from personel where maas between 70000 and 90000;

select * from personel where id between '1003' and '1005';
select * from personel where isim between 'Ali Can' and 'Derya Soylu';

select * from personel where id in ('1002','1003','1004');
select * from personel where maas in(70000,100000);

select * from personel where isim similar to 'A%';
select * from personel where isim ~* '^a(.*)';
select * from personel where isim ~~* '_e%';

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

select * from kelimeler where kelime similar to 'hi%' or kelime similar to 'ho%'
select * from kelimeler where kelime similar to 'hi%|ho%';
select * from kelimeler where kelime ~* '^hi(.*)' or kelime ~* '^ho(.*)';
-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
select * from kelimeler where kelime ~* '^h[a-z,A-Z,0-9]t$';
--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye
select * from kelimeler where kelime ~* 'h[a-e]t';
select * from kelimeler where kelime ~* '^h[a-e]t$';
select * from kelimeler where kelime similar to 'h[a-e]t'
--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~*'^[a,s,y](.*)';
select * from kelimeler where kelime similar to '[asy]%'
select * from kelimeler where kelime ~~* 'a%' or kelime ~~* 'y%' or kelime ~~* 's%'
--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime similar to '%[maf]';
select * from kelimeler where kelime ~~* '%m' or kelime ~~* '%f' or kelime ~~* '%a' 
select * from kelimeler where kelime ~* '(.*)[m,f,a]$'

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');


select * from urunler;
select * from tedarikciler;
--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler
set firma_ismi='Vestel' where vergi_no=102;
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 
--'Ali Veli' olarak güncelleyiniz.
update tedarikciler
set firma_ismi='casper' , irtibat_ismi='Ali Veli' where vergi_no=101;

--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler 
set urun_isim='Telefon' where urun_isim='Phone';

--  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler
set urun_id=urun_id+1 where urun_id>1004;

--  urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun 
--değerleri ile toplayarak güncelleyiniz.
update urunler
set urun_id=urun_id+ted_vergino 

--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update urunler								
set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')								
where musteri_isim='Ali Bak'
-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler									
set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') where urun_isim='Laptop';									


CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
select * from calisanlar2;

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from markalar;
-- calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada
-- calisanlarin isimlerini ve maaşlarini listeleyin.
select isim, maas , isyeri from calisanlar2 where isyeri in(select marka_isim from markalar where calisan_sayisi>15000)
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
select isim,maas,sehir from calisanlar2 where isyeri in(select marka_isim from markalar where marka_id>101);
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar2  where sehir='Ankara');


CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
CREATE TABLE nisan
(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from nisan;
select * from mart;
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select musteri_isim,urun_isim from nisan
where exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);


--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select musteri_isim,urun_isim from nisan
where not exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--          AGGREGATE METHOD KULLANIMI
--  aggregate methodlari:
-- SUM(topla),COUNT(say),MIN(en kucuk deger),MAX(en buyuk deger),AVG(ortalama)
-- subquery icin kullanılır ancak sorgu tek bir deger donduruyor olmalıdır
--SYNTEX :sum() şeklinde olmalı sum () arasında boşluk olmamalı

-- çalışanlar2 tablosundaki en yuksek maaş degerini listeleyiniz
select max(maas) "en yuksek maas" from calisanlar2;

--çalışanlar2 tablosundaki maaslarin toplamını listeleyiniz
select sum(maas) "toplam maas" from calisanlar2;

--calisanlar2 tablosundaki maas ortalamasını listeleyiniz
select round(avg(maas),2) "salary_avg" from calisanlar2;

-- çalışanlar2 tablosundaki en dusuk maaş degerini listeleyiniz
select min(maas) "min_salary" from calisanlar2;

-- çalışanlar2 tablosundaki kac kisinin maas aldıgını listeleyiniz
select count(maas)"salary_count" from calisanlar2;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 where marka_isim=isyeri)
as sum_salary from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve
-- minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select max(maas) as max_salary from calisanlar2 where marka_isim=isyeri),
(select min(maas) as min_salary from calisanlar2 where isyeri=marka_isim) from markalar;

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir) "number of city" from calisanlar2 where isyeri=marka_isim) from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select maas from calisanlar2 order by maas desc limit 1 offset 1;

select max(maas) from calisanlar2
where maas<(select max(maas) from calisanlar2);

----Interview Question: En düşük ikinci maas değerini çağırın
select maas from calisanlar2 order by maas limit 1 offset 1;

select min(maas) from calisanlar2
where maas>(select min(maas) from calisanlar2);

--En yüksek üçüncü maas değerini bulun
select maas from calisanlar2 order by maas desc limit 1 offset 2;

select max(maas) from calisanlar2
where maas<(select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2));

--En dusuk üçüncü maas değerini bulun
 select maas from calisanlar2  order by maas  limit 1 offset 2;

select min(maas) from calisanlar2
where maas>(select min(maas) from calisanlar2 where maas>(select min(maas) from calisanlar2));


										--- SQL SON DERS
CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
select sum(salary) "total salary",name
from workers 
group by name
having sum(salary)>2500;

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
select state,count(state)
from workers
group by state
having count(state)>1;

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state,max(salary) 
from workers
group by state
having max(salary)<3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary)
from workers
group by company
having min(salary)>2000;

--Tekrarsız isimleri çağırın.
select distinct name from workers;

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select  name,company from workers order by length(company) ;


					----- CONCAT  iki sütunu birleştirir


--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
select concat(name,'-',state) "name_state    " from workers
order by length(name)+length(state);

select name ||'-'||state||'='||length(name)+length(state) as name_state from workers;


						-- UNION  iki sorgu değerini birleştirir
				 		--		  unique olanları verir
					--				  tek bir süruna çok sütun koyabiliriz
						--		  tek sütuna koyarken data türüne dikkat etmek gerekir


-- salary değeri 3000'den yüksek olan state değerlerini ve salary değeri
-- 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
select state"name&salary" ,salary 
from workers
where salary>3000

union

select name,salary
from workers
where salary<2000;

-- salary değeri 3000'den yüksek olan state değerlerini ve
-- 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state "name & state",salary
from workers
where salary>3000

union all

select name,salary
from workers
where salary<2000;

						--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common)
											  --değerlerini verir. 
				             			      --Unique(tekrarsız) recordları verir.
											  
											  
--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name
from workers
where salary>1000

intersect

select name
from workers
where salary<2000;

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name 
from workers
where company in('IBM','APPLE','MICROSOFT')

intersect

select name 
from workers
where salary<2000;

						--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
										--Unique(tekrarsız) recordları verir.
										--except--birinde olupta digerinde olmayanlari verir


--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name 
from workers
where salary<3000  --- burada var

except 

select name 
from workers
where company='GOOGLE';--- burada yok

CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;


/*
  		   JOINS   1) Inner join:Ortak (common) datayı verir (table1 & table2)
				   2) Left join :Birinci tablenin tüm datasını verir
				   3) Right join:Birinci tablenin tüm datasını verir
				   4) Full join:iki table nin tüm datasını verir
				   5) Self join:Tek table üzerinde çalışırken iki table varmış gibi çalışılır

*/

--1) INNER JOIN
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.
select  mc.company_name,o.order_id,o.order_date
from my_companies mc inner join orders o
on mc.company_id = o.company_id;

-- 2) LEFT JOIN
--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
select mc.company_name,o.order_id,o.order_date
from my_companies mc left join orders o
on mc.company_id = o.company_id;
--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın
select mc.company_name,o.order_id,o.order_date
from my_companies mc right join orders o
on mc.company_id = o.company_id;

--FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.
select mc.company_name,o.order_id,o.order_date
from my_companies mc full join orders o
on mc.company_id = o.company_id;

select * from my_companies;
select * from orders;

drop table workers;

CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;


--SELF JOIN
--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.

select employee.name as Employee,manager.name as Manager
from workers employee full join workers manager
on employee.manager_id=manager.id;

select employee.name , manager.name--tekrarlıları vermez
from workers employee  join workers manager
on employee.manager_id=manager.id;








