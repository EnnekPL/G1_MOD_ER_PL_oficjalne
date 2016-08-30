//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Abel_EXIT(C_INFO)
{
	npc         = VLK_7003_Abel;
	nr          = 999;
	condition	= DIA_Abel_EXIT_Condition;
	information	= DIA_Abel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Abel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Abel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Abel_HELLO (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 1;
   condition    = DIA_Abel_HELLO_Condition;
   information  = DIA_Abel_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Abel_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Abel_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Abel_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_02"); //Nazywam si� Abel. Jestem tutaj robotnikiem.
    AI_Output (other, self ,"DIA_Abel_HELLO_15_03"); //Chyba nie bardzo ci si� widzi ta praca, co?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_04"); //Niestety jestem tu z przymusu. Zosta�em schwytany i skazany na roboty.
    AI_Output (other, self ,"DIA_Abel_HELLO_15_05"); //Co takiego zrobi�e�?
    AI_Output (self, other ,"DIA_Abel_HELLO_03_06"); //Kontaktowa�em si� z Bandytami.
};

//========================================
//-----------------> ALCHEMY
//========================================

INSTANCE DIA_Abel_ALCHEMY (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_ALCHEMY_Condition;
   information  = DIA_Abel_ALCHEMY_Info;
   permanent	= FALSE;
   description	= "Znasz si� na alchemii?";
};

FUNC INT DIA_Abel_ALCHEMY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Abel_ALCHEMY_Info()
{
    AI_Output (other, self ,"DIA_Abel_ALCHEMY_15_01"); //Znasz si� na alchemii?
    AI_Output (self, other ,"DIA_Abel_ALCHEMY_03_02"); //Troch�. Jednak nie potrafi�bym niczego ci� nauczy�.
};

//========================================
//-----------------> TRUTKA
//========================================

INSTANCE DIA_Abel_TRUTKA (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 3;
   condition    = DIA_Abel_TRUTKA_Condition;
   information  = DIA_Abel_TRUTKA_Info;
   permanent	= FALSE;
   description	= "Potrafisz przygotowa� trucizn�?";
};

FUNC INT DIA_Abel_TRUTKA_Condition()
{
    if (MIS_TrutkaOM == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Abel_ALCHEMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_TRUTKA_Info()
{
    AI_Output (other, self ,"DIA_Abel_TRUTKA_15_01"); //Potrafisz przygotowa� trucizn�?
    AI_Output (self, other ,"DIA_Abel_TRUTKA_03_02"); //Trucizn� powiadasz? Znam jeden przepis na s�ab� trucizn�, ale musisz mi przynie�� sk�adniki.
    AI_Output (self, other ,"DIA_Abel_TRUTKA_03_03"); //Przypuszczam, �e m�g�by� j� te� kupi� w Bractwie, albo u jakiego� handlarza, kt�ry ma kontakty z magami.
};

//========================================
//-----------------> CREATE
//========================================

INSTANCE DIA_Abel_CREATE (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 4;
   condition    = DIA_Abel_CREATE_Condition;
   information  = DIA_Abel_CREATE_Info;
   permanent	= FALSE;
   description	= "Chc� �eby� to ty mi j� przygotowa�.";
};

FUNC INT DIA_Abel_CREATE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_TRUTKA))
    && (MIS_TrutkaOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_CREATE_Info()
{
    AI_Output (other, self ,"DIA_Abel_CREATE_15_01"); //Chc� �eby� to ty mi j� przygotowa�.
    AI_Output (self, other ,"DIA_Abel_CREATE_03_02"); //No dobrze. Przynie� mi wi�c: butelk� wody, krucze ziele, bagienne ziele i jedno piwo.
    AI_Output (other, self ,"DIA_Abel_CREATE_15_03"); //Po co ci piwo?
    AI_Output (self, other ,"DIA_Abel_CREATE_03_04"); //Chc� si� napi�. He he.
    MIS_MiksturaTrujacaOM = LOG_RUNNING;

    Log_CreateTopic          (CH1_MiksturaTrujacaOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MiksturaTrujacaOM, LOG_RUNNING);
    B_LogEntry               (CH1_MiksturaTrujacaOM,"Abel przygotuje dla mnie truj�c� mikstur�, je�eli dostanie: butelk� wody, krucze ziele, bagienne ziele i jedno piwo.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUEST_OK
//========================================

INSTANCE DIA_Abel_QUEST_OK (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 5;
   condition    = DIA_Abel_QUEST_OK_Condition;
   information  = DIA_Abel_QUEST_OK_Info;
   permanent	= FALSE;
   description	= "Mam twoje sk�adniki.";
};

FUNC INT DIA_Abel_QUEST_OK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_CREATE))
    && (MIS_MiksturaTrujacaOM == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoBeer) >=1)
    && (Npc_HasItems (other, ItFo_Plants_RavenHerb_01) >=1)
    && (Npc_HasItems (other, ItFo_Potion_Water_01) >=1)
    && (Npc_HasItems (other, ItMi_Plants_Swampherb_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_QUEST_OK_Info()
{
    AI_Output (other, self ,"DIA_Abel_QUEST_OK_15_01"); //Mam twoje sk�adniki.
    AI_Output (self, other ,"DIA_Abel_QUEST_OK_03_02"); //To �wietnie. Poczekaj chwilk�.
    B_GiveInvItems (other, self, ItMi_Plants_Swampherb_01, 1);
    B_GiveInvItems (other, self, ItFo_Plants_RavenHerb_01, 1);
    B_GiveInvItems (other, self, ItFo_Potion_Water_01, 1);
    B_GiveInvItems (other, self, ItFoBeer, 1);
    CreateInvItems (self, ItMi_Alchemy_trucizna_01, 1);
    B_GiveInvItems (self, other, ItMi_Alchemy_trucizna_01, 1);
    B_LogEntry               (CH1_MiksturaTrujacaOM,"Zanios�em Ablowi potrzebne sk�adniki. Otrzyma�em s�ab� mikstur� truj�c�.");
    Log_SetTopicStatus       (CH1_MiksturaTrujacaOM, LOG_SUCCESS);
    MIS_MiksturaTrujacaOM = LOG_SUCCESS;

    B_GiveXP (200);
};

//========================================
//-----------------> Wino
//========================================

INSTANCE DIA_Abel_Wino (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 1;
   condition    = DIA_Abel_Wino_Condition;
   information  = DIA_Abel_Wino_Info;
   permanent	= FALSE;
   description	= "Potrafisz produkowa� wino?";
};

FUNC INT DIA_Abel_Wino_Condition()
{
    if (HeroKnowAbelIsWinemaker == true)  && (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_Wino_Info()
{
    AI_Output (other, self ,"DIA_Abel_Wino_15_01"); //Potrafisz produkowa� wino?
    AI_Output (self, other ,"DIA_Abel_Wino_03_02"); //Przez dziewi�� lat pracowa�em w winiarniach Marguniosa, wi�c chyba co� tam potrafi�. Dlaczego pytasz?
    AI_Output (other, self ,"DIA_Abel_Wino_15_03"); //Pewien winiarz z obozu na bagnie poszukuje pomocnika. 
    AI_Output (self, other ,"DIA_Abel_Wino_03_04"); //To wspaniale si� sk�ada, bo Stra�nicy zes�ali mnie tu bez prawa powrotu do obozu i gdybym spr�bowa� ucieczki to Artegor i reszta Stra�nik�w z rado�ci� nafaszerowaliby mnie trzema tuzinami strza�. 
    AI_Output (other, self ,"DIA_Abel_Wino_15_05"); //To rzeczywi�cie by�by k�opot, ale postaram si� co� pokombinowa�. 

    Info_ClearChoices		(DIA_Abel_Wino);
    Info_AddChoice		(DIA_Abel_Wino, "Mo�e da�oby si� przekupi� Artegora lub kt�rego� ze Stra�nik�w? ", DIA_Abel_Wino_Przekupstwo);
    Info_AddChoice		(DIA_Abel_Wino, "Masz jaki� pomys� na ucieczk�?", DIA_Abel_Wino_Ucieczka);
};

FUNC VOID DIA_Abel_Wino_Przekupstwo()
{
    AI_Output (other, self ,"DIA_Abel_Wino_Przekupstwo_15_01"); //Mo�e da�oby si� przekupi� Artegora lub kt�rego� ze Stra�nik�w? 
    AI_Output (self, other ,"DIA_Abel_Wino_Przekupstwo_03_02"); //Zapomnij, Artegor mnie nie znosi. Poza tym nie spuszcza ze mnie oka. Wymy�l lepiej co� innego. 
    AI_Output (other, self ,"DIA_Abel_Wino_Przekupstwo_15_03"); //A pozostali Stra�nicy?
    AI_Output (self, other ,"DIA_Abel_Wino_Przekupstwo_03_04"); //Te� odpadaj�. Boj� si� Artegora. 
};

FUNC VOID DIA_Abel_Wino_Ucieczka()
{
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_01"); //Masz jaki� pomys� na ucieczk�?
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_02"); //Hmmm? Biec przed siebie? 
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_03"); //To mo�e si� uda�.
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_04"); //Czy� ty do reszty oszala�? Zaraz by mnie z�apali.
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_05"); //A gdybym tak przyni�s� ci mikstur�, kt�ra przyspieszy tw�j bieg?
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_06"); //Zapomnia�e�, �e Stra�nicy maj� na plecach kusze? Turniej strzelniczy z nieco bardziej ruchliwym celem? Nie dzi�ki. 
    AI_Output (other, self ,"DIA_Abel_Wino_Ucieczka_15_07"); //Spr�buj� jako� odwr�ci� ich uwag�. 
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_08"); //Zajmij si� go�ciem na wie�y i Artegorem. S� najbli�ej. Ci przesiaduj�cy ko�o kuchni Matta nie stanowi� zagro�enia.
    AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_09"); //Najpewniej zorientuj� si�, gdy ju� b�d� za obozem. Chodzi mi tylko o tych dw�ch, o kt�rych ci wspomnia�em.
	AI_Output (self, other ,"DIA_Abel_Wino_Ucieczka_03_10"); //Ale najpierw przynie� mikstur�. Bez niej nie zaczniemy. Tylko przynie�� najs�absz�, bo nie wiem jak m�j �o��dek poradzi sobie z mocniejszymi. 
    Info_ClearChoices		(DIA_Abel_Wino);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Abel faktycznie zna si� na produkcji wina, jednak nie mo�e opu�ci� obozu. Musz� pom�c mu w ucieczce. Najpierw powinienem przynie�� mu s�ab� mikstur� lekko�ci.");
};

//========================================
//-----------------> PotionGive
//========================================

INSTANCE DIA_Abel_PotionGive (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_PotionGive_Condition;
   information  = DIA_Abel_PotionGive_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie mikstur�.";
};

FUNC INT DIA_Abel_PotionGive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_Wino))
    && (Npc_HasItems (other, ItFo_Potion_Haste_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_PotionGive_Info()
{
    B_GiveInvItems (other, self, ItFo_Potion_Haste_01, 1);
    AI_Output (other, self ,"DIA_Abel_PotionGive_15_01"); //Mam dla ciebie mikstur�.
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_02"); //No dobra. Teraz mo�esz spr�bowa� odwr�ci� uwag� Artegora i tego Stra�nika z wie�y.
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_03"); //Najpierw zajmij si� Stra�nikiem. Zanim zejdzie i tu przyjdzie minie troch� czasu. Potem zaczep Artegora.
    AI_Output (other, self ,"DIA_Abel_PotionGive_15_04"); //Co mam im powiedzie�?
    AI_Output (self, other ,"DIA_Abel_PotionGive_03_05"); //Nie wiem. �e w Starej Kopalni znaleziono podziemn� rzek� czy co�... Tylko, �eby nie by�o zbyt g�upie, bo nikt ci nie uwierzy!
	AI_Output (self, other ,"DIA_Abel_PotionGive_03_06"); //Jak ci si� nie uda oderwa� Artegora od wej�cia to zacznij b�jk� z K�ykaczem. To powinno odwr�ci� jego uwag�.
	
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Musz� jako� odwr�ci� uwag� Stra�nika z wie�y i Artegora. Najpierw powinienem zaj�� si� tym pierwszym. Je�li nie uda mi si� oderwa� Artegora sprzed bramy, to mam wszcz�� b�jk� z K�ykaczem.");
};

//========================================
//-----------------> Win
//========================================

INSTANCE DIA_Abel_Win (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 2;
   condition    = DIA_Abel_Win_Condition;
   information  = DIA_Abel_Win_Info;
   permanent	= FALSE;
   description	= "Widz�, �e ci si� uda�o.";
};

FUNC INT DIA_Abel_Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_PotionGive))
    && (ArtegorIsDistracted == true)
	&& (Npc_GetDistToWP (self, "OW_PATH_266") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_Win_Info()
{
    AI_Output (other, self ,"DIA_Abel_Win_15_01"); //Widz�, �e ci si� uda�o.
    AI_Output (self, other ,"DIA_Abel_Win_03_02"); //Nareszcie z dala od tych wyzyskiwaczy i ciemi�ycieli. Jestem wolny!
	AI_Output (other, self ,"DIA_Abel_Win_15_03"); //No nie do ko�ca... Pami�tasz co mi obieca�e�?
    AI_Output (self, other ,"DIA_Abel_Win_03_03"); //Tak, tak... Pami�tam. Spotkamy si� w Obozie Bractwa.
    AI_Output (other, self ,"DIA_Abel_Win_15_04"); //W porz�dku. Lepiej ju� id�, bo Stra�nicy mog� zacz�� ci� szuka�. Powodzenia.
    AI_Output (self, other ,"DIA_Abel_Win_03_05"); //Jeszcze raz dzi�ki. Powodzenia. 
	
    AI_StopProcessInfos	(VLK_7003_Abel);
	
	Npc_ExchangeRoutine (GRD_7001_Artegor,"start");
	Npc_ExchangeRoutine (NON_3077_Peratur,"start");
	Npc_ExchangeRoutine (VLK_7003_Abel,"PSI");
	
	Mdl_ApplyOverlayMds	(VLK_7003_Abel,"HUMANS_Relaxed.mds");
	
	B_LogEntry			(CH1_GhoransVine, "Abel w jednym kawa�ku zwia� z obozu. Mam si� z nim spotka� w Bractwie. Ciekawe co powie Ghoran na takiego wsp�lnika.");
	B_GiveXP (150);
};
//========================================
//-----------------> UCIECZKA
//========================================

INSTANCE DIA_Abel_UCIECZKA (C_INFO)
{
   npc          = VLK_7003_Abel;
   nr           = 6;
   condition    = DIA_Abel_UCIECZKA_Condition;
   information  = DIA_Abel_UCIECZKA_Info;
   permanent	= FALSE;
   description	= "Uda�o ci si� uciec?";
};

FUNC INT DIA_Abel_UCIECZKA_Condition()
{
    if (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Abel_UCIECZKA_Info()
{
    AI_Output (other, self ,"DIA_Abel_UCIECZKA_15_01"); //Uda�o ci si� uciec?
    AI_Output (self, other ,"DIA_Abel_UCIECZKA_03_02"); //Na szcz�cie tak. Przy Starej Kopalni zrobi�o si� cholernie niebezpiecznie.
    AI_Output (self, other ,"DIA_Abel_UCIECZKA_03_03"); //Wsz�dzie Stra�nicy morduj�cy byle kogo, ci�g�e ataki. Daj spok�j, po prostu musia�em si� stamt�d wydosta�.
};

