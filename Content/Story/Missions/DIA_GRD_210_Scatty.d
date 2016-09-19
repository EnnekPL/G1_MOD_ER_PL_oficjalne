//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Organizujê walki na arenie. Przyjmujê zak³ady, pozyskujê nowych wojowników... No wiesz.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4) 
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chcê do³¹czyæ do waszego Obozu. Mo¿esz mi pomóc?
	/*if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Scatty_JoinOCRefuse_01_01"); //Podobno krêcisz coœ z Bandytami. Zje¿d¿aj!
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Scatty_JoinOCRefuse_01_02"); //Do kilofa, a nie za miecz! Precz st¹d!
	}
	else
	{*/
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Pomogê ci, jeœli zrobisz na mnie odpowiednio dobre wra¿enie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Najlepsi wojownicy z wszystkich obozów przybywaj¹ tutaj, by stan¹æ w szranki na mojej arenie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Wyzwij któregoœ z nich na pojedynek. Zobaczê, co potrafisz, i jeœli mi siê spodoba, mo¿e szepnê s³ówko w twoim imieniu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC, "Scatty, organizator walk na arenie, chcia³by zobaczyæ, jak sobie poradzê w starciu z którymœ z jego wojowników.");
	//};
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Walczy³em z Kirgo!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) ) && (Kapitel < 4) //&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Walczy³em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Tak, ale przegra³eœ!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Chyba nie myœlisz, ¿e bêdê pod wra¿eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC, "Pora¿ka w walce z Kirgo nie zjedna³a mi bynajmniej sympatii Scatty'ego.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //I pokona³eœ go! Ca³kiem nieŸle jak na takiego ¿ó³todzioba! Jestem pod wra¿eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Scatty by³ pod wra¿eniem mojej walki z Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Wyzwa³em Kharima na pojedynek!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) ) && (Kapitel < 4) //&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Wyzwa³em Kharima na pojedynek!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //I spuœci³ ci niez³e baty!
		PokonanyPrzezKharim = true;
		if (Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ale muszê przyznaæ, ¿e wybra³eœ sobie dobrego przeciwnika. Nie znoszê tych sukinsynów z Nowego Obozu.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Widzê, ¿e myœlimy podobnie. Przyda siê nam ktoœ taki jak ty!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC, "Zosta³em pokonany przez Kharima! Scatty podziwia moj¹ odwagê, ale uwa¿a, ¿e wojownik ze mnie ¿aden.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		PokonanyKharim = true; 
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //I pokona³eœ go! Muszê przyznaæ, ¿e œwietnie sobie poradzi³eœ. Kharim od dawna uchodzi³ za jednego z najlepszych wojowników w Kolonii.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Jestem pod wra¿eniem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		KHARIM.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Pokaza³em Kharimowi, gdzie raki zimuj¹. Scatty by³ pod wra¿eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Dlaczego pozwalacie obcym walczyæ na waszej arenie?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myœla³em, ¿e Stary i Nowy Obóz nie dogaduj¹ siê najlepiej. Dlaczego pozwalacie obcym walczyæ na waszej arenie?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi¹ patrzeæ, jak Szkodniki z Nowego Obozu dostaj¹ po g³owie.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Gdy walczy któryœ z nich przyjmujê wiêcej zak³adów, a to dobrze wp³ywa na interes!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Osobiœcie nienawidzê tych wieprzy z Nowego Obozu, ale w tych trudnych czasach ¿aden pieni¹dz nie œmierdzi...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Chcia³bym obstawiæ walkê.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chcia³bym obstawiæ walkê.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Przecie¿ teraz nikt nie walczy!
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Najbli¿sza walka odbêdzie siê dopiero za kilka dni. Bêdzie og³oszenie!
	
};
var int walczyl_Kirgo;
var int walczyl_Hanis;
var int walczyl_Kharim;
////********************************************************
//*
/*
DIALOGI NA ARENIE PRZENIESIONE Z POWODU TEGO ¯E PARSER ODRZUCA£ WCZESNIEJ
START
-----------------------------------------------------------------
---------------------------------------------------------------------
-----------------------------------------------------------------
-------------------------------------------------------------------------
-----------------------------------------------------------------
*/
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ((Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 3)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dobra, zaczynajmy! Niech wygra najlepszy!
		Info_Kirgo_InArena.permanent = 0;
		AI_StopProcessInfos	( self );
		self.npctype = npctype_FRIEND;
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		walczyl_Kirgo = true;
		
		//Kirgo_Charged = false;
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 3)// || (hero_moze_walczyc	== true)	// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Ból to tylko kwestia si³y woli!
		
		AI_StopProcessInfos	( self );
		walczyl_Kharim = true;
		Npc_ExchangeRoutine(self,"START");
		Info_Kharim_InArena.permanent = 0;
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		//Kharim_Charged = false;
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Mo¿e zapomnimy o naszej ma³ej sprzeczce...
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Hanis_InArena (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_Hanis_InArena_Condition;
	information		= Info_Hanis_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Hanis_InArena_Condition()
{
	if ( (CHARGE_Hanis == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Hanis_InArena_Info()
{
	if (Kapitel <= 3)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Hanis_InArena_05_00"); //Dobra, zaczynajmy! Za Œni¹cego!
		
		AI_StopProcessInfos	( self );
			walczyl_Hanis = true;
		Npc_ExchangeRoutine(self,"START");
		//CHARGE_Hanis = false;
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		Info_Hanis_InArena.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
};

////********************************************************
//*
/*
DIALOGI NA ARENIE PRZENIESIONE Z POWODU TEGO ¯E PARSER ODRZUCA£ WCZESNIEJ
END
-----------------------------------------------------------------
---------------------------------------------------------------------
-----------------------------------------------------------------
-------------------------------------------------------------------------
-----------------------------------------------------------------
*/
var int toczenie_walki_Kharim;
var int toczenie_walki_Kirgo;
// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chcia³bym stoczyæ walkê na arenie.";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
	if  (Wld_IsTime     (19,05,23,00)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chcia³bym stoczyæ walkê na arenie.
if (Npc_GetTrueGuild(other) == GIL_NONE)
{
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nie mogê ci pozwoliæ walczyæ, póki nie do³¹czysz do któregoœ z Obozów.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Ludzi nie interesuj¹ niezale¿ni wojownicy.
	} 
	else 
	{
	
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_03"); //No dobra. Z kim chcesz siê biæ?
	Info_ClearChoices	(DIA_Scatty_WannaFight );
	Info_AddChoice		(DIA_Scatty_WannaFight,DIALOG_BACK		,DIA_Scatty_WannaFight_BACK);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Kirgo (50 bry³ek rudy)",DIA_Scatty_WannaFight_Kirgo);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Kharim (100 bry³ek rudy)",DIA_Scatty_WannaFight_Kharim);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Gor Hanis (150 bry³ek rudy)",DIA_Scatty_WannaFight_Hanis);
};
};
func void DIA_Scatty_WannaFight_Kirgo ()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_Kirgo_15_00"); //Kirgo, chcê z nim walczyæ!
	AI_Output (self,other,"DIA_Scatty_WannaFight_Kirgo_01_01"); //Dobra. Wiêc idŸ. Za wygranie walki dostaniesz 50 bry³ek rudy.
	AI_StopProcessInfos	(self);
	toczenie_walki_Kirgo = true;
	Info_Kirgo_InArena.permanent = true;
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(Grd_251_Kirgo,"GUIDE");
};
func void DIA_Scatty_WannaFight_Kharim ()
{
AI_Output (other,self,"DIA_Scatty_WannaFight_Kharim_15_00"); //Chcê skopaæ ty³ek Kharima!
AI_Output (self,other,"DIA_Scatty_WannaFight_Kharim_01_01"); //Na to czeka³em. Nagroda to 100 bry³ek rudy.
	Kharim_Charged = TRUE;
	toczenie_walki_Kharim = true;
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	Info_Kharim_InArena.permanent = true;

	Npc_ExchangeRoutine(Sld_729_Kharim,"GUIDE");
};
func void DIA_Scatty_WannaFight_Hanis ()
{
AI_Output (other,self,"DIA_Scatty_WannaFight_Hanis_15_00"); //Poka¿ê Gor Hanisowi, gdzie jego miejsce.
AI_Output (self,other,"DIA_Scatty_WannaFight_Hanis_01_01"); //Uwa¿aj. To dobry wojownik. Za niego bêdzie 150 bry³ek rudy.
	CHARGE_Hanis = true;
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	Info_Hanis_InArena.permanent = true;
	Npc_ExchangeRoutine(TPL_1422_GorHanis,"GUIDE");
};
func void DIA_Scatty_WannaFight_BACK ()
{
Info_ClearChoices	(DIA_Scatty_WannaFight );
};
//========================================
//-----------------> FightWithKirgo
//========================================

INSTANCE DIA_Scatty_FightWithKirgo (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_FightWithKirgo_Condition;
   information  = DIA_Scatty_FightWithKirgo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scatty_FightWithKirgo_Condition()
{
    if (walczyl_Kirgo == true) && (toczenie_walki_Kirgo == true) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_FightWithKirgo_Info()
{
    AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_01"); //Walczy³eœ z Kirgo!
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_02"); //I pokona³eœ go! Œwietnie.
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_03"); //Oto 100 bry³ek rudy!
        CreateInvItems (self, ItMiNugget, 100);
        B_GiveInvItems (self, other, ItMiNugget, 100);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_04"); //Przegra³eœ walkê. Nie odzyskasz rudy!
    };
	toczenie_walki_Kirgo = false;
	walczyl_Kirgo = false; // ¿eby nie dawa³ nagrody w nieskoñczonoœæ
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FightWithKharim
//========================================

INSTANCE DIA_Scatty_FightWithKharim (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 2;
   condition    = DIA_Scatty_FightWithKharim_Condition;
   information  = DIA_Scatty_FightWithKharim_Info;
   permanent	= TRUE;
   important = true;
};

FUNC INT DIA_Scatty_FightWithKharim_Condition()
{
    if (walczyl_Kharim == true) && (toczenie_walki_Kharim == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_FightWithKharim_Info()
{
    AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_01"); //Walczy³eœ z Kharimem.
    if (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_02"); //I spuœci³eœ mu niez³e baty.
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_03"); //Obiecane 200 bry³ek rudy!
        CreateInvItems (self, ItMiNugget, 200);
        B_GiveInvItems (self, other, ItMiNugget, 200);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_04"); //I przegra³eœ. No có¿.
    };
	toczenie_walki_Kharim = false;
	walczyl_Kharim = false;
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> FightWithHanis
//========================================

INSTANCE DIA_Scatty_FightWithHanis (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 2;
   condition    = DIA_Scatty_FightWithHanis_Condition;
   information  = DIA_Scatty_FightWithHanis_Info;
   permanent	= TRUE;
   important = true;
};

FUNC INT DIA_Scatty_FightWithHanis_Condition()
{
    if (walczyl_Hanis == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_FightWithHanis_Info()
{
    AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_01"); //Walczy³eœ z Gor Hanisem.
    if (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_02"); //I spuœci³eœ mu niez³e baty.
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_03"); //Obiecane 300 bry³ek rudy!
        CreateInvItems (self, ItMiNugget, 300);
        B_GiveInvItems (self, other, ItMiNugget, 300);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_04"); //I przegra³eœ. No có¿.
    };
	walczyl_Hanis = false;
    AI_StopProcessInfos	(self);
	
	
};
// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 0;
	description = "Zajmujesz siê równie¿ szkoleniem wojowników?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC, "Scatty mo¿e mnie nauczyæ walki jednorêcznym orê¿em, o ile zostanê cz³onkiem Starego Obozu.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Zajmujesz siê równie¿ szkoleniem wojowników?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Tak, ale nie za darmo. Jak chcesz, ¿ebym ciê czegoœ nauczy³, musisz zap³aciæ.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_02"); //Aha, szkolê tylko CZ£ONKÓW STAREGO OBOZU.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_03"); //Dlaczego tylko ich? Mogê ci zap³aciæ.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_04"); //Wielu ludzi siê u mnie szkoli³o. Pokrêcili siê tu trochê po czym zwiewali do Nowego Obozu i napadali na nasze konwoje.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_05"); //Wykorzystali wiedze, któr¹ ode mnie otrzymali przeciwko naszym ludziom. Dlatego te¿ Thorus na³o¿y³ ograniczenia wobec osób dorabiaj¹cych sobie nauczaniem.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_06"); //Mo¿e w innym obozie znajdê nauczyciela.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_07"); //Oj, nie znajdziesz. Nauka walki broni¹ jest kluczowa, a wyszkoleni i lojalni ludzie s¹ cenni. Nauczyciele z innych obozów wiedz¹ o tym tak samo dobrze jak ja czy Thorus.
	/*
	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};*/
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (hero.attribute[ATR_STRENGTH] >= 30)
	{
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
	}else{
	AI_Output			(self,other,"DIA_Scatty_NO_ENOUGHT_STR_1"); //Musisz byæ o wiele silniejszy, aby posi¹œæ t¹ umiejêtnoœæ!
	PrintScreen	("Warunek: Si³a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	};	
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
			if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	};
		}else{
	AI_Output			(self,other,"DIA_Scatty_NO_ENOUGHT_STR_1"); //Musisz byæ o wiele silniejszy, aby posi¹œæ t¹ umiejêtnoœæ!
	PrintScreen	("Warunek: Si³a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	};	
};

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Scatty_START_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_START_TRAIN_Condition;
	information	= DIA_Scatty_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Scatty_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_TRAIN)) && ((Npc_GetTrueGuild(hero) == GIL_VLK) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Scatty_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Scatty_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};

};

func void DIA_Scatty_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
};

FUNC VOID Scatty_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h5 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_15"); //¯eby zadaæ wiêksze obra¿enia musisz trafiaæ w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_16"); //Ciê¿ko siê tego nauczyæ. Wszystko zale¿y od postury i pancerza. Najlepiej atakowaæ koñczyny i g³owê.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_17"); //Naturalnie walka z cz³owiekiem ró¿ni siê od walki ze zwierzêciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h6 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_18"); //Pamiêtasz jak na pierwszej lekcji omawialiœmy podzia³ na bronie ciê¿kie i te l¿ejsze?
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_19"); //Myœlê, ¿e jesteœ ju¿ wystarczaj¹co silny, aby walczyæ ciê¿kimi jednorêczniakami. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_20"); //O czym musisz pamiêtaæ? O odpowiednim wyczuciu równowagi ostrza, a tak¿e o treningu si³owym, który jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h7 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h8 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h9 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h10 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_26"); //To ju¿ koniec naszego szkolenia. Szacunek dla ciebie, ¿e dobrn¹³eœ do koñca.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_27"); //Poka¿ê ci kilka ruchów, którymi trafisz we wra¿liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_28"); //Musisz potrafiæ je dostrzec zanim siê do niego zbli¿ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

//========================================
//-----------------> DowodyNaOszustwa
//========================================

INSTANCE DIA_Scatty_DowodyNaOszustwa (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_DowodyNaOszustwa_Condition;
   information  = DIA_Scatty_DowodyNaOszustwa_Info;
   permanent	= FALSE;
   description	= "Oszukujesz Gomeza! Mam na to dowody,";
};

FUNC INT DIA_Scatty_DowodyNaOszustwa_Condition()
{
    if (HeroKnowsScattyThief == true)
    && (Npc_HasItems (other, ZapiskiScattego) >=1) && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_DowodyNaOszustwa_Info()
{
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_01"); //Oszukujesz Gomeza! Mam na to dowody,
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_02"); //Co? Jak œmiesz mnie oskar¿aæ?!
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_03"); //Mam tutaj twoje fa³szywe raporty. O twoich oszustwach Kopacze wiedz¹ ju¿ od dawna.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_04"); //I co teraz zrobisz? Doniesiesz na mnie Thorusowi?
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_05"); //Byæ mo¿e... Czekam na twoje propozycje. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_06"); //Có¿... Jedyne, co mogê ci za³atwiæ, to wstêp do siedziby Gomeza. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_07"); //Jeœli nie doniesiesz na mnie Gomezowi, zostaniesz wpuszczony do siedziby Magnatów.
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_08"); //A co ze stra¿nikami bramy i Thorusem?
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_09"); //Tego nie mogê ci za³atwiæ. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_10"); //Stra¿nik przy wejœciu to mój bliski przyjaciel. To jak bêdzie? 
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_11"); //No dobra. Za³atw mi wejœcie do siedziby Magnatów, a nie powiem nic Thorusowi.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_12"); //Umowa stoi. 
	B_GiveInvItems (hero,self, ZapiskiScattego,1);
	AI_StopProcessInfos	(self);
	GRD_245_Gardist.aivar[AIV_PASSGATE]=TRUE;
	Grd_218_GArdist.aivar[AIV_PASSGATE]=TRUE;
};

