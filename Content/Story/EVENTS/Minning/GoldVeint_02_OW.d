func void GOLDVEIN2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
	//**********skill check
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 1)
	{
	monolog = GoldVein_02_OW;
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

INSTANCE DIA_PC_HeroENdMinningGold2_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_HeroENdMinningGold2_EXIT_Condition;
	information		= DIA_PC_HeroENdMinningGold2_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HeroENdMinningGold2_EXIT_Condition()
{
    if (monolog == GoldVein_02_OW)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_HeroENdMinningGold2_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOW_STRIKE_GOLD2
//========================================
var int dug_Gold2;
var int power_goldstrike_progress2;
const int Gold_limit2 = 33;
var int all_dug_Gold2;

INSTANCE DIA_PC_Hero_LOW_STRIKE_GOLD2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LOW_STRIKE_GOLD2_Condition;
   information  = DIA_PC_Hero_LOW_STRIKE_GOLD2_Info;
   permanent	= true;
   description	= "(Uderz lekko)";
};

FUNC INT DIA_PC_Hero_LOW_STRIKE_GOLD2_Condition()
{
    if (monolog == GoldVein_02_OW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LOW_STRIKE_GOLD2_Info()
{

if (all_dug_Gold2 < Gold_limit2)
{
//----losowanie dropa-----------
dug_Gold2 = Hlp_Random (4);
if (dug_Gold2 == 0)
{
PrintScreen	("Nie uda³o ci siê nic wydobyæ!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
power_goldstrike_progress2 = power_goldstrike_progress2 + 4;
};
if (dug_Gold2 == 1)
{
PrintScreen	("Wydobywasz 7 bry³ek z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 7);
power_goldstrike_progress2 = power_goldstrike_progress2 +1;
all_dug_Gold2 = all_dug_Gold2 + 7;
};
if (dug_Gold2 == 2)
{
PrintScreen	("Wydobywasz 12 bry³ek z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 12);
power_goldstrike_progress2 = power_goldstrike_progress2 +2;
all_dug_Gold2 = all_dug_Gold2 + 12;
};
if (dug_Gold2 == 3)
{
PrintScreen	("Wydobywasz 20 bry³ek z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 20); 
power_goldstrike_progress2 = power_goldstrike_progress2 +0;
all_dug_Gold2 = all_dug_Gold2 + 20;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> MID_STRIKE_GOLD2
//========================================

INSTANCE DIA_PC_Hero_MID_STRIKE_GOLD2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_MID_STRIKE_GOLD2_Condition;
   information  = DIA_PC_Hero_MID_STRIKE_GOLD2_Info;
   permanent	= true;
   description	= "(Uderz mocno)";
};

FUNC INT DIA_PC_Hero_MID_STRIKE_GOLD2_Condition()
{
    if (monolog == GoldVein_02_OW)
    && (power_goldstrike_progress2 >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MID_STRIKE_GOLD2_Info()
{
//zerowanie progresu na mocne uderzenie
power_goldstrike_progress2 = 0;

if (all_dug_Gold2 < Gold_limit2)
{
//-----losowanie dropa
if (dug_Gold2 == 0)
{
PrintScreen	("Wydobywasz 12 bry³ek z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 12);
all_dug_Gold2 = all_dug_Gold2 + 12;
};
if (dug_Gold2 == 1)
{
PrintScreen	("Wydobywasz 17 bry³ek z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 17);
all_dug_Gold2 = all_dug_Gold2 + 17;
};
if (dug_Gold2 == 2)
{
PrintScreen	("Wydobywasz 22 bry³ki z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 22);
all_dug_Gold2 = all_dug_Gold2 + 22;
};
if (dug_Gold2 == 3)
{
PrintScreen	("Wydobywasz 33 bry³ki z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 33); 
all_dug_Gold2 = all_dug_Gold2 + 33;
};
//----losowanie dropa end--------

}
else
{
PrintS_Ext("Z³o¿e wyczerpane!", COL_WHITE);
};

};

//========================================
//-----------------> POWER_STRIKE_GOLD2
//========================================

INSTANCE DIA_PC_Hero_POWER_STRIKE_GOLD2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_POWER_STRIKE_GOLD2_Condition;
   information  = DIA_PC_Hero_POWER_STRIKE_GOLD2_Info;
   permanent	= true;
   description	= "(Uderz bardzo mocno)";
};

FUNC INT DIA_PC_Hero_POWER_STRIKE_GOLD2_Condition()
{
    if (monolog == GoldVein_02_OW)
    && (power_goldstrike_progress2 >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_POWER_STRIKE_GOLD2_Info()
{
//zerowanie progresu na mocne uderzenie
power_goldstrike_progress2 = 0;


dug_Gold2 = Hlp_Random (2);
if (all_dug_Gold2 < Gold_limit2)
{
//-----losowanie dropa
if (dug_Gold2 == 0)
{
PrintScreen	("Wydobywasz 42 bry³ki z³ota!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
CreateInvItems (hero, Gold01, 42);
all_dug_Gold2 = all_dug_Gold2 + 42;
};
if (dug_Gold2 == 1)
{
};
//----losowanie dropa end--------

}
else
{
PrintScreen	("Nie uda³o siê!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
};

};

