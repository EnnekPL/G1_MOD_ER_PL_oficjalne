// *Script was make in Easy Dialog Maker (EDM)
//sprawdzone, poprawione g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Alex_EXIT(C_INFO)
{
	npc             = NON_5600_Alex;
	nr              = 999;
	condition	= DIA_Alex_EXIT_Condition;
	information	= DIA_Alex_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Alex_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alex_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Alex_HELLO1 (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_HELLO1_Condition;
   information  = DIA_Alex_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Alex_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alex_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_02"); //Nazywam si� Alex. Dbam o to, by w obozie panowa� spok�j. 
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_03"); //Jeste� tu szefem?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_04"); //Szef to za mocne s�owo. Po prostu ogarniam co si� tu dzieje. 
	AI_Output (self, other ,"DIA_Alex_HELLO1_03_05"); //Cho� jak wida� i mnie to czasem przerasta. Ostatnio zagin�� nasz cz�owiek... 
};

//========================================
//-----------------> Skup
//========================================

INSTANCE DIA_Alex_Skup (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skup_Condition;
   information  = DIA_Alex_Skup_Info;
   permanent	= FALSE;
   description	= "Skupujecie trofea?";
};

FUNC INT DIA_Alex_Skup_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Skup_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skup_15_01"); //Skupujecie trofea?
    AI_Output (self, other ,"DIA_Alex_Skup_03_02"); //Jasne! Je�eli masz na sprzeda� sk�ry wilk�w to mo�esz je tutaj przynie��.
    //AI_Output (self, other ,"DIA_Alex_Skup_03_03"); //Mi�so skupujemy tylko w wi�kszych ilo�ciach.
    //AI_Output (self, other ,"DIA_Alex_Skup_03_04"); //50 sztuk mi�sa za 100 bry�ek rudy.
	AI_Output (self, other ,"DIA_Alex_Skup_03_05"); //Je�li chodzi o sk�ry, to p�ac� 200 bry�ek za 30 sztuk.
	Log_CreateTopic 	(GE_Skup,LOG_NOTE);
	//B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry�ek za 30 sztuk) i mi�so (100 bry�ek za 50 sztuk. Mo�na go znale�� w obozie my�liwych.");
    B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry�ek za 30 sztuk).Mo�na go znale�� w obozie my�liwych.");
    
};

//========================================
//-----------------> SellSkins
//========================================

INSTANCE DIA_Alex_SellSkins (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_SellSkins_Condition;
   information  = DIA_Alex_SellSkins_Info;
   permanent	= TRUE;
   description	= "Chc� sprzeda� sk�ry.";
};

FUNC INT DIA_Alex_SellSkins_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItAt_Wolf_01) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SellSkins_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellSkins_15_01"); //Chc� sprzeda� sk�ry.
    AI_Output (self, other ,"DIA_Alex_SellSkins_03_02"); //Jasne. Oto twoja zap�ata.
    B_GiveInvItems (other, self, ItAt_Wolf_01, 30);
	Npc_RemoveInvItems (self, ItAt_Wolf_01, 30);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_giveXP (150);
};

//========================================
//-----------------> SellMeat
//========================================

INSTANCE DIA_Alex_SellMeat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SellMeat_Condition;
   information  = DIA_Alex_SellMeat_Info;
   permanent	= TRUE;
   description	= "Chc� sprzeda� mi�so.";
};

FUNC INT DIA_Alex_SellMeat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItFoMuttonRaw) >=50)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Alex_SellMeat_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellMeat_15_01"); //Chc� sprzeda� mi�so.
    AI_Output (self, other ,"DIA_Alex_SellMeat_03_02"); //Oto obiecana zap�ata.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_GiveInvItems (other, self, ItFoMuttonRaw, 50);
	Npc_RemoveInvItems (self, ItFoMuttonRaw, 50);
    B_giveXP (75);
};

var int meat_oddane;
//========================================
//-----------------> Armor
//========================================

INSTANCE DIA_Alex_Armor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Armor_Condition;
   information  = DIA_Alex_Armor_Info;
   permanent	= FALSE;
   description	= "Sprzedasz mi jaki� pancerz?";
};

