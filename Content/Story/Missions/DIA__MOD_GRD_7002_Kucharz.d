
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_KUCHARZ_EXIT(C_INFO)
{
	npc             = GRD_7002_KUCHARZ;
	nr              = 999;
	condition		= DIA_KUCHARZ_EXIT_Condition;
	information		= DIA_KUCHARZ_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_KUCHARZ_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_KUCHARZ_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO_COOK
//========================================

INSTANCE DIA_KUCHARZ_HELLO_COOK (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 1;
   condition    = DIA_KUCHARZ_HELLO_COOK_Condition;
   information  = DIA_KUCHARZ_HELLO_COOK_Info;
   permanent	= false;
   description	= "Witaj, kucharzu.";
};

FUNC INT DIA_KUCHARZ_HELLO_COOK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_KUCHARZ_HELLO_COOK_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_HELLO_COOK_15_01"); //Witaj, kucharzu.
    AI_Output (self, other ,"DIA_KUCHARZ_HELLO_COOK_03_02"); //Czego chcesz? 
	AI_Output (other, self ,"DIA_KUCHARZ_HELLO_COOK_15_03"); //Mo�esz mi opowiedzie� co� o tym obozie?
	AI_Output (self, other ,"DIA_KUCHARZ_HELLO_COOK_03_04"); //Nie! Jak nie masz co robi�, to id� pogadaj z Joelem. On ca�ymi dniami zbija b�ki. Baran jeden...
	AI_Output (self, other ,"DIA_KUCHARZ_HELLO_COOK_03_05"); //Ja mam za du�o roboty. Przychod� do mnie tylko, je�li masz co� konkretnego. 
};

//========================================
//-----------------> FOOD
//========================================

INSTANCE DIA_KUCHARZ_FOOD (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 1;
   condition    = DIA_KUCHARZ_FOOD_Condition;
   information  = DIA_KUCHARZ_FOOD_Info;
   permanent	= FALSE;
   description	= "Mo�esz da� mi co� do jedzenia?";
};

FUNC INT DIA_KUCHARZ_FOOD_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_KUCHARZ_HELLO_COOK)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_KUCHARZ_FOOD_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_FOOD_15_01"); //Mo�esz mi da� co� do zjedzenia?
    AI_Output (self, other ,"DIA_KUCHARZ_FOOD_03_02"); //Jako, �e jeste� pierwsz� g�b� dzisiaj, kt�ra mnie o to prosi to pocz�stuj� ci� mi�sem. We� to, ale wi�cej ju� nie dostaniesz!
    CreateInvItems (self, ItFoMutton, 2);
    B_GiveInvItems (self, other, ItFoMutton, 2);
};
/*
//========================================
//-----------------> SOJUSZNIK
//========================================

INSTANCE DIA_KUCHARZ_SOJUSZNIK (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 2;
   condition    = DIA_KUCHARZ_SOJUSZNIK_Condition;
   information  = DIA_KUCHARZ_SOJUSZNIK_Info;
   permanent	= FALSE;
   description	= "Pomo�esz mi dosta� si� do kopalni?";
};

FUNC INT DIA_KUCHARZ_SOJUSZNIK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_WEJSCIE)) && (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_SOJUSZNIK_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_SOJUSZNIK_15_01"); //Pomo�esz mi dosta� si� do kopalni?
    AI_Output (self, other ,"DIA_KUCHARZ_SOJUSZNIK_03_02"); //Widzia�em, jak rozmawia�e� z Artegorem. 
    AI_Output (self, other ,"DIA_KUCHARZ_SOJUSZNIK_03_03"); //Je�li chcesz zyska� moje poparcie, musisz co� dla mnie zrobi�.
};
*/

//========================================
//-----------------> ZADANIE
//========================================

INSTANCE DIA_KUCHARZ_ZADANIE (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 3;
   condition    = DIA_KUCHARZ_ZADANIE_Condition;
   information  = DIA_KUCHARZ_ZADANIE_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� zadanie?";
};

