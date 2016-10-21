//////////////////////////////////////////
///////////// ROZDZIA£ 4 /////////////////
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
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_03"); //Du¿o s³ysza³em o tym miejscu. Podobno dla bandytów z³oto przesta³o mieæ jakiekolwiek znaczenie.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_04"); //Walut¹ Kolonii jest bry³ka rudy.
    AI_Output (other, self ,"DIA_Pirat4_HELLO1_15_05"); //Dok³adnie.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_06"); //To niezbyt dobrze. Mamy jej bardzo ma³o.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_07"); //Bêdziemy musieli tu trochê zostaæ.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_08"); //Ta przeklêta Bariera ani myœli opadaæ.
    AI_Output (self, other ,"DIA_Pirat4_HELLO1_03_09"); //Chcesz coœ kupiæ? To zapraszam do mnie.
    B_LogEntry                     (GE_TraderOW,"Od Gordona mogê kupiæ nieco pirackiego ekwipunku.");
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
   description	= "Poka¿ mi swoje towary.";
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
    AI_Output (other, self ,"DIA_Pirat4_TRADE_15_01"); //Poka¿ mi swoje towary.
    AI_Output (self, other ,"DIA_Pirat4_TRADE_03_02"); //A masz rudê?
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
    AI_Output (self, other ,"DIA_Pirat4_Odzyssddaa_03_01"); //Podobno odzyska³eœ nasz ekwipunek. Moja oferta nieco siê teraz poszerzy³a.
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
    if (MIS_StevesEquipment == LOG_SUCCESS)
    && (MIS_HarksMap == LOG_SUCCESS)
    && (MIS_TreasureSeeking == LOG_SUCCESS)
    && (kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat4_MorokCamp_Info()
{
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_01"); //Chwila! Zaczekaj! 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_02"); //Krêcisz siê tu ju¿ jakiœ czas, a ja wci¹¿ ciê nie znam. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_03"); //To chyba nie jest teraz istotne...
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_04"); //Masz racjê, ch³opcze. Có¿, bardzo nam pomog³eœ przetrwaæ w tym niegoœcinnym miejscu, ale mam do ciebie jeszcze jedn¹ proœbê. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_05"); //Jak¹?
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_06"); //Musisz nam pomóc znaleŸæ jakieœ dobre miejsce na obóz. 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_07"); //Na tej pla¿y nie jest bezpiecznie. Regularnie zjawiaj¹ sie tu Stra¿nicy, którzy chyba za bardzo siê nami interesuj¹. 
    AI_Output (self, other ,"DIA_Pirat4_MorokCamp_03_08"); //Pogadaj z Harkiem. Dostarczy³eœ mu mapê, wiêc razem powinniœcie szybko znaleŸæ dla nas nowe, spokojniejsze miejsce. 
    AI_Output (other, self ,"DIA_Pirat4_MorokCamp_15_09"); //Zobaczê, co da siê zrobiæ.
    MIS_NewLocationForPirates = LOG_RUNNING;

    Log_CreateTopic          (CH4_NewLocationForPirates, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NewLocationForPirates, LOG_RUNNING);
    B_LogEntry               (CH4_NewLocationForPirates,"Gordon poprosi³ mnie o jeszcze jedn¹ przys³ugê. Muszê poszukaæ nowego, bezpieczniejszego miejsca dla piratów. Powinienem pogadaæ z Harkiem. Ten goœæ wie wszystko o mapach i terenie.  ");
    
};

