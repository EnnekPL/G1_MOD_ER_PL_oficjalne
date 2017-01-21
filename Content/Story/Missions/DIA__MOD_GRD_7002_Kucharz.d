
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
	AI_Output (other, self ,"DIA_KUCHARZ_HELLO_COOK_15_03"); //Mo¿esz mi opowiedzieæ coœ o tym obozie?
	AI_Output (self, other ,"DIA_KUCHARZ_HELLO_COOK_03_04"); //Nie! Jak nie masz co robiæ, to idŸ pogadaj z Joelem. On ca³ymi dniami zbija b¹ki. Baran jeden...
	AI_Output (self, other ,"DIA_KUCHARZ_HELLO_COOK_03_05"); //Ja mam za du¿o roboty. PrzychodŸ do mnie tylko, jeœli masz coœ konkretnego. 
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
   description	= "Mo¿esz daæ mi coœ do jedzenia?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_FOOD_15_01"); //Mo¿esz mi daæ coœ do zjedzenia?
    AI_Output (self, other ,"DIA_KUCHARZ_FOOD_03_02"); //Jako, ¿e jesteœ pierwsz¹ gêb¹ dzisiaj, która mnie o to prosi to poczêstujê ciê miêsem. WeŸ to, ale wiêcej ju¿ nie dostaniesz!
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
   description	= "Pomo¿esz mi dostaæ siê do kopalni?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_SOJUSZNIK_15_01"); //Pomo¿esz mi dostaæ siê do kopalni?
    AI_Output (self, other ,"DIA_KUCHARZ_SOJUSZNIK_03_02"); //Widzia³em, jak rozmawia³eœ z Artegorem. 
    AI_Output (self, other ,"DIA_KUCHARZ_SOJUSZNIK_03_03"); //Jeœli chcesz zyskaæ moje poparcie, musisz coœ dla mnie zrobiæ.
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
   description	= "Masz dla mnie jakieœ zadanie?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_ZADANIE_15_01"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_02"); //Chcia³bym pozbyæ siê pewnej osoby w obozie. Nie musisz wiedzieæ, kogo.
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_03"); //Jednak do tego potrzebujê silnej trucizny, któr¹ dodam do jedzenia.
    AI_Output (self, other ,"DIA_KUCHARZ_ZADANIE_03_04"); //Za³atw j¹, a dam ci magiczny napój.
    MIS_Poison = LOG_RUNNING;

    Log_CreateTopic          (CH1_Poison, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Poison, LOG_RUNNING);
    B_LogEntry               (CH1_Poison,"Kucharz z obozu przy kopalni kaza³ mi przynieœæ truciznê, któr¹ wykorzysta do morderstwa.");
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
   description	= "Mam truciznê.";
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
    AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_01"); //Mam truciznê.
    AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_02"); //Poka¿ mi j¹!
	if (Npc_HasItems (other, ItMi_Alchemy_trucizna_01) >=1)
	{
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_03"); //Oto s³aba trucizna.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_04"); //Dobrze siê spisa³eœ. Tyle mi wystarczy.
	B_LogEntry               (CH1_Poison,"Przynios³em s³ab¹ truciznê kucharzowi. W nagrodê dosta³em ma³y napój szybkoœci.");
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
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_05"); //Oto œrednia trucizna.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_06"); //Œwietnie. Szybko podzia³a.
	    B_LogEntry               (CH1_Poison,"Przynios³em œredni¹ truciznê kucharzowi. W nagrodê dosta³em œredni napój szybkoœci.");
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
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_08"); //No, no. NieŸle!
	B_LogEntry               (CH1_Poison,"Przynios³em siln¹ truciznê kucharzowi. Na pewno nie bêdzie mia³ k³opotów z pozbyciem siê ofiary. W nagrodê dosta³em du¿y napój szybkoœci.");
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
	AI_Output (other, self ,"DIA_KUCHARZ_TRUTKA_15_09"); //Muszê jeszcze poszukaæ.
	AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_10"); //No to ruszaj siê!
	DIA_KUCHARZ_TRUTKA.permanent = true;
	};
   /* if (Npc_HasItems (other, ItMi_Alchemy_trucizna_03) >=1)
    {
        AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_03"); //Œwietnie. Ta bêdzie a¿ nadto.
        B_LogEntry                     (CH1_Poison,"Przynios³em truciznê.");
        Log_SetTopicStatus       (CH1_Poison, LOG_SUCCESS);
        MIS_Poison = LOG_SUCCESS;

        B_GiveXP (150);
    }
    else
    {*/
       // AI_Output (self, other ,"DIA_KUCHARZ_TRUTKA_03_04"); //Dobrze siê spisa³eœ. Tyle mi wystarczy.

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
   description	= "I jak z nasz¹ umow¹?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_UMOWA_15_01"); //I jak z nasz¹ umow¹?
    AI_Output (self, other ,"DIA_KUCHARZ_UMOWA_03_02"); //Dobrze. Powiem o wszystkim Artegorowi.
	if (Npc_GetTrueGuild(hero) != GIL_NONE)
	{
	AI_Output (self, other ,"DIA_KUCHARZ_UMOWA_03_03"); //Choæ w¹tpiê, ¿eby ci to by³o jeszcze potrzebne.
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
   description	= "Mo¿esz jakoœ wp³yn¹æ na Kopaczy w obozie?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_01"); //Mo¿esz jakoœ wp³yn¹æ na Kopaczy w obozie?
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_02"); //Wp³yn¹æ? O co chodzi?
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_03"); //Rozdajesz im jedzenie. Pewnie mo¿esz te¿ do czegoœ ich namówiæ.
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_04"); //Hmm... Mów dalej.
    AI_Output (other, self ,"DIA_KUCHARZ_Presure_15_05"); //Zap³acê ci, jeœli te gnojki odczepi¹ siê od Spike'a.
    AI_Output (self, other ,"DIA_KUCHARZ_Presure_03_07"); //Ach, ju¿ rozumiem. To ciê bêdzie kosztowaæ 40 bry³ek rudy.
    B_LogEntry                     (CH1_SpikeLoser,"Za 40 bry³ek rudy Matt wp³ynie na Kopaczy.");
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
   description	= "Mam 40 bry³ek.";
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
    AI_Output (other, self ,"DIA_KUCHARZ_OreGiveZaplata_15_01"); //Mam 40 bry³ek.
    AI_Output (self, other ,"DIA_KUCHARZ_OreGiveZaplata_03_02"); //Œwietnie. Zajmê siê wszystkim.
    B_LogEntry                     (CH1_SpikeLoser,"Da³em rudê Mattowi. Teraz pozosta³o mi czekaæ na rozwój wydarzeñ.");
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
   description	= "Czy wiesz, kto w obozie zajmuje siê przyjmowaniem konwojów do kopalni?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_QuestIan_15_01"); //Czy wiesz, kto w obozie zajmuje siê przyjmowaniem konwojów do kopalni?
    AI_Output (self, other ,"DIA_KUCHARZ_QuestIan_03_02"); //Jasne. Zajmuj¹ siê tym Artch i Mirzo.
    AI_Output (self, other ,"DIA_KUCHARZ_QuestIan_03_03"); //Sprawdzaj¹ ka¿d¹ dostawê i przekazuj¹ do wnêtrza kopalni.
    AI_Output (other, self ,"DIA_KUCHARZ_QuestIan_15_04"); //Dziêki, tylko tyle chcia³em wiedzieæ. 
    B_LogEntry                     (CH1_FoodForOldMine,"Matt zdradzi³ mi, ¿e ¿ywnoœæ jest przyjmowana przez Artcha i Mirzo. Któryœ z nich musi mieæ coœ na sumieniu.");

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
   description	= "Zauwa¿y³eœ mo¿e, czy któryœ z Kopaczy siê ostatnio znacz¹co wzbogaci³?";
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
    AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_15_01"); //Zauwa¿y³eœ mo¿e, czy któryœ z Kopaczy siê ostatnio znacz¹co wzbogaci³?
    AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_03_02"); //Chcesz kogoœ okraœæ? Chyba wybra³eœ z³e miejsce. Tutaj nikt nic nie ma.
    AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_03_03"); //Lepiej poszukaj jakiegoœ bogatego Cienia w Starym Obozie. Jeœli dobrze trafisz, twoja sakiewka mo¿e staæ siê o wiele ciê¿sza.
	
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Mam doœæ wiarygodne informacje, ¿e któryœ z tych brudasów nieŸle zarobi³.", DIA_KUCHARZ_JoshSpy_Theft);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Mój kumpel zosta³ okradziony. Chcê odzyskaæ rudê.", DIA_KUCHARZ_JoshSpy_SoTrue);
};

