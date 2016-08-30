//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Castle_EXIT(C_INFO)
{
	npc             = NONE_DarkLord_Castle;
	nr              = 999;
	condition		= DIA_Castle_EXIT_Condition;
	information		= DIA_Castle_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Castle_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Castle_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Castle_HELLO1 (C_INFO)
{
   npc          = NONE_DarkLord_Castle;
   nr           = 1;
   condition    = DIA_Castle_HELLO1_Condition;
   information  = DIA_Castle_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Castle_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Castle_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Castle_HELLO1_03_01"); //Aaargh! Co tutaj robisz?! Odsu� si�.
    AI_Output (self, other ,"DIA_Castle_HELLO1_03_02"); //Jestem op�tany... aagh... odejd�. Nie chc� ci� zabija�.
    AI_Output (other, self ,"DIA_Castle_HELLO1_15_03"); //Wiem o kl�twie. Musz� zg�adzi� twe op�tane cia�o, aby dusza by�a wolna.
    AI_Output (self, other ,"DIA_Castle_HELLO1_03_04"); //Licz� na ciebie.
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};