//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_BaalLukor_world_EXIT(C_INFO)
{
	npc             = GUR_1213_BaalLukor_world;
	nr              = 999;
	condition	= DIA_BaalLukor_world_EXIT_Condition;
	information	= DIA_BaalLukor_world_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_BaalLukor_world_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BaalLukor_world_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_BaalLukor_world_HELLO1 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_HELLO1_Condition;
   information  = DIA_BaalLukor_world_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty pewnie te� si� do mnie nie odezwiesz?";
};

FUNC INT DIA_BaalLukor_world_HELLO1_Condition()
{
    if (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO1_15_01"); //Ty pewnie te� si� do mnie nie odezwiesz?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_02"); //A odezw�!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_03"); //Jeste�my z dala od innych Guru, wi�c nie b�d� mie� do mnie wyrzut�w. Ze mn� mo�esz rozmawia� jak z ka�dym.
	AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_04"); //Powiem wi�cej. My�l�, �e b�dziesz mi nawet w stanie pom�c.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_BaalLukor_world_HELLO2 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 2;
   condition    = DIA_BaalLukor_world_HELLO2_Condition;
   information  = DIA_BaalLukor_world_HELLO2_Info;
   permanent	= FALSE;
   description	= "W czym problem?";
};

FUNC INT DIA_BaalLukor_world_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_HELLO1))
    && (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_15_01"); //W czym problem?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_02"); //Chc� si� pozby� stada wilk�w przy �cie�ce do Obozu. Te bestie po�eraj� podr�nych.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_03"); //B�dziesz mi towarzyszy�?
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_15_04"); //Wasza magia jest skuteczna przeciw ludziom, ale czy przeciw zwierz�tom te�?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_05"); //Trafna uwaga. Jednak ja korzystam z miecza. Bra�em lekcje u Cor Angara. To jak, idziesz?

	MIS_PolowanieZBaalem = LOG_RUNNING;

    Log_CreateTopic            (CH1_PolowanieZBaalem, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PolowanieZBaalem, LOG_RUNNING);
	B_LogEntry                     (CH1_PolowanieZBaalem,"Baal Lukor zaproponowa� mi polowanie na wilki grasuj�ce w pobli�u Obozu. Dziwne, �e to on chce si� tym zaj��. To raczej robota dla Stra�nik�w �wi�tynnych.");
	
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO2);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO2, "Jasne!", DIA_BaalLukor_world_HELLO2_JASNE);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO2, "Nie mam czasu na wilki!", DIA_BaalLukor_world_HELLO2_NIE);
};

FUNC VOID DIA_BaalLukor_world_HELLO2_JASNE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_JASNE_15_01"); //Jasne!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_JASNE_03_02"); //No dobrze. Powiedz, gdy b�dziesz got�w p�j��.
    

    
	B_LogEntry                     (CH1_PolowanieZBaalem,"Zgodzi�em si� pom�c. Mam da� sygna�, gdy b�d� gotowy do drogi.");
	
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO2);
};

FUNC VOID DIA_BaalLukor_world_HELLO2_NIE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_NIE_15_01"); //Nie mam czasu na wilki!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_NIE_03_02"); //Jak chcesz.
    B_LogEntry                     (CH1_PolowanieZBaalem,"Nie chcia�em zapolowa� z Baal Lukorem na wilki.");
    Log_SetTopicStatus       (CH1_PolowanieZBaalem, LOG_FAILED);
    MIS_PolowanieZBaalem = LOG_FAILED;
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO2);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_BaalLukor_world_HELLO3 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 3;
   condition    = DIA_BaalLukor_world_HELLO3_Condition;
   information  = DIA_BaalLukor_world_HELLO3_Info;
   permanent	= FALSE;
   description	= "Chod�my!";
};

