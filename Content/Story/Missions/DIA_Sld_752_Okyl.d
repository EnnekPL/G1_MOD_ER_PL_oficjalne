
//-------------------- Intro ---------------------------

instance DIA_SLD_752_OKYL_INTRO (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INTRO_CONDITION;
	information		= DIA_SLD_752_OKYL_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_752_OKYL_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 250)
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Nie jeste� jednym z moich ludzi! Czego tu szukasz?!
};

//-------------------- Exit -----------------------------

instance DIA_SLD_752_OKYL_EXIT (C_INFO)
{
	nr				= 999;
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_EXIT_CONDITION;
	information		= DIA_SLD_752_OKYL_EXIT_INFO;
	important		= 0;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Musz� ju� i��.
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02"); //To nie zawracaj mi g�owy!
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_752_OKYL_UMSEHEN (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_UMSEHEN_CONDITION;
	information		= DIA_SLD_752_OKYL_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Tylko si� tu troch� rozejrz�.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Tylko si� tu troch� rozejrz�.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Tylko nie pr�buj rozrabia� w Kotle, bo trafisz do piachu szybciej ni� my�lisz.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jeste�?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jestem Okyl. To ja rozkazuj� w Kotle.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia�em rzuci� okiem na kopalni�.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chcia�em rzuci� okiem na kopalni�.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Och, chcia�e� sobie zrobi� ma�y spacer po kopalni, co?
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Widz�, �e nie masz poj�cia co si� tutaj dzieje. Nikt nie mo�e wej�� do kopalni bez mojego pozwolenia.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//I zapami�taj sobie: ktokolwiek wejdzie do str��wki bez mojej zgody, b�dzie martwym cz�owiekiem.
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Udzielisz mi pozwolenia?";
};

FUNC int DIA_SLD_752_OKYL_PERMIT_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_PERMIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Udzielisz mi pozwolenia?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Nawet ci� nie znam. Dlaczego mia�bym ci� wpu�ci� do kopalni?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//A teraz spadaj st�d, mam du�o roboty.
	AI_StopProcessInfos (self);
};


//----------------------- Trader -------------------------
var int Log_OkylTrade;
instance DIA_SLD_752_OKYL_TRADE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_TRADE_CONDITION;
	information		= DIA_SLD_752_OKYL_TRADE_INFO;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description 	= "Chc� pohandlowa�!";
};

FUNC int DIA_SLD_752_OKYL_TRADE_CONDITION()
{
	if (Npc_KnowsInfo(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_TRADE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_TRADE_INFO_15_01");//Chc� pohandlowa�!
	AI_Output (self, other,"DIA_SLD_752_OKYL_TRADE_INFO_11_02");//Mam tu troch� rzeczy z ostatniej dostawy.
	if (Log_OkylTrade == false)
	{
	Log_OkylTrade = true;
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Okyl handluje r�no�ciami. Znajd� go w Kotle.");
	};

};

// ************************************************************
// 							Okyl = Lehrer
// ************************************************************
	var int Okyl_Merke_STR;
	var int Okyl_Merke_DEX;
	var int log_Okyltrain;
// ************************************************************

INSTANCE Info_Okyl_Teach(C_INFO)
{
	npc			= SLD_752_OKYL;
	nr			= 100;
	condition	= Info_Okyl_Teach_Condition;
	information	= Info_Okyl_Teach_Info;
	permanent	= 1;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC INT Info_Okyl_Teach_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_SFB)
	{
		return 1;
	};
};

FUNC VOID Info_Okyl_Teach_Info()
{	
	if	(log_Okyltrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,	"Okyl mo�e mi pom�c w zwi�kszeniu mojej si�y.");
		log_Okyltrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Okyl_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,hero,"Info_Okyl_Teach_11_01"); //Mog� ci pokaza�, jak mocniej uderza�.
	
	Okyl_Merke_STR = hero.attribute[ATR_STRENGTH];
	Okyl_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
	
	
};

