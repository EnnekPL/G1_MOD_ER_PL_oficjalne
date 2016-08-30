// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jeste� tu nowy, co? Nigdy wcze�niej ci� tu nie widzia�em.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jestem Z�y. Mam pewn� robot� dla takiego ��todzioba jak ty.
};

// **************************************************
// 					Erste Begr�ssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "Masz dla mnie robot�? O co chodzi?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Masz dla mnie robot�? O co chodzi?
	if (MIS_DraxTest == LOG_SUCCESS) || (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self, other,"DIA_STT_315_LostNekRefuse_10_01"); //W sumie to ju� nic. Co� mi si� pomyli�o. Zmiataj!
	}
	else
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Znikn�� gdzie� jeden z naszych Stra�nik�w. Nazywa si� Nek. Mo�liwe, �e da� nog� do Nowego Obozu.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jeste� tu nowy i zagl�dasz w ka�dy k�t. Po prostu miej oczy szeroko otwarte.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Je�li uda ci si� go znale��, b�dziesz m�g� liczy� na moje poparcie.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Postaram si� go odnale��."				,DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"A co mi przyjdzie z twojego poparcia?"	,DIA_STT_315_LostNek_Why);
	};
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //A co mi przyjdzie z twojego poparcia?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Je�li chcesz do��czy� do naszego Obozu, musisz zjedna� sobie poparcie kilku wp�ywowych ludzi.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Gdybym szepn�� o tobie dobre s�owo, Diego spojrza�by na ciebie o wiele przychylniej.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Postaram si� go odnale��.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jakby� spotka� Fletchera, mo�esz go zapyta� o Neka. Fletcher przej�� jego rewir po tym ca�ym tajemniczym znikni�ciu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Gdzie znajd� Fletchera?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Zwykle patroluje teren wok� areny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Niejaki Z�y obieca� mi wstawiennictwo u Diego, je�li znajd� Neka. Zachodzi podejrzenie, �e Stra�nik zbieg� do Nowego Obozu. Mam zapyta� o niego Fletchera. Znajd� go w pobli�u areny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Niejaki Z�y poprosi� mnie o znalezienie Neka. Zachodzi podejrzenie, �e Stra�nik zbieg� do Nowego Obozu. Mam zapyta� o niego Fletchera. Znajd� go w pobli�u areny.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "Znalaz�em Neka.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Znalaz�em Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //To �wietnie! A masz na to jakie� dowody?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nie, obawiam si�, �e nie."					,DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Znalaz�em przy nim ten amulet. Prosz�, oto on."	,DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Znalaz�em przy nim ten amulet. Prosz�, oto on.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //W�a�nie o ten amulet mi chodzi�o. M�dry z ciebie ch�opak.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Za�o�� si�, �e kusi�o ci�, �eby zachowa� ten amulet dla siebie, co? Spokojnie, dokona�e� m�drego wyboru.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jakby Diego pyta� o ciebie, opowiem si� za tob�.
	};
	Sly_LostNek = LOG_SUCCESS;
	DIA_FindNekSnaf_OFF = false;
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek, "Da�em Z�emu amulet Neka. Nie m�g� si� nadziwi� mojej uczciwo�ci.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC, "Da�em Z�emu amulet Neka, zyskuj�c tym samym wa�nego sprzymierze�ca.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC, "Da�em Z�emu amulet Neka. Szkoda tylko, �e nie mog� ju� zosta� Cieniem.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nie, obawiam si�, �e nie.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Serio? Chyba nic przede mn� nie ukrywasz, co? Nek mia� przy sobie taki dziwny amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nie lubi� jak kto� ukrywa przede mn� rzeczy, kt�re nale�� do mnie. Jakby� znalaz� ten amulet, przynie� go mi!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Postaram si� o tym pami�ta�, kiedy ju� znajd� ten amulet.
	
	B_LogEntry( CH1_LostNek, "Z�y chce dosta� amulet Neka.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "Jak leci?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //�wietnie! Je�li o mnie chodzi - Diego us�yszy, �e r�wny z ciebie go��!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //R�ka r�k� myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Dok�adnie.
};
//========================================
//-----------------> FAIL_SIPACZE
//========================================

