// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_6_EXIT_Condition;
	information	= Info_Bau_6_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Bau_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							LifeInCamp
// *************************************************************************

INSTANCE Info_Bau_6_LifeInCamp(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_6_LifeInCamp_Condition;
	information	= Info_Bau_6_LifeInCamp_Info;
	permanent	= 1;
	description = "Jak ci si� �yje w obozie?";
};                       

FUNC INT Info_Bau_6_LifeInCamp_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_LifeInCamp_Info()
{
	AI_Output(other,self,"Info_Bau_6_LifeInCamp_15_00"); //Jak ci si� �yje w obozie?
	AI_Output(self,other,"Info_Bau_6_LifeInCamp_06_01"); //Nie jest �le. Bandyci ze sob� wsp�pracuj�. Mamy jedzenie, rud� i bezpiecze�stwo. 
	AI_Output(self,other,"Info_Bau_6_LifeInCamp_06_02"); //Od czasu do czasu Quentin zleca ma�e zadanie jednemu z nas.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_6_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_6_DasLager_Condition;
	information	= Info_Bau_6_DasLager_Info;
	permanent	= 1;
	description = "Opowiedz mi o tym obozie.";
};                       

FUNC INT Info_Bau_6_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_6_DasLager_15_00"); //Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Bau_6_DasLager_06_01"); //Wi�kszo�� mieszka�c�w tego obozu to uchod�cy z innych miejsc szukaj�cy prostego �ycia. 
	AI_Output(self,other,"Info_Bau_6_DasLager_06_02"); //Naprawd� ma�o kto ma tutaj ambicje wi�ksze ni� po prostu by� najedzonym. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_6_DieLage_Condition;
	information	= Info_Bau_6_DieLage_Info;
	permanent	= 1;
	description = "Jak si� masz?";
};                       

FUNC INT Info_Bau_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_6_DieLage_15_00"); //Jak si� masz?
	AI_Output(self,other,"Info_Bau_6_DieLage_06_01"); //Nie�le. Nie mam nic do roboty. 
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_bau_6_Peoples(C_INFO)
{
	nr			= 1;
	condition	= Info_bau_6_Peoples_Condition;
	information	= Info_bau_6_Peoples_Info;
	permanent	= 1;
	description = "Kto tu rz�dzi?";
};                       

FUNC INT Info_bau_6_Peoples_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_bau_6_Peoples_Info()
{
	AI_Output(other,self,"Info_bau_6_Peoples_15_00"); //Kto tu rz�dzi?
	AI_Output(self,other,"Info_bau_6_Peoples_07_01"); //Quentin pilnuje tego ca�ego burdelu. Bez niego bandyci robiliby co chcieli.
	AI_Output(self,other,"Info_bau_6_Peoples_07_02"); //Pomagaj� mu Rocky i Doyle. Najbardziej wp�ywowe osoby w obozie. 

};
FUNC VOID B_AssignAmbientInfos_Bau_6(var c_NPC slf)
{
	Info_Bau_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_6_LifeInCamp.npc			= Hlp_GetInstanceID(slf);
	Info_Bau_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_6_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_bau_6_Peoples.npc				= Hlp_GetInstanceID(slf);
};








