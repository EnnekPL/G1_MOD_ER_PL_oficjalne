//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Homer_EXIT (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 999;
	condition	= DIA_Homer_EXIT_Condition;
	information	= DIA_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Homer_Hello (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Hello_Condition;
	information	= DIA_Homer_Hello_Info;
	permanent	= 0;
	description = "Szukasz czego�?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Szukasz czego�?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Szukam p�kni�� w tamie. Chyba jaki� topielec podgryza jej fundamenty.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Paskuda uszkadza z�bami i pazurami kamienie i drewniane pale pod wod�.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Je�li nie przestanie, ca�� tam� trafi szlag!
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

INSTANCE DIA_Homer_BuiltDam (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_BuiltDam_Condition;
	information	= DIA_Homer_BuiltDam_Info;
	permanent	= 0;
	description = "Czy to TY zbudowa�e� t� tam�?";
};                       

FUNC INT DIA_Homer_BuiltDam_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_BuiltDam_Info()
{	
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa�e� t� tam�?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak. Zbudowa�em j� dawno temu, gdy Nowy Ob�z dopiero powstawa�.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Oczywi�cie wszyscy pomagali, ale to ja nadzorowa�em budow�.
};

// ************************************************************
// 						Kann ich helfen?
// ************************************************************
	var int Homer_DamLurker;
// ************************************************************

INSTANCE DIA_Homer_WannaHelp (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_WannaHelp_Condition;
	information	= DIA_Homer_WannaHelp_Info;
	permanent	= 0;
	description = "Mo�e mog� ci jako� pom�c?";
};                       

FUNC INT DIA_Homer_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_WannaHelp_Info()
{	
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Mo�e mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jasne. Spraw, �eby ta bestia przesta�a pod�era� moj� tam�.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker, "Homer opowiedzia� mi o topielcu, kt�ry podkopuje jego tam�. Je�li uda mi si� powstrzyma� potwora, tam� z pewno�ci� uda si� naprawi�");

};

// ************************************************************
// 						Running
// ************************************************************

INSTANCE DIA_Homer_Running (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Running_Condition;
	information	= DIA_Homer_Running_Info;
	permanent	= 0;
	description = "Gdzie mog� j� znale��?";
};                       

FUNC INT DIA_Homer_Running_Condition()
{
	if (Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Running_Info()
{	
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Gdzie mog� j� znale��?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Rozejrzyj si� po drugiej stronie jeziora. Nikt tam nigdy nie zagl�da. Za�o�� si�, �e tam ma swoje le�e!
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker, "Topielec musi mie� swoje le�e w nieucz�szczanej cz�ci zbiornika.");
	
};

// ************************************************************
// 						Success
// ************************************************************

INSTANCE DIA_Homer_Success (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_Success_Condition;
	information	= DIA_Homer_Success_Info;
	permanent	= 0;
	description = "Zabi�em besti�!";
};                       

FUNC INT DIA_Homer_Success_Condition()
{
	var C_NPC lurker; lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION, "name: ", lurker.name);
	PrintDebugInt	(PD_MISSION, "hp: ", lurker.attribute[ATR_HITPOINTS]);
	if	(Homer_DamLurker==LOG_RUNNING)
	//&&	(Npc_IsDead(lurker))					//SN: auskommentiert, da Hlp_GetNpc() die C_NPC lurker nicht initialisieren kann!
	&&	(Npc_HasItems(hero,ItAt_DamLurker_01))		//SN: Workaround!
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Success_Info()
{	
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabi�em besti�!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //�wietnie! �ci�gn��em tu kilku ludzi Ry�owego Ksi�cia, kt�rzy pomogli mi naprawi� uszkodzenia.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //Nareszcie mog� si� porz�dnie wyspa�.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker, "Topielec nie �yje. Homer mo�e ju� spa� spokojnie.");
	B_GiveXP			(XP_ReportDeadDamLurker);
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"START");
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Homer_PERM (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_PERM_Condition;
	information	= DIA_Homer_PERM_Info;
	permanent	= 1;
	description = "Z tam� wszystko w porz�dku?";
};                       

FUNC INT DIA_Homer_PERM_Condition()
{
	if (Homer_DamLurker ==LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_PERM_Info()
{	
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Z tam� wszystko w porz�dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Mocna jak ska�a. Nic jej nie zaszkodzi!
};
//========================================
//-----------------> PopieraszBunt
//========================================

INSTANCE DIA_Homer_PopieraszBunt (C_INFO)
{
   npc          = Bau_935_Homer;
   nr           = 1;
   condition    = DIA_Homer_PopieraszBunt_Condition;
   information  = DIA_Homer_PopieraszBunt_Info;
   permanent	= FALSE;
   description	= "Jeste� lojalny wobec Ry�owego Ksi�cia?";
};

FUNC INT DIA_Homer_PopieraszBunt_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Jestem))
	&& (MIS_BuntZbieraczy == LOG_RUNNING)      
	{
    return TRUE;
    };
};


