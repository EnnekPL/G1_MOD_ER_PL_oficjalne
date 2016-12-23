func void B_CheckDeadMissionNPCs ()
//Diese Funktion checkt im ZS_Dead, ob eine Mission durch den Tot eines NSCs obsolet geworden ist.
{
	if (Hlp_GetInstanceID(Org_844_Lefty) ==  Hlp_GetInstanceID(self))
	{
		if (Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry	(CH1_CarryWater,	"Po �mierci Lewusa problem wody chyba sam si� rozwi�za�. Nigdy nie lubi�em tego cz�owieka.");
			Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
			LeftyDead = TRUE;
		};
		if (Quest_KillLefty == LOG_RUNNING)
		{
		Quest_KillLefty = LOG_SUCCESS;
		B_LogEntry   (CH1_BuntZbieraczy,"Lewus nie �yje. Nasz plan si� powi�d�. Musz� porozmawia� z Rufusem.");
		};
	};
	if (Hlp_GetInstanceID(NOV_1373_Novize) ==  Hlp_GetInstanceID(self))
	{
	if (MIS_EmanuelsDeals == LOG_RUNNING)
		{
			B_LogEntry	(CH1_EmanuelsDeals,"Nied�ugo musia�em szuka�. Przy po�udniowej bramie do Starego Obozu znalaz�em kolejnych Nowicjuszy. Tym razem �ywych i agresywnych. Rozprawi�em si� z nimi. Musz� teraz poszuka� rudy Emanuela i wr�ci� do niego.");
	};
	};
	
	if (Hlp_GetInstanceID(GRD_3085_Nek) ==  Hlp_GetInstanceID(self)) && (MIS_WheresNek == LOG_RUNNING)
	{
	B_LogEntry               (CH1_WheresNek,"Nek nie �yje. Mog� wr�ci� do Starego Obozu i powiedzie� o wszystkim Snafowi i Fletcherowi.");	
	HeroKillNek = true;
	};

// ======================================================
// BUNT ZBIERACZY
// ======================================================
	if (Hlp_GetInstanceID(BAU_921_Bauer) ==  Hlp_GetInstanceID(self))
	{
		if (MIS_BuntZbieraczy == LOG_RUNNING)
		{
			B_LogEntry    		(CH1_BuntZbieraczy,"Zabi�em Zbieracza, kt�ry by� uwa�any przez Rufusa za zdrajc�.");
			FoggyKilled = TRUE;
		};
	};
	
	if (Hlp_GetInstanceID(Bau_903_Rufus) ==  Hlp_GetInstanceID(self))
	{
		if (MIS_BuntZbieraczy == LOG_RUNNING)
		{
			B_LogEntry    		(CH1_BuntZbieraczy,"Rufus nie �yje. Bez niego buntownicy s� sko�czeni.");
			Quest_KillRufus = LOG_SUCCESS;
		};
	};
// ======================================================
// GOTHIC EDYCJA ROZSZERZONA
// BOSSOWIE - WPISY I PREMIE
// GUDZIE� 2014
// ======================================================

var int wpis_gomez;
if (Hlp_GetInstanceID(EBR_100_Gomez) ==  Hlp_GetInstanceID(self)) && (kapitel >= 4)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_gomez = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Z mojej r�ki zgin�� najpot�niejszy cz�owiek w ca�ej G�rniczej Dolinie. Gomez - najpot�niejszy z Magnat�w trzymaj�cy w gar�ci ca�y handel ze �wiatem zewn�trznym. Obali�em tyrana!");
};

var int wpis_jackal;
if (Hlp_GetInstanceID(GRD_201_Jackal) ==  Hlp_GetInstanceID(self)) && (kapitel >= 4)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_jackal = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Pokona�em jednego z najpot�niejszych Stra�nik�w w Starym Obozie. S�ynny Szakal le�y zakrwawiony u moich st�p. Ju� nigdy nikogo nie skrzywdzi.");
};


var int wpis_ur_gran;
if (Hlp_GetInstanceID(Ur_Gran) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_ur_gran = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Pokona�em wielkiego orkowego pu�kownika Ur-Grana. Walka z nim nie by�a �atwa. Nie do��, �e sam by� pot�ny, to otoczy� si� swoimi najlepszymi wojownikami. Zapami�tam t� walk� na d�ugo.");
};

