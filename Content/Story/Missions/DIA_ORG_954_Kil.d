//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Kil_EXIT(C_INFO)
{
	npc             = ORG_954_Kil;
	nr              = 999;
	condition	= DIA_Kil_EXIT_Condition;
	information	= DIA_Kil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Kil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEF
//========================================

INSTANCE DIA_Kil_THIEF (C_INFO)
{
   npc          = ORG_954_Kil;
   nr           = 1;
   condition    = DIA_Kil_THIEF_Condition;
   information  = DIA_Kil_THIEF_Info;
   permanent	= FALSE;
   description	= "Oddawajcie co nie wasze, parszywi z�odzieje!";
};

FUNC INT DIA_Kil_THIEF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kil_THIEF_Info()
{
    AI_Output (other, self ,"DIA_Kil_THIEF_15_01"); //Oddawajcie co nie wasze, parszywi z�odzieje!
    AI_Output (self, other ,"DIA_Kil_THIEF_03_02"); //Z�odzieje? Widz�, �e Cronos st�skni� si� za swoimi magicznymi zabawkami. Dawaj, Fil! Wypr�bujemy Kul� Ognia na tym �mieciu!
    AI_StopProcessInfos	(ORG_954_Kil);
    Npc_SetPermAttitude (ORG_954_Kil, ATT_HOSTILE);
    Npc_SetTarget (ORG_954_Kil, other);
    AI_StartState (ORG_954_Kil, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (ORG_955_Fil, ATT_HOSTILE);
    Npc_SetTarget (ORG_955_Fil, other);
    AI_StartState (ORG_955_Fil, ZS_ATTACK, 1, "");
};