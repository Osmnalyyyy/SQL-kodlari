CREATE TABLE insanlar (	ssn CHAR(9), --Social Security Number	
					   isim VARCHAR(50), 	adres VARCHAR(50) );
					   
					   
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

select * from insanlar where isim is null;
-- ismi null olanlari sorgula
select * from insanlar where isim is null;
select * from insanlar;
-- ismi null olmayanları olanlari sorgula
select * from insanlar where isim is not null;
-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar
set isim='No name' where isim is null;
-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
update insanlar 
set isim = null where isim='No name';

update insanlar 
set ssn='125487596' where ssn is null;
select * from insanlar;

update insanlar
set adres='isparta' where adres is null;


update insanlar
set ssn=null where ssn='125487596';
update insanlar 
set adres =null where adres='Ankara';

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/
update insanlar
set isim=coalesce(isim,'isim girilmedi'),
	adres=coalesce(adres,'adres girilmedi'),
	ssn=coalesce(ssn,'no ssn');

-- ORDER BY cümleciği bir sorgu deyimi içerisinde belli bir sutun'a göre
-- sıralama yapmak için gönderilir
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

select * from kisiler;
-- kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
select * from kisiler order by id;
select * from kisiler order by ssn desc;
select * from kisiler order by isim;
select * from kisiler order by isim desc;
select * from kisiler order by soyisim;
select * from kisiler order by maas;
select * from kisiler order by maas desc;
select * from kisiler order by adres;
select * from kisiler order by adres desc;
-- ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız
select * from kisiler 
where isim='Mine'
order by maas;
-- soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler
where soyisim='Bulut'
order by maas desc;
--maasi 2500 den buyuk olanlari tersten sıralayınız
select * from kisiler
where maas>2500 and adres='Ankara' and soyisim='Cem'
order by maas;
--- LİMİT---
-- kişiler tablosundan  ilk 5 veriyi listeleyiniz
select * from kisiler limit 5;
-- kişiler tablosundan ilk 2 veriden sonra   ilk 5 veriyi listeleyiniz
SELECT * from kisiler limit 5 offset 2;
select * from kisiler limit 3 offset 3;
select * from kisiler order by maas desc limit 5;
select * from kisiler order by maas desc offset 3;
select * from kisiler order by maas limit 5;
select * from kisiler order by maas limit 5 offset 5;
-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler 
where id>5
order by id limit 1  ;

select * from kisiler
where adres='Ankara'
order by adres limit 1 offset 1;

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3;

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 offset 3;

------------------------ GROUP BY -----------------------

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
select isim,sum(urun_miktari)as urun_miktari from manav
group by isim
-- satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren-- sorguyu yazınız. 
select urun_adi,count(isim)as kisi_sayisi from manav
where urun_adi is  not null
group by urun_adi;

-- Satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve
-- MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.
select urun_adi,max(urun_miktari)as max_miktar,min(urun_miktari)as min_miktar from manav
where urun_adi is not null
group by urun_adi;
-- kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran
-- ve isime göre ters sırasıda listeyen sorguyu yazınız.
select isim,urun_adi,count(isim) from manav
where urun_adi is not null
group by isim,urun_adi
order by count;
-- personelin calıştığı ülkeleri listeleyiniz
select ulke from personel
group by ulke;
-- Ülkelere göre ortalama maaşları listeleyiniz
select ulke,round(avg(maas),2)as ort_maas from personel
group by ulke
order by ort_maas desc;
-- Maas ortalamasını bayanlar ve baylar olarak sorgulayınız
select cinsiyet,round(avg(maas),2)as ort_maas from personel
group by cinsiyet;
-- Personelin, ulkelere göre ve şehirlere göre gruplayarak sorgulayın
select ulke,sehir from personel
group by ulke,sehir
order by  ulke;
-- Personelin, ulkelere göre ve şehirler göre calışan sayısını sorgulayın.
select ulke,sehir,count(sehir)as calisan_sayisi from personel
group by ulke,sehir
order by calisan_sayisi;
-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını sorgulayınız.
select ulke,cinsiyet,count(cinsiyet)as calisan_sayisi,round(avg(yas))as yas_ort  from personel
group by ulke,cinsiyet
order by yas_ort;
-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını  ve 
--maası 30000 den büyük olanları sorgulayınız.
select ulke,cinsiyet,count(cinsiyet)as calisan_sayisi,round(avg(yas))as yas_ort from personel
where maas>30000
group by ulke,cinsiyet
order by yas_ort;

-- Her ulke için; bay ve bayan çalışan sayısı, yaş ortalamasını, maaşı 30000 den büyük olanları
-- ve ortalama yaşı büyükten küçüğe doğru sıralayınız.
select ulke,cinsiyet ,round(avg(yas))as yas_ort,count(cinsiyet)as k_e_sayisi from personel
where maas>30000
group by ulke,cinsiyet
order by yas_ort desc;
--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke,round(avg(maas))as maas_ort from personel
where cinsiyet='E'
group by ulke
having avg(maas)>3000;











