CREATE TABLE musteri
(
		ad VARCHAR(20) NOT NULL,
	yas int NOT NULL,
	cinsiyet CHAR(1) NOT NULL,
	gelir MONEY NOT NULL,
	meslek VARCHAR(25) NOT NULL,
	sehir VARCHAR(25) NOT NULL
);
INSERT INTO musteri
VALUES
('ALİ',		35, 'E', 2500, 'MÜHENDİS',	'İSTANBUL'),
('BURAK',	25, 'E', 3500, 'MİMAR',		'İZMİR'),
('CEYHUN',	45, 'E', 2000, 'MÜHENDİS',	'ANKARA'),
('DEMET',	30, 'K', 3000, 'ÖĞRETMEN',	'ANKARA'),
('ELİF',	20, 'K', 4500, 'İŞLETMECİ',	'İSTANBUL'),
('FERHAT',	40, 'E', 2500, 'MİMAR',		'İZMİR'),
('GALİP',	55, 'E', 4000, 'ÖĞRETMEN',	'İSTANBUL'),
('KÖKSAL',	25, 'E', 2000, 'AVUKAT',	'İZMİR'),
('LEYLA',	60, 'K', 2500, 'MİMAR',		'İSTANBUL'),
('MELEK',	30, 'K', 2500, 'ÖĞRETMEN',	'İSTANBUL'),
('JALE',	40, 'K', 6000, 'İŞLETMECİ',	'ANKARA'),
('TEKİN',	45, 'E', 2000, 'AVUKAT',	'ANKARA'),
('SAMET',	20, 'E', 3000, 'MİMAR',		'İSTANBUL'),
('ŞULE',	20, 'K', 4500, 'ÖĞRETMEN',	'İSTANBUL'),
('VELİ',	40, 'E', 2500, 'ÖĞRETMEN',	'İZMİR'),
('ZEYNEP',	50, 'K', 3500, 'TESİSATÇI',	'İZMİR'),
('ARDA',	55, 'E', 2000, 'KUAFÖR',	'İZMİR'),
('MELİS',	30, 'K', 3000, 'KUAFÖR',	'ANKARA');

select * from musteri;
--mesleği avukat olanların sehirlerini listele
select * from musteri where meslek='AVUKAT';
-- sehir i ile başlayanlar
select * from musteri where sehir similar to 'İ%';
select * from musteri where sehir ~~* 'İ%';
select * from musteri where sehir  ~*'^İ(.*)';
--kadım müş. bilgilerini listele
select * from musteri where cinsiyet='K';
-- cinsiyeti kadın olup sehri İ ile baş. L ile biten
select * from musteri where  cinsiyet='K' and  sehir similar to 'İ%L';
--kadım müşteri mesleklerini listele
select meslek from musteri where cinsiyet='K';
select meslek from musteri where cinsiyet ~* 'k';
--yaşı 40-50 aralığında olan ankarada yaşayan müşterileri listele
select * from musteri where yas>40 and yas <50 and sehir ~~*'ankara';
--yaşı 30-40 aralığında olmayan müşterileri listele
select * from musteri where yas>40 or yas<30

--- SUBQUERIES --> SORGU içinde çalışan sorguya denir

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

select * from calisanlar2;
select * from markalar;
-- calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada
-- calisanlarin isimlerini ve maaşlarini listeleyin.
select isyeri,isim,maas from calisanlar2
where isyeri in(select marka_isim from markalar where calisan_sayisi>15000)


-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim,maas,sehir  from calisanlar2
where isyeri in(select marka_isim from markalar where marka_id>101);


-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar
where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara');

--maasi 2000 den yuksek olan markaların id lerini ve isimlerini listeleyin
select marka_id,marka_isim from markalar
where marka_isim in(select isyeri from calisanlar2 where maas>2000)


 -- EXISTS , NOT EXISTS --
select * from nisan;
drop table workers;

-- EXISTS condition subquerylerde kullanilir
-- IN ifadesinin kullanimina benzer
-- EXISTS , NOT EXISTS ifadeleri de altsorgudan getirilen degerlerin icerisinde
-- bir degerin olmasi veya olmamasi durumunda islem yapilmasini saglar
-- Exists true false gibidir

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists (select musteri_isim from mart where mart.urun_id=nisan.urun_id);
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where not exists (select musteri_isim from mart where mart.urun_id=nisan.urun_id);

--          AGGREGATE METHOD KULLANIMI
--  aggregate methodlari:
-- SUM(topla),COUNT(say),MIN(en kucuk deger),MAX(en buyuk deger),AVG(ortalama)
-- subquery icin kullanılır ancak sorgu tek bir deger donduruyor olmalıdır
-- SYNTEX :sum() şeklinde olmalı sum () arasında boşluk olmamalı

select * from calisanlar2;
select * from markalar;
-- çalışanlar2 tablosundaki en yuksek maaş degerini listeleyiniz
select max(maas) " max maas" from calisanlar2;
--çalışanlar2 tablosundaki maaslarin toplamını listeleyiniz
select sum(maas) "total salary" from calisanlar2;
--calisanlar2 tablosundaki maas ortalamasını listeleyiniz
select round(avg(maas)) "maas_avg" from calisanlar2;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas)
								  from calisanlar2 where isyeri=marka_isim) from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz. 
