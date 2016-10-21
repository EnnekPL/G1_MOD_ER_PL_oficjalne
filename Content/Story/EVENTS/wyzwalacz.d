

var string s1,s2,s3,s4,s5;
//wyzwalacz - funkcja g³ówna
	func void fuckcja_ucieczka_scar ()
	{
	var c_npc torrez; 		torrez = Hlp_GetNpc (KDF_405_Torrez);
	var c_npc torwache213; 	torwache213 = Hlp_GetNpc (Grd_213_Torwache);
	var c_npc rodriguez; 	rodriguez = Hlp_GetNpc (KDF_400_Rodriguez);
	var c_npc torwache212; 	torwache212 = Hlp_GetNpc (Grd_212_Torwache);
	var c_npc torwache215; 	torwache215 = Hlp_GetNpc (Grd_215_Torwache);
	var c_npc torwache214; 	torwache214 = Hlp_GetNpc (Grd_214_Torwache);
	var c_npc torwache216; 	torwache216 = Hlp_GetNpc (Grd_216_Torwache);
	var c_npc torwache217; 	torwache217 = Hlp_GetNpc (Grd_217_Torwache);
	var c_npc grd232; 	grd232 = Hlp_GetNpc (Grd_232_Gardist);
	var c_npc grd252; 	grd252 = Hlp_GetNpc (Grd_252_Gardist);
	
	torwache213.Npctype = NPCTYPE_GUARD;
	torwache212.Npctype = NPCTYPE_GUARD;
	torwache215.Npctype = NPCTYPE_GUARD;
	torwache214.Npctype = NPCTYPE_GUARD;
	torwache216.Npctype = NPCTYPE_GUARD;
	torwache217.Npctype = NPCTYPE_GUARD;
	
	 Npc_SetPermAttitude (torrez, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache213, ATT_HOSTILE);
	 Npc_SetPermAttitude (rodriguez, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache212, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache215, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache214, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache216, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache217, ATT_HOSTILE);
	 Npc_SetPermAttitude (grd232, ATT_HOSTILE);
	 Npc_SetPermAttitude (grd252, ATT_HOSTILE);
	};
	
	func void fuckcja_ucieczka_scar2 ()
	{
	var c_npc torrez; 		torrez = Hlp_GetNpc (KDF_405_Torrez);
	var c_npc torwache213; 	torwache213 = Hlp_GetNpc (Grd_213_Torwache);
	var c_npc rodriguez; 	rodriguez = Hlp_GetNpc (KDF_400_Rodriguez);
	var c_npc torwache212; 	torwache212 = Hlp_GetNpc (Grd_212_Torwache);
	var c_npc torwache215; 	torwache215 = Hlp_GetNpc (Grd_215_Torwache);
	var c_npc torwache214; 	torwache214 = Hlp_GetNpc (Grd_214_Torwache);
	var c_npc torwache216; 	torwache216 = Hlp_GetNpc (Grd_216_Torwache);
	var c_npc torwache217; 	torwache217 = Hlp_GetNpc (Grd_217_Torwache);
	var c_npc grd232; 	grd232 = Hlp_GetNpc (Grd_232_Gardist);
	var c_npc grd252; 	grd252 = Hlp_GetNpc (Grd_252_Gardist);
	
	torwache213.Npctype = NPCTYPE_FRIEND;
	torwache212.Npctype = NPCTYPE_FRIEND;
	torwache215.Npctype = NPCTYPE_FRIEND;
	torwache214.Npctype = NPCTYPE_FRIEND;
	torwache216.Npctype = NPCTYPE_FRIEND;
	torwache217.Npctype = NPCTYPE_FRIEND;
	
	 Npc_SetPermAttitude (torrez, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache213, ATT_NEUTRAL);
	 Npc_SetPermAttitude (rodriguez, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache212, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache215, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache214, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache216, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache217, ATT_NEUTRAL);
	 Npc_SetPermAttitude (grd232, ATT_NEUTRAL);
	 Npc_SetPermAttitude (grd252, ATT_NEUTRAL);
	};
	
func void fuckcja_zadanie ()
{
//if
/* (Npc_KnowsInfo (hero, DIA_Avallach_Lekikurwa))
{
//Potêga czarnego maga
//PrintScreen	("Potêga Czarnego Maga wzros³a", -1,-1,"FONT_NEW_10_RED.TGA",3);
NON_3073_Czarny_Mag.level = 800;
NON_3073_Czarny_Mag.attribute[ATR_HITPOINTS_MAX] = 1500;
NON_3073_Czarny_Mag.attribute[ATR_HITPOINTS] = 1500;
}
else
{
B_KillNpc			(NON_3078_Avallach);
};*/
};

