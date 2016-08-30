//***poprawione przez g1210
//rutyna dodana, wp w �wiecie te�

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Karl_EXIT(C_INFO)
{
	npc             = NON_3921_Wiezien;
	nr              = 999;
	condition	= DIA_Karl_EXIT_Condition;
	information	= DIA_Karl_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Karl_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Karl_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> WELCOME
//========================================

INSTANCE DIA_Karl_WELCOME (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 1;
   condition    = DIA_Karl_WELCOME_Condition;
   information  = DIA_Karl_WELCOME_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Karl_WELCOME_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Karl_WELCOME_Info()
{
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_01"); //Czego tu szukasz? My�la�em, �e nikt tu nie schodzi, opr�cz Bullita.
    AI_Output (other, self ,"DIA_Karl_WELCOME_15_02"); //Jestem...
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_03"); //To nieistotne. Powiedz mi lepiej, co ty tu robisz.
    AI_Output (other, self ,"DIA_Karl_WELCOME_15_04"); //Tylko si� rozgl�dam. S�ysza�em, �e pod zamkiem znajduj� si� opuszczone lochy, nieu�ywane od czas�w powstania Bariery.
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_05"); //Te szumowiny m�wi� to ka�demu, bo nie chc�, aby kto� si� tu pa��ta�.
	AI_Output (self, other ,"DIA_Karl_WELCOME_03_06"); //Jestem Karl i jestem w tym przekl�tym miejscu od niedawna. 
	AI_Output (self, other ,"DIA_Karl_WELCOME_03_07"); //Wiesz, zanim si� tu znalaz�em by�em Najemnikiem w Nowym Obozie, a dawniej stra�nikiem kr�lewskim nadzoruj�cym wi�ni�w. C� za ironia, nie?
};
/*
//========================================
//-----------------> STORY
//========================================

INSTANCE DIA_Karl_STORY (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 2;
   condition    = DIA_Karl_STORY_Condition;
   information  = DIA_Karl_STORY_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o tym.";
};

FUNC INT DIA_Karl_STORY_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Karl_WELCOME)) {
    return TRUE; };
};

FUNC VOID DIA_Karl_STORY_Info()
{
    AI_Output (other, self ,"DIA_Karl_STORY_15_01"); //Opowiedz mi o tym.
    AI_Output (self, other ,"DIA_Karl_STORY_03_02"); //No wi�c zanim wybuch� wielki bunt, nadzorowa�em skaza�c�w w kopalni nieopodal placu wymian, nale��cej do miejscowego Lorda Bergmara. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_03"); //Pilnowa�em wszystkich sukinsyn�w, kt�rzy teraz op�ywaj� tu w luksusach, dzi�ki umowie z kr�lem. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_04"); //Pewnego dnia, Kr�l Rhobar wyda� edykt, kt�ry g�osi� �e G�rnicza Dolina zostanie otoczona Magiczn� Barier�.
    AI_Output (self, other ,"DIA_Karl_STORY_03_05"); //Zdaj� si�, �e chodzi�o o to, aby uniemo�liwi� wi�niom ucieczk�. Powo�a� on dwunastu mag�w, pod wodz� Xardasa, aby odprawili rytua�. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_06"); //Magowie byli naszymi go��mi w zamku przez pewien czas i nasz dow�dca nakaza� nam spe�nia� wszelkie ich zachcianki. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_07"); //Po d�ugich przygotowaniach do rytua�u Magowie byli gotowi utworzy� Barier�. Udali si� wi�c w kluczowe miejsca.
    AI_Output (self, other ,"DIA_Karl_STORY_03_08"); //Mia�em z�e przeczucia co do tego wszystkiego. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_09"); //By�em wtedy na patrolu w Zewn�trznym Pier�cieniu, gdzie swoje chaty mieli nasi wi�niowie, gdy dostrzeg�em pot�ne b�yski �wiat�a z sze�ciu r�nych miejsc Doliny. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_10"); //�wiat�o uformowa�o si� w ogromn� Magiczn� Barier�, kt�ra okaza�a si� o wiele wi�ksza ni� zapewnia� nas Xardas.
    AI_Output (self, other ,"DIA_Karl_STORY_03_11"); //Gdy tylko Bariera powsta�a, w ca�ym Obozie powsta� ogromny chaos. Okaza�o si�, �e wi�niowie od jakiego� czasu planowali bunt.
	AI_Output (self, other ,"DIA_Karl_STORY_03_12"); //Ich dow�dc� by� Gomez, najbardziej wp�ywowy Kopacz w Obozie. Skaza�cy mieli przewag� liczebn� i zdobyli bro� po naszych �o�nierzach.
	AI_Output (self, other ,"DIA_Karl_STORY_03_13"); //Wiedzia�em, �e to nie sko�czy si� dla nas dobrze, wi�c da�em nog� z Obozu.
    AI_Output (self, other ,"DIA_Karl_STORY_03_14"); //Przez do�� d�ugi czas ukrywa�em si� w jaskini, w lesie przy drodze z zamku na plac wymian. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_15"); //Pewnego dnia zosta�em jednak zauwa�ony przez ludzi w niebieskich zbrojach. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_16"); //Jeden z nich, go�� o imieniu Cord zapyta� mnie kim jestem i co tu robi�. Wyja�ni�em mu wi�c wszystko, bo nie wygl�da� na jednego z ludzi Gomeza.
    AI_Output (self, other ,"DIA_Karl_STORY_03_17"); //Gdy dowiedzia� si�, �e by�em stra�nikiem kr�lewskim opowiedzia� mi o Nowym Obozie, sze�ciu Magach Wody oraz Lee, by�ym generale samego Rhobara II. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_18"); //Postanowi�em opu�ci� kryj�wk� i do��czy� do ludzi Lee. Dow�dca Najemnik�w pozna� mnie od razu. Zanim s�u�y�em jako stra�nik w G�rniczej Dolinie, by�em stra�nikiem w Vengardzie.
    AI_Output (self, other ,"DIA_Karl_STORY_03_19"); //I tak trafi�em do Najemnik�w. Jednak kilka tygodni temu dowiedzieli�my si�, �e kilku Stra�nik�w Gomeza kr�ci�o si� nieopodal rybackich chat w pobli�u Nowego Obozu. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_20"); //Wyszli�my wi�c im na spotkanie razem z dwoma innymi Najemnikami.
    AI_Output (self, other ,"DIA_Karl_STORY_03_21"); //Niestety, przegrali�my t� potyczk�. Moi towarzysze zgin�li, a ja trafi�em do niewoli, gdy� jeden ze Stra�nik�w, Siekacz, rozpozna� mnie. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_22"); //Siekacz by� jednym z naj�arliwszych poplecznik�w Gomeza przed powstaniem Bariery. Zosta�em zawleczony do zamku i wrzucony do lochu, kt�rego sam kiedy� nieraz strzeg�em.
    AI_Output (self, other ,"DIA_Karl_STORY_03_23"); //Od tej pory widzia�em tylko Bullita, jednego ze Stra�nik�w, kt�ry przynosi� mi jedzenie i kopa� za ka�dym razem. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_24"); //Innos �wiadkiem, �e gdy wyjd� st�d �ywy i uda mi si� poinformowa� o wszystkim Lee, te sukinsyny zgin� w straszliwych m�czarniach.
};

//========================================
//-----------------> GOMEZDIE
//========================================

INSTANCE DIA_Karl_GOMEZDIE (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 3;
   condition    = DIA_Karl_GOMEZDIE_Condition;
   information  = DIA_Karl_GOMEZDIE_Info;
   permanent	= FALSE;
   description	= "Jeste� wolny.";
};

FUNC INT DIA_Karl_GOMEZDIE_Info()
{
	var C_NPC Gomez; 	Gomez = Hlp_GetNpc(Ebr_100_Gomez);
    if (Npc_IsDead(Gomez))
	{
    return TRUE;
	};
	};
	
FUNC INT DIA_Karl_GOMEZDIE_Condition()
{
    AI_Output (other, self ,"DIA_Karl_GOMEZDIE_15_01"); //Jeste� wolny. Gomez gryzie ziemi�, tak samo jak reszta jego przyjaci� w zamku.
    AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_02"); //Niewiarygodne. Ten sukinsyn dosta� to, na co zas�uguje, gdybym mia� cokolwiek warto�ciowego, wynagrodzi�bym ci�. 
	AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_03"); //Wracam czym pr�dzej do Nowego Obozu, kto� musi poinformowa� Lee o ca�ej sytuacji.
    AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_04"); //My�l�, �e po zabiciu Magnat�w zaj�cie Starego Obozu to b�dzie bu�ka z mas�em.
	Npc_ExchangeRoutine	(NON_3921_Wiezien, "newcamp");
	NON_3921_Wiezien.flags = 2;
	AI_StopProcessInfos (self);
};
*/
