//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hysen16_EXIT(C_INFO)
{
	npc             = NON_2016_Oczekujacy;
	nr              = 999;
	condition		= DIA_Hysen16_EXIT_Condition;
	information		= DIA_Hysen16_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hysen16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hysen16_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hysen_HELLO1 (C_INFO)
{
   npc          = NON_2016_Oczekujacy;
   nr           = 1;
   condition    = DIA_Hysen_HELLO1_Condition;
   information  = DIA_Hysen_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Hysen_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hysen_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hysen_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Hysen_HELLO1_03_02"); //Cholera, denerwuje mnie ju¿ to czekanie.
	AI_Output (other, self ,"DIA_Hysen_HELLO1_15_03"); //Na co tak czekasz?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_04"); //Artegor obieca³, ¿e pozwoli mi na jakiœ tydzieñ wróciæ do Starego Obozu. Chcia³em za³atwiæ coœ z moim przyjacielem Œwistakiem. 
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_05"); //Muszê te¿ zajrzeæ do mojej chaty. Diabli wiedz¹ w jakim jest stanie. Oby te sukinsyny niczego nie ukrad³y. 
	AI_Output (other, self ,"DIA_Hysen_HELLO1_15_06"); //Gdzie masz chatê?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_07"); //Trochê na prawo od tej stoj¹cej naprzeciwko domu Dextera. Ko³o targowiska. Ej! Chyba nie chcesz mnie okraœæ?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_08"); //Zreszt¹, na co ja liczê. Pewnie ju¿ jest puœciutka. 	 
};

//========================================
//-----------------> THEFT_MODE
//========================================

INSTANCE DIA_Hysen_THEFT_MODE (C_INFO)
{
   npc          = NON_2016_Oczekujacy;
   nr           = 800;
   condition    = DIA_Hysen_THEFT_MODE_Condition;
   information  = DIA_Hysen_THEFT_MODE_Info;
   permanent	= true;
   description	= "(Ukradnij klucz do skrzyni)";
};

FUNC INT DIA_Hysen_THEFT_MODE_Condition()
{
	if (MIS_OreInOM == LOG_RUNNING) && (hero_knows_hysenfinder)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Hysen_THEFT_MODE_Info()
{
    AI_Output (other, self ,"DIA_Hysen_THEFT_MODE_15_01"); //Artegor jest nieŸle wœciek³y. 
	if (hero.attribute[ATR_dexterity] >= 12)
	{
    AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_02"); //Co siê sta³o?
	AI_Output (other, self ,"DIA_Hysen_THEFT_MODE_15_03"); //Jakiœ dureñ uszkodzi³ rozdrabniacz. 
	AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_04"); //Cholera, wola³bym, ¿eby mia³ dobry humor. Ma mnie zwolniæ do Obozu.
	
	B_GiveXP (100);
	PrintScreen ("Kradzie¿ udana!",-1,-1,"font_old_10_white.tga",1);
	CreateInvItem (hero, itmi_hysenkey); //itmi_joshpocket
	Npc_ExchangeRoutine (self,"chest");
	AI_SetWalkmode			(self,	NPC_RUN);
	DIA_Hysen_THEFT_MODE.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_05"); //Nie interesuje mnie to.
	PrintScreen ("Ryzyk zbyt du¿e!",-1,-1,"font_old_10_white.tga",1);
	};
	AI_StopProcessInfos	(self);
};

// **************************************************
//						Fight
// **************************************************

instance DIA_Hysen_Fight(C_INFO)
{
	npc				= NON_2016_Oczekujacy;
	nr				= 1;
	condition		= DIA_Hysen_Fight_Condition;
	information		= DIA_Hysen_Fight_Info;
	permanent		= 0;
	important	 	= 1;
};                       

FUNC INT DIA_Hysen_Fight_Condition()
{
	if MIS_OreInOM == LOG_RUNNING && (Npc_HasItems (hero,itmi_hysenkey)>= 1) && (Npc_GetDistToWP(self, "HYSEN_DUEL")<500)
	{
	return 1;
	};
};

func VOID DIA_Hysen_Fight_Info()
{
	AI_Output (self, other,"DIA_Hysen_Fight_04_01"); //Nadszed³ czas spotkania. Wiem, ¿e wiesz o mojej tajemnicy. Trochê mi zajê³o zanim zorientowa³em siê, ¿e to ty masz klucz...
	AI_Output (self, other,"DIA_Hysen_Fight_04_02"); //Mimo to widzê, ¿e zd¹¿y³em.
	AI_Output (other, self,"DIA_Hysen_Fight_15_03"); //Zamierzasz walczyæ o tê rudê? Nie nale¿y do ciebie! Wróæ do normalnego ¿ycia i zapomnij o niej. 
	AI_Output (self, other,"DIA_Hysen_Fight_04_04"); //To moja JEDYNA szansa, ¿eby mieæ odrobinê spokoju. 
	
	B_LogEntry               (CH1_OreInOM,"Hysen zorientowa³ siê, ¿e go okrad³em. Zjawi³ siê przy skrzyni przede mn¹. Muszê stoczyæ z nim pojedynek.");
	
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	Npc_ExchangeRoutine (self,"start");
	B_KillNpc (BAN_1606_Josh);
	Npc_ExchangeRoutine (GRD_7006_Joel,"joshkiller");
};