func void WYZWALACZ ()
{
//print ("triger = on");
var int DannyHelp_var;
if (Npc_GetDistToWP (hero, "OM_CAVE1_93") < 1000) && (DannyHelp_var == false)
{
Snd_Play		("DannyHelp");
DannyHelp_var = true;
};
//print ("wer");
var int resp_demonow_kopalnia;
if (Npc_IsDead(NON_3073_Czarny_Mag)) && (resp_demonow_kopalnia == false) && (Npc_GetDistToWP (hero, "VM_MAGE") < 5000)
{
	resp_demonow_kopalnia = true;
	Wld_InsertNpc		(DemonMine,"ZL10");
	Wld_InsertNpc		(DemonMine,"VM_PATH1");
	Wld_InsertNpc		(DemonMine,"VM_SKE_BOW1");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_1");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_2");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_3");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_4");
	
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE8");
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE6");
};

var int once_killJosh;
if (Npc_HasItems (hero, itmi_joshpocket) >=1) && (!Npc_KnowsInfo (hero, DIA_Hysen_Fight)) && (once_killJosh == false)
{
B_KillNpc (BAN_1606_Josh);
once_killJosh = true;
};
//BOSSOWIE!
/*
var int wpis_ur_gran;
if (Npc_IsDead(Ur_Gran)) && (wpis_ur_gran == false) && (Npc_GetDistToWP (hero, "ORC_LORD") < 8000)
{
wpis_ur_gran = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Pokona³em wielkiego orkowego pu³kownika Ur-Grana. Walka z nim nie by³a ³atwa. Nie doœæ, ¿e sam by³ potê¿ny, to otoczy³ siê swoimi najlepszymi wojownikami. Zapamiêtam tê walkê na d³ugo.");
};

var int wpis_kurvok;
if (Npc_IsDead(Ur_Na_Kurvok)) && (wpis_kurvok == false) && (Npc_GetDistToWP (hero, "ORC_ARENA_BOSS") < 8000)
{
wpis_kurvok = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi³em potê¿nego orkowego gladiatora Ur-Na-Kurvoka - jednego z najniebezpieczniejszych orków w Górniczej Dolinie.");
};

var int wpis_varrag;
if (Npc_IsDead(Varrag_Harosh)) && (wpis_varrag == false) && (Npc_GetDistToWP (hero, "GRYD_055") < 8000)
{
wpis_varrag = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W g³ównej sali Cmentarzyska Orków spotka³em orkowego szamana Varraga-Harosha Potê¿nego. Walka z nim nie by³a ³atwa, zw³aszcza, ¿e w górnej czêœci sali znajdowali siê orkowi zwiadowcy.");
};

var int wpis_nyras;
if (Npc_IsDead(NOV_1303_Nyras)) && (wpis_nyras == false) && (Npc_GetDistToWP (hero, "WP_CIRCLE_01") < 8000)
{
wpis_nyras = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Nyras zupe³nie oszala³. Widocznie si³a Œni¹cego prze¿ar³a mu mózg. Postanowi³ mnie zaatakowaæ. S¹dzi³em, ¿e walka nie bêdzie trudna, jednak w jego uderzeniu by³o coœ czego siê nie spodziewa³em. By³o znacznie silniejsze, a sam Nyras bardziej wytrzymalszy. Œni¹cy musia³ podzieliæ siê z nim swoj¹ moc¹, albo to wp³yw jakiegoœ artefaktu.");
};

var int wpis_crawelqueen;
if (Npc_IsDead(MinecrawlerQueen)) && (wpis_crawelqueen == false) && (Npc_GetDistToWP (hero, "OM_084_QUEEN_05") < 8000)
{
wpis_crawelqueen = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Zabi³em królow¹ pe³zaczy w Starej Kopalni. Olbrzymia samica by³a jednym z najniebezpieczniejszych potworów z jakimi mia³em do czynienia. Wygl¹d tej bestii utkwi³ w mojej pamiêci. Ca³e szczêœcie, ¿e wyszed³em z tego w jednym kawa³ku.");
};

var int wpis_golumik;
if (Npc_IsDead(Gol_Umik)) && (wpis_golumik == false) && (Npc_GetDistToWP (hero, "OM_084_QUEEN_05") < 8000)
{
wpis_golumik = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "W jaskini pe³nej goblinów wyró¿ni³ siê ich herszt. Legendarny goblin Gol-Umik. By³ wyraŸnie wiêkszy od pozosta³ych. Ponadto nosi³ zbrojê. Walka z nim by³a trudna, zw³aszcza, ¿e mia³ tylu pomocników.");
};

var int wpis_madsnapper;
if (Npc_IsDead(BigSnapper)) && (wpis_madsnapper == false) && (Npc_GetDistToWP (hero, "OM_084_QUEEN_05") < 8000)
{
wpis_madsnapper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Gdy wracaliœmy z Gornem z klasztoru Zmiennokszta³tnych napad³ na nas olbrzymi zêbacz. Cholernie niebezpieczna bestia. ");
};

var int wpis_madharpie;
if (Npc_IsDead(MadHarpie)) && (wpis_madharpie == false) && (Npc_GetDistToWP (hero, "OM_084_QUEEN_05") < 8000)
{
wpis_madharpie = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Podczas eksploracji starej cytadeli z Lesterem mia³em nieprzyjemnoœæ stoczyæ walkê z rozwœcieczon¹ harpi¹. Nie doœæ, ¿e wojownicza to silna i wyj¹tkowo odporna na ataki.");
};

var int wpis_bigtroll;
if (Npc_IsDead(MadTroll)) && (wpis_bigtroll == false) && (Npc_GetDistToWP (hero, "OM_084_QUEEN_05") < 8000)
{
wpis_bigtroll = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Id¹c z Diego do kanionu w górach spodziewa³em siê, ¿e spotkam trolla. Kto by pomyœla³, ¿e bêdzie to stary, bardzo niebezpieczny samiec. Dobrze, ¿e chocia¿ by³ powolny. ");
};

var int wpis_zombiethekeeper;
if (Npc_IsDead(ZombieTheKeeper)) && (wpis_zombiethekeeper == false) && (Npc_GetDistToWP (hero, "LOCATION_05_02_STONEHENGE4") < 8000)
{
wpis_zombiethekeeper = true;
Log_CreateTopic(Bossowie, LOG_NOTE);
B_LogEntry (Bossowie, "Przeszukuj¹c z Miltenem star¹ kryptê napotka³em na Nadzorcê. Z tego co mówi³ Milten ta umêczona dusza nale¿a³a ongiœ do Magnata ze Starego Obozu. Có¿, pomimo up³ywu lat si³y mu nie brakowa³o. ");
};
*/
//************ZADANIE OD AIDANA
if (Npc_GetDistToWP (hero, "ER_CAVE_AIDANQUEST") < 1000) && (hero_explore_aidanquestcave == false) && (MIS_Aidan_Quest == LOG_RUNNING)
{
hero_explore_aidanquestcave = true;
B_LogEntry                     (CH3_Aidan_Quest,"W miejscu o którym mówi³ Aidan znalaz³em skrzyniê. Wygl¹da na solidnie zamkniêt¹. Muszê wróciæ do Aidana i zapytaæ, czy wie jak j¹ otworzyæ.");
};
//************JASKINIA HUGO
if (Npc_GetDistToWP (hero, "BOFUR") < 700) && (Bylem_wodospad == false) && (MIS_HunterHugo == LOG_RUNNING)
{
Bylem_wodospad = true; 
B_LogEntry        (CH1_HunterHugo,"Znalaz³em jaskiniê, jednak wydajê siê byæ ona zupe³nie pusta.");
};
//************RUDA EMANUELA
var int hero_saw_die_shine;
if (Npc_GetDistToWP (hero, "ER_WD_QUEST_TRUP_01") < 1000) && (hero_saw_die_shine == false) && (MIS_EmanuelsDeals == LOG_RUNNING)
{
hero_saw_die_shine = true;
B_LogEntry                     (CH1_EmanuelsDeals,"W jaskini znalaz³em cia³o Shine i jakiegoœ Nowicjusza. NajwyraŸniej walczyli. Nie widzê, aby któryœ z nich mia³ rudê. Na pewno w napadzie brali udzia³ tak¿e inni Nowicjusze. Cia³a s¹ œwie¿e, wiêc myœlê, ¿e nie uciekli daleko. Muszê ich poszukaæ i odebraæ rudê.");
};
//************PO£ÓW INFO
 if (Npc_GetDistToWP (hero, "POMOST") < 300) || (Npc_GetDistToWP (hero, "POMOST2") < 300) || (Npc_GetDistToWP (hero, "POMOST3") < 300) || (Npc_GetDistToWP (hero, "POMOST4") < 300) || (Npc_GetDistToWP (hero, "POMOST5") < 300)
