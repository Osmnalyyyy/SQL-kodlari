               -- LIMIT ----
			   -------------  
-- kişiler tablosundan  ilk 5 veriyi listeleyiniz
select * from kisiler limit 5;
-- kişiler tablosundan ilk 2 veriden sonra   ilk 5 veriyi listeleyiniz
select * from kisiler limit 5 offset 2;
-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler where id>'5' limit 2;-- önce koşul sonra limit yaz
--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select* from kisiler order by maas desc limit 3;
-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 offset 3;
