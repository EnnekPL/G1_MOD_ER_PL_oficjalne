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
    AI_Output (self, other ,"DIA_Hysen_HELLO1_03_02"); //Cholera, denerwuje mnie ju� to czekanie.
	AI_Output (other, self ,"DIA_Hysen_HELLO1_15_03"); //Na co tak czekasz?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_04"); //Artegor obieca�, �e pozwoli mi na jaki� tydzie� wr�ci� do Starego Obozu. Chcia�em za�atwi� co� z moim przyjacielem �wistakiem. 
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_05"); //Musz� te� zajrze� do mojej chaty. Diabli wiedz� w jakim jest stanie. Oby te sukinsyny niczego nie ukrad�y. 
	AI_Output (other, self ,"DIA_Hysen_HELLO1_15_06"); //Gdzie masz chat�?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_07"); //Troch� na prawo od tej stoj�cej naprzeciwko domu Dextera. Ko�o targowiska. Ej! Chyba nie chcesz mnie okra��?
	AI_Output (self, other ,"DIA_Hysen_HELLO1_03_08"); //Zreszt�, na co ja licz�. Pewnie ju� jest pu�ciutka. 	 
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
    AI_Output (other, self ,"DIA_Hysen_THEFT_MODE_15_01"); //Artegor jest nie�le w�ciek�y. 
	if (hero.attribute[ATR_dexterity] >= 12)
	{
    AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_02"); //Co si� sta�o?
	AI_Output (other, self ,"DIA_Hysen_THEFT_MODE_15_03"); //Jaki� dure� uszkodzi� rozdrabniacz. 
	AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_04"); //Cholera, wola�bym, �eby mia� dobry humor. Ma mnie zwolni� do Obozu.
	
	B_GiveXP (100);
	PrintScreen ("Kradzie� udana!",-1,-1,"font_old_10_white.tga",1);
	CreateInvItem (hero, itmi_hysenkey); //itmi_joshpocket
	Npc_ExchangeRoutine (self,"chest");
	AI_SetWalkmode			(self,	NPC_RUN);
	DIA_Hysen_THEFT_MODE.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Hysen_THEFT_MODE_03_05"); //Nie interesuje mnie to.
	PrintScreen ("Ryzyk zbyt du�e!",-1,-1,"font_old_10_white.tga",1);
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
	AI_Output (self, other,"DIA_Hysen_Fight_04_01"); //Nadszed� czas spotkania. Wiem, �e wiesz o mojej tajemnicy. Troch� mi zaj�o zanim zorientowa�em si�, �e to ty masz klucz...
	AI_Output (self, other,"DIA_Hysen_Fight_04_02"); //Mimo to widz�, �e zd��y�em.
	AI_Output (other, self,"DIA_Hysen_Fight_15_03"); //Zamierzasz walczy� o t� rud�? Nie nale�y do ciebie! Wr�� do normalnego �ycia i zapomnij o niej. 
	AI_Output (self, other,"DIA_Hysen_Fight_04_04"); //To moja JEDYNA szansa, �eby mie� odrobin� spokoju. 
	
	B_LogEntry               (CH1_OreInOM,"Hysen zorientowa� si�, �e go okrad�em. Zjawi� si� przy skrzyni przede mn�. Musz� stoczy� z nim pojedynek.");
	
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	Npc_ExchangeRoutine (self,"start");
	B_KillNpc (BAN_1606_Josh);
	Npc_ExchangeRoutine (GRD_7006_Joel,"joshkiller");
};