FUNC INT DIA_BaalLukor_world_HELLO3_Condition()
{
    if (MIS_PolowanieZBaalem == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO3_15_01"); //Chod�my!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO3_03_02"); //Id� za mn�!
    Npc_ExchangeRoutine (GUR_1213_BaalLukor_world, "guide");
	B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_FRIENDLY);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
	
	Wld_InsertNpc				(wolf,"SPAWN_WOLF_LUKOR_QUEST");
	Wld_InsertNpc				(wolf,"SPAWN_WOLF_LUKOR_QUEST");
	Wld_InsertNpc				(wolf,"SPAWN_WOLF_LUKOR_QUEST");
	Wld_InsertNpc				(wolf,"SPAWN_WOLF_LUKOR_QUEST");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_BaalLukor_world_HELLO4 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 4;
   condition    = DIA_BaalLukor_world_HELLO4_Condition;
   information  = DIA_BaalLukor_world_HELLO4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalLukor_world_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_HELLO3))
	&& (Npc_GetDistToWP (self, "SPAWN_WOLF_LUKOR_QUEST") < 500) 
   // && ( Wld_DetectNpc(self,wolf,ZS_MM_Rtn_Wusel,-1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO4_Info()
{
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_01"); //Wilk�w ju� nie ma! Dobra robota.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_02"); //Nie�le sobie radzisz z mieczem.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_03"); //Pomo�esz mi z jeszcze jedn� rzecz�?
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_15_04"); //Jak�?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_05"); //W jaskini jest kilku bandyt�w - Nowicjuszy. Chc� si� ich pozby� i odzyska� pewien amulet.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_06"); //Co ty na to? Pomo�esz mi?

    Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Oczywi�cie! Prowad�.", DIA_BaalLukor_world_HELLO4_CHODXMY);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Nie czuj� si� na si�ach.", DIA_BaalLukor_world_HELLO4_NIENIE);
	if (Npc_HasItems (other, lukor_amulet) >=1) {
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Ju� pozby�em si� tych bandyt�w. Mam amulet.", DIA_BaalLukor_world_HELLO4_MAM_JUZ); };
};

FUNC VOID DIA_BaalLukor_world_HELLO4_CHODXMY()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_CHODXMY_15_01"); //Oczywi�cie! Prowad�.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_CHODXMY_03_02"); //A wi�c za mn�!
    B_LogEntry                     (CH1_PolowanieZBaalem,"Pozbyli�my si� wilk�w. Teraz Lukor zaproponowa� wyeliminowanie bandyt�w z jaskini i odnalezienie amuletu.");

    B_GiveXP (200);
    Npc_ExchangeRoutine (GUR_1213_BaalLukor_world, "guide2");
	Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
	    B_LogEntry                     (CH1_PolowanieZBaalem,"Wilki kr�c�ce si� w pobli�u �cie�ki s� ju� przesz�o�ci�.");
    Log_SetTopicStatus       (CH1_PolowanieZBaalem, LOG_SUCCESS);
    MIS_PolowanieZBaalem = LOG_SUCCESS;

    
    MIS_BaalQuest2 = LOG_RUNNING;

    Log_CreateTopic            (CH1_BaalQuest2, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BaalQuest2, LOG_RUNNING);
    B_LogEntry                     (CH1_BaalQuest2,"Baal Lukor poprosi� mnie, abym pom�g� mu pozby� si� rabusi�w, kt�rzy ukradli jego amulet.");

    AI_StopProcessInfos	(self);
	
};

FUNC VOID DIA_BaalLukor_world_HELLO4_NIENIE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_NIENIE_15_01"); //Nie czuj� si� na si�ach.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_NIENIE_03_02"); //Szkoda. Zawiod�em si� na tobie. Jednak troch� mi pomog�e�. Masz tu ma�� zap�at�.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
    AI_StopProcessInfos	(self);
	B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_NEUTRAL);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "START");
	    B_LogEntry                     (CH1_PolowanieZBaalem,"Wilki kr�c�ce si� w pobli�u �cie�ki s� ju� przesz�o�ci�.");
    Log_SetTopicStatus       (CH1_PolowanieZBaalem, LOG_SUCCESS);
    MIS_PolowanieZBaalem = LOG_SUCCESS;

    B_GiveXP (150);

};

