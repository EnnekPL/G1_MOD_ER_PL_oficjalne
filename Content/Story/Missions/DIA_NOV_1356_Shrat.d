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
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Czy pozwoli�em ci si� do mnie odezwa�?!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Tylko �artuj�! Te cholerne �wiry zaczynaj� mnie ju� denerwowa�, dlatego tu jestem!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //"Nie odzywaj si� do mnie!" - "M�dl si� o �ask� �ni�cego!" - "Twoje zadanie jest szczeg�lnie wa�ne!"
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Przy tych ludziach mo�na w mig zwariowa�. Nic dziwnego, �e mieszkaj� tam sami wariaci.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Jestem Shrat, Nowicjusz pierwszego stopnia. I b�d� nim ju� do ko�ca �ycia!
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
	description	= "Chcia�bym do��czy� do Bractwa. Mo�esz mi pom�c?";
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
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Chcia�bym do��czy� do Bractwa. Mo�esz mi pom�c?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Chcesz tu zamieszka�? A ja zastanawiam si� w�a�nie jak st�d uciec!
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Mogliby�my przemierzy� ca�� Koloni�, odci��y� kilku frajer�w z ich got�wki, zebra� troch� rudy - co ty na to?
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
	description	= "Jasne! Trzymajmy si� razem! Chod� ze mn�!";
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
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Jasne! Trzymajmy si� razem! Chod� ze mn�!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //To w�a�nie chcia�em us�ysze�! Chod�my!

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
	description	= "Tutaj nasze drogi si� rozchodz�. Dalej p�jd� sam.";
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
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Tutaj nasze drogi si� rozchodz�. Dalej p�jd� sam.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Dobra. Ja wracam do mojej kryj�wki na bagnach. Uwa�aj na siebie!

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
	description	= "Poszukuj� kogo� do pracy w kopalni z�ota.";
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
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_00"); //Poszukuj� kogo� do pracy w kopalni z�ota.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_01"); //Widz�, �e co poniekt�rym odbija ju� od palenia ziela.	
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_02"); //Id� do ��ka i troch� odpocznij. I nie pal wi�cej ziela!
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_03"); //Ale ja m�wi� powa�nie. Pewien Najemnik z Nowego Obozu pono� odnalaz� z�o�e z�ota w Kolonii. Nie wiem ile w tym prawdy, ale zaufa�em mu.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_04"); //Mam odnale�� zaufanych ludzi do pracy?
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_05"); //Wi�c dlaczego przyszed�e� z tym do mnie? Nie jestem nawet g�rnikiem. Czy�bym zatem by� zaufanym cz�owiekiem?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_06"); //Jeste� renegatem przesiaduj�cym starej chacie na �rodku bagna... Chyba pora co� zmieni�.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_07"); //Masz racj�. A wi�c zaprowad� mnie do tej kopalni z�ota. B�d� tam pracowa�.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_08"); //Jeszcze nie wiem, gdzie to jest. Wszyscy moi kandydaci musz� spotka� si� z Willem w Nowym Obozie, w karczmie na jeziorze.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_09"); //Nowy Ob�z, karczma na jeziorze... Zapami�tam. Wkr�tce si� tam zjawi�.
	B_LogEntry (CH2_GoldMine,"Nowicjusz - renegat Shrat zgodzi� si� pracowa� w kopalni z�ota Willa. To by�a naprawd� dobra my�l, �eby go w to wci�gn��.");
	Npc_ExchangeRoutine (self,"wait");
    B_GiveXP (150);
	//ShratHaveWork = TRUE;
};
