// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel)
{
	Kapitel = neues_Kapitel;

	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if		(neues_Kapitel == 1)
	{
		B_GivePatrosFoodCH1 ();
		PrintDebugNpc	(PD_MISSION, "---=== DAS ERSTES KAPITEL ===---");
		//B_Give_SkipChapter2Weapons ();
		B_GiveMartinItemsCH1 ();
		B_GiveJimItemsCH1 ();
		B_Give_StanleyChapter1Ingredients ();
		//B_Give_HuanChapter1Ingredients ();
		//B_Give_MilChapter1Ingredients ();
		introducechapter ("Rozdzia� 1","Witamy w Kolonii!","chapter1.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 1","Welcome to the colony","chapter1.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS ZWEITE KAPITEL ===---");

		//////////////////////////////////////////////////////////
		// ANULOWANE ZADANIA
		//////////////////////////////////////////////////////////
		if (MIS_DraxTest == LOG_RUNNING)
		{
		B_LogEntry               (CH1_DraxTest,"Nie wykna�em testu Draxa na czas. Teraz jest ju� za p�no na takie sprawy.");
		Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
		MIS_DraxTest = LOG_FAILED;
		};
		
		if (Mod_Story_RunRebelInNC == FALSE) && (LeftyDead == FALSE)
		{
		B_Story_BauRebellion ();
		};
		
		if (MIS_GrimOc == LOG_RUNNING)
		{
		var C_NPC Grim;
		Grim = Hlp_GetNpc(Vlk_580_Grim);
		Npc_SetTalentSkill (Grim, NPC_TALENT_1H,2);
		Mdl_SetVisualBody (Grim,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  2, STT_ARMOR_M);
		Grim.attribute[ATR_STRENGTH] =		70;
		Grim.attribute[ATR_DEXTERITY] =		70;
		Grim.attribute[ATR_HITPOINTS_MAX] =	350;  
		Grim.attribute[ATR_HITPOINTS] =		350;  
		EquipItem (Grim, ItMw_1H_Sword_02);
		};
		//-------- H�ndler auff�llen --------
		B_Give_FiskChapter2Weapons ();
		B_Give_DarrionChapter2Weapons ();
		B_Give_SharkyChapter2Weapons ();
		B_Give_BaalCadarChapter2Runes ();
		B_Give_TorrezChapter2Runes ();
		B_Give_CronosChapter2Runes ();
		B_GiveRiordianChapter2Potions ();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons ();
		B_GivePatrosFoodCH2 ();
		B_GiveMartinItemsCH2 ();
		B_GiveJimItemsCH2 ();
		B_Give_HuanChapter2Ingredients ();
		B_Give_MilChapter2Ingredients ();
		B_Give_StanleyChapter2Ingredients ();
		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		B_Story_RespawnOW();
		
		//script was destroyed
		/*if (Npc_KnowsInfo (hero, DIA_Hakan_WPORZOJEST))
		{
		var C_NPC Hakan;
		Hakan = Hlp_GetNpc(NOV_1375_Hakan);
		Mdl_SetVisualBody (Hakan,"hum_body_naked0",1, 1,"Hum_Head_Psionic",15, 0,NOV_ARMOR_L);
		};*/
		
		//-------- InExtremo vorbereiten --------
		B_InsertInExtremo();
		
		introducechapter ("Rozdzia� 2","Gniazdo pe�zaczy","chapter2.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 2","The Minecrawler's nest","chapter2.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS DRITTE KAPITEL ===---");
		
		//script was destroyed
		/*if (Npc_KnowsInfo (hero, DIA_Hakan_WPORZOJEST))
		{
		//var C_NPC Hakan;
		Hakan = Hlp_GetNpc(NOV_1375_Hakan);
		Mdl_SetVisualBody (Hakan,"hum_body_naked0",1, 1,"Hum_Head_Psionic",15, 0,NOV_ARMOR_L);
		};*/
		//my�liwi
		Npc_ExchangeRoutine (NON_5600_Alex,	"lochy");
		
		//magnaci nie�miertelno��
		var C_NPC blizna; blizna 	= Hlp_GetNpc (EBR_101_Scar);
		blizna.flags = 0;
		
		B_ExchangeRoutine	(Sld_728_Jarvis,"start"); 
		
		//znikanie ze �wiata NPC Er.14.
		B_ExchangeRoutine	(TPL_1406_Templer,"flee"); //ochroniarz kaloma
		//B_ExchangeRoutine	(TPL_1455_GorBoba,"flee"); //gor boba
		B_ExchangeRoutine	(TPL_3927_GorBoba,"flee"); 
		//-------- InExtremo wegr�umen --------
		B_InExtremoStopMusic();	
		B_KillInExtremo();

		//-------- Kapitel 2 Missionen nochmal auf Success setzen --------	
		YBerion_BringFocus 		= LOG_SUCCESS;
		CorKalom_BringMCQBalls 	= LOG_SUCCESS;
		CorKalom_BringBook 		= LOG_SUCCESS;

		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		B_Story_RespawnOW_Ch3();
		
		//-------- Waffenh�ndler auffrischen --------
		B_Give_FiskChapter3Weapons ();
		B_Give_DarrionChapter3Weapons ();
		B_Give_SharkyChapter3Weapons ();
		B_Give_BaalCadarChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_CronosChapter3Runes ();
		B_GiveRiordianChapter3Potions ();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons ();
		B_Give_SkipChapter3Weapons ();
		B_GivePatrosFoodCH3 ();
		B_GiveMartinItemsCH3 ();
		B_GiveJimItemsCH3 ();
		B_Give_HuanChapter3Ingredients ();
		B_Give_MilChapter3Ingredients ();
		B_Give_StanleyChapter3Ingredients ();
		//-------- Video abspielen --------
		PlayVideo		("GREATPRAYER.BIK");

		//-------- Y'Berion ins Koma fallen lassen --------
		var C_NPC YBerion;
		YBerion = Hlp_GetNpc(Gur_1200_YBerion);
		YBerion.flags = 0;					// IMMORTAL-Flag l�schen
		Npc_ChangeAttribute	(YBerion, ATR_HITPOINTS, -YBerion.attribute[ATR_HITPOINTS_MAX]+1);
		YBerion.flags = NPC_FLAG_IMMORTAL;	// IMMORTAL-Flag wieder setzen
		Npc_ExchangeRoutine (YBerion,	"DRAINED");
		AI_ContinueRoutine	(YBerion);
		// BAAL LUKOR WORLD
		Npc_ExchangeRoutine (GUR_1213_BaalLukor_world,"delte"); //przenosi si� do waypointu poza �wiatem
		// �WI�TYNIA NA W SUMIE TO NIE WIEM
		Wld_InsertNpc	(OrcShaman,"POSZ1");
		Wld_InsertNpc	(OrcShaman,"TPL_2");
		Wld_InsertNpc	(OrcShaman,"TPL3");
		Wld_InsertNpc	(OrcShaman,"TPL_4");
	
		Wld_InsertNpc	(TPL_7899_Templer,"TPL_4");
	
		//Wld_InsertNpc	(NON_7899_Poszukiwacz,"TPL_4");
		//Wld_InsertNpc	(NON_7900_Poszukiwacz,"TPL_4");
		//Wld_InsertNpc	(NON_7901_Poszukiwacz,"TPL_4");
		//Wld_InsertNpc	(NON_7902_Poszukiwacz,"TPL_4");
		
		Wld_InsertNpc	(OrcWarrior1,"OW_PATH_RUIN_9");
		Wld_InsertNpc	(OrcWarrior1,"POSZ2");
		Wld_InsertNpc	(OrcWarrior1,"OFIARA2");
		Wld_InsertNpc	(OrcWarrior1,"OFIARA1");
		
		//---GROSSE BESCHW�RUNG TRIGGER NPCS ----------------------- M.F.
		//---HIER WERDEN DIE IN DEN TRIGGERINFOS GESETZTEN WAHRNEHMUNGEN WIEDER DEFAULT GESETZT--- M.F.
		var C_NPC Templer;		Templer	 	 = Hlp_GetNpc	(TPL_1431_Templer);
		Templer.senses =		hero.senses; 
		
		var C_NPC Templer_1;	Templer_1	 	 = Hlp_GetNpc	(TPL_1430_Templer);
		Templer_1.senses =		hero.senses;
		
		var C_NPC Novize;		Novize	     = Hlp_GetNpc	(NOV_1319_Novize);
		Novize.senses =			hero.senses;
		
		var C_NPC Novize_1;		Novize_1	 	 = Hlp_GetNpc	(NOV_1319_Novize);
		Novize_1.senses =		hero.senses;
		//CreateInvItems (ORG_952_Riv, ItFo_Fish, 30);
		//CreateInvItems (ORG_952_Riv, JajoSca2, 30);
		//CreateInvItems (ORG_952_Riv, ItFo_MoleratW, 30);
		if (Chapters_Spawn == true)
		{ 
		B_Story_RespawnOW();
		};
		introducechapter ("Rozdzia� 3","Staro�ytna magia","chapter3.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 3","Artifacts of ancient power","chapter3.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS VIERTE KAPITEL ===---");
		
		//////////////////////////////////////////////////////////
		// ANULOWANE ZADANIA
		//////////////////////////////////////////////////////////
		if (MIS_EmanuelDelivery == LOG_RUNNING)
		{
		B_LogEntry               (CH1_EmanuelDelivery,"Na t� spraw� jest ju� po prostu za p�no.");
		Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_FAILED);
		MIS_EmanuelDelivery = LOG_FAILED;
		};
		
		if (MIS_Food_Patter == LOG_RUNNING)
		{
		B_LogEntry               (CH1_Food_Patter,"Stra�nicy zaatakuj� mnie, je�li zbli�� si� do nich cho�by na krok. To zadanie nie ma ju� szans na powodzenie.");
		Log_SetTopicStatus       (CH1_Food_Patter, LOG_FAILED);
		MIS_Food_Patter = LOG_FAILED;
		};
		
		if (MIS_ActionOM == LOG_RUNNING)
		{
		B_LogEntry               (CH1_ActionOM,"Czas na wykonanie tego zadania dobieg� ko�ca. Spapra�em robot�.");
		Log_SetTopicStatus       (CH1_ActionOM, LOG_FAILED);
		MIS_ActionOM = LOG_FAILED;
		};
		//////////////////////////////////////////////////////////
		// ZAB�JCA-SNAKE RUTYNA
		//////////////////////////////////////////////////////////
		Npc_ExchangeRoutine (NON_7852_Snake,"hunter");
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// PRZYPRAWY SNAFA U BAAL TARANA
		//////////////////////////////////////////////////////////
		var C_NPC taran; taran = Hlp_GetNpc(NOV_1331_BaalTaran);
		CreateInvItem(taran, ItMi_SnafBag);
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// BANDYTA PRZY LESIE
		//////////////////////////////////////////////////////////
		var C_NPC wd_7044; wd_7044 = Hlp_GetNpc(WD_7044_Bandit);
		B_ChangeGuild   		 (wd_7044,GIL_GRD);  
		B_SetPermAttitude	(wd_7044,	ATT_HOSTILE);
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// BANDYCI MAJ�CY STAL
		//////////////////////////////////////////////////////////
		var C_NPC banditS1; banditS1 = Hlp_GetNpc(NON_5051_Raeuber);
		var C_NPC banditS2; banditS2 = Hlp_GetNpc(NON_5052_Raeuber);
		B_ChangeGuild   		 (banditS1,GIL_GRD);  
		B_SetPermAttitude	(banditS1,	ATT_HOSTILE);
		
		B_ChangeGuild   		 (banditS2,GIL_GRD);  
		B_SetPermAttitude	(banditS2,	ATT_HOSTILE);
		//////////////////////////////////////////////////////////
		
		if (MIS_MissedSpy == LOG_SUCCESS)
		{
		B_ExchangeRoutine (TPL_3928_GorNaLin,"gardist");
		//idzie pilnowa� bramy do Obozu
		};
		if (MIS_ScarMurder == LOG_RUNNING)
		{
		B_LogEntry                     (CH3_ScarMurder,"Nie mam dost�pu do Starego Obozu. Nie uda mi si� wykona� tego zadania. Poza tym, nie ma teraz na to czasu.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_FAILED);
		MIS_ScarMurder = LOG_FAILED;
		};
		
		var C_NPC scorpio; scorpio 	= Hlp_GetNpc (GRD_205_Scorpio);
		
		B_ExchangeRoutine (scorpio,"BANNISHED");
		B_ChangeGuild    (scorpio,GIL_NONE);  
		B_SetPermAttitude	(scorpio,	ATT_NEUTRAL);
		scorpio.flags = NPC_FLAG_IMMORTAL;
		
		
		B_ChangeGuild    (STT_336_Cavalorn,GIL_NONE);
		B_ChangeGuild    (KDF_404_Xardas,GIL_DMB);
		//stra�nicy bram
		var C_NPC wache1_elite	; wache1_elite 	= Hlp_GetNpc (GRD_218_Gardist);
		wache1_elite.Npctype = NPCTYPE_AMBIENT;
		var C_NPC wache2_elite	; wache2_elite 	= Hlp_GetNpc (GRD_245_Gardist);
		wache1_elite.Npctype = NPCTYPE_AMBIENT;
		
		//magnaci nie�miertelno��
		var C_NPC arto; arto 	= Hlp_GetNpc (EBR_102_Arto);
		arto.flags = 0;
		
		//morok i patter
		var C_NPC morok	; morok 	= Hlp_GetNpc (GRD_7894_Morok	);
		morok.Npctype = NPCTYPE_main;
		morok.flags = 0;
		var C_NPC patter; patter 	= Hlp_GetNpc (GRD_7895_Patter	);
		patter.Npctype = NPCTYPE_main;
		patter.flags = 0;
		
		//to powinno dzia�a� w opuszczonej kopalni
		B_ExchangeRoutine 			(NON_2094_Glest,"START");//fix 1.4 b
		Wld_InsertNpc		(NON_2094_Glest,"GLEST_VM");
		
		//er 1.4 fix kurwa 
		Wld_InsertNpc		(VLK_586_Grimes,"LOCATION_01_07");
		B_ExchangeRoutine 			(VLK_586_Grimes,"cave");
		B_ChangeGuild    (VLK_586_Grimes,GIL_NONE);  
		B_SetPermAttitude	(VLK_586_Grimes,	ATT_NEUTRAL);
		
		Wld_InsertNpc		(STT_302_Viper,"LOCATION_01_07");
		B_ExchangeRoutine 			(STT_302_Viper,"cave");
		B_ChangeGuild    (STT_302_Viper,GIL_NONE);  
		B_SetPermAttitude	(STT_302_Viper,	ATT_NEUTRAL);
		
		Wld_InsertNpc		(VLK_585_Aleph,"LOCATION_01_07");
		B_ExchangeRoutine 			(VLK_585_Aleph,"cave");
		B_ChangeGuild    (VLK_585_Aleph,GIL_NONE);  
		B_SetPermAttitude	(VLK_585_Aleph,	ATT_NEUTRAL);
		
		Wld_InsertNpc		(VLK_584_Snipes,"LOCATION_01_07");
		B_ExchangeRoutine 			(VLK_584_Snipes,"cave");
		B_ChangeGuild    (VLK_584_Snipes,GIL_NONE);  
		B_SetPermAttitude	(VLK_584_Snipes,	ATT_NEUTRAL);
		//NON_2094_Glest.flags = 0;	
		//Wld_InsertNpc				(NON_2094_Glest,"GLEST_VM");	
		//NOC KRUKA W KOLONII
		// GOTHIC 2 ADDON
		B_ExchangeRoutine (NOV_1357_Fortuno,"nockruka");
		B_ChangeGuild    (NOV_1357_Fortuno,GIL_NONE);  
		B_SetPermAttitude	(NOV_1357_Fortuno,	ATT_NEUTRAL);
		
		//B_ExchangeRoutine (EBR_105_Raven,"nockruka");
		//B_ChangeGuild    (EBR_105_Raven,GIL_NONE);  
		//B_SetPermAttitude	(EBR_105_Raven,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (GRD_210_Scatty,"nockruka");
		B_ChangeGuild    (GRD_210_Scatty,GIL_NONE);  
		B_SetPermAttitude	(GRD_210_Scatty,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (GRD_233_Bloodwyn,"nockruka");
		B_ChangeGuild    (GRD_233_Bloodwyn,GIL_NONE);  
		B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (Grd_200_Thorus,"nockruka");
		B_ChangeGuild    (Grd_200_Thorus,GIL_NONE);  
		B_SetPermAttitude	(Grd_200_Thorus,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (STT_311_Fisk,"nockruka");
		B_ChangeGuild    (STT_311_Fisk,GIL_NONE);  
		B_SetPermAttitude	(STT_311_Fisk,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (BAN_1600_Miguel,"nockruka");
		B_ChangeGuild    (BAN_1600_Miguel,GIL_NONE);  
		B_SetPermAttitude	(BAN_1600_Miguel,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (VLK_581_Snaf,"nockruka");
		B_ChangeGuild    (VLK_581_Snaf,GIL_NONE);  
		B_SetPermAttitude	(VLK_581_Snaf,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (VLK_538_Huno,"nockruka");
		B_ChangeGuild    (VLK_538_Huno,GIL_NONE);  
		B_SetPermAttitude	(VLK_538_Huno,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (NON_5677_Stary,"nockruka");
		B_ChangeGuild    (NON_5677_Stary,GIL_NONE);  
		B_SetPermAttitude	(NON_5677_Stary,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (SFB_1000_Senyan,"nockruka");
		B_ChangeGuild    (SFB_1000_Senyan,GIL_NONE);  
		B_SetPermAttitude	(SFB_1000_Senyan,ATT_NEUTRAL);
		
		B_ExchangeRoutine (GRD_255_Fletcher,"nockruka");
		B_ChangeGuild    (GRD_255_Fletcher,GIL_NONE);  
		B_SetPermAttitude	(GRD_255_Fletcher,ATT_NEUTRAL);
		
		B_ExchangeRoutine (STT_329_Dexter,"nockruka");
		B_ChangeGuild    (STT_329_Dexter,GIL_NONE);  
		B_SetPermAttitude	(STT_329_Dexter,ATT_NEUTRAL);
		//-------- Waffenh�ndler auffrischen --------
		B_Give_ScorpioChapter4Weapons ();
		B_Give_DarrionChapter4Weapons ();
		B_Give_SharkyChapter4Weapons ();
		B_Give_BaalCadarChapter4Runes ();
		B_Give_XardasChapter4Runes ();
		B_Give_CronosChapter4Runes ();
		B_GiveRiordianChapter4Potions ();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();	
		B_GivePatrosFoodCH4 ();
		B_GiveMartinItemsCH4 ();
		B_GiveJimItemsCH4 ();
		B_Give_HuanChapter4Ingredients ();
		B_Give_MilChapter4Ingredients ();
		B_Give_StanleyChapter4Ingredients ();
		//-------- globale Variablen --------
		Saturas_BringFoci = 5;

		//-------- Missionsgegenst�nde --------
		CreateInvItem		(hero,	ItArRuneTeleport2);

		//-------- Tagebucheintr�ge --------
		Log_CreateTopic		(CH4_Firemages,	LOG_MISSION);
		Log_SetTopicStatus	(CH4_Firemages,	LOG_RUNNING);
		B_LogEntry			(CH4_Firemages,"Saturas, przyw�dca Mag�w Wody poprosi� mnie o ostatni� przys�ug�. Aby wysadzi� w powietrze kopiec rudy, magowie z Nowego Obozu potrzebuj� pomocy swych braci z Kr�gu Ognia. Nie wiem jeszcze, w jaki spos�b uda mi si� przekona� mag�w Gomeza do wsp�pracy, ale spr�buj� wymy�li� co� po drodze.");

		//-------- Szene am Damm --------
		B_ExchangeRoutine	(SLD_700_LEE,"DAMNPAST"); 
		B_ExchangeRoutine	(BAU_935_HOMER,"DAMNPAST"); 
		
		//-------- Spielergilde �ndern --------
		oldHeroGuild = Npc_GetTrueGuild(hero);
		if	C_NpcBelongsToOldCamp(hero) || (Npc_GetTrueGuild (hero) == GIL_EBR)  //fix 1.24
		{
			Npc_SetTrueGuild(hero,	GIL_NONE);		// "Ausgesto�ener" aus dem Alten Lager
			hero.guild = GIL_NONE;
			B_SetRoguesToNeutral ();
		};
		//-------- AL-Tore schlie�en --------
		B_ExchangeRoutine	(GRD_228_Gardist, "FMTaken");	//Hinteres Tor
		B_ExchangeRoutine	(GRD_230_Gardist, "FMTaken");	//Haupttor
		B_ExchangeRoutine	(GRD_280_Gardist, "FMTaken");	//Inneres Tor
			
		//-------- Windenwachen verwundbar machen --------
		B_ClearImmortal		(Grd_228_Gardist);				//Hinteres Tor     
		B_ClearImmortal		(Grd_230_Gardist);              //Haupttor    
		B_ClearImmortal		(Grd_280_Gardist);              //Inneres Tor 

		//-------- Feuermagier t�ten --------
		B_KillNpc			(Kdf_400_Rodriguez);	
		B_KillNpc			(Kdf_401_Damarok);	
		//B_KillNpc			(Kdf_402_Corristo);	
		B_ExchangeRoutine (Kdf_402_Corristo,"nope");
		B_KillNpc			(Kdf_403_Drago);	
		B_KillNpc			(Kdf_405_Torrez);
		//1.4.5.v7
		B_KillNpc			(STT_2078_KDF_NOV);
		B_KillNpc			(STT_2079_KDF_NOV);
		B_KillNpc			(STT_2080_KDF_NOV);	
		
		
		//-------- G�ste im Alten Lager t�ten --------
		B_KillNpc			(Nov_1330_BaalParvez);
		B_KillNpc			(Nov_1331_BaalTaran);
		//B_KillNpc			(Tpl_1422_GorHanis);
		B_ExchangeRoutine	(Tpl_1422_GorHanis, "life");
		B_KillNpc			(Sld_729_Kharim);

		//-------- TAs von Diego und Milten �ndern --------
		B_ExchangeRoutine	(PC_Thief,	"OCWait");
		B_ExchangeRoutine	(PC_Mage,	"OCWait");
		B_ChangeGuild		(PC_Thief,	GIL_KDF);		// "Ausgesto�ener" aus dem Alten Lager
		B_SetPermAttitude	(PC_Thief,	ATT_FRIENDLY);
		B_SetPermAttitude	(PC_Mage,	ATT_FRIENDLY);
		
		//-------- permanente Attit�den �ndern --------
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES_FMTAKEN");
		B_InitMonsterAttitudes		();

		//-------- Kampfgruppe vor Haupttor --------
		//B_ExchangeRoutine	(GRD_255_Fletcher,	"FMTaken");	// Verst�rkung vor das Haupttor (Anf�hrer)
		Wld_InsertNpc		(GRD_261_Brandick,	"OC1");
		B_ExchangeRoutine	(GRD_261_Brandick,	"FMTaken");
		B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor
		B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor
		B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
		B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken");	// regul�re Wache am Haupttor
		B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken");	// regul�re Wache am Haupttor

		//-------- Kampfgruppe vor Hinterem Tor --------
		//1.24 fixed
		//B_ExchangeRoutine	(GRD_233_Bloodwyn,	"FMTaken");	// Verst�rkung vor das Hinterem Tor (Anf�hrer)
		Wld_InsertNpc		(GRD_262_Aaron,"OC1");//fixed Aaron
		B_ExchangeRoutine 	(GRD_262_Aaron,"FMTaken");
		B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken");	// Verst�rkung vor das Hinterem Tor
		B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken");	// Verst�rkung vor das Hinterem Tor (Fernk�mpfer)
		B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken");	// regul�re Wache am Hinteren Tor
		B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken");	// regul�re Wache am Hinteren Tor
		
		//------------ Die Templer gehen nicht mehr zur Alten Mine ---------------------
		
		B_ExchangeRoutine	(TPL_1439_GorNaDrak,	"FMTaken");
		B_ExchangeRoutine	(TPL_1440_Templer,	"FMTaken");
		

		/*
		// Gothic Edycja rozszerzona
		// Skrypt 4 rozdzia�u
		// Ostatnia modyfikacja: 26 lipca 2012
		*/
		
		//--- Talas jako handlarz --------
		B_ExchangeRoutine	(NOV_1300_Talas,	"start2");
		CreateInvItems(NOV_1300_Talas, itmijoint_1, 30);
		CreateInvItems(NOV_1300_Talas, itmijoint_2, 20);
		CreateInvItems(NOV_1300_Talas, itmijoint_3, 10);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton, 10);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_1, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_2, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_3, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_4, 5);
		
		// mod 27 sierpie�! // 30 sierp
		// kusznicy 22 wrzesie�
		
		CreateInvItems  (GRD_3913_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3913_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3913_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3906_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3906_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3906_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3905_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3905_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3905_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3904_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3904_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3904_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3908_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3908_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3908_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3914_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3914_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3914_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3912_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3912_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3912_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3911_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3911_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3911_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3910_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3910_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3910_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3907_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3907_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3907_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3909_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3909_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3909_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		//-----------------ARTO ***fix*** 1.2
		Npc_ExchangeRoutine (EBR_102_Arto,"kox");
		B_KillNpc			(EBR_102_Arto);
		
		//------ MUD --------
		var C_NPC mud; mud 	= Hlp_GetNpc (Vlk_574_Mud);
		
		B_ExchangeRoutine (mud,"away");
		B_ChangeGuild    (mud,GIL_NONE);  
		B_SetPermAttitude	(mud,	ATT_NEUTRAL);
		
		var C_NPC jim; jim 	= Hlp_GetNpc (STT_2077_Jim);
		
		B_ExchangeRoutine (jim,"away");
		B_ChangeGuild    (jim,GIL_NONE);  
		B_SetPermAttitude	(jim,	ATT_NEUTRAL);
		
		//-------------------- Poszukiwacze ---------------------------
		// NIEAKTUALNE ---------------------------------------------
		/*
		Wld_InsertNpc				(Poszukiwacz,"OW_PATH_015");	
		Wld_InsertNpc				(Poszukiwacz,"OW_PATH_001");
		Wld_InsertNpc				(Poszukiwacz,"SPAWN_OW_WOLF_OC_PSI");
		Wld_InsertNpc				(Poszukiwacz,"LOCATION_29_02");
		Wld_InsertNpc				(Poszukiwacz,"PATH_TO_PLATEAU01");
		Wld_InsertNpc				(Poszukiwacz,"PATH_TO_PLATEAU04_BRIDGE");
		Wld_InsertNpc				(Poszukiwacz,"PATH_OC_PSI_18");
		Wld_InsertNpc				(Poszukiwacz,"PATH_OC_PSI_09");
		Wld_InsertNpc				(Poszukiwacz,"OW_PATH_297");
		Wld_InsertNpc				(Poszukiwacz,"OW_PATH_294");
		Wld_InsertNpc				(Poszukiwacz,"OW_PATH_171");
		Wld_InsertNpc				(Poszukiwacz,"FOGTOWER_OUT");
		Wld_InsertNpc				(UnDeadShadowbeast,"BEAST1");*/
		//----------------�owcy ork�w------------------------------------------------
		/*
		Npc_ExchangeRoutine (NON_2703_MYSLIWY,"cava");
		Npc_ExchangeRoutine (NON_2702_SZEFU,"cavalorn");
		Npc_ExchangeRoutine (NON_2705_Rakus,"cava"); 
		Npc_ExchangeRoutine (NON_2706_osko,"cava");  //***FIX****
		Npc_ExchangeRoutine (NON_2701_Straznik,"cavalorn"); //****FIX***
		if (Npc_KnowsInfo (hero, DIA_SZEFU_DAVOR))
		{
		Npc_ExchangeRoutine (NON_3929_Davor,"cavalorn");
		};
		if (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GESTAH))
		{
		Npc_ExchangeRoutine (SLD_3915_Gestath,"cavalorn");
		}; */
		//----------------Piraci-------------------
		Wld_InsertNpc				(NON_5026_Pirat3,"ER_PATH_01");	
		Wld_InsertNpc				(NON_5027_Pirat4,"ER_PATH_01");	
		Wld_InsertNpc				(NON_5024_Pirat1,"ER_PATH_01");	
		Wld_InsertNpc				(NON_5025_Pirat2,"ER_PATH_01");
		
		Wld_InsertNpc				(GRD_5028_Gardist,"ER_PATH_01");
		Wld_InsertNpc				(GRD_5029_Gardist,"ER_PATH_01");
		Wld_InsertNpc				(GRD_5030_Gardist,"ER_PATH_01");
		Wld_InsertNpc				(GRD_5031_Gardist,"ER_PATH_01");
		
		
		//----------------Ratford-----------------------
		B_KillNpc			(ORG_818_Ratford);
		Npc_ExchangeRoutine (ORG_864_Raeuber,"pupil");
		Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
		Npc_ExchangeRoutine (ORG_869_Raeuber,"pupil");
		
		//---------------Cavalorn-------------------------
		NPC_ExchangeRoutine (NON_3071_Vart,"ded");  
		B_KillNpc			(NON_3071_Vart);
		Wld_InsertNpc				(NON_4005_MadNovize,"POGAN1");	
		Wld_InsertNpc				(NON_4006_MadNovize,"POGAN2");	
		Wld_InsertNpc				(NON_4007_MadNovize,"POGAN3");	
		//Npc_ExchangeRoutine			(STT_336_Cavalorn, "pac");
		Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
		// Inne rutyny
		// -------------Ob�z przy kopalni--------------------
		B_ExchangeRoutine (GRD_7001_Artegor,"BOSS");
		Npc_ExchangeRoutine	(GRD_7008_Tukash,	"ucieczka");
		B_ChangeGuild    (Vlk_564_Jesse,GIL_NONE);
		B_ChangeGuild    (GRD_7008_Tukash,GIL_NONE);
		Npc_ExchangeRoutine	(Vlk_564_Jesse,	"ucieczka");
		B_ChangeGuild    (VLK_530_Guy,GIL_NONE);
		Npc_ExchangeRoutine (VLK_530_Guy, "bra");
		B_SetPermAttitude	(VLK_530_Guy,	ATT_NEUTRAL); //1.24
		Npc_ExchangeRoutine (NON_2056_Patrick ,"uciek");
		B_ChangeGuild    (NON_2056_Patrick,GIL_NONE);  
		B_SetPermAttitude	(NON_2056_Patrick,	ATT_NEUTRAL);
		
	/*	var C_NPC Vid;
		Vid = Hlp_GetNpc(TPL_1433_GorNaVid);
		Wld_InsertNpc				(Vid,"OC1");	
		Npc_ExchangeRoutine			(Vid, "help");
		Vid.flags = 2;
		var C_NPC Bar;
		Bar = Hlp_GetNpc(TPL_1400_GorNaBar);
		Wld_InsertNpc				(TPL_1400_GorNaBar,"PSI_START");
		Npc_ExchangeRoutine			(TPL_1400_GorNaBar, "help");
		Bar.flags = 2;
		var C_NPC Kosh;
		Kosh = Hlp_GetNpc(TPL_1401_GorNaKosh);
		Wld_InsertNpc				(TPL_1401_GorNaKosh,"PSI_START");	
		Npc_ExchangeRoutine			(TPL_1401_GorNaKosh, "help");
		Kosh.flags = 2;*/
		//-------------------Grim------------------------------ 
		if (MIS_GrimOc == LOG_RUNNING)
		{
		//var C_NPC Grim;
		Grim = Hlp_GetNpc(Vlk_580_Grim);
		Npc_ExchangeRoutine (Grim,"zbir");
		B_ChangeGuild    	(Grim,GIL_NONE);  
		B_SetPermAttitude	(Grim,	ATT_NEUTRAL);
		Mdl_SetVisualBody 	(Grim,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  2, GRD_ARMOR_H);
		EquipItem 			(Grim, Miecz1H17 );
		CreateInvItems 		(Grim, ItMiNugget,400);
		Grim.attribute[ATR_STRENGTH] =		120;
		Grim.attribute[ATR_DEXTERITY] =		120;
		Grim.attribute[ATR_MANA_MAX] =		80;
		Grim.attribute[ATR_MANA] =		80;
		Grim.attribute[ATR_HITPOINTS_MAX] =	500;  
		Grim.attribute[ATR_HITPOINTS] =		500;  
		//jego poplecznicy
		B_ChangeGuild    	(GRD_238_Gardist,GIL_NONE);  
		B_SetPermAttitude	(GRD_238_Gardist,	ATT_NEUTRAL);
		B_ChangeGuild    	(GRD_237_Gardist,GIL_NONE);  
		B_SetPermAttitude	(GRD_237_Gardist,	ATT_NEUTRAL);
		};
		
		
		//przeniesione do Story_FocusCorristo
		//Wld_SendTrigger("KOPALNIAEXIT"); //wej�cie do kopalni
		
		//-------------Nowicjusze - kamie� ogniskuj�cy---------
		B_SetPermAttitude	(NON_4001_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4002_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4003_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4004_MadNovize,	ATT_HOSTILE);
		
		//--------------- Kapitel 4 wird angezeigt -------------------------------
		if (Chapters_Spawn == true)
		{ 
		B_Story_RespawnOW_Ch4();
		};
		introducechapter ("Rozdzia� 4","Wielkie zmiany","chapter4.tga","levelup.wav", 6000); 
		//introducechapter ("Chapter 4","Xardas","chapter4.tga","levelup.wav", 6000); 
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS F�NFTE KAPITEL ===---");
		//B_KillNpc			(NON_3933_Uturiel);//1.4
		

	
		//zadanie tylko do 5 rozdzia�u
		if (MIS_NewLocationForPirates != LOG_SUCCESS)
		{
		B_KillNPC				(NON_5026_Pirat3);	
		B_KillNPC				(NON_5027_Pirat4);	
		B_KillNPC				(NON_5024_Pirat1);	
		B_KillNPC				(NON_5025_Pirat2);	
		};
		// �ad de fag? Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Psionic",12, 1,CRW_ARMOR_H);
		//-------- H�ndler auff�llen --------
		B_Give_ScorpioChapter5Weapons ();
		B_Give_DarrionChapter5Weapons ();
		B_Give_SharkyChapter5Weapons ();
		B_Give_XardasChapter5Runes ();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes ();
		B_GiveRiordianChapter5Potions ();
		
		B_Give_ScorpioChapter6Weapons ();
		B_Give_DarrionChapter6Weapons ();
		B_Give_SharkyChapter6Weapons ();
		B_Give_XardasChapter6Runes ();
		B_GiveRiordianChapter6Potions ();
		B_Give_CavalornChapter6Weapons ();
		B_Give_WolfChapter6Weapons();		
		B_GivePatrosFoodCH5 ();
		B_GiveMartinItemsCH5 ();
		B_GiveJimItemsCH5 ();
		B_Give_HuanChapter5Ingredients ();
		B_Give_MilChapter5Ingredients ();
		B_Give_StanleyChapter5Ingredients ();
		//-------- Tagebucheintr�ge --------
		B_LogEntry		(CH4_EnterTemple,	"Gorn nie by� przekonany co do skuteczno�ci mojego amuletu ochronnego. C�... Wkr�tce na w�asnej sk�rze przekonam si�, kto ma racj�!");
	//CreateInvItems (ORG_952_Riv, ItFo_Fish, 30);
	//CreateInvItems (ORG_952_Riv, JajoSca2, 30);
	//CreateInvItems (ORG_952_Riv, ItFo_MoleratW, 30);
		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		B_Story_RespawnOW_Ch5();
		
		introducechapter ("Rozdzia� 5","Stra�nicy portalu","chapter5.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 5","The custodians of the portal","chapter5.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS SECHSTE KAPITEL ===---");

		//Magnus - �wi�tynia �ni�cego (respi si� tam po rozmowie z Tokasem)
		var C_NPC magnus; magnus 	= Hlp_GetNpc (NON_5675_Magnus);
		NPC_ExchangeRoutine (magnus,"flee");
		
		//-------- H�ndler auff�llen --------
		B_Give_XardasChapter6Runes ();
		B_Give_HuanChapter6Ingredients ();
		//-------- URIZIEL aufladen --------
		PlayVideo		("OREHEAP.BIK");	// Schwert aufladen
		if URIZIEL1H_LOAD == false
		{
		CreateInvItem 	(hero, Mythrilklinge02);
		}
		else
		{
		CreateInvItem 	(hero, URIZIEL_Touch_Full);	
		};
		//B_ExchangeRoutine (EBR_105_Raven,"nockruka");
		introducechapter ("Rozdzia� 6","Le�e �ni�cego","chapter6.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 6","The sleeper's halls","chapter6.tga","levelup.wav", 6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if (Kapitel == chapter)
	{
		return TRUE;
	};
};
