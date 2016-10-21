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
// Rozdzia� 1
// Dialogi og�lne
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
// Rozdzia� 1
// Flint w okolicach kot�a
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
    AI_Output (self, other ,"DIA_Flint_FOOD_03_01"); //Wreszcie �ywy cz�owiek!
    AI_Output (other, self ,"DIA_Flint_FOOD_15_02"); //Co ty tu do cholery robisz?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_03"); //Jestem Cieniem ze Starego Obozu. Mam znale�� tajn� �cie�k� do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Flint_FOOD_03_04"); //Jestem tu z polecenia Thorusa.
    AI_Output (other, self ,"DIA_Flint_FOOD_15_05"); //Masz jaki� problem?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_06"); //Zgubi�em si� i sko�czy�o mi si� po�ywienie, ju� od kilku dni nie mia�em nic w ustach. M�g�by� mi co� przynie��?
    AI_Output (self, other ,"DIA_Flint_FOOD_03_07"); //Najlepiej we� te� co� do picia.
	//log
    MIS_FoodForFlint = LOG_RUNNING;
    Log_CreateTopic          (CH1_FoodForFlint, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FoodForFlint, LOG_RUNNING);
    B_LogEntry               (CH1_FoodForFlint,"Cie� Flint kaza� mi przynie�� sobie co� do jedzenia i do picia. Od kilku dni pa��ta si� po g�rach za Nowym Obozem.");
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
   description	= "Mam dla ciebie piwo i szynk�.";
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
    AI_Output (other, self ,"DIA_Flint_BEER_15_01"); //Mam dla ciebie piwo i szynk�. 
    AI_Output (self, other ,"DIA_Flint_BEER_03_02"); //Niech ci� Innos wynagrodzi. Jeste� naprawd� dobrym cz�owiekiem. 
    B_LogEntry                     (CH1_FoodForFlint,"Flint dosta� ode mnie kawa�ek szynki i piwo.");
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
   description	= "Mam dla ciebie wod� i chleb.";
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
    AI_Output (other, self ,"DIA_Flint_WATER_15_01"); //Mam dla ciebie wod� i chleb. 
    AI_Output (self, other ,"DIA_Flint_WATER_03_02"); //Bardzo ci dzi�kuj�. 
    AI_Output (self, other ,"DIA_Flint_WATER_03_03"); //Z pewno�ci� to zapami�tam. 
    B_LogEntry                     (CH1_FoodForFlint,"Da�em Flintowi chleb i butelk� wody. Powinno mu wystarczy�.");
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
   description	= "Okyl kaza� mi ci� zabi�!";
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
    AI_Output (other, self ,"DIA_Flint_OkylQuest_15_01"); //Okyl kaza� mi ci� zabi�!
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_02"); //Wiedzia�em, �e wkr�tce mnie wyw�sz�. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_03"); //Zanim jednak zachowasz si� jak barbarzy�ca, b�d� mia� dla ciebie propozycj�.
    AI_Output (other, self ,"DIA_Flint_OkylQuest_15_04"); //Wi�c s�ucham.
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_05"); //Stary Ob�z to pot�ga. Mamy wszystko co chcemy. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_06"); //Czy nie chcia�by� mie� w tym wszystkim udzia�u?
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_07"); //Mog� za�atwi� ci miejsce w Obozie. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_08"); //Wystarczy, �e mi pomo�esz i przeka�esz wiadomo�� Thorusowi. 
    AI_Output (self, other ,"DIA_Flint_OkylQuest_03_09"); //Co ty na to?
    MIS_FlintsOffer = LOG_RUNNING;

    Log_CreateTopic          (CH1_FlintsOffer, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_RUNNING);
    B_LogEntry               (CH1_FlintsOffer,"Cie� Flint z�o�y� mi ciekaw� propozycj�. Wkr�ci mnie do Starego Obozu, je�eli pomog� mu wyj�� z tarapat�w. Warto przemy�le� t� propozycj�.");
	
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
   description	= "Zginiesz w imi� Nowego Obozu!";
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
    AI_Output (other, self ,"DIA_Flint_NewCamRulez_15_01"); //Zginiesz w imi� Nowego Obozu!
    AI_Output (self, other ,"DIA_Flint_NewCamRulez_03_02"); //Co za g�upiec! Walczmy wi�c!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	self.guild = GIL_NONE;
	Npc_SetTrueGuild (self,GIL_NONE);
    B_LogEntry               (CH1_OkylQuest,"Odnalaz�em szpiega w g�rach. By� zagubiony i zm�czony, postanowi�em wiec wyzwa� go na pojedynek.");
	B_LogEntry               (CH1_FlintsOffer,"Odrzuci�em propozycj� Flinta. Chc� do��czy� do Nowego Obozu. Tak postanowi�em.");
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_FAILED);
    MIS_FlintsOffer = LOG_FAILED;
	//PrintScreen	("Anulowano zadanie: Propozycja Flinta! ", 1,-1,"font_new_10_red.tga",2);	
	
	if (MIS_FoodForFlint == LOG_RUNNING)
	{
	B_LogEntry               (CH1_FoodForFlint,"Postanowi�em zabi� Flinta tak jak zleci� mi Okyl. Trup raczej nie b�dzie potrzebowa� jedzenia.");
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
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_02"); //Pom� mi wr�ci� do Starego Obozu. Je�eli dotrzemy w jednym kawa�ku, to pozwol� ci przekaza� raport Thorusowi.
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_03"); //Uzna ci� za swego i po problemie. 
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_04"); //Potem czeka ci� rozmowa z Gomezem. 
	AI_Output (other, self ,"DIA_Flint_OldCampRulez_15_05"); //A wi�c chod�my!
    AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_06"); //Zaczekaj. Nie p�jd� w takim stroju. 
	AI_Output (self, other ,"DIA_Flint_OldCampRulez_03_07"); //W porz�dku. Teraz jestem got�w.
	AI_UnequipArmor			 (STT_2046_Flint);
    B_LogEntry               (CH1_FlintsOffer,"Flint kaza� mi zaprowadzi� si� do Starego Obozu. W zamian b�d� m�g� przekaza� raport Thorusowi, co w ostateczno�ci zapewni mi miejsce w�r�d Cieni.");
	B_LogEntry               (CH1_OkylQuest,"Zdecydowa�em si� przyj�� propozycj� Flinta i porzuci� zlecenie od Okyla.");
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
   description	= "Chod� za mn�. Zaprowadz� ci�!";
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
    AI_Output (other, self ,"DIA_Flint_FollowMe_15_01"); //Chod� za mn�. Zaprowadz� ci�!
    AI_Output (self, other ,"DIA_Flint_FollowMe_03_02"); //�wietnie! Pami�taj tylko, �eby uwa�a� na Najemnik�w. 
	AI_Output (other, self ,"DIA_Flint_FollowMe_15_03"); //Raczej nie uda nam si� omin�� g��wnej bramy. 
	AI_Output (self, other ,"DIA_Flint_FollowMe_03_04"); //Dobrze by by�o �eby� mia� w pogotowiu jak�� solidn� wym�wk�. 
	B_LogEntry                     (CH1_FlintsOffer,"Id�c wraz z Flintem powinienem pomy�le� nad tym, co powiem Jarvisowi przy bramie do Nowego Obozu. Lepiej te� nie zbli�a� si� do wn�trza jaskini. Niepotrzebne mi nowe k�opoty.");
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
    AI_Output (self, other ,"DIA_Flint_InOC1_03_01"); //No i jeste�my!
    AI_Output (self, other ,"DIA_Flint_InOC1_03_02"); //Bardzo ci dzi�kuj�.
    AI_Output (other, self ,"DIA_Flint_InOC1_15_03"); //Co z moj� nagrod�?
    AI_Output (self, other ,"DIA_Flint_InOC1_03_04"); //Id� do Thorusa i powiedz mu, �e �cie�ka do Wolnej Kopalni prowadzi przez g�ry.
    AI_Output (self, other ,"DIA_Flint_InOC1_03_05"); //Powinien by� zadowolony.
    AI_Output (other, self ,"DIA_Flint_InOC1_15_06"); //Mam nadziej�. 
	//log
    B_LogEntry                     (CH1_FlintsOffer,"Zaprowadzi�em Flinta do Starego Obozu. Mam teraz przekaza� Thorusowi, �e Cie� odkry� �cie�k� prowadz�c� do Wolnej Kopalni przez g�ry.");
    //Log_SetTopicStatus       (CH1_FlintsOffer, LOG_SUCCESS);
    //MIS_FlintsOffer = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_GoToOCWithFlint);
	//log
    //MIS_FlintaPrzyjecie = LOG_RUNNING;
    //Log_CreateTopic          (CH1_FlintaPrzyjecie, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_FlintaPrzyjecie, LOG_RUNNING);
    //B_LogEntry               (CH1_FlintaPrzyjecie,"Mam przekaza� Thorusowi, �e Flint odkry� �cie�k� prowadz�c� do Wolnej Kopalni przez g�ry.");
	//npc
	Npc_ExchangeRoutine (self, "prestart"); //1.25 edit
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_EquipBestArmor			(STT_2046_Flint);
	//exit
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Flint
// Rozdzia� 1
// Zadanie z kurierem mag�w
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
   description	= "S�ysza�em, �e towarzyszy�e� Bandycie, kt�ry zabi� Cienia Emila.";
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
    AI_Output (other, self ,"DIA_Flint_Emil_15_01"); //S�ysza�em, �e towarzyszy�e� Bandycie, kt�ry zabi� Cienia Emila.
    AI_Output (self, other ,"DIA_Flint_Emil_03_02"); //No i co z tego?
    AI_Output (self, other ,"DIA_Flint_Emil_03_03"); //Jeste�my w Kolonii Karnej, takie rzeczy s� tu na porz�dku dziennym. 
    AI_Output (other, self ,"DIA_Flint_Emil_15_04"); //Zdradzisz mi, kim by� Bandyta, kt�ry zabi� Emila?
    AI_Output (self, other ,"DIA_Flint_Emil_03_05"); //To m�j dobry kumpel.
    AI_Output (self, other ,"DIA_Flint_Emil_03_06"); //Poznali�my si� w Khorinis, jeszcze przed wojn� z orkami.
    AI_Output (self, other ,"DIA_Flint_Emil_03_07"); //Wsp�lnymi si�ami wyeliminowali�my kilka szych z g�rnego miasta. 
    AI_Output (other, self ,"DIA_Flint_Emil_15_08"); //Chc� wiedzie� kim on jest.
    AI_Output (self, other ,"DIA_Flint_Emil_03_09"); //�arty sobie stroisz? Nie jestem konfidentem.
    AI_Output (self, other ,"DIA_Flint_Emil_03_10"); //Zapomnij o tym!

    Info_ClearChoices		(DIA_Flint_Emil);
    Info_AddChoice		(DIA_Flint_Emil, "Mo�e ci� jako� przekonam?", DIA_Flint_Emil_NoChoice);
    Info_AddChoice		(DIA_Flint_Emil, "Mo�e chcesz pi��dziesi�t bry�ek rudy?", DIA_Flint_Emil_Ore50);
    Info_AddChoice		(DIA_Flint_Emil, "Co powiesz na walk�? Je�eli wygram, wszystko mi zdradzisz.", DIA_Flint_Emil_Fight);
	if (Npc_KnowsInfo (hero, DIA_Flint_InOC1)) {
	Info_AddChoice		(DIA_Flint_Emil, "Przecie� ocali�em ci �ycie!", DIA_Flint_Emil_Help); };
};

