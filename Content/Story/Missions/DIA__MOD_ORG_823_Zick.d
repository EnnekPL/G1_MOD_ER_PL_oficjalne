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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Zick_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zick_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Zick_WhoYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Zick_WhoYou_03_02"); //Jak to kim? Jestem jednym z najlepszych Szkodników w ca³ym Nowym Obozie.
	AI_Output (self, other ,"DIA_Zick_WhoYou_03_03"); //Myœlisz, ¿e dlaczego mam chatê tak blisko Laresa? To mój dobry przyjaciel.
	AI_Output (self, other ,"DIA_Zick_WhoYou_03_04"); //Lepiej ze mn¹ nie zadzieraj. 
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
   description	= "Myœlê, ¿e to tylko puste przechwa³ki.";
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
    AI_Output (other, self ,"DIA_Zick_ValuableInfo_15_01"); //Myœlê, ¿e to tylko puste przechwa³ki.
    AI_Output (self, other ,"DIA_Zick_ValuableInfo_03_02"); //Kolejny! Wszyscy myœlicie, ¿e osi¹gn¹³em to co mam tylko dlatego, ¿e Lewus jest moim bratankiem?
	AI_Output (self, other ,"DIA_Zick_ValuableInfo_03_03"); //Ju¿ ja wam kiedyœ poka¿ê. Nie zmuszaj mnie do wyci¹gania orê¿a!
	AI_Output (other, self ,"DIA_Zick_ValuableInfo_15_04"); //Dobra, dobra, tylko przestañ siê wydzieraæ.
	
	if (Npc_KnowsInfo (hero, DIA_Josep_Truth)) && (MIS_MissedJosep == LOG_RUNNING)
	{
	B_LogEntry    (CH1_MissedJosep,"Dowiedzia³em siê, ¿e Zick jest bratankiem Lewusa. Ta informacja mo¿e byæ dla mnie bardzo cenna.");
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
   description	= "A wiêc Lewus to twój bratanek...";
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
    AI_Output (other, self ,"DIA_Zick_Try_15_01"); //A wiêc Lewus to twój bratanek...
    AI_Output (self, other ,"DIA_Zick_Try_03_02"); //On nie ma nic wspólnego z moj¹ karier¹! Zrozumcie to w koñcu!
	AI_Output (other, self ,"DIA_Zick_Try_15_03"); //Chcê z tob¹ pogadaæ, za obozem, na osobnoœci. 
	AI_Output (self, other ,"DIA_Zick_Try_03_04"); //O nie! Nigdzie z tob¹ nie pójdê. Jeœli, coœ mi siê stanie, Lewus wypruje ci flaki.
	
	B_LogEntry    (CH1_MissedJosep,"Wyci¹gniêcie Zicka z obozu to nie taka prosta sprawa. Mo¿e ktoœ bêd¹cy w pobli¿u móg³by mi jakoœ pomóc?");
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
   description	= "A teraz pójdziesz z nami.";
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
    AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_01"); //A teraz pójdziesz z nami...
    AI_Output (self, other ,"DIA_Zick_ComeWithUs_03_02"); //Przecie¿ powiedzia³em, ¿e...!
	AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_03"); //Inaczej ten ciemnoskóry facet i ja zrobimy ci krzywdê tak szybko, ¿e Lewus nawet nie zd¹¿y mrugn¹æ, a co dopiero siê tu zjawiæ.
	AI_Output (self, other ,"DIA_Zick_ComeWithUs_03_04"); //Proszê! Nie!
	AI_Output (other, self ,"DIA_Zick_ComeWithUs_15_05"); //Za mn¹.
	
	Npc_ExchangeRoutine (self,"follow");
};