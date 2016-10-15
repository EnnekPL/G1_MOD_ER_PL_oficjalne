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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Alex_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alex_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_02"); //Nazywam siê Alex. Dbam o to, by w obozie panowa³ spokój. 
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_03"); //Jesteœ tu szefem?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_04"); //Szef to za mocne s³owo. Po prostu ogarniam co siê tu dzieje.
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
    AI_Output (self, other ,"DIA_Alex_Skup_03_02"); //Jasne! Je¿eli masz na sprzeda¿ skóry wilków lub miêso, mo¿esz je tutaj przynieœæ.
    AI_Output (self, other ,"DIA_Alex_Skup_03_03"); //Miêso skupujemy tylko w wiêkszych iloœciach.
    AI_Output (self, other ,"DIA_Alex_Skup_03_04"); //50 sztuk miêsa za 100 bry³ek rudy.
	AI_Output (self, other ,"DIA_Alex_Skup_03_05"); //Jeœli chodzi o skóry, to p³acê 200 bry³ek za 30 sztuk.
	Log_CreateTopic 	(GE_Skup,LOG_NOTE);
	B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry³ek za 30 sztuk) i miêso (100 bry³ek za 50 sztuk. Mo¿na go znaleŸæ w obozie myœliwych.");
    
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
   description	= "Chcê sprzedaæ skóry.";
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
    AI_Output (other, self ,"DIA_Alex_SellSkins_15_01"); //Chcê sprzedaæ skóry.
    AI_Output (self, other ,"DIA_Alex_SellSkins_03_02"); //Jasne. Oto twoja zap³ata.
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
   description	= "Chcê sprzedaæ miêso.";
};

