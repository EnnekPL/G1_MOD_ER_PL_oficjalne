//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 0; //fix, nie mo¿e byæ permanent, bo wtedy nie dzia³a warunek KnowsInfo przy zadaniu z chat¹ :P  gothic1210
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Ile razy mam wam powtarzaæ, sukinsyny, ¿ebyœcie nie przebiegali przez moj¹ chatê!
};
var int know_kyle_problem;
// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 0;
	description		= "Co ciê ugryz³o?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
if (MIS_guyhut != LOG_SUCCESS)
{
	return 1;	
	};
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co ciê ugryz³o?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Zostaw mnie w spokoju! Mam was wszystkich serdecznie doœæ!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Wszystko zaczê³o siê, gdy zbudowa³em sobie tê chatê.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Wszyscy mówili: nie buduj chaty tak blisko rowu.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Ale ¿aden z tych sukinkotów nie powiedzia³ mi, co siê mo¿e staæ, jeœli j¹ tu jednak wybudujê!
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Jak wróci³em z kopalni kilka dni temu, mia³em dodatkowe drzwi.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Banda wieprzy! Nienawidzê ich! Nie wyobra¿asz sobie, jak ja ich NIENAWIDZÊ!!!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Teraz wszyscy prze³a¿¹ przez moj¹ chatê jakby nigdy nic. Ka¿dy cholerny dupek!
	know_kyle_problem = true;
};

//========================================
//-----------------> DOPUKI
//========================================

INSTANCE DIA_Kyle_DOPUKI (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 3;
   condition    = DIA_Kyle_DOPUKI_Condition;
   information  = DIA_Kyle_DOPUKI_Info;
   permanent	= FALSE;
   description	= "Podobno wiesz o zabójstwie Neka.";
};

FUNC INT DIA_Kyle_DOPUKI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_DOPUKI_Info()
{
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_01"); //Podobno wiesz o zabójstwie Neka.
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_02"); //Mo¿e coœ wiem, ale ci nie powiem. Nikt z nas ci nie powie. 
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_03"); //Szkoda, bo ju¿ co nieco wiem. Miêdzy innymi fascynuje mnie, co robi³eœ w jaskini razem ze Z³ym. 
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_04"); //Dwa durnie! No przecie¿ nie dymaliœmy razem owcy! Mia³ mi daæ okazjê do zarobku. 
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_05"); //Rudê chcia³em oddaæ Dusty'emu, ¿eby poszed³ w cholerê do tego pieprzonego Bractwa i zostawi³ mi swoj¹ chatê.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_06"); //Mia³em z nim iœæ i postraszyæ tego ca³ego Neka, ¿eby odda³ amulet. Jednak Stra¿nik nic sobie z tego nie robi³.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_07"); //No i wtedy siê zaczê³o. Z³y zabi³ tego goœcia na moich oczach. Nie spodziewa³em siê, ¿e takie z niego bydle! Krew tryska³a dos³ownie wszêdzie. 
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_08"); //Dlatego wolê milczeæ. Po pierwsze, ¿eby nie zostaæ pos¹dzonym o wspó³udzia³ w tym gównie, a po drugie ¿eby nie skoñczyæ z poder¿niêtym gard³em.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_09"); //Uwierz mi, ¿e to, ¿e przez moj¹ chatê przelatuje wiêcej sukinsynów ni¿ przez portow¹ dziwkê jeszcze nie kwalifikuje mnie do zostania samobójc¹.
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_10"); //Postaram siê coœ zrobiæ z ludŸmi Z³ego. Liczê, ¿e wtedy mi pomo¿esz. 
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_15_11"); //Byæ mo¿e...
    B_LogEntry                     (CH1_SpysProblems,"Kyle potwierdzi zabójstwo tylko, gdy pozbêdê siê siepaczy Z³ego.");
	HeroKnowsSlyKillNek = true;
};

//========================================
//-----------------> ZABICI
//========================================

INSTANCE DIA_Kyle_ZABICI (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 4;
   condition    = DIA_Kyle_ZABICI_Condition;
   information  = DIA_Kyle_ZABICI_Info;
   permanent	= FALSE;
   description	= "Zabi³em siepaczy.";
};