FUNC VOID DIA_Flint_Emil_NoChoice()
{
    AI_Output (other, self ,"DIA_Flint_Emil_NoChoice_15_01"); //Mo�e ci� jako� przekonam?
    AI_Output (self, other ,"DIA_Flint_Emil_NoChoice_03_02"); //Nie.
};

FUNC VOID DIA_Flint_Emil_Ore50()
{
    AI_Output (other, self ,"DIA_Flint_Emil_Ore50_15_01"); //Mo�e chcesz pi��dziesi�t bry�ek rudy?
    AI_Output (self, other ,"DIA_Flint_Emil_Ore50_03_02"); //Hmm... Nie.
};

FUNC VOID DIA_Flint_Emil_Fight()
{
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_01"); //Co powiesz na walk�? Je�eli wygram, wszystko mi zdradzisz.
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_02"); //Naprawd� my�lisz, �e uda ci si� mnie pokona�?
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_03"); //Niech ci b�dzie, ale jak ja wygram, zabior� ci ca�� rud�.
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_04"); //Niech b�dzie. Wyci�gaj bro�!
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_05"); //Tutaj? Chyba �artujesz.
    AI_Output (self, other ,"DIA_Flint_Emil_Fight_03_06"); //Chod�my na aren�, niech wszyscy zobacz�, �e ze mn� nie ma �art�w!
    AI_Output (other, self ,"DIA_Flint_Emil_Fight_15_07"); //Prowad�, zatem.
	//log 
    B_LogEntry              (CH2_CourierFireMage,"Zab�jc� Emila jest jeden z Bandyt�w, kumpel Flinta z dawnych czas�w. Zdradzi mi jego imi�, je�eli pokonam go na arenie.");
    //rutyna dodana
	Npc_ExchangeRoutine (self,"arena");
	//exit
	 Info_ClearChoices		(DIA_Flint_Emil);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Flint_Emil_Help ()
{
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_01"); //Przecie� ocali�em ci �ycie!
    AI_Output (self, other ,"DIA_Flint_Emil_Help_03_02"); //Rzeczywi�cie. Tak... masz racj�.
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_03"); //Chyba jeste� mi co� winien. 
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_04"); //Przecie� pomog�em ci si� dosta� do Obozu. 
	AI_Output (other, self ,"DIA_Flint_Emil_Help_15_05"); //Pos�uchaj, to dla mnie bardzo wa�ne. Tw�j przyjaciel na pewno nie ucierpi. 
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_06"); //No dobra. Skoro tak stawiasz spraw�... Bandyta nazywa si� Ratford. Wiem, �e jest cz�onkiem bandy Quentina.
	AI_Output (self, other ,"DIA_Flint_Emil_Help_03_07"); //Nic wi�cej nie wiem. 
	//log
    B_LogEntry                     (CH2_CourierFireMage,"Zab�jc� Emila jest jeden z Bandyt�w, kumpel Flinta z dawnych czas�w. Go�� nazywa si� Ratford.");
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
    AI_Output (self, other ,"DIA_Flint_ArenaFight_03_01"); //Zaraz przekonamy si�, kto jest prawdziwym wojownikiem!
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
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_01"); //Stary, masz niez�y cios!
    AI_Output (other, self ,"DIA_Flint_HeroWin_03_02"); //Zdrad� mi imi� swojego kolegi.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_03"); //Hej, ja naprawd�...
    AI_Output (other, self ,"DIA_Flint_HeroWin_15_04"); //IMI�!
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_05"); //No dobra. M�j kumpel z Khorinis nazywa si� Ratford.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_06"); //Razem trafili�my do Kolonii, jednak do��czyli�my do r�nych oboz�w.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_07"); //Ratford z tego, co wiem do��czy� do Nowego Obozu, ale poluje z Bandytami.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_08"); //Nie wiem, gdzie teraz jest.
    AI_Output (self, other ,"DIA_Flint_HeroWin_03_09"); //Jak chcesz to sobie sam ich szukaj. Ja ci nie pomog�.
    AI_Output (other, self ,"DIA_Flint_HeroWin_15_10"); //Widzisz, to nie by�o takie trudne. 
	//log
    B_LogEntry                     (CH2_CourierFireMage,"Pokona�em Flinta na arenie. Zab�jc� Emila jest Ratford, Szkodnik z Nowego Obozu wsp�pracuj�cy z Bandytami.");
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
    AI_Output (self, other ,"DIA_Flint_HeroLose_03_01"); //Przegra�e�! Nie mamy o czym rozmawia�.
	//log
	MIS_CourierFireMage = LOG_SUCCESS;
	Log_SetTopicStatus  (CH2_CourierFireMage, LOG_SUCCESS);
    B_LogEntry          (CH2_CourierFireMage,"Przegra�em walk�. Teraz ju� nigdy si� nie dowiem, kto zabi� Emila.");
	//npc
	Npc_ExchangeRoutine (self, "START");
	//gildia
	STT_2046_Flint.guild = GIL_STT;
	Npc_SetTrueGuild (STT_2046_Flint, GIL_STT);
	//exit
    AI_StopProcessInfos	(self);
};


