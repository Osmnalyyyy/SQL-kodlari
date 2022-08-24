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
-- FOREIGN KEY--
CREATE TABLE adresler--child  foreign key olan child olur
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir
delete from calisanlar where id='10002';--parent
delete from adresler where adres_id='10002';--child  
-- once child den silmek gerekiyor sonra parentten silmek gerekiyor


drop table calisanlar;
--on delete cascade
-- her defasında once child tablosundaki verileri silmek yerine
--ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz
--on delete cascade yapınca parentten sil deyince hem child hem parent silinir
--bunun icin FK(foreign key) olan satırın en sonuna ON DELETE CASCATE komutunu yazmamız yeterli

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

select * from talebeler;
select * from  notlar;

delete from notlar where talebe_id='123';

delete from talebeler where id='126'; --on delete cascate kullandıgımız icin parent tableden direk silebildik
--parentten tableden sildigimiz icin child tableden de silinmis olur (hem parentten hem childden sildik)

delete from talebeler;

drop table talebeler cascade;--parent tabloyu kaldırmak istersek drop table tablo_adi'ndan sonra cascate komutunu kullanırız
--talebeler tablosundaki isim sutununa not null kısıtlaması ekleyınız ve veri tipini varchar(30 olarak degistiriniz)

alter table talebeler 
alter column isim type varchar(30),
alter column isim set not null;
-- talebeler tablosundaki yazılı_notu sutununa 60 dan buyuk rakam girilebilsin

alter table talebeler 
add constraint sinir check (yazili_notu>60);



INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',45);--Açiklama : -- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id  from ogrenciler;

Create table ogrenci_adres
AS
SELECT adres  from ogrenciler;

select * from ogrenciler
-- tablodaki bir sutuna primary key ekleme
alter table ogrenciler
add primary key(id);

--primary key olusturmada 2. yol
alter table ogrenciler
add constraint pk_id1 primary key (id);

-- PK dan sonra foreign key ataması
alter table ogrenci_adres
add foreign key (id) references ogrenciler;
--child tabloyu parent tablodan olusturdugumuz icin kolon adı vermedik

--PK 'yi silme constraint silme
alter table ogrenciler drop constraint pk_id1;-- once foreign key yapmalıyız

--FK'yi silme CONTRAINT silme
alter table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;
--PK 'yi silme constraint silme
alter table ogrenciler DROP CONSTRAINT pk_id1;  
-- once FK sonra PK sildik

--yazılı notu 85 den buyuk olan talebe bilgilerini getirin
select * from talebeler where yazili_notu>85;
--ismi Mustafa Bak olan telebenin tum bilgilerini getirin
select * from talebeler where isim='Mustafa Bak';

-- select komutunda -- between koşulu 
-- between belirttiğiniz 2 veri arasındaki bilgileri listeler
--between de belirttiğimiz degerlerde listelemeye dahildir

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

/*
AND (ve ) belirtilen sartların her ikiside gerceklesiyorsa o kayıt listelenir
bir tanesi gerceklesmezse listelemez
select * from matematik sinav1 >50 and sinav2>50
hem sınav1 hem de sınav2 alanı 50 den buyuk olan kayıtları listeler

OR (veya) belirtilen sartlardan biri gercekleşirse kayıt listelenir
select * from matematiksinav>50 or sinav2>50
hem sınav1 veya sınav2 alanı 50 den buyuk olan kayıtları listeler
*/
select * from personel
-- id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyiniz
select * from personel where id between '1003' and '1005';
--2. yol 
select * from personel where id>='1003' and id<='1005';


-- maasi 70000 veya ismi Sena olan personeli listele
select * from personel where maas = 70000 or isim='Sena Beyaz';

--in birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazbilme
--farklı sutunlar icin in kullanılamaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele

select * from personel where id ='1001' or id='1002' or id='1004' ;

-- 2.yol
select * from personel where id in ('1001','1002','1004');

-- maasi sadece 70000 ,100000 olan personeli listele
select * from personel where maas in (70000,100000);
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
--ismi a harfi ile baslayan personeli listele
select * from personel where isim like 'A%';-- a ile başlasın sonu ne olursa olsun onemli değil

--ismi t harfi ile biten personeli listele
select * from personel where isim like '%t';-- t ile bitsin bası ne olursa olsun

--isminin ikinci harfi e olan personeli listeleyiniz
select  * from personel where isim like '_e%';
















