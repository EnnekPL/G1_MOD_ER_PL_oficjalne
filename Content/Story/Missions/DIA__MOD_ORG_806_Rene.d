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
    
    AI_Output (self, other ,"DIA_Rene_HateZick_03_01"); //Ale bym mu zrobi³ krzywdê...
	AI_Output (self, other ,"DIA_Rene_HateZick_03_02"); //Cholerny kretyn. Wszystkich dra¿ni dooko³a. I te ci¹g³e brednie o jego bratanku Lewusie.
	AI_Output (other, self ,"DIA_Rene_HateZick_15_03"); //A gdybym da³ ci okazjê nieco wkurzyæ Zicka?
	AI_Output (self, other ,"DIA_Rene_HateZick_03_04"); //Co masz na myœli?
	AI_Output (other, self ,"DIA_Rene_HateZick_15_05"); //Potrzebujê go jako zak³adnika. Muszê wp³yn¹æ na Lewusa. To bardzo wa¿ne.
	AI_Output (self, other ,"DIA_Rene_HateZick_03_06"); //Nawet jeœli zrobi³byœ to dla jaj i tak bym siê na to pisa³, brachu!
	AI_Output (self, other ,"DIA_Rene_HateZick_03_07"); //Zrobimy tak: najpierw zmuœ tego idiotê ¿eby za nami poszed³. 
	AI_Output (self, other ,"DIA_Rene_HateZick_03_08"); //Ja poprowadzê nas w jakieœ ustronne miejsce i bêdê pilnowa³ Zicka podczas gdy ty bêdziesz negocjowa³ z Lewusem.
	AI_Output (other, self ,"DIA_Rene_HateZick_15_09"); //W porz¹dku. Postaram siê go jakoœ przekonaæ.
	AI_Output (self, other ,"DIA_Rene_HateZick_03_10"); //Nie patyczkuj siê z nim. Po prostu go postrasz. 
	
	B_LogEntry    (CH1_MissedJosep,"Szkodnik Rene ochoczo zadeklarowa³ chêæ pomocy. Muszê teraz zmusiæ Zicka do tego, ¿eby poszed³ za nami.");
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
    
    AI_Output (self, other ,"DIA_Rene_Guide_03_01"); //Pod¹¿aj za mn¹. Uwa¿aj tylko, ¿eby nie uciek³.
	
	B_LogEntry    (CH1_MissedJosep,"Uda³o siê zmusiæ Zicka do pójœcia z nami. Teraz muszê zdaæ siê na Rene.");
	
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
    
    AI_Output (self, other ,"DIA_Rene_AtPlace_03_01"); //Wyœmienite miejsce. Z dala od zgie³ku i niepotrzebnych interesantów.
	AI_Output (self, other ,"DIA_Rene_AtPlace_03_02"); //Mo¿esz iœæ zaj¹æ siê swoimi sprawami. Ja tutaj sobie z nim posiedzê.
	
	B_LogEntry    (CH1_MissedJosep,"Zick zostanie przez jakiœ czas z Rene. Mogê iœæ negocjowaæ z Lewusem.");
	
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
    
    AI_Output (self, other ,"DIA_Rene_AfterParty_03_01"); //Ju¿ po wszystkim?
	AI_Output (other, self ,"DIA_Rene_AfterParty_15_02"); //Tak, mo¿ecie wracaæ do obozu. Lewus zgodzi³ siê na moje warunki. Dziêki za pomoc!
	AI_Output (self, other ,"DIA_Rene_AfterParty_03_03"); //Nie ma sprawy, kolego!
	
	B_LogEntry    (CH1_MissedJosep,"Zick i Rene wrócili do obozu. Pora porozmawiaæ ponownie z Lewusem.");
	
	Npc_ExchangeRoutine (ORG_806_Rene,"start");
	Npc_ExchangeRoutine (ORG_823_Zick,"start");
	
	AI_StopProcessInfos	(ORG_806_Rene);
};