|| (Npc_GetDistToWP (hero, "POMOST6") < 300) || (Npc_GetDistToWP (hero, "POMOST7") < 300) || (Npc_GetDistToWP (hero, "POMOST8") < 300) || (Npc_GetDistToWP (hero, "POMOST9") < 300) || (Npc_GetDistToWP (hero, "POMOST10") < 300)
 {
PrintScreen ("Mo¿esz tu ³owiæ!", 1, 90, "Font_Old_10_White_Hi.TGA", 2);
//PrintAndPause("Znajdujesz siê w miejscu \nw którym mo¿na ³owiæ. \n Takie miejsca s¹ oznaczone poprzez \n sieci rybackie. Wybierz WÊDKÊ \n ze swojego ekwipunku,", KEY_RETURN,"Font_Old_10_White_Hi.TGA");
};
//************BUNT ZBIERACZY
if (MIS_BuntZbieraczy == LOG_RUNNING)
&& (Npc_IsDead(Bau_900_Ricelord))
&& (Npc_KnowsInfo (hero, DIA_Rufus_ActionGoWhat))
&& (po_buncie == true)
{
Npc_ExchangeRoutine (BAU_928_Bauer,"bunt");
Npc_ExchangeRoutine (BAU_916_Bauer,"bunt");
Npc_ExchangeRoutine (BAU_923_Bauer,"bunt");
Npc_ExchangeRoutine (BAU_907_Bauer,"bunt");
Npc_ExchangeRoutine (BAU_904_Bauer,"bunt");
Npc_ExchangeRoutine (BAU_903_Rufus,"bunt");
B_ChangeGuild    (Org_846_Schlaeger,GIL_DMB);
B_ChangeGuild    (Org_844_Lefty,GIL_DMB);
B_ChangeGuild    (Org_845_Schlaeger,GIL_DMB); //1.24
Npc_ExchangeRoutine (Org_831_Organisator,"bunt");
B_ChangeGuild    (Org_831_Organisator,GIL_DMB);
if (Homer_Rozpracowany == false)
{
Npc_ExchangeRoutine (BAU_902_Pock,"bunt");
B_ChangeGuild    (BAU_902_Pock,GIL_DMB);//1.24
Npc_ExchangeRoutine (BAU_914_Bauer,"bunt");
BAU_914_Bauer.name = "Pupilek Lewusa";
B_ChangeGuild    (BAU_914_Bauer,GIL_DMB);
Npc_ExchangeRoutine (BAU_915_Bauer,"bunt");
BAU_915_Bauer.name = "Pupilek Lewusa";
B_ChangeGuild    (BAU_915_Bauer,GIL_DMB);
Npc_ExchangeRoutine (Org_832_Organisator,"bunt");
B_ChangeGuild    (Org_832_Organisator,GIL_DMB);
};
};
//************UPICIE
if (bohater_upity)
{
bohater_upity = bohater_upity - 1;
PrintScreen	("Q",1,90,"FONT_OLD_10_WHITESTATS.TGA",3);
PrintScreen(ConcatStrings(ConcatStrings(IntToString(bohater_upity / 60)," : "),IntToString(bohater_upity % 60)),1,90,"font_old_10_white.tga",2);
if (bohater_upity == 0)
{
off_upojenie_alkoholowe ();
};
};
//************MIECZ TOKASA - NIE DZIA£A!
if  (run_tokas_sword == true)
{  
if (Npc_GetDistToNpc(self, hero) == 1000) &&  (Npc_IsDead(self))
{
Wld_SpawnNpcRange	(self,	SummonedByPC_Skeleton,1,	500);
};
};
//************ZNALEZENI NPC Z OB
/*
if (Npc_KnowsInfo (hero, DIA_Quentin_IFoundDraxPiczo))
&& (Npc_KnowsInfo (hero, DIA_Quentin_iFindDoyle))
{
//PrintScreen	("Odnalaz³eœ obydwoje Bandytów", 50,94,"FONT_OLD_20_WHITE.TGA",3);
MIS_FindFriends = LOG_SUCCESS;
};*/
//************REGENERACJA MANY
if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 0;
    };
	};