FUNC VOID DIA_KUCHARZ_JoshSpy_Theft ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_01"); //Mam doœæ wiarygodne informacje, ¿e któryœ z tych brudasów nieŸle zarobi³.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_02"); //Doœæ wiarygodne informacje, powiadasz? Mia³em ostatnio doœæ nietypow¹ sytuacjê. Kopacz o imieniu Akl postawi³ piwa wszystkim swoim kolegom. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_03"); //Wyda³ na to ponad 50 bry³ek rudy. To zdecydowania za du¿o. Ma³o kto z tutejszych ludzi jest tak rozrzutny. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_04"); //Czy to on znalaz³ rudê? Nie wiem, ale w ka¿dym razie powinien coœ wiedzieæ.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_05"); //Dziêki za pomoc.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Theft_03_06"); //Nie tak prêdko. Bêdê œledzi³ twoje postêpy w zwi¹zku z t¹ spraw¹. Wynagrodzisz mi za moj¹ pomoc, gdy ju¿ znajdziesz rudê. 
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Theft_15_07"); //Szkoda, ¿e wczeœniej nie powiedzia³eœ o cenie.
	
	B_LogEntry               (CH1_OreInOM,"Od kucharza dowiedzia³em siê, ¿e niejaki Akl wyda³ ostatnio 50 bry³ek rudy na same piwa. To podejrzane. Byæ mo¿e on jest w posiadaniu rudy lub tego co z niej zosta³o. Muszê siê spieszyæ.");
	matt_credit = true;
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
};

