//poprawione i sprawdzone - Nocturn/g1210

// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Butch_Exit (C_INFO)
{
	npc			= ORG_851_Butch;
	nr			= 999;
	condition	= DIA_Butch_Exit_Condition;
	information	= DIA_Butch_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Butch_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Butch_Hello (C_INFO)
{
	npc				= Org_851_Butch;
	nr				= 1;
	condition		= DIA_Butch_Hello_Condition;
	information		= DIA_Butch_Hello_Info;
	important		= 0;
	description		= "Czeœæ. Kim jesteœ?";
};

FUNC int  DIA_Butch_Hello_Condition()
{	
	return 1;
};

func void  DIA_Butch_Hello_Info()
{
	AI_Output (other, self,"DIA_Butch_Hello_15_00"); //Czeœæ. Kim jesteœ?
	AI_Output (self, other,"DIA_Butch_Hello_13_01"); //Nie twój interes! Nie podoba mi siê twoja gêba!
	AI_StopProcessInfos	( self );
};


//========================================
//-----------------> KlinDed
//========================================

INSTANCE DIA_Butch_KlinDed (C_INFO)
{
   npc          = Org_851_Butch;
   nr           = 1;
   condition    = DIA_Butch_KlinDed_Condition;
   information  = DIA_Butch_KlinDed_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Butch_KlinDed_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_Cheated))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Butch_KlinDed_Info()
{
    AI_Output (self, other ,"DIA_Butch_KlinDed_03_01"); //Twój kole¿ka gryzie teraz ziemiê!
    AI_Output (self, other ,"DIA_Butch_KlinDed_03_02"); //Jak bêdziesz podskakiwa³ tak jak on, to skoñczysz tak samo.
    AI_Output (self, other ,"DIA_Butch_KlinDed_03_03"); //A teraz idŸ precz!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KolegaCHuj
//========================================

INSTANCE DIA_Butch_KolegaCHuj (C_INFO)
{
   npc          = Org_851_Butch;
   nr           = 2;
   condition    = DIA_Butch_KolegaCHuj_Condition;
   information  = DIA_Butch_KolegaCHuj_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Butch_KolegaCHuj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_CatchedConfident))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Butch_KolegaCHuj_Info()
{
    AI_Output (self, other ,"DIA_Butch_KolegaCHuj_03_01"); //Podobno masz coœ do moich ludzi!
    AI_Output (other, self ,"DIA_Butch_KolegaCHuj_15_02"); //Szkoda, ¿e nie wiesz, ¿e robi¹ ci ko³o dupy!
    AI_Output (other, self ,"DIA_Butch_KolegaCHuj_15_03"); //Ten ca³y Sharky kaza³ mi donieœæ na ciebie Klinowi.
    AI_Output (other, self ,"DIA_Butch_KolegaCHuj_15_04"); //W zamian oferowa³ mi 200 bry³ek rudy.
    AI_Output (self, other ,"DIA_Butch_KolegaCHuj_03_05"); //Ju¿ ja siê z nim policzê!
    AI_Output (self, other ,"DIA_Butch_KolegaCHuj_03_06"); //Dziêki. Jesteœ w porz¹dku!
    AI_StopProcessInfos	(self);
	Npc_SetTarget (self,Org_843_Sharky);
    AI_StartState (self,ZS_ATTACK,1,"");
};

const int Butch_TakeQuest	=	1;
const int Butch_RefuseQuest	=	2;
var int Butch_Choice;

//========================================
//-----------------> CzasZaplaty
//========================================

INSTANCE DIA_Butch_CzasZaplaty (C_INFO)
{
   npc          = Org_851_Butch;
   nr           = 1;
   condition    = DIA_Butch_CzasZaplaty_Condition;
   information  = DIA_Butch_CzasZaplaty_Info;
   permanent	= FALSE;
   description	= "Przychodzê po rudê za ciê¿ki pancerz.";
};

