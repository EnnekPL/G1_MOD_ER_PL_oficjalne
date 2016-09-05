//////////////////////////////////////////
///////////// ROZDZIA� 4 /////////////////
//////////////////////////////////////////

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Pirat4_EXIT(C_INFO)
{
	npc             = NON_5027_Pirat4;
	nr              = 999;
	condition	= DIA_Pirat4_EXIT_Condition;
	information	= DIA_Pirat4_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Pirat4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pirat4_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Pirat4_HELLO1 (C_INFO)
{
   npc          = NON_5027_Pirat4;
   nr           = 1;
   condition    = DIA_Pirat4_HELLO1_Condition;
   information  = DIA_Pirat4_HELLO1_Info;
   permanent	= FALSE;
   description	= "Hej! Jak tam?";
};

FUNC INT DIA_Pirat4_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Pirat4_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Pirat4_HELLO1_15_01"); //Hej! Jak tam?
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_02"); //Niezbyt dobrze.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_03"); //Du�o s�ysza�em o tym miejscu. Podobno dla bandyt�w z�oto przesta�o mie� jakiekolwiek znaczenie.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_04"); //Walut� Kolonii jest bry�ka rudy.
    AI_Output (other, self ,"DIA_Pirat4_HELLO1_15_05"); //Dok�adnie.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_06"); //To niezbyt dobrze. Mamy jej bardzo ma�o.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_07"); //B�dziemy musieli tu troch� zosta�.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_08"); //Ta przekl�ta Bariera ani my�li opada�.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_09"); //Chcesz co� kupi�? To zapraszam do mnie.
    B_LogEntry                     (GE_TraderOW,"Od Gordona mog� kupi� nieco pirackiego ekwipunku.");
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Pirat4_TRADE (C_INFO)
{
   npc          = NON_5027_Pirat4;
   nr           = 2;
   condition    = DIA_Pirat4_TRADE_Condition;
   information  = DIA_Pirat4_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� mi swoje towary.";
};

FUNC INT DIA_Pirat4_TRADE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat4_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat4_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Pirat4_TRADE_15_01"); //Poka� mi swoje towary.
    AI_Output (self, other ,"DIA_Pirat4_TRADE_03_02"); //A masz rud�?
};

//========================================
//-----------------> Odzyssddaa
//========================================

INSTANCE DIA_Pirat4_Odzyssddaa (C_INFO)
{
   npc          = NON_5027_Pirat4;
   nr           = 1;
   condition    = DIA_Pirat4_Odzyssddaa_Condition;
   information  = DIA_Pirat4_Odzyssddaa_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat4_Odzyssddaa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat4_HELLO1))
    && (Npc_KnowsInfo (hero, DIA_Pirat2_GiveEqZgubione))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat4_Odzyssddaa_Info()
{   
	CreateInvItems (self, ItMiNugget, 55);
    CreateInvItems (self, ItFo_Potion_Health_01, 5);
    CreateInvItems (self, ItFo_Potion_Health_03, 3);
    CreateInvItems (self, ItFoBeer, 12);
    CreateInvItems (self, ItFoWine, 7);
    CreateInvItems (self, ItAt_Waran_01, 1);
    CreateInvItems (self, ItArScrollLight, 5);
    CreateInvItems (self, ItArScrollFireball, 2);
    CreateInvItems (self, ItMi_Stuff_Pipe_01, 4);
    CreateInvItems (self, ItMi_Alchemy_Quicksilver_01, 3);
    AI_Output (self, other ,"DIA_Pirat4_Odzyssddaa_03_01"); //Podobno odzyska�e� nasz ekwipunek. Moja oferta nieco si� teraz poszerzy�a.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MorokCamp
//========================================

INSTANCE DIA_Pirat4_MorokCamp (C_INFO)
{
   npc          = NON_5027_Pirat4;
   nr           = 1;
   condition    = DIA_Pirat4_MorokCamp_Condition;
   information  = DIA_Pirat4_MorokCamp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pirat4_MorokCamp_Condition()
{
    if (MIS_EqAngusa == LOG_SUCCESS)
    && (MIS_MapaRicka == LOG_SUCCESS)
    && (MIS_SearhSkarb == LOG_SUCCESS)
    && (kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat4_MorokCamp_Info()
{
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_01"); //Chwila! Zaczekaj! 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_02"); //Kr�cisz si� tu ju� jaki� czas, a ja wci�� ci� nie znam. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_03"); //To chyba nie jest teraz istotne...
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_04"); //Masz racj�, ch�opcze. C�, bardzo nam pomog�e� przetrwa� w tym niego�cinnym miejscu, ale mam do ciebie jeszcze jedn� pro�b�. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_05"); //Jak�?
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_06"); //Musisz nam pom�c znale�� jakie� dobre miejsce na ob�z. 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_07"); //Na tej pla�y nie jest bezpiecznie. Regularnie zjawiaj� sie tu Stra�nicy, kt�rzy chyba za bardzo si� nami interesuj�. 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_08"); //Pogadaj z Harkiem. Dostarczy�e� mu map�, wi�c razem powinni�cie szybko znale�� dla nas nowe, spokojniejsze miejsce. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_09"); //Zobacz�, co da si� zrobi�.
    MIS_NewLocationForPirates = LOG_RUNNING;

    Log_CreateTopic          (CH4_NewLocationForPirates, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NewLocationForPirates, LOG_RUNNING);
    B_LogEntry               (CH4_NewLocationForPirates,"Gordon poprosi� mnie o jeszcze jedn� przys�ug�. Musz� poszuka� nowego, bezpieczniejszego miejsca dla pirat�w. Powinienem pogada� z Harkiem. Ten go�� wie wszystko o mapach i terenie.  ");
    
};

