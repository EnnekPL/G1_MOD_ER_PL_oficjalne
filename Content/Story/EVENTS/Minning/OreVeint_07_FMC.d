func void OREVEIN7_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = OreVein_07_FMC;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	}
	else
	{
	PrintS_Ext("Nie potrafisz wydobywaæ surowców!", COL_RED);
	};
	//*********skill check end
	
	};
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HeroENdMinning7_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinning7_EXIT_Condition;
	information		= DIA_PC_HeroENdMinning7_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinning7_EXIT_Condition()
{
    if (monolog == OreVein_07_FMC)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinning7_EXIT_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> LOW_STRIKE7
//========================================
var int dug_ore7;
var int power_strike_progress7;
const int ore_limit7 = 120;
var int all_dug_ore7;

INSTANCE DIA_PC_Hero_LOW_STRIKE7 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE7_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE7_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE7_Condition()
{
    if (monolog == OreVein_07_FMC)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE7_Info()
{

if (all_dug_ore7 < ore_limit7)
{
//----losowanie dropa-----------
dug_ore7 = Hlp_Random (4);
if (dug_ore7 == 0)
{
PrintScreen	("Nie uda³o ci siê nic wydobyæ!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_strike_progress7 = power_strike_progress7 + 4;
};
if (dug_ore7 == 1)
{
PrintScreen	("Wydobywasz 7 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 7);
power_strike_progress7 = power_strike_progress7 +1;
all_dug_ore7 = all_dug_ore7 + 7;
};
if (dug_ore7 == 2)
{
PrintScreen	("Wydobywasz 12 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
power_strike_progress7 = power_strike_progress7 +2;
all_dug_ore7 = all_dug_ore7 + 12;
};
if (dug_ore7 == 3)
{
PrintScreen	("Wydobywasz 20 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 20); 
power_strike_progress7 = power_strike_progress7 +0;
all_dug_ore7 = all_dug_ore7 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE7
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE7 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE7_Condition;
   information  = DIA_PC_Hero_MID_STRIKE7_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE7_Condition()
{
    if (monolog == OreVein_07_FMC)
    && (power_strike_progress7 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE7_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress7 = 0;

if (all_dug_ore7 < ore_limit7)
{
//-----losowanie dropa
if (dug_ore7 == 0)
{
PrintScreen	("Wydobywasz 12 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
all_dug_ore7 = all_dug_ore7 + 12;
};
if (dug_ore7 == 1)
{
PrintScreen	("Wydobywasz 17 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 17);
all_dug_ore7 = all_dug_ore7 + 17;
};
if (dug_ore7 == 2)
{
PrintScreen	("Wydobywasz 22 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 22);
all_dug_ore7 = all_dug_ore7 + 22;
};
if (dug_ore7 == 3)
{
PrintScreen	("Wydobywasz 33 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 33); 
all_dug_ore7 = all_dug_ore7 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE7
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE7 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE7_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE7_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE7_Condition()
{
    if (monolog == OreVein_07_FMC)
    && (power_strike_progress7 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE7_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress7 = 0;


dug_ore7 = Hlp_Random (2);
if (all_dug_ore7 < ore_limit7)
{
//-----losowanie dropa
if (dug_ore7 == 0)
{
PrintScreen	("Wydobywasz 42 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 42);
all_dug_ore7 = all_dug_ore7 + 42;
};
if (dug_ore7 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda³o siê!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

