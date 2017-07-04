/*
	//widzê jego sylwetkê majacz¹c¹ w pobli¿u wie¿y.
	
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_21"); //Chyba muszê to zbadaæ.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_22"); //Chcesz siê tam wybraæ w nocy?
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_23"); //Robi³em gorsze rzeczy.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_24"); //Jeœli pomo¿esz mi pozbyæ siê moich koszmarów, hojnie ciê wynagrodzê.
    MIS_NieSpelnionaZemsta = LOG_RUNNING;
	Wld_InsertNpc				(NON_5632_Duch,"DUCH2");
    Log_CreateTopic            (CH1_NieSpelnionaZemsta, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_RUNNING);
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Podczas polowania podejrzanie zachowuj¹cy siê Stra¿nik Œwi¹tynny zabi³ Biorna - 
	przyjaciela Magnusa. Przera¿ony myœliwy obawia siê ducha przyjaciela, który prosi go o zemstê na pod³ym Stra¿niku. 
	Najwy¿sza pora zbadaæ wie¿ê, wokó³ której ponoæ kr¹¿y duch zmar³ego.");*/
	
	
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
   description	= "Jesteœ myœliwym?";
};

FUNC INT DIA_Magnus_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Magnus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Magnus_HELLO1_15_01"); //Jesteœ myœliwym?
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
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_02"); //Eh... To d³uga historia.
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_03"); //Opowiadaj.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_04"); //Polowaliœmy z moim przyjacielem Biornem w okolicach Bractwa.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_05"); //Nagle spostrzeg³em Stra¿nika Œwi¹tynnego id¹cego powolnym krokiem w naszym kierunku.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_06"); //S¹dzi³em, ¿e chce siê przywitaæ. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_07"); //Podszed³ do Biorna, który spokojnie jak gdyby nigdy nic skórowa³ wilka.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_08"); //Nagle wyci¹gn¹³ miecz i przebi³ Biorna na wylot. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_09"); //Jestem pewien, ¿e zgin¹³ na miejscu.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_10"); //By³em tak przera¿ony, ¿e uciek³em.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_11"); //PóŸniej przez kilka dni b³¹ka³em siê po lasach nie wiedz¹c co ze sob¹ zrobiæ. 
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_12"); //Ci¹gle widzia³em zimne spojrzenie Stra¿nika...
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_13"); //Gdy doszed³em do siebie, postanowi³em znaleŸæ sobie jakieœ ciche miejsce.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_14"); //I tak trafi³em tutaj.
    AI_Output (other, self ,"DIA_Magnus_HELLO2_15_15"); //Dlaczego Stra¿nik Œwi¹tynny zabi³ Biorna?
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_16"); //Nie mam pojêcia. Widocznie by³ jakiœ ob³¹kany.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_17"); //Ta Sekta musi sp³on¹æ!
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_18"); //Wiesz co jest w tym wszystkim najgorsze?
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_19"); //To, ¿e wci¹¿ s³yszê jego g³os. Wo³a mnie i ka¿e siê zemœciæ.
    AI_Output (self, other ,"DIA_Magnus_HELLO2_03_20"); //Czasami budzê siê w nocy ca³y spocony i zdenerwowany.
	AI_Output (self, other ,"DIA_Magnus_HELLO2_03_30"); //Nie mogê przestaæ o tym myœleæ.
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
    AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_01"); //I co z Biornem? Uda³o ci siê mu pomóc?
    AI_Output (other, self ,"DIA_Magnus_CoZBiorne_15_02"); //Tak, zdj¹³em kl¹twê. Jest wolny.
    AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_03"); //Niechaj ci Innos wynagrodzi. Dziêkujê ci.
	//AI_Output (self, other ,"DIA_Magnus_CoZBiorne_03_04"); //WeŸ tê ksiêgê i szatê. Znalaz³em je w pobli¿u Klasztoru.
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	//CreateInvItems (self, DarkArmor_v1, 1);
    //B_GiveInvItems (self, other, DarkArmor_v1, 1);
	
	//CreateInvItems (self, ItWr_Book_DarkSect_01, 1);
   // B_GiveInvItems (self, other, ItWr_Book_DarkSect_01, 1);
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Powiedzia³em Magnusowi, ¿e uda³o mi siê uwolniæ ducha Biorna. Myœliwy odetchn¹³ z ulg¹. Moje zadanie dobieg³o koñca.");
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
    AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_01"); //Widzia³em ciê w pobli¿u wie¿y. B³yska³ stamt¹d ogieñ i s³ychaæ by³o odg³osy walki. Co siê sta³o?
    AI_Output (other, self ,"DIA_Magnus_BurnedBiorn_15_02"); //Pokona³em Biorna przy u¿yciu czarów ognia. Mam nadziejê, ¿e to uwolni jego duszê.
    AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_03"); //Nie jesteœ tego pewien?! Chyba bêdê ci musia³ zaufaæ.
	AI_Output (self, other ,"DIA_Magnus_BurnedBiorn_03_04"); //Niech ciê Innos ma w opiece. WeŸ te rudê.
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
	B_GiveXP (300);
    B_LogEntry               (CH1_NieSpelnionaZemsta,"Powiedzia³em Magnusowi o walce z Biornem. Mam nadziejê, ¿e Gor Na Tokas mnie nie ok³ama³ i dusza myœliwego bêdzie wolna.");
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
   description	= "Alex zosta³ porwany.";
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
    AI_Output (other, self ,"DIA_Magnus_AlexPrisoner_15_01"); //Alex zosta³ porwany. Potrzebujê rudy na okup.
    AI_Output (self, other ,"DIA_Magnus_AlexPrisoner_03_02"); //Alex przyj¹³ mnie tutaj, gdy nie wiedzia³em co ze sob¹ zrobiæ. Jestem mu wdziêczny, kto wie co by teraz ze mn¹ by³o, gdyby nie on. 
    AI_Output (self, other ,"DIA_Magnus_AlexPrisoner_03_03"); //WeŸ tê rudê. Mam nadziejê, ¿e przynajmniej czêœciowo sp³aci³em swój d³ug. 
  
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
   description	= "Chcesz ochraniaæ kopalnie z³ota?";
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
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_01"); //Chcesz ochraniaæ kopalnie z³ota?
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_02"); //Jak¹ kopalniê? Czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_03"); //Proponujê ci ³atw¹ pracê polegaj¹c¹ przewa¿nie na staniu przy wejœciu i od czasu do czasu u¿yciu si³y.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_04"); //Z chêci¹ przyjmê twoj¹ ofertê. Mo¿e to pozwoli mi zapomnieæ o Biornie.
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_05"); //Widzimy siê w karczmie na jeziorze.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_06"); //To jest w Nowym Obozie?
    AI_Output (other, self ,"DIA_Magnus_Ucieczka_15_07"); //Tak.
    AI_Output (self, other ,"DIA_Magnus_Ucieczka_03_08"); //Dobrze. Wkrótce siê tam zjawiê.
    B_LogEntry                     (CH2_GoldMine,"Magnus zajmie siê ochron¹ kopalni z³ota.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "karczma");
};