FUNC VOID DIA_Homer_PopieraszBunt_Info()
{
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_15_01"); //Jeste� lojalny wobec Ry�owego Ksi�cia?
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_03_02"); //Nie bywam zbyt cz�sto na dole, ale tak. Ci�ko pracowa�em nad t� tam�. Ry�owy Ksi��e jako jedyny mnie docenia.
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_03_03"); //A czemu pytasz? Przysy�a ci� Lewus.
	AI_Output (other, self ,"DIA_Homer_PopieraszBunt_15_04"); //Hmm... Tak...
	AI_Output (self, other ,"DIA_Homer_PopieraszBunt_03_05"); //Czy on w ko�cu zrozumie, �e nikt ju� si� nie nabiera na te jego sztuczki? Co za cz�owiek...
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Homer jest zwolennikiem Ry�owego Ksi�cia, gdy� ten docenia jego prac� w�o�on� w budow� tamy.");
	B_GiveXP (150);
    //Info_ClearChoices		(DIA_Homer_PopieraszBunt);
    //Info_AddChoice		(DIA_Homer_PopieraszBunt, "Jeste� lojalny wobec Ry�owego Ksi�cia?", DIA_Homer_PopieraszBunt_lOJALNY);
    //Info_AddChoice		(DIA_Homer_PopieraszBunt, "Co do tego buntu...", DIA_Homer_PopieraszBunt_PAPLA);
};

FUNC VOID DIA_Homer_PopieraszBunt_lOJALNY()
{
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_lOJALNY_15_01"); //Jeste� lojalny wobec Ry�owego Ksi�cia?
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_lOJALNY_03_02"); //Tak. Dobrze mnie traktuje.
    B_LogEntry                     (CH1_BuntZbieraczy,"Homer to przydupas Ry�owego Ksi�cia. Z pewno�ci� powiedzia�by mu o wszystkim.");
    Homer_Rozpracowany = true;
    B_GiveXP (100);
    Info_ClearChoices		(DIA_Homer_PopieraszBunt);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Homer_PopieraszBunt_PAPLA()
{
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_PAPLA_15_01"); //Co do tego buntu...
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_PAPLA_03_02"); //S�ucham.
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_PAPLA_15_03"); //Rufus planuje akcj�. Chce, abym zakrad� si� w nocy i zabi� tego spa�laka.
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_PAPLA_15_04"); //Zbieracze zajm� si� Lewusem i jego lud�mi.
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_PAPLA_03_05"); //A wi�c to tak...
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_PAPLA_03_06"); //Dzi�ki za informacje...
    AI_Output (other, self ,"DIA_Homer_PopieraszBunt_PAPLA_15_07"); //Czyli jeste� z nami?
    AI_Output (self, other ,"DIA_Homer_PopieraszBunt_PAPLA_03_08"); //Tak, tak. Musz� ju� i��.
    B_LogEntry                     (CH1_BuntZbieraczy,"Homer jest z nami.");
    Homer_Rozpracowany = false;
    B_GiveXP (10);
    Info_ClearChoices		(DIA_Homer_PopieraszBunt);
    AI_StopProcessInfos	(self);
};