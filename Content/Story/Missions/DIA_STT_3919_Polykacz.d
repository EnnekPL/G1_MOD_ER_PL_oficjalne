//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Polykacz_EXIT(C_INFO)
{
	npc             = STT_3919_Polykacz;
	nr              = 999;
	condition	= DIA_Polykacz_EXIT_Condition;
	information	= DIA_Polykacz_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Polykacz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Polykacz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Polykacz_HELLO1 (C_INFO)
{
   npc          = STT_3919_Polykacz;
   nr           = 1;
   condition    = DIA_Polykacz_HELLO1_Condition;
   information  = DIA_Polykacz_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Polykacz_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Polykacz_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Polykacz_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Polykacz_HELLO1_03_02"); //Odwal si�, ca�� noc pracuj�. Daj mi si� w spokoju napi� piwa.
    AI_StopProcessInfos	(self);
};

