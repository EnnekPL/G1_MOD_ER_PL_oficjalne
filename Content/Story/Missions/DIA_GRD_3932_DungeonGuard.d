//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_DungeonGuard_EXIT(C_INFO)
{
	npc             = GRD_3932_DungeonGuard;
	nr              = 999;
	condition	= DIA_DungeonGuard_EXIT_Condition;
	information	= DIA_DungeonGuard_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_DungeonGuard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DungeonGuard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_DungeonGuard_HELLO1 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 1;
   condition    = DIA_DungeonGuard_HELLO1_Condition;
   information  = DIA_DungeonGuard_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_DungeonGuard_HELLO1_Condition()
{
	if (MIS_ZabojstwBlizny != LOG_RUNNING)
	{
    return TRUE;
	};
};

FUNC VOID DIA_DungeonGuard_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO1_03_01"); //Hej, ty! Nie masz tu czego szuka�! Do piwnic mog� wchodzi� tytko Magnaci, a ty nie jeste� jednym z nich. SPADAJ!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_DungeonGuard_HELLO2 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 2;
   condition    = DIA_DungeonGuard_HELLO2_Condition;
   information  = DIA_DungeonGuard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo�e jednak si� jako� dogadamy?";
};

FUNC INT DIA_DungeonGuard_HELLO2_Condition()
{
    if (MIS_Magazyny_OC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DungeonGuard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_01"); //Mo�e jednak si� jako� dogadamy?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_02"); //Kaza�em ci spada�! ALE JU�!
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_03"); //100 bry�ek rudy, je�li pozwolisz mi wej�� do piwnic. 
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_04"); //Niech b�dzie. Dawaj bry�ki, to pogadamy.
    B_LogEntry                     (CH1_Magazyny_OC,"Cena za mo�liwo�� buszowania po lochach to 100 bry�ek rudy.");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_DungeonGuard_HELLO3 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 3;
   condition    = DIA_DungeonGuard_HELLO3_Condition;
   information  = DIA_DungeonGuard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Prosz�, oto 100 bry�ek.";
};

FUNC INT DIA_DungeonGuard_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_DungeonGuard_HELLO2))
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DungeonGuard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_01"); //Prosz�, oto 100 bry�ek.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_02"); //No dobra, przymkn� oko na wej�cie do piwnic, ale i tak nie uda ci si� tego dokona� bez klucza. 
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_03"); //Sk�d mog� wzi�� klucz?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_04"); //Maj� go tylko trzy osoby; ja, Stra�nik Berg oraz Gomez. Ja jednak nie oddam ci klucza. Je�li co� zniknie i Magnaci mnie przeszukaj�, nie znajduj�c klucza, wpadn� w nie lada tarapaty.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_05"); //Ech... Zdaje si�, �e z Gomezem nie mam �adnych szans. Opowiedz mi o tym Bergu.
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_06"); //Berg by� Stra�nikiem tych drzwi, zanim obj��em t� funkcj�. Pewnego dnia Thorus wys�a� go na zwiady, jednak Berg zapomnia� zwr�ci� klucz Magnatom. Je�li zatem chcesz zdoby� klucz, b�dziesz musia� odnale�� Berga.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_07"); //Czy wiesz dok�d zosta� wys�any Berg?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_08"); //Zosta� wys�any na zwiady przez Thorusa. Nie mam jednak poj�cia, gdzie dok�adnie. Je�li chcesz si� tego dowiedzie�, powiniene� pogada� z jak�� osob�, kt�ra trzyma z Thorusem.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_09"); //Dzi�ki za informacje. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KILL
//========================================

INSTANCE DIA_DungeonGuard_KILL (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 1;
   condition    = DIA_DungeonGuard_KILL_Condition;
   information  = DIA_DungeonGuard_KILL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_DungeonGuard_KILL_Condition()
{
	if (MIS_ZabojstwBlizny == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Snake_NOWAY))
	{
    return TRUE;
	};
};

FUNC VOID DIA_DungeonGuard_KILL_Info()
{
    AI_Output (self, other ,"DIA_DungeonGuard_KILL_03_01"); //Po�a�ujesz, �e si� tu zjawi�e�!
    AI_StopProcessInfos	(self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_ExchangeRoutine (NON_7852_Snake,"free");
};