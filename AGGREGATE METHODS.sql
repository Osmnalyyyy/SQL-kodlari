--          AGGREGATE METHOD KULLANIMI
--  aggregate methodlari:
-- SUM(topla),COUNT(say),MIN(en kucuk deger),MAX(en buyuk deger),AVG(ortalama)
-- subquery icin kullanılır ancak sorgu tek bir deger donduruyor olmalıdır
--SYNTEX :sum() şeklinde olmalı sum () arasında boşluk olmamalı
select * from calisanlar2;
-- çalışanlar2 tablosundaki en yuksek maaş degerini listeleyiniz
select max(maas)  from calisanlar2;
--çalışanlar2 tablosundaki maaslarin toplamını listeleyiniz
select sum(maas) from calisanlar2;
--calisanlar2 tablosundaki maas ortalamasını listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2;-- noktadan sonrasını kaldırır
select round(avg(maas),2) from calisanlar2-- virgülden sonra 2 basamak aldı
-- çalışanlar2 tablosundaki en dusuk maaş degerini listeleyiniz
select min(maas) from calisanlar2;
-- çalışanlar2 tablosundaki kac kisinin maas aldıgını listeleyiniz
select count(maas) from calisanlar2;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select * from markalar;
select marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 where marka_isim=isyeri)AS toplam_maas from markalar;
--ALIAS (AS) tabloda gecici isim vermek istersek koşuldan sonra AS sutun_ismi olRk kullanılır

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir) from calisanlar2 
							where marka_isim=isyeri)as sehir_sayisi from markalar;
--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas<(select max(maas) from calisanlar2);
----Interview Question: En düşük ikinci maas değerini çağırın
select min(maas) as endusuk_ikinci_maas from calisanlar2
where maas>(select min(maas) from calisanlar2);

select * from calisanlar2;
--En yüksek üçüncü maas değerini bulun
select max(maas) as enyuksek_ucuncu_maas from calisanlar2
where maas<(select max(maas) from calisanlar where maas<(select max(maas) from calisanlar2));
--En dusuk üçüncü maas değerini bulun
select min(maas) as endusuk_ucuncu_maas from calisanlar2
where maas>(select min(maas) from calisanlar where maas>(select min(maas) from calisanlar2));


















