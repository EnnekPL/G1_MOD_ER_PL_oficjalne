// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_7_EXIT_Condition;
	information	= Info_Bau_7_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Bau_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							LifeInCamp
// *************************************************************************

INSTANCE Info_Bau_7_LifeInCamp(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_7_LifeInCamp_Condition;
	information	= Info_Bau_7_LifeInCamp_Info;
	permanent	= 1;
	description = "Jak ci si� �yje w obozie?";
};                       

FUNC INT Info_Bau_7_LifeInCamp_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_7_LifeInCamp_Info()
{
	AI_Output(other,self,"Info_Bau_7_LifeInCamp_15_00"); //Jak ci si� �yje w obozie?
	AI_Output(self,other,"Info_Bau_7_LifeInCamp_07_01"); //W por�wnaniu ze Starym Obozem jest ci�ko. Brakuje mi luksusowych towar�w, kt�re swego czasu dostawa�em w obozie.
	AI_Output(self,other,"Info_Bau_7_LifeInCamp_07_02"); //Do tej pory nie wiem, dlaczego uciek�em. 
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_7_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_7_DasLager_Condition;
	information	= Info_Bau_7_DasLager_Info;
	permanent	= 1;
	description = "Opowiedz mi o tym obozie.";
};                       

FUNC INT Info_Bau_7_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_7_DasLager_15_00"); //Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Bau_7_DasLager_07_01"); //Wi�kszo�� mieszka�c�w tego obozu to uchod�cy z innych miejsc szukaj�cy prostego �ycia. 
	AI_Output(self,other,"Info_Bau_7_DasLager_07_02"); //Naprawd� ma�o kto ma tutaj ambicje wi�ksze ni� po prostu by� najedzonym. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_7_DieLage_Condition;
	information	= Info_Bau_7_DieLage_Info;
	permanent	= 1;
	description = "Jak si� masz?";
};                       

FUNC INT Info_Bau_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_7_DieLage_15_00"); //Jak si� masz?
	AI_Output(self,other,"Info_Bau_7_DieLage_07_01"); //Niezbyt dobrze. Ta przygn�biaj�ca pogoda tylko pog��bia m�j smutek.
	AI_Output(other,self,"Info_Bau_7_DieLage_15_02"); //W czym problem? 
	AI_Output(self,other,"Info_Bau_7_DieLage_07_03"); //Tak w�a�ciwie to w niczym. Id� ju�!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_bau_7_Peoples(C_INFO)
{
	nr			= 1;
	condition	= Info_bau_7_Peoples_Condition;
	information	= Info_bau_7_Peoples_Info;
	permanent	= 1;
	description = "Kto tu rz�dzi?";
};                       

FUNC INT Info_bau_7_Peoples_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_bau_7_Peoples_Info()
{
	AI_Output(other,self,"Info_bau_7_Peoples_15_00"); //Kto tu rz�dzi?
	AI_Output(self,other,"Info_bau_7_Peoples_07_01"); //Quentin pilnuje tego ca�ego burdelu. Bez niego bandyci robiliby co chcieli.
	AI_Output(self,other,"Info_bau_7_Peoples_07_02"); //Pomagaj� mu Rocky i Doyle. Najbardziej wp�ywowe osoby w obozie. 

};
// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_bau_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_bau_7_EinerVonEuchWerden_Condition;
	information	= Info_bau_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chc� do was do��czy�.";
};                       

FUNC INT Info_bau_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_bau_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_bau_7_EinerVonEuchWerden_15_00"); //Chc� do was do��czy�.
	AI_Output(self,other,"Info_bau_7_EinerVonEuchWerden_02_01"); //Pogadaj z Draxem. On zajmuje si� rekrutacj� w obozie. 
};
FUNC VOID B_AssignAmbientInfos_Bau_7(var c_NPC slf)
{
	Info_Bau_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_7_LifeInCamp.npc			= Hlp_GetInstanceID(slf);
	Info_Bau_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_bau_7_Peoples.npc				= Hlp_GetInstanceID(slf);
	Info_bau_7_EinerVonEuchWerden.npc  = Hlp_GetInstanceID(slf);
};