func void Info_Okyl_Teach_BACK()
{
	if (Okyl_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_00"); //Jeste� teraz o wiele silniejszy.
	};
	if (Okyl_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos�ugiwa� si� �ukiem i kusz�.
	};
	AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_02"); //Wr�� nied�ugo. Musisz si� jeszcze wiele nauczy�.
	Info_ClearChoices	(Info_Okyl_Teach);
};

func void Info_Okyl_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};


//========================================
//-----------------> KRET
//========================================

INSTANCE DIA_OKYL_KRET (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_KRET_Condition;
   information  = DIA_OKYL_KRET_Info;
   permanent	= FALSE;
   description	= "Jestem Kretem!";
};

FUNC INT DIA_OKYL_KRET_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_KRET_Info()
{
    AI_Output (other, self ,"DIA_OKYL_KRET_15_01"); //Jestem Kretem!
    AI_Output (self, other ,"DIA_OKYL_KRET_03_02"); //To bierz kilof i ruszaj si�!
};

//========================================
//-----------------> SZKODA
//========================================

INSTANCE DIA_OKYL_SZKODA (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 2;
   condition    = DIA_OKYL_SZKODA_Condition;
   information  = DIA_OKYL_SZKODA_Info;
   permanent	= FALSE;
   description	= "A co je�eli chcia�bym by� Szkodnikiem?";
};

FUNC INT DIA_OKYL_SZKODA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_KRET))
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_SZKODA_Info()
{
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_01"); //A co je�eli chcia�bym by� Szkodnikiem?
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_02"); //D�ugo jeszcze b�dziesz zawraca� mi dup�?
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_03"); //Dop�ki nie zlecisz mi jakiego� zadania, kt�re wykonam i b�d� m�g� by� Szkodnikiem.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_04"); //Wrzucili ci� tu, bo w�asna matka ci� nie chcia�a?
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_05"); //Dlaczego mia�aby mnie nie chcie�?
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_06"); //Bo jeste� wkurzaj�cy.
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_07"); //Dobra. Przejd� do rzeczy.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_08"); //Chcesz by� Szkodnikiem, tak? 
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_09"); //Ostatnio doniesiono mi, �e w g�rach kr�ci� si� jaki� Cie�.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_10"); //Mo�liwe, �e Stary Ob�z odkry� tajn� �cie�k� do Kopalni.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_11"); //Nie podoba mi si� to!
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_12"); //Znajd� tego Cienia i ucisz raz na zawsze.
	//wpis do questa 
    MIS_OkylQuest = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_2046_Flint,"start");
    Log_CreateTopic          (CH1_OkylQuest, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OkylQuest, LOG_RUNNING);
    B_LogEntry               (CH1_OkylQuest,"Okyl zleci� mi odnalezienie i pozbycie si� pewnego Cienia. Uwa�a, �e wolno�� Kopalni mo�e by� zagro�ona, gdy Stra�nicy odkryj� tajn� �cie�k�. Ciena mam szuka� w g�rach, w okolicy Kot�a.");
	//wpis globalny
  	B_LogEntry               (CH1_AwansJakoKret,"Okyl zleci� mi pozbycie si� Cienia, kt�ry w�szy w g�rach.");
};

//========================================
//-----------------> KillHim
//========================================

INSTANCE DIA_OKYL_KillHim (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_KillHim_Condition;
   information  = DIA_OKYL_KillHim_Info;
   permanent	= FALSE;
   description	= "Zabi�em tego Cienia.";
};

