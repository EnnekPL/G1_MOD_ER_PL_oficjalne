//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Monestry_EXIT(C_INFO)
{
	npc             = NONE_DarkLord_Monestry;
	nr              = 999;
	condition	= DIA_Monestry_EXIT_Condition;
	information	= DIA_Monestry_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Monestry_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Monestry_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Monestry_HELLO1 (C_INFO)
{
   npc          = NONE_DarkLord_Monestry;
   nr           = 1;
   condition    = DIA_Monestry_HELLO1_Condition;
   information  = DIA_Monestry_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Monestry_HELLO1_Condition()
{
   // if (MIS_ThreeLords == LOG_RUNNING)
  //  {
    return TRUE;
  //  };
};


FUNC VOID DIA_Monestry_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Monestry_HELLO1_03_01"); //Czego chcesz, œmiertelniku?
    AI_Output (other, self ,"DIA_Monestry_HELLO1_15_02"); //Przybywam ciê uwolniæ.
    AI_Output (self, other ,"DIA_Monestry_HELLO1_03_03"); //Mnie? Uwolniæ?
    AI_Output (other, self ,"DIA_Monestry_HELLO1_15_04"); //Jesteœ wiêŸniem plugawych si³. Twój czas min¹³.
    AI_Output (self, other ,"DIA_Monestry_HELLO1_03_05"); //Zatem walczmy.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};