-- GROUP BY -- HAVING
/*
HAVING ifadesinin işlevi where ifadesinin işlevine çok benziyor ancak kümeleme fonksiyonları 
ile where ifadesi birlikte kullanılmadığından HAVING ifadesine ihtiyaç duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.

select * from personel;

select ulke,round(avg(maas),2)as maas_ortalamasi from personel 
where cinsiyet='E'
group by ulke 
having avg(maas) >3000;

--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