if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2) || (hero_regeneruje_mana == true)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;
    };
	};
if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;
    };
	};
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 2;
    };
	};
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 2;
    };
	};
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 6)
{
     if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
    {
         hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 3;
    };
	};
//************PALISADA W OB	
	if (Kapitel == 4)
	{
	Wld_SendTrigger("PALISADA1");
	};
//************OKRADZIONY PRZEZ SZAKALA	
		if (odliczanie_po_kradziezy)
		{
		odliczanie_po_kradziezy = odliczanie_po_kradziezy - 1;
		//print ("odejm");
		if (odliczanie_po_kradziezy == 0)
		{
		//PrintScreen	("Zorientowa³eœ siê, ¿e", -1,53,"font_old_10_white.tga",2);	
		//PrintScreen	("zosta³eœ okradziony przez Szakala!! ", -1,55,"font_old_10_white.tga",2);	
		PrintS_Ext("ZORIENTOWAOEŒ SIÊ, ¯E SZAKAL CIÊ OKRAD£", COL_RED);
		
		};
		
		};
//************ZABÓJSTWO BLIZNY		
	if (czas_ucieczki_scar)
    {
        czas_ucieczki_scar = czas_ucieczki_scar - 1;
		PrintScreen(ConcatStrings(ConcatStrings(IntToString(czas_ucieczki_scar / 60)," : "),IntToString(czas_ucieczki_scar % 60)),1,1,"font_old_10_white.tga",2);
        if (czas_ucieczki_scar == 0)
		{
            fuckcja_ucieczka_scar();
        };
    };

	
		if (czas_ucieczki_scar2)
		{
        czas_ucieczki_scar2 = czas_ucieczki_scar2 - 1;
		PrintScreen	("NIE WRACAJ DO OBOZU!", -1,-1,"font_new_10_red.tga",2);	
		PrintScreen(ConcatStrings(ConcatStrings(IntToString(czas_ucieczki_scar2 / 60)," : "),IntToString(czas_ucieczki_scar2 % 60)),50,25,"font_old_10_white.tga",2);
        if (czas_ucieczki_scar2 == 0)
		{
            fuckcja_ucieczka_scar2();
        };
    };

