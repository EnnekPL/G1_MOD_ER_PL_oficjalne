//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Artch_EXIT(C_INFO)
{
	npc             = GRD_2017_Artch;
	nr              = 999;
	condition	= DIA_Artch_EXIT_Condition;
	information	= DIA_Artch_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Artch_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Artch_EXIT_Info()
{
	//if (GoToOM == false)
	//{
	//AI_GotoWP (hero, "WYPAD"); //wp do zmiany
	//};
	AI_StopProcessInfos	(self);
};
/*
var int truje;
var int zaczepkaArtcha;

//========================================
//-----------------> ENTER
//========================================

INSTANCE DIA_Artch_ENTER (C_INFO)
{
   npc          = GRD_2017_Artch;
   nr           = 1;
   condition    = DIA_Artch_ENTER_Condition;
   information  = DIA_Artch_ENTER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artch_ENTER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Artch_ENTER_Info()
{
    AI_Output (self, other ,"DIA_Artch_ENTER_03_01"); //Hej! Masz pozwolenie na wejœcie?
    if (GoToOM == false)
    {
    AI_Output (other, self ,"DIA_Artch_ENTER_15_02"); //Eeee... To ja ju¿ pójdê.
    AI_Output (self, other ,"DIA_Artch_ENTER_03_03"); //No tak myœlê!
	truje = true;
	zaczepkaArtcha = true;
    }
    else
	{
	AI_Output (self, other ,"DIA_Artch_ENTER_03_04"); //Mi³ego pobytu. He he...
	AI_StopProcessInfos	(self);
	};

//========================================
//-----------------> CZEPIANIE
//========================================

INSTANCE DIA_Artch_CZEPIANIE (C_INFO)
{
   npc          = GRD_2017_Artch;
   nr           = 2;
   condition    = DIA_Artch_CZEPIANIE_Condition;
   information  = DIA_Artch_CZEPIANIE_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Artch_CZEPIANIE_Condition()
{
    if (truje == true) // && (Npc_GetDistToWP (hero, "GRD7") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artch_CZEPIANIE_Info()
{
        AI_Output (self, other ,"DIA_Artch_CZEPIANIE_03_02"); //Czy ja ciê czasem nie wypêdzi³em?
        AI_Output (self, other ,"DIA_Artch_CZEPIANIE_03_03"); //SPADAJ!
		czepianie = true; 
};
*/
//========================================
//-----------------> KROLOWA
//========================================

INSTANCE DIA_Artch_KROLOWA (C_INFO)
{
   npc          = GRD_2017_Artch;
   nr           = 1;
   condition    = DIA_Artch_KROLOWA_Condition;
   information  = DIA_Artch_KROLOWA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artch_KROLOWA_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_AFTERALL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artch_KROLOWA_Info()
{
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_01"); //Ch³opcze, odwali³eœ kawa³ naprawdê dobrej roboty.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_02"); //Pe³zacze by³y powa¿nym zagro¿eniem dla pracuj¹cych tutaj ludzi.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_03"); //Stra¿nicy bêd¹ mieæ teraz mniej pracy. Jesteœ w porz¹dku.
    AI_Output (other, self ,"DIA_Artch_KROLOWA_15_04"); //Cieszê siê, ¿e mog³em pomóc. Muszê jednak ruszaæ w dalsz¹ drogê.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_05"); //Jasne. Nie bêdê ciê zatrzymywa³. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ianQuest_Spy
//========================================

INSTANCE DIA_Artch_ianQuest_Spy (C_INFO)
{
   npc          = GRD_2017_Artch;
   nr           = 1;
   condition    = DIA_Artch_ianQuest_Spy_Condition;
   information  = DIA_Artch_ianQuest_Spy_Info;
   permanent	= FALSE;
   description	= "Dostawy ¿ywnoœci do Starej Kopalni nie zgadzaj¹ siê z zamówieniami.";
};

FUNC INT DIA_Artch_ianQuest_Spy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KUCHARZ_QuestIan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artch_ianQuest_Spy_Info()
{
    AI_Output (other, self ,"DIA_Artch_ianQuest_Spy_15_01"); //Dostawy ¿ywnoœci do Starej Kopalni nie zgadzaj¹ siê z zamówieniami.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_02"); //Co? Chyba coœ ci siê pomiesza³o.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_03"); //Ja i Mirzo bardzo dok³adnie pilnujemy, by ludzie w kopalni dostawali to, co zamawiaj¹.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_04"); //Boimy siê ryzykowaæ. Osoby, które uprzednio siê tym zajmowa³y nie skoñczy³y zbyt dobrze.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_05"); //Pewnego dnia wpad³ Arto i zrobi³ z nimi porz¹dek.
    AI_Output (other, self ,"DIA_Artch_ianQuest_Spy_15_06"); //Hmm... Rozumiem.
    B_LogEntry                     (CH1_FoodForOldMine,"Artch twierdzi, ¿e wszystko jest w porz¹dku. Jeœli któryœ z nich coœ kombinuje, bêdê go musia³ przy³apaæ na gor¹cym uczynku.");

   // B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

