//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Mirzo_EXIT(C_INFO)
{
	npc             	= GRD_7007_Mirzo;
	nr              	= 999;
	condition		= DIA_Mirzo_EXIT_Condition;
	information	= DIA_Mirzo_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Mirzo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mirzo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IamGardist
//========================================

INSTANCE DIA_Mirzo_IamGardist (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_IamGardist_Condition;
   information  = DIA_Mirzo_IamGardist_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Mirzo_IamGardist_Condition()
{
	if  (MIS_FoodForOldMine != LOG_SUCCESS) && !Npc_KnowsInfo (hero,DIA_Mirzo_Caught) 
	{ 
    return TRUE; 
	};
};

FUNC VOID DIA_Mirzo_IamGardist_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_IamGardist_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Mirzo_IamGardist_03_02"); //A co ciê to obchodzi, przyb³êdo? Jestem Mirzo i jeœli chcesz, to mo¿esz postawiæ mi piwo.
};

//========================================
//-----------------> GiveBeer
//========================================

INSTANCE DIA_Mirzo_GiveBeer (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 2;
   condition    = DIA_Mirzo_GiveBeer_Condition;
   information  = DIA_Mirzo_GiveBeer_Info;
   permanent	= FALSE;
   description	= "Napij siê.";
};

FUNC INT DIA_Mirzo_GiveBeer_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_IamGardist))
    && (Npc_HasItems (other, ItFoBeer) >=1)
	&& (MIS_FoodForOldMine != LOG_SUCCESS) && !Npc_KnowsInfo (hero,DIA_Mirzo_Caught)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_GiveBeer_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_01"); //Napij siê.
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_02"); //Dziêki. Nie jesteœ wcale taki bezu¿yteczny na jakiego mi siê z pocz¹tku wydawa³eœ. 
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_03"); //Czym siê tutaj zajmujesz? 
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_04"); //A czym mo¿e siê zajmowaæ Stra¿nik? Pilnujê rudy, której mamy tu pe³no. W skrzyniach, w wagonach, na wózku...
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_05"); //Bandyci raczej siê tu nie zjawi¹, ale niektórym cwaniaczkom wydaje siê, ¿e mog¹ sobie tak po prostu coœ st¹d zabraæ.
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_06"); //W³aœnie przez takich z³odziejaszków tu jestem. Ca³y dzieñ pilnujê...
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_07"); //Z pewnoœci¹ to bardzo wyczerpuj¹ce.
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_08"); //A co ty o tym mo¿esz wiedzieæ? Jesteœ przecie¿ ¿ó³todziobem! 
};

//========================================
//-----------------> QuestIan
//========================================

INSTANCE DIA_Mirzo_QuestIan (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_QuestIan_Condition;
   information  = DIA_Mirzo_QuestIan_Info;
   permanent	= FALSE;
   description	= "Ludzie ze Starej Kopalni dostaj¹ mniej ¿ywnoœci, ni¿ zamawiaj¹.";
};

FUNC INT DIA_Mirzo_QuestIan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artch_ianQuest_Spy))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_QuestIan_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_QuestIan_15_01"); //Ludzie ze Starej Kopalni dostaj¹ mniej ¿ywnoœci, ni¿ zamawiaj¹.
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_02"); //Tak, a ja jestem panienk¹ Gomeza.
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_03"); //¯arty sobie stroisz, ch³opcze?
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_04"); //Przecie¿ pilnujemy z Artchem, by wszystko siê zgadza³o.
    AI_Output (other, self ,"DIA_Mirzo_QuestIan_15_05"); //Mo¿e zapytaj Iana?
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_06"); //Pewnie Ÿle policzy³. Z naszej strony praca przebiega sprawnie.
    B_LogEntry                     (CH1_FoodForOldMine,"Mirzo uwa¿a, ¿e dobrze wykonuje swoj¹ pracê. Coœ mi tu jednak œmierdzi, popytam jeszcze innych mieszkañców obozu.");

    //B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Caught
//========================================

INSTANCE DIA_Mirzo_Caught (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_Caught_Condition;
   information  = DIA_Mirzo_Caught_Info;
   permanent	= FALSE;
   description	= "Mam ciê!";
};

