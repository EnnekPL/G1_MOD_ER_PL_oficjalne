/*
	//widz� jego sylwetk� majacz�c� w pobli�u wie�y.
	
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_21"); //Chyba musz� to zbada�.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_22"); //Chcesz si� tam wybra� w nocy?
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_23"); //Robi�em gorsze rzeczy.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_24"); //Je�li pomo�esz mi pozby� si� moich koszmar�w, hojnie ci� wynagrodz�.
    MIS_NieSpelnionaZemsta = LOG_RUNNING;
	Wld_InsertNpc				(NON_5632_Duch,"DUCH2");
    Log_CreateTopic            (CH1_NieSpelnionaZemsta, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_RUNNING);
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Podczas polowania podejrzanie zachowuj�cy si� Stra�nik �wi�tynny zabi� Biorna - 
	przyjaciela Magnusa. Przera�ony my�liwy obawia si� ducha przyjaciela, kt�ry prosi go o zemst� na pod�ym Stra�niku. 
	Najwy�sza pora zbada� wie��, wok� kt�rej pono� kr��y duch zmar�ego.");*/
	
	
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Magnus_EXIT(C_INFO)
{
	npc             = NON_5675_Magnus;
	nr              = 999;
	condition	= DIA_Magnus_EXIT_Condition;
	information	= DIA_Magnus_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Magnus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Magnus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Magnus_HELLO1 (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 1;
   condition    = DIA_Magnus_HELLO1_Condition;
   information  = DIA_Magnus_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jeste� my�liwym?";
};

FUNC INT DIA_Magnus_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Magnus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Magnus_HELLO1_15_01"); //Jeste� my�liwym?
    AI_Output (self, other ,"DIA_Magnus_HELLO1_03_02"); //Nie. Jestem tutaj z przypadku.
    AI_Output (self, other ,"DIA_Magnus_HELLO1_03_03"); //Szukam zemsty...
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Magnus_HELLO2 (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 2;
   condition    = DIA_Magnus_HELLO2_Condition;
   information  = DIA_Magnus_HELLO2_Info;
   permanent	= FALSE;
   description	= "Zemsty?";
};

FUNC INT DIA_Magnus_HELLO2_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Magnus_HELLO1))
{
    return TRUE;
	};
};

FUNC VOID DIA_Magnus_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_01"); //Zemsty?
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_02"); //Eh... To d�uga historia.
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_03"); //Opowiadaj.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_04"); //Polowali�my z moim przyjacielem Biornem w okolicach Bractwa.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_05"); //Nagle spostrzeg�em Stra�nika �wi�tynnego id�cego powolnym krokiem w naszym kierunku.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_06"); //S�dzi�em, �e chce si� przywita�. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_07"); //Podszed� do Biorna, kt�ry spokojnie jak gdyby nigdy nic sk�rowa� wilka.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_08"); //Nagle wyci�gn�� miecz i przebi� Biorna na wylot. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_09"); //Jestem pewien, �e zgin�� na miejscu.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_10"); //By�em tak przera�ony, �e uciek�em.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_11"); //P�niej przez kilka dni b��ka�em si� po lasach nie wiedz�c co ze sob� zrobi�. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_12"); //Ci�gle widzia�em zimne spojrzenie Stra�nika...
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_13"); //Gdy doszed�em do siebie, postanowi�em znale�� sobie jakie� ciche miejsce.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_14"); //I tak trafi�em tutaj.
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_15"); //Dlaczego Stra�nik �wi�tynny zabi� Biorna?
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_16"); //Nie mam poj�cia. Widocznie by� jaki� ob��kany.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_17"); //Ta Sekta musi sp�on��!
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_18"); //Wiesz co jest w tym wszystkim najgorsze?
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_19"); //To, �e wci�� s�ysz� jego g�os. Wo�a mnie i ka�e si� zem�ci�.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_20"); //Czasami budz� si� w nocy ca�y spocony i zdenerwowany.
	AI_Output (self, other ,"DIA_Magnus_HELLO2_03_30"); //Nie mog� przesta� o tym my�le�.
};

//========================================
//-----------------> CoZBiorne
//========================================