FUNC VOID DIA_KUCHARZ_JoshSpy_SoTrue ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_SoTrue_15_01"); //Mój kumpel zosta³ okradziony. Chcê odzyskaæ rudê.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_02"); //Dopiero co tu trafi³eœ, a ju¿ znalaz³eœ przyjació³? Szybki jesteœ. Robisz komuœ za panienkê? Ha ha!
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_03"); //A mo¿e przekona³ ciê do siebie ten podejrzany typ, który niedawno wyszed³ z Kopalni?
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_SoTrue_03_04"); //Coœ mi tu œmierdzi...
	
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Mo¿e to twoja zupa?", DIA_KUCHARZ_JoshSpy_Hater);
    Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Pracujê dla Stra¿ników.", DIA_KUCHARZ_JoshSpy_Gardist);
	Info_AddChoice		(DIA_KUCHARZ_JoshSpy, "Nic ci do tego!", DIA_KUCHARZ_JoshSpy_Bandit);
};

func void DIA_KUCHARZ_JoshSpy_Hater ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Hater_15_01"); //Mo¿e to twoja zupa?
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Hater_03_02"); //Jesteœ bardzo zabawny. 
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Hater_15_03"); //Dlatego tak szybko sobie znalaz³em przyjació³...
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Hater_03_04"); //Jasne...
	B_GiveXP (50);
};