FUNC INT DIA_Mirzo_Caught_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_IanQuest))
    && (Npc_GetDistToWP (self, "MIRZO_SPISEK") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_Caught_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_Caught_15_01"); //Mam ciê!
    AI_Output (self, other ,"DIA_Mirzo_Caught_03_02"); //Czemu za mn¹ ³azisz? Masz jakiœ problem?
    AI_Output (other, self ,"DIA_Mirzo_Caught_15_03"); //Ian ma. A wiêc to tutaj wszystko sprzedajesz.
    AI_Output (self, other ,"DIA_Mirzo_Caught_03_04"); //Dopilnujê, byœ nikomu nie przekaza³ tej informacji.
   
	//Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek2");
    AI_StopProcessInfos	(self);
    //self.flags = 2;
	//AI_Wait 	(self, 3);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    B_LogEntry    (CH1_FoodForOldMine,"Nakry³em Mirzo, jak robi³ interesy w Nowym Obozie. Stra¿nik rzuci³ siê na mnie. Muszê powiedzieæ o wszystkim Artegrowi.");
  
};

///////////////////////////////////////////////////////////////////////////////
// TA CZÊŒÆ SKRYPTÓW PRAWDOPODOBNIE ZOSTA£A WY£¥CZONA
// GOTHIC1210 STY 2016
///////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> PIWA
//========================================

INSTANCE DIA_Mirzo_PIWA (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_PIWA_Condition;
   information  = DIA_Mirzo_PIWA_Info;
   permanent	= FALSE;
   description	= "Ile tych piw mam przynieœæ?";
};

FUNC INT DIA_Mirzo_PIWA_Condition()
{
    if (browce == true) 
//dopisz gil - 0
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_PIWA_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_PIWA_15_01"); //Ile tych piw mam przynieœæ?
    AI_Output (self, other ,"DIA_Mirzo_PIWA_03_02"); //Ach, chcesz siê dostaæ do kopalni?
    AI_Output (other, self ,"DIA_Mirzo_PIWA_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Mirzo_PIWA_03_04"); //Przynieœ nam osiem piw.
    B_LogEntry                     (CH1_MineEnter,"Mirzo kaza³ mi przynieœæ osiem piw.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ALKO
//========================================

INSTANCE DIA_Mirzo_ALKO (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 2;
   condition    = DIA_Mirzo_ALKO_Condition;
   information  = DIA_Mirzo_ALKO_Info;
   permanent	= FALSE;
   description	= "Mam wasze piwa.";
};

FUNC INT DIA_Mirzo_ALKO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_PIWA))
    && (Npc_HasItems (other, ItFoBeer) >=8)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_ALKO_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_ALKO_15_01"); //Mam wasze piwa.
    AI_Output (self, other ,"DIA_Mirzo_ALKO_03_02"); //Œwietnie. Mi³ego pobytu w kopalni.
    B_LogEntry                     (CH1_MineEnter,"Odda³em napoje Mirzowi.");

    B_GiveXP (20);
    AI_StopProcessInfos	(self);
};




//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Mirzo_HowAreYou (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_HowAreYou_Condition;
   information  = DIA_Mirzo_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Mirzo_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_ALKO)) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_HowAreYou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Mirzo_HowAreYou_03_02"); //Daj mi spokój. Masz prawo wstêpu do kopalni, wiêc je wykorzystaj i idŸ ju¿ sobie.
    AI_Output (self, other ,"DIA_Mirzo_HowAreYou_03_03"); //Pilnujê, aby do kopalni nie wszed³ nikt niepowo³any, oraz ¿eby ¿aden Kopacz nie wydosta³ siê stamt¹d bez zgody Iana.
    AI_Output (other, self ,"DIA_Mirzo_HowAreYou_15_04"); //To musi byæ ciê¿ka praca.
    AI_Output (self, other ,"DIA_Mirzo_HowAreYou_03_05"); //A co ty tam mo¿esz wiedzieæ. Jesteœ przecie¿ ¿ó³todziobem!
};

//========================================
//-----------------> PermStatus
//========================================

INSTANCE DIA_Mirzo_PermStatus (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 2;
   condition    = DIA_Mirzo_PermStatus_Condition;
   information  = DIA_Mirzo_PermStatus_Info;
   permanent	= TRUE;
   description	= "Jak tam pilnowanie kopalni?";
};

FUNC INT DIA_Mirzo_PermStatus_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_HowAreYou)) && (MIS_FoodForOldMine != LOG_SUCCESS) && !Npc_KnowsInfo (hero,DIA_Mirzo_Caught)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_PermStatus_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_PermStatus_15_01"); //Jak tam pilnowanie kopalni?
    AI_Output (self, other ,"DIA_Mirzo_PermStatus_03_02"); //Muszê pracowaæ, wiêc zostaw mnie w spokoju. 
    AI_StopProcessInfos	(self);
};