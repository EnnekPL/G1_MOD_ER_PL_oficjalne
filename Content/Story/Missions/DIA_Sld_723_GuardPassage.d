//poprawione i sprawdzone - Nocturn

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		SLD_723_Soeldner
//	Lager:				
//	Durchgang:
//	Uhrzeit:
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	SLD_723_CHECKPOINT		= "NC_PLACE02";

instance Info_SLD_723_FirstWarn (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 1;
	condition	= Info_SLD_723_FirstWarn_Condition;
	information	= Info_SLD_723_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_SLD_723_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_SLD_723_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output 		(self, hero,"Info_SLD_723_FirstWarn_11_01"); //STAÆ! Nikt nie przejdzie bez podania has³a.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)) || (player_chose_WaterMages == true)
	{
		Info_Clearchoices 	(Info_SLD_723_FirstWarn);
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"Cronos udzieli³ mi pozwolenia!"	,	Info_SLD_723_Parole_CRONOS);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"Cholera. Chyba zapomnia³em..."		,	Info_SLD_723_Parole_FORGOT);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"Has³o brzmi TERIANTROCH."			,	Info_SLD_723_Parole_FALSE2);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"Has³o brzmi TETRIANDOCH."			,	Info_SLD_723_Parole_TRUE);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"Has³o brzmi TETRIDANOCH."			,	Info_SLD_723_Parole_FALSE1);  
	}
	else
	{
		AI_StopProcessInfos	(self);
	};
};

func void Info_SLD_723_Parole_CRONOS ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_CRONOS_15_01"); //Cronos udzieli³ mi pozwolenia!
	AI_Output 			(self, hero,"Info_SLD_723_Parole_CRONOS_11_02"); //W takim wypadku poda³by ci równie¿ has³o. ZejdŸ mi z oczu, k³amco.
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FORGOT ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FORGOT_15_01"); //Cholera. Chyba zapomnia³em...
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FORGOT_11_02"); //To wróæ, jak tylko sobie przypomnisz i przestañ zawracaæ mi g³owê!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FALSE1 ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FALSE1_15_01"); //Has³o brzmi TETRIDANOCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FALSE1_11_02"); //B£¥D!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FALSE2 ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FALSE2_15_01"); //Has³o brzmi TERIANTROCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FALSE2_11_02"); //B£¥D!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_TRUE ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_TRUE_15_01"); //Has³o brzmi TETRIANDOCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_TRUE_11_02"); //Zgadza siê. Mo¿esz przejœæ.
	AI_StopProcessInfos	(self);

	//---- beide Wachen auf passieren schalten ----
	var C_NPC guard; guard = Hlp_GetNpc(Sld_732_Soeldner);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] 			= TRUE;
	guard.aivar[AIV_PASSGATE] 			= TRUE;
	B_GiveXP  			(XP_SayCorrectParole);
};



//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_SLD_723_LastWarn (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 2;
	condition	= Info_SLD_723_LastWarn_Condition;
	information	= Info_SLD_723_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_723_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE							) 
	&&  (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_SLD_723_LastWarn_Info()
{
	AI_Output 		(self, hero,"Info_SLD_723_LastWarn_11_01"); 		//Nie bêdê siê powtarza³. ANI KROKU DALEJ!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_SLD_723_Attack (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 3;
	condition	= Info_SLD_723_Attack_Condition;
	information	= Info_SLD_723_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_723_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE							) 
	&&  (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_SLD_723_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

//------------------------------------------------------------------------
//	Info PAROLE
//------------------------------------------------------------------------
instance Info_SLD_723_PAROLE (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 10;
	condition	= Info_SLD_723_PAROLE_Condition;
	information	= Info_SLD_723_PAROLE_Info;
	permanent	= 1;
	important	= 0;
	description	= "(podaj has³o)";
};                       

func int Info_SLD_723_PAROLE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	&&	(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 	TRUE;
	};
};

func int Info_SLD_723_PAROLE_Info()
{
	Info_ClearChoices 	(Info_SLD_723_PAROLE);
	Info_AddChoice 		(Info_SLD_723_PAROLE,"Cronos udzieli³ mi pozwolenia!"	,	Info_SLD_723_Parole_CRONOS);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"Cholera. Chyba zapomnia³em..."			,	Info_SLD_723_Parole_FORGOT);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"Has³o brzmi TERIANTROCH."			,	Info_SLD_723_Parole_FALSE2);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"Has³o brzmi TETRIANDOCH."			,	Info_SLD_723_Parole_TRUE);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"Has³o brzmi TETRIDANOCH."			,	Info_SLD_723_Parole_FALSE1);  
};

//========================================
//-----------------> LARES
//========================================

INSTANCE DIA_Soeldner_LARES (C_INFO)
{
   npc          = SLD_723_Soeldner;
   nr           = 1;
   condition    = DIA_Soeldner_LARES_Condition;
   information  = DIA_Soeldner_LARES_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Soeldner_LARES_Condition()
{
    if (kapitel == 4)
    && (Npc_GetTrueGuild(hero) != GIL_BAU)
	//((Npc_GetTrueGuild(hero) == GIL_SLD)
   // || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_NONE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Soeldner_LARES_Info()
{
    AI_Output (self, other ,"DIA_Soeldner_LARES_03_01"); //Hej! Lares chce pilnie z tob¹ gadaæ! IdŸ do niego. 
    AI_Output (other, self ,"DIA_Soeldner_LARES_15_02"); //Czego ode mnie chce?
    AI_Output (self, other ,"DIA_Soeldner_LARES_03_03"); //Nie wiem. Pewnie sam ci to powie.
	if (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (Npc_GetTrueGuild(hero) == GIL_NOV)
	{
	AI_Output (self, other ,"DIA_Soeldner_LARES_03_04"); //Aha. Jest jeszcze jedna sprawa. 
	AI_Output (self, other ,"DIA_Soeldner_LARES_03_05"); //W Obozie by³ kurier z Bractwa. Powiedzia³, ¿e Cor Angar kaza³ ci wspomóc nas w obecnej sytuacji. 
	AI_Output (self, other ,"DIA_Soeldner_LARES_03_06"); //Prawdopodobnie wszystko wyjaœni siê, gdy pogadasz z Laresem i zastosujesz siê do jego instrukcji.  
	 MIS_PsiAbadonedMine = LOG_RUNNING;

        Log_CreateTopic            (CH4_PsiAbadonedMine, LOG_MISSION);
        Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_RUNNING);
        B_LogEntry                     (CH4_PsiAbadonedMine,"Cor Angar poprzez kuriera przys³a³ mi nowe wytyczne. Mam trzymaæ siê planów Nowego Obozu i ich wspieraæ. Wszystko wydaje siê popl¹tane przez obecn¹ sytuacjê w Kolonii. Magowie Wody myœl¹ o obalaniu Bariery, gdy tymczasem Najemnicy tocz¹ wojnê ze Starym Obozem. Muszê pomóc obu gildiom i czekaæ na rozwój wydarzeñ. Najlepiej pójdê od razu do Laresa. Z penwoœci¹ ma dla mnie wa¿ne zadanie.");
	};
    AI_StopProcessInfos	(self);
};