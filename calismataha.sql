--=================================================================
---========================  1.& 2. GÜN ===========================
--=================================================================
create table personel(
personel_id int,
	personel_isim varchar(20),
	personel_soyisim varchar(15),
	personel_tel char(11),
	personel_tc char(11),
	personel_sehir varchar(10),
	personel_adres varchar(20)
);
select * from personel;
create table personel_iletisim
as
	select personel_tel,personel_sehir,personel_adres from personel;

select * from personel_iletisim;

insert into personel values (1,'osman','sevinc','12345678912','12345678999','isparta','32040');
insert into personel values (2,'ali','sevinc','98745632112','12345698745','van','35487');
insert into personel values (3,'gorkem','demir','12365487958','1254587487','isparta','32546');

insert into personel(personel_id,personel_isim) values (3,'taha');

select * from personel where personel_id=3;
select * from personel where personel_sehir=('isparta');
select * from personel where personel_isim='ali';

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
commit;

delete from personel;
drop table personel;

select *  from personel where personel_isim='ali';
select * from personel where personel_id<2;
select * from personel where personel_sehir='van';

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

select * from ogrenciler;

delete from ogrenciler where id=124;
delete from ogrenciler where id=123;

delete from ogrenciler where isim='Kemal Yasa';
delete from ogrenciler where veli_isim='Ayse';
delete from ogrenciler where veli_isim='Ali';
delete from ogrenciler where id=127;
drop table ogrenciler;
select * from ogrenciler;
delete from ogrenciler;

truncate table ogrenciler;

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

select * from calisanlar;

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); -- unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key
--=================================================================
---========================  3. GÜN ===============================
--=================================================================
drop table calisanlar;
--Primary key
CREATE TABLE calisanlar--parent  primary key olan parent table olur
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
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

select * from calisanlar;
delete from calisanlar;
--Foreign key
CREATE TABLE adresler--child  foreign key olan child olur
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

select * from adresler;
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

insert into adresler values('10005','Aga sokak','30.Cad.','Antep');

create table  arabalar(
marka_adi varchar(15) primary key,
	model varchar(15) unique,
	motor_hacmi int not null,
	sinif varchar(15)
);
select * from arabalar;

create table araba_bilgileri(
	araba_marka varchar(15),
araba_fiyati int,
	araba_mesafe int,
	araba_yil int,
	
	
	constraint fk foreign key (araba_marka) references arabalar(marka_adi)
);

select *  from araba_bilgileri;

insert into arabalar values('bmw','x5',2000,'s');
insert into arabalar values('mercedes','amg',3000,'e');
insert into arabalar values('audi','tt',3000,'t');

select * from arabalar;

insert into araba_bilgileri values('bmw',250000,0,2022);
--insert into araba_bilgileri values('citroen',250000,0,2022); citroen parent tabloda olmadığı için ekleme yapamadık
insert into araba_bilgileri values('audi',1000000,0,2022);
drop table araba_bilgileri;
select *  from araba_bilgileri;

select * from arabalar,araba_bilgileri where marka_adi=araba_marka;-- ekledik
--select * from arabalar,araba_bilgileri where marka_adi=araba_yil  hata verir
-- iki tabloyu ancak PK ve FK ile birbirine bağlayabiliriz

drop table arabalar; -- hata veriri çünkü bunun child tablosu var once onu silmeliyiz
delete from arabalar where marka_adi='bmw';-- parent oldugu için silmedi
delete from araba_bilgileri where araba_marka='bmw';-- child oldugu için sildi

--ON DELETE CASCADE icin FK son satırına ON DELETE CASCADE yazıyoruz

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

select * from talebeler;

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

select * from notlar;

select * from talebeler,notlar where id=talebe_id;
select * from talebeler,notlar where  id=talebe_id;

-- parent table ve child table arasında ortak olan values'ları PK ve FK ile cagiririz
select * from talebeler;
select * from notlar;

delete from notlar where talebe_id='123';

delete from talebeler where id='126';-- hemparntten hem de childden sildik

delete from talebeler;

drop table talebeler cascade;-- talebeler tableî kaldırmak icin tablename den sonra cascade kullanırız

-- talebeleri yeniden ekledik.
alter table talebeler 
alter column isim type varchar(30),
alter column isim set not null;
-- talebeler tablosundaki yazılı_notu sutununa 60 dan buyuk rakam girilebilsin

alter table talebeler
add constraint sinir check (yazili_notu>60);

insert into talebeler values (129,'taha','su',61);

select * from talebeler;

create table ogrenciler3(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);
create table ogrenci_adres
as
select id,adres from ogrenciler3;

select * from ogrenci_adres;

create table ogrenci_adres
as
select adres from ogrenciler3;

drop table ogrenci_adres;

alter table ogrenciler3
add constraint ogrenci_pk primary key(id);

select * from ogrenciler3;

alter table ogrenci_adres
add constraint ogr_fk foreign key (id ) references ogrenciler3;

select * from ogrenci_adres;

alter table ogrenciler3 drop constraint ogrenci_pk;--hata verdi
alter table ogrenci_adres drop constraint ogr_fk;
alter table ogrenciler3 drop constraint ogrenci_pk;

-- önce foreign key sonra primary key silinir

select * from ogrenciler3;

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);

select * from ogrenciler3 where sinav_notu>80;
select * from ogrenciler3 where isim='Merve Gul';

select * from ogrenciler3 where adres='Can';

delete from ogrenciler3 where sinav_notu=95;
delete from ogrenciler3 where adres='Ayse';
insert into ogrenciler3 values(129,'ehmet','van',93);

delete from ogrenciler3 where isim='ehmet';

alter table ogrenciler3
add constraint pk1 primary key (isim) ;

alter table ogrenciler3 drop constraint pk1;

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

alter table personel
add constraint per_1 primary key (id);

alter table personel drop constraint per_1;

select * from personel;

select * from personel where maas >70000 and maas <90000;
select * from personel where id>'1003' and id<'1005';

select * from personel where maas between 70000 and 90000;

select * from personel where maas=70000 or isim='Sena Beyaz';

-- in aynı sutun icin geçerli farklı sutun olmaz

select * from personel where id in ('1001','1002','1003');
select * from personel where maas in(70000,80000,95000);

select * from personel where maas in(70000,100000);

/*
SELECT - LIKE koşulu
like=sorgulama yaparken belirli kalıp(pattern) ifadeleri kullanabilmemizi saglar
ilike=sorgulama yaparken buyuk/kucuk harfe duyarsız olarak eşleştirir
like=~~ bu işareti de kullanabiliyoruz
ilike : ~~*
not like : !~~
not ilike : !~~*

%-->0 veya daha fazla karakteri belirtir.
_ -->tek bir karakteri belirtir
*/

select * from personel where isim like 'A%';

select * from personel where isim like '_a%';

select * from personel where isim like '%t';

select * from personel where isim ~~ '%y__';

select * from personel where id ~~ '1%';

select * from personel where isim ilike 'a%';

create table filmler(
	film_adi varchar(20) primary key,
	yonetmen varchar(20),
basrol varchar(20),
	yil int,
	ulke char(10)
);
insert into filmler values('avengers','marvel','iron man',2015,'usa');
insert into filmler values('arog','cmylmz','cem',2008,'turkey');
insert into filmler values('gora','cmylmz','cem',2011,'turkey');
insert into filmler values('pianist','bilmem','tanimam',2005,'usa');

select * from filmler;

select * from filmler where film_adi like 'a%';
select * from filmler where yonetmen like '%m';
select * from filmler where basrol like '%m';



















