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
   description	= "Ty pewnie te¿ siê do mnie nie odezwiesz?";
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
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO1_15_01"); //Ty pewnie te¿ siê do mnie nie odezwiesz?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_02"); //A odezwê!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_03"); //Jesteœmy z dala od innych Guru, wiêc nie bêd¹ mieæ do mnie wyrzutów. Ze mn¹ mo¿esz rozmawiaæ jak z ka¿dym.
	AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_04"); //Powiem wiêcej. Myœlê, ¿e bêdziesz mi nawet w stanie pomóc.
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
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_02"); //Chcê siê pozbyæ stada wilków przy œcie¿ce do Obozu. Te bestie po¿eraj¹ podró¿nych.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_03"); //Bêdziesz mi towarzyszy³?
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_15_04"); //Wasza magia jest skuteczna przeciw ludziom, ale czy przeciw zwierzêtom te¿?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_03_05"); //Trafna uwaga. Jednak ja korzystam z miecza. Bra³em lekcje u Cor Angara. To jak, idziesz?

	MIS_HuntingWithLukor = LOG_RUNNING;

    Log_CreateTopic            (CH1_HuntingWithLukor, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HuntingWithLukor, LOG_RUNNING);
	B_LogEntry                     (CH1_HuntingWithLukor,"Baal Lukor zaproponowa³ mi polowanie na wilki grasuj¹ce w pobli¿u Obozu. Dziwne, ¿e to on chce siê tym zaj¹æ. To raczej robota dla Stra¿ników Œwi¹tynnych.");
	
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO2);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO2, "Jasne!", DIA_BaalLukor_world_HELLO2_JASNE);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO2, "Nie mam czasu na wilki!", DIA_BaalLukor_world_HELLO2_NIE);
};

FUNC VOID DIA_BaalLukor_world_HELLO2_JASNE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_JASNE_15_01"); //Jasne!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_JASNE_03_02"); //No dobrze. Powiedz, gdy bêdziesz gotów pójœæ.
    

    
	B_LogEntry                     (CH1_HuntingWithLukor,"Zgodzi³em siê pomóc. Mam daæ sygna³, gdy bêdê gotowy do drogi.");
	
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO2);
};

FUNC VOID DIA_BaalLukor_world_HELLO2_NIE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO2_NIE_15_01"); //Nie mam czasu na wilki!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO2_NIE_03_02"); //Jak chcesz.
    B_LogEntry                     (CH1_HuntingWithLukor,"Nie chcia³em zapolowaæ z Baal Lukorem na wilki.");
    Log_SetTopicStatus       (CH1_HuntingWithLukor, LOG_FAILED);
    MIS_HuntingWithLukor = LOG_FAILED;
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
   description	= "ChodŸmy!";
};

FUNC INT DIA_BaalLukor_world_HELLO3_Condition()
{
    if (MIS_HuntingWithLukor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO3_15_01"); //ChodŸmy!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO3_03_02"); //IdŸ za mn¹!
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
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_01"); //Wilków ju¿ nie ma! Dobra robota.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_02"); //NieŸle sobie radzisz z mieczem.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_03"); //Pomo¿esz mi z jeszcze jedn¹ rzecz¹?
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_15_04"); //Jak¹?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_05"); //W jaskini jest kilku bandytów - Nowicjuszy. Chcê siê ich pozbyæ i odzyskaæ pewien amulet.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_03_06"); //Co ty na to? Pomo¿esz mi?

    Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Oczywiœcie! ProwadŸ.", DIA_BaalLukor_world_HELLO4_CHODXMY);
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Nie czujê siê na si³ach.", DIA_BaalLukor_world_HELLO4_NIENIE);
	if (Npc_HasItems (other, lukor_amulet) >=1) {
    Info_AddChoice		(DIA_BaalLukor_world_HELLO4, "Ju¿ pozby³em siê tych bandytów. Mam amulet.", DIA_BaalLukor_world_HELLO4_MAM_JUZ); };
};