FUNC VOID DIA_BaalLukor_world_HELLO4_MAM_JUZ()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_15_01"); //Ju� pozby�em si� tych bandyt�w. Mam amulet.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_02"); //Doprawdy?! To wspaniale! 
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_15_03"); //Prosz�, we� go.
	    B_LogEntry                     (CH1_PolowanieZBaalem,"Wilki kr�c�ce si� w pobli�u �cie�ki s� ju� przesz�o�ci�.");
    Log_SetTopicStatus       (CH1_PolowanieZBaalem, LOG_SUCCESS);
    MIS_PolowanieZBaalem = LOG_SUCCESS;


    B_LogEntry                     (CH1_BaalQuest2,"Baal Lukor poprosi� mnie, abym pom�g� mu pozby� si� rabusi�w, kt�rzy ukradli jego amulet. Na szcz�cie ju� wcze�niej pozby�em si� bandyt�w i znalaz�em skradziony przedmiot.");
    Log_SetTopicStatus       (CH1_BaalQuest2, LOG_SUCCESS);
    MIS_BaalQuest2 = LOG_SUCCESS;

    B_GiveXP (300);
    B_GiveInvItems (other, self, lukor_amulet, 1);
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_04"); //Dzi�kuj� ci. We� te rud� jako nagrod�.
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
	 B_GiveInvItems (hero, self, lukor_amulet, 1);
	 B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_NEUTRAL);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = false;
    if (Npc_GetTrueGuild(other) == GIL_NONE)
    {
        AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_05"); //Powiem te� o tobie dobre s��wko Kalomowi.
    };
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_06"); //Mo�emy wraca�.
    Npc_ExchangeRoutine (self, "START");
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> POKONANI_NOWICJUSZE
//========================================

INSTANCE DIA_BaalLukor_world_POKONANI_NOWICJUSZE (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_POKONANI_NOWICJUSZE_Condition;
   information  = DIA_BaalLukor_world_POKONANI_NOWICJUSZE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalLukor_world_POKONANI_NOWICJUSZE_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3926_Hersztgrupy);
    if (MIS_BaalQuest2 == LOG_RUNNING)
    && (Npc_IsDead(whodie0))
	&& (Npc_GetDistToWP (self, "CAVE_BANDIT_1") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_POKONANI_NOWICJUSZE_Info()
{
    AI_Output (self, other ,"DIA_BaalLukor_world_POKONANI_NOWICJUSZE_03_01"); //Dobrze radzisz sobie z broni�. To si� chwali.
    AI_Output (self, other ,"DIA_BaalLukor_world_POKONANI_NOWICJUSZE_03_02"); //Znajd� teraz m�j amulet. Reszt� �up�w mo�esz zatrzyma�. 
    B_LogEntry                     (CH1_BaalQuest2,"Musz� teraz znale�� amulet gdzie� w�r�d cia�.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AMULET
//========================================

INSTANCE DIA_BaalLukor_world_AMULET (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 2;
   condition    = DIA_BaalLukor_world_AMULET_Condition;
   information  = DIA_BaalLukor_world_AMULET_Info;
   permanent	= FALSE;
   description	= "Mam amulet.";
};

FUNC INT DIA_BaalLukor_world_AMULET_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_POKONANI_NOWICJUSZE))
    && (Npc_HasItems (hero, lukor_amulet) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_AMULET_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_AMULET_15_01"); //Mam amulet.
    AI_Output (self, other ,"DIA_BaalLukor_world_AMULET_03_02"); //Dobra robota. Dzi�kuj� ci za pomoc. 
    AI_Output (self, other ,"DIA_BaalLukor_world_AMULET_03_03"); //We� t� rud� jako nagrod�. Szepn� te� o tobie dobre s�owo Kalomowi. 
    B_LogEntry                     (CH1_BaalQuest2,"Znalaz�em amulet. Baal Lukor by� bardzo zadowolony.");
    Log_SetTopicStatus       (CH1_BaalQuest2, LOG_SUCCESS);
    MIS_BaalQuest2 = LOG_SUCCESS;
B_GiveInvItems (hero, self, lukor_amulet, 1);
    B_GiveXP (50);
	B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_NEUTRAL);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = false;
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
};

//========================================
//-----------------> ZADANIE
//========================================

