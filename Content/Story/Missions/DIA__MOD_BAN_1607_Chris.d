// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Chris_EXIT(C_INFO)
{
	npc             = BAN_1607_Chris;
	nr              = 999;
	condition	= DIA_Chris_EXIT_Condition;
	information	= DIA_Chris_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Chris_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Chris_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Chris_Hello (C_INFO)
{
   npc          = BAN_1607_Chris;
   nr           = 1;
   condition    = DIA_Chris_Hello_Condition;
   information  = DIA_Chris_Hello_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Chris_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Chris_Hello_Info()
{
    AI_Output (other, self ,"DIA_Chris_Hello_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Chris_Hello_03_02"); //Jestem Chris, Bandyta.
    AI_Output (self, other ,"DIA_Chris_Hello_03_03"); //Chcesz zagra� ze mn� w ko�ci?
};

//========================================
//-----------------> Hey
//========================================

INSTANCE DIA_Chris_Hey (C_INFO)
{
   npc          = BAN_1607_Chris;
   nr           = 2;
   condition    = DIA_Chris_Hey_Condition;
   information  = DIA_Chris_Hey_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Chris_Hey_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Chris_Hey_Info()
{
    AI_Output (self, other ,"DIA_Chris_Hey_03_01"); //Hej, w�drowcze!
    AI_Output (other, self ,"DIA_Chris_Hey_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Chris_Hey_03_03"); //Masz ch�� zagra� ze mn� w ko�ci?
    AI_Output (self, other ,"DIA_Chris_Hey_03_04"); //Zapraszam...
	Log_CreateTopic   	(GE_Games,LOG_NOTE);
    B_LogEntry          (GE_Games,"Z Bandyt� Chrisem mog� zagra� w ko�ci. Znajd� go w centrum Obozu Bandyt�w.");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Chris_HELLO3 (C_INFO)
{
   npc          = BAN_1607_Chris;
   nr           = 3;
   condition    = DIA_Chris_HELLO3_Condition;
   information  = DIA_Chris_HELLO3_Info;
   permanent	= TRUE;
   description	= "Zagrajmy w ko�ci.";
};

FUNC INT DIA_Chris_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chris_Hey))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chris_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Chris_HELLO3_15_01"); //Zagrajmy w ko�ci.
    AI_Output (self, other ,"DIA_Chris_HELLO3_03_02"); //Zaczynamy. Ile stawiasz?

    Info_ClearChoices		(DIA_Chris_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "5 bry�ek rudy", DIA_Chris_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "15 bry�ek rudy", DIA_Chris_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "30 bry�ek rudy", DIA_Chris_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "50 bry�ek rudy", DIA_Chris_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Chris_HELLO3, "A co mi tam! 500 bry�ek", DIA_Chris_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Chris_HELLO3, "Jednak zrezygnuj�.", DIA_Chris_HELLO3_BACK);
};

FUNC VOID DIA_Chris_HELLO3_20ORE()
{
gra1 = Hlp_Random (2);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 5);
Npc_RemoveInvItems (self, ItMiNugget, 5);
}
else
{
AI_Output (self, other ,"DIA_Chris_HELLO3_WIN"); //Wygrana nale�y do ciebie.
CreateInvItems (self, ItMiNugget, 5);
B_GiveInvItems (self, other, ItMiNugget, 5);
};
 Info_ClearChoices		(DIA_Chris_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "5 bry�ek rudy", DIA_Chris_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "15 bry�ek rudy", DIA_Chris_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "30 bry�ek rudy", DIA_Chris_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "50 bry�ek rudy", DIA_Chris_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Chris_HELLO3, "A co mi tam! 500 bry�ek", DIA_Chris_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Chris_HELLO3, "Jednak zrezygnuj�.", DIA_Chris_HELLO3_BACK);
};

FUNC VOID DIA_Chris_HELLO3_60ORE()
{
gra1 = Hlp_Random (2);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 15);
Npc_RemoveInvItems (self, ItMiNugget, 15);
}
else
{
AI_Output (self, other ,"DIA_Chris_HELLO3_WIN"); //Wygrana nale�y do ciebie.
CreateInvItems (self, ItMiNugget, 15);
B_GiveInvItems (self, other, ItMiNugget, 15);
};
 Info_ClearChoices		(DIA_Chris_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "5 bry�ek rudy", DIA_Chris_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "15 bry�ek rudy", DIA_Chris_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "30 bry�ek rudy", DIA_Chris_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "50 bry�ek rudy", DIA_Chris_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Chris_HELLO3, "A co mi tam! 500 bry�ek", DIA_Chris_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Chris_HELLO3, "Jednak zrezygnuj�.", DIA_Chris_HELLO3_BACK);
};

