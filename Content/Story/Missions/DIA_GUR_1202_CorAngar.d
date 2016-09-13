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
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zostaæ silnym wojownikiem, wiêc szukasz mistrza, który wska¿e ci drogê.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mogê ci pomóc.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Poœwiêcam mój czas tylko cz³onkom Wielkiego Krêgu Stra¿y Œwi¹tynnej.
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Angar mo¿e mnie nauczyæ walki dwurêcznym orê¿em lub poka¿e mi jak zwiêkszyæ si³ê i zrêcznoœæ, o ile bêdê cz³onkiem Bractwa. ");
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
	description = "Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz ods³u¿yæ swoje jako Nowicjusz, dopóki nie przekonamy siê, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy mo¿esz do mnie wróciæ, a ja udzielê ci lekcji.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Si³a i zrêcznoœæ to cechy wielkiego wojownika.
	
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
	description		= "Chcê zostaæ Œwi¹tynnym Stra¿nikiem!"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chcê zostaæ Œwi¹tynnym Stra¿nikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jesteœ jeszcze gotowy. Mo¿esz do nas do³¹czyæ, kiedy zdobêdziesz nieco wiêcej doœwiadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszed³ dzieñ, w którym dane ci bêdzie do nas do³¹czyæ.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamiêtaj, ¿e Œwi¹tynny Stra¿nik to coœ wiêcej ni¿ wojownik strzeg¹cy Obozu Bractwa. Jesteœmy wybranymi stra¿nikami wyznawców Œni¹cego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zarówno nasz¹ si³ê fizyczn¹ jak i duchow¹. Prawdziwym Stra¿nikiem Œwi¹tynnym mo¿e zostaæ tylko ten, którego cia³o i duch funkcjonuj¹ w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Cieszê siê, ¿e uda³o ci siê osi¹gn¹æ tak wiele w tak krótkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pamiêtaj: Duchowa koncentracja i zdrowe cia³o sprostaj¹ ka¿demu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //IdŸ teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;
		HeroJoinToPSI ();
		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Dziœ Cor Angar przyj¹³ mnie w poczet Stra¿y Œwi¹tynnej. Gor Na Toth ma mi wrêczyæ moj¹ now¹ zbrojê. Znajdê go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar pomo¿e mi rozwin¹æ moj¹ si³ê, zrêcznoœæ.");
	};

};

/*
//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  GUR_1202_CorAngar_TEACH_2H (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_TEACH_2H_Condition;
	information		= GUR_1202_CorAngar_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ?"; 
};
//madfaka
FUNC int  GUR_1202_CorAngar_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  GUR_1202_CorAngar_TEACH_2H_Info()
{
	AI_Output (other, self,"GUR_1202_CorAngar_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"GUR_1202_CorAngar_TEACH_2H_Info_09_02"); //Szkolê wy³¹cznie cz³onków Bractwa.

	//if (log_CorAngarfight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"CorAngar mo¿e mnie nauczyæ walki dwurêcznym orê¿em o ile bêdê cz³onkiem Bractwa.");
		//log_CorAngarfight = TRUE;
	//};
}; 
*/
//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
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
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

func void GUR_1202_CorAngar_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
};

