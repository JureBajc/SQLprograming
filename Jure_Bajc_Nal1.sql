create table Metrolog(ID_MLOG int,Ime varchar(20),Priimek varchar(30));

create table Merilna_Naprava(ID_NAPR int, Ime varchar(20),Zemljepisna_sirina double);

alter table Merilna_Naprava rename Merila;

alter table Metrolog add column Datum_Zaposlitve date;

alter table Merila add column Zemljepisna_dolzina double AFTER ID_NAPR;

alter table Merila rename column ID_NAPR to ID_NAPRAVE;

alter table Merila modify Zemljepisna_dolzina int;

ALTER TABLE Merila DROP COLUMN Zemljepisna_dolzina; 

ALTER TABLE Merila MODIFY Ime ENUM('Ljubljana','Maribor','Wajdušna','Celje','Gorica','Trst');

DROP TABLE Merila;

create table Merilna_Naprava(ID_NAPR int, Ime varchar(20),Zemljepisna_sirina double,Zemljepisna_dolzina double);

Create table Meritve(ID_MER int, Temperatura double,Vlažnost double,Okvara boolean,ID_NAPR_TK int);

alter table Meritve add ID_MLOG_TK int;
