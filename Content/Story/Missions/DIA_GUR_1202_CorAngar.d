//poprawione i sprawdzone - Nocturn

//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Sp�ter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zosta� silnym wojownikiem, wi�c szukasz mistrza, kt�ry wska�e ci drog�.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mog� ci pom�c.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Po�wi�cam m�j czas tylko cz�onkom Wielkiego Kr�gu Stra�y �wi�tynnej.
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Angar mo�e mnie nauczy� walki dwur�cznym or�em lub poka�e mi jak zwi�kszy� si�� i zr�czno��, o ile b�d� cz�onkiem Bractwa. ");
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) == GIL_NONE) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz ods�u�y� swoje jako Nowicjusz, dop�ki nie przekonamy si�, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy mo�esz do mnie wr�ci�, a ja udziel� ci lekcji.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							ST�RKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Si�a i zr�czno�� to cechy wielkiego wojownika.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chc� zosta� �wi�tynnym Stra�nikiem!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chc� zosta� �wi�tynnym Stra�nikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jeste� jeszcze gotowy. Mo�esz do nas do��czy�, kiedy zdob�dziesz nieco wi�cej do�wiadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszed� dzie�, w kt�rym dane ci b�dzie do nas do��czy�.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pami�taj, �e �wi�tynny Stra�nik to co� wi�cej ni� wojownik strzeg�cy Obozu Bractwa. Jeste�my wybranymi stra�nikami wyznawc�w �ni�cego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zar�wno nasz� si�� fizyczn� jak i duchow�. Prawdziwym Stra�nikiem �wi�tynnym mo�e zosta� tylko ten, kt�rego cia�o i duch funkcjonuj� w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Ciesz� si�, �e uda�o ci si� osi�gn�� tak wiele w tak kr�tkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pami�taj: Duchowa koncentracja i zdrowe cia�o sprostaj� ka�demu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Id� teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;
		HeroJoinToPSI ();
		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Dzi� Cor Angar przyj�� mnie w poczet Stra�y �wi�tynnej. Gor Na Toth ma mi wr�czy� moj� now� zbroj�. Znajd� go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar pomo�e mi rozwin�� moj� si��, zr�czno��.");
	};

};

/*
//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  GUR_1202_CorAngar_TEACH_2H (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_TEACH_2H_Condition;
	information		= GUR_1202_CorAngar_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy�?"; 
};
//madfaka
FUNC int  GUR_1202_CorAngar_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  GUR_1202_CorAngar_TEACH_2H_Info()
{
	AI_Output (other, self,"GUR_1202_CorAngar_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"GUR_1202_CorAngar_TEACH_2H_Info_09_02"); //Szkol� wy��cznie cz�onk�w Bractwa.

	//if (log_CorAngarfight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"CorAngar mo�e mnie nauczy� walki dwur�cznym or�em o ile b�d� cz�onkiem Bractwa.");
		//log_CorAngarfight = TRUE;
	//};
}; 
*/
//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  GUR_1202_CorAngar_TEACH_2H_START (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_TEACH_2H_START_Condition;
	information		= GUR_1202_CorAngar_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  GUR_1202_CorAngar_TEACH_2H_START_Condition()
{	
	if  Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && ((Npc_GetTrueGuild    (hero) == GIL_NOV) || (Npc_GetTrueGuild    (hero) == GIL_TPL) || (Npc_GetTrueGuild    (hero) == GIL_GUR) || (Npc_GetTrueGuild    (hero) == GIL_DMB))
	{
	return TRUE;
	};
};

