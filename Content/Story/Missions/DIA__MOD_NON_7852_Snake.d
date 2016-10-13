//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Snake_EXIT(C_INFO)
{
	npc             = NON_7852_Snake;
	nr              = 999;
	condition		= DIA_Snake_EXIT_Condition;
	information		= DIA_Snake_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Snake_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Snake_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NOWAY
//========================================

INSTANCE DIA_Snake_NOWAY (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 1;
   condition    = DIA_Snake_NOWAY_Condition;
   information  = DIA_Snake_NOWAY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Snake_NOWAY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_BACK_FROM_OC))
    && (MIS_ZabojstwBlizny == LOG_RUNNING)
    && (kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_NOWAY_Info()
{
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_01"); //St�j! Ani kroku dalej! 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_02"); //Zaczekaj. Ty jeste� Snake?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_03"); //Czego chcesz?
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_04"); //Przysy�a mnie Kosa. Mam ci pom�c. 
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_05"); //Cholera, wpad�em w niez�e g�wno. Stra�nicy odci�li mi wcze�niej zaplanowan� drog� ucieczki i m�j plan strzeli� w �eb. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_06"); //Co tutaj si� tak w og�le sta�o? Sk�d tu te cia�a?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_07"); //Prawie mnie nakryli, ale uda�o mi si� ich zabi� zanim wezwali wsparcie. Postanowi�em si� tu zabarykadowa�.
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_08"); //Masz jaki� plan?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_09"); //Tak, mam ju� kolejn� tras� ucieczki, jednak b�d� potrzebowa� wsparcia. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_10"); //Co mam robi�?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_11"); //Musisz i�� na plac targowy, wspi�� si� na chaty przy murze i znale�� wielk� dziur�. 
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_12"); //Ma�o kto o niej wie. Tamt�dy uciekn�. Kto� jednak musi zabi� Stra�nika i zabra� mu klucz, aby otworzy� drzwi
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_13"); //To twoje zadanie. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_14"); //No dobra, ale jak zamierzasz si� dosta� do loch�w?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_15"); //Spokojnie, mam swoje sposoby. Zrobi� ma�e zamieszanie i przedostan� si� w pobli�e sypialni Stra�nik�w. Stamt�d do wej�cia do loch�w ju� tylko kilka krok�w.
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_16"); //W porz�dku. Powodzenia.
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_17"); //Pospiesz si�. A i gdybym si� nie zjawi� za drzwiami nie panikuj. Prze�pij si�, poczekaj, a ja na pewno si� zjawi�.
    B_LogEntry                     (CH1_ZabojstwBlizny,"Odnalaz�em Snake'a w zamku. Musze mu pom�c w ucieczce. W tym celu mam si� uda� na plac targowy, odnale�� dziur� w murze i zabi� pilnuj�cego wyj�cia z loch�w Stra�nika.");
	

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
	
	CreateInvItems (GRD_3932_DungeonGuard, ItKe_DunegonKeyOC, 1);
};

//========================================
//-----------------> CELLAR
//========================================