FUNC VOID DIA_BaalLukor_world_HELLO4_CHODXMY()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_CHODXMY_15_01"); //Oczywiœcie! ProwadŸ.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_CHODXMY_03_02"); //A wiêc za mn¹!
    B_LogEntry                     (CH1_HuntingWithLukor,"Pozbyliœmy siê wilków. Teraz Lukor zaproponowa³ wyeliminowanie bandytów z jaskini i odnalezienie amuletu.");

    B_GiveXP (200);
    Npc_ExchangeRoutine (GUR_1213_BaalLukor_world, "guide2");
	Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
	    B_LogEntry                     (CH1_HuntingWithLukor,"Wilki krêc¹ce siê w pobli¿u œcie¿ki s¹ ju¿ przesz³oœci¹.");
    Log_SetTopicStatus       (CH1_HuntingWithLukor, LOG_SUCCESS);
    MIS_HuntingWithLukor = LOG_SUCCESS;

    
    MIS_LukorsAmulet = LOG_RUNNING;

    Log_CreateTopic            (CH1_LukorsAmulet, LOG_MISSION);
    Log_SetTopicStatus       (CH1_LukorsAmulet, LOG_RUNNING);
    B_LogEntry                     (CH1_LukorsAmulet,"Baal Lukor poprosi³ mnie, abym pomóg³ mu pozbyæ siê rabusiów, którzy ukradli jego amulet.");

    AI_StopProcessInfos	(self);
	
};

FUNC VOID DIA_BaalLukor_world_HELLO4_NIENIE()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_NIENIE_15_01"); //Nie czujê siê na si³ach.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_NIENIE_03_02"); //Szkoda. Zawiod³em siê na tobie. Jednak trochê mi pomog³eœ. Masz tu ma³¹ zap³atê.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    Info_ClearChoices		(DIA_BaalLukor_world_HELLO4);
    AI_StopProcessInfos	(self);
	B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_NEUTRAL);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "START");
	    B_LogEntry                     (CH1_HuntingWithLukor,"Wilki krêc¹ce siê w pobli¿u œcie¿ki s¹ ju¿ przesz³oœci¹.");
    Log_SetTopicStatus       (CH1_HuntingWithLukor, LOG_SUCCESS);
    MIS_HuntingWithLukor = LOG_SUCCESS;

    B_GiveXP (150);

};

FUNC VOID DIA_BaalLukor_world_HELLO4_MAM_JUZ()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_15_01"); //Ju¿ pozby³em siê tych bandytów. Mam amulet.
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_02"); //Doprawdy?! To wspaniale! 
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_15_03"); //Proszê, weŸ go.
	    B_LogEntry                     (CH1_HuntingWithLukor,"Wilki krêc¹ce siê w pobli¿u œcie¿ki s¹ ju¿ przesz³oœci¹.");
    Log_SetTopicStatus       (CH1_HuntingWithLukor, LOG_SUCCESS);
    MIS_HuntingWithLukor = LOG_SUCCESS;


    B_LogEntry                     (CH1_LukorsAmulet,"Baal Lukor poprosi³ mnie, abym pomóg³ mu pozbyæ siê rabusiów, którzy ukradli jego amulet. Na szczêœcie ju¿ wczeœniej pozby³em siê bandytów i znalaz³em skradziony przedmiot.");
    Log_SetTopicStatus       (CH1_LukorsAmulet, LOG_SUCCESS);
    MIS_LukorsAmulet = LOG_SUCCESS;

    B_GiveXP (300);
    B_GiveInvItems (other, self, lukor_amulet, 1);
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_04"); //Dziêkujê ci. WeŸ te rudê jako nagrodê.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
	 B_GiveInvItems (hero, self, lukor_amulet, 1);
	 B_SetPermAttitude	(GUR_1213_BaalLukor_world,	ATT_NEUTRAL);
	GUR_1213_BaalLukor_world.aivar[AIV_PARTYMEMBER] = false;
    if (Npc_GetTrueGuild(other) == GIL_NONE)
    {
        AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_05"); //Powiem te¿ o tobie dobre s³ówko Kalomowi.
    };
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO4_MAM_JUZ_03_06"); //Mo¿emy wracaæ.
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
    if (MIS_LukorsAmulet == LOG_RUNNING)
    && (Npc_IsDead(whodie0))
	&& (Npc_GetDistToWP (self, "CAVE_BANDIT_1") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_POKONANI_NOWICJUSZE_Info()
{
    AI_Output (self, other ,"DIA_BaalLukor_world_POKONANI_NOWICJUSZE_03_01"); //Dobrze radzisz sobie z broni¹. To siê chwali.
    AI_Output (self, other ,"DIA_BaalLukor_world_POKONANI_NOWICJUSZE_03_02"); //ZnajdŸ teraz mój amulet. Resztê ³upów mo¿esz zatrzymaæ. 
    B_LogEntry                     (CH1_LukorsAmulet,"Muszê teraz znaleŸæ amulet gdzieœ wœród cia³.");

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
    AI_Output (self, other ,"DIA_BaalLukor_world_AMULET_03_02"); //Dobra robota. Dziêkujê ci za pomoc. 
    AI_Output (self, other ,"DIA_BaalLukor_world_AMULET_03_03"); //WeŸ tê rudê jako nagrodê. Szepnê te¿ o tobie dobre s³owo Kalomowi. 
    B_LogEntry                     (CH1_LukorsAmulet,"Znalaz³em amulet. Baal Lukor by³ bardzo zadowolony.");
    Log_SetTopicStatus       (CH1_LukorsAmulet, LOG_SUCCESS);
    MIS_LukorsAmulet = LOG_SUCCESS;
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
    if (kapitel == 2) && (Npc_GetTrueGuild(other) == GIL_TPL)
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
	&& (Npc_GetTrueGuild(other) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST2_15_01"); //Jakie zadanie?
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_02"); //Kilka tygodni temu wys³a³em Gor Na Lina do Nowego Obozu. Mia³ szpiegowaæ ludzi Laresa.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_03"); //Podejrzewam, ¿e jego siepacze podkradaj¹ naszym wys³annikom ziele.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_04"); //Od d³u¿szego czasu nie mam od niego ¿adnych wieœci. Mo¿esz go poszukaæ?
    MIS_MissedSpy = LOG_RUNNING;

    Log_CreateTopic            (CH2_MissedSpy, LOG_MISSION);
    Log_SetTopicStatus       (CH2_MissedSpy, LOG_RUNNING);
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor wys³a³ do Nowego Obozu Stra¿nika Œwi¹tynnego imieniem Gor Na Lin. Stra¿nik mia³ szpiegowaæ ludzi Laresa, jednak od d³u¿szego czasu nie ma od niego ¿adnych wieœci.");
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
   description	= "Gor Na Lin nie ¿yje.";
};

FUNC INT DIA_BaalLukor_world_LIN_DED_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_QUEST2)) && (Npc_IsDead(TPL_3928_GorNaLin)) && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_LIN_DED_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_01"); //Gor Na Lin nie ¿yje.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_02"); //Nie uda³o mi siê go ocaliæ. Zabi³y go Szkodniki.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_03"); //Da³ siê rozpracowaæ? Co siê sta³o?
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_04"); //Chcia³ wnikn¹æ do ich grupy. Jednak Szkodniki szybko siê zorientowali, ¿e jest szpiegiem.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_05"); //Czêstowali go mocnym alkoholem, w koñcu siê uzale¿ni³. Spotka³em go kompletnie pijanego w karczmie. 
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_06"); //Szkodniki nie chcia³y go wypuœciæ. Musia³em kombinowaæ, ale coœ nie wysz³o.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_07"); //Niejaki Bruce zabi³ Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_08"); //Dobrze, ¿e tobie siê poszczêœci³o.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_09"); //To smutna wiadomoœæ, jednak dziêkujê za twoje starania. Masz tu skromn¹ zap³atê.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_FAILED);
    MIS_MissedSpy = LOG_FAILED;
    B_LogEntry                     (CH2_MissedSpy,"Powiedzia³em Baal Lukorowi, ¿e Gor Na Lin nie ¿yje i nie uda³o mi siê go uratowaæ.");
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
   description	= "Przyprowadzi³em Gor Na Lina.";
};

