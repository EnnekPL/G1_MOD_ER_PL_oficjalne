//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator50_EXIT(C_INFO)
{
	npc             = ORG_950_Organisator;
	nr              = 999;
	condition	= DIA_Organisator50_EXIT_Condition;
	information	= DIA_Organisator50_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator50_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator50_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Organisator50_HELLO1 (C_INFO)
{
   npc          = ORG_950_Organisator;
   nr           = 1;
   condition    = DIA_Organisator50_HELLO1_Condition;
   information  = DIA_Organisator50_HELLO1_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Organisator50_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator50_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Organisator50_HELLO1_15_01"); //Co tam?
    if (MIS_TopielceWChacie == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator50_HELLO1_03_02"); //Dobrze. Tutaj przynajmniej mam spok�j.
    }
    else
    {
        AI_Output (self, other ,"DIA_Organisator50_HELLO1_03_03"); //Czekamy na kogo�, kto pomo�e nam oczy�ci� wybrze�e jeziora z topielc�w.
    };
};