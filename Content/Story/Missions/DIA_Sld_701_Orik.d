//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Orik_EXIT(C_INFO)
{
	npc             = Sld_701_Orik;
	nr              = 999;
	condition		= DIA_Orik_EXIT_Condition;
	information		= DIA_Orik_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Orik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Orik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Orik_HELLO1 (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 1;
   condition    = DIA_Orik_HELLO1_Condition;
   information  = DIA_Orik_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Orik_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Orik_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_02"); //Nazywam siê Orik. Jestem Najemnikiem, ale to ju¿ pewnie wiesz.
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_03"); //Czym siê na ogó³ zajmujesz?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_04"); //Wykonujê specjalne zlecenia na ¿yczenie samego Lee.
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Orik_QUEST1 (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 2;
   condition    = DIA_Orik_QUEST1_Condition;
   information  = DIA_Orik_QUEST1_Info;
   permanent	= TRUE;
   description	= "Jak siê maj¹ sprawy Obozu?";
};

FUNC INT DIA_Orik_QUEST1_Condition()
{
	if (QuestFromOrik == FALSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Orik_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_01"); //Jak siê maj¹ sprawy Obozu?
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_02"); //Szkodniki coraz bardziej mnie irytuj¹. Ostatnio w Obozie mia³a miejsce kradzie¿.
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_03"); //Jaka kradzie¿?
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_04"); //Ukradziono jakieœ magiczne duperele Cronosowi. Z³odzieje to banda Szkodników.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_05"); //Ostatnio jeden z nich zwróci³ moj¹ uwagê. Zachowuje siê dziwnie. Nie znam tego goœcia. Zawsze wtapia siê w t³um.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_06"); //Ale wygl¹da, jakby mia³ coœ do ukrycia. 
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_07"); //Coœ sugerujesz? Bo niezbyt rozumiem.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_08"); //Myœlê, ¿e jeden ze Szkodników oderwa³ siê od bandy i potajemnie wróci³ do Obozu. 
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_09"); //Musimy go z³apaæ. Jakiœ czas temu widzia³em go po drugiej stronie jeziora. Pewnie coœ kombinuje.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_10"); //ChodŸ za mn¹. Pomo¿esz mi w razie potrzeby.
	AI_Output (other, self ,"DIA_Orik_QUEST1_15_11"); //Dlaczego nie zajmie siê tym Lares? To jego ludzie.
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_12"); //Ten dureñ da³ im za du¿o swobody. Teraz wszystko wymknê³o siê spod kontroli.
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_13"); //Sami musimy zaj¹æ siê t¹ spraw¹. No chodŸ!
	
    Npc_ExchangeRoutine (self, "wodospad");
	Sld_701_Orik.aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetPermAttitude	(Sld_701_Orik,	ATT_FRIENDLY);
	Sld_701_Orik.flags = 2;
	
    MIS_StupidMagican = LOG_RUNNING;
    Log_CreateTopic            	(CH2_StupidMagican, LOG_MISSION);
    Log_SetTopicStatus       	(CH2_StupidMagican, LOG_RUNNING);
    B_LogEntry                  (CH2_StupidMagican,"Orik podejrzewa, ¿e jeden ze Szkodników w Obozie nale¿y do bandy z³odziei artefaktów. Widzia³ go po drugiej stronie jeziora. Musimy tam iœæ i dowiedzieæ siê co knuje bandzior.");
    
	Wld_InsertNpc				(ORG_953_OrganisatorMage,"WODOSPAD");
	
	QuestFromOrik = TRUE;
	}
	else
	{
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_14"); //Rozmawiam o sprawach obozu WY£¥CZNIE z Najemnikami. Lepiej zajmij siê swoimi sprawami. 
	};
	AI_StopProcessInfos	(Sld_701_Orik);
};

//========================================
//-----------------> QUEST1_PLACE
//========================================

