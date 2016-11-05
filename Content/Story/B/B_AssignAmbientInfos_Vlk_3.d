// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_3_EXIT_Condition;
	information	= Info_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_3_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobi�, �eby do was do��czy�?";
};                       

FUNC INT Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Co mam zrobi�, �eby do was do��czy�?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Jestem zwyk�ym Kopaczem. Moje zdanie si� nie liczy. Powiniene� porozmawia� ze Stra�nikami, albo z Cieniami.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz�dzi?";
};                       

FUNC INT Info_Vlk_3_WichtigePersonen_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Kto tu rz�dzi?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. Mieszka w zamku. Ale my - Kopacze - mamy do�� k�opot�w z jego Stra�nikami.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Lepiej trzyma� si� od nich z daleka. Je�li wejdziesz im w drog� - masz k�opoty.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_3_DasLager_Condition;
	information	= Info_Vlk_3_DasLager_Info;
	permanent	= 1;
	description = "Co powinienem tutaj obejrze�?";
};                       

FUNC INT Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Co powinienem tutaj obejrze�?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //C�, je�li lubisz hazard, powiniene� zajrze� wieczorem na aren�. Je�li chcesz co� kupi�, id� na targowisko.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Sprzedaj� tam prawie wszystko. Je�li potrzebujesz mapy - porozmawiaj z Grahamem. Jego chata le�y niemal dok�adnie naprzeciw zamkowej bramy.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_3_DieLage_Condition;
	information	= Info_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "Co si� dzieje?";
};                       

FUNC INT Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Co si� dzieje?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Sam si� dowiesz w swoim czasie. Miej oczy szeroko otwarte. Pilnuj si� zw�aszcza w nocy.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Od kilku dni nie wyspa�em si� porz�dnie. A w tej Kolonii kto nie �pi, ten pracuje na dwie zmiany!
};
var int dzien_vlk3;
		// *************************************************************************
// 									dawaj rude
// *************************************************************************

INSTANCE Info_Vlk_3_GiveOre(C_INFO) // E7 xD
{
	nr			= 5;
	condition	= Info_Vlk_3_GiveOre_Condition;
	information	= Info_Vlk_3_GiveOre_Info;
	permanent	= 1;
	description = "Pora zap�ai�!";
};                       

FUNC INT Info_Vlk_3_Giveore_Condition()
{
if (hero.guild == GIL_GRD)
&& (dzien_vlk3 != wld_getday())
{
	return 1;
};
};

FUNC VOID Info_Vlk_3_GiveOre_Info()
{
	AI_Output(other,self,"Info_Vlk_3_GiveOre_15_00"); //P�a� za ochron�!
	AI_Output(self,other,"Info_Vlk_3_GiveOre_01_01"); //Dobra, ju� dobra. Masz!
	CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
	dzien_vlk3 =	wld_getday();
};
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_GiveOre.npc				= Hlp_GetInstanceID(slf);
};