/*	if (uplyw_czasu)
    {
        uplyw_czasu = uplyw_czasu - 1;
		PrintScreen(ConcatStrings(ConcatStrings(IntToString(UPLYW_CZASU / 60)," : "),IntToString(UPLYW_CZASU % 60)),1,1,"font_old_10_white.tga",2);
        if (uplyw_czasu == 0)
		{
            fuckcja_zadanie();
        };
    };*/
	
//************LICZNIK EXPA	
	if (LicznikExp == true)
	{
	s4	=IntToString(hero.exp);//z liczby jak¹ jest doœwiadczenie bohatera robimy ci¹g znaków (czyli z liczby tekst)
	s5	=IntToString(hero.exp_next);//to samo co wy¿ej tyle ze co do punktów wymaganych do zdobycia
	s1	=ConcatStrings ("Doœwiadczenie ",s4); //tutaj ³¹czymy TEKST s4 czyli nasz exp w postaci tekstowej razem z wyrazem doœwiadczenia
	s2	=ConcatStrings (" / ", s5);//tutaj ³¹czymy nasz exp do zdobycia z wyrazem "na"

	s3	=ConcatStrings (s1,s2);//tutaj ³¹czymy 2 powy¿sze w ca³oœæ

	PrintScreen ( s3, 1, 93, "Font_Old_10_White_Hi.TGA", 2);//tutaj wyœwietlamy s3 czyli ca³oœæ naszej pracy
	};
	
	
//************POTIONY CZASOWE - DO USUNIÊCIA	
/*
	if (Pot_StrenghtTimeStart)
    {
        Pot_StrenghtTimeStart = Pot_StrenghtTimeStart - 1;
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_StrenghtTimeStart / 60)," : "),IntToString(Pot_StrenghtTimeStart % 60)), 1,5,"font_old_10_white.tga",2);
        if (Pot_StrenghtTimeStart == 0)
		{
           hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
        };
    };
		if (Pot_DexTimeStart)
    {
        Pot_DexTimeStart = Pot_DexTimeStart - 1;
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_DexTimeStart / 60)," : "),IntToString(Pot_DexTimeStart % 60)), 1,7,"font_old_10_white.tga",2);
        if (Pot_DexTimeStart == 0)
		{
           hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
        };
    };
			if (Pot_ManaTimeStart)
    {
        Pot_ManaTimeStart = Pot_ManaTimeStart - 1;
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_ManaTimeStart / 60)," : "),IntToString(Pot_ManaTimeStart % 60)), 1,9,"font_old_10_white.tga",2);
        if (Pot_ManaTimeStart == 0)
		{
           hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 20;
        };
    };
	if (Pot_MasterTimeStart)
    {
        Pot_MasterTimeStart = Pot_MasterTimeStart - 1;
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_MasterTimeStart / 60)," : "),IntToString(Pot_MasterTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
        if (Pot_MasterTimeStart == 0)
		{
           hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
		   hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
        };
    };
		if (Pot_HPTimeStart)
    {
        Pot_HPTimeStart = Pot_HPTimeStart - 1;
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_HPTimeStart / 60)," : "),IntToString(Pot_HPTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
        if (Pot_HPTimeStart == 0)
		{
           hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - 50;
        };
    };
	*/
	// Strength	
	if (Pot_StrenghtTimeStart)
    {
        Pot_StrenghtTimeStart = Pot_StrenghtTimeStart - 1;
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_StrenghtTimeStart / 60)," : "),IntToString(Pot_StrenghtTimeStart % 60)), 1,5,"font_old_10_white.tga",2);
		//print ("str czasowa");
		var int seconds_amount_str;
		var int seconds_count_strr;
		var int jedenraz_str;
		seconds_amount_str = seconds_amount_str + 1;
		if jedenraz_str == false
		{
		jedenraz_str = true;
		seconds_count_strr = 10;
		};
		if (seconds_amount_str == seconds_count_strr)
		{
		var string czas_str;
		czas_str = ConcatStrings (ConcatStrings (IntToString(Pot_StrenghtTimeStart / 60)," : "),IntToString(Pot_StrenghtTimeStart % 60));
		var string text_mixture_str;
		text_mixture_str = "Mikstura si³y, pozosta³o: ";
		PrintS_Ext(ConcatStrings (text_mixture_str, czas_str), COL_White);
		seconds_count_strr = seconds_count_strr + 10;
		};
		
		Pot_StrenghtTimeStart_Activated = true;	
    };
	if (Pot_StrenghtTimeStart == 0) && (Pot_StrenghtTimeStart_Activated)
	{
		Pot_StrenghtTimeStart_Activated = false;
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
		AI_RemoveWeapon (hero);
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
	};
