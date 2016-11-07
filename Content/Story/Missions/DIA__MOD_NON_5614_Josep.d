//DIALOGI POPRAWIONE I SPRAWDZONE JÊZYKOWO //g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Josep_EXIT(C_INFO)
{
	npc             = NON_5614_Josep;
	nr              = 999;
	condition	= DIA_Josep_EXIT_Condition;
	information	= DIA_Josep_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Josep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Josep_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WODA
//========================================

INSTANCE DIA_Josep_WODA (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_WODA_Condition;
   information  = DIA_Josep_WODA_Info;
   permanent	= TRUE;
   description	= "Przynios³em ci wodê.";
};

FUNC INT DIA_Josep_WODA_Condition()
{
    if ((Lefty_Mission==LOG_RUNNING) || (Lefty_Mission==LOG_SUCCESS)) && Npc_HasItems(other, ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& (!Npc_KnowsInfo (hero, DIA_Josep_GoAway))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_WODA_Info()
{
    AI_Output (other, self ,"DIA_Josep_WODA_15_01"); //Przynios³em ci wodê.
  if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
    {
    AI_Output (self, other ,"DIA_Josep_WODA_03_02"); //O, dziêki. Umieram z pragnienia!
B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;  
    }
    else
    {
        AI_Output (self, other ,"DIA_Josep_WODA_03_03"); //Przecie¿ nie masz wody! Próbujesz ze mnie ¿artowaæ?!
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Josep_Angry (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Angry_Condition;
   information  = DIA_Josep_Angry_Info;
   permanent	= FALSE;
   description	= "Nie wygl¹dasz mi na zbieracza.";
};

FUNC INT DIA_Josep_Angry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_NewQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Angry_Info()
{
    AI_Output (other, self ,"DIA_Josep_Angry_15_01"); //Nie wygl¹dasz mi na zbieracza.
    AI_Output (self, other ,"DIA_Josep_Angry_03_02"); //A ty nie wygl¹dasz mi na kogoœ inteligentnego. Spadaj! Zostaw mnie w spokoju!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sorry
//========================================

INSTANCE DIA_Josep_Sorry (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sorry_Condition;
   information  = DIA_Josep_Sorry_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Josep_Sorry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Angry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sorry_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sorry_03_01"); //Ej, zaczekaj. Przepraszam. I tak, masz racjê. Nie jestem Zbieraczem.
	AI_Output (self, other ,"DIA_Josep_Sorry_03_02"); //By³em myœliwym. Nazywam siê Josep.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_03"); //Co wiêc robisz na polach ry¿owych?
	AI_Output (self, other ,"DIA_Josep_Sorry_03_04"); //Niewolniczo pracujê na rzecz Ry¿owego Ksiêcia. To Lewus mnie w to wpakowa³. Pod³y sukinsyn.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_05"); //Spróbujê ciê st¹d wydostaæ.
	AI_Output (self, other ,"DIA_Josep_Sorry_03_06"); //Wyjdê na wolnoœæ, kiedy ten wieprz zginie.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_07"); //Zobaczê, co da siê zrobiæ. Byæ mo¿e to nie bêdzie konieczne. 
	AI_Output (self, other ,"DIA_Josep_Sorry_03_08"); //Jeœli mnie st¹d wyci¹gniesz, bêdê mia³ u ciebie olbrzymi d³ug.
	
	B_LogEntry               (CH1_MissedJosep,"Odnalaz³em Josepa na polach ry¿owych. Dowiedzia³em siê, ¿e jest jeñcem Lewusa. Ciekawe co takiego zrobi³. Muszê porozmawiaæ ze Szkodnikiem.");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Truth
//========================================

INSTANCE DIA_Josep_Truth (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Truth_Condition;
   information  = DIA_Josep_Truth_Info;
   permanent	= FALSE;
   description	= "Dlaczego mi nie powiedzia³eœ o kradzie¿y w magazynie?";
};

FUNC INT DIA_Josep_Truth_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lefty_WhatDidJosep))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Truth_Info()
{
	AI_Output (other, self ,"DIA_Josep_Truth_15_01"); //Dlaczego mi nie powiedzia³eœ o kradzie¿y w magazynie?
	AI_Output (self, other ,"DIA_Josep_Truth_03_02"); //Bo to nieistotne. 
	AI_Output (other, self ,"DIA_Josep_Truth_15_03"); //Faktycznie, taka ma³a drobnostka...
	AI_Output (self, other ,"DIA_Josep_Truth_03_04"); //S³uchaj, mia³em zlecenie. To tyle! Lepiej wymyœl jak mnie st¹d wydostaæ, jeœli chcesz cokolwiek zarobiæ.
	AI_Output (other, self ,"DIA_Josep_Truth_15_05"); //To nie takie proste. Œmieræ Lewusa poci¹gnê³aby za sob¹ kolejne. W tym moj¹...
	AI_Output (self, other ,"DIA_Josep_Truth_03_06"); //Rozmawia³em z kilkoma Zbieraczami. Musisz znaleŸæ jakaœ kartê przetargow¹. Ja w zamian za coœ lub kogoœ...
	AI_Output (self, other ,"DIA_Josep_Truth_03_07"); //Wtedy bêdziesz móg³ z nim negocjowaæ. Tylko to nie mo¿e byæ byle co. Pomyœl chwilê zanim coœ zrobisz.
	
	B_LogEntry               (CH1_MissedJosep,"Zabicie Lewusa nie wchodzi w grê. Josep zaproponowa³ wiêc, ¿ebym znalaz³ coœ lub kogoœ cennego dla Lewusa. Wtedy bêdê móg³ dokonaæ wymiany.");
	
	if (Npc_KnowsInfo (hero, DIA_Zick_ValuableInfo)) && (MIS_MissedJosep == LOG_RUNNING)
	{
	B_LogEntry    (CH1_MissedJosep,"Przypomnia³em sobie, ¿e niejaki Zick wspomina³ kiedyœ, ¿e jest bratankiem Lewusa. Pamiêtam, ¿e ten egoistyczny Szkodnik mieszka³ w chacie niedaleko Laresa.");
	AI_Output (other, self ,"DIA_Josep_Truth_15_08"); //Lewus ma bratanka w obozie. Nazywa siê Zick. 
	AI_Output (self, other ,"DIA_Josep_Truth_03_09"); //Doskonale. Teraz tylko weŸ go jako zak³adnika i po problemie.
	};
    AI_StopProcessInfos	(self);
};

////////////////////////////////////////////////
//			Go Away
///////////////////////////////////////////////

INSTANCE DIA_Josep_GoAway (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_GoAway_Condition;
   information  = DIA_Josep_GoAway_Info;
   permanent	= FALSE;
   description	= "Zbierajmy siê st¹d.";
};

FUNC INT DIA_Josep_GoAway_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Lefty_NowFree))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_GoAway_Info()
{
    AI_Output (other, self ,"DIA_Josep_GoAway_15_01"); //Zbierajmy siê st¹d.
    AI_Output (self, other ,"DIA_Josep_GoAway_03_02"); //Nareszcie! ChodŸ za mn¹. Pójdziemy razem do obozu myœliwych. 

	B_LogEntry    (CH1_MissedJosep,"Josep poprosi³ mnie, aby wróciæ do obozu razem z nim. Jest mi to na rêkê. Muszê przecie¿ odebraæ zap³atê od Alexa.");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"guide");
	AI_StopProcessInfos	(self);
};

////////////////////////////////////////////////
//			Enemies
///////////////////////////////////////////////

INSTANCE DIA_Josep_Enemies (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Enemies_Condition;
   information  = DIA_Josep_Enemies_Info;
   permanent	= FALSE;
   important 	= TRUE;
};

FUNC INT DIA_Josep_Enemies_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Josep_GoAway)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP (hero, "OW_PATH_066") < 1000) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Enemies_Info()
{
    AI_Output (self, other ,"DIA_Josep_Enemies_03_01"); //Czyli jednak nie obejdzie siê bez rozlewu krwi! Chc¹ tego, dobrze, niech maj¹!
	AI_Output (self, other ,"DIA_Josep_Enemies_03_02"); //Nie bierz jeñców.

	B_LogEntry    (CH1_MissedJosep,"Po drodze do obozu spotkaliœmy Zicka i dwóch jego popleczników. To pewnie dlatego musia³em czekaæ jeden dzieñ. Musieli siê zorganizowaæ przeciwko nam. Josep kaza³ mi zabijaæ bez litoœci.");
	
	NON_5614_Josep.flags = 2;
	Npc_ExchangeRoutine (NON_5614_Josep,"guide2");
	AI_StopProcessInfos	(NON_5614_Josep);
	
	B_ChangeGuild    (ORG_895_Organisator,GIL_DMB);
	B_ChangeGuild    (ORG_896_Organisator,GIL_DMB);
	B_ChangeGuild    (ORG_823_Zick,GIL_DMB);
};