FUNC INT DIA_KUCHARZ_ZADANIE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KUCHARZ_HELLO_COOK)) //&& (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_ZADANIE_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_ZADANIE_15_01"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_02"); //Chcia�bym pozby� si� pewnej osoby w obozie. Nie musisz wiedzie�, kogo.
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_03"); //Jednak do tego potrzebuj� silnej trucizny, kt�r� dodam do jedzenia.
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_04"); //Za�atw j�, a dam ci magiczny nap�j.
    MIS_Poison = LOG_RUNNING;

    Log_CreateTopic          (CH1_Poison, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Poison, LOG_RUNNING);
    B_LogEntry               (CH1_Poison,"Kucharz z obozu przy kopalni kaza� mi przynie�� trucizn�, kt�r� wykorzysta do morderstwa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TRUTKA
//========================================

INSTANCE DIA_KUCHARZ_TRUTKA (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 4;
   condition    = DIA_KUCHARZ_TRUTKA_Condition;
   information  = DIA_KUCHARZ_TRUTKA_Info;
   permanent	= true;
   description	= "Mam trucizn�.";
};

FUNC INT DIA_KUCHARZ_TRUTKA_Condition()
{
    if (MIS_Poison == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_TRUTKA_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_01"); //Mam trucizn�.
    AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_02"); //Poka� mi j�!
	if (Npc_HasItems (other, ItMi_Alchemy_trucizna_01) >=1)
	{
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_03"); //Oto s�aba trucizna.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_04"); //Dobrze si� spisa�e�. Tyle mi wystarczy.
	B_LogEntry               (CH1_Poison,"Przynios�em s�ab� trucizn� kucharzowi. W nagrod� dosta�em ma�y nap�j szybko�ci.");
    Log_SetTopicStatus       (CH1_Poison, LOG_SUCCESS);
    MIS_Poison = LOG_SUCCESS;

    B_GiveXP (25);
	DIA_KUCHARZ_TRUTKA.permanent = false;
	B_GiveInvItems (other, self, ItMi_Alchemy_trucizna_01, 1);
	
	CreateInvItems (self, ItFo_Potion_Haste_01,1);
	B_GiveInvItems (self, hero, ItFo_Potion_Haste_01, 1);
	}
	else if (Npc_HasItems (other, ItMi_Alchemy_trucizna_02) >=1)
	{
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_05"); //Oto �rednia trucizna.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_06"); //�wietnie. Szybko podzia�a.
	    B_LogEntry               (CH1_Poison,"Przynios�em �redni� trucizn� kucharzowi. W nagrod� dosta�em �redni nap�j szybko�ci.");
        Log_SetTopicStatus       (CH1_Poison, LOG_SUCCESS);
        MIS_Poison = LOG_SUCCESS;
		B_GiveInvItems (other, self, ItMi_Alchemy_trucizna_02, 1);
        B_GiveXP (50);
		
		CreateInvItems (self, ItFo_Potion_Haste_02,1);
		B_GiveInvItems (self, hero, ItFo_Potion_Haste_02, 1);
	
		DIA_KUCHARZ_TRUTKA.permanent = false;
	}
	else if (Npc_HasItems (other, ItMi_Alchemy_trucizna_03) >=1)
	{
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_07"); //Oto silna trucizna.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_08"); //No, no. Nie�le!
	B_LogEntry               (CH1_Poison,"Przynios�em siln� trucizn� kucharzowi. Na pewno nie b�dzie mia� k�opot�w z pozbyciem si� ofiary. W nagrod� dosta�em du�y nap�j szybko�ci.");
    Log_SetTopicStatus       (CH1_Poison, LOG_SUCCESS);
    MIS_Poison = LOG_SUCCESS;
    B_GiveXP (100);
	B_GiveInvItems (other, self, ItMi_Alchemy_trucizna_03, 1);
	
	CreateInvItems (self, ItFo_Potion_Haste_03,1);
	B_GiveInvItems (self, hero, ItFo_Potion_Haste_03, 1);
	
	DIA_KUCHARZ_TRUTKA.permanent = false;
	}
	else
	{
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_09"); //Musz� jeszcze poszuka�.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_10"); //No to ruszaj si�!
	DIA_KUCHARZ_TRUTKA.permanent = true;
	};
   /* if (Npc_HasItems (other, ItMi_Alchemy_trucizna_03) >=1)
    {
        AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_03"); //�wietnie. Ta b�dzie a� nadto.
        B_LogEntry                     (CH1_Poison,"Przynios�em trucizn�.");
        Log_SetTopicStatus       (CH1_Poison, LOG_SUCCESS);
        MIS_Poison = LOG_SUCCESS;

        B_GiveXP (150);
    }
    else
    {*/
       // AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_04"); //Dobrze si� spisa�e�. Tyle mi wystarczy.

    };