// Dexterity
	if (Pot_DexTimeStart)
	{
		Pot_DexTimeStart = Pot_DexTimeStart - 1;
		
		var int seconds_amount_dex;
		var int seconds_count_dex;
		var int jedenraz_dex;
		seconds_amount_dex = seconds_amount_dex + 1;
		if jedenraz_dex == false
		{
		jedenraz_dex = true;
		seconds_count_dex = 10;
		};
		if (seconds_amount_dex == seconds_count_dex)
		{
		var string czas_dex;
		czas_dex = ConcatStrings (ConcatStrings (IntToString(Pot_DexTimeStart / 60)," : "),IntToString(Pot_DexTimeStart % 60));
										
		var string text_mixture_dex;
		text_mixture_dex = "Mikstura zrêcznoœci, pozosta³o: ";
		PrintS_Ext (ConcatStrings (text_mixture_dex, czas_dex),COL_White);
		seconds_count_dex = seconds_count_dex + 10;
		};
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_DexTimeStart / 60)," : "),IntToString(Pot_DexTimeStart % 60)), 1,7,"font_old_10_white.tga",2);
		Pot_DexTimeStart_Activated = true;
    };
	if (Pot_DexTimeStart == 0) && (Pot_DexTimeStart_Activated)
	{
		Pot_DexTimeStart_Activated = false;
		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
	};
// Mana
	if (Pot_ManaTimeStart)
	{
		Pot_ManaTimeStart = Pot_ManaTimeStart - 1;
		
		var int seconds_amount_mana;
		var int seconds_count_mana;
		var int jedenraz_mana;
		seconds_amount_mana = seconds_amount_mana + 1;
		if jedenraz_mana == false
		{
		jedenraz_mana = true;
		seconds_count_mana = 10;
		};
		if (seconds_amount_mana == seconds_count_mana)
		{
		var string czas_mana;
		czas_mana = ConcatStrings (ConcatStrings (IntToString(Pot_ManaTimeStart / 60)," : "),IntToString(Pot_ManaTimeStart % 60));
										
		var string text_mixture_mana;
		text_mixture_mana = "Mikstura many, pozosta³o: ";
		PrintS_Ext (ConcatStrings (text_mixture_mana, czas_mana), COL_White);
		seconds_count_mana = seconds_count_mana + 10;
		};
		
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_ManaTimeStart / 60)," : "),IntToString(Pot_ManaTimeStart % 60)), 1,9,"font_old_10_white.tga",2);
		Pot_ManaTimeStart_Activated = true;
    };
	if (Pot_ManaTimeStart == 0) && (Pot_ManaTimeStart_Activated)
	{
		Pot_ManaTimeStart_Activated = false;
		hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - 20;
	};
// Master
	if (Pot_MasterTimeStart)
    {
        Pot_MasterTimeStart = Pot_MasterTimeStart - 1;
		
		var int seconds_amount_master;
		var int seconds_count_master;
		var int jedenraz_master;
		seconds_amount_master = seconds_amount_master + 1;
		if jedenraz_master == false
		{
		jedenraz_master = true;
		seconds_count_master = 10;
		};
		if (seconds_amount_master == seconds_count_master)
		{
		var string czas_master;
		czas_master = ConcatStrings (ConcatStrings (IntToString(Pot_masterTimeStart / 60)," : "),IntToString(Pot_masterTimeStart % 60));
										
		var string text_mixture_master;
		text_mixture_master = "Mikstura potêgi, pozosta³o: ";
		PrintS_Ext (ConcatStrings (text_mixture_master, czas_master),COL_White);
		seconds_count_master = seconds_count_master + 10;
		};
		
		
       // PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_MasterTimeStart / 60)," : "),IntToString(Pot_MasterTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
		Pot_MasterTimeStart_Activated = true;
	};
	if (Pot_MasterTimeStart == 0) && (Pot_MasterTimeStart_Activated)
	{
		Pot_MasterTimeStart_Activated = false;
		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
    };
// HP
	if (Pot_HPTimeStart)
    {
        Pot_HPTimeStart = Pot_HPTimeStart - 1;
		
		var int seconds_amount_hp;
		var int seconds_count_hp;
		var int jedenraz_hp;
		seconds_amount_hp = seconds_amount_hp + 1;
		if jedenraz_hp == false
		{
		jedenraz_hp = true;
		seconds_count_hp = 10;
		};
		if (seconds_amount_hp == seconds_count_hp)
		{
		var string czas_hp;
		czas_hp = ConcatStrings(ConcatStrings (IntToString(Pot_HPTimeStart / 60)," : "),IntToString(Pot_HPTimeStart % 60));
										
		var string text_mixture_hp;
		text_mixture_hp = "Mikstura ¿ycia, pozosta³o: ";
		PrintS_Ext (ConcatStrings (text_mixture_hp, czas_hp),COL_White);
		seconds_count_hp = seconds_count_hp + 10;
		};
		
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_HPTimeStart / 60)," : "),IntToString(Pot_HPTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
        Pot_HPTimeStart_Activated = true;
    };
	if (Pot_HPTimeStart == 0) && (Pot_HPTimeStart_Activated)
	{
		Pot_HPTimeStart_Activated = false;
        hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - 50;
    };
