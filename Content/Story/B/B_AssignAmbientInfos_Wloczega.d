
// *************************************************************************
// 									Kapitel 1
// *************************************************************************

var int WhoYou_Talk_Wczg;
// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_wczg_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_wczg_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_wczg_2_EXIT_Condition;
	information	= Info_wczg_2_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_wczg_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_wczg_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_wczg_2_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_wczg_2_WichtigePersonen_Condition;
	information	= Info_wczg_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kim jesteœ?";
};                       

FUNC INT Info_wczg_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_wczg_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_wczg_2_WichtigePersonen_15_00"); //Kim jesteœ?
	AI_Output(self,other,"Info_wczg_2_WichtigePersonen_02_01"); //Jestem uciekinierem z Nowego Obozu. Na wolnoœci ¿yje mi siê dobrze, choæ ciê¿ko. 
	WhoYou_Talk_Wczg = true;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_wczg_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_wczg_2_DasLager_Condition;
	information	= Info_wczg_2_DasLager_Info;
	permanent	= 1;
	description = "Dlaczego uciek³eœ?";
};                       

FUNC INT Info_wczg_2_DasLager_Condition()
{
if (WhoYou_Talk_Wczg == true) {
	return 1; };
};

FUNC VOID Info_wczg_2_DasLager_Info()
{
	AI_Output(other,self,"Info_wczg_2_DasLager_15_00"); //Dlaczego uciek³eœ?
	AI_Output(self,other,"Info_wczg_2_DasLager_02_01"); //A dlaczego mia³em tam zostaæ? Lewus zmusza³ nas do kilkunosto godzinnej pracy. Nie mog³em ju¿ tego wytrzymaæ.
	AI_Output(self,other,"Info_wczg_2_DasLager_02_03"); //Spêdzi³em tam mo¿e dwa lata. Potem da³em nogê. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_wczg_2_DieLage(C_INFO) // E1
{
	nr			= 3;
	condition	= Info_wczg_2_DieLage_Condition;
	information	= Info_wczg_2_DieLage_Info;
	permanent	= 1;
	description = "Czy warto by³o uciekaæ?";
};                       

FUNC INT Info_wczg_2_DieLage_Condition()
{
if (WhoYou_Talk_Wczg == true) {
	return 1; };
};

FUNC VOID Info_wczg_2_DieLage_Info()
{
	AI_Output(other,self,"Info_wczg_2_DieLage_15_00"); //Czy warto by³o uciekaæ?
	AI_Output(self,other,"Info_wczg_2_DieLage_02_01"); //Oczywiœcie, ¿e tak. ¯ycie na wolnoœci jest ciê¿kie, ale nie a¿ tak jak praca dla tych wieprzy. 
	AI_Output(self,other,"Info_wczg_2_DieLage_02_02"); //Teraz zbli¿a siê zima i mamy du¿o roboty. Zbieramy zapasy, trochê polujemy. Czasami ktoœ idzie noc¹ coœ podwêdziæ z obozu. 
	AI_Output(other,self,"Info_wczg_2_DieLage_15_03"); //Ogó³em nie jest Ÿle.
	AI_Output(self,other,"Info_wczg_2_DieLage_02_04"); //Dok³adnie.
};


FUNC VOID B_AssignAmbientInfos_wczg_2(var c_NPC slf)
{
	Info_wczg_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_wczg_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_wczg_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_wczg_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
