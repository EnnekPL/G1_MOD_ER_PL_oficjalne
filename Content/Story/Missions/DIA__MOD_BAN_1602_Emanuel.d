//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Emanuel_EXIT(C_INFO)
{
	npc         = BAN_1602_Emanuel;
	nr          = 999;
	condition	= DIA_Emanuel_EXIT_Condition;
	information	= DIA_Emanuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Emanuel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Emanuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Emanuel_HELLO (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 1;
   condition    = DIA_Emanuel_HELLO_Condition;
   information  = DIA_Emanuel_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Emanuel_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Emanuel_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_02"); //Nazywam siê Emanuel i jestem obozowym kucharzem.
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_03"); //To pewnie jesteœ szanowany w Obozie...
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_04"); //Sprzedajê tak¿e ¿ywnoœæ. Interesuje ciê coœ?
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Kucharz Emanuel mo¿e mi sprzedaæ trochê jedzenia.");
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Emanuel_QUEST1 (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 2;
   condition    = DIA_Emanuel_QUEST1_Condition;
   information  = DIA_Emanuel_QUEST1_Info;
   permanent	= FALSE;
   description	= "Szukam prostego zlecenia.";
};

FUNC INT DIA_Emanuel_QUEST1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Emanuel_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_01"); //Szukam prostego zlecenia.
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_02"); //Coœ na pocz¹tek, tak? Wiesz, chyba mi siê przydasz...
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_03"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_04"); //IdŸ do Draxa i odbierz dostawê miêsa i zió³. Postaraj siê nie pogubiæ wszystkiego po drodze. Jasne?
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_05"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_06"); //Z niczym bardziej skomplikowanym sobie nie poradzisz.
	if (Npc_GetTrueGuild(other)!=GIL_BAU)
	{
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_07"); //Poza tym nie jesteœ jednym z Bandytów, ¿eby móc mieszaæ siê w moje interesy.
	};
    MIS_EmanuelDelivery = LOG_RUNNING;

    Log_CreateTopic          (CH1_EmanuelDelivery, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_RUNNING);
    B_LogEntry               (CH1_EmanuelDelivery,"Emanuel kaza³ mi przynieœæ zio³a i miêso od myœliwego Draxa.");
};

//========================================
//-----------------> MAMZIOLA
//========================================

INSTANCE DIA_Emanuel_MAMZIOLA (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 3;
   condition    = DIA_Emanuel_MAMZIOLA_Condition;
   information  = DIA_Emanuel_MAMZIOLA_Info;
   permanent	= FALSE;
   description	= "Mam zio³a i miêso.";
};

FUNC INT DIA_Emanuel_MAMZIOLA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_ZIOLA))
    && (Npc_HasItems (other, ItFo_Plants_mushroom_01) >=10)
    && (Npc_HasItems (other, ItFo_Plants_RavenHerb_01) >=2)
    && (Npc_HasItems (other, ItAt_Meatbug_01) >=5)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=13)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_MAMZIOLA_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_MAMZIOLA_15_01"); //Mam zio³a i miêso.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_02"); //Œwietnie.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_03"); //To nie by³o zbyt trudne. Masz tu 10 bry³ek rudy za fatygê.
	Npc_RemoveInvItems (other,ItFo_Plants_mushroom_01, 10);
	Npc_RemoveInvItems (other,ItFo_Plants_RavenHerb_01, 2);
	Npc_RemoveInvItems (other,ItAt_Meatbug_01, 5);
	Npc_RemoveInvItems (other,ItFoMuttonRaw, 13);
	// eee fixed? 1.3
	CreateInvItems (hero, ItFoMuttonRaw, 30);
	B_GiveInvItems (hero, self, ItFoMuttonRaw, 30);
	
	CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
    B_LogEntry                     (CH1_EmanuelDelivery,"Dostarczy³em ¿ywnoœæ Emanuelowi. Dosta³em 10 bry³ek rudy.");
    Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_SUCCESS);
    MIS_EmanuelDelivery = LOG_SUCCESS;

    B_GiveXP (XP_EmanuelDelivery);
};

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Emanuel_RAYAN (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 2;
   condition    = DIA_Emanuel_RAYAN_Condition;
   information  = DIA_Emanuel_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ na temat œmierci Rayana?";
};