FUNC VOID CorAngar_teach_2h1 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_00"); //Chcia³bym nauczyæ siê walki dwurêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_01"); //Bronie dwurêczne wymagaj¹ sporo si³y. S¹ ciê¿kie, a przez to tak¿e wolniejsze.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_02"); //Zmieni siê to jednak w trakcie czynienia przez ciebie postêpów w nauce.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_03"); //Za powolnoœæ bronie dwurêczne odwdziêcz¹ ci siê potê¿nymi obra¿eniami.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_04"); //Ka¿d¹ broñ musisz odpowiednio wyczuæ. Topory s¹ inaczej zbalansowane ni¿ miecze. Pamiêtaj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h2 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_06"); //Musisz pracowaæ nad swoj¹ si³¹. Pozwoli ci ona wykonywaæ szybsze ruchy i podnosiæ coraz ciê¿sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_07"); //PóŸniej bêdziesz musia³ poznaæ odpowiedni¹ technikê walki i ³¹cznia ciosów. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_08"); //Na razie nie jesteœ wstanie zadaæ pe³nych obra¿eñ na jakie pozwala ci dana broñ. Spokojnie, zajmiemy siê tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h3 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwurêcznych broni?
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_11"); //S¹ d³ugie... Im d³u¿sze tym dalej od siebie mo¿esz trzymaæ przeciwnika. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_12"); //Gdy kupujesz broñ zwracaj uwagê na jej górn¹ czêœæ. Jeœli jest wystarczaj¹co ostra to nawet draœniêcie oponenta z daleka zada mu obra¿enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_14"); //Nie, nie, nie. Omówimy to na nastêpnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h4 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h5 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy³em ciê jak porz¹dnie trzymaæ broñ i jak wykorzystaæ si³ê bezw³adnoœci ostrza.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_16"); //Pamiêtaj, ¿e im lepiej wyczujesz balans broni tym ³atwiej bêdzie ci ³¹czyæ kolejne ciosy.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_17"); //Musisz wiedzieæ, w którym momencie ponownie siê zamachn¹æ, tak by wykorzystaæ przy tym impet pierwszego uderzenia. Pozwoli ci to oszczêdziæ si³y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h6 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_18"); //Stosuj ró¿ne strategie walki. Uderzaj raz z przodu, raz z boku. A póŸniej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_19"); //Uniki z dwurêcznym mieczem w rêku faktycznie mog¹ byæ trudne, dlatego musisz parowaæ ciosy. Æwicz si³ê miêœni r¹k, pleców i klatki piersiowej. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowaæ, bez ryzyka po³amania sobie czegoœ. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h7 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h8 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h9 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
	};
};

