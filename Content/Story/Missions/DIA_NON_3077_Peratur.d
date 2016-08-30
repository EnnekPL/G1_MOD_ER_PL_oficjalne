//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Peratur_EXIT(C_INFO)
{
	npc             = NON_3077_Peratur;
	nr              = 999;
	condition		= DIA_Peratur_EXIT_Condition;
	information		= DIA_Peratur_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Peratur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Peratur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Peratur_HowAreYou (C_INFO)
{
   npc          = NON_3077_Peratur;
   nr           = 1;
   condition    = DIA_Peratur_HowAreYou_Condition;
   information  = DIA_Peratur_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Jest spokojnie?";
};

FUNC INT DIA_Peratur_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Peratur_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Peratur_HowAreYou_15_01"); //Jest spokojnie?
    AI_Output (self, other ,"DIA_Peratur_HowAreYou_03_02"); //By�o, dop�ki nie przyszed�e�. Czego tu chcesz?
    AI_Output (other, self ,"DIA_Peratur_HowAreYou_15_03"); //Chcia�em si� tylko rozejrze�.
    AI_Output (self, other ,"DIA_Peratur_HowAreYou_03_04"); //Nie widzisz, �e jest tu ma�o miejsca? Zmykaj zanim kto� spadnie.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoDown
//========================================

INSTANCE DIA_Peratur_GoDown (C_INFO)
{
   npc          = NON_3077_Peratur;
   nr           = 2;
   condition    = DIA_Peratur_GoDown_Condition;
   information  = DIA_Peratur_GoDown_Info;
   permanent	= FALSE;
   description	= "Jeste� na chwil� potrzebny na dole.";
};

FUNC INT DIA_Peratur_GoDown_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_PotionGive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Peratur_GoDown_Info()
{
    AI_Output (other, self ,"DIA_Peratur_GoDown_15_01"); //Jeste� na chwil� potrzebny na dole.
    AI_Output (self, other ,"DIA_Peratur_GoDown_03_02"); //Czego oni znowu chc�?
    AI_Output (other, self ,"DIA_Peratur_GoDown_15_03"); //Nie mam poj�cia. Spike po prostu chcia� z tob� pogada�.
    AI_Output (self, other ,"DIA_Peratur_GoDown_03_04"); //Spike? No nareszcie. Pewnie znowu ma dla mnie co� ciekawego.
    AI_Output (other, self ,"DIA_Peratur_GoDown_15_05"); //Hmm?
    AI_Output (self, other ,"DIA_Peratur_GoDown_03_06"); //Masz tu 10 bry�ek rudy i nic nie s�ysza�e�. Jasne?
    AI_Output (other, self ,"DIA_Peratur_GoDown_15_07"); //Nie ma problemu. Uwa�aj przy schodzeniu.
    AI_Output (self, other ,"DIA_Peratur_GoDown_03_08"); //Ju� nie b�d� taki troskliwy. Wi�cej nie dostaniesz. Tylko trzymaj j�zor za z�bami.
    CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "down");
	
	B_LogEntry					(CH1_GhoransVine, "Peratur ochoczo zszed� z posterunku, gdy dowiedzia� si�, �e Spike chce z nim pogada�. ");
};

