-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, medin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
PostgreSQL'de  ~ karakteri ile kullanılır.
*/

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
   
select * from kelimeler;
--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz   
-- similar to ile
select * from kelimeler where kelime similar to '%(ot|at)%'  ;
--  | --> veya  işlemi için kullanılır   
--like ile
select * from kelimeler where kelime ILIKE '%at%' or kelime ILIKE '%ot%'; 
select * from kelimeler where kelime ~~*'%at%' or kelime ~~* '%ot%'  
--regex ile  
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';  -- * buyuk kucuk ortadan kaldırmak için
 -- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz  
select * from kelimeler where kelime similar to 'ho%|hi%' ;-- similar to ile
select * from kelimeler where kelime ilike 'ho%' or kelime ilike 'hi%';
REGEX ile
select * from kelimeler where kelime ~*'h[oi](.*)';-- Regexte .(nokta) bir karakteri temsil eder
--Regex'te ikinci karakter için [ ] kullanılır   
--Regex'te * herşey demek

--Sonu 't' veya 'm' ile bitenleri listeleyeniz 
select * from kelimeler where kelime ~~ '%t' or kelime ~~'%m' ;
select * from kelimeler where kelime similar to '%t|%m';
select * from kelimeler where kelime ~* '(.*)[tm]$';-- $ karakteri bitişi gösterir
-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz 
--similar to ile yaptık
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t'; 
 -- like ile yaptık
select * from kelimeler where kelime ~~* 'h_t';
 -- regex ile yaptık
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t';
--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye 
--herhangi bir karakter olan “kelime" değerlerini çağırın.   
-- similar to ile
select * from kelimeler where kelime similar to 'h[a-e]%t';
--regex ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';   
-- like ile
select * from kelimeler where kelime ~~* 'h'
--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın. 
select * from kelimeler where kelime similar to '[s,a,y]%'; 
select * from kelimeler where kelime ~ '^[say](.*)';-- ^ karakteri başlangıç'ı temsil eder
select * from kelimeler where kelime like 's%' or kelime like 'a%' or kelime like 'y%';
 
 --Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
 select * from kelimeler where kelime similar to '%[m,a,f]';
 select * from kelimeler where kelime ~'(.*)[maf]$';
--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım. 
-- similar to ile
select * from kelimeler where kelime similar to 'h[a|i]t';
-- regex ile
select * from kelimeler where kelime ~ '^h[a|i]t$';
--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter
--olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın. 
 select * from kelimeler where kelime ~ '^[b-s].l(.*)';-- . -->bir karakteri temsil eder
 --içerisinde en az 2 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz
 select * from kelimeler where kelime similar to '%[o][o]%'; -- [o]--> bir karakter demek
 select * from kelimeler where kelime similar to '%[o]{2}%';-- {2} 2 defa demek
 --similar to'da her [ ] parantez bir karaktere denk geliyor
 --içerisinde en az 4 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
 select * from kelimeler where kelime similar to '%[o]{4}%';
 --'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime similar to '[asy]%[mf]' ;
select * from kelimeler where kelime ~'^[a|s|y](.*)[m|f]$' ;
 
 
 
 
 
 
 
 
 









 
 
 