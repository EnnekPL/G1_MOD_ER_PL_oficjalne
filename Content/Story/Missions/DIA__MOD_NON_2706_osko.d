//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_osko_EXIT(C_INFO)
{
	npc             = NON_2706_osko;
	nr              = 999;
	condition	= DIA_osko_EXIT_Condition;
	information	= DIA_osko_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_osko_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_osko_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoJu
//========================================

INSTANCE DIA_osko_WhoJu (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_osko_WhoJu_Condition;
   information  = DIA_osko_WhoJu_Info;
   permanent	= false;
   description	= "Kim jeste�?";
};

FUNC INT DIA_osko_WhoJu_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_WhoJu_Info()
{
    AI_Output (other, self ,"DIA_osko_WhoJu_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_osko_WhoJu_03_02"); //Hmm? Jestem Osko. Poluj� na ork�w razem z band� Wilsona. Mia�e� du�o szcz�cia, �e uda�o ci si� tu dotrze� w jednym kawa�ku.
	AI_Output (other, self ,"DIA_osko_WhoJu_15_03"); //Wspi��em si� tu po �cianie skalnej.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_04"); //To oczywiste. Nie da�by� rady przej�� od strony Ziem Ork�w. Wej�cie do obozu jest zabarykadowane. Poza tym nik�e szanse, �e w og�le by� do niego dotar�. 
	AI_Output (self, other ,"DIA_osko_WhoJu_03_05"); //Nie zmienia to faktu, �e droga przez ska�y te� nie jest �atwa. Jeden fa�szywy ruch i l�dujesz na ziemi ze skr�conym karkiem.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_06"); //Poni�ej, w szczelinie skalnej mieszka pewien staruszek. Rozmawia�em z nim kiedy�. Uciek� ze Starego Obozu kilka lat temu, a ja obieca�em, �e go nie wydam.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_07"); //No bo w sumie po co? Nie nadepn�� mi na odcisk, a za Stra�nikami z Obozu niezbyt przepadam, wi�c niech sobie tu �yje. 
	AI_Output (other, self ,"DIA_osko_WhoJu_15_08"); //Do czego zmierzasz?
	AI_Output (self, other ,"DIA_osko_WhoJu_03_09"); //Ten staruszek pomimo lat wci�� potrafi si� nie�le wspina�. My�l�, �e gdyby� z nim pogada�, m�g�by ci� czego� nauczy�.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"�owca ork�w Osko zdradzi� mi, �e w jaskini w pobli�u ich obozu mieszka niezwykle zr�czny staruszek. Je�li go poprosz�, mo�e nauczy mnie akrobatyki.");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_osko_HELLO5 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 5;
   condition    = DIA_osko_HELLO5_Condition;
   information  = DIA_osko_HELLO5_Info;
   permanent	= FALSE;
   description	= "Dlaczego polujecie na ork�w?";
};

FUNC INT DIA_osko_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO5_15_01"); //Dlaczego polujecie na ork�w?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_02"); //A dlaczego by nie? Co mamy lepszego do roboty pod Barier�?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_03"); //Wyobra� sobie, �e kiedy� uciekniemy z tego okropnego miejsca. Wtedy umiej�tno�ci si� przydadz�. Zw�aszcza, �e na kontynencie trwa wojna.
    AI_Output (self, other ,"DIA_osko_HELLO5_03_04"); //Sko�czy�y si� czasy w kt�rych do stra�y miejskiej przyjmowa�o si� byle kogo. W czasie wojny s�abi pracuj� w polu, a silni walcz�. 
	AI_Output (other, self ,"DIA_osko_HELLO5_15_05"); //Dobrze rozumiem, �e je�li uda�oby ci si� st�d uciec, to zaci�gn��by� si� do stra�y miejskiej, by walczy� z orkami?
	AI_Output (self, other ,"DIA_osko_HELLO5_03_06"); //Gdybym mia� okazj�, to owszem. Stra�nicy dostaj� �o�d, zni�ki w burdelach i mieszka�cy ich szanuj�. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_07"); //Od czasu do czasu musia�bym tylko ubi� jakiego� orka, kt�ry niebezpiecznie si� zbli�y�. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_08"); //Nic nadzwyczajnego. Tutaj robi� to codziennie. 
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_osko_HELLO6 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 6;
   condition    = DIA_osko_HELLO6_Condition;
   information  = DIA_osko_HELLO6_Info;
   permanent	= FALSE;
   description	= "To trudna praca?";
};

FUNC INT DIA_osko_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO6_15_01"); //To trudna praca?
    AI_Output (self, other ,"DIA_osko_HELLO6_03_02"); //Oczywi�cie, �e tak. Orkowie to twardzi przeciwnicy.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_03"); //Trzeba atakowa� szybko i mocno. Nie mo�na si� waha�.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_04"); //Aby dobrze walczy� z orkami, musisz p�ynnie pos�ugiwa� si� swoim or�em.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_05"); //Nie zawsze liczy si� tylko si�a.
};

