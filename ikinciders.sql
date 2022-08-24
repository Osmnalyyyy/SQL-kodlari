--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel tablosundan pers_id,sehir,adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as
select pers_id, sehir, adres from personel;
select * from personel
-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);
--Tabloya parçalı veri ekleme
insert into student(st_name,age) values ('Murat Can',65);
--DQL --> Data Query Lang.
--SELECT
select * from student;
select st_name from student;
--SELECT KOMUTU WHERE KOŞULU
select * from student WHERE age>35;
--TCL - Transaction Control Lang.
--Begin - Savepoint - rollback - commit
--Transaction veritabanı sistemlerinde bir işlem başladığında başlar ve işlem bitince sona erer
--Bu işlemler veri tabanı oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin ;--transectionu baslatır
insert into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default,'Canan Gül','Ayşe Şen',90.5);
SAVEPOINT x;
insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);
ROLLBACK to x;
select * from ogrenciler2;

COMMIT;-- transectionu bitirir

-- Transection kullaniminda serial data turu kullanimi tavsiye edilmez 
--savepointten sonra eklediğimiz veride sayaç mantığı ile calıstıgı ıcın sayacta en son 
--hangi sayıda kaldıysa ordan devam eder
--NOT : PostgreSQL de transaction kullanımı için 'Begin' komutuyla başlarız sonrasında tekrar yanlış bir veriyi
-- düzeltmek veya bizim için önemli olan verilerden sonra ekleme yapabilmek için 'SAVEPOINT savepointadi'
-- kullanırız ve bu savepointe dönebilmek için 'ROLLBACK TO savepointismi'
-- komutunu kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki verileri tabloda bize
-- verir ve son olarak Transaction'ı sonlandırmak için mutlaka 'COMMIT' komutu kullanırız. MySQL de
-- transaction olmadanda kullanılır

-- DML - DELETE -
--DELETE FROM tablo_adi -->tablonun tum icerigini siler
--veriyi secerek silmek icin WHERE koşulu kullanilir
-- DELETE FROM tabloadi WHERE sutun_adi -->veri Tablodaki istedigimiz veriyi siler

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * from ogrenciler;
-- soru id si 124 olan ogrenciyi silin
DELETE FROM ogrenciler where id=124;
-- soru 2 ismi Kemal Yasa olan satırı silin
delete from ogrenciler where isim = 'Kemal Yasa';
-- soru ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim
delete from ogrenciler where isim = 'Nesibe Yilmaz' or isim = 'Mustafa Bak';
-- ismi Ali Can ve id'si 123 olan kaydi siliniz
delete from ogrenciler where isim = 'Ali Can' and id=123;
delete from ogrenciler;

-- delete - truncate -- 
-- truncate komutu delete komutu gibi bir tablodaki verilerin tamamini siler 
--ancak secmeli silme yapamaz

truncate table ogrenciler;
-- DDL komutlarından Data Definition Lang.
-- CREATE - ALTER - DROP
-- ALTER TABLE
--ALTER TABLE tabloda ADD, TYPE,SET,RENAME veya DROP COLUMNS islemleri icin kullanılır
-- personel tablosuna cinsiyet varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
alter table personel add cinsiyet varchar(20), add yas int;
select * from personel;
--personel tablosundan sirket fieldini silin
alter table personel drop column sirket;
-- personel tablosundaki sehir sutununun adini ulke olarak degistirelim
alter table personel rename column sehir to ulke;
-- personel tablosunun adını isciler olarak degistiriniz
alter table personel rename  to isciler;

select * from isciler;

-- DDL - DROP komutu 
drop table isciler;  -- iscileri kaldırdı

-- Constraint-- kısıtlamalar
--Primary key --> bir sutunun null icermemesini ve sutundaki verilerin BENZERSİZ olmasini sağlar(NOT NULL-UNIQUE)
--foreign key -->baska bir tablodaki primary keyi referans göstermek icin kullanılır 
-- boylelikle tablolar arasında ilişki kurmuş oluruz
-- UNIQUE -->bir sutundaki tum degerlerin benzersiz yani tek olmasını sağlar
--NOT NULL bir sutunun null icermemesini yani bos olmamasını saglar
--NOT NULL kısıtlaması icin constraint ismi tanımlanmaz 
--Bu kısıtlama veri turunden hemen sonra yerleştirilir
--Check -->>bir sutuna yerlestirilebilecek deger aralıgını sınırlamak icin kullanılır

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
-- foreign key --
CREATE table adresler(
adres_id char(5),
	sokak varchar(20),
	cadde varchar(30),
	sehir varchar(20),

CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');--hata verdi
-- parent tabloda olmayan id ile child tabloya ekleme yapamayız

INSERT INTO adresler VALUES(null,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(null,'Ağa Sok', '30.Cad.','Antep');

--calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin

select * from calisanlar,adresler where calisanlar.id = adresler.adres_id; -- eslesenleri getirdi

drop table calisanlar;
-- parent tabloyu yani primary key olan tabloyu silmek istedigimizde tabloyu silmez
--once child tabloyu silmemiz gerekir









