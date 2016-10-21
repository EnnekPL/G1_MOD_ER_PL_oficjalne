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
	AI_Output (self, other,"DIA_Silas_Hehler_06_01"); //�wietnie! Sprzedajemy tu nasz� ry��wk� za par� bry�ek rudy.
	AI_Output (self, other,"DIA_Silas_Hehler_06_02"); //Da si� z tego wy�y�. W ko�cu co innego mog� ch�opcy zrobi� z ci�ko zarobion� rud�?
	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Silas sprzedaje ry��wk� w karczmie na jeziorze.");
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
	description = "Chc� si� napi�.";
	trade		= 1;
};                       

FUNC INT DIA_Silas_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Trade_Info()
{	
	AI_Output (other, self,"DIA_Silas_Trade_15_00"); //Chc� si� napi�.
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
   description	= "(zapytaj o kradzie�)";
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
    AI_Output (self, other ,"DIA_Silas_killFingers_03_02"); //Ry��wki?
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Przychodz� tu  w innej sprawie.
    AI_Output (self, other ,"DIA_Silas_killFingers_03_03"); //Czego chcesz?
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Z pewnych �r�de� dowiedzia�em si�, �e kto� planuje okra�� twoj� karczm�. Tak si� sk�ada, �e zale�y mi, aby znale�� t� osob�. 
    AI_Output (self, other ,"DIA_Silas_killFingers_03_04"); //To niedorzeczne! Ciekawe jak kto� mia�by wynie�� cokolwiek z mojej karczmy? Jedyna droga wyj�cia z pomieszcze� z alkoholem prowadzi przez drzwi za mn�. 
	AI_Output (other, self ,"DIA_Silas_killFingers_15_03"); //Mam rozumie�, �e ostatnio nie by�o tu nikogo obcego i z �adnym z�odziejem si� nie rozprawi�e�? 
	AI_Output (self, other ,"DIA_Silas_killFingers_03_05"); //No tak. Gdyby kto� mnie okrad� ju� dawno p�ywa�by po jeziorze i robi� za �arcie dla ryb. 
	AI_Output (self, other ,"DIA_Silas_killFingers_03_06"); //Je�li jaki� sukinsyn faktycznie chce mnie okra�� to niech przychodzi. Odr�bi� mu �eb!
	
    B_LogEntry                     (CH2_FingersSeeking,"Delikatnie zapyta�em Silasa, czy kto� go ostatnio przypadkiem nie okrad�. Szodnik stwierdzi�, �e nie dzia�o si� nic podejrzanego. Je�li m�wi prawd�, oznacza to, �e R�czka jeszcze nie przyst�pi� do kradzie�y. By� mo�e jest jeszcze nadzieja, �eby odnale�� go w jednym kawa�ku. Kolejn� wskaz�wk� z notatnika jest jego domniemany wsp�lnik - niejaki Krzykacz. ");

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
    AI_Output (self, other ,"DIA_Silas_Robota_03_01"); //Czekaj, nie chcesz mo�e zarobi� kilku bry�ek rudy?
    AI_Output (other, self ,"DIA_Silas_Robota_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Silas_Robota_03_03"); //Jaki� sukinsyn wieczorami kr��y wok� karczmy. Mam wra�enie, �e chce si� tu zakra��, gdy wszyscy b�d� spa�.
    AI_Output (self, other ,"DIA_Silas_Robota_03_04"); //Przypilnujesz dzisiejszej nocy moj� gospod�. Te dwa obiboki przy wej�ciu s� bezu�yteczni.
    AI_Output (self, other ,"DIA_Silas_Robota_03_05"); //Co ty na to?

    Info_ClearChoices		(DIA_Silas_Robota);
    Info_AddChoice		(DIA_Silas_Robota, "Nie jestem zainteresowany.", DIA_Silas_Robota_Nie);
    Info_AddChoice		(DIA_Silas_Robota, "Czemu nie?", DIA_Silas_Robota_TAk);
};