INSTANCE DIA_Magnus_CoZBiorne (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 1;
   condition    = DIA_Magnus_CoZBiorne_Condition;
   information  = DIA_Magnus_CoZBiorne_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Magnus_CoZBiorne_Condition()
{
    if  (Npc_KnowsInfo (hero, DIA_Duch_ENDMISSION)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Magnus_CoZBiorne_Info()
{
    AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_01"); //I co z Biornem? Uda�o ci si� mu pom�c?
    AI_Output (other, self ,"DIA_Magnus_CoZBiorne_15_02"); //Tak, zdj��em kl�tw�. Jest wolny.
    AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_03"); //Niechaj ci Innos wynagrodzi. Dzi�kuj� ci.
	//AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_04"); //We� t� ksi�g� i szat�. Znalaz�em je w pobli�u Klasztoru.
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	//CreateInvItems (self, DarkArmor_v1, 1);
    //B_GiveInvItems (self, other, DarkArmor_v1, 1);
	
	//CreateInvItems (self, ItWr_Book_DarkSect_01, 1);
   // B_GiveInvItems (self, other, ItWr_Book_DarkSect_01, 1);
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Powiedzia�em Magnusowi, �e uda�o mi si� uwolni� ducha Biorna. My�liwy odetchn�� z ulg�. Moje zadanie dobieg�o ko�ca.");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_SUCCESS);
	B_givexp (400);
    MIS_NieSpelnionaZemsta = LOG_SUCCESS;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BurnedBiorn
//========================================

INSTANCE DIA_Magnus_BurnedBiorn (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 1;
   condition    = DIA_Magnus_BurnedBiorn_Condition;
   information  = DIA_Magnus_BurnedBiorn_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Magnus_BurnedBiorn_Condition()
{
	 var C_NPC Biorn; Biorn = Hlp_GetNpc(NON_5632_Duch);
    if  (Npc_KnowsInfo (hero, DIA_Duch_TokasFire)) && (Npc_IsDead(Biorn))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Magnus_BurnedBiorn_Info()
{
    AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_01"); //Widzia�em ci� w pobli�u wie�y. B�yska� stamt�d ogie� i s�ycha� by�o odg�osy walki. Co si� sta�o?
    AI_Output (other, self ,"DIA_Magnus_BurnedBiorn_15_02"); //Pokona�em Biorna przy u�yciu czar�w ognia. Mam nadziej�, �e to uwolni jego dusz�.
    AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_03"); //Nie jeste� tego pewien?! Chyba b�d� ci musia� zaufa�.
	AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_04"); //Niech ci� Innos ma w opiece. We� te rud�.
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
	B_GiveXP (300);
    B_LogEntry               (CH1_NieSpelnionaZemsta,"Powiedzia�em Magnusowi o walce z Biornem. Mam nadziej�, �e Gor Na Tokas mnie nie ok�ama� i dusza my�liwego b�dzie wolna.");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_SUCCESS);
    MIS_NieSpelnionaZemsta = LOG_SUCCESS;
    AI_StopProcessInfos	(self);
};


//////////////////////////////////////////////
// Alex Help
//////////////////////////////////////////////

INSTANCE DIA_Magnus_AlexPrisoner (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 3;
   condition    = DIA_Magnus_AlexPrisoner_Condition;
   information  = DIA_Magnus_AlexPrisoner_Info;
   permanent	= FALSE;
   description	= "Alex zosta� porwany.";
};

FUNC INT DIA_Magnus_AlexPrisoner_Condition()
{
    if (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (!Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
	&& (!Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Magnus_AlexPrisoner_Info()
{
    AI_Output (other, self ,"DIA_Magnus_AlexPrisoner_15_01"); //Alex zosta� porwany. Potrzebuj� rudy na okup.
    AI_Output (self, other ,"DIA_Magnus_AlexPrisoner_03_02"); //Alex przyj�� mnie tutaj, gdy nie wiedzia�em co ze sob� zrobi�. Jestem mu wdzi�czny, kto wie co by teraz ze mn� by�o, gdyby nie on. 
    AI_Output (self, other ,"DIA_Magnus_AlexPrisoner_03_03"); //We� t� rud�. Mam nadziej�, �e przynajmniej cz�ciowo sp�aci�em sw�j d�ug. 
  
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	
	getmoneyfor_Magnus = true;
};

//========================================
//-----------------> Ucieczka
//========================================

INSTANCE DIA_Magnus_Ucieczka (C_INFO)
{
   npc          = NON_5675_Magnus;
   nr           = 3;
   condition    = DIA_Magnus_Ucieczka_Condition;
   information  = DIA_Magnus_Ucieczka_Info;
   permanent	= FALSE;
   description	= "Chcesz ochrania� kopalnie z�ota?";
};

FUNC INT DIA_Magnus_Ucieczka_Condition()
{
    if (MIS_GoldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Magnus_Ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_01"); //Chcesz ochrania� kopalnie z�ota?
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_02"); //Jak� kopalni�? Czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_03"); //Proponuj� ci �atw� prac� polegaj�c� przewa�nie na staniu przy wej�ciu i od czasu do czasu u�yciu si�y.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_04"); //Z ch�ci� przyjm� twoj� ofert�. Mo�e to pozwoli mi zapomnie� o Biornie.
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_05"); //Widzimy si� w karczmie na jeziorze.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_06"); //To jest w Nowym Obozie?
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_07"); //Tak.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_08"); //Dobrze. Wkr�tce si� tam zjawi�.
    B_LogEntry                     (CH2_GoldMine,"Magnus zajmie si� ochron� kopalni z�ota.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "karczma");
};

////////////////////////////////////////////////
// �WI�TYNIA �NI�CEGO
////////////////////////////////////////////////

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_MagnusOT_EXIT(C_INFO)
{
	npc         = NON_5676_MagnusOT;
	nr          = 999;
	condition	= DIA_MagnusOT_EXIT_Condition;
	information	= DIA_MagnusOT_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_MagnusOT_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MagnusOT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_MagnusOT_HELLO1 (C_INFO)
{
   npc          = NON_5676_MagnusOT;
   nr           = 1;
   condition    = DIA_MagnusOT_HELLO1_Condition;
   information  = DIA_MagnusOT_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MagnusOT_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_MagnusOT_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_01"); //Wybacz...
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_15_02"); //Magnus, co ty tutaj robisz, do cholery?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_03"); //Jaki� czas temu uda�em si� do Bractwa. Nie mog�em ju� sobie z tym wszystkim poradzi�. Wiesz, o czym m�wi�?
    if (Npc_KnowsInfo (hero, DIA_Magnus_HELLO2))
    {
        AI_Output (other, self ,"DIA_MagnusOT_HELLO1_15_04"); //Tak, pami�tam twoj� histori�. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_05"); //Cholera, znowu mia�em dreszcze i nie mog�em spa�. Musia�em w ko�cu zabi� Tokasa.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_06"); //Chcia�em to zrobi� noc�. Zasztyletowa� go w chacie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_07"); //Jednak, gdy zjawi�em si� w Bractwie dowiedzia�em si�, �e jest w niemal kompletnej ruinie. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_08"); //Gor Na Tokasa nie by�o ju� w Obozie. Prawie nikogo tam nie by�o. Cor Angar i kilkudziesi�ciu wiernych ludzi.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_09"); //Za�amany wraca�em do naszego obozu, my�l�c jakby tu ze sob� sko�czy�.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_10"); //Po drodze spotka�em jednak Lestera, jednego z Nowicjuszy. Powiedzia�, �e idzie na jakie� spotkanie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_11"); //Opowiedzia�em mu o tym, co mi le�y na sercu, a on wspomnia� o �wi�tyni �ni�cego, o twoich dokonaniach.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_12"); //Podzi�kowa�em mu i poszed�em ci� szuka�. Wiedzia�em, �e dzi�ki tobie b�d� mia� szans� stan�� do walki z Tokasem. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_13"); //Nie myli�em si�. 
    }
    else
    {
        AI_Output (other, self ,"DIA_MagnusOT_HELLO1_15_14"); //Chyba nie by�o okazji, �eby� mi opowiedzia�.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_15"); //Nie ma teraz czasu na d�ugie opowie�ci. Gor Na Tokas z zimn� krwi� zabi� kiedy� mojego przyjaciela. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_16"); //To by�o na polowaniu. Od tamtego czasu nie mog�em si� pogodzi� z jego �mierci�.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_17"); //Jego duch nawiedza� mnie w koszmarach. Musia�em si� zem�ci�. 
		AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_18"); //P�niej to wszystko usta�o, do czasu...
		AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_05"); //Cholera, znowu mia�em dreszcze i nie mog�em spa�. Musia�em w ko�cu zabi� Tokasa.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_06"); //Chcia�em to zrobi� noc�. Zasztyletowa� go w chacie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_07"); //Jednak, gdy zjawi�em si� w Bractwie dowiedzia�em si�, �e jest w niemal kompletnej ruinie. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_08"); //Gor Na Tokasa nie by�o ju� w Obozie. Prawie nikogo tam nie by�o. Cor Angar i kilkudziesi�ciu wiernych ludzi.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_09"); //Za�amany wraca�em do naszego obozu, my�l�c jakby tu ze sob� sko�czy�.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_10"); //Po drodze spotka�em jednak Lestera, jednego z Nowicjuszy. Powiedzia�, �e idzie na spotkanie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_11"); //Opowiedzia�em mu o tym, co mi le�y na sercu, a on wspomnia� o �wi�tyni �ni�cego, o twoich dokonaniach.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_12"); //Podzi�kowa�em mu i poszed�em ci� szuka�. Wiedzia�em, �e dzi�ki tobie b�d� mia� szans� stan�� do walki z Tokasem. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_13"); //Nie myli�em si�.    
};

    Info_ClearChoices		(DIA_MagnusOT_HELLO1);
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "Sk�d masz t� zbroj�?", DIA_MagnusOT_HELLO1_ARMOR);
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "Ca�y czas za mn� szed�e�?", DIA_MagnusOT_HELLO1_GHOST);
	if Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka)
	{
	Info_AddChoice		(DIA_MagnusOT_HELLO1, "Co z kopalni� z�ota Willa?", DIA_MagnusOT_HELLO1_WILL);
	};
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "Chod�my skopa� jakie� op�tane zadki! ", DIA_MagnusOT_HELLO1_KICKASS);
	
};

FUNC VOID DIA_MagnusOT_HELLO1_ARMOR()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_ARMOR_15_01"); //Sk�d masz t� zbroj�?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_ARMOR_03_02"); //Podarowa� mi j� niejaki Wilson, przyw�dca �owc�w ork�w. 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_ARMOR_03_03"); //Alex pom�g� mi dogada� si� z nim dogada�. To naprawd� w porz�dku faceci. 
};

FUNC VOID DIA_MagnusOT_HELLO1_GHOST()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_GHOST_15_01"); //Ca�y czas za mn� szed�e�?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_02"); //Nie ca�kiem... Zacz��em ci� �ledzi�, gdy wyszed�e� z wie�y tego Nekromanty.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_03"); //To chyba by�o ju� twoje drugie zej�cie do �wi�tyni. 
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_GHOST_15_04"); //Tak, by�em tu dwa razy. Dziwie si�, �e ci� nie zauwa�y�em.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_05"); //Jestem my�liwym, umiem by� dyskretny. 
};

