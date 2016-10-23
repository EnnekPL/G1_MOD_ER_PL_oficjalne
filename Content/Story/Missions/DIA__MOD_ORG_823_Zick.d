///////////////////////////////////////////////
//				ENDE
///////////////////////////////////////////////

INSTANCE DIA_Zick_EXIT(C_INFO)
{
	npc             = ORG_823_Zick;
	nr              = 999;
	condition		= DIA_Zick_EXIT_Condition;
	information		= DIA_Zick_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Zick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Zick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////
//				Who You
///////////////////////////////////////////////

INSTANCE DIA_Zick_WhoYou (C_INFO)
{
   npc          = ORG_823_Zick;
   nr           = 1;
   condition    = DIA_Zick_WhoYou_Condition;
   information  = DIA_Zick_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Zick_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zick_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Zick_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Zick_WhoYou_03_02"); //Jak to kim? Jestem jednym z najlepszych Szkodnik�w w ca�ym Nowym Obozie.
	AI_Output (self, other ,"DIA_Zick_WhoYou_03_03"); //My�lisz, �e dlaczego mam chat� tak blisko Laresa? To m�j dobry przyjaciel.
	AI_Output (self, other ,"DIA_Zick_WhoYou_03_04"); //Lepiej ze mn� nie zadzieraj. 
};

///////////////////////////////////////////////
//				Valuable Info
///////////////////////////////////////////////

INSTANCE DIA_Zick_ValuableInfo (C_INFO)
{
   npc          = ORG_823_Zick;
   nr           = 1;
   condition    = DIA_Zick_ValuableInfo_Condition;
   information  = DIA_Zick_ValuableInfo_Info;
   permanent	= FALSE;
   description	= "My�l�, �e to tylko puste przechwa�ki.";
};

FUNC INT DIA_Zick_ValuableInfo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Zick_WhoYou))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Zick_ValuableInfo_Info()
{
    AI_Output (other, self ,"DIA_Zick_ValuableInfo_15_01"); //My�l�, �e to tylko puste przechwa�ki.
    AI_Output (self, other ,"DIA_Zick_ValuableInfo_03_02"); //Kolejny! Wszyscy my�licie, �e osi�gn��em to co mam tylko dlatego, �e Lewus jest moim bratankiem?
	AI_Output (self, other ,"DIA_Zick_ValuableInfo_03_03"); //Ju� ja wam kiedy� poka��. Nie zmuszaj mnie do wyci�gania or�a!
	AI_Output (other, self ,"DIA_Zick_ValuableInfo_15_04"); //Dobra, dobra, tylko przesta� si� wydziera�.
	
	if (Npc_KnowsInfo (hero, DIA_Josep_Truth)) && (MIS_MissedJosep == LOG_RUNNING)
	{
	B_LogEntry    (CH1_MissedJosep,"Dowiedzia�em si�, �e Zick jest bratankiem Lewusa. Ta informacja mo�e by� dla mnie bardzo cenna.");
	};
};

///////////////////////////////////////////////
//				Try
///////////////////////////////////////////////

INSTANCE DIA_Zick_Try (C_INFO)
{
   npc          = ORG_823_Zick;
   nr           = 1;
   condition    = DIA_Zick_Try_Condition;
   information  = DIA_Zick_Try_Info;
   permanent	= FALSE;
   description	= "A wi�c Lewus to tw�j bratanek...";
};

FUNC INT DIA_Zick_Try_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Zick_ValuableInfo)) && (Npc_KnowsInfo (hero, DIA_Josep_Truth))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Zick_Try_Info()
{
    AI_Output (other, self ,"DIA_Zick_Try_15_01"); //A wi�c Lewus to tw�j bratanek...
    AI_Output (self, other ,"DIA_Zick_Try_03_02"); //On nie ma nic wsp�lnego z moj� karier�! Zrozumcie to w ko�cu!
	AI_Output (other, self ,"DIA_Zick_Try_15_03"); //Chc� z tob� pogada�, za obozem, na osobno�ci. 
	AI_Output (self, other ,"DIA_Zick_Try_03_04"); //O nie! Nigdzie z tob� nie p�jd�. Je�li, co� mi si� stanie, Lewus wypruje ci flaki.
	
	B_LogEntry    (CH1_MissedJosep,"Wyci�gni�cie Zicka z obozu to nie taka prosta sprawa. Mo�e kto� b�d�cy w pobli�u m�g�by mi jako� pom�c?");
};

///////////////////////////////////////////////
//				Come With Us
///////////////////////////////////////////////

INSTANCE DIA_Zick_ComeWithUs (C_INFO)
{
   npc          = ORG_823_Zick;
   nr           = 1;
   condition    = DIA_Zick_ComeWithUs_Condition;
   information  = DIA_Zick_ComeWithUs_Info;
   permanent	= FALSE;
   description	= "A teraz p�jdziesz z nami.";
};

FUNC INT DIA_Zick_ComeWithUs_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Zick_ValuableInfo)) && (Npc_KnowsInfo (hero, DIA_Josep_Truth))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Zick_ComeWithUs_Info()
{
    AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_01"); //A teraz p�jdziesz z nami...
    AI_Output (self, other ,"DIA_Zick_ComeWithUs_03_02"); //Przecie� powiedzia�em, �e...!
	AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_03"); //Inaczej ten ciemnosk�ry facet i ja zrobimy ci krzywd� tak szybko, �e Lewus nawet nie zd��y mrugn��, a co dopiero si� tu zjawi�.
	AI_Output (self, other ,"DIA_Zick_ComeWithUs_03_04"); //Prosz�! Nie!
	AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_05"); //Za mn�.
	
	Npc_ExchangeRoutine (self,"follow");
};