// *Script was make in Easy Dialog Maker (EDM)
func void GOTOWANIE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Gotowanie;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Cook_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_Cook_EXIT_Condition;
	information		= DIA_PC_Hero_Cook_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Cook_EXIT_Condition()
{
    if (monolog == Gotowanie)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Cook_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Soups
//========================================

INSTANCE DIA_PC_Hero_Soups (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Soups_Condition;
   information  = DIA_PC_Hero_Soups_Info;
   permanent	= true;
   description	= "(Ugotuj zupê)";
};

FUNC INT DIA_PC_Hero_Soups_Condition()
{
    if (monolog == Gotowanie)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Soups_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
};
func void DIA_PC_Hero_Soups_Back ()
{
Info_ClearChoices		(DIA_PC_Hero_Soups);
};
FUNC VOID DIA_PC_Hero_Soups_F1()
{
    if (Npc_HasItems (hero, ItFo_Fish5) >=2) && (Npc_HasItems (hero, ItFoRice) >=1) 
    {
	CreateInvItem (hero,ItFoSoupFish1);// 
    Npc_RemoveInvItems (hero, ItFo_Fish5,2);
	Npc_RemoveInvItems (hero, ItFoRice, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);     
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};    
   };
};
FUNC VOID DIA_PC_Hero_Soups_F2()
{
    if (Npc_HasItems (hero, ItFo_Fish2) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Salt_01) >=1) 
    {
	CreateInvItem (hero,ItFoSoupFish2);// 
    Npc_RemoveInvItems (hero, ItFo_Fish2,3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Salt_01, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);  
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};
FUNC VOID DIA_PC_Hero_Soups_F3()
{
    if (Npc_HasItems (hero, ItFo_Fish3) >=2) && (Npc_HasItems (hero, ItFo_Plants_Herb_01) >=2) 
    {
	CreateInvItem (hero,ItFoSoupFish3);// 
    Npc_RemoveInvItems (hero, ItFo_Fish3,2);
	Npc_RemoveInvItems (hero, ItFo_Plants_Herb_01, 2);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);     
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};    
   };
};
FUNC VOID DIA_PC_Hero_Soups_F4()
{
    if (Npc_HasItems (hero, ItFo_Fish4) >=2) && (Npc_HasItems (hero, ItFoLoaf) >=1) 
    {
	CreateInvItem (hero,ItFoSoupFish4);// 
    Npc_RemoveInvItems (hero, ItFo_Fish4,2);
	Npc_RemoveInvItems (hero, ItFoLoaf, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);    
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};
FUNC VOID DIA_PC_Hero_Soups_ChesseSoup()
{
    if (Npc_HasItems (hero, ItFoCheese) >=3) && (Npc_HasItems (hero, ItFoMuttonRaw) >=2) && (Npc_HasItems (hero, ItFoLoaf) >=1)
    {
	CreateInvItem (hero,ItFoChesseSoup);// 
    Npc_RemoveInvItems (hero, ItFoCheese,3);
    Npc_RemoveInvItems (hero, ItFoMuttonRaw, 2);
	Npc_RemoveInvItems (hero, ItFoLoaf, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);   
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};

FUNC VOID DIA_PC_Hero_Soups_BugsSoup()
{
    if (Npc_HasItems (hero, ItAt_Meatbug_01) >=3) && (Npc_HasItems (hero, ItFo_Plants_mushroom_01) >=5) && (Npc_HasItems (hero, ItFoRice) >=2)
    {
	CreateInvItem (hero,ItFoMeatbugragout);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, ItAt_Meatbug_01,3);
    Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_01, 5);
	Npc_RemoveInvItems (hero, ItFoRice, 2);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);    
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};

FUNC VOID DIA_PC_Hero_Soups_MoleratSoup()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Moleratlubric_01) >=1) && (Npc_HasItems (hero, ItFoMuttonRaw) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Salt_01) >=1)
    {
	CreateInvItem (hero,ItFoMoleratSoup);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Moleratlubric_01,1);
    Npc_RemoveInvItems (hero, ItFoMuttonRaw, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Salt_01, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);        
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};

FUNC VOID DIA_PC_Hero_Soups_BeastSopu()
{
    if (Npc_HasItems (hero, ItAt_Crawler_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Salt_01) >=2) && (Npc_HasItems (hero, ItFoRice) >=1)
    {
	CreateInvItem (hero,ItFoCrawlersoup);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, ItAt_Crawler_01,1);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Salt_01, 2);
	Npc_RemoveInvItems (hero, ItFoRice, 1);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);       
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};

