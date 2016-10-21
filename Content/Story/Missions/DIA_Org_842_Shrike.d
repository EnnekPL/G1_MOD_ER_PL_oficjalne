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
	description		= "Co s³ychaæ?";
};

FUNC int  DIA_Shrike_Hello_Condition()
{	
	return 1;
};

func void  DIA_Shrike_Hello_Info()
{
	AI_Output (other, self,"DIA_Shrike_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Shrike_Hello_07_01"); //Spadaj!
	
	
	//FMTaken = TRUE; 			//******* TEST - Helper für Sld-KdW Aufnahme!!! *********************  
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
	description		= "ZejdŸ mi z oczu.";
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
	AI_Output (other, self,"DIA_Shrike_GetLost_15_00"); //ZejdŸ mi z oczu.
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Porozmawiamy innym razem!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,	"Uda³o mi siê przekonaæ Krzykacza, ¿eby poszuka³ sobie innej chaty. Ciekawe, co teraz powie mi Gorn.");
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
   description	= "Znów siê spotykamy. Widzê, ¿e pró¿nujesz!";
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
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_1_15_01"); //Znów siê spotykamy. Widzê, ¿e pró¿nujesz!
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_1_03_02"); //Zostaw mnie w spokoju! Czemu siê tak mnie uczepi³eœ?
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_1_15_03"); //Bardzo nie lubiê, gdy ktoœ pcha siê tam gdzie nie trzeba. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_1_03_04"); //Da³eœ mi ju¿ nauczkê. Starczy tej paplaniny. 
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
   description	= "Jak to jest byæ jednym ze Szkodników?";
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
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_2_15_01"); //Jak to jest byæ jednym ze Szkodników?
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_02"); //To zostañ jednym z nas, jak ciê to ciekawi. Nie ka¿demu pasuje takie ¿ycie, wiêc nie mam zamiaru ci doradzaæ. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_03"); //Sporo Szkodników jest kurierami, Cronos czêsto wysy³a ich z listami do innych magów w Kolonii. Reszta ¿yje z napadów lub radzi sobie w inny sposób.  
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_2_03_04"); //Jeœli jesteœ ¿yciow¹ oferm¹, to nie masz tu czego szukaæ! Na moj¹ przyjaŸñ te¿ nie licz. 
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
   description	= "Czemu tak bardzo nie lubisz Najemników?";
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
    AI_Output (other, self ,"DIA_Shrike_KARCZMA_3_15_01"); //Czemu tak bardzo nie lubisz Najemników?
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_3_03_02"); //Bo Najemnicy i Szkodnicy to dwa ró¿ne œwiaty? Ty chyba naprawdê nie wiesz co siê dzieje w tym Obozie. 
    AI_Output (self, other ,"DIA_Shrike_KARCZMA_3_03_03"); //A teraz zejdŸ mi oczu. Nie chcê mi siê wiêcej z tob¹ gadaæ.
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
   description	= "Gdzie jest R¹czka?";
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
    AI_Output (other, self ,"DIA_Shrike_FINGERS_15_01"); //Gdzie jest R¹czka? 
    AI_Output (self, other ,"DIA_Shrike_FINGERS_03_02"); //Sk¹d mam to wiedzieæ?
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_03"); //Przestañ krêciæ. Wiem, ¿e planowaliœcie skok na karczmê Silasa. 
    AI_Output (self, other ,"DIA_Shrike_FINGERS_03_04"); //Nie licz, ¿e ciê weŸmiemy. Nie potrzebne nam pi¹te ko³o u wozu!
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_05"); //Nie interesuje mnie wasza kradzie¿. Po prostu szukam R¹czki. 
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_06"); //WyobraŸ sobie, kurde, ¿e ja te¿. 
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_07"); //Zaczynasz mnie dra¿niæ. 
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_08"); //Mówiê powa¿nie! Nie wiem, gdzie jest. Wkrótce siê porz¹dnie œciemni, a my nawet nie dopracowaliœmy planu. Niepotrzebnie krêci³ siê po obozie. Jak go ktoœ rozpozna to ma przesrane. 
	AI_Output (other, self ,"DIA_Shrike_FINGERS_15_09"); //Jak dobrze go znasz? Mia³ tu jakichœ wrogów?
	AI_Output (self, other ,"DIA_Shrike_FINGERS_03_10"); //Pewnie, ¿e mia³ tu wrogów. Jest Cieniem, do cholery! Ca³y Obóz to jego wrogowie! Lepiej szybko go znajdŸ. Ostatnio widzia³em go jak rozmawia³ z Klinem.
	
	B_LogEntry                     (CH2_FingersSeeking,"Od Krzykacza dowiedzia³em siê, ¿e skok na karczmê Silasa jeszcze siê nie odby³, a R¹czka ostatnio krêci³ siê po Nowym Obozie. Ponoæ rozmawia³ z Klinem.");
	
	Npc_ExchangeRoutine (ORG_850_Wedge,"hanargument");
	Npc_ExchangeRoutine (STT_331_Fingers,"hanargument");
};