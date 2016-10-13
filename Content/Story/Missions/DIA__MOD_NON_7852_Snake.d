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
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_01"); //Stój! Ani kroku dalej! 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_02"); //Zaczekaj. Ty jesteœ Snake?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_03"); //Czego chcesz?
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_04"); //Przysy³a mnie Kosa. Mam ci pomóc. 
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_05"); //Cholera, wpad³em w niez³e gówno. Stra¿nicy odciêli mi wczeœniej zaplanowan¹ drogê ucieczki i mój plan strzeli³ w ³eb. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_06"); //Co tutaj siê tak w ogóle sta³o? Sk¹d tu te cia³a?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_07"); //Prawie mnie nakryli, ale uda³o mi siê ich zabiæ zanim wezwali wsparcie. Postanowi³em siê tu zabarykadowaæ.
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_08"); //Masz jakiœ plan?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_09"); //Tak, mam ju¿ kolejn¹ trasê ucieczki, jednak bêdê potrzebowa³ wsparcia. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_10"); //Co mam robiæ?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_11"); //Musisz iœæ na plac targowy, wspi¹æ siê na chaty przy murze i znaleŸæ wielk¹ dziurê. 
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_12"); //Ma³o kto o niej wie. Tamtêdy ucieknê. Ktoœ jednak musi zabiæ Stra¿nika i zabraæ mu klucz, aby otworzyæ drzwi
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_13"); //To twoje zadanie. 
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_14"); //No dobra, ale jak zamierzasz siê dostaæ do lochów?
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_15"); //Spokojnie, mam swoje sposoby. Zrobiê ma³e zamieszanie i przedostanê siê w pobli¿e sypialni Stra¿ników. Stamt¹d do wejœcia do lochów ju¿ tylko kilka kroków.
    AI_Output (other, self ,"DIA_Snake_NOWAY_15_16"); //W porz¹dku. Powodzenia.
    AI_Output (self, other ,"DIA_Snake_NOWAY_03_17"); //Pospiesz siê. A i gdybym siê nie zjawi³ za drzwiami nie panikuj. Przeœpij siê, poczekaj, a ja na pewno siê zjawiê.
    B_LogEntry                     (CH1_ZabojstwBlizny,"Odnalaz³em Snake'a w zamku. Musze mu pomóc w ucieczce. W tym celu mam siê udaæ na plac targowy, odnaleŸæ dziurê w murze i zabiæ pilnuj¹cego wyjœcia z lochów Stra¿nika.");
	

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
    AI_Output (self, other ,"DIA_Snake_CELLAR_03_01"); //Dobrze ciê widzieæ.
    AI_Output (self, other ,"DIA_Snake_CELLAR_03_02"); //Czy Stra¿nik gryzie piach?
    if (Npc_IsDead(whodie0))
    {
        AI_Output (other, self ,"DIA_Snake_CELLAR_15_03"); //Tak. Mo¿esz uciekaæ.
        AI_Output (self, other ,"DIA_Snake_CELLAR_03_04"); //Podziêkujê ci innym razem. Teraz nie ma na to czasu.
        B_LogEntry                     (CH1_ZabojstwBlizny,"Pomog³em Snake'owi uciec z zamku. Najwy¿sza pora wróciæ do Kosy.");

        B_GiveXP (100);
        Npc_ExchangeRoutine (self, "START");
        AI_StopProcessInfos	(self);
		Snake_help = true;
    }
    else
    {
        AI_Output (other, self ,"DIA_Snake_CELLAR_15_05"); //Nie, zostawi³em go przy ¿yciu.
        AI_Output (self, other ,"DIA_Snake_CELLAR_03_06"); //Co? Przecie¿ to nonsens! Myœlisz, ¿e tak po prostu nam daruje? Wszystko muszê robiæ sam!
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
   description	= "Podobno chcia³eœ mnie widzieæ.";
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
    AI_Output (other, self ,"DIA_Snake_PRIZE_15_01"); //Podobno chcia³eœ mnie widzieæ.
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_02"); //Tak, dobrze, ¿e jesteœ. Chcia³em ci podziêkowaæ za pomoc.
    AI_Output (other, self ,"DIA_Snake_PRIZE_15_03"); //Nie czêsto s³yszy siê takie s³owa z ust najemnego mordercy. 
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_04"); //Có¿, tak czasem bywa. WeŸ ten plan kowalski. Zanieœ go do kowala, a wykuje ci wspania³y sztylet.
    AI_Output (self, other ,"DIA_Snake_PRIZE_03_05"); //Przygotowa³ go dla mnie znajomy kowal z Myrtany. Mam jeszcze drugi egzemplarz w razie czego, wiêc nic nie stracê.
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
   description	= "Czeœæ.";
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
    AI_Output (other, self ,"DIA_Snake_HelloGuy_15_01"); //Czeœæ.
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
   description	= "Jak trafi³eœ do Kolonii? ";
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
    AI_Output (other, self ,"DIA_Snake_Colony_15_01"); //Jak trafi³eœ do Kolonii? 
    AI_Output (self, other ,"DIA_Snake_Colony_03_02"); //Zosta³em oskar¿ony o morderstwo pewnej kobiety. Konkretniej ¿ony wysoko postawionego przedstawiciela Gildii Araxos. 
    AI_Output (self, other ,"DIA_Snake_Colony_03_03"); //Oczywiœcie dowody zosta³y sfa³szowane. 
    AI_Output (other, self ,"DIA_Snake_Colony_15_04"); //Nie próbowa³eœ siê jakoœ broniæ? 
    AI_Output (self, other ,"DIA_Snake_Colony_03_05"); //Nie by³o sensu. Ktoœ zbyt misternie wszystko przygotowa³. Mia³em ju¿ wtedy za sob¹ kilka zleceñ, dlatego nie czu³em siê niewinny. 
    AI_Output (self, other ,"DIA_Snake_Colony_03_06"); //Spotka³a mnie kara. Przeznaczenie, ot co. ¯ycie toczy siê dalej, tyle, ¿e w innym miejscu. 

    Info_ClearChoices		(DIA_Snake_Colony);
    Info_AddChoice		(DIA_Snake_Colony, "Zaskoczy³eœ mnie t¹ odpowiedzi¹.", DIA_Snake_Colony_Surprise);
    Info_AddChoice		(DIA_Snake_Colony, DIALOG_BACK, DIA_Snake_Colony_BACK);
};

