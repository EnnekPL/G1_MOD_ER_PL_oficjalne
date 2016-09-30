//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Uturiel_EXIT(C_INFO)
{
	npc             = NON_3933_Uturiel;
	nr              = 999;
	condition		= DIA_Uturiel_EXIT_Condition;
	information		= DIA_Uturiel_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Uturiel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Uturiel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Uturiel_HELLO1 (C_INFO)
{
   npc         	= NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_HELLO1_Condition;
   information  = DIA_Uturiel_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Uturiel_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Uturiel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Uturiel_HELLO1_03_02"); //Nazywam siê Uturiel. Jestem Magiem Krêgu Ognia i skromnym s³ug¹ naszego pana, Innosa.
	AI_Output (other, self ,"DIA_Uturiel_HELLO2_15_01"); //MAGIEM OGNIA? Co tu robisz?
	AI_Output (self, other ,"DIA_Uturiel_HELLO2_03_03"); //Chcia³bym zapytaæ ciê o to samo, jednak zaspokojê twoj¹ ciekawoœæ. Mieszkam tutaj.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Uturiel_HELLO3 (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 3;
   condition    = DIA_Uturiel_HELLO3_Condition;
   information  = DIA_Uturiel_HELLO3_Info;
   permanent	= FALSE;
   description	= "Dlaczego nie przebywasz z pozosta³ymi magami?";
};

FUNC INT DIA_Uturiel_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HELLO3_15_01"); //Dlaczego nie przebywasz z pozosta³ymi magami?
    AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_02"); //Po odejœciu Xardasa najwy¿sze miejsce w hierarchii zaj¹³ Corristo. Nigdy za nim nie przepada³em, by³ zbyt arogancki. Jednak to nie wszystko.
    AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_03"); //Z czasem ten siwy mag coraz bardziej siê zmienia³. Wygl¹da³o to tak jakby czegoœ oczekiwaæ. Przesta³em mu wtedy ca³kowicie ufaæ.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_04"); //Tutaj mogê swobodnie prowadziæ moje badania. W Starym Obozie nikt nie chcia³ mnie s³uchaæ.
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_15_05"); //O jakich badaniach mówisz?
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_06"); //Czy¿byœ by³ zainteresowany? Otó¿ wpad³em na pomys³, ¿e Magicznej Bariery mo¿e wcale nie trzeba niszczyæ, aby siê st¹d wydostaæ.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_07"); //Pewnie siê zastanawiasz jak to osi¹gn¹æ. Myœlê, ¿e odpowiedzi¹ mog¹ byæ kryszta³y ogniskuj¹ce moc. 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_08"); //Mówiê o tych du¿ych b³yszcz¹cych kamieniach, które mo¿na spotkaæ w jaskiniach. Widzia³eœ kiedyœ takie? 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
    Info_AddChoice		(DIA_Uturiel_HELLO3, "Tak.", DIA_Uturiel_HELLO3_Yes);
    Info_AddChoice		(DIA_Uturiel_HELLO3, "Nie.", DIA_Uturiel_HELLO3_No);
};

FUNC VOID DIA_UTURIEL_HELLO3_NEXT ()
{
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_01"); //Wracaj¹c do tematu, te kamienie potrafi¹ zbieraæ magiczn¹ moc z najbli¿szego otoczenia. To w³aœnie dlatego noc¹ œwiec¹. Promieniuj¹ bardzo s³ab¹ magi¹.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_02"); //Skoro Bariera powsta³a przy u¿yciu magii, to mo¿na spróbowaæ wykorzystaæ kryszta³y do œci¹gniêcia czêœci jej mocy.
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_next_15_03"); //Niezbyt rozumiem.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_04"); //Mówi¹c proœciej podchodzisz do Bariery z odpowiednio spreparowanym kryszta³em, który œci¹gaj¹c magiczn¹ moc tworzy wyrwê w Barierze. 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_05"); //Przez tak¹ wyrwê mo¿na by³oby siê przedostaæ na drug¹ stronê. 
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_next_15_06"); //Twój plan wydaje siê szalony. Czy to na pewno bezpieczne?
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_07"); //Pewnie, ¿e to nie jest bezpieczne! Myœlisz, ¿e dlaczego Magowie Ognia uznali mnie za czubka?! 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_08"); //Jednak na ten moment to nasza jedyna szansa. Wed³ug moich wyliczeñ odpowiedni kryszta³ móg³by wytrzymaæ kilka sekund.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_09"); //To wystarczaj¹ce, aby zrobiæ skok na drug¹ stronê. A wiêc jak? Pomo¿esz mi?
};