FUNC VOID DIA_MagnusOT_HELLO1_WILL()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_WILL_15_01"); //Co z kopalni� z�ota Willa?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_02"); //Wszystko jest w porz�dku. Ch�opaki nie�le si� ob�owili. Maj� ju� kilkana�cie skrzy� z�ota.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_03"); //Jako, �e z�o�e si� powoli ko�czy�o, Will pozwoli� mi odej��.  
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_WILL_15_04"); //Reszta zosta�a?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_05"); //Tak, planuj� przeczeka� w jaskini do czasu, a� nic si� nie zmieni. Potem m�wili, �e dogadaj� si� z jakim� farmerem z Khorinis, kt�ry b�dzie ich kry�.
	AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_06"); //Gdy to us�ysza�em, my�la�em sobie: 'Oni naprawd� wierz�, �e Bariera upadnie? G�upcy!'. Teraz, gdy widz�, co si� tu dzieje przesta�em w to w�tpi�.
	AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_07"); //Nadchodz� zmiany. I to TY jeste� ich cz�ci�!
};

FUNC VOID DIA_MagnusOT_HELLO1_KICKASS()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_KICKASS_15_01"); //Chod�my skopa� jakie� op�tane zadki! 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_KICKASS_03_02"); //Na to czeka�em! Dzi�kuj� ci. 
    Npc_ExchangeRoutine (self, "FOLLOW");
    Info_ClearChoices		(DIA_MagnusOT_HELLO1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_MagnusOT_HELLO2 (C_INFO)
{
   npc          = NON_5676_MagnusOT;
   nr           = 2;
   condition    = DIA_MagnusOT_HELLO2_Condition;
   information  = DIA_MagnusOT_HELLO2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MagnusOT_HELLO2_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(TPL_1491_GorNaTokasOT);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MagnusOT_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO2_15_01"); //Co z tob�?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_02"); //To ju� koniec... (z rany obficie s�czy si� krew)
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_03"); //Dz..dzi�kuj� ci, wojowniku...
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_04"); //Nie by�o nawet okazji... �ebym m�g� pozna� twoje imi�... 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_05"); //Obym spotka� Biorna. 
    Npc_ExchangeRoutine (self, "die");
    AI_StopProcessInfos	(self);
};