FUNC VOID DIA_Snake_Colony_Surprise()
{
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_01"); //Zaskoczy³eœ mnie t¹ odpowiedzi¹.
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_02"); //A co w niej dziwnego?
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_03"); //W Górniczej Dolinie nie czêsto spotka siê kogoœ kto zdaje sobie sprawê ze swojej winy. 
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_04"); //S³uchaj, œwiadomoœæ winy to jeszcze nie skrucha. Nie myl tego. 
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_05"); //Wiem, ¿e mój sposób zarabiania na ¿ycie niezbyt podoba siê sprawiedliwym bogom, jednak tak potoczy³o siê moje ¿ycie.
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_06"); //Kto wie, mo¿e w³aœnie i bogowie mieli w tym udzia³?
    AI_Output (other, self ,"DIA_Snake_Colony_Surprise_15_07"); //A wiêc nie odrzucasz ich istnienia?
    AI_Output (self, other ,"DIA_Snake_Colony_Surprise_03_08"); //Nie, ale te¿ nie oddaje im pokornie ho³du. Po prostu s¹. Szanujê ich tak jak chocia¿by przeciwnicy szanuj¹ siê walcz¹c na arenie.
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
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_02"); //To proste. Bo mam tu spokój. 
    AI_Output (other, self ,"DIA_Snake_FreeMineCamp_15_03"); //Nie wola³byœ jakiegoœ ciekawszego miejsca?
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_04"); //Co masz na myœli mówi¹c ciekawszego? Pe³nego potworów, czy mo¿e w³óczêgów? 
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_05"); //A mo¿e chodzi ci o jak¹œ bardziej zorganizowan¹ spo³ecznoœæ? 
    AI_Output (other, self ,"DIA_Snake_FreeMineCamp_15_06"); //W sumie to nie wiem.
    AI_Output (self, other ,"DIA_Snake_FreeMineCamp_03_07"); //No w³aœnie. Niczego wiêcej mi nie potrzeba. 
};