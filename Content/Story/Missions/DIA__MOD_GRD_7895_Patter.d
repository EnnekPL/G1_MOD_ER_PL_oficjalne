//poprawione i sprawdzone - Nocturn

//sprawdzone g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patter_EXIT(C_INFO)
{
	npc             = GRD_7895_Patter;
	nr              = 999;
	condition	= DIA_Patter_EXIT_Condition;
	information	= DIA_Patter_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patter_HELLO1 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 1;
   condition    = DIA_Patter_HELLO1_Condition;
   information  = DIA_Patter_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Patter_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patter_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patter_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Patter_HELLO1_03_02"); //Nazywam siê Patter. Pilnujê naszych zasobów.
    AI_Output (other, self ,"DIA_Patter_HELLO1_15_03"); //Chyba nie masz zbyt trudnej roboty?
    AI_Output (self, other ,"DIA_Patter_HELLO1_03_04"); //Masz racjê. Jest nas ma³o, dziêki czemu to zajêcie nie jest zbyt uci¹¿liwe.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patter_HELLO2 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 2;
   condition    = DIA_Patter_HELLO2_Condition;
   information  = DIA_Patter_HELLO2_Info;
   permanent	= FALSE;
   description	= "Potrzebujecie czegoœ?";
};

FUNC INT DIA_Patter_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patter_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_01"); //Potrzebujecie czegoœ?
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_02"); //Tak. Jest nas dosyæ ma³o, a mimo wszystko brakuje nam jedzenia.
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_03"); //Móg³bym coœ zorganizowaæ.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_04"); //To mi³o, ¿e chcesz nam pomóc.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_05"); //Zdradzê ci wiêc ma³¹ tajemnicê.
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_06"); //S³ucham ciê.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_07"); //Wprawny kucharz potrafi oporz¹dziæ nawet pozornie niejadalnego zwierza.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_08"); //Mogê nauczyæ ciê pozyskiwaæ miêso topielców. Jest trochê ¿ylaste, ale za to bardzo od¿ywcze.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_09"); //Przyniesiesz nam... no powiedzmy 10 kawa³ków tego miêsa.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_10"); //Przydadz¹ siê te¿ w¹troby kretoszczurów. Piêæ powinno wystarczyæ.
    
	//teach log
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Patter potrafi oporz¹dziæ kretoszczura z w¹troby i sad³a. Mo¿e mnie te¿ nauczyæ zbieraæ truciznê jaszczurów, pazury trolla ziemnego, oraz wycinaæ miêso topielców.");
	//quest log
	MIS_Food_Patter = LOG_RUNNING;
    Log_CreateTopic          (CH1_Food_Patter, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Food_Patter, LOG_RUNNING);
    B_LogEntry               (CH1_Food_Patter,"Patter nauczy mnie jak pozyskaæ miêso topielca i w¹trobê kretoszczura. Gdy ju¿ siê tego nauczê, bêdê musia³ przynieœæ do obozu 10 kawa³ków miêsa topielca i 5 w¹trób kretoszczurów.");
	//monster spawn
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Lurker,"OW_LAKE_NC_LURKER_SPAWN01"); 
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC"); 
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Patter_TEACH (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 3;
   condition    = DIA_Patter_TEACH_Condition;
   information  = DIA_Patter_TEACH_Info;
   permanent	= true;
   description	= "Czego mo¿esz mnie nauczyæ?";
};

