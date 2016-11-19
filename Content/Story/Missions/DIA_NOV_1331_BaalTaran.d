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
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jesteœ?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jesteœ?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa Œni¹cego.
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
	description = "Bractwo Œni¹cego? A có¿ to takiego?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo Œni¹cego? A có¿ to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jesteœmy wspólnot¹ wyznawców nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nasz Obóz znajduje siê na wschód st¹d, na bagnie. Przyszed³em tutaj, by nauczaæ niewiernych takich jak ty s³ów Œni¹cego.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest Œni¹cy?";
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
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Œni¹cy bêdzie naszym wyzwolicielem. Piêæ lat temu ujawni³ siê nam przez Y'Beriona, naszego wielkiego mistrza.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od tej chwili, wyrzekliœmy siê trzech bogów, co i tobie radzê.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bogowie przygl¹dali siê bezczynnie, gdy byliœmy skazywani na do¿ywotni¹ katorgê w tym wiêzieniu. Ale Œni¹cy wska¿e nam drogê do wolnoœci.
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach Œni¹cego.";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach Œni¹cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Œni¹cy jest niezwykle potê¿ny, mo¿e nawet potê¿niejszy od Innosa, boga œwiat³a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Zjednoczy³ siê z nami duchowo, ale jego moc jest wci¹¿ ograniczona. By³ uœpiony przez tysi¹ce lat, ale moment jego wielkiego przebudzenia jest ju¿ bardzo bliski!
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Wybra³ nas na œwiadków swojego nadejœcia i kaza³ nam szerzyæ jego s³owa w ca³ej Kolonii.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Zatem s³uchaj: ka¿dy, kto stanie po jego stronie zostanie zbawiony, ale ci, którzy siê mu sprzeciwi¹, ponios¹ surow¹ karê.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ale Œni¹cy jest mi³osierny i wszystkim w¹tpi¹cym przysy³a znak swojej potêgi.
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
	description = "Jak bêdzie wygl¹daæ ta droga do wolnoœci?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak bêdzie wygl¹daæ ta droga do wolnoœci?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Przygotowujemy siê do wielkiego przyzwania, w którym wszyscy Nowicjusze zjednocz¹ swoje duchowe si³y.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //W trakcie rytua³u Œni¹cy ujawni nam œwiêt¹ drogê do wolnoœci.
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
	description = "W jaki sposób wasz bóg udowodni³ swoj¹ potêgê?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //W jaki sposób wasz bóg udowodni³ swoj¹ potêgê?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Przemawiaj¹c do nas za poœrednictwem wizji. Kto raz us³yszy jego g³os, ju¿ nigdy nie zb³¹dzi na œcie¿kê z³a.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Za¿yj rosn¹ce na bagnach ziele, a zbli¿ysz siê do Œni¹cego i bêdziesz móg³ us³yszeæ jego s³owa. Niektórym wybrañcom zdarzy³o siê go nawet zobaczyæ!
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
	description = "Jak mogê dotrzeæ do Obozu Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak mogê dotrzeæ do Obozu Bractwa?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Jestem teraz zajêty, ale Baal Parvez powinien przebywaæ jeszcze w tym obozie.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Znajdziesz go gdzieœ w pobli¿u targowiska, po drugiej stronie zamku. Zdajê siê, ¿e ma tam nawet w³asn¹ chatê!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi, "Nowicjusz imieniem Baal Parvez mo¿e mnie zaprowadziæ do obozu na bagnie. Znajdê go na targowisku, za zamkiem Starego Obozu.");
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
	description = "Muszê siê dostaæ do zamku. Móg³byœ mi pomóc?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Muszê siê dostaæ do zamku. Móg³byœ mi pomóc?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obawiam siê, ¿e nie. Tylko bracia dostarczaj¹cy Gomezowi ziele maj¹ wstêp do zamku.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Zbieramy bagienne ziele, i czêœæ zbiorów sprzedajemy do Starego Obozu w zamian za ró¿ne dobra z Zewnêtrznego Œwiata.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Gdybyœ by³ jednym z kurierów pracuj¹cych dla Cor Kaloma, móg³byœ dostaæ siê do zamku. Oczywiœcie musia³byœ najpierw przyst¹piæ do Bractwa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A czego, jeœli wolno spytaæ, chcesz szukaæ w zamku?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Muszê siê tam z kimœ spotkaæ."						,DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mam list do Arcymistrza Magów Ognia."	,DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Muszê siê tam z kimœ spotkaæ.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Naprawdê? A z kim? Nie móg³byœ po prostu zaczekaæ, a¿ do ciebie wyjdzie?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To jeden z magów."	,DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Czy¿by? A sk¹d go masz? Mo¿e dosta³eœ go od jednego z magów zanim ciê tu wrzucono?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jesteœ g³upcem, rozpowiadaj¹c o tym na lewo i prawo, ale nie obawiaj siê - nikomu o tym nie powiem.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Jednak na twoim miejscu trzyma³bym jêzyk za zêbami. Za coœ takiego wiêkszoœæ ludzi bez wahania poder¿nê³aby ci gard³o.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Nagroda, jak¹ otrzymuj¹ pos³añcy za dostarczenie wiadomoœci z Zewnêtrznego Œwiata, jest niezwykle cenna.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Baal Taran z Obozu Bractwa powiedzia³ mi, ¿e do zamku mog¹ wejœæ wys³annicy Cor Kaloma, w celach handlu z Magnatami. Mo¿e powinienem do nich do³¹czyæ?");
	};
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //To jeden z magów.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Có¿, obawiam siê, ¿e oni nigdy nie opuszczaj¹ zamku. Rzeczywiœcie, musia³byœ dostaæ siê do œrodka.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //A czego od nich chcesz? Magicznych run? A mo¿e napojów?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"W³aœnie tak!"				,DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nie twoja sprawa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobrze, jak sobie ¿yczysz.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //W³aœnie tak!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wiedzia³em! Czegó¿ innego ktoœ taki jak ty móg³by chcieæ od maga.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Dam ci dobr¹ radê: daruj sobie tych ca³ych magów. Ceny, których ¿¹daj¹ za swoje zabawki s¹ niezwykle wygórowane.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Runy i napoje dostaniesz równie¿ w naszym obozie i to za po³owê ceny!
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
   description	= "Szukam zajêcia.";
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
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_01"); //Szukam zajêcia.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_02"); //W sumie to mia³bym dla ciebie ma³¹ robótkê. Zadanie wymaga trochê pomys³owoœci.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_03"); //Co mia³bym zrobiæ? 
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_04"); //Mia³byœ namówiæ kilku mieszkañców Obozu do palenia ziela. Z pewnych Ÿróde³ dowiedzia³em siê, ¿e kowal Huno w przesz³oœci by³ uzale¿niony od palenia.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_05"); //Jednak przesta³ paliæ od czasu, kiedy trafi³ do Kolonii.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_06"); //Taki æpun to dla mnie niez³y rynek zbytu ziela. Spróbuj jakoœ wcisn¹æ mu jednego skrêta. Dalej powinno byæ ju¿ z górki.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_07"); //A pozosta³e osoby?
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_08"); //Mam na oku jeszcze dwóch potencjalnych klientów. S¹ to: Gravo i Szakal.
    AI_Output (other, self ,"DIA_BaalTaran_JOB_15_09"); //Postaram siê jakoœ ich przekonaæ.
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_10"); //Zaczekaj. Dam ci specjalne ziele o nieco mocniejszym dzia³aniu. 
    AI_Output (self, other ,"DIA_BaalTaran_JOB_03_11"); //Proszê. Teraz mo¿esz zaczynaæ.
    MIS_Druggy = LOG_RUNNING;
	CreateInvItems (self, RecruitJoint, 3);
    B_GiveInvItems (self, other, RecruitJoint, 3);
    CreateInvItems (self, ItMiJoint_1, 2);
    B_GiveInvItems (self, other, ItMiJoint_1, 2);
	CreateInvItems (self, ItMiJoint_2, 2);
    B_GiveInvItems (self, other, ItMiJoint_2, 2);
	CreateInvItems (self, ItMiJoint_3, 1);
    B_GiveInvItems (self, other, ItMiJoint_3, 1);
	Huno_drugs_level = 0;
    Log_CreateTopic            (CH1_Druggy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Druggy, LOG_RUNNING);
    B_LogEntry                     (CH1_Druggy,"Baal Taran zleci³ mi zdobycie mu nowych klientów. W tym celu muszê obudziæ stary na³óg w Huno, oraz namówiæ Gravo i Szakala do palenia.");
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
    if (MIS_Druggy == LOG_RUNNING)
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
        AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_03"); //Uda³o mi siê zmusiæ go do zapalenia jednego skrêta. Myœlê, ¿e wkrótce bêdzie przychodzi³ czêœciej.
        AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_04"); //To siê dopiero oka¿e. Oto twoja nagroda.
        CreateInvItems (self, ItMiNugget, 30);
        B_GiveInvItems (self, other, ItMiNugget, 30);
    }
    else if (Huno_drugs_level == 2)
    {
        AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_05"); //Huno nieŸle siê wci¹gn¹³ w to ca³e palenie. Obudzi³em w nim stare nawyki.
        AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_06"); //Bardzo dobrze. Wkrótce kolejny dureñ bêdzie kupowa³ ziele kilogramami.
    CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
}
else if (Huno_drugs_level == 3)
{
    AI_Output (other, self ,"DIA_BaalTaran_HUNO_SYTUACJA_15_07"); //Huno powróci³ do na³ogu. Myœlê, ¿e uda ci siê na nim sporo zarobiæ.
    AI_Output (self, other ,"DIA_BaalTaran_HUNO_SYTUACJA_03_08"); //Dobre wieœci. Nale¿y ci siê 100 bry³ek rudy za tê wiadomoœæ. Dobra robota.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
};
//B_LogEntry                     (CH1_Druggy,"No dobra, sprawê z Huno mam ju¿ za³atwion¹.");