func void DIA_KUCHARZ_JoshSpy_Gardist ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_01"); //Pracujê dla Stra¿ników. Chce zostaæ cz³onkiem Obozu. Ale ty jesteœ zbyt g³upi ¿eby to zauwa¿yæ.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_02"); //Pracujesz dla ch³opaków? W takim razie jestem ci winny przeprosiny... Nikt mnie w to nie wtajemniczy³.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_03"); //Masz tak niewyparzon¹ gêbê, ¿e Artegor stwierdzi³, ¿e nie bêdzie ciê wprowadza³ w szczegó³y. Móg³byœ powiedzieæ coœ zbyt szybko, a wtedy Kopacz, który ma rudê opuœci³by obóz.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_04"); //Artegor tak powiedzia³? Cholera, wybacz za tê docinkê o panience.
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Gardist_15_05"); //Skoñcz chrzaniæ i powiedz mi, czy zauwa¿y³eœ coœ podejrzanego.
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_06"); //Mia³em ostatnio doœæ nietypow¹ sytuacjê. Kopacz o imieniu Akl postawi³ piwa wszystkim swoim kolegom. Wyda³ na to ponad 50 bry³ek rudy. To zdecydowania za du¿o. Ma³o kto z tutejszych ludzi jest tak rozrzutny. 
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Gardist_03_07"); //Czy to on znalaz³ rudê? Nie wiem, ale w ka¿dym razie powinien coœ wiedzieæ.
	
	B_LogEntry               (CH1_OreInOM,"Od kucharza dowiedzia³em siê, ¿e niejaki Akl wyda³ ostatnio 50 bry³ek rudy na same piwa. To podejrzane. Byæ mo¿e on jest w posiadaniu rudy lub tego co z niej zosta³o. Muszê siê spieszyæ.");
	B_GiveXP (100);
	Info_ClearChoices	(DIA_KUCHARZ_JoshSpy);
};

func void DIA_KUCHARZ_JoshSpy_Bandit ()
{
	AI_Output (other, self ,"DIA_KUCHARZ_JoshSpy_Bandit_15_01"); //Nic ci do tego!
	AI_Output (self, other ,"DIA_KUCHARZ_JoshSpy_Bandit_03_02"); //Czyli tak jak myœla³em... Spadaj st¹d.
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
	AI_Output (self, other,"DIA_Matt_Angry_04_01"); //D³ugo siê nie pokazywa³eœ. Nadszed³ czas zap³aty...
	AI_Output (self, other,"DIA_Matt_Angry_04_02"); //Wiem, ¿e wspó³pracowa³eœ z tym bandziorem. Masz szczêœcie, bo tylko dziêki mojej dobrej woli Joel i Artegor nie dowiedzieli siê, ¿e mu pomaga³eœ.
	AI_Output (self, other,"DIA_Matt_Angry_04_03"); //Oddaj mi czêœæ rudy. Wiem, ¿e j¹ masz. Sto bry³ek rudy za³atwi sprawê.
	
	Info_ClearChoices	(DIA_Matt_Angry);
    Info_AddChoice		(DIA_Matt_Angry, "Masz, weŸ to.", DIA_Matt_Angry_Give);
    Info_AddChoice		(DIA_Matt_Angry, "Zapomnij. Ruda nie nale¿a³a do mnie!", DIA_Matt_Angry_FuckYou);
};

func void DIA_Matt_Angry_Give ()
{
	AI_Output (other, self,"DIA_Matt_Angry_Give_12_01"); //Masz, weŸ to.
	
	if(Npc_HasItems (hero,itminugget)>= 100)
	{
	B_GiveInvItems (other, self, ItMiNugget, 100);
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_02"); //Widzê, ¿e wiesz, co dla ciebie dobre. Mo¿e po¿yjesz d³u¿ej ni¿ tydzieñ.
	Info_ClearChoices	(DIA_Matt_Angry);
	AI_StopProcessInfos	(self);
	}
	else if (Npc_HasItems (hero,itminugget)>= 50) && (Npc_HasItems (hero,itminugget)< 100)
	{
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_03"); //Nie widzê tu stu bry³ek. Ju¿ wszystko przepi³eœ? A mo¿e ktoœ ci zabra³?
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_04"); //Nie wa¿ne. Dawaj co masz i spadaj!
	
	var int ilosc_rudy;
	ilosc_rudy = Npc_hasitems (hero, ItMiNugget);
	
	B_GiveInvItems (other, self, ItMiNugget, ilosc_rudy);
	Info_ClearChoices	(DIA_Matt_Angry);
	AI_StopProcessInfos	(self);
	}
	else if (Npc_HasItems (hero,itminugget)< 50)
	{
	AI_Output (self, other,"DIA_Matt_Angry_Give_04_05"); //Nie masz nawet 50 bry³ek. Ju¿ ja ciê oduczê pazernoœci!
	AI_StopProcessInfos	(self);
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};
};

