// *Script was make in Easy Dialog Maker (EDM)
//poprawne g1210

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stanley_EXIT(C_INFO)
{
	npc             = NON_5602_Stanley;
	nr              = 999;
	condition	= DIA_Stanley_EXIT_Condition;
	information	= DIA_Stanley_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stanley_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stanley_EXIT_Info()
{
	/*if (Npc_HasItems (self, ItMw_2H_Sword_03) ==0)
	{
	EquipItem		(self, ItMw_2H_Sword_03);
	};
	if (Npc_HasItems (other, ItRw_Bow_Long_08) ==0)
	{
	EquipItem		(self, ItRw_Bow_Long_08);
	};*/
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Stanley_HELLO1 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_HELLO1_Condition;
   information  = DIA_Stanley_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czym si� tutaj zajmujesz?";
};

FUNC INT DIA_Stanley_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stanley_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_01"); //Czym si� tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_02"); //Dbam o inwentarz my�liwych.
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_03"); //Polujesz na co�?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_04"); //Czasami. Raczej nie opuszczam obozu.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TraderOW,"My�liwy Stanley to osoba z kt�r� mog� pohandlowa� r�no�ciami. Znajd� go w ma�ym obozie my�liwych przy rzece.");
};

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  NON_Stanley_TEACH_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= NON_Stanley_TEACH_2H_Condition;
	information		= NON_Stanley_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy�?"; 
};
//
FUNC int  NON_Stanley_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  NON_Stanley_TEACH_2H_Info()
{
	AI_Output (other, self,"NON_Stanley_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"NON_Stanley_TEACH_2H_Info_09_02"); //Mog� przeprowadzi� z tob� podstawowe szkolenie bojowe w zakresie broni jednor�cznej i dwur�cznej. Nikt inny ci� wi�cej nie nauczy, dop�ki nie do��czysz do kt�rego� z oboz�w. 

		Log_CreateTopic   (GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Stanley przeszkoli mnie z podstaw broni jedno i dwur�cznej.");
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  DIA_Stanley_Teach_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= DIA_Stanley_Teach_2H_Condition;
	information		= DIA_Stanley_Teach_2H_Info;
	permanent		= 1;
	description		= "Zacznijmy trening broni dwur�cznej."; 
};
//
FUNC int  DIA_Stanley_Teach_2H_Condition()
{	
	if (Npc_KnowsInfo (hero, NON_Stanley_TEACH_2H))
	{
	return TRUE;
	};
};

FUNC void  DIA_Stanley_Teach_2H_Info()
{
	AI_Output (other, self,"DIA_Stanley_Teach_2H_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"DIA_Stanley_Teach_2H_Info_09_02"); //No dobra.

	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

func void DIA_Stanley_Teach_2HBACK ()
{
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
};

FUNC VOID Stanley_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_00"); //Chcia�bym nauczy� si� walki dwur�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_01"); //Bronie dwur�czne wymagaj� sporo si�y. S� ci�kie, a przez to tak�e wolniejsze.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_02"); //Zmieni si� to jednak w trakcie czynienia przez ciebie post�p�w w nauce.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_03"); //Za powolno�� bronie dwur�czne odwdzi�cz� ci si� pot�nymi obra�eniami.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_04"); //Ka�d� bro� musisz odpowiednio wyczu�. Topory s� inaczej zbalansowane ni� miecze. Pami�taj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

FUNC VOID Stanley_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_06"); //Musisz pracowa� nad swoj� si��. Pozwoli ci ona wykonywa� szybsze ruchy i podnosi� coraz ci�sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_07"); //P�niej b�dziesz musia� pozna� odpowiedni� technik� walki i ��cznia cios�w. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_08"); //Na razie nie jeste� wstanie zada� pe�nych obra�e� na jakie pozwala ci dana bro�. Spokojnie, zajmiemy si� tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

FUNC VOID Stanley_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwur�cznych broni?
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_11"); //S� d�ugie... Im d�u�sze tym dalej od siebie mo�esz trzyma� przeciwnika. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_12"); //Gdy kupujesz bro�, zwracaj uwag� na jej g�rn� cz��. Je�li jest wystarczaj�co ostra to nawet dra�ni�cie oponenta z daleka zada mu obra�enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_14"); //Nie, nie, nie. Om�wimy to na nast�pnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_teach_2h4);
	};
};


FUNC VOID Stanley_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Stanley_START_TRAIN (C_INFO)
{
	npc			= NON_5602_Stanley;
	nr			= 700;
	condition	= DIA_Stanley_START_TRAIN_Condition;
	information	= DIA_Stanley_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening broni jednor�cznej.";
};                       

