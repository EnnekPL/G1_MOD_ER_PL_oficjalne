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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Orik_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Orik_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_02"); //Nazywam si� Orik. Jestem Najemnikiem, ale to ju� pewnie wiesz.
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_03"); //Czym si� na og� zajmujesz?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_04"); //Wykonuj� specjalne zlecenia na �yczenie samego Lee.
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
   description	= "Jak si� maj� sprawy Obozu?";
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
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_01"); //Jak si� maj� sprawy Obozu?
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_02"); //Szkodniki coraz bardziej mnie irytuj�. Ostatnio w Obozie mia�a miejsce kradzie�.
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_03"); //Jaka kradzie�?
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_04"); //Ukradziono jakie� magiczne duperele Cronosowi. Z�odzieje to banda Szkodnik�w.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_05"); //Ostatnio jeden z nich zwr�ci� moj� uwag�. Zachowuje si� dziwnie. Nie znam tego go�cia. Zawsze wtapia si� w t�um.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_06"); //Ale wygl�da, jakby mia� co� do ukrycia. 
    AI_Output (other, self ,"DIA_Orik_QUEST1_15_07"); //Co� sugerujesz? Bo niezbyt rozumiem.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_08"); //My�l�, �e jeden ze Szkodnik�w oderwa� si� od bandy i potajemnie wr�ci� do Obozu. 
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_09"); //Musimy go z�apa�. Jaki� czas temu widzia�em go po drugiej stronie jeziora. Pewnie co� kombinuje.
    AI_Output (self, other ,"DIA_Orik_QUEST1_03_10"); //Chod� za mn�. Pomo�esz mi w razie potrzeby.
	AI_Output (other, self ,"DIA_Orik_QUEST1_15_11"); //Dlaczego nie zajmie si� tym Lares? To jego ludzie.
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_12"); //Ten dure� da� im za du�o swobody. Teraz wszystko wymkn�o si� spod kontroli.
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_13"); //Sami musimy zaj�� si� t� spraw�. No chod�!
	
    Npc_ExchangeRoutine (self, "wodospad");
	Sld_701_Orik.aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetPermAttitude	(Sld_701_Orik,	ATT_FRIENDLY);
	Sld_701_Orik.flags = 2;
	
    MIS_StupidMagican = LOG_RUNNING;
    Log_CreateTopic            	(CH2_StupidMagican, LOG_MISSION);
    Log_SetTopicStatus       	(CH2_StupidMagican, LOG_RUNNING);
    B_LogEntry                  (CH2_StupidMagican,"Orik podejrzewa, �e jeden ze Szkodnik�w w Obozie nale�y do bandy z�odziei artefakt�w. Widzia� go po drugiej stronie jeziora. Musimy tam i�� i dowiedzie� si� co knuje bandzior.");
    
	Wld_InsertNpc				(ORG_953_OrganisatorMage,"WODOSPAD");
	
	QuestFromOrik = TRUE;
	}
	else
	{
	AI_Output (self, other ,"DIA_Orik_QUEST1_03_14"); //Rozmawiam o sprawach obozu WY��CZNIE z Najemnikami. Lepiej zajmij si� swoimi sprawami. 
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
    AI_Output (self, other ,"DIA_Orik_QUEST1_PLACE_03_01"); //Sp�jrz! Ten sukinsyn pr�buje zaczarowa� wod� z g�r. 
    AI_Output (other, self ,"DIA_Orik_QUEST1_PLACE_15_02"); //Ciekawe w jakim celu. Poobserwujmy go chwil�. Zobaczymy co si� stanie.
    AI_TurnToNpc(Sld_701_Orik,ORG_953_OrganisatorMage);
    AI_Output (self, other ,"DIA_Orik_QUEST1_PLACE_03_03"); //Co on robi?!
	AI_TurnToNpc(Sld_701_Orik,hero);
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Orik_QUEST1_PLACE_15_04"); //Chyba chce przywo�a� jak�� istot�.
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
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_01"); //Co za kretyn! Da� idiocie magi�, to p� Obozu rozwali!
    AI_Output (other, self ,"DIA_Orik_QUEST1_SUCCESS_15_02"); //Na szcz�cie tym razem do tego nie dosz�o. Wiesz co si� tu tak w og�le sta�o? Bi�em w co�... w sumie nie wiem w co.
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_03"); //Ten g�upi magik pr�bowa� przywo�a� jakiego� potwora. Kr��y�y niegdy� legendy o duchu z jeziora, ale to co przywo�a� ducha mi nie przypomina�o.
    AI_Output (other, self ,"DIA_Orik_QUEST1_SUCCESS_15_04"); //Najwa�niejsze, �e pozbyli�my si� tego potwora.
    AI_Output (self, other ,"DIA_Orik_QUEST1_SUCCESS_03_05"); //Id� teraz do Cronosa i wypytaj go o kradzie�. Musisz pozby� si� reszty tych �wir�w, bo to si� zaczyna robi� niebezpieczne.
    B_LogEntry                     (CH2_StupidMagican,"Nieudolny magik przywo�a� wodnego potwora, kt�rego nie m�g� opanowa�. Podczas przywo�ania Szkodnik zgin��, a my rozprawili�my si� z przyzwanym przez niego magicznym tworem.");
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
   description	= "Blizna nie �yje.";
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
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_01"); //Blizna nie �yje. 
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_02"); //A ty sk�d o tym wiesz?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_03"); //Bo pomaga�em wysy�a� go na tamten �wiat.
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_04"); //Ale czemu przychodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_05"); //Kosa mnie przys�a�. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_06"); //To znaczy?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_07"); //To ty zleci�e� zab�jstwo Blizny. Chce wiedzie� dlaczego.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_08"); //Troch� by o tym opowiada�...
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_09"); //Nigdzie mi si� nie �pieszy. Przynajmniej do czasu kiedy Bariera jest na swoim miejscu.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_10"); //Gdy cz�� os�b opu�ci�a Stary Ob�z i utworzy�a now� frakcje w�r�d ludzi, kt�rzy pozostali na swoim miejscu powsta� niema�y chaos. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_11"); //Wiele wa�nych stanowisk  w Obozie zosta�o opuszczonych i kto� musia� je zast�pi�. 
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_12"); //Kt�r� ze stron wtedy wybra�e�?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_13"); //Zdecydowa�em si� pozosta� w Obozie. Po prostu wydawa� mi si� silniejszy i sprawniej zarz�dzany. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_14"); //W dodatku by�em jednym z najlepszych Stra�nik�w Gomeza. A� do momentu, gdy z�o�y� mi pewn� propozycj�.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_15"); //Jak�?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_16"); //W tamtym czasie z naprawd� zaufanych ludzi przy boku Gomezowi zostali tylko Kruk i Bartholo. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_17"); //Gomez postanowi� lekko poszerzy� t� grup�, aby lepiej zarz�dza� Koloni�. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_18"); //Wiadomo, handel ze �wiatem Zewn�trznym i Bractwem, obrona konwoj�w przed Szkodnikami i Bandytami z g�r no i zagro�enie ze strony Ork�w wymaga�y sta�ej kontroli.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_19"); //W tamtym czasie najlepszymi Stra�nikami byli Thorus, Arto, ja no i Blizna. To z nich Gomez wybiera� dw�ch, kt�rzy mieli zosta� Magnatami, cho� wtedy nie stosowano jeszcze takiego okre�lenia.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_20"); //Gomez zdecydowa� si� na mnie i Thorusa. Rozw�cieczy�o to Blizn�, bo liczy�, �e to on zostanie awansowany, a na dodatek nie znosi� mnie.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_21"); //Thorusa?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_22"); //On wola� jednak zosta� formalnym przyw�dc� Stra�nik�w. Ba� si� przesadnej w�adzy i jadu jakim zatruwa cz�owieka. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_23"); //Zamiast niego wybrano wi�c Arto. Blizna znowu zosta� pomini�ty. Tyle, �e Arto by� jego kumplem, wi�c pomini�ty Blizna skupi� si� na mnie. Postanowi� mi zaszkodzi� w oczach Gomeza.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_24"); //Cokolwiek zrobi� patrz�c na to, gdzie dzisiaj znajdujesz si� w Kolonii chyba mu si� uda�o...
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_25"); //Daj mi doko�czy�. Gdy ja i Arto zostali�my awansowani, wydano na nasz� cz�� przyj�cie. By�em bardzo uradowany i wypi�em par� butelek dobrego wina. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_26"); //Potem poszed�em do swojego pokoju. Wtedy pojawi� si� Blizna z butelk� jakiego� alkoholu i udawa�, �e gratuluje mi sukcesu. By�em pijany i da�em si� oszuka�.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_27"); //Wypi�em z nim flaszk�, a potem zasn��em. Rano obudzili mnie Stra�nicy z wyci�gni�tymi mieczami.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_28"); //Co takiego niby si� sta�o?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_29"); //Znale�li przy mnie flakonik z trucizn�, razem z moim rzekomym pami�tnikiem, gdzie na jednej ze stron by�o napisane, �e zamierzam otru� Gomeza i spr�bowa� przej�� w�adz�. Nie musz� m�wi�, kto mi to podrzuci� i kiedy.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_30"); //Gomez wpad� w sza�. Od zawsze ma obsesj� podpowiadaj�c mu, �e kto� chce go zabi�. Tylko interwencja Kruka ocali�a mnie przed natychmiastowym posiekaniem przez Stra�nik�w. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_31"); //On przeczuwa�, �e jestem niewinny. W ka�dym razie trafi�em do loch�w. Jednak pewnej nocy kto� podrzuci� mi klucz do celi. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_32"); //Uciek�em z Zamku i jako� wymkn��em si� przez bram� Obozu. Potem ruszy�em przed siebie i b��ka�em si� przez wiele dni po Kolonii. Kiedy nie mia�em ju� nic do stracenia poszed�em do Nowego Obozu. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_33"); //Wszyscy byli pocz�tkowo nieufni wobec mnie i mieli prawo, bo dopiero co by�em jednym z najwa�niejszych ludzi Gomeza. Jednak z czasem moje czyny zapewni�y mi szacunek.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_34"); //Sta�em si� jednym z najwa�niejszych Najemnik�w, a Lee uczyni� mnie swoim osobistym doradc�.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_35"); //A co z Blizn�?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_36"); //Osi�gn�� sw�j cel. Zaj�� moje miejsce.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_37"); //Nie rozumiem, dlaczego ja mia�em si� m�ci� za ciebie?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_38"); //Koloni� do�� szybko obieg�y wie�ci o twoich czynach. To nie byle jakie zas�ugi. Sam nie mog�em si� pokaza� w Obozie. Nadawa�e� si� do tego zadania. 	
	B_GiveXP (200);	
};


