// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator_EXIT(C_INFO)
{
	npc             = ORG_807_Organisator;
	nr              = 999;
	condition	= DIA_Organisator_EXIT_Condition;
	information	= DIA_Organisator_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Organisator_HELLO1 (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_HELLO1_Condition;
   information  = DIA_Organisator_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Organisator_HELLO1_03_01"); //Hej! Dorabiam sobie na boku organizuj¹c ma³e zak³ady.
    AI_Output (self, other ,"DIA_Organisator_HELLO1_03_02"); //Chcesz coœ obstawiæ? A mo¿e wolisz zagraæ w koœci?
	Log_CreateTopic   	(GE_Games,LOG_NOTE);
    B_LogEntry          (GE_Games,"Szkodnik imieniem Greaver oferuje grê w koœci i proste zak³ady. Je¿eli mam chêæ zagraæ, muszê siê do niego zg³osiæ.");
};

//========================================
//-----------------> ZkladyInfos
//========================================

INSTANCE DIA_Organisator_ZkladyInfos (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 2;
   condition    = DIA_Organisator_ZkladyInfos_Condition;
   information  = DIA_Organisator_ZkladyInfos_Info;
   permanent	= 0;
   description	= "Na czym polegaj¹ zak³ady?";
};

FUNC INT DIA_Organisator_ZkladyInfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_ZkladyInfos_Info()
{
    AI_Output (other, self ,"DIA_Organisator_ZkladyInfos_15_01"); //Na czym polegaj¹ zak³ady?
    AI_Output (self, other ,"DIA_Organisator_ZkladyInfos_03_02"); //To proste. Obstawiamy 50 bry³ek rudy na to, kogo dzisiaj pobije Butch.
    AI_Output (other, self ,"DIA_Organisator_ZkladyInfos_15_03"); //Dosyæ oryginalne.
};

//========================================
//-----------------> Obstawiaj
//========================================
var int gra4;
INSTANCE DIA_Organisator_Obstawiaj (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 3;
   condition    = DIA_Organisator_Obstawiaj_Condition;
   information  = DIA_Organisator_Obstawiaj_Info;
   permanent	= TRUE;
   description	= "Chcê obstawiæ...";
};

FUNC INT DIA_Organisator_Obstawiaj_Condition()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_Obstawiaj_Info()
{
    AI_Output (other, self ,"DIA_Organisator_Obstawiaj_15_01"); //Chcê obstawiæ...

    Info_ClearChoices		(DIA_Organisator_Obstawiaj);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, DIALOG_BACK, DIA_Organisator_Obstawiaj_BACK);
  //  Info_AddChoice		(DIA_Organisator_Obstawiaj, "Baal Kagan", DIA_Organisator_Obstawiaj_Baal);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Szkodnik przy kotle", DIA_Organisator_Obstawiaj_Handlarz);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Szkodnik przy ognisku", DIA_Organisator_Obstawiaj_Ktos1);
	if (Npc_KnowsInfo (hero, DIA_Shrike_GetLost))
	{
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Krzykacz", DIA_Organisator_Obstawiaj_Ktos2);
	};
  //  Info_AddChoice		(DIA_Organisator_Obstawiaj, "Osoba3", DIA_Organisator_Obstawiaj_Ktos3);
};

FUNC VOID DIA_Organisator_Obstawiaj_BACK()
{
    Info_ClearChoices	(DIA_Organisator_Obstawiaj);
};

FUNC VOID DIA_Organisator_Obstawiaj_Baal()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Baal_15_01"); //Dziœ dostanie Baal Kagan.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Baal_03_01"); //Ho, ho! NieŸle!

		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Baal_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,ORG_817_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Handlarz()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Handlarz_15_01"); //Dziœ dostanie Szkodnik przy kotle.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Handlarz_03_01"); //Ho, ho! NieŸle!
		Npc_SetTarget(Org_851_Butch,ORG_817_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Handlarz_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Ktos1()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Ktos1_15_01"); //Dziœ dostanie Szkodnik przy ognisku.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos1_03_01"); //Ho, ho! NieŸle!
		Npc_SetTarget(Org_851_Butch,ORG_822_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos1_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Ktos2()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Ktos2_15_01"); //Dziœ dostanie Krzykacz!
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos2_03_01"); //Trafi³eœ!
		Npc_SetTarget(Org_851_Butch,ORG_842_Shrike);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos2_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,ORG_822_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};
/*
FUNC VOID DIA_Organisator_Obstawiaj_Ktos3()
{
};

*/
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Organisator_HELLO3 (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 3;
   condition    = DIA_Organisator_HELLO3_Condition;
   information  = DIA_Organisator_HELLO3_Info;
   permanent	= TRUE;
   description	= "Zagrajmy w koœci.";
};

FUNC INT DIA_Organisator_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Organisator_HELLO3_15_01"); //Zagrajmy w koœci.
    AI_Output (self, other ,"DIA_Organisator_HELLO3_03_02"); //Zaczynamy. Ile stawiasz?

    Info_ClearChoices		(DIA_Organisator_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "5 bry³ek rudy", DIA_Organisator_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "15 bry³ek rudy", DIA_Organisator_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "30 bry³ek rudy", DIA_Organisator_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "50 bry³ek rudy", DIA_Organisator_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Organisator_HELLO3, "A co mi tam! 500 bry³ek", DIA_Organisator_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Organisator_HELLO3, "Jednak zrezygnujê.", DIA_Organisator_HELLO3_BACK);
};

