/*
DDL - DATA DEFINITION LANG.DATA
CREATE - ALTER - DROP
*/
-- CREATE - TABLO OLUSTURMA -
CREATE table ogrenci(
ogr_no int,
ogr_isimsoyisim VARCHAR(30),
notlar REAL,
yas int,
adres varchar(50),
kayit_tarih Date
);
--varolan tablodan yeni bir tablo olusturma
create table ogrenci_notlari
as 
select ogr_no,notlar from ogrenci;

select * from ogrenci
select * from ogrenci_notlari
