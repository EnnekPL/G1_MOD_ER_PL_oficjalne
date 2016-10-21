// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Shrike_Exit (C_INFO)
{
	npc			= ORG_842_Shrike;
	nr			= 999;
	condition	= DIA_Shrike_Exit_Condition;
	information	= DIA_Shrike_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Shrike_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Shrike_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Shrike_Hello (C_INFO)
{
	npc				= Org_842_Shrike;
	nr				= 1;
	condition		= DIA_Shrike_Hello_Condition;
	information		= DIA_Shrike_Hello_Info;
	important		= 0;
	description		= "Co s�ycha�?";
};

FUNC int  DIA_Shrike_Hello_Condition()
{	
	return 1;
};

func void  DIA_Shrike_Hello_Info()
{
	AI_Output (other, self,"DIA_Shrike_Hello_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Shrike_Hello_07_01"); //Spadaj!
	
	
	//FMTaken = TRUE; 			//******* TEST - Helper f�r Sld-KdW Aufnahme!!! *********************  
	//Kapitel = 4;

	
	AI_StopProcessInfos	( self );
};


// ****************************************
// 					GetLost
// ****************************************

instance DIA_Shrike_GetLost (C_INFO)
{
	npc				= Org_842_Shrike;
	nr				= 1;
	condition		= DIA_Shrike_GetLost_Condition;
	information		= DIA_Shrike_GetLost_Info;
	important		= 0;
	description		= "Zejd� mi z oczu.";
};

FUNC int  DIA_Shrike_GetLost_Condition()
{	
	if	self.aivar[AIV_WASDEFEATEDBYSC]
	{
		return 1;
	};
};

func void  DIA_Shrike_GetLost_Info()
{
	AI_Output (other, self,"DIA_Shrike_GetLost_15_00"); //Zejd� mi z oczu.
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Porozmawiamy innym razem!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,	"Uda�o mi si� przekona� Krzykacza, �eby poszuka� sobie innej chaty. Ciekawe, co teraz powie mi Gorn.");
	B_GiveXP			(XP_KickedShrike);

	AI_StopProcessInfos	(self);	
	
	Npc_ExchangeRoutine(self, "start");
};

//========================================
//-----------------> KARCZMA_1
//========================================

INSTANCE DIA_Shrike_KARCZMA_1 (C_INFO)
{
   npc          = ORG_842_Shrike;
   nr           = 1;
   condition    = DIA_Shrike_KARCZMA_1_Condition;
   information  = DIA_Shrike_KARCZMA_1_Info;
   permanent	= FALSE;
   description	= "Zn�w si� spotykamy. Widz�, �e pr�nujesz!";
};

