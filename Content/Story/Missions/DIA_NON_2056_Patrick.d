//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patrick_EXIT(C_INFO)
{
	npc             = NON_2056_Patrick;
	nr              = 999;
	condition	= DIA_Patrick_EXIT_Condition;
	information	= DIA_Patrick_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patrick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patrick_HELLO1 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_HELLO1_Condition;
   information  = DIA_Patrick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Patrick_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_02"); //Czekam na wej�cie do kopalni. Artegor nie chce nas wpu�ci�.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_03"); //Ja ju� tu kiedy� by�em, ale tych dw�ch jest nowych.
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_04"); //Trudno jest si� dosta� do kopalni?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_05"); //Nie, trzeba pogada� z miejscowymi, �eby ci� poparli.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_06"); //Artegor, mimo swojej powierzchowno�ci, nie jest zbyt wymagaj�cy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patrick_HELLO2 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 2;
   condition    = DIA_Patrick_HELLO2_Condition;
   information  = DIA_Patrick_HELLO2_Info;
   permanent	= FALSE;
   description	= "D�ugo ju� tu czekasz?";
};

FUNC INT DIA_Patrick_HELLO2_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO2_15_01"); //D�ugo ju� tu czekasz?
    AI_Output (self, other ,"DIA_Patrick_HELLO2_03_02"); //Kilka dni. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Patrick_HELLO3 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 3;
   condition    = DIA_Patrick_HELLO3_Condition;
   information  = DIA_Patrick_HELLO3_Info;
   permanent	= TRUE;
   description	= "Opowiedz mi o...";
};

FUNC INT DIA_Patrick_HELLO3_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_15_01"); //Opowiedz mi o...

    Info_ClearChoices		(DIA_Patrick_HELLO3);
	Info_Addchoice 		(DIA_Patrick_HELLO3, DIALOG_BACK, DIA_Patrick_HELLO3_back);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Artegorze", DIA_Patrick_HELLO3_Artegor);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Macie", DIA_Patrick_HELLO3_Matt);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Petro", DIA_Patrick_HELLO3_Gamal);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Spike", DIA_Patrick_HELLO3_Spike);
};

FUNC VOID DIA_Patrick_HELLO3_Artegor()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_01"); //...Artegorze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_02"); //Pilnuje wej�cia do kopalni. To trudny cz�owiek. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_03"); //Nie jednego Kopacza ju� powiesi�.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_04"); //Pewnego dnia dw�ch robotnik�w postanowi�o wle�� na palisad� i szybko pobiec do kopalni.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_05"); //Gdy zeskakiwali, dorwa� ich i zmia�d�y� im czaszki. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_06"); //To by� straszny widok. 
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_07"); //Lepiej z nim nie zadziera�.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_08"); //Dok�adnie. Cho� teraz jest spokojniejszy.
};

FUNC VOID DIA_Patrick_HELLO3_Matt()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Matt_15_01"); //...Macie.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_02"); //Matt to nasz kucharz.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_03"); //Mo�na u niego kupi� co� ciep�ego.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_04"); //Jest mi�y dla nowych.
};

FUNC VOID DIA_Patrick_HELLO3_Gamal()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Gamal_15_01"); //...Petro.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_02"); //Petro? To pupilek Lorenzo. Wykonuje dla niego r�ne �mieciowe zlecenia.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_03"); //Ale jego g��wnym zadaniem jest pilnowanie, aby nowi Kopacze dotarli do Kopalni w jednym kawa�ku. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_04"); //Zarozumia�y typ. Nie przepadam za nim. 
};

FUNC VOID DIA_Patrick_HELLO3_Spike()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Spike_15_01"); //...Spike'u.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_02"); //Nie znam go za dobrze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_03"); //Wiem tylko, �e czego� tam pilnuje.
};
FUNC VOID DIA_Patrick_HELLO3_back()
{
Info_ClearChoices		(DIA_Patrick_HELLO3);
};

//========================================
//-----------------> IanQuest
//========================================

INSTANCE DIA_Patrick_IanQuest (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_IanQuest_Condition;
   information  = DIA_Patrick_IanQuest_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Artchu i Mirzo?";
};

FUNC INT DIA_Patrick_IanQuest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_QuestIan)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_IanQuest_Info()
{
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_01"); //Co mo�esz mi powiedzie� o Artchu i Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_02"); //Co nieco mog� ci o nich powiedzie�.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_03"); //Artch bardzo dok�adnie wykonuje swoj� prac�. My�l�, �e obawia si� Magnat�w.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_04"); //Jego poprzednik nie sko�czy� zbyt dobrze.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_05"); //My�l�, �e jest lojalny wzgl�dem Starego Obozu.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_06"); //A Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_07"); //Hmm... Ten cz�owiek na mil� �mierdzi brudnymi sprawkami.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_08"); //Kilka nocy temu nie mog�em zasn��. Postanowi�em wi�c przej�� si� po obozie.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_09"); //Widzia�em jak Mirzo obudzi� si�, rozejrza� nerwowo i cichaczem opu�ci� ob�z.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_10"); //Wiesz, dok�d m�g� si� uda�?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_11"); //Nie, ale jak chcesz si� tego dowiedzie�, to lepiej poczekaj a� zapadnie zmrok.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_12"); //Zaczaj si� gdzie� i jak zobaczysz, �e Mirzo opuszcza ob�z, id� za nim.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_13"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_14"); //Nie ma sprawy.
    B_LogEntry                     (CH1_FoodForOldMine,"W ko�cu jakie� konkrety. Patrick twierdzi, �e widzia� jak Mirzo opuszcza� ob�z po zmroku. Lepiej poczekam, a� si� �ciemni.");
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek");
};



