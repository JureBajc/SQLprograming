#Korak 1: Sledenje spremembam - 1

#Sledili boste spremembam v eni izmed svojih tabel. Sledili boste spremembam poljubne vrednosti, ki jih boste izvedli s pomočjo UPDATE.

#Za poljubno tabelo ustvarite dodatno tabelo, ki jo poimenujete imeTabele_log in naj vsebuje stolpce id, id urejenega vnosa, staro vrednost, spremenjeno vrednost in datum spremembe).
create table Merilna_Naprava_log(
id int auto_increment primary key,
id_urejenega_vnosa int,
stara_vrednost varchar(255),
spreminjenja_vrednost varchar(255),
datum_spremember timestamp
);

delimiter &
create trigger Merilna_naprava_onUpdate
after update on Merilna_Naprava
for each row begin
insert into Merilna_Naprava_log values(
default,
null,
OLD.Zemljepisna_sirina,
NEW.Zemljepisna_sirina,
now());
end&
delimiter ;

show triggers;
#Korak 2: Sledenje spremembam - 2
#V koraku 2 boste prav tako sledili spremembam, ampak na drugačen način. Sledili boste izvedenim aktivnostim (INSERT ali UPDATE).
#Za poljubno tabelo (drugačno kot v koraku 1) ustvarite dodatno tabelo, ki jo poimenujete imeTabele_stanje in naj vsebuje stolpce id, id urejenega/vnesenega vnosa in izvedeno stanje (posodobljeno oz. nov vnos).

create table Metrolog_stanje(
id int auto_increment primary key,
id_urejenega_stanja int,
izvedeno_stanje varchar(255)
);

#Ustvarite dva prožilca. Prvi ob novem vnosu (INSERT) v novo ustvarjeno tabelo zapiše "nov vnos" in pripadajoč id, drugi pa ob posodobitvi (UPDATE) vpiše v novo ustvarjeno tabelo "posodobljeno".

delimiter &
create trigger Metrolog_nainsert
after insert on Metrolog
for each row begin
insert into Metrolog_stanje values(
default,
NEW.id_urejenega_stanja,
NEW.izvedeno_stanje);
end&
delimiter ;


delimiter &
create trigger Metrolog_naupdate
after update on Metrolog
for each row begin
insert into Metrolog_stanje values(
default,
NEW.izvedeno_stanje,
"posodobljeno");
end&
delimiter ;

delimiter &
create procedure metrlogoinsert(in ID_MLOG int,in Ime varchar(20),in Priimek varchar(30), in Datum_Zaposlitve date)
begin
insert into Metrolog Values(
ID_MLOG,
Ime,
Priimek,
Datum_Zaposlitve
);
end;
delimiter ;

delimiter &
create procedure metrologshrani(in id int)
begin
delete from metrolog 
where Metrolog.ID_MLOG=id;
end&
delimiter ;


delimiter &
create procedure meritvepara(in id int)
begin
select Datum_meritve, Ime, Priimek from Meritve,Metrolog
where Mertive.ID_MLOG_TK=Metrolog.ID_MLOG;
end&
delimiter ;

#Korak 4: Ustvarite dogodek, ki bo periodično brisal podatke iz tabele "*_stanje" ustvarjene v koraku 2. POMEMBNO: Interval dogodka naj bo 1 leto!
create event brisip
on schedule at timestamp (now() + interval 1 year)
on completion preserve
do
delete from Metrolog_stanje;

#Korak 5: Ustvarite shranjeno proceduro, ki bo vnesla novo vrstico v poljubno tabelo in jo poimenujte imeTabeleInsert. Procedura naj sprejema parametre, ki predstavljajo vrednosti, ki se vnesejo v tabelo.

delimiter & 
create procedure Merilna_NapravaInsert (in mid int, in mime varchar(20), IN mzsirin int, in mzdolz int)
begin
insert into odsek values(
mid,
mime,
mzsirin,
mzdolz);
end &
delimiter ;	

#Korak 6: Ustvarite shranjeno proceduro, ki sprejme en parameter "ID", in iz poljubne tabele izbriše vrstico s tistim ID-jem.

delimiter &
create procedure odstraniid (in mid int)
begin
delete from Merilna_Naprava where Merilna_Naprava.id = mid;
end &
delimiter ;


#Korak 7: Ustvarite shranjeno proceduro, ki sprejme en ali več parametrov, ki predstavljajo vrednosti po katerih boste filtrirali rezultate določene poizvedbe nad vsaj 2 tabeli v vaši bazi. Npr: Procedura "IzpisiSteviloRacunov(ime, priimek)" sprejme parametre "ime" in "priimek" stranke in kot rezultat izpiše skupno število računov, ki smo jih izdali tisti stranki. 


delimiter &
create procedure IzpisiSteviloRacunov (in mid int)
begin
select Datum_meritve, Temperatura from Meritve, Metrolog where (Meritve.id = mid and Metrolog.ID_MLOG = mid)AND Metrolog.ime LIKE 'jure';
end &
delimiter ; 

show procedure status;