FUNC INT DIA_Stanley_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo (hero, NON_Stanley_TEACH_2H))
	{
		return 1;
	};
};

FUNC VOID DIA_Stanley_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Stanley_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Stanley_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

func void DIA_Stanley_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
};

FUNC VOID Stanley_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_01"); //M�dra decyzja. Najbli�sze trzy lekcje obejm� podstawy z kt�rymi powiniene� si� zapozna�.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_02"); //Bronie jednor�czne s� znacznie l�ejsze ni� dwur�czne, a przez to r�wnie� znacznie szybsze. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_03"); //Istnieje podzia� na lekkie bronie jednor�czne i te ci�sze. Ci�sze wymagaj� pewniejszego chwytu, ale te� wi�cej si�y.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_04"); //Je�li chcesz p�ynnie walczy� ci�k� jednor�czn�, poza technik� b�dziesz te� musia� pozna� tajniki balansowania cia�em.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_05"); //O du�ej sile w �apie ju� nawet nie m�wi�. To oczywiste, �e �eby szybko wymachiwa� takim ci�arem b�dziesz musia� posiada� wi�cej si�y ni� potrzeba do podniesienia dobrego dwur�cznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_06"); //Poka� mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_07"); //Tak jak my�la�em. Zadajesz mniejsze obra�enia ni� faktycznie m�g�by� zada� przy obecnej sile i za�o�onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_08"); //Nie atakuj, gdy jeste� zbyt daleko. Je�li za bardzo si� wychylisz do oddalonego przeciwnika, mo�esz straci� r�wnowag� i si� przewr�ci�.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_09"); //Staraj si� atakowa� z r�nych stron, aby zmyli� przeciwnika. Pami�taj, aby blokowa� uderzenia, je�li nie b�dziesz w stanie zrobi� uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_10"); //Pami�tasz o balansowaniu cia�em? A o odpowiedniej odleg�o�ci od przeciwnika? 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_11"); //Spr�buj wyczu� ile si�y musisz u�y�, aby bro� uderza�a mocno, a przy tym nie polecia�a bez�adnie przed siebie. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_12"); //Gdy to opanujesz, b�dziemy mogli pomy�le� nad ��czeniem po sobie uderze�. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_14"); //R�ce opadaj�... Nie dwiema, tylko jedn�! Om�wimy to na nast�pnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

//========================================
//-----------------> Porwanie
//========================================

INSTANCE DIA_Stanley_Porwanie (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_Porwanie_Condition;
   information  = DIA_Stanley_Porwanie_Info;
   permanent	= FALSE;
   description	= "Alex zosta� porwany?";
};

FUNC INT DIA_Stanley_Porwanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_PorwanieInicjacja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Porwanie_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_01"); //Alex zosta� porwany?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_02"); //Tak. Polowa� w okolicach obozu i zosta� schwytany przez Stra�nik�w.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_03"); //To dziwne.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_04"); //W zachowaniu ludzi Gomeza ju� mnie chyba nic nie zdziwi.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_05"); //Ledwie czeka�, a� zaatakuj� Nowy Ob�z, albo Quentina.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_06"); //Prosz� ci�, uwolnij Alexa.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_07"); //Mo�esz mi powiedzie� co� wi�cej o samym napadzie?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_08"); //By�em w okolicy, jednak ba�em si� interwencji. Mieli znaczn� przewag�.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_09"); //Na swojego szefa wo�ali Siekacz.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_10"); //M�wi ci co� to imi�?
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_11"); //Kojarz� go�cia. Zobacz�, co da si� zrobi�.
    B_LogEntry                     (CH3_Kidnapping,"Alex zosta� porwany przez oddzia� Stra�nik�w pod dow�dztwem Siekacza. ");
};


//========================================
//-----------------> Arrows
//========================================

INSTANCE DIA_Stanley_Arrows (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_Arrows_Condition;
   information  = DIA_Stanley_Arrows_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie 50 strza�. ";
};

