//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stary_EXIT(C_INFO)
{
	npc             = NON_5677_Stary;
	nr              = 999;
	condition	= DIA_Stary_EXIT_Condition;
	information	= DIA_Stary_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stary_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stary_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Stary_HELLO1 (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 1;
   condition    = DIA_Stary_HELLO1_Condition;
   information  = DIA_Stary_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Stary_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stary_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stary_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Stary_HELLO1_15_02"); //Nazywam siê Tom. Jestem myœliwym.
    AI_Output (other, self ,"DIA_Stary_HELLO1_15_03"); //Na co polujesz?
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_04"); //G³ównie na przeró¿ne gady. Pe³no tu jaszczurów i topielców.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_05"); //Skóry i pazury sprzedajê do Starego Obozu.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_06"); //Je¿eli chcesz, mogê od ciebie odkupiæ skóry wê¿y i topielców.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_07"); //Przynieœ mi przynajmniej 10 sztuk, a dobrze ci zap³acê.
	Log_CreateTopic (GE_Skup,LOG_NOTE);
	B_LogEntry (GE_Skup,"Stary Tom skupuje skóry wê¿y i topielców. Jego chata znajduje siê w pobli¿u lasu, nieopodal Starego Obozu.");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Stary_HELLO2 (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 2;
   condition    = DIA_Stary_HELLO2_Condition;
   information  = DIA_Stary_HELLO2_Info;
   permanent	= FALSE;
   description	= "Nie jesteœ za stary na myœliwego?";
};

FUNC INT DIA_Stary_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stary_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stary_HELLO2_15_01"); //Nie jesteœ za stary na myœliwego?
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_02"); //Mo¿e trochê. Mam ju¿ 60 lat i chyba zostanê ju¿ w tej Kolonii do koñca swoich dni.
    AI_Output (other, self ,"DIA_Stary_HELLO2_15_03"); //Jak d³ugo tu jesteœ?
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_04"); //Jakieœ piêæ lat. 
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_05"); //Bêdê polowa³, dopóki bêdê mia³ si³y.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Stary_HELLO3 (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 3;
   condition    = DIA_Stary_HELLO3_Condition;
   information  = DIA_Stary_HELLO3_Info;
   permanent	= TRUE;
   description	= "Mam skóry topielców.";
};

FUNC INT DIA_Stary_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stary_HELLO1))
    && (Npc_HasItems (other, ItAt_Lurker_02) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stary_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Stary_HELLO3_15_01"); //Mam skóry topielców.
    AI_Output (self, other ,"DIA_Stary_HELLO3_03_02"); //Dobra robota. PrzyjdŸ jak bêdziesz mia³ nastêpne.
    B_GiveInvItems (other, self, ItAt_Lurker_02, 10);
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
	Npc_RemoveInvItems (self, ItAt_Lurker_02, 10);
	B_GIVEXP (150);
};

//========================================
//-----------------> SELL_SWAMPSHARKS
//========================================

INSTANCE DIA_Stary_SELL_SWAMPSHARKS (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 3;
   condition    = DIA_Stary_SELL_SWAMPSHARKS_Condition;
   information  = DIA_Stary_SELL_SWAMPSHARKS_Info;
   permanent	= TRUE;
   description	= "Mam skóry b³otnych wê¿y.";
};

FUNC INT DIA_Stary_SELL_SWAMPSHARKS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stary_HELLO1))
    && (Npc_HasItems (other, ItAt_Swampshark_01) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stary_SELL_SWAMPSHARKS_Info()
{
    AI_Output (other, self ,"DIA_Stary_SELL_SWAMPSHARKS_15_01"); //Mam skóry b³otnych wê¿y.
    AI_Output (self, other ,"DIA_Stary_SELL_SWAMPSHARKS_03_02"); //Dobra robota. PrzyjdŸ jak bêdziesz mia³ nastêpne.
    B_GiveInvItems (other, self, ItAt_Swampshark_01, 10);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	Npc_RemoveInvItems (self, ItAt_Swampshark_01, 10);
	B_GIVEXP (250);
};

///////////////////////////////////////////////////
// 	Where Is Kalom
//////////////////////////////////////////////////

INSTANCE DIA_Stary_WhereIsKalom (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 1;
   condition    = DIA_Stary_WhereIsKalom_Condition;
   information  = DIA_Stary_WhereIsKalom_Info;
   permanent	= FALSE;
   description	= "Widzia³eœ mo¿e w okolicy grupê Stra¿ników Œwi¹tynnych?";
};

FUNC INT DIA_Stary_WhereIsKalom_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Alex_WhereIsKalom)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Stary_WhereIsKalom_Info()
{
    AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_01"); //Widzia³eœ mo¿e w okolicy grupê Stra¿ników Œwi¹tynnych?
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_15_02"); //Widzia³em, leczy tylko przez chwilê. To by³o w zniszczonej chacie za Starym Obozem.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_03"); //Obdziera³em w³aœnie ze skóry starego jaszczura, gdy nagle us³ysza³em g³oœne szepty.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_04"); //£ysy mê¿czyzna w jasnej szacie prowadzi³ ze sob¹ Nowicjuszy i Stra¿ników Œwi¹tynnych. Szli w kierunku Ziem Orków.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_05"); //Szkoda, ¿e Pacho nie by³o na posterunku. Chcia³bym zobaczyæ co by z nim zrobili.
	AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_06"); //Dlaczego go nie by³o?
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_07"); //Nie wiem. Pewnie poszed³ po piwo do Obozu. 
	AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_08"); //Jest ktoœ kto powie mi wiêcej o tej grupie?
	AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_09"); //Zapytaj w obozie ³owców orków. Mo¿e oni ich widzieli.
	
	B_LogEntry              (CH3_SearchKalom,"Tom widzia³ Kaloma wraz z jego gwardi¹ Œwi¹tynnych, gdy szli w kierunku Ziem Orków. £owcy mog¹ mi daæ wiêcej odpowiedzi. ");
	
	B_GiveXP (100);	
};

//========================================
//-----------------> RavensCamp
//========================================

INSTANCE DIA_Stary_RavensCamp (C_INFO)
{
   npc          = NON_5677_Stary;
   nr           = 1;
   condition    = DIA_Stary_RavensCamp_Condition;
   information  = DIA_Stary_RavensCamp_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Stary_RavensCamp_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stary_RavensCamp_Info()
{
    AI_Output (other, self ,"DIA_Stary_RavensCamp_15_01"); //Co ty tu robisz?
    AI_Output (other, self ,"DIA_Stary_RavensCamp_15_02"); //Nie spodziewa³em siê spotkaæ tu myœliwego.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_03"); //Niestety nie mia³em wyboru.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_04"); //By³a noc, a ja wybra³em siê na drobn¹ przechadzkê.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_05"); //Niespodziewanie zauwa¿y³em Kruka i garstkê ludzi ze Starego Obozu wymykaj¹cych siê ukradkiem.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_06"); //Kruk te¿ mnie zauwa¿y³, podszed³ do mnie z wyci¹gniêt¹ broni¹.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_07"); //Powiedzia³, ¿e nie chce œwiadków i da³ mi ultimatum - albo do niego do³¹czê, albo mnie zabije.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_08"); //Mój wybór by³ oczywisty.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_09"); //Teraz pracujê dla niego i pozyskujê ¿ywnoœæ dla obozu.
    AI_Output (other, self ,"DIA_Stary_RavensCamp_03_10"); //Rozumiem.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_11"); //Có¿, mam nadziejê, ¿e nie bêdê tego ¿a³owa³.
};

