#Korak 1: Izvedite povpraševanje, v katerem uporabite funkcijo, ki za en stolpec vrne število vseh zapisov določenega stolpca tabele ter rezultate grupirajte po poljubnem stolpcu. Stolpec na katerem ste uporabili funkcijo nad množicami primerno preimenujte. (Primer povpraševanja: Koliko računov je bilo izdanih za posamezno stranko?)
select ID_MLOG as ID,COUNT(Datum_Zaposlitve) as zaposlitev from Metrolog group by ID_MLOG;

#Korak 2: Izvedite povpraševanje, v katerem uporabite poljubno funkcijo nad množicami ter rezultate grupirajte po dveh poljubnih stolpcih. (Primer povpraševanja: Koliko računov je bilo izdanih za posamezno stranko na določen dan?)
select ID_MER as ID, sum(Vlažnost) from Meritve group by Datum_meritve,ID_MER;

#Korak 3: Združite dve tabeli, izpišite vrednost določeno s poljubno funkcijo, rezultate grupirajte po poljubnem stolpcu ter jih filtrirajte z enostavnim pogojem (npr. >1000).

select ID_MER as ID, SUM(Temperatura) as Temp, Zemljepisna_sirina,Zemljepisna_dolzina from Meritve,Merilna_Naprava group by ID_MER,Zemljepisna_sirina,Zemljepisna_dolzina  having SUM(Temperatura) > 100 ;

#Korak 4: Za poljubne tabeli izvedite povpraševanje z uporabo predikata EXISTS. Pri (smiselni) uporabi, pazite na njegove značilnosti.

select ID_MER as ID, ID_MLOG_TK from Meritve where exists (select ID_MLOG from Metrolog where Ime LIKE'Juri');

select * from Meritve;

#Korak 5: Za poljubno tabelo izvedite povpraševanje, v katerem smiselno uporabite ukaz CASE.
select ID_MER,
Case
WHEN 
Okvara LIKE 'DA'
THEN 'NE'
END AS pogoj
from Meritve;

#Korak 6: Poljubna tri povpraševanja iz prejšnjih nalog izvedite z uporabo pogledov. Bodite pozorni, da bodo povpraševanja dovolj kompleksna, da bo uporaba pogledov smiselna.

create view pogled_ena as select ID_MER,COUNT(Temperatura) as Temp from Meritve group by ID_MER;
select * from pogled_ena;

create view pogled_tri as select Datum_meritve,
case 
when Vlažnost < 10
then 0
when Vlažnost between 10 and 20 
then 1
else 2
end as Vpogled_vlaz
from Meritve;
select * from pogled_tri;