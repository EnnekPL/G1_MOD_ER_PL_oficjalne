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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Emanuel_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Emanuel_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_02"); //Nazywam si� Emanuel i jestem obozowym kucharzem.
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_03"); //To pewnie jeste� szanowany w Obozie...
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_04"); //Sprzedaj� tak�e �ywno��. Interesuje ci� co�?
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Kucharz Emanuel mo�e mi sprzeda� troch� jedzenia.");
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
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_02"); //Co� na pocz�tek, tak? Wiesz, chyba mi si� przydasz...
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_03"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_04"); //Id� do Draxa i odbierz dostaw� mi�sa i zi�. Postaraj si� nie pogubi� wszystkiego po drodze. Jasne?
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_05"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_06"); //Z niczym bardziej skomplikowanym sobie nie poradzisz.
	if (Npc_GetTrueGuild(other)!=GIL_BAU)
	{
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_07"); //Poza tym nie jeste� jednym z Bandyt�w, �eby m�c miesza� si� w moje interesy.
	};
    MIS_EmanuelDelivery = LOG_RUNNING;

    Log_CreateTopic          (CH1_EmanuelDelivery, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_RUNNING);
    B_LogEntry               (CH1_EmanuelDelivery,"Emanuel kaza� mi przynie�� zio�a i mi�so od my�liwego Draxa.");
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
   description	= "Mam zio�a i mi�so.";
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
    AI_Output (other, self ,"DIA_Emanuel_MAMZIOLA_15_01"); //Mam zio�a i mi�so.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_02"); //�wietnie.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_03"); //To nie by�o zbyt trudne. Masz tu 10 bry�ek rudy za fatyg�.
	Npc_RemoveInvItems (other,ItFo_Plants_mushroom_01, 10);
	Npc_RemoveInvItems (other,ItFo_Plants_RavenHerb_01, 2);
	Npc_RemoveInvItems (other,ItAt_Meatbug_01, 5);
	Npc_RemoveInvItems (other,ItFoMuttonRaw, 13);
	// eee fixed? 1.3
	CreateInvItems (hero, ItFoMuttonRaw, 30);
	B_GiveInvItems (hero, self, ItFoMuttonRaw, 30);
	
	CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
    B_LogEntry                     (CH1_EmanuelDelivery,"Dostarczy�em �ywno�� Emanuelowi. Dosta�em 10 bry�ek rudy.");
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
   description	= "Wiesz co� na temat �mierci Rayana?";
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
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_01"); //Wiesz co� na temat �mierci Rayana?
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_02"); //Nic konkretnego. Wyszed� pewnego wieczoru, a nast�pnego dnia znaleziono go z drobnymi obra�eniami.
	AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_03"); //Nie zosta� rozszarpany ani po�arty, wi�c pojawi�o si� przypuszczenie, �e mog�o to by� zab�jstwo. 
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_04"); //My�lisz, �e Kereth m�g� by� z tym zwi�zany? 
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_05"); //Kereth? Przecie� to jego brat! Ta �mier� bardzo go dotkn�a. Mo�e wygl�da� jakby co� kombinowa�, ale pewnie jest tylko sko�owany po tym wszystkim. 
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
   description	= "Masz dla mnie jak�� porz�dn� robot�?";
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
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_01"); //Masz dla mnie jak�� porz�dn� robot�?
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_02"); //Chcesz zdoby� moje zaufanie?
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_03"); //Mniej wi�cej. Zale�y mi na dobrze p�atnej robocie.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_04"); //Pos�uchaj, prowadz� na boku ma�y handel ze Starkadem z Obozu Bractwa �ni�cego. Sprzedaje mu �ywno�� i czasem alkohol. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_05"); //Nawet sobie nie wyobra�asz jak te �wi�toszki potrafi� popi�! No, ale do rzeczy. 
	AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_06"); //Starkad spotyka si� ze mn� co jaki� czas w jaskini na lewo obok przej�cia na Ziemie Ork�w. Wiesz kt�re to miejsce? Stoj� tam dwaj Stra�nicy.
	AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_07"); //Kojarz�...
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_08"); //Mam teraz du�o roboty, wi�c nie mog� p�j�� na spotkanie. Dam ci dostaw�, a ty dokonasz za mnie wymiany. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_09"); //Masz tu 30 kawa�k�w mi�sa i 5 misek zupy. Tylko nie wylej ich, do diab�a! Ostro�nie. Ca�o�� jest warta 150 bry�ek rudy.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_10"); //Jednak Starkad wisi mi jeszcze 250 bry�ek rudy za poprzedni� dostaw� alkoholu. Upomnij si� o nie. 
    AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_11"); //Dobra, a ile dostan� w zamian?
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_12"); //Zap�ac� ci 100 bry�ek rudy. To chyba uczciwa cena? 
	AI_Output (other, self ,"DIA_Emanuel_REPUTACJA_15_13"); //W porz�dku. 
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_14"); //Zaczekaj. Zamiast Starkada w jaskini mo�esz spotka� Shine. To ca�kiem mi�y go��, przyjaciel Starkada. R�cz� za niego. Nie powinien nic kombinowa�.
    AI_Output (self, other ,"DIA_Emanuel_REPUTACJA_03_15"); //Starkad w�a�nie jego czasem wysy�a, gdy podobnie jak ja dzisiaj, nie ma czasu. No, mo�esz i��. Powodzenia.
	
    MIS_EmanuelsDeals = LOG_RUNNING;

    Log_CreateTopic          (CH1_EmanuelsDeals, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EmanuelsDeals, LOG_RUNNING);
    B_LogEntry               (CH1_EmanuelsDeals,"Emanuel kaza� mi spotka� si� z jego kontrahentem z Obozu Bractwa w jaskini na lewo od przej�cia na Ziemie Ork�w pilnowanego przez Stra�nik�w. Musz� odebra� kwot� w wysoko�ci 400 bry�ek rudy i przekaza� 30 sztuk mi�sa, oraz 5 zup.");
    CreateInvItems (self, ItFoMutton, 30);
    B_GiveInvItems (self, other, ItFoMutton, 30);
    CreateInvItems (self, ItFoSoup, 5);
    B_GiveInvItems (self, other, ItFoSoup, 5);
    AI_StopProcessInfos	(self);
	Wld_InsertNpc				(NOV_1372_Novize,"ER_WD_QUEST_TRUP_01");
	B_KillNPc (NOV_1372_Novize);
	Wld_InsertNpc				(WD_7047_DeadNovize,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3"); //#ToDo zmieni� na oddalony wp albo doda� jeszcze jednego npc
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
   description	= "Mam skrzynk� z rud�.";
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
    AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_01"); //Mam skrzynk� z rud�. Niestety po drodze natkn��em si� na k�opoty.
    AI_Output (self, other ,"DIA_Emanuel_RUDAOK_15_02"); //Jakie znowu k�opoty? Ju� mia�em ci dzi�kowa�.
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_03"); //Nie masz si� czego obawia�. Ruda jest w porz�dku, jednak Shine nie �yje. 
    AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_04"); //Jak to? Nie by�o Starkada?
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_05"); //Nie, gdy zjawi�em si� w jaskini le�a� tam martwy Shine i jaki� inny Nowicjusz. Oboje mieli g��bokie rany. Widocznie walczyli.
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_06"); //W okolicy znalaz�em kolejne cia�o. Go�� najpewniej upad� i si� wykrwawi�. �aden z nich nie mia� przy sobie rudy. 
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_07"); //Poszed�em wi�c dalej. Spotka�em dw�ch agresywnych Nowicjuszy. Opatrywali rany przy po�udniowej bramie do Starego Obozu. 
	AI_Output (other, self ,"DIA_Emanuel_RUDAOK_15_08"); //Zaatakowali mnie, wiec ich zabi�em i znalaz�em rud�.
	AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_09"); //Widocznie wiedzieli o wymianie i postanowili napa�� Shine'a. Cholera, szkoda go jak diabli. Powiedz o tym Starkadowi, je�li jeszcze tego nie zrobi�e�.
	AI_Output (self, other ,"DIA_Emanuel_RUDAOK_03_10"); //I oddaj mu jedzenie! Ani my�l go sobie przyw�aszcza�!
    CreateInvItems (self, itminugget, 100);
    B_GiveInvItems (self, other, itminugget, 100);
    B_GiveInvItems (other, self, RudaEmanuela, 1);
	Npc_RemoveInvItems (self, RudaEmanuela,1);
	
    B_LogEntry                     (CH1_EmanuelsDeals,"Niestety wymiana nie zako�czy�a si� zbyt dobrze. Wprawdzie Emanuel odzyska� rud�, ale pomi�dzy Nowicjuszami dosz�o do zdrady w wyniku kt�rej Shine zgin��.");
	
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
   description	= "Potrzebujemy �ywno�ci.";
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
    AI_Output (other, self ,"DIA_Emanuel_Findeat_15_01"); //Potrzebujemy �ywno�ci.
    AI_Output (self, other ,"DIA_Emanuel_Findeat_03_02"); //Spokojnie. Ju� wszystko rozda�em Bandytom. 
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
   description	= "Sprzedasz mi troch� �ywno�ci?";
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
    AI_Output (other, self ,"DIA_Emanuel_Trade_15_01"); //Sprzedasz mi troch� �ywno�ci?
    AI_Output (self, other ,"DIA_Emanuel_Trade_03_02"); //Czemu nie?
};