//};

/*
//========================================
//-----------------> UMOWA
//========================================

INSTANCE DIA_KUCHARZ_UMOWA (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 5;
   condition    = DIA_KUCHARZ_UMOWA_Condition;
   information  = DIA_KUCHARZ_UMOWA_Info;
   permanent	= FALSE;
   description	= "I jak z nasz� umow�?";
};

FUNC INT DIA_KUCHARZ_UMOWA_Condition()
{
    if (MIS_Poison == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_UMOWA_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_UMOWA_15_01"); //I jak z nasz� umow�?
    AI_Output (self, other ,"DIA_KUCHARZ_UMOWA_03_02"); //Dobrze. Powiem o wszystkim Artegorowi.
	if (Npc_GetTrueGuild(hero) != GIL_NONE)
	{
	AI_Output (self, other ,"DIA_KUCHARZ_UMOWA_03_03"); //Cho� w�tpi�, �eby ci to by�o jeszcze potrzebne.
	}
	else
	{
	PrintScreen	("Opinia w obozie +1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	OpinionOM = OpinionOM + 1;  	
	AI_StopProcessInfos	(self);
};
*/
//========================================
//-----------------> Presure
//========================================

INSTANCE DIA_KUCHARZ_Presure (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 1;
   condition    = DIA_KUCHARZ_Presure_Condition;
   information  = DIA_KUCHARZ_Presure_Info;
   permanent	= FALSE;
   description	= "Mo�esz jako� wp�yn�� na Kopaczy w obozie?";
};

FUNC INT DIA_KUCHARZ_Presure_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Joel_Wazne))
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_Presure_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_01"); //Mo�esz jako� wp�yn�� na Kopaczy w obozie?
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_02"); //Wp�yn��? O co chodzi?
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_03"); //Rozdajesz im jedzenie. Pewnie mo�esz te� do czego� ich nam�wi�.
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_04"); //Hmm... M�w dalej.
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_05"); //Zap�ac� ci, je�li te gnojki odczepi� si� od Spike'a.
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_07"); //Ach, ju� rozumiem. To ci� b�dzie kosztowa� 40 bry�ek rudy.
    B_LogEntry                     (CH1_SpikeLoser,"Za 40 bry�ek rudy Matt wp�ynie na Kopaczy.");
};

//========================================
//-----------------> OreGiveZaplata
//========================================

INSTANCE DIA_KUCHARZ_OreGiveZaplata (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 2;
   condition    = DIA_KUCHARZ_OreGiveZaplata_Condition;
   information  = DIA_KUCHARZ_OreGiveZaplata_Info;
   permanent	= FALSE;
   description	= "Mam 40 bry�ek.";
};

