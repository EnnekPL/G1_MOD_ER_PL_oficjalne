//*****************************************
// SPRAWDZONE - GOTHIC1210
//*****************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hakan_EXIT(C_INFO)
{
	npc             = NOV_1375_Hakan;
	nr              = 999;
	condition	= DIA_Hakan_EXIT_Condition;
	information	= DIA_Hakan_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hakan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hakan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Hakan_HELLO5 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 5;
   condition    = DIA_Hakan_HELLO5_Condition;
   information  = DIA_Hakan_HELLO5_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_Hakan_HELLO5_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Hakan_HELLO5_15_01"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Hakan_HELLO5_03_02"); //Ca³y dzieñ spêdzam przy kotle. Jestem obozowym kucharzem.
    AI_Output (other, self ,"DIA_Hakan_HELLO5_15_03"); //Mo¿esz mi sprzedaæ jakieœ przepisy?
    AI_Output (self, other ,"DIA_Hakan_HELLO5_03_04"); //Jasne, jeœli tylko mi zap³acisz.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Hakan z Obozu Bractwa sprzeda mi przepisy.");//fix
};
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Hakan_TRADE (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 5;
   condition    = DIA_Hakan_TRADE_Condition;
   information  = DIA_Hakan_TRADE_Info;
   permanent	= true;
   trade 		= true;
   description	= "Co oferujesz?";
};

FUNC INT DIA_Hakan_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Hakan_TRADE_15_01"); //Co oferujesz?
    AI_Output (self, other ,"DIA_Hakan_TRADE_03_02"); //Sam zobacz.
};

//========================================
//-----------------> LIFE
//========================================
INSTANCE DIA_Hakan_LIFE (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 3;
   condition    = DIA_Hakan_LIFE_Condition;
   information  = DIA_Hakan_LIFE_Info;
   permanent	= FALSE;
   description	= "Jak wygl¹da ¿ycie tutaj?";
};

FUNC INT DIA_Hakan_LIFE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_LIFE_Info()
{
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_01"); //Jak wygl¹da ¿ycie tutaj?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_02"); //Ka¿dy ma swoje obowi¹zki na rzecz spo³ecznoœci i powinien je sumiennie wykonywaæ. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_03"); //Tak siê niestety nie dzieje. Wielu Nowicjuszy liczy, ¿e ktoœ odwali robotê za nich.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_04"); //To g³ównie przybysze z innych obozów maj¹cy niewiele wspólnego ze Œni¹cym.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_05"); //Problem le¿y w tym, ¿e u nas nie ma solidnego nadzoru. Tutaj nikt ciê nie spierze, jeœli nie przyjdziesz do pracy.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_06"); //Z tym jest najwiêcej k³opotów.
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_08"); //Gdy przepracujesz ca³y dzieñ, masz prawo odpoczywaæ drugi dzieñ. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_09"); //Jednak stanowisko pracy mo¿na opuœciæ wy³¹cznie, je¿eli ktoœ przyjdzie ciê zmieniæ. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_10"); //Czêsto zmiennik po prostu nie przychodzi...
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_11"); //Baalowie nie reaguj¹?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_12"); //Rzadko, na ogó³ wol¹ siê nie wtr¹caæ w sprawy Nowicjuszy. Zreszt¹, ma³o co mówi¹.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Hakan_HELLO4 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 4;
   condition    = DIA_Hakan_HELLO4_Condition;
   information  = DIA_Hakan_HELLO4_Info;
   permanent	= FALSE;
   description	= "Czy ka¿dy w Bractwie wierzy w Œni¹cego?";
};

FUNC INT DIA_Hakan_HELLO4_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Hakan_HELLO4_15_01"); //Czy ka¿dy w Bractwie wierzy w Œni¹cego?
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_02"); //Tak w³aœciwie to nie. Wielu przybywa do Obozu, szukaj¹c ³atwego ¿ycia.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_03"); //Nienawidzê takich wyzyskiwaczy. My pracujemy, a oni licz¹, ¿e dostan¹ coœ za darmo. 
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_04"); //Uwa¿am, ¿e ka¿dy Nowicjusz powinien przejœæ próbê wiary, ot co.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_05"); //Z pewnoœci¹ by³oby mniej chêtnych. 
    AI_Output (other, self ,"DIA_Hakan_HELLO4_15_06"); //Rozumiem, ¿e aby do³¹czyæ do Obozu nie trzeba siê zbytnio wysilaæ.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_07"); //W sumie to wystarczy dobrze k³amaæ. Baalowie praktycznie ca³y czas s¹ odurzeni zielem.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_08"); //Nie potrafi¹ oceniæ, jakie kto ma intencje. 
};

///////////////////////////////////////////////
// Choroba
///////////////////////////////////////////////

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Hakan_QUEST1 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 3;
   condition    = DIA_Hakan_QUEST1_Condition;
   information  = DIA_Hakan_QUEST1_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Baal Orun.";
};

