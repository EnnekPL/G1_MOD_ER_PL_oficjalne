//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Silas_EXIT(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 999;
	condition	= DIA_Silas_EXIT_Condition;
	information	= DIA_Silas_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Hehler(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Hehler_Condition;
	information	= DIA_Silas_Hehler_Info;
	permanent	= 0;
	description = "Jak leci?";
};                       

FUNC INT DIA_Silas_Hehler_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Hehler_Info()
{	
	AI_Output (other, self,"DIA_Silas_Hehler_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Silas_Hehler_06_01"); //Œwietnie! Sprzedajemy tu nasz¹ ry¿ówkê za parê bry³ek rudy.
	AI_Output (self, other,"DIA_Silas_Hehler_06_02"); //Da siê z tego wy¿yæ. W koñcu co innego mog¹ ch³opcy zrobiæ z ciê¿ko zarobion¹ rud¹?
	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Silas sprzedaje ry¿ówkê w karczmie na jeziorze.");
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Trade(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Trade_Condition;
	information	= DIA_Silas_Trade_Info;
	permanent	= 1; //1.24
	description = "Chcê siê napiæ.";
	trade		= 1;
};                       

FUNC INT DIA_Silas_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Trade_Info()
{	
	AI_Output (other, self,"DIA_Silas_Trade_15_00"); //Chcê siê napiæ.
	AI_Output (self, other,"DIA_Silas_Trade_06_01"); //Nie ma nic za darmo.
};

//========================================
//-----------------> killFingers
//========================================

INSTANCE DIA_Silas_killFingers (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_killFingers_Condition;
   information  = DIA_Silas_killFingers_Info;
   permanent	= FALSE;
   description	= "(zapytaj o kradzie¿)";
};

FUNC INT DIA_Silas_killFingers_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Dexter_ReadBook))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_killFingers_Info()
{
    AI_Output (other, self ,"DIA_Silas_killFingers_15_01"); //Hej!
    AI_Output (self, other ,"DIA_Silas_killFingers_03_02"); //Ry¿ówki?
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Przychodzê tu  w innej sprawie.
    AI_Output (self, other ,"DIA_Silas_killFingers_03_03"); //Czego chcesz?
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Z pewnych Ÿróde³ dowiedzia³em siê, ¿e ktoœ planuje okraœæ twoj¹ karczmê. Tak siê sk³ada, ¿e zale¿y mi, aby znaleŸæ tê osobê. 
    AI_Output (self, other ,"DIA_Silas_killFingers_03_04"); //To niedorzeczne! Ciekawe jak ktoœ mia³by wynieœæ cokolwiek z mojej karczmy? Jedyna droga wyjœcia z pomieszczeñ z alkoholem prowadzi przez drzwi za mn¹. 
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Mam rozumieæ, ¿e ostatnio nie by³o tu nikogo obcego i z ¿adnym z³odziejem siê nie rozprawi³eœ? 
	AI_Output (self, other ,"DIA_Silas_killFingers_03_05"); //No tak. Gdyby ktoœ mnie okrad³ ju¿ dawno p³ywa³by po jeziorze i robi³ za ¿arcie dla ryb. 
	AI_Output (self, other ,"DIA_Silas_killFingers_03_06"); //Jeœli jakiœ sukinsyn faktycznie chce mnie okraœæ to niech przychodzi. Odr¹biê mu ³eb!
	
    B_LogEntry                     (CH2_FingersSeeking,"Delikatnie zapyta³em Silasa, czy ktoœ go ostatnio przypadkiem nie okrad³. Szodnik stwierdzi³, ¿e nie dzia³o siê nic podejrzanego. Jeœli mówi prawdê, oznacza to, ¿e R¹czka jeszcze nie przyst¹pi³ do kradzie¿y. Byæ mo¿e jest jeszcze nadzieja, ¿eby odnaleŸæ go w jednym kawa³ku. Kolejn¹ wskazówk¹ z notatnika jest jego domniemany wspólnik - niejaki Krzykacz. ");

    B_GiveXP (100);
};
//========================================
//-----------------> Robota
//========================================

