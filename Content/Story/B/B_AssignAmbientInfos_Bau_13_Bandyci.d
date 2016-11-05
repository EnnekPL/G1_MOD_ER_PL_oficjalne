// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_13_EXIT_Condition;
	information	= Info_Bau_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bau_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							LifeInCamp
// *************************************************************************

INSTANCE Info_Bau_13_LifeInCamp(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_13_LifeInCamp_Condition;
	information	= Info_Bau_13_LifeInCamp_Info;
	permanent	= 1;
	description = "Jak ci siê ¿yje w obozie?";
};                       

FUNC INT Info_Bau_13_LifeInCamp_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_13_LifeInCamp_Info()
{
	AI_Output(other,self,"Info_Bau_13_LifeInCamp_15_00"); //Jak ci siê ¿yje w obozie?
	AI_Output(self,other,"Info_Bau_13_LifeInCamp_013_01"); //W porównaniu ze Starym Obozem jest ciê¿ko. Brakuje mi luksusowych towarów, które swego czasu dostawa³em w obozie.
	AI_Output(self,other,"Info_Bau_13_LifeInCamp_013_02"); //Do tej pory nie wiem, dlaczego uciek³em. 
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_13_DasLager_Condition;
	information	= Info_Bau_13_DasLager_Info;
	permanent	= 1;
	description = "Opowiedz mi o tym obozie.";
};                       

FUNC INT Info_Bau_13_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_13_DasLager_15_00"); //Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Bau_13_DasLager_013_01"); //Wiêkszoœæ mieszkañców tego obozu to uchodŸcy z innych miejsc szukaj¹cy prostego ¿ycia. 
	AI_Output(self,other,"Info_Bau_13_DasLager_013_02"); //Naprawdê ma³o kto ma tutaj ambicje wiêksze ni¿ po prostu byæ najedzonym. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_13_DieLage_Condition;
	information	= Info_Bau_13_DieLage_Info;
	permanent	= 1;
	description = "Jak siê masz?";
};                       

FUNC INT Info_Bau_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_13_DieLage_15_00"); //Jak siê masz?
	AI_Output(self,other,"Info_Bau_13_DieLage_013_01"); //Niezbyt dobrze. Ta przygnêbiaj¹ca pogoda tylko pog³êbia mój smutek.
	AI_Output(other,self,"Info_Bau_13_DieLage_15_02"); //W czym problem? 
	AI_Output(self,other,"Info_Bau_13_DieLage_013_03"); //Tak w³aœciwie to w niczym. IdŸ ju¿!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_bau_13_Peoples(C_INFO)
{
	nr			= 1;
	condition	= Info_bau_13_Peoples_Condition;
	information	= Info_bau_13_Peoples_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_bau_13_Peoples_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_bau_13_Peoples_Info()
{
	AI_Output(other,self,"Info_bau_13_Peoples_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_bau_13_Peoples_07_01"); //Quentin pilnuje tego ca³ego burdelu. Bez niego bandyci robiliby co chcieli.
	AI_Output(self,other,"Info_bau_13_Peoples_07_02"); //Pomagaj¹ mu Rocky i Doyle. Najbardziej wp³ywowe osoby w obozie. 

};
// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_bau_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_bau_13_EinerVonEuchWerden_Condition;
	information	= Info_bau_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chcê do was do³¹czyæ.";
};                       

FUNC INT Info_bau_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_bau_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_bau_13_EinerVonEuchWerden_15_00"); //Chcê do was do³¹czyæ.
	AI_Output(self,other,"Info_bau_13_EinerVonEuchWerden_02_01"); //Pogadaj z Draxem. On zajmuje siê rekrutacj¹ w obozie. 
};
FUNC VOID B_AssignAmbientInfos_Bau_13(var c_NPC slf)
{
	Info_Bau_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_13_LifeInCamp.npc			= Hlp_GetInstanceID(slf);
	Info_Bau_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_13_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_bau_13_Peoples.npc				= Hlp_GetInstanceID(slf);
	Info_bau_13_EinerVonEuchWerden.npc  = Hlp_GetInstanceID(slf);
};








