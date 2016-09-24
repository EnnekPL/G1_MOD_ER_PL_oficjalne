//========================================
//-----------------> HIT_POINTS_BEL
//========================================
//edit by Nocturn
/*
INSTANCE DIA_PC_HERO_HIT_POINTS_BEL (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_HIT_POINTS_BEL_Condition;
   information  = DIA_PC_HERO_HIT_POINTS_BEL_Info;
   permanent	= TRUE;
   description	= "(Poproœ o punkty ¿ycia)";
};

FUNC INT DIA_PC_HERO_HIT_POINTS_BEL_Condition()
{
	if (monolog == Beliar)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(Ofiara: 5000 bry³ek rudy)", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(Ofiara: 2500 bry³ek rudy)", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(Ofiara: 1000 bry³ek rudy)", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(Ofiara: 100 bry³ek rudy)", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
if (hero.lp >= 1)
{
hero.lp = hero.lp - 1;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 2;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
{
if (hero.lp >= 5)
{
hero.lp = hero.lp - 1;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
	} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	if (hero.lp >= 10)
{
hero.lp = hero.lp - 10;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD()
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	if (hero.lp >= 20)
{
hero.lp = hero.lp - 20;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 40;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

//========================================
//-----------------> ADD_MANA_BEL
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_ADD_MANA_BEL (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_ADD_MANA_BEL_Condition;
   information  = DIA_PC_HERO_ADD_MANA_BEL_Info;
   permanent	= true;
   description	= "Daj mi manê!";
};

FUNC INT DIA_PC_HERO_ADD_MANA_BEL_Condition()
{
if (monolog == Beliar)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 10*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 20*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};
*/
/*


//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_INNOS(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_EXIT_INNOS_Condition;
	information		= DIA_PC_HERO_EXIT_INNOS_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_INNOS_Condition()
{
	if (monolog == Innos)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_INNOS_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HIT_POINTS
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_HIT_POINTS (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_HIT_POINTS_Condition;
   information  = DIA_PC_HERO_HIT_POINTS_Info;
   permanent	= TRUE;
   description	= "Daj mi punkty ¿ycia!";
};

FUNC INT DIA_PC_HERO_HIT_POINTS_Condition()
{
if (monolog == Innos)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_2HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
if (hero.lp >= 1)
{
hero.lp = hero.lp - 1;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 2;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_10HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
	{
	if (hero.lp >= 5)
{
hero.lp = hero.lp - 5;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_20HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	if (hero.lp >= 10)
{
hero.lp = hero.lp - 10;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_40HP_ADD()
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	if (hero.lp >= 20)
{
hero.lp = hero.lp - 20;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 40;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

//========================================
//-----------------> ADD_MANA
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_ADD_MANA (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_ADD_MANA_Condition;
   information  = DIA_PC_HERO_ADD_MANA_Info;
   permanent	= true;
   description	= "Daj mi manê!";
};

FUNC INT DIA_PC_HERO_ADD_MANA_Condition()
{
if (monolog == Innos)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_ADD_MANA_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_1MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_5MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_10MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 10*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_20MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 20*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};
*/
/*************************************************************************
**	ZombieDupa Prototype													**
*************************************************************************/
/*
PROTOTYPE Mst_Default_ZombieDupa(C_Npc)			
{
	name							=	"Zombi - pos³aniec";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	25;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	160;
	attribute	[ATR_DEXTERITY]		=	160;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	100;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic							=	FAI_ZOMBIE;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 5000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void Set_ZombieDupa_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,			-1);
};
/*
//-------------------------------------------------------------
func void Set_Zombie2_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie3_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie4_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			-1);
};
*/

/*************************************************************************
**	Zombie    															**
*************************************************************************/
/*
INSTANCE ZombieDupa		(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
	//CreateInvItem	(self, ItWrWorldmapBlackMage);

};


*/



//*********************************************************
// EDYCJA ROZSZERZONA
// PANCERZE I HELMY 
// 28 LIPIEC
// edit by gothic1210
// 22 wrzesieñ
//*********************************************************

//BANDYCI
//******************

/*
INSTANCE WAR_ARMOR_H(C_Item)
{
	name 					=	"Zbroja wojownika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	5;

	value 					=	3550;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
}; /* */

/*
INSTANCE BAU_ARMOR_H(C_Item)
{
	name 					=	"Zbroja bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_STT_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
*/

