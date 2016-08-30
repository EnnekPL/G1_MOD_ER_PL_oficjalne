// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jeste�?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jeste�?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa �ni�cego.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Bractwo �ni�cego? A c� to takiego?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo �ni�cego? A c� to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jeste�my wsp�lnot� wyznawc�w nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nasz Ob�z znajduje si� na wsch�d st�d, na bagnie. Przyszed�em tutaj, by naucza� niewiernych takich jak ty s��w �ni�cego.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest �ni�cy?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //�ni�cy b�dzie naszym wyzwolicielem. Pi�� lat temu ujawni� si� nam przez Y'Beriona, naszego wielkiego mistrza.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od tej chwili, wyrzekli�my si� trzech bog�w, co i tobie radz�.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bogowie przygl�dali si� bezczynnie, gdy byli�my skazywani na do�ywotni� katorg� w tym wi�zieniu. Ale �ni�cy wska�e nam drog� do wolno�ci.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach �ni�cego.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach �ni�cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //�ni�cy jest niezwykle pot�ny, mo�e nawet pot�niejszy od Innosa, boga �wiat�a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Zjednoczy� si� z nami duchowo, ale jego moc jest wci�� ograniczona. By� u�piony przez tysi�ce lat, ale moment jego wielkiego przebudzenia jest ju� bardzo bliski!
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Wybra� nas na �wiadk�w swojego nadej�cia i kaza� nam szerzy� jego s�owa w ca�ej Kolonii.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Zatem s�uchaj: ka�dy, kto stanie po jego stronie zostanie zbawiony, ale ci, kt�rzy si� mu sprzeciwi�, ponios� surow� kar�.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ale �ni�cy jest mi�osierny i wszystkim w�tpi�cym przysy�a znak swojej pot�gi.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Jak b�dzie wygl�da� ta droga do wolno�ci?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak b�dzie wygl�da� ta droga do wolno�ci?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Przygotowujemy si� do wielkiego przyzwania, w kt�rym wszyscy Nowicjusze zjednocz� swoje duchowe si�y.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //W trakcie rytua�u �ni�cy ujawni nam �wi�t� drog� do wolno�ci.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "W jaki spos�b wasz b�g udowodni� swoj� pot�g�?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //W jaki spos�b wasz b�g udowodni� swoj� pot�g�?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Przemawiaj�c do nas za po�rednictwem wizji. Kto raz us�yszy jego g�os, ju� nigdy nie zb��dzi na �cie�k� z�a.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Za�yj rosn�ce na bagnach ziele, a zbli�ysz si� do �ni�cego i b�dziesz m�g� us�ysze� jego s�owa. Niekt�rym wybra�com zdarzy�o si� go nawet zobaczy�!
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Rozumiem.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Jak mog� dotrze� do Obozu Bractwa?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak mog� dotrze� do Obozu Bractwa?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Jestem teraz zaj�ty, ale Baal Parvez powinien przebywa� jeszcze w tym obozie.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Znajdziesz go gdzie� w pobli�u targowiska, po drugiej stronie zamku. Zdaj� si�, �e ma tam nawet w�asn� chat�!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi, "Nowicjusz imieniem Baal Parvez mo�e mnie zaprowadzi� do obozu na bagnie. Znajd� go na targowisku, za zamkiem Starego Obozu.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 0;
	description = "Musz� si� dosta� do zamku. M�g�by� mi pom�c?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet)) && (kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Musz� si� dosta� do zamku. M�g�by� mi pom�c?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obawiam si�, �e nie. Tylko bracia dostarczaj�cy Gomezowi ziele maj� wst�p do zamku.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Zbieramy bagienne ziele, i cz�� zbior�w sprzedajemy do Starego Obozu w zamian za r�ne dobra z Zewn�trznego �wiata.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Gdyby� by� jednym z kurier�w pracuj�cych dla Cor Kaloma, m�g�by� dosta� si� do zamku. Oczywi�cie musia�by� najpierw przyst�pi� do Bractwa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A czego, je�li wolno spyta�, chcesz szuka� w zamku?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Musz� si� tam z kim� spotka�."						,DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mam list do Arcymistrza Mag�w Ognia."	,DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Musz� si� tam z kim� spotka�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Naprawd�? A z kim? Nie m�g�by� po prostu zaczeka�, a� do ciebie wyjdzie?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To jeden z mag�w."	,DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mam list do Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Czy�by? A sk�d go masz? Mo�e dosta�e� go od jednego z mag�w zanim ci� tu wrzucono?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jeste� g�upcem, rozpowiadaj�c o tym na lewo i prawo, ale nie obawiaj si� - nikomu o tym nie powiem.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Jednak na twoim miejscu trzyma�bym j�zyk za z�bami. Za co� takiego wi�kszo�� ludzi bez wahania poder�n�aby ci gard�o.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Nagroda, jak� otrzymuj� pos�a�cy za dostarczenie wiadomo�ci z Zewn�trznego �wiata, jest niezwykle cenna.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Baal Taran z Obozu Bractwa powiedzia� mi, �e do zamku mog� wej�� wys�annicy Cor Kaloma, w celach handlu z Magnatami. Mo�e powinienem do nich do��czy�?");
	};
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //To jeden z mag�w.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //C�, obawiam si�, �e oni nigdy nie opuszczaj� zamku. Rzeczywi�cie, musia�by� dosta� si� do �rodka.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //A czego od nich chcesz? Magicznych run? A mo�e napoj�w?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"W�a�nie tak!"				,DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nie twoja sprawa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobrze, jak sobie �yczysz.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //W�a�nie tak!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wiedzia�em! Czeg� innego kto� taki jak ty m�g�by chcie� od maga.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Dam ci dobr� rad�: daruj sobie tych ca�ych mag�w. Ceny, kt�rych ��daj� za swoje zabawki s� niezwykle wyg�rowane.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Runy i napoje dostaniesz r�wnie� w naszym obozie i to za po�ow� ceny!
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};

