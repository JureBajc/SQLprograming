#Korak 1: Za poljubno tabelo izvedite povpraševanje po vseh podatkih tabele.
SELECT * FROM Merilna_Naprava;

#Korak 2: Za poljubno tabelo izvedite povpraševanje po treh stolpcih pri čemer uporabite en pogoj, ki vsebuje osnovne primerjalne predikate in stolpec/ca/ce ob poizvedovanju smiselno preimenujte.
SELECT ime as zemljevid from Merilna_Naprava
where Zemljepisna_dolzina=15.12457653123;

#Korak 3: Za poljubno tabelo izvedite povpraševanje po različnih vrednostih (izpisati ne želimo vseh vrednosti, ampak samo različne vrednosti) po dveh stolpcih v tabeli.
SELECT distinct Datum_meritve,Temperatura,Vlažnost From Meritve;

#Korak 4: Za poljubno tabelo izvedite povpraševanje glede na tri pogoje, ki vsebujejo osnovne primerjalne predikate in pri čemer morajo rezultati ustrezati vsem trem pogojem.
select Datum_meritve,Temperatura ,Vlažnost   from Meritve WHERE  ID_MER < 5 AND Okvara='DA' AND Vlažnost = 50; 

#Korak 5: Za poljubno tabelo izvedite povpraševanje glede na tri pogoje, ki vsebujejo osnovne primerjalne predikate in pri čemer morajo rezultati ustrezati vsaj enemu izmed treh pogojev.
select Datum_meritve,Temperatura ,Vlažnost from Meritve WHERE (ID_MER < 5 or Okvara='DA' or Vlažnost = 50);

#Korak 6: Za poljubno tabelo izvedite povpraševanje z uporabo predikata "med (dvema vrednostnima)" in pri tem pazite na smiselnost uporabe.
select Datum_meritve,Temperatura ,Vlažnost from Meritve WHERE Temperatura BETWEEN 2 AND 20;

#Korak 7: Za poljubno tabelo izvedite povpraševanje z uporabo predikata, ki preverja delno ujemanje vzorca znakovnih nizov. Pri tem uporabite ključni znak, ki predstavlja nadomeščanje natanko enega znaka in ključni znak, ki nadomešča več poljubnih znakov. Izpišite samo različne vrednosti v kolikor se vrednosti ponavljajo (npr. trije delavci z imenom Matej)).  
select distinct * from Metrolog where Ime Like 'Ju%';

#Korak 8: Za poljubno tabelo izvedite povpraševanje pri čemer uporabite en pogoj, ki vsebuje osnovne primerjalne predikate in pogoj ki bo preveril obstoj praznih/neznanih vrednosti.
select * from Meritve where (ID_MER < 5 AND ID_NAPR_TK IS NOT NULL);

#Korak 9: Za poljubno tabelo izvedite povpraševanje z uporabo predikata, ki preverja obstoj/pripadanje definirani množici. Primer oblikujete na način, da uporabite zanikanje omenjenega predikata (NOT).
select * from Metrolog where Ime NOT IN ('Jure', 'Nejc','Jurij');

#Korak 10: Izvedite povpraševanje, v katerem izpišete vrednosti enega stolpca, pri tem pa rezultate razvrstite naraščajoče.
select Ime from Merilna_Naprava ORDER BY Ime ASC;

#Korak 11: Izvedite povpraševanje, v katerem izpišete vrednosti dveh stolpcev glede na poljuben/na pogoj(a), pri tem pa rezultate razvrstite po enem stolpcu naraščajoče ter po drugem padajoče. Izpišite samo prvih 5 vrstic.
select ID_MER, Temperatura from Meritve where (Temperatura > 1 AND ID_MER <20) order by Temperatura DESC , ID_MER ASC;