FUNC VOID DIA_Silas_Robota_Nie()
{
    AI_Output (other, self ,"DIA_Silas_Robota_Nie_15_01"); //Nie jestem zainteresowany.
    AI_Output (self, other ,"DIA_Silas_Robota_Nie_03_02"); //No trudno, mo�e Butch b�dzie chcia�.
    Info_ClearChoices		(DIA_Silas_Robota);
    //AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Silas_Robota_TAk()
{
    AI_Output (other, self ,"DIA_Silas_Robota_TAk_15_01"); //Czemu nie?
    AI_Output (self, other ,"DIA_Silas_Robota_TAk_03_02"); //St�j wi�c na czatach i je�li spotkasz kogo� obcego, pozb�d� si� go.
    AI_Output (other, self ,"DIA_Silas_Robota_TAk_15_03"); //W porz�dku.
	AI_Output (self, other ,"DIA_Silas_Robota_TAk_03_04"); //Tylko nie przesiaduj w �rodku. Obchod� karczm� woko�o przez ca�� noc. I nie r�b za du�o ha�asu, bo ucieknie. 
    MIS_KillFingers = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_331_Fingers,"zlo");
    Log_CreateTopic         (CH1_KillFingers, LOG_MISSION);
    Log_SetTopicStatus      (CH1_KillFingers, LOG_RUNNING);
    B_LogEntry              (CH1_KillFingers,"Silas kaza� mi dzi� w nocy pilnowa� swojej karczmy. Podobno noc� kto� si� wok� niej kr�ci.");
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
   description	= "Kto� faktycznie tu by�.";
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
    AI_Output (other, self ,"DIA_Silas_KillPaluchy_15_01"); //Kto� faktycznie tu by�.
    AI_Output (self, other ,"DIA_Silas_KillPaluchy_03_02"); //I mam rozumie�, �e wi�cej si� tu nie pojawi.
    AI_Output (other, self ,"DIA_Silas_KillPaluchy_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Silas_KillPaluchy_03_05"); //Dobra robota. We� to jako wynagrodzenie.
    B_LogEntry                     (CH1_KillFingers,"Silas by� bardzo zadowolony z informacji o pozbyciu si� z�odzieja.");
    Log_SetTopicStatus       (CH1_KillFingers, LOG_SUCCESS);
    MIS_KillFingers = LOG_SUCCESS;

    B_GiveXP (180);
    AI_StopProcessInfos	(self);
	
	CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
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
   description	= "Wiesz, gdzie mog� kupi� eliksir z pe�zaczy?";
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
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_01"); //Wiesz, gdzie mog� kupi� eliksir z pe�zaczy?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_02"); //Taka informacja b�dzie sporo kosztowa�.
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_04"); //75 bry�ek rudy. Nie wygl�dasz mi na biedaka.
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
        AI_Output (self, other ,"DIA_Silas_Elixir_03_02"); //To Cipher. Znajdziesz go w karczmie. Handluje te� zielem, ale bierze tylko du�e partie. 
        B_GiveInvItems (other, self, ItMiNugget, 75);
		HeroKnowCipherSellElixier = true;
		B_LogEntry     (CH3_SellElixer,"Od Silasa dowiedzia�em si�, �e Cipher handluje eliksirem.");
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
   description	= "Mam dostaw� od Cyrusa.";
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
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_01"); //Mam dostaw� od Cyrusa.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_02"); //�wietnie. Pewnie mam ci zap�aci� za dostarczenie?
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_03"); //By�oby mi�o. 
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_04"); //Trzymaj. B�dziesz mia� na piwo. 
    CreateInvItems (self, ItMiNugget, 25);
    B_GiveInvItems (self, other, ItMiNugget, 25);
    silas_day = wld_getday();
    AI_StopProcessInfos	(self);
    B_GiveInvItems (other, self, dostawa_cyrusa, 1);
};