FUNC INT DIA_Alex_Armor_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Armor_Info()
{
    AI_Output (other, self ,"DIA_Alex_Armor_15_01"); //Sprzedasz mi jaki� pancerz?
    if (MIS_Kidnapping == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_02"); //Mam na stanie zar�wno ubranie, jak i zbroj�.
        AI_Output (self, other ,"DIA_Alex_Armor_03_03"); //Wybierz sobie, kt�re ci odpowiada.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_04"); //Tobie? Ledwo ci� znam.
        AI_Output (other, self ,"DIA_Alex_Armor_15_05"); //A wi�c najwy�szy czas mnie pozna�!
        AI_Output (self, other ,"DIA_Alex_Armor_03_06"); //No dobra, spr�bujmy. Sprzedam ci moje stare ubranie, je�li popracujesz troch� na rzecz obozu.
        AI_Output (other, self ,"DIA_Alex_Armor_15_07"); //Co jest do zrobienia?
        AI_Output (self, other ,"DIA_Alex_Armor_03_08"); //Najpierw we� to mi�so i usma� je porz�dnie na patelni. Ja nie mam na to czasu. Pami�taj, �eby mi je potem odnie��!
        AI_Output (self, other ,"DIA_Alex_Armor_03_09"); //Gdy ju� to zrobisz, pogadaj z Firnem. Trzeba naprawi� palisad� w obozie.
        AI_Output (self, other ,"DIA_Alex_Armor_03_10"); //Na koniec pomo�esz Stanleyowi uzupe�ni� ekwipunek. Z tego co mi wiadomo, potrzebne mu jest 50 strza�. 
        MIS_JobInHuntersCamp = LOG_RUNNING;
		meat_oddane = false;
        Log_CreateTopic          (CH1_JobInHuntersCamp, LOG_MISSION);
        Log_SetTopicStatus       (CH1_JobInHuntersCamp, LOG_RUNNING);
        B_LogEntry               (CH1_JobInHuntersCamp,"Je�eli chc� dosta� ubranie my�liwego, b�d� musia� na nie zapracowa�. Mam usma�y� mi�so i odnie�� je do Alexa, naprawi� palisad� razem z Firnem i przynie�� Stanleyowi 50 strza�. ");
        CreateInvItems (self, ItFoMuttonRaw, 30);
        B_GiveInvItems (self, other, ItFoMuttonRaw, 30);
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Mutton
//========================================

INSTANCE DIA_Alex_Mutton (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_Mutton_Condition;
   information  = DIA_Alex_Mutton_Info;
   permanent	= FALSE;
   description	= "Mam 30 sztuk sma�onego mi�sa. ";
};

FUNC INT DIA_Alex_Mutton_Condition()
{
    if (meat_oddane == false)
    && (MIS_JobInHuntersCamp == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoMutton) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Mutton_Info()
{
    AI_Output (other, self ,"DIA_Alex_Mutton_15_01"); //Mam 30 sztuk sma�onego mi�sa. 
    AI_Output (self, other ,"DIA_Alex_Mutton_03_02"); //Dobra robota. Uwielbiam sma�one mi�so. 
    B_LogEntry                     (CH1_JobInHuntersCamp,"Alex otrzyma� swoje mi�so. ");
	meat_oddane = true;
    B_GiveXP (25);
    B_GiveInvItems (other, self, ItFoMutton, 30);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RobotaENDE
//========================================

INSTANCE DIA_Alex_RobotaENDE (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_RobotaENDE_Condition;
   information  = DIA_Alex_RobotaENDE_Info;
   permanent	= FALSE;
   description	= "Zrobi�em co kaza�e�.";
};

FUNC INT DIA_Alex_RobotaENDE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_palisadaSkonczone))
    && (Npc_KnowsInfo (hero, DIA_Stanley_Arrows))
    && (Npc_KnowsInfo (hero, DIA_Alex_Mutton))
    && (MIS_JobInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_RobotaENDE_Info()
{
    AI_Output (other, self ,"DIA_Alex_RobotaENDE_15_01"); //Zrobi�em co kaza�e�.
    AI_Output (self, other ,"DIA_Alex_RobotaENDE_03_02"); //Dobra robota! Ob�z wreszcie wygl�da jak trzeba. Teraz mog� ci sprzeda� ubranie za 300 bry�ek rudy.
    B_LogEntry                     (CH1_JobInHuntersCamp,"Zadania zosta�y wykonane. Wreszcie mog� kupi� nowy pancerz za niewielk� cen�. ");
    Log_SetTopicStatus       (CH1_JobInHuntersCamp, LOG_SUCCESS);
    MIS_JobInHuntersCamp = LOG_SUCCESS;
    B_GiveXP (200);
};


//========================================
//-----------------> GiveSArmor
//========================================

INSTANCE DIA_Alex_GiveSArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 4;
   condition    = DIA_Alex_GiveSArmor_Condition;
   information  = DIA_Alex_GiveSArmor_Info;
   permanent	= FALSE;
   description	= "Daj mi ubranie my�liwego (300 bry�ek rudy)";
};

FUNC INT DIA_Alex_GiveSArmor_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GiveSArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_GiveSArmor_15_01"); //Daj mi ubranie my�liwego.
    if (Npc_HasItems (hero, ItMiNugget)>=300)
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_02"); //Jasne. Jest twoje. 
        B_GiveInvItems (other, self, ItMiNugget, 300);
		CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,HUN_ARMOR_L);
	AI_EquipBestArmor	(hero); 
	DIA_Alex_GiveSArmor.permanent = false;
//HUN_ARMOR_L   
 }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_03"); //Nie ma rudy, nie ma pancerza.
        DIA_Alex_GiveSArmor.permanent = true;
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SrongArmor
//========================================

