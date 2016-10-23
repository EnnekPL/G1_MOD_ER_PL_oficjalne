///////////////////////////////////////////////
//				ENDE
///////////////////////////////////////////////

INSTANCE DIA_Rene_EXIT(C_INFO)
{
	npc             = ORG_806_Rene;
	nr              = 999;
	condition		= DIA_Rene_EXIT_Condition;
	information		= DIA_Rene_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rene_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rene_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////
//				Hate Zick
///////////////////////////////////////////////

INSTANCE DIA_Rene_HateZick (C_INFO)
{
   npc          = ORG_806_Rene;
   nr           = 1;
   condition    = DIA_Rene_HateZick_Condition;
   information  = DIA_Rene_HateZick_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rene_HateZick_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Zick_Try))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rene_HateZick_Info()
{
    
    AI_Output (self, other ,"DIA_Rene_HateZick_03_01"); //Ale bym mu zrobi� krzywd�...
	AI_Output (self, other ,"DIA_Rene_HateZick_03_02"); //Cholerny kretyn. Wszystkich dra�ni dooko�a. I te ci�g�e brednie o jego bratanku Lewusie.
	AI_Output (other, self ,"DIA_Rene_HateZick_15_03"); //A gdybym da� ci okazj� nieco wkurzy� Zicka?
	AI_Output (self, other ,"DIA_Rene_HateZick_03_04"); //Co masz na my�li?
	AI_Output (other, self ,"DIA_Rene_HateZick_15_05"); //Potrzebuj� go jako zak�adnika. Musz� wp�yn�� na Lewusa. To bardzo wa�ne.
	AI_Output (self, other ,"DIA_Rene_HateZick_03_06"); //Nawet je�li zrobi�by� to dla jaj i tak bym si� na to pisa�, brachu!
	AI_Output (self, other ,"DIA_Rene_HateZick_03_07"); //Zrobimy tak: najpierw zmu� tego idiot� �eby za nami poszed�. 
	AI_Output (self, other ,"DIA_Rene_HateZick_03_08"); //Ja poprowadz� nas w jakie� ustronne miejsce i b�d� pilnowa� Zicka podczas gdy ty b�dziesz negocjowa� z Lewusem.
	AI_Output (other, self ,"DIA_Rene_HateZick_15_09"); //W porz�dku. Postaram si� go jako� przekona�.
	AI_Output (self, other ,"DIA_Rene_HateZick_03_10"); //Nie patyczkuj si� z nim. Po prostu go postrasz. 
	
	B_LogEntry    (CH1_MissedJosep,"Szkodnik Rene ochoczo zadeklarowa� ch�� pomocy. Musz� teraz zmusi� Zicka do tego, �eby poszed� za nami.");
};

///////////////////////////////////////////////
//				Guide
///////////////////////////////////////////////

INSTANCE DIA_Rene_Guide (C_INFO)
{
   npc          = ORG_806_Rene;
   nr           = 1;
   condition    = DIA_Rene_Guide_Condition;
   information  = DIA_Rene_Guide_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rene_Guide_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Zick_ComeWithUs))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rene_Guide_Info()
{
    
    AI_Output (self, other ,"DIA_Rene_Guide_03_01"); //Pod��aj za mn�. Uwa�aj tylko, �eby nie uciek�.
	
	B_LogEntry    (CH1_MissedJosep,"Uda�o si� zmusi� Zicka do p�j�cia z nami. Teraz musz� zda� si� na Rene.");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"guide");
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////
//				At place
///////////////////////////////////////////////

INSTANCE DIA_Rene_AtPlace (C_INFO)
{
   npc          = ORG_806_Rene;
   nr           = 1;
   condition    = DIA_Rene_AtPlace_Condition;
   information  = DIA_Rene_AtPlace_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rene_AtPlace_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Rene_Guide)) && (Npc_GetDistToWP (hero, "OW_PATH_075_GUARD4") < 700) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rene_AtPlace_Info()
{
    
    AI_Output (self, other ,"DIA_Rene_AtPlace_03_01"); //Wy�mienite miejsce. Z dala od zgie�ku i niepotrzebnych interesant�w.
	AI_Output (self, other ,"DIA_Rene_AtPlace_03_02"); //Mo�esz i�� zaj�� si� swoimi sprawami. Ja tutaj sobie z nim posiedz�.
	
	B_LogEntry    (CH1_MissedJosep,"Zick zostanie przez jaki� czas z Rene. Mog� i�� negocjowa� z Lewusem.");
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (ORG_806_Rene,"boss");
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (ORG_823_Zick,"loser");
};

///////////////////////////////////////////////
//				AfterParty
///////////////////////////////////////////////

INSTANCE DIA_Rene_AfterParty (C_INFO)
{
   npc          = ORG_806_Rene;
   nr           = 1;
   condition    = DIA_Rene_AfterParty_Condition;
   information  = DIA_Rene_AfterParty_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rene_AfterParty_Condition()
{
 	if (Npc_KnowsInfo (hero, DIA_Lefty_Zick)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rene_AfterParty_Info()
{
    
    AI_Output (self, other ,"DIA_Rene_AfterParty_03_01"); //Ju� po wszystkim?
	AI_Output (other, self ,"DIA_Rene_AfterParty_15_02"); //Tak, mo�ecie wraca� do obozu. Lewus zgodzi� si� na moje warunki. Dzi�ki za pomoc!
	AI_Output (self, other ,"DIA_Rene_AfterParty_03_03"); //Nie ma sprawy, kolego!
	
	B_LogEntry    (CH1_MissedJosep,"Zick i Rene wr�cili do obozu. Pora porozmawia� ponownie z Lewusem.");
	
	Npc_ExchangeRoutine (ORG_806_Rene,"start");
	Npc_ExchangeRoutine (ORG_823_Zick,"start");
	
	AI_StopProcessInfos	(ORG_806_Rene);
};