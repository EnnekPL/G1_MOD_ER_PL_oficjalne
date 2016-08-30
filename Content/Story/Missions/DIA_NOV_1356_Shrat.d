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
	if (MIS_KopalniaZlota == LOG_RUNNING)
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
	B_LogEntry (CH1_KopalniaZlota,"Nowicjusz - renegat Shrat zgodzi� si� pracowa� w kopalni z�ota Willa. To by�a naprawd� dobra my�l, �eby go w to wci�gn��.");
	Npc_ExchangeRoutine (self,"wait");
    B_GiveXP (150);
};




























//========================================
//-----------------> Ulepszanie
//========================================

INSTANCE DIA_Shrat_Ulepszanie (C_INFO)
{
   npc          = Nov_1356_Shrat;
   nr           = 989;
   condition    = DIA_Shrat_Ulepszanie_Condition;
   information  = DIA_Shrat_Ulepszanie_Info;
   permanent	= true;
   description	= "[Ulepszaj pomocnika]";
};

FUNC INT DIA_Shrat_Ulepszanie_Condition()
{
    if (self.aivar[AIV_PARTYMEMBER]==TRUE) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrat_Ulepszanie_Info()
{
    Info_ClearChoices		(DIA_Shrat_Ulepszanie);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 5 (atr. 25, umiej. 0, 678 bry�ek rudy)", DIA_Shrat_Ulepszanie_5Level);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 10 (atr. 45, umiej. 0, 1450 bry�ek rudy)", DIA_Shrat_Ulepszanie_Level10);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 20 (atr. 75, umiej. 1, 3700 bry�ek rudy)", DIA_Shrat_Ulepszanie_level20);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 30 (atr. 110, umiej. 2, 5200 bry�ek rudy)", DIA_Shrat_Ulepszanie_Level30);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, DIALOG_BACK, DIA_Shrat_Ulepszanie_BACK);
};