FUNC INT DIA_Alex_SellMeat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItFoMuttonRaw) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SellMeat_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellMeat_15_01"); //Chcê sprzedaæ miêso.
    AI_Output (self, other ,"DIA_Alex_SellMeat_03_02"); //Oto obiecana zap³ata.
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
   description	= "Sprzedasz mi jakiœ pancerz?";
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
    AI_Output (other, self ,"DIA_Alex_Armor_15_01"); //Sprzedasz mi jakiœ pancerz?
    if (MIS_PorwanieAlexa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_02"); //Mam na stanie zarówno ubranie, jak i zbrojê.
        AI_Output (self, other ,"DIA_Alex_Armor_03_03"); //Wybierz sobie, które ci odpowiada.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_04"); //Tobie? Ledwo ciê znam.
        AI_Output (other, self ,"DIA_Alex_Armor_15_05"); //A wiêc najwy¿szy czas mnie poznaæ!
        AI_Output (self, other ,"DIA_Alex_Armor_03_06"); //No dobra, spróbujmy. Sprzedam ci moje stare ubranie, jeœli popracujesz trochê na rzecz obozu.
        AI_Output (other, self ,"DIA_Alex_Armor_15_07"); //Co jest do zrobienia?
        AI_Output (self, other ,"DIA_Alex_Armor_03_08"); //Najpierw weŸ to miêso i usma¿ je porz¹dnie na patelni. Ja nie mam na to czasu. Pamiêtaj, ¿eby mi je potem odnieœæ!
        AI_Output (self, other ,"DIA_Alex_Armor_03_09"); //Gdy ju¿ to zrobisz, pogadaj z Firnem. Trzeba naprawiæ palisadê w obozie.
        AI_Output (self, other ,"DIA_Alex_Armor_03_10"); //Na koniec pomo¿esz Stanleyowi uzupe³niæ ekwipunek. Z tego co mi wiadomo, potrzebne mu jest 50 strza³. 
        MIS_JobInHuntersCamp = LOG_RUNNING;
		meat_oddane = false;
        Log_CreateTopic          (CH1_JobInHuntersCamp, LOG_MISSION);
        Log_SetTopicStatus       (CH1_JobInHuntersCamp, LOG_RUNNING);
        B_LogEntry               (CH1_JobInHuntersCamp,"Je¿eli chcê dostaæ ubranie myœliwego, bêdê musia³ na nie zapracowaæ. Mam usma¿yæ miêso i odnieœæ je do Alexa, naprawiæ palisadê razem z Firnem i przynieœæ Stanleyowi 50 strza³. ");
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
   description	= "Mam 30 sztuk sma¿onego miêsa. ";
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
    AI_Output (other, self ,"DIA_Alex_Mutton_15_01"); //Mam 30 sztuk sma¿onego miêsa. 
    AI_Output (self, other ,"DIA_Alex_Mutton_03_02"); //Dobra robota. Uwielbiam sma¿one miêso. 
    B_LogEntry                     (CH1_JobInHuntersCamp,"Alex otrzyma³ swoje miêso. ");
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
   description	= "Zrobi³em co kaza³eœ.";
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
    AI_Output (other, self ,"DIA_Alex_RobotaENDE_15_01"); //Zrobi³em co kaza³eœ.
    AI_Output (self, other ,"DIA_Alex_RobotaENDE_03_02"); //Dobra robota! Obóz wreszcie wygl¹da jak trzeba. Teraz mogê ci sprzedaæ ubranie za 300 bry³ek rudy.
    B_LogEntry                     (CH1_JobInHuntersCamp,"Zadania zosta³y wykonane. Wreszcie mogê kupiæ nowy pancerz za niewielk¹ cenê. ");
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
   description	= "Daj mi ubranie myœliwego (300 bry³ek rudy)";
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
    AI_Output (other, self ,"DIA_Alex_GiveSArmor_15_01"); //Daj mi ubranie myœliwego.
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
   description	= "Co z ciê¿szym pancerzem?";
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
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_01"); //Co z ciê¿szym pancerzem?
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_02"); //Aby go dostaæ, bêdziesz musia³ rozwi¹zaæ sprawê pewnej kradzie¿y.
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_03"); //Kradzie¿y? 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_04"); //Ostatnio z obozu zginê³y cenne b³yskotki. Mój puchar i pierœcieñ Clawa. 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_05"); //Nie podoba mi siê to. Czy¿by w obozie by³ zdrajca?
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_06"); //Postaram siê to ustaliæ.
    MIS_TheftInHuntersCamp = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_TheftInHuntersCamp, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_RUNNING);
    B_LogEntry               (CH1_TheftInHuntersCamp,"Ostatniej nocy z obozu myœliwych zaginê³y dwa cenne przedmioty: puchar Alexa i pierœcieñ myœliwego Clawa. Nie wiadomo kto stoi za kradzie¿¹. ");
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
   description	= "Znalaz³em wasze b³yskotki.";
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
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_01"); //Znalaz³em wasze b³yskotki.
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_02"); //Naprawdê ci siê to uda³o? Czy to by³ jeden z moich ludzi?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_03"); //Nie. Zosta³y porwane przez gobliny. Znalaz³em je w skrzyni znajduj¹cej siê w jaskini nieopodal obozu. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_04"); //Jak to mo¿liwe, ¿e te bestyjki zakrad³y siê do obozu?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_05"); //Firn jest tylko cz³owiekiem. Mo¿liwe, ¿e przysn¹³. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_06"); //Hmm... No dobrze. W nagrodê sprzedam ci zbrojê myœliwego za 1300 bry³ek rudy. 
    B_LogEntry                     (CH1_TheftInHuntersCamp,"Zagadka rozwi¹zana. Przedmioty zosta³y skradzione przez gobliny z jaskini przy obozie. ");
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_SUCCESS);
    MIS_TheftInHuntersCamp = LOG_SUCCESS;
	B_GiveInvItems (hero, self, AlexCup, 1);
    B_GiveXP (400);
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
   description	= "Daj mi zbrojê myœliwego (1300 bry³ek rudy)";
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
    AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_01"); //Daj mi zbrojê myœliwego.
	if (Kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_05"); //Niestety ju¿ nam siê skoñczy³y. PrzyjdŸ póŸniej, gdy uszyjemy jeszcze kilka.
	DIA_Alex_GivMeHArmor.permanent = true;//fix er 1.4
	}
	else 
	{
    if (Npc_HasItems (hero, ItMiNugget)>=1300)
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_02"); //WeŸ j¹. Nale¿y ci siê.
        AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_03"); //Za tak¹ iloœæ rudy, to mi siê wiele rzeczy nale¿y...
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
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_04"); //Nie masz tyle rudy. Zbierz jeszcze trochê bry³ek. 
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
   description	= "Jonas skar¿y siê, ¿e myœliwi pracuj¹ powoli.";
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
    AI_Output (other, self ,"DIA_Alex_Skargi_15_01"); //Jonas skar¿y siê, ¿e myœliwi pracuj¹ powoli.
    AI_Output (self, other ,"DIA_Alex_Skargi_03_02"); //Nic mi o tym nie wiadomo. 
    AI_Output (self, other ,"DIA_Alex_Skargi_03_03"); //Mo¿e spróbuj z nimi porozmawiaæ.
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
   description	= "Jeden z myœliwych strasznie na ciebie narzeka.";
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
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_01"); //Jeden z myœliwych strasznie na ciebie narzeka.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_02"); //Hê?
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_03"); //Za¿¹da³ z³ota za pracê przy drewnie. Ponadto powiedzia³, ¿e powinniœmy szukaæ kopalni z³ota, a nie zajmowaæ siê zwierzyn¹.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_04"); //Nie d¹¿ê za bogactwem. Powiedz mi ile tutaj jest warte z³oto? Co nam po tym, ¿e zgromadzimy kufry ze z³otem skoro nawet go nie wykorzystamy.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_05"); //Zdechniemy broni¹c kilku œwiecide³ek przed pazernymi Stra¿nikami. Czy to ma sens?
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_06"); //Nie lepiej wykorzystaæ to co daje nam natura? Owoc pracy trzech bogów. 
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO3))
    {
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_07"); //Masz racjê. Nauczy³em ju¿ tego nieroba szacunku.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_08"); //Pobi³eœ go? le post¹pi³eœ.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_09"); //Dlaczego? Nale¿a³o mu siê.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_10"); //Zachowujecie siê jak dzieci w paskownicy. Nikt go tu nie trzyma. Je¿eli nie chce pracowaæ na rzecz obozu, to niech st¹d zje¿d¿a. Mog³eœ kazaæ mu po prostu odejœæ.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_11"); //Nie bêdê ciê zanudza³. IdŸ do tego cz³owieka i powiedz mu, ¿e nie ma ju¿ czego szukaæ w obozie.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_12"); //Niech odejdzie. Nie potrzebujemy tu darmozjadów.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_13"); //Tak zrobiê.

        B_LogEntry                     (CH1_Nieroby,"Mam kazaæ odejœæ myœliwemu. ");
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
   description	= "Nie jest was tu trochê za ma³o?";
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
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_01"); //Nie jest was tu trochê za ma³o?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_02"); //Mieliœmy jeszcze jednego cz³owieka, ale przepad³. Zazwyczaj polowa³ w okolicach Nowego Obozu.
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_03"); //Jak d³ugo ju¿ go nie ma?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_04"); //Nie wiem... Mo¿e tydzieñ. Nazywa³ siê Josep. Jakbyœ go znalaz³, to daj mi znaæ.

    MIS_JosepZniknal = LOG_RUNNING;

    Log_CreateTopic            (CH1_JosepZniknal, LOG_MISSION);
    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_RUNNING);
    B_LogEntry                     (CH1_JosepZniknal,"Z obozu znikn¹³ jeden z myœliwych. Od Alexa dowiedzia³em siê, ¿e nazywa³ siê Josep i polowa³ w okolicach Nowego Obozu.");
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
   description	= "Josep wróci³ do obozu.";
};

