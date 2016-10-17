//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Templer12_EXIT(C_INFO)
{
	npc             		= TPL_1412_Templer;
	nr              		= 999;
	condition			= DIA_Templer12_EXIT_Condition;
	information		= DIA_Templer12_EXIT_Info;
	permanent		= TRUE;
	description     	= DIALOG_ENDE;
};

FUNC INT DIA_Templer12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Templer12_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOAN
//========================================

INSTANCE DIA_GorNaIdon_LOAN (C_INFO)
{
   npc          		= TPL_1412_Templer;
   nr           		= 1;
   condition    	= DIA_GorNaIdon_LOAN_Condition;
   information  	= DIA_GorNaIdon_LOAN_Info;
   permanent	= FALSE;
   description		= "Przychodzê w sprawie d³ugu u Starkada.";
};

FUNC INT DIA_GorNaIdon_LOAN_Condition()
{
    if (MIS_CheatedMerchant == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaIdon_LOAN_Info()
{
    AI_Output (other, self ,"DIA_GorNaIdon_LOAN_15_01"); //Przychodzê w sprawie d³ugu u Starkada.
    AI_Output (self, other ,"DIA_GorNaIdon_LOAN_03_02"); //Jak on œmie ¿¹daæ ode mnie rudy! Jestem Stra¿nikiem Œwi¹tynnym. S³u¿ê Œni¹cemu.
	AI_Output (other, self ,"DIA_GorNaIdon_LOAN_15_03"); //On te¿ s³u¿y Œni¹cemu, dlatego proszê ciê b¹dŸ uczciwy i oddaj rudê.
    AI_Output (self, other ,"DIA_GorNaIdon_LOAN_03_03"); //Zapomnij.
    B_LogEntry (CH1_CheatedMerchant,"Gor Na Idon nie zamierza zwróciæ rudy. O ma³o ci nie pêk³ z dumy, gdy mi to oznajmi³. Chyba muszê pogadaæ z jego prze³o¿onym.");
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Templer_HowAreYou (C_INFO)
{
   npc          		= TPL_1412_Templer;
   nr           		= 1;
   condition    	= DIA_Templer_HowAreYou_Condition;
   information  	= DIA_Templer_HowAreYou_Info;
   permanent	= FALSE;
   description		= "Jak leci?";
};

FUNC INT DIA_Templer_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Templer_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_02"); //Trening mnie uspokaja...
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_03"); //Nie wolisz chocia¿by siê przespaæ?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_04"); //Sen równie¿ jest wspania³y. Mo¿na w nim doœwiadczyæ wizji lub objawieñ. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_05"); //Oczywiœcie uprzednio trzeba wypaliæ dostateczn¹ liczbê ziela. 
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_06"); //A ty doœwiadczy³eœ kiedyœ jakiegoœ znaku od Œni¹cego?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_07"); //Myœlê, ¿e tak. Pewnej nocy mia³em wspania³y sen o przysz³oœci. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_08"); //Magiczna Bariera opad³a, a obok Khorinis zbudowano wielk¹ œwi¹tyniê ku czci Œni¹cego. 
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_09"); //Myœlisz, ¿e twoje senne marzenie mo¿e siê ziœciæ?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_10"); //Oczywiœcie. Œni¹cy poprowadzi nas do zwyciêstwa! Zobaczysz, ¿e jeszcze kiedyœ staniesz przed wyborem: paladyni Innosa czy Stra¿nicy Œni¹cego. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_11"); //Przypomnij mi wtedy o sobie. Spojrzê na ciebie ³askawszym okiem i pozwolê walczyæ ku chwale Œni¹cego. 
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_12"); //Jasne. 
};

/*
//========================================
//-----------------> LastFight
//========================================

INSTANCE DIA_Templer_LastFight (C_INFO)
{
   npc          = TPL_1412_Templer;
   nr           = 1;
   condition    = DIA_Templer_LastFight_Condition;
   information  = DIA_Templer_LastFight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_LastFight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_LastFight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_LastFight_Info()
{
    AI_Output (self, other ,"DIA_Templer_LastFight_03_01"); //A wiêc to ty pokona³eœ moich braci... Tym razem nie walczysz z byle kim.
    AI_Output (self, other ,"DIA_Templer_LastFight_03_02"); //Gdy by³em na kontynencie, podró¿owa³em œcie¿kami Nordmaru. Nie bez powodu Y'Berion nagrodzi³ mnie t¹ wspania³¹ zbroj¹.
    AI_Output (self, other ,"DIA_Templer_LastFight_03_03"); //Nie oddam ci tytu³u mistrza tak ³atwo.
	var C_NPC mistrz_areny;
	TPL_1419_Templer.npctype = npctype_FRIEND;
	TPL_1414_Templer.npctype = npctype_FRIEND;
	TPL_1411_Templer.npctype = npctype_FRIEND;
	TPL_1412_Templer.npctype = npctype_FRIEND;
	mistrz_areny = Hlp_GetNpc(TPL_1412_Templer);
	mistrz_areny.guild = GIL_NONE;
	Npc_SetTrueGuild (mistrz_areny,GIL_NONE);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> 4LastFightWin
//========================================

INSTANCE DIA_Templer_4LastFightWin (C_INFO)
{
   npc          = TPL_1412_Templer;
   nr           = 2;
   condition    = DIA_Templer_4LastFightWin_Condition;
   information  = DIA_Templer_4LastFightWin_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_4LastFightWin_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_LastFight))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_4LastFightWin_Info()
{
    AI_Output (self, other ,"DIA_Templer_4LastFightWin_03_01"); //Ach... moja g³owa. Jak to mo¿liwe, ¿e wygra³eœ?
    AI_Output (self, other ,"DIA_Templer_4LastFightWin_03_02"); //Stosujesz jakieœ magiczne sztuczki? Przyznaj siê! Natychmiast.
    AI_Output (other, self ,"DIA_Templer_4LastFightWin_15_03"); //Po prostu by³em lepszy.
	var C_NPC mistrz_areny;
	mistrz_areny = Hlp_GetNpc(TPL_1412_Templer);
	mistrz_areny.guild = GIL_TPL;
	Npc_SetTrueGuild (mistrz_areny,GIL_TPL);
	Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1414_Templer, "start");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> 4LastFightFail
//========================================

INSTANCE DIA_Templer_4LastFightFail (C_INFO)
{
   npc          = TPL_1412_Templer;
   nr           = 3;
   condition    = DIA_Templer_4LastFightFail_Condition;
   information  = DIA_Templer_4LastFightFail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_4LastFightFail_Condition()
{
    if (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
    && (Npc_KnowsInfo (hero, DIA_Templer_LastFight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_4LastFightFail_Info()
{
    AI_Output (self, other ,"DIA_Templer_4LastFightFail_03_01"); //Przegra³eœ walkê. Podziwiam ciê za to, ¿e dotar³eœ tak daleko. Masz mój szacunek.
	var C_NPC mistrz_areny;
	mistrz_areny = Hlp_GetNpc(TPL_1412_Templer);
	mistrz_areny.guild = GIL_TPL;
	Npc_SetTrueGuild (mistrz_areny,GIL_TPL);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1414_Templer, "start");
};
*/