INSTANCE DIA_BaalLukor_world_ZADANIE (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_ZADANIE_Condition;
   information  = DIA_BaalLukor_world_ZADANIE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalLukor_world_ZADANIE_Condition()
{
    if (kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_ZADANIE_Info()
{
    AI_Output (self, other ,"DIA_BaalLukor_world_ZADANIE_03_01"); //Zaczekaj! Mam dla ciebie zadanie!
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_BaalLukor_world_QUEST2 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 2;
   condition    = DIA_BaalLukor_world_QUEST2_Condition;
   information  = DIA_BaalLukor_world_QUEST2_Info;
   permanent	= FALSE;
   description	= "Jakie zadanie?";
};

FUNC INT DIA_BaalLukor_world_QUEST2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_ZADANIE))
    && (kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST2_15_01"); //Jakie zadanie?
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_02"); //Kilka tygodni temu wys�a�em Gor Na Lina do Nowego Obozu. Mia� szpiegowa� ludzi Laresa.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_03"); //Podejrzewam, �e jego siepacze podkradaj� naszym wys�annikom ziele.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_04"); //Od d�u�szego czasu nie mam od niego �adnych wie�ci. Mo�esz go poszuka�?
    MIS_ZginalLIN = LOG_RUNNING;

    Log_CreateTopic            (CH1_ZginalLIN, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZginalLIN, LOG_RUNNING);
    B_LogEntry                     (CH1_ZginalLIN,"Baal Lukor wys�a� do Nowego Obozu Stra�nika �wi�tynnego imieniem Gor Na Lin. Stra�nik mia� szpiegowa� ludzi Laresa, jednak od d�u�szego czasu nie ma od niego �adnych wie�ci.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> LIN_DED
//========================================

INSTANCE DIA_BaalLukor_world_LIN_DED (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_LIN_DED_Condition;
   information  = DIA_BaalLukor_world_LIN_DED_Info;
   permanent	= FALSE;
   description	= "Gor Na Lin nie �yje.";
};

FUNC INT DIA_BaalLukor_world_LIN_DED_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_QUEST2)) && (Npc_IsDead(TPL_3928_GorNaLin)) && (MIS_ZginalLIN == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_LIN_DED_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_01"); //Gor Na Lin nie �yje.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_02"); //Nie uda�o mi si� go ocali�. Zabi�y go Szkodniki.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_03"); //Da� si� rozpracowa�? Co si� sta�o?
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_04"); //Chcia� wnikn�� do ich grupy. Jednak Szkodniki szybko si� zorientowali, �e jest szpiegiem.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_05"); //Cz�stowali go mocnym alkoholem, w ko�cu si� uzale�ni�. Spotka�em go kompletnie pijanego w karczmie. 
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_06"); //Szkodniki nie chcia�y go wypu�ci�. Musia�em kombinowa�, ale co� nie wysz�o.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_07"); //Niejaki Bruce zabi� Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_08"); //Dobrze, �e tobie si� poszcz�ci�o.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_09"); //To smutna wiadomo��, jednak dzi�kuj� za twoje starania. Masz tu skromn� zap�at�.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Log_SetTopicStatus       (CH1_ZginalLIN, LOG_FAILED);
    MIS_ZginalLIN = LOG_FAILED;
    B_LogEntry                     (CH1_ZginalLIN,"Powiedzia�em Baal Lukorowi, �e Gor Na Lin nie �yje i nie uda�o mi si� go uratowa�.");
};

//========================================
//-----------------> QUEST_END
//========================================

INSTANCE DIA_BaalLukor_world_QUEST_END (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_QUEST_END_Condition;
   information  = DIA_BaalLukor_world_QUEST_END_Info;
   permanent	= FALSE;
   description	= "Przyprowadzi�em Gor Na Lina.";
};

FUNC INT DIA_BaalLukor_world_QUEST_END_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_POWROT_DONE))
	&& (MIS_ZginalLIN == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST_END_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_01"); //Przyprowadzi�em Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_02"); //Zauwa�y�em. Dobra robota, jednak chcia�bym wiedzie�, co si� z nim dzia�o. Gdzie go znalaz�e�? By� w Nowym Obozie?
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_03"); //Tak. Za bardzo spoufali� si� ze Szkodnikami. Popad� w pija�stwo. Ledwo uda�o mi si� go z tego wyci�gn��.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_04"); //Jego umys�... hmm... odni�s� powa�ne... szkody.
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_05"); //Da� mi ju� to do zrozumienia.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_06"); //C�... B�d� musia� nad nim troch� popracowa�.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_07"); //A wracaj�c do ciebie... To nie by�o �atwe zadanie. We� te rud� i wywary jako nagrod�.
	Log_SetTopicStatus       (CH1_ZginalLIN, LOG_SUCCESS);
    MIS_ZginalLIN = LOG_SUCCESS;
    B_LogEntry                     (CH1_ZginalLIN,"Baal Lukor by� bardzo zadowolony z powrotu Gor Na Lina, jednak zaskoczy�o go jego zachowanie. Na szcz�cie to nie jest m�j problem.");

    B_GiveXP (400);
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    CreateInvItems (self, ItFo_Potion_Health_01, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 4);
	
	var c_npc gorlin;
	gorlin = Hlp_GetNpc(TPL_3928_GorNaLin);
	Mdl_SetVisualBody (gorlin,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,TPL_ARMOR_L);
	EquipItem (gorlin, ItMw_2H_Sword_Light_01);
	
};