FUNC INT DIA_Alex_JosepPowrot_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Free))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_JosepPowrot_Info()
{
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_01"); //Josep wróci³ do obozu.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_02"); //Uda³o ci siê go znaleŸæ? Gdzie by³?
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_03"); //Zosta³ pojmany przez ludzi Lewusa i zmuszony do pracy na polach ry¿owych.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_04"); //Te sukinsyny z Nowego Obozu! Ju¿ ja im poka¿ê!
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_05"); //Lewus i Ry¿owy Ksi¹¿ê nie ¿yj¹. Przy³¹czyliœmy siê do powstania przeciwko ich tyranii.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_06"); //Jestem pe³en podziwu. WeŸ tê rudê w nagrodê.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH1_JosepZniknal,"Josep wróci³ do obozu. Alex by³ bardzo zadowolony z moich dokonañ.");

    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_SUCCESS);
    MIS_JosepZniknal = LOG_SUCCESS;

    B_GiveXP (350);
	EquipItem (NON_5614_Josep, ItMw_1H_Scythe_01);
};

//========================================
//-----------------> Podejrzane
//========================================

INSTANCE DIA_Alex_Podejrzane (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_Podejrzane_Condition;
   information  = DIA_Alex_Podejrzane_Info;
   permanent	= FALSE;
   description	= "Nie uwa¿asz, ¿e Josep zachowuje siê trochê dziwnie?";
};