INSTANCE DIA_Sly_FAIL_SIPACZE (C_INFO)
{
   npc          = STT_315_Sly;
   nr           = 1;
   condition    = DIA_Sly_FAIL_SIPACZE_Condition;
   information  = DIA_Sly_FAIL_SIPACZE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sly_FAIL_SIPACZE_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(GRD_2013_Siepacz);
    var C_NPC whodie1; 	whodie1 = Hlp_GetNpc(GRD_2014_Siepacz);
    if (Npc_KnowsInfo (hero, DIA_Siepacz_OFIARA))
    && (!Npc_IsDead(whodie0))
    || (Npc_KnowsInfo (hero, DIA_Siepacz_OFIARA2))
   && (!Npc_IsDead(whodie1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sly_FAIL_SIPACZE_Info()
{
    AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_01"); //A wi�c chcia�e� pozby� si� moich ludzi. Chyba si� za bardzo przeliczy�e�. He he.
    AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_02"); //Wiem, �e pracujesz dla tej szui, Mordraga.
    if (Npc_KnowsInfo (hero, DIA_THORUS_ZDRADA))
    {
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_03"); //Mia�em da� ci drug� szans�, ale wkopa�e� te� �wistaka. Nie licz, �e b�dziesz mia� teraz �atwe �ycie w Obozie.
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_04"); //Ju� ja o to zadbam.
    }
    else
    {
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_05"); //Pos�uchaj. Dam ci drug� szans�. Jeste� tu nowy. Wpad�e� w z�e towarzystwo. Rozumiem to.
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_06"); //Id� do �wistaka i powiedz mu o planach Mordraga. Potem pogadamy znowu.
    };
	B_LogEntry      	(CH1_BANMordragRaport,"Cholera. Przepad�o! Mog�em lepiej przygotowa� si� do walki z siepaczami Z�ego. Teraz mam n� na gardle. Albo przy��cz� si� do Starego Obozu i zrobi� co Cienie mi ka��, albo b�d� musia� szuka� innego sposobu na przy��czenie si� do Bandyt�w. Je�eli nawet chcia�bym teraz zaatakowa� siepaczy, to musz� pami�ta�, �e s� mieszka�cami Obozu. Inni Stra�nicy natychmiast im pomog�. Nawet gdybym da� sobie rad�, to zab�jstwo w bia�y dzie� nie jest za dobrym pomys�em.");  
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER ZDRADA
// **************************************************

instance DIA_STT_315_Sly_ZdradaMordraga (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_ZdradaMordraga_Condition;
	information		= DIA_STT_315_Sly_ZdradaMordraga_Info;
	permanent		= 0;
	description		= "Mordrag sporo o tobie wie.";
	
};

FUNC int DIA_STT_315_Sly_ZdradaMordraga_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE) && (Npc_KnowsInfo (hero, DIA_Whistler_Zdrada))
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_ZdradaMordraga_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_00"); //Mordrag sporo o tobie wie. Mi�dzy innymi to, �e zabi�e� Neka, a �wistak okrad� Magnat�w.
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_01"); //Jak �miesz!
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_02"); //Spokojnie! Jestem po waszej stronie. �wistak ju� o wszystkim wie. Kaza� nam rozprawi� si� z Mordragiem.
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_03"); //Chcesz si� dosta� do Obozu, tak? Wi�c to ty go zabijesz. Thorus b�dzie z ciebie zadowolony.
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_04"); //On te� nie przepada za Mordragiem?
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_05"); //Widz�, �e szybko si� uczysz. We� ten miecz i mikstur�. Przydadz� ci si� w walce. 
	Thorus_MordragKo = LOG_RUNNING;
	zlecil_Thorus = false;
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Z�y chce �ebym zabi� Mordraga. Dzi�ki temu zyskam jego zaufanie. Pozosta�ymi Cieniami zajmie si� �wistak.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);
	B_LogEntry                     (CH1_KosztemQuentina,"Mam zabi� Mordraga. Z�y zadba� o m�j ekwipunek.");
	CreateInvItems  (self,ItFo_PotionTime_Strength_01,1);
	B_GiveInvItems  (self, hero, ItFo_PotionTime_Strength_01, 1);
	CreateInvItems  (self,ItMw_1H_Sword_Short_05,1);
	B_GiveInvItems  (self, hero, ItMw_1H_Sword_Short_05, 1);
};
// **************************************************
// 					SUKCES
// **************************************************
//edit by Nocturn
instance DIA_STT_315_Sly_Sukces (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Sukces_Condition;
	information		= DIA_STT_315_Sly_Sukces_Info;
	permanent		= 0;//fix
	description		= "Pozby�em si� Mordraga.";
	
};

FUNC int DIA_STT_315_Sly_Sukces_Condition() //poprawiony if g1210
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE) && (kapitel == 10) && (Npc_KnowsInfo (hero, DIA_STT_315_Sly_ZdradaMordraga)) && ((Npc_KnowsInfo (hero, Org_826_Mordrag_HauAb)) || (Npc_IsDead(Org_826_Mordrag)))
	{
		return 1;
	};
};
func void DIA_STT_315_Sly_Sukces_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_Sukces_15_00"); //Pozby�em si� Mordraga.
	if MordragKO_HauAb == TRUE
	{
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_01"); //�wietna robota. Jednak wola�bym �eby� go zabi�.
	B_GiveXP (150);
	} else {
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_02"); //Nie �yje?! �wietnie. 
	B_GiveXP (200);
	};
	AI_Output (other, self,"DIA_STT_315_Sly_Sukces_15_03"); //Co teraz?
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_04"); //Razem ze �wistakiem gadali�my z r�nymi osobami w Obozie. Mo�esz ju� i�� i pogada� z Diego.
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_15_05"); //A, i zajrzyj uprzednio do �wistaka i Thorusa.
	Thorus_MordragKo = LOG_SUCCESS;
	B_LogEntry			(CH1_MordragKO,"Zabi�em Mordraga. Z�y by� bardzo zadowolony.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry                     (CH1_KosztemQuentina,"Plan si� uda�. Zanim p�jd� do Diego, musz� pogada� ze �wistakiem i Thorusem.");
talk_aboutOpinion_OC = true;
};
	
//========================================
//-----------------> LOCHY
//========================================

INSTANCE DIA_Sly_LOCHY (C_INFO)
{
   npc          = STT_315_Sly;
   nr           = 1;
   condition    = DIA_Sly_LOCHY_Condition;
   information  = DIA_Sly_LOCHY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sly_LOCHY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_ICHTROJE))
    && (Npc_GetDistToWP (self, "SLY_CELL") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sly_LOCHY_Info()
{
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_01"); //Co tu robisz do licha?!
    AI_Output (other, self ,"DIA_Sly_LOCHY_15_02"); //A tak si� rozgl�dam.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_03"); //Wyno� si� st�d, ty sukinsynu! Przez ciebie b�d� tu gni� przez d�ugi czas.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_04"); //Zabi�e� moich ludzi i wyda�e� mnie Thorusowi! Jak tylko st�d wyjd� - b�dziesz trupem!
    AI_Output (other, self ,"DIA_Sly_LOCHY_15_05"); //Lepiej nie m�w mi takich rzeczy, chyba �e chcesz, abym zawo�a� Stra�nik�w.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_06"); //Arghhh... WON! 
    AI_StopProcessInfos	(self);
};

