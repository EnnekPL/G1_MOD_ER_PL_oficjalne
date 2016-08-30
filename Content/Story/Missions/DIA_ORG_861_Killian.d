//poprawione i sprawdzone - Nocturn

instance  ORG_861_Killian_Exit (C_INFO)
{
	npc			=  ORG_861_Killian;
	nr			=  999;
	condition	=  ORG_861_Killian_Exit_Condition;
	information	=  ORG_861_Killian_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*****************************************************************
//						Verpi� dich								
//*****************************************************************

instance  ORG_861_Killian_GetLost (C_INFO)
{
	npc			=  ORG_861_Killian;
	nr			=  1;
	condition	=  ORG_861_Killian_GetLost_Condition;
	information	=  ORG_861_Killian_GetLost_Info;
	permanent	=  1;
	important 	= 1;
};                       

FUNC int  ORG_861_Killian_GetLost_Condition()
{
	if (Npc_IsInState(self,ZS_Talk)) &&  (Kalom_DrugMonopol != LOG_SUCCESS) 
	{
		return TRUE;
	};
};

FUNC VOID  ORG_861_Killian_GetLost_Info()
{
	AI_Output (self, other,"Org_861_Killian_GetLost_Info_13_00"); //Spadaj!
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> OhHello
//========================================

INSTANCE DIA_Killian_OhHello (C_INFO)
{
   npc          = ORG_861_Killian;
   nr           = 1;
   condition    = DIA_Killian_OhHello_Condition;
   information  = DIA_Killian_OhHello_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Killian_OhHello_Condition()
{
    if (Npc_GetDistToWP (self, "OW_CAVE_KILIAN") < 600)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Killian_OhHello_Info()
{
    AI_Output (other, self ,"DIA_Killian_OhHello_15_01"); //Co ty tu robisz?
    AI_Output (self, other ,"DIA_Killian_OhHello_03_02"); //Znowu ty! Czego chcesz? Nie widzisz, �e ju� nie zajmuj� si� zielem?! 
    AI_Output (other, self ,"DIA_Killian_OhHello_15_03"); //Wybra�e� niezbyt ciekawe miejsce...
    AI_Output (self, other ,"DIA_Killian_OhHello_03_04"); //C�, s�dzi�em, �e ci� ju� wi�cej nie spotkam. Zszed�em ci z drogi, wi�c daj mi ju� wreszcie spok�j!
    AI_Output (other, self ,"DIA_Killian_OhHello_15_05"); //Dobra, dobra. 
    AI_StopProcessInfos	(self);
};




/*

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_WORK (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_WORK_Condition;
	information		= ORG_861_Killian_WORK_Info;
	important		= 0;
	permanent		= 0;
	description		= " Wie l�ufts?"; 
};

FUNC int  ORG_861_Killian_WORK_Condition()
{
	return TRUE;
};


FUNC void  ORG_861_Killian_WORK_Info()
{
	AI_Output (other, self,"Org_861_Killian_WORK_Info_15_01"); //Wie l�ufts?
	AI_Output (self, other,"Org_861_Killian_WORK_Info_13_02"); //Lass mich in Ruhe! Ich bin besch�ftigt!
};  

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_DEAL (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_DEAL_Condition;
	information		= ORG_861_Killian_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie l�ufts Kumpel?"; 
};

FUNC int  ORG_861_Killian_DEAL_Condition()
{	
	if ( Kalom_DrugMonopol == LOG_RUNNING)
	&& (idiots_deal == TRUE)
	{
		return TRUE;
	};

};
FUNC void  ORG_861_Killian_DEAL_Info()
{
	AI_Output (other, self,"Org_861_Killian_DEAL_Info_15_01"); //Wie l�ufts Kumpel?
	AI_Output (self, other,"Org_861_Killian_DEAL_Info_13_02"); //Wir haben zwar eine Abmachung, aber ich bin nicht dein Kumpel, Penner!
};  

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_LOST (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_LOST_Condition;
	information		= ORG_861_Killian_LOST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Und du penner? H�ltst du jetzt die F��e still?"; 
};

FUNC int  ORG_861_Killian_LOST_Condition()
{	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] ;
	
	if (Killian.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,ORG_860_Renyu_DEAL))
	{
		return TRUE;
	};

};
FUNC void  ORG_861_Killian_LOST_Info()
{
	AI_Output (other, self,"Org_861_Killian_LOST_Info_15_01"); //Und du penner? H�ltst du jetzt die F��e still?
	AI_Output (self, other,"Org_861_Killian_LOST_Info_13_02"); //Hey KUMPEL, ich wusste ja nicht, das die Brudeschaft da soviel Wert darauf legt!
	AI_Output (other, self,"Org_861_Killian_LOST_Info_15_03"); //Ich bin nicht dein Kumpel, Penner! 
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"ARBEITSLOS");
};

*/
