//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// **************************************

instance DIA_846_Exit (C_INFO)
{
	npc			= Org_846_Schlaeger;
	nr			= 999;
	condition	= DIA_846_Exit_Condition;
	information	= DIA_846_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_846_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_846_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				Hallo
// **************************************

instance DIA_846_Hello (C_INFO)
{
	npc			= Org_846_Schlaeger;
	nr			= 1;
	condition	= DIA_846_Hello_Condition;
	information	= DIA_846_Hello_Info;
	permanent	= 0;
	description	= "Co tu robisz?";
};                       

FUNC int DIA_846_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_846_Hello_Info()
{
	AI_Output (other, self,"DIA_846_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracujê dla Ry¿owego Ksiêcia.
	
	var C_NPC Lefty; Lefty = Hlp_GetNpc (Org_844_Lefty);
	if (!Npc_IsDead(Lefty))
	{
		AI_Output (self, other,"DIA_846_Hello_07_02"); //Jakbyœ czegoœ potrzebowa³, zapytaj Lewusa.
	};
};

//========================================
//-----------------> ALCO
//========================================

INSTANCE DIA_Schlaeger_ALCO (C_INFO)
{
   npc          = Org_846_Schlaeger;
   nr           = 1;
   condition    = DIA_Schlaeger_ALCO_Condition;
   information  = DIA_Schlaeger_ALCO_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Homer, mam dla ciebie ry¿ówkê.";
};

FUNC INT DIA_Schlaeger_ALCO_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schlaeger_ALCO_Info()
{
    AI_Output (other, self ,"DIA_Schlaeger_ALCO_15_01"); //Przysy³a mnie Homer, mam dla ciebie ry¿ówkê.
    AI_Output (self, other ,"DIA_Schlaeger_ALCO_03_02"); //Dobra, daj to tutaj.
    AI_Output (self, other ,"DIA_Schlaeger_ALCO_03_03"); //To mia³y byæ trzy butelki.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Schlaeger_ALCO_15_04"); //I tyle jest.
        B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
        b_givexp (50);
		DIA_Schlaeger_ALCO.permanent = false;
    }
    else
    {
        AI_Output (other, self ,"DIA_Schlaeger_ALCO_15_05"); //I zaraz tyle bêdzie.
		DIA_Schlaeger_ALCO.permanent = true;
    };
    AI_StopProcessInfos	(self);
};

