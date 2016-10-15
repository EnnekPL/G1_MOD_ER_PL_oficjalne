//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GuyMine_HELLO1 (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 1;
   condition    = DIA_GuyMine_HELLO1_Condition;
   information  = DIA_GuyMine_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak sobie radzicie?";
};

FUNC INT DIA_GuyMine_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_GuyWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_HELLO1_15_01"); //Jak sobie radzicie?
    AI_Output (self, other ,"DIA_GuyMine_HELLO1_03_02"); //Nie ma tragedii, ale przed nami jeszcze sporo roboty. 
    AI_Output (self, other ,"DIA_GuyMine_HELLO1_03_03"); //Wszystko jest nieŸle rozwalone. Do tego brakuje nam sprzêtu.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_GuyMine_HELLO2 (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 2;
   condition    = DIA_GuyMine_HELLO2_Condition;
   information  = DIA_GuyMine_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak oceniasz z³o¿a rudy?";
};

FUNC INT DIA_GuyMine_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GuyMine_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_HELLO2_15_01"); //Jak oceniasz z³o¿a rudy?
    AI_Output (self, other ,"DIA_GuyMine_HELLO2_03_02"); //No có¿. Jest znacznie gorzej ni¿ chocia¿by w Starej Kopalni, ale myœlê, ¿e wci¹¿ warto tu kopaæ. 
    AI_Output (self, other ,"DIA_GuyMine_HELLO2_03_03"); //Jedna ze œcian wydaje siê byæ krucha. S¹dzê, ¿e mo¿e siê za ni¹ znajdowaæ sporo rudy, której przez lata nie znaleziono. 
};

//========================================
//-----------------> Sprzety
//========================================

INSTANCE DIA_GuyMine_Sprzety (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 3;
   condition    = DIA_GuyMine_Sprzety_Condition;
   information  = DIA_GuyMine_Sprzety_Info;
   permanent	= FALSE;
   description	= "Jakich sprzêtów potrzebujecie?";
};

FUNC INT DIA_GuyMine_Sprzety_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GuyMine_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_Sprzety_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_Sprzety_15_01"); //Jakich sprzêtów potrzebujecie?
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_02"); //Przede wszystkim kilofów. To, co tu mamy jest po prostu ¿a³osne. Wszystko krzywe, po³amane lub inaczej zniszczone.
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_03"); //IdŸ do jakiegoœ kowala, albo sam siê weŸ za robotê. Nie mamy tu niestety kuŸni. 
    MIS_PickaxesForGuy = LOG_RUNNING;

    Log_CreateTopic            (CH4_PickaxesForGuy, LOG_MISSION);
    Log_SetTopicStatus       (CH4_PickaxesForGuy, LOG_RUNNING);
    B_LogEntry                     (CH4_PickaxesForGuy,"Guy potrzebuje kilofów do kopalni. Przynajmniej 10 sztuk. ");
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_04"); //Przynieœ chocia¿ z 10 tych kilofów. 
};

//========================================
//-----------------> GiveAxes
//========================================

INSTANCE DIA_GuyMine_GiveAxes (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 4;
   condition    = DIA_GuyMine_GiveAxes_Condition;
   information  = DIA_GuyMine_GiveAxes_Info;
   permanent	= FALSE;
   description	= "Mam kilofy. ";
};