/*	if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO3))
	{
	B_KillNPC (TPL_5083_OldAlchemyMan);
	};*/
//************AUTO HEAL - DO USUNIÊCIA	
	var int warunkowaHP;
	warunkowaHP =  hero.attribute[ATR_HITPOINTS_MAX] - 70*hero.attribute[ATR_HITPOINTS_MAX]/100; //  30; // MAX_HP - 70*MAX_HP/100     hero.attribute[ATR_HITPOINTS_MAX] - 70*hero.attribute[ATR_HITPOINTS_MAX]/100
	if AutoHealth && ((hero.attribute[ATR_HITPOINTS] <= warunkowaHP) &&  (hero.attribute[ATR_HITPOINTS] >= 1))
	{
	if  (Npc_HasItems (hero, ItFo_Potion_Health_01) >=1)
	{
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	HP_Essenz);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,1);
	Print ("U¿yto mikstury leczniczej!");
	} 
	else if (Npc_HasItems (hero, ItFo_Potion_Health_02) >=1)
	{
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	HP_Extrakt);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02,1);
	Print ("U¿yto mikstury leczniczej!");
	} 
	else if (Npc_HasItems (hero, ItFo_Potion_Health_03) >=1)
	{
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	HP_Elixier);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_03,1);
	Print ("U¿yto mikstury leczniczej!");
	}
	else if (Npc_HasItems (hero, ItMi_Bandaz40) >=1)
	{
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	40);
	Npc_RemoveInvItems(hero,ItMi_Bandaz40,1);
	Print ("U¿yto banda¿a!");
	};
	};
	var int skrytka1LOC;
	var int skrytka2LOC;
	var int skrytka3LOC;