FUNC INT DIA_Emanuel_RAYAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_01"); //Wiesz coœ na temat œmierci Rayana?
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_02"); //Nic konkretnego. Wyszed³ pewnego wieczoru, a nastêpnego dnia znaleziono go z drobnymi obra¿eniami.
	AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_03"); //Nie zosta³ rozszarpany ani po¿arty, wiêc pojawi³o siê przypuszczenie, ¿e mog³o to byæ zabójstwo. 
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_04"); //Myœlisz, ¿e Kereth móg³ byæ z tym zwi¹zany? 
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_05"); //Kereth? Przecie¿ to jego brat! Ta œmieræ bardzo go dotknê³a. Mo¿e wygl¹daæ jakby coœ kombinowa³, ale pewnie jest tylko sko³owany po tym wszystkim. 
};

//========================================
//-----------------> REPUTACJA
//========================================

INSTANCE DIA_Emanuel_REPUTACJA (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 4;
   condition    = DIA_Emanuel_REPUTACJA_Condition;
   information  = DIA_Emanuel_REPUTACJA_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jak¹œ porz¹dn¹ robotê?";
};

FUNC INT DIA_Emanuel_REPUTACJA_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_REPUTACJA_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_01"); //Masz dla mnie jak¹œ porz¹dn¹ robotê?
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_02"); //Chcesz zdobyæ moje zaufanie?
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_03"); //Mniej wiêcej. Zale¿y mi na dobrze p³atnej robocie.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_04"); //Pos³uchaj, prowadzê na boku ma³y handel ze Starkadem z Obozu Bractwa Œni¹cego. Sprzedaje mu ¿ywnoœæ i czasem alkohol. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_05"); //Nawet sobie nie wyobra¿asz jak te œwiêtoszki potrafi¹ popiæ! No, ale do rzeczy. 
	AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_06"); //Starkad spotyka siê ze mn¹ co jakiœ czas w jaskini na lewo obok przejœcia na Ziemie Orków. Wiesz które to miejsce? Stoj¹ tam dwaj Stra¿nicy.
	AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_07"); //Kojarzê...
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_08"); //Mam teraz du¿o roboty, wiêc nie mogê pójœæ na spotkanie. Dam ci dostawê, a ty dokonasz za mnie wymiany. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_09"); //Masz tu 30 kawa³ków miêsa i 5 misek zupy. Tylko nie wylej ich, do diab³a! Ostro¿nie. Ca³oœæ jest warta 150 bry³ek rudy.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_10"); //Jednak Starkad wisi mi jeszcze 250 bry³ek rudy za poprzedni¹ dostawê alkoholu. Upomnij siê o nie. 
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_11"); //Dobra, a ile dostanê w zamian?
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_12"); //Zap³acê ci 100 bry³ek rudy. To chyba uczciwa cena? 
	AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_13"); //W porz¹dku. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_14"); //Zaczekaj. Zamiast Starkada w jaskini mo¿esz spotkaæ Shine. To ca³kiem mi³y goœæ, przyjaciel Starkada. Rêczê za niego. Nie powinien nic kombinowaæ.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_15"); //Starkad w³aœnie jego czasem wysy³a, gdy podobnie jak ja dzisiaj, nie ma czasu. No, mo¿esz iœæ. Powodzenia.
	
    MIS_EmanuelsDeals = LOG_RUNNING;

    Log_CreateTopic          (CH1_EmanuelsDeals, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EmanuelsDeals, LOG_RUNNING);
    B_LogEntry               (CH1_EmanuelsDeals,"Emanuel kaza³ mi spotkaæ siê z jego kontrahentem z Obozu Bractwa w jaskini na lewo od przejœcia na Ziemie Orków pilnowanego przez Stra¿ników. Muszê odebraæ kwotê w wysokoœci 400 bry³ek rudy i przekazaæ 30 sztuk miêsa, oraz 5 zup.");
    CreateInvItems (self, ItFoMutton, 30);
    B_GiveInvItems (self, other, ItFoMutton, 30);
    CreateInvItems (self, ItFoSoup, 5);
    B_GiveInvItems (self, other, ItFoSoup, 5);
    AI_StopProcessInfos	(self);
	Wld_InsertNpc				(NOV_1372_Novize,"ER_WD_QUEST_TRUP_01");
	B_KillNPc (NOV_1372_Novize);
	Wld_InsertNpc				(WD_7047_DeadNovize,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3"); //#ToDo zmieniæ na oddalony wp albo dodaæ jeszcze jednego npc
	B_KillNPc (WD_7047_DeadNovize);
	Wld_InsertNpc				(NOV_1373_Novize,"OC2");
	Wld_InsertNpc				(NOV_1374_Novize,"OC2");
	Npc_SetPermAttitude (NOV_1373_Novize, ATT_HOSTILE);
	Npc_SetPermAttitude (NOV_1374_Novize, ATT_HOSTILE);
	
	//ER_WD_QUEST_TRUP_01
};

