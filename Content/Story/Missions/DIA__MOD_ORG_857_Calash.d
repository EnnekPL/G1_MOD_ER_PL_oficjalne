// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Calash_EXIT(C_INFO)
{
	npc             = ORG_857_Calash;
	nr              = 999;
	condition	= DIA_Calash_EXIT_Condition;
	information	= DIA_Calash_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Calash_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Calash_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Calash_HELLO1 (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_HELLO1_Condition;
   information  = DIA_Calash_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Calash_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Calash_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_02"); //Jestem myœliwym, tylko nie takim zwyk³ym! Polujê na ziemne trolle.
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_03"); //Ta kopalnia to jedyne miejsce, w którym siê je spotyka.
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_04"); //A Wolna Kopalnia?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_05"); //Mimo i¿ jestem cz³onkiem Obozu, nie mogê tam wejœæ. Zreszt¹ nie mia³bym po co. Podobno Najemnicy pozbyli siê ju¿ wszystkich trolli. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Calash_HELLO2 (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 2;
   condition    = DIA_Calash_HELLO2_Condition;
   information  = DIA_Calash_HELLO2_Info;
   permanent	= FALSE;
   description	= "Uda³o ci siê spotkaæ jakiegoœ trolla?";
};

FUNC INT DIA_Calash_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_01"); //Uda³o ci siê spotkaæ jakiegoœ trolla?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_02"); //Tutaj? Pewnie, ¿e tak! Jest ich co najmniej kilka... Ponoæ jeden ukrywa siê w szybie na dnie kopalni.
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_03"); //Czemu na niego nie zapolujesz?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_04"); //Trolle ziemne s¹ s³absze ni¿ ich krewniacy z powierzchni, jednak dalej stanowi¹ zagro¿enie nawet dla doœwiadczonego ³owcy.
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_05"); //Potrzebujê jakiegoœ wsparcia, kogoœ, kto by mnie ubezpiecza³ i os³ania³. 
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_06"); //Mo¿e ty zechcia³byœ pomóc?
};

//========================================
//-----------------> HelpAndMission
//========================================

INSTANCE DIA_Calash_HelpAndMission (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 3;
   condition    = DIA_Calash_HelpAndMission_Condition;
   information  = DIA_Calash_HelpAndMission_Info;
   permanent	= FALSE;
   description	= "Mo¿liwe, ¿e chcê ci pomóc.";
};

FUNC INT DIA_Calash_HelpAndMission_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_HelpAndMission_Info()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_01"); //Mo¿liwe, ¿e chcê ci pomóc.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_02"); //To œwietnie. Mam nadziejê, ¿e masz jak¹œ dobr¹ broñ ze sob¹. Zardzewia³ym mieczem nie przebijesz ich skóry. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_03"); //Ziemne trolle s¹ niezwykle wra¿liwe na ogieñ. Mo¿esz to wykorzystaæ. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_04"); //Kupi³em w Starym Obozie kilka zwojów z czarami ognia. Móg³bym ci je daæ. 
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_05"); //A co je¿eli nie potrafiê siê nimi pos³u¿yæ?
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_06"); //Hmm... W Starym Obozie mo¿na spotkaæ kurierów Magów Ognia.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_07"); //Ponoæ ucz¹ podstaw magii podró¿ników. Pomagaj¹ zwiêkszyæ energiê magiczn¹, czy coœ tam... Nie znam siê. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_08"); //Tak czy inaczej, mo¿e pora na szkolenie? Jestem gotów na ciebie poczekaæ. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_11"); //To jak? Wchodzisz w to?

    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Dobra, wchodzê w to!", DIA_Calash_HelpAndMission_Pomoge);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Niestety nie mogê ci pomóc.", DIA_Calash_HelpAndMission_NiePomagam);
};

FUNC VOID DIA_Calash_HelpAndMission_Pomoge()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_Pomoge_15_01"); //Niech bêdzie. Pomogê ci. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_02"); //Œwietnie. Tak jak mówi³em, mo¿esz iœæ do Starego Obozu siê poduczyæ. No chyba, ¿e nie potrzebujesz. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_03"); //Wróæ, gdy bêdziesz gotowy. Tylko niech ci to nie zajmie ca³ego ¿ycia!
    MIS_TrollGroundHunting = LOG_RUNNING;

    Log_CreateTopic            (CH1_TrollGroundHunting, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TrollGroundHunting, LOG_RUNNING);
    B_LogEntry                     (CH1_TrollGroundHunting,"Mam pomóc Calashowi w upolowaniu ziemnego trolla. Myœliwy zaproponowa³ mi, ¿e da mi kilka zwojów z czarami ognia, na które ziemne trolle s¹ bardzo wra¿liwe.");
    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Calash_HelpAndMission_NiePomagam()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_NiePomagam_15_01"); //Niestety nie mogê ci pomóc.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_NiePomagam_03_02"); //Szkoda.
    Info_ClearChoices		(DIA_Calash_HelpAndMission); 
   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QuestStart
//========================================

INSTANCE DIA_Calash_QuestStart (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_QuestStart_Condition;
   information  = DIA_Calash_QuestStart_Info;
   permanent	= FALSE;
   description	= "Uwa¿am, ¿e jestem gotowy.";
};