instance TRIA_ZakladyErensa (C_INFO)
{
    npc         = Grd_210_Scatty;
    nr          = 10;
    condition   = TRIA_ZakladyErensa_condition;
    information = TRIA_ZakladyErensa_info;
    important   = true;
    permanent   = false;
};

func int TRIA_ZakladyErensa_condition()
{
	if (Npc_GetDistToWP(hero,"OCR_STAND_WETT")<500) && (Npc_GetDistToWP(VLK_517_Buddler,"OCR_STAND_WETT")<500) && Npc_KnowsInfo (hero,DIA_Erens_ORE)
	{
    return TRUE;
	};
};

func void TRIA_ZakladyErensa_info()
{
    var c_npc Scatty;    	Scatty = Hlp_GetNpc(Grd_210_Scatty); // Ihm gehört der Dialog
    //var c_npc Robotnik;   	Robotnik = Hlp_GetNpc(VLK_2004_Robotnik);
    var c_npc Erens; 		Erens = Hlp_GetNpc(VLK_517_Buddler);
	
    //TRIA_Invite(Robotnik);   // Lade Robotnik in diesen Dialog ein
    TRIA_Invite(Erens); // Lade Erens in diesen Dialog ein
	TRIA_Invite(Scatty);
    TRIA_Start();         // Starte das Gespräch
    // Der Held und Diego müssen/dürfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Diego (self = Diego, other = Hero)
    TRIA_Next(Scatty);
	AI_GotoNpc(hero, Erens);
    DIAG_Reset();
	AI_Output (self, other, "TRIA_ZakladyErensa_0F"); //Czego sobie ¿yczycie?
	//AI_TurnToNpc(self, GRD_254_Orry);
   // AI_Output (self, other, "TRIA_ZakladyErensa_00"); //Cholera, ruszaæ siê ch³opaki!

    // Held redet nun mit Robotnik (self = Robotnik, other = Hero)
    //TRIA_Next(Robotnik);
	//DIAG_Reset();

	//AI_GotoNpc(self, other);
    //AI_TurnToNpc(self, Scatty);
	
    //AI_Output (self, other, "TRIA_ZakladyErensa_01"); //Ju¿ siê robi!
	//AI_TurnAway (self,other);
	
    //AI_Output (self, other, "TRIA_ZakladyErensa_02"); //Ej, tam na górze. Otwieraæ!
	//AI_TurnToNpc (self,other);
    // Held soll sich während des nächsten Satzes verschwörerisch umsehen
   // DIAG("Nervous", 1, 2);

   // AI_Output (other, self, "TRIA_ZakladyErensa_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Geschäft?

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Erens (self = Erens, other = Hero)
    TRIA_Next(Erens);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (Erens,Scatty);
    AI_Output (self, other, "TRIA_ZakladyErensa_04"); //Chcia³bym obstawiæ walkê. Ten brudas przeciwko Naldurowi. Stawiam sto bry³ek na Naldura.
	AI_TurnToNpc (hero,Scatty);
	AI_Output (other, self, "TRIA_ZakladyErensa_05"); //Ja stawiam sto bry³ek na siebie.

    // Held redet nun wieder mit Scatty (self = Scatty, other = Hero)
    TRIA_Next(Scatty);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, Erens);
    AI_Output (self, other, "TRIA_ZakladyErensa_06"); //A to ci dopiero niespodzianka. Panowie popadli w konflikt? 
	AI_Output (other, self, "TRIA_ZakladyErensa_07"); //Nie z mojej winy. Ten goœæ po prostu bardzo prêdko chce siê pozbyæ swojej rudy i wróciæ do Kopalni.

    //AI_TurnToNpc(other, self);

    // Kamerafahrt Ende
    TRIA_Cam("");

    // Scatty soll zornig reagieren
	TRIA_Next(Erens);
	DIAG_Reset();
    DIAG("Angry", 0, 4);
	//AI_TurnToNpc (self,Grd_210_Scatty);
    AI_Output (self, other, "TRIA_ZakladyErensa_08"); //Jeszcze zobaczymy!

    // Held soll sich jetzt wieder normal bewegen
	TRIA_Next(Scatty);
    DIAG_Reset();
	AI_TurnToNpc(self, hero);
    AI_Output (self, other, "TRIA_ZakladyErensa_09"); //No dobra! Zak³ady przyjête. Walki odbywaj¹ siê wieczorem od godziny 19. W tym czasie staw siê na arenie. Naldur bêdzie tam ju¿ czeka³.
	//TRIA_Next(Erens);
   // DIAG_Reset();
	//AI_TurnToNpc (self,PC_THIEF);

    TRIA_Finish(); // und Ende
	
	Npc_ExchangeRoutine	(Scatty, "start");
	Npc_ExchangeRoutine	(Erens, "start");
	AI_StopProcessInfos (Grd_210_Scatty);
	
	Npc_ExchangeRoutine	(VLK_577_Buddler, "arena");
	Npc_ExchangeRoutine	(STT_3919_Polykacz, "urlop");
	Npc_ExchangeRoutine	(STT_3918_Polykacz, "urlop");
};