FUNC VOID CorAngar_teach_2h10 ()
{
	AI_Output (other,self,"DIA_CorAngar_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_26"); //To ju¿ nasza ostatnia lekcja. Poka¿ê ci sztuczki, które pozwol¹ ci jeszcze lepiej wyczuæ broñ.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_27"); //Musisz nauczyæ siê rozpoznawaæ s³abe punkty przeciwników i skupiaæ siê na nich.
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_CorAngar_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,DIALOG_BACK,GUR_1202_CorAngar_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",CorAngar_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",CorAngar_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",CorAngar_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",CorAngar_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",CorAngar_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",CorAngar_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",CorAngar_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",CorAngar_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",CorAngar_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GUR_1202_CorAngar_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",CorAngar_teach_2h10);
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
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2) //to trzeba usun¹æ
	&& ((Npc_GetTrueGuild    (hero) == GIL_TPL) || (Npc_GetTrueGuild    (hero) == GIL_GUR)) 
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chcia³bym potrafiæ pos³ugiwaæ siê dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Walka dwurêcznym orê¿em stanowi powa¿ne wyzwanie dla twojej si³y i zrêcznoœci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Aby móc sprawnie pos³ugiwaæ siê dwurêczna broni¹ musisz nie tylko rozwijaæ swoje cia³o, ale równie¿ i umys³.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Tylko pe³na kontrola nad cia³em i umys³em pozwoli ci rozwijaæ swoje umiejêtnoœci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Koncentracja to podstawa. To ona jednoczy cia³o i umys³.
		if (Npc_GetTrueGuild    (hero) == GIL_GUR)
		{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_06"); //Jesteœ teraz Guru. Ta wiedza przyda ci siê tak¿e podczas walki kosturem.
		};

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
	
	}
	else
	{
	AI_Output			(self,other,"GUR_1202_CorAngar_NO_ENOUGHT_STR_1"); //Jeszcze nie mogê ciê tego nauczyæ!
	PrintScreen	("Warunek: Si³a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chcia³bym dowiedzieæ siê czegoœ wiêcej o walce dwurêcznym orê¿em.
		if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Wiesz ju¿ jak zmusiæ ostrze swego miecza do tañca œmierci. Teraz poka¿ê ci jak wykorzystaæ twoje umiejêtnoœci w walce.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Oczyma duszy spróbuj przewidzieæ nastêpny ruch twojego przeciwnika.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Poznanie sposobu walki nieprzyjaciela to ju¿ po³owa sukcesu.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //B¹dŸ szybki, twoja ruchliwoœæ i p³ynnoœæ twoich ruchów powinny iœæ w parze z si³¹ i precyzj¹ twoich ciosów.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Naucz siê ignorowaæ ból. To twoja si³a ducha zadecyduje o ostatecznym wyniku starcia.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zachowaj spokój. Zachowanie czystoœci umys³u i niezachwianej koncentracji przypieczêtuje twoje zwyciêstwo.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Rozs¹dnie wykorzystuj swoje umiejêtnoœci, i pamiêtaj: kto prowokuje walkê - ginie w walce.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
		}
	else
	{
	AI_Output			(self,other,"GUR_1202_CorAngar_NO_ENOUGHT_STR_1"); //Jeszcze nie mogê ciê tego nauczyæ!
	PrintScreen	("Warunek: Si³a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co siê stanie teraz?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co siê stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja by³a bardzo mglista. Zamiast odpowiedzi da³a nam jeszcze wiêcej pytañ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega w¹tpliwoœci: widzia³em orka w jaskini. W pobli¿u znajduje siê opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmar³ych, dlatego nazywamy ten labirynt jaskiñ Cmentarzyskiem Orków.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor uda³ siê tam z oddzia³em Stra¿ników Œwi¹tynnych. Mo¿e znajd¹ coœ, co pozwoli nam wyjaœniæ znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przyda³by mi siê ktoœ, kto rozejrzy siê tam trochê i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie pójdziesz tam sam? W koñcu jesteœ przywódc¹ Stra¿y Œwi¹tynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Jaœnie Oœwieconego. Muszê zostaæ na miejscu, ¿eby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odda³eœ Obozowi nieocenione us³ugi. Tylko na tobie mogê polegaæ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Proszê, udaj siê na Cmentarzysko Orków i dostarcz mi informacji na temat odkryæ poczynionych przez Stra¿ników.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostanê w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast ruszê w drogê!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostanê w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak Ÿle ciê oceni³em. Ale potrzebujê twojej pomocy. Proszê, oto 100 bry³ek rudy. Wiêcej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast ruszê w drogê!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim pójdziesz, weŸ ten pierœcieñ. Niech ciê chroni w walce.
	
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
	description		= "Gdzie jest to Cmentarzysko Orków?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Gdzie jest to Cmentarzysko Orków?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko st¹d. Nowicjusz Talas wska¿e ci drogê. Znajdziesz go na œwi¹tynnym dziedziñcu. On bêdzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,	"Nowicjusz Talas wska¿e mi drogê do Cmentarzyska Orków. Czeka na mnie na œwi¹tynnym dziedziñcu.");
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
	description		= "By³em na Cmentarzysku Orków."; 
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
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //By³em na Cmentarzysku Orków. Tam NIC NIE MA. Ani Œni¹cego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Stra¿nikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zginêli.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zginêli? Ale dlaczego, co siê sta³o?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach a¿ roi³o siê od orków. Wybili Stra¿ Œwi¹tynn¹ do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszliœmy z tego ca³o, ale nagle Baal postrada³ zmys³y.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszcza³, ¿e Œni¹cy kaza³ mu mnie zabiæ i zamierza³ wykonaæ to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //NajwyraŸniej nie móg³ siê pogodziæ z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierzê, ¿eby b³ogos³awiony wp³yw Œni¹cego móg³ go popchn¹æ do tak brutalnego dzia³ania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie mo¿e... Nie mo¿e... NIEWA¯NE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najwa¿niejsze, ¿e zamiar Baala Lukora siê nie powiód³.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz nasz¹ jedyn¹ nadziej¹ jest Y'Berion.
	 

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
	description = "Co s³ychaæ u Jaœnie Oœwieconego?";
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
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co s³ychaæ u Jaœnie Oœwieconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi siê. I z godziny na godzinê jest co raz s³abszy. Wiem, jak mo¿na go zbudziæ, ale potrzebujê twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobiæ?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynieœ mi piêæ najmocniejszych zió³ uzdrawiaj¹cych jakie mo¿na znaleŸæ na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz siê!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion nadal nie odzyska³ przytomnoœci. Cor Angar nakaza³ mi znaleŸæ piêæ leczniczych zió³ o silnym dzia³aniu.");
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
	description = "Gdzie mogê znaleŸæ te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mogê znaleŸæ te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz siê zapuœciæ doœæ daleko, wiêc uwa¿aj na b³otne wê¿e!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie traæ ani chwili. IdŸ ju¿!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Potrzebne Angarowi zio³a rosn¹ daleko na bagnach, za Obozem Bractwa. Muszê mieæ oczy szeroko otwarte - tamta okolica roi siê od b³otnych wê¿y.");
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
	description = "Jak rozpoznam te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominaj¹ gwiazdê z oœmioma zielonymi i pomarañczowymi liœæmi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drogê.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Lecznicze zio³a przypominaj¹ gwiazdy. Maj¹ cztery zielone i cztery pomarañczowe liœcie.");
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
	description = "Nie znalaz³em jeszcze potrzebnej iloœci zió³.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalaz³em jeszcze potrzebnej iloœci zió³.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo¿e Fortuno, handlarz zio³ami, ma trochê w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz siê. Potrzebujê piêciu zió³. Y'Berionowi nie zosta³o ju¿ zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno, handlarz zielem, mo¿e mieæ takie zio³a na sk³adzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudzi³ siê na chwilê tu¿ przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedzia³ coœ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedzia³, ¿e Œni¹cy nie jest tym, za co go uwa¿amy. Pod ¿adnym pozorem nie wolno nam go zbudziæ.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mieæ nadziejê, ¿e dla biednego Y'Beriona nie jest jeszcze za póŸno.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Da³em Cor Angarowi odpowiednie zio³a. Miejmy tylko nadziejê, ¿e nie jest jeszcze za póŸno...");
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
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE ¯YJE. Nasz duchowy przywódca odszed³ w zaœwiaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja b³yskawiczna pomoc nie mog³a zapobiec jego œmierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz bêdzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufa³em Y'Berionowi. Tu¿ przed œmierci¹ kaza³ nam upatrywaæ nadziei ocalenia w planie ucieczki opracowanym przez Magów Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinniœmy wesprzeæ Magów Wody w ich d¹¿eniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda siê im kamieñ ogniskuj¹cy i almanach. Ale te s¹ wci¹¿ w rêkach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebra³ oddzia³ Stra¿ników Œwi¹tynnych i wyruszy³ na poszukiwanie Œni¹cego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamieñ ogniskuj¹cy?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdajê siê, ¿e kamieñ i ksiêga s¹ wci¹¿ w jego laboratorium. Masz tu klucz do skrzyni.

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
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze coœ!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //WeŸ tê magiczn¹ runê jako symbol naszej wdziêcznoœci za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportowaæ siê na œwi¹tynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dziêkujê!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 /*
//========================================
//-----------------> Sprawa
//========================================

