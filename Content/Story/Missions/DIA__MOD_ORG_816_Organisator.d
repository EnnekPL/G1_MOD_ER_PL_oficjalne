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
   description	= "Ty chyba masz coœ na sumieniu.";
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
    AI_Output (other, self ,"DIA_Organisator_Fight_15_01"); //Ty chyba masz coœ na sumieniu.
    AI_Output (self, other ,"DIA_Organisator_Fight_03_02"); //Zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Organisator_Fight_15_03"); //Doœæ tego, gdzie s¹ precjoza Cronosa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_04"); //Nie mam pojêcia, przysiêgam!
	AI_Output (self, other ,"DIA_Organisator_Fight_03_05"); //Umówiliœmy siê z Vincentem. Ja kradnê sakiewkê, a on j¹ sprzedaje za jakiœ czas w Starym Obozie. Mia³ nie wzbudzaæ podejrzeñ.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_06"); //Dzieñ wczeœniej zap³aci³ mi za robotê z góry 50 bry³ek rudy. Nie mam pojêcia, gdzie siê teraz ukrywa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_07"); //Powiedzia³ tylko, ¿e ma œwietn¹ kryjówkê w pobli¿u obozu. Mówi³, ¿e nikt przenigdy go tam nie znajdzie.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_08"); //Masz, weŸ tê rudê, któr¹ zarobi³em. I tak wkrótce trafiê do piachu.
	AI_DrawWeapon		(self);
	AI_Output (other, self ,"DIA_Organisator_Fight_15_09"); //Nie rób nic pochopnie!
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Znalaz³em Szkodnika, który okrad³ Cronosa. Zanim pope³ni³ samobójstwo przyzna³ siê i powiedzia³, ¿e nie wie, gdzie jest jego wspólnik. Podobno ma œwietn¹ kryjówkê doœæ blisko Nowego Obozu. Muszê przeszukaæ pobliskie jaskinie.");
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50); 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "die");
};

