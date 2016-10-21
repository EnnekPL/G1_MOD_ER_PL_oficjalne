// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Pirat3_EXIT(C_INFO)
{
	npc             = NON_5026_Pirat3;
	nr              = 999;
	condition	= DIA_Pirat3_EXIT_Condition;
	information	= DIA_Pirat3_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Pirat3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pirat3_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Pirat3_HELLO1 (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 1;
   condition    = DIA_Pirat3_HELLO1_Condition;
   information  = DIA_Pirat3_HELLO1_Info;
   permanent	= FALSE;
   description	= "Hej! Czemu siê tak rozgl¹dasz?";
};

FUNC INT DIA_Pirat3_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Pirat3_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Pirat3_HELLO1_15_01"); //Hej! Czemu siê tak rozgl¹dasz?
    AI_Output (self, other ,"DIA_Pirat3_HELLO1_03_02"); //Chcê siê upewniæ, czy na pewno rozbiliœmy siê o wybrze¿a starej Kolonii Górniczej.
    AI_Output (other, self ,"DIA_Pirat3_HELLO1_15_03"); //Tak, rozbiliœcie siê i jesteœcie w Górniczej Dolinie.
    AI_Output (self, other ,"DIA_Pirat3_HELLO1_03_04"); //To œwietnie!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Pirat3_HELLO2 (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 2;
   condition    = DIA_Pirat3_HELLO2_Condition;
   information  = DIA_Pirat3_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co?!";
};

FUNC INT DIA_Pirat3_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Pirat3_HELLO2_15_01"); //Co?!
    AI_Output (self, other ,"DIA_Pirat3_HELLO2_03_02"); //Powiem ci w sekrecie, ¿e mam tu star¹ mapê ze skarbami.
    AI_Output (self, other ,"DIA_Pirat3_HELLO2_03_03"); //S¹ ich dok³adnie dwa.
    AI_Output (self, other ,"DIA_Pirat3_HELLO2_03_04"); //Niestety nie znam okolicy, wiêc nie wiem, gdzie szukaæ.
    AI_Output (self, other ,"DIA_Pirat3_HELLO2_03_05"); //Dam ci mapê, a ty mnie zaprowadzisz w te miejsca.
    AI_Output (self, other ,"DIA_Pirat3_HELLO2_03_06"); //Co ty na to? Dzielimy siê po po³owie.
    AI_Output (other, self ,"DIA_Pirat3_HELLO2_15_07"); //Wchodzê w to!
    MIS_TreasureSeeking = LOG_RUNNING;

    Log_CreateTopic            (CH4_TreasureSeeking, LOG_MISSION);
    Log_SetTopicStatus       (CH4_TreasureSeeking, LOG_RUNNING);
    B_LogEntry                     (CH4_TreasureSeeking,"Stary pirat Szerszeñ zaoferowa³ mi poszukiwanie skarbu w Kolonii. Mam go zaprowadziæ w wyznaczone na mapie miejsca.");
};

//========================================
//-----------------> PoszukiwanieSkarbu
//========================================

INSTANCE DIA_Pirat3_PoszukiwanieSkarbu (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 1;
   condition    = DIA_Pirat3_PoszukiwanieSkarbu_Condition;
   information  = DIA_Pirat3_PoszukiwanieSkarbu_Info;
   permanent	= FALSE;
   description	= "W drogê!";
};

FUNC INT DIA_Pirat3_PoszukiwanieSkarbu_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_PoszukiwanieSkarbu_Info()
{
    AI_Output (other, self ,"DIA_Pirat3_PoszukiwanieSkarbu_15_01"); //W drogê!
    AI_Output (self, other ,"DIA_Pirat3_PoszukiwanieSkarbu_03_02"); //Masz tu mapê. Skarb znajduje siê w dwóch skrzyniach.
    CreateInvItems (self, WorldMap2Pirat, 1);
    B_GiveInvItems (self, other, WorldMap2Pirat, 1);
    CreateInvItems (self, PiratKey01, 1);
    B_GiveInvItems (self, other, PiratKey01, 1);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"FOLLOW");
    AI_StopProcessInfos	(self);
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
};

//========================================
//-----------------> SKARB1
//========================================