INSTANCE DIA_Alex_SrongArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SrongArmor_Condition;
   information  = DIA_Alex_SrongArmor_Info;
   permanent	= FALSE;
   description	= "Co z ci�szym pancerzem?";
};

FUNC INT DIA_Alex_SrongArmor_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_SUCCESS) && (kapitel >= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SrongArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_01"); //Co z ci�szym pancerzem?
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_02"); //Aby go dosta�, b�dziesz musia� rozwi�za� spraw� pewnej kradzie�y.
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_03"); //Kradzie�y? 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_04"); //Ostatnio z obozu zgin�y cenne b�yskotki. M�j puchar i pier�cie� Clawa. 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_05"); //Nie podoba mi si� to. Czy�by w obozie by� zdrajca?
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_06"); //Postaram si� to ustali�.
    MIS_TheftInHuntersCamp = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_TheftInHuntersCamp, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_RUNNING);
    B_LogEntry               (CH1_TheftInHuntersCamp,"Ostatniej nocy z obozu my�liwych zagin�y dwa cenne przedmioty: puchar Alexa i pier�cie� my�liwego Clawa. Nie wiadomo kto stoi za kradzie��. ");
};

//========================================
//-----------------> CenneItemy
//========================================

INSTANCE DIA_Alex_CenneItemy (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_CenneItemy_Condition;
   information  = DIA_Alex_CenneItemy_Info;
   permanent	= FALSE;
   description	= "Znalaz�em wasze b�yskotki.";
};

FUNC INT DIA_Alex_CenneItemy_Condition()
{
    if (Npc_HasItems (other, AlexCup) >=1)
   // && (Npc_HasItems (other, ClawsRing) >=1)
    && (MIS_TheftInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_CenneItemy_Info()
{
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_01"); //Znalaz�em wasze b�yskotki.
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_02"); //Naprawd� ci si� to uda�o? Czy to by� jeden z moich ludzi?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_03"); //Nie. Zosta�y porwane przez gobliny. Znalaz�em je w skrzyni znajduj�cej si� w jaskini nieopodal obozu. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_04"); //Jak to mo�liwe, �e te bestyjki zakrad�y si� do obozu?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_05"); //Firn jest tylko cz�owiekiem. Mo�liwe, �e przysn��. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_06"); //Hmm... No dobrze. W nagrod� sprzedam ci zbroj� my�liwego za 1300 bry�ek rudy. 
    B_LogEntry                     (CH1_TheftInHuntersCamp,"Zagadka rozwi�zana. Przedmioty zosta�y skradzione przez gobliny z jaskini przy obozie. ");
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_SUCCESS);
    MIS_TheftInHuntersCamp = LOG_SUCCESS;
	B_GiveInvItems (hero, self, AlexCup, 1);
    B_GiveXP (250);
};

//========================================
//-----------------> GivMeHArmor
//========================================
var int zbroja_mysliwego_buy;
INSTANCE DIA_Alex_GivMeHArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_GivMeHArmor_Condition;
   information  = DIA_Alex_GivMeHArmor_Info;
   permanent	= true;
   description	= "Daj mi zbroj� my�liwego (1300 bry�ek rudy)";
};

