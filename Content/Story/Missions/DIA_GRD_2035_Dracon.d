//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Dracon_EXIT(C_INFO)
{
	npc             = GRD_2035_Dracon;
	nr              = 999;
	condition	= DIA_Dracon_EXIT_Condition;
	information	= DIA_Dracon_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Dracon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dracon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Dracon_HELLO (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 1;
   condition    = DIA_Dracon_HELLO_Condition;
   information  = DIA_Dracon_HELLO_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Dracon_HELLO_Condition()
{
    if (kapitel == 10)
	//(Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dracon_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Dracon_HELLO_03_01"); //Nie mo�esz tutaj wej��! Wyno� si�.
    AI_Output (other, self ,"DIA_Dracon_HELLO_15_02"); //Gdzie mog� t�dy doj��?
    AI_Output (self, other ,"DIA_Dracon_HELLO_03_03"); //Do magazynu. Id� ju�.
	AI_GotoWP (hero, "OM_CAVE_83");
	AI_StopProcessInfos	(self);
};

CONST STRING	Grd_Dracon_CHECKPOINT		= "PATROL1";

//***************************************************************
// STRA�NIK MAGAZYNU W KOPALNI Dracon
// Atakuje, gdy podchodzimy do magazynu. 
//***************************************************************

INSTANCE Info_Grd_2035_FirstWarn (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_FirstWarn_Condition;
	information	= Info_Grd_2035_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};  

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT Info_Grd_2035_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_2035_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_2035_FirstWarn_Info_13_01"); //ST�J!
	AI_Output (hero, self,"Info_Grd_2035_FirstWarn_Info_15_02"); //O co chodzi?
	AI_Output (self, hero,"Info_Grd_2035_FirstWarn_Info_13_03"); //Nie wolno ci wej�� do magazynu. Wst�p do niego maj� wy��cznie Stra�nicy.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE Info_Grd_2035_LastWarn (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_LastWarn_Condition;
	information	= Info_Grd_2035_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_2035_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return TRUE;
	};
};

func int Info_Grd_2035_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_2035_LastWarn_13_01"); 		//Og�uch�e�? Jeszcze jeden krok, a nakarmi� tob� robaki!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_Dracon_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE Info_Grd_2035_Attack (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_Attack_Condition;
	information	= Info_Grd_2035_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_2035_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 			TRUE;
	};
};

func int Info_Grd_2035_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};


//========================================
//-----------------> PRZYLAPANI
//========================================

INSTANCE DIA_Dracon_PRZYLAPANI (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 2;
   condition    = DIA_Dracon_PRZYLAPANI_Condition;
   information  = DIA_Dracon_PRZYLAPANI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dracon_PRZYLAPANI_Condition()
{
    if (MIS_ActionOM == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dracon_PRZYLAPANI_Info()
{
    AI_Output (self, other ,"DIA_Dracon_PRZYLAPANI_03_01"); //Nie wiem, co zrobili�cie, ale co� mi tu �mierdzi.
    AI_Output (other, self ,"DIA_Dracon_PRZYLAPANI_15_02"); //Chyba mnie z kim� pomyli�e�. 
    AI_Output (other, self ,"DIA_Dracon_PRZYLAPANI_15_03"); //Ja tutaj ci�ko pracuj�.
    AI_Output (self, other ,"DIA_Dracon_PRZYLAPANI_03_04"); //Tak, tak. Uwa�aj, �eby� si� nie przepracowa�.
};