INSTANCE DIA_Pirat3_SKARB1 (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 2;
   condition    = DIA_Pirat3_SKARB1_Condition;
   information  = DIA_Pirat3_SKARB1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat3_SKARB1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_PoszukiwanieSkarbu))
    && (Npc_GetDistToWP (self, "ZEB1") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_SKARB1_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Pirat3_SKARB1_03_01"); //O ile siê nie mylê to jesteœmy w pobli¿u skarbu.
    AI_Output (other, self ,"DIA_Pirat3_SKARB1_15_02"); //Dok³adnie. Zaraz otworzê skrzyniê.
    B_LogEntry                     (CH4_TreasureSeeking,"ZnaleŸliœmy pierwszy skarb. Muszê tylko otworzyæ skrzyniê.");

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SKARB1PART
//========================================

INSTANCE DIA_Pirat3_SKARB1PART (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 3;
   condition    = DIA_Pirat3_SKARB1PART_Condition;
   information  = DIA_Pirat3_SKARB1PART_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat3_SKARB1PART_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_SKARB1))
    && (Npc_HasItems (other, ItMi_Stuff_OldCoin_01) >=300)
    && (Npc_HasItems (other, ItMi_Stuff_OldCoin_02) >=500)
    && (Npc_HasItems (other, ItMi_Stuff_Cup_02) >=2)
    && (Npc_HasItems (hero, ItMiNugget)>=250)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_SKARB1PART_Info()
{
    AI_Output (self, other ,"DIA_Pirat3_SKARB1PART_03_01"); //Daj mi moj¹ po³owê!
    AI_Output (other, self ,"DIA_Pirat3_SKARB1PART_15_02"); //Trzymaj.
    B_GiveInvItems (other, self, ItMiNugget, 125);
    B_GiveInvItems (other, self, ItMi_Stuff_OldCoin_01, 150);
    B_GiveInvItems (other, self, ItMi_Stuff_Cup_02, 1);
    B_GiveInvItems (other, self, ItMi_Stuff_OldCoin_02, 250);
    AI_Output (self, other ,"DIA_Pirat3_SKARB1PART_03_03"); //Mo¿emy iœæ dalej.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Pirat3_HELLO4 (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 4;
   condition    = DIA_Pirat3_HELLO4_Condition;
   information  = DIA_Pirat3_HELLO4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat3_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_PoszukiwanieSkarbu))
    && (Npc_GetDistToWP (self, "SHADOW1") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_HELLO4_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Pirat3_HELLO4_03_01"); //Tutaj jest kolejny skarb.
    AI_Output (self, other ,"DIA_Pirat3_HELLO4_03_02"); //Bierz go!
    B_LogEntry                     (CH4_TreasureSeeking,"Uda³o nam siê znaleŸæ drugi skarb.");

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POMAJD
//========================================

INSTANCE DIA_Pirat3_POMAJD (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 5;
   condition    = DIA_Pirat3_POMAJD_Condition;
   information  = DIA_Pirat3_POMAJD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat3_POMAJD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_HELLO4))
	   && (Npc_HasItems (other, ItAt_Wolf_02) >=5)
    && (Npc_HasItems (other, ItMi_Stuff_OldCoin_02) >=225)
    && (Npc_HasItems (other, ItFo_Potion_Health_03) >=15)
    && (Npc_HasItems (other, ItFo_Potion_Strength_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_POMAJD_Info()
{
    AI_Output (self, other ,"DIA_Pirat3_POMAJD_03_01"); //Dawaj moj¹ po³owê.
    B_GiveInvItems (other, self, ItAt_Wolf_02, 5);
    B_GiveInvItems (other, self, ItMi_Stuff_OldCoin_02, 225);
    B_GiveInvItems (other, self, ItFo_Potion_Health_03, 15);
    B_GiveInvItems (other, self, ItFo_Potion_Strength_01, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SLLA
//========================================

INSTANCE DIA_Pirat3_SLLA (C_INFO)
{
   npc          = NON_5026_Pirat3;
   nr           = 6;
   condition    = DIA_Pirat3_SLLA_Condition;
   information  = DIA_Pirat3_SLLA_Info;
   permanent	= FALSE;
   description	= "To ju¿ chyba wszystko.";
};

FUNC INT DIA_Pirat3_SLLA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat3_POMAJD))
    && (Npc_KnowsInfo (hero, DIA_Pirat3_SKARB1PART))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat3_SLLA_Info()
{
    AI_Output (other, self ,"DIA_Pirat3_SLLA_15_01"); //To ju¿ chyba wszystko.
    AI_Output (self, other ,"DIA_Pirat3_SLLA_03_02"); //Tak. By³y tylko dwa skarby o ile dobrze pamiêtam. Dziêki, ch³opcze.
    B_LogEntry                     (CH4_TreasureSeeking,"ZnaleŸliœmy obydwa skarby. Musia³em oddaæ po³owê Szerszeniowi, ale i tak sporo zyska³em.");
    Log_SetTopicStatus       (CH4_TreasureSeeking, LOG_SUCCESS);
    MIS_TreasureSeeking = LOG_SUCCESS;

    B_GiveXP (500);

    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

