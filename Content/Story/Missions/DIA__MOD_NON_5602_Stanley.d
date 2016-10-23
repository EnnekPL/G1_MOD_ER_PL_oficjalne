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
   description	= "Czym siê tutaj zajmujesz?";
};

FUNC INT DIA_Stanley_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stanley_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_01"); //Czym siê tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_02"); //Dbam o inwentarz myœliwych.
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_03"); //Polujesz na coœ?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_04"); //Czasami. Raczej nie opuszczam obozu.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TraderOW,"Myœliwy Stanley to osoba z któr¹ mogê pohandlowaæ ró¿noœciami. Znajdê go w ma³ym obozie myœliwych przy rzece.");
};

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  NON_Stanley_TEACH_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= NON_Stanley_TEACH_2H_Condition;
	information		= NON_Stanley_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ?"; 
};
//
FUNC int  NON_Stanley_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  NON_Stanley_TEACH_2H_Info()
{
	AI_Output (other, self,"NON_Stanley_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"NON_Stanley_TEACH_2H_Info_09_02"); //Mogê przeprowadziæ z tob¹ podstawowe szkolenie bojowe w zakresie broni jednorêcznej i dwurêcznej. Nikt inny ciê wiêcej nie nauczy, dopóki nie do³¹czysz do któregoœ z obozów. 

		Log_CreateTopic   (GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Stanley przeszkoli mnie z podstaw broni jedno i dwurêcznej.");
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  DIA_Stanley_Teach_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= DIA_Stanley_Teach_2H_Condition;
	information		= DIA_Stanley_Teach_2H_Info;
	permanent		= 1;
	description		= "Zacznijmy trening broni dwurêcznej."; 
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
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

func void DIA_Stanley_Teach_2HBACK ()
{
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
};

FUNC VOID Stanley_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_00"); //Chcia³bym nauczyæ siê walki dwurêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_01"); //Bronie dwurêczne wymagaj¹ sporo si³y. S¹ ciê¿kie, a przez to tak¿e wolniejsze.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_02"); //Zmieni siê to jednak w trakcie czynienia przez ciebie postêpów w nauce.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_03"); //Za powolnoœæ bronie dwurêczne odwdziêcz¹ ci siê potê¿nymi obra¿eniami.
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_04"); //Ka¿d¹ broñ musisz odpowiednio wyczuæ. Topory s¹ inaczej zbalansowane ni¿ miecze. Pamiêtaj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

FUNC VOID Stanley_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_06"); //Musisz pracowaæ nad swoj¹ si³¹. Pozwoli ci ona wykonywaæ szybsze ruchy i podnosiæ coraz ciê¿sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_07"); //PóŸniej bêdziesz musia³ poznaæ odpowiedni¹ technikê walki i ³¹cznia ciosów. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_08"); //Na razie nie jesteœ wstanie zadaæ pe³nych obra¿eñ na jakie pozwala ci dana broñ. Spokojnie, zajmiemy siê tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_teach_2h4);
	};
};

FUNC VOID Stanley_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwurêcznych broni?
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_11"); //S¹ d³ugie... Im d³u¿sze tym dalej od siebie mo¿esz trzymaæ przeciwnika. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_12"); //Gdy kupujesz broñ, zwracaj uwagê na jej górn¹ czêœæ. Jeœli jest wystarczaj¹co ostra to nawet draœniêcie oponenta z daleka zada mu obra¿enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_npc_14"); //Nie, nie, nie. Omówimy to na nastêpnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_teach_2h4);
	};
};


FUNC VOID Stanley_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"NON_5602_Stanley_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Stanley_Teach_2H);
	Info_AddChoice		(DIA_Stanley_Teach_2H,DIALOG_BACK,DIA_Stanley_Teach_2HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_Teach_2H,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_teach_2h4);
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
	description = "Zacznijmy trening broni jednorêcznej.";
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
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

func void DIA_Stanley_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
};

FUNC VOID Stanley_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_nauka1h4);
	};
};

FUNC VOID Stanley_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Stanley_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Stanley_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Stanley_START_TRAIN);
	Info_AddChoice		(DIA_Stanley_START_TRAIN,DIALOG_BACK,DIA_Stanley_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Stanley_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Stanley_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Stanley_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Stanley_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Stanley_nauka1h4);
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
   description	= "Alex zosta³ porwany?";
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
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_01"); //Alex zosta³ porwany?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_02"); //Tak. Polowa³ w okolicach obozu i zosta³ schwytany przez Stra¿ników.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_03"); //To dziwne.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_04"); //W zachowaniu ludzi Gomeza ju¿ mnie chyba nic nie zdziwi.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_05"); //Ledwie czekaæ, a¿ zaatakuj¹ Nowy Obóz, albo Quentina.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_06"); //Proszê ciê, uwolnij Alexa.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_07"); //Mo¿esz mi powiedzieæ coœ wiêcej o samym napadzie?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_08"); //By³em w okolicy, jednak ba³em siê interwencji. Mieli znaczn¹ przewagê.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_09"); //Na swojego szefa wo³ali Siekacz.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_10"); //Mówi ci coœ to imiê?
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_11"); //Kojarzê goœcia. Zobaczê, co da siê zrobiæ.
    B_LogEntry                     (CH3_Kidnapping,"Alex zosta³ porwany przez oddzia³ Stra¿ników pod dowództwem Siekacza. ");
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
   description	= "Mam dla ciebie 50 strza³. ";
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
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_01"); //Mam dla ciebie 50 strza³. 
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_02"); //Sk¹d wiedzia³eœ, ¿e ich potrzebujê?
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_03"); //Otrzyma³em zadanie od Alexa.
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_04"); //Rozumiem. Dziêki za pomoc.
    B_GiveInvItems (other, self, ItAmArrow, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Stanley otrzyma³ swoje 50 strza³. ");

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
   description	= "Jak wygl¹da ¿ycie tutaj?";
};