INSTANCE DIA_Orik_QUEST1_PLACE (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 3;
   condition    = DIA_Orik_QUEST1_PLACE_Condition;
   information  = DIA_Orik_QUEST1_PLACE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Orik_QUEST1_PLACE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Orik_QUEST1))
    && (Npc_GetDistToWP (self, "WODOSPAD") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orik_QUEST1_PLACE_Info()
{
    AI_Output (self, other ,"DIA_Orik_QUEST1_PLACE_03_01"); //Spójrz! Ten sukinsyn próbuje zaczarowaæ wodê z gór. 
    AI_Output (other, self ,"DIA_Orik_QUEST1_PLACE_15_02"); //Ciekawe w jakim celu. Poobserwujmy go chwilê. Zobaczymy co siê stanie.
    AI_TurnToNpc(Sld_701_Orik,ORG_953_OrganisatorMage);
    AI_Output (self, other ,"DIA_Orik_QUEST1_PLACE_03_03"); //Co on robi?!
	AI_TurnToNpc(Sld_701_Orik,hero);
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Orik_QUEST1_PLACE_15_04"); //Chyba chce przywo³aæ jak¹œ istotê.
    Wld_InsertItem				(Pfx_ResurectionItem,"GOLEM_WODNY"); 
	Wld_InsertNpc				(WaterGolem,"GOLEM_WODNY");
    AI_Output (self, other ,"DIA_Orik_QUEST1_PLACE_03_05"); //Cholera! Co to jest!
	B_killnpc    			(ORG_953_OrganisatorMage);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUEST1_SUCCESS
//========================================

INSTANCE DIA_Orik_QUEST1_SUCCESS (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 1;
   condition    = DIA_Orik_QUEST1_SUCCESS_Condition;
   information  = DIA_Orik_QUEST1_SUCCESS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Orik_QUEST1_SUCCESS_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ORG_953_OrganisatorMage);
    if (Npc_KnowsInfo (hero, DIA_Orik_QUEST1_PLACE))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orik_QUEST1_SUCCESS_Info()
{
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_01"); //Co za kretyn! Daæ idiocie magiê, to pó³ Obozu rozwali!
    AI_Output (other, self ,"DIA_Orik_QUEST1_SUCCESS_15_02"); //Na szczêœcie tym razem do tego nie dosz³o. Wiesz co siê tu tak w ogóle sta³o? Bi³em w coœ... w sumie nie wiem w co.
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_03"); //Ten g³upi magik próbowa³ przywo³aæ jakiegoœ potwora. Kr¹¿y³y niegdyœ legendy o duchu z jeziora, ale to co przywo³a³ ducha mi nie przypomina³o.
    AI_Output (other, self ,"DIA_Orik_QUEST1_SUCCESS_15_04"); //Najwa¿niejsze, ¿e pozbyliœmy siê tego potwora.
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_05"); //IdŸ teraz do Cronosa i wypytaj go o kradzie¿. Musisz pozbyæ siê reszty tych œwirów, bo to siê zaczyna robiæ niebezpieczne.
    B_LogEntry                     (CH2_StupidMagican,"Nieudolny magik przywo³a³ wodnego potwora, którego nie móg³ opanowaæ. Podczas przywo³ania Szkodnik zgin¹³, a my rozprawiliœmy siê z przyzwanym przez niego magicznym tworem.");
    Log_SetTopicStatus       (CH2_StupidMagican, LOG_SUCCESS);
    MIS_StupidMagican = LOG_SUCCESS;

    B_GiveXP (100);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PORACHUNKI
//========================================

INSTANCE DIA_Orik_PORACHUNKI (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 1;
   condition    = DIA_Orik_PORACHUNKI_Condition;
   information  = DIA_Orik_PORACHUNKI_Info;
   permanent	= FALSE;
   description	= "Blizna nie ¿yje.";
};

FUNC INT DIA_Orik_PORACHUNKI_Condition()
{
    if (MIS_ZabojstwBlizny == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orik_PORACHUNKI_Info()
{
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_01"); //Blizna nie ¿yje. 
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_02"); //A ty sk¹d o tym wiesz?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_03"); //Bo pomaga³em wysy³aæ go na tamten œwiat.
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_04"); //Ale czemu przychodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_05"); //Kosa mnie przys³a³. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_06"); //To znaczy?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_07"); //To ty zleci³eœ zabójstwo Blizny. Chce wiedzieæ dlaczego.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_08"); //Trochê by o tym opowiada³...
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_09"); //Nigdzie mi siê nie œpieszy. Przynajmniej do czasu kiedy Bariera jest na swoim miejscu.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_10"); //Gdy czêœæ osób opuœci³a Stary Obóz i utworzy³a now¹ frakcje wœród ludzi, którzy pozostali na swoim miejscu powsta³ niema³y chaos. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_11"); //Wiele wa¿nych stanowisk  w Obozie zosta³o opuszczonych i ktoœ musia³ je zast¹piæ. 
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_12"); //Któr¹ ze stron wtedy wybra³eœ?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_13"); //Zdecydowa³em siê pozostaæ w Obozie. Po prostu wydawa³ mi siê silniejszy i sprawniej zarz¹dzany. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_14"); //W dodatku by³em jednym z najlepszych Stra¿ników Gomeza. A¿ do momentu, gdy z³o¿y³ mi pewn¹ propozycjê….
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_15"); //Jak¹?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_16"); //W tamtym czasie z naprawdê zaufanych ludzi przy boku Gomezowi zostali tylko Kruk i Bartholo. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_17"); //Gomez postanowi³ lekko poszerzyæ tê grupê, aby lepiej zarz¹dzaæ Koloni¹. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_18"); //Wiadomo, handel ze Œwiatem Zewnêtrznym i Bractwem, obrona konwojów przed Szkodnikami i Bandytami z gór no i zagro¿enie ze strony Orków wymaga³y sta³ej kontroli.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_19"); //W tamtym czasie najlepszymi Stra¿nikami byli Thorus, Arto, ja no i Blizna. To z nich Gomez wybiera³ dwóch, którzy mieli zostaæ Magnatami, choæ wtedy nie stosowano jeszcze takiego okreœlenia.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_20"); //Gomez zdecydowa³ siê na mnie i Thorusa. Rozwœcieczy³o to Bliznê, bo liczy³, ¿e to on zostanie awansowany, a na dodatek nie znosi³ mnie.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_21"); //Thorusa?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_22"); //On wola³ jednak zostaæ formalnym przywódc¹ Stra¿ników. Ba³ siê przesadnej w³adzy i jadu jakim zatruwa cz³owieka. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_23"); //Zamiast niego wybrano wiêc Arto. Blizna znowu zosta³ pominiêty. Tyle, ¿e Arto by³ jego kumplem, wiêc pominiêty Blizna skupi³ siê na mnie. Postanowi³ mi zaszkodziæ w oczach Gomeza.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_24"); //Cokolwiek zrobi³ patrz¹c na to, gdzie dzisiaj znajdujesz siê w Kolonii chyba mu siê uda³o...
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_25"); //Daj mi dokoñczyæ. Gdy ja i Arto zostaliœmy awansowani, wydano na nasz¹ czêœæ przyjêcie. By³em bardzo uradowany i wypi³em parê butelek dobrego wina. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_26"); //Potem poszed³em do swojego pokoju. Wtedy pojawi³ siê Blizna z butelk¹ jakiegoœ alkoholu i udawa³, ¿e gratuluje mi sukcesu. By³em pijany i da³em siê oszukaæ.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_27"); //Wypi³em z nim flaszkê, a potem zasn¹³em. Rano obudzili mnie Stra¿nicy z wyci¹gniêtymi mieczami.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_28"); //Co takiego niby siê sta³o?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_29"); //ZnaleŸli przy mnie flakonik z trucizn¹, razem z moim rzekomym pamiêtnikiem, gdzie na jednej ze stron by³o napisane, ¿e zamierzam otruæ Gomeza i spróbowaæ przej¹æ w³adzê. Nie muszê mówiæ, kto mi to podrzuci³ i kiedy.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_30"); //Gomez wpad³ w sza³. Od zawsze ma obsesjê podpowiadaj¹c mu, ¿e ktoœ chce go zabiæ. Tylko interwencja Kruka ocali³a mnie przed natychmiastowym posiekaniem przez Stra¿ników. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_31"); //On przeczuwa³, ¿e jestem niewinny. W ka¿dym razie trafi³em do lochów. Jednak pewnej nocy ktoœ podrzuci³ mi klucz do celi. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_32"); //Uciek³em z Zamku i jakoœ wymkn¹³em siê przez bramê Obozu. Potem ruszy³em przed siebie i b³¹ka³em siê przez wiele dni po Kolonii. Kiedy nie mia³em ju¿ nic do stracenia poszed³em do Nowego Obozu. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_33"); //Wszyscy byli pocz¹tkowo nieufni wobec mnie i mieli prawo, bo dopiero co by³em jednym z najwa¿niejszych ludzi Gomeza. Jednak z czasem moje czyny zapewni³y mi szacunek.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_34"); //Sta³em siê jednym z najwa¿niejszych Najemników, a Lee uczyni³ mnie swoim osobistym doradc¹.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_35"); //A co z Blizn¹?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_36"); //Osi¹gn¹³ swój cel. Zaj¹³ moje miejsce.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_37"); //Nie rozumiem, dlaczego ja mia³em siê mœciæ za ciebie?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_38"); //Koloniê doœæ szybko obieg³y wieœci o twoich czynach. To nie byle jakie zas³ugi. Sam nie mog³em siê pokazaæ w Obozie. Nadawa³eœ siê do tego zadania. 	
	B_GiveXP (200);	
};