INSTANCE DIA_Snake_CELLAR (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 1;
   condition    = DIA_Snake_CELLAR_Condition;
   information  = DIA_Snake_CELLAR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Snake_CELLAR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_DungeonGuard_KILL))
    && (MIS_ZabojstwBlizny == LOG_RUNNING)
	&& (Npc_CanSee (other))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_CELLAR_Info()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(GRD_3932_DungeonGuard);
    AI_Output (self, other ,"DIA_Snake_CELLAR_03_01"); //Dobrze ci� widzie�.
    AI_Output (self, other ,"DIA_Snake_CELLAR_03_02"); //Czy Stra�nik gryzie piach?
    if (Npc_IsDead(whodie0))
    {
        AI_Output (other, self ,"DIA_Snake_CELLAR_15_03"); //Tak. Mo�esz ucieka�.
        AI_Output (self, other ,"DIA_Snake_CELLAR_03_04"); //Podzi�kuj� ci innym razem. Teraz nie ma na to czasu.
        B_LogEntry                     (CH1_ZabojstwBlizny,"Pomog�em Snake'owi uciec z zamku. Najwy�sza pora wr�ci� do Kosy.");

        B_GiveXP (100);
        Npc_ExchangeRoutine (self, "START");
        AI_StopProcessInfos	(self);
		Snake_help = true;
    }
    else
    {
        AI_Output (other, self ,"DIA_Snake_CELLAR_15_05"); //Nie, zostawi�em go przy �yciu.
        AI_Output (self, other ,"DIA_Snake_CELLAR_03_06"); //Co? Przecie� to nonsens! My�lisz, �e tak po prostu nam daruje? Wszystko musz� robi� sam!
		AI_Output (self, other ,"DIA_Snake_CELLAR_03_07"); //Wracaj do Kosy.
		Npc_ExchangeRoutine (self, "START");        
		AI_StopProcessInfos	(self);
        Npc_SetTarget (self, whodie0);
        AI_StartState (self, ZS_ATTACK, 1, ""); 
		Snake_help = false;
    };
};

//========================================
//-----------------> PRIZE
//========================================

INSTANCE DIA_Snake_PRIZE (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 1;
   condition    = DIA_Snake_PRIZE_Condition;
   information  = DIA_Snake_PRIZE_Info;
   permanent	= FALSE;
   description	= "Podobno chcia�e� mnie widzie�.";
};

