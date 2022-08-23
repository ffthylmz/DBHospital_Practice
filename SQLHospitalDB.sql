create database BilgeAdamHospitalDB
use BilgeAdamHospitalDB

--Hasta Table Olu�turma;
--TC, Ad, Soyad, HastaneyeGelisTarihi, HastanedenCikisTarihi, Sikayet, Doktor, KanGrubu, Yas, Cinsiyet, KronikHastaligiVarMi

create table [Kan Grubu] 
(
KanGrubuID int Primary Key Identity(1,1),
Adi char(3) not null
)

create table Cinsiyet
(
CinsiyetID int Primary Key Identity(1,1),
Turu char(1) not null
)

create table Bolum
(
BolumID int Primary Key Identity(1,1),
Adi nvarchar(20) not null
)

create table Doktor
(
DoktorTC char(11) primary key,
Ad nvarchar(30) not null,
Soyad nvarchar(30) not null,
[Dogum Tarihi] date not null,
CinsiyetID int foreign key references Cinsiyet(CinsiyetID),
BolumID int foreign key references Bolum(BolumID),
[Mezun Oldugu �niversite] nvarchar(50) not null,
Maas money not null
)

create table Hasta
(
TC char(11) primary key,
Ad nvarchar(30) not null,
Soyad nvarchar(30) not null,
[Hastaneye Gelis Tarihi] datetime not null,
[Hastaneden Cikis Tarihi] datetime,
Sikayet nvarchar(30) not null,
KanGrubuID int foreign key references [Kan Grubu]  (KanGrubuID),
DogumTarihi datetime not null,
CinsiyetID int foreign key references Cinsiyet (CinsiyetID),
[Kronik Hastaligi Var Mi] bit not null
)
--Doktor Hasta aras�nda �oka �ok ili�ki vard�r.

create table DoktorHasta 
(
DoktorTC char(11) foreign key references Doktor(DoktorTC),
HastaTC char(11) foreign key references Hasta(TC)
)

--Cinsiyet, KanGrubu, Bolum 'lerden eklemeye ba�lamal�y�z.

--Cinsiyet Ekleme;
Insert into Cinsiyet (Turu) values ('E')
Insert into Cinsiyet values ('K')

--KanGrubu Ekleme;
Insert Into [Kan Grubu] (Adi) values ('A+')
Insert Into [Kan Grubu] (Adi) values ('A-')
Insert Into [Kan Grubu] (Adi) values ('B+')
Insert Into [Kan Grubu] (Adi) values ('B-')
Insert Into [Kan Grubu] (Adi) values ('AB+')
Insert Into [Kan Grubu] (Adi) values ('AB-')
Insert Into [Kan Grubu] (Adi) values ('0-')

--Bolum Ekleme;
Insert into Bolum (Adi) values ('Dahiliye') , ('Kulak Burun Bo�az'), ('Kardiyoloji'), ('Genel Cerrahi')

--Hasta Ekleme;

Insert into Hasta (TC, Ad,Soyad,[Hastaneye Gelis Tarihi],Sikayet,KanGrubuID,DogumTarihi,CinsiyetID,[Kronik Hastaligi Var Mi]) values ('12345678910', 'Fatih', 'YILMAZ', '2022-05-05', 'Bo�az A�r�s�',1,'1996-02-03', 1,0)

Insert into Hasta (TC, Ad,Soyad,[Hastaneye Gelis Tarihi],Sikayet,KanGrubuID,DogumTarihi,CinsiyetID,[Kronik Hastaligi Var Mi]) values ('10987654321', 'Gizem', 'G�LB�N', '2022-06-06', 'Ba� A�r�s�',5,'1998-01-07', 2,1)

--Doktor Ekleme;

Insert into Doktor values ('12345687954', 'Mehmet', 'KALKAN', '1990-06-11',1,2,'Marmara �niversitesi', 10000)

--Tablo G�ncelle�tirme;

--olu�turulmu� tablonun column tipini de�i�tirmi� olduk;
Alter table Bolum alter column Adi nvarchar(25)
--Olu�turulmu� tabloya column eklemek;
Alter table Bolum Add Puan int 