//========================================
//-----------------> WinWithNaldur
//========================================

INSTANCE DIA_Scatty_WinWithNaldur (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_WinWithNaldur_Condition;
   information  = DIA_Scatty_WinWithNaldur_Info;
   permanent	= FALSE;
   important	= 1;
};

FUNC INT DIA_Scatty_WinWithNaldur_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Naldur_WIN)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_WinWithNaldur_Info()
{
    AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_01"); //Wygra³eœ walkê z Naldurem. Zgodnie z umow¹ otrzymujesz swój wk³ad i sto bry³ek Erensa. 
	AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_02"); //Zrobi³eœ dobre wra¿enie. Osobiœcie siê cieszê, ¿e wreszcie ktoœ utar³ Erensowi nosa. Ten dziadek chyba ma tu za dobrze.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia³em ze Scattym, który wrêczy³ mi nagrodê za walkê. Teraz pora wróciæ i zobaczyæ reakcjê Erensa.");
	CreateInvItems (self,itminugget,200);
	B_GiveInvItems (self,other,itminugget,200);
};

//========================================
//-----------------> LoseWithNaldur
//========================================

INSTANCE DIA_Scatty_LoseWithNaldur (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_LoseWithNaldur_Condition;
   information  = DIA_Scatty_LoseWithNaldur_Info;
   permanent	= FALSE;
   important	= 1;
};