FUNC VOID DIA_PC_Hero_Soups_Rosolek()
{
    if (Npc_HasItems (hero, ItFoMuttonRaw) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Salt_01) >=2) && (Npc_HasItems (hero, ItFo_Plants_RavenHerb_01) >=2)
    {
	CreateInvItem (hero,ItFoScaSoup);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, ItFoMuttonRaw,3);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Salt_01, 2);
	Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_01, 2);
	PrintS_Ext("Potrawa gotowa!", COL_GREEN);
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);      
    Info_ClearChoices		(DIA_PC_Hero_Soups);
	Info_AddChoice		(DIA_PC_Hero_Soups, DIALOG_BACK, DIA_PC_Hero_Soups_Back);
	if (Npc_HasItems (hero, przepis_zupaserowa) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa serowa", DIA_PC_Hero_Soups_ChesseSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisSnafSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Potrawka z chrz¹szcza", DIA_PC_Hero_Soups_BugsSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisMoleratSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z kretoszczura", DIA_PC_Hero_Soups_MoleratSoup);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisCrawelSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pe³zacza", DIA_PC_Hero_Soups_BeastSopu);
	};
	if (Npc_HasItems (hero, ItWe_PrzepisScaSoup) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Rosó³ ze œcierwojada", DIA_PC_Hero_Soups_Rosolek);
	};
	if (HeroKnows_CookingFish == TRUE)
    {
    Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga têczowego", DIA_PC_Hero_Soups_F1);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z pstr¹ga", DIA_PC_Hero_Soups_F2);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z sandacza", DIA_PC_Hero_Soups_F3);
	Info_AddChoice		(DIA_PC_Hero_Soups, "Zupa z karasia", DIA_PC_Hero_Soups_F4);
	};	
   };
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_PC_Hero_HELLO2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_HELLO2_Condition;
   information  = DIA_PC_Hero_HELLO2_Info;
   permanent	= true;
   description	= "(Ugotuj jaja)";
};

FUNC INT DIA_PC_Hero_HELLO2_Condition()
{
    if (monolog == Gotowanie)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_HELLO2_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_HELLO2);
	Info_AddChoice		(DIA_PC_Hero_HELLO2, DIALOG_BACK, DIA_PC_Hero_HELLO2_Back);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo pe³zacza", DIA_PC_Hero_HELLO2_Eggs1);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo œcierwojada", DIA_PC_Hero_HELLO2_Eggs2);
};
func void DIA_PC_Hero_HELLO2_Back ()
{
Info_ClearChoices		(DIA_PC_Hero_HELLO2);
};
FUNC VOID DIA_PC_Hero_HELLO2_Eggs1()
{
//ItAt_Crawlerqueen
    if (Npc_HasItems (hero, ItAt_Crawlerqueen) >=1) 
    {
	CreateInvItem (hero,ItAt_CookCrawlerqueen);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, ItAt_Crawlerqueen,1);

	PrintS_Ext("Jajko ugotowane!", COL_GREEN);
	B_giveXP (5);
	  Info_ClearChoices		(DIA_PC_Hero_HELLO2);
	Info_AddChoice		(DIA_PC_Hero_HELLO2, DIALOG_BACK, DIA_PC_Hero_HELLO2_Back);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo pe³zacza", DIA_PC_Hero_HELLO2_Eggs1);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo œcierwojada", DIA_PC_Hero_HELLO2_Eggs2);
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);      
  Info_ClearChoices		(DIA_PC_Hero_HELLO2);
	Info_AddChoice		(DIA_PC_Hero_HELLO2, DIALOG_BACK, DIA_PC_Hero_HELLO2_Back);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo pe³zacza", DIA_PC_Hero_HELLO2_Eggs1);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo œcierwojada", DIA_PC_Hero_HELLO2_Eggs2);	
   };
};

FUNC VOID DIA_PC_Hero_HELLO2_Eggs2()
{
    if (Npc_HasItems (hero, JajoSca1) >=1) 
    {
	CreateInvItem (hero,JajoSca2);// ItMi_Alchemy_Moleratlubric_01
    Npc_RemoveInvItems (hero, JajoSca1,1);

	PrintS_Ext("Jajko ugotowane!", COL_GREEN);
	B_giveXP (5);
	  Info_ClearChoices		(DIA_PC_Hero_HELLO2);
	Info_AddChoice		(DIA_PC_Hero_HELLO2, DIALOG_BACK, DIA_PC_Hero_HELLO2_Back);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo pe³zacza", DIA_PC_Hero_HELLO2_Eggs1);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo œcierwojada", DIA_PC_Hero_HELLO2_Eggs2);
    } else {
	PrintS_Ext("Nie masz sk³adników!", COL_RED);
    AI_StopProcessInfos	(self);    
  Info_ClearChoices		(DIA_PC_Hero_HELLO2);
	Info_AddChoice		(DIA_PC_Hero_HELLO2, DIALOG_BACK, DIA_PC_Hero_HELLO2_Back);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo pe³zacza", DIA_PC_Hero_HELLO2_Eggs1);
    Info_AddChoice		(DIA_PC_Hero_HELLO2, "Jajo œcierwojada", DIA_PC_Hero_HELLO2_Eggs2);	
   };
};

