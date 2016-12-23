func void B_CheckDeadMissionNPCs ()
//Diese Funktion checkt im ZS_Dead, ob eine Mission durch den Tot eines NSCs obsolet geworden ist.
{
	if (Hlp_GetInstanceID(Org_844_Lefty) ==  Hlp_GetInstanceID(self))
	{
		if (Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry	(CH1_CarryWater,	"Po œmierci Lewusa problem wody chyba sam siê rozwi¹za³. Nigdy nie lubi³em tego cz³owieka.");
			Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
			LeftyDead = TRUE;
		};
		if (Quest_KillLefty == LOG_RUNNING)
		{
		Quest_KillLefty = LOG_SUCCESS;
		B_LogEntry   (CH1_BuntZbieraczy,"Lewus nie ¿yje. Nasz plan siê powiód³. Muszê porozmawiaæ z Rufusem.");
		};
	};
	if (Hlp_GetInstanceID(NOV_1373_Novize) ==  Hlp_GetInstanceID(self))
	{
	if (MIS_EmanuelsDeals == LOG_RUNNING)
		{
			B_LogEntry	(CH1_EmanuelsDeals,"Nied³ugo musia³em szukaæ. Przy po³udniowej bramie do Starego Obozu znalaz³em kolejnych Nowicjuszy. Tym razem ¿ywych i agresywnych. Rozprawi³em siê z nimi. Muszê teraz poszukaæ rudy Emanuela i wróciæ do niego.");
	};
	};
	
	if (Hlp_GetInstanceID(GRD_3085_Nek) ==  Hlp_GetInstanceID(self)) && (MIS_WheresNek == LOG_RUNNING)
	{
	B_LogEntry               (CH1_WheresNek,"Nek nie ¿yje. Mogê wróciæ do Starego Obozu i powiedzieæ o wszystkim Snafowi i Fletcherowi.");	
	HeroKillNek = true;
	};

// ======================================================
// BUNT ZBIERACZY
// ======================================================
	if (Hlp_GetInstanceID(BAU_921_Bauer) ==  Hlp_GetInstanceID(self))
	{
		if (MIS_BuntZbieraczy == LOG_RUNNING)
		{
			B_LogEntry    		(CH1_BuntZbieraczy,"Zabi³em Zbieracza, który by³ uwa¿any przez Rufusa za zdrajcê.");
			FoggyKilled = TRUE;
		};
	};
	
	if (Hlp_GetInstanceID(Bau_903_Rufus) ==  Hlp_GetInstanceID(self))
	{
		if (MIS_BuntZbieraczy == LOG_RUNNING)
		{
			B_LogEntry    		(CH1_BuntZbieraczy,"Rufus nie ¿yje. Bez niego buntownicy s¹ skoñczeni.");
			Quest_KillRufus = LOG_SUCCESS;
		};
	};
// ======================================================
// GOTHIC EDYCJA ROZSZERZONA
// BOSSOWIE - WPISY I PREMIE
// GUDZIEÑ 2014
// ======================================================

var int wpis_gomez;
if (Hlp_GetInstanceID(EBR_100_Gomez) ==  Hlp_GetInstanceID(self)) && (kapitel >= 4)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_gomez = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Z mojej rêki zgin¹³ najpotê¿niejszy cz³owiek w ca³ej Górniczej Dolinie. Gomez - najpotê¿niejszy z Magnatów trzymaj¹cy w garœci ca³y handel ze œwiatem zewnêtrznym. Obali³em tyrana!");
};

var int wpis_jackal;
if (Hlp_GetInstanceID(GRD_201_Jackal) ==  Hlp_GetInstanceID(self)) && (kapitel >= 4)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_jackal = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Pokona³em jednego z najpotê¿niejszych Stra¿ników w Starym Obozie. S³ynny Szakal le¿y zakrwawiony u moich stóp. Ju¿ nigdy nikogo nie skrzywdzi.");
};