FUNC INT DIA_Calash_QuestStart_Condition()
{
    if (MIS_TrollGroundHunting == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_QuestStart_Info()
{
    AI_Output (other, self ,"DIA_Calash_QuestStart_15_01"); //Uwa¿am, ¿e jestem gotowy.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_02"); //Œwietnie. Opowiem ci, co i jak. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_03"); //Naszym celem jest samica ziemnego trolla. Jest s³absza od samca, ale w jej okolicy mo¿e siê krêciæ jej potomstwo. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_05"); //B¹dŸ ostro¿ny. Oto obiecane zwoje.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_06"); //Trzymaj siê blisko. Idziemy! 

    CreateInvItems (self, ItArScrollFirebolt, 2);
    B_GiveInvItems (self, other, ItArScrollFirebolt, 2);
    CreateInvItems (self, ItArScrollFireball, 5);
    B_GiveInvItems (self, other, ItArScrollFireball, 5);
    CreateInvItems (self, ItArScrollFirestorm, 2);
    B_GiveInvItems (self, other, ItArScrollFirestorm, 2);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "guide");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Win
//========================================

INSTANCE DIA_Calash_Win (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_Win_Condition;
   information  = DIA_Calash_Win_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Calash_Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_QuestStart))
    && (Npc_GetDistToWP (self, "OM_TROLL2") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_Win_Info()
{
    AI_Output (self, other ,"DIA_Calash_Win_03_01"); //Uda³o siê! 
    AI_Output (other, self ,"DIA_Calash_Win_15_02"); //Dobra robota.
    AI_Output (self, other ,"DIA_Calash_Win_03_03"); //Teraz muszê zebraæ trofea z tego olbrzyma.
    AI_Output (self, other ,"DIA_Calash_Win_03_04"); //W nagrodê mo¿esz zachowaæ resztê zwojów.
    AI_Output (self, other ,"DIA_Calash_Win_03_05"); //WeŸ te¿ te skórê. Zdj¹³em j¹ niegdyœ z b³otnego wê¿a.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    CreateInvItems (self, ItAt_Swampshark_01, 1);
    B_GiveInvItems (self, other, ItAt_Swampshark_01, 1);
    B_LogEntry                     (CH1_TrollGroundHunting,"Troll zosta³ upolowany. W nagrodê otrzyma³em skórê wê¿a b³otnego i trochê rudy. ");
    Log_SetTopicStatus       (CH1_TrollGroundHunting, LOG_SUCCESS);
    MIS_TrollGroundHunting = LOG_SUCCESS;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "start");
    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoldMine
//========================================

INSTANCE DIA_Calash_GoldMine (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 4;
   condition    = DIA_Calash_GoldMine_Condition;
   information  = DIA_Calash_GoldMine_Info;
   permanent	= FALSE;
   description	= "Poszukujê kogoœ do ochrony kopalni z³ota.";
};

FUNC INT DIA_Calash_GoldMine_Condition()
{ 
    if (MIS_GoldMine == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_GoldMine_Info()
{
    AI_Output (other, self ,"DIA_Calash_GoldMine_15_01"); //Poszukujê kogoœ do ochrony kopalni z³ota.
    if (MIS_TrollGroundHunting == LOG_RUNNING)
    {
        AI_Output (self, other ,"DIA_Calash_GoldMine_03_02"); //Jeszcze nie pozbyliœmy siê trolla ziemnego, a ty ju¿ szukasz nastêpnej roboty.
        AI_Output (other, self ,"DIA_Calash_GoldMine_15_03"); //No dobra. To weŸmy siê najpierw za tego trolla, a potem ci wszystko wyjaœniê.
		DIA_Calash_GoldMine.permanent = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Calash_GoldMine_03_04"); //Kopalni z³ota?
        AI_Output (other, self ,"DIA_Calash_GoldMine_15_05"); //Tak. Nie wiem, gdzie dok³adnie jest.
        AI_Output (other, self ,"DIA_Calash_GoldMine_15_06"); //Stary kopacz Will znalaz³ ¿y³ê z³ota w Kolonii.
        AI_Output (other, self ,"DIA_Calash_GoldMine_15_07"); //Mam znaleŸæ ludzi do pracy  w jego kopalni.
        AI_Output (self, other ,"DIA_Calash_GoldMine_03_08"); //Mam wydobywaæ z³oto? Nie jestem górnikiem.
        AI_Output (other, self ,"DIA_Calash_GoldMine_15_09"); //Wola³bym ¿ebyœ pe³ni³ funkcje ochroniarza.
        AI_Output (self, other ,"DIA_Calash_GoldMine_03_10"); //Hmm... Rozumiem. Nie chcecie nieproszonych goœci.
        AI_Output (self, other ,"DIA_Calash_GoldMine_03_11"); //Pomogê wam. I tak nic mnie tu nie trzyma. 
        B_LogEntry                     (CH2_GoldMine,"Calash bêdzie pracowa³ w kopalni z³ota jako ochroniarz.  ");
		DIA_Calash_GoldMine.permanent = false;
		Calash_gototavern = true;
        B_GiveXP (400);
    };
    AI_StopProcessInfos	(self);
};