FUNC VOID DIA_Chris_HELLO3_150ORE()
{
gra1 = Hlp_Random (3);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 30);
Npc_RemoveInvItems (self, ItMiNugget, 30);
};
if (gra1 == 2)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_WIN"); //Wygrana nale�y do ciebie.
CreateInvItems (self, ItMiNugget, 30);
B_GiveInvItems (self, other, ItMiNugget, 30);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 30);
Npc_RemoveInvItems (self, ItMiNugget, 30);
};
 Info_ClearChoices		(DIA_Chris_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "5 bry�ek rudy", DIA_Chris_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "15 bry�ek rudy", DIA_Chris_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "30 bry�ek rudy", DIA_Chris_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "50 bry�ek rudy", DIA_Chris_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Chris_HELLO3, "A co mi tam! 500 bry�ek", DIA_Chris_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Chris_HELLO3, "Jednak zrezygnuj�.", DIA_Chris_HELLO3_BACK);
};

FUNC VOID DIA_Chris_HELLO3_300ore()
{
gra1 = Hlp_Random (3);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 50);
Npc_RemoveInvItems (self, ItMiNugget, 50);
};
if (gra1 == 2)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_WIN"); //Wygrana nale�y do ciebie.
CreateInvItems (self, ItMiNugget, 50);
B_GiveInvItems (self, other, ItMiNugget, 50);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 50);
Npc_RemoveInvItems (self, ItMiNugget, 50);
};
 Info_ClearChoices		(DIA_Chris_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "5 bry�ek rudy", DIA_Chris_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "15 bry�ek rudy", DIA_Chris_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "30 bry�ek rudy", DIA_Chris_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Chris_HELLO3, "50 bry�ek rudy", DIA_Chris_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Chris_HELLO3, "A co mi tam! 500 bry�ek", DIA_Chris_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Chris_HELLO3, "Jednak zrezygnuj�.", DIA_Chris_HELLO3_BACK);
};

FUNC VOID DIA_Chris_HELLO3_500Ore()
{
    AI_Output (other, self ,"DIA_Chris_HELLO3_500Ore_15_01"); //A co mi tam! 500 bry�ek.
    AI_Output (self, other ,"DIA_Chris_HELLO3_500Ore_03_02"); //No nie�le! 
    B_GiveXP (150);
	
gra1 = Hlp_Random (7);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 2)
{
Print ("Wygra�e�!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 4)
{
Print ("Wygra�e�!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 5)
{
Print ("Wygra�e�!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 6)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 7)
{
AI_Output (self, other ,"DIA_Chris_HELLO3_LOSE"); //No niestety. Nie uda�o si�. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
};

FUNC VOID DIA_Chris_HELLO3_BACK()
{
    Info_ClearChoices	(DIA_Chris_HELLO3);
};
//========================================
//-----------------> GoToAbMine
//========================================

INSTANCE DIA_Chris_GoToAbMine (C_INFO)
{
   npc          = BAN_1607_Chris;
   nr           = 1;
   condition    = DIA_Chris_GoToAbMine_Condition;
   information  = DIA_Chris_GoToAbMine_Info;
   permanent	= FALSE;
   description	= "Chod� ze mn� do kopalni!";
};

FUNC INT DIA_Chris_GoToAbMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chris_GoToAbMine_Info()
{
    AI_Output (other, self ,"DIA_Chris_GoToAbMine_15_01"); //Chod� ze mn� do kopalni!
    AI_Output (self, other ,"DIA_Chris_GoToAbMine_03_02"); //Do jakiej kopalni?
    AI_Output (other, self ,"DIA_Chris_GoToAbMine_15_03"); //Opuszczonej Kopalni przy placu wymian. Gomez wys�a� tam oddzia� Stra�nik�w. Musimy si� ich pozby�. 
    AI_Output (self, other ,"DIA_Chris_GoToAbMine_03_04"); //Skoro tak stawiasz spraw�, to jasne, �e id�.
    AI_Output (other, self ,"DIA_Chris_GoToAbMine_15_05"); //Dobra. Chod� za mn�. 
    Npc_ExchangeRoutine (self, "FOLLOW");
    AI_StopProcessInfos	(self);
};

