//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Berg_EXIT(C_INFO)
{
	npc             = GRD_3934_Berg;
	nr              = 999;
	condition		= DIA_Berg_EXIT_Condition;
	information		= DIA_Berg_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Berg_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Berg_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Berg_HELLO1 (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_HELLO1_Condition;
   information  = DIA_Berg_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty jeste� Berg, Stra�nik ze Starego Obozu?";
};

FUNC INT DIA_Berg_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_GDZIE_PATROLE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_01"); //Ty jeste� Berg, Stra�nik ze Starego Obozu?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_02"); //Zgadza si�. Zosta�em jednak wys�any w te okolice na zwiady. Czego chcesz?
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_03"); //S�ysza�em, �e masz klucz do piwnic zamkowych. Chcia�em spyta�, czy nie sprzeda�by� mi go?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_04"); //Hmm, s�dz�c po twojej zbroi, nale�ysz do Nowego Obozu. Mam dla ciebie dwie propozycje.
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_05"); //Co to za propozycje?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_06"); //Mo�esz albo odkupi� ode mnie klucz za 200 bry�ek rudy, albo dosta� go ode mnie w prezencie. Jednak w drugim przypadku musia�by� mi przynie�� w ci�gu jednego dnia pewien pier�cie�, kt�ry Gomez trzyma w piwnicy. Kt�r� opcj� wybierasz?

    Info_ClearChoices		(DIA_Berg_HELLO1);
	if (Npc_HasItems (hero, ItMiNugget)>=200) {
    Info_AddChoice		(DIA_Berg_HELLO1, "Zap�ac� ci 200 bry�ek rudy. Oto one.", DIA_Berg_HELLO1_200_ORE); };
    Info_AddChoice		(DIA_Berg_HELLO1, "Pomog� ci odzyska� pier�cie�. O jaki konkretnie ci chodzi?", DIA_Berg_HELLO1_INNE_ROZW);
};

FUNC VOID DIA_Berg_HELLO1_200_ORE()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_200_ORE_15_01"); //Zap�ac� ci 200 bry�ek rudy. Oto one.
    AI_Output (self, other ,"DIA_Berg_HELLO1_200_ORE_03_02"); //No c�, szkoda, �e nie przyniesiesz mi pier�cienia, ale niech ci b�dzie. Przynajmniej si� troch� wzbogaci�em. Oto klucz.
    B_GiveInvItems (other, self, ItMiNugget, 200);
    CreateInvItems (self, ItKe_DunegonKeyOC, 1);
    B_GiveInvItems (self, other, ItKe_DunegonKeyOC, 1);
    B_LogEntry                     (CH1_Magazyny_OC,"Odkupi�em od Berga klucz za 200 bry�ek rudy.");

    B_GiveXP (120);
    Info_ClearChoices		(DIA_Berg_HELLO1);
    AI_StopProcessInfos	(self);
	Choice_BergsRing = FALSE;
};

FUNC VOID DIA_Berg_HELLO1_INNE_ROZW()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_INNE_ROZW_15_01"); //Pomog� ci odzyska� pier�cie�. O jaki konkretnie ci chodzi?
    AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_02"); //Jest to du�y srebrny pier�cie�. Poznasz go, bo jest na nim moje imi�. Dosta�em go za zas�ugi w obozie my�liwych w Khorinis.
    AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_03"); //Jednak pewnego wieczoru, gdy by�em w siedzibie Magnat�w, zgubi�em go. Zorientowa�em si� dopiero rano. Zapyta�em Kruka, czy nie widzia� mojego pier�cienia, a on powiedzia�, �e "znalezione, nie kradzione" i �ebym lepiej spada�.
	AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_04"); //Potem widzia�em, jak wys�a� Bartholo do piwnic z moim pier�cieniem. Pami�taj jednak, �e masz tylko jeden dzie� na przyniesienie mi go, inaczej powiem Thorusowi, �e chcia�e� okra�� Magnat�w, jasne?
    AI_Output (other, self ,"DIA_Berg_HELLO1_INNE_ROZW_15_05"); //Nie ma sprawy.
    B_LogEntry                     (CH1_Magazyny_OC,"Berg da� mi klucz do skrzyni za darmo, ale mam jeden dzie�, aby znale�� w�r�d �up�w jego pier�cie� i przynie�� mu go jako wynagrodzenie.");
    Info_ClearChoices		(DIA_Berg_HELLO1);
	Berg_ring_giveday = wld_getday ();
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItKe_DunegonKeyOC, 1);
    B_GiveInvItems (self, other, ItKe_DunegonKeyOC, 1);
	Choice_BergsRing = TRUE;
};

//========================================
//-----------------> GIVE_RING
//========================================

INSTANCE DIA_Berg_GIVE_RING (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_GIVE_RING_Condition;
   information  = DIA_Berg_GIVE_RING_Info;
   permanent	= FALSE;
   description	= "Przynios�em tw�j pier�cie�.";
};

