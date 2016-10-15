// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Skaza_EXIT(C_INFO)
{
	npc             = BAN_1612_Skaza;
	nr              = 999;
	condition	= DIA_Skaza_EXIT_Condition;
	information	= DIA_Skaza_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Skaza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Skaza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Skaza
// Rozdzia� 1
// Przyj�cie do Bandyt�w
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> SpyHelp
//========================================

INSTANCE DIA_Bandyta_SpyHelp (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 1;
   condition    = DIA_Bandyta_SpyHelp_Condition;
   information  = DIA_Bandyta_SpyHelp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_SpyHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_AboutSpy))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_SpyHelp_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_01"); //Hej, Ty!
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_15_02"); //Tak?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_03"); //Mam ci co� do powiedzenia. Wyjd�my na zewn�trz.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_04"); //Tutaj �ciany maj� uszy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_15_05"); //W porz�dku, prowad�.
    Npc_ExchangeRoutine (self, "guide");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SpyHelp_NearCamp
//========================================

INSTANCE DIA_Bandyta_SpyHelp_NearCamp (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 2;
   condition    = DIA_Bandyta_SpyHelp_NearCamp_Condition;
   information  = DIA_Bandyta_SpyHelp_NearCamp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_SpyHelp_NearCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp))
    && (Npc_GetDistToWP (self, "OC_ROUND_27") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_03_01"); //Podobno interesujesz si� spraw� zdemaskowania Bandyt�w.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_03_02"); //Powiedz mi, jaki masz w tym interes?

    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "A co ci do tego? ", DIA_Bandyta_SpyHelp_NearCamp_CO_CI);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "Jeste� Bandyt�? Takim w przebraniu?", DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "Pracuj� dla Draxa. ", DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK);
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_CO_CI()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_CO_CI_15_01"); //A co ci do tego? 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_CO_CI_03_02"); //To, �e to bardzo wa�ne. Gadaj!
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_01"); //Jeste� Bandyt�? Takim w przebraniu?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_02"); //Tak, dok�adnie tak. Pracuj� dla Quentina.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_03"); //Dlaczego mi to m�wisz? Sk�d wiesz, �e nie pracuj� dla Gomeza?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_04"); //To proste, je�eli by� pracowa�, nie zd��y�by� nawet dobiec do Obozu. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_05"); //Mog� ci� zabi� w ka�dej chwili, a moj� tajemnice zaniesiesz do grobu. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_06"); //Ciesz� si�, �e trafi�em na swojego cz�owieka.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_07"); //Co?
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_08"); //Pracuj� dla Draxa. Mam zbada� spraw� Obozu Bandyt�w. Konkretniej mam ustali�, co wiedz� Stra�nicy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_09"); //Uda�o mi si� dowiedzie�, �e szpiegiem jest Trip. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_10"); //Nie wyci�gn��em jednak od niego nic konkretnego. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_11"); //Mam dla ciebie informacj�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_12"); //Gdy Trip przyby� do karczmy, pods�ucha�em pewn� rozmow�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_13"); //Chwali� si� karczmarzowi, �e sporz�dzi� specjalne notatki na bazie kt�rych Graham mia� opracowa� map� wskazuj�c� drog� do Obozu Bandyt�w.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_14"); //Mo�esz uknu� podst�p i powiedzie� kartografowi Grahamowi, �e masz zanie�� map� i notatki do obozu przed kopalni�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_15"); //Powiedz, �e tamtejsi Stra�nicy chc� rozpocz�� poszukiwania na w�asn� r�k�.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_16"); //Dlaczego mieliby chcie� to zrobi�?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_17"); //Bo Bandyci nie�le zaszli im za sk�r� atakuj�c konwoje z kopalni.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_18"); //I po tym wszystkim tak po prostu mi to odda?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_19"); //Oczywi�cie, �e nie. Musisz ubra� si� wiarygodnie i mie� specjalne pismo od Thorusa.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_20"); //Zakup spodnie Kopacza, a ja w mi�dzyczasie podrobi� pismo.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_21"); //�wietnie. W takim razie id� po spodnie.
    B_LogEntry                     (CH1_DraxTest,"Nareszcie jakie� konkrety. Skaza poleci� mi, bym powiedzia� Grahamowi, �e mam zanie�� map� i notatki do obozu przed kopalni�. W tym celu jednak powinienem kupi� spodnie Kopacza. Skaza w mi�dzyczasie podrobi pismo od Thorusa.");

    B_GiveXP (150);
    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_01"); //Pracuj� dla Draxa. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_02"); //To masz dzi� szcz�cie. Gdyby� powiedzia� to komu� nieodpowiedniemu, ju� gryz�by� ziemi�.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_03"); //Spodziewa�em si�, �e jeste� Bandyt�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_04"); //Powiem ci tak: w naszej pracy lepiej by� ostro�nym.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_05"); //Przeczucie mo�e zawie��. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_06"); //Przejd�my do konkret�w.
	AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_08"); //Pracuj� dla Draxa. Mam zbada� spraw� Obozu Bandyt�w. Konkretniej mam ustali�, co wiedz� Stra�nicy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_09"); //Uda�o mi si� ustali�, �e szpiegiem jest Trip. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_10"); //Nie wyci�gn��em jednak od niego nic konkretnego. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_11"); //Mam dla ciebie informacj�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_12"); //Gdy Trip przyby� do karczmy, pods�ucha�em pewn� rozmow�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_13"); //Chwali� si� karczmarzowi, �e sporz�dzi� specjalne notatki na bazie kt�rych Graham mia� opracowa� map� wskazuj�c� drog� do Obozu Bandyt�w.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_14"); //Mo�esz uknu� podst�p i powiedzie� kartografowi Grahamowi, �e masz zanie�� map� i notatki do obozu przed kopalni�.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_15"); //Powiedz, �e tamtejsi Stra�nicy chc� rozpocz�� poszukiwania na w�asn� r�k�.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_16"); //Dlaczego mieliby chcie� to zrobi�?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_17"); //Bo Bandyci nie�le zaszli im za sk�r� atakuj�c konwoje z kopalni.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_18"); //I po tym wszystkim tak po prostu mi to odda?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_19"); //Oczywi�cie, �e nie. Musisz ubra� si� wiarygodnie i mie� specjalne pismo od Thorusa.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_20"); //Zakup spodnie Kopacza, a ja w mi�dzyczasie podrobi� pismo.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_21"); //�wietnie. W takim razie id� po spodnie.
    B_LogEntry                     (CH1_DraxTest,"Nareszcie jakie� konkrety. Skaza poleci� mi, bym powiedzia�em Grahamowi, �e mam zanie�� map� i notatki do obozu przed kopalni�. W tym celu jednak powinienem kupi� spodnie Kopacza. Skaza w mi�dzyczasie podrobi pismo od Thorusa.");
    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BuddlerEQ
