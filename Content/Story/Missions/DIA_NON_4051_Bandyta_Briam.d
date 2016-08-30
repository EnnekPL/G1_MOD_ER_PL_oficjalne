//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_BandytaBriam_EXIT(C_INFO)
{
	npc             = NON_4051_Bandyta;
	nr              = 999;
	condition	= DIA_BandytaBriam_EXIT_Condition;
	information	= DIA_BandytaBriam_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_BandytaBriam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BandytaBriam_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� -
// Dialogi og�lne, handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Bandyta_WhoYou (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_WhoYou_Condition;
   information  = DIA_Bandyta_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Bandyta_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_02"); //Nazywam si� Briam, jestem alchemikiem.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_03"); //Przyrz�dzam mikstury, eksperymentuj� z zielem.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_04"); //No i oczywi�cie skr�cam �odygi i destyluj� gorza�k�.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_05"); //To chyba najwa�niejsza robota w Obozie. Bandyci lubi� pi� i pali�.
    //AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_06"); //Wszystkim si� dzielimy.
    AI_Output (other, self ,"DIA_Bandyta_WhoYou_15_07"); //M�g�by� nauczy� mnie alchemii?
	AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_08"); //My�l�, �e za odpowiedni� op�at�... czemu nie?
	//log
	Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
	B_LogEntry			(GE_TeacherBAN,"Briam nauczy mnie alchemii. Znajd� go w jaskini w Obozie Bandyt�w.");
};

//========================================
//-----------------> LifeInCamp
//========================================

INSTANCE DIA_Bandyta_LifeInCamp (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_LifeInCamp_Condition;
   information  = DIA_Bandyta_LifeInCamp_Info;
   permanent	= FALSE;
   description	= "Jak ci si� tu �yje?";
};

FUNC INT DIA_Bandyta_LifeInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Bandyta_LifeInCamp_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_LifeInCamp_15_01"); //Jak ci si� tu �yje?
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_02"); //Nie jest �le. Ka�dy zajmuje si� swoj� robot� i nie wchodzi innym w drog�.
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_03"); //Quentin dobrze zarz�dza Obozem i sprawiedliwie dzieli rud�.
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_04"); //Zobaczysz, wkr�tce si� st�d wyrwiemy i sprzedamy rud� za z�oto.
};

//========================================
//-----------------> WorkInCamp
//========================================

INSTANCE DIA_Bandyta_WorkInCamp (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_WorkInCamp_Condition;
   information  = DIA_Bandyta_WorkInCamp_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o waszej organizacji pracy.";
};

FUNC INT DIA_Bandyta_WorkInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_WorkInCamp_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WorkInCamp_15_01"); //Opowiedz mi o waszej organizacji pracy.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_03"); //To proste. Ka�dy ma wyznaczone jakie� zadanie.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_04"); //Wi�kszo�� Bandyt�w pracuje na rzecz Obozu, a cz�� wykonuje swoj� robot� na zewn�trz.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_05"); //Dzi�ki temu mamy jedzenie, w�dk� i przedmioty potrzebne do przetrwania
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_06"); //Od czasu do czasu przychodzi tu jaki� wys�annik z innego obozu.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_07"); //Zazwyczaj prosz� nas o wykonanie jakiego� zadania, na kt�re szkoda im w�asnych ludzi.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_08"); //Po prostu najmujemy si� do trudnych zada�.
    AI_Output (other, self ,"DIA_Bandyta_WorkInCamp_15_09"); //Czy inne obozy wami gardz�? Tak mam to rozumie�?
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_10"); //Niby tak, ale czasem zarabiamy po kilka tysi�cy bry�ek. Szczeg�lnie dobrze p�ac� Guru.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_11"); //Oczywi�cie, je�eli uda nam si� prze�y�.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_12"); //Najcz�ciej jednak wysy�amy do�wiadczonych ludzi takich jak Rocky, Doyle czy Martin.
};

//========================================
//-----------------> TRADE
//========================================
var int know_briam_sell;
INSTANCE DIA_Bandyta_TRADE (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_TRADE_Condition;
   information  = DIA_Bandyta_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Bandyta_TRADE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE; };
};

