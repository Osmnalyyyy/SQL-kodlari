
-- IS NULL, IS NOT NULL, COALESCE --
--alter tabloyu değiştirir update veriyi değiştirir
/*
IS NULL ve IS NOT NULL boolean operatorleridir
Bir ifadenin null olup olmadigini kontrol eder
COALESCE  (birlestirme) bir fonksiyondur ve icerisindeki parametrelerden null olmayan ilk ifadeyi dondurur
*/
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
select * from insanlar;
-- ismi null olmayanları olanlari sorgula
select * from insanlar where isim is not null;
-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar
set isim='No name' where isim is null
-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
update insanlar 
set isim=null where isim='No name';

-- NOT:Çoklu degişimde her degişim icin set .... where isim is null gibi ifade yazmamak için 
-- coalesce(birleştirme ) kullanılır

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/
update insanlar
set isim = coalesce (isim,'henüz isim girilmedi'),
	adres=coalesce(adres,'henüz adres girilmedi'),
	ssn=coalesce(ssn,'no ssn');




















