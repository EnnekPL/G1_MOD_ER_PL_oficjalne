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
    AI_Output (self, other ,"DIA_Artch_ENTER_03_01"); //Hej! Masz pozwolenie na wej�cie?
    if (GoToOM == false)
    {
    AI_Output (other, self ,"DIA_Artch_ENTER_15_02"); //Eeee... To ja ju� p�jd�.
    AI_Output (self, other ,"DIA_Artch_ENTER_03_03"); //No tak my�l�!
	truje = true;
	zaczepkaArtcha = true;
    }
    else
	{
	AI_Output (self, other ,"DIA_Artch_ENTER_03_04"); //Mi�ego pobytu. He he...
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
        AI_Output (self, other ,"DIA_Artch_CZEPIANIE_03_02"); //Czy ja ci� czasem nie wyp�dzi�em?
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
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_01"); //Ch�opcze, odwali�e� kawa� naprawd� dobrej roboty.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_02"); //Pe�zacze by�y powa�nym zagro�eniem dla pracuj�cych tutaj ludzi.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_03"); //Ciesz� si�, �e teraz kopalnia jest bezpieczna.
    AI_Output (other, self ,"DIA_Artch_KROLOWA_15_04"); //Ciesz� si�, �e mog�em pom�c. Musz� jednak rusza� w dalsz� drog�.
    AI_Output (self, other ,"DIA_Artch_KROLOWA_03_05"); //Jasne. Nie b�d� ci� zatrzymywa�. 
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
   description	= "Dostawy �ywno�ci do Starej Kopalni nie zgadzaj� si� z zam�wieniami.";
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
    AI_Output (other, self ,"DIA_Artch_ianQuest_Spy_15_01"); //Dostawy �ywno�ci do Starej Kopalni nie zgadzaj� si� z zam�wieniami.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_02"); //Co? Chyba co� ci si� pomiesza�o.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_03"); //Ja i Mirzo bardzo dok�adnie pilnujemy, by ludzie w kopalni dostawali to, co zamawiaj�.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_04"); //Boimy si� ryzykowa�. Osoby, kt�re uprzednio si� tym zajmowa�y nie sko�czy�y zbyt dobrze.
    AI_Output (self, other ,"DIA_Artch_ianQuest_Spy_03_05"); //Pewnego dnia wpad� Arto i zrobi� z nimi porz�dek.
    AI_Output (other, self ,"DIA_Artch_ianQuest_Spy_15_06"); //Hmm... Rozumiem.
    B_LogEntry                     (CH1_FoodForOldMine,"Artch twierdzi, �e wszystko jest w porz�dku.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

