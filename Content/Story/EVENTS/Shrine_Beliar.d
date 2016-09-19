///////////////////////////////////////////////
// 					S
///////////////////////////////////////////////

func void Beliar_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Beliar;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

//////////////////////////////////////////////
// 					VAR
//////////////////////////////////////////////
var int Day_BeliarShrine;
const string Print_NoBless 			= "Nie otrzyma³eœ b³ogos³awieñstwa";
const string Print_BeliarIsHappy 	= "Beliara cieszy twoja modlitwa";

//////////////////////////////////////////////
// 					FUNC
//////////////////////////////////////////////
func void NoBless ()
{
	PrintS_Ext (Print_NoBless,COL_WHITE);
};

func void NoBlessToday ()
{
	PrintS_Ext (Print_BeliarIsHappy,COL_WHITE);
};

func void GodRestoreMana ()
{
	var int hero_mana; hero_mana = hero.attribute[ATR_MANA_MAX];
	Npc_ChangeAttribute	(hero,	ATR_MANA,	hero_mana);
};

func void GodRestoreLife ()
{
	var int hero_life; hero_life = hero.attribute[ATR_HITPOINTS_MAX];
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	hero_life);
};

///////////////////////////////////////////
// 					EXIT
///////////////////////////////////////////

INSTANCE DIA_PC_HERO_EXIT_Beliar(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_EXIT_Beliar_Condition;
	information		= DIA_PC_HERO_EXIT_Beliar_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_Beliar_Condition()
{
	if (monolog == Beliar)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_Beliar_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////
// 					PRAY
///////////////////////////////////////////

INSTANCE DIA_BeliarShrine_Pray (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_BeliarShrine_Pray_Condition;
   information  = DIA_BeliarShrine_Pray_Info;
   permanent	= TRUE;
   description	= "(Pomódl siê)";
};

FUNC INT DIA_BeliarShrine_Pray_Condition()
{
	if (monolog == Beliar)
	{
    return TRUE;
	};
};

FUNC VOID DIA_BeliarShrine_Pray_Info()
{
    Info_ClearChoices	(DIA_BeliarShrine_Pray);
    Info_AddChoice		(DIA_BeliarShrine_Pray, DIALOG_BACK, DIA_BeliarShrine_Pray_BACK);
	if (Npc_HasItems (hero, Itminugget) >= 1000)
	{
    Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 1000 bry³ek rudy)"	, DIA_BeliarShrine_Pray_1000Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 500)
	{
	Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 500 bry³ek rudy)"		, DIA_BeliarShrine_Pray_500Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 100)
	{
	Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 100 bry³ek rudy)"		, DIA_BeliarShrine_Pray_100Nuggets);
	};
	Info_AddChoice		(DIA_BeliarShrine_Pray, "(Modlitwa bez ofiary)"			, DIA_BeliarShrine_Pray_0Nuggets);
};

FUNC VOID DIA_BeliarShrine_Pray_BACK()
{
    Info_ClearChoices		(DIA_BeliarShrine_Pray);
};

FUNC VOID DIA_BeliarShrine_Pray_0Nuggets()
{
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine != wld_getday())
	{
	Day_BeliarShrine = wld_getday();
		if (lucky <= 4)
		{
		B_RaiseAttribute	(ATR_MANA_MAX,	1);
		}
		else if (lucky <= 10)
		{
		GodRestoreMana ();
		}
		else 
		{
		NoBlessToday ();
		};
	}
	else
	{
	NoBless ();
	};
};

FUNC VOID DIA_BeliarShrine_Pray_100Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 100);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 100);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine != wld_getday())
	{
	Day_BeliarShrine = wld_getday();
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
		GodRestoreMana ();
		GodRestoreLife ();
		}
		else 
		{
		NoBlessToday ();
		};
	}
	else
	{
	NoBless ();
	};
};

FUNC VOID DIA_BeliarShrine_Pray_500Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 500);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 500);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine != wld_getday())
	{
	Day_BeliarShrine = wld_getday();
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
		GodRestoreMana ();
		GodRestoreLife ();
		}
		else 
		{
		NoBlessToday ();
		};
	}
	else
	{
	NoBless ();
	};
};

FUNC VOID DIA_BeliarShrine_Pray_1000Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 1000);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 1000);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine != wld_getday())
	{
	Day_BeliarShrine = wld_getday();
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
		GodRestoreMana ();
		GodRestoreLife ();
		}
		else 
		{
		NoBlessToday ();
		};
	}
	else
	{
	NoBless ();
	};
};
//========================================
//-----------------> MAGIC_SWORD_2
//========================================

INSTANCE DIA_PC_HERO_MAGIC_SWORD_2 (C_INFO)
{
   npc          = PC_HERO;
   nr           = 2;
   condition    = DIA_PC_HERO_MAGIC_SWORD_2_Condition;
   information  = DIA_PC_HERO_MAGIC_SWORD_2_Info;
   permanent	= FALSE;
   description	= "Ulepsz: Miecz Rozpacz (250 z³tych monet)";
};

FUNC INT DIA_PC_HERO_MAGIC_SWORD_2_Condition()
{
    if (Npc_HasItems (hero, Miecz1H9) >=1)
    && (Npc_HasItems (hero, ItMi_Stuff_OldCoin_01) >=250)
	&& (monolog == Beliar)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_MAGIC_SWORD_2_Info()
{
    B_GiveInvItems (hero,PC_THIEF, Miecz1H9, 1);
    CreateInvItems (hero, Miecz1H10, 1);
    B_GiveInvItems (hero, PC_THIEF, ItMi_Stuff_OldCoin_01, 250);
	PrintS_Ext ("Miecz Rozpaczy zosta³ ulepszony!",COL_WHITE);
};