FUNC INT DIA_KUCHARZ_OreGiveZaplata_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KUCHARZ_Presure))
    && (Npc_HasItems (hero, ItMiNugget)>=40)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_OreGiveZaplata_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_OreGiveZaplata_15_01"); //Mam 40 bry�ek.
    AI_Output (self, other ,"DIA_KUCHARZ_OreGiveZaplata_03_02"); //�wietnie. Zajm� si� wszystkim.
    B_LogEntry                     (CH1_SpikeLoser,"Da�em rud� Mattowi. Teraz pozosta�o mi czeka� na rozw�j wydarze�.");
	B_GiveInvItems (other, self, ItMiNugget, 40);
};

//========================================
//-----------------> QuestIan
//========================================

INSTANCE DIA_KUCHARZ_QuestIan (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 1;
   condition    = DIA_KUCHARZ_QuestIan_Condition;
   information  = DIA_KUCHARZ_QuestIan_Info;
   permanent	= FALSE;
   description	= "Czy wiesz, kto w obozie zajmuje si� przyjmowaniem konwoj�w do kopalni?";
};

FUNC INT DIA_KUCHARZ_QuestIan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_IanQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_QuestIan_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_QuestIan_15_01"); //Czy wiesz, kto w obozie zajmuje si� przyjmowaniem konwoj�w do kopalni?
    AI_Output (self, other ,"DIA_KUCHARZ_QuestIan_03_02"); //Jasne. Zajmuj� si� tym Artch i Mirzo.
    AI_Output (self, other ,"DIA_KUCHARZ_QuestIan_03_03"); //Sprawdzaj� ka�d� dostaw� i przekazuj� do wn�trza kopalni.
    AI_Output (other, self ,"DIA_KUCHARZ_QuestIan_15_04"); //Dzi�ki, tylko tyle chcia�em wiedzie�. 
    B_LogEntry                     (CH1_FoodForOldMine,"Matt zdradzi� mi, �e �ywno�� jest przyjmowana przez Artcha i Mirzo. Kt�ry� z nich musi mie� co� na sumieniu.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

var int matt_credit;
//========================================
//-----------------> JoshSpy
//========================================

INSTANCE DIA_KUCHARZ_JoshSpy (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 1;
   condition    = DIA_KUCHARZ_JoshSpy_Condition;
   information  = DIA_KUCHARZ_JoshSpy_Info;
   permanent	= FALSE;
   description	= "Zauwa�y�e� mo�e, czy kt�ry� z Kopaczy si� ostatnio znacz�co wzbogaci�?";
};

FUNC INT DIA_KUCHARZ_JoshSpy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josh_Hallo)) && MIS_OreInOM == LOG_RUNNING
    {
    return TRUE;
    };
};


FUNC VOID DIA_KUCHARZ_JoshSpy_Info()
{
    AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_15_01"); //Zauwa�y�e� mo�e, czy kt�ry� z Kopaczy si� ostatnio znacz�co wzbogaci�?
    AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_03_02"); //Chcesz kogo� okra��? Chyba wybra�e� z�e miejsce. Tutaj nikt nic nie ma.
    AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_03_03"); //Lepiej poszukaj jakiego� bogatego Cienia w Starym Obozie. Je�li dobrze trafisz, twoja sakiewka mo�e sta� si� o wiele ci�sza.
	
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Mam do�� wiarygodne informacje, �e kt�ry� z tych brudas�w nie�le zarobi�.", DIA_KUCHARZ_JoshSpy_Theft);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "M�j kumpel zosta� okradziony. Chc� odzyska� rud�.", DIA_KUCHARZ_JoshSpy_SoTrue);
};