FUNC INT DIA_Patter_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patter_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Patter_TEACH_15_01"); //Czego mo¿esz mnie nauczyæ?
    if (Knows_GetLurkerMeat == false) || (Knows_GetMoleratW == false) || (Knows_GetMoleratT == false) || (Knows_GetTrollGroundClaws == false) || (Knows_GetTrutkaJaszczura == false)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_03_02"); //Wielu rzeczy. Co konkretnie chcesz wiedzieæ?
		 Info_ClearChoices		(DIA_Patter_TEACH);
	 Info_AddChoice		(DIA_Patter_TEACH, "Wróæ", DIA_Patter_TEACH_Back);
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie miêsa topielców (150 bry³ek rudy, 1 punkt nauki)", DIA_Patter_TEACH_LurkerMeat);
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie w¹troby kretoszczurów (50 bry³ek rudy, 1 punkt nauki)", DIA_Patter_TEACH_MoleratW);
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie sad³a kretoszczurów (50 bry³ek rudy, 1 punkt nauki)", DIA_Patter_TEACH_MoleratT);
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie pazurów trolla ziemnego (150 bry³ek rudy, 1 punkt nauki)", DIA_Patter_TEACH_TrollGroundMoc);
    Info_AddChoice		(DIA_Patter_TEACH, "Zbieranie trucizny jaszczurów (30 bry³ek rudy, 1 punkt nauki)", DIA_Patter_TEACH_TruciznaJaszczurow12);
    }
    else
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_03_03"); //Chyba umiesz ju¿ wszystko.
        DIA_Patter_TEACH.permanent = false;
    };

   
};
func void DIA_Patter_TEACH_Back ()
{
Info_ClearChoices		(DIA_Patter_TEACH);
};
FUNC VOID DIA_Patter_TEACH_LurkerMeat()
{
    AI_Output (other, self ,"DIA_Patter_TEACH_LurkerMeat_15_01"); //Chcê nauczyæ siê usuwaæ miêso topielców.
    if (Npc_HasItems (hero, ItMiNugget)>=150)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_03"); //Nogi topielca s¹ silnie umiêœnione. 
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_05"); //To nie jest zbyt trudne. Dasz radê.
        B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiejêtnoœæ: Usuwanie miêsa topielców", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetLurkerMeat = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania miêsa topielców.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_06"); //Brakuje ci doœwiadczenia!
	 PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_07"); //Nie masz doœæ rudy!
    };

};

FUNC VOID DIA_Patter_TEACH_MoleratW()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_02"); //W¹troba kretoszczura jest umieszczona doœæ wysoko.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_03"); //Musisz obróciæ zwierza na grzbiet i rozci¹æ jego brzuch.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_04"); //Dalej chyba sobie poradzisz.
        B_GiveInvItems (other, self, ItMiNugget, 50);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiejêtnoœæ: Usuwanie w¹troby kretoszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetMoleratW = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania w¹troby kretoszczura i pozyskiwania ¿ó³ci przy stole alchemicznym.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_06"); //Brakuje ci doœwiadczenia!
	 PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_07"); //Nie masz doœæ rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_MoleratT()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_02"); //Sad³o kretoszczura to cenna rzecz.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_03"); //Wytrawny kucharz potrafi przygotowaæ z niego œwietn¹ zupê.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_04"); //Najwiêcej t³uszczu znajduje siê w podbrzuszu.
        B_GiveInvItems (other, self, ItMiNugget, 50);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiejêtnoœæ: Usuwanie sad³a kretoszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetMoleratT = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania sad³a kretoszczurów.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_06"); //Brakuje ci doœwiadczenia!
	 PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_07"); //Nie masz doœæ rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_TrollGroundMoc()
{
    if (Npc_HasItems (hero, ItMiNugget)>=150)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_02"); //Pazury ziemnego trolla to nie byle jakie trofeum.
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_03"); //Te stwory s¹ niebezpieczne, jednak mniej groŸne ni¿ ich górskie odmiany.
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_04"); //Pazury s³u¿¹ im do grzebania w ziemi. Wystarczy z³amaæ je w odpowiednim miejscu.
        B_GiveInvItems (other, self, ItMiNugget, 150);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiejêtnoœæ: Usuwanie pazurów ziemnych trolli", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetTrollGroundClaws = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Potrafiê usun¹æ pazury ziemnych trolli..");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_06"); //Brakuje ci doœwiadczenia!
	 PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_07"); //Nie masz doœæ rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_TruciznaJaszczurow12()
{
    if (Npc_HasItems (hero, ItMiNugget)>=30)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_02"); //Jak wiesz, jaszczury posiadaj¹ w zêbach doœæ siln¹ truciznê.
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_03"); //Mo¿na j¹ ³atwo pozyskaæ, gdy¿ gruczo³y znajduj¹ siê tu¿ pod zêbami.
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_04"); //Wystarczy troszkê je nadgi¹æ.
        B_GiveInvItems (other, self, ItMiNugget, 30);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiejêtnoœæ: Pozyskiwanie trucizny jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetTrutkaJaszczura = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Zbieranie trucizny z martwych jaszczurów.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_06"); //Brakuje ci doœwiadczenia!
	 PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_07"); //Nie masz doœæ rudy!
    };
};
//========================================
//-----------------> HaveFood
//========================================