//========================================

INSTANCE DIA_Bandyta_BuddlerEQ (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 3;
   condition    = DIA_Bandyta_BuddlerEQ_Condition;
   information  = DIA_Bandyta_BuddlerEQ_Info;
   permanent	= FALSE;
   description	= "Mam spodnie Kopacza.";
};

FUNC INT DIA_Bandyta_BuddlerEQ_Condition()
{
	var C_Item obecny_pancerz;
	obecny_pancerz = Npc_GetEquippedArmor(hero);
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp)) && (MIS_DraxTest == LOG_RUNNING)
    //&& ((obecny_pancerz == VLK_ARMOR_L) || (obecny_pancerz == VLK_ARMOR_M) || (obecny_pancerz == VLK_ARMOR_H))
	&& ((Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_L)) ||  (Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_M)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_BuddlerEQ_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_BuddlerEQ_15_01"); //Mam spodnie Kopacza.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_02"); //Doskonale. Napisa�em ju� list.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_03"); //Prosz�, we� go i zanie� Grahamowi.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_04"); //Ja tymczasem wracam do karczmy goln�� sobie troch� ry��wki.
    AI_Output (other, self ,"DIA_Bandyta_BuddlerEQ_15_05"); //W porz�dku.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_06"); //Mam nadzieje, �e jeszcze si� spotkamy.
    B_LogEntry                     (CH1_DraxTest,"Mam podrobiony list Thorusa. W takim razie czas za�o�y� spodnie i i�� do Grahama.");

    B_GiveXP (125);
    CreateInvItems (self, ItMis_Thorus_Safe_conduct, 1);
    B_GiveInvItems (self, other, ItMis_Thorus_Safe_conduct, 1);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Bandyta_HELLO5 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 5;
   condition    = DIA_Bandyta_HELLO5_Condition;
   information  = DIA_Bandyta_HELLO5_Info;
   permanent	= FALSE;
   description	= "Dlaczego nosisz str�j Szkodnika?";
};