//========================================
//-----------------> JOB
//========================================
//edit by Nocturn
INSTANCE DIA_BaalTaran_JOB (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_JOB_Condition;
   information  = DIA_BaalTaran_JOB_Info;
   permanent	= FALSE;
   description	= "Szukam zaj�cia.";
};

FUNC INT DIA_BaalTaran_JOB_Condition()
{
    if (kapitel == 1) && (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_JOB_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_01"); //Szukam zaj�cia.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_02"); //W sumie to mia�bym dla ciebie ma�� rob�tk�. Zadanie wymaga troch� pomys�owo�ci.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_03"); //Co mia�bym zrobi�? 
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_04"); //Mia�by� nam�wi� kilku mieszka�c�w Obozu do palenia ziela. Z pewnych �r�de� dowiedzia�em si�, �e kowal Huno w przesz�o�ci by� uzale�niony od palenia.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_05"); //Jednak przesta� pali� od czasu, kiedy trafi� do Kolonii.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_06"); //Taki �pun to dla mnie niez�y rynek zbytu ziela. Spr�buj jako� wcisn�� mu jednego skr�ta. Dalej powinno by� ju� z g�rki.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_07"); //A pozosta�e osoby?
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_08"); //Mam na oku jeszcze dw�ch potencjalnych klient�w. S� to: Gravo i Szakal.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_09"); //Postaram si� jako� ich przekona�.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_10"); //Zaczekaj. Dam ci specjalne ziele o nieco mocniejszym dzia�aniu. 
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_11"); //Prosz�. Teraz mo�esz zaczyna�.
    MIS_Cpuny = LOG_RUNNING;
	CreateInvItems (self, RecruitJoint, 3);
    B_GiveInvItems (self, other, RecruitJoint, 3);
    CreateInvItems (self, ItMiJoint_1, 2);
    B_GiveInvItems (self, other, ItMiJoint_1, 2);
	CreateInvItems (self, ItMiJoint_2, 2);
    B_GiveInvItems (self, other, ItMiJoint_2, 2);
	CreateInvItems (self, ItMiJoint_3, 1);
    B_GiveInvItems (self, other, ItMiJoint_3, 1);
	Huno_drugs_level = 0;
    Log_CreateTopic            (CH1_Cpuny, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Cpuny, LOG_RUNNING);
    B_LogEntry                     (CH1_Cpuny,"Baal Taran zleci� mi zdobycie mu nowych klient�w. W tym celu musz� obudzi� stary na��g w Huno, oraz nam�wi� Gravo i Szakala do palenia.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HUNO_SYTUACJA
//========================================
//edit by Nocturn
INSTANCE DIA_BaalTaran_HUNO_SYTUACJA (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_HUNO_SYTUACJA_Condition;
   information  = DIA_BaalTaran_HUNO_SYTUACJA_Info;
   permanent	= FALSE;
   description	= "Co do Huno...";
};

FUNC INT DIA_BaalTaran_HUNO_SYTUACJA_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (!Huno_drugs_level == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_HUNO_SYTUACJA_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_01"); //Co do Huno...
    AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_02"); //Tak?
    if (Huno_drugs_level == 1)
    {
        AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_03"); //Uda�o mi si� zmusi� go do zapalenia jednego skr�ta. My�l�, �e wkr�tce b�dzie przychodzi� cz�ciej.
        AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_04"); //To si� dopiero oka�e. Oto twoja nagroda.
        CreateInvItems (self, ItMiNugget, 30);
        B_GiveInvItems (self, other, ItMiNugget, 30);
    }
    else if (Huno_drugs_level == 2)
    {
        AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_05"); //Huno nie�le si� wci�gn�� w to ca�e palenie. Obudzi�em w nim stare nawyki.
        AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_06"); //Bardzo dobrze. Wkr�tce kolejny dure� b�dzie kupowa� ziele kilogramami.
    CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
}
else if (Huno_drugs_level == 3)
{
    AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_07"); //Huno powr�ci� do na�ogu. My�l�, �e uda ci si� na nim sporo zarobi�.
    AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_08"); //Dobre wie�ci. Nale�y ci si� 100 bry�ek rudy za t� wiadomo��. Dobra robota.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
};
B_LogEntry                     (CH1_Cpuny,"No dobra, spraw� z Huno mam ju� za�atwion�.");

B_GiveXP (200);
};
//========================================
//-----------------> GRAVO_PALACZ
//========================================
//edit by Nocturn
INSTANCE DIA_BaalTaran_GRAVO_PALACZ (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_GRAVO_PALACZ_Condition;
   information  = DIA_BaalTaran_GRAVO_PALACZ_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi co� poradzi� jak przekona� Gravo?";
};

FUNC INT DIA_BaalTaran_GRAVO_PALACZ_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (Gravo_pali == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_GRAVO_PALACZ_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_PALACZ_15_01"); //Mo�esz mi co� poradzi� jak przekona� Gravo?
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_02"); //Pono� ten go�� lubi wymy�lne smaki. Spr�buj z r�nymi rodzajami tytoniu. Mo�esz je kupi� w Bractwie.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_03"); //Spr�buj zrobi� skr�ta o specjalnym smaku. Je�eli nie znasz si� na alchemii, to pogadaj z go�ciem imieniem Claw. Mieszka w obozie my�liwych.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_04"); //Naprawd� zna si� na rzeczy.
    B_LogEntry                     (CH1_Cpuny,"Gravo szuka jointa o specyficznym smaku. Powinienem co� pokombinowa� na stole alchemicznym. ");
};

