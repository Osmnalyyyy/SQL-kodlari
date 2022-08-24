create table personel(
personel_id int,
	personel_isim char(15),
	personel_soyisim varchar(10),
	personel_maas int,
	personel_adres varchar(30),
	sirket char(30)
);
select * from personel;
select personel_id,personel_maas, personel_adres from personel;
select personel_adres,sirket from personel;

create table futbol_takimlari(
takim_ismi varchar(20),
	sehir varchar(15),
	sampiyonluk_sayisi int,
	takim_degeri int,
	takim_kaptani varchar(20)
	
);
select takim_ismi , sampiyonluk_sayisi from futbol_takimlari;
select * from futbol_takimlari;

insert into futbol_takimlari values ('Galatasaray','Istanbul',22,100,'Muslera') ;
insert into futbol_takimlari values ('Manchester United','Manchester',19,500,'Ronaldo');
insert into futbol_takimlari values ('Real Madrid','Madrid',25,485,'Modric');
insert into futbol_takimlari values ('Bayern Munich','Munih',30,375,'Neuer');
insert into futbol_takimlari values ('Roma','Roma',15,300,'Totti');


insert into futbol_takimlari (sehir) VALUES('Kars');
insert into futbol_takimlari (sampiyonluk_sayisi) VALUES (10);

insert into futbol_takimlari  values (13)  ;

delete from futbol_takimlari where takim_ismi='13';
select * from futbol_takimlari where sampiyonluk_sayisi>20;

delete from futbol_takimlari where sampiyonluk_sayisi=10;
delete from futbol_takimlari where sehir='Kars';
delete from futbol_takimlari where sehir='Roma' or sehir='Isparta';
delete from futbol_takimlari where takim_ismi ='Galatasaray' and sampiyonluk_sayisi=22;
delete from futbol_takimlari where sampiyonluk_sayisi<20;
delete from futbol_takimlari;
select * from futbol_takimlari;
select * from futbol_takimlari;

delete FROM futbol_takimlari where sampiyonluk_sayisi<25;
truncate table futbol_takimlari;

alter table futbol_takimlari add ulke varchar(20), add futbolcu_sayisi int;
alter table futbol_takimlari drop column ulke;
alter table futbol_takimlari rename futbolcu_sayisi to sayi;
alter table futbol_takimlari drop column sayi;
alter table futbol_takimlari add renk varchar(10) ,add ulke varchar(15);

alter table futbol_takimlari drop column renk;
alter table futbol_takimlari rename ulke to renk;
alter table futbol_takimlari rename to teams;

select * from teams;
drop table teams;
create table calisanlar(
id_name char(5) primary key,
	isim varchar(20) unique,
	maas int not null,
	ise_baslama date
	
);
select * from futbol_takimlari;
select * from calisanlar;

insert into calisanlar values ('1','osman ali',2500);
insert into calisanlar values('2','gorkem',3000);
insert into calisanlar values ('1','sevcan',2600);

alter table calisanlar drop column ise_baslama;
alter table calisanlar add sehir varchar(10),add cinsiyet char(5);
alter table calisanlar drop column maas;

create table yenitablo
as
select id_name,  isim from calisanlar; --and sehir from futbol_takimlari;

select * from yenitablo;
delete from yenitablo where isim='gorkem';