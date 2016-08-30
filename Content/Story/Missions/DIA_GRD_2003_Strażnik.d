//poprawione i sprawdzone - Nocturn

//poprawione 1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra�nik_EXIT(C_INFO)
{
	npc             = GRD_2003_Stra�nik;
	nr              = 999;
	condition	= DIA_Stra�nik_EXIT_Condition;
	information	= DIA_Stra�nik_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra�nik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra�nik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Stra�nik_WORK (C_INFO)
{
   npc          = GRD_2003_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_WORK_Condition;
   information  = DIA_Stra�nik_WORK_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Stra�nik_WORK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_WORK_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_WORK_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Stra�nik_WORK_03_02"); //Naprawd� nie wida�? Po co zadajesz takie g�upie pytania?
    AI_Output (other, self ,"DIA_Stra�nik_WORK_15_03"); //Pomy�la�em, �e mo�e w czym� pomog�, albo czego� si� od was dowiem.
    AI_Output (self, other ,"DIA_Stra�nik_WORK_03_04"); //Dam ci rad�.
    AI_Output (self, other ,"DIA_Stra�nik_WORK_03_05"); //Id� lepiej do Obozu, bo tutaj nic ciekawego nie us�yszysz.
};

//========================================
//-----------------> COTAM
//========================================

INSTANCE DIA_Stra�nik_COTAM (C_INFO)
{
   npc          = GRD_2003_Stra�nik;
   nr           = 2;
   condition    = DIA_Stra�nik_COTAM_Condition;
   information  = DIA_Stra�nik_COTAM_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Stra�nik_COTAM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_COTAM_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_COTAM_15_01"); //Co tam?

 if (Npc_GetTrueGuild (hero) == GIL_GRD)
{
    AI_Output (self, other ,"DIA_Stra�nik_COTAM_03_02"); //Och, widz�, �e do��czy�e� do Stra�nik�w. Dobry wyb�r.
}
else
{
    AI_Output (self, other ,"DIA_Stra�nik_COTAM_03_03"); //Daj mi spok�j!
};

    AI_StopProcessInfos	(self);
};