//========================================
//-----------------> RUDAOK
//========================================

INSTANCE DIA_Emanuel_RUDAOK (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 5;
   condition    = DIA_Emanuel_RUDAOK_Condition;
   information  = DIA_Emanuel_RUDAOK_Info;
   permanent	= FALSE;
   description	= "Mam skrzynkê z rud¹.";
};

FUNC INT DIA_Emanuel_RUDAOK_Condition()
{
    if (MIS_EmanuelsDeals == LOG_RUNNING)
    && (Npc_HasItems (other, RudaEmanuela) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_RUDAOK_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_01"); //Mam skrzynkê z rud¹. Niestety po drodze natkn¹³em siê na k³opoty.
    AI_Output (self, other ,"DIA_Emanuel_RUDAOK_15_02"); //Jakie znowu k³opoty? Ju¿ mia³em ci dziêkowaæ.
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_03"); //Nie masz siê czego obawiaæ. Ruda jest w porz¹dku, jednak Shine nie ¿yje. 
    AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_04"); //Jak to? Nie by³o Starkada?
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_05"); //Nie, gdy zjawi³em siê w jaskini le¿a³ tam martwy Shine i jakiœ inny Nowicjusz. Oboje mieli g³êbokie rany. Widocznie walczyli.
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_06"); //W okolicy znalaz³em kolejne cia³o. Goœæ najpewniej upad³ i siê wykrwawi³. ¯aden z nich nie mia³ przy sobie rudy. 
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_07"); //Poszed³em wiêc dalej. Spotka³em dwóch agresywnych Nowicjuszy. Opatrywali rany przy po³udniowej bramie do Starego Obozu. 
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_08"); //Zaatakowali mnie, wiec ich zabi³em i znalaz³em rudê.
	AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_09"); //Widocznie wiedzieli o wymianie i postanowili napaœæ Shine'a. Cholera, szkoda go jak diabli. Powiedz o tym Starkadowi, jeœli jeszcze tego nie zrobi³eœ.
	AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_10"); //I oddaj mu jedzenie! Ani myœl go sobie przyw³aszczaæ!
    CreateInvItems (self, itminugget, 100);
    B_GiveInvItems (self, other, itminugget, 100);
    B_GiveInvItems (other, self, RudaEmanuela, 1);
	Npc_RemoveInvItems (self, RudaEmanuela,1);
	
    B_LogEntry                     (CH1_EmanuelsDeals,"Niestety wymiana nie zakoñczy³a siê zbyt dobrze. Wprawdzie Emanuel odzyska³ rudê, ale pomiêdzy Nowicjuszami dosz³o do zdrady w wyniku której Shine zgin¹³.");
	
    Log_SetTopicStatus       (CH1_EmanuelsDeals, LOG_SUCCESS);
    MIS_EmanuelsDeals = LOG_SUCCESS;
    B_GiveXP (325);
};



//========================================
//-----------------> Findeat
//========================================

INSTANCE DIA_Emanuel_Findeat (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 1;
   condition    = DIA_Emanuel_Findeat_Condition;
   information  = DIA_Emanuel_Findeat_Info;
   permanent	= FALSE;
   description	= "Potrzebujemy ¿ywnoœci.";
};

FUNC INT DIA_Emanuel_Findeat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_Findeat_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_Findeat_15_01"); //Potrzebujemy ¿ywnoœci.
    AI_Output (self, other ,"DIA_Emanuel_Findeat_03_02"); //Spokojnie. Ju¿ wszystko rozda³em Bandytom. 
    AI_Output (self, other ,"DIA_Emanuel_Findeat_03_03"); //Oto twoja porcja.
    CreateInvItems (self, ItFoApple, 2);
    B_GiveInvItems (self, other, ItFoApple, 2);
    CreateInvItems (self, ItFoMutton, 5);
    B_GiveInvItems (self, other, ItFoMutton, 5);
    CreateInvItems (self, ItFoLoaf, 2);
    B_GiveInvItems (self, other, ItFoLoaf, 2);
    CreateInvItems (self, ItFo_Potion_Health_01, 8);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 8);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Emanuel_Trade (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 888;
   condition    = DIA_Emanuel_Trade_Condition;
   information  = DIA_Emanuel_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Sprzedasz mi trochê ¿ywnoœci?";
};

FUNC INT DIA_Emanuel_Trade_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Emanuel_HELLO))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Emanuel_Trade_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_Trade_15_01"); //Sprzedasz mi trochê ¿ywnoœci?
    AI_Output (self, other ,"DIA_Emanuel_Trade_03_02"); //Czemu nie?
};