FUNC VOID DIA_Bandyta_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TRADE_15_01"); //Chc� co� kupi�.
    AI_Output (self, other ,"DIA_Bandyta_TRADE_03_02"); //Wybierz sobie.
	if know_briam_sell == false
	{
	know_briam_sell = true;
	Log_CreateTopic	(GE_Bandit,	LOG_NOTE);//fix
	B_LogEntry		(GE_Bandit,	"Briam handluje r�nymi przedmiotami zwi�zanymi z alchemi�.");
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Bandyta_RAYAN (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_RAYAN_Condition;
   information  = DIA_Bandyta_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o �mierci Rayana?";
};

FUNC INT DIA_Bandyta_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_01"); //Wiesz co� o �mierci Rayana?
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_02"); //W�a�nie mia�em i�� pogada� na ten temat z Jensem. To prawda, �e Kereth co� kombinuje? 
	AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_03"); //Tak. Masz jakie� u�ytecznie informacje.
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_04"); //Chyba mam. Wcze�niej wydawa�y mi si� niewa�ne, ale w �wietle tego co si� dzieje mog� by� kluczowe.
	AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_05"); //Zamieniam si� w s�uch.
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_06"); //Widzia�em jak Kereth chowa� do skrzyni miecz Jensa. To by�o p�nym wieczorem. Wraca� sk�d�. Na pocz�tku my�la�em, �e po prostu odkupi� t� bro�. 
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_07"); //No, ale skoro s� skonfliktowani...
    AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_08"); //Wychodzi�oby na to, �e Kereth sam rujnuje gr�b swojego brata, �eby wykurzy� Jensa z Obozu. 
	AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_09"); //Kawa� sukinsyna z niego. Lepiej szybko naprostujcie t� spraw�. 
	
	B_LogEntry     (CH1_DestroyedGrave,"Briam przedstawi� do�� wa�n� spraw�. Twierdzi, �e widzia� jak Kereth p�n� noc� chowa do swojej skrzyni miecz Jensa.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Dostwy
//========================================

INSTANCE DIA_Bandyta_Dostwy (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Dostwy_Condition;
   information  = DIA_Bandyta_Dostwy_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po dostawy.";
};

FUNC INT DIA_Bandyta_Dostwy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_UkonczonoSellAlco)) && (devmode_dostawyalkoholu == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Dostwy_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Dostwy_15_01"); //Przyszed�em po dostawy.
    AI_Output (self, other ,"DIA_Bandyta_Dostwy_03_02"); //Roznie� to osobom, z kt�rymi si� dogada�e�.
    MIS_Dostawy = LOG_RUNNING;

    Log_CreateTopic          (CH1_Dostawy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Dostawy, LOG_RUNNING);
    B_LogEntry                     (CH1_Dostawy,"Briam kaza� mi roznie�� dostawy alkoholu do oboz�w. Alkohol ma trafi� do karczmarzy, z kt�rymi wcze�niej nawi�za�em wsp�prac�. ");
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol))
    {
    CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 30);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 30);
	}
	else
	{
	CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 20);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 20);
	};
    AI_Output (self, other ,"DIA_Bandyta_Dostwy_03_03"); //Po dziesi�� flaszek dla ka�dego karczmarza. 
    AI_StopProcessInfos	(self);
};

var int dostawa1;//NO
var int dostawa2;//PSI
var int dostawa3;//SO

//========================================
//-----------------> DostawaNO
//========================================

INSTANCE DIA_Bandyta_DostawaNO (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaNO_Condition;
   information  = DIA_Bandyta_DostawaNO_Info;
   permanent	= FALSE;
   description	= "Dostarczy�em towar Mazinowi.";
};

FUNC INT DIA_Bandyta_DostawaNO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mazin_Dostawczak)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaNO_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaNO_15_01"); //Dostarczy�em towar Mazinowi.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa1 = 1;
};

//========================================
//-----------------> DostawaPSI
//========================================