FUNC VOID DIA_KUCHARZ_JoshSpy_Theft ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_01"); //Mam do�� wiarygodne informacje, �e kt�ry� z tych brudas�w nie�le zarobi�.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_02"); //Do�� wiarygodne informacje, powiadasz? Mia�em ostatnio do�� nietypow� sytuacj�. Kopacz o imieniu Akl postawi� piwa wszystkim swoim kolegom. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_03"); //Wyda� na to ponad 50 bry�ek rudy. To zdecydowania za du�o. Ma�o kto z tutejszych ludzi jest tak rozrzutny. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_04"); //Czy to on znalaz� rud�? Nie wiem, ale w ka�dym razie powinien co� wiedzie�.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_05"); //Dzi�ki za pomoc.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_06"); //Nie tak pr�dko. B�d� �ledzi� twoje post�py w zwi�zku z t� spraw�. Wynagrodzisz mi za moj� pomoc, gdy ju� znajdziesz rud�. 
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_07"); //Szkoda, �e wcze�niej nie powiedzia�e� o cenie.
	
	B_LogEntry               (CH1_OreInOM,"Od kucharza dowiedzia�em si�, �e niejaki Akl wyda� ostatnio 50 bry�ek rudy na same piwa. To podejrzane. By� mo�e on jest w posiadaniu rudy lub tego co z niej zosta�o. Musz� si� spieszy�.");
	matt_credit = true;
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
};

FUNC VOID DIA_KUCHARZ_JoshSpy_SoTrue ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_SoTrue_15_01"); //M�j kumpel zosta� okradziony. Chc� odzyska� rud�.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_02"); //Dopiero co tu trafi�e�, a ju� znalaz�e� przyjaci�? Szybki jeste�. Robisz komu� za panienk�? Ha ha!
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_03"); //A mo�e przekona� ci� do siebie ten podejrzany typ, kt�ry niedawno wyszed� z Kopalni?
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_04"); //Co� mi tu �mierdzi...
	
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Mo�e to twoja zupa?", DIA_KUCHARZ_JoshSpy_Hater);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Pracuj� dla Stra�nik�w.", DIA_KUCHARZ_JoshSpy_Gardist);
	Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Nic ci do tego!", DIA_KUCHARZ_JoshSpy_Bandit);
};

func void DIA_KUCHARZ_JoshSpy_Hater ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Hater_15_01"); //Mo�e to twoja zupa?
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Hater_03_02"); //Jeste� bardzo zabawny. 
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Hater_15_03"); //Dlatego tak szybko sobie znalaz�em przyjaci�...
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Hater_03_04"); //Jasne...
	B_GiveXP (50);
};

func void DIA_KUCHARZ_JoshSpy_Gardist ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_01"); //Pracuj� dla Stra�nik�w. Chce zosta� cz�onkiem Obozu. Ale ty jeste� zbyt g�upi �eby to zauwa�y�.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_02"); //Pracujesz dla ch�opak�w? W takim razie jestem ci winny przeprosiny... Nikt mnie w to nie wtajemniczy�.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_03"); //Masz tak niewyparzon� g�b�, �e Artegor stwierdzi�, �e nie b�dzie ci� wprowadza� w szczeg�y. M�g�by� powiedzie� co� zbyt szybko, a wtedy Kopacz, kt�ry ma rud� opu�ci�by ob�z.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_04"); //Artegor tak powiedzia�? Cholera, wybacz za t� docink� o panience.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_05"); //Sko�cz chrzani� i powiedz mi, czy zauwa�y�e� co� podejrzanego.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_06"); //Mia�em ostatnio do�� nietypow� sytuacj�. Kopacz o imieniu Akl postawi� piwa wszystkim swoim kolegom. Wyda� na to ponad 50 bry�ek rudy. To zdecydowania za du�o. Ma�o kto z tutejszych ludzi jest tak rozrzutny. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_07"); //Czy to on znalaz� rud�? Nie wiem, ale w ka�dym razie powinien co� wiedzie�.
	
	B_LogEntry               (CH1_OreInOM,"Od kucharza dowiedzia�em si�, �e niejaki Akl wyda� ostatnio 50 bry�ek rudy na same piwa. To podejrzane. By� mo�e on jest w posiadaniu rudy lub tego co z niej zosta�o. Musz� si� spieszy�.");
	B_GiveXP (100);
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
};

