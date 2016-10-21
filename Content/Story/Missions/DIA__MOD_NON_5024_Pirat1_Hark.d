// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Pirat1_EXIT(C_INFO)
{
	npc             = NON_5024_Pirat1;
	nr              = 999;
	condition	= DIA_Pirat1_EXIT_Condition;
	information	= DIA_Pirat1_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Pirat1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pirat1_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CoTuRobisz
//========================================

INSTANCE DIA_Pirat1_CoTuRobisz (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 1;
   condition    = DIA_Pirat1_CoTuRobisz_Condition;
   information  = DIA_Pirat1_CoTuRobisz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat1_CoTuRobisz_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_CoTuRobisz_Info()
{
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_01"); //Nie masz na sobie czerwonego pancerza! Kim jeste�?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_02"); //Jestem...
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_03"); //Nale�ysz do tych drani, kt�rzy nas zaatakowali?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_04"); //Kto was napad�?
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_05"); //Ci m�czy�ni w czerwonych zbrojach. Pe�no ich si� tu kr�ci.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_06"); //Gdy nasz statek si� rozbi� my�leli�my, �e p�dz� nam na pomoc.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_07"); //Mylili�my si�.
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_08"); //To Stra�nicy ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_09"); //Dlaczego s� tacy w�ciekli?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_10"); //To d�uga historia.
};

//========================================
//-----------------> KiedyRozbliscie
//========================================

INSTANCE DIA_Pirat1_KiedyRozbliscie (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 2;
   condition    = DIA_Pirat1_KiedyRozbliscie_Condition;
   information  = DIA_Pirat1_KiedyRozbliscie_Info;
   permanent	= FALSE;
   description	= "Kiedy si� rozbili�cie?";
};

FUNC INT DIA_Pirat1_KiedyRozbliscie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_CoTuRobisz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_KiedyRozbliscie_Info()
{
    AI_Output (other, self ,"DIA_Pirat1_KiedyRozbliscie_15_01"); //Kiedy si� rozbili�cie?
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_02"); //Wczoraj wieczorem.
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_03"); //Nie znamy tych okolic. Stracili�my jednego z naszych ludzi.
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_04"); //Rozbi� si� o ska��, a jego cia�o porwa�o morze.
};

//========================================
//-----------------> helpju
//========================================

INSTANCE DIA_Pirat1_helpju (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 3;
   condition    = DIA_Pirat1_helpju_Condition;
   information  = DIA_Pirat1_helpju_Info;
   permanent	= FALSE;
   description	= "Mog� wam jako� pom�c?";
};

FUNC INT DIA_Pirat1_helpju_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_CoTuRobisz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_helpju_Info()
{
    AI_Output (other, self ,"DIA_Pirat1_helpju_15_01"); //Mog� wam jako� pom�c?
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_02"); //Mnie na razie nie jest potrzebna pomoc.
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_03"); //Mo�e kto� inny ma co� dla ciebie.
    AI_Output (other, self ,"DIA_Pirat1_helpju_15_04"); //Dobra, wi�c id� zapyta�.
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_05"); //Zaczekaj!
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_06"); //Masz przy sobie map� tego miejsca?
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_07"); //By�bym ci bardzo wdzi�czny.
    MIS_HarksMap = LOG_RUNNING;

    Log_CreateTopic            (CH4_HarksMap, LOG_MISSION);
    Log_SetTopicStatus       (CH4_HarksMap, LOG_RUNNING);
    B_LogEntry                     (CH4_HarksMap,"Hark, pirat, kt�ry rozbi� si� u wybrze�y Kolonii prosi� mnie o przyniesienie mu mapy tego miejsca.");
};

//========================================
//-----------------> GiveMap
//========================================

INSTANCE DIA_Pirat1_GiveMap (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 4;
   condition    = DIA_Pirat1_GiveMap_Condition;
   information  = DIA_Pirat1_GiveMap_Info;
   permanent	= FALSE;
   description	= "Mam map�.";
};

