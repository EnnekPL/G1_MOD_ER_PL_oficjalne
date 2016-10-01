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
	if (MIS_KopalniaZlota == LOG_RUNNING)
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
	B_LogEntry (CH1_KopalniaZlota,"Nowicjusz - renegat Shrat zgodzi³ siê pracowaæ w kopalni z³ota Willa. To by³a naprawdê dobra myœl, ¿eby go w to wci¹gn¹æ.");
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
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 5 (atr. 25, umiej. 0, 678 bry³ek rudy)", DIA_Shrat_Ulepszanie_5Level);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 10 (atr. 45, umiej. 0, 1450 bry³ek rudy)", DIA_Shrat_Ulepszanie_Level10);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 20 (atr. 75, umiej. 1, 3700 bry³ek rudy)", DIA_Shrat_Ulepszanie_level20);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, "Poziom 30 (atr. 110, umiej. 2, 5200 bry³ek rudy)", DIA_Shrat_Ulepszanie_Level30);
    Info_AddChoice		(DIA_Shrat_Ulepszanie, DIALOG_BACK, DIA_Shrat_Ulepszanie_BACK);
};

FUNC VOID DIA_Shrat_Ulepszanie_5Level()
{
if  (Nov_1356_Shrat.Level > 5)  
{
if (Npc_HasItems (hero, ItMiNugget) >=678)
{
Print ("Ulepszy³eœ pomocnika!");
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
Print ("Za ma³o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_Level10()
{
if  (Nov_1356_Shrat.Level > 10) 
{
if (Npc_HasItems (hero, ItMiNugget) >=1450) {
Print ("Ulepszy³eœ pomocnika!");
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
Print ("Za ma³o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_level20()
{
if  (Nov_1356_Shrat.Level > 20)
{
 if (Npc_HasItems (hero, ItMiNugget) >=3700) {
Print ("Ulepszy³eœ pomocnika!");
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
Print ("Za ma³o rudy!");
};
};
};

FUNC VOID DIA_Shrat_Ulepszanie_Level30()
{
if  (Nov_1356_Shrat.Level > 30) 
{
if (Npc_HasItems (hero, ItMiNugget) >=5200) 
{
Print ("Ulepszy³eœ pomocnika!");
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
Print ("Za ma³o rudy!");
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
   description	= "Potrzebujê magicznego ziela.";
};

FUNC INT DIA_Shrat_MagicZiolo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczuraMAm))
    && (MIS_SickHunter == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shrat_MagicZiolo_Info()
{
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_01"); //Potrzebujê magicznego ziela.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_02"); //Dlaczego mia³bym ci je daæ?
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_03"); //Jeden z myœliwych jest ciê¿ko chory.
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_04"); //Caine potrzebuje tej roœliny, aby móc sporz¹dziæ odtrutkê.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_05"); //Caine? Czy to nie ten pomocnik Kaloma?
    AI_Output (other, self ,"DIA_Shrat_MagicZiolo_15_06"); //Tak, to on.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_07"); //Pos³uchaj. Nie chcê mieæ nic wspólnego z tymi œwirami.
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_08"); //Dam ci dwie sztuki tej roœliny, je¿eli znajdziesz mi miejsce w innym obozie. 
    AI_Output (self, other ,"DIA_Shrat_MagicZiolo_03_09"); //Gdziekolwiek! Muszê siê st¹d wyrwaæ.
    MIS_UCieczkaShrata = LOG_RUNNING;
	ShratHaveWork = false;
    Log_CreateTopic            (CH1_UCieczkaShrata, LOG_MISSION);
    Log_SetTopicStatus       (CH1_UCieczkaShrata, LOG_RUNNING);
    B_LogEntry                     (CH1_UCieczkaShrata,"Shrat da mi dwie sztuki magicznego ziela, je¿eli znajdê mu miejsce w innym obozie. ");
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
   description	= "Znalaz³em ci nowe miejsce.";
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
    AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_01"); //Znalaz³em ci nowe miejsce.
    AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_02"); //Jakie? Gdzie mam siê udaæ?
    if (Npc_KnowsInfo (hero, DIA_Alex_NovizeShrat))
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_03"); //Przyjmie ciê Alex z obozu myœliwych.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_04"); //Œwietnie. Ju¿ tam idê.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_05"); //Dziêkujê ci. WeŸ to ziele, tak jak ci obieca³em. 
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo¿e iœæ do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
        B_GiveXP (150);
		Npc_ExchangeRoutine (self,"hunters");
    }
    else if (Npc_KnowsInfo (hero, DIA_Mazin_HELLO1))
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_06"); //Masz pracowaæ jako pomocnik w karczmie Mazina.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_07"); //Gdzie to jest?
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_08"); //Karczma znajduje siê w Nowym Obozie.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_09"); //Dziêkujê ci za pomoc. WeŸ to ziele.
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo¿e iœæ do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
		Npc_ExchangeRoutine (self,"karczma");
        B_GiveXP (150);
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
    }
	    else if (MIS_KopalniaZlota == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_10"); //Bêdziesz kopa³ z³oto.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_11"); //Z³oto?
        AI_Output (other, self ,"DIA_Shrat_FindMiejscowka_15_08"); //Tak. Spotykamy siê w Nowym Obozie.
        AI_Output (self, other ,"DIA_Shrat_FindMiejscowka_03_09"); //Dziêkujê ci za pomoc. WeŸ to ziele.
        B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo¿e iœæ do nowego miejsca.");
        Log_SetTopicStatus       (CH1_UcieczkaShrata, LOG_SUCCESS);
        MIS_UcieczkaShrata = LOG_SUCCESS;
		Npc_ExchangeRoutine (self,"wait");
        B_GiveXP (200);
		Shrat_gototavern = true;
        CreateInvItems (self, ItFo_Plants_MagicHerb_01, 2);
        B_GiveInvItems (self, other, ItFo_Plants_MagicHerb_01, 2);
    };
};