//========================================
//-----------------> GRAVO_END
//========================================
//edit by Nocturn
INSTANCE DIA_BaalTaran_GRAVO_END (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_GRAVO_END_Condition;
   information  = DIA_BaalTaran_GRAVO_END_Info;
   permanent	= FALSE;
   description	= "Gravo b�dzie twoim nowym klientem.";
};

FUNC INT DIA_BaalTaran_GRAVO_END_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (Gravo_pali == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_GRAVO_END_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_END_15_01"); //Gravo b�dzie twoim nowym klientem.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_END_03_02"); //Dobra robota. Czym go przyci�gn��e�?
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_END_15_03"); //Miodowym skr�tem. Bardzo przypad� mu do gustu.
    B_givexp (150);
};

//========================================
//-----------------> SZAKAL_PALI
//========================================
//edit by Nocturn
INSTANCE DIA_BaalTaran_SZAKAL_PALI (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_SZAKAL_PALI_Condition;
   information  = DIA_BaalTaran_SZAKAL_PALI_Info;
   permanent	= FALSE;
   description	= "A co do Szakala...";
};

FUNC INT DIA_BaalTaran_SZAKAL_PALI_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (Jackal_pali == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_SZAKAL_PALI_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_01"); //Co do Szakala...
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_02"); //Musia�em spu�ci� nieco cen�, aby chcia� w og�le do ciebie zajrze�.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_03"); //O ile dok�adnie j� zmniejszy�e�?
    if (jackal_ore  == 1)
    {
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_04"); //O jedn� bry�k� rudy. Nie by� zachwycony, ale od czasu do czasu co� u ciebie kupi.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_05"); //Dobre i to.
    B_LogEntry                     (CH1_Cpuny,"Zmniejszy�em Szakalowi cen� o jedn� bry�k�. My�l�, �e mog�em opu�ci� ciut wi�cej. Mo�e by�by bardziej ch�tny do zakupu.");

    CreateInvItems (self, ItMiNugget, 40);
    B_GiveInvItems (self, other, ItMiNugget, 40);
    B_GiveXP (50);
    }
    else if (jackal_ore == 2)
    {
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_06"); //Zmieni�em cen� o dwie bry�ki rudy. Szakal by� zadowolony. B�dzie tu cz�sto zagl�da�.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_07"); //�wietnie. Przy okazji sporo nie strac� na tej obni�ce.
	B_LogEntry                     (CH1_Cpuny,"Zmniejszy�em Szakalowi cen� za skr�ta o 2 bry�ki. Baal Taran powiedzia�, �e to ca�kiem op�acalna decyzja. ");
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);

    B_GiveXP (100);

    }
    else if (jackal_ore == 5)
    {
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_08"); //Zmniejszy�em cen� o pi�� bry�ek rudy.
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_09"); //O ILE?
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_10"); //Czy ty do reszty zg�upia�e�? Przecie� b�d� na tym stratny!
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_11"); //Ale Szakal zapewni�, �e zakupi du�� ilo��...
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_12"); //W dupie mam jego zapewnienie. Wykona�e� robot�, ale gorzej si� nie da�o tego spapra�...
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_13"); //Potr�cisz mi z wyp�aty.
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_14"); //Jakiej wyp�aty? Nic za niego nie dostaniesz!
        B_LogEntry                     (CH1_Cpuny,"Baal Taran by� nie�le wkurzony, �e zmniejszy�em cen� za skr�ta a� o 5 bry�ek.");
    };

};


