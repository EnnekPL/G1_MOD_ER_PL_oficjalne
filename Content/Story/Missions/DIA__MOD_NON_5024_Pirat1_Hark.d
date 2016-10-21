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
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_01"); //Nie masz na sobie czerwonego pancerza! Kim jesteœ?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_02"); //Jestem...
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_03"); //Nale¿ysz do tych drani, którzy nas zaatakowali?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_04"); //Kto was napad³?
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_05"); //Ci mê¿czyŸni w czerwonych zbrojach. Pe³no ich siê tu krêci.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_06"); //Gdy nasz statek siê rozbi³ myœleliœmy, ¿e pêdz¹ nam na pomoc.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_07"); //Myliliœmy siê.
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_08"); //To Stra¿nicy ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pirat1_CoTuRobisz_03_09"); //Dlaczego s¹ tacy wœciekli?
    AI_Output (other, self ,"DIA_Pirat1_CoTuRobisz_15_10"); //To d³uga historia.
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
   description	= "Kiedy siê rozbiliœcie?";
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
    AI_Output (other, self ,"DIA_Pirat1_KiedyRozbliscie_15_01"); //Kiedy siê rozbiliœcie?
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_02"); //Wczoraj wieczorem.
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_03"); //Nie znamy tych okolic. Straciliœmy jednego z naszych ludzi.
    AI_Output (self, other ,"DIA_Pirat1_KiedyRozbliscie_03_04"); //Rozbi³ siê o ska³ê, a jego cia³o porwa³o morze.
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
   description	= "Mogê wam jakoœ pomóc?";
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
    AI_Output (other, self ,"DIA_Pirat1_helpju_15_01"); //Mogê wam jakoœ pomóc?
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_02"); //Mnie na razie nie jest potrzebna pomoc.
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_03"); //Mo¿e ktoœ inny ma coœ dla ciebie.
    AI_Output (other, self ,"DIA_Pirat1_helpju_15_04"); //Dobra, wiêc idê zapytaæ.
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_05"); //Zaczekaj!
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_06"); //Masz przy sobie mapê tego miejsca?
    AI_Output (self, other ,"DIA_Pirat1_helpju_03_07"); //By³bym ci bardzo wdziêczny.
    MIS_HarksMap = LOG_RUNNING;

    Log_CreateTopic            (CH4_HarksMap, LOG_MISSION);
    Log_SetTopicStatus       (CH4_HarksMap, LOG_RUNNING);
    B_LogEntry                     (CH4_HarksMap,"Hark, pirat, który rozbi³ siê u wybrze¿y Kolonii prosi³ mnie o przyniesienie mu mapy tego miejsca.");
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
   description	= "Mam mapê.";
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
    AI_Output (other, self ,"DIA_Pirat1_GiveMap_15_01"); //Mam mapê.
    AI_Output (self, other ,"DIA_Pirat1_GiveMap_03_02"); //Dziêki. W nagrodê mo¿esz wzi¹æ sobie ten strój pirata.
    B_LogEntry                     (CH4_HarksMap,"Hark otrzyma³ swoj¹ mapê.");
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
   description	= "Przysy³a mnie Gordon.";
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
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_01"); //Przysy³a mnie Gordon. Mam znaleŸæ dla was nowe miejsce w Kolonii.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_02"); //Przegl¹dam mapê od kilku godzin...
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_03"); //Jakieœ pomys³y? 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_04"); //Hmmm... W centrum Kolonii znajduje siê wielki obóz. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_05"); //Na pó³nocny-zachód od niego znajduje siê dosyæ rozleg³a dolina. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_06"); //Dalej na zachód jest w¹ska œcie¿ka... Jest tam sporo miejsc dobrych na obóz.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_07"); //Powinniœmy tam poszukaæ.
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_08"); //Wiêc chodŸmy!
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_09"); //Chwila! Nie tak prêdko. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_10"); //Po pierwsze bêdziesz musia³ nas tam zaprowadziæ tak, abyœmy nie natknêli siê na oddzia³ czerwonych. Kapujesz? 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_11"); //Jak spróbujesz nas wykorzystaæ do walki z tymi bandziorami, to marny twój los. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_12"); //A po drugie wyruszymy noc¹. 
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_13"); //Dzieñ nie jest dobr¹ por¹ na przemieszczanie siê grupki piratów po Kolonii pe³nej niebezpieczeñstw.
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_14"); //Myœla³em, ¿e piraci i niebezpieczeñstwa siê ze sob¹ wi¹¿¹.
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_15"); //Nie zawsze. Czasem lepiej od³o¿yæ na chwilê rum i kordelas...
    AI_Output (other, self ,"DIA_Pirat1_GordonQuest_15_16"); //No dobra. To o której wyruszamy?
    AI_Output (self, other ,"DIA_Pirat1_GordonQuest_03_17"); //PrzyjdŸ tutaj dwie godziny przed pó³noc¹. 
    B_LogEntry                     (CH4_NewLocationForPirates,"Mam zaprowadziæ piratów w okolice doliny w której mieszka Cavalorn, albo mo¿e raczej w okolice by³ej œwi¹tyni orków? Mam siê zjawiæ na pla¿y dwie godziny przed pó³noc¹.");
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
   description	= "Mo¿emy ruszaæ.";
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
    AI_Output (other, self ,"DIA_Pirat1_Start_GoToNewCamp_15_01"); //Mo¿emy ruszaæ.
    AI_Output (self, other ,"DIA_Pirat1_Start_GoToNewCamp_03_02"); //Dobra. Idziemy za tob¹. 
    AI_Output (self, other ,"DIA_Pirat1_Start_GoToNewCamp_03_03"); //ProwadŸ, tylko uwa¿aj na czerwonych!
    B_LogEntry                     (CH4_NewLocationForPirates,"Najwy¿sza pora zaprowadziæ piratów do nowego miejsca. Muszê uwa¿aæ na Stra¿ników. ");
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
    AI_Output (self, other ,"DIA_Pirat1_ThisPlace_03_01"); //Zaczekaj! Wydajê mi siê, ¿e to miejsce bêdzie dobre.
    AI_Output (other, self ,"DIA_Pirat1_ThisPlace_15_02"); //Niegdyœ mieli tu swoje obozowisko Stra¿nicy ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pirat1_ThisPlace_03_03"); //Teraz nikogo tu nie ma. Zostaniemy tutaj. 
	self.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "morok");
	NON_5026_Pirat3.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5026_Pirat3, "morok");
	NON_5027_Pirat4.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5027_Pirat4, "morok");
	NON_5025_Pirat2.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (NON_5025_Pirat2, "morok");
	    B_LogEntry                     (CH4_NewLocationForPirates,"Uda³o mi siê zaprowadziæ piratów w odpowiednie miejsce. Bardzo spodoba³o im siê dawne obozowisko Stra¿nika Moroka. ");
    Log_SetTopicStatus       (CH4_NewLocationForPirates, LOG_SUCCESS);
    MIS_NewLocationForPirates = LOG_SUCCESS;

    B_GiveXP (500);
};

