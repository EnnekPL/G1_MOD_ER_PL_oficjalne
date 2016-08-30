//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_HunterTired_EXIT(C_INFO)
{
	npc             = NON_5610_Hunter;
	nr              = 999;
	condition	= DIA_HunterTired_EXIT_Condition;
	information	= DIA_HunterTired_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_HunterTired_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_HunterTired_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_HunterTired_HELLO1 (C_INFO)
{
   npc          = NON_5610_Hunter;
   nr           = 1;
   condition    = DIA_HunterTired_HELLO1_Condition;
   information  = DIA_HunterTired_HELLO1_Info;
   permanent	= FALSE;
   description	= "Podobno nie chce wam si� pracowa�.";
};

FUNC INT DIA_HunterTired_HELLO1_Condition()
{
    if (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_HunterTired_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_HunterTired_HELLO1_15_01"); //Podobno nie chce wam si� pracowa�.
    AI_Output (self, other ,"DIA_HunterTired_HELLO1_03_02"); //Cz�owieku, mam ju� tego do��. Codziennie musimy pracowa� po kilka godzin.
    AI_Output (self, other ,"DIA_HunterTired_HELLO1_03_03"); //Nie mam si�y. Jeszcze ten sukinsyn Olivier...
    AI_Output (other, self ,"DIA_HunterTired_HELLO1_15_04"); //Co jest nie tak z Olivierem?
    AI_Output (self, other ,"DIA_HunterTired_HELLO1_03_05"); //Ca�� noc poluje na jakiego� potwora. Pr�buje zwabi� go rogiem. Nie mo�na normalnie zasn��.
    AI_Output (self, other ,"DIA_HunterTired_HELLO1_03_06"); //Uwzi�� si� na jak�� Besti�, czy jak on to tam nazywa.
    B_LogEntry                     (CH1_Nieroby,"Jeden z my�liwych zdradzi� mi, �e nie mo�e spa� przez Oliviera, kt�ry noc� poluje na dziwnego potwora. Najwidoczniej d�wi�ki rogu przeszkadzaj� my�liwym w odpoczynku, przez co s� rozdra�nieni.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};