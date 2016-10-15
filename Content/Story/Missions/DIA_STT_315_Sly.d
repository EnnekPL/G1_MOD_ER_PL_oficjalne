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
// 					Erste Begrüssung 
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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jesteœ tu nowy, co? Nigdy wczeœniej ciê tu nie widzia³em.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jestem Z³y. Mam pewn¹ robotê dla takiego ¿ó³todzioba jak ty.
};

// **************************************************
// 					Erste Begrüssung 
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
	description		= "Masz dla mnie robotê? O co chodzi?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Masz dla mnie robotê? O co chodzi?
	if (MIS_DraxTest == LOG_SUCCESS) || (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self, other,"DIA_STT_315_LostNekRefuse_10_01"); //W sumie to ju¿ nic. Coœ mi siê pomyli³o. Zmiataj!
	}
	else
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Znikn¹³ gdzieœ jeden z naszych Stra¿ników. Nazywa siê Nek. Mo¿liwe, ¿e da³ nogê do Nowego Obozu.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jesteœ tu nowy i zagl¹dasz w ka¿dy k¹t. Po prostu miej oczy szeroko otwarte.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Jeœli uda ci siê go znaleŸæ, bêdziesz móg³ liczyæ na moje poparcie.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Postaram siê go odnaleŸæ."				,DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"A co mi przyjdzie z twojego poparcia?"	,DIA_STT_315_LostNek_Why);
	};
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //A co mi przyjdzie z twojego poparcia?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Jeœli chcesz do³¹czyæ do naszego Obozu, musisz zjednaæ sobie poparcie kilku wp³ywowych ludzi.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Gdybym szepn¹³ o tobie dobre s³owo, Diego spojrza³by na ciebie o wiele przychylniej.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Postaram siê go odnaleŸæ.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jakbyœ spotka³ Fletchera, mo¿esz go zapytaæ o Neka. Fletcher przej¹³ jego rewir po tym ca³ym tajemniczym znikniêciu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Gdzie znajdê Fletchera?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Zwykle patroluje teren wokó³ areny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Niejaki Z³y obieca³ mi wstawiennictwo u Diego, jeœli znajdê Neka. Zachodzi podejrzenie, ¿e Stra¿nik zbieg³ do Nowego Obozu. Mam zapytaæ o niego Fletchera. Znajdê go w pobli¿u areny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Niejaki Z³y poprosi³ mnie o znalezienie Neka. Zachodzi podejrzenie, ¿e Stra¿nik zbieg³ do Nowego Obozu. Mam zapytaæ o niego Fletchera. Znajdê go w pobli¿u areny.");
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
	description		= "Znalaz³em Neka.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Znalaz³em Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //To œwietnie! A masz na to jakieœ dowody?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nie, obawiam siê, ¿e nie."					,DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Znalaz³em przy nim ten amulet. Proszê, oto on."	,DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Znalaz³em przy nim ten amulet. Proszê, oto on.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //W³aœnie o ten amulet mi chodzi³o. M¹dry z ciebie ch³opak.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Za³o¿ê siê, ¿e kusi³o ciê, ¿eby zachowaæ ten amulet dla siebie, co? Spokojnie, dokona³eœ m¹drego wyboru.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jakby Diego pyta³ o ciebie, opowiem siê za tob¹.
	};
	Sly_LostNek = LOG_SUCCESS;
	DIA_FindNekSnaf_OFF = false;
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek, "Da³em Z³emu amulet Neka. Nie móg³ siê nadziwiæ mojej uczciwoœci.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC, "Da³em Z³emu amulet Neka, zyskuj¹c tym samym wa¿nego sprzymierzeñca.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC, "Da³em Z³emu amulet Neka. Szkoda tylko, ¿e nie mogê ju¿ zostaæ Cieniem.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nie, obawiam siê, ¿e nie.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Serio? Chyba nic przede mn¹ nie ukrywasz, co? Nek mia³ przy sobie taki dziwny amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nie lubiê jak ktoœ ukrywa przede mn¹ rzeczy, które nale¿¹ do mnie. Jakbyœ znalaz³ ten amulet, przynieœ go mi!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Postaram siê o tym pamiêtaæ, kiedy ju¿ znajdê ten amulet.
	
	B_LogEntry( CH1_LostNek, "Z³y chce dostaæ amulet Neka.");
	
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
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Œwietnie! Jeœli o mnie chodzi - Diego us³yszy, ¿e równy z ciebie goœæ!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Rêka rêkê myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Dok³adnie.
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
    AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_01"); //A wiêc chcia³eœ pozbyæ siê moich ludzi. Chyba siê za bardzo przeliczy³eœ. He he.
    AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_02"); //Wiem, ¿e pracujesz dla tej szui, Mordraga.
    if (Npc_KnowsInfo (hero, DIA_THORUS_ZDRADA))
    {
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_03"); //Mia³em daæ ci drug¹ szansê, ale wkopa³eœ te¿ Œwistaka. Nie licz, ¿e bêdziesz mia³ teraz ³atwe ¿ycie w Obozie.
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_04"); //Ju¿ ja o to zadbam.
    }
    else
    {
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_05"); //Pos³uchaj. Dam ci drug¹ szansê. Jesteœ tu nowy. Wpad³eœ w z³e towarzystwo. Rozumiem to.
        AI_Output (self, other ,"DIA_Sly_FAIL_SIPACZE_03_06"); //IdŸ do Œwistaka i powiedz mu o planach Mordraga. Potem pogadamy znowu.
    };
	B_LogEntry      	(CH1_NewsFromSpy,"Cholera. Przepad³o! Mog³em lepiej przygotowaæ siê do walki z siepaczami Z³ego. Teraz mam nó¿ na gardle. Albo przy³¹czê siê do Starego Obozu i zrobiê co Cienie mi ka¿¹, albo bêdê musia³ szukaæ innego sposobu na przy³¹czenie siê do Bandytów. Je¿eli nawet chcia³bym teraz zaatakowaæ siepaczy, to muszê pamiêtaæ, ¿e s¹ mieszkañcami Obozu. Inni Stra¿nicy natychmiast im pomog¹. Nawet gdybym da³ sobie radê, to zabójstwo w bia³y dzieñ nie jest za dobrym pomys³em.");  
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
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_00"); //Mordrag sporo o tobie wie. Miêdzy innymi to, ¿e zabi³eœ Neka, a Œwistak okrad³ Magnatów.
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_01"); //Jak œmiesz!
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_02"); //Spokojnie! Jestem po waszej stronie. Œwistak ju¿ o wszystkim wie. Kaza³ nam rozprawiæ siê z Mordragiem.
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_03"); //Chcesz siê dostaæ do Obozu, tak? Wiêc to ty go zabijesz. Thorus bêdzie z ciebie zadowolony.
	AI_Output (other, self,"DIA_STT_315_Sly_ZdradaMordraga_15_04"); //On te¿ nie przepada za Mordragiem?
	AI_Output (self, other,"DIA_STT_315_Sly_ZdradaMordraga_10_05"); //Widzê, ¿e szybko siê uczysz. WeŸ ten miecz i miksturê. Przydadz¹ ci siê w walce. 
	Thorus_MordragKo = LOG_RUNNING;
	zlecil_Thorus = false;
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Z³y chce ¿ebym zabi³ Mordraga. Dziêki temu zyskam jego zaufanie. Pozosta³ymi Cieniami zajmie siê Œwistak.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);
	B_LogEntry                     (CH1_KosztemQuentina,"Mam zabiæ Mordraga. Z³y zadba³ o mój ekwipunek.");
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
	description		= "Pozby³em siê Mordraga.";
	
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
	AI_Output (other, self,"DIA_STT_315_Sly_Sukces_15_00"); //Pozby³em siê Mordraga.
	if MordragKO_HauAb == TRUE
	{
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_01"); //Œwietna robota. Jednak wola³bym ¿ebyœ go zabi³.
	B_GiveXP (150);
	} else {
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_02"); //Nie ¿yje?! Œwietnie. 
	B_GiveXP (200);
	};
	AI_Output (other, self,"DIA_STT_315_Sly_Sukces_15_03"); //Co teraz?
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_10_04"); //Razem ze Œwistakiem gadaliœmy z ró¿nymi osobami w Obozie. Mo¿esz ju¿ iœæ i pogadaæ z Diego.
	AI_Output (self, other,"DIA_STT_315_Sly_Sukces_15_05"); //A, i zajrzyj uprzednio do Œwistaka i Thorusa.
	Thorus_MordragKo = LOG_SUCCESS;
	B_LogEntry			(CH1_MordragKO,"Zabi³em Mordraga. Z³y by³ bardzo zadowolony.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry                     (CH1_KosztemQuentina,"Plan siê uda³. Zanim pójdê do Diego, muszê pogadaæ ze Œwistakiem i Thorusem.");
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
    AI_Output (other, self ,"DIA_Sly_LOCHY_15_02"); //A tak siê rozgl¹dam.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_03"); //Wynoœ siê st¹d, ty sukinsynu! Przez ciebie bêdê tu gni³ przez d³ugi czas.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_04"); //Zabi³eœ moich ludzi i wyda³eœ mnie Thorusowi! Jak tylko st¹d wyjdê - bêdziesz trupem!
    AI_Output (other, self ,"DIA_Sly_LOCHY_15_05"); //Lepiej nie mów mi takich rzeczy, chyba ¿e chcesz, abym zawo³a³ Stra¿ników.
    AI_Output (self, other ,"DIA_Sly_LOCHY_03_06"); //Arghhh... WON! 
    AI_StopProcessInfos	(self);
};