FUNC VOID DIA_Organisator_HELLO3_20ORE()
{
gra1 = Hlp_Random (2);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 5);
Npc_RemoveInvItems (self, ItMiNugget, 5);
}
else
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_WIN"); //Wygrana nale¿y do ciebie.
CreateInvItems (self, ItMiNugget, 5);
B_GiveInvItems (self, other, ItMiNugget, 5);
};
 Info_ClearChoices		(DIA_Organisator_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "5 bry³ek rudy", DIA_Organisator_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "15 bry³ek rudy", DIA_Organisator_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "30 bry³ek rudy", DIA_Organisator_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "50 bry³ek rudy", DIA_Organisator_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Organisator_HELLO3, "A co mi tam! 500 bry³ek", DIA_Organisator_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Organisator_HELLO3, "Jednak zrezygnujê.", DIA_Organisator_HELLO3_BACK);
};

FUNC VOID DIA_Organisator_HELLO3_60ORE()
{
gra1 = Hlp_Random (2);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 15);
Npc_RemoveInvItems (self, ItMiNugget, 15);
}
else
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_WIN"); //Wygrana nale¿y do ciebie.
CreateInvItems (self, ItMiNugget, 15);
B_GiveInvItems (self, other, ItMiNugget, 15);
};
 Info_ClearChoices		(DIA_Organisator_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "5 bry³ek rudy", DIA_Organisator_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "15 bry³ek rudy", DIA_Organisator_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "30 bry³ek rudy", DIA_Organisator_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "50 bry³ek rudy", DIA_Organisator_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Organisator_HELLO3, "A co mi tam! 500 bry³ek", DIA_Organisator_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Organisator_HELLO3, "Jednak zrezygnujê.", DIA_Organisator_HELLO3_BACK);
};

FUNC VOID DIA_Organisator_HELLO3_150ORE()
{
gra1 = Hlp_Random (3);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 30);
Npc_RemoveInvItems (self, ItMiNugget, 30);
};
if (gra1 == 2)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_WIN"); //Wygrana nale¿y do ciebie.
CreateInvItems (self, ItMiNugget, 30);
B_GiveInvItems (self, other, ItMiNugget, 30);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 30);
Npc_RemoveInvItems (self, ItMiNugget, 30);
};
 Info_ClearChoices		(DIA_Organisator_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "5 bry³ek rudy", DIA_Organisator_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "15 bry³ek rudy", DIA_Organisator_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "30 bry³ek rudy", DIA_Organisator_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "50 bry³ek rudy", DIA_Organisator_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Organisator_HELLO3, "A co mi tam! 500 bry³ek", DIA_Organisator_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Organisator_HELLO3, "Jednak zrezygnujê.", DIA_Organisator_HELLO3_BACK);
};

FUNC VOID DIA_Organisator_HELLO3_300ore()
{
gra1 = Hlp_Random (3);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 50);
Npc_RemoveInvItems (self, ItMiNugget, 50);
};
if (gra1 == 2)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_WIN"); //Wygrana nale¿y do ciebie.
CreateInvItems (self, ItMiNugget, 50);
B_GiveInvItems (self, other, ItMiNugget, 50);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 50);
Npc_RemoveInvItems (self, ItMiNugget, 50);
};
 Info_ClearChoices		(DIA_Organisator_HELLO3);
	if (Npc_HasItems (hero, ItMiNugget)>=5)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "5 bry³ek rudy", DIA_Organisator_HELLO3_20ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=15)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "15 bry³ek rudy", DIA_Organisator_HELLO3_60ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=30)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "30 bry³ek rudy", DIA_Organisator_HELLO3_150ORE);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice		(DIA_Organisator_HELLO3, "50 bry³ek rudy", DIA_Organisator_HELLO3_300ore);
	};
//	if (Npc_HasItems (hero, ItMiNugget)>=500)
//	{
//    Info_AddChoice		(DIA_Organisator_HELLO3, "A co mi tam! 500 bry³ek", DIA_Organisator_HELLO3_500Ore);
//	};
    Info_AddChoice		(DIA_Organisator_HELLO3, "Jednak zrezygnujê.", DIA_Organisator_HELLO3_BACK);
};

FUNC VOID DIA_Organisator_HELLO3_500Ore()
{
    AI_Output (other, self ,"DIA_Organisator_HELLO3_500Ore_15_01"); //A co mi tam! 500 bry³ek.
    AI_Output (self, other ,"DIA_Organisator_HELLO3_500Ore_03_02"); //No nieŸle! 
    B_GiveXP (150);
	
gra1 = Hlp_Random (7);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 2)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 4)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 5)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 6)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 7)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
};

FUNC VOID DIA_Organisator_HELLO3_BACK()
{
    Info_ClearChoices	(DIA_Organisator_HELLO3);
};