var int wpis_kurvok;
if (Hlp_GetInstanceID(Ur_Na_Kurvok) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_kurvok = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi�em pot�nego orkowego gladiatora Ur-Na-Kurvoka - jednego z najniebezpieczniejszych ork�w w G�rniczej Dolinie.");
};

var int wpis_varrag;
if (Hlp_GetInstanceID(Varrag_Harosh) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_varrag = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W g��wnej sali Cmentarzyska Ork�w spotka�em orkowego szamana Varraga-Harosha Pot�nego. Walka z nim nie by�a �atwa. To pot�ny wojownik.");
};

var int wpis_nyras;
if (Hlp_GetInstanceID(NOV_1303_Nyras) ==  Hlp_GetInstanceID(self)) && (YBerion_BringFocus == LOG_RUNNING)
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_nyras = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Nyras zupe�nie oszala�. Widocznie si�a �ni�cego prze�ar�a mu m�zg. Postanowi� mnie zaatakowa�. S�dzi�em, �e walka nie b�dzie trudna, jednak w jego uderzeniu by�o co�, czego si� nie spodziewa�em. By�o znacznie silniejsze, a sam Nyras bardziej wytrzymalszy. �ni�cy musia� podzieli� si� z nim swoj� moc�, albo to wp�yw jakiego� artefaktu.");
};

var int wpis_crawelqueen;
if (Hlp_GetInstanceID(MinecrawlerQueen) ==  Hlp_GetInstanceID(self)) //fix
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_crawelqueen = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi�em kr�low� pe�zaczy w Starej Kopalni. Olbrzymia samica by�a jednym z najniebezpieczniejszych potwor�w z jakimi mia�em do czynienia. Wygl�d tej bestii utkwi� w mojej pami�ci. Ca�e szcz�cie, �e wyszed�em z tego w jednym kawa�ku.");
};

var int wpis_golumik;
if (Hlp_GetInstanceID(Gol_Umik) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_golumik = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W jaskini pe�nej goblin�w wyr�ni� si� ich herszt. Legendarny goblin Gol-Umik. By� wyra�nie wi�kszy od pozosta�ych. Ponadto nosi� zbroj�. Walka z nim by�a trudna, zw�aszcza, �e mia� tylu pomocnik�w.");
};

var int wpis_madsnapper;
if (Hlp_GetInstanceID(BigSnapper) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_madsnapper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Gdy wracali�my z Gornem z Klasztoru Zmiennokszta�tnych napad� na nas olbrzymi z�bacz. Cholernie niebezpieczna bestia. ");
};

var int wpis_madharpie;
if (Hlp_GetInstanceID(MadHarpie) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_madharpie = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Podczas eksploracji g�rskiej fortecy z Lesterem mia�em nieprzyjemno�� stoczy� walk� z rozw�cieczon� harpi�. Nie do��, �e wojownicza to silna i wyj�tkowo odporna na ataki.");
};

var int wpis_bigtroll;
if (Hlp_GetInstanceID(MadTroll) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_bigtroll = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Id�c z Diego do kanionu w g�rach spodziewa�em si�, �e spotkam trolla. Kto by pomy�la�, �e b�dzie to stary, bardzo niebezpieczny samiec. Dobrze, �e chocia� by� powolny. ");
};

var int wpis_zombiethekeeper;
if (Hlp_GetInstanceID(ZombieTheKeeper) ==  Hlp_GetInstanceID(self))
{
//bonus atrybutu
if Npc_HasReadiedMeleeWeapon (other)
{
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_HasReadiedRangedWeapon (other)
{
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 1;
	PrintScreen	("Zr�czno�� + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
}
else if Npc_GetActiveSpell (other) 
{
	other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 1;
	PrintScreen	("Mana + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
//koniec bonusu
wpis_zombiethekeeper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Przeszukuj�c z Miltenem star� krypt� napotka�em na Nadzorc�. Z tego co m�wi� Milten ta um�czona dusza nale�a�a ongi� do Magnata ze Starego Obozu. C�, pomimo up�ywu lat si�y mu nie brakowa�o. ");
};
};
