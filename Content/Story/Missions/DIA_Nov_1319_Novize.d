//poprawione i sprawdzone - Nocturn

// ------------------------------ Gro�e Beschw�rung starten ----------------------------------
instance  NOV_1319_Novize_CALLSLEEPER (C_INFO)
{
	npc				= NOV_1319_Novize;
	condition		= NOV_1319_Novize_CALLSLEEPER_Condition;
	information		= NOV_1319_Novize_CALLSLEEPER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  NOV_1319_Novize_CALLSLEEPER_Condition()
{	
	var C_NPC Novize;	Novize	 = Hlp_GetNpc	(NOV_1319_Novize);
	var C_NPC Kalom;	Kalom	 = Hlp_GetNpc	(GUR_1201_CorKalom);				

	if (	(CorKalom_BringBook == LOG_SUCCESS)
	
	&&		(Npc_GetDistToWP(Novize,	"PSI_TEMPLE_COURT_2")<1000)
	&&		C_TimeForGreatPrayer()	
	&&		(! Npc_KnowsInfo (hero,NOV_1320_Novize_CALLSLEEPER))
	&&      ( !Npc_KnowsInfo (hero, Tpl_1431_Templer_CALLSLEEPER ) ) 
	&&      ( !Npc_KnowsInfo (hero, Tpl_1430_Templer_CALLSLEEPER ) ) 
	&&      (Npc_GetDisttoWP (Kalom,"PSI_TEMPLE_STAIRS_RIGHT") < 300)	)
	{
		return TRUE;
	};
};
FUNC void  NOV_1319_Novize_CALLSLEEPER_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(3);
};

//========================================
//-----------------> QUEST
//========================================

INSTANCE DIA_NowicjuszSwiadek_QUEST (C_INFO)
{
   npc          = NOV_1319_NOVIZE;
   nr           = 1;
   condition    = DIA_NowicjuszSwiadek_QUEST_Condition;
   information  = DIA_NowicjuszSwiadek_QUEST_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_NowicjuszSwiadek_QUEST_Condition()
{
	if (MIS_UciekinierPC == LOG_RUNNING)
	{
    return TRUE;
	};
};

FUNC VOID DIA_NowicjuszSwiadek_QUEST_Info()
{
    AI_Output (self, other ,"DIA_NowicjuszSwiadek_QUEST_03_01"); //Mistrzu, nie wiem czy mog� si� do ciebie odezwa�, ale s�ysza�em, �e szukasz z�odzieja, kt�ry ukrad� kostur Y'Beriona.
    AI_Output (self, other ,"DIA_NowicjuszSwiadek_QUEST_03_02"); //Widzia�em, �e uciek� w stron� bagna. Nie wybieg� z Obozu. 
	B_LogEntry     (CH1_UciekinierPC,"Nieznajomy Nowicjusz zaczepi� mnie na placu i powiedzia�, �e widzia� jak podczas przywo�ania z�odziej ucieka na bagno. Wiem, �e na pewno nie uciek� z Obozu.");
};