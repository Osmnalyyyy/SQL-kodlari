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
-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select * from personel;
select isim from personel where isim ~~* 'a%n';
-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '_a_u%' ;
-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%r%';
select isim from personel where isim ~~*'%e%' and isim ~~*'%r%';
-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select isim from personel where isim ~~* '_e%y%';
-- a harfi olmayan personeli listeleyin
select isim from personel where isim !~~* '%a%';-- selectten sonra isim yerine * yazarsak butun tabloyu getirir
-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select isim from personel where isim ~~* 'a_____a%';
--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select isim from personel where isim ~~* '%r_';



