FUNC VOID DIA_Uturiel_HELLO3_Yes ()
{
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_yes_15_01"); //Tak, choæ w Górniczej Dolinie jest ich ma³o.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_yes_03_02"); //Masz racjê. Wiêcej mo¿na spotkaæ poza Khorinis lub na kontynencie. Co nie zmienia faktu, ¿e i w tym zapomnianym miejscu mo¿na je zobaczyæ. 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
	DIA_UTURIEL_HELLO3_NEXT ();
};

FUNC VOID DIA_Uturiel_HELLO3_No ()
{
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_no_15_01"); //Nie.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_02"); //Widocznie nie penetrowa³eœ jeszcze tutejszych jaskiñ a¿ tak dok³adnie. Hmm... Jakby ci to zobrazowaæ.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_03"); //Ach, ju¿ pamiêtam. Kilka takich kryszta³ów mo¿na zobaczyæ po drugiej stronie jeziorka, które znajduje siê nieopodal.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_04"); //Mo¿esz siê tam wybraæ i poogl¹daæ. Tylko uwa¿aj na potwory. 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
	DIA_UTURIEL_HELLO3_NEXT ();
};

//========================================
//-----------------> HelpMe
//========================================
var int uturiel_dia_help;
INSTANCE DIA_Uturiel_HelpMe (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_HelpMe_Condition;
   information  = DIA_Uturiel_HelpMe_Info;
   permanent	= TRUE;//patch 1.4.5.1
   description	= "Jak mam ci pomóc?";
};

FUNC INT DIA_Uturiel_HelpMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_HELLO3)) && uturiel_dia_help == false
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HelpMe_15_01"); //Jak mam ci pomóc?
	if (kapitel >= 4)
	{
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_02"); //Musisz przeszukaæ pobliskie jaskinie w poszukiwaniu od³amanych fragmentów kryszta³ów. Przynieœ mi przynajmniej trzy kawa³ki.
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_03"); //Wybiorê spoœród nich najlepszy i wtedy spróbujemy przedrzeæ siê przez Barierê.
    AI_Output (other, self ,"DIA_Uturiel_HelpMe_15_04"); //No dobrze, poszukam ich.
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_05"); //Powodzenia. I uwa¿aj na siebie. W tej okolicy czai siê pe³no niebezpiecznych potworów. 
    MIS_MagicalCrystals = LOG_RUNNING;

    Log_CreateTopic          	 (CH1_MagicalCrystals, LOG_MISSION);
    Log_SetTopicStatus      	 (CH1_MagicalCrystals, LOG_RUNNING);
    B_LogEntry              		 (CH1_MagicalCrystals,"Trzynasty Mag Ognia Uturiel ma pomys³ jak sforsowaæ Barierê przy u¿yciu kryszta³ów kumuluj¹cych magiczn¹ moc. Takie kryszta³y czêsto spotyka siê w jaskiniach. Muszê przynieœæ mu przynajmniej trzy fragmenty, aby wybra³ najlepszy spoœród nich. Nie wiem czy ten plan ma jakiekolwiek szanse powodzenia, ale warto spróbowaæ.");
	
	uturiel_dia_help = true;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_NOPE"); //Jeszcze nie nadszed³ na to czas. Przypomnia³em sobie, ¿e muszê dopracowaæ jedn¹ rzecz. Zg³oœ siê póŸniej.
	PrintS_Ext ("Warunek: rozdzia³ 4",COL_WHITE) ;
	};
};

/*------------------------------------------------------------------------
							CRYSTAL							
------------------------------------------------------------------------*/

instance  NON_3933_Uturiel_CRYSTAL (C_INFO)
{
	npc				= NON_3933_Uturiel;
	condition		= NON_3933_Uturiel_CRYSTAL_Condition;
	information		= NON_3933_Uturiel_CRYSTAL_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam kryszta³y.";

};

