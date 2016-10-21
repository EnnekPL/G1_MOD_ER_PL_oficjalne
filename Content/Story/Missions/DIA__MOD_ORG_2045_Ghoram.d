//poprawione i sprawdzone - Nocturn

//*****************************************
// SPRAWDZONE - GOTHIC1210
//*****************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ghoram_EXIT(C_INFO)
{
	npc             = ORG_2045_Ghoram;
	nr              = 999;
	condition	= DIA_Ghoram_EXIT_Condition;
	information	= DIA_Ghoram_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ghoram_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ghoram_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ghoram_HELLO1 (C_INFO)
{
   npc          = ORG_2045_Ghoram;
   nr           = 1;
   condition    = DIA_Ghoram_HELLO1_Condition;
   information  = DIA_Ghoram_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Ghoram_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoram_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_02"); //Nazywam siê Ghoram. To moja karczma.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_03"); //Czêœæ zysków nale¿y do Torlofa.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_04"); //Pomóg³ mi uzyskaæ pozwolenie od Lee i Magów Wody.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_05"); //Chcesz coœ kupiæ?
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Ghoram_TRADE (C_INFO)
{
   npc          = ORG_2045_Ghoram;
   nr           = 2;
   condition    = DIA_Ghoram_TRADE_Condition;
   information  = DIA_Ghoram_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chce siê napiæ.";
};

FUNC INT DIA_Ghoram_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoram_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_TRADE_15_01"); //Chce siê napiæ.
};

//========================================
//-----------------> Hand
//========================================

INSTANCE DIA_Ghoram_Hand (C_INFO)
{
   npc          = ORG_2045_Ghoram;
   nr           = 5;
   condition    = DIA_Ghoram_Hand_Condition;
   information  = DIA_Ghoram_Hand_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o R¹czce?";
};

FUNC INT DIA_Ghoram_Hand_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoram_Hand_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_Hand_15_01"); //Wiesz coœ o niejakim R¹czce?
    AI_Output (self, other ,"DIA_Ghoram_Hand_03_02"); //To zale¿y, czy otrzymam 50 bry³ek rudy, czy nie.
};

//========================================
//-----------------> GadajKurwo
//========================================

INSTANCE DIA_Ghoram_GadajKurwo (C_INFO)
{
   npc          = ORG_2045_Ghoram;
   nr           = 6;
   condition    = DIA_Ghoram_GadajKurwo_Condition;
   information  = DIA_Ghoram_GadajKurwo_Info;
   permanent	= FALSE;
   description	= "Dobra, mów.";
};

FUNC INT DIA_Ghoram_GadajKurwo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoram_Hand))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoram_GadajKurwo_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_GadajKurwo_15_01"); //Dobra, mów.
    AI_Output (self, other ,"DIA_Ghoram_GadajKurwo_03_02"); //Jakieœ cia³o le¿y w karczmie. W miejscu, gdzie Jeremiasz destyluje alkohol.
    AI_Output (other, self ,"DIA_Ghoram_GadajKurwo_15_03"); //Muszê to sprawdziæ. 
    AI_Output (self, other ,"DIA_Ghoram_GadajKurwo_03_04"); //Przypuszczam, ¿e to w³aœnie twój kole¿ka.
    B_LogEntry                     (CH2_FingersSeeking,"Cia³o jakiegoœ Cienia le¿y w karczmie. Tam, gdzie Jeremiasz destyluje alkohol.");
    B_GiveInvItems (other, self, ItMiNugget, 50);

    B_GiveXP (100);
};