FUNC INT DIA_BaalLukor_world_QUEST_END_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_POWROT_DONE))
	&& (MIS_MissedSpy == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST_END_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_01"); //Przyprowadzi³em Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_02"); //Zauwa¿y³em. Dobra robota, jednak chcia³bym wiedzieæ, co siê z nim dzia³o. Gdzie go znalaz³eœ? By³ w Nowym Obozie?
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_03"); //Tak. Za bardzo spoufali³ siê ze Szkodnikami. Popad³ w pijañstwo. Ledwo uda³o mi siê go z tego wyci¹gn¹æ.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_04"); //Jego umys³... hmm... odniós³ powa¿ne... szkody.
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_05"); //Da³ mi ju¿ to do zrozumienia.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_06"); //Có¿... Bêdê musia³ nad nim trochê popracowaæ.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_07"); //A wracaj¹c do ciebie... To nie by³o ³atwe zadanie. WeŸ te rudê i wywary jako nagrodê.
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_SUCCESS);
    MIS_MissedSpy = LOG_SUCCESS;
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor by³ bardzo zadowolony z powrotu Gor Na Lina, jednak zaskoczy³o go jego zachowanie. Na szczêœcie to nie jest mój problem.");

    B_GiveXP (400);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
    CreateInvItems (self, ItFo_Potion_Health_01, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 4);
	
	CreateInvItems (self, ItFo_Potion_Haste_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_01, 1);
	
	var c_npc gorlin;
	gorlin = Hlp_GetNpc(TPL_3928_GorNaLin);
	Mdl_SetVisualBody (gorlin,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,TPL_ARMOR_L);
	EquipItem (gorlin, ItMw_2H_Sword_Light_01);
	
};
