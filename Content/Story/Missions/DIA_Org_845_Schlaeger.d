//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// **************************************

instance DIA_845_Exit (C_INFO)
{
	npc			= Org_845_Schlaeger;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_845_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_845_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Hallo
// **************************************

instance DIA_845_Hello (C_INFO)
{
	npc			= Org_845_Schlaeger;
	nr			= 1;
	condition	= DIA_845_Hello_Condition;
	information	= DIA_845_Hello_Info;
	permanent	= 0;
	description	= "Co tu robisz?";
};                       

FUNC int DIA_845_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_845_Hello_Info()
{
	AI_Output (other, self,"DIA_845_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_845_Hello_13_01"); //Pracujê dla Ry¿owego Ksiêcia.
	
	var C_NPC Lefty; Lefty = Hlp_GetNpc (Org_844_Lefty);
	if (!Npc_IsDead(Lefty))
	{
		AI_Output (self, other,"DIA_845_Hello_13_02"); //Jakbyœ czegoœ potrzebowa³, zapytaj Lewusa.
	};
};

//========================================
//-----------------> VODKA
//========================================

INSTANCE DIA_Schlaeger_VODKA (C_INFO)
{
   npc          = Org_845_Schlaeger;
   nr           = 1;
   condition    = DIA_Schlaeger_VODKA_Condition;
   information  = DIA_Schlaeger_VODKA_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie trzy butelki ry¿ówki prosto od Jeremiasza.";
};

FUNC INT DIA_Schlaeger_VODKA_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schlaeger_VODKA_Info()
{
    AI_Output (other, self ,"DIA_Schlaeger_VODKA_15_01"); //Mam dla ciebie trzy butelki ry¿ówki prosto od Jeremiasza.
    AI_Output (self, other ,"DIA_Schlaeger_VODKA_03_02"); //Ta, a ja jestem panem Varantu. 
    AI_Output (self, other ,"DIA_Schlaeger_VODKA_03_03"); //Nie nabierzesz mnie tak ³atwo koleœ!
    AI_Output (other, self ,"DIA_Schlaeger_VODKA_15_04"); //Homer.
    AI_Output (self, other ,"DIA_Schlaeger_VODKA_03_05"); //Dobra, w porz¹dku. Daj to tutaj.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
        b_givexp (50);
		DIA_Schlaeger_VODKA.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Schlaeger_VODKA_03_06"); //Mia³y byæ TRZY butelki do cholery!
		DIA_Schlaeger_VODKA.permanent = true;
    };
    AI_StopProcessInfos	(self);
};