FUNC INT DIA_Alex_GivMeHArmor_Condition()
{
    if (MIS_TheftInHuntersCamp == LOG_SUCCESS) && (zbroja_mysliwego_buy == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GivMeHArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_01"); //Daj mi zbroj� my�liwego.
	if (Kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_05"); //Niestety ju� nam si� sko�czy�y. Przyjd� p�niej, gdy uszyjemy jeszcze kilka.
	DIA_Alex_GivMeHArmor.permanent = true;//fix er 1.4
	}
	else 
	{
    if (Npc_HasItems (hero, ItMiNugget)>=1300)
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_02"); //We� j�. Nale�y ci si�.
        AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_03"); //Za tak� ilo�� rudy, to mi si� wiele rzeczy nale�y...
	B_GiveInvItems (other, self, ItMiNugget, 1300);
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(other,NON_WOLF_ARMOR);
	AI_EquipBestArmor	(other); 
	DIA_Alex_GivMeHArmor.permanent = false;
	zbroja_mysliwego_buy = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_04"); //Nie masz tyle rudy. Zbierz jeszcze troch� bry�ek. 
		DIA_Alex_GivMeHArmor.permanent = true;
    };
	};
};

//========================================
//-----------------> Skargi
//========================================

INSTANCE DIA_Alex_Skargi (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skargi_Condition;
   information  = DIA_Alex_Skargi_Info;
   permanent	= FALSE;
   description	= "Jonas skar�y si�, �e my�liwi pracuj� powoli.";
};

FUNC INT DIA_Alex_Skargi_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Skargi_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skargi_15_01"); //Jonas skar�y si�, �e my�liwi pracuj� powoli.
    AI_Output (self, other ,"DIA_Alex_Skargi_03_02"); //Nic mi o tym nie wiadomo. 
    AI_Output (self, other ,"DIA_Alex_Skargi_03_03"); //Mo�e spr�buj z nimi porozmawia�.
};

//========================================
//-----------------> Narzekanie
//========================================

INSTANCE DIA_Alex_Narzekanie (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Narzekanie_Condition;
   information  = DIA_Alex_Narzekanie_Info;
   permanent	= FALSE;
   description	= "Jeden z my�liwych strasznie na ciebie narzeka.";
};

FUNC INT DIA_Alex_Narzekanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO1))
    && (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Narzekanie_Info()
{
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_01"); //Jeden z my�liwych strasznie na ciebie narzeka.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_02"); //H�?
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_03"); //Za��da� z�ota za prac� przy drewnie. Ponadto powiedzia�, �e powinni�my szuka� kopalni z�ota, a nie zajmowa� si� zwierzyn�.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_04"); //Nie d��� za bogactwem. Powiedz mi ile tutaj jest warte z�oto? Co nam po tym, �e zgromadzimy kufry ze z�otem skoro nawet go nie wykorzystamy.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_05"); //Zdechniemy broni�c kilku �wiecide�ek przed pazernymi Stra�nikami. Czy to ma sens?
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_06"); //Nie lepiej wykorzysta� to co daje nam natura? Owoc pracy trzech bog�w. 
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO3))
    {
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_07"); //Masz racj�. Nauczy�em ju� tego nieroba szacunku.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_08"); //Pobi�e� go? �le post�pi�e�.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_09"); //Dlaczego? Nale�a�o mu si�.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_10"); //Zachowujecie si� jak dzieci w piaskownicy. Nikt go tu nie trzyma. Je�eli nie chce pracowa� na rzecz obozu, to niech st�d zje�d�a. Mog�e� kaza� mu po prostu odej��.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_11"); //Nie b�d� ci� zanudza�. Id� do tego cz�owieka i powiedz mu, �e nie ma ju� czego szuka� w obozie.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_12"); //Niech odejdzie. Nie potrzebujemy tu takich jak on.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_13"); //Tak zrobi�.

        B_LogEntry                     (CH1_Nieroby,"Mam kaza� odej�� my�liwemu. Alexa bardzo zdenerwowa�a jego postawa.");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NewQuest
//========================================

INSTANCE DIA_Alex_NewQuest (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 9;
   condition    = DIA_Alex_NewQuest_Condition;
   information  = DIA_Alex_NewQuest_Info;
   permanent	= FALSE;
   description	= "Zagin�� jeden z waszych ludzi?";
};