FUNC INT DIA_Kyle_ZABICI_Condition()
{
    if (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))
    && (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_ZABICI_Info()
{ 
    AI_Output (other, self ,"DIA_Kyle_ZABICI_15_01"); //Zabi³em siepaczy.
    AI_Output (self, other ,"DIA_Kyle_ZABICI_03_02"); //Naprawdê nie ¿yj¹?
    AI_Output (other, self ,"DIA_Kyle_ZABICI_15_03"); //Mo¿na rzec, ¿e w¹chaj¹ kwiatki od spodu.
    AI_Output (self, other ,"DIA_Kyle_ZABICI_03_04"); //Nie do wiary. Mo¿esz liczyæ na moj¹ pomoc.
    B_LogEntry                     (CH1_SpysProblems,"Kyle doniesie na Z³ego do Thorusa.");
};


	//========================================
//-----------------> HUT_NEW
//========================================

INSTANCE DIA_Kyle_HUT_NEW (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 5;
   condition    = DIA_Kyle_HUT_NEW_Condition;
   information  = DIA_Kyle_HUT_NEW_Info;
   permanent	= FALSE;
   description	= "Pomogê ci znaleŸæ now¹ chatê! ";
};

FUNC INT DIA_Kyle_HUT_NEW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kyle_HutRage))
	&& (know_kyle_problem == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_HUT_NEW_Info()
{
    AI_Output (other, self ,"DIA_Kyle_HUT_NEW_15_01"); //Pomogê ci znaleŸæ now¹ chatê! 
    AI_Output (self, other ,"DIA_Kyle_HUT_NEW_03_02"); //Naprawdê? By³bym ci bardzo wdziêczny. Je¿eli coœ by siê zwolni³o w Obozie, to mi o tym powiedz.
    MIS_guyhut = LOG_RUNNING;

    Log_CreateTopic            (CH1_guyhut, LOG_MISSION);
    Log_SetTopicStatus       (CH1_guyhut, LOG_RUNNING);
    B_LogEntry                     (CH1_guyhut,"Muszê pomyœleæ nad nowym lokum dla Kyle'a. W jego domu jest wielka dziura!");
};

//========================================
//-----------------> HUTguy
//========================================

INSTANCE DIA_Kyle_HUTguy (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 6;
   condition    = DIA_Kyle_HUTguy_Condition;
   information  = DIA_Kyle_HUTguy_Info;
   permanent	= FALSE;
   description	= "Dosta³em woln¹ chatê od Guy'a. Mo¿esz tam nocowaæ.";
};

FUNC INT DIA_Kyle_HUTguy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kyle_HUT_NEW))
    && (guysay_about_hut == true)
	&& (MIS_guyhut == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_HUTguy_Info()
{
    AI_Output (other, self ,"DIA_Kyle_HUTguy_15_01"); //Dosta³em woln¹ chatê od Guy'a. Mo¿esz tam nocowaæ.
    AI_Output (self, other ,"DIA_Kyle_HUTguy_03_02"); //Naprawdê?! Bardzo dziêkujê.
    AI_Output (other, self ,"DIA_Kyle_HUTguy_15_03"); //Chata znajduje siê przy arenie. Poznasz j¹ po niewielkim baldachimie.
    B_LogEntry                     (CH1_guyhut,"Kyle bêdzie nocowa³ w chacie, któr¹ obieca³ mi Guy. ");
    Log_SetTopicStatus       (CH1_guyhut, LOG_SUCCESS);
    MIS_guyhut = LOG_SUCCESS;
	Npc_ExchangeRoutine (Vlk_536_Kyle,"guyhut");
    B_GiveXP (25);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SLY_HUT
//========================================

INSTANCE DIA_Kyle_SLY_HUT (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 1;
   condition    = DIA_Kyle_SLY_HUT_Condition;
   information  = DIA_Kyle_SLY_HUT_Info;
   permanent	= FALSE;
   description	= "Chata Z³ego jest wolna!";
};

FUNC INT DIA_Kyle_SLY_HUT_Condition()
{
    if (MIS_guyhut == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_THORUS_ICHTROJE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_SLY_HUT_Info()
{
    AI_Output (other, self ,"DIA_Kyle_SLY_HUT_15_01"); //Chata Z³ego jest wolna!
    AI_Output (self, other ,"DIA_Kyle_SLY_HUT_03_02"); //No tak. Przecie¿ siê go pozby³eœ! Dziêki, ch³opcze.
    B_LogEntry                     (CH1_guyhut,"Kyle zamieszka³ w chacie po Z³ym. Kolejny raz za³atwi³em dwie sprawy za jednym zamachem. ");
    Log_SetTopicStatus       (CH1_guyhut, LOG_SUCCESS);
    MIS_guyhut = LOG_SUCCESS;
	Npc_ExchangeRoutine (Vlk_536_Kyle,"slyhut");
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> budlerhut
//========================================

INSTANCE DIA_Kyle_budlerhut (C_INFO)
{
   npc          = Vlk_536_Kyle;
   nr           = 7;
   condition    = DIA_Kyle_budlerhut_Condition;
   information  = DIA_Kyle_budlerhut_Info;
   permanent	= FALSE;
   description	= "Ostatnio zwolni³a siê jedna chata niedaleko st¹d. Jej w³aœciciel przeniós³ siê do Obozu Bractwa.";
};

FUNC INT DIA_Kyle_budlerhut_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kyle_HUT_NEW))
    && (Npc_KnowsInfo (hero, DIA_BaalTondral_DustySuccess))
	&& (MIS_guyhut == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_budlerhut_Info()
{
    AI_Output (other, self ,"DIA_Kyle_budlerhut_15_01"); //Ostatnio zwolni³a siê jedna chata niedaleko st¹d. Jej w³aœciciel przeniós³ siê do Obozu Bractwa.
    AI_Output (self, other ,"DIA_Kyle_budlerhut_03_02"); //Jak nazywa³ siê w³aœciciel tej chaty?
    AI_Output (other, self ,"DIA_Kyle_budlerhut_15_03"); //Dusty. Chata jest w pobli¿u. IdŸ dalej œcie¿k¹.
    AI_Output (self, other ,"DIA_Kyle_budlerhut_03_04"); //Wiem, gdzie to jest. Dziêki!
    B_LogEntry                     (CH1_guyhut,"Kyle bêdzie nocowa³ w chacie po Dusty'm. ");
    Log_SetTopicStatus       (CH1_guyhut, LOG_SUCCESS);
    MIS_guyhut = LOG_SUCCESS;
	Npc_ExchangeRoutine (Vlk_536_Kyle,"dustyhut");
    B_GiveXP (50);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    AI_StopProcessInfos	(self);
};