//========================================
//-----------------> PROWOKACJA_DO_QUESTA
//========================================

INSTANCE DIA_osko_PROWOKACJA_DO_QUESTA (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_PROWOKACJA_DO_QUESTA_Condition;
   information  = DIA_osko_PROWOKACJA_DO_QUESTA_Info;
   permanent	= FALSE;
   description	= "Jak tam sytuacja w obozie?";
};

FUNC INT DIA_osko_PROWOKACJA_DO_QUESTA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_PROWOKACJA_DO_QUESTA_Info()
{
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_01"); //Jak tam sytuacja w obozie?
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_02"); //Jak na razie wszystko pod kontrol�, orkowie trzymaj� si� od nas z dala. A jak kt�ry� z nich zapu�ci si� zbyt blisko naszego obozu, szybko tego �a�uje.
	AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_03"); //Ostatnio jednak zdarzy�o si� co� dziwnego, jak masz chwilk� mog� ci opowiedzie�.
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_04"); //Mam czas, opowiadaj.
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_05"); //Najpierw przynie� mi piwo, bo troch� zasch�o mi w ustach.
};

//========================================
//-----------------> QUEST_HUGO_START
//========================================

INSTANCE DIA_osko_QUEST_HUGO_START (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 2;
   condition    = DIA_osko_QUEST_HUGO_START_Condition;
   information  = DIA_osko_QUEST_HUGO_START_Info;
   permanent	= FALSE;
   description	= "Prosz� bardzo. Wypij moje zdrowie.";
};

FUNC INT DIA_osko_QUEST_HUGO_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_PROWOKACJA_DO_QUESTA))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_QUEST_HUGO_START_Info()
{
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_01"); //Prosz� bardzo. Wypij moje zdrowie.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_StandUp (self);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_02"); //Dzi�ki. No wi�c tak... W naszym obozie jeszcze kilka dni temu by� jeszcze jeden �owca. Nazywa� si� Hugo i troch� za bardzo interesowa� si� orkow� kultur�. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_03"); //Wiesz, zanim wsadzi� jakiemu� orkowi top�r w dup�, wpierw troch� go torturowa�, pytaj�c o r�ne rzeczy.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_04"); //W ka�dym razie jaki� tydzie� temu walczyli�my z grupk� ork�w w ruinach starej Cytadeli, na najwy�szej g�rze Kolonii. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_05"); //Hugo po walce znalaz� przy zw�okach orkowego przyw�dcy jak�� map�. Po tym jak wr�cili�my do obozu, studiowa� j� przez dwa dni, po czym znikn�� bez �ladu nikomu nic nie m�wi�c.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_06"); //Ja i reszta ch�opak�w jeste�my troch� tym faktem zmartwieni. Hugo to �wietny wojownik i wie jak traktowa� ork�w. Szkoda by�oby straci� kogo� takiego. Je�li gdzie� go spotkasz, daj mi zna�. 
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_07"); //W porz�dku. Je�li go gdzie� spotkam, to si� o tym dowiesz.
    MIS_HunterHugo = LOG_RUNNING;

    Log_CreateTopic          (CH1_HunterHugo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_RUNNING);
    B_LogEntry               (CH1_HunterHugo,"Osko zdradzi� mi, �e w obozie �owc�w ork�w by� jeszcze jeden my�liwy imieniem Hugo. Pono� bardzo interesowa�a go kultura ork�w. By� dosy� osobliwym cz�owiekiem, ale potrafi� sobie poradzi� w niebezpiecze�stwie. Musz� go poszuka�. Z pewno�ci� jest gdzie� w pobli�u obozu. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ODKRYLEM
//========================================

INSTANCE DIA_osko_ODKRYLEM (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_ODKRYLEM_Condition;
   information  = DIA_osko_ODKRYLEM_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.";
};

FUNC INT DIA_osko_ODKRYLEM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_ODKRYLEM_Info()
{
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_01"); //Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.
    AI_Output (self, other ,"DIA_osko_ODKRYLEM_03_02"); //Dobra robota, ciesz� si�, �e taki kawa� wojownika jak on nie da� si� tak �atwo zabi�. Oto 100 bry�ek rudy za informacje.
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_03"); //Dzi�ki. 
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry     (CH1_HunterHugo,"Powiedzia�em Osko o tym, �e znalaz�em Hugo i pomog�em mu rozwi�za� jego problemy.");
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_SUCCESS);
    MIS_HunterHugo = LOG_SUCCESS;

    B_GiveXP (200);
};