////////////////////////////////////////////////
// ŒWI¥TYNIA ŒNI¥CEGO
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
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_03"); //Jakiœ czas temu uda³em siê do Bractwa. Nie mog³em ju¿ sobie z tym wszystkim poradziæ. Wiesz, o czym mówiê?
    if (Npc_KnowsInfo (hero, DIA_Magnus_HELLO2))
    {
        AI_Output (other, self ,"DIA_MagnusOT_HELLO1_15_04"); //Tak, pamiêtam twoj¹ historiê. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_05"); //Cholera, znowu mia³em dreszcze i nie mog³em spaæ. Musia³em w koñcu zabiæ Tokasa.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_06"); //Chcia³em to zrobiæ noc¹. Zasztyletowaæ go w chacie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_07"); //Jednak, gdy zjawi³em siê w Bractwie dowiedzia³em siê, ¿e jest w niemal kompletnej ruinie. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_08"); //Gor Na Tokasa nie by³o ju¿ w Obozie. Prawie nikogo tam nie by³o. Cor Angar i kilkudziesiêciu wiernych ludzi.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_09"); //Za³amany wraca³em do naszego obozu, myœl¹c jakby tu ze sob¹ skoñczyæ.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_10"); //Po drodze spotka³em jednak Lestera, jednego z Nowicjuszy. Powiedzia³, ¿e idzie na jakieœ spotkanie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_11"); //Opowiedzia³em mu o tym, co mi le¿y na sercu, a on wspomnia³ o Œwi¹tyni Œni¹cego, o twoich dokonaniach.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_12"); //Podziêkowa³em mu i poszed³em ciê szukaæ. Wiedzia³em, ¿e dziêki tobie bêdê mia³ szansê stan¹æ do walki z Tokasem. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_13"); //Nie myli³em siê. 
    }
    else
    {
        AI_Output (other, self ,"DIA_MagnusOT_HELLO1_15_14"); //Chyba nie by³o okazji, ¿ebyœ mi opowiedzia³.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_15"); //Nie ma teraz czasu na d³ugie opowieœci. Gor Na Tokas z zimn¹ krwi¹ zabi³ kiedyœ mojego przyjaciela. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_16"); //To by³o na polowaniu. Od tamtego czasu nie mog³em siê pogodziæ z jego œmierci¹.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_17"); //Jego duch nawiedza³ mnie w koszmarach. Musia³em siê zemœciæ. 
		AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_18"); //PóŸniej to wszystko usta³o, do czasu...
		AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_05"); //Cholera, znowu mia³em dreszcze i nie mog³em spaæ. Musia³em w koñcu zabiæ Tokasa.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_06"); //Chcia³em to zrobiæ noc¹. Zasztyletowaæ go w chacie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_07"); //Jednak, gdy zjawi³em siê w Bractwie dowiedzia³em siê, ¿e jest w niemal kompletnej ruinie. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_08"); //Gor Na Tokasa nie by³o ju¿ w Obozie. Prawie nikogo tam nie by³o. Cor Angar i kilkudziesiêciu wiernych ludzi.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_09"); //Za³amany wraca³em do naszego obozu, myœl¹c jakby tu ze sob¹ skoñczyæ.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_10"); //Po drodze spotka³em jednak Lestera, jednego z Nowicjuszy. Powiedzia³, ¿e idzie na spotkanie.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_11"); //Opowiedzia³em mu o tym, co mi le¿y na sercu, a on wspomnia³ o Œwi¹tyni Œni¹cego, o twoich dokonaniach.
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_12"); //Podziêkowa³em mu i poszed³em ciê szukaæ. Wiedzia³em, ¿e dziêki tobie bêdê mia³ szansê stan¹æ do walki z Tokasem. 
        AI_Output (self, other ,"DIA_MagnusOT_HELLO1_03_13"); //Nie myli³em siê.    
};

    Info_ClearChoices		(DIA_MagnusOT_HELLO1);
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "Sk¹d masz tê zbrojê?", DIA_MagnusOT_HELLO1_ARMOR);
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "Ca³y czas za mn¹ szed³eœ?", DIA_MagnusOT_HELLO1_GHOST);
	if Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka)
	{
	Info_AddChoice		(DIA_MagnusOT_HELLO1, "Co z kopalni¹ z³ota Willa?", DIA_MagnusOT_HELLO1_WILL);
	};
    Info_AddChoice		(DIA_MagnusOT_HELLO1, "ChodŸmy skopaæ jakieœ opêtane zadki! ", DIA_MagnusOT_HELLO1_KICKASS);
	
};