FUNC INT DIA_Alex_NewQuest_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NewQuest_Info()
{
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_01"); //Zagin�� jeden z waszych ludzi?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_02"); //Ta... Nazywa� si� Josep. Nie by� jakim� m�odzikiem. Do�wiadczony facet maj�cy ju� wiele wiosen za sob�. Dziwi mnie jego znikni�cie.
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_03"); //Wys�a�e� kogo� na jego poszukiwania?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_04"); //Oczywi�cie, �e tak! Zazwyczaj polowa� w okolicach Nowego Obozu. Czterech zwiadowc�w dok�adnie przeszuka�o tamte tereny. Bezskutecznie.
	AI_Output (self, other ,"DIA_Alex_NewQuest_03_05"); //Je�li chcesz, mo�esz pr�bowa�, ale w�tpi�, �e on jeszcze wr�ci. 

    MIS_MissedJosep = LOG_RUNNING;

    Log_CreateTopic          (CH1_MissedJosep, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MissedJosep, LOG_RUNNING);
    B_LogEntry               (CH1_MissedJosep,"Z obozu znikn�� jeden z my�liwych. Od Alexa dowiedzia�em si�, �e nazywa� si� Josep i polowa� w okolicach Nowego Obozu. Poszukiwania nie przynios�y skutku.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> JosepPowrot
//========================================

INSTANCE DIA_Alex_JosepPowrot (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_JosepPowrot_Condition;
   information  = DIA_Alex_JosepPowrot_Info;
   permanent	= FALSE;
   description	= "Przed chwil� przyprowadzi�em Josepa do obozu.";
};

FUNC INT DIA_Alex_JosepPowrot_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Camp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_JosepPowrot_Info()
{
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_01"); //Przed chwil� przyprowadzi�em Josepa do obozu.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_02"); //Gdzie go znalaz�e�? Nie ukrywam, �e to �wietna wiadomo��.
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_03"); //Zosta� pojmany przez ludzi Lewusa i zmuszony do pracy na polach ry�owych.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_04"); //Jak to pojmany?
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_05"); //Mo�na rzecz, �e zaszed� Lewusowi za sk�r�, a p�niej Laresowi, a p�niej...
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_06"); //Dziwi� si�, �e w og�le wyszed� z tego ca�o. Chyba masz w tym niema�y udzia�?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_07"); //Owszem. By�bym wdzi�czny, gdyby�...
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_08"); //Rozumiem. 200 bry�ek rudy to chyba uczciwa cena za ocalenie jednego z moich ludzi?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_09"); //Zadowol� si� i tym. Dzi�ki.
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_10"); //To ja dzi�kuj�.
	
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
	
    B_LogEntry               (CH1_MissedJosep,"Josep wr�ci� do obozu. Alex by� bardzo zadowolony z moich dokona�.");
    Log_SetTopicStatus       (CH1_MissedJosep, LOG_SUCCESS);
    MIS_MissedJosep = LOG_SUCCESS;

    B_GiveXP (350);
	EquipItem (NON_5614_Josep, ItMw_1H_Sword_02);
};

//========================================
//-----------------> NovizeShrat
//========================================

INSTANCE DIA_Alex_NovizeShrat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_NovizeShrat_Condition;
   information  = DIA_Alex_NovizeShrat_Info;
   permanent	= FALSE;
   description	= "Nowicjusz Shrat szuka sobie nowego miejsca.";
};