FUNC void  GUR_1202_CorAngar_TEACH_2H_START_Info()
{
	AI_Output (other, self,"GUR_1202_CorAngar_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"GUR_1202_CorAngar_TEACH_2H_START_Info_09_02"); //No dobra.

Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

func void GUR_1202_CorAngar_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	var int ilosc;
	ilosc = Npc_hasitems (self, itminugget);
	Npc_RemoveInvItems (self, itminugget, ilosc);
};

FUNC VOID CorAngar_teach_2h1 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_00"); //Chcia�bym nauczy� si� walki dwur�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_01"); //Bronie dwur�czne wymagaj� sporo si�y. S� ci�kie, a przez to tak�e wolniejsze.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_02"); //Zmieni si� to jednak w trakcie czynienia przez ciebie post�p�w w nauce.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_03"); //Za powolno�� bronie dwur�czne odwdzi�cz� ci si� pot�nymi obra�eniami.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_04"); //Ka�d� bro� musisz odpowiednio wyczu�. Topory s� inaczej zbalansowane ni� miecze. Pami�taj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h2 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_06"); //Musisz pracowa� nad swoj� si��. Pozwoli ci ona wykonywa� szybsze ruchy i podnosi� coraz ci�sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_07"); //P�niej b�dziesz musia� pozna� odpowiedni� technik� walki i ��cznia cios�w. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_08"); //Na razie nie jeste� wstanie zada� pe�nych obra�e� na jakie pozwala ci dana bro�. Spokojnie, zajmiemy si� tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h3 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwur�cznych broni?
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_11"); //S� d�ugie... Im d�u�sze tym dalej od siebie mo�esz trzyma� przeciwnika. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_12"); //Gdy kupujesz bro� zwracaj uwag� na jej g�rn� cz��. Je�li jest wystarczaj�co ostra to nawet dra�ni�cie oponenta z daleka zada mu obra�enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_14"); //Nie, nie, nie. Om�wimy to na nast�pnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h4 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h5 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy�em ci� jak porz�dnie trzyma� bro� i jak wykorzysta� si�� bezw�adno�ci ostrza.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_16"); //Pami�taj, �e im lepiej wyczujesz balans broni tym �atwiej b�dzie ci ��czy� kolejne ciosy.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_17"); //Musisz wiedzie�, w kt�rym momencie ponownie si� zamachn��, tak by wykorzysta� przy tym impet pierwszego uderzenia. Pozwoli ci to oszcz�dzi� si�y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h6 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_18"); //Stosuj r�ne strategie walki. Uderzaj raz z przodu, raz z boku. A p�niej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_19"); //Uniki z dwur�cznym mieczem w r�ku faktycznie mog� by� trudne, dlatego musisz parowa� ciosy. �wicz si�� mi�ni r�k, plec�w i klatki piersiowej. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowa�, bez ryzyka po�amania sobie czego�. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h7 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h8 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h9 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h10 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_26"); //To ju� nasza ostatnia lekcja. Poka�� ci sztuczki, kt�re pozwol� ci jeszcze lepiej wyczu� bro�.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_27"); //Musisz nauczy� si� rozpoznawa� s�abe punkty przeciwnik�w i skupia� si� na nich.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