//========================================
//-----------------> END_WORK
//========================================

INSTANCE DIA_BaalTaran_END_WORK (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 2;
   condition    = DIA_BaalTaran_END_WORK_Condition;
   information  = DIA_BaalTaran_END_WORK_Info;
   permanent	= FALSE;
   description	= "Zrobi�em ju� chyba wszystko.";
};

FUNC INT DIA_BaalTaran_END_WORK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalTaran_SZAKAL_PALI))
    && (Npc_KnowsInfo (hero, DIA_BaalTaran_GRAVO_END))
    && (Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA))
    && (MIS_Cpuny == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_END_WORK_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_END_WORK_15_01"); //Zrobi�em ju� chyba wszystko.
    AI_Output (self, other ,"DIA_BaalTaran_END_WORK_03_02"); //Masz racj�. Dzi�ki za pomoc. Masz tu co� za fatyg�.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    CreateInvItems (self, ItMiJoint_3, 5);
    B_GiveInvItems (self, other, ItMiJoint_3, 5);
    B_LogEntry                     (CH1_Cpuny,"Przekona�em wszystkie trzy osoby do palenia. Baal Taran nie�le mnie za to wynagrodzi�.");
    Log_SetTopicStatus       (CH1_Cpuny, LOG_SUCCESS);
    MIS_Cpuny = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FOCH_FOREVER
//========================================

INSTANCE DIA_BaalTaran_FOCH_FOREVER (C_INFO)
{
   npc          = NOV_1331_BaalTaran;
   nr           = 1;
   condition    = DIA_BaalTaran_FOCH_FOREVER_Condition;
   information  = DIA_BaalTaran_FOCH_FOREVER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalTaran_FOCH_FOREVER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_POKABLOWAC_DOBRA_RZECZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_FOCH_FOREVER_Info()
{
    AI_Output (self, other ,"DIA_BaalTaran_FOCH_FOREVER_03_01"); //Ty idioto! Co narobi�e�? Przez ciebie mam teraz k�opoty!
    AI_Output (self, other ,"DIA_BaalTaran_FOCH_FOREVER_03_02"); //WYNO� SI� ST�D!
    AI_StopProcessInfos	(self);
};

