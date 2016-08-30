//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_MAGAZYNIER_EXIT(C_INFO)
{
	npc             = GRD_2032_MAGAZYNIER;
	nr              = 999;
	condition	= DIA_MAGAZYNIER_EXIT_Condition;
	information	= DIA_MAGAZYNIER_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_MAGAZYNIER_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MAGAZYNIER_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WARN
//========================================

INSTANCE DIA_MAGAZYNIER_WARN (C_INFO)
{
   npc          = GRD_2032_MAGAZYNIER;
   nr           = 1;
   condition    = DIA_MAGAZYNIER_WARN_Condition;
   information  = DIA_MAGAZYNIER_WARN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MAGAZYNIER_WARN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_DungeonGuard_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MAGAZYNIER_WARN_Info()
{
    AI_Output (self, other ,"DIA_MAGAZYNIER_WARN_03_01"); //Czego tu szukasz? My�la�em, �e Stra�nik strzeg�cy wej�cia od strony Zewn�trznego Pier�cienia mia� tu nikogo nie wpuszcza�!
    AI_Output (other, self ,"DIA_MAGAZYNIER_WARN_15_02"); //Dogada�em si� z nim, mo�e z wami te� uda mi si� dogada�, �eby�cie nie pisn�li s��wka Magnatom?
    AI_Output (self, other ,"DIA_MAGAZYNIER_WARN_03_03"); //P�a� 200 bry�ek rudy albo gi�, szujo z Nowego Obozu.

    Info_ClearChoices		(DIA_MAGAZYNIER_WARN);
	if (Npc_HasItems (hero, ItMiNugget)>=200)
	{
    Info_AddChoice		(DIA_MAGAZYNIER_WARN, "Niech b�dzie, oto 200 bry�ek rudy.", DIA_MAGAZYNIER_WARN_PAY_ORE);
	};
    Info_AddChoice		(DIA_MAGAZYNIER_WARN, "Wal si�.", DIA_MAGAZYNIER_WARN_WAL_SIE);
};

FUNC VOID DIA_MAGAZYNIER_WARN_PAY_ORE()
{
    AI_Output (other, self ,"DIA_MAGAZYNIER_WARN_PAY_ORE_15_01"); //Niech b�dzie, oto 200 bry�ek rudy.
    B_GiveInvItems (other, self, ItMiNugget, 200);
    AI_Output (self, other ,"DIA_MAGAZYNIER_WARN_PAY_ORE_03_02"); //W takim razie w porz�dku. Bierz, co chcesz, a my nic powiemy, tylko lepiej nas nie wkurzaj!
    B_LogEntry                     (CH1_Magazyny_OC,"Dogadanie si� ze Stra�nikami to pestka. Mam nadziej�, �e te inwestycje wkr�tce mi si� zwr�c�.");

    B_GiveXP (100);
    Info_ClearChoices		(DIA_MAGAZYNIER_WARN);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_MAGAZYNIER_WARN_WAL_SIE()
{
    AI_Output (other, self ,"DIA_MAGAZYNIER_WARN_WAL_SIE_15_01"); //Wal si�.
    AI_Output (self, other ,"DIA_MAGAZYNIER_WARN_WAL_SIE_03_02"); //W takim razie czas gin��, szumowino. Bra� go ch�opaki!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};