FUNC VOID DIA_MagnusOT_HELLO1_ARMOR()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_ARMOR_15_01"); //Sk¹d masz tê zbrojê?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_ARMOR_03_02"); //Podarowa³ mi j¹ niejaki Wilson, przywódca ³owców orków. 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_ARMOR_03_03"); //Alex pomóg³ mi dogadaæ siê z nim dogadaæ. To naprawdê w porz¹dku faceci. 
};

FUNC VOID DIA_MagnusOT_HELLO1_GHOST()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_GHOST_15_01"); //Ca³y czas za mn¹ szed³eœ?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_02"); //Nie ca³kiem... Zacz¹³em ciê œledziæ, gdy wyszed³eœ z wie¿y tego Nekromanty.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_03"); //To chyba by³o ju¿ twoje drugie zejœcie do œwi¹tyni. 
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_GHOST_15_04"); //Tak, by³em tu dwa razy. Dziwie siê, ¿e ciê nie zauwa¿y³em.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_GHOST_03_05"); //Jestem myœliwym, umiem byæ dyskretny. 
};

FUNC VOID DIA_MagnusOT_HELLO1_WILL()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_WILL_15_01"); //Co z kopalni¹ z³ota Willa?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_02"); //Wszystko jest w porz¹dku. Ch³opaki nieŸle siê ob³owili. Maj¹ ju¿ kilkanaœcie skrzyñ z³ota.
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_03"); //Jako, ¿e z³o¿e siê powoli koñczy³o, Will pozwoli³ mi odejœæ.  
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_WILL_15_04"); //Reszta zosta³a?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_05"); //Tak, planuj¹ przeczekaæ w jaskini do czasu, a¿ nic siê nie zmieni. Potem mówili, ¿e dogadaj¹ siê z jakimœ farmerem z Khorinis, który bêdzie ich kry³.
	AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_06"); //Gdy to us³ysza³em, myœla³em sobie: 'Oni naprawdê wierz¹, ¿e Bariera upadnie? G³upcy!'. Teraz, gdy widzê, co siê tu dzieje przesta³em w to w¹tpiæ.
	AI_Output (self, other ,"DIA_MagnusOT_HELLO1_WILL_03_07"); //Nadchodz¹ zmiany. I to TY jesteœ ich czêœci¹!
};

FUNC VOID DIA_MagnusOT_HELLO1_KICKASS()
{
    AI_Output (other, self ,"DIA_MagnusOT_HELLO1_KICKASS_15_01"); //ChodŸmy skopaæ jakieœ opêtane zadki! 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO1_KICKASS_03_02"); //Na to czeka³em! Dziêkujê ci. 
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
    AI_Output (other, self ,"DIA_MagnusOT_HELLO2_15_01"); //Co z tob¹?
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_02"); //To ju¿ koniec... (z rany obficie s¹czy siê krew)
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_03"); //Dz..dziêkujê ci, wojowniku...
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_04"); //Nie by³o nawet okazji... ¿ebym móg³ poznaæ twoje imiê... 
    AI_Output (self, other ,"DIA_MagnusOT_HELLO2_03_05"); //Obym spotka³ Biorna. 
    Npc_ExchangeRoutine (self, "die");
    AI_StopProcessInfos	(self);
};