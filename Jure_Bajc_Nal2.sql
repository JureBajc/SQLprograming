alter table Meritve modify column ID_NAPR_TK int unsigned;

alter table Meritve alter column ID_NAPR_TK SET DEFAULT (10);

alter table Meritve alter column ID_NAPR_TK DROP DEFAULT;

alter table Meritve add constraint Datum_meritveUNI UNIQUE (Datum_meritve);

alter table Meritve add constraint ID_MER primary key(ID_MER);
alter table Metrolog add constraint ID_MLOG primary key(ID_MLOG);
alter table Merilna_Naprava add constraint ID_NAPR primary key(ID_NAPR);


alter table Meritve add constraint FK_ID_NAPR_TK foreign key(ID_NAPR_TK) references Merilna_Naprava(ID_NAPR);
alter table Meritve add foreign key (ID_MLOG_TK)references Metrolog(ID_MLOG);

alter table Meritve drop constraint FK_ID_NAPR_TK;
alter table Meritve drop foreign key Meritve_ibfk_1;

alter table Meritve add constraint FK_ID_NAPR_TK foreign key(ID_NAPR_TK) references Merilna_Naprava(ID_NAPR)ON DELETE CASCADE ON 
UPDATE SET NULL ;
alter table Meritve add foreign key (ID_MLOG_TK)references Metrolog(ID_MLOG)ON DELETE CASCADE ON 
UPDATE SET NULL;