/*
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2) //to trzeba usun��
	&& ((Npc_GetTrueGuild    (hero) == GIL_TPL) || (Npc_GetTrueGuild    (hero) == GIL_GUR)) 
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chcia�bym potrafi� pos�ugiwa� si� dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Walka dwur�cznym or�em stanowi powa�ne wyzwanie dla twojej si�y i zr�czno�ci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Aby m�c sprawnie pos�ugiwa� si� dwur�czna broni� musisz nie tylko rozwija� swoje cia�o, ale r�wnie� i umys�.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Tylko pe�na kontrola nad cia�em i umys�em pozwoli ci rozwija� swoje umiej�tno�ci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Koncentracja to podstawa. To ona jednoczy cia�o i umys�.
		if (Npc_GetTrueGuild    (hero) == GIL_GUR)
		{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_06"); //Jeste� teraz Guru. Ta wiedza przyda ci si� tak�e podczas walki kosturem.
		};

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	
	}
	else
	{
	AI_Output			(self,other,"GUR_1202_CorAngar_NO_ENOUGHT_STR_1"); //Jeszcze nie mog� ci� tego nauczy�!
	PrintScreen	("Warunek: Si�a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& ((Npc_GetTrueGuild    (hero) == GIL_TPL) || (Npc_GetTrueGuild    (hero) == GIL_GUR)) 
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chcia�bym dowiedzie� si� czego� wi�cej o walce dwur�cznym or�em.
		if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Wiesz ju� jak zmusi� ostrze swego miecza do ta�ca �mierci. Teraz poka�� ci jak wykorzysta� twoje umiej�tno�ci w walce.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Oczyma duszy spr�buj przewidzie� nast�pny ruch twojego przeciwnika.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Poznanie sposobu walki nieprzyjaciela to ju� po�owa sukcesu.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //B�d� szybki, twoja ruchliwo�� i p�ynno�� twoich ruch�w powinny i�� w parze z si�� i precyzj� twoich cios�w.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Naucz si� ignorowa� b�l. To twoja si�a ducha zadecyduje o ostatecznym wyniku starcia.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zachowaj spok�j. Zachowanie czysto�ci umys�u i niezachwianej koncentracji przypiecz�tuje twoje zwyci�stwo.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Rozs�dnie wykorzystuj swoje umiej�tno�ci, i pami�taj: kto prowokuje walk� - ginie w walce.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
		}
	else
	{
	AI_Output			(self,other,"GUR_1202_CorAngar_NO_ENOUGHT_STR_1"); //Jeszcze nie mog� ci� tego nauczy�!
	PrintScreen	("Warunek: Si�a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
*/
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der gro�en Beschw�rung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co si� stanie teraz?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co si� stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja by�a bardzo mglista. Zamiast odpowiedzi da�a nam jeszcze wi�cej pyta�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega w�tpliwo�ci: widzia�em orka w jaskini. W pobli�u znajduje si� opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmar�ych, dlatego nazywamy ten labirynt jaski� Cmentarzyskiem Ork�w.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor uda� si� tam z oddzia�em Stra�nik�w �wi�tynnych. Mo�e znajd� co�, co pozwoli nam wyja�ni� znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przyda�by mi si� kto�, kto rozejrzy si� tam troch� i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie p�jdziesz tam sam? W ko�cu jeste� przyw�dc� Stra�y �wi�tynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Ja�nie O�wieconego. Musz� zosta� na miejscu, �eby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odda�e� Obozowi nieocenione us�ugi. Tylko na tobie mog� polega�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Prosz�, udaj si� na Cmentarzysko Ork�w i dostarcz mi informacji na temat odkry� poczynionych przez Stra�nik�w.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostan� w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast rusz� w drog�!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostan� w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak �le ci� oceni�em. Ale potrzebuj� twojej pomocy. Prosz�, oto 100 bry�ek rudy. Wi�cej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast rusz� w drog�!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim p�jdziesz, we� ten pier�cie�. Niech ci� chroni w walce.
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie jest to Cmentarzysko Ork�w?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Gdzie jest to Cmentarzysko Ork�w?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko st�d. Nowicjusz Talas wska�e ci drog�. Znajdziesz go na �wi�tynnym dziedzi�cu. On b�dzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,	"Nowicjusz Talas wska�e mi drog� do Cmentarzyska Ork�w. Czeka na mnie na �wi�tynnym dziedzi�cu.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "By�em na Cmentarzysku Ork�w."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //By�em na Cmentarzysku Ork�w. Tam NIC NIE MA. Ani �ni�cego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Stra�nikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zgin�li.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zgin�li? Ale dlaczego, co si� sta�o?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach a� roi�o si� od ork�w. Wybili Stra� �wi�tynn� do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszli�my z tego ca�o, ale nagle Baal postrada� zmys�y.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszcza�, �e �ni�cy kaza� mu mnie zabi� i zamierza� wykona� to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Najwyra�niej nie m�g� si� pogodzi� z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierz�, �eby b�ogos�awiony wp�yw �ni�cego m�g� go popchn�� do tak brutalnego dzia�ania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie mo�e... Nie mo�e... NIEWA�NE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najwa�niejsze, �e zamiar Baala Lukora si� nie powi�d�.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz nasz� jedyn� nadziej� jest Y'Berion.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co s�ycha� u Ja�nie O�wieconego?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co s�ycha� u Ja�nie O�wieconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi si�. I z godziny na godzin� jest co raz s�abszy. Wiem, jak mo�na go zbudzi�, ale potrzebuj� twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobi�?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynie� mi pi�� najmocniejszych zi� uzdrawiaj�cych jakie mo�na znale�� na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz si�!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion nadal nie odzyska� przytomno�ci. Cor Angar nakaza� mi znale�� pi�� leczniczych zi� o silnym dzia�aniu.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Gdzie mog� znale�� te zio�a?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mog� znale�� te zio�a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz si� zapu�ci� do�� daleko, wi�c uwa�aj na b�otne w�e!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie tra� ani chwili. Id� ju�!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Potrzebne Angarowi zio�a rosn� daleko na bagnach, za Obozem Bractwa. Musz� mie� oczy szeroko otwarte - tamta okolica roi si� od b�otnych w�y.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Jak rozpoznam te zio�a?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zio�a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominaj� gwiazd� z o�mioma zielonymi i pomara�czowymi li��mi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drog�.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Lecznicze zio�a przypominaj� gwiazdy. Maj� cztery zielone i cztery pomara�czowe li�cie.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo�e Fortuno, handlarz zio�ami, ma troch� w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz si�. Potrzebuj� pi�ciu zi�. Y'Berionowi nie zosta�o ju� zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kr�uter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno, handlarz zielem, mo�e mie� takie zio�a na sk�adzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam ju� wszystkie uzdrawiaj�ce zio�a dla Y'Beriona.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam ju� wszystkie uzdrawiaj�ce zio�a dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudzi� si� na chwil� tu� przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedzia� co�?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedzia�, �e �ni�cy nie jest tym, za co go uwa�amy. Pod �adnym pozorem nie wolno nam go zbudzi�.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mie� nadziej�, �e dla biednego Y'Beriona nie jest jeszcze za p�no.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Da�em Cor Angarowi odpowiednie zio�a. Miejmy tylko nadziej�, �e nie jest jeszcze za p�no...");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE �YJE. Nasz duchowy przyw�dca odszed� w za�wiaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja b�yskawiczna pomoc nie mog�a zapobiec jego �mierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz b�dzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufa�em Y'Berionowi. Tu� przed �mierci� kaza� nam upatrywa� nadziei ocalenia w planie ucieczki opracowanym przez Mag�w Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinni�my wesprze� Mag�w Wody w ich d��eniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda si� im kamie� ogniskuj�cy i almanach. Ale te s� wci�� w r�kach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebra� oddzia� Stra�nik�w �wi�tynnych i wyruszy� na poszukiwanie �ni�cego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamie� ogniskuj�cy?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdaj� si�, �e kamie� i ksi�ga s� wci�� w jego laboratorium. Masz tu klucz do skrzyni.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
	Npc_ExchangeRoutine (GUR_1202_CorAngar,"chef");//1.4
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze co�!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //We� t� magiczn� run� jako symbol naszej wdzi�czno�ci za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportowa� si� na �wi�tynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dzi�kuj�!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};