/*******************************************************************************************
**	ELITARNA ZBROJA ŒWI¥TYNNA                                                     **
*******************************************************************************************/
/*
INSTANCE TPLE_ARMOR_H(C_Item)
{
	name 					=	"Zbroja elitarnego stra¿nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85;
	protection [PROT_BLUNT] = 	85;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	10;

	value 					=	4500;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 				=	"Hum_TPLS_ARMOR.asc";
	visual_skin 				=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
*/
/******************************************************************************************/
INSTANCE NON_ARMOR1(C_Item)
{
	name 					=	"Ozdobna zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	64;
	protection [PROT_BLUNT] = 	64;
	protection [PROT_POINT] = 	12;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	3;

	value 					=	4800;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdm.3ds";
	visual_change 			=	"Hum_GRDM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

//*************************************************
// He³my 
//*************************************************

instance Helmet1(C_Item)
{
        name = "He³m myœliwego";   
        mainflag = ITEM_KAT_ARMOR;   
        flags = 0;
        protection[PROT_EDGE] = 10;
        protection[PROT_BLUNT] = 10;
        protection[PROT_POINT] = 20;
        protection[PROT_FIRE] = 2;
        protection[PROT_MAGIC] = 2;
        value = 570;
        wear = WEAR_HEAD;   
        visual = "Helmet_2test.3ds";  
        visual_skin = 0;
        material = MAT_METAL;   
        description = name;
        text[0] = "Ten he³m nosz¹ myœliwi i podró¿nicy.";   
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};



instance Helmet3(C_Item)
{
        name = "Stalowy he³m";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 10;
        protection[PROT_BLUNT] = 10;
        protection[PROT_POINT] = 10;
        protection[PROT_FIRE] = 8;
        protection[PROT_MAGIC] = 5;
        value = 1300;
        wear = WEAR_HEAD;  
        visual = "HELMET_STAL.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Wzmocniony stal¹ he³m"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};

instance Helmet4(C_Item)
{
        name = "Kapelusz materia³owy";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 3;
        protection[PROT_BLUNT] = 3;
        protection[PROT_POINT] = 3;
        protection[PROT_FIRE] = 1;
        protection[PROT_MAGIC] = 1;
        value = 50;
        wear = WEAR_HEAD;  
        visual = "LOGIKER_HUT.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Stary kapelusz"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};
instance Helmet5(C_Item)
{
        name = "H5";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 3;
        protection[PROT_BLUNT] = 3;
        protection[PROT_POINT] = 3;
        protection[PROT_FIRE] = 1;
        protection[PROT_MAGIC] = 1;
        value = 50;
        wear = WEAR_HEAD;  
        visual = "FOOTMAN_HELMET.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Stary kapelusz"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};
instance Helmet6(C_Item)
{
        name = "H6";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 3;
        protection[PROT_BLUNT] = 3;
        protection[PROT_POINT] = 3;
        protection[PROT_FIRE] = 1;
        protection[PROT_MAGIC] = 1;
        value = 50;
        wear = WEAR_HEAD;  
        visual = "WOG_GREEK_HELMET.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Stary kapelusz"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};
instance Helmet7(C_Item)
{
        name = "H7";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 3;
        protection[PROT_BLUNT] = 3;
        protection[PROT_POINT] = 3;
        protection[PROT_FIRE] = 1;
        protection[PROT_MAGIC] = 1;
        value = 50;
        wear = WEAR_HEAD;  
        visual = "SCHATTENGREIF_HELMET.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Stary kapelusz"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};
/*******************************************************************************************
**	ZBROJA POSZUKIWACZA                                                         **
*******************************************************************************************/
INSTANCE PoszukiwaczArmor(C_Item)
{
	name 					=	"Szata Poszukiwacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	80;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	5;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdi.3ds";
	visual_change 			=	"Armor_Dementor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
** TEST                                                   **
*******************************************************************************************/
INSTANCE TestArmor1(C_Item)
{
	name 					=	"Ubranie myœliwego2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Armor_Leather_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
INSTANCE PodroznikArmor(C_Item)
{
	name 					=	"Zbroja podró¿nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	37;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;

	value 					=	1350;

	wear 					=	WEAR_TORSO;
   // ownerGuild 				= 	GIL_GRD;

	visual 					=	"stth.3ds";
	visual_change 			=	"Armor_Ranger_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Zu¿ycie:";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
	//---------- CUSTOM ITEM SCRIPTS ----------
INSTANCE ItMw_BeliarWeapon_1H_20 (C_Item)
{	
	name 				=	"Ostrze Beliara";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	3300;

	damageTotal  		= 	110;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	0;
	visual 				=	"ItMw_BeliarWeapon_1H.3DS";

	description			= name;
	TEXT[2]				= "Broñ jednorêczna";
	TEXT[3]				= NAME_Damage;					COUNT[3]	= damageTotal;
//	TEXT[4] 			= "Chance auf Extraschaden = 50";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//---------- CUSTOM ITEM SCRIPTS ----------
INSTANCE ItMw_BeliarWeapon_2H_20 (C_Item)
{	
	name 				=	"Ostrze Beliara";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3300;

	damageTotal  		= 	120;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	0;
	visual 				=	"ItMw_BeliarWeapon_2H.3DS";

	description			= name;
	TEXT[2]				= "Broñ dwurêczna";
	TEXT[3]				= NAME_Damage;					COUNT[3]	= damageTotal;
	//TEXT[4] 			= "Chance auf Extraschaden = 50";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/* ==========================================
// PODZIÊKOWANIE DLA THEMODDERS>ORG
//++++++++++++++++++++++++++++++ /*
	/********************************************************************************/
INSTANCE THX (C_Item)
{	
	name 				=	"Podziêkowanie";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseTHX;
	scemeName			=	"MAP";
	description			=	 "Od gothica1210";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseTHX ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Witaj!"					);
					Doc_PrintLines	( nDocID,  0, "Bracia, bandyci, gimnazjalne opryszki... i tak dalej"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Dziêkujê za pobranie i instalacjê modyfikacji Edycja rozszerzona. Mam nadziejê, ¿e moja produkcja dostarczy³a wam wiele radochy z rozgrywki i odœwie¿y³a wasze wspomnienia z Koloni Karnej. Mam te¿ nadziejê, ¿e w wersji 1.4 nie by³o du¿o bugów i nie krzyczeliœcie co chwila - Kurwa co za chujstwo - (ju¿ ja wyczerpa³em ca³y limit :P). Graj¹c w moda pamiêtajcie, ¿e stoj¹ za nim ¿ywi ludzie i to dziêki nim mo¿ecie sobie pograæ. S¹ to: Adanos, Avallach, Rafa³ Budzis, VestaX, Arto, Freedy (texy z ver < 1.3), Rysa (armorki bandytów), von pyrika, Golden Age. Pamiêtajcie o nas. ;>"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Wasz ulubiony gothic1210 XDDD"					);

					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/*********************************************
**   PFX PRZYWO£ANIA				**
*********************************************/
INSTANCE Pfx_ResurectionItem (C_Item)
{
	name 				=	"";

	mainflag 			=	-1;
	flags 				=	-1;

	value 				=	0;

	visual 				=	"RESURRECTION.pfx";
};		

/********************************************************************************/
INSTANCE ItWrWorldmapBlackMage(C_Item)
{	
	name 					=	"Mapa ze wskazówk¹";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapBlackMage;

	description				= name;
	TEXT[0]					= "Tê mapê zabra³em ozywieñcowi";
	TEXT[1]					= "z przed opuszczonej kopalni.";
	TEXT[2]					= "Na mapie zaznaczono punkt.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapBlackMage()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_WORLD_EVILC.tga", 	1	);  //  1 -> DO NOT SCALE 

    MIS_blackMage = LOG_RUNNING;

    Log_CreateTopic            (CH1_blackMage, LOG_MISSION);
    Log_SetTopicStatus       (CH1_blackMage, LOG_RUNNING);
    B_LogEntry                     (CH1_blackMage,"Przy ciele pewnego o¿ywieñca znalaz³em tajemnicz¹ mapê. Oznaczono na niej miejsce spotkania, a krawêdzie poplamiono czarn¹ substancj¹. Muszê porozmawiaæ o tym z Saturasem.");

					Doc_Show		( nDocID 	);
	};
/********************************************************************************/	
	INSTANCE TestMap(C_Item)
{	
	name 					=	"Test mapy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapTEST;

	description				= name;
	TEXT[0]					= "----------------------";
	TEXT[1]					= "----------------------";
	TEXT[2]					= "----------------------";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapTEST()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_Evilc.tga", 	1	);  //  1 -> DO NOT SCALE 

  				Doc_SetFont 	( nDocID, 0, "font_15_book.TGA"		); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);
 					Doc_SetFont 	( nDocID, 0, "font_10_book.TGA"			); 
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Dämonenbeschwörer");
					
					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");


					Doc_Show		( nDocID 	);
	};
	
	/********************************************************************************/
INSTANCE ListaSmierci (C_Item)
{	
	name 				=	"Lista œmierci";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UselisaDed;
	scemeName			=	"MAP";
	description			=   "Lista ofiar Poszukiwaczy";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UselisaDed ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Nasz potê¿ny Pan kaza³ zwróciæ uwagê"					);
					Doc_PrintLine	( nDocID,  0, "na nastêpuj¹ce osoby:"					);
					Doc_PrintLine	( nDocID,  0, "Tukash,"					);
					Doc_PrintLine	( nDocID,  0, "Mazin,"					);
					Doc_PrintLine	( nDocID,  0, "Hanson,"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Patros,"	);
					Doc_PrintLine	( nDocID,  0, "Aidan."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					B_KillNpc			(ORG_859_Aidan);
					B_KillNpc			(GRD_7008_Tukash);
					B_KillNpc			(ORG_2704_Mazin);
					B_KillNpc			(NOV_5008_Hanson);
				    CreateInvItems (ORG_859_Aidan, ItFo_Plants_mountainmoos_01, 3);	
					CreateInvItems (GRD_7008_Tukash, ItFo_Plants_mountainmoos_01, 3);	
					CreateInvItems (ORG_2704_Mazin, ItFo_Plants_mountainmoos_01, 3);	
					CreateInvItems (NOV_5008_Hanson, ItFo_Plants_mountainmoos_01, 3);
					listLearn = true;
		
};
/******************************************************************************************/
INSTANCE ItAt_BlackMageTrofeum (C_Item)
{
	name 				=	"Kie³ Czarnego Maga";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	800;

	visual 				=	"ItAt_Troll_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollhauer;
};
//---------------------------------------------------------------------
//lekarstwo dla Avallacha	
//---------------------------------------------------------------------
INSTANCE LekAva(C_ITEM)
{
	name 				= "Lekarstwo na zatrucia";

	mainflag 			= ITEM_KAT_POTIONS;
	flags 				= ITEM_MISSION;

	value 				= 0;	


	visual 				= "ITFO_POTION_STRENGTH_01.3DS";
	material 			= MAT_GLAS;
	on_state[0]			= UseLekAv;
	scemeName			= "POTION";
	description			= name;

	TEXT[0]				= "Efekt: Nieznany";
};
func void UseLekAv ()
{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	300);
};

/*

//========================================
//-----------------> BLACK_MAGE_START
//========================================

INSTANCE DIA_PC_Psionic_BLACK_MAGE_START (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_BLACK_MAGE_START_Condition;
   information  = DIA_PC_Psionic_BLACK_MAGE_START_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Psionic_BLACK_MAGE_START_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Avallach_LetsgonnahatexD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_BLACK_MAGE_START_Info()
{
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_01"); //Cholera, dobrze, ¿e jesteœ. To co siê tam dzieje to jakiœ koszmar. 
    AI_Output (other, self ,"DIA_PC_Psionic_BLACK_MAGE_START_15_02"); //Spokojnie. Co siê sta³o?
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_03"); //Przegl¹da³em ksiêgi bêd¹ce w bibliotece, gdy nagle us³ysza³em straszliwy ha³as.
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_04"); //Nagle, pomieszczenia zaroi³y siê od demonów i postaci w czarnych szatach. 
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_05"); //Ukry³em siê za szaf¹ i przygl¹da³em siê wszystkiemu z daleka. Widzia³em dostaojnie odzianego maga, który poszed³ do jednej z komnat.
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_06"); //Nie wiem co dzia³o siê potem. Szybko przemkn¹lem koryta¿em do wyjœcia. 
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_07"); //Ca³y zamek jest obwarowany. 
    AI_Output (other, self ,"DIA_PC_Psionic_BLACK_MAGE_START_15_08"); //Musimy siê pozbyæ tego plugastwa.
    AI_Output (self, other ,"DIA_PC_Psionic_BLACK_MAGE_START_03_09"); //Pójdê z tob¹. Ktoœ musi ocaliæ cenne zapiski z biblioteki. 
    AI_Output (other, self ,"DIA_PC_Psionic_BLACK_MAGE_START_15_10"); //Dziêki. Ka¿da pomoc siê przyda.
    B_LogEntry                     (CH1_WlakaZczarym,"W pobli¿u zamku spotka³em Lestera. Dowiedzia³em siê, ¿e domony i Poszukiwacze zajê³y ca³¹ twierdzê. Teraz ju¿ jestem pewien, ¿e Czarny Mag tam jest. Na szczêœcie Lester do³¹czy³ do dru¿yny.");

    B_GiveXP (200);
    Npc_ExchangeRoutine (self, "Help_castle");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELP_FRIEND
//========================================

INSTANCE DIA_PC_Psionic_HELP_FRIEND (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_HELP_FRIEND_Condition;
   information  = DIA_PC_Psionic_HELP_FRIEND_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Psionic_HELP_FRIEND_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Avallach_Zabity))
	&& (!Npc_IsDead(NON_3078_Avallach))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_HELP_FRIEND_Info()
{
    AI_Output (self, other ,"DIA_PC_Psionic_HELP_FRIEND_03_01"); //Twój towarzysz jest ranny! Musisz iœæ po lekarstwo dla niego! Choæ nie wiem czy zd¹¿ysz na czas.
    AI_Output (self, other ,"DIA_PC_Psionic_HELP_FRIEND_03_02"); //Musisz podj¹æ decyzjê, a tymczasem ja zajmê siê tymi potworami. 
    B_LogEntry                     (CH1_WlakaZczarym,"W razie czego Lester bêdzie broni³ Aallacha.");
	Npc_ExchangeRoutine (self, "Help_castle2");
};

//========================================
//-----------------> RATOWANIE_ZYCIA
//========================================

INSTANCE DIA_PC_Psionic_RATOWANIE_ZYCIA (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_RATOWANIE_ZYCIA_Condition;
   information  = DIA_PC_Psionic_RATOWANIE_ZYCIA_Info;
   permanent	= FALSE;
   description	= "Mam lekarstwo. Pomó¿ mi go ocuciæ!";
};

FUNC INT DIA_PC_Psionic_RATOWANIE_ZYCIA_Condition()
{
    if (Npc_HasItems (other, LekAva) >=1)
    && (Npc_KnowsInfo (other, DIA_Avallach_Zabity))
	&& (!Npc_IsDead(NON_3078_Avallach))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_RATOWANIE_ZYCIA_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_RATOWANIE_ZYCIA_15_01"); //Mam lekarstwo. Pomó¿ mi go ocuciæ!
    AI_Output (self, other ,"DIA_PC_Psionic_RATOWANIE_ZYCIA_03_02"); //Mam specjalne zio³a.
    AI_GotoWP (self, "LOCATION_19_03_PATH_RUIN7");
    AI_PlayAni		(self,	"T_PLUNDER");
    Npc_ExchangeRoutine (NON_3078_Avallach, "castle");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SUCCES_AV
//========================================

INSTANCE DIA_PC_Psionic_SUCCES_AV (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_SUCCES_AV_Condition;
   information  = DIA_PC_Psionic_SUCCES_AV_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Psionic_SUCCES_AV_Condition()
{
    if (MIS_lekiDlaAva == LOG_SUCCESS)
    && (Npc_KnowsInfo (other, DIA_PC_Psionic_BLACK_MAGE_START))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_SUCCES_AV_Info()
{
    AI_Output (self, other ,"DIA_PC_Psionic_SUCCES_AV_03_01"); //W ostatniej chwili ci siê uda³o. ChodŸmy dalej. 
    AI_Output (self, other ,"DIA_PC_Psionic_SUCCES_AV_03_02"); //Pora rozprawiæ siê z Czarnym Magiem.
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "castle");
    if (Npc_GetDistToNpc(NON_3089_Ashton, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3089_Ashton, "castle");
    };
	if (Npc_GetDistToNpc(NON_3077_Peratur, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3077_Peratur, "castle");
    };
	if (Npc_GetDistToNpc(NON_3072_Jefrey, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3072_Jefrey, "castle");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOSER
//========================================

INSTANCE DIA_PC_Psionic_LOSER (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_LOSER_Condition;
   information  = DIA_PC_Psionic_LOSER_Info;
   permanent	= FALSE;
   description	= "Nie zd¹¿y³em.";
};

FUNC INT DIA_PC_Psionic_LOSER_Condition()
{
    if (MIS_lekiDlaAva == LOG_FAILED)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_LOSER_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_LOSER_15_01"); //Nie zd¹¿y³em.
    AI_Output (self, other ,"DIA_PC_Psionic_LOSER_03_02"); //Wiem. Przykro mi z powodu twojego towarzysza, ale mamy teraz wa¿niejsze rzeczy ni¿ rozczulanie siê.
    AI_Output (self, other ,"DIA_PC_Psionic_LOSER_03_03"); //Dopilnujmy by jego poœwiêcenie nie posz³o na marne.
  Npc_ExchangeRoutine (self, "castle");
    if (Npc_GetDistToNpc(NON_3089_Ashton, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3089_Ashton, "castle");
    };
	if (Npc_GetDistToNpc(NON_3077_Peratur, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3077_Peratur, "castle");
    };
	if (Npc_GetDistToNpc(NON_3072_Jefrey, other) >= 5000)
    {
        Npc_ExchangeRoutine (NON_3072_Jefrey, "castle");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POKONANY
//========================================

INSTANCE DIA_Pc_psionic_POKONANY (C_INFO)
{
   npc          = Pc_psionic;
   nr           = 1;
   condition    = DIA_Pc_psionic_POKONANY_Condition;
   information  = DIA_Pc_psionic_POKONANY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pc_psionic_POKONANY_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_KnowsInfo (other, DIA_PC_Psionic_BLACK_MAGE_START))
    && (Npc_IsDead(NON_3073_Czarny_Mag))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pc_psionic_POKONANY_Info()
{
    AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_01"); //Uda³o ci sie! Pokona³eœ Czarnego Maga. To niesamowite. 
    AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_02"); //Wiedzia³em, ¿e jesteœ stworzony do wielkich rzeczy, ale ta walka by³a jedn¹ z najlepszych jakie widzia³em w ¿yciu.
    AI_Output (other, self ,"DIA_Pc_psionic_POKONANY_15_03"); //Napi³bym siê piwa...
      AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_04"); //Zanim zaczniesz œwiêtowaæ lepiej rozjerzyj siê w zamku. Trzeba dobiæ tych, którzy tu zostali. Mog¹ siê rozbiec po okolicy.
if MIS_4Friends == true
{
	AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_05"); //Ja tymczasem udam siê na spotkanie.
    AI_Output (other, self ,"DIA_Pc_psionic_POKONANY_15_06"); //A gdzie siê ono odbêdzie? 
    AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_07"); //Myœlê, ¿e mogê ci ju¿ powiedzieæ. Nie jest to jakieœ tajne miejsce. Spotykamy siê w karczmie w Nowym Obozie.
    AI_Output (self, other ,"DIA_Pc_psionic_POKONANY_03_08"); //Na pewno nas znajdziesz.
    AI_Output (other, self ,"DIA_Pc_psionic_POKONANY_15_09"); //Dziêki. Bêdê pamiêta³.
	 Npc_ExchangeRoutine (PC_THIEF, "spotkanie");
	 Npc_ExchangeRoutine (PC_PSIONIC, "spotkanie");
	 Npc_ExchangeRoutine (PC_MAGE, "spotkanie");
	 Npc_ExchangeRoutine (PC_FIGHTER, "spotkanie");
	};
    AI_StopProcessInfos	(self);
    B_givexp (500);
};
*/

/*
//========================================
//-----------------> Dificult
//========================================

INSTANCE DIA_Pc_Thief_Dificult (C_INFO)
{
   npc          = Pc_Thief;
   nr           = 1;
   condition    = DIA_Pc_Thief_Dificult_Condition;
   information  = DIA_Pc_Thief_Dificult_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pc_Thief_Dificult_Condition()
{
    if (Kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pc_Thief_Dificult_Info()
{
    AI_Output (self, other ,"DIA_Pc_Thief_Dificult_03_01"); //By³bym zapomnia³. Jak tam z twoimi umiejêtnoœciami?

    Info_ClearChoices		(DIA_Pc_Thief_Dificult);
    Info_AddChoice		(DIA_Pc_Thief_Dificult, "Wiêzienie bardzo mnie wyczerpa³o. (banalny)", DIA_Pc_Thief_Dificult_VeryEasy);
    Info_AddChoice		(DIA_Pc_Thief_Dificult, "Dam sobie radê z przeró¿nym robactwem. (³atwy)", DIA_Pc_Thief_Dificult_Easy);
    Info_AddChoice		(DIA_Pc_Thief_Dificult, "Potrafiê stawiæ czo³a wyzwaniom. (normalny)", DIA_Pc_Thief_Dificult_Normal);
    Info_AddChoice		(DIA_Pc_Thief_Dificult, "Ze wszystkim sobie poradzê. (trudny)", DIA_Pc_Thief_Dificult_Hard);
};

FUNC VOID DIA_Pc_Thief_Dificult_VeryEasy()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Dificult_VeryEasy_15_01"); //Wiêzienie bardzo mnie wyczerpa³o.
    AI_Output (self, other ,"DIA_Pc_Thief_Dificult_VeryEasy_03_02"); //Nie dziwiê siê. Postaraj siê prze¿yæ jak najd³u¿ej.
LPCOST_ATTRIBUTE_STRENGTH	=	1;	
LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
LPCOST_ATTRIBUTE_MANA		=	1;	

LPCOST_TALENT_MAGE_1		=	5;	
LPCOST_TALENT_MAGE_2		=	10;	
LPCOST_TALENT_MAGE_3		=	15;	
LPCOST_TALENT_MAGE_4		=	20;	
LPCOST_TALENT_MAGE_5		=	25;	
LPCOST_TALENT_MAGE_6		=	30;	

LPCOST_TALENT_1H_1			=	5;	
LPCOST_TALENT_1H_2			=	10;	
LPCOST_TALENT_2H_1			=	20;	
LPCOST_TALENT_2H_2			=	30;	
LPCOST_TALENT_BOW_1			=	5;	
LPCOST_TALENT_BOW_2			=	10;	
LPCOST_TALENT_CROSSBOW_1	=	5;	
LPCOST_TALENT_CROSSBOW_2	=	10;	

LPCOST_TALENT_ACROBAT		=	3;	
LPCOST_TALENT_SNEAK			=	3;	
LPCOST_TALENT_PICKLOCK_1	=	5;	
LPCOST_TALENT_PICKLOCK_2	=	5;	
LPCOST_TALENT_PICKPOCKET_1	=	5;	
LPCOST_TALENT_PICKPOCKET_2	=	10;	
bloodfly.level = 12;
wolf.level = 14;
molerat.level = 10;
scavenger.level = 10;
bloodhound.level = 27;
demon.level = 120;
troll.level = 450;
//greengobbo.level = 6;
firewaran.level = 80;   
harpie.level = 28;
minecrawler.level = 22;
waran.level = 39;
snapper.level = 48;
swampshark.level = 23;
skeleton.level = 38;
orcwarrior1.level = 38;
orcdog.level = 30;
lurker.level = 22;
StoneGolem.level = 220;
demonlord.level = 220;
zombie.level = 25;
trollground.level = 240;
//BlackGobbo.level = 12;
//print ("veryeasy");
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_02);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_02);
 AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Dificult_Easy()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Dificult_Easy_15_01"); //Dam sobiê radê z przeró¿nym robactwem.
    AI_Output (self, other ,"DIA_Pc_Thief_Dificult_Easy_03_02"); //Sporo tego bêdzie. 
	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
LPCOST_ATTRIBUTE_MANA		=	1;	

LPCOST_TALENT_MAGE_1		=	10;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	30;	
LPCOST_TALENT_MAGE_6		=	35;	

LPCOST_TALENT_1H_1			=	8;	
LPCOST_TALENT_1H_2			=	15;	
LPCOST_TALENT_2H_1			=	23;	
LPCOST_TALENT_2H_2			=	35;	
LPCOST_TALENT_BOW_1			=	8;	
LPCOST_TALENT_BOW_2			=	15;	
LPCOST_TALENT_CROSSBOW_1	=	8;	
LPCOST_TALENT_CROSSBOW_2	=	15;	

LPCOST_TALENT_ACROBAT		=	5;	
LPCOST_TALENT_SNEAK			=	5;	
LPCOST_TALENT_PICKLOCK_1	=	5;	
LPCOST_TALENT_PICKLOCK_2	=	10;	
LPCOST_TALENT_PICKPOCKET_1	=	5;	
LPCOST_TALENT_PICKPOCKET_2	=	10;	
bloodfly.level = 10;
wolf.level = 12;
molerat.level = 8;
scavenger.level = 8;
bloodhound.level = 25;
demon.level = 100;
troll.level = 400;
//greengobbo.level = 6;
firewaran.level = 70;   
harpie.level = 24;
minecrawler.level = 17;
waran.level = 36;
snapper.level = 46;
swampshark.level = 22;
skeleton.level = 35;
orcwarrior1.level = 36;
orcdog.level = 28;
lurker.level = 20;
StoneGolem.level = 200;
demonlord.level = 200;
zombie.level = 23;
trollground.level = 222;
//BlackGobbo.level = 12;
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_03);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_03);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Dificult_Normal()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Dificult_Normal_15_01"); //Potrafiê stawiæ czo³a wyzwaniom.
    AI_Output (self, other ,"DIA_Pc_Thief_Dificult_Normal_03_02"); //¯yczê ci powodzenia.
	LPCOST_ATTRIBUTE_STRENGTH	=	2;	
LPCOST_ATTRIBUTE_DEXTERITY	=	2;	
LPCOST_ATTRIBUTE_MANA		=	2;	

LPCOST_TALENT_MAGE_1		=	10;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	35;	
LPCOST_TALENT_MAGE_6		=	45;	

LPCOST_TALENT_1H_1			=	12;	
LPCOST_TALENT_1H_2			=	22;	
LPCOST_TALENT_2H_1			=	32;	
LPCOST_TALENT_2H_2			=	42;	

LPCOST_TALENT_BOW_1			=	12;	
LPCOST_TALENT_BOW_2			=	22;	
LPCOST_TALENT_CROSSBOW_1	=	12;	
LPCOST_TALENT_CROSSBOW_2	=	22;	

LPCOST_TALENT_ACROBAT		=	10;	
LPCOST_TALENT_SNEAK			=	10;	
LPCOST_TALENT_PICKLOCK_1	=	10;	
LPCOST_TALENT_PICKLOCK_2	=	20;	
LPCOST_TALENT_PICKPOCKET_1	=	10;	
LPCOST_TALENT_PICKPOCKET_2	=	20;	
bloodfly.level = 7;
wolf.level = 2;
molerat.level = 5;
scavenger.level = 5;
bloodhound.level = 22;
demon.level = 50;
troll.level = 300;
//greengobbo.level = 6;
firewaran.level = 50;   
harpie.level = 20;
minecrawler.level = 13;
waran.level =3;
snapper.level = 4;
swampshark.level = 2;
skeleton.level =3;
orcwarrior1.level = 32;
orcdog.level = 25;
lurker.level = 17;
StoneGolem.level = 100;
demonlord.level = 100;
zombie.level = 20;
trollground.level = 200;
//BlackGobbo.level = 12;
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_03);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_03);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Dificult_Hard()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Dificult_Hard_15_01"); //Ze wszystkim sobiê poradzê.
    AI_Output (self, other ,"DIA_Pc_Thief_Dificult_Hard_03_02"); //Nie b¹dŸ taki pewny siebie. 
		LPCOST_ATTRIBUTE_STRENGTH	=	3;	
LPCOST_ATTRIBUTE_DEXTERITY	=	3;	
LPCOST_ATTRIBUTE_MANA		=	2;	

LPCOST_TALENT_MAGE_1		=	12;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	35;	
LPCOST_TALENT_MAGE_6		=	45;	

LPCOST_TALENT_1H_1			=	12;	
LPCOST_TALENT_1H_2			=	22;	
LPCOST_TALENT_2H_1			=	32;	
LPCOST_TALENT_2H_2			=	42;	

LPCOST_TALENT_BOW_1			=	12;	
LPCOST_TALENT_BOW_2			=	22;	
LPCOST_TALENT_CROSSBOW_1	=	12;	
LPCOST_TALENT_CROSSBOW_2	=	22;	

LPCOST_TALENT_ACROBAT		=	10;	
LPCOST_TALENT_SNEAK			=	10;	
LPCOST_TALENT_PICKLOCK_1	=	10;	
LPCOST_TALENT_PICKLOCK_2	=	30;	
LPCOST_TALENT_PICKPOCKET_1	=	10;	
LPCOST_TALENT_PICKPOCKET_2	=	30;
bloodfly.level =5;
wolf.level = 6;
molerat.level =3;
scavenger.level = 3;
bloodhound.level = 15;
demon.level = 25;
troll.level = 200;
//greengobbo.level = 3;
firewaran.level = 43;   
harpie.level = 13;
minecrawler.level = 8;
waran.level =15;
snapper.level = 12;
swampshark.level = 12;
skeleton.level =15;
orcwarrior1.level = 25;
orcdog.level = 14;
lurker.level = 14;
stonegolem.level = 70;
demonlord.level = 70;
//BlackGobbo.level = 9;
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_02);
EquipItem		(GRD_254_Orry, ItRw_Crossbow_01);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_02);
EquipItem		(GRD_281_Gardist, ItRw_Crossbow_01);
    AI_StopProcessInfos	(self);
}; */
/*
//======================================
//-----------------> Difficult2
//========================================

INSTANCE DIA_Pc_Thief_Difficult2 (C_INFO)
{
   npc          = Pc_Thief;
   nr           = 2;
   condition    = DIA_Pc_Thief_Difficult2_Condition;
   information  = DIA_Pc_Thief_Difficult2_Info;
   permanent	= TRUE;
   description	= "Co do moich zdolnoœci...";
};

FUNC INT DIA_Pc_Thief_Difficult2_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Pc_Thief_Dificult))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pc_Thief_Difficult2_Info()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_15_01"); //Co do moich zdolnoœci...
    AI_Output (self, other ,"DIA_Pc_Thief_Difficult2_03_02"); //S³ucham.


    Info_ClearChoices		(DIA_Pc_Thief_Difficult2);
    Info_AddChoice		(DIA_Pc_Thief_Difficult2, "Wiêzienie bardzo mnie wyczerpa³o. (banalny)", DIA_Pc_Thief_Difficult2_VaryEasy);
    Info_AddChoice		(DIA_Pc_Thief_Difficult2, "Dam sobiê radê z przeró¿nym robactwem. (³atwy)", DIA_Pc_Thief_Difficult2_Easy);
    Info_AddChoice		(DIA_Pc_Thief_Difficult2, "Potrafiê stawiæ czo³a wyzwaniom. (normalny)", DIA_Pc_Thief_Difficult2_Normal);
    Info_AddChoice		(DIA_Pc_Thief_Difficult2, "Ze wszystkim sobiê poradzê. (trudny)", DIA_Pc_Thief_Difficult2_Hard);
};

FUNC VOID DIA_Pc_Thief_Difficult2_VaryEasy()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_VaryEasy_15_01"); //Wiêzienie bardzo mnie wyczerpa³o.
    AI_Output (self, other ,"DIA_Pc_Thief_Difficult2_VaryEasy_03_02"); //Có¿. Nie w¹tpiê.
	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
LPCOST_ATTRIBUTE_MANA		=	1;	

LPCOST_TALENT_MAGE_1		=	5;	
LPCOST_TALENT_MAGE_2		=	10;	
LPCOST_TALENT_MAGE_3		=	15;	
LPCOST_TALENT_MAGE_4		=	20;	
LPCOST_TALENT_MAGE_5		=	25;	
LPCOST_TALENT_MAGE_6		=	30;	

LPCOST_TALENT_1H_1			=	5;	
LPCOST_TALENT_1H_2			=	10;	
LPCOST_TALENT_2H_1			=	20;	
LPCOST_TALENT_2H_2			=	30;	
LPCOST_TALENT_BOW_1			=	5;	
LPCOST_TALENT_BOW_2			=	10;	
LPCOST_TALENT_CROSSBOW_1	=	5;	
LPCOST_TALENT_CROSSBOW_2	=	10;	

LPCOST_TALENT_ACROBAT		=	3;	
LPCOST_TALENT_SNEAK			=	3;	
LPCOST_TALENT_PICKLOCK_1	=	5;	
LPCOST_TALENT_PICKLOCK_2	=	5;	
LPCOST_TALENT_PICKPOCKET_1	=	5;	
LPCOST_TALENT_PICKPOCKET_2	=	10;	
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_02);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_02);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Old_01);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_02);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Difficult2_Easy()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_Easy_15_01"); //Dam sobiê radê z przeró¿nym robactwem.
    AI_Output (self, other ,"DIA_Pc_Thief_Difficult2_Easy_03_02"); //Sporo tego bêdzie.
		LPCOST_ATTRIBUTE_STRENGTH	=	1;	
LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
LPCOST_ATTRIBUTE_MANA		=	1;	

LPCOST_TALENT_MAGE_1		=	10;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	30;	
LPCOST_TALENT_MAGE_6		=	35;	

LPCOST_TALENT_1H_1			=	8;	
LPCOST_TALENT_1H_2			=	15;
LPCOST_TALENT_2H_1			=	23;	
LPCOST_TALENT_2H_2			=	35;	
LPCOST_TALENT_BOW_1			=	8;	
LPCOST_TALENT_BOW_2			=	15;	
LPCOST_TALENT_CROSSBOW_1	=	8;	
LPCOST_TALENT_CROSSBOW_2	=	15;	

LPCOST_TALENT_ACROBAT		=	5;	
LPCOST_TALENT_SNEAK			=	5;	
LPCOST_TALENT_PICKLOCK_1	=	5;	
LPCOST_TALENT_PICKLOCK_2	=	10;	
LPCOST_TALENT_PICKPOCKET_1	=	5;	
LPCOST_TALENT_PICKPOCKET_2	=	10;	
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2005_Stra¿nik, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_03);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Short_02);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_03);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Difficult2_Normal()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_Normal_15_01"); //Potrafiê stawiæ czo³a wyzwaniom.
    AI_Output (self, other ,"DIA_Pc_Thief_Difficult2_Normal_03_02"); //¯yczê powodzenia.
		LPCOST_ATTRIBUTE_STRENGTH	=	2;	
LPCOST_ATTRIBUTE_DEXTERITY	=	2;	
LPCOST_ATTRIBUTE_MANA		=	2;	

LPCOST_TALENT_MAGE_1		=	10;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	35;	
LPCOST_TALENT_MAGE_6		=	45;	

LPCOST_TALENT_1H_1			=	12;	
LPCOST_TALENT_1H_2			=	22;	
LPCOST_TALENT_2H_1			=	32;	
LPCOST_TALENT_2H_2			=	42;	

LPCOST_TALENT_BOW_1			=	12;	
LPCOST_TALENT_BOW_2			=	22;	
LPCOST_TALENT_CROSSBOW_1	=	12;	
LPCOST_TALENT_CROSSBOW_2	=	22;	

LPCOST_TALENT_ACROBAT		=	10;	
LPCOST_TALENT_SNEAK			=	10;	
LPCOST_TALENT_PICKLOCK_1	=	10;	
LPCOST_TALENT_PICKLOCK_2	=	20;	
LPCOST_TALENT_PICKPOCKET_1	=	10;	
LPCOST_TALENT_PICKPOCKET_2	=	20;	
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Bow_Small_03);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_254_Orry, ItRw_Bow_Small_03);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_Short_05);
EquipItem		(GRD_281_Gardist, ItRw_Bow_Small_03);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Pc_Thief_Difficult2_Hard()
{
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_Hard_15_01"); //Ze wszystkim sobiê poradzê.
    AI_Output (self, other ,"DIA_Pc_Thief_Difficult2_Hard_03_02"); //Nie b¹dŸ taki pewny siebie.
    AI_Output (other, self ,"DIA_Pc_Thief_Difficult2_Hard_15_03"); //Ju¿ nie raz udowodni³em na co mnie staæ.
			LPCOST_ATTRIBUTE_STRENGTH	=	3;	
LPCOST_ATTRIBUTE_DEXTERITY	=	3;	
LPCOST_ATTRIBUTE_MANA		=	2;	

LPCOST_TALENT_MAGE_1		=	12;	
LPCOST_TALENT_MAGE_2		=	15;	
LPCOST_TALENT_MAGE_3		=	20;	
LPCOST_TALENT_MAGE_4		=	25;	
LPCOST_TALENT_MAGE_5		=	35;	
LPCOST_TALENT_MAGE_6		=	45;	

LPCOST_TALENT_1H_1			=	12;	
LPCOST_TALENT_1H_2			=	22;	
LPCOST_TALENT_2H_1			=	32;	
LPCOST_TALENT_2H_2			=	42;	

LPCOST_TALENT_BOW_1			=	12;	
LPCOST_TALENT_BOW_2			=	22;	
LPCOST_TALENT_CROSSBOW_1	=	12;	
LPCOST_TALENT_CROSSBOW_2	=	22;	

LPCOST_TALENT_ACROBAT		=	10;	
LPCOST_TALENT_SNEAK			=	10;	
LPCOST_TALENT_PICKLOCK_1	=	10;	
LPCOST_TALENT_PICKLOCK_2	=	30;	
LPCOST_TALENT_PICKPOCKET_1	=	10;	
LPCOST_TALENT_PICKPOCKET_2	=	30;
bloodfly.level =5;
wolf.level = 6;
molerat.level =3;
scavenger.level = 3;
bloodhound.level = 15;
demon.level = 25;
troll.level = 200;
//greengobbo.level = 3;
firewaran.level = 43;   
harpie.level = 13;
minecrawler.level = 8;
waran.level =15;
snapper.level = 12;
swampshark.level = 12;
skeleton.level =15;
orcwarrior1.level = 25;
orcdog.level = 14;
lurker.level = 14;
stonegolem.level = 70;
demonlord.level = 70;
//BlackGobbo.level = 9;
EquipItem		(GRD_2001_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2001_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_2002_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2002_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_2003_Stra¿nik, ItMw_1H_Sword_02);
EquipItem		(GRD_2003_Stra¿nik, ItRw_Crossbow_01);
EquipItem		(GRD_254_Orry, ItMw_1H_Sword_02);
EquipItem		(GRD_254_Orry, ItRw_Crossbow_01);
EquipItem		(GRD_281_Gardist, ItMw_1H_Sword_02);
EquipItem		(GRD_281_Gardist, ItRw_Crossbow_01);
    AI_StopProcessInfos	(self);
};
*/

/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/

/******************************************************************************************/
INSTANCE NOV2_ARMOR_L(C_Item)
{
	name 					=	"Przepaska Nowicjusza Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   18;
	protection [PROT_BLUNT] = 	18;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	20;

	value 					=	450;

	wear 					=	WEAR_TORSO;

	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE DarkArmor_v1(C_Item)
{
	name 					=	"Strój asasyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	15;

	value 					=	2000;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"DB_AKO_ARMOR_L.3ds";
	visual_change 			=	"DB_Ako_Armor_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE NON_HunterArmor_01(C_Item) //chuj wie co to
{
	name 					=	"Lekki strój myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	300;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_PIR_L_ADDON.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE NON_HunterArmor_02(C_Item)
{
	name 					=	"Skórzany strój";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	23;
	protection [PROT_BLUNT] = 	23;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	2;
	protection [PROT_MAGIC] = 	2;

	value 					=	350;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_PIR_L_ADDON.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	STARY OBÓZ                                  
**  STRA¯NICY MAGNACI
*******************************************************************************************/

/******************************************************************************************/
INSTANCE EBR_ARMOR_L(C_Item) //tego te¿ nie
{
	name 					=	"Lekki pancerz Magnata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	72;
	protection [PROT_BLUNT] = 	72;
	protection [PROT_POINT] = 	12;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};






/*******************************************************************************************
**	ZNALEISKA, STAERE ZBROJE                                      
**  TYLKO DLA BOHATERA
*******************************************************************************************/
INSTANCE DarkArmor_v2(C_Item) //nie ma
{
	name 					=	"Szata asasyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	30;

	value 					=	3800;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"DB_Ako_Armor_L.3ds";
	visual_change 			=	"DB_Pri_Armor_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE DarkArmor_v3(C_Item) //nie ma
{
	name 					=	"Wzmocniona szata asasyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	72;
	protection [PROT_BLUNT] = 	72;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	22;
	protection [PROT_MAGIC] = 	33;

	value 					=	4200;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"DB_Ako_Armor_L.3ds";
	visual_change 			=	"DB_Pri_Armor_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItMw_HolzAxt (C_Item) //nieu¿yty
{	
	name 				=	"Topór drwala";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	20;
	
	visual 				=	"itmw_holzaxt.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};
/******************************************************************************************/
INSTANCE ItMw_HolzAxt_h (C_Item)
{	
	name 				=	"Ciê¿ki topór drwala";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	35;
	
	visual 				=	"ItMw_HolzAxt_H.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};

/******************************************************************************************/
/*
INSTANCE Kustur_guru (C_Item) //dostajemy od Angara
{
	name 				=	"Kostur Guru";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			= 	62;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};*/

/******************************************************************************************/	
INSTANCE ItMa_RuneBandit(C_Item)
{	
	name 					=	"Jednorazowa pieczêæ";
	
	mainflag 				=	ITEM_KAT_RUNE;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItAr_Scroll_28.3DS";
	material 				=	MAT_STONE;

	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UseTrolki;

	description				= name;
	TEXT[0]					= "Ta pieczêæ pozwoli";
	TEXT[1]					= "na przywo³anie trolli";
	TEXT[2]					= "w Obozie Bandytów.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

func void UseTrolki ()
{
if (Kapitel == 4) && (planB == true)
{
Wld_InsertNpc		(Troll,"LOCATION_11_12_02");
Wld_InsertNpc		(Troll,"OSELKA1");
Wld_InsertNpc		(Troll,"LOCATION_11_03");
Wld_InsertNpc		(Troll,"LOCATION_11_06");
Print ("Przywo³a³eœ cztery trolle w wyznaczone  miejsce");
Npc_RemoveInvItem (hero, ItMa_RuneBandit);
B_GiveXP (300);
HeroUseRuneB = true;
};
};

//***********************************
// Receptura na lek 
//***********************************
INSTANCE Receptura_LekAva (C_Item)
{	
	name 				=	"Stara receptura";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseReceptura_LekAva;
	scemeName			=	"MAP";
	description			= 	"Przepis na odtrutkê";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseReceptura_LekAva ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Odtrutka"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Alchemik powoli winien tê miksturê przygotowywaæ. Scerafisa sok wlewa najpierw, nastêpnie z alkoholem go miesza. Zêbate ziele rozciera razem z nasionami buka. PóŸniej wszystko podgrzewa i wrzuca ziele lecznicze."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Tylko b¹dŸcie ostro¿ni."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

	
/********************************************************************************/
INSTANCE ItWr_PrzepisOczyszczenieP2 (C_Item)
{	
	name 				=	"Karta ksi¹¿ki";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_OldPaper01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				=  	"Tê kartkê ";
	TEXT[2]				=  	"znalaz³em w starych";
	TEXT[3]				=	"zapiskach alchemika.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Use_OldPaper01 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "27 listopad"					);
					Doc_PrintLines	( nDocID,  0, "Sytuacja nie wygl¹da najlepiej. Stra¿nicy miejscy zorientowali siê, ¿e przenios³em swoje badania do po³udniowej wie¿y. Muszê jak najszybciej pozbyæ siê wszystkiego. Nie wiem tylko jak wywalê te kilkanaœcie nadgni³ych cia³. Postanowi³em spisaæ moj¹ recepturê dla potomnych. "	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/********************************************************************************/
INSTANCE ItWr_PrzepisOczyszczenieP3 (C_Item)
{	
	name 				=	"Karta ksi¹¿ki";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_OldPaper02;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				= "Tê kartkê znalaz³em";
	TEXT[1]				= "w starych zapiskach";
	TEXT[2]				= "alchemika.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Use_OldPaper02 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mikstura oczyszczenia"					);
					Doc_PrintLines	( nDocID,  0, "Najpierw trzeba dobrze przygotowaæ liœcie dragota. Z jednej roœliny uda³o mi siê wycedziæ ca³¹ kolbê soku. Jednak do mikstury nale¿y dodaæ tylko 1/8 czêœæ tego co siê w niej znajduje. Nastêpnie trzeba dodaæ ma³e zio³a uzdrawiaj¹ce. Wa¿ne jest by odci¹æ krawêdzie liœci i wyrzuciæ je natychmiast. Do mikstury wystarczy wy³¹cznie wnêtrze liœcia. Potrzebujemy tak¿e jakiegoœ delikatnego wzmacniacza do tej mikstury. Uwa¿am, ¿e œwietlisty grzyb by³by najlepszy, ale od wielu lat nie widziano tej roœliny na ³¹kach Khorinis..."	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "--------------------------------------"					);
					Doc_PrintLines	( nDocID,  0, "Je¿eli jednak uda³oby nam siê znaleŸæ tê roœlinê, nale¿y wyci¹æ doln¹ czêœæ kapelusza, a resztê zachowaæ, gdy¿ jest niezwykle cenna. Miksturê gotowaæ nale¿t prze 13 minut na wolnym ogniu. "	);					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