func void DIA_KUCHARZ_JoshSpy_Bandit ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Bandit_15_01"); //Nic ci do tego!
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Bandit_03_02"); //Czyli tak jak my�la�em... Spadaj st�d.
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
};

// **************************************************
//						Angry
// **************************************************

instance DIA_Matt_Angry(C_INFO)
{
	npc				= GRD_7002_KUCHARZ;
	nr				= 1;
	condition		= DIA_Matt_Angry_Condition;
	information		= DIA_Matt_Angry_Info;
	permanent		= 0;
	important	 	= 1;
};                       

FUNC INT DIA_Matt_Angry_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Joel_JoshDie) && (matt_credit == true)
	{
	return 1;
	};
};

func VOID DIA_Matt_Angry_Info()
{
	AI_Output (self, other,"DIA_Matt_Angry_04_01"); //D�ugo si� nie pokazywa�e�. Nadszed� czas zap�aty...
	AI_Output (self, other,"DIA_Matt_Angry_04_02"); //Wiem, �e wsp�pracowa�e� z tym bandziorem. Masz szcz�cie, bo tylko dzi�ki mojej dobrej woli Joel i Artegor nie dowiedzieli si�, �e mu pomaga�e�.
	AI_Output (self, other,"DIA_Matt_Angry_04_03"); //Oddaj mi cz�� rudy. Wiem, �e j� masz. Sto bry�ek rudy za�atwi spraw�.
	
	Info_ClearChoices	(DIA_Matt_Angry);
    Info_AddChoice		(DIA_Matt_Angry, "Masz, we� to.", DIA_Matt_Angry_Give);
    Info_AddChoice		(DIA_Matt_Angry, "Zapomnij. Ruda nie nale�a�a do mnie!", DIA_Matt_Angry_FuckYou);
};

func void DIA_Matt_Angry_Give ()
{
	AI_Output (other, self,"DIA_Matt_Angry_Give_12_01"); //Masz, we� to.
	
	if(Npc_HasItems (hero,itminugget)>= 100)
	{
	B_GiveInvItems (other, self, ItMiNugget, 100);
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_02"); //Widz�, �e wiesz, co dla ciebie dobre. Mo�e po�yjesz d�u�ej ni� tydzie�.
	Info_ClearChoices	(DIA_Matt_Angry);
	AI_StopProcessInfos	(self);
	}
	else if (Npc_HasItems (hero,itminugget)>= 50) && (Npc_HasItems (hero,itminugget)< 100)
	{
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_03"); //Nie widz� tu stu bry�ek. Ju� wszystko przepi�e�? A mo�e kto� ci zabra�?
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_04"); //Nie wa�ne. Dawaj co masz i spadaj!
	
	var int ilosc_rudy;
	ilosc_rudy = Npc_hasitems (hero, ItMiNugget);
	
	B_GiveInvItems (other, self, ItMiNugget, ilosc_rudy);
	Info_ClearChoices	(DIA_Matt_Angry);
	AI_StopProcessInfos	(self);
	}
	else if (Npc_HasItems (hero,itminugget)< 50)
	{
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_05"); //Nie masz nawet 50 bry�ek. Ju� ja ci� oducz� pazerno�ci!
	AI_StopProcessInfos	(self);
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};
};

func void DIA_Matt_Angry_FuckYou ()
{
	AI_Output (self, other,"DIA_Matt_Angry_FuckYou_04_01"); //Zaraz si� policzymy!
	AI_StopProcessInfos	(self);
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
// Zadanie "Skarb dla Stra�nika"
//========================================

INSTANCE DIA_KUCHARZ_AskAboutCraig (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 2;
   condition    = DIA_KUCHARZ_AskAboutCraig_Condition;
   information  = DIA_KUCHARZ_AskAboutCraig_Info;
   permanent	= FALSE;
   description	= "Szukam Stra�nika o imieniu Craig.";
};

FUNC INT DIA_KUCHARZ_AskAboutCraig_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Roscoe_TreasureOldGuard))
   {
		return TRUE;
   };
};