FUNC INT DIA_Bandyta_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO5_15_01"); //Dlaczego nosisz str�j Szkodnika?
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_02"); //Nie rozumiesz?! Nie mog� mnie rozpozna�.
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_03"); //Tylko kilka os�b wie, kim naprawd� jestem. 
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_04"); //Musz� zachowa� �rodki ostro�no�ci, inaczej Stra�nicy b�d� mnie torturowa�!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Bandyta_HELLO4 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 4;
   condition    = DIA_Bandyta_HELLO4_Condition;
   information  = DIA_Bandyta_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto dowodzi waszym Obozem?";
};

FUNC INT DIA_Bandyta_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO4_15_01"); //Kto dowodzi waszym Obozem?
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_02"); //Quentin, to najtwardszy z Bandyt�w.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_03"); //Sporo prze�y� w Kolonii, a wcze�niej podobno zadawa� si� z piratami.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_04"); //Du�e wp�ywy ma tak�e Doyle i Rocky.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_05"); //Warto mie� z nimi dobre stosunki.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Skaza
// Rozdzia� 1
// Wie�ci od Skazy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAPORT
//========================================

INSTANCE DIA_Skaza_RAPORT (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 5;
   condition    = DIA_Skaza_RAPORT_Condition;
   information  = DIA_Skaza_RAPORT_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po raport.";
};

FUNC INT DIA_Skaza_RAPORT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_WORKFLOW))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_RAPORT_Info()
{
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_01"); //Przyszed�em po raport.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_02"); //Kto ci� przysy�a?
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_03"); //Drax. M�wi� te�, �e masz jakie� problemy.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_04"); //Widz�, �e nie oszcz�dza ��todziob�w. Zaraz si� za wszystko zabierzemy.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_05"); //Wprowad� mnie w szczeg�y. 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_06"); //Kilku ludzi zacz�o snu� podejrzenia i w�szy� wok� mojej osoby. A to tylko dlatego, �e wiem o grzeszkach dw�ch do�� wp�ywowych Cieni. 
	AI_Output (self, other ,"DIA_Skaza_RAPORT_03_07"); //Uwa�aj� mnie za zagro�enie i za wszelk� cen� chc� zdemaskowa�. Musimy co� z nimi zrobi�. 
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_08"); //O kogo konkretnie chodzi?
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_09"); //O �wistaka i Z�ego. Wiem o nich bardzo wiele.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_10"); //Co na przyk�ad? 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_11"); //�wistak ukrad� wiele rzeczy Magnatom. My�lisz, �e sk�d ma tyle rudy i spodnie kt�rymi handluje? 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_12"); //Kosztowno�ci sprzedawa� rozb�jnikom w zamian za rud�. Wiem, �e brzmi to dziwnie, ale to prawda. Po�redniczy�em kilka lat temu w tym procederze. 
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_13"); //A Z�y?
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_14"); //O tym, �e Z�y zabi� Neka wie ju� ca�y Ob�z. Popytaj Kopaczy mieszkaj�cych niedaleko chaty Z�ego, a sam si� dowiesz. Tego zab�jstwa r�wnie� by�em �wiadkiem.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_25"); //Gdyby uda�o ci si� wtr�ci� ich do loch�w, mia�bym troch� spokoju. 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_26"); //Musisz znale�� na nich dowody. Niestety moje po�wiadczenia na nic si� tu nie zdadz�. Thorus nie ufa ludziom takim jak ja czy Mordrag.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_27"); //Spr�buj� co� wykombinowa�. Od czego mam zacz��?
    AI_Output (self, other ,"DIA_Skaza_GOOOO_03_02"); //Proponuj�, �eby� pogada� z Bartholo. To on opiekuje si� rzeczami Magnat�w.
    AI_Output (other, self ,"DIA_Skaza_GOOOO_15_03"); //Mo�e nie zauwa�y�e�, ale nie mog� wej�� do zamku...
    AI_Output (self, other ,"DIA_Skaza_GOOOO_03_04"); //Dogadaj si� z jak�� wp�ywow� osob� w Obozie. Mo�e kto� ci pomo�e?
	AI_Output (self, other ,"DIA_Skaza_GOOOO_03_05"); //Poci�gnij te� za j�zyk Kopaczy mieszkaj�cych w okolicach chaty Z�ego. 
	
    B_LogEntry                     (CH1_NewsFromSpy,"Zanim dostan� raport, musz� pom�c Skazie z jego k�opotami w obozie.");
	
    MIS_SpysProblems = LOG_RUNNING;
    Log_CreateTopic          (CH1_SpysProblems, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SpysProblems, LOG_RUNNING);
    B_LogEntry               (CH1_SpysProblems,"Skaza kaza� mi znale�� dowody na to, �e Z�y zabi� Neka, a �wistak okrad� Magnat�w. Kopacze mieszkaj�cy w pobli�u chaty Z�ego powinni wiedzie� co� wi�cej o zab�jstwie. O kradzie�y natomiast dowiem si� od Bartholo, jednak musz� jako� za�atwi� sobie spotkanie z tym Magnatem.");
};