FUNC INT DIA_OKYL_KillHim_Condition()
{
    if (MIS_OkylQuest == LOG_RUNNING)
    && (Npc_IsDead(STT_2046_Flint))
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_KillHim_Info()
{
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_01"); //Zabi�em tego Cienia.
    AI_Output (self, other ,"DIA_OKYL_KillHim_03_02"); //To nie by�o zbyt trudne? Co?
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_03"); //Masz racj�. Ko�czy�o mu si� jedzenie.
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_04"); //Czy teraz mog� zosta� Szkodnikiem?
    AI_Output (self, other ,"DIA_OKYL_KillHim_03_05"); //Troch� zrobi�e�, ale pewnie b�dziesz musia� jeszcze troch� popracowa� dla Laresa.
    B_LogEntry                     (CH1_OkylQuest,"Zabi�em Cienia, kt�ry zgubi� si� w g�rach. Je�eli nadal interesuje mnie bycie Szkodnikiem, to musz� pogada� z Laresem.");
    Log_SetTopicStatus       (CH1_OkylQuest, LOG_SUCCESS);
    MIS_OkylQuest = LOG_SUCCESS;
    B_GiveXP (XP_KillFlint);
	B_LogEntry               (CH1_AwansJakoKret,"Wykona�em zlecenie od Okyla. Skoro jestem ju� Kretem, mieszka�cy innych Oboz�w b�d� patrze� na mnie niech�tnie. Mog� si� jeszcze troch� pokr�ci� w okolicy, ale pr�dzej czy p�niej b�d� musia� i�� do Laresa.");
};

//========================================
//-----------------> Lie
//========================================

INSTANCE DIA_OKYL_Lie (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_Lie_Condition;
   information  = DIA_OKYL_Lie_Info;
   permanent	= FALSE;
   description	= "Flint nie �yje!";
};

FUNC INT DIA_OKYL_Lie_Condition()
{
    if (MIS_SayOkylFlintDead == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_Lie_Info()
{
    AI_Output (other, self ,"DIA_OKYL_Lie_15_01"); //Flint nie �yje!
    AI_Output (self, other ,"DIA_OKYL_Lie_03_02"); //Co? Jaki Flint? To jaki� pirat?
    AI_Output (other, self ,"DIA_OKYL_Lie_15_03"); //Nie. To cz�owiek z g�r, kt�rego kaza�e� mi zabi�.
    AI_Output (other, self ,"DIA_OKYL_Lie_15_04"); //Wykona�em zadanie.
    if  (Npc_GetTrueGuild (hero) == GIL_GRD) ||  (Npc_GetTrueGuild (hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_OKYL_Lie_03_05"); //Przecie� jeste� cz�onkiem Starego Obozu.
        AI_Output (self, other ,"DIA_OKYL_Lie_03_06"); //Chcesz mnie oszuka�?
        AI_Output (self, other ,"DIA_OKYL_Lie_03_07"); //Nie tak �atwo kolego. 
        AI_Output (self, other ,"DIA_OKYL_Lie_03_08"); //Je�eli my�lisz, �e zaniesiesz informacj� o skr�cie do Starego Obozu, to si� grubo mylisz. 
        B_LogEntry                     (CH1_SayOkylFlintDead,"Mog�em przyj�� do Okyla wcze�niej. Zorientowa� si�, �e chce go oszuka�. Musz� szybko ucieka�... ");
        Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_FAILED);
        MIS_SayOkylFlintDead = LOG_FAILED;
		PrintScreen	("Anulowano zadanie: Powiedz Okylowi, �e Flint nie �yje! ", 1,-1,"font_new_10_red.tga",2);	
        AI_StopProcessInfos	(self);
        Npc_SetPermAttitude (self, ATT_HOSTILE);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
PrintScreen	("Anulowano zadanie: Powiedz Okylowi, �e Flint nie �yje! ", 1,-1,"font_new_10_red.tga",2);	
    }
    else
    {
        AI_Output (self, other ,"DIA_OKYL_Lie_03_09"); //�wietna robota! Gdyby Stra�nicy wpadli na ten skr�t, by�oby po nas.
        B_LogEntry                     (CH1_SayOkylFlintDead,"Powiedzia�em Okylowi, �e Flint nie �yje. G�upi Najemnik niczego nie podejrzewa�.");
        Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_SUCCESS);
        MIS_SayOkylFlintDead = LOG_SUCCESS;
//PrintScreen	("Wykonano zadanie: Powiedz  Okylowi, �e Flint nie �yje! ", 1,-1,"FONT_OLD_20_WHITE.TGA",2);
        B_GiveXP (200);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        AI_StopProcessInfos	(self);
    };
};

//========================================
//-----------------> WORK_FIND
//========================================

INSTANCE DIA_OKYL_WORK_FIND (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_WORK_FIND_Condition;
   information  = DIA_OKYL_WORK_FIND_Info;
   permanent	= TRUE;
   description	= "Szukam roboty.";
};

FUNC INT DIA_OKYL_WORK_FIND_Condition()
{
	if (QuestFromOkyl == FALSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_OKYL_WORK_FIND_Info()
{
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_01"); //Szukam roboty.
	if (Npc_GetTrueGuild(hero) != GIL_SLD) || (Npc_GetTrueGuild(hero) != GIL_ORG)
	{
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_02"); //Mam co�, jednak nie zaufam byle komu w tak wa�nej sprawie. 
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_03"); //Wr��, gdy ju� zostaniesz jednym z ludzi Laresa lub Lee. Ha ha ha ha...
	AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_04"); //Co ci� tak bawi?
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_05"); //To raczej niemo�liwe.
	}
	else
	{
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_06"); //Jest jedna rzecz...
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_07"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_08"); //Id� do obozu my�liwych i pow�sz tam troch�. 
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_09"); //Na co konkretnie mam zwr�ci� uwag�?
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_10"); //Na dostawy, kt�re maj� trafia� do naszego obozu. Cyrus ZAWSZE si� sp�nia o kilka dni. Tyle razy mu powtarza�em, �e szybko kurcz� nam si� zasoby.
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_11"); //My�l�, �e on co� kombinuje. Sprawd� to. 
	
	QuestFromOkyl = TRUE;
	
    MIS_Scams = LOG_RUNNING;

    Log_CreateTopic          (CH1_Scams, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Scams, LOG_RUNNING);
    B_LogEntry               (CH1_Scams,"Dostawy zasob�w z obozu my�liwych do Kot�a zawsze si� op�niaj�. Mam ustali� dlaczego Cyrus, mimo pr�b Okyla przysy�a dostawy p�niej.");
	
	};
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_OKYL_HELLO1 (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_HELLO1_Condition;
   information  = DIA_OKYL_HELLO1_Info;
   permanent	= FALSE;
   description	= "Rozpracowa�em Cyrusa.";
};

FUNC INT DIA_OKYL_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalIsidro_INTERESY))
    && (MIS_Scams == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_01"); //Rozpracowa�em Cyrusa.
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_02"); //I co uda�o ci si� ustali�?
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_03"); //Cyrus sprzedaje do Bractwa cz�� towar�w, kt�re obiecuje wam. My�l�, �e sprzedan� cz�� odrabia w kilka dni i dostarcza wam.
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_04"); //Sprawdza�e� paczki? Mo�e dostajecie mniej ni� powinni�cie?
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_05"); //Cholera. Nikomu nigdy nie kaza�em sprawdza� paczek. Ufa�em temu sukinsynowi.
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_06"); //Ju� ja si� zemszcz�.
    B_LogEntry                     (CH1_Scams,"Cyrus od miesi�cy oszukiwa� Okyla dorabiaj�c sobie na boku. Za przekr�ty spotka go kara z r�ki Okyla.");
    Log_SetTopicStatus       (CH1_Scams, LOG_SUCCESS);
    MIS_Scams = LOG_SUCCESS;

    B_GiveXP (300);
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_07"); //Masz tu co� za pomoc. To niez�a bro�. Zarekwirowa�em jednemu z Kret�w.
    AI_StopProcessInfos	(self);
        CreateInvItems (self, Miecz1H11, 1);
    B_GiveInvItems (self, other, Miecz1H11, 1);

};