FUNC VOID DIA_KUCHARZ_AskAboutCraig_Info()
{
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_00"); //Cze��. Szukam Stra�nika o imieniu Craig. Jest gdzie� tutaj?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_01"); //By�.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_02"); //Wiesz mo�e kiedy wpadnie tu znowu?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_03"); //Raczej nie wpadnie zwa�ywszy na to, �e nie �yje od kilku lat.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_04"); //Wiedzia�em, �e gdzie� musi by� haczyk...
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_05"); //Jaki haczyk?
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_06"); //Niewa�ne... Mo�esz mi powiedzie� co� ciekawego o tym Craigu?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_07"); //Nie zna�em go osobi�cie, ale w Starej Kopalni jest pewien starszy go�� o imieniu Asghan. Mo�liwe, �e zna� Craiga.
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_08"); //C�, pogadam z nim.
	
	B_LogEntry(CH2_TreasureOldGuard, "Matt nie wie zbyt wiele o Craigu poza tym, �e go�� nie �yje od d�u�szego czasu... Asghan prawdopodobnie mo�e powiedzie� o nim co� wi�cej.");
};

//========================================
// Zadanie "Skarb dla stra�nika"
//========================================

INSTANCE DIA_KUCHARZ_AskAboutTreasure (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 2;
   condition    = DIA_KUCHARZ_AskAboutTreasure_Condition;
   information  = DIA_KUCHARZ_AskAboutTreasure_Info;
   permanent	= FALSE;
   description	= "(zapytaj o skarb Cariga)";
};

FUNC INT DIA_KUCHARZ_AskAboutTreasure_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Joel_AskAboutTreasure))
   {
		return TRUE;
   };
};

FUNC VOID DIA_KUCHARZ_AskAboutTreasure_Info()
{
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_00"); //Zapewne obi�y ci si� o uszy plotki o skarbie ukrytym przez starego Stra�nika imieniem Craig.
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_01"); //Wiedzia�em, �e pyta�e� o niego nie bez przyczyny. Faktycznie, przys�ucha�em si� paru rozmowom.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_02"); //A wiec potwierdzasz istnienie jakich� plotek na ten temat. Jak reagowa� na nie Joel?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_03"); //W�cieka� si�. Mamrota� co� o spokoju dla zmar�ych i o dobru jego rodziny. Nie wiem o co w tym chodzi. Pewnie by� spokrewniony z Craigiem. 
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_04"); //Zauwa�y�e� jeszcze co� dziwnego w zachowaniu Joela?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_05"); //Generalnie ostatnio ma�o si� odzywa. Ci�gle o czym� rozmy�la w dzie� i w nocy. M�wi� powa�nie. Jest oderwany od rzeczywisto�ci. 
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_06"); //Hmm? 
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_07"); //Co wiecz�r idzie si� przej�� w stron� w�wozu nieopodal Kopalni. Ma jak�� obsesje, dr�� mu r�ce i wygl�da jakby mia� za chwile zosta� okradziony.
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_08"); //Interesuj�ce. Dzi�ki za informacje!
	AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_09"); //Interesuj�ce? Facetowi odbija i tyle!
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_10"); //Do zobaczenia.
	
	Npc_ExchangeRoutine (GRD_7006_Joel,"treasure");
	Wld_InsertItem	   (ItMi_CraigsMap,"OW_JOELMAPSPAWN");
	B_LogEntry(CH2_TreasureOldGuard, "Matt zdradzi�, �e Joel co wiecz�r idzie si� przej�� w stron� w�wozu nieopodal Kopalni. Musze sprawdzi� ten trop.");
};