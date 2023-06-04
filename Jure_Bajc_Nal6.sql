#Korak 1: S pomočjo križne združitve, združite dve tabeli ter pri tem izpišite vse podatke obeh tabel.
select * from Merilna_Naprava  INNER JOIN Meritve;
#Korak 2: Z uporabo zunanje leve združitve združite dve tabeli. Pri tem bodite pozorni na lastnosti uporabljene združitve ter jo uporabite nad tabela in podatki, ki bodo prednost združitve tudi prikazale. Ponovno, pazite na smiselnost povpraševanja.
select * from Merilna_Naprava;
select * from Meritve;

select * from Metrolog
left join Meritve
on Meritve.ID_NAPR_TK = Merilna_Naprava.ID_NAPR;

#Korak 3: Z uporabo zunanje desne združitve združite dve tabeli. Pri tem bodite pozorni na lastnosti uporabljene združitve ter jo uporabite nad tabela in podatki, ki bodo prednost združitve tudi prikazale. Ponovno, pazite na smiselnost povpraševanja.

select * from Metrolog
right join Merilna_Naprava
on Metrolog.ID_MLOG = Merilna_Naprava.ID_NAPR;
#Korak 4: Z uporabo polne zunanje združitve združite dve tabeli. Pri tem bodite pozorni na lastnosti uporabljene združitve ter jo uporabite nad tabela in podatki, ki bodo prednost združitve tudi prikazale. Ponovno, pazite na smiselnost povpraševanja.
select * from Merilna_Naprava 
left  join Meritve 
ON Merilna_Naprava.ID_NAPR = Meritve.ID_NAPR_TK
UNION ALL
select * from Meritve
right join Merilna_Naprava
ON Merilna_Naprava.ID_NAPR = Meritve.ID_NAPR_TK;

#Korak 5: Z uporabo notranje eksplicitne združitve združite vse tri vaše tabele.
select * from Merilna_Naprava
inner join Meritve
on Merilna_Naprava.ID_NAPR = Meritve.ID_NAPR_TK 
inner join Metrolog
on Metrolog.ID_MLOG = Meritve.ID_MLOG_TK; 

#Korak 6: Z uporabo notranje implicitne združitve združite vse tri vaše tabele.

select * from Metrolog,Merilna_Naprava, Meritve
where  Merilna_Naprava.ID_NAPR = Meritve.ID_NAPR_TK
and Metrolog.ID_MLOG = Meritve.ID_MLOG_TK;

#Korak 7: Združite dve tabeli z operatorjem unija. Pazite na smiselnost. V kolikor v tabelah nimate primernih podatkov za uporabo omenjenega operatorja, le te dodajte.

select  ime as Ime from Metrolog  union select ime from Merilna_Naprava;


#Korak 8: Združite dve tabeli z operatorjem presek. Pazite na smiselnost in uporabo ukazov primernih za MySQL. V kolikor v tabelah nimate primernih podatkov za uporabo omenjenega operatorja, le te dodajte.
select  ime as Ime from Metrolog where ime IN (select ime from Merilna_Naprava);


#Primer: Izpiši priimke tistih prodajalcev in strank, ki se pišejo enako.

#Korak 9: Združite dve tabeli z operatorjem razlika. Pazite na smiselnost in uporabo ukazov primernih za MySQL. V kolikor v tabelah nimate primernih podatkov ta uporabo omenjenega operatorja, le te dodajte.Primer: Izpiši imena tistih delavcev, ki se ne pojavljajo med strankami. 
select ime as Ime from Metrolog where ime not in (select ime from Merilna_Naprava where Metrolog.ID_MLOG = Merilna_Naprava.Ime);



#Korak 10: Za poljubne tabeli izvedite povpraševanje z uporabo predikata ki preverja obstoj/pripadanje definirani množici in uporabo gnezdenega stavka. Pazite na smiselnost povpraševanja (povpraševanje oblikujte na način, da predikata IN ni mogoče zamenjati z =).
select * from Metrolog where ime IN (select  distinct ime from Merilna_Naprava);


#Korak 11: Za poljubne tabeli izvedite povpraševanje z uporabo predikata ANY oz. SOME in uporabo katerega koli osnovnega predikata razen "je enako". Pri (smiselni) uporabi, pazite na njegove značilnosti.
select * from Metrolog where ime >= ANY (select ime FROM Merilna_Naprava);	


#Korak 12: Za poljubne tabeli izvedite povpraševanje z uporabo predikata ALL in uporabo katerega koli osnovnega predikata razen "je enako". Pri njegovi (smiselni) uporabi, pazite na njegove značilnosti.
select * from Metrolog where ime <> ALL (select ID_NAPR FROM Merilna_Naprava);