FUNC INT DIA_Hakan_QUEST1_Condition()
{
    if (MIS_SickHakan == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hakan_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Hakan_QUEST1_15_01"); //Przysy³a mnie Baal Orun. Lepiej siê ju¿ czujesz?
	if (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
    AI_Output (self, other ,"DIA_Hakan_QUEST1_03_02"); //(milczy)
	AI_Output (other, self ,"DIA_Hakan_QUEST1_15_03"); //Mo¿esz siê do mnie odezwaæ. Odpowiedz na pytanie.
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_04"); //Mistrzu, nie wiem dlaczego siê do mnie odezwa³eœ, ale...
	}
	else
	{
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_05"); //Wci¹¿ czujê siê Ÿle. Opadam z si³y. Coraz trudniej mi oddychaæ. 
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_06"); //Potrzebujê lekarstwa, inaczej zginê.
	};
	B_LogEntry               (CH4_SickHakan,"Hakan jest w kiepskim stanie. Muszê przygotowaæ dla niego lekarstwo, inaczej zginie. O ile dobrze pamiêtam, receptura na nie znajdowa³a siê w skrzyni Kaloma wraz z almanachem i kamieniem ogniskuj¹cym.");
};

//========================================
//-----------------> LEKI
//========================================

INSTANCE DIA_Hakan_LEKI (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 4;
   condition    = DIA_Hakan_LEKI_Condition;
   information  = DIA_Hakan_LEKI_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie lek!";
};

FUNC INT DIA_Hakan_LEKI_Condition()
{
    if (MIS_SickHakan == LOG_RUNNING)
    && (Npc_HasItems (other, ItMis_Drug) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hakan_LEKI_Info()
{
    AI_Output (other, self ,"DIA_Hakan_LEKI_15_01"); //Mam twoje lek!
    AI_Output (self, other ,"DIA_Hakan_LEKI_15_02"); //Wielkie dziêki. To moja ostatnia nadzieja. 
	B_GiveInvItems (other, self, ItMis_Drug, 1);
	AI_UseItem (self, ItMis_Drug);
	AI_Output (self, other ,"DIA_Hakan_LEKI_15_03"); //Pójdê teraz odpocz¹æ. Jestem ci bardzo wdziêczny.
	
    B_LogEntry               (CH4_SickHakan,"Odda³em lekarstwo Hakanowi. Mam nadziejê, ¿e jego stan siê poprawi. ");
    Log_SetTopicStatus       (CH4_SickHakan, LOG_SUCCESS);
    MIS_SickHakan = LOG_SUCCESS;
    B_GiveXP (XP_SickLumberjack);
};

//////////////////////////////////////////////////////////////////
// Seria zabójstw w Bractwie
///////////////////////////////////////////////////////////////////

//========================================
//-----------------> ABOUT_KILLER
//========================================

INSTANCE DIA_Hakan_ABOUT_KILLER (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 4;
   condition    = DIA_Hakan_ABOUT_KILLER_Condition;
   information  = DIA_Hakan_ABOUT_KILLER_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o ostatnim morderstwie?";
};

FUNC INT DIA_Hakan_ABOUT_KILLER_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Hakan_ABOUT_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Hakan_ABOUT_KILLER_15_01"); //Wiesz coœ o ostatnim morderstwie?
    AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_02"); //Chyba jako jedyny odwa¿y³em siê pójœæ i obejrzeæ cia³o.
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_03"); //Zauwa¿y³em, ¿e w trupa jest coœ wbite. Cholera, ten goœæ to jakiœ szaleniec. 
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_04"); //Zabójstwo z zimn¹ krwi¹, krwi¹, która sp³ywa³a mu po rêkach. Coœ okropnego. 
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_05"); //Zrozumiem wiele... walkê, wojnê, zemstê, ale to?
	AI_Output (other, self ,"DIA_Hakan_ABOUT_KILLER_15_06"); //Masz jakieœ podejrzenia?
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_07"); //Nie. Talas ca³y czas bredzi, ¿e to na pewno Harlok. Nie wierzê w to. By³em w jego chacie i nie znalaz³em nic podejrzanego.
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_08"); //Zreszt¹ ten goœæ siê trochê uspokoi³. Po tej ca³ej aferze z przywo³aniem spokornia³. 
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_09"); //Mówi³ mi, ¿e wiele rzeczy ¿a³uje. Ufam mu. Spróbuj znaleŸæ inny punkt zaczepienia. W koñcu zginê³o trzech ludzi, a nie jeden.
	AI_Output (self, other ,"DIA_Hakan_ABOUT_KILLER_03_10"); //Przeszukaj inne miejsca zbrodni i dopiero wtedy wyci¹gnij wnioski. Na razie nie masz nic konkretnego.
	B_LogEntry               (CH3_PsionicCSI,"Hakan powiedzia³ mi, ¿e w cia³o ofiary wbito jakieœ przedmioty. Zdradzi³ te¿, ¿e Talas podejrzewa o zabójstwo Harloka. On siê z tym zdaniem jednak w ogóle nie zgadza. Poradzi³ mi, aby zbada³ inne miejsca zbrodni i dopiero wtedy wyci¹gn¹³ wnioski.");
};