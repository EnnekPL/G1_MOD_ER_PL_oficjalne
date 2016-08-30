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
   description		= "Przychodz� w sprawie d�ugu u Starkada.";
};

FUNC INT DIA_GorNaIdon_LOAN_Condition()
{
    if (MIS_OszukanyHandlarz == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaIdon_LOAN_Info()
{
    AI_Output (other, self ,"DIA_GorNaIdon_LOAN_15_01"); //Przychodz� w sprawie d�ugu u Starkada.
    AI_Output (self, other ,"DIA_GorNaIdon_LOAN_03_02"); //Jak on �mie ��da� ode mnie rudy! Jestem Stra�nikiem �wi�tynnym. S�u�� �ni�cemu.
	AI_Output (other, self ,"DIA_GorNaIdon_LOAN_15_03"); //On te� s�u�y �ni�cemu, dlatego prosz� ci� b�d� uczciwy i oddaj rud�.
    AI_Output (self, other ,"DIA_GorNaIdon_LOAN_03_03"); //Zapomnij.
    B_LogEntry (CH1_OszukanyHandlarz,"Gor Na Idon nie zamierza zwr�ci� rudy. O ma�o ci nie p�k� z dumy, gdy mi to oznajmi�. Chyba musz� pogada� z jego prze�o�onym.");
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
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_03"); //Nie wolisz chocia�by si� przespa�?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_04"); //Sen r�wnie� jest wspania�y. Mo�na w nim do�wiadczy� wizji lub objawie�. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_05"); //Oczywi�cie uprzednio trzeba wypali� dostateczn� liczb� ziela. 
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_06"); //A ty do�wiadczy�e� kiedy� jakiego� znaku od �ni�cego?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_07"); //My�l�, �e tak. Pewnej nocy mia�em wspania�y sen o przysz�o�ci. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_08"); //Magiczna Bariera opad�a, a obok Khorinis zbudowano wielk� �wi�tyni� ku czci �ni�cego. 
    AI_Output (other, self ,"DIA_Templer_HowAreYou_15_09"); //My�lisz, �e twoje senne marzenie mo�e si� zi�ci�?
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_10"); //Oczywi�cie. �ni�cy poprowadzi nas do zwyci�stwa! Zobaczysz, �e jeszcze kiedy� staniesz przed wyborem: paladyni Innosa czy Stra�nicy �ni�cego. 
    AI_Output (self, other ,"DIA_Templer_HowAreYou_03_11"); //Przypomnij mi wtedy o sobie. Spojrz� na ciebie �askawszym okiem i pozwol� walczy� ku chwale �ni�cego. 
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
    AI_Output (self, other ,"DIA_Templer_LastFight_03_01"); //A wi�c to ty pokona�e� moich braci... Tym razem nie walczysz z byle kim.
    AI_Output (self, other ,"DIA_Templer_LastFight_03_02"); //Gdy by�em na kontynencie, podr�owa�em �cie�kami Nordmaru. Nie bez powodu Y'Berion nagrodzi� mnie t� wspania�� zbroj�.
    AI_Output (self, other ,"DIA_Templer_LastFight_03_03"); //Nie oddam ci tytu�u mistrza tak �atwo.
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
    AI_Output (self, other ,"DIA_Templer_4LastFightWin_03_01"); //Ach... moja g�owa. Jak to mo�liwe, �e wygra�e�?
    AI_Output (self, other ,"DIA_Templer_4LastFightWin_03_02"); //Stosujesz jakie� magiczne sztuczki? Przyznaj si�! Natychmiast.
    AI_Output (other, self ,"DIA_Templer_4LastFightWin_15_03"); //Po prostu by�em lepszy.
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
    AI_Output (self, other ,"DIA_Templer_4LastFightFail_03_01"); //Przegra�e� walk�. Podziwiam ci� za to, �e dotar�e� tak daleko. Masz m�j szacunek.
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