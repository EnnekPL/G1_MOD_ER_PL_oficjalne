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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Ghoram_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoram_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_02"); //Nazywam si� Ghoram. To moja karczma.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_03"); //Cz�� zysk�w nale�y do Torlofa.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_04"); //Pom�g� mi uzyska� pozwolenie od Lee i Mag�w Wody.
    AI_Output (self, other ,"DIA_Ghoram_HELLO1_03_05"); //Chcesz co� kupi�?
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
   description	= "Chce si� napi�.";
};

FUNC INT DIA_Ghoram_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoram_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Ghoram_TRADE_15_01"); //Chce si� napi�.
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
   description	= "Wiesz co� o R�czce?";
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
    AI_Output (other, self ,"DIA_Ghoram_Hand_15_01"); //Wiesz co� o niejakim R�czce?
    AI_Output (self, other ,"DIA_Ghoram_Hand_03_02"); //To zale�y, czy otrzymam 50 bry�ek rudy, czy nie.
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
   description	= "Dobra, m�w.";
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
    AI_Output (other, self ,"DIA_Ghoram_GadajKurwo_15_01"); //Dobra, m�w.
    AI_Output (self, other ,"DIA_Ghoram_GadajKurwo_03_02"); //Jakie� cia�o le�y w karczmie. W miejscu, gdzie Jeremiasz destyluje alkohol.
    AI_Output (other, self ,"DIA_Ghoram_GadajKurwo_15_03"); //Musz� to sprawdzi�. 
    AI_Output (self, other ,"DIA_Ghoram_GadajKurwo_03_04"); //Przypuszczam, �e to w�a�nie tw�j kole�ka.
    B_LogEntry                     (CH2_FingersSeeking,"Cia�o jakiego� Cienia le�y w karczmie. Tam, gdzie Jeremiasz destyluje alkohol.");
    B_GiveInvItems (other, self, ItMiNugget, 50);

    B_GiveXP (100);
};