//B_GiveXP (200);
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
   description	= "Mo¿esz mi coœ poradziæ jak przekonaæ Gravo?";
};

FUNC INT DIA_BaalTaran_GRAVO_PALACZ_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Gravo_pali == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_GRAVO_PALACZ_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_PALACZ_15_01"); //Mo¿esz mi coœ poradziæ jak przekonaæ Gravo?
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_02"); //Ponoæ ten goœæ lubi wymyœlne smaki. Spróbuj z ró¿nymi rodzajami tytoniu. Mo¿esz je kupiæ w Bractwie.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_03"); //Spróbuj zrobiæ skrêta o specjalnym smaku. Je¿eli nie znasz siê na alchemii, to pogadaj z goœciem imieniem Claw. Mieszka w obozie myœliwych.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_PALACZ_03_04"); //Naprawdê zna siê na rzeczy.
    B_LogEntry                     (CH1_Druggy,"Gravo szuka jointa o specyficznym smaku. Powinienem coœ pokombinowaæ na stole alchemicznym. ");
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
   description	= "Gravo bêdzie twoim nowym klientem.";
};

FUNC INT DIA_BaalTaran_GRAVO_END_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Gravo_pali == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_GRAVO_END_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_END_15_01"); //Gravo bêdzie twoim nowym klientem.
    AI_Output (self, other ,"DIA_BaalTaran_GRAVO_END_03_02"); //Dobra robota. Czym go przyci¹gn¹³eœ?
    AI_Output (other, self ,"DIA_BaalTaran_GRAVO_END_15_03"); //Miodowym skrêtem. Bardzo przypad³ mu do gustu.
    //B_givexp (150);
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
    if (MIS_Druggy == LOG_RUNNING)
    && (Jackal_pali == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_SZAKAL_PALI_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_01"); //Co do Szakala...
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_02"); //Musia³em spuœciæ nieco cenê, aby chcia³ w ogóle do ciebie zajrzeæ.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_03"); //O ile dok³adnie j¹ zmniejszy³eœ?
    if (jackal_ore  == 1)
    {
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_04"); //O jedn¹ bry³kê rudy. Nie by³ zachwycony, ale od czasu do czasu coœ u ciebie kupi.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_05"); //Dobre i to.
    B_LogEntry                     (CH1_Druggy,"Zmniejszy³em Szakalowi cenê o jedn¹ bry³kê. Myœlê, ¿e mog³em opuœciæ ciut wiêcej. Mo¿e by³by bardziej chêtny do zakupu.");

    CreateInvItems (self, ItMiNugget, 40);
    B_GiveInvItems (self, other, ItMiNugget, 40);
    //B_GiveXP (22);
    }
    else if (jackal_ore == 2)
    {
    AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_06"); //Zmieni³em cenê o dwie bry³ki rudy. Szakal by³ zadowolony. Bêdzie tu czêsto zagl¹da³.
    AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_07"); //Œwietnie. Przy okazji sporo nie stracê na tej obni¿ce.
	B_LogEntry                     (CH1_Druggy,"Zmniejszy³em Szakalowi cenê za skrêta o 2 bry³ki. Baal Taran powiedzia³, ¿e to ca³kiem op³acalna decyzja. ");
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);

    B_GiveXP (50);

    }
    else if (jackal_ore == 5)
    {
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_08"); //Zmniejszy³em cenê o piêæ bry³ek rudy.
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_09"); //O ILE?
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_10"); //Czy ty do reszty zg³upia³eœ? Przecie¿ bêdê na tym stratny!
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_11"); //Ale Szakal zapewni³, ¿e zakupi du¿¹ iloœæ...
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_12"); //W dupie mam jego zapewnienie. Wykona³eœ robotê, ale gorzej siê nie da³o tego spapraæ...
        AI_Output (other, self ,"DIA_BaalTaran_SZAKAL_PALI_15_13"); //Potr¹cisz mi z wyp³aty.
        AI_Output (self, other ,"DIA_BaalTaran_SZAKAL_PALI_03_14"); //Jakiej wyp³aty? Nic za niego nie dostaniesz!
        B_LogEntry                     (CH1_Druggy,"Baal Taran by³ nieŸle wkurzony, ¿e zmniejszy³em cenê za skrêta a¿ o 5 bry³ek.");
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
   description	= "Zrobi³em ju¿ chyba wszystko.";
};

