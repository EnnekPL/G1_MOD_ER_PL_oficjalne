func void OREVEIN13_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = OreVein_013_FMC;
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

INSTANCE DIA_PC_HeroENdMinning13_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinning13_EXIT_Condition;
	information		= DIA_PC_HeroENdMinning13_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinning13_EXIT_Condition()
{
    if (monolog == OreVein_013_FMC)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinning13_EXIT_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> LOW_STRIKE13
//========================================
var int dug_ore13;
var int power_strike_progress13;
const int ore_limit13 = 130;
var int all_dug_ore13;

INSTANCE DIA_PC_Hero_LOW_STRIKE13 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE13_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE13_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE13_Condition()
{
    if (monolog == OreVein_013_FMC)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE13_Info()
{

if (all_dug_ore13 < ore_limit13)
{
//----losowanie dropa-----------
dug_ore13 = Hlp_Random (4);
if (dug_ore13 == 0)
{
PrintScreen	("Nie uda³o ci siê nic wydobyæ!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_strike_progress13 = power_strike_progress13 + 4;
};
if (dug_ore13 == 1)
{
PrintScreen	("Wydobywasz 7 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 7);
power_strike_progress13 = power_strike_progress13 +1;
all_dug_ore13 = all_dug_ore13 + 7;
};
if (dug_ore13 == 2)
{
PrintScreen	("Wydobywasz 13 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 13);
power_strike_progress13 = power_strike_progress13 +2;
all_dug_ore13 = all_dug_ore13 + 13;
};
if (dug_ore13 == 3)
{
PrintScreen	("Wydobywasz 20 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 20); 
power_strike_progress13 = power_strike_progress13 +0;
all_dug_ore13 = all_dug_ore13 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE13
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE13 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE13_Condition;
   information  = DIA_PC_Hero_MID_STRIKE13_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE13_Condition()
{
    if (monolog == OreVein_013_FMC)
    && (power_strike_progress13 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE13_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress13 = 0;

if (all_dug_ore13 < ore_limit13)
{
//-----losowanie dropa
if (dug_ore13 == 0)
{
PrintScreen	("Wydobywasz 13 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 13);
all_dug_ore13 = all_dug_ore13 + 13;
};
if (dug_ore13 == 1)
{
PrintScreen	("Wydobywasz 17 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 17);
all_dug_ore13 = all_dug_ore13 + 17;
};
if (dug_ore13 == 2)
{
PrintScreen	("Wydobywasz 22 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 22);
all_dug_ore13 = all_dug_ore13 + 22;
};
if (dug_ore13 == 3)
{
PrintScreen	("Wydobywasz 33 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 33); 
all_dug_ore13 = all_dug_ore13 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE13
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE13 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE13_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE13_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE13_Condition()
{
    if (monolog == OreVein_013_FMC)
    && (power_strike_progress13 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE13_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress13 = 0;


dug_ore13 = Hlp_Random (2);
if (all_dug_ore13 < ore_limit13)
{
//-----losowanie dropa
if (dug_ore13 == 0)
{
PrintScreen	("Wydobywasz 42 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 42);
all_dug_ore13 = all_dug_ore13 + 42;
};
if (dug_ore13 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda³o siê!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