////////////////////////////////////////////////
//			Camp
///////////////////////////////////////////////

INSTANCE DIA_Josep_Camp (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Camp_Condition;
   information  = DIA_Josep_Camp_Info;
   permanent	= FALSE;
   important 	= TRUE;
};

FUNC INT DIA_Josep_Camp_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Josep_GoAway)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP (hero, "OW_PATH_066") < 1000) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Camp_Info()
{
    AI_Output (self, other ,"DIA_Josep_Camp_03_01"); //Jesteœmy na miejscu! Jestem ci cholernie wdziêczny za pomoc. 
	AI_Output (self, other ,"DIA_Josep_Camp_03_02"); //Postaram ci siê to jakoœ wynagrodziæ w przysz³oœci. W ci¹gu kilku tygdoni powinienem siê odkuæ i zarobiæ sporo rudy.
	AI_Output (self, other ,"DIA_Josep_Camp_03_03"); //Niestety te bandziory zabra³y mi wszystko co mia³em.
	AI_Output (other, self ,"DIA_Josep_Camp_15_04"); //W porz¹dku. Wynagrodzenie od Alexa powinno wystarczyæ na jakiœ czas.

	B_LogEntry    (CH1_MissedJosep,"Razem z Josepem wróciliœmy do obozu myœliwych. ");
	
	NON_5614_Josep.flags = 0;
	Npc_ExchangeRoutine (NON_5614_Josep,"camp2");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
};

