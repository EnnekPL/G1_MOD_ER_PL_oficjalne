func void OREVEIN11_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = OreVein_011_FMC;
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

INSTANCE DIA_PC_HeroENdMinning11_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinning11_EXIT_Condition;
	information		= DIA_PC_HeroENdMinning11_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinning11_EXIT_Condition()
{
    if (monolog == OreVein_011_FMC)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinning11_EXIT_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> LOW_STRIKE11
//========================================
var int dug_ore11;
var int power_strike_progress11;
const int ore_limit11 = 120;
var int all_dug_ore11;

INSTANCE DIA_PC_Hero_LOW_STRIKE11 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE11_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE11_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE11_Condition()
{
    if (monolog == OreVein_011_FMC)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE11_Info()
{

if (all_dug_ore11 < ore_limit11)
{
//----losowanie dropa-----------
dug_ore11 = Hlp_Random (4);
if (dug_ore11 == 0)
{
PrintScreen	("Nie uda³o ci siê nic wydobyæ!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_strike_progress11 = power_strike_progress11 + 4;
};
if (dug_ore11 == 1)
{
PrintScreen	("Wydobywasz 7 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 7);
power_strike_progress11 = power_strike_progress11 +1;
all_dug_ore11 = all_dug_ore11 + 7;
};
if (dug_ore11 == 2)
{
PrintScreen	("Wydobywasz 12 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
power_strike_progress11 = power_strike_progress11 +2;
all_dug_ore11 = all_dug_ore11 + 12;
};
if (dug_ore11 == 3)
{
PrintScreen	("Wydobywasz 20 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 20); 
power_strike_progress11 = power_strike_progress11 +0;
all_dug_ore11 = all_dug_ore11 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE11
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE11 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE11_Condition;
   information  = DIA_PC_Hero_MID_STRIKE11_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE11_Condition()
{
    if (monolog == OreVein_011_FMC)
    && (power_strike_progress11 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE11_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress11 = 0;

if (all_dug_ore11 < ore_limit11)
{
//-----losowanie dropa
if (dug_ore11 == 0)
{
PrintScreen	("Wydobywasz 12 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 12);
all_dug_ore11 = all_dug_ore11 + 12;
};
if (dug_ore11 == 1)
{
PrintScreen	("Wydobywasz 17 bry³ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 17);
all_dug_ore11 = all_dug_ore11 + 17;
};
if (dug_ore11 == 2)
{
PrintScreen	("Wydobywasz 22 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 22);
all_dug_ore11 = all_dug_ore11 + 22;
};
if (dug_ore11 == 3)
{
PrintScreen	("Wydobywasz 33 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 33); 
all_dug_ore11 = all_dug_ore11 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE11
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE11 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE11_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE11_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE11_Condition()
{
    if (monolog == OreVein_011_FMC)
    && (power_strike_progress11 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE11_Info()
{
//zerowanie progresu na mocne uderzenie
power_strike_progress11 = 0;


dug_ore11 = Hlp_Random (2);
if (all_dug_ore11 < ore_limit11)
{
//-----losowanie dropa
if (dug_ore11 == 0)
{
PrintScreen	("Wydobywasz 42 bry³ki rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, ItMiNugget, 42);
all_dug_ore11 = all_dug_ore11 + 42;
};
if (dug_ore11 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda³o siê!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

