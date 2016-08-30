// *Script was make in Easy Dialog Maker (EDM)
func void Fajka_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Fajka;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Palenie_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_Palenie_EXIT_Condition;
	information		= DIA_PC_Hero_Palenie_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Palenie_EXIT_Condition()
{
	if (monolog == Fajka)
	{
	return TRUE;
	};
};

FUNC VOID DIA_PC_Hero_Palenie_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Palenie
//========================================

INSTANCE DIA_PC_Hero_Palenie (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Palenie_Condition;
   information  = DIA_PC_Hero_Palenie_Info;
   permanent	= true;
   description	= "Zapal tyto�";
};

FUNC INT DIA_PC_Hero_Palenie_Condition()
{
    if (monolog == Fajka)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Palenie_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Palenie);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Zwyk�y jab�kowy", DIA_PC_Hero_Palenie_Tyton1);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Tyto� miodowy", DIA_PC_Hero_Palenie_Tyton2);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Tyto� zio�owy", DIA_PC_Hero_Palenie_Tyton3);
	Info_AddChoice		(DIA_PC_Hero_Palenie, "Tyto� grzybowy", DIA_PC_Hero_Palenie_Tyton4);
	Info_AddChoice		(DIA_PC_Hero_Palenie, "Tyto� zwyczajny", DIA_PC_Hero_Palenie_Tyton);
	Info_AddChoice		(DIA_PC_Hero_Palenie, DIALOG_BACK, DIA_PC_Hero_Palenie_BACK);
};
func void DIA_PC_Hero_Palenie_BACK ()
{
Info_ClearChoices		(DIA_PC_Hero_Palenie);
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton1()
{
    if (Npc_HasItems (hero, ItMi_Tuton_1) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_1, 1);
	PrintScreen	("Tymczasowo zwi�kszona mana o 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] + 20;
	Pot_ManaTimeStart = 3 * 60;
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton2()
{
    if (Npc_HasItems (hero, ItMi_Tuton_2) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_2, 1);
	PrintScreen	("Tymczasowo zwi�kszone P� o 50", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 50;
	Pot_HPTimeStart = 2 * 60;	
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton3()
{
    if (Npc_HasItems (hero, ItMi_Tuton_3) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_2, 1);
	PrintScreen	("Tyto� przyspiesza tw�j bieg", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste1);
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton4()
{
    if (Npc_HasItems (hero, ItMi_Tuton_4) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_4, 1);
	
	PrintScreen	("Tymczasowo zwi�kszona si�a i zr�czno�� o 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 20;
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] + 20;	
	Pot_MasterTimeStart = 2 * 60;	
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton()
{
    if (Npc_HasItems (hero, ItMi_Tuton) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton, 1);
	PrintScreen	("Zapali�e� tyto�", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    AI_StopProcessInfos	(self);
    };
};