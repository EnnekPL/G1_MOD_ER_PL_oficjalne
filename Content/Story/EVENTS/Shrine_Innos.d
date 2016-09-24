///////////////////////////////////////////////
// 					S
///////////////////////////////////////////////

func void INNOS_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Innos;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

//////////////////////////////////////////////
// 					CONST
//////////////////////////////////////////////
const string Print_NoBlessInnos 	= "Nie otrzyma³eœ b³ogos³awieñstwa!";
const string Print_InnosIsHappy 	= "Innosa cieszy twoja modlitwa!";
const string Print_InnosHeal	 	= "Innos uleczy³ twoje rany!";
const string Print_InnosFullMana	= "Innos uleczy³ twoje rany!";

//////////////////////////////////////////////
// 					FUNC
//////////////////////////////////////////////
func void NoBlessInnos ()
{
	PrintS_Ext (Print_NoBlessInnos,COL_WHITE);
};

func void NoBlessInnosToday ()
{
	PrintS_Ext (Print_InnosIsHappy,COL_WHITE);
};

func void InnosRestoreMana ()
{
	var int hero_mana; hero_mana = hero.attribute[ATR_MANA_MAX];
	Npc_ChangeAttribute	(hero,	ATR_MANA,	hero_mana);
	PrintS_Ext (Print_InnosFullMana,COL_WHITE);
};

func void InnosRestoreLife ()
{
	var int hero_life; hero_life = hero.attribute[ATR_HITPOINTS_MAX];
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	hero_life);
	PrintS_Ext (Print_InnosHeal,COL_WHITE);
};

///////////////////////////////////////////
// 					EXIT
///////////////////////////////////////////

INSTANCE DIA_PC_HERO_EXIT_Innos(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_EXIT_Innos_Condition;
	information		= DIA_PC_HERO_EXIT_Innos_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_Innos_Condition()
{
	if (monolog == Innos)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_Innos_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////
// 					PRAY
///////////////////////////////////////////

INSTANCE DIA_InnosShrine_Pray (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_InnosShrine_Pray_Condition;
   information  = DIA_InnosShrine_Pray_Info;
   permanent	= TRUE;
   description	= "(Pomódl siê)";
};

FUNC INT DIA_InnosShrine_Pray_Condition()
{
	if (monolog == Innos)
	{
    return TRUE;
	};
};

FUNC VOID DIA_InnosShrine_Pray_Info()
{
    Info_ClearChoices	(DIA_InnosShrine_Pray);
    Info_AddChoice		(DIA_InnosShrine_Pray, DIALOG_BACK, DIA_InnosShrine_Pray_BACK);
	if (Npc_HasItems (hero, Itminugget) >= 100)
	{
    Info_AddChoice		(DIA_InnosShrine_Pray, "(Ofiara: 100 bry³ek rudy)"	, DIA_InnosShrine_Pray_100Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 50)
	{
	Info_AddChoice		(DIA_InnosShrine_Pray, "(Ofiara: 50 bry³ek rudy)"		, DIA_InnosShrine_Pray_50Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 10)
	{
	Info_AddChoice		(DIA_InnosShrine_Pray, "(Ofiara: 10 bry³ek rudy)"		, DIA_InnosShrine_Pray_10Nuggets);
	};
	Info_AddChoice		(DIA_InnosShrine_Pray, "(Modlitwa bez ofiary)"			, DIA_InnosShrine_Pray_0Nuggets);
};

FUNC VOID DIA_InnosShrine_Pray_BACK()
{
    Info_ClearChoices		(DIA_InnosShrine_Pray);
};

FUNC VOID DIA_InnosShrine_Pray_0Nuggets()
{
	var int lucky; lucky = Hlp_Random(100);
	
	if (Day_InnosShrine != wld_getday())
	{
		if (lucky <= 4)
		{
		B_RaiseAttribute	(ATR_MANA_MAX,	1);
		}
		else if (lucky <= 10)
		{
		InnosRestoreMana ();
		}
		else 
		{
		NoBlessInnosToday ();
		};
	}
	else 
	{
	NoBlessInnos ();
	};
	Day_InnosShrine = wld_getday();
	Info_ClearChoices	(DIA_InnosShrine_Pray);
};

FUNC VOID DIA_InnosShrine_Pray_10Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 10);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 10);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_InnosShrine == wld_getday())
	{
		if (lucky <= 4)
		{
		B_RaiseAttribute	(ATR_MANA_MAX,	1);
		}
		else if (lucky <= 10)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	1);
		}
		else if (lucky <= 25)
		{
		InnosRestoreMana ();
		InnosRestoreLife ();
		}
		else 
		{
		NoBlessInnosToday ();
		};
	}
	else
	{
	NoBlessInnos ();
	};
	Day_InnosShrine = wld_getday();
	Info_ClearChoices	(DIA_InnosShrine_Pray);
};

