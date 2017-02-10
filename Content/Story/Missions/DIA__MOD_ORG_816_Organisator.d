// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator816_EXIT(C_INFO)
{
	npc             = ORG_816_Organisator;
	nr              = 999;
	condition		= DIA_Organisator816_EXIT_Condition;
	information		= DIA_Organisator816_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator816_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator816_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Organisator_Fight (C_INFO)
{
   npc          = ORG_816_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_Fight_Condition;
   information  = DIA_Organisator_Fight_Info;
   permanent	= FALSE;
   description	= "Ty chyba masz co� na sumieniu.";
};

FUNC INT DIA_Organisator_Fight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_CronosTheft))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_Fight_Info()
{
    AI_Output (other, self ,"DIA_Organisator_Fight_15_01"); //Ty chyba masz co� na sumieniu.
    AI_Output (self, other ,"DIA_Organisator_Fight_03_02"); //Zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Organisator_Fight_15_03"); //Do�� tego, gdzie s� precjoza Cronosa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_04"); //Nie mam poj�cia, przysi�gam!
	AI_Output (self, other ,"DIA_Organisator_Fight_03_05"); //Um�wili�my si� z Vincentem. Ja kradn� sakiewk�, a on j� sprzedaje za jaki� czas w Starym Obozie. Mia� nie wzbudza� podejrze�.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_06"); //Dzie� wcze�niej zap�aci� mi za robot� z g�ry 50 bry�ek rudy. Nie mam poj�cia, gdzie si� teraz ukrywa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_07"); //Powiedzia� tylko, �e ma �wietn� kryj�wk� w pobli�u obozu. M�wi�, �e nikt przenigdy go tam nie znajdzie.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_08"); //Masz, we� t� rud�, kt�r� zarobi�em. I tak wkr�tce trafi� do piachu.
	AI_DrawWeapon		(self);
	AI_Output (other, self ,"DIA_Organisator_Fight_15_09"); //Nie r�b nic pochopnie!
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Znalaz�em Szkodnika, kt�ry okrad� Cronosa. Zanim pope�ni� samob�jstwo przyzna� si� i powiedzia�, �e nie wie, gdzie jest jego wsp�lnik. Podobno ma �wietn� kryj�wk� do�� blisko Nowego Obozu. Musz� przeszuka� pobliskie jaskinie.");
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50); 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "die");
};

