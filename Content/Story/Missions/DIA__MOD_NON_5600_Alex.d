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
	AI_Output (self, other ,"DIA_Alex_HELLO1_03_05"); //Choæ jak widaæ i mnie to czasem przerasta. Ostatnio zagin¹³ nasz cz³owiek... 
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
    AI_Output (self, other ,"DIA_Alex_Skup_03_02"); //Jasne! Je¿eli masz na sprzeda¿ skóry wilków to mo¿esz je tutaj przynieœæ.
    //AI_Output (self, other ,"DIA_Alex_Skup_03_03"); //Miêso skupujemy tylko w wiêkszych iloœciach.
    //AI_Output (self, other ,"DIA_Alex_Skup_03_04"); //50 sztuk miêsa za 100 bry³ek rudy.
	AI_Output (self, other ,"DIA_Alex_Skup_03_05"); //Jeœli chodzi o skóry, to p³acê 200 bry³ek za 30 sztuk.
	Log_CreateTopic 	(GE_Skup,LOG_NOTE);
	//B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry³ek za 30 sztuk) i miêso (100 bry³ek za 50 sztuk. Mo¿na go znaleŸæ w obozie myœliwych.");
    B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry³ek za 30 sztuk).Mo¿na go znaleŸæ w obozie myœliwych.");
    
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
    return FALSE;
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
    if (MIS_Kidnapping == LOG_SUCCESS)
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
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_10"); //Zachowujecie siê jak dzieci w piaskownicy. Nikt go tu nie trzyma. Je¿eli nie chce pracowaæ na rzecz obozu, to niech st¹d zje¿d¿a. Mog³eœ kazaæ mu po prostu odejœæ.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_11"); //Nie bêdê ciê zanudza³. IdŸ do tego cz³owieka i powiedz mu, ¿e nie ma ju¿ czego szukaæ w obozie.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_12"); //Niech odejdzie. Nie potrzebujemy tu takich jak on.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_13"); //Tak zrobiê.

        B_LogEntry                     (CH1_Nieroby,"Mam kazaæ odejœæ myœliwemu. Alexa bardzo zdenerwowa³a jego postawa.");
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
   description	= "Zagin¹³ jeden z waszych ludzi?";
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
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_01"); //Zagin¹³ jeden z waszych ludzi?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_02"); //Ta... Nazywa³ siê Josep. Nie by³ jakimœ m³odzikiem. Doœwiadczony facet maj¹cy ju¿ wiele wiosen za sob¹. Dziwi mnie jego znikniêcie.
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_03"); //Wys³a³eœ kogoœ na jego poszukiwania?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_04"); //Oczywiœcie, ¿e tak! Zazwyczaj polowa³ w okolicach Nowego Obozu. Czterech zwiadowców dok³adnie przeszuka³o tamte tereny. Bezskutecznie.
	AI_Output (self, other ,"DIA_Alex_NewQuest_03_05"); //Jeœli chcesz, mo¿esz próbowaæ, ale w¹tpiê, ¿e on jeszcze wróci. 

    MIS_MissedJosep = LOG_RUNNING;

    Log_CreateTopic          (CH1_MissedJosep, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MissedJosep, LOG_RUNNING);
    B_LogEntry               (CH1_MissedJosep,"Z obozu znikn¹³ jeden z myœliwych. Od Alexa dowiedzia³em siê, ¿e nazywa³ siê Josep i polowa³ w okolicach Nowego Obozu. Poszukiwania nie przynios³y skutku.");
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
   description	= "Przed chwil¹ przyprowadzi³em Josepa do obozu.";
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
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_01"); //Przed chwil¹ przyprowadzi³em Josepa do obozu.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_02"); //Gdzie go znalaz³eœ? Nie ukrywam, ¿e to œwietna wiadomoœæ.
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_03"); //Zosta³ pojmany przez ludzi Lewusa i zmuszony do pracy na polach ry¿owych.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_04"); //Jak to pojmany?
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_05"); //Mo¿na rzecz, ¿e zaszed³ Lewusowi za skórê, a póŸniej Laresowi, a póŸniej...
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_06"); //Dziwiê siê, ¿e w ogóle wyszed³ z tego ca³o. Chyba masz w tym niema³y udzia³?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_07"); //Owszem. By³bym wdziêczny, gdybyœ...
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_08"); //Rozumiem. 200 bry³ek rudy to chyba uczciwa cena za ocalenie jednego z moich ludzi?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_09"); //Zadowolê siê i tym. Dziêki.
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_10"); //To ja dziêkujê.
	
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
	
    B_LogEntry               (CH1_MissedJosep,"Josep wróci³ do obozu. Alex by³ bardzo zadowolony z moich dokonañ.");
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
    && (MIS_Kidnapping == LOG_RUNNING)
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
    B_LogEntry                     (CH3_Kidnapping,"Myœliwy Alex zosta³ uwolniony. Mo¿emy wracaæ do obozu. Wszystko dobrze siê skoñczy³o. ");
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
	B_LogEntry                     (CH5_BigTroll,"Mam udaæ siê z Alexem na polowanie na wielkiego trolla, któremu spodoba³y siê okolice Nowego Obozu.");
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
    B_LogEntry                     (CH5_BigTroll,"Uda³o nam siê pokonaæ wielkiego trolla. To by³a naprawdê ciê¿ka walka.");
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



