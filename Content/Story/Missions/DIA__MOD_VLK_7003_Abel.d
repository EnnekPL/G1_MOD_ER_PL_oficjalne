//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Abel_EXIT(C_INFO)
{
	npc         = VLK_7003_Abel;
	nr          = 999;
	condition	= DIA_Abel_EXIT_Condition;
	information	= DIA_Abel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Abel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Abel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Abel_HELLO (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 1;
   condition    = DIA_Abel_HELLO_Condition;
   information  = DIA_Abel_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Abel_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Abel_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Abel_HELLO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_02"); //Nazywam siê Abel. Jestem tutaj robotnikiem.
    AI_Output (other, self ,"DIA_Abel_HELLO_15_03"); //Chyba nie bardzo ci siê widzi ta praca, co?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_04"); //Niestety jestem tu z przymusu. Zosta³em schwytany i skazany na roboty.
    AI_Output (other, self ,"DIA_Abel_HELLO_15_05"); //Co takiego zrobi³eœ?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_06"); //Kontaktowa³em siê z Bandytami.
};

//========================================
//-----------------> ALCHEMY
//========================================

INSTANCE DIA_Abel_ALCHEMY (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_ALCHEMY_Condition;
   information  = DIA_Abel_ALCHEMY_Info;
   permanent	= FALSE;
   description	= "Znasz siê na alchemii?";
};

FUNC INT DIA_Abel_ALCHEMY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Abel_ALCHEMY_Info()
{
    AI_Output (other, self ,"DIA_Abel_ALCHEMY_15_01"); //Znasz siê na alchemii?
    AI_Output (self, other ,"DIA_Abel_ALCHEMY_03_02"); //Trochê. Jednak nie potrafi³bym niczego ciê nauczyæ.
};

//========================================
//-----------------> TRUTKA
//========================================

INSTANCE DIA_Abel_TRUTKA (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 3;
   condition    = DIA_Abel_TRUTKA_Condition;
   information  = DIA_Abel_TRUTKA_Info;
   permanent	= FALSE;
   description	= "Potrafisz przygotowaæ truciznê?";
};

FUNC INT DIA_Abel_TRUTKA_Condition()
{
    if (MIS_Poison == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Abel_ALCHEMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_TRUTKA_Info()
{
    AI_Output (other, self ,"DIA_Abel_TRUTKA_15_01"); //Potrafisz przygotowaæ truciznê?
    AI_Output (self, other ,"DIA_Abel_TRUTKA_03_02"); //Truciznê powiadasz? Znam jeden przepis na s³ab¹ truciznê, ale musisz mi przynieœæ sk³adniki.
    AI_Output (self, other ,"DIA_Abel_TRUTKA_03_03"); //Przypuszczam, ¿e móg³byœ j¹ te¿ kupiæ w Bractwie, albo u jakiegoœ handlarza, który ma kontakty z magami.
	B_LogEntry               (CH1_Poison,"Niejaki Abel z obozu przed kopalni¹ potrafi przygotowaæ s³ab¹ truciznê, jednak potrzebuje sk³adników.");
};

//========================================
//-----------------> CREATE
//========================================

INSTANCE DIA_Abel_CREATE (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 4;
   condition    = DIA_Abel_CREATE_Condition;
   information  = DIA_Abel_CREATE_Info;
   permanent	= FALSE;
   description	= "Chcê ¿ebyœ to ty mi j¹ przygotowa³.";
};

FUNC INT DIA_Abel_CREATE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_TRUTKA))
    && (MIS_Poison == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_CREATE_Info()
{
    AI_Output (other, self ,"DIA_Abel_CREATE_15_01"); //Chcê ¿ebyœ to ty mi j¹ przygotowa³.
    AI_Output (self, other ,"DIA_Abel_CREATE_03_02"); //No dobrze. Przynieœ mi wiêc: butelkê wody, krucze ziele, bagienne ziele i jedno piwo.
    AI_Output (other, self ,"DIA_Abel_CREATE_15_03"); //Po co ci piwo?
    AI_Output (self, other ,"DIA_Abel_CREATE_03_04"); //Chcê siê napiæ. He he.
    //MIS_MiksturaTrujacaOM = LOG_RUNNING;

    //Log_CreateTopic          (CH1_MiksturaTrujacaOM, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_MiksturaTrujacaOM, LOG_RUNNING);
    B_LogEntry               (CH1_Poison,"Abel przygotuje dla mnie truj¹c¹ miksturê, je¿eli dostanie: butelkê wody, krucze ziele, bagienne ziele i jedno piwo.");
};

//========================================
//-----------------> QUEST_OK
//========================================

INSTANCE DIA_Abel_QUEST_OK (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 5;
   condition    = DIA_Abel_QUEST_OK_Condition;
   information  = DIA_Abel_QUEST_OK_Info;
   permanent	= FALSE;
   description	= "Mam twoje sk³adniki.";
};

FUNC INT DIA_Abel_QUEST_OK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_CREATE))
    //&& (MIS_MiksturaTrujacaOM == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoBeer) >=1)
    && (Npc_HasItems (other, ItFo_Plants_RavenHerb_01) >=1)
    && (Npc_HasItems (other, ItFo_Potion_Water_01) >=1)
    && (Npc_HasItems (other, ItMi_Plants_Swampherb_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_QUEST_OK_Info()
{
    AI_Output (other, self ,"DIA_Abel_QUEST_OK_15_01"); //Mam twoje sk³adniki.
    AI_Output (self, other ,"DIA_Abel_QUEST_OK_03_02"); //To œwietnie. Poczekaj chwilkê.
	AI_Output (self, other ,"DIA_Abel_QUEST_OK_03_03"); //Gotowe!
    B_GiveInvItems (other, self, ItMi_Plants_Swampherb_01, 1);
    B_GiveInvItems (other, self, ItFo_Plants_RavenHerb_01, 1);
    B_GiveInvItems (other, self, ItFo_Potion_Water_01, 1);
    B_GiveInvItems (other, self, ItFoBeer, 1);
    CreateInvItems (self, ItMi_Alchemy_trucizna_01, 1);
    B_GiveInvItems (self, other, ItMi_Alchemy_trucizna_01, 1);
    B_LogEntry               (CH1_Poison,"Zanios³em Ablowi potrzebne sk³adniki. Otrzyma³em s³ab¹ miksturê truj¹c¹.");
    //Log_SetTopicStatus       (CH1_MiksturaTrujacaOM, LOG_SUCCESS);
   // MIS_MiksturaTrujacaOM = LOG_SUCCESS;

    B_GiveXP (55);
};

//========================================
//-----------------> Wino
//========================================

INSTANCE DIA_Abel_Wino (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 1;
   condition    = DIA_Abel_Wino_Condition;
   information  = DIA_Abel_Wino_Info;
   permanent	= FALSE;
   description	= "Potrafisz produkowaæ wino?";
};

FUNC INT DIA_Abel_Wino_Condition()
{
    if (HeroKnowAbelIsWinemaker == true)  && (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_Wino_Info()
{
    AI_Output (other, self ,"DIA_Abel_Wino_15_01"); //Potrafisz produkowaæ wino?
    AI_Output (self, other ,"DIA_Abel_Wino_03_02"); //Przez dziewiêæ lat pracowa³em w winiarniach Marguniosa, wiêc chyba coœ tam potrafiê. Dlaczego pytasz?
    AI_Output (other, self ,"DIA_Abel_Wino_15_03"); //Pewien winiarz z obozu na bagnie poszukuje pomocnika. 
    AI_Output (self, other ,"DIA_Abel_Wino_03_04"); //To wspaniale siê sk³ada, bo Stra¿nicy zes³ali mnie tu bez prawa powrotu do obozu i gdybym spróbowa³ ucieczki to Artegor i reszta Stra¿ników z radoœci¹ nafaszerowaliby mnie trzema tuzinami strza³. 
    AI_Output (other, self ,"DIA_Abel_Wino_15_05"); //To rzeczywiœcie by³by k³opot, ale postaram siê coœ pokombinowaæ. 

    Info_ClearChoices		(DIA_Abel_Wino);
    Info_AddChoice		(DIA_Abel_Wino, "Mo¿e da³oby siê przekupiæ Artegora lub któregoœ ze Stra¿ników? ", DIA_Abel_Wino_Przekupstwo);
    Info_AddChoice		(DIA_Abel_Wino, "Masz jakiœ pomys³ na ucieczkê?", DIA_Abel_Wino_Ucieczka);
};

FUNC VOID DIA_Abel_Wino_Przekupstwo()
{
    AI_Output (other, self ,"DIA_Abel_Wino_Przekupstwo_15_01"); //Mo¿e da³oby siê przekupiæ Artegora lub któregoœ ze Stra¿ników? 
    AI_Output (self, other ,"DIA_Abel_Wino_Przekupstwo_03_02"); //Zapomnij, Artegor mnie nie znosi. Poza tym nie spuszcza ze mnie oka. Wymyœl lepiej coœ innego. 
    AI_Output (other, self ,"DIA_Abel_Wino_Przekupstwo_15_03"); //A pozostali Stra¿nicy?
    AI_Output (self, other ,"DIA_Abel_Wino_Przekupstwo_03_04"); //Te¿ odpadaj¹. Boj¹ siê Artegora. 
};

FUNC VOID DIA_Abel_Wino_Ucieczka()
{
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_01"); //Masz jakiœ pomys³ na ucieczkê?
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_02"); //Hmmm? Biec przed siebie? 
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_03"); //To mo¿e siê udaæ.
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_04"); //Czyœ ty do reszty oszala³? Zaraz by mnie z³apali.
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_05"); //A gdybym tak przyniós³ ci miksturê, która przyspieszy twój bieg?
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_06"); //Zapomnia³eœ, ¿e Stra¿nicy maj¹ na plecach kusze? Turniej strzelniczy z nieco bardziej ruchliwym celem? Nie dziêki. 
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_07"); //Spróbujê jakoœ odwróciæ ich uwagê. 
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_08"); //Zajmij siê goœciem na wie¿y i Artegorem. S¹ najbli¿ej. Ci przesiaduj¹cy ko³o kuchni Matta nie stanowi¹ zagro¿enia.
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_09"); //Najpewniej zorientuj¹ siê, gdy ju¿ bêdê za obozem. Chodzi mi tylko o tych dwóch, o których ci wspomnia³em.
	AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_10"); //Ale najpierw przynieœ miksturê. Bez niej nie zaczniemy. Tylko przynieœæ najs³absz¹, bo nie wiem jak mój ¿o³¹dek poradzi sobie z mocniejszymi. 
    Info_ClearChoices		(DIA_Abel_Wino);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Abel faktycznie zna siê na produkcji wina, jednak nie mo¿e opuœciæ obozu. Muszê pomóc mu w ucieczce. Najpierw powinienem przynieœæ mu s³ab¹ miksturê lekkoœci.");
};

//========================================
//-----------------> PotionGive
//========================================

INSTANCE DIA_Abel_PotionGive (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_PotionGive_Condition;
   information  = DIA_Abel_PotionGive_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie miksturê.";
};

FUNC INT DIA_Abel_PotionGive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_Wino))
    && (Npc_HasItems (other, ItFo_Potion_Haste_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_PotionGive_Info()
{
    B_GiveInvItems (other, self, ItFo_Potion_Haste_01, 1);
    AI_Output (other, self ,"DIA_Abel_PotionGive_15_01"); //Mam dla ciebie miksturê.
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_02"); //No dobra. Teraz mo¿esz spróbowaæ odwróciæ uwagê Artegora i tego Stra¿nika z wie¿y.
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_03"); //Najpierw zajmij siê Stra¿nikiem. Zanim zejdzie i tu przyjdzie minie trochê czasu. Potem zaczep Artegora.
    AI_Output (other, self ,"DIA_Abel_PotionGive_15_04"); //Co mam im powiedzieæ?
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_05"); //Nie wiem. ¯e w Starej Kopalni znaleziono podziemn¹ rzekê czy coœ... Tylko, ¿eby nie by³o zbyt g³upie, bo nikt ci nie uwierzy!
	AI_Output (self, other ,"DIA_Abel_PotionGive_03_06"); //Jak ci siê nie uda oderwaæ Artegora od wejœcia to zacznij bójkê z K³ykaczem. To powinno odwróciæ jego uwagê.
	
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Muszê jakoœ odwróciæ uwagê Stra¿nika z wie¿y i Artegora. Najpierw powinienem zaj¹æ siê tym pierwszym. Jeœli nie uda mi siê oderwaæ Artegora sprzed bramy, to mam wszcz¹æ bójkê z K³ykaczem.");
};

//========================================
//-----------------> Win
//========================================

INSTANCE DIA_Abel_Win (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_Win_Condition;
   information  = DIA_Abel_Win_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e ci siê uda³o.";
};

FUNC INT DIA_Abel_Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_PotionGive))
    && (ArtegorIsDistracted == true)
	&& (Npc_GetDistToWP (self, "OW_PATH_266") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_Win_Info()
{
    AI_Output (other, self ,"DIA_Abel_Win_15_01"); //Widzê, ¿e ci siê uda³o.
    AI_Output (self, other ,"DIA_Abel_Win_03_02"); //Nareszcie z dala od tych wyzyskiwaczy i ciemiê¿ycieli. Jestem wolny!
	AI_Output (other, self ,"DIA_Abel_Win_15_03"); //No nie do koñca... Pamiêtasz co mi obieca³eœ?
    AI_Output (self, other ,"DIA_Abel_Win_03_03"); //Tak, tak... Pamiêtam. Spotkamy siê w Obozie Bractwa.
    AI_Output (other, self ,"DIA_Abel_Win_15_04"); //W porz¹dku. Lepiej ju¿ idŸ, bo Stra¿nicy mog¹ zacz¹æ ciê szukaæ. Powodzenia.
    AI_Output (self, other ,"DIA_Abel_Win_03_05"); //Jeszcze raz dziêki. Powodzenia. 
	
    AI_StopProcessInfos	(VLK_7003_Abel);
	
	Npc_ExchangeRoutine (GRD_7001_Artegor,"start");
	Npc_ExchangeRoutine (NON_3077_Peratur,"start");
	Npc_ExchangeRoutine (VLK_7003_Abel,"PSI");
	
	Mdl_ApplyOverlayMds	(VLK_7003_Abel,"HUMANS_Relaxed.mds");
	
	B_LogEntry			(CH1_GhoransVine, "Abel w jednym kawa³ku zwia³ z obozu. Mam siê z nim spotkaæ w Bractwie. Ciekawe co powie Ghoran na takiego wspólnika.");
	B_GiveXP (150);
};

//wy³¹czone
//========================================
//-----------------> UCIECZKA
//========================================

INSTANCE DIA_Abel_UCIECZKA (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 6;
   condition    = DIA_Abel_UCIECZKA_Condition;
   information  = DIA_Abel_UCIECZKA_Info;
   permanent	= FALSE;
   description	= "Uda³o ci siê uciec?";
};

FUNC INT DIA_Abel_UCIECZKA_Condition()
{
    if (Kapitel == 4)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Abel_UCIECZKA_Info()
{
    AI_Output (other, self ,"DIA_Abel_UCIECZKA_15_01"); //Uda³o ci siê uciec?
    AI_Output (self, other ,"DIA_Abel_UCIECZKA_03_02"); //Na szczêœcie tak. Przy Starej Kopalni zrobi³o siê cholernie niebezpiecznie.
    AI_Output (self, other ,"DIA_Abel_UCIECZKA_03_03"); //Wszêdzie Stra¿nicy morduj¹cy byle kogo, ci¹g³e ataki. Daj spokój, po prostu musia³em siê stamt¹d wydostaæ.
};

