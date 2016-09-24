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
// 					CONST
//////////////////////////////////////////////
const string Print_BeliarNoBless 			= "Nie otrzyma³eœ b³ogos³awieñstwa!";
const string Print_BeliarIsHappy 	= "Beliara cieszy twoja modlitwa!";
const string Print_BeliarPunished	= "Beliar ciê ukara³!";
const string Print_BeliarFullMana	= "Beliar uleczy³ twoje rany!";

//////////////////////////////////////////////
// 					FUNC
//////////////////////////////////////////////
func void NoBlessBeliar ()
{
	PrintS_Ext (Print_BeliarNoBless,COL_WHITE);
};

func void NoBlessBeliarToday ()
{
	PrintS_Ext (Print_BeliarIsHappy,COL_WHITE);
};

func void BeliarRestoreMana ()
{
	var int hero_mana; hero_mana = hero.attribute[ATR_MANA_MAX];
	Npc_ChangeAttribute	(hero,	ATR_MANA,	hero_mana);
	PrintS_Ext (Print_BeliarFullMana,COL_WHITE);
};

func void BeliarPunishedHero ()
{
	var int hero_life; hero_life = hero.attribute[ATR_HITPOINTS];
	var int heropunishment; heropunishment = hero_life - 5;
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,-heropunishment);
	Wld_PlayEffect("spellFX_Firestorm",  hero, hero, 0, 0, 0, FALSE );
	PrintS_Ext (Print_BeliarPunished,COL_WHITE);
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
	if (Npc_HasItems (hero, Itminugget) >= 100)
	{
    Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 100 bry³ek rudy)"	, DIA_BeliarShrine_Pray_100Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 50)
	{
	Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 50 bry³ek rudy)"		, DIA_BeliarShrine_Pray_50Nuggets);
	};
	if (Npc_HasItems (hero, Itminugget) >= 10)
	{
	Info_AddChoice		(DIA_BeliarShrine_Pray, "(Ofiara: 10 bry³ek rudy)"		, DIA_BeliarShrine_Pray_10Nuggets);
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
		if (lucky <= 15)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	-1);
		CreateInvItems (hero, Itminugget, 50);
		PrintS_Ext ("Beliar zamieni³ twoj¹ krew na 50 bry³ek rudy!", COL_WHITE);
		}
		else if (lucky <= 50)
		{
		BeliarPunishedHero ();
		}
		else 
		{
		NoBlessBeliarToday ();
		};
	}
	else 
	{
	NoBlessBeliar ();
	};
	Day_BeliarShrine = wld_getday();
	Info_ClearChoices	(DIA_BeliarShrine_Pray);
};

FUNC VOID DIA_BeliarShrine_Pray_10Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 10);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 10);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine == wld_getday())
	{
		if (lucky <= 15)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	-1);
		CreateInvItems (hero, Itminugget, 100);
		PrintS_Ext ("Beliar zamieni³ twoj¹ krew na 100 bry³ek rudy!", COL_WHITE);
		}
		else if (lucky <= 30)
		{
		BeliarRestoreMana ();
		}
		else if (lucky <= 40)
		{
		BeliarPunishedHero ();
		}
		else
		{
		NoBlessBeliarToday ();
		};
	}
	else
	{
	NoBlessBeliar ();
	};
	Day_BeliarShrine = wld_getday();
	Info_ClearChoices	(DIA_BeliarShrine_Pray);
};

FUNC VOID DIA_BeliarShrine_Pray_50Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 50);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 50);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine == wld_getday())
	{
		if (lucky <= 15)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	-1);
		CreateInvItems (hero, Itminugget, 150);
		PrintS_Ext ("Beliar zamieni³ twoj¹ krew na 150 bry³ek rudy!", COL_WHITE);
		}
		else if (lucky <= 25)
		{
		BeliarPunishedHero ();
		}
		else if (lucky <= 50)
		{
		BeliarRestoreMana ();
		}
		else
		{
		NoBlessBeliarToday ();
		};
	}
	else
	{
	NoBlessBeliar ();
	};
	Day_BeliarShrine = wld_getday();
	Info_ClearChoices	(DIA_BeliarShrine_Pray);
};

FUNC VOID DIA_BeliarShrine_Pray_100Nuggets()
{
	B_GiveInvItems (hero, PC_THIEF, Itminugget, 100);
	Npc_RemoveInvItems (PC_THIEF, itminugget, 100);
	var int lucky; lucky = Hlp_Random(100);
    if (Day_BeliarShrine == wld_getday())
	{
		if (lucky <= 5)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	-1);
		CreateInvItems (hero, Itminugget, 300);
		PrintS_Ext ("Beliar zamieni³ twoj¹ krew na 300 bry³ek rudy!", COL_WHITE);
		}
		else if (lucky <= 15)
		{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	-1);
		CreateInvItems (hero, Itminugget, 200);
		PrintS_Ext ("Beliar zamieni³ twoj¹ krew na 200 bry³ek rudy!", COL_WHITE);
		}
		else if (lucky <= 25)
		{
		BeliarPunishedHero ();
		}
		else if (lucky <= 90)
		{
		BeliarRestoreMana ();
		}
		else 
		{
		NoBlessBeliarToday ();
		};
	}
	else
	{
	NoBlessBeliar ();
	};
	Day_BeliarShrine = wld_getday();
	Info_ClearChoices	(DIA_BeliarShrine_Pray);
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
   description	= "(Ulepsz: Miecz Rozpaczy za 250 monet)";
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