FUNC INT DIA_Berg_GIVE_RING_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Berg_HELLO1))
    && (Berg_ring_giveday == wld_getday ())
	&& (Npc_HasItems (other, Bergs_Ring) >=1)
	&& (Choice_BergsRing == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_GIVE_RING_Info()
{
    AI_Output (other, self ,"DIA_Berg_GIVE_RING_15_01"); //Przynios�em tw�j pier�cie�.
    AI_Output (self, other ,"DIA_Berg_GIVE_RING_03_02"); //�wietnie si� spisa�e�. Gdy sko�cz� wykonywa� misj� od Thorusa i spotkamy si� w Starym Obozie, zapraszam na piwo do karczmy w zawalonej wie�y.
    AI_Output (other, self ,"DIA_Berg_GIVE_RING_15_03"); //Ch�tnie skorzystam.
    B_LogEntry       (CH1_Magazyny_OC,"Zd��y�em tego samego dnia odnie�� Bergowi pier�cie�. Nie b�d� mia� k�opot�w.");
	Npc_ExchangeRoutine (self,"start");
    B_GiveXP (130);
    B_GiveInvItems (other, self, Bergs_Ring, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WARN
//========================================

INSTANCE DIA_Berg_WARN (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 2;
   condition    = DIA_Berg_WARN_Condition;
   information  = DIA_Berg_WARN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Berg_WARN_Condition()
{
    if (Berg_ring_giveday != wld_getday ())
    && (Npc_KnowsInfo (hero, DIA_Berg_HELLO1))
	&& (Choice_BergsRing == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_WARN_Info()
{
    AI_Output (self, other ,"DIA_Berg_WARN_03_01"); //Ostrzega�em ci�, �eby� nie pr�bowa� mnie wykiwa�. Nie wyrobi�e� si� w czasie, wi�c wys�a�em ju� go�ca do Thorusa. Lepiej nie zbli�aj si� do Starego Obozu.
    AI_Output (other, self ,"DIA_Berg_WARN_15_02"); //Cholera!
    if (Npc_HasItems (other, Bergs_Ring) >=1)
    {
		berg_problemy = false;
        AI_Output (other, self ,"DIA_Berg_WARN_15_03"); //Zaczekaj. Przecie� mam tu ten pier�cie�. We� go.
        AI_Output (self, other ,"DIA_Berg_WARN_03_04"); //Masz szcz�cie. Inaczej mia�by� spore k�opoty. Spadaj st�d.
        B_GiveInvItems (other, self, Bergs_Ring, 1);
        B_LogEntry                     (CH1_Magazyny_OC,"W ostatniej chwili odda�em pier�cie� Bergowi. W przeciwnym razie mia�bym niez�e k�opoty.");
    }
    else
    {
		berg_problemy = true;
        B_LogEntry                     (CH1_Magazyny_OC,"Cholera, b�d� mia� teraz problemy w Starym Obozie. Niepotrzebnie pr�bowa�em wykiwa� Berga.");
    };
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Berg_HowAreYou (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_HowAreYou_Condition;
   information  = DIA_Berg_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Berg_HowAreYou_Condition()
{
    if (berg_problemy == false)
    && ((MIS_Magazyny_OC != LOG_SUCCESS)
    || (MIS_Magazyny_OC != LOG_FAILED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_02"); //Wszystko w porz�dku. Zosta�em tu wys�any na zwiady przez Thorusa.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_03"); //Tak my�la�em, w ko�cu to rejony Nowego Obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_04"); //Nie mo�emy pozwoli� Szkodnikom na zbyt wiele, musz� zna� swoje miejsce.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_05"); //Czego zdo�a�e� si� dowiedzie�?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_06"); //No c�, pobliska chatka to cz�sty punkt zwiadowczy Szkodnik�w.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_07"); //Mieszka w niej my�liwy Aidan, czasem przychodzi jednak kilku tych obdartus�w na przeszpiegi.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_08"); //Przewa�nie jednak siedz� w Obozie. To obiboki, jak po�owa mieszka�c�w tego pieprzonego Nowego Obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_09"); //Tylko ostatnio zdarzy�o si� co� dziwnego...
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_10"); //Co takiego?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_11"); //Szkodnicy ci�gn�li ze sob� jednego z my�liwych z pobliskiego obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_12"); //Nie wiem czy go porwali, czy jak, ale z pewno�ci� zamelduj� o tym Thorusowi.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_13"); //Co� jeszcze?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_14"); //Tak, w pobli�u chatki rybackiej jest jaskinia w kt�rej znajduje si� nielegalna wytw�rnia bagiennego ziela. 
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_15"); //Guru z Obozu Sekty z pewno�ci� nie byliby zachwyceni t� informacj�.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_16"); //Mo�e kto� powinien im o tym powiedzie�.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_17"); //Oni nie s� g�upi, z czasem sami si� zorientuj�. 
};