FUNC INT DIA_BaalTaran_END_WORK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalTaran_SZAKAL_PALI))
    && (Npc_KnowsInfo (hero, DIA_BaalTaran_GRAVO_END))
    && (Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA))
    && (MIS_Druggy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTaran_END_WORK_Info()
{
    AI_Output (other, self ,"DIA_BaalTaran_END_WORK_15_01"); //Zrobi³em ju¿ chyba wszystko.
    AI_Output (self, other ,"DIA_BaalTaran_END_WORK_03_02"); //Masz racjê. Dziêki za pomoc. Masz tu coœ za fatygê.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    CreateInvItems (self, ItMiJoint_3, 5);
    B_GiveInvItems (self, other, ItMiJoint_3, 5);
    B_LogEntry                     (CH1_Druggy,"Przekona³em wszystkie trzy osoby do palenia. Baal Taran nieŸle mnie za to wynagrodzi³.");
    Log_SetTopicStatus       (CH1_Druggy, LOG_SUCCESS);
    MIS_Druggy = LOG_SUCCESS;

    B_GiveXP (300);
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
    AI_Output (self, other ,"DIA_BaalTaran_FOCH_FOREVER_03_01"); //Ty idioto! Co narobi³eœ? Przez ciebie mam teraz k³opoty!
    AI_Output (self, other ,"DIA_BaalTaran_FOCH_FOREVER_03_02"); //WYNOŒ SIÊ ST¥D!
    AI_StopProcessInfos	(self);
};

