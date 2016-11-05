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
	description = DIALOG_ENDE;
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
	description = "Jak ci siê ¿yje w obozie?";
};                       

FUNC INT Info_Bau_6_LifeInCamp_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_LifeInCamp_Info()
{
	AI_Output(other,self,"Info_Bau_6_LifeInCamp_15_00"); //Jak ci siê ¿yje w obozie?
	AI_Output(self,other,"Info_Bau_6_LifeInCamp_06_01"); //Nie jest Ÿle. Bandyci ze sob¹ wspó³pracuj¹. Mamy jedzenie, rudê i bezpieczeñstwo. 
	AI_Output(self,other,"Info_Bau_6_LifeInCamp_06_02"); //Od czasu do czasu Quentin zleca ma³e zadanie jednemu z nas.
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
	AI_Output(self,other,"Info_Bau_6_DasLager_06_01"); //Wiêkszoœæ mieszkañców tego obozu to uchodŸcy z innych miejsc szukaj¹cy prostego ¿ycia. 
	AI_Output(self,other,"Info_Bau_6_DasLager_06_02"); //Naprawdê ma³o kto ma tutaj ambicje wiêksze ni¿ po prostu byæ najedzonym. 
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
	description = "Jak siê masz?";
};                       

FUNC INT Info_Bau_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_6_DieLage_15_00"); //Jak siê masz?
	AI_Output(self,other,"Info_Bau_6_DieLage_06_01"); //NieŸle. Nie mam nic do roboty. 
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
	description = "Kto tu rz¹dzi?";
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
	AI_Output(other,self,"Info_bau_6_Peoples_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_bau_6_Peoples_07_01"); //Quentin pilnuje tego ca³ego burdelu. Bez niego bandyci robiliby co chcieli.
	AI_Output(self,other,"Info_bau_6_Peoples_07_02"); //Pomagaj¹ mu Rocky i Doyle. Najbardziej wp³ywowe osoby w obozie. 

};
FUNC VOID B_AssignAmbientInfos_Bau_6(var c_NPC slf)
{
	Info_Bau_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_6_LifeInCamp.npc			= Hlp_GetInstanceID(slf);
	Info_Bau_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_6_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_bau_6_Peoples.npc				= Hlp_GetInstanceID(slf);
};