FUNC INT DIA_Shrike_KARCZMA_1_Condition()
{
    if (Wld_IsTime     (20,30,02,30)) && (Npc_GetDistToWP (self, "KRZYKACZ_KARCZMA") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrike_KARCZMA_1_Info()
{
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_1_15_01"); //Zn�w si� spotykamy. Widz�, �e pr�nujesz!
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_1_03_02"); //Zostaw mnie w spokoju! Czemu si� tak mnie uczepi�e�?
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_1_15_03"); //Bardzo nie lubi�, gdy kto� pcha si� tam gdzie nie trzeba. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_1_03_04"); //Da�e� mi ju� nauczk�. Starczy tej paplaniny. 
};

//========================================
//-----------------> KARCZMA_2
//========================================

INSTANCE DIA_Shrike_KARCZMA_2 (C_INFO)
{
   npc          = ORG_842_Shrike;
   nr           = 2;
   condition    = DIA_Shrike_KARCZMA_2_Condition;
   information  = DIA_Shrike_KARCZMA_2_Info;
   permanent	= FALSE;
   description	= "Jak to jest by� jednym ze Szkodnik�w?";
};

FUNC INT DIA_Shrike_KARCZMA_2_Condition()
{
    if  (Wld_IsTime     (20,30,02,30)) && (Npc_GetDistToWP (self, "KRZYKACZ_KARCZMA") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrike_KARCZMA_2_Info()
{
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_2_15_01"); //Jak to jest by� jednym ze Szkodnik�w?
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_02"); //To zosta� jednym z nas, jak ci� to ciekawi. Nie ka�demu pasuje takie �ycie, wi�c nie mam zamiaru ci doradza�. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_03"); //Sporo Szkodnik�w jest kurierami, Cronos cz�sto wysy�a ich z listami do innych mag�w w Kolonii. Reszta �yje z napad�w lub radzi sobie w inny spos�b.  
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_04"); //Je�li jeste� �yciow� oferm�, to nie masz tu czego szuka�! Na moj� przyja�� te� nie licz. 
};

//========================================
//-----------------> KARCZMA_3
//========================================

INSTANCE DIA_Shrike_KARCZMA_3 (C_INFO)
{
   npc          = ORG_842_Shrike;
   nr           = 3;
   condition    = DIA_Shrike_KARCZMA_3_Condition;
   information  = DIA_Shrike_KARCZMA_3_Info;
   permanent	= FALSE;
   description	= "Czemu tak bardzo nie lubisz Najemnik�w?";
};

FUNC INT DIA_Shrike_KARCZMA_3_Condition()
{
    if (Wld_IsTime     (20,30,02,30)) && (Npc_GetDistToWP (self, "KRZYKACZ_KARCZMA") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrike_KARCZMA_3_Info()
{
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_3_15_01"); //Czemu tak bardzo nie lubisz Najemnik�w?
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_3_03_02"); //Bo Najemnicy i Szkodnicy to dwa r�ne �wiaty? Ty chyba naprawd� nie wiesz co si� dzieje w tym Obozie. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_3_03_03"); //A teraz zejd� mi oczu. Nie chc� mi si� wi�cej z tob� gada�.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FINGERS
//========================================

INSTANCE DIA_Shrike_FINGERS (C_INFO)
{
   npc          = ORG_842_Shrike;
   nr           = 3;
   condition    = DIA_Shrike_FINGERS_Condition;
   information  = DIA_Shrike_FINGERS_Info;
   permanent	= FALSE;
   description	= "Gdzie jest R�czka?";
};

FUNC INT DIA_Shrike_FINGERS_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Dexter_ReadBook))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrike_FINGERS_Info()
{
    AI_Output (other, self ,"DIA_Shrike_FINGERS_15_01"); //Gdzie jest R�czka? 
    AI_Output (self, other ,"DIA_Shrike_FINGERS_03_02"); //Sk�d mam to wiedzie�?
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_03"); //Przesta� kr�ci�. Wiem, �e planowali�cie skok na karczm� Silasa. 
    AI_Output (self, other ,"DIA_Shrike_FINGERS_03_04"); //Nie licz, �e ci� we�miemy. Nie potrzebne nam pi�te ko�o u wozu!
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_05"); //Nie interesuje mnie wasza kradzie�. Po prostu szukam R�czki. 
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_06"); //Wyobra� sobie, kurde, �e ja te�. 
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_07"); //Zaczynasz mnie dra�ni�. 
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_08"); //M�wi� powa�nie! Nie wiem, gdzie jest. Wkr�tce si� porz�dnie �ciemni, a my nawet nie dopracowali�my planu. Niepotrzebnie kr�ci� si� po obozie. Jak go kto� rozpozna to ma przesrane. 
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_09"); //Jak dobrze go znasz? Mia� tu jakich� wrog�w?
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_10"); //Pewnie, �e mia� tu wrog�w. Jest Cieniem, do cholery! Ca�y Ob�z to jego wrogowie! Lepiej szybko go znajd�. Ostatnio widzia�em go jak rozmawia� z Klinem.
	
	B_LogEntry                     (CH2_FingersSeeking,"Od Krzykacza dowiedzia�em si�, �e skok na karczm� Silasa jeszcze si� nie odby�, a R�czka ostatnio kr�ci� si� po Nowym Obozie. Pono� rozmawia� z Klinem.");
	
	Npc_ExchangeRoutine (ORG_850_Wedge,"hanargument");
	Npc_ExchangeRoutine (STT_331_Fingers,"hanargument");
};