///////////////////////////////////////////////////
// 	Where Is Kalom
//////////////////////////////////////////////////

INSTANCE DIA_CorAngar_WhereIsKalom (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_WhereIsKalom_Condition;
   information  = DIA_CorAngar_WhereIsKalom_Info;
   permanent	= FALSE;
   description	= "Wiesz dok�d uda� si� Cor Kalom?";
};

FUNC INT DIA_CorAngar_WhereIsKalom_Condition()
{
    if (CorAngar_FindHerb == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_WhereIsKalom_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_01"); //Wiesz dok�d uda� si� Cor Kalom?
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_02"); //Nie, wci�� jest to dla mnie zagadk�. 
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_03"); //Chcia�bym dowiedzie� si� dok�d poszed�.
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_04"); //By� mo�e kto� go widzia�. Tak du�a liczba �wi�tynnych nie mog�a przej�� przez koloni� niezauwa�ona.
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_05"); //Kto� m�g� ich widzie�. Powiniene� porozmawia� z my�liwymi. Cz�sto w�druj� po Kolonii w poszukiwaniu zwierzyny. 
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_06"); //Podobno maj� sw�j ob�z nad rzek�.
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_07"); //Tak, znam to miejsce. Udam si� tam jak najszybciej. 

	MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciek� z Bractwa wraz z grup� Nowicjuszy i �wi�tynnych. Musz� dowiedzie� si� dok�d poszli. Wskaz�wki mog� mi da� my�liwi. Cor Angar uwa�a, �e kt�ry� z nich m�g� ich widzie�.");
};

///////////////////////////////////////////////////
// 	Kalom Is In Orc City
//////////////////////////////////////////////////

INSTANCE DIA_CorAngar_KalomOrcCity (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_KalomOrcCity_Condition;
   information  = DIA_CorAngar_KalomOrcCity_Info;
   permanent	= FALSE;
   description	= "Kalom uda� si� do miasta ork�w.";
};

FUNC INT DIA_CorAngar_KalomOrcCity_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_SectTeam))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_KalomOrcCity_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_01"); //Kalom, wraz z kilkoma Stra�nikami �wi�tynnymi uda� si� do Miasta Ork�w.
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_02"); //�owcy ork�w ostatni raz widzieli go przy bagnie na Ziemiach Ork�w.
	AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_03"); //Ciekawi mnie tylko jak Kalom przedosta� si� przez grupy zielonosk�rych.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_04"); //Widocznie musia� mie� ze sob� jaki� atut, kt�ry go ochroni�.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_05"); //Prawdopodobnie nigdy si� tego nie dowiemy.
	//log
    B_LogEntry               (CH3_SearchKalom,"Powiedzia�em Cor Angarowi, �e �owcy ork�w widzieli Kaloma, kt�ry prawdopodobnie uda� si� na ziemie ork�w. Pozostaje nam mie� nadziej�, �e szalony Guru nie zrobi nic g�upiego.");
    Log_SetTopicStatus       (CH3_SearchKalom, LOG_SUCCESS);
    MIS_SearchKalom = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_AboutKalom);
	//prize
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
};
//========================================
//-----------------> GuruMomPlese
//========================================