INSTANCE DIA_Patter_HaveFood (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 4;
   condition    = DIA_Patter_HaveFood_Condition;
   information  = DIA_Patter_HaveFood_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi³eœ.";
};

FUNC INT DIA_Patter_HaveFood_Condition()
{
    if (MIS_Food_Patter == LOG_RUNNING)
	&& (Npc_HasItems(other,ItFo_muttonLurker)>=10)
	&& (Npc_HasItems(other,ItFo_MoleratW)>=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HaveFood_Info()
{
    AI_Output (other, self ,"DIA_Patter_HaveFood_15_01"); //Mam to, o co prosi³eœ.
    AI_Output (self, other ,"DIA_Patter_HaveFood_03_02"); //Wielkie dziêki.
    AI_Output (self, other ,"DIA_Patter_HaveFood_03_03"); //W zamian weŸ tê rudê.
	//prize
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	//items
    B_GiveInvItems (other, self, ItFo_muttonLurker, 10);
    B_GiveInvItems (other, self, ItFo_MoleratW, 5);
	//log
    B_LogEntry                     (CH1_Food_Patter,"Wykona³em zadanie i przynios³em zaopatrzenie Patterowi.");
    Log_SetTopicStatus       (CH1_Food_Patter, LOG_SUCCESS);
    MIS_Food_Patter = LOG_SUCCESS;
	//experience
    B_GiveXP (125);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Patter_HELLO5 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 1;
   condition    = DIA_Patter_HELLO5_Condition;
   information  = DIA_Patter_HELLO5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patter_HELLO5_Condition()
{
    if (MIS_BattleInTemple == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HELLO5_Info()
{
    AI_Output (self, other ,"DIA_Patter_HELLO5_03_01"); //Hej, ruszamy! WeŸ te mikstury.
    CreateInvItems (self, ItFo_Potion_Mana_02, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_02, 4);
    CreateInvItems (self, ItFo_Potion_Health_02, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 4);
    AI_StopProcessInfos	(self);
};

/*
//========================================
//-----------------> NAUKA_TROFEA_FIX
//========================================

INSTANCE DIA_HELLO2_NAUKA_TROFEA_FIX (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 1;
   condition    = DIA_HELLO2_NAUKA_TROFEA_FIX_Condition;
   information  = DIA_HELLO2_NAUKA_TROFEA_FIX_Info;
   permanent	= TRUE;
   description	= "TEST !!! Czego mo¿esz mnie nauczyæ?";
};

FUNC INT DIA_HELLO2_NAUKA_TROFEA_FIX_Condition()
{
    return TRUE;
};


FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_Info()
{
    AI_Output (other, self ,"DIA_HELLO2_NAUKA_TROFEA_FIX_15_01"); //Czego mo¿esz mnie nauczyæ?
    if (Knows_GetLurkerMeat == false) || (Knows_GetMoleratW == false) || (Knows_GetMoleratT == false) || (Knows_GetTrollGroundClaws == false) || (Knows_GetTrutkaJaszczura == false)
{
    AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_03_02"); //Wielu rzeczy. Co konkretnie chcesz wiedzieæ?
  }
    else
    {
    AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_03_03"); //Chyba umiesz ju¿ wszystko.
    };

    Info_ClearChoices		(DIA_HELLO2_NAUKA_TROFEA_FIX);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, DIALOG_BACK, DIA_HELLO2_NAUKA_TROFEA_FIX_BACK);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, "TO WEZ!! Usuwanie miêsa topielców (150 bry³ek rudy)", DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, "BEZ PRINTA! Usuwanie miêsa topielców (150 bry³ek rudy)", DIA_HELLO2_NAUKA_TROFEA_FIX_WATROBA1);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, "TYLKO ZMIENNA Usuwanie miêsa topielców (150 bry³ek rudy)", DIA_HELLO2_NAUKA_TROFEA_FIX_SADLO);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, "TYLKO RUDA Usuwanie miêsa topielców (150 bry³ek rudy)", DIA_HELLO2_NAUKA_TROFEA_FIX_PAZURY);
    Info_AddChoice		(DIA_HELLO2_NAUKA_TROFEA_FIX, "TYLKO LP Usuwanie miêsa topielców (150 bry³ek rudy)", DIA_HELLO2_NAUKA_TROFEA_FIX_TRUCIZNA);
};

FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_BACK()
{
    Info_ClearChoices		(DIA_HELLO2_NAUKA_TROFEA_FIX);
};

FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW()
{
    AI_Output (other, self ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_15_01"); //Chcê nauczyæ siê usuwaæ miêso topielców.
    if (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        if (hero.lp >= 1)
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_03"); //Nogi topielca s¹ silnie umiêœnione.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_05"); //To nie jest zbyt trudne. Dasz radê.
            B_GiveInvItems (other, self, ItMiNugget, 150);
            hero.lp = hero.lp - 1;
PrintScreen	("Nowa umiejêtnoœæ: Usuwanie miêsa topielców", -1,-1,"FONT_OLD_10_GREEN.TGA",2);
    Knows_GetLurkerMeat = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania miêsa topielców.");        }
        else
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_06"); //Brakuje ci doœwiadczenia!
PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_10_RED.TGA",2);
        };
};
};
FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_WATROBA1()
{
 if (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        if (hero.lp >= 1)
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_03"); //Nogi topielca s¹ silnie umiêœnione.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_05"); //To nie jest zbyt trudne. Dasz radê.
            B_GiveInvItems (other, self, ItMiNugget, 150);
            hero.lp = hero.lp - 1;
    Knows_GetLurkerMeat = true;
	}
        else
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_06"); //Brakuje ci doœwiadczenia!
        };
};
};

FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_SADLO()
{
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_03"); //Nogi topielca s¹ silnie umiêœnione.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_05"); //To nie jest zbyt trudne. Dasz radê.
    Knows_GetLurkerMeat = true;
print ("TYLKO ZMIENNA");
};

FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_PAZURY()
{
 if (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        if (hero.lp >= 1)
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_03"); //Nogi topielca s¹ silnie umiêœnione.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_05"); //To nie jest zbyt trudne. Dasz radê.
            B_GiveInvItems (other, self, ItMiNugget, 150);
    Knows_GetLurkerMeat = true;
	print ("HAJS SIÊ ZGADZA");
		}
        else
        {
		print ("BRAK LP");
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_06"); //Brakuje ci doœwiadczenia!
        };
}
else
{
AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_06"); //Brakuje ci doœwiadczenia!
print ("BRAK HAJSU");
};
};

FUNC VOID DIA_HELLO2_NAUKA_TROFEA_FIX_TRUCIZNA()
{
 if (hero.lp >= 1)
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_02"); //Miêso trzeba wyci¹æ z górnych czêœci u nóg.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_03"); //Nogi topielca s¹ silnie umiêœnione.
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_04"); //Nale¿y powoli odcinaæ miêso od koœci. 
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_05"); //To nie jest zbyt trudne. Dasz radê.

            hero.lp = hero.lp - 1;

	}
        else
        {
            AI_Output (self, other ,"DIA_HELLO2_NAUKA_TROFEA_FIX_MIESO_TOPIELCOW_03_06"); //Brakuje ci doœwiadczenia!
        };
};
*/