INSTANCE DIA_CorAngar_Sprawa (C_INFO) // przecie¿ to zadanie zleca nam Shawn ***FIX***
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_Sprawa_Condition;
   information  = DIA_CorAngar_Sprawa_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorAngar_Sprawa_Condition()
{
    if (kapitel == 4)

    && (Npc_KnowsInfo (hero, GUR_1201_CorKalom_JoinPSI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_Sprawa_Info()
{
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_01"); //Zaczekaj. Mam dla ciebie zadanie.
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_02"); //Dosz³y nas wieœci ze Starej Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_03"); //Podobno sytuacja w Kolonii jest bardzo z³a.
    AI_Output (other, self ,"DIA_CorAngar_Sprawa_15_04"); //Bynajmniej. Na czym polega moje zadanie?
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_05"); //Udaj siê w pobli¿e Starej Kopalni i sprawdŸ, czy nasi bracia z kopalni ¿yj¹.
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_06"); //Mam nadziejê, ¿e uda³o im siê uciec.
    AI_Output (self, other ,"DIA_CorAngar_Sprawa_03_07"); //Tylko b¹dŸ ostro¿ny.
    MIS_HelpBrothersBra  = LOG_RUNNING;

    Log_CreateTopic            (CH1_HelpBrothersBra , LOG_MISSION);
    Log_SetTopicStatus       (CH1_HelpBrothersBra , LOG_RUNNING);
    B_LogEntry                     (CH1_HelpBrothersBra ,"Cor Angar kaza³ mi sprawdziæ, co sta³o siê z naszymi braæmi z kopalni.");
};
*/

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
   description	= "Oczyœci³em kopalniê.";
};

FUNC INT DIA_CorAngar_KopalniaClear_Condition()
{
    if (MIS_Bractwo_Kopalnia == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_KopalniaClear_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_01"); //Pomog³em pozbyæ siê ludzi Gomeza z Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_02"); //To œwietnie. Pos³aniec dotar³? 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_03"); //Tak, ale nie widzia³em siê z nim. Informacjê przekaza³ mi Najemnik, który poleci³ mi rozmowê z Laresem.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_04"); //Lares to twardy i odpowiedzialny cz³owiek. Dobrze zna Bandytów i stosunki miêdzy obozami.
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_05"); //Kopalnia by³a pe³na o¿ywieñców. 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_06"); //Czêœæ korytarzy by³a zalana przez podziemn¹ rzekê. 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_07"); //Wszêdzie roi³o siê od pe³zaczy i innych bestii.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_08"); //To niewiarygodne, ¿e te legendy okaza³y siê prawd¹. Zas³u¿y³eœ na nagrodê. Jesteœ dzielnym wojownikiem i dobrze mieæ ciê po swojej stronie. 
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    B_GiveXP (500);
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
   description	= "Mistrzu, kto zast¹pi Y'Beriona?";
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
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_01"); //Mistrzu, kto zast¹pi Y'Beriona?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_02"); //Ciê¿ko mi siê pogodziæ z jego œmierci¹... Na razie to ja postaram siê mieæ wszystko pod kontrol¹.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_03"); //Jednak sam nie dam sobie rady. Zw³aszcza, ¿e Cor Kalom odszed³. Ktoœ musi go zast¹piæ. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_04"); //Ty... Sta³eœ siê silniejszy i bardziej doœwiadczony od kiedy tu przyby³eœ.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_05"); //Pomagasz nam w trudnoœciach, wiernie s³u¿ysz Bractwu, bez ciebie nie odby³o by siê przywo³anie...
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_06"); //Czy nie zechcia³byœ za³o¿yæ szatê Guru?
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_07"); //Có¿, nie wygl¹da na zbyt wygodn¹... Strasznie d³uga, a to wzornictwo... Okropnoœci...
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_08"); //Próbujesz ukryæ siê pod p³aszczykiem arogancji. Mów, co ciê trapi.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_09"); //Mistrzu, chodzi o to, ¿e Œni¹cy jest demonem. Obaj dobrze o tym wiemy. Dlaczego mia³bym chcieæ zostaæ Guru, jego najwierniejszym s³ug¹?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_10"); //Rozumiem twoje obawy. To siê bardzo chwali, ¿e mi o tym powiedzia³eœ. Nie licz¹ siê dla ciebie tytu³y lecz duch!
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_11"); //Zrób to dla tych wszystkich zagubionych ludzi, którzy b³¹kaj¹ siê po tym Obozie bez celu. Oni potrzebuj¹ kogoœ, kto wska¿e im drogê.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_12"); //Zagubili siê! Musisz im pomóc. Pomyœl o tym. Robisz to nie dla Œni¹cego, tylko dla jego by³ych wyznawców.
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_13"); //No dobrze. Za³o¿ê szatê Guru.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_14"); //Zaczekaj! Musisz mi wczeœniej udowodniæ, ¿e jesteœ gotów.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_15"); //CO?!
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_16"); //Baal Cadar jest w posiadaniu pewniej tajemniczej ksiêgi. Od kilku dni próbuje j¹ sprzedaæ. Czyta³em jej fragmenty. Nale¿a³a do jakiegoœ alchemika.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_17"); //Odkup j¹ od niego i przeczytaj. Wewn¹trz znajduje siê przepis na miksturê lecz¹c¹ umys³. Uwarz j¹, a uznam, ¿e jesteœ gotów.
    MIS_testGuru = LOG_RUNNING;

    Log_CreateTopic          (CH1_testGuru, LOG_MISSION);
    Log_SetTopicStatus       (CH1_testGuru, LOG_RUNNING);
    B_LogEntry               (CH1_testGuru,"Aby zostaæ Guru muszê przygotowaæ specjaln¹ miksturê. Przepis znajdê w ksiêdze, któr¹ chce sprzedaæ Baal Cadar.");
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
   description	= "Uwarzy³em miksturê oczyszczenia.";
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
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_01"); //Uwarzy³em miksturê oczyszczenia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_02"); //To napój o którym pisano w ksiêdze?
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_03"); //Tak, ta mikstura oczyszcza umys³ ka¿dego, kto j¹ wypije.
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_04"); //Przepis by³ bardzo skomplikowany i wymaga³ wielu sk³adników trudnych do zdobycia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_05"); //Udowodni³eœ, ¿e jesteœ godzien nosiæ szatê Guru. Witaj wœród nas. Mo¿esz rozgoœciæ siê w laboratorium Kaloma.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_06"); //WeŸ upragnion¹ szatê i ten kostur. Niechaj ci s³u¿¹. Bractwo na ciebie liczy.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_07"); //Gor Na Dhun bêdzie twoim asystentem i powie ci czym nale¿y siê zaj¹æ.
    hero.guild = GIL_GUR;
    CreateInvItems (self, GUR_ARMOR_M, 1);
    B_GiveInvItems (self, other, GUR_ARMOR_M, 1);
	CreateInvItems (self, ItMw_2H_Staff_GuruMage_03, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_GuruMage_03, 1);
	AI_EquipBestArmor	(hero); 
    B_LogEntry                     (CH1_testGuru,"Uda³o mi siê. Zosta³em Guru w Obozie Bractwa. Mam zastêpowaæ Cor Kaloma. Moim asystentem jest Gor Na Dhun, by³y pomocnik Y'Beriona. Od niego dowiem siê, co mam do zrobienia...");
    Log_SetTopicStatus       (CH1_testGuru, LOG_SUCCESS);
    MIS_testGuru = LOG_SUCCESS;
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
   description	= "Kup zdobion¹ szatê Guru.(2460 bry³ek rudy)";
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
    AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_01"); //Chcê nosiæ zdobion¹ szatê.
    AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_02"); //A masz rudê?
    if (Npc_HasItems (hero, ItMiNugget)>=2460)
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_03"); //Oczywiœcie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_04"); //Oto twoja szata.
        CreateInvItems (self, GUR_ARMOR_H, 1);
        B_GiveInvItems (self, other, GUR_ARMOR_H, 1);
        B_GiveInvItems (other, self, ItMiNugget, 2460);
    }
    else
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_05"); //Niestety nie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_06"); //Wróæ, gdy uzbierasz odpowiedni¹ iloœæ rudy.
		DIA_CorAngar_BuyArmorH.permanent = true;
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Bractwo_Kopalnia_Finish
//========================================