FUNC VOID DIA_InnosShrine_Pray_50Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 50);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 50);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_InnosShrine == wld_getday())
	{
		if (lucky <= 8)
		{
		B_RaiseAttribute	(ATR_MANA_MAX,	1);
		}
		else if (lucky <= 16)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	1);
		}
		else if (lucky <= 50)
		{
		InnosRestoreMana ();
		InnosRestoreLife ();
		}
		else 
		{
		NoBlessInnosToday ();
		};
	}
	else
	{
	NoBlessInnos ();
	};
	Day_InnosShrine = wld_getday();
	Info_ClearChoices	(DIA_InnosShrine_Pray);
};

FUNC VOID DIA_InnosShrine_Pray_100Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 100);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 100);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_InnosShrine == wld_getday())
	{
		if (lucky <= 8)
		{
			if (lucky <= 4)
			{
			B_RaiseAttribute	(ATR_MANA_MAX,	2);
			}
			else
			{
			B_RaiseAttribute	(ATR_MANA_MAX,	1);
			};
		}
		else if (lucky <= 16)
		{
			if (lucky <= 8)
			{
			B_RaiseAttribute	(ATR_HITPOINTS_MAX,	3);
			}
			else
			{
			B_RaiseAttribute	(ATR_HITPOINTS_MAX,	1);
			};
		}
		else if (lucky <= 90)
		{
		InnosRestoreMana ();
		InnosRestoreLife ();
		}
		else 
		{
		NoBlessInnosToday ();
		};
	}
	else
	{
	NoBlessInnos ();
	};
	Day_InnosShrine = wld_getday();
	Info_ClearChoices	(DIA_InnosShrine_Pray);
};


//========================================
//-----------------> MAGIC_SWORD_1
//========================================

INSTANCE DIA_PC_HERO_MAGIC_SWORD_1 (C_INFO)
{
   npc          = PC_HERO;
   nr           = 2;
   condition    = DIA_PC_HERO_MAGIC_SWORD_1_Condition;
   information  = DIA_PC_HERO_MAGIC_SWORD_1_Info;
   permanent	= FALSE;
   description	= "(Ulepsz: Miecz magicznego deszczu za 250 monet)";
};

FUNC INT DIA_PC_HERO_MAGIC_SWORD_1_Condition()
{
    if (Npc_HasItems (hero, Miecz1H17) >=1)
    && (Npc_HasItems (hero, ItMi_Stuff_OldCoin_01) >=250)
	&& (monolog == Innos)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_MAGIC_SWORD_1_Info()
{
    B_GiveInvItems (hero,PC_THIEF, Miecz1H17, 1);
    CreateInvItems (hero, Miecz1H18, 1);
    B_GiveInvItems (hero, PC_THIEF, ItMi_Stuff_OldCoin_01, 250);
	//PrintScreen	(" ", -1,70,"FONT_OLD_20_WHITE.TGA",2);	
	PrintS_Ext("Miecz magicznego deszczu zosta³ ulepszony!", COL_White);
};

