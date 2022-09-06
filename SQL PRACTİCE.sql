--                         sql_practise 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key  ,   -- serial id yi auto increment gibi otomatik artirir                                                                  
isim  varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
                                                                                              
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);
-- 1) Tablo bilgilerini listeleyiniz.
SELECT * FROM personel;
-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim,yas,maas from personel;
-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;
-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim,yas,email from personel where id=5;
-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>30 ;
-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas >21000 or   maas <21000; 
select * from personel where maas <>21000;
-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim similar to 'A%';
select * from personel where isim ~~* 'a%';
select * from personel where isim ~* '^a(.*)';
-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim similar to '%n';
select * from personel where isim ~~* '%n';
select * from personel where isim ~* '(.*)n$';
-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email similar to '%gmail.com';
select * from personel where email ~~* '%gmail.com';
select * from personel where email ~* '(.*)gmail.com$';
-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email !~~*'%gmail.com';
select * from personel where email !~* '(.*)gmail.com$';
-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id=3 or id=5 or id=7 or id=9;;
select * from personel where id in(3,5,7,9);
-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas!=(39)  and yas!=54 and yas !=48;
select * from personel where yas not in(39,48,54);
-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas >30 and yas<40;
select * from personel where yas between  30 and 40;
-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas<30 or yas>40;
select * from personel where yas not between 30 and 40;
-- 15) emaili null olan personel bilgilerini listeleyin
select * from personel where email is null;
-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel order by yas;
-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;
-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;
-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;
-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3;

CREATE TABLE workers 
(  
  id int, 
  name varchar(20),
  title varchar(60),
  manager_id int 
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5 );
select * from workers;
-- 1 Tabloya company_industry isminde sütun ekleyiniz
alter table workers
add company_isdustries varchar(20);
-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers
add worker_address varchar(20) default('Miami, FL, USA ');
-- tablodaki worker_address sütununu siliniz
alter table workers
drop column worker_address;
-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table  workers
rename company_isdustries to company_profession;
-- Tablonun ismini employees olarak değişitiriniz.
alter table workers
rename to employees;
-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees
alter column title type varchar(50);
-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees
add constraint title unique(title);



CREATE TABLE students
(
    student_id CHAR(3) PRIMARY KEY,
    student_name VARCHAR(50) UNIQUE,
    student_age int NOT NULL,
    student_dob DATE,
    CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20)
    
);
-- Tam veri girişi
INSERT INTO students VALUES(101, 'ALI CAN', 13, '021-08-11');
INSERT INTO students VALUES(102, 'VELI HAN', 14, '2007-08-10');
INSERT INTO students VALUES(103, 'AYSE TAN', 14, '2007-08-08');
INSERT INTO students VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO students VALUES(105, 'TOM HANKS', 20, '2005-10-12');
INSERT INTO students VALUES(106, 'ANGELINA JULIE', 18, '1986-10-12');
INSERT INTO students VALUES(107, 'BRAD PITT', 0, '2021-08-10');

-- Parçalı veri girişi
insert into students(student_id,student_age) values ('108',17);
insert into students(student_name,student_id,student_age) values ('JOHN DAVID','109',20);
-- 101 id öğrencinin ismini 'LEO OCEAN' olarak güncelleyinin
update students
set student_name='LEO OCEAN' where student_id='101';
-- 101 id öğrencinin yasini 22 olarak güncelleyinin
update students
set student_age=22 where student_id='101';
-- 101 id öğrencinin ismini 'ALI CAN' olarak güncelleyinin
update students
set student_name='ALI CAN' where student_id='101';
-- 109 idli öğrencinin doğumtarihini 2010-12-11 olarak update yapın.
update students
set student_dob='2010-12-11' where student_id='109';
--ilk iki veriden sonra 5 veriyi listeleyiniz
select * from students limit 5 offset 2
-- yasi en buyyuk 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from students order by student_age   limit 3 offset 3;


CREATE TABLE calisanlar 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
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

select * from calisanlar;
select * from markalar;


-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu
-- markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isyeri,maas 
from calisanlar
where isyeri in(select marka_isim from markalar where calisan_sayisi>15000);
-- in kulanacaksanin parantez icine aldiginiz sorgu birden fazla deger dondermelidir

-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve 
-- şehirlerini listeleyiniz. 
select isim,maas,sehir
from calisanlar
where isyeri in(select marka_isim from markalar where marka_id>101);
-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_isim,calisan_sayisi
from markalar
where marka_isim in(select isyeri from calisanlar where sehir='Ankara');
-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select sum(maas) "toplam maas" from calisanlar where marka_isim=isyeri)
from markalar;
-- SORU5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select round(avg(maas)) "mayaş" from calisanlar where marka_isim=isyeri)
from markalar;
-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select max(maas) "max maas" from calisanlar where marka_isim=isyeri),
(select min(maas)" min maas" from calisanlar where marka_isim=isyeri)
from markalar;
-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir) "sehir sayisi" from calisanlar where marka_isim=isyeri)  from markalar;

============================================================
interview questions 
CREATE TABLE personel6
(
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel6 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel6 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel6 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel6 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');  
INSERT INTO personel6 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');
SELECT * FROM personel6;
CREATE TABLE isciler 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'texas', 2500, 'IBM');
SELECT * FROM isciler;
-- 1) Her iki tablodaki ortak id’leri ve 
--     personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz
select id,isim from personel6
where id in (select id from  isciler where personel6.id=isciler.id)
order by isim;
-- 2) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin
select count(isim) from isciler  
-- 3)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from isciler order by maas desc limit 1;
-- 4) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
 select maas from isciler order by maas desc limit 1 offset 1;                           
                            
 --5) Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz
select * from isciler order by maas desc limit 1 offset 1;
select * from personel6 order by maas desc limit 1 offset 1;







