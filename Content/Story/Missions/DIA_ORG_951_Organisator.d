//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator51_EXIT(C_INFO)
{
	npc             = ORG_951_Organisator;
	nr              = 999;
	condition		= DIA_Organisator51_EXIT_Condition;
	information		= DIA_Organisator51_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator51_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator51_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Organisator51_HELLO1 (C_INFO)
{
   npc          = ORG_951_Organisator;
   nr           = 1;
   condition    = DIA_Organisator51_HELLO1_Condition;
   information  = DIA_Organisator51_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator51_HELLO1_Condition()
{
    if (MIS_LurkersInHut == LOG_SUCCESS)
    && (Npc_GetDistToWP (self, "RYBAK1") < 500)
    && (Wld_IsTime     (06,00,09,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator51_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Organisator51_HELLO1_03_01"); //Spójrz! Rozpali³em ognisko.
    AI_Output (self, other ,"DIA_Organisator51_HELLO1_03_02"); //Dobrze, ¿e pomog³eœ nam wróciæ do tych chat.
    AI_Output (self, other ,"DIA_Organisator51_HELLO1_03_03"); //Tak tu przyjemnie i cicho.
    AI_Output (self, other ,"DIA_Organisator51_HELLO1_03_04"); //Pamiêtam, jak kiedyœ by³em rybakiem w pobli¿u Ardei.
    //Wld_SetObjectRoutine (06,00,"NC_RYBAK_CAMP",1);
	Wld_SetMobRoutine		(06,00, "NC_RYBAK_CAMP", 1);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Organisator51_HELLO2 (C_INFO)
{
   npc          = ORG_951_Organisator;
   nr           = 2;
   condition    = DIA_Organisator51_HELLO2_Condition;
   information  = DIA_Organisator51_HELLO2_Info;
   permanent	= FALSE;
   description	= "By³eœ rybakiem w Ardei?";
};

FUNC INT DIA_Organisator51_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator51_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator51_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Organisator51_HELLO2_15_01"); //By³eœ rybakiem w Ardei?
    AI_Output (self, other ,"DIA_Organisator51_HELLO2_03_02"); //Tak. Dzieñ w dzieñ ³owi³em ryby. Dba³em o sieci i dostarcza³em po³ów do miasta.
    AI_Output (self, other ,"DIA_Organisator51_HELLO2_03_03"); //Uwielbiam szum morza.
    AI_Output (self, other ,"DIA_Organisator51_HELLO2_03_04"); //Jezioro te¿ nie jest z³e.
    AI_Output (self, other ,"DIA_Organisator51_HELLO2_03_05"); //Ech... Przeklêta wojna!
    AI_Output (self, other ,"DIA_Organisator51_HELLO2_03_06"); //Wszystko zniszczy³a.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Organisator51_HELLO3 (C_INFO)
{
   npc          = ORG_951_Organisator;
   nr           = 3;
   condition    = DIA_Organisator51_HELLO3_Condition;
   information  = DIA_Organisator51_HELLO3_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Organisator51_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator51_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator51_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Organisator51_HELLO3_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Organisator51_HELLO3_03_02"); //Dziêki tobie znów mogê siê cieszyæ swoj¹ prac¹.
    AI_Output (self, other ,"DIA_Organisator51_HELLO3_03_03"); //Dziêkujê.
};