FUNC INT DIA_Snake_PRIZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_SNAKESESCAPE))
    && (Snake_help == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_PRIZE_Info()
{
    AI_Output (other, self ,"DIA_Snake_PRIZE_15_01"); //Podobno chcia�e� mnie widzie�.
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_02"); //Tak, dobrze, �e jeste�. Chcia�em ci podzi�kowa� za pomoc.
    AI_Output (other, self ,"DIA_Snake_PRIZE_15_03"); //Nie cz�sto s�yszy si� takie s�owa z ust najemnego mordercy. 
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_04"); //C�, tak czasem bywa. We� ten plan kowalski. Zanie� go do kowala, a wykuje ci wspania�y sztylet.
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_05"); //Przygotowa� go dla mnie znajomy kowal z Myrtany. Mam jeszcze drugi egzemplarz w razie czego, wi�c nic nie strac�.
    AI_StopProcessInfos	(self);
	CreateInvItems (self, Plan_DaggerOfMurder,1);
	B_GiveInvItems (self, other, Plan_DaggerOfMurder,1);
	B_GiveXP (100);
};

//========================================
//-----------------> HelloGuy
//========================================

INSTANCE DIA_Snake_HelloGuy (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 1;
   condition    = DIA_Snake_HelloGuy_Condition;
   information  = DIA_Snake_HelloGuy_Info;
   permanent	= FALSE;
   description	= "Cze��.";
};

FUNC INT DIA_Snake_HelloGuy_Condition()
{
    if (MIS_ZabojstwBlizny != LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_HelloGuy_Info()
{
    AI_Output (other, self ,"DIA_Snake_HelloGuy_15_01"); //Cze��.
    AI_Output (self, other ,"DIA_Snake_HelloGuy_03_02"); //Nie mam czasu na rozmowy. Zostaw mnie samego. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Colony
//========================================

INSTANCE DIA_Snake_Colony (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 2;
   condition    = DIA_Snake_Colony_Condition;
   information  = DIA_Snake_Colony_Info;
   permanent	= FALSE;
   description	= "Jak trafi�e� do Kolonii? ";
};

FUNC INT DIA_Snake_Colony_Condition()
{
    if (MIS_ZabojstwBlizny == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_Colony_Info()
{
    AI_Output (other, self ,"DIA_Snake_Colony_15_01"); //Jak trafi�e� do Kolonii? 
    AI_Output (self, other ,"DIA_Snake_Colony_03_02"); //Zosta�em oskar�ony o morderstwo pewnej kobiety. Konkretniej �ony wysoko postawionego przedstawiciela Gildii Araxos. 
    AI_Output (self, other ,"DIA_Snake_Colony_03_03"); //Oczywi�cie dowody zosta�y sfa�szowane. 
    AI_Output (other, self ,"DIA_Snake_Colony_15_04"); //Nie pr�bowa�e� si� jako� broni�? 
    AI_Output (self, other ,"DIA_Snake_Colony_03_05"); //Nie by�o sensu. Kto� zbyt misternie wszystko przygotowa�. Mia�em ju� wtedy za sob� kilka zlece�, dlatego nie czu�em si� niewinny. 
    AI_Output (self, other ,"DIA_Snake_Colony_03_06"); //Spotka�a mnie kara. Przeznaczenie, ot co. �ycie toczy si� dalej, tyle, �e w innym miejscu. 

    Info_ClearChoices		(DIA_Snake_Colony);
    Info_AddChoice		(DIA_Snake_Colony, "Zaskoczy�e� mnie t� odpowiedzi�.", DIA_Snake_Colony_Surprise);
    Info_AddChoice		(DIA_Snake_Colony, DIALOG_BACK, DIA_Snake_Colony_BACK);
};

FUNC VOID DIA_Snake_Colony_Surprise()
{
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_01"); //Zaskoczy�e� mnie t� odpowiedzi�.
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_02"); //A co w niej dziwnego?
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_03"); //W G�rniczej Dolinie nie cz�sto spotka si� kogo� kto zdaje sobie spraw� ze swojej winy. 
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_04"); //S�uchaj, �wiadomo�� winy to jeszcze nie skrucha. Nie myl tego. 
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_05"); //Wiem, �e m�j spos�b zarabiania na �ycie niezbyt podoba si� sprawiedliwym bogom, jednak tak potoczy�o si� moje �ycie.
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_06"); //Kto wie, mo�e w�a�nie i bogowie mieli w tym udzia�?
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_07"); //A wi�c nie odrzucasz ich istnienia?
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_08"); //Nie, ale te� nie oddaje im pokornie ho�du. Po prostu s�. Szanuj� ich tak jak chocia�by przeciwnicy szanuj� si� walcz�c na arenie.
    Info_ClearChoices		(DIA_Snake_Colony);
};

FUNC VOID DIA_Snake_Colony_BACK()
{
    Info_ClearChoices		(DIA_Snake_Colony);
};

//========================================
//-----------------> FreeMineCamp
//========================================

INSTANCE DIA_Snake_FreeMineCamp (C_INFO)
{
   npc          = NON_7852_Snake;
   nr           = 3;
   condition    = DIA_Snake_FreeMineCamp_Condition;
   information  = DIA_Snake_FreeMineCamp_Info;
   permanent	= FALSE;
   description	= "Dlaczego przesiadujesz w Kotle?";
};

FUNC INT DIA_Snake_FreeMineCamp_Condition()
{
    if (MIS_ZabojstwBlizny == LOG_SUCCESS) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snake_FreeMineCamp_Info()
{
    AI_Output (other, self ,"DIA_Snake_FreeMineCamp_15_01"); //Dlaczego przesiadujesz w Kotle?
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_02"); //To proste. Bo mam tu spok�j. 
    AI_Output (other, self ,"DIA_Snake_FreeMineCamp_15_03"); //Nie wola�by� jakiego� ciekawszego miejsca?
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_04"); //Co masz na my�li m�wi�c ciekawszego? Pe�nego potwor�w, czy mo�e w��cz�g�w? 
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_05"); //A mo�e chodzi ci o jak�� bardziej zorganizowan� spo�eczno��? 
    AI_Output (other, self ,"DIA_Snake_FreeMineCamp_15_06"); //W sumie to nie wiem.
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_07"); //No w�a�nie. Niczego wi�cej mi nie potrzeba. 
};