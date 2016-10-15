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
    AI_Output (self, other ,"DIA_GuyMine_HELLO1_03_03"); //Wszystko jest nie�le rozwalone. Do tego brakuje nam sprz�tu.
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
   description	= "Jak oceniasz z�o�a rudy?";
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
    AI_Output (other, self ,"DIA_GuyMine_HELLO2_15_01"); //Jak oceniasz z�o�a rudy?
    AI_Output (self, other ,"DIA_GuyMine_HELLO2_03_02"); //No c�. Jest znacznie gorzej ni� chocia�by w Starej Kopalni, ale my�l�, �e wci�� warto tu kopa�. 
    AI_Output (self, other ,"DIA_GuyMine_HELLO2_03_03"); //Jedna ze �cian wydaje si� by� krucha. S�dz�, �e mo�e si� za ni� znajdowa� sporo rudy, kt�rej przez lata nie znaleziono. 
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
   description	= "Jakich sprz�t�w potrzebujecie?";
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
    AI_Output (other, self ,"DIA_GuyMine_Sprzety_15_01"); //Jakich sprz�t�w potrzebujecie?
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_02"); //Przede wszystkim kilof�w. To, co tu mamy jest po prostu �a�osne. Wszystko krzywe, po�amane lub inaczej zniszczone.
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_03"); //Id� do jakiego� kowala, albo sam si� we� za robot�. Nie mamy tu niestety ku�ni. 
    MIS_PickaxesForGuy = LOG_RUNNING;

    Log_CreateTopic            (CH4_PickaxesForGuy, LOG_MISSION);
    Log_SetTopicStatus       (CH4_PickaxesForGuy, LOG_RUNNING);
    B_LogEntry                     (CH4_PickaxesForGuy,"Guy potrzebuje kilof�w do kopalni. Przynajmniej 10 sztuk. ");
    AI_Output (self, other ,"DIA_GuyMine_Sprzety_03_04"); //Przynie� chocia� z 10 tych kilof�w. 
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
    AI_Output (self, other ,"DIA_GuyMine_GiveAxes_03_02"); //�wietnie. Wreszcie b�dziemy mieli czym pracowa�.
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
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_02"); //W sumie to mam do ciebie pro�b�.
    AI_Output (other, self ,"DIA_GuyMine_Pamietniki_15_03"); //Czego potrzebujesz?
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_04"); //Znalaz�em w kopalni kart� starego pami�tnika. My�l�, �e w okolicy jest wi�cej stron. 
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_05"); //Gdyby� tak je znalaz�, dowiedzieliby�my si� czego� wi�cej o tym, co tu zasz�o.
    AI_Output (self, other ,"DIA_GuyMine_Pamietniki_03_06"); //Dobrze. Rozejrz� si�. 
    MIS_OldNotes = LOG_RUNNING;

    Log_CreateTopic            (CH4_OldNotes, LOG_MISSION);
    Log_SetTopicStatus       (CH4_OldNotes, LOG_RUNNING);
    B_LogEntry                     (CH4_OldNotes,"Guy poprosi� mnie o odnalezienie kartek z pami�tnik�w Kopaczy. Wiedza w nich zawarta mog�aby si� nam przyda�. ");
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
   description	= "Mam kartki pami�tnika.";
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
    AI_Output (other, self ,"DIA_GuyMine_OdnalezionyPamietnik_15_01"); //Mam kartki pami�tnika.
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_02"); //Nie zachowa�o si� tego zbyt wiele, jednak powinno wystarczy�. 
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_03"); //Ach, w tej kopalni jest za ma�o �wiat�a.
    AI_Output (self, other ,"DIA_GuyMine_OdnalezionyPamietnik_03_04"); //P�niej nad tym posiedz�. Dzi�ki, ch�opcze. We� to za pomoc.
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
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_03"); //Znalaz�em go w bardzo dobrze zabezpieczonej skrzyni. Luis pom�g� mi rozpracowa� szyfr.
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_04"); //My�l�, �e mo�e ci si� przyda�.
    AI_Output (other, self ,"DIA_GuyMine_REJESTR_15_05"); //Dzi�ki, ch�opcze. Dobrze, �e kto� poza mn� te� tutaj co� robi.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    b_givexp (200);
    B_GiveInvItems (other, self, ItWr_RejestrWydobycia, 1);
    AI_StopProcessInfos	(self);
};