FUNC INT DIA_GuyMine_GiveAxes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GuyMine_Sprzety))
    && (Npc_HasItems (other, ItMwPickaxe) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_GiveAxes_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_GiveAxes_15_01"); //Mam kilofy. 
    AI_Output (self, other ,"DIA_GuyMine_GiveAxes_03_02"); //Œwietnie. Wreszcie bêdziemy mieli czym pracowaæ.
    B_GiveInvItems (other, self, ItMwPickaxe, 10);
    B_LogEntry                     (CH4_PickaxesForGuy,"");
    Log_SetTopicStatus       (CH4_PickaxesForGuy, LOG_SUCCESS);
    MIS_PickaxesForGuy = LOG_SUCCESS;

    B_GiveXP (200);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GuyMine_EXIT(C_INFO)
{
	npc             = VLK_599_GuyMine;
	nr              = 999;
	condition	= DIA_GuyMine_EXIT_Condition;
	information	= DIA_GuyMine_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GuyMine_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GuyMine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



//========================================
//-----------------> Pamietniki
//========================================

INSTANCE DIA_GuyMine_Pamietniki (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 5;
   condition    = DIA_GuyMine_Pamietniki_Condition;
   information  = DIA_GuyMine_Pamietniki_Info;
   permanent	= FALSE;
   description	= "Potrzebna ci jeszcze pomoc?";
};

FUNC INT DIA_GuyMine_Pamietniki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GuyMine_GiveAxes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_Pamietniki_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_Pamietniki_15_01"); //Potrzebna ci jeszcze pomoc?
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_02"); //W sumie to mam do ciebie proœbê.
    AI_Output (other, self ,"DIA_GuyMine_Pamietniki_15_03"); //Czego potrzebujesz?
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_04"); //Znalaz³em w kopalni kartê starego pamiêtnika. Myœlê, ¿e w okolicy jest wiêcej stron. 
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_05"); //Gdybyœ tak je znalaz³, dowiedzielibyœmy siê czegoœ wiêcej o tym, co tu zasz³o.
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_06"); //Dobrze. Rozejrzê siê. 
    MIS_OldNotes = LOG_RUNNING;

    Log_CreateTopic            (CH4_OldNotes, LOG_MISSION);
    Log_SetTopicStatus       (CH4_OldNotes, LOG_RUNNING);
    B_LogEntry                     (CH4_OldNotes,"Guy poprosi³ mnie o odnalezienie kartek z pamiêtników Kopaczy. Wiedza w nich zawarta mog³aby siê nam przydaæ. ");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> OdnalezionyPamietnik
//========================================

INSTANCE DIA_GuyMine_OdnalezionyPamietnik (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 1;
   condition    = DIA_GuyMine_OdnalezionyPamietnik_Condition;
   information  = DIA_GuyMine_OdnalezionyPamietnik_Info;
   permanent	= FALSE;
   description	= "Mam kartki pamiêtnika.";
};

FUNC INT DIA_GuyMine_OdnalezionyPamietnik_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GuyMine_Pamietniki))
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa1) >=1)
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa2) >=1)
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa3) >=1)
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa4) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_OdnalezionyPamietnik_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_OdnalezionyPamietnik_15_01"); //Mam kartki pamiêtnika.
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_02"); //Nie zachowa³o siê tego zbyt wiele, jednak powinno wystarczyæ. 
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_03"); //Ach, w tej kopalni jest za ma³o œwiat³a.
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_04"); //PóŸniej nad tym posiedzê. Dziêki, ch³opcze. WeŸ to za pomoc.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_GiveInvItems (other, self, ItMis_PamietnikGrimesa1, 1);
    B_GiveInvItems (other, self, ItMis_PamietnikGrimesa2, 1);
    B_GiveInvItems (other, self, ItMis_PamietnikGrimesa3, 1);
    B_GiveInvItems (other, self, ItMis_PamietnikGrimesa4, 1);
    Log_SetTopicStatus       (CH4_OldNotes, LOG_SUCCESS);
    MIS_OldNotes = LOG_SUCCESS;

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> REJESTR
//========================================

INSTANCE DIA_GuyMine_REJESTR (C_INFO)
{
   npc          = VLK_599_GuyMine;
   nr           = 1;
   condition    = DIA_GuyMine_REJESTR_Condition;
   information  = DIA_GuyMine_REJESTR_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie pewien stary rejestr.";
};

FUNC INT DIA_GuyMine_REJESTR_Condition()
{
    if (Npc_HasItems (other, ItWr_RejestrWydobycia) >=1)
    && (Npc_KnowsInfo (hero, DIA_Luis_ZAKONCZONE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GuyMine_REJESTR_Info()
{
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_01"); //Mam dla ciebie pewien stary rejestr.
    AI_Output (self, other ,"DIA_GuyMine_REJESTR_03_02"); //Co? Jaki rejestr?
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_03"); //Znalaz³em go w bardzo dobrze zabezpieczonej skrzyni. Luis pomóg³ mi rozpracowaæ szyfr.
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_04"); //Myœlê, ¿e mo¿e ci siê przydaæ.
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_05"); //Dziêki, ch³opcze. Dobrze, ¿e ktoœ poza mn¹ te¿ tutaj coœ robi.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    b_givexp (200);
    B_GiveInvItems (other, self, ItWr_RejestrWydobycia, 1);
    AI_StopProcessInfos	(self);
};