INSTANCE DIA_CorAngar_GuruMomPlese (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 2;
   condition    = DIA_CorAngar_GuruMomPlese_Condition;
   information  = DIA_CorAngar_GuruMomPlese_Info;
   permanent	= FALSE;
   description	= "Mistrzu, kto zast�pi Y'Beriona?";
};

FUNC INT DIA_CorAngar_GuruMomPlese_Condition()
{
    if ((Npc_GetTrueGuild (hero) == GIL_TPL) || (Npc_GetTrueGuild (hero) == GIL_NOV))
	&& (Npc_KnowsInfo (hero, Info_CorAngar_FindHerb_Success))
	&& (Kapitel >= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_GuruMomPlese_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_01"); //Mistrzu, kto zast�pi Y'Beriona?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_02"); //�mier� Wielkiego Mistrza stawia nasz� spo�eczno�� przed powa�nym problemem. Na razie osobi�cie postaram si� mie� wszystko pod kontrol�.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_03"); //Jednak sam nie dam sobie rady. Zw�aszcza, �e Cor Kalom odszed�. Kto� musi go zast�pi�. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_04"); //Ty... Sta�e� si� silniejszy i bardziej do�wiadczony od kiedy tu przyby�e�.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_05"); //Pomagasz nam w trudno�ciach, wiernie s�u�ysz Bractwu, bez ciebie nie odby�o by si� przywo�anie...
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_06"); //Czy nie zechcia�by� za�o�y� szat� Guru?
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_07"); //C�, nie wygl�da na zbyt wygodn�...
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_08"); //Pr�bujesz ukry� si� pod p�aszczykiem arogancji. M�w, co ci� trapi.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_09"); //Mistrzu, chodzi o to, �e �ni�cy jest demonem. Obaj dobrze o tym wiemy. Dlaczego mia�bym chcie� zosta� Guru, jego najwierniejszym s�ug�?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_10"); //Rozumiem twoje obawy. To si� bardzo chwali, �e mi o tym powiedzia�e�. Nie licz� si� dla ciebie tytu�y lecz duch!
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_11"); //Bractwo wymaga teraz wiele pracy, aby przetrwa�o. Wiara w �ni�cego nie jest ju� tym, co nas spaja. ��czy nas wsp�lna przesz�o�� i nowe wyzwania. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_12"); //Ci ludzie potrzebuj� kogo�, kto pomo�e im si� po tym wszystkim otrz�sn��. Robisz to wi�c nie dla �ni�cego, tylko dla jego by�ych wyznawc�w.
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_13"); //No dobrze. Za�o�� szat� Guru.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_14"); //Zaczekaj! Musisz mi wcze�niej udowodni�, �e jeste� got�w.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_15"); //CO?!
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_16"); //Baal Cadar jest w posiadaniu pewniej tajemniczej ksi�gi. Od kilku dni pr�buje j� sprzeda�. Czyta�em jej fragmenty. Nale�a�a do jakiego� alchemika.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_17"); //Odkup j� od niego i przeczytaj. Wewn�trz znajduje si� przepis na mikstur� lecz�c� umys�. Uwarz j�, a uznam, �e jeste� got�w.
    MIS_TestGuru = LOG_RUNNING;

    Log_CreateTopic          (CH3_TestGuru, LOG_MISSION);
    Log_SetTopicStatus       (CH3_TestGuru, LOG_RUNNING);
    B_LogEntry               (CH3_TestGuru,"Aby zosta� Guru musz� przygotowa� specjaln� mikstur�. Przepis znajd� w ksi�dze, kt�r� chce sprzeda� Baal Cadar.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Mixtura156
//========================================

INSTANCE DIA_CorAngar_Mixtura156 (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_Mixtura156_Condition;
   information  = DIA_CorAngar_Mixtura156_Info;
   permanent	= FALSE;
   description	= "Uwarzy�em mikstur� oczyszczenia.";
};

FUNC INT DIA_CorAngar_Mixtura156_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorAngar_GuruMomPlese))
    && (Npc_HasItems (other, ItFo_Potion_Clear) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_Mixtura156_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_01"); //Uwarzy�em mikstur� oczyszczenia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_02"); //To nap�j o kt�rym pisano w ksi�dze?
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_03"); //Tak, ta mikstura oczyszcza umys� ka�dego, kto j� wypije.
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_04"); //Przepis by� bardzo skomplikowany i wymaga� wielu sk�adnik�w trudnych do zdobycia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_05"); //Udowodni�e�, �e jeste� godzien nosi� szat� Guru. Witaj w�r�d nas. Mo�esz rozgo�ci� si� w laboratorium Kaloma.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_06"); //We� upragnion� szat� i ten kostur. Niechaj ci s�u��. Bractwo na ciebie liczy.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_07"); //Shan b�dzie twoim asystentem i powie ci, czym nale�y si� zaj��.
    hero.guild = GIL_GUR;
    CreateInvItems (self, GUR_ARMOR_M, 1);
    B_GiveInvItems (self, other, GUR_ARMOR_M, 1);
	CreateInvItems (self, ItMw_2H_Staff_GuruMage_03, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_GuruMage_03, 1);
	AI_EquipBestArmor	(hero); 
    B_LogEntry                     (CH3_TestGuru,"Uda�o mi si�. Zosta�em Guru w Obozie Bractwa. Mam zast�powa� Cor Kaloma. Moim asystentem jest Shan, by�y pomocnik Y'Beriona. Od niego dowiem si�, co mam do zrobienia...");
    Log_SetTopicStatus       (CH3_TestGuru, LOG_SUCCESS);
    MIS_TestGuru = LOG_SUCCESS;
	Npc_SetTrueGuild (hero,GIL_GUR);
	HeroJoinToPSI ();
    B_GiveXP (2000);
	
	var c_Npc cadar; cadar = Hlp_GetNpc (GUR_1208_BaalCadar);
	CreateInvItems (cadar, ItMw_2H_Staff_GuruMage_04, 1);
	CreateInvItems (cadar, ItMw_2H_Staff_GuruMage_05, 1);
};