//************WILL KRYJÓWKI	
if (Npc_GetDistToWP (hero, "KRYJOWKA1") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka1LOC == false)
{
B_GiveXP (400);
PrintS_Ext ("To miejsce pasuje na kryjówkê! Oznaczê je na mapie.",COL_WHITE);
CreateInvItems (hero, ItWrWorldmap_Edit1, 1);
skrytka1LOC = true;
};
if (Npc_GetDistToWP (hero, "KRYJOWKA2") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka2LOC == false)
{
PrintS_Ext ("To miejsce pasuje na kryjówkê! Oznaczê je na mapie.",COL_WHITE);
B_GiveXP (400);
 CreateInvItems (hero, ItWrWorldmap_Edit2, 1);
skrytka2LOC = true;
};
if (Npc_GetDistToWP (hero, "KRYJOWKA3") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka3LOC == false)
{
//Print ("Zlokalizowano kryjówkê!");
//PrintScreen	("Kryjówka oznaczona na mapie!", -1,70,"FONT_OLD_20_WHITE.TGA",3);
PrintS_Ext ("To miejsce pasuje na kryjówkê! Oznaczê je na mapie.",COL_WHITE);
B_GiveXP (400);
CreateInvItems (hero, ItWrWorldmap_Edit3, 1);
skrytka3LOC = true;
};
//************O£TARZ OCZYSZCZENIA
if (Npc_GetDistToWP (hero, "OLTARZ_OCZYSZCZENIA") < 1500) && (oltarzLOC == false) && (finf_olt == true)
{
PrintS_Ext ("To mi wygl¹da na o³tarz oczyszczenia.",COL_WHITE);
B_GiveXP (250);
oltarzLOC = true;
B_LogEntry    (CH1_NieSpelnionaZemsta,"Uda³o mi siê odnaleŸæ o³tarz oczyszczenia przy Orkowym Cmentarzysku. Mogê wróciæ z t¹ informacj¹ do Merdariona.");
};
//AI_Teleport                    (var instance n0, var string s1)  
	//***********************************************
	//***************  QUESTY
	//**********************************************
	//************** ER 1.4 29 sty 13
	
	if (timer_grd1)
    {
        timer_grd1 = timer_grd1 - 1;
		PrintScreen	("2 ", 1,10,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd1 / 60)," : "),IntToString(timer_grd1 % 60)), 3,10,"font_old_10_white.tga",2);
        if (timer_grd1 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItMiNugget, 200);
			PrintScreen	("Zadanie wykonane! Zysk: 200 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
        };
    };
	
		if (timer_grd2)
    {
        timer_grd2 = timer_grd2 - 1;
		PrintScreen	("2 ", 1,12,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd2 / 60)," : "),IntToString(timer_grd2 % 60)), 3,12,"font_old_10_white.tga",2);
        if (timer_grd2 == 0)
		{
           liczba_straznikow = liczba_straznikow + 15;
		    CreateInvItems (hero, ItMiNugget, 300);
			PrintScreen	("Zadanie wykonane! Zysk: 300 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
        };
    };
	
	if (timer_grd3)
    {
        timer_grd3 = timer_grd3 - 1;
		PrintScreen	("2 ", 1,14,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd3 / 60)," : "),IntToString(timer_grd3 % 60)), 3,14,"font_old_10_white.tga",2);
        if (timer_grd3 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItAt_Wolf_01, 10);
			PrintScreen	("Zadanie wykonane! Zysk: 10 wilczych skór!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };
	if (timer_grd4)
    {
        timer_grd4 = timer_grd4 - 1;
		PrintScreen	("2 ", 1,16,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd4 / 60)," : "),IntToString(timer_grd4 % 60)), 3,16,"font_old_10_white.tga",2);
        if (timer_grd4 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItFoMuttonRaw, 40);
			PrintScreen	("Zadanie wykonane! Zysk: 40 sztuk miêsa!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
		if (timer_grd5)
    {
        timer_grd5 = timer_grd5 - 1;
		PrintScreen	("2 ", 1,18,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd5 / 60)," : "),IntToString(timer_grd5 % 60)), 3,18,"font_old_10_white.tga",2);
        if (timer_grd5 == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
		    CreateInvItems (hero, ItMiNugget, 15);
			PrintScreen	("Zadanie wykonane! Zysk: 150 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
			if (timer_grd6)
    {
        timer_grd6 = timer_grd6 - 1;
		PrintScreen	("2 ", 1,20,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd6 / 60)," : "),IntToString(timer_grd6 % 60)), 3,20,"font_old_10_white.tga",2);
        if (timer_grd6 == 0)
		{
           liczba_straznikow = liczba_straznikow + 20;
		    CreateInvItems (hero, ItMiNugget, 550);
			PrintScreen	("Zadanie wykonane! Zysk: 550 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
			if (timer_grd7nc)
    {
        timer_grd7nc = timer_grd7nc - 1;
		PrintScreen	("2 ", 1,22,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd7nc / 60)," : "),IntToString(timer_grd7nc % 60)), 3,22,"font_old_10_white.tga",2);
        if (timer_grd7nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Z Nowego Obozu powróci³o 5 stra¿ników!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			quest1_grd_log = true;
       };
    };		
				if (timer_grd8nc)
    {
        timer_grd8nc = timer_grd8nc - 1;
		PrintScreen	("2 ", 1,24,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd8nc / 60)," : "),IntToString(timer_grd8nc % 60)), 3,24,"font_old_10_white.tga",2);
        if (timer_grd8nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Stra¿nicy wygrali bitwê ze szkodnikami!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			//quest1_grd_log = true;
       };
    };	
					if (timer_grd9nc)
    {
        timer_grd9nc = timer_grd9nc - 1;
		PrintScreen	("2 ", 1,26,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd9nc / 60)," : "),IntToString(timer_grd9nc % 60)), 3,26,"font_old_10_white.tga",2);
        if (timer_grd9nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Stra¿nicy wycofali siê z terenów Nowego Obozu!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

       };
    };	
	// ER 1.4 9 marzec 2013
	// Claw Quest Func 
	if (timer_ClawQuest)
    {
        timer_ClawQuest = timer_ClawQuest - 1;
		//PrintScreen	("2 ", 1,10,"Font_Old_10_WhiteStats.tga",2);	
       // PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_ClawQuest / 60)," : "),IntToString(timer_ClawQuest % 60)), 3,10,"font_old_10_white.tga",2);
		
		var int seconds_amount_claw;
		var int seconds_count_claw;
		var int jedenraz_claw;
		seconds_amount_claw = seconds_amount_claw + 1;
		if jedenraz_claw == false
		{
		jedenraz_claw = true;
		seconds_count_claw = 20;
		};
		if (seconds_amount_claw == seconds_count_claw)
		{
		var string czas_claw;
		czas_claw =	ConcatStrings(ConcatStrings (IntToString(timer_ClawQuest / 60)," : "),IntToString(timer_ClawQuest % 60));
										
		var string text_clawTime;
		text_clawTime = "Zadanie: Chory myœliwy, pozosta³o czasu: ";
		PrintS_Ext(ConcatStrings (text_clawTime, czas_claw), COL_Red);
		seconds_count_claw = seconds_count_claw + 20;
		};
		
        if (timer_ClawQuest == 0) && (MIS_SickHunter == LOG_RUNNING)
		{
			MIS_SickHunter = LOG_FAILED;
			Log_SetTopicStatus       (CH2_SickHunter, LOG_FAILED);
		    B_LogEntry                     (CH2_SickHunter,"SpóŸni³em siê! Wszystko na marne.");
			B_KillNPC (NON_5603_Claw);
			PrintS_Ext("SpóŸni³eœ siê! Calaw nie ¿yje!", COL_Red);
			}
			else if (timer_ClawQuest == 0) && (MIS_SickHunter == LOG_SUCCESS)
			{
			
        };
    };
	};
	
	
/*
PrintScreen (ConcatStrings ,"Przychody obozu:"),IntToString(przychody_obozu), 1,20,"font_old_10_white.tga",2);
        if (timer_grd9nc == 0)

*/

