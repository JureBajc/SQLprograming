#Korak 1: Za poljubno tabelo izvedite povpraševanje, v katerem uporabite funkcijo, ki za en stolpec vrne število vseh zapisov določenega stolpca tabele in za drug stolpec vrne povprečno vrednost vseh vrednosti določenega stolpca tabele pri čemer pregledovane vrednosti omejite s poljubnim pogojem z uporabo gnezdenega stavka. 
SELECT Datum_meritve,Vlažnost  FROM Meritve
WHERE Vlažnost = (SELECT MAX(Vlažnost) FROM Meritve);

#Korak 2: Za poljubno tabelo izvedite povpraševanje, v katerem uporabite funkcijo, ki vrne najmanjšo in največjo vrednost določenega stolpca pri čemer pregledovane vrednosti omejite s poljubnim pogojem z uporabo gnezdenega stavka. 
SELECT MIN(Vlažnost),
MAX(Temperatura) FROM Meritve;

#Korak 3: Za poljubno tabelo izvedite povpraševanje, v katerem uporabite funkcijo preštevanja na način, da prešteje samo unikatne zapise poljubno izbranega stolpca.
SELECT COUNT(DISTINCT Tekmovalec)
FROM ime;

#Korak 4: Za poljubno tabelo izvedite povpraševanje, v katerem uporabite funkcijo seštevanja na način, da sešteje samo unikatne zapise poljubno izbranega stolpca.
SELECT SUM(DISTINCT Zemljepisna_sirina)
FROM Merilna_Naprava;

#Korak 5: Za poljubno tabelo izvedite povpraševanje, v katerem smiselno uporabite poljubno funkcijo nad množicami v gnezdenem stavku v okviru pogoja povpraševanja.
SELECT SUM(ID_MER) from Meritve
WHERE ID_MER IN(select ID_MER FROM Meritve WHERE ID_MER IN (1,2,3));

#Korak 6: Izvedite povpraševanje, pri katerem uporabite poljubno numerično funkcijo nad vrednostmi.
SELECT Abs(-243.5) AS AbsNum;

#Korak 7: Izvedite povpraševanje, pri katerem uporabite poljubno znakovno funkcijo nad vrednostmi.
SELECT upper('ime');

#Korak 8: Izvedite povpraševanje, pri katerem uporabite poljubno datumsko funkcijo nad vrednostmi.
SELECT curdate();