select marka_isim,calisan_sayisi,(select max(maas) "max maas" from calisanlar2 where isyeri=marka_isim),
(select min(maas) from calisanlar2 where isyeri=marka_isim) from markalar;
--En dusuk üçüncü maas değerini bulun
 select distinct maas from calisanlar2 order by maas limit 1 offset 2;

select min(maas) from calisanlar2 
where maas>(select min(maas) from calisanlar2 where maas>(select min(maas) from calisanlar2 ));

				-- IS NULL, IS NOT NULL, COALESCE --
				
--alter tabloyu değiştirir update veriyi değiştirir

/*
IS NULL ve IS NOT NULL boolean operatorleridir
Bir ifadenin null olup olmadigini kontrol eder
COALESCE  (birlestirme) bir fonksiyondur ve icerisindeki
parametrelerden null olmayan ilk ifadeyi dondurur
*/
select * from insanlar;

CREATE TABLE insanlar (	ssn CHAR(9), --Social Security Number	
					   isim VARCHAR(50), 	adres VARCHAR(50) );
					   
					   
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

-- ismi null olanlari sorgula
select * from insanlar where isim is null;
-- ismi null olmayanları olanlari sorgula
select * from insanlar where isim is not null;
-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update  insanlar
set isim='NO NAME' where isim is null;
-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
update insanlar
set isim=null where isim='NO NAME';
-- NOT:Çoklu degişimde her degişim icin set .... where isim is null gibi ifade yazmamak için 

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

update insanlar
set isim=coalesce(isim,'henüz isim girilmedi'),
 	ssn=coalesce(ssn,'no ssn'),
	adres=coalesce(adres,'adres girilmedi');

						-- ORDER BY --
						
-- ORDER BY cümleciği bir sorgu deyimi içerisinde belli bir sutu'a göre
-- sıralama yapmak için gönderilir
select * from kisiler;

CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

-- kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
select * from kisiler order by adres;
select * from kisiler order by adres desc;
-- kisiler tablosunda maası buyukten kücüğe sıralayınız
select * from kisiler order by maas ;
select * from kisiler order by maas desc;
select distinct maas from kisiler order by maas limit 2 offset 3;
select distinct maas from kisiler order by maas desc limit 2 offset 2;

-- ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız
select * from kisiler where isim='Mine' order by maas desc;
-- soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler where soyisim='Bulut' order by maas;
				 -- LIMIT ----
			 	  -------------  
-- kişiler tablosundan  ilk 5 veriyi listeleyiniz
select * from kisiler limit 5;
-- kişiler tablosundan ilk 2 veriden sonra   ilk 5 veriyi listeleyiniz
select * from kisiler limit 5 offset 2;

        				-- GROUP BY --
/*
Group by cümleciği bir select ifadesinde satırları, sutunları 
degerlerine göre özet olarak gruplamak için kullanılır
GROUP BY cümleciği her grup başına satır döndürür
GROUP BY genelde AVG(),COUNT(),MAX(),MİN() VE SUM() GİBİ 
aggregate fonksiyonları ile birlikte kullanılır */
select * from manav;
CREATE TABLE manav 
(
    isim varchar(50), 
    urun_adi varchar(50), 
    urun_miktari int 
);
    
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', null, 2);

select * from manav;

create table personel
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);
insert into personel values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into personel values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into personel values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into personel values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into personel values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into personel values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into personel values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into personel values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into personel values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into personel values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into personel values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into personel values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into personel values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into personel values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into personel values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into personel values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into personel values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into personel values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');

select * from personel;
-- kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu yazınız.
select isim,sum(urun_miktari) from manav group by isim order by sum(urun_miktari) ;
-- satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren-- sorguyu yazınız. 
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi,count(isim) from manav where urun_adi is not null group by urun_adi order by count(isim);
-- Satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve
-- MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.
select urun_adi,max(urun_miktari)as "max",min(urun_miktari)as "min" 
from manav
group by urun_adi
order by max(urun_miktari);

-- kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran
-- ve isime göre ters sırasıda listeyen sorguyu yazınız.
select isim,urun_adi,sum(urun_miktari)as tatol
from manav
group by isim,urun_adi
order by isim desc;

-- personelin calıştığı ülkeleri listeleyiniz
select * from personel;
select  ulke from personel group by ulke;
-- Ülkelere göre ortalama maaşları listeleyiniz
select ulke ,round(avg(maas)) 
from personel
group by ulke
order by avg(maas);
-- Maas ortalamasını bayanlar ve baylar olarak sorgulayınız
select cinsiyet,round(avg(maas))
from personel
group by cinsiyet
order by avg(maas);

-- Personelin, ulkelere göre ve şehirlere göre gruplayarak sorgulayın
select ulke,sehir
from personel
group by ulke,sehir;