INSTANCE DIA_Bandyta_DostawaPSI (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaPSI_Condition;
   information  = DIA_Bandyta_DostawaPSI_Info;
   permanent	= FALSE;
   description	= "Ghoran otrzyma� alkohol.";
};

FUNC INT DIA_Bandyta_DostawaPSI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_FirstDostawa)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaPSI_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaPSI_15_01"); //Ghoran otrzyma� alkohol.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa2 = 1;
};

//========================================
//-----------------> DostawaSO
//========================================

INSTANCE DIA_Bandyta_DostawaSO (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaSO_Condition;
   information  = DIA_Bandyta_DostawaSO_Info;
   permanent	= FALSE;
   description	= "Karczmarz ze Starego Obozu otrzyma� dostaw�.";
};

FUNC INT DIA_Bandyta_DostawaSO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_DostwaOC)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaSO_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaSO_15_01"); //Karczmarz ze Starego Obozu otrzyma� dostaw�.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa3 = 1;
};

//========================================
//-----------------> DostawaALL
//========================================

INSTANCE DIA_Bandyta_DostawaALL (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaALL_Condition;
   information  = DIA_Bandyta_DostawaALL_Info;
   permanent	= FALSE;
   description	= "Uda�o mi si� zanie�� wszystkim karczmarzom alkohol.";
};

FUNC INT DIA_Bandyta_DostawaALL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaNO)) && (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaSO)) && (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaPSI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaALL_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaALL_15_01"); //Uda�o mi si� zanie�� wszystkim karczmarzom alkohol.
    AI_Output (self, other ,"DIA_Bandyta_DostawaALL_15_02"); //No, to teraz masz troch� wolnego. We� te piwka w nagrod�.
		
	B_LogEntry    (CH1_Dostawy,"Zanios�em wszystkim dostawy alkoholu. Moja robota dobieg�a ko�ca.");
	Log_SetTopicStatus       (CH1_Dostawy, LOG_SUCCESS);
	MIS_Dostawy = LOG_SUCCESS;
	B_GiveXP (150);
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//========================================
//-----------------> Przepisek
//========================================

INSTANCE DIA_Bandyta_Przepisek (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Przepisek_Condition;
   information  = DIA_Bandyta_Przepisek_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie przepis.";
};

FUNC INT DIA_Bandyta_Przepisek_Condition()
{
    if (Npc_HasItems (other, ReceptaNowicjuszy) >=1)
    && (Npc_KnowsInfo (hero, DIA_Jens_DobraRobota))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Przepisek_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Przepisek_15_01"); //Mam dla ciebie przepis.
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_02"); //Ten od Jensa?
    AI_Output (other, self ,"DIA_Bandyta_Przepisek_15_03"); //Tak. Rozmawia�e� ju� z nim?
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_04"); //Taa... Ju� si� pochwali�. 
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_05"); //Daj mi ten przepis. Zobaczymy co z tego b�dzie.
    B_GiveInvItems (other, self, ReceptaNowicjuszy, 1);
    B_LogEntry               (CH1_NoweZiele2BAU,"Odnios�em receptur� Briamowi zgodnie z poleceniem. Pora czeka� na efekty.");
    Log_SetTopicStatus       (CH1_NoweZiele2BAU, LOG_SUCCESS);
    MIS_NoweZiele2BAU = LOG_SUCCESS;

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pensja
//========================================

INSTANCE DIA_Bandyta_Pensja (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_Pensja_Condition;
   information  = DIA_Bandyta_Pensja_Info;
   permanent	= FALSE;
   description	= "Kiedy mam si� zg�asza� po swoj� dzia�k�?";
};

FUNC INT DIA_Bandyta_Pensja_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Przepisek))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Pensja_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Pensja_15_01"); //Kiedy mam si� zg�asza� po swoj� dzia�k�?
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_02"); //Chwila, chwila. Najpierw musisz znale�� kupca na ziele. Dopiero wtedy b�dziemy mogli my�le� o zyskach.
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_03"); //To musi by� kto�, kto ma du�y utarg. Popytaj handlarzy, a mo�e kto� ci wpadnie w r�ce. 
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_04"); //Daruj sobie wycieczk� do Sekty. To z g�ry skazane na pora�k�.
    MIS_NoweZiele3BAU = LOG_RUNNING;

    Log_CreateTopic          (CH1_NoweZiele3BAU, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NoweZiele3BAU, LOG_RUNNING);
    B_LogEntry               (CH1_NoweZiele3BAU,"Okazuje si�, �e receptura, kt�r� przynios�em nie wystarczy do osi�gni�cia zysk�w. Aby zarabia� na zielu, musimy mie� je komu sprzeda�. Mam znale�� jakiego� kupca na nasz towar. Briam od razu odradzi� mi udanie si� do obozu Bractwa �ni�cego. Powinienem zapyta� w Nowym lub Starym Obozie. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KupiecSS
//========================================

INSTANCE DIA_Bandyta_KupiecSS (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_KupiecSS_Condition;
   information  = DIA_Bandyta_KupiecSS_Info;
   permanent	= FALSE;
   description	= "Za�atwi�em kupca.";
};

FUNC INT DIA_Bandyta_KupiecSS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_MocneZiele2))
    && (MIS_NoweZiele3BAU == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KupiecSS_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_01"); //Za�atwi�em kupca. To handlarz Dexter ze Starego Obozu.
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_02"); //Du�o handluje z Nowicjuszami. Zna si� na zielu.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_03"); //Dobra robota. Zabieram si� za produkcj�.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_04"); //Kwestie wyp�aty reguluj z Jensem. To nie moja sprawa.
    B_LogEntry                     (CH1_NoweZiele3BAU,"Zg�osi�em Braimowi, �e b�dziemy teraz wsp�pracowa� z Dexterem. Po wyp�at� mog� zg�asza� si� do Jensa.");
    Log_SetTopicStatus       (CH1_NoweZiele3BAU, LOG_SUCCESS);
    MIS_NoweZiele3BAU = LOG_SUCCESS;
	//experience
    B_GiveXP (200);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 4
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FreePotions
//========================================