FUNC INT DIA_Scatty_LoseWithNaldur_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Naldur_LOSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_LoseWithNaldur_Info()
{
    AI_Output (self, other ,"DIA_Scatty_LoseWithNaldur_03_01"); //Przegra³eœ z Naldurem. A szkoda, bo liczy³em, ¿e utrzesz nosa Erensowi.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia³em ze Scattym, który szczerze ¿a³owa³, ¿e przegra³em. Nie mam odwagi spojrzeæ Erensowi w oczy, ale chyba bêdê musia³ to zrobiæ.");
};

//========================================
//-----------------> ArenaEnd
//========================================

INSTANCE DIA_Scatty_ArenaEnd (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_ArenaEnd_Condition;
   information  = DIA_Scatty_ArenaEnd_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e ju¿ po twoim interesie z aren¹.";
};

FUNC INT DIA_Scatty_ArenaEnd_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_ArenaEnd_Info()
{
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_01"); //Widzê, ¿e ju¿ po twoim interesie z aren¹.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_02"); //Jest wiele innych sposobów ¿eby zarobiæ.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_03"); //Cz³owiek musi potrafiæ dostosowaæ siê do zmieniaj¹cego siê otoczenia. Wiesz o czym mówiê?
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_04"); //Zamierzam na powa¿nie zaj¹æ siê handlem. Zabra³em ze Starego Obozu kilka fajnych rzeczy.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_05"); //Myœlê, ¿e wkrótce mi siê przydadz¹. A ty jak sobie radzisz?
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_06"); //Nie najgorzej. Orkowie, szamani, harpie... To co zwykle.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_07"); //Ha! Chyba tylko smok móg³by stawiæ ci opór. Ha ha ha!
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_08"); //(uœmiecha siê) Wola³bym go nie spotkaæ. 
};