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
	permanent		= 0; //fix, nie mo�e by� permanent, bo wtedy nie dzia�a warunek KnowsInfo przy zadaniu z chat� :P  gothic1210
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
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Ile razy mam wam powtarza�, sukinsyny, �eby�cie nie przebiegali przez moj� chat�!
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
	description		= "Co ci� ugryz�o?";
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
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co ci� ugryz�o?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Zostaw mnie w spokoju! Mam was wszystkich serdecznie do��!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Wszystko zacz�o si�, gdy zbudowa�em sobie t� chat�.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Wszyscy m�wili: nie buduj chaty tak blisko rowu.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Ale �aden z tych sukinkot�w nie powiedzia� mi, co si� mo�e sta�, je�li j� tu jednak wybuduj�!
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Jak wr�ci�em z kopalni kilka dni temu, mia�em dodatkowe drzwi.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Banda wieprzy! Nienawidz� ich! Nie wyobra�asz sobie, jak ja ich NIENAWIDZ�!!!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Teraz wszyscy prze�a�� przez moj� chat� jakby nigdy nic. Ka�dy cholerny dupek!
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
   description	= "Podobno wiesz o zab�jstwie Neka.";
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
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_01"); //Podobno wiesz o zab�jstwie Neka.
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_02"); //Mo�e co� wiem, ale ci nie powiem. Nikt z nas ci nie powie. 
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_03"); //Szkoda, bo ju� co nieco wiem. Mi�dzy innymi fascynuje mnie, co robi�e� w jaskini razem ze Z�ym. 
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_04"); //Dwa durnie! No przecie� nie dymali�my razem owcy! Mia� mi da� okazj� do zarobku. 
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_05"); //Rud� chcia�em odda� Dusty'emu, �eby poszed� w choler� do tego pieprzonego Bractwa i zostawi� mi swoj� chat�.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_06"); //Mia�em z nim i�� i postraszy� tego ca�ego Neka, �eby odda� amulet. Jednak Stra�nik nic sobie z tego nie robi�.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_07"); //No i wtedy si� zacz�o. Z�y zabi� tego go�cia na moich oczach. Nie spodziewa�em si�, �e takie z niego bydle! Krew tryska�a dos�ownie wsz�dzie. 
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_08"); //Dlatego wol� milcze�. Po pierwsze, �eby nie zosta� pos�dzonym o wsp�udzia� w tym g�wnie, a po drugie �eby nie sko�czy� z poder�ni�tym gard�em.
	AI_Output (self, other ,"DIA_Kyle_DOPUKI_03_09"); //Uwierz mi, �e to, �e przez moj� chat� przelatuje wi�cej sukinsyn�w ni� przez portow� dziwk� jeszcze nie kwalifikuje mnie do zostania samob�jc�.
    AI_Output (other, self ,"DIA_Kyle_DOPUKI_15_10"); //Postaram si� co� zrobi� z lud�mi Z�ego. Licz�, �e wtedy mi pomo�esz. 
    AI_Output (self, other ,"DIA_Kyle_DOPUKI_15_11"); //By� mo�e...
    B_LogEntry                     (CH1_MordragProblemOC,"Kyle potwierdzi zab�jstwo tylko, gdy pozb�d� si� siepaczy Z�ego.");
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
   description	= "Zabi�em siepaczy.";
};

FUNC INT DIA_Kyle_ZABICI_Condition()
{
    if (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))
    && (MordragProblemOC == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyle_ZABICI_Info()
{ 
    AI_Output (other, self ,"DIA_Kyle_ZABICI_15_01"); //Zabi�em siepaczy.
    AI_Output (self, other ,"DIA_Kyle_ZABICI_03_02"); //Naprawd� nie �yj�?
    AI_Output (other, self ,"DIA_Kyle_ZABICI_15_03"); //Mo�na rzec, �e w�chaj� kwiatki od spodu.
    AI_Output (self, other ,"DIA_Kyle_ZABICI_03_04"); //Nie do wiary. Mo�esz liczy� na moj� pomoc.
    B_LogEntry                     (CH1_MordragproblemOC,"Kyle doniesie na Z�ego do Thorusa.");
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
   description	= "Pomog� ci znale�� now� chat�! ";
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
    AI_Output (other, self ,"DIA_Kyle_HUT_NEW_15_01"); //Pomog� ci znale�� now� chat�! 
    AI_Output (self, other ,"DIA_Kyle_HUT_NEW_03_02"); //Naprawd�? By�bym ci bardzo wdzi�czny. Je�eli co� by si� zwolni�o w Obozie, to mi o tym powiedz.
    MIS_guyhut = LOG_RUNNING;

    Log_CreateTopic            (CH1_guyhut, LOG_MISSION);
    Log_SetTopicStatus       (CH1_guyhut, LOG_RUNNING);
    B_LogEntry                     (CH1_guyhut,"Musz� pomy�le� nad nowym lokum dla Kyle'a. W jego domu jest wielka dziura!");
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
   description	= "Dosta�em woln� chat� od Guy'a. Mo�esz tam nocowa�.";
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
    AI_Output (other, self ,"DIA_Kyle_HUTguy_15_01"); //Dosta�em woln� chat� od Guy'a. Mo�esz tam nocowa�.
    AI_Output (self, other ,"DIA_Kyle_HUTguy_03_02"); //Naprawd�?! Bardzo dzi�kuj�.
    AI_Output (other, self ,"DIA_Kyle_HUTguy_15_03"); //Chata znajduje si� przy arenie. Poznasz j� po niewielkim baldachimie.
    B_LogEntry                     (CH1_guyhut,"Kyle b�dzie nocowa� w chacie, kt�r� obieca� mi Guy. ");
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
   description	= "Chata Z�ego jest wolna!";
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
    AI_Output (other, self ,"DIA_Kyle_SLY_HUT_15_01"); //Chata Z�ego jest wolna!
    AI_Output (self, other ,"DIA_Kyle_SLY_HUT_03_02"); //No tak. Przecie� si� go pozby�e�! Dzi�ki, ch�opcze.
    B_LogEntry                     (CH1_guyhut,"Kyle zamieszka� w chacie po Z�ym. Kolejny raz za�atwi�em dwie sprawy za jednym zamachem. ");
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
   description	= "Ostatnio zwolni�a si� jedna chata niedaleko st�d. Jej w�a�ciciel przeni�s� si� do Obozu Bractwa.";
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
    AI_Output (other, self ,"DIA_Kyle_budlerhut_15_01"); //Ostatnio zwolni�a si� jedna chata niedaleko st�d. Jej w�a�ciciel przeni�s� si� do Obozu Bractwa.
    AI_Output (self, other ,"DIA_Kyle_budlerhut_03_02"); //Jak nazywa� si� w�a�ciciel tej chaty?
    AI_Output (other, self ,"DIA_Kyle_budlerhut_15_03"); //Dusty. Chata jest w pobli�u. Id� dalej �cie�k�.
    AI_Output (self, other ,"DIA_Kyle_budlerhut_03_04"); //Wiem, gdzie to jest. Dzi�ki!
    B_LogEntry                     (CH1_guyhut,"Kyle b�dzie nocowa� w chacie po Dusty'm. ");
    Log_SetTopicStatus       (CH1_guyhut, LOG_SUCCESS);
    MIS_guyhut = LOG_SUCCESS;
	Npc_ExchangeRoutine (Vlk_536_Kyle,"dustyhut");
    B_GiveXP (50);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    AI_StopProcessInfos	(self);
};