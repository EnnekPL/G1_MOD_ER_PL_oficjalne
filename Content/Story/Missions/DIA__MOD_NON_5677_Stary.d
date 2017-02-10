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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Stary_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stary_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stary_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Stary_HELLO1_15_02"); //Nazywam si� Tom. Jestem my�liwym.
    AI_Output (other, self ,"DIA_Stary_HELLO1_15_03"); //Na co polujesz?
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_04"); //G��wnie na przer�ne gady. Pe�no tu jaszczur�w i topielc�w.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_05"); //Sk�ry i pazury sprzedaj� do Starego Obozu.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_06"); //Je�eli chcesz, mog� od ciebie odkupi� sk�ry w�y i topielc�w.
    AI_Output (self, other ,"DIA_Stary_HELLO1_03_07"); //Przynie� mi przynajmniej 10 sztuk, a dobrze ci zap�ac�.
	Log_CreateTopic (GE_Skup,LOG_NOTE);
	B_LogEntry (GE_Skup,"Stary Tom skupuje sk�ry w�y i topielc�w. Jego chata znajduje si� w pobli�u lasu, nieopodal Starego Obozu.");
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
   description	= "Nie jeste� za stary na my�liwego?";
};

FUNC INT DIA_Stary_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stary_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stary_HELLO2_15_01"); //Nie jeste� za stary na my�liwego?
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_02"); //Mo�e troch�. Mam ju� 60 lat i chyba zostan� ju� w tej Kolonii do ko�ca swoich dni.
    AI_Output (other, self ,"DIA_Stary_HELLO2_15_03"); //Jak d�ugo tu jeste�?
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_04"); //Jakie� pi�� lat. 
    AI_Output (self, other ,"DIA_Stary_HELLO2_03_05"); //B�d� polowa�, dop�ki b�d� mia� si�y.
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
   description	= "Mam sk�ry topielc�w.";
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
    AI_Output (other, self ,"DIA_Stary_HELLO3_15_01"); //Mam sk�ry topielc�w.
    AI_Output (self, other ,"DIA_Stary_HELLO3_03_02"); //Dobra robota. Przyjd� jak b�dziesz mia� nast�pne.
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
   description	= "Mam sk�ry b�otnych w�y.";
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
    AI_Output (other, self ,"DIA_Stary_SELL_SWAMPSHARKS_15_01"); //Mam sk�ry b�otnych w�y.
    AI_Output (self, other ,"DIA_Stary_SELL_SWAMPSHARKS_03_02"); //Dobra robota. Przyjd� jak b�dziesz mia� nast�pne.
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
   description	= "Widzia�e� mo�e w okolicy grup� Stra�nik�w �wi�tynnych?";
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
    AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_01"); //Widzia�e� mo�e w okolicy grup� Stra�nik�w �wi�tynnych?
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_15_02"); //Widzia�em, leczy tylko przez chwil�. To by�o w zniszczonej chacie za Starym Obozem.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_03"); //Obdziera�em w�a�nie ze sk�ry starego jaszczura, gdy nagle us�ysza�em g�o�ne szepty.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_04"); //�ysy m�czyzna w jasnej szacie prowadzi� ze sob� Nowicjuszy i Stra�nik�w �wi�tynnych. Szli w kierunku Ziem Ork�w.
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_05"); //Szkoda, �e Pacho nie by�o na posterunku. Chcia�bym zobaczy� co by z nim zrobili.
	AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_06"); //Dlaczego go nie by�o?
    AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_07"); //Nie wiem. Pewnie poszed� po piwo do Obozu. 
	AI_Output (other, self ,"DIA_Stary_WhereIsKalom_15_08"); //Jest kto� kto powie mi wi�cej o tej grupie?
	AI_Output (self, other ,"DIA_Stary_WhereIsKalom_03_09"); //Zapytaj w obozie �owc�w ork�w. Mo�e oni ich widzieli.
	
	B_LogEntry              (CH3_SearchKalom,"Tom widzia� Kaloma wraz z jego gwardi� �wi�tynnych, gdy szli w kierunku Ziem Ork�w. �owcy mog� mi da� wi�cej odpowiedzi. ");
	
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
    AI_Output (other, self ,"DIA_Stary_RavensCamp_15_02"); //Nie spodziewa�em si� spotka� tu my�liwego.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_03"); //Niestety nie mia�em wyboru.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_04"); //By�a noc, a ja wybra�em si� na drobn� przechadzk�.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_05"); //Niespodziewanie zauwa�y�em Kruka i garstk� ludzi ze Starego Obozu wymykaj�cych si� ukradkiem.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_06"); //Kruk te� mnie zauwa�y�, podszed� do mnie z wyci�gni�t� broni�.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_07"); //Powiedzia�, �e nie chce �wiadk�w i da� mi ultimatum - albo do niego do��cz�, albo mnie zabije.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_08"); //M�j wyb�r by� oczywisty.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_09"); //Teraz pracuj� dla niego i pozyskuj� �ywno�� dla obozu.
    AI_Output (other, self ,"DIA_Stary_RavensCamp_03_10"); //Rozumiem.
    AI_Output (self, other ,"DIA_Stary_RavensCamp_03_11"); //C�, mam nadziej�, �e nie b�d� tego �a�owa�.
};

