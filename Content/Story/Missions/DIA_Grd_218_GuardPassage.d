//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// /***************************************

instance DIA_Grd_218_Exit (C_INFO)
{
	npc			= Grd_218_GArdist;
	nr			= 999;
	condition	= DIA_Grd_218_Exit_Condition;
	information	= DIA_Grd_218_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Grd_218_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_218_Exit_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Poselstwo
//========================================

INSTANCE DIA_Gardist_Poselstwo (C_INFO)
{
   npc          = Grd_218_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_Poselstwo_Condition;
   information  = DIA_Gardist_Poselstwo_Info;
   permanent	= FALSE;
   description	= "Mam poselstwo do Blizny.";
};

FUNC INT DIA_Gardist_Poselstwo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_Next))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_Poselstwo_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Poselstwo_15_01"); //Mam poselstwo do Blizny.
    AI_Output (self, other ,"DIA_Gardist_Poselstwo_03_02"); //Dobra. Wchod�, ale bez �adnych numer�w!
    Grd_218_Gardist.aivar[AIV_PASSGATE]==TRUE;
	GRD_245_Gardist.aivar[AIV_PASSGATE]=TRUE;
    AI_StopProcessInfos	(self);
};


// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Grd_218_FirstIn (C_INFO)
{
	npc			= Grd_218_GArdist;
	nr			= 1;
	condition	= DIA_Grd_218_FirstIn_Condition;
	information	= DIA_Grd_218_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Grd_218_FirstIn_Condition()
{
	if (self.aivar[AIV_PASSGATE]==TRUE) && (!Npc_KnowsInfo (hero, DIA_Gardist_Poselstwo))
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_218_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_00"); //Czekaj! Czego tu szukasz?
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_01"); //Chc� wej�� do �rodka.
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_02"); //Kpisz sobie ze mnie, czy co?
	if (!Npc_KnowsInfo(hero,DIA_Scatty_DowodyNaOszustwa))
	{
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_03"); //Mo�e zapytasz Thorusa?
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_04"); //Zapytam. Je�li ��esz, ju� po tobie!
	}
	else
	{	
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_07"); //Czy Scatty nic ci nie m�wi�?
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_08"); //Ach, ju� pami�tam.
	};
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_05"); //Czy to znaczy, �e mog� wej��?
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_06"); //Tak! Rusz si� wreszcie!
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_218_Gardist
//	Lager:		OldCamp		
//	Durchgang:	Eingang Erzbaronhaus
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	N�hert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	N�hert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	Grd_218_CHECKPOINT		= "OCC_BARONS_HALLWAY_FRONT";

instance Info_Grd_218_FirstWarn (C_INFO)
{
	npc			= Grd_218_Gardist;
	nr			= 1;
	condition	= Info_Grd_218_FirstWarn_Condition;
	information	= Info_Grd_218_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_218_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_Grd_218_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_01"); //ST�J! Ani kroku dalej!
	AI_Output (hero, self,"Info_Grd_218_FirstWarn_Info_15_02"); //Dlaczego?
	AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_03"); //Takie �achudry jak ty nie maj� wst�pu do siedziby Magnat�w!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_218_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
	/*
if (Npc_KnowsInfo(hero,DIA_Blade_Next))
{
AI_Output (hero, self,"Info_Grd_218_FirstWarn_Info_15_04"); //Jestem tu z wiadomo�ci�.
AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_05"); //Czy�by? Co to za wiadomo��?
AI_Output (hero, self,"Info_Grd_218_FirstWarn_Info_15_06"); //Stra�nik Spike chce si� natychmiast widzie� z Blizn� przy kaplicy Innosa. Mog� wej�� i mu to powiedzie�?
AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_07"); //Nie ma takiej potrzeby, ja mu to przeka��. Tylko uwa�aj... Je�eli oka�e si� to g�upim �artem, nie b�dziesz mia� �ycia w Obozie.
Npc_ExchangeRoutine (self, "kill");
scar_idzie = true;
AI_StopProcessInfos	(self);
};*/
};
//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_218_Attack (C_INFO)
{
	npc			= Grd_218_Gardist;
	nr			= 1;
	condition	= Info_Grd_218_Attack_Condition;
	information	= Info_Grd_218_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_218_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_218_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Grd_218_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};