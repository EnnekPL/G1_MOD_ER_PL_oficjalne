//poprawione i sprawdzone - Nocturn

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "Co tu robisz?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
if  (!Npc_KnowsInfo(hero,DIA_Shrat_GoldMine))
{
	return 1; };
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Czy pozwoli³em ci siê do mnie odezwaæ?!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Tylko ¿artujê! Te cholerne œwiry zaczynaj¹ mnie ju¿ denerwowaæ, dlatego tu jestem!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //"Nie odzywaj siê do mnie!" - "Módl siê o ³askê Œni¹cego!" - "Twoje zadanie jest szczególnie wa¿ne!"
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Przy tych ludziach mo¿na w mig zwariowaæ. Nic dziwnego, ¿e mieszkaj¹ tam sami wariaci.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Jestem Shrat, Nowicjusz pierwszego stopnia. I bêdê nim ju¿ do koñca ¿ycia!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	&& (!Npc_KnowsInfo(hero,DIA_Shrat_GoldMine))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Chcesz tu zamieszkaæ? A ja zastanawiam siê w³aœnie jak st¹d uciec!
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Moglibyœmy przemierzyæ ca³¹ Koloniê, odci¹¿yæ kilku frajerów z ich gotówki, zebraæ trochê rudy - co ty na to?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) ) && (MIS_UcieczkaShrata != LOG_SUCCESS) 
	&& (!Npc_KnowsInfo(hero,DIA_Shrat_GoldMine))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //To w³aœnie chcia³em us³yszeæ! ChodŸmy!

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Dobra. Ja wracam do mojej kryjówki na bagnach. Uwa¿aj na siebie!

	if (Npc_KnowsInfo(hero,DIA_Shrat_GoldMine))
	{
	if (Npc_KnowsInfo(hero,DIA_Will_PrzystanekZamosc))
	{
	Npc_ExchangeRoutine (self, "mine");
	}
	else
	{
	Npc_ExchangeRoutine (self,"wait");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	}
	else
	{
	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
};

// **************************************************
//				Goldmine
// **************************************************

instance  DIA_Shrat_GoldMine (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_GoldMine_Condition;
	information	= DIA_Shrat_GoldMine_Info;
	permanent	= 0;
	description	= "Poszukujê kogoœ do pracy w kopalni z³ota.";
};                       

FUNC int  DIA_Shrat_GoldMine_Condition()
{
	if (MIS_GoldMine == LOG_RUNNING)
	{
	return 1;
	};
};

FUNC VOID  DIA_Shrat_GoldMine_Info()
{
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_00"); //Poszukujê kogoœ do pracy w kopalni z³ota.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_01"); //Widzê, ¿e co poniektórym odbija ju¿ od palenia ziela.	
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_02"); //IdŸ do ³ó¿ka i trochê odpocznij. I nie pal wiêcej ziela!
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_03"); //Ale ja mówiê powa¿nie. Pewien Najemnik z Nowego Obozu ponoæ odnalaz³ z³o¿e z³ota w Kolonii. Nie wiem ile w tym prawdy, ale zaufa³em mu.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_04"); //Mam odnaleŸæ zaufanych ludzi do pracy?
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_05"); //Wiêc dlaczego przyszed³eœ z tym do mnie? Nie jestem nawet górnikiem. Czy¿bym zatem by³ zaufanym cz³owiekiem?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_06"); //Jesteœ renegatem przesiaduj¹cym starej chacie na œrodku bagna... Chyba pora coœ zmieniæ.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_07"); //Masz racjê. A wiêc zaprowadŸ mnie do tej kopalni z³ota. Bêdê tam pracowa³.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_08"); //Jeszcze nie wiem, gdzie to jest. Wszyscy moi kandydaci musz¹ spotkaæ siê z Willem w Nowym Obozie, w karczmie na jeziorze.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_09"); //Nowy Obóz, karczma na jeziorze... Zapamiêtam. Wkrótce siê tam zjawiê.
	B_LogEntry (CH2_GoldMine,"Nowicjusz - renegat Shrat zgodzi³ siê pracowaæ w kopalni z³ota Willa. To by³a naprawdê dobra myœl, ¿eby go w to wci¹gn¹æ.");
	Npc_ExchangeRoutine (self,"wait");
    B_GiveXP (150);
	//ShratHaveWork = TRUE;
};