INSTANCE DIA_Bandyta_FreePotions (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_FreePotions_Condition;
   information  = DIA_Bandyta_FreePotions_Info;
   permanent	= FALSE;
   description	= "Quentin przys�a� mnie po eliksiry.";
};

FUNC INT DIA_Bandyta_FreePotions_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_FreePotions_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FreePotions_15_01"); //Quentin przys�a� mnie po eliksiry.
    AI_Output (self, other ,"DIA_Bandyta_FreePotions_03_02"); //Mam tu co� dla ciebie. Powodzenia.
	//log
	B_LogEntry     (CH1_RozwalaUBnadytow,"Wzi��em od Briama eliksiry.");
	//items
	B_GiveInvItems (self,hero, ItFo_Potion_Health_02, 5);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� -
// Nauka alchemii
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2 (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_Bandyta_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_Bandyta_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_L2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_L2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To z czym b�dziesz mia� do czynienia to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_Bandyta_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_Bandyta_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� -
// Stuff
///////////////////////////////////////////////////////////////////////////////////////////

/*

//========================================
//-----------------> Zanisione
//========================================

INSTANCE DIA_Bandyta_Zanisione (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Zanisione_Condition;
   information  = DIA_Bandyta_Zanisione_Info;
   permanent	= true;
   description	= "Co do mojego zadania...";
};

FUNC INT DIA_Bandyta_Zanisione_Condition()
{
    if (MIS_Dostawy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Zanisione_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_01"); //Co do mojego zadania...
    AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_02"); //S�ucham.
		//*******
		if (Npc_KnowsInfo (hero, DIA_Ghoran_FirstDostawa))
		{
        dostawa1 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_03"); //Zanios�em alkohol do Bractwa.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_04"); //�wietnie.
		}
		else
		{
		dostawa1 = false;
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_09"); //Zanios�e� do Bractwa?
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_10"); //Jeszcze nie.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_11"); //W takim razie id�.
		DIA_Bandyta_Zanisione.permanent = true;
		};
		//*******
    if (Npc_KnowsInfo (hero, DIA_Mazin_Dostawczak))
    {
		dostawa2 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_05"); //Dostarczy�em towar do Nowego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_06"); //Dobra robota.
	}
    else
    {
		dostawa2 = false;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_13"); //Musz� jeszcze i�� do Nowego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_14"); //W takim razie id�.	
		DIA_Bandyta_Zanisione.permanent = true;
    };
		//********
		if (Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol)) &&  (Npc_KnowsInfo (hero, DIA_Karczmarz_DostwaOC)) 
		{
		dostawa3 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_07"); //Zanios�em alkohol do Starego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_15_08"); //Dobrze.
		}
		else
		{
		AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_09"); //Jeszcze nie by�em w Starym Obozie.
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_10"); //Id� wi�c szybko.
		DIA_Bandyta_Zanisione.permanent = true;
		dostawa3 = false;
		};
    
	/*
	WTF?????!!!
    if (!Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol)) &&  (dostawa1 == true) && (dostawa2 == true)
    {
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_07"); //To ju� chyba wszystko.
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_08"); //Dobra robota. 
		MIS_Dostawy = LOG_SUCCESS;
		B_GiveXP (300);

    };

*/
/*
	var int alldostawy;
	if (dostawa1 == true) && (dostawa2 == true) 
	{
	alldostawy = true;
	};
	
		if (alldostawy == true)
		{
	    AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_22"); //To ju� chyba wszystko.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_15_23"); //Dobra robota. 
		Log_SetTopicStatus       (CH1_Dostawy, LOG_SUCCESS);
		MIS_Dostawy = LOG_SUCCESS;
		B_GiveXP (150);
		DIA_Bandyta_Zanisione.permanent = false;
		};
};
*/

/*
//========================================
//-----------------> Odtrutka
//========================================

INSTANCE DIA_Bandyta_Odtrutka (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Odtrutka_Condition;
   information  = DIA_Bandyta_Odtrutka_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� odtrutki.";
};

FUNC INT DIA_Bandyta_Odtrutka_Condition()
{
    if (MIS_lekiDlaAva == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Odtrutka_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_01"); //Potrzebuj� odtrutki.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_02"); //A co si� sta�o?
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_03"); //Jeden z �owc�w Poszukiwaczy zosta� trafiony truj�cym be�tem.
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_04"); //Umrze, je�eli mu nie pomog�.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_05"); //M�g�bym ci uwarzy� t� mikstur�, ale potrzebuj� przepisu.
    B_LogEntry                     (CH1_lekiDlaAva,"Briam uwarzy dla mnie mikstur� je�eli przynios� mu receptur�.");
};

//========================================
//-----------------> Rezepte
//========================================

INSTANCE DIA_Bandyta_Rezepte (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_Rezepte_Condition;
   information  = DIA_Bandyta_Rezepte_Info;
   permanent	= FALSE;
   description	= "Mam receptur�.";
};

FUNC INT DIA_Bandyta_Rezepte_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Odtrutka))
    && (Npc_HasItems (other, Receptura_LekAva) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Rezepte_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Rezepte_15_01"); //Mam receptur�.
    AI_Output (self, other ,"DIA_Bandyta_Rezepte_03_02"); //Dobra. Daj mi j�. Zaraz ci przyrz�dz�.
    B_LogEntry                     (CH1_lekiDlaAva,"Przynios�em receptur� Briamowi. Zaraz dostan� mikstur�.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveLeki
//========================================

INSTANCE DIA_Bandyta_GiveLeki (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_GiveLeki_Condition;
   information  = DIA_Bandyta_GiveLeki_Info;
   permanent	= FALSE;
   description	= "Daj mi to lekarstwo.";
};

FUNC INT DIA_Bandyta_GiveLeki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Rezepte))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_GiveLeki_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_GiveLeki_15_01"); //Daj mi to lekarstwo.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_02"); //Oto ono.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_03"); //Powodzenia.
    CreateInvItems (self, LekAva, 1);
    B_GiveInvItems (self, other, LekAva, 1);
    AI_StopProcessInfos	(self);
};
*/