//========================================
//-----------------> BuyArmorH
//========================================

INSTANCE DIA_CorAngar_BuyArmorH (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 2;
   condition    = DIA_CorAngar_BuyArmorH_Condition;
   information  = DIA_CorAngar_BuyArmorH_Info;
   permanent	= FALSE;
   description	= "Kup zdobion� szat� Guru.(2460 bry�ek rudy)";
};

FUNC INT DIA_CorAngar_BuyArmorH_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_GUR)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_BuyArmorH_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_01"); //Chc� nosi� zdobion� szat�.
    AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_02"); //Ten wyj�tkowy pancerz nie jest tani. Masz wystarczaj�co du�o rudy?
    if (Npc_HasItems (hero, ItMiNugget)>=2460)
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_03"); //Oczywi�cie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_04"); //Oto twoja szata.
        CreateInvItems (self, GUR_ARMOR_H, 1);
        B_GiveInvItems (self, other, GUR_ARMOR_H, 1);
        B_GiveInvItems (other, self, ItMiNugget, 2460);
    }
    else
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_05"); //Niestety nie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_06"); //Wr��, gdy uzbierasz odpowiedni� ilo�� rudy.
		DIA_CorAngar_BuyArmorH.permanent = true;
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> KopalniaClear
//========================================

INSTANCE DIA_CorAngar_KopalniaClear (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_KopalniaClear_Condition;
   information  = DIA_CorAngar_KopalniaClear_Info;
   permanent	= FALSE;
   description	= "Oczy�ci�em kopalni�.";
};