FUNC INT DIA_Alex_NovizeShrat_Condition()
{
    if (MIS_UCieczkaShrata == LOG_RUNNING)
    && (ShratHaveWork == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NovizeShrat_Info()
{
    AI_Output (other, self ,"DIA_Alex_NovizeShrat_15_01"); //Nowicjusz Shrat szuka sobie nowego miejsca.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_02"); //Je�eli chcesz, mo�esz go przyprowadzi� do obozu.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_03"); //Przyda nam si� ka�dy cz�owiek.
    B_LogEntry                     (CH1_UCieczkaShrata,"Alex przyjmie Shrata do obozu my�liwych. Musz� przekaza� Nowicjuszowi dobre wie�ci.");
ShratHaveWork = true;
    B_GiveXP (300);
};

//========================================
//-----------------> Ratunek
//========================================

INSTANCE DIA_Alex_Ratunek (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Ratunek_Condition;
   information  = DIA_Alex_Ratunek_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_Ratunek_Condition()
{
    if (Npc_GetDistToNpc(self, other) < 700)
    && (MIS_Kidnapping == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Ratunek_Info()
{
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_01"); //Wreszcie kto� przyszed� mnie uwolni�.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_02"); //Przybywasz z ratunkiem? Tak?
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_03"); //To tw�j szcz�liwy dzie�.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_04"); //Ratowanie i piecze� ze �cierwojada w zestawie.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_05"); //Ha! Zjad�bym piecze�.

    AI_Output (other, self ,"DIA_Alex_Ratunek_15_07"); //Ja te�. Znudzi�o mi si� bieganie po Obozie.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_08"); //Wola�bym wspina� si� po wie�y do jakiej� urodnej niewiasty.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_09"); //A musisz zapieprza� �eby uwolni� jakiego� dziada z celi. He he.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_10"); //Piwko? I zaraz si� zbieramy.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_11"); //Jasne.
    CreateInvItems (self, ItFoBeer, 2);
    B_GiveInvItems (self, other, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_UseItem (hero, ItFoBeer);
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_12"); //Chod�my. 
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH3_Kidnapping,"My�liwy Alex zosta� uwolniony. Mo�emy wraca� do obozu. Wszystko dobrze si� sko�czy�o. ");
    Log_SetTopicStatus       (CH3_Kidnapping, LOG_SUCCESS);
    MIS_Kidnapping = LOG_SUCCESS;
 Npc_ExchangeRoutine (self, "start");
    B_GiveXP (1000);
};

//========================================
//-----------------> QUEST_TROLL
//========================================

INSTANCE DIA_Alex_QUEST_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_QUEST_TROLL_Condition;
   information  = DIA_Alex_QUEST_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_QUEST_TROLL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_CHAPTER_5)) && (MIS_Kidnapping == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_QUEST_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_01"); //O, dobrze ci� widzie�!
    AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_02"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_03"); //Zbieraj si�. Mamy robot�. W okolicach mostu do Nowego Obozu pojawi� si� wielki troll. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_04"); //Bestia zabi�a ju� trzech Najemnik�w. Jest szalona i agresywna. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_05"); //Pomo�esz mi si� jej pozby�. To zlecenie od Mag�w Wody. Nie�le na tym zarobimy!
    if (Npc_KnowsInfo (hero, Info_Milten_LSNOW))
    {
        AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_06"); //Nie mam najlepszych kontakt�w z Magami Wody. 
        AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_07"); //Spokojnie. Ja si� wszystkim zajm�. 
    };
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_08"); //A teraz chod� za mn�!
	self.aivar[AIV_PARTYMEMBER] =	TRUE;
    Npc_ExchangeRoutine (self, "troll");
	B_LogEntry                     (CH5_BigTroll,"Mam uda� si� z Alexem na polowanie na wielkiego trolla, kt�remu spodoba�y si� okolice Nowego Obozu.");
    Wld_InsertNpc				(BlackTroll,"OW_PATH_152K");	
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> POKONANY_TROLL
//========================================

INSTANCE DIA_Alex_POKONANY_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_POKONANY_TROLL_Condition;
   information  = DIA_Alex_POKONANY_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_POKONANY_TROLL_Condition()
{
    if (Npc_GetDistToWP (self, "OW_PATH_152K") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_POKONANY_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_01"); //Cholera, pierwszy raz widzia�em tak rozw�cieczonego trolla.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_02"); //No, twardy by� sukinsyn. 
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_03"); //Dobrze, �e jako� to prze�yli�my. Magowie obiecali mi 4000 bry�ek rudy, je�eli uda mi si� go zabi�.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_04"); //Dam ci teraz 2000 bry�ek z mojej kieszeni, a po wyp�at� udam si� sam do Mag�w.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_05"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_06"); //�wietnie. We� jeszcze te dwie silne mikstury uzdrawiaj�ce. 
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_07"); //Dzi�ki. Trzymaj si� przyjacielu. 
    B_LogEntry                     (CH5_BigTroll,"Uda�o nam si� pokona� wielkiego trolla. To by�a naprawd� ci�ka walka.");
    Log_SetTopicStatus       (CH5_BigTroll, LOG_SUCCESS);
    MIS_BigTroll = LOG_SUCCESS;

    B_GiveXP (250);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 2000);
    B_GiveInvItems (self, other, ItMiNugget, 2000);
    CreateInvItems (self, ItFo_Potion_Health_03, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 2);
};