FUNC int  NON_3933_Uturiel_CRYSTAL_Condition()
{	
	if (MIS_MagicalCrystals == LOG_RUNNING) &&  (Npc_HasItems(other,BlueCrystal)>=3)
	{
		return TRUE;
	};

};
FUNC void  NON_3933_Uturiel_CRYSTAL_Info()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_01"); //Mam trzy kryszta³y.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_02"); //Doskonale. Mo¿emy przejœæ do nastêpnego etapu.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_03"); //Na czym on mia³by polegaæ?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_04"); //Potrzebujê kostura w którym móg³bym osadziæ kamieñ. Nie zbli¿ê siê do Bariery trzymaj¹c kryszta³u w rêkach. To mog³oby siê Ÿle skoñczyæ.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_05"); //W porz¹dku. Zapytam magów czy mog¹ mi jakiœ sprzedaæ.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_06"); //To nie takie proste. Potrzebujemy kostura bez osadzonego wewn¹trz kamienia lub runy. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_07"); //Zarówno Magowie w Starym, jak i Nowym Obozie posiadaj¹ kostury z ju¿ osadzonymi artefaktami. 
	Info_ClearChoices 	(NON_3933_Uturiel_CRYSTAL);
	Info_Addchoice 		(NON_3933_Uturiel_CRYSTAL,"Artefaktu nie da siê usun¹æ?",NON_3933_Uturiel_CRYSTAL_Wyjac);
	Info_Addchoice 		(NON_3933_Uturiel_CRYSTAL,"Trzeba przygotowaæ nowy kostur?",NON_3933_Uturiel_CRYSTAL_New);
	
	B_GiveInvItems (hero,self,BlueCrystal,3);
	B_GiveXP (200);
	B_LogEntry               (CH1_MagicalCrystals,"Odnalaz³em trzy magiczne kryszta³y i odda³em je Uturielowi. Mag potrzebuje teraz kostura, w którym osadzi najlepszy spoœród nich.");
};

FUNC VOID NON_3933_Uturiel_CRYSTAL_Wyjac ()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Wyjac_15_01"); //A nie mo¿emy po prostu usun¹æ artefakt z pierwszego lepszego kostura?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Wyjac_02_02"); //Jest mo¿liwe, jednak zajmie to trochê czasu i mo¿e doprowadziæ do uszkodzenia broni. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Wyjac_02_04"); //Poza tym w moim mieszkaniu nie mam odpowiednich narzêdzi...	
};

FUNC VOID NON_3933_Uturiel_CRYSTAL_New ()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_New_15_01"); //Trzeba przygotowaæ nowy kostur?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_02"); //Niekoniecznie. Mam pewnego znajomego w Bractwie Œni¹cego. Nazywa siê Tondral. Utrzymywa³em z nim znajomoœæ zanim powsta³ obóz na bagnie.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_03"); //Owego czasu nosi³ przy sobie pusty kostur. Opowiada³ mi jego historiê. Nie bêdê ciê ni¹ teraz zanudza³.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_New_15_04"); //Myœlisz, ¿e móg³by oddaæ nam ten kostur?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Newc_02_05"); //Sêk w tym, ¿e tego w³aœnie nie jestem pewien. To dla niego bardzo wa¿na pami¹tka. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_06"); //Mimo to myœlê, ¿e warto spróbowaæ. Udaj siê na bagno, odszukaj tego cz³owieka i przekonaj go, aby odda³ ci kostur. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_07"); //Powo³aj siê na znajomoœæ ze mn¹. Ja w tym czasie zajmê siê naszymi b³yskotkami. Powodzenia.
	
	B_LogEntry               (CH1_MagicalCrystals,"Uturiel opowiedzia³ mi o swojej dawnej znajomoœci z niejakim Tondralem z Bractwa. Ostatnio, gdy siê widzieli, ten cz³owiek by³ w posiadaniu pustego kostura. Akurat taki jest nam teraz potrzebny, wiêc muszê udaæ siê do Bractwa i go zdobyæ.");
	
	Info_ClearChoices 	(NON_3933_Uturiel_CRYSTAL);
	AI_StopProcessInfos (self);
};
	
//========================================
//-----------------> TondralStaff
//========================================

INSTANCE DIA_Uturiel_TondralStaff (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_TondralStaff_Condition;
   information  = DIA_Uturiel_TondralStaff_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kostur Baal Tondrala.";
};