FUNC INT DIA_CorAngar_KopalniaClear_Condition()
{
    if (MIS_PsiAbadonedMine == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_KopalniaClear_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_01"); //Pomog�em pozby� si� ludzi Gomeza z Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_02"); //To �wietnie. Pos�aniec dotar�? 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_03"); //Tak, ale nie widzia�em si� z nim. Informacj� przekaza� mi Najemnik, kt�ry poleci� mi rozmow� z Laresem.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_04"); //Lares to twardy i odpowiedzialny cz�owiek. Dobrze zna Bandyt�w i stosunki mi�dzy obozami.
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_05"); //Kopalnia by�a pe�na o�ywie�c�w a cz�� korytarzy zala�a podziemna rzeka. 
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_06"); //Wiele si� m�wi�o o tej kopalni. Widocznie cz�� z nich by�a prawd�...
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    B_GiveXP (500);
};



/*
//========================================
//-----------------> MistrzAreny
//========================================

INSTANCE DIA_CorAngar_MistrzAreny (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_MistrzAreny_Condition;
   information  = DIA_CorAngar_MistrzAreny_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorAngar_MistrzAreny_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_LastFightWin))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_MistrzAreny_Info()
{
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_01"); //Jeste� teraz mistrzem areny. Zas�ugujesz na specjaln� nagrod�.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_02"); //To Miecz Rozpaczy, wybitne ostrze. Zas�ugujesz na nie.
    AI_Output (other, self ,"DIA_CorAngar_MistrzAreny_15_03"); //Sk�d masz t� bro�?
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_04"); //Dzier�y� j� pierwszy Stra�nik �wi�tynny, Gor Na Mit.
    AI_Output (other, self ,"DIA_CorAngar_MistrzAreny_15_05"); //Gdzie jest teraz ten Stra�nik?
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_06"); //Zmar� kilka lat temu w wyniku choroby. Przed �mierci� kaza� przekaza� ten miecz Wybra�cowi.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_07"); //Powiedzia�, �ebym przekaza� miecz osobie, kt�ra wyka�e si� wyj�tkowymi umiej�tno�ciami.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_08"); //Podobno to or� wykuty dla Beliara. Mo�liwe, �e mo�esz si� pomodli� do Beliara, by go ulepszy�.
	CreateInvItems (self, Miecz1H9, 1);
    B_GiveInvItems (self, other, Miecz1H9, 1);
};
*/