var int wpis_ur_gran;
if (Hlp_GetInstanceID(Ur_Gran) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_ur_gran = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Pokona³em wielkiego orkowego pu³kownika Ur-Grana. Walka z nim nie by³a ³atwa. Nie doœæ, ¿e sam by³ potê¿ny, to otoczy³ siê swoimi najlepszymi wojownikami. Zapamiêtam tê walkê na d³ugo.");
};

var int wpis_kurvok;
if (Hlp_GetInstanceID(Ur_Na_Kurvok) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_kurvok = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi³em potê¿nego orkowego gladiatora Ur-Na-Kurvoka - jednego z najniebezpieczniejszych orków w Górniczej Dolinie.");
};

var int wpis_varrag;
if (Hlp_GetInstanceID(Varrag_Harosh) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_varrag = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W g³ównej sali Cmentarzyska Orków spotka³em orkowego szamana Varraga-Harosha Potê¿nego. Walka z nim nie by³a ³atwa. To potê¿ny wojownik.");
};

var int wpis_nyras;
if (Hlp_GetInstanceID(NOV_1303_Nyras) ==  Hlp_GetInstanceID(self)) && (YBerion_BringFocus == LOG_RUNNING)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_nyras = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Nyras zupe³nie oszala³. Widocznie si³a Œni¹cego prze¿ar³a mu mózg. Postanowi³ mnie zaatakowaæ. S¹dzi³em, ¿e walka nie bêdzie trudna, jednak w jego uderzeniu by³o coœ, czego siê nie spodziewa³em. By³o znacznie silniejsze, a sam Nyras bardziej wytrzymalszy. Œni¹cy musia³ podzieliæ siê z nim swoj¹ moc¹, albo to wp³yw jakiegoœ artefaktu.");
};

var int wpis_crawelqueen;
if (Hlp_GetInstanceID(MinecrawlerQueen) ==  Hlp_GetInstanceID(self)) //fix
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_crawelqueen = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi³em królow¹ pe³zaczy w Starej Kopalni. Olbrzymia samica by³a jednym z najniebezpieczniejszych potworów z jakimi mia³em do czynienia. Wygl¹d tej bestii utkwi³ w mojej pamiêci. Ca³e szczêœcie, ¿e wyszed³em z tego w jednym kawa³ku.");
};

var int wpis_golumik;
if (Hlp_GetInstanceID(Gol_Umik) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_golumik = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W jaskini pe³nej goblinów wyró¿ni³ siê ich herszt. Legendarny goblin Gol-Umik. By³ wyraŸnie wiêkszy od pozosta³ych. Ponadto nosi³ zbrojê. Walka z nim by³a trudna, zw³aszcza, ¿e mia³ tylu pomocników.");
};

var int wpis_madsnapper;
if (Hlp_GetInstanceID(BigSnapper) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_madsnapper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Gdy wracaliœmy z Gornem z Klasztoru Zmiennokszta³tnych napad³ na nas olbrzymi zêbacz. Cholernie niebezpieczna bestia. ");
};

var int wpis_madharpie;
if (Hlp_GetInstanceID(MadHarpie) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_madharpie = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Podczas eksploracji górskiej fortecy z Lesterem mia³em nieprzyjemnoœæ stoczyæ walkê z rozwœcieczon¹ harpi¹. Nie doœæ, ¿e wojownicza to silna i wyj¹tkowo odporna na ataki.");
};

var int wpis_bigtroll;
if (Hlp_GetInstanceID(MadTroll) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_bigtroll = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Id¹c z Diego do kanionu w górach spodziewa³em siê, ¿e spotkam trolla. Kto by pomyœla³, ¿e bêdzie to stary, bardzo niebezpieczny samiec. Dobrze, ¿e chocia¿ by³ powolny. ");
};

var int wpis_zombiethekeeper;
if (Hlp_GetInstanceID(ZombieTheKeeper) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zrêcznoœæ + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_zombiethekeeper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Przeszukuj¹c z Miltenem star¹ kryptê napotka³em na Nadzorcê. Z tego co mówi³ Milten ta umêczona dusza nale¿a³a ongiœ do Magnata ze Starego Obozu. Có¿, pomimo up³ywu lat si³y mu nie brakowa³o. ");
};
};