func void DIA_Matt_Angry_FuckYou ()
{
	AI_Output (self, other,"DIA_Matt_Angry_FuckYou_04_01"); //Zaraz siê policzymy!
	AI_StopProcessInfos	(self);
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
// Zadanie "Skarb dla Stra¿nika"
//========================================

INSTANCE DIA_KUCHARZ_AskAboutCraig (C_INFO)
{
   npc          = GRD_7002_KUCHARZ;
   nr           = 2;
   condition    = DIA_KUCHARZ_AskAboutCraig_Condition;
   information  = DIA_KUCHARZ_AskAboutCraig_Info;
   permanent	= FALSE;
   description	= "Szukam Stra¿nika o imieniu Craig.";
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
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_00"); //Czeœæ. Szukam Stra¿nika o imieniu Craig. Jest gdzieœ tutaj?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_01"); //By³.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_02"); //Wiesz mo¿e kiedy wpadnie tu znowu?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_03"); //Raczej nie wpadnie zwa¿ywszy na to, ¿e nie ¿yje od kilku lat.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_04"); //Wiedzia³em, ¿e gdzieœ musi byæ haczyk...
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_05"); //Jaki haczyk?
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_06"); //Niewa¿ne... Mo¿esz mi powiedzieæ coœ ciekawego o tym Craigu?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutCraig_03_07"); //Nie zna³em go osobiœcie, ale w Starej Kopalni jest pewien starszy goœæ o imieniu Asghan. Mo¿liwe, ¿e zna³ Craiga.
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutCraig_15_08"); //Có¿, pogadam z nim.
	
	B_LogEntry(CH2_TreasureOldGuard, "Matt nie wie zbyt wiele o Craigu poza tym, ¿e goœæ nie ¿yje od d³u¿szego czasu... Asghan prawdopodobnie mo¿e powiedzieæ o nim coœ wiêcej.");
};

//========================================
// Zadanie "Skarb dla stra¿nika"
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
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_00"); //Zapewne obi³y ci siê o uszy plotki o skarbie ukrytym przez starego Stra¿nika imieniem Craig.
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_01"); //Wiedzia³em, ¿e pyta³eœ o niego nie bez przyczyny. Faktycznie, przys³ucha³em siê paru rozmowom.
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_02"); //A wiec potwierdzasz istnienie jakichœ plotek na ten temat. Jak reagowa³ na nie Joel?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_03"); //Wœcieka³ siê. Mamrota³ coœ o spokoju dla zmar³ych i o dobru jego rodziny. Nie wiem o co w tym chodzi. Pewnie by³ spokrewniony z Craigiem. 
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_04"); //Zauwa¿y³eœ jeszcze coœ dziwnego w zachowaniu Joela?
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_05"); //Generalnie ostatnio ma³o siê odzywa. Ci¹gle o czymœ rozmyœla w dzieñ i w nocy. Mówiê powa¿nie. Jest oderwany od rzeczywistoœci. 
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_06"); //Hmm? 
   AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_07"); //Co wieczór idzie siê przejœæ w stronê w¹wozu nieopodal Kopalni. Ma jak¹œ obsesje, dr¿¹ mu rêce i wygl¹da jakby mia³ za chwile zostaæ okradziony.
   AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_08"); //Interesuj¹ce. Dziêki za informacje!
	AI_Output(self, other, "DIA_KUCHARZ_AskAboutTreasure_03_09"); //Interesuj¹ce? Facetowi odbija i tyle!
	AI_Output(other, self, "DIA_KUCHARZ_AskAboutTreasure_15_10"); //Do zobaczenia.
	
	Npc_ExchangeRoutine (GRD_7006_Joel,"treasure");
	Wld_InsertItem	   (ItMi_CraigsMap,"OW_JOELMAPSPAWN");
	B_LogEntry(CH2_TreasureOldGuard, "Matt zdradzi³, ¿e Joel co wieczór idzie siê przejœæ w stronê w¹wozu nieopodal Kopalni. Musze sprawdziæ ten trop.");
};