FUNC VOID DIA_Shrat_Ulepszanie_5Level()
{
if  (Nov_1356_Shrat.Level > 5)  
{
if (Npc_HasItems (hero, ItMiNugget) >=678)
{
Print ("Ulepszy�e� pomocnika!");
Nov_1356_Shrat.level = 5;
Nov_1356_Shrat.attribute[ATR_STRENGTH] = 25;
Nov_1356_Shrat.attribute[ATR_DEXTERITY] = 25;
Nov_1356_Shrat.attribute[ATR_MANA_MAX] = 25;
Nov_1356_Shrat.attribute[ATR_MANA] = 25;
Nov_1356_Shrat.attribute[ATR_HITPOINTS_MAX] = 100;
Nov_1356_Shrat.attribute[ATR_HITPOINTS] = 100;
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_M);
EquipItem (Nov_1356_Shrat, ItMw_1H_Mace_03);
Npc_RemoveInvItems (hero, ItMiNugget, 678);
}
else
{
Print ("Za ma�o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_Level10()
{
if  (Nov_1356_Shrat.Level > 10) 
{
if (Npc_HasItems (hero, ItMiNugget) >=1450) {
Print ("Ulepszy�e� pomocnika!");
Nov_1356_Shrat.level = 10;
Nov_1356_Shrat.attribute[ATR_STRENGTH] = 45;
Nov_1356_Shrat.attribute[ATR_DEXTERITY] = 45;
Nov_1356_Shrat.attribute[ATR_MANA_MAX] = 45;
Nov_1356_Shrat.attribute[ATR_MANA] = 45;
Nov_1356_Shrat.attribute[ATR_HITPOINTS_MAX] = 200;
Nov_1356_Shrat.attribute[ATR_HITPOINTS] = 200;
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_H);
EquipItem (Nov_1356_Shrat, ItMw_1H_Mace_War_02);
Npc_RemoveInvItems (hero, ItMiNugget, 1450);
}
else
{
Print ("Za ma�o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_level20()
{
if  (Nov_1356_Shrat.Level > 20)
{
 if (Npc_HasItems (hero, ItMiNugget) >=3700) {
Print ("Ulepszy�e� pomocnika!");
Nov_1356_Shrat.level = 20;
Nov_1356_Shrat.attribute[ATR_STRENGTH] = 75;
Nov_1356_Shrat.attribute[ATR_DEXTERITY] = 75;
Nov_1356_Shrat.attribute[ATR_MANA_MAX] = 75;
Nov_1356_Shrat.attribute[ATR_MANA] = 75;
Nov_1356_Shrat.attribute[ATR_HITPOINTS_MAX] = 300;
Nov_1356_Shrat.attribute[ATR_HITPOINTS] = 300;
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, TPL_ARMOR_L);
EquipItem (Nov_1356_Shrat, ItMw_1H_Mace_War_02);
Npc_RemoveInvItems (hero, ItMiNugget, 3700);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_BOW,1);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_1H,1);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_2H,1);
}
else
{
Print ("Za ma�o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_Level30()
{
if  (Nov_1356_Shrat.Level > 30) 
{
if (Npc_HasItems (hero, ItMiNugget) >=5200) 
{
Print ("Ulepszy�e� pomocnika!");
Nov_1356_Shrat.level = 30;
Nov_1356_Shrat.attribute[ATR_STRENGTH] = 110;
Nov_1356_Shrat.attribute[ATR_DEXTERITY] = 110;
Nov_1356_Shrat.attribute[ATR_MANA_MAX] = 110;
Nov_1356_Shrat.attribute[ATR_MANA] = 110;
Nov_1356_Shrat.attribute[ATR_HITPOINTS_MAX] = 450;
Nov_1356_Shrat.attribute[ATR_HITPOINTS] = 450;
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NON_ORCHUNTERARMOR_01);
EquipItem (Nov_1356_Shrat, ItMw_1H_Mace_War_02);
Npc_RemoveInvItems (hero, ItMiNugget, 5200);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_BOW,2);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_1H,2);
Npc_SetTalentSkill (Nov_1356_Shrat, NPC_TALENT_2H,2);
}
else
{
Print ("Za ma�o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_BACK()
{
    Info_ClearChoices	(DIA_Shrat_Ulepszanie);
};


//========================================
//-----------------> MagicZiolo
//========================================

INSTANCE DIA_Shrat_MagicZiolo (C_INFO)
{
   npc          = Nov_1356_Shrat;
   nr           = 1;
   condition    = DIA_Shrat_MagicZiolo_Condition;
   information  = DIA_Shrat_MagicZiolo_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� magicznego ziela.";
};

FUNC INT DIA_Shrat_MagicZiolo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczuraMAm))
    && (MIS_PomocClawowi == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrat_MagicZiolo_Info()
{
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_01"); //Potrzebuj� magicznego ziela.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_02"); //Dlaczego mia�bym ci je da�?
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_03"); //Jeden z my�liwych jest ci�ko chory.
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_04"); //Caine potrzebuje tej ro�liny, aby m�c sporz�dzi� odtrutk�.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_05"); //Caine? Czy to nie ten pomocnik Kaloma?
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_06"); //Tak, to on.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_07"); //Pos�uchaj. Nie chc� mie� nic wsp�lnego z tymi �wirami.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_08"); //Dam ci dwie sztuki tej ro�liny, je�eli znajdziesz mi miejsce w innym obozie. 
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_09"); //Gdziekolwiek! Musz� si� st�d wyrwa�.
    MIS_UCieczkaShrata = LOG_RUNNING;
	ShratHaveWork = false;
    Log_CreateTopic            (CH1_UCieczkaShrata, LOG_MISSION);
    Log_SetTopicStatus       (CH1_UCieczkaShrata, LOG_RUNNING);
    B_LogEntry                     (CH1_UCieczkaShrata,"Shrat da mi dwie sztuki magicznego ziela, je�eli znajd� mu miejsce w innym obozie. ");
};

//========================================
//-----------------> FindMiejscowka
//========================================

INSTANCE DIA_Shrat_FindMiejscowka (C_INFO)
{
   npc          = Nov_1356_Shrat;
   nr           = 1;
   condition    = DIA_Shrat_FindMiejscowka_Condition;
   information  = DIA_Shrat_FindMiejscowka_Info;
   permanent	= FALSE;
   description	= "Znalaz�em ci nowe miejsce.";
};

FUNC INT DIA_Shrat_FindMiejscowka_Condition()
{
    if (ShratHaveWork == true)
    && (MIS_UcieczkaShrata == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrat_FindMiejscowka_Info()
{
    AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_01"); //Znalaz�em ci nowe miejsce.
    AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_02"); //Jakie? Gdzie mam si� uda�?
    if (Npc_KnowsInfo (hero, DIA_Alex_NovizeShrat))
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_03"); //Przyjmie ci� Alex z obozu my�liwych.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_04"); //�wietnie. Ju� tam id�.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_05"); //Dzi�kuj� ci. We� to ziele, tak jak ci obieca�em. 
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo�e i�� do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
        B_GiveXP (150);
		Npc_ExchangeRoutine (self,"hunters");
    }
    else if (Npc_KnowsInfo (hero, DIA_Mazin_HELLO1))
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_06"); //Masz pracowa� jako pomocnik w karczmie Mazina.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_07"); //Gdzie to jest?
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_08"); //Karczma znajduje si� w Nowym Obozie.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_09"); //Dzi�kuj� ci za pomoc. We� to ziele.
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo�e i�� do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
		Npc_ExchangeRoutine (self,"karczma");
        B_GiveXP (150);
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
    }
	    else if (MIS_KopalniaZlota == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_10"); //B�dziesz kopa� z�oto.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_11"); //Z�oto?
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_08"); //Tak. Spotykamy si� w Nowym Obozie.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_09"); //Dzi�kuj� ci za pomoc. We� to ziele.
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo�e i�� do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
		Npc_ExchangeRoutine (self,"wait");
        B_GiveXP (200);
		Shrat_gototavern = true;
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
    };
};