INSTANCE DIA_Silas_Robota (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Robota_Condition;
   information  = DIA_Silas_Robota_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Silas_Robota_Condition()
{
    if (Kapitel == 2)
    && ((Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_ORG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Robota_Info()
{
    AI_Output (self, other ,"DIA_Silas_Robota_03_01"); //Czekaj, nie chcesz mo¿e zarobiæ kilku bry³ek rudy?
    AI_Output (other, self ,"DIA_Silas_Robota_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Silas_Robota_03_03"); //Jakiœ sukinsyn wieczorami kr¹¿y wokó³ karczmy. Mam wra¿enie, ¿e chce siê tu zakraœæ, gdy wszyscy bêd¹ spaæ.
    AI_Output (self, other ,"DIA_Silas_Robota_03_04"); //Przypilnujesz dzisiejszej nocy moj¹ gospodê. Te dwa obiboki przy wejœciu s¹ bezu¿yteczni.
    AI_Output (self, other ,"DIA_Silas_Robota_03_05"); //Co ty na to?

    Info_ClearChoices		(DIA_Silas_Robota);
    Info_AddChoice		(DIA_Silas_Robota, "Nie jestem zainteresowany.", DIA_Silas_Robota_Nie);
    Info_AddChoice		(DIA_Silas_Robota, "Czemu nie?", DIA_Silas_Robota_TAk);
};

FUNC VOID DIA_Silas_Robota_Nie()
{
    AI_Output (other, self ,"DIA_Silas_Robota_Nie_15_01"); //Nie jestem zainteresowany.
    AI_Output (self, other ,"DIA_Silas_Robota_Nie_03_02"); //No trudno, mo¿e Butch bêdzie chcia³.
    Info_ClearChoices		(DIA_Silas_Robota);
    //AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Silas_Robota_TAk()
{
    AI_Output (other, self ,"DIA_Silas_Robota_TAk_15_01"); //Czemu nie?
    AI_Output (self, other ,"DIA_Silas_Robota_TAk_03_02"); //Stój wiêc na czatach i jeœli spotkasz kogoœ obcego, pozb¹dŸ siê go.
    AI_Output (other, self ,"DIA_Silas_Robota_TAk_15_03"); //W porz¹dku.
	AI_Output (self, other ,"DIA_Silas_Robota_TAk_03_04"); //Tylko nie przesiaduj w œrodku. ObchodŸ karczmê woko³o przez ca³¹ noc. I nie rób za du¿o ha³asu, bo ucieknie. 
    MIS_KillFingers = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_331_Fingers,"zlo");
    Log_CreateTopic         (CH1_KillFingers, LOG_MISSION);
    Log_SetTopicStatus      (CH1_KillFingers, LOG_RUNNING);
    B_LogEntry              (CH1_KillFingers,"Silas kaza³ mi dziœ w nocy pilnowaæ swojej karczmy. Podobno noc¹ ktoœ siê wokó³ niej krêci.");
    Info_ClearChoices		(DIA_Silas_Robota);
}; 

 //========================================
//-----------------> KillPaluchy
//========================================

INSTANCE DIA_Silas_KillPaluchy (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_KillPaluchy_Condition;
   information  = DIA_Silas_KillPaluchy_Info;
   permanent	= FALSE;
   description	= "Ktoœ faktycznie tu by³.";
};

FUNC INT DIA_Silas_KillPaluchy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_InTavern))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_KillPaluchy_Info()
{
    AI_Output (other, self ,"DIA_Silas_KillPaluchy_15_01"); //Ktoœ faktycznie tu by³.
    AI_Output (self, other ,"DIA_Silas_KillPaluchy_03_02"); //I mam rozumieæ, ¿e wiêcej siê tu nie pojawi.
    AI_Output (other, self ,"DIA_Silas_KillPaluchy_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Silas_KillPaluchy_03_05"); //Dobra robota. WeŸ to jako wynagrodzenie.
    B_LogEntry                     (CH1_KillFingers,"Silas by³ bardzo zadowolony z informacji o pozbyciu siê z³odzieja.");
    Log_SetTopicStatus       (CH1_KillFingers, LOG_SUCCESS);
    MIS_KillFingers = LOG_SUCCESS;

    B_GiveXP (180);
    AI_StopProcessInfos	(self);
	
	CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> WhoSellElixier
//========================================

INSTANCE DIA_Silas_WhoSellElixier (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_WhoSellElixier_Condition;
   information  = DIA_Silas_WhoSellElixier_Info;
   permanent	= FALSE;
   description	= "Wiesz, gdzie mogê kupiæ eliksir z pe³zaczy?";
};

FUNC INT DIA_Silas_WhoSellElixier_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_WhoSellElixier_Info()
{
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_01"); //Wiesz, gdzie mogê kupiæ eliksir z pe³zaczy?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_02"); //Taka informacja bêdzie sporo kosztowaæ.
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_04"); //75 bry³ek rudy. Nie wygl¹dasz mi na biedaka.
};

//========================================
//-----------------> Elixir
//========================================

INSTANCE DIA_Silas_Elixir (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 2;
   condition    = DIA_Silas_Elixir_Condition;
   information  = DIA_Silas_Elixir_Info;
   permanent	= TRUE;
   description	= "Kto sprzedaje eliksir?";
};

FUNC INT DIA_Silas_Elixir_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Silas_WhoSellElixier)) && (HeroKnowCipherSellElixier == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Elixir_Info()
{
    AI_Output (other, self ,"DIA_Silas_Elixir_15_01"); //Kto sprzedaje eliksir?
    if (Npc_HasItems (hero, ItMiNugget)>=75)
    {
        AI_Output (self, other ,"DIA_Silas_Elixir_03_02"); //To Cipher. Znajdziesz go w karczmie. Handluje te¿ zielem, ale bierze tylko du¿e partie. 
        B_GiveInvItems (other, self, ItMiNugget, 75);
		HeroKnowCipherSellElixier = true;
		B_LogEntry     (CH3_SellElixer,"Od Silasa dowiedzia³em siê, ¿e Cipher handluje eliksirem.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Silas_Elixir_03_03"); //Nie ma rudy. Nie ma informacji.
        AI_StopProcessInfos	(self);
    };
};

//========================================
//-----------------> Cyrus_Dostawa
//========================================
var int silas_day;
INSTANCE DIA_Silas_Cyrus_Dostawa (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Cyrus_Dostawa_Condition;
   information  = DIA_Silas_Cyrus_Dostawa_Info;
   permanent	= true;
   description	= "Mam dostawê od Cyrusa.";
};

FUNC INT DIA_Silas_Cyrus_Dostawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_HELLO3))
    && (silas_day != wld_getday())
    && (Npc_HasItems (other, dostawa_cyrusa) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Cyrus_Dostawa_Info()
{
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_01"); //Mam dostawê od Cyrusa.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_02"); //Œwietnie. Pewnie mam ci zap³aciæ za dostarczenie?
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_03"); //By³oby mi³o. 
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_04"); //Trzymaj. Bêdziesz mia³ na piwo. 
    CreateInvItems (self, ItMiNugget, 25);
    B_GiveInvItems (self, other, ItMiNugget, 25);
    silas_day = wld_getday();
    AI_StopProcessInfos	(self);
    B_GiveInvItems (other, self, dostawa_cyrusa, 1);
};