-- Personelin, ulkelere göre ve şehirler göre calışan sayısını sorgulayın.
select ulke, sehir,count(ad) 
from personel
group by ulke,sehir;

					--    GROUP BY  HAVING
/*
HAVING ifadesinin işlevi where ifadesinin işlevine çok benziyor ancak kümeleme fonksiyonları 
ile where ifadesi birlikte kullanılmadığından HAVING ifadesine ihtiyaç duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke,round(avg(maas))as ortalama
from personel
where cinsiyet='E'
group by ulke,cinsiyet
having avg(maas)>3000;
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke,round(avg(maas)) "maas ort",count(cinsiyet) "erkekler"
from personel
where cinsiyet='E'
group by ulke
having count(cinsiyet)>1;

select * from workers;
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
select name,sum(salary)
from workers
group by name
having sum(salary)>2500;

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
select state,count(name)
from workers
group by state
having count(name)>1;

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state,max(salary)
from workers
group by state
having max(salary)<3000;
--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company ,min(salary)
from workers
group by company
having min(salary)>2000;
--Tekrarsız isimleri çağırın.
select distinct name 
from workers;
--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name ,company
from workers 
order by length(company);


-- CONCAT() fonksiyonu birden fazla sütun veya String değerini birleştirmek için kullanılır
--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
select concat(name,'-',state,'=(',length(name),'+',length(state),')')as toplam_degerler
from workers
order by length(name)+length(state);

-- 1. yol
select concat(name,'-', state)as name_state from workers
order by length(name)+length(state);
-- 2. yol
select name||'-'||state||' '|| length(name)+length(state)as "name and states"
from workers
order by length(name)+length(state); -- || concat yerine kullanılır

/*					
-- UNION Operatör:1) iki sorgu(query) sonucunu birleştirmek için kullanılır.
				  2) tekrarsız (unique) recordları verir.
				  3) tek bir sütuna çok sütun koyabiliriz(
				  4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.
						
*/

--salary değeri 3000'den yüksek olan state değerlerini ve salary değeri 
--2000'den küçük olan name değerlerini tekrarsız olarak bulun.
select state "state & name",salary from workers
where salary>3000
union
select name,salary from workers
where salary<2000;
--salary değeri 3000'den yüksek olan state değerlerini ve 
--2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state,salary
from workers
where salary>3000
union all
select name,salary
from workers
where salary<2000;

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

--salary değeri 3000'den yüksek olan state değerlerini ve 
--2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state,salary 
from workers
where salary>3000
union all
select name,salary
from workers
where salary<2000;

--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. 
					--Unique(tekrarsız) recordları verir.

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name 
from workers 
where salary>1000
intersect
select name
from workers
where salary<2000;
--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT
--olan ortak "name" değerlerini bulun.
select name 
from workers
where salary<2000
intersect
select name
from workers
where company in('IBM','APPLE','MICROSOFT');


--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
					--Unique(tekrarsız) recordları verir.
					--except--birinde olupta digerinde olmayanlari verir


--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name 
from workers
where salary<3000
except
select name 
from workers
where company='GOOGLE';

SELECT * FROM workers;

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


select * from my_companies;
select * from orders;

/*
  		   JOINS   1) Inner join:Ortak (common) datayı verir (table1 & table2)
				   2) Left join :Birinci tablenin tüm datasını verir
				   3) Right join:İkinci tablenin tüm datasını verir
				   4) Full join:iki table nin tüm datasını verir
				   5) Self join:Tek table üzerinde çalışırken iki table varmış gibi çalışılır

*/


--1) INNER JOIN
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.
select mc.company_name,o.order_id,o.order_date
from my_companies mc inner join orders o
on mc.company_id = o.company_id;

select mc.company_name,o.order_id
from my_companies mc inner join orders o
on mc.company_id = o.company_id;

select company_name,order_date
from my_companies mc inner join orders o
on mc.company_id = o.company_id;

-- 2) LEFT JOIN
--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
select mc.company_name,o.order_id,o.order_date
from my_companies mc left join  orders o 
on o.company_id = mc.company_id;

select mc.company_name,o.order_id
from my_companies mc left join orders o
on mc.company_id = o.company_id;

select mc.company_name,o.order_date
from my_companies mc left join orders o
on mc.company_id = o.company_id;
--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın
select mc.company_name,order_id,o.order_date
from my_companies mc right join orders o
on mc.company_id = o.company_id;

select mc.company_name,o.order_id
from my_companies mc right join orders o
on mc.company_id = o.company_id;

select company_name,order_date
from my_companies mc right join orders o
on o.company_id = mc.company_id;

--FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.
select mc.company_name,o.order_id,o.order_date
from my_companies mc full join orders o
on mc.company_id = o.company_id;

select m.company_name,o.order_id,o.order_date
from my_companies m full join orders o
on m.company_id = o.company_id;

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

drop table workers;
--SELF JOIN
--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.
select isci.name "worker", manager.name "manager"
from workers isci full  join workers manager
on isci.manager_id=manager.id;













