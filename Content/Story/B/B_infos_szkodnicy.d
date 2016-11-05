// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_BANDYCI_SZKODNIKI_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_BANDYCI_SZKODNIKI_EXIT_Condition;
	information	= Info_BANDYCI_SZKODNIKI_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_BANDYCI_SZKODNIKI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BANDYCI_SZKODNIKI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Dialog
// *************************************************************************

INSTANCE Info_BANDYCI_SZKODNIKI_dialog(C_INFO)
{
	nr			= 3;
	condition	= Info_BANDYCI_SZKODNIKI_dialog_Condition;
	information	= Info_BANDYCI_SZKODNIKI_dialog_Info;
	permanent	= 1;
	description = "Co tam?";
};                       

FUNC INT Info_bandyci_szkodniki_dialog_Condition()
{
	return 1;
};

FUNC VOID Info_bandyci_szkodniki_dialog_Info()
{
	AI_Output(other,self,"Info_bandyci_szkodniki_dialog_15_00"); //Co tam?
	var int losuj_dialog;
	losuj_dialog = Hlp_Random (3);
	if losuj_dialog == 0
	{
	AI_Output(self,other,"Info_bandyci_szkodniki_dialog_02_01"); //Spadaj!
	}
	else if losuj_dialog == 1
	{
	AI_Output(self,other,"Info_bandyci_szkodniki_dialog_02_01"); //Nie masz tu czego szukać. Wynoś się!
	}
	else if losuj_dialog == 2
	{
	AI_Output(self,other,"Info_bandyci_szkodniki_dialog_02_01"); //Nie interesuj się!
};
};