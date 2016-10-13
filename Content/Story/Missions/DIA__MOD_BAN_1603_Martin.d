//poprawione i sprawdzone - Nocturn

//sprawdzone przez gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Martin_EXIT(C_INFO)
{
	npc             = BAN_1603_Martin;
	nr              = 999;
	condition	= DIA_Martin_EXIT_Condition;
	information	= DIA_Martin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Martin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTO
//========================================

INSTANCE DIA_Martin_KTOTO (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_KTOTO_Condition;
   information  = DIA_Martin_KTOTO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Martin_KTOTO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Martin_KTOTO_Info()
{
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_02"); //Nazywam siê Martin. Zajmujê siê zaopatrzeniem Obozu.
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_03"); //Mo¿esz mi coœ sprzedaæ?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_04"); //Sprzedajê towary tylko Bandytom.
		Log_CreateTopic	(GE_Bandit,	LOG_NOTE);
		B_LogEntry		(GE_Bandit,	"Martin sprzedaje ekwipunek tylko Bandytom.");
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Martin_TRADE (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 2;
   condition    = DIA_Martin_TRADE_Condition;
   information  = DIA_Martin_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Co masz na sprzeda¿?";
};

FUNC INT DIA_Martin_TRADE_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU) || (przyjaciel_Bandytow == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Martin_TRADE_15_01"); //Co masz na sprzeda¿?
    AI_Output (self, other ,"DIA_Martin_TRADE_03_02"); //Wybierz coœ.
};

/*
//========================================
//-----------------> QUEST
//========================================

INSTANCE DIA_Martin_QUEST (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 3;
   condition    = DIA_Martin_QUEST_Condition;
   information  = DIA_Martin_QUEST_Info;
   permanent	= FALSE;
   description	= "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_Martin_QUEST_Condition()
{
    if (BANDITOS_ZAUFANIE == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_QUEST_Info()
{
    AI_Output (other, self ,"DIA_Martin_QUEST_15_01"); //Mogê coœ dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Martin_QUEST_03_02"); //Szukasz poparcia, co?
    AI_Output (self, other ,"DIA_Martin_QUEST_03_03"); //Nawet nie wiesz, w co siê pakujesz, ch³opcze.
    AI_Output (self, other ,"DIA_Martin_QUEST_03_04"); //Jako Bandyta bêdziesz mia³ ciê¿kie ¿ycie.
    AI_Output (self, other ,"DIA_Martin_QUEST_03_05"); //Dlatego poæwicz trochê, zdob¹dŸ nieco doœwiadczenia.
    AI_Output (self, other ,"DIA_Martin_QUEST_03_06"); //Wtedy bêdzie ci ³atwiej.
PrintScreen     ("Warunek przyjêcia: poziom 7", -1,-1,"font_old_10_white.tga",3);  
  MartinLevel = LOG_RUNNING;
PrintScreen     ("Przyjêto zadanie: Doœwiadczenie", 1,25,"FONT_OLD_20_WHITE.TGA",3);  
    Log_CreateTopic            (CH1_MartinLevel, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MartinLevel, LOG_RUNNING);
    B_LogEntry                     (CH1_MartinLevel,"Aby uzyskaæ poparcie Martina, muszê zdobyæ wiêcej doœwiadczenia.");
};

//========================================
//-----------------> LEVEL
//========================================

INSTANCE DIA_Martin_LEVEL (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 4;
   condition    = DIA_Martin_LEVEL_Condition;
   information  = DIA_Martin_LEVEL_Info;
   permanent	= FALSE;
   description	= "Trochê siê nauczy³em.";
};

FUNC INT DIA_Martin_LEVEL_Condition()
{
    if (MartinLevel == LOG_RUNNING)
     && (Hero.Level >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_LEVEL_Info()
{
    AI_Output (other, self ,"DIA_Martin_LEVEL_15_01"); //Trochê siê nauczy³em.
    AI_Output (self, other ,"DIA_Martin_LEVEL_03_02"); //No widzê, ¿e nie jest Ÿle.
    AI_Output (self, other ,"DIA_Martin_LEVEL_03_03"); //Dasz sobie radê wœród Bandytów.
    B_LogEntry                     (CH1_MartinLevel,"Uda³o mi siê zdobyæ zaufanie Martina.");
    Log_SetTopicStatus       (CH1_MartinLevel, LOG_SUCCESS);
    MartinLevel = LOG_SUCCESS;
    B_LogEntry                     (CH1_BANDITOS_ZAUFANIE,"Uda³o mi siê uzyskaæ poparcie Martina.");

    B_GiveXP (300);
};
*/
//========================================
//-----------------> Trueasd
//========================================

INSTANCE DIA_Martin_Trueasd (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_Trueasd_Condition;
   information  = DIA_Martin_Trueasd_Info;
   permanent	= FALSE;
   description	= "Ponoæ chcecie sk³óciæ Artegora z Gomezem.";
};

FUNC INT DIA_Martin_Trueasd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_Brothers))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_Trueasd_Info()
{
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_01"); //Ponoæ chcecie sk³óciæ Artegora z Gomezem.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_02"); //Mo¿liwe. Czemu ci tak na tym zale¿y?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_03"); //Chcê uwolniæ moich braci ze Starej Kopalni.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_04"); //Jakich braci? Aaa... tych œwirów podobnych tobie?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_05"); //Miarkuj siê albo dostaniesz w ³eb!
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_06"); //Spokojnie. Chcesz nam pomóc?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_07"); //Chyba nie mam innego wyjœcia.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_08"); //Dobra, a wiêc plan jest taki...
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_09"); //Quentin szuka kogoœ, kto zaniesie do Starego Obozu informacje o tym, co siê wydarzy³o w obozie przed kopalni¹.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_10"); //Mo¿e to byæ jakiœ by³y Stra¿nik albo coœ w tym stylu.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_11"); //Pomó¿ nam odszukaæ kogoœ takiego, a reszta potoczy siê ju¿ sama.
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_12"); //Spróbujê coœ zorganizowaæ.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_13"); //Powodzenia.
    B_LogEntry                     (CH1_HelpBrothersBra,"Bandyci chc¹ doprowadziæ do starcia Gomeza z Artegorem. Je¿eli wszystko dobrze siê u³o¿y, powybijaj¹ siê nawzajem. Muszê znaleŸæ kogoœ, kto zaniesie informacje o wyczynach Artegora do Starego Obozu.");

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Camik
//========================================