//========================================
//-----------------> PART1
//========================================

INSTANCE DIA_Skaza_PART1 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 8;
   condition    = DIA_Skaza_PART1_Condition;
   information  = DIA_Skaza_PART1_Info;
   permanent	= FALSE;
   description	= "Za�atwi�em spraw� ze �wistakiem.";
};

FUNC INT DIA_Skaza_PART1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_DOWODY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_PART1_Info()
{
    AI_Output (other, self ,"DIA_Skaza_PART1_15_01"); //Za�atwi�em spraw� ze �wistakiem.
    AI_Output (self, other ,"DIA_Skaza_PART1_03_02"); //Jak posz�o?
	AI_Output (other, self ,"DIA_Skaza_PART1_15_03"); //Dowiedzia�em si� od Bartholo, co zosta�o skradzione, a p�niej zacz��em szuka� tych rzeczy w chacie �wistaka.
	AI_Output (other, self ,"DIA_Skaza_PART1_15_04"); //Uda�o mi si� znale�� kilka przedmiot�w zgodnych z opisami Magnata. Pos�u�y�y mi one za dowody.
	AI_Output (self, other ,"DIA_Skaza_PART1_03_05"); //Cholera, zaskakujesz mnie.
};

//========================================
//-----------------> PART2
//========================================

INSTANCE DIA_Skaza_PART2 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 9;
   condition    = DIA_Skaza_PART2_Condition;
   information  = DIA_Skaza_PART2_Info;
   permanent	= FALSE;
   description	= "Z�y ju� nie b�dzie ci przeszkadza�.";
};

FUNC INT DIA_Skaza_PART2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_ICHTROJE))
    && (MIS_SpysProblems == LOG_RUNNING)    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_PART2_Info()
{
    AI_Output (other, self ,"DIA_Skaza_PART2_15_01"); //Z�y ju� nie b�dzie ci przeszkadza�.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_02"); //Uda�o ci si� znale�� na niego dowody?
    AI_Output (other, self ,"DIA_Skaza_PART2_15_03"); //Tak. O jego wyst�pku wiedzia�a dosy� du�a liczba Kopaczy. Jednak byli oni szanta�owani przez siepaczy Cienia.
    AI_Output (other, self ,"DIA_Skaza_PART2_15_04"); //Pozby�em si� ochroniarzy Z�ego i wtedy zacz�li m�wi�.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_05"); //�wietnie to sobie wykombinowa�e�.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_06"); //Moim zdaniem zas�ugujesz ju� na miano Bandyty.
	HeroKnowsSlyKillNek = true;
};

//========================================
//-----------------> LIFEBANDITOS
//========================================

INSTANCE DIA_Skaza_LIFEBANDITOS (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 10;
   condition    = DIA_Skaza_LIFEBANDITOS_Condition;
   information  = DIA_Skaza_LIFEBANDITOS_Info;
   permanent	= FALSE;
   description	= "Co wiesz o �yciu Bandyt�w?";
};

FUNC INT DIA_Skaza_LIFEBANDITOS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_PART2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_LIFEBANDITOS_Info()
{
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_01"); //Co wiesz o �yciu Bandyt�w?
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_02"); //Jest ci�kie. Dla nich liczy si� ka�da bry�ka. To najbiedniejszy z Oboz�w.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_03"); //Jaki jest ich cel w Kolonii?
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_04"); //Wi�kszo�� Bandyt�w to uciekinierzy z Nowego Obozu.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_05"); //Ich celem jest po prostu prze�y�, a przy okazji wzbogaci� si� solidnie.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_06"); //Nie rozumiem po co komu� maj�tek w Kolonii.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_07"); //To proste. �eby godnie �y�. Nawet w G�rniczej Dolinie jest to mo�liwe.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_08"); //Z drugiej strony wielu Bandyt�w uwa�a, �e nied�ugo Bariera opadnie.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_09"); //Ukrywaj� wi�c skrzynie pe�ne rudy i skarb�w, licz�c, �e kiedy� tu wr�c�.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_10"); //Jako Bandyta czeka ci� sporo walki, napad�w na konwoje z rud�, kradzie� d�br czy misje szpiegowskie.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_11"); //Brzmi ciekawie. 
   // AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_12"); //Bo jest. Ch�opcze, jeste� jeszcze m�ody, masz du�o si�y. �ycie przed tob�.
};