FUNC INT DIA_Stanley_Arrows_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_RUNNING)
    && (Npc_HasItems (other, ItAmArrow) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Arrows_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_01"); //Mam dla ciebie 50 strza�. 
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_02"); //Sk�d wiedzia�e�, �e ich potrzebuj�?
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_03"); //Otrzyma�em zadanie od Alexa.
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_04"); //Rozumiem. Dzi�ki za pomoc.
    B_GiveInvItems (other, self, ItAmArrow, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Stanley otrzyma� swoje 50 strza�. ");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Stanley_HELLO2 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 500;
   condition    = DIA_Stanley_HELLO2_Condition;
   information  = DIA_Stanley_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak wygl�da �ycie tutaj?";
};

FUNC INT DIA_Stanley_HELLO2_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_01"); //Jak wygl�da �ycie tutaj?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_02"); //Nie jest a� tak �le. Oczywi�cie, je�li kto� potrafi o siebie zadba�. 
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_03"); //Masz dla mnie jakie� porady?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_04"); //W Kolonii a� roi si� od zwierzyny. Niech ci� jednak to nie zwiedzie. Stada �cierwojad�w i wilk�w nie s� tylko dla nas.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_05"); //Wielu my�liwych zapomina, �e orkowie te� musz� co� je��. Prawie po�owa doliny jest pod ich kontrol�.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_06"); //Na orkowych ziemiach pe�no jest patroli i zwiadowc�w. Nie zapuszczaj si� tam bez dobrej kuszy i miecza.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_07"); //A je�eli by�oby ci dane spotka� orkowego szamana, uciekaj czym pr�dzej.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_09"); //Raz widzia�em takiego orka. Zielonosk�rzy podobnie jak ludzie, potrafi� pos�ugiwa� si� magi�. Ich topory s� niebezpieczne, ale ich ogie� jest wr�cz zab�jczy.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_10"); //B�d� mia� si� na baczno�ci.
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Stanley_TRADE (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 600;
   condition    = DIA_Stanley_TRADE_Condition;
   information  = DIA_Stanley_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy. ";
};

FUNC INT DIA_Stanley_TRADE_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_TRADE_Info()
{
/*	if (Npc_HasItems (self, ItMw_2H_Sword_03) >=1)
	{
	Npc_RemoveInvItems (self, ItMw_2H_Sword_03, 1);
	};
	if (Npc_HasItems (self, ItRw_Bow_Long_08) >=1)
	{
	Npc_RemoveInvItems (self, ItRw_Bow_Long_08, 1);
	};*/
    AI_Output (other, self ,"DIA_Stanley_TRADE_15_01"); //Pohandlujmy. 
    AI_Output (self, other ,"DIA_Stanley_TRADE_03_02"); //Jasne.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Stanley_HELLO4 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 499;
   condition    = DIA_Stanley_HELLO4_Condition;
   information  = DIA_Stanley_HELLO4_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o okolicy.";
};

FUNC INT DIA_Stanley_HELLO4_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO4_15_01"); //Opowiedz mi o okolicy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_02"); //C�, nasz ob�z znajduje si� pomi�dzy dwiema wa�nymi �cie�kami. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_03"); //Jedna prowadzi ze Starego Obozu do kopalni, a druga do Nowego Obozu. Cz�sto mo�na tam spotka� tragarzy przenosz�cych r�ne towary.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_04"); //Raz by�em �wiadkiem napa�ci Bandyt�w na taki konw�j. Co to by�o za widowisko! P�nym wieczorem z lasu wy�oni�y si� pochodnie. Po chwili rozpocz�� si� szale�czy taniec ostrzy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_05"); //Iskry, b�yski or�a, j�k rannych... Ca�o�� trwa�a zaledwie chwil�. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_06"); //Bandyci uciekli, gdy tylko zdobyli �upy. Nie wiem nawet, gdzie znajduje si� ich Ob�z. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_07"); //Pami�tam, jak nast�pnego dnia rano s�ysza�em g�o�ne bluzgi Thorusa. Nie�le si� wtedy wkurzy�, skoro by�o go s�ycha� a� tutaj.
};


//========================================
//-----------------> POLOWANIE_IMPORTANT
//========================================