INSTANCE DIA_Martin_Camik (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 2;
   condition    = DIA_Martin_Camik_Condition;
   information  = DIA_Martin_Camik_Info;
   permanent	= FALSE;
   description	= "Gdzie znajduje siê wasz Obóz?";
};

FUNC INT DIA_Martin_Camik_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_Camik_Info()
{
    AI_Output (other, self ,"DIA_Martin_Camik_15_01"); //Gdzie znajduje siê wasz Obóz?
    AI_Output (self, other ,"DIA_Martin_Camik_03_02"); //W górach. Wstêp do niego maj¹ tylko zaufane osoby.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Martin_HELLO3 (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 3;
   condition    = DIA_Martin_HELLO3_Condition;
   information  = DIA_Martin_HELLO3_Info;
   permanent	= FALSE;
   description	= "Kto wami dowodzi?";
};

FUNC INT DIA_Martin_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Martin_HELLO3_15_01"); //Kto wami dowodzi?
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_02"); //Oczywiœcie Quentin. To twardy goœæ.
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_03"); //Chcesz siê do nas przy³¹czyæ?
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_04"); //Teraz ju¿ na to za póŸno.
};

//========================================
//-----------------> ScorpioTalk
//========================================

INSTANCE DIA_Martin_ScorpioTalk (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_ScorpioTalk_Condition;
   information  = DIA_Martin_ScorpioTalk_Info;
   permanent	= FALSE;
   description	= "Namówi³em Skorpiona.";
};

FUNC INT DIA_Martin_ScorpioTalk_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    && (przekupionyGRD == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_ScorpioTalk_Info()
{
    AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_01"); //Namówi³em Skorpiona.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_02"); //Powiedzia³ ju¿ Stra¿nikom, co siê tutaj dzieje.
 // AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_03"); //Powiedzia³, ¿e zrobi to wkrótce.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_04"); //Szybko siê uwin¹³. Zanim tu przyszed³eœ widzia³em oddzia³ Stra¿ników zmierzaj¹cy w stronê kopalni.
    //PlayVideo ("Ataknakopalnie.BIK");
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_05"); //Cholera, co tam siê sta³o?
    AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_06"); //Co teraz mam zrobiæ?
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_07"); //Zakradnij siê tam i zobacz, jak wygl¹da sytuacja.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_08"); //Tylko ostro¿nie!
    B_LogEntry                     (CH1_HelpBrothersBra,"Przed chwil¹ Martin ujrza³ oddzia³ Stra¿ników id¹cy w kierunku Starej Kopalni. Nie mam pojêcia, co wydarzy³o siê w obozie przed kopalni¹. Muszê jak najszybciej udaæ siê do obozu przed kopalni¹ i zobaczyæ, co tam siê sta³o.");
	B_Story_BattleInOldMineCamp ();
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};