//========================================
//-----------------> ALLWORKSOK
//========================================

INSTANCE DIA_Skaza_ALLWORKSOK (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 11;
   condition    = DIA_Skaza_ALLWORKSOK_Condition;
   information  = DIA_Skaza_ALLWORKSOK_Info;
   permanent	= FALSE;
   description	= "Pomog�em ci. Podaj mi raport.";
};

FUNC INT DIA_Skaza_ALLWORKSOK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_PART2))
    && (Npc_KnowsInfo (hero, DIA_Skaza_PART1))
    && (MIS_SpysProblems == LOG_RUNNING)  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_ALLWORKSOK_Info()
{
    AI_Output (other, self ,"DIA_Skaza_ALLWORKSOK_15_01"); //Pomog�em ci. Podaj mi raport.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_02"); //Jasne. Zas�u�y�e�.
	if (Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_BAU) 
	{
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_04"); //Powiedz Draxowi, �e Gomez ostatnio prowadzi liczne pertraktacje z Bractwem.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_05"); //Podobno Y'Berion oferuje du�e ilo�ci ziela w zamian za jakie� us�ugi Stra�nik�w w kopalni.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_06"); //Nie wiem o co dok�adnie chodzi, ale Stra�nicy �wi�tynni wyra�nie czego� szukaj� w Starej Kopalni.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_07"); //Jednak Gomez mimo wszystko im nie ufa. W�r�d rekrut�w szukaj� szpiega, kt�ry wyw�szy o co chodzi.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_08"); //Zauwa�y�e�, �e w Obozie jest wi�cej wys�annik�w Bractwa?
    AI_Output (other, self ,"DIA_Skaza_ALLWORKSOK_15_09"); //Tak.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_10"); //Dobra, teraz ju� id� do Draxa.
	
    B_LogEntry                     (CH1_SpysProblems,"Rozwi�za�em problemy Skazy w Obozie za co otrzyma�em raport, kt�ry mog� wreszcie zanie�� Draxowi.");
	Log_SetTopicStatus       (CH1_SpysProblems, LOG_SUCCESS);
	MIS_SpysProblems = LOG_SUCCESS;
	
	 B_LogEntry                     (CH1_NewsFromSpy,"Skaza powiedzia�, �e Bractwo zawar�o umow� z Gomezem. Stary Ob�z w zamian za du�e ilo�ci ziela ma pomaga� w kopalni Stra�nikom �wi�tynnym. Ci z kolei szukaj� czego� w Starej Kopalni.");
	}
	else
	{
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_11"); //Jednak wybra�e� ju� inn� gildi�. Jestem ci naprawd� bardzo wdzi�czny, ale nie mog� przekaza� ci tego raportu.
	if (Npc_GetTrueGuild(other) == GIL_VLK) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD)
	{
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_12"); //Dziwi mnie tylko, �e jeste� cz�onkiem Starego Obozu, a postanowi�e� mi pom�c. Naprawd� nie wiem, dlaczego to zrobi�e�.
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_13"); //Mo�e jeste� g�upcem? Albo masz w tym jaki� ukryty cel? Wiesz co, lepiej ju� id�. 
	};
	B_LogEntry               (CH1_SpysProblems,"Pomog�em Skazie z jego problemami, jednak nie przekaza� mi raportu, poniewa� do��czy�em do innej gildii.");
	Log_SetTopicStatus       (CH1_SpysProblems, LOG_SUCCESS);
	MIS_SpysProblems = LOG_SUCCESS;
	
	MIS_NewsFromSpy = LOG_FAILED;
	Log_SetTopicStatus       (CH1_NewsFromSpy, LOG_FAILED);
	B_LogEntry      	(CH1_NewsFromSpy,"Do��czy�em do innego Obozu, wi�c to zadanie jest ju� dla mnie bez sensu.");
	B_Givexp (100);
	};
};