FUNC INT DIA_Stanley_HELLO2_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_01"); //Jak wygl¹da ¿ycie tutaj?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_02"); //Nie jest a¿ tak Ÿle. Oczywiœcie, jeœli ktoœ potrafi o siebie zadbaæ. 
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_03"); //Masz dla mnie jakieœ porady?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_04"); //W Kolonii a¿ roi siê od zwierzyny. Niech ciê jednak to nie zwiedzie. Stada œcierwojadów i wilków nie s¹ tylko dla nas.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_05"); //Wielu myœliwych zapomina, ¿e orkowie te¿ musz¹ coœ jeœæ. Prawie po³owa doliny jest pod ich kontrol¹.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_06"); //Na orkowych ziemiach pe³no jest patroli i zwiadowców. Nie zapuszczaj siê tam bez dobrej kuszy i miecza.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_07"); //A je¿eli by³oby ci dane spotkaæ orkowego szamana, uciekaj czym prêdzej.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_09"); //Raz widzia³em takiego orka. Zielonoskórzy podobnie jak ludzie, potrafi¹ pos³ugiwaæ siê magi¹. Ich topory s¹ niebezpieczne, ale ich ogieñ jest wrêcz zabójczy.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_10"); //Bêdê mia³ siê na bacznoœci.
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
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_02"); //Có¿, nasz obóz znajduje siê pomiêdzy dwiema wa¿nymi œcie¿kami. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_03"); //Jedna prowadzi ze Starego Obozu do kopalni, a druga do Nowego Obozu. Czêsto mo¿na tam spotkaæ tragarzy przenosz¹cych ró¿ne towary.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_04"); //Raz by³em œwiadkiem napaœci Bandytów na taki konwój. Co to by³o za widowisko! PóŸnym wieczorem z lasu wy³oni³y siê pochodnie. Po chwili rozpocz¹³ siê szaleñczy taniec ostrzy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_05"); //Iskry, b³yski orê¿a, jêk rannych... Ca³oœæ trwa³a zaledwie chwilê. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_06"); //Bandyci uciekli, gdy tylko zdobyli ³upy. Nie wiem nawet, gdzie znajduje siê ich Obóz. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_07"); //Pamiêtam, jak nastêpnego dnia rano s³ysza³em g³oœne bluzgi Thorusa. NieŸle siê wtedy wkurzy³, skoro by³o go s³ychaæ a¿ tutaj.
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
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_02"); //Idziesz ze mn¹ na polowanie. Musimy siê pozbyæ goblinów z okolicy. 
    AI_Output (other, self ,"DIA_Stanley_POLOWANIE_IMPORTANT_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_04"); //Zaprowadzê ciê. Powiedz, gdy bêdziesz gotowy.
    MIS_OnerousGobbos = LOG_RUNNING;

    Log_CreateTopic            (CH1_OnerousGobbos, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_RUNNING);
    B_LogEntry                     (CH1_OnerousGobbos,"Gobliny mieszkaj¹ce w okolicy obozu myœliwych sta³y siê niewyobra¿alnie uci¹¿liwe. Razem ze Stanleyem mamy zredukowaæ ich liczbê. ");
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
   description	= "W drogê.";
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
    AI_Output (other, self ,"DIA_Stanley_LetsGo_15_01"); //W drogê.
    AI_Output (self, other ,"DIA_Stanley_LetsGo_03_02"); //Zaprowadzê ciê.
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
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_01"); //No i jesteœmy. 
    AI_Output (other, self ,"DIA_Stanley_UkonczoneGobliny_15_02"); //Pozbyliœmy siê trochê tego cholerstwa.
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_03"); //Dobra robota. Ja wracam do obozu. Jak chcesz, to mo¿esz tu chwilê powêszyæ. 
    B_LogEntry                     (CH1_OnerousGobbos,"Dotarliœmy do jaskini goblinów zabijaj¹c czêœæ po drodze. Chyba warto przeszukaæ jaskiniê. ");
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
   description	= "Masz przygotowaæ p³aszcz z tej skóry.";
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
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_01"); //Masz przygotowaæ p³aszcz z tej skóry.
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_02"); //Przysy³a ciê Mil?
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_04"); //No dobra, PrzyjdŸ po niego jutro.
    B_LogEntry                     (CH1_FindWhiteSkin,"Mam siê zg³osiæ po p³aszcz nastêpnego dnia. ");
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
   description	= "Przyszed³em po p³aszcz.";
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
    AI_Output (other, self ,"DIA_Stanley_Day_Plaszcz_15_01"); //Przyszed³em po p³aszcz.
    AI_Output (self, other ,"DIA_Stanley_Day_Plaszcz_03_02"); //Ju¿ jest skoñczony. Trzymaj.
    B_LogEntry                     (CH1_FindWhiteSkin,"Muszê wróciæ z p³aszczem do Mila. ");

    B_GiveXP (100);
    CreateInvItems (self, ItMi_PancerzMil, 1);
    B_GiveInvItems (self, other, ItMi_PancerzMil, 1);
    AI_StopProcessInfos	(self);
};