INSTANCE DIA_CorAngar_Bractwo_Kopalnia_Finish (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_Bractwo_Kopalnia_Finish_Condition;
   information  = DIA_CorAngar_Bractwo_Kopalnia_Finish_Info;
   permanent	= FALSE;
   description	= "Zaj¹³em siê spraw¹ w Nowym Obozie. ";
};

FUNC INT DIA_CorAngar_Bractwo_Kopalnia_Finish_Condition()
{
    if (MIS_Bractwo_Kopalnia == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_Bractwo_Kopalnia_Finish_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_Bractwo_Kopalnia_Finish_15_01"); //Zaj¹³em siê spraw¹ w Nowym Obozie. 
    AI_Output (other, self ,"DIA_CorAngar_Bractwo_Kopalnia_Finish_15_02"); //Dziêki mojej pomocy Najemnicy odzyskali dostêp do Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_Bractwo_Kopalnia_Finish_03_03"); //Gomez ma teraz niez³y k³opot. To powinno na chwilê ostudziæ jego zapa³.
    AI_Output (self, other ,"DIA_CorAngar_Bractwo_Kopalnia_Finish_03_04"); //Dobrze siê spisa³eœ. Obawia³em siê, ¿e pos³aniec móg³ nie dotrzeæ do Nowego Obozu.
    AI_Output (self, other ,"DIA_CorAngar_Bractwo_Kopalnia_Finish_03_05"); //Zas³u¿y³eœ na nagrodê.
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    b_givexp (200);
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
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_01"); //Jesteœ teraz mistrzem areny. Zas³ugujesz na specjaln¹ nagrodê.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_02"); //To Miecz Rozpaczy, wybitne ostrze. Zas³ugujesz na nie.
    AI_Output (other, self ,"DIA_CorAngar_MistrzAreny_15_03"); //Sk¹d masz tê broñ?
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_04"); //Dzier¿y³ j¹ pierwszy Stra¿nik Œwi¹tynny, Gor Na Mit.
    AI_Output (other, self ,"DIA_CorAngar_MistrzAreny_15_05"); //Gdzie jest teraz ten Stra¿nik?
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_06"); //Zmar³ kilka lat temu w wyniku choroby. Przed œmierci¹ kaza³ przekazaæ ten miecz Wybrañcowi.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_07"); //Powiedzia³, ¿ebym przekaza³ miecz osobie, która wyka¿e siê wyj¹tkowymi umiejêtnoœciami.
    AI_Output (self, other ,"DIA_CorAngar_MistrzAreny_03_08"); //Podobno to orê¿ wykuty dla Beliara. Mo¿liwe, ¿e mo¿esz siê pomodliæ do Beliara, by go ulepszyæ.
	CreateInvItems (self, Miecz1H9, 1);
    B_GiveInvItems (self, other, Miecz1H9, 1);
};
*/