FUNC INT DIA_Pirat1_GiveMap_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_helpju))
    && (Npc_HasItems (other, ItWrWorldmap) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_GiveMap_Info()
{
    AI_Output (other, self ,"DIA_Pirat1_GiveMap_15_01"); //Mam map�.
    AI_Output (self, other ,"DIA_Pirat1_GiveMap_03_02"); //Dzi�ki. W nagrod� mo�esz wzi�� sobie ten str�j pirata.
    B_LogEntry                     (CH4_HarksMap,"Hark otrzyma� swoj� map�.");
    Log_SetTopicStatus       (CH4_HarksMap, LOG_SUCCESS);
    MIS_HarksMap = LOG_SUCCESS;
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
    B_GiveXP (100);
    B_GiveInvItems (other, self, ItWrWorldmap, 1);
    CreateInvItems (other, PiratArmor,1);
    AI_EquipBestArmor	(other); 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GordonQuest
//========================================

INSTANCE DIA_Pirat1_GordonQuest (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 1;
   condition    = DIA_Pirat1_GordonQuest_Condition;
   information  = DIA_Pirat1_GordonQuest_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Gordon.";
};

FUNC INT DIA_Pirat1_GordonQuest_Condition()
{
    if (MIS_NewLocationForPirates == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_GordonQuest_Info()
{
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_01"); //Przysy�a mnie Gordon. Mam znale�� dla was nowe miejsce w Kolonii.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_02"); //Przegl�dam map� od kilku godzin...
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_03"); //Jakie� pomys�y? 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_04"); //Hmmm... W centrum Kolonii znajduje si� wielki ob�z. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_05"); //Na p�nocny-zach�d od niego znajduje si� dosy� rozleg�a dolina. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_06"); //Dalej na zach�d jest w�ska �cie�ka... Jest tam sporo miejsc dobrych na ob�z.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_07"); //Powinni�my tam poszuka�.
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_08"); //Wi�c chod�my!
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_09"); //Chwila! Nie tak pr�dko. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_10"); //Po pierwsze b�dziesz musia� nas tam zaprowadzi� tak, aby�my nie natkn�li si� na oddzia� czerwonych. Kapujesz? 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_11"); //Jak spr�bujesz nas wykorzysta� do walki z tymi bandziorami, to marny tw�j los. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_12"); //A po drugie wyruszymy noc�. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_13"); //Dzie� nie jest dobr� por� na przemieszczanie si� grupki pirat�w po Kolonii pe�nej niebezpiecze�stw.
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_14"); //My�la�em, �e piraci i niebezpiecze�stwa si� ze sob� wi���.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_15"); //Nie zawsze. Czasem lepiej od�o�y� na chwil� rum i kordelas...
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_16"); //No dobra. To o kt�rej wyruszamy?
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_17"); //Przyjd� tutaj dwie godziny przed p�noc�. 
    B_LogEntry                     (CH4_NewLocationForPirates,"Mam zaprowadzi� pirat�w w okolice doliny w kt�rej mieszka Cavalorn, albo mo�e raczej w okolice by�ej �wi�tyni ork�w? Mam si� zjawi� na pla�y dwie godziny przed p�noc�.");
};

//========================================
//-----------------> Start_GoToNewCamp
//========================================

INSTANCE DIA_Pirat1_Start_GoToNewCamp (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 1;
   condition    = DIA_Pirat1_Start_GoToNewCamp_Condition;
   information  = DIA_Pirat1_Start_GoToNewCamp_Info;
   permanent	= FALSE;
   description	= "Mo�emy rusza�.";
};

FUNC INT DIA_Pirat1_Start_GoToNewCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_GordonQuest))
    && (kapitel < 5)
	&& (Wld_IsTime     (22,00,00,30))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_Start_GoToNewCamp_Info()
{
    AI_Output (other, self ,"DIA_Pirat1_Start_GoToNewCamp_15_01"); //Mo�emy rusza�.
    AI_Output (self, other ,"DIA_Pirat1_Start_GoToNewCamp_03_02"); //Dobra. Idziemy za tob�. 
    AI_Output (self, other ,"DIA_Pirat1_Start_GoToNewCamp_03_03"); //Prowad�, tylko uwa�aj na czerwonych!
    B_LogEntry                     (CH4_NewLocationForPirates,"Najwy�sza pora zaprowadzi� pirat�w do nowego miejsca. Musz� uwa�a� na Stra�nik�w. ");
    AI_StopProcessInfos	(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FOLLOW");
	NON_5026_Pirat3.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_5026_Pirat3, "FOLLOW");
	NON_5027_Pirat4.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_5027_Pirat4, "FOLLOW");
	NON_5025_Pirat2.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_5025_Pirat2, "FOLLOW");
};

//========================================
//-----------------> ThisPlace
//========================================

INSTANCE DIA_Pirat1_ThisPlace (C_INFO)
{
   npc          = NON_5024_Pirat1;
   nr           = 2;
   condition    = DIA_Pirat1_ThisPlace_Condition;
   information  = DIA_Pirat1_ThisPlace_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat1_ThisPlace_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_Start_GoToNewCamp))
    && (kapitel < 5)
    && (Npc_GetDistToWP (self, "OW_PATH_043") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat1_ThisPlace_Info()
{
	AI_GotoNpc(self,hero);
    AI_Output (self, other ,"DIA_Pirat1_ThisPlace_03_01"); //Zaczekaj! Wydaj� mi si�, �e to miejsce b�dzie dobre.
    AI_Output (other, self ,"DIA_Pirat1_ThisPlace_15_02"); //Niegdy� mieli tu swoje obozowisko Stra�nicy ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pirat1_ThisPlace_03_03"); //Teraz nikogo tu nie ma. Zostaniemy tutaj. 
	self.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "morok");
	NON_5026_Pirat3.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5026_Pirat3, "morok");
	NON_5027_Pirat4.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5027_Pirat4, "morok");
	NON_5025_Pirat2.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5025_Pirat2, "morok");
	    B_LogEntry                     (CH4_NewLocationForPirates,"Uda�o mi si� zaprowadzi� pirat�w w odpowiednie miejsce. Bardzo spodoba�o im si� dawne obozowisko Stra�nika Moroka. ");
    Log_SetTopicStatus       (CH4_NewLocationForPirates, LOG_SUCCESS);
    MIS_NewLocationForPirates = LOG_SUCCESS;

    B_GiveXP (500);
};