FUNC INT DIA_Alex_Podejrzane_Condition()
{
    if (MIS_JosepZniknal == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Podejrzane_Info()
{
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_01"); //Nie uwa¿asz, ¿e Josep zachowuje siê trochê dziwnie?
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_02"); //Zrobi³ siê taki od kiedy wróci³ z ruin.
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_03"); //Ruin? Przecie¿ by³ w niewoli?
AI_Output (self, other ,"DIA_Alex_Podejrzane_03_04"); //Tak, ale jakiœ miesi¹c przed jego znikniêciem te¿ przepad³ na parê dni. 
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_05"); //Gdy wróci³, powiedzia³, ¿e zgubi³ siê wœród jakichœ ruin. W sumie, pe³no tego cholerstwa w Kolonii, wiêc nie dopytywa³em, gdzie dok³adnie.
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_06"); //Kiedy z nim rozmawia³em, powiedzia³ mi o pewnym amulecie. Gada³, ¿e przys³a³eœ mnie, ¿ebym mu go zabra³.
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_07"); //Obserwuj go, œledŸ. Mo¿e uda ci siê czegoœ dowiedzieæ.
    MIS_DziwnyJosep = LOG_RUNNING;
Npc_ExchangeRoutine (NON_5614_Josep, "beliar");
Npc_SetTalentSkill	(NON_5614_Josep,	NPC_TALENT_MAGE,		6);

 Npc_RemoveInvItems (NON_5614_Josep, ItMw_1H_Scythe_01, 1);
 	CreateInvItem		(NON_5614_Josep,	ItArRuneThunderball);
	NON_5614_Josep.fight_tactic	=	FAI_HUMAN_MAGE; 
	NON_5614_Josep.level 		=	25;
	NON_5614_Josep.attribute[ATR_STRENGTH] 	= 200;
	NON_5614_Josep.attribute[ATR_DEXTERITY]	= 200;
	NON_5614_Josep.attribute[ATR_MANA_MAX] 	= 300;
	NON_5614_Josep.attribute[ATR_MANA] 		= 300;
	NON_5614_Josep.attribute[ATR_HITPOINTS_MAX]= 400;
	NON_5614_Josep.attribute[ATR_HITPOINTS] 	= 400;
    Log_CreateTopic            (CH1_DziwnyJosep, LOG_MISSION);
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_RUNNING);
    B_LogEntry                     (CH1_DziwnyJosep,"Josep zachowuje siê bardzo dziwnie. Alex poradzi³ mi, abym go œledzi³.");

    AI_StopProcessInfos	(NON_5600_Alex);
};

//========================================
//-----------------> OpetanyJosep
//========================================

INSTANCE DIA_Alex_OpetanyJosep (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_OpetanyJosep_Condition;
   information  = DIA_Alex_OpetanyJosep_Info;
   permanent	= FALSE;
   description	= "Josep by³ opetany!";
};

FUNC INT DIA_Alex_OpetanyJosep_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Normalny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_OpetanyJosep_Info()
{
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_01"); //Josep by³ opêtany!
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_02"); //Co?!
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_03"); //To przez amulet, który znalaz³ w ruinach. Z jego majaczeñ mniemam, ¿e zasz³o tam coœ dziwnego.
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_04"); //Coœ sugerujesz?
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_05"); //W sumie to nie wiem dok³adnie... Musia³bym poprosiæ o pomoc magów.
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_06"); //O nie! OdejdŸ! Nie mieszam siê w sprawy magów!
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
	
	EquipItem (NON_5614_Josep, ItMwZ_1H_Sword_01);
	EquipItem (NON_5614_Josep, ItRw_Bow_Small_04);
	CreateInvItem (NON_5614_Josep,NON_WOLF_ARMOR);
	AI_EquipBestArmor (NON_5614_Josep);
};

//========================================
//-----------------> KillJosep
//========================================

INSTANCE DIA_Alex_KillJosep (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_KillJosep_Condition;
   information  = DIA_Alex_KillJosep_Info;
   permanent	= FALSE;
   description	= "Josep nie ¿yje!";
};

FUNC INT DIA_Alex_KillJosep_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_5614_Josep);
    if (Npc_KnowsInfo (hero, DIA_Josep_NieDales))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_KillJosep_Info()
{
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_01"); //Josep nie ¿yje!
    AI_Output (self, other ,"DIA_Alex_KillJosep_03_02"); //Jak to siê sta³o?
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_03"); //Coœ mu odbi³o i rzuci³ siê na mnie. Znalaz³em przy nim dziwny amulet, który dawa³ mu niezwyk³e moce.
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_04"); //Razi³ we mnie piorunami niczym doœwiadczony mag. Muszê pokazaæ ten amulet magom.
    AI_Output (self, other ,"DIA_Alex_KillJosep_03_05"); //Cholera, w Kolonii robi siê coraz bardziej niebezpiecznie. Powiem naszym, ¿eby nie zapuszczali siê w ruiny. 
    B_LogEntry                     (CH1_DziwnyJosep,"Niestety musia³em zabiæ Josepa. Jego dusza zosta³a zepsuta przez Beliara. ");

    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_SUCCESS);
    MIS_DziwnyJosep = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
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
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_02"); //Je¿eli chcesz, mo¿esz go przyprowadziæ do obozu.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_03"); //Przyda nam siê ka¿dy cz³owiek.
    B_LogEntry                     (CH1_UCieczkaShrata,"Alex przyjmie Shrata do obozu myœliwych. Muszê przekazaæ Nowicjuszowi dobre wieœci.");
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
    && (MIS_PorwanieAlexa == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Ratunek_Info()
{
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_01"); //Wreszcie ktoœ przyszed³ mnie uwolniæ.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_02"); //Przybywasz z ratunkiem? Tak?
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_03"); //To twój szczêœliwy dzieñ.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_04"); //Ratowanie i pieczeñ ze œcierwojada w zestawie.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_05"); //Ha! Zjad³bym pieczeñ.

    AI_Output (other, self ,"DIA_Alex_Ratunek_15_07"); //Ja te¿. Znudzi³o mi siê bieganie po Obozie.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_08"); //Wola³bym wspinaæ siê po wie¿y do jakiejœ urodnej niewiasty.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_09"); //A musisz zapieprzaæ ¿eby uwolniæ jakiegoœ dziada z celi. He he.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_10"); //Piwko? I zaraz siê zbieramy.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_11"); //Jasne.
    CreateInvItems (self, ItFoBeer, 2);
    B_GiveInvItems (self, other, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_UseItem (hero, ItFoBeer);
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_12"); //ChodŸmy. 
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_PorwanieAlexa,"Myœliwy Alex zosta³ uwolniony. Mo¿emy wracaæ do obozu. Wszystko dobrze siê skoñczy³o. ");
    Log_SetTopicStatus       (CH1_PorwanieAlexa, LOG_SUCCESS);
    MIS_PorwanieAlexa = LOG_SUCCESS;
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
    if (Npc_KnowsInfo (hero, DIA_Firn_CHAPTER_5)) && (MIS_PorwanieAlexa == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_QUEST_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_01"); //O, dobrze ciê widzieæ!
    AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_02"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_03"); //Zbieraj siê. Mamy robotê. W okolicach mostu do Nowego Obozu pojawi³ siê wielki troll. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_04"); //Bestia zabi³a ju¿ trzech Najemników. Jest szalona i agresywna. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_05"); //Pomo¿esz mi siê jej pozbyæ. To zlecenie od Magów Wody. NieŸle na tym zarobimy!
    if (Npc_KnowsInfo (hero, Info_Milten_LSNOW))
    {
        AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_06"); //Nie mam najlepszych kontaktów z Magami Wody. 
        AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_07"); //Spokojnie. Ja siê wszystkim zajmê. 
    };
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_08"); //A teraz chodŸ za mn¹!
	self.aivar[AIV_PARTYMEMBER] =	TRUE;
    Npc_ExchangeRoutine (self, "troll");
	B_LogEntry                     (CH1_Wielki_troll,"Mam udaæ siê z Alexem na polowanie na wielkiego trolla, któremu spodoba³y siê okolice Nowego Obozu.");
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
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_01"); //Cholera, pierwszy raz widzia³em tak rozwœcieczonego trolla.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_02"); //No, twardy by³ sukinsyn. 
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_03"); //Dobrze, ¿e jakoœ to prze¿yliœmy. Magowie obiecali mi 4000 bry³ek rudy, je¿eli uda mi siê go zabiæ.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_04"); //Dam ci teraz 2000 bry³ek z mojej kieszeni, a po wyp³atê udam siê sam do Magów.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_05"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_06"); //Œwietnie. WeŸ jeszcze te dwie silne mikstury uzdrawiaj¹ce. 
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_07"); //Dziêki. Trzymaj siê przyjacielu. 
    B_LogEntry                     (CH1_Wielki_troll,"Uda³o nam siê pokonaæ wielkiego trolla. To by³a naprawdê ciê¿ka walka.");
    Log_SetTopicStatus       (CH1_Wielki_troll, LOG_SUCCESS);
    MIS_Wielki_troll = LOG_SUCCESS;

    B_GiveXP (250);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 2000);
    B_GiveInvItems (self, other, ItMiNugget, 2000);
    CreateInvItems (self, ItFo_Potion_Health_03, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 2);
};