FUNC INT DIA_Butch_CzasZaplaty_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_DOSTAWA_LOWCOW))
    && (pancerz_bustera == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Butch_CzasZaplaty_Info()
{
    AI_Output (other, self ,"DIA_Butch_CzasZaplaty_15_01"); //Przychodzê po rudê za ciê¿ki pancerz.
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_03_02"); //Doprawdy? S¹dzisz, ¿e siê ciebie bojê?

    Info_ClearChoices		(DIA_Butch_CzasZaplaty);
    Info_AddChoice		(DIA_Butch_CzasZaplaty, "Nie mam czasu na zabawy. Dawaj rudê, bo po¿a³ujesz.", DIA_Butch_CzasZaplaty_DAJESZ);
    Info_AddChoice		(DIA_Butch_CzasZaplaty, "Czego chcesz za rudê? Dogadajmy siê. Byle szybko.", DIA_Butch_CzasZaplaty_DOGADAJMY_SIE);
};

FUNC VOID DIA_Butch_CzasZaplaty_DAJESZ()
{
    AI_Output (other, self ,"DIA_Butch_CzasZaplaty_DAJESZ_15_01"); //Nie mam czasu na zabawy. Dawaj rudê, bo po¿a³ujesz!
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_DAJESZ_03_02"); //Ha ha ha! Zobaczymy!

	Info_ClearChoices		(DIA_Butch_CzasZaplaty);
	
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	Butch_Choice = Butch_RefuseQuest;
};

FUNC VOID DIA_Butch_CzasZaplaty_DOGADAJMY_SIE()
{
    AI_Output (other, self ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_15_01"); //Czego chcesz za rudê? Dogadajmy siê. Byle szybko.
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_03_02"); //Nie lubisz siê targowaæ, co? No dobra... 
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_03_03"); //Wkurzy³ mnie ostatnio jeden goœæ z Bractwa. Wo³aj¹ na niego Isidro.
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_03_04"); //Typ sprzeda³ mi jakieœ beznadziejne ziele. Skasuj goœcia.
    AI_Output (self, other ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_03_05"); //Mam go wiêcej nie widzieæ.
    AI_Output (other, self ,"DIA_Butch_CzasZaplaty_DOGADAJMY_SIE_15_06"); //Spróbujê coœ wymyœliæ.
	
	Info_ClearChoices		(DIA_Butch_CzasZaplaty);
	
	AI_StopProcessInfos	(self);
	
    B_LogEntry                     (CH5_FoodForHunters,"Je¿eli chce, aby Butch odda³ d³ug po dobroci, muszê pozbyæ siê Baala Isidro z Nowego Obozu.");
	
	Butch_Choice = Butch_TakeQuest;
};

//========================================
//-----------------> ISIDRO
//========================================

INSTANCE DIA_Butch_ISIDRO (C_INFO)
{
   npc          = Org_851_Butch;
   nr           = 1;
   condition    = DIA_Butch_ISIDRO_Condition;
   information  = DIA_Butch_ISIDRO_Info;
   permanent	= FALSE;
   description	= "Pozby³em siê Isidro.";
};

FUNC INT DIA_Butch_ISIDRO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalIsidro_NAPASC)) && (Butch_Choice == Butch_TakeQuest)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Butch_ISIDRO_Info()
{
    AI_Output (other, self ,"DIA_Butch_ISIDRO_15_01"); //Pozby³em siê Isidro.
    AI_Output (self, other ,"DIA_Butch_ISIDRO_03_02"); //Dobra robota. Masz tê rudê. Ciê¿ko mi siê z ni¹ rozstaæ, ale có¿.
    AI_Output (self, other ,"DIA_Butch_ISIDRO_03_03"); //Aha! Jak us³yszê, ¿e mój d³ug nie jest sp³acony... to siê jeszcze spotkamy. 
	
    B_LogEntry                     (CH5_FoodForHunters,"Dosta³em zap³atê za pancerz od Butcha. Powinienem ju¿ wróciæ do Wilka.");

    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 1500);
    B_GiveInvItems (self, other, ItMiNugget, 1500);
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BUSTER_LOSE
//========================================

INSTANCE DIA_Butch_BUSTER_LOSE (C_INFO)
{
   npc          = Org_851_Butch;
   nr           = 1;
   condition    = DIA_Butch_BUSTER_LOSE_Condition;
   information  = DIA_Butch_BUSTER_LOSE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Butch_BUSTER_LOSE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Butch_CzasZaplaty))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
	&& (Butch_Choice == Butch_RefuseQuest)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Butch_BUSTER_LOSE_Info()
{
    AI_Output (self, other ,"DIA_Butch_BUSTER_LOSE_03_01"); //Grabisz sobie, sukinsynu!
    AI_Output (other, self ,"DIA_Butch_BUSTER_LOSE_15_02"); //Skoñcz tê paplaninê i dawaj rudê.
	
	B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 1500);
    B_GiveInvItems (self, other, ItMiNugget, 1500);
	
	B_LogEntry                     (CH5_FoodForHunters,"Si³¹ odzyska³em rudê od Butcha. Powinienem ju¿ wróciæ do Wilka.");
	
	AI_StopProcessInfos	(self);
};

