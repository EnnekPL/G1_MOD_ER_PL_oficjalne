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
	description = "Czym si� tutaj zajmujesz?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Organizuj� walki na arenie. Przyjmuj� zak�ady, pozyskuj� nowych wojownik�w... No wiesz.
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
	description = "Chc� do��czy� do waszego obozu. Mo�esz mi pom�c?";
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
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chc� do��czy� do waszego Obozu. Mo�esz mi pom�c?
	/*if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Scatty_JoinOCRefuse_01_01"); //Podobno kr�cisz co� z Bandytami. Zje�d�aj!
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Scatty_JoinOCRefuse_01_02"); //Do kilofa, a nie za miecz! Precz st�d!
	}
	else
	{*/
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Pomog� ci, je�li zrobisz na mnie odpowiednio dobre wra�enie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Najlepsi wojownicy z wszystkich oboz�w przybywaj� tutaj, by stan�� w szranki na mojej arenie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Wyzwij kt�rego� z nich na pojedynek. Zobacz�, co potrafisz, i je�li mi si� spodoba, mo�e szepn� s��wko w twoim imieniu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC, "Scatty, organizator walk na arenie, chcia�by zobaczy�, jak sobie poradz� w starciu z kt�rym� z jego wojownik�w.");
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
	description = "Walczy�em z Kirgo!";
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
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Walczy�em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Tak, ale przegra�e�!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Chyba nie my�lisz, �e b�d� pod wra�eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC, "Pora�ka w walce z Kirgo nie zjedna�a mi bynajmniej sympatii Scatty'ego.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //I pokona�e� go! Ca�kiem nie�le jak na takiego ��todzioba! Jestem pod wra�eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Scatty by� pod wra�eniem mojej walki z Kirgo.");
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
	description = "Wyzwa�em Kharima na pojedynek!";
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
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Wyzwa�em Kharima na pojedynek!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //I spu�ci� ci niez�e baty!
		PokonanyPrzezKharim = true;
		if (Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ale musz� przyzna�, �e wybra�e� sobie dobrego przeciwnika. Nie znosz� tych sukinsyn�w z Nowego Obozu.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Widz�, �e my�limy podobnie. Przyda si� nam kto� taki jak ty!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC, "Zosta�em pokonany przez Kharima! Scatty podziwia moj� odwag�, ale uwa�a, �e wojownik ze mnie �aden.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		PokonanyKharim = true; 
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //I pokona�e� go! Musz� przyzna�, �e �wietnie sobie poradzi�e�. Kharim od dawna uchodzi� za jednego z najlepszych wojownik�w w Kolonii.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Jestem pod wra�eniem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		KHARIM.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Pokaza�em Kharimowi, gdzie raki zimuj�. Scatty by� pod wra�eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager K�mpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Dlaczego pozwalacie obcym walczy� na waszej arenie?";
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
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //My�la�em, �e Stary i Nowy Ob�z nie dogaduj� si� najlepiej. Dlaczego pozwalacie obcym walczy� na waszej arenie?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi� patrze�, jak Szkodniki z Nowego Obozu dostaj� po g�owie.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Gdy walczy kt�ry� z nich przyjmuj� wi�cej zak�ad�w, a to dobrze wp�ywa na interes!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Osobi�cie nienawidz� tych wieprzy z Nowego Obozu, ale w tych trudnych czasach �aden pieni�dz nie �mierdzi...
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
	description = "Chcia�bym obstawi� walk�.";
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
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chcia�bym obstawi� walk�.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Przecie� teraz nikt nie walczy!
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Najbli�sza walka odb�dzie si� dopiero za kilka dni. B�dzie og�oszenie!
	
};
var int walczyl_Kirgo;
var int walczyl_Hanis;
var int walczyl_Kharim;
////********************************************************
//*
/*
DIALOGI NA ARENIE PRZENIESIONE Z POWODU TEGO �E PARSER ODRZUCA� WCZESNIEJ
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
	if (Kapitel <= 3)			//Fix f�r sp�tere Kapitel ****Bj�rn****
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
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo�e zapomnijmy o naszej ma�ej sprzeczce, dobra?		
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
	if (Kapitel <= 3)// || (hero_moze_walczyc	== true)	// Kapitelfix ***Bj�rn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //B�l to tylko kwestia si�y woli!
		
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
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Mo�e zapomnimy o naszej ma�ej sprzeczce...
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
	if (Kapitel <= 3)			//Fix f�r sp�tere Kapitel ****Bj�rn****
	{
		AI_Output (self, other,"Info_Hanis_InArena_05_00"); //Dobra, zaczynajmy! Za �ni�cego!
		
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
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo�e zapomnijmy o naszej ma�ej sprzeczce, dobra?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
};

////********************************************************
//*
/*
DIALOGI NA ARENIE PRZENIESIONE Z POWODU TEGO �E PARSER ODRZUCA� WCZESNIEJ
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
// 					Will K�mpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chcia�bym stoczy� walk� na arenie.";
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
AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chcia�bym stoczy� walk� na arenie.
if (Npc_GetTrueGuild(other) == GIL_NONE)
{
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nie mog� ci pozwoli� walczy�, p�ki nie do��czysz do kt�rego� z Oboz�w.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Ludzi nie interesuj� niezale�ni wojownicy.
	} 
	else 
	{
	
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_03"); //No dobra. Z kim chcesz si� bi�?
	Info_ClearChoices	(DIA_Scatty_WannaFight );
	Info_AddChoice		(DIA_Scatty_WannaFight,DIALOG_BACK		,DIA_Scatty_WannaFight_BACK);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Kirgo (50 bry�ek rudy)",DIA_Scatty_WannaFight_Kirgo);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Kharim (100 bry�ek rudy)",DIA_Scatty_WannaFight_Kharim);
	Info_AddChoice		(DIA_Scatty_WannaFight,"Gor Hanis (150 bry�ek rudy)",DIA_Scatty_WannaFight_Hanis);
};
};
func void DIA_Scatty_WannaFight_Kirgo ()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_Kirgo_15_00"); //Kirgo, chc� z nim walczy�!
	AI_Output (self,other,"DIA_Scatty_WannaFight_Kirgo_01_01"); //Dobra. Wi�c id�. Za wygranie walki dostaniesz 50 bry�ek rudy.
	AI_StopProcessInfos	(self);
	toczenie_walki_Kirgo = true;
	Info_Kirgo_InArena.permanent = true;
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(Grd_251_Kirgo,"GUIDE");
};
func void DIA_Scatty_WannaFight_Kharim ()
{
AI_Output (other,self,"DIA_Scatty_WannaFight_Kharim_15_00"); //Chc� skopa� ty�ek Kharima!
AI_Output (self,other,"DIA_Scatty_WannaFight_Kharim_01_01"); //Na to czeka�em. Nagroda to 100 bry�ek rudy.
	Kharim_Charged = TRUE;
	toczenie_walki_Kharim = true;
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	Info_Kharim_InArena.permanent = true;

	Npc_ExchangeRoutine(Sld_729_Kharim,"GUIDE");
};
func void DIA_Scatty_WannaFight_Hanis ()
{
AI_Output (other,self,"DIA_Scatty_WannaFight_Hanis_15_00"); //Poka�� Gor Hanisowi, gdzie jego miejsce.
AI_Output (self,other,"DIA_Scatty_WannaFight_Hanis_01_01"); //Uwa�aj. To dobry wojownik. Za niego b�dzie 150 bry�ek rudy.
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
    AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_01"); //Walczy�e� z Kirgo!
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_02"); //I pokona�e� go! �wietnie.
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_03"); //Oto 100 bry�ek rudy!
        CreateInvItems (self, ItMiNugget, 100);
        B_GiveInvItems (self, other, ItMiNugget, 100);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKirgo_03_04"); //Przegra�e� walk�. Nie odzyskasz rudy!
    };
	toczenie_walki_Kirgo = false;
	walczyl_Kirgo = false; // �eby nie dawa� nagrody w niesko�czono��
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
    AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_01"); //Walczy�e� z Kharimem.
    if (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_02"); //I spu�ci�e� mu niez�e baty.
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_03"); //Obiecane 200 bry�ek rudy!
        CreateInvItems (self, ItMiNugget, 200);
        B_GiveInvItems (self, other, ItMiNugget, 200);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithKharim_03_04"); //I przegra�e�. No c�.
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
    AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_01"); //Walczy�e� z Gor Hanisem.
    if (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_02"); //I spu�ci�e� mu niez�e baty.
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_03"); //Obiecane 300 bry�ek rudy!
        CreateInvItems (self, ItMiNugget, 300);
        B_GiveInvItems (self, other, ItMiNugget, 300);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightWithHanis_03_04"); //I przegra�e�. No c�.
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
	description = "Zajmujesz si� r�wnie� szkoleniem wojownik�w?";
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
    B_LogEntry(GE_TeacherOC, "Scatty mo�e mnie nauczy� walki jednor�cznym or�em, o ile zostan� cz�onkiem Starego Obozu.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Zajmujesz si� r�wnie� szkoleniem wojownik�w?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Tak, ale nie za darmo. Jak chcesz, �ebym ci� czego� nauczy�, musisz zap�aci�.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_02"); //Aha, szkol� tylko CZ�ONK�W STAREGO OBOZU.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_03"); //Dlaczego tylko ich? Mog� ci zap�aci�.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_04"); //Wielu ludzi si� u mnie szkoli�o. Pokr�cili si� tu troch� po czym zwiewali do Nowego Obozu i napadali na nasze konwoje.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_05"); //Wykorzystali wiedze, kt�r� ode mnie otrzymali przeciwko naszym ludziom. Dlatego te� Thorus na�o�y� ograniczenia wobec os�b dorabiaj�cych sobie nauczaniem.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_06"); //Mo�e w innym obozie znajd� nauczyciela.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_07"); //Oj, nie znajdziesz. Nauka walki broni� jest kluczowa, a wyszkoleni i lojalni ludzie s� cenni. Nauczyciele z innych oboz�w wiedz� o tym tak samo dobrze jak ja czy Thorus.
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
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (hero.attribute[ATR_STRENGTH] >= 30)
	{
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
	}else{
	AI_Output			(self,other,"DIA_Scatty_NO_ENOUGHT_STR_1"); //Musisz by� o wiele silniejszy, aby posi��� t� umiej�tno��!
	PrintScreen	("Warunek: Si�a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	};	
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
			if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	};
		}else{
	AI_Output			(self,other,"DIA_Scatty_NO_ENOUGHT_STR_1"); //Musisz by� o wiele silniejszy, aby posi��� t� umiej�tno��!
	PrintScreen	("Warunek: Si�a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);	
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
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};

};

func void DIA_Scatty_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
};

FUNC VOID Scatty_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_01"); //M�dra decyzja. Najbli�sze trzy lekcje obejm� podstawy z kt�rymi powiniene� si� zapozna�.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_02"); //Bronie jednor�czne s� znacznie l�ejsze ni� dwur�czne, a przez to r�wnie� znacznie szybsze. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_03"); //Istnieje podzia� na lekkie bronie jednor�czne i te ci�sze. Ci�sze wymagaj� pewniejszego chwytu, ale te� wi�cej si�y.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_04"); //Je�li chcesz p�ynnie walczy� ci�k� jednor�czn�, poza technik� b�dziesz te� musia� pozna� tajniki balansowania cia�em.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_05"); //O du�ej sile w �apie ju� nawet nie m�wi�. To oczywiste, �e �eby szybko wymachiwa� takim ci�arem b�dziesz musia� posiada� wi�cej si�y ni� potrzeba do podniesienia dobrego dwur�cznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_06"); //Poka� mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_07"); //Tak jak my�la�em. Zadajesz mniejsze obra�enia ni� faktycznie m�g�by� zada� przy obecnej sile i za�o�onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_08"); //Nie atakuj, gdy jeste� zbyt daleko. Je�li za bardzo si� wychylisz do oddalonego przeciwnika, mo�esz straci� r�wnowag� i si� przewr�ci�.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_09"); //Staraj si� atakowa� z r�nych stron, aby zmyli� przeciwnika. Pami�taj, aby blokowa� uderzenia, je�li nie b�dziesz w stanie zrobi� uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_10"); //Pami�tasz o balansowaniu cia�em? A o odpowiedniej odleg�o�ci od przeciwnika? 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_11"); //Spr�buj wyczu� ile si�y musisz u�y�, aby bro� uderza�a mocno, a przy tym nie polecia�a bez�adnie przed siebie. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_12"); //Gdy to opanujesz, b�dziemy mogli pomy�le� nad ��czeniem po sobie uderze�. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_14"); //R�ce opadaj�... Nie dwiema, tylko jedn�! Om�wimy to na nast�pnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h5 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_15"); //�eby zada� wi�ksze obra�enia musisz trafia� w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_16"); //Ci�ko si� tego nauczy�. Wszystko zale�y od postury i pancerza. Najlepiej atakowa� ko�czyny i g�ow�.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_17"); //Naturalnie walka z cz�owiekiem r�ni si� od walki ze zwierz�ciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h6 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_18"); //Pami�tasz jak na pierwszej lekcji omawiali�my podzia� na bronie ci�kie i te l�ejsze?
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_19"); //My�l�, �e jeste� ju� wystarczaj�co silny, aby walczy� ci�kimi jednor�czniakami. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_20"); //O czym musisz pami�ta�? O odpowiednim wyczuciu r�wnowagi ostrza, a tak�e o treningu si�owym, kt�ry jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h7 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h8 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h9 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
	};
};

FUNC VOID Scatty_nauka1h10 ()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_26"); //To ju� koniec naszego szkolenia. Szacunek dla ciebie, �e dobrn��e� do ko�ca.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_27"); //Poka�� ci kilka ruch�w, kt�rymi trafisz we wra�liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_npc_28"); //Musisz potrafi� je dostrzec zanim si� do niego zbli�ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Scatty_START_TRAIN);
	Info_AddChoice		(DIA_Scatty_START_TRAIN,DIALOG_BACK,DIA_Scatty_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Scatty_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Scatty_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Scatty_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Scatty_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Scatty_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Scatty_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Scatty_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Scatty_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Scatty_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Scatty_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Scatty_nauka1h10);
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
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_02"); //Co? Jak �miesz mnie oskar�a�?!
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_03"); //Mam tutaj twoje fa�szywe raporty. O twoich oszustwach Kopacze wiedz� ju� od dawna.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_04"); //I co teraz zrobisz? Doniesiesz na mnie Thorusowi?
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_05"); //By� mo�e... Czekam na twoje propozycje. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_06"); //C�... Jedyne, co mog� ci za�atwi�, to wst�p do siedziby Gomeza. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_07"); //Je�li nie doniesiesz na mnie Gomezowi, zostaniesz wpuszczony do siedziby Magnat�w.
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_08"); //A co ze stra�nikami bramy i Thorusem?
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_09"); //Tego nie mog� ci za�atwi�. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_10"); //Stra�nik przy wej�ciu to m�j bliski przyjaciel. To jak b�dzie? 
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_11"); //No dobra. Za�atw mi wej�cie do siedziby Magnat�w, a nie powiem nic Thorusowi.
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
    var c_npc Scatty;    	Scatty = Hlp_GetNpc(Grd_210_Scatty); // Ihm geh�rt der Dialog
    //var c_npc Robotnik;   	Robotnik = Hlp_GetNpc(VLK_2004_Robotnik);
    var c_npc Erens; 		Erens = Hlp_GetNpc(VLK_517_Buddler);
	
    //TRIA_Invite(Robotnik);   // Lade Robotnik in diesen Dialog ein
    TRIA_Invite(Erens); // Lade Erens in diesen Dialog ein
	TRIA_Invite(Scatty);
    TRIA_Start();         // Starte das Gespr�ch
    // Der Held und Diego m�ssen/d�rfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Diego (self = Diego, other = Hero)
    TRIA_Next(Scatty);
	AI_GotoNpc(hero, Erens);
    DIAG_Reset();
	AI_Output (self, other, "TRIA_ZakladyErensa_0F"); //Czego sobie �yczycie?
	//AI_TurnToNpc(self, GRD_254_Orry);
   // AI_Output (self, other, "TRIA_ZakladyErensa_00"); //Cholera, rusza� si� ch�opaki!

    // Held redet nun mit Robotnik (self = Robotnik, other = Hero)
    //TRIA_Next(Robotnik);
	//DIAG_Reset();

	//AI_GotoNpc(self, other);
    //AI_TurnToNpc(self, Scatty);
	
    //AI_Output (self, other, "TRIA_ZakladyErensa_01"); //Ju� si� robi!
	//AI_TurnAway (self,other);
	
    //AI_Output (self, other, "TRIA_ZakladyErensa_02"); //Ej, tam na g�rze. Otwiera�!
	//AI_TurnToNpc (self,other);
    // Held soll sich w�hrend des n�chsten Satzes verschw�rerisch umsehen
   // DIAG("Nervous", 1, 2);

   // AI_Output (other, self, "TRIA_ZakladyErensa_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Gesch�ft?

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Erens (self = Erens, other = Hero)
    TRIA_Next(Erens);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (Erens,Scatty);
    AI_Output (self, other, "TRIA_ZakladyErensa_04"); //Chcia�bym obstawi� walk�. Ten brudas przeciwko Naldurowi. Stawiam sto bry�ek na Naldura.
	AI_TurnToNpc (hero,Scatty);
	AI_Output (other, self, "TRIA_ZakladyErensa_05"); //Ja stawiam sto bry�ek na siebie.

    // Held redet nun wieder mit Scatty (self = Scatty, other = Hero)
    TRIA_Next(Scatty);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, Erens);
    AI_Output (self, other, "TRIA_ZakladyErensa_06"); //A to ci dopiero niespodzianka. Panowie popadli w konflikt? 
	AI_Output (other, self, "TRIA_ZakladyErensa_07"); //Nie z mojej winy. Ten go�� po prostu bardzo pr�dko chce si� pozby� swojej rudy i wr�ci� do Kopalni.

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
    AI_Output (self, other, "TRIA_ZakladyErensa_09"); //No dobra! Zak�ady przyj�te. Walki odbywaj� si� wieczorem od godziny 19. W tym czasie staw si� na arenie. Naldur b�dzie tam ju� czeka�.
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
    AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_01"); //Wygra�e� walk� z Naldurem. Zgodnie z umow� otrzymujesz sw�j wk�ad i sto bry�ek Erensa. 
	AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_02"); //Zrobi�e� dobre wra�enie. Osobi�cie si� ciesz�, �e wreszcie kto� utar� Erensowi nosa. Ten dziadek chyba ma tu za dobrze.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia�em ze Scattym, kt�ry wr�czy� mi nagrod� za walk�. Teraz pora wr�ci� i zobaczy� reakcj� Erensa.");
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
    AI_Output (self, other ,"DIA_Scatty_LoseWithNaldur_03_01"); //Przegra�e� z Naldurem. A szkoda, bo liczy�em, �e utrzesz nosa Erensowi.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia�em ze Scattym, kt�ry szczerze �a�owa�, �e przegra�em. Nie mam odwagi spojrze� Erensowi w oczy, ale chyba b�d� musia� to zrobi�.");
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
   description	= "Widz�, �e ju� po twoim interesie z aren�.";
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
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_01"); //Widz�, �e ju� po twoim interesie z aren�.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_02"); //Jest wiele innych sposob�w �eby zarobi�.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_03"); //Cz�owiek musi potrafi� dostosowa� si� do zmieniaj�cego si� otoczenia. Wiesz o czym m�wi�?
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_04"); //Zamierzam na powa�nie zaj�� si� handlem. Zabra�em ze Starego Obozu kilka fajnych rzeczy.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_05"); //My�l�, �e wkr�tce mi si� przydadz�. A ty jak sobie radzisz?
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_06"); //Nie najgorzej. Orkowie, szamani, harpie... To co zwykle.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_07"); //Ha! Chyba tylko smok m�g�by stawi� ci op�r. Ha ha ha!
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_08"); //(u�miecha si�) Wola�bym go nie spotka�. 
};