FUNC INT DIA_Uturiel_TondralStaff_Condition()
{
    if (Npc_KnowsInfo (hero, NON_3933_Uturiel_CRYSTAL))
    && (Npc_HasItems (other, ItMi_Mod_TondralStaff) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_TondralStaff_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_01"); //Mam dla ciebie kostur Baal Tondrala.
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_02"); //Doskonale. Sprawia³ jakieœ problemy?
    AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_03"); //Nic o czym warto by mówiæ...
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_04"); //Podczas twojej nieobecnoœci wybra³em najlepszy spoœród kryszta³ów, które mi przynios³eœ.
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_05"); //Osadzê go w broni i bêdê gotowy. Spotkamy siê za t¹ wielk¹ wie¿¹. 
	AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_06"); //Czemu akurat tam? 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_07"); //A masz lepsze miejsce? Za wie¿¹ jest jeziorko w pobli¿u którego silnie oddzia³uje Bariera. 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_08"); //Sprawdzimy czy mój plan ma szansê siê powieœæ. Jeœli siê uda znajdziemy lepsze miejsce i przedostaniemy siê do Khorinis. 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_09"); //Z oczywistych przyczyn prze³êcz bêdziemy musieli omin¹æ. Na pewno roi siê tam od ludzi króla.
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_10"); //Ale o tym póŸniej. Teraz mamy inne sprawy na g³owie. Do zobaczenia za wie¿¹. 
	
	B_LogEntry               (CH1_MagicalCrystals,"Przynios³em Uturielowi kostur nale¿¹cy do Baal Tondrala. Podczas mojej nieobecnoœci mag wybra³ najlepszy kryszta³ i kaza³ mi siê z nim spotkaæ przy jeziorku za wie¿¹ Xardasa. Ciekawe co z tego wyjdzie.");
	
	Npc_ExchangeRoutine			(self,"experiment"); 
	B_GiveInvItems (other, self, ItMi_Mod_TondralStaff,1);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EXPERIMENT
//========================================

INSTANCE DIA_Uturiel_EXPERIMENT (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_EXPERIMENT_Condition;
   information  = DIA_Uturiel_EXPERIMENT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_EXPERIMENT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_TondralStaff))
    && (Npc_GetDistToWP (self, "OW_MIS_UTURIELEXPERIMENT") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_EXPERIMENT_Info()
{
    AI_Output (self, other ,"DIA_Uturiel_EXPERIMENT_03_01"); //Jesteœ. A wiêc pora zaczynaæ. 
    AI_Output (other, self ,"DIA_Uturiel_EXPERIMENT_15_02"); //Czyñ honory. Bêdê obserwowa³ z daleka.
	
	
    B_LogEntry              		 (CH1_MagicalCrystals,"Moje obawy by³y s³uszne. Podczas próby przedarcia siê przez Magiczn¹ Barierê Uturiel zosta³ pora¿ony, a kryszta³ rozpad³ siê w drzazgi. ");
    Log_SetTopicStatus     	 (CH1_MagicalCrystals, LOG_SUCCESS);
    MIS_MagicalCrystals = LOG_SUCCESS;

    B_GiveXP (350);	
};

//========================================
//-----------------> EXPERIMENT_CUTSCENE
//========================================

INSTANCE DIA_Uturiel_EXPERIMENT_CUTSCENE (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_EXPERIMENT_CUTSCENE_Condition;
   information  = DIA_Uturiel_EXPERIMENT_CUTSCENE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_EXPERIMENT_CUTSCENE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_EXPERIMENT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_EXPERIMENT_CUTSCENE_Info()
{
	PlayVideo ("er_cutscene_uturiel.bik"); 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine			(self,"die"); 
};

//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_MissionFail (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_MissionFail_Condition;
   information  = DIA_Uturiel_MissionFail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_MissionFail_Condition()
{
    if (MIS_MagicalCrystals == LOG_FAILED)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_MissionFail_Info()
{
    AI_Output (self, other ,"DIA_Uturiel_MissionFail_03_01"); //Widzê, ¿e nie masz ze sob¹ kostura.
    AI_Output (other, self ,"DIA_Uturiel_MissionFail_15_02"); //Nie wszystko posz³o po mojej myœli. 
    AI_Output (self, other ,"DIA_Uturiel_MissionFail_03_03"); //OdejdŸ. Wolê siê sam wszystkim zaj¹æ. Nic mi z twojej pomocy.
    B_LogEntry                     (CH1_MagicalCrystals,"Uturiel bardzo siê zdenerwowa³ tym, ¿e nie uda³o mi siê zdobyæ kostura Baal Tondrala. Powiedzia³, ¿e nie chce mojej pomocy. ");
    Log_SetTopicStatus       (CH1_MagicalCrystals, LOG_FAILED);
    AI_StopProcessInfos	(self);
};