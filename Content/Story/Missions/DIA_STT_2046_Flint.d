//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Flint_EXIT(C_INFO)
{
	npc             = STT_2046_Flint;
	nr              = 999;
	condition	= DIA_Flint_EXIT_Condition;
	information	= DIA_Flint_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Flint_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Flint_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Flint
// Rozdzia³ 1
// Dialogi ogólne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Flint_HELLO1 (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 1;
   condition    = DIA_Flint_HELLO1_Condition;
   information  = DIA_Flint_HELLO1_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Flint_HELLO1_Condition()
{
    if (!Npc_KnowsInfo (hero, DIA_OKYL_SZKODA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Flint_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Flint_HELLO1_03_02"); //Zostaw mnie w spokoju!
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Flint
// Rozdzia³ 1
// Flint w okolicach kot³a
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FOOD
//========================================

INSTANCE DIA_Flint_FOOD (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 1;
   condition    = DIA_Flint_FOOD_Condition;
   information  = DIA_Flint_FOOD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Flint_FOOD_Condition()
{
	if (MIS_OkylQuest == LOG_RUNNING) 
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Flint_FOOD_Info()
{
    AI_Output (self, other ,"DIA_Flint_FOOD_03_01"); //Wreszcie ¿ywy cz³owiek!
    AI_Output (other, self ,"DIA_Flint_FOOD_15_02"); //Co ty tu do cholery robisz?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_03"); //Jestem Cieniem ze Starego Obozu. Mam znaleŸæ tajn¹ œcie¿kê do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Flint_FOOD_03_04"); //Jestem tu z polecenia Thorusa.
    AI_Output (other, self ,"DIA_Flint_FOOD_15_05"); //Masz jakiœ problem?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_06"); //Zgubi³em siê i skoñczy³o mi siê po¿ywienie, ju¿ od kilku dni nie mia³em nic w ustach. Móg³byœ mi coœ przynieœæ?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_07"); //Najlepiej weŸ te¿ coœ do picia.
	//log
    MIS_FoodForFlint = LOG_RUNNING;
    Log_CreateTopic          (CH1_FoodForFlint, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FoodForFlint, LOG_RUNNING);
    B_LogEntry               (CH1_FoodForFlint,"Cieñ Flint kaza³ mi przynieœæ sobie coœ do jedzenia i do picia. Od kilku dni pa³êta siê po górach za Nowym Obozem.");
};

//========================================
//-----------------> BEER
//========================================

INSTANCE DIA_Flint_BEER (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 2;
   condition    = DIA_Flint_BEER_Condition;
   information  = DIA_Flint_BEER_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie piwo i szynkê.";
};

FUNC INT DIA_Flint_BEER_Condition()
{
    if (MIS_FoodForFlint == LOG_RUNNING)
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_BEER_Info()
{
    AI_Output (other, self ,"DIA_Flint_BEER_15_01"); //Mam dla ciebie piwo i szynkê. 
    AI_Output (self, other ,"DIA_Flint_BEER_03_02"); //Niech ciê Innos wynagrodzi. Jesteœ naprawdê dobrym cz³owiekiem. 
    B_LogEntry                     (CH1_FoodForFlint,"Flint dosta³ ode mnie kawa³ek szynki i piwo.");
    Log_SetTopicStatus       (CH1_FoodForFlint, LOG_SUCCESS);
    MIS_FoodForFlint = LOG_SUCCESS;
    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 15);
    B_GiveInvItems (self, other, ItMiNugget, 15);
};

//========================================
//-----------------> WATER
//========================================

INSTANCE DIA_Flint_WATER (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 3;
   condition    = DIA_Flint_WATER_Condition;
   information  = DIA_Flint_WATER_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie wodê i chleb.";
};

FUNC INT DIA_Flint_WATER_Condition()
{
    if (MIS_FoodForFlint == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoLoaf) >=1)
    && (Npc_HasItems (other, ItFo_Potion_Water_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_WATER_Info()
{
    AI_Output (other, self ,"DIA_Flint_WATER_15_01"); //Mam dla ciebie wodê i chleb. 
    AI_Output (self, other ,"DIA_Flint_WATER_03_02"); //Bardzo ci dziêkujê. 
    AI_Output (self, other ,"DIA_Flint_WATER_03_03"); //Z pewnoœci¹ to zapamiêtam. 
    B_LogEntry                     (CH1_FoodForFlint,"Da³em Flintowi chleb i butelkê wody. Powinno mu wystarczyæ.");
    Log_SetTopicStatus       (CH1_FoodForFlint, LOG_SUCCESS);
    MIS_FoodForFlint = LOG_SUCCESS;
    B_GiveXP (50);
    CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
};

//========================================
//-----------------> OkylQuest
//========================================

INSTANCE DIA_Flint_OkylQuest (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 4;
   condition    = DIA_Flint_OkylQuest_Condition;
   information  = DIA_Flint_OkylQuest_Info;
   permanent	= FALSE;
   description	= "Okyl kaza³ mi ciê zabiæ!";
};

FUNC INT DIA_Flint_OkylQuest_Condition()
{
    if (MIS_OkylQuest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_OkylQuest_Info()
{
    AI_Output (other, self ,"DIA_Flint_OkylQuest_15_01"); //Okyl kaza³ mi ciê zabiæ!
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_02"); //Wiedzia³em, ¿e wkrótce mnie wywêsz¹. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_03"); //Zanim jednak zachowasz siê jak barbarzyñca, bêdê mia³ dla ciebie propozycjê.
    AI_Output (other, self ,"DIA_Flint_OkylQuest_15_04"); //Wiêc s³ucham.
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_05"); //Stary Obóz to potêga. Mamy wszystko co chcemy. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_06"); //Czy nie chcia³byœ mieæ w tym wszystkim udzia³u?
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_07"); //Mogê za³atwiæ ci miejsce w Obozie. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_08"); //Wystarczy, ¿e mi pomo¿esz i przeka¿esz wiadomoœæ Thorusowi. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_09"); //Co ty na to?
    MIS_FlintsOffer = LOG_RUNNING;

    Log_CreateTopic          (CH1_FlintsOffer, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_RUNNING);
    B_LogEntry               (CH1_FlintsOffer,"Cieñ Flint z³o¿y³ mi ciekaw¹ propozycjê. Wkrêci mnie do Starego Obozu, je¿eli pomogê mu wyjœæ z tarapatów. Warto przemyœleæ tê propozycjê.");
	
};

//========================================
//-----------------> NewCamRulez
//========================================

INSTANCE DIA_Flint_NewCamRulez (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 5;
   condition    = DIA_Flint_NewCamRulez_Condition;
   information  = DIA_Flint_NewCamRulez_Info;
   permanent	= FALSE;
   description	= "Zginiesz w imiê Nowego Obozu!";
};

FUNC INT DIA_Flint_NewCamRulez_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_OkylQuest))
    && (MIS_OkylQuest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_NewCamRulez_Info()
{
    AI_Output (other, self ,"DIA_Flint_NewCamRulez_15_01"); //Zginiesz w imiê Nowego Obozu!
    AI_Output (self, other ,"DIA_Flint_NewCamRulez_03_02"); //Co za g³upiec! Walczmy wiêc!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	self.guild = GIL_NONE;
	Npc_SetTrueGuild (self,GIL_NONE);
    B_LogEntry               (CH1_OkylQuest,"Odnalaz³em szpiega w górach. By³ zagubiony i zmêczony, postanowi³em wiec wyzwaæ go na pojedynek.");
	B_LogEntry               (CH1_FlintsOffer,"Odrzuci³em propozycjê Flinta. Chcê do³¹czyæ do Nowego Obozu. Tak postanowi³em.");
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_FAILED);
    MIS_FlintsOffer = LOG_FAILED;
	//PrintScreen	("Anulowano zadanie: Propozycja Flinta! ", 1,-1,"font_new_10_red.tga",2);	
	
	if (MIS_FoodForFlint == LOG_RUNNING)
	{
	B_LogEntry               (CH1_FoodForFlint,"Postanowi³em zabiæ Flinta tak jak zleci³ mi Okyl. Trup raczej nie bêdzie potrzebowa³ jedzenia.");
    Log_SetTopicStatus       (CH1_FoodForFlint, LOG_FAILED);
    MIS_FoodForFlint = LOG_FAILED;
	};
};

//========================================
//-----------------> OldCampRulez
//========================================

INSTANCE DIA_Flint_OldCampRulez (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 6;
   condition    = DIA_Flint_OldCampRulez_Condition;
   information  = DIA_Flint_OldCampRulez_Info;
   permanent	= FALSE;
   description	= "Dobra. Czego ode mnie chcesz?";
};

FUNC INT DIA_Flint_OldCampRulez_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_OkylQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_OldCampRulez_Info()
{
    AI_Output (other, self ,"DIA_Flint_OldCampRulez_15_01"); //Dobra. Czego ode mnie chcesz?
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_02"); //Pomó¿ mi wróciæ do Starego Obozu. Je¿eli dotrzemy w jednym kawa³ku, to pozwolê ci przekazaæ raport Thorusowi.
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_03"); //Uzna ciê za swego i po problemie. 
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_04"); //Potem czeka ciê rozmowa z Gomezem. 
	AI_Output (other, self ,"DIA_Flint_OldCampRulez_15_05"); //A wiêc chodŸmy!
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_06"); //Zaczekaj. Nie pójdê w takim stroju. 
	AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_07"); //W porz¹dku. Teraz jestem gotów.
	AI_UnequipArmor			 (STT_2046_Flint);
    B_LogEntry               (CH1_FlintsOffer,"Flint kaza³ mi zaprowadziæ siê do Starego Obozu. W zamian bêdê móg³ przekazaæ raport Thorusowi, co w ostatecznoœci zapewni mi miejsce wœród Cieni.");
	B_LogEntry               (CH1_OkylQuest,"Zdecydowa³em siê przyj¹æ propozycjê Flinta i porzuciæ zlecenie od Okyla.");
	Log_SetTopicStatus       (CH1_OkylQuest, LOG_FAILED);
    MIS_OkylQuest = LOG_FAILED;
};

//========================================
//-----------------> FollowMe
//========================================

INSTANCE DIA_Flint_FollowMe (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 7;
   condition    = DIA_Flint_FollowMe_Condition;
   information  = DIA_Flint_FollowMe_Info;
   permanent	= FALSE;
   description	= "ChodŸ za mn¹. Zaprowadzê ciê!";
};

FUNC INT DIA_Flint_FollowMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_OldCampRulez )) && (!Npc_KnowsInfo (hero, DIA_Flint_NewCamRulez))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_FollowMe_Info()
{
    AI_Output (other, self ,"DIA_Flint_FollowMe_15_01"); //ChodŸ za mn¹. Zaprowadzê ciê!
    AI_Output (self, other ,"DIA_Flint_FollowMe_03_02"); //Œwietnie! Pamiêtaj tylko, ¿eby uwa¿aæ na Najemników. 
	AI_Output (other, self ,"DIA_Flint_FollowMe_15_03"); //Raczej nie uda nam siê omin¹æ g³ównej bramy. 
	AI_Output (self, other ,"DIA_Flint_FollowMe_03_04"); //Dobrze by by³o ¿ebyœ mia³ w pogotowiu jak¹œ solidn¹ wymówkê. 
	B_LogEntry                     (CH1_FlintsOffer,"Id¹c wraz z Flintem powinienem pomyœleæ nad tym, co powiem Jarvisowi przy bramie do Nowego Obozu. Lepiej te¿ nie zbli¿aæ siê do wnêtrza jaskini. Niepotrzebne mi nowe k³opoty.");
    Npc_ExchangeRoutine (self, "follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> InOC1
//========================================

INSTANCE DIA_Flint_InOC1 (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 8;
   condition    = DIA_Flint_InOC1_Condition;
   information  = DIA_Flint_InOC1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Flint_InOC1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_FollowMe))
    && (Npc_GetDistToWP (self, "OC1") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_InOC1_Info()
{
    AI_Output (self, other ,"DIA_Flint_InOC1_03_01"); //No i jesteœmy!
    AI_Output (self, other ,"DIA_Flint_InOC1_03_02"); //Bardzo ci dziêkujê.
    AI_Output (other, self ,"DIA_Flint_InOC1_15_03"); //Co z moj¹ nagrod¹?
    AI_Output (self, other ,"DIA_Flint_InOC1_03_04"); //IdŸ do Thorusa i powiedz mu, ¿e œcie¿ka do Wolnej Kopalni prowadzi przez góry.
    AI_Output (self, other ,"DIA_Flint_InOC1_03_05"); //Powinien byæ zadowolony.
    AI_Output (other, self ,"DIA_Flint_InOC1_15_06"); //Mam nadziejê. 
	//log
    B_LogEntry                     (CH1_FlintsOffer,"Zaprowadzi³em Flinta do Starego Obozu. Mam teraz przekazaæ Thorusowi, ¿e Cieñ odkry³ œcie¿kê prowadz¹c¹ do Wolnej Kopalni przez góry.");
    //Log_SetTopicStatus       (CH1_FlintsOffer, LOG_SUCCESS);
    //MIS_FlintsOffer = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_GoToOCWithFlint);
	//log
    //MIS_FlintaPrzyjecie = LOG_RUNNING;
    //Log_CreateTopic          (CH1_FlintaPrzyjecie, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_FlintaPrzyjecie, LOG_RUNNING);
    //B_LogEntry               (CH1_FlintaPrzyjecie,"Mam przekazaæ Thorusowi, ¿e Flint odkry³ œcie¿kê prowadz¹c¹ do Wolnej Kopalni przez góry.");
	//npc
	Npc_ExchangeRoutine (self, "prestart"); //1.25 edit
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_EquipBestArmor			(STT_2046_Flint);
	//exit
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Flint
// Rozdzia³ 1
// Zadanie z kurierem magów
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Emil
//========================================

INSTANCE DIA_Flint_Emil (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 1;
   condition    = DIA_Flint_Emil_Condition;
   information  = DIA_Flint_Emil_Info;
   permanent	= FALSE;
   description	= "S³ysza³em, ¿e towarzyszy³eœ Bandycie, który zabi³ Cienia Emila.";
};

FUNC INT DIA_Flint_Emil_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pacho_IhabeFood))
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_Emil_Info()
{
    AI_Output (other, self ,"DIA_Flint_Emil_15_01"); //S³ysza³em, ¿e towarzyszy³eœ Bandycie, który zabi³ Cienia Emila.
    AI_Output (self, other ,"DIA_Flint_Emil_03_02"); //No i co z tego?
    AI_Output (self, other ,"DIA_Flint_Emil_03_03"); //Jesteœmy w Kolonii Karnej, takie rzeczy s¹ tu na porz¹dku dziennym. 
    AI_Output (other, self ,"DIA_Flint_Emil_15_04"); //Zdradzisz mi, kim by³ Bandyta, który zabi³ Emila?
    AI_Output (self, other ,"DIA_Flint_Emil_03_05"); //To mój dobry kumpel.
    AI_Output (self, other ,"DIA_Flint_Emil_03_06"); //Poznaliœmy siê w Khorinis, jeszcze przed wojn¹ z orkami.
    AI_Output (self, other ,"DIA_Flint_Emil_03_07"); //Wspólnymi si³ami wyeliminowaliœmy kilka szych z górnego miasta. 
    AI_Output (other, self ,"DIA_Flint_Emil_15_08"); //Chcê wiedzieæ kim on jest.
    AI_Output (self, other ,"DIA_Flint_Emil_03_09"); //¯arty sobie stroisz? Nie jestem konfidentem.
    AI_Output (self, other ,"DIA_Flint_Emil_03_10"); //Zapomnij o tym!

    Info_ClearChoices		(DIA_Flint_Emil);
    Info_AddChoice		(DIA_Flint_Emil, "Mo¿e ciê jakoœ przekonam?", DIA_Flint_Emil_NoChoice);
    Info_AddChoice		(DIA_Flint_Emil, "Mo¿e chcesz piêædziesi¹t bry³ek rudy?", DIA_Flint_Emil_Ore50);
    Info_AddChoice		(DIA_Flint_Emil, "Co powiesz na walkê? Je¿eli wygram, wszystko mi zdradzisz.", DIA_Flint_Emil_Fight);
	if (Npc_KnowsInfo (hero, DIA_Flint_InOC1)) {
	Info_AddChoice		(DIA_Flint_Emil, "Przecie¿ ocali³em ci ¿ycie!", DIA_Flint_Emil_Help); };
};

FUNC VOID DIA_Flint_Emil_NoChoice()
{
    AI_Output (other, self ,"DIA_Flint_Emil_NoChoice_15_01"); //Mo¿e ciê jakoœ przekonam?
    AI_Output (self, other ,"DIA_Flint_Emil_NoChoice_03_02"); //Nie.
};

FUNC VOID DIA_Flint_Emil_Ore50()
{
    AI_Output (other, self ,"DIA_Flint_Emil_Ore50_15_01"); //Mo¿e chcesz piêædziesi¹t bry³ek rudy?
    AI_Output (self, other ,"DIA_Flint_Emil_Ore50_03_02"); //Hmm... Nie.
};

FUNC VOID DIA_Flint_Emil_Fight()
{
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_01"); //Co powiesz na walkê? Je¿eli wygram, wszystko mi zdradzisz.
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_02"); //Naprawdê myœlisz, ¿e uda ci siê mnie pokonaæ?
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_03"); //Niech ci bêdzie, ale jak ja wygram, zabiorê ci ca³¹ rudê.
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_04"); //Niech bêdzie. Wyci¹gaj broñ!
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_05"); //Tutaj? Chyba ¿artujesz.
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_06"); //ChodŸmy na arenê, niech wszyscy zobacz¹, ¿e ze mn¹ nie ma ¿artów!
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_07"); //ProwadŸ, zatem.
	//log 
    B_LogEntry              (CH2_CourierFireMage,"Zabójc¹ Emila jest jeden z Bandytów, kumpel Flinta z dawnych czasów. Zdradzi mi jego imiê, je¿eli pokonam go na arenie.");
    //rutyna dodana
	Npc_ExchangeRoutine (self,"arena");
	//exit
	 Info_ClearChoices		(DIA_Flint_Emil);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Flint_Emil_Help ()
{
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_01"); //Przecie¿ ocali³em ci ¿ycie!
    AI_Output (self, other ,"DIA_Flint_Emil_Help_03_02"); //Rzeczywiœcie. Tak... masz racjê.
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_03"); //Chyba jesteœ mi coœ winien. 
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_04"); //Przecie¿ pomog³em ci siê dostaæ do Obozu. 
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_05"); //Pos³uchaj, to dla mnie bardzo wa¿ne. Twój przyjaciel na pewno nie ucierpi. 
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_06"); //No dobra. Skoro tak stawiasz sprawê... Bandyta nazywa siê Ratford. Wiem, ¿e jest cz³onkiem bandy Quentina.
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_07"); //Nic wiêcej nie wiem. 
	//log
    B_LogEntry                     (CH2_CourierFireMage,"Zabójc¹ Emila jest jeden z Bandytów, kumpel Flinta z dawnych czasów. Goœæ nazywa siê Ratford.");
	//exit
	Info_ClearChoices		(DIA_Flint_Emil);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ArenaFight
//========================================

INSTANCE DIA_Flint_ArenaFight (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 1;
   condition    = DIA_Flint_ArenaFight_Condition;
   information  = DIA_Flint_ArenaFight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Flint_ArenaFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_Emil))
    && (Npc_GetDistToWP (self, "OCR_ARENABATTLE_TRAIN") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_ArenaFight_Info()
{
    AI_Output (self, other ,"DIA_Flint_ArenaFight_03_01"); //Zaraz przekonamy siê, kto jest prawdziwym wojownikiem!
	//gildia
	STT_2046_Flint.guild = GIL_NONE;
	Npc_SetTrueGuild (STT_2046_Flint, GIL_NONE);
	//attack
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HeroWin
//========================================

INSTANCE DIA_Flint_HeroWin (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 2;
   condition    = DIA_Flint_HeroWin_Condition;
   information  = DIA_Flint_HeroWin_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Flint_HeroWin_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_ArenaFight))
    && (STT_2046_Flint.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_HeroWin_Info()
{
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_01"); //Stary, masz niez³y cios!
    AI_Output (other, self ,"DIA_Flint_HeroWin_03_02"); //ZdradŸ mi imiê swojego kolegi.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_03"); //Hej, ja naprawdê...
    AI_Output (other, self ,"DIA_Flint_HeroWin_15_04"); //IMIÊ!
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_05"); //No dobra. Mój kumpel z Khorinis nazywa siê Ratford.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_06"); //Razem trafiliœmy do Kolonii, jednak do³¹czyliœmy do ró¿nych obozów.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_07"); //Ratford z tego, co wiem do³¹czy³ do Nowego Obozu, ale poluje z Bandytami.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_08"); //Nie wiem, gdzie teraz jest.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_09"); //Jak chcesz to sobie sam ich szukaj. Ja ci nie pomogê.
    AI_Output (other, self ,"DIA_Flint_HeroWin_15_10"); //Widzisz, to nie by³o takie trudne. 
	//log
    B_LogEntry                     (CH2_CourierFireMage,"Pokona³em Flinta na arenie. Zabójc¹ Emila jest Ratford, Szkodnik z Nowego Obozu wspó³pracuj¹cy z Bandytami.");
	//gildia
	STT_2046_Flint.guild = GIL_STT;
	Npc_SetTrueGuild (STT_2046_Flint, GIL_STT);
	//story
	hero_knows_RatfordKiller = true;
	//experience
    B_GiveXP (75);
	//npc
	Npc_ExchangeRoutine (self, "prestart");
	//exit
    AI_StopProcessInfos	(self);    
};

//========================================
//-----------------> HeroLose
//========================================

INSTANCE DIA_Flint_HeroLose (C_INFO)
{
   npc          = STT_2046_Flint;
   nr           = 3;
   condition    = DIA_Flint_HeroLose_Condition;
   information  = DIA_Flint_HeroLose_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Flint_HeroLose_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_ArenaFight))
    && (STT_2046_Flint.aivar[AIV_HASDEFEATEDSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Flint_HeroLose_Info()
{
    AI_Output (self, other ,"DIA_Flint_HeroLose_03_01"); //Przegra³eœ! Nie mamy o czym rozmawiaæ.
	//log
	MIS_CourierFireMage = LOG_SUCCESS;
	Log_SetTopicStatus  (CH2_CourierFireMage, LOG_SUCCESS);
    B_LogEntry          (CH2_CourierFireMage,"Przegra³em walkê. Teraz ju¿ nigdy siê nie dowiem, kto zabi³ Emila.");
	//npc
	Npc_ExchangeRoutine (self, "START");
	//gildia
	STT_2046_Flint.guild = GIL_STT;
	Npc_SetTrueGuild (STT_2046_Flint, GIL_STT);
	//exit
    AI_StopProcessInfos	(self);
};