//========================================
//-----------------> Nieidz
//========================================

INSTANCE DIA_Patrick_Nieidz (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Nieidz_Condition;
   information  = DIA_Patrick_Nieidz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patrick_Nieidz_Condition()
{
    if (kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Nieidz_Info()
{
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_01"); //Nie id� tam.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_02"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_03"); //Stra�nicy atakuj� kogo popadnie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_04"); //Stara Kopalnia zosta�a zalana przez podziemn� rzek�.
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_05"); //Znam ju� t� histori�. Powiedz mi lepiej, co dzieje si� w obozie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_06"); //Tu te� nie jest najlepiej. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_07"); //Wszystko zacz�o si� od tego, �e po zawaleniu si� Starej Kopalni Gomez wys�a� Arto do obozu.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_08"); //Mia� obj�� tam w�adz� i ogarn�� ca�� t� sytuacj�.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_09"); //Wtedy Artegor zebra� grup� lojalnych Stra�nik�w i zabi� Arto.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_10"); //Chcia� stworzy� w�asny, niezale�ny ob�z.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_11"); //Kiedy to si� sta�o?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_12"); //Niedawno. Po tym ca�ym buncie postanowi�em uciec.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_13"); //Zrobi�o si� tam zbyt niebezpiecznie.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_14"); //Gomez ju� wie, �e straci� w�adz� w obozie przy kopalni?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_15"); //Na szcz�cie nie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_16"); //Gdy si� o tym dowie, rozp�ta si� tu piek�o!
    }
    else
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_17"); //Nie s�ysza�em o tym! M�w dalej.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_18"); //Jeden z Kopaczy, kt�remu uda�o si� uratowa�, powiedzia�, �e kopi�c na najni�szym poziomie, trafili na podziemn� rzek�.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_19"); //Kiedy woda wdar�a si� do szyb�w, pop�ka�y podpory i run�a ca�a g�rna cz��.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_20"); //Tylko garstce ludzi uda�o si� wydosta� na powierzchni�.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_21"); //A co dzieje si� w Starym Obozie?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_22"); //Tego nie wiem. Nie by�em tam. Nie mamy �adnych wie�ci.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_23"); //Co z obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_24"); //Wszystko zacz�o si� od tego, �e po zawaleniu si� Starej Kopalni Gomez wys�a� Arto do obozu.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_25"); //Mia� obj�� tam w�adz� i ogarn�� ca�� t� sytuacj�.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_26"); //Wtedy Artegor zebra� grup� lojalnych Stra�nik�w i zabi� Arto.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_27"); //Chcia� stworzy� w�asny, niezale�ny ob�z.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_28"); //Kiedy to si� sta�o?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_29"); //Niedawno. Po tym ca�ym buncie postanowi�em uciec.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_30"); //Gomez ju� wie, �e straci� w�adz� w obozie przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_31"); //Na szcz�cie nie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_32"); //Gdy si� o tym dowie, rozp�ta si� tu piek�o!
    };

    if (MIS_SytucajaWOM == LOG_RUNNING)
    {
        B_LogEntry                     (CH1_SytucajaWOM,"Od Patricka dowiedzia�em si�, �e Gomez wys�a� Arto do obozu przy kopalni. Magnat mia� tam przez jaki� czas sprawowa� w�adz� i uspokoi� ca�� t� sytuacj�, jednak podst�pny szef Stra�nik�w, Artegor, postanowi� go zabi� i sam obj�� w�adz� w obozie. Gdy Gomez dowie si�, �e utraci� wp�ywy tak�e w obozie przed Star� kopalni�, w�cieknie si�.");

        B_GiveXP (150);
    };
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_Patrick_Brothers (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Brothers_Condition;
   information  = DIA_Patrick_Brothers_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o Stra�nikach z Bractwa?";
};

FUNC INT DIA_Patrick_Brothers_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_Questdadasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Brothers_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_01"); //Wiesz co� o Stra�nikach z Bractwa?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_02"); //Chodzi ci o tych podobnych tobie?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_03"); //Zostali uwi�zieni za bram� do kopalni.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_04"); //Widzia�em tylko trzech.   
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_06"); //Masz zamiar ich odbi�?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_07"); //Zapomnij o tym! Stra�nicy od razu ci� poszatkuj�.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_08"); //Co wi�c mam zrobi�?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_09"); //Podobno Bandyci chc� poinformowa� Gomeza o tym, co si� tutaj sta�o.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_10"); //Je�eli Magnat dowie si�, �e do reszty straci� kontrol� nad tym miejscem, zaatakuje buntownik�w.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_11"); //Przy odrobinie szcz�cia powybijaj� si� nawzajem.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_12"); //Gdzie znajd� tych Bandyt�w?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_13"); //Jeden z nich stoi przy jaskini i bada sytuacj�. 
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_14"); //Spr�buj zaoferowa� mu swoj� pomoc.
    B_LogEntry                     (CH1_HelpBrothersBra,"Kopacz Patrick zdradzi� mi, �e moi Bracia z obozu na bagnie �yj�, jednak s� uwi�zieni przez ludzi Artegora. Jedynym sposobem na dostanie si� do Stra�nik�w �wi�tynnych jest pozbycie si� Artegora i ca�ej tej jego bandy. Podobno Bandyci maj� na to jaki� spos�b.");

    B_GiveXP (50);

};