INSTANCE DIA_Stanley_POLOWANIE_IMPORTANT (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_POLOWANIE_IMPORTANT_Condition;
   information  = DIA_Stanley_POLOWANIE_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stanley_POLOWANIE_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_StaryZaruchal))
    && (MIS_TheftInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_POLOWANIE_IMPORTANT_Info()
{
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_01"); //Hej, ty!
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_02"); //Idziesz ze mn� na polowanie. Musimy si� pozby� goblin�w z okolicy. 
    AI_Output (other, self ,"DIA_Stanley_POLOWANIE_IMPORTANT_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_04"); //Zaprowadz� ci�. Powiedz, gdy b�dziesz gotowy.
    MIS_OnerousGobbos = LOG_RUNNING;

    Log_CreateTopic            (CH1_OnerousGobbos, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_RUNNING);
    B_LogEntry                     (CH1_OnerousGobbos,"Gobliny mieszkaj�ce w okolicy obozu my�liwych sta�y si� niewyobra�alnie uci��liwe. Razem ze Stanleyem mamy zredukowa� ich liczb�. ");
};

//========================================
//-----------------> LetsGo
//========================================

INSTANCE DIA_Stanley_LetsGo (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_LetsGo_Condition;
   information  = DIA_Stanley_LetsGo_Info;
   permanent	= FALSE;
   description	= "W drog�.";
};

FUNC INT DIA_Stanley_LetsGo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_POLOWANIE_IMPORTANT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_LetsGo_Info()
{
    AI_Output (other, self ,"DIA_Stanley_LetsGo_15_01"); //W drog�.
    AI_Output (self, other ,"DIA_Stanley_LetsGo_03_02"); //Zaprowadz� ci�.
	var C_NPC Stanley	; Stanley 	= Hlp_GetNpc (NON_5602_Stanley	);
    Npc_ExchangeRoutine (Stanley, "gobliny");
	Stanley.flags 	= 2;
	Stanley.aivar[AIV_PARTYMEMBER] = TRUE;
	Stanley.Npctype = NPCTYPE_FRIEND;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> UkonczoneGobliny
//========================================

INSTANCE DIA_Stanley_UkonczoneGobliny (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 3;
   condition    = DIA_Stanley_UkonczoneGobliny_Condition;
   information  = DIA_Stanley_UkonczoneGobliny_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stanley_UkonczoneGobliny_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_LetsGo))
    && (Npc_GetDistToWP (self, "SPAWN_OW_BLACKGOBBO_A1") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_UkonczoneGobliny_Info()
{
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_01"); //No i jeste�my. 
    AI_Output (other, self ,"DIA_Stanley_UkonczoneGobliny_15_02"); //Pozbyli�my si� troch� tego cholerstwa.
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_03"); //Dobra robota. Ja wracam do obozu. Jak chcesz, to mo�esz tu chwil� pow�szy�. 
    B_LogEntry                     (CH1_OnerousGobbos,"Dotarli�my do jaskini goblin�w zabijaj�c cz�� po drodze. Chyba warto przeszuka� jaskini�. ");
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_SUCCESS);
    MIS_OnerousGobbos = LOG_SUCCESS;
	var C_NPC Stanley	; Stanley 	= Hlp_GetNpc (NON_5602_Stanley	);
	Stanley.Npctype = NPCTYPE_MAIN;
	Stanley.flags 	= 0;
	Stanley.aivar[AIV_PARTYMEMBER] = false;
    B_GiveXP (250);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (Stanley, "START");
};

//========================================
//-----------------> Plaszcz
//========================================

INSTANCE DIA_Stanley_Plaszcz (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_Plaszcz_Condition;
   information  = DIA_Stanley_Plaszcz_Info;
   permanent	= FALSE;
   description	= "Masz przygotowa� p�aszcz z tej sk�ry.";
};

FUNC INT DIA_Stanley_Plaszcz_Condition()
{
    if (Npc_HasItems (other, ItAt_WolfWhite_01) >=1) && (Npc_KnowsInfo (hero, DIA_Mil_Skin))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Plaszcz_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_01"); //Masz przygotowa� p�aszcz z tej sk�ry.
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_02"); //Przysy�a ci� Mil?
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_04"); //No dobra, Przyjd� po niego jutro.
    B_LogEntry                     (CH1_FindWhiteSkin,"Mam si� zg�osi� po p�aszcz nast�pnego dnia. ");
	dzien_plaszcz =	wld_getday();
	B_giveinvitems (hero,self,ItAt_WolfWhite_01,1);
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Day_Plaszcz
//========================================

INSTANCE DIA_Stanley_Day_Plaszcz (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_Day_Plaszcz_Condition;
   information  = DIA_Stanley_Day_Plaszcz_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po p�aszcz.";
};

FUNC INT DIA_Stanley_Day_Plaszcz_Condition()
{
    if (dzien_plaszcz != wld_getday())
    && (Npc_KnowsInfo (hero, DIA_Stanley_Plaszcz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Day_Plaszcz_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Day_Plaszcz_15_01"); //Przyszed�em po p�aszcz.
    AI_Output (self, other ,"DIA_Stanley_Day_Plaszcz_03_02"); //Ju� jest sko�czony. Trzymaj.
    B_LogEntry                     (CH1_FindWhiteSkin,"Musz� wr�ci� z p�aszczem do Mila. ");

    B_GiveXP (100);
    CreateInvItems (self, ItMi_PancerzMil, 1);
    B_GiveInvItems (self, other, ItMi_PancerzMil, 1);
    AI_StopProcessInfos	(self);
};

