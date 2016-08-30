//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bofur_EXIT(C_INFO)
{
	npc             = ORG_956_Bofur;
	nr              = 999;
	condition	= DIA_Bofur_EXIT_Condition;
	information	= DIA_Bofur_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bofur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bofur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEFF
//========================================

INSTANCE DIA_Bofur_THIEFF (C_INFO)
{
   npc          = ORG_956_Bofur;
   nr           = 1;
   condition    = DIA_Bofur_THIEFF_Condition;
   information  = DIA_Bofur_THIEFF_Info;
   permanent	= FALSE;
   description	= "No prosz�, co za wspania�a kryj�wka.";
};

FUNC INT DIA_Bofur_THIEFF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bofur_THIEFF_Info()
{
    AI_Output (other, self ,"DIA_Bofur_THIEFF_15_01"); //No prosz�, co za wspania�a kryj�wka. My�la�e�, �e jak wejdziesz za wodospad, to znikniesz w tajemniczych okoliczno�ciach?
    AI_Output (self, other ,"DIA_Bofur_THIEFF_03_02"); //Nie, mam od tego zwoje kole�. Mog� si� przenie��, gdzie mi si� podoba.
    AI_Output (other, self ,"DIA_Bofur_THIEFF_15_03"); //Hmm, a mo�e ukrywasz si� przed Cronosem?
    AI_Output (self, other ,"DIA_Bofur_THIEFF_03_04"); //Wi�c on ci� tu przys�a�? W takim razie gi�!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};