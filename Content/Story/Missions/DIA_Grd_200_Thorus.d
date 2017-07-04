//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************
//	AI_TurnToNpc		(self, dusty);
//	AI_TurnToNpc		(dusty,other);
INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	&& (kapitel < 4)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Tylko ludzie Gomeza maj� prawo wst�pu.
};

// ************************************************************
// 					Ich will f�r Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Chc� pracowa� dla Gomeza.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chc� pracowa� dla Gomeza.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Czy�by? A czemu my�lisz, �e Gomez chcia�by, �eby kto� taki jak ty dla niego pracowa�?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego powiedzia�, �e to TY podejmujesz takie decyzje.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) ) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego powiedzia�, �e to TY podejmujesz takie decyzje.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Hmm... Je�li Diego uwa�a, �e jeste� w porz�dku, to czemu SAM si� tob� nie zajmie?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //S�uchaj uwa�nie: Diego podda ci� najpierw testowi. Je�li ON uzna, �e si� nadajesz, ja wpuszcz� ci� do zamku na spotkanie z Gomezem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //To, co b�dzie p�niej, zale�y ju� tylko od ciebie, jasne?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Porozmawiam z Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus poradzi� mi, bym porozmawia� z Diego. To on oceni, czy nadaj� si� na cz�onka Starego Obozu.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Dlaczego sam nie poddasz mnie pr�bie?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) ) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Dlaczego sam nie poddasz mnie pr�bie?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nie takie proste, ch�opcze. Nowy, kt�ry chce tu do czego� doj��, potrzebuje opiekuna.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Tym opiekunem musi by� jeden z ludzi Gomeza. I to w�a�nie on podda ci� pr�bie.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A je�li narobisz k�opot�w to on poniesie za nie odpowiedzialno��. Takie s� tutaj zasady.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Na pewno znajdzie si� dla mnie jakie� zadanie...";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) ) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Na pewno znajdzie si� dla mnie jakie� zadanie...
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nie. Rzeczy, kt�rymi zajmuj� si� Stra�nicy przerastaj� twoje mo�liwo�ci, ch�opcze.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Trzymaj si� polece� swojego opiekuna.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Potrafi� sprosta� ka�demu zadaniu, kt�re mi powierzysz.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) ) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Potrafi� sprosta� ka�demu zadaniu, kt�re mi powierzysz.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Och? A� tak ci zale�y na wpadce? Hmm. Jest jedna rzecz, kt�r� mo�e si� zaj�� wy��cznie cz�owiek nie b�d�cy w s�u�bie Gomeza.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale uprzedzam ci�: jak to schrzanisz, b�dziesz mia� nie lada k�opoty.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
var int HeroKnowWhereIsMordrag;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Jestem got�w.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) ) && ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jestem got�w.
	/*if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_01"); //Nie, nie jeste�. Zadajesz si� z Bandytami i masz czelno�� do mnie przychodzi�.
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_02"); //Wyno� si�, albo ci� zabij�.
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_03"); //Wybra�e� prac� w kopalni. R�k do pracy nigdy nie za wiele. Nie mog� ci powierzy� takiego zadania.
	}
	else
	{
	*/
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ci za chwil� powiem, musi pozosta� mi�dzy nami, rozumiemy si�?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasne.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Pewien cz�owiek z Nowego Obozu sprawia nam problemy. Nazywa si� Mordrag i przyw�aszczy� sobie kilka rzeczy nale��cych do Magnat�w.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Oczywi�cie to samo mo�na powiedzie� o wielu Szkodnikach z Nowego Obozu, ale Mordrag ma czelno�� zjawia� si� w NASZYM Obozie i odsprzedawa� NASZE rzeczy NASZYM ch�opcom!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //A to ju� za wiele. Niestety, �ajdak wie, �e nie mog� z tym nic zrobi�.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Dlaczego?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Bo jest pod opiek� Mag�w.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer, "Zajm� si� tym." 							,Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Chcesz, �ebym go zabi�, tak?" 						,Info_Thorus_MordragKo_KillHim);
	if (HeroKnowWhereIsMordrag == FALSE)
	{
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Gdzie znajd� Mordraga?" 								,Info_Thorus_MordragKo_Where);
	};
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Dlaczego Magowie broni� Mordraga?"		,Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Widz�, �e masz troch� problem�w z Magami..."	,Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	zlecil_Thorus = true;
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus poprosi� mnie, bym usun�� z Obozu Szkodnika imieniem Mordrag. Nie interesuje go jak tego dokonam, byleby tylko nikt si� nie dowiedzia�, �e on macza� w tym palce.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	};
//};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Zajm� si� tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chcesz, �ebym go zabi�, tak?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chc� mie� pewno��, �e ju� nigdy wi�cej si� tu nie pojawi. Jak to osi�gniesz - to ju� twoja sprawa.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Gdzie znajd� Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Kr�ci si� przy po�udniowej bramie, po przeciwnej stronie zamku, tu� za wej�ciem. Sukinsyn boi si� pojawia� bli�ej centrum.
	B_LogEntry(CH1_MordragKO, "Mordrag urz�duje przy po�udniowej bramie, za zamkiem.");
	HeroKnowWhereIsMordrag = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Dlaczego Magowie broni� Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Bo s�u�y im za pos�a�ca. Nasi magowie utrzymuj� kontakty z czarodziejami z Nowego Obozu. Cz�sto wymieniaj� informacje za po�rednictwem go�c�w.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Podejrzewam, �e nie�le si� wkurz� na wie��, �e co� przydarzy�o si� ich kurierowi.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co ze mn�? Co Magowie mog� mi zrobi�?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jeste� tu nowy, nic ci nie b�dzie. Ale ja odpowiadam za wszystko, co robi� moi ludzie. Dlatego musisz trzyma� j�zyk za z�bami.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Widz�, �e masz troch� problem�w z Magami...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Tak. I to problem�w, kt�re nie �atwo rozwi�za�. Kilka lat temu jeden z Cieni pr�bowa� zasztyletowa� we �nie Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Faceta znaleziono potem w Zewn�trznym Pier�cieniu. Je�li chodzi o �cis�o�� - rozsmarowanego PO CA�YM Zewn�trznym Pier�cieniu.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "Wracaj�c do Mordraga...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) ) && (zlecil_Thorus == true) && ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze, "Zajm� si� tym." 	,Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze, "Gdzie znajd� Mordraga?" 	,Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Mordrag ju� nigdy nikogo nie okradnie!" ,Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Facet ju� nigdy si� tu nie poka�e!" ,Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Zajm� si� tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag ju� nigdy nikogo nie okradnie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Chcesz powiedzie�, �e go pokona�e�? Nie�le, ch�opcze.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO, "Thorus jest mi wdzi�czny za usuni�cie Mordraga. Zyska�em wp�ywowego przyjaciela.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Facet ju� nigdy si� tu nie poka�e!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Wola�bym, �eby� go zabi�.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO, "Thorus ucieszy� si�, �e Mordraga nie ma ju� w Obozie.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ty ofiaro! Kaza�em ci TRZYMA� J�ZYK ZA Z�BAMI!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Spartaczy�e� spraw�! Zapomnij o wszystkim, co ci powiedzia�em. Nie pr�buj ju� nic wi�cej zdzia�a� w tej sprawie!
			
	Thorus_MordragKo = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Zadanie od Thorusa! ", 1,-1,"font_new_10_red.tga",2);	
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO, "Thorusowi nie spodoba�o si�, �e wspomnia�em o nim Mordragowi. Lepiej b�dzie nie pokazywa� mu si� teraz na oczy.");
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_Sukces234 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Sukces234_Condition;
	information	= Info_Thorus_Sukces234_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_Sukces234_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_STT_315_Sly_Sukces)) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Sukces234_Info()
{
	AI_Output (self, other,"Info_Thorus_Sukces234_09_00"); //S�ysza�em, �e pozby�e� si� Mordraga. Jestem pod wra�eniem. Chcesz, do��czy� do Obozu, tak?
	AI_Output (self, other,"Info_Thorus_Sukces234_09_01"); //Nie powiniene� mie� z tym najmniejszych problem�w. 
	talk_aboutOpinion_OC = true;	
	B_giveXP (100);
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WEJSCIE_BAU
//========================================
//off odsy�am do DIA_Thorus_BANDYTA_GATE
INSTANCE DIA_THORUS_WEJSCIE_BAU (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_WEJSCIE_BAU_Condition;
   information  = DIA_THORUS_WEJSCIE_BAU_Info;
   permanent	= FALSE;
   description	= "Chcia�bym dosta� si� do zamku.";
};

FUNC INT DIA_THORUS_WEJSCIE_BAU_Condition()
{
    if (Npc_GetTrueGuild (other)==GIL_BAU) && (!Npc_KnowsInfo(hero,Info_Thorus_BribeGuard)) && (KAPITEL == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_WEJSCIE_BAU_Info()
{
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_BAU_15_01"); //Chcia�bym dosta� si� do zamku.
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_02"); //Chyba �artujesz, pr�dzej do zamku wpu�ci�bym Wrzoda. Nosisz pancerz jednego z tych sukinsyn�w, kt�rzy atakuj� nasze konwoje. Zapomnij o tym. 
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_03"); //Nie wiem czy jeste� w bandzie Quentina, ale widz�, �e masz z nim jaki� kontakt. Nie chc� mie� z tob� nic wsp�lnego.
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_BAU_15_04"); //A mo�e ruda za�atwi spraw�?
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_05"); //(spogl�da)
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Czy za odpowiedni� sumk� m�g�by� mnie wpu�ci� do zamku?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) ) && (Npc_GetTrueGuild (other)!=GIL_VLK) && (Kapitel <= 2) && (wache212.aivar[AIV_PASSGATE] == false) && (wache213.aivar[AIV_PASSGATE] == false)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Czy za odpowiedni� sumk� m�g�by� mnie wpu�ci� do zamku?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za odpowiedni� sumk�... 
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Ile?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //No c� - liczenie rudy musi potrwa� odpowiednio d�ugo. Do�� d�ugo, �eby ca�kowicie poch�on�� uwag� moj� i moich ch�opc�w. Korzystaj�c z naszej nieuwagi, m�g�by� przemkn�� si� do �rodka...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Czyli ile konkretnie?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //My�l�, �e przeliczenie 1000 bry�ek zajmie nam wystarczaj�co du�o czasu.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 bry�ek?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //C�, gdyby� do��czy� do Gomeza, m�g�by� wej�� do zamku za darmo.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard)) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) && (Npc_GetTrueGuild (other)!=GIL_VLK) && (Kapitel <= 2) 
	&& (wache212.aivar[AIV_PASSGATE] == false) && (wache213.aivar[AIV_PASSGATE] == false)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porz�dku, id�. Tylko jak ju� b�dziesz w �rodku, nie wywi� czego� g�upiego, dobra?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		Info_Thorus_Give1000Ore.permanent = 0;
	if (Npc_GetTrueGuild (other)==GIL_BAU)
    {
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_SUCCESS);
	B_LogEntry			(CH1_CastleEntranceBandit,"C�... zap�aci�em Thorusowi 1000 bry�ek rudy. Innego wyj�cia nie by�o.");
	};
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Pr�bujesz mnie okpi�, ch�opcze? Nie masz 1000 bry�ek rudy!
	};
};
	//========================================
//-----------------> WEJSCIE_RING_FIRE
//========================================

INSTANCE DIA_THORUS_WEJSCIE_RING_FIRE (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_WEJSCIE_RING_FIRE_Condition;
   information  = DIA_THORUS_WEJSCIE_RING_FIRE_Info;
   permanent	= FALSE;
   description	= "Masz mnie wpu�ci�. Mam tu pier�cie� ognia.";
};

FUNC INT DIA_THORUS_WEJSCIE_RING_FIRE_Condition()
{
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
    if (Npc_HasItems (other, It_FireRing) >=1)
    && (hero.guild == GIL_NONE)
	&& (kapitel < 4)
	&& (wache212.aivar[AIV_PASSGATE] == false) 
	&& (wache213.aivar[AIV_PASSGATE] == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_WEJSCIE_RING_FIRE_Info()
{
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_RING_FIRE_15_01"); //Masz mnie wpu�ci�. Mam tu pier�cie� ognia.
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_RING_FIRE_03_02"); //Kolejny s�ugus Mag�w... W�a�!
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
    AI_StopProcessInfos	(self);
};

	
// ************************************************************
// 					Brief f�r Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 0;
	description = "Musz� si� dosta� do zamku. Mam list do Arcymistrza Mag�w Ognia.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Musz� si� dosta� do zamku. Mam list do Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //I my�lisz, �e wpuszcz� ci� tak po prostu do �rodka, �eby� odda� list i zgarn�� nagrod�?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobra, poka� ten list.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nie ma mowy. Zapomnij o tym!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //W porz�dku. Ju� zapomnia�em.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Thorus nie chce wpu�ci� mnie do zamku, bym odda� list Magom. Wydaje mi si�, �e powinienem do��czy� do kt�rego� z oboz�w.");
	};
};

// ************************************************************
// 					Bereit f�r Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego powiedzia�, �e jestem ju� got�w, by spotka� si� z Gomezem.";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego powiedzia�, �e jestem ju� got�w, by spotka� si� z Gomezem.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //To ja o tym zadecyduj�!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //I co zdecydowa�e�?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Musz� przyzna�, �e ca�kiem nie�le sobie poradzi�e�.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Niech b�dzie! Mo�esz stan�� przed Gomezem. On podejmie ostateczn� decyzj� co do twojego przyj�cia.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od tej pory musisz radzi� sobie sam, ch�opcze.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Mam tu parti� bagiennego ziela dla Gomeza, od Cor Kaloma.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mam tu parti� bagiennego ziela dla Gomeza, od Cor Kaloma.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Poka�!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //W porz�dku, mo�esz i��. Udaj si� prosto do siedziby Magnat�w i porozmawiaj z Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Jak na pos�a�ca masz przy sobie troch� za ma�o ziela! Mam nadziej�, �e nie sprzeda�e� go komu� innemu! Wr��, jak b�dziesz mia� ca�� parti�.
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Jestem pos�a�cem Mag�w Wody. Musz� si� dosta� do zamku.";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE)  && (kapitel < 4)
		&& (wache212.aivar[AIV_PASSGATE] == false) 
		&& (wache213.aivar[AIV_PASSGATE] == false) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jestem pos�a�cem Mag�w Wody. Musz� si� dosta� do zamku.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Masz przy sobie amulet kuriera. Stra�nicy nie b�d� ci� zatrzymywali.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Nie chc� mie� nic wsp�lnego z magami! Przesta� mi wreszcie zawraca� g�ow�, dobrze?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //No jaaasne... A amulet pewnie zgubi�e�, co? Albo ci ukradli, h�?
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************

// ************************************************************
/*
INSTANCE Info_Thorus_BAU_ENTER (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_BAU_ENTER_Condition;
	information	= Info_Thorus_BAU_ENTER_Info;
	permanent	= 0;
	description = "Jestem Bandyt� i mam poselstwo dla Mag�w Ognia!";
};                       

FUNC INT Info_Thorus_BAU_ENTER_Condition()
{	
	if 	(Npc_GetTrueGuild(other) == GIL_BAU)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BAU_ENTER_Info()
{
	AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_00"); //Jestem Bandyt� i mam poselstwo dla Mag�w Ognia!
		AI_Output (self, other,"Info_Thorus_BAU_ENTER_09_01"); //Bandyta pos�a�cem? Od kogo to poselstwo?!
		AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_02"); //Otrzyma�em je od jakiego� Maga, zanim mnie tu wrzucono.
		AI_Output (self, other,"Info_Thorus_BAU_ENTER_09_03"); //Nie chc� mie� nic wsp�lnego z Magami! Przechod�, ale jak us�ysz� o tobie chocia� jedno z�e s�owo...
		AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_04"); //Rozumiem. Nie b�d� sprawia� k�opot�w.
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
};
*/
// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Uda�o mi si�. Zosta�em przyj�ty do Obozu!";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Uda�o mi si�. Zosta�em przyj�ty do Obozu!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluj�, ch�opcze. Dobrze ci radz�, trzymaj si� blisko Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Do Gomeza lub Kruka id�, tylko je�li masz co� NAPRAWD� wa�nego do powiedzenia.
};	

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_Thorus_BloodwynsOrder (C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 4;
	condition	= DIA_Thorus_BloodwynsOrder_Condition;
	information	= DIA_Thorus_BloodwynsOrder_Info;
	permanent	= 0;
	description = "Chyba powiniene� zobaczy� pewne pismo.";
};                       

FUNC int DIA_Thorus_BloodwynsOrder_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_FoundOrderFromBloodwyn) && Npc_HasItems(other, ItMi_Bloodwyns_Order))
	{
		return 1;
	};
};

FUNC VOID DIA_Thorus_BloodwynsOrder_Info()
{
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_00"); //Chyba powiniene� zobaczy� pewne pismo.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_01"); //Jakie pismo. O co chodzi?
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_02"); //Od jakiego� czasu Bloodwyn wyrz�dza� szkody jednemu z naszych Nowicjuszy � Baalowi Parvezowi.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_03"); //Nasy�a� na niego ludzi, kt�rzy uniemo�liwiali mu prowadzenie nauk, niszczyli dobytek, podrzucali pisma z pogr�kami.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_04"); //Niby czemu to robi�?
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_05"); //Nie podoba�o mu si�, �e niekt�rzy Kopacze odchodzili do Bractwa. Traci� w ten spos�b wp�ywy z podatk�w od bezpiecze�stwa.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_06"); //Dlatego postanowi� pozby� si� Parveza ze Starego Obozu.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_07"); //Poka� to pismo.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_08"); //Prosz�.
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_09"); //Zdumiewaj�ce. Nie spodziewa�em si�, �e Bloodwyn umie pisa�. Ca�kiem nie�le mu to idzie... Hmmm... 
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_11"); //Skup si�. Lepiej z nim pogadaj, bo inaczej relacje pomi�dzy naszymi obozami si� popsuj�, a Magnaci obwini� za wszystko ciebie. 
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_12"); //Ty ju� si� o moj� sk�r� nie martw. Za�atwi� to i wasz cz�owiek b�dzie bezpieczny. 
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_12"); //Miejmy nadzieje.
	
	B_LogEntry	(CH1_ParvezInTroubles, "Thorus obieca� zaj�� si� spraw� i pogada� z Bloodwynem.");
	
	B_GiveInvItems (other, self, ItMi_Bloodwyns_Order,1);
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Jak si� masz?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak si� masz?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Nowy Ob�z nie sprawia nam zbyt wielu k�opot�w. Bardziej martwi� mnie te �wiry z Sekty.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//========================================
//-----------------> MAG_OGNIA_NOV
//========================================

INSTANCE DIA_Thorus_MAG_OGNIA_NOV (C_INFO)
{
   npc          = GRD_200_Thorus;
   nr           = 1;
   condition    = DIA_Thorus_MAG_OGNIA_NOV_Condition;
   information  = DIA_Thorus_MAG_OGNIA_NOV_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Thorus_MAG_OGNIA_NOV_Condition()
{
if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
&& (Npc_GetTrueGuild (hero ) == GIL_STT)
&& (Npc_KnowsInfo (hero, DIA_Torrez_Gomez_success))    {
    return TRUE;
    };
};


FUNC VOID DIA_Thorus_MAG_OGNIA_NOV_Info()
{
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_01"); //Zaczekaj. To czego dokona�e� w kopalni by�o naprawd� niesamowite.
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_02"); //Jestem pe�en uznania. Ch�tnie widzia�bym ci� w szeregach Stra�nik�w, ale wiem, �e wewn�trz chcesz czego� innego.
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_03"); //Powiniene� porozmawia� z Corristo.
    AI_StopProcessInfos	(self);
};


//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia�e� mi co� powiedzie�?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	&& (!Npc_KnowsInfo (hero, DIA_Torrez_Gomez_success))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chcia�e� mi co� powiedzie�?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Tak. To, co pokaza�e� w kopalni, �wiadczy nie tylko o twojej odwadze, ale r�wnie� o niepospolitej sile i umiej�tno�ciach.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Ch�tnie bym ci� widzia� w szeregach stra�y.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale zanim to nast�pi musisz jeszcze troch� popracowa� nad swoimi umiej�tno�ciami. Tylko najlepsi mog� zosta� Stra�nikami.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Daj� ci niepowtarzaln� szans�. Co ty na to?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Chc� zosta� Stra�nikiem!"; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chc� zosta� Stra�nikiem!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Mi�o mi to s�ysze�, ale najpierw musz� ci powiedzie� to, co m�wi� wszystkim nowym rekrutom. S�uchaj uwa�nie, bo nie b�d� si� powtarza�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Do tej pory �y�e� na w�asny rachunek, ale to si� od dzi� zmieni. Moi ludzie trzymaj� si� razem. Do Stra�nik�w nale�y dbanie o bezpiecze�stwo Magnat�w, rudy, obozu i kopalni.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Ruda wydobywana jest przez Kopaczy, ale to my pilnujemy, �eby nie po�ar�y ich pe�zacze. Pertraktacje z kr�lem prowadz� Magnaci, ale to my dbamy o ich bezpiecze�stwo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Dniem i noc� strze�emy korytarzy kopalni. Dniem i noc� pilnujemy bram Obozu i pozwalamy jego mieszka�com wie�� spokojne �ycie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Na pocz�tku byli�my tylko bez�adn� zgraj�, ale stali�my si� si��, z kt�r� ka�dy musi si� liczy�. Ci�ko pracowali�my, by zas�u�y� na t� reputacj�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od moich ludzi oczekuj� wi�c wy��cznie jednego: lojalno�ci. Tylko stoj�c rami� w rami� b�dziemy w stanie obroni� to, co nale�y do nas...
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //...i przetrwa�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Pozosta�ych rzeczy dowiesz si� w swoim czasie. B�d� got�w do pomocy ka�demu, kto jej potrzebuje, niewa�ne jak trudne i niebezpieczne to zadanie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Id� do Stone'a i popro� go o zbroj� i miecz.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Znajdziesz go w ku�ni, w Wewn�trznym Pier�cieniu.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	//HeroJoinToOC ();
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //A, i jeszcze co�...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Witamy w Stra�y...
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,	"Dzi� Thorus przyj�� mnie w poczet Stra�nik�w. Mog� teraz odebra� nale�ny mi pancerz. Dostan� go od Stone'a, w zamku.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Interesuje mnie �cie�ka magii..."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Interesuje mnie �cie�ka magii...
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //W takim razie powiniene� porozmawia� z Corristo. To on uczy� Miltena. Chyba nie powinno by� �adnych przeciwwskaza�.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mog� ci pom�c w rozwini�ciu twojej zr�czno�ci i si�y.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus pomo�e mi popracowa� nad moj� si�� i zr�czno�ci�.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  GRD_200_Thorus_TEACH_2H (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_TEACH_2H_Condition;
	information		= GRD_200_Thorus_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy�?"; 
};
//
FUNC int  GRD_200_Thorus_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  GRD_200_Thorus_TEACH_2H_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"GRD_200_Thorus_TEACH_2H_Info_09_02"); //Szkol� tylko i wy��cznie cz�onk�w naszego Obozu. Wol� ju� uczy� macha� kilofem byle Kopacza ni� jakiego� wyrzutka. 

	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko zostan� cz�onkiem Starego Obozu.");
		log_thorusfight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  GRD_200_Thorus_TEACH_2H_START (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_TEACH_2H_START_Condition;
	information		= GRD_200_Thorus_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  GRD_200_Thorus_TEACH_2H_START_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_TEACH_2H))
	&& ((Npc_GetTrueGuild    (hero) == GIL_GRD) || (Npc_GetTrueGuild    (hero) == GIL_STT) || (Npc_GetTrueGuild    (hero) == GIL_VLK))
	{
	return TRUE;
	};
};

FUNC void  GRD_200_Thorus_TEACH_2H_START_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"GRD_200_Thorus_TEACH_2H_START_Info_09_02"); //No dobra.

Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

func void GRD_200_Thorus_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	var int ilosc;
	ilosc = Npc_hasitems (self, itminugget);
	Npc_RemoveInvItems (self, itminugget, ilosc);
};

FUNC VOID Thorus_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_00"); //Chcia�bym nauczy� si� walki dwur�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_01"); //Bronie dwur�czne wymagaj� sporo si�y. S� ci�kie, a przez to tak�e wolniejsze.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_02"); //Zmieni si� to jednak w trakcie czynienia przez ciebie post�p�w w nauce.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_03"); //Za powolno�� bronie dwur�czne odwdzi�cz� ci si� pot�nymi obra�eniami.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_04"); //Ka�d� bro� musisz odpowiednio wyczu�. Topory s� inaczej zbalansowane ni� miecze. Pami�taj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_06"); //Musisz pracowa� nad swoj� si��. Pozwoli ci ona wykonywa� szybsze ruchy i podnosi� coraz ci�sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_07"); //P�niej b�dziesz musia� pozna� odpowiedni� technik� walki i ��cznia cios�w. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_08"); //Na razie nie jeste� wstanie zada� pe�nych obra�e� na jakie pozwala ci dana bro�. Spokojnie, zajmiemy si� tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwur�cznych broni?
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_11"); //S� d�ugie... Im d�u�sze tym dalej od siebie mo�esz trzyma� przeciwnika. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_12"); //Gdy kupujesz bro� zwracaj uwag� na jej g�rn� cz��. Je�li jest wystarczaj�co ostra to nawet dra�ni�cie oponenta z daleka zada mu obra�enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_14"); //Nie, nie, nie. Om�wimy to na nast�pnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy�em ci� jak porz�dnie trzyma� bro� i jak wykorzysta� si�� bezw�adno�ci ostrza.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_16"); //Pami�taj, �e im lepiej wyczujesz balans broni tym �atwiej b�dzie ci ��czy� kolejne ciosy.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_17"); //Musisz wiedzie�, w kt�rym momencie ponownie si� zamachn��, tak by wykorzysta� przy tym impet pierwszego uderzenia. Pozwoli ci to oszcz�dzi� si�y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_18"); //Stosuj r�ne strategie walki. Uderzaj raz z przodu, raz z boku. A p�niej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_19"); //Uniki z dwur�cznym mieczem w r�ku faktycznie mog� by� trudne, dlatego musisz parowa� ciosy. �wicz si�� mi�ni r�k, plec�w i klatki piersiowej. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowa�, bez ryzyka po�amania sobie czego�. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_26"); //To ju� nasza ostatnia lekcja. Poka�� ci sztuczki, kt�re pozwol� ci jeszcze lepiej wyczu� bro�.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_27"); //Musisz nauczy� si� rozpoznawa� s�abe punkty przeciwnik�w i skupia� si� na nich.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Thorus_teach_2h10);
	};
};
/*
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if //(Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2) //to trzeba usun�� && 
	(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& ((Npc_GetTrueGuild    (hero) == GIL_GRD) || (Npc_GetTrueGuild    (hero) == GIL_STT) || (Npc_GetTrueGuild    (hero) == GIL_VLK))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chcia�bym nauczy� si� pos�ugiwa� dwur�cznym mieczem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy si� podstawami.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"GRD_200_Thorus_NO_ENOUGHT_STR_1"); //Musisz jeszcze sporo po�wiczy� zanim nauczysz si� dobrze walczy�!
	PrintScreen	("Warunek: Si�a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o walce dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
	}
	else
	{
	AI_Output			(self,other,"GRD_200_Thorus_NO_ENOUGHT_STR_1"); //Musisz jeszcze sporo po�wiczy� zanim nauczysz si� dobrze walczy�!
	PrintScreen	("Warunek: Si�a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
*/
//========================================
//-----------------> ZDRADA
//========================================

INSTANCE DIA_THORUS_ZDRADA (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 50;
   condition    = DIA_THORUS_ZDRADA_Condition;
   information  = DIA_THORUS_ZDRADA_Info;
   permanent	= FALSE;
   description	= "�wistak okaza� si� by� zdrajc�!";
};

FUNC INT DIA_THORUS_ZDRADA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_DOWODY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_ZDRADA_Info()
{
    AI_Output (other, self ,"DIA_THORUS_ZDRADA_15_01"); //�wistak okaza� si� by� zdrajc�!
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_02"); //Tak, s�ysza�em ju� o tym.
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_03"); //Przebrzyd�y sukinsyn. Nie wyp�aci si� do ko�ca �ycia!
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_04"); //Ale tobie chyba nale�y si� jaka� nagroda. We� t� rud�.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
};

//========================================
//-----------------> DEDLIGO
//========================================

INSTANCE DIA_THORUS_DEDLIGO (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 51;
   condition    = DIA_THORUS_DEDLIGO_Condition;
   information  = DIA_THORUS_DEDLIGO_Info;
   permanent	= FALSE;
   description	= "Z�y zabi� Neka!";
};

FUNC INT DIA_THORUS_DEDLIGO_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_DEDLIGO_Info()
{
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_01"); //Z�y zabi� Neka!
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_02"); //Doprawdy?
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_03"); //A masz na to dowody?
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_04"); //Tak. Skaza m�wi�...
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_05"); //Ha ha! Skaza m�wi�... Ten �mierdz�cy Szkodnik? 
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_06"); //Ch�opcze, wiesz gdzie ja mam to, co Skaza m�wi�?
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_07"); //W dupie?
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_08"); //Dok�adnie. Mam do�� tego z�odzieja i tego, �e wszystko uchodzi mu na sucho.
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_09"); //Znajd� mi prawdziwe dowody lub co najmniej trzech �wiadk�w i wtedy przyjd�.
    B_LogEntry                     (CH1_SpysProblems,"Thorus nie wierzy w s�owa Skazy. Musz� znale�� �wiadk�w lub jakie� dowody.");
};
//========================================
//-----------------> ICHTROJE
//========================================

INSTANCE DIA_THORUS_ICHTROJE (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 52;
   condition    = DIA_THORUS_ICHTROJE_Condition;
   information  = DIA_THORUS_ICHTROJE_Info;
   permanent	= FALSE;
   description	= "Mam trzech �wiadk�w.";
};

FUNC INT DIA_THORUS_ICHTROJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_DEDLIGO))
    && (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Jesse_OKKKKKKK))
    && (Npc_KnowsInfo (hero, DIA_Tippler_OKQUEST))
    && (Npc_KnowsInfo (hero, DIA_Kyle_ZABICI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_ICHTROJE_Info()
{
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_01"); //Mam trzech �wiadk�w.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_02"); //Co?!
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_03"); //Kto� tu chyba za bardzo wierzy w swoich ludzi.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_04"); //A ja przecie� m�wi�em, �e co� jest na rzeczy.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_05"); //Nie denerwuj mnie!
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_06"); //No chod�. Jesse, Kyle i Tippler chc� z tob� porozmawia�.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_07"); //Dobra, wierz� ci.
	AI_TurnAway (GRD_200_Thorus,other);
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_08"); //Ch�opcy! Wiecie, co robi�. Zaj�� si� nim.
	AI_TurnToNpc(GRD_200_Thorus,hero);
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_09"); //Jestem zawiedziony. Ufa�em Z�emu. 
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_10"); //Obawiam si� o rekrutacje w Obozie. Musz� porozmawia� z Diego.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_11"); //Jednak w dalszym ci�gu uwa�am, �e Skaza to z�odziej.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_12"); //Porozmawiajmy o moim wynagrodzeniu.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_13"); //Zapomnij. Nic ci nie kaza�em.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_14"); //Szkoda. To ja ju� sobie p�jd�.
    B_LogEntry                     (CH1_SpysProblems,"Gdy Thorus dowiedzia� si� o machlojkach Z�ego, natychmiast rozkaza� zamkn�� go w lochach. Skaza b�dzie bardzo zadowolony z takiego obrotu spraw.");
	
	AI_Teleport                    (STT_315_Sly,"SLY_CELL"); 
	Npc_ExchangeRoutine (STT_315_Sly, "paka"); 
	B_ChangeGuild    (STT_315_Sly,GIL_NONE); 
	AI_UnequipArmor  (STT_315_Sly);
	//rozbrojenie
	if (Npc_HasItems (STT_315_Sly, ItMw_1H_Sword_Short_02) >=1)
    {
	Npc_RemoveInvItems (STT_315_Sly, ItMw_1H_Sword_Short_02, 1);
	};
	if (Npc_HasItems (STT_315_Sly, ItRw_Bow_Small_04) >=1)
    {
	Npc_RemoveInvItems (STT_315_Sly, ItRw_Bow_Small_04, 1);
	};
	B_GiveXP (100);
};


//========================================
//-----------------> QuestGRD1
//========================================

INSTANCE DIA_THORUS_QuestGRD1 (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_QuestGRD1_Condition;
   information  = DIA_THORUS_QuestGRD1_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� zadanie?";
};

FUNC INT DIA_THORUS_QuestGRD1_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_GRD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_QuestGRD1_Info()
{
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_01"); //Masz dla mnie jakie� zadanie?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_02"); //Co� ma�ego na pewno si� znajdzie.
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_03"); //W czym rzecz?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_04"); //Dawno nie widzia�em tu nikogo nowego, �adnej nowej twarzy. Skaza�cy widocznie nas omijaj�.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_05"); //Uciekaj� do innych oboz�w, a przecie� tu maj� prac�, jedzenie i inne wygody...
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_06"); //Jak tak dalej p�jdzie to nied�ugo braknie nam g�rnik�w w kopalni. 
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_07"); //Jak temu zaradzi�?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_08"); //Przypuszczam, �e na placu wymian dzieje si� co� z�ego. 
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_09"); //TO BULLIT!
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_10"); //Bullit? Niby dlaczego?
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_11"); //Gdy zrzucono mnie za Barier�, dosta�em od niego porz�dnie w pysk.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_12"); //hmm, doprawdy? My�la�em, �e spad�e� z konia. He he...
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_13"); //Darujmy sobie docinki...
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_14"); //W porz�dku. Tak tylko �artowa�em.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_15"); //Mo�e i Bullit macza w tym palce. B�d� musia� z nim pogada�, ale zanim to zrobi�...
	AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_16"); //Dzi� mieli zosta� zrzuceni nowi skaza�cy. Przyprowad� mi jednego. Je�li Bullit, kt�rego� z nich odstraszy�, to niech mi o tym powie.
	
    MIS_BullitBadass = LOG_RUNNING;
	
    Log_CreateTopic         (CH2_BullitBadass, LOG_MISSION);
    Log_SetTopicStatus      (CH2_BullitBadass, LOG_RUNNING);
    B_LogEntry              (CH2_BullitBadass,"Thorus kaza� mi odkry�, kt�ry z jego ludzi odstrasza nowych skaza�c�w. Jestem pewien, �e to wina Bullita. Musz� tylko znale�� na niego jakie� dowody. Dzi� na plac wymian maj� zosta� zrzuceni nowi skaza�cy. Je�eli kogo� tam spotkam, mam zadba�, aby przyby� do Starego Obozu.");
	
	Wld_InsertNpc				(NON_7046_Skazaniec,"OC1");	
	B_ExchangeRoutine	(GRD_203_Bullit, "meka");	
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Swadek
//========================================

INSTANCE DIA_THORUS_Swadek (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_Swadek_Condition;
   information  = DIA_THORUS_Swadek_Info;
   permanent	= FALSE;
   description	= "By�em na placu wymian.";
};

FUNC INT DIA_THORUS_Swadek_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_HELLO1))
    && (MIS_BullitBadass == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_Swadek_Info()
{
    AI_Output (other, self ,"DIA_THORUS_Swadek_15_01"); //By�em na placu wymian. Rozmawia�em z nowym skaza�cem.
    AI_Output (self, other ,"DIA_THORUS_Swadek_03_02"); //W�a�nie zauwa�y�em go w Obozie. Jakie� przemy�lenia?
    AI_Output (other, self ,"DIA_THORUS_Swadek_15_03"); //Powiniene� z nim pogada�. Ja zrobi�em, to co mia�em zrobi�.
    AI_Output (self, other ,"DIA_THORUS_Swadek_03_04"); //No dobra, zobaczymy co mi powie. Mo�esz ju� i��.

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
// DIALOG USUNI�TY =======================
//========================================
INSTANCE DIA_THORUS_HahahaSpierdalaj (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_HahahaSpierdalaj_Condition;
   information  = DIA_THORUS_HahahaSpierdalaj_Info;
   permanent	= FALSE;
   description	= "Bartholo pozwoli� mi rozmawia� z Gomezem.";
};

FUNC INT DIA_THORUS_HahahaSpierdalaj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_DOWODY)) && (Npc_GetTrueGuild(other) == GIL_NONE) && (Kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_HahahaSpierdalaj_Info()
{
    AI_Output (other, self ,"DIA_THORUS_HahahaSpierdalaj_15_01"); //Bartholo pozwoli� mi rozmawia� z Gomezem.
    AI_Output (self, other ,"DIA_THORUS_HahahaSpierdalaj_03_02"); //Widzia�em, �e o czym� z nim rozmawia�e�.
    AI_Output (self, other ,"DIA_THORUS_HahahaSpierdalaj_03_03"); //No dobrze. Skoro taka jest jego wola, to mo�esz wej��.
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;   
	MIS_KosztemQuentina = LOG_RUNNING;

    Log_CreateTopic            (CH1_KosztemQuentina, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KosztemQuentina, LOG_RUNNING);
    B_LogEntry                     (CH1_KosztemQuentina,"Zdecydowa�em si� porzuci� Bandyt�w i i�� prosto do Gomeza. Taka szansa ju� si� nie powt�rzy.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FlintFindPath
//========================================

INSTANCE DIA_THORUS_FlintFindPath (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_FlintFindPath_Condition;
   information  = DIA_THORUS_FlintFindPath_Info;
   permanent	= FALSE;
   description	= "Flint odnalaz� �cie�k� do Wolnej Kopalni.";
};

FUNC INT DIA_THORUS_FlintFindPath_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_InOC1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_FlintFindPath_Info()
{
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_01"); //Przysy�a mnie niejaki Flint. Mam ci przekaza� �e odnalaz� �cie�k� do Wolnej Kopalni.
	if (Npc_GetTrueGuild(hero) == GIL_SFB) || (Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_02"); //Uda�o ci si� go znale��?
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_03"); //Tak, troch� si� zagubi�, ale pomog�em mu uzupe�ni� brakuj�ce cz�ci uk�adanki.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_04"); //To �wietnie. Czuj�, �e informacje, kt�re wkr�tce przeka�e mi Flint mog� nam si� bardzo przyda�.
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_05"); //My�lisz o ataku na Woln� Kopalnie?
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_06"); //A o czym innym? Przecie� nie p�jdziemy t� �cie�k� do nich na herbatk�!
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_08"); //A co do ciebie: wykona�e� kawa� �wietnej roboty. Przyda nam si� kto� taki jak ty.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_09"); //Mam rozumie�, �e chcesz si� spotka� z Gomezem?
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_10"); //Jasne.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_11"); //W takim razie Stra�nicy przy bramie nie b�d� robi� ci problem�w.
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_12"); //Ach, i jeszcze jedno!
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_13"); //Tak?
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_14"); //Jak w og�le znalaz�e� Flinta?
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_15"); //Najemnik Okyl chcia� �ebym go zabi�. Ja jednak postanowi�em si� z nim dogada�.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_16"); //M�drze post�pi�e�. Zanim p�jdziesz do Gomeza wr�� do Okyla i powiedz mu, �e zabi�e� Flinta.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_17"); //Tylko pami�taj, �eby to zrobi�, ZANIM wst�pisz w szeregi Cieni.
	
    B_LogEntry                     (CH1_FlintsOffer,"Zgodnie z poleceniem Flinta Thorus dowiedzia� si� ode mnie o �cie�ce przez g�ry. Otrzyma�em wst�p na plac zamkowy. Zanim jednak p�jd� do Gomeza musz� wr�ci� do Okyla i powiedzie� mu, �e zabi�em Flinta. Wszystko po to, by st�umi� podejrzenia Najemnik�w.");

	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
    AI_StopProcessInfos	(self);

	// important
	CanTellToGomezAboutSecretPath = TRUE;
	Npc_SetTrueGuild (hero, GIL_NONE);
	hero.guild = GIL_NONE;
    MIS_SayOkylFlintDead = LOG_RUNNING;

    //Log_CreateTopic          (CH1_SayOkylFlintDead, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_RUNNING);
   // B_LogEntry               (CH1_SayOkylFlintDead,"Zanim do��cz� do Obozu, b�d� musia� powiedzie� Okylowi, �e Flint nie �yje. ");
    AI_StopProcessInfos	(self);
	}
	else 
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_19"); //Flint? Doprawdy? 
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_20"); //Tak, natkn��em si� na niego w okolicach Wolnej Kopalni. Postanowi�em mu pom�c wr�ci� do obozu. 
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_21"); //I uda�o mu si� czego� dowiedzie�?
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_22"); //Znalaz� ukryt� �cie�k� do Kot�a. Gdyby nie ja, by�by martwy.
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_23"); //Dziwi mnie twoja bezinteresowno��. Czego ode mnie oczekujesz? Chcesz si� spotka� z Gomezem? A mo�e liczy si� tylko ruda.
	
	Info_ClearChoices (DIA_Thorus_FlintFindPath);
	Info_AddChoice (DIA_THORUS_FlintFindPath,"Chc� si� spotka� z Gomezem.",DIA_THORUS_FlintFindPath_GOMEZ);
	Info_AddChoice (DIA_THORUS_FlintFindPath,"Wystarczy mi ruda.",DIA_THORUS_FlintFindPath_ORE);
	
	MIS_FlintsOffer = LOG_FAILED;
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_FAILED);
    B_LogEntry                     (CH1_FlintsOffer,"Nie zyska�em sympatii Thorusa. Lepiej nie b�d� mu teraz wchodzi� w drog�.");
	};
};

func void DIA_THORUS_FlintFindPath_GOMEZ ()
{
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_24"); //Chc� si� spotka� z Gomezem.
	if (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_PSIONIC_25"); //Nic ci po spotkaniu z Gomezem. Lepiej wracaj na bagna.
	}
	else if (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_KDF) //Nie wiadomo co Psimogoth wykombinuje tym razem :))))
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_WTF_26"); //Jeszcze nie zd��y�e� si� na niego napatrze�? Wracaj do swojej roboty.
	}
	else //no kurwa albo bandyta, albo kto� z nowego obozu - innej opcji nie ma, chyba �e Psimogoth znowu co� odjebie...
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_BAN_27"); //Kto� twojego pokroju chcia�by si� zobaczy� z Gomezem tylko po to, �eby go zabi�. Nie pozwol� na to.
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};
};

func void DIA_THORUS_FlintFindPath_ORE ()
{
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_28"); //Wystarczy mi ruda.
	if (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_KDF) 
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_ORE_HH_29"); //Masz! Mo�esz si� schla� do nieprzytomno�ci.
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget,100);
	}
	else 
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_BAN_27"); //Kto� twojego pokroju chcia�by si� zobaczy� z Gomezem tylko po to, �eby go zabi�. Nie pozwol� na to.
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};
};

//========================================
//-----------------> QuestGRD
//========================================

INSTANCE DIA_THORUS_QuestGRD (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_QuestGRD_Condition;
   information  = DIA_THORUS_QuestGRD_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� inne zadanie?";
};

FUNC INT DIA_THORUS_QuestGRD_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_GRD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_QuestGRD_Info()
{
    AI_Output (other, self ,"DIA_THORUS_QuestGRD_15_01"); //Masz dla mnie jakie� inne zadanie?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_02"); //Ju� ci si� znudzi�o?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_03"); //No to w takim razie mo�esz eskortowa� Kopaczy do Starej Kopalni.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_04"); //Pomo�e ci w tym trzech moich ludzi.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_05"); //Pogadaj ze stra�nikiem konwoju. On da ci dalsze instrukcje.
    MIS_BuddlersEscort = LOG_RUNNING;

    Log_CreateTopic          (CH2_BuddlersEscort, LOG_MISSION);
    Log_SetTopicStatus       (CH2_BuddlersEscort, LOG_RUNNING);
    B_LogEntry               (CH2_BuddlersEscort,"Wreszcie co� ciekawego. Tym razem mam eskortowa� Kopaczy do Starej Kopalni. Wi�cej informacji uzyskam od stra�nika konwoju. Chyba widzia�em go na placu zamkowym.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZLECENIE_NA_OBRONE
//========================================

INSTANCE DIA_THORUS_ZLECENIE_NA_OBRONE (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_ZLECENIE_NA_OBRONE_Condition;
   information  = DIA_THORUS_ZLECENIE_NA_OBRONE_Info;
   permanent	= FALSE;
   description	= "Zako�czy�em eskort�. Masz dla mnie kolejne zlecenie?";
};

FUNC INT DIA_THORUS_ZLECENIE_NA_OBRONE_Condition()
{
    if (MIS_BuddlersEscort == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_GRD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_ZLECENIE_NA_OBRONE_Info()
{
    AI_Output (other, self ,"DIA_THORUS_ZLECENIE_NA_OBRONE_15_01"); //Zako�czy�em eskort�. Masz dla mnie kolejne zlecenie?
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_02"); //Tak. Podczas twojej nieobecno�ci wr�cili do mnie zwiadowcy z placu wymian.
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_03"); //Grupka Bandyt�w chce zaatakowa� to miejsce i obrabowa� skrzynie. Mamy tam ledwie sze�ciu ludzi i jednego robotnika.
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_04"); //Id� tam i dopilnuj, �eby �aden Bandyta nie prze�y�. 
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_05"); //Tylko si� po�piesz!
    MIS_ReplacePointDefense = LOG_RUNNING;

    Log_CreateTopic          (CH2_ReplacePointDefense, LOG_MISSION);
    Log_SetTopicStatus       (CH2_ReplacePointDefense, LOG_RUNNING);
    B_LogEntry               (CH2_ReplacePointDefense,"Musz� jak najszybciej uda� si� na plac wymian. podobno grupa Bandyt�w chce napa�� na naszych ludzi.");
	Wld_InsertNpc				(bandyta8,"OW_PATH_1_16_5_1");
	Wld_InsertNpc				(bandyta4,"OW_PATH_1_16_6");
	Wld_InsertNpc				(bandyta2,"OW_PATH_1_16_5");
	Wld_InsertNpc				(bandyta7,"OW_PATH_1_16_8");
	Wld_InsertNpc				(bandyta6,"PLAC1");
	Wld_InsertNpc				(bandyta5,"PLAC2");
	Wld_InsertNpc				(bandyta3,"PLAC5");
	Wld_InsertNpc				(bandyta2,"OW_PATH_1_16_1");
	Wld_InsertNpc				(bandyta1,"CAMP02");
	Wld_InsertNpc				(bandyta9,"CAMP01");
	Wld_InsertNpc				(bandyta7,"OW_PATH_1_16");
	Wld_InsertNpc				(bandyta7,"OW_PATH_1_17");
	
	GRD_2005_Stra�nik.flags = NPC_FLAG_IMMORTAL;
	GRD_2002_Stra�nik.flags = NPC_FLAG_IMMORTAL;
	VLK_2004_Robotnik.flags = NPC_FLAG_IMMORTAL;
};

//========================================
//-----------------> PLAC_WYMIAN
//========================================

INSTANCE DIA_THORUS_PLAC_WYMIAN (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_PLAC_WYMIAN_Condition;
   information  = DIA_THORUS_PLAC_WYMIAN_Info;
   permanent	= FALSE;
   description	= "By�em na placu wymian.";
};

FUNC INT DIA_THORUS_PLAC_WYMIAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_OBRONA))
    && (Npc_KnowsInfo (hero, DIA_Robotnik_OBRONA_2))
    && (Npc_KnowsInfo (hero, DIA_Stra�nik_OBRONA_1))
    && (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_PLAC_WYMIAN_Info()
{
    AI_Output (other, self ,"DIA_THORUS_PLAC_WYMIAN_15_01"); //By�em na placu wymian. Rzeczywi�cie kr�ci� si� tam spory oddzia� Bandyt�w.
    AI_Output (other, self ,"DIA_THORUS_PLAC_WYMIAN_15_02"); //Uda�o nam si� ich pozby�.
    AI_Output (self, other ,"DIA_THORUS_PLAC_WYMIAN_03_03"); //Doskonale. To oduczy Quentina zadzierania z moimi lud�mi.
    AI_Output (self, other ,"DIA_THORUS_PLAC_WYMIAN_03_04"); //Masz tu sw�j �o�d. 
    B_LogEntry                     (CH2_ReplacePointDefense,"Zadanie zosta�o wykonane. Plac wymian jest bezpieczny.");
    Log_SetTopicStatus       (CH2_ReplacePointDefense, LOG_SUCCESS);
    MIS_ReplacePointDefense = LOG_SUCCESS;

    B_GiveXP (158);
	
	GRD_2005_Stra�nik.flags = 0;
	GRD_2002_Stra�nik.flags = 0;
	VLK_2004_Robotnik.flags = 0;
};



//========================================
//-----------------> QuestsForGuradians
//========================================

INSTANCE DIA_THORUS_QuestsForGuradians (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 889;
   condition    = DIA_THORUS_QuestsForGuradians_Condition;
   information  = DIA_THORUS_QuestsForGuradians_Info;
   permanent	= TRUE;
   description	= "(WYDAJ POLECENIA)";
};

FUNC INT DIA_THORUS_QuestsForGuradians_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_EBR) && (Kapitel <= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_QuestsForGuradians_Info()
{
    AI_Output (other, self ,"DIA_THORUS_QuestsForGuradians_15_01"); //Chc� wys�a� Stra�nik�w na misje.
    AI_Output (self, other ,"DIA_THORUS_QuestsForGuradians_03_02"); //Co konkretnie chcesz zrobi�?

    Info_ClearChoices		(DIA_THORUS_QuestsForGuradians);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, DIALOG_BACK, DIA_THORUS_QuestsForGuradians_BACK);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Zaatakujcie Bandyt�w! (zysk: 200 bry�ek, Stra�nicy: 10)", DIA_THORUS_QuestsForGuradians_NpadNaBadytow);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Przeszukajcie lasy! (zysk: 300 bry�ek, Stra�nicy: 15)", DIA_THORUS_QuestsForGuradians_ExploreWood);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Polujcie na wilki! (zysk: sk�ry, stra�nicy: 10)", DIA_THORUS_QuestsForGuradians_PolowanieNaWilki);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Zdob�d�cie mi�so! (zysk: mi�so, Stra�nicy: 10)", DIA_THORUS_QuestsForGuradians_PolujcieNaPotwory);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Napadajcie na w��cz�g�w! (zysk: 150 bry�ek, Stra�nicy: 5)", DIA_THORUS_QuestsForGuradians_Grabieze);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Polujcie na plugawe stworzenia! (zysk: 550 bry�ek, Stra�nicy: 20)", DIA_THORUS_QuestsForGuradians_PolujcieNaBesie);
};

FUNC VOID DIA_THORUS_QuestsForGuradians_BACK()
{
    Info_ClearChoices		(DIA_THORUS_QuestsForGuradians);
};

FUNC VOID DIA_THORUS_QuestsForGuradians_NpadNaBadytow()
{
if (liczba_straznikow >= 10) 
{
liczba_straznikow = liczba_straznikow - 10; 
timer_grd1 = 10 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};

};

FUNC VOID DIA_THORUS_QuestsForGuradians_ExploreWood()
{
if (liczba_straznikow >= 15) 
{
liczba_straznikow = liczba_straznikow - 15; 
timer_grd2 = 15 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};
};

FUNC VOID DIA_THORUS_QuestsForGuradians_PolowanieNaWilki()
{
if (liczba_straznikow >= 10) 
{
liczba_straznikow = liczba_straznikow - 10; 
timer_grd2 = 7 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};
};


FUNC VOID DIA_THORUS_QuestsForGuradians_PolujcieNaPotwory()
{
if (liczba_straznikow >= 10) 
{
liczba_straznikow = liczba_straznikow - 10; 
timer_grd2 = 5 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};
};


FUNC VOID DIA_THORUS_QuestsForGuradians_Grabieze()
{
if (liczba_straznikow >= 5) 
{
liczba_straznikow = liczba_straznikow - 5; 
timer_grd2 = 7 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};
};


FUNC VOID DIA_THORUS_QuestsForGuradians_PolujcieNaBesie()
{
if (liczba_straznikow >= 20) 
{
liczba_straznikow = liczba_straznikow - 20; 
timer_grd2 = 15 * 60;
} else {
PrintScreen	("Nie masz tylu ludzi!", -1,-1,"font_new_10_red.tga",2);
};
};

// DOPISZ WLD_GETDAY!!!!!

//========================================
//-----------------> StosunkiZNO
//========================================

INSTANCE DIA_THORUS_StosunkiZNO (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 989;
   condition    = DIA_THORUS_StosunkiZNO_Condition;
   information  = DIA_THORUS_StosunkiZNO_Info;
   permanent	= FALSE;
   description	= "Jak wygl�daj� stosunki z Nowym Obozem?";
};

FUNC INT DIA_THORUS_StosunkiZNO_Condition()
{
    if (MIS_OpiniaOSO == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_StosunkiZNO_Info()
{
    AI_Output (other, self ,"DIA_THORUS_StosunkiZNO_15_01"); //Jak wygl�daj� stosunki z Nowym Obozem?
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_03_02"); //Nie jest najlepiej. Ostatnio relacje si� och�odzi�y.
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_03_03"); //Przypuszczam, �e Najemnicy wpadli na trop naszych ludzi.

    Info_ClearChoices		(DIA_THORUS_StosunkiZNO);
    Info_AddChoice		(DIA_THORUS_StosunkiZNO, "Tymczasowo wycofaj naszych ludzi z tamtej okolicy.", DIA_THORUS_StosunkiZNO_Wycofaj);
    Info_AddChoice		(DIA_THORUS_StosunkiZNO, "Zostaw naszych ludzi w okolicy. ", DIA_THORUS_StosunkiZNO_Zostaw);
};

FUNC VOID DIA_THORUS_StosunkiZNO_Wycofaj()
{
    AI_Output (other, self ,"DIA_THORUS_StosunkiZNO_Wycofaj_15_01"); //Tymczasowo wycofaj naszych ludzi z tamtej okolicy.
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_Wycofaj_03_02"); //Skoro tak chcesz.
    OpiniaNC = OpiniaNC + 10;
	PrintScreen	("Opinia w Nowym Obozie +10!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Info_ClearChoices		(DIA_THORUS_StosunkiZNO);
    timer_grd7nc = 5 * 60;
};

FUNC VOID DIA_THORUS_StosunkiZNO_Zostaw()
{
    AI_Output (other, self ,"DIA_THORUS_StosunkiZNO_Zostaw_15_01"); //Zostaw naszych ludzi w okolicy.
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_Zostaw_03_02"); //Dobrze.
    OpiniaNC = OpiniaNC - 15;
    PrintScreen	("Opinia w Nowym Obozie -10!", -1,-1,"font_new_10_red.tga",2);
    Info_ClearChoices		(DIA_THORUS_StosunkiZNO);
};


//========================================
//-----------------> Sprawa2
//========================================

INSTANCE DIA_log_Sprawa2 (C_INFO)
{
   npc          = quest1_grd_log;
   nr           = 1;
   condition    = DIA_log_Sprawa2_Condition;
   information  = DIA_log_Sprawa2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_log_Sprawa2_Condition()
{
    if (quest1_grd_log == true)
    && (MIS_OpiniaOSO == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_log_Sprawa2_Info()
{
    AI_Output (self, other ,"DIA_log_Sprawa2_03_01"); //Hej. Mam kolejn� wa�n� spraw�.
    AI_Output (other, self ,"DIA_log_Sprawa2_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_log_Sprawa2_03_03"); //Nasi ludzie zostali zaatakowani, poluj�c na kretoszczury.
    AI_Output (self, other ,"DIA_log_Sprawa2_03_04"); //Szkodnicy z Nowego Obozu uwa�aj�, �e wkroczyli�my na ich teren �owiecki.
    AI_Output (self, other ,"DIA_log_Sprawa2_03_05"); //Mamy wycofa� wojska, czy walczy�?

    Info_ClearChoices		(DIA_log_Sprawa2);
    Info_AddChoice		(DIA_log_Sprawa2, "Walczcie! (500 bry�ek rudy, 30 sztuk mi�sa)", DIA_log_Sprawa2_Zostancie);
    Info_AddChoice		(DIA_log_Sprawa2, "Wycofajcie si�! (lepsze stosunki z NO)", DIA_log_Sprawa2_Wycofaj);
};

FUNC VOID DIA_log_Sprawa2_Zostancie()
{
    AI_Output (other, self ,"DIA_log_Sprawa2_Zostancie_15_01"); //Walczcie!
    AI_Output (self, other ,"DIA_log_Sprawa2_Zostancie_03_02"); //Na rozkaz!
    timer_grd8nc =  3 * 60;
    Info_ClearChoices		(DIA_log_Sprawa2);
    AI_StopProcessInfos	(self);
    OpiniaNC = OpiniaNC - 15;
	przychody_obozu = przychody_obozu + 50;
};

FUNC VOID DIA_log_Sprawa2_Wycofaj()
{
    AI_Output (other, self ,"DIA_log_Sprawa2_Wycofaj_15_01"); //Wycofajcie si�!
    AI_Output (self, other ,"DIA_log_Sprawa2_Wycofaj_03_02"); //Skoro w�a�nie tego chcesz.
    timer_grd9nc = 3 * 60;
    OpiniaNC = OpiniaNC + 20;
    Info_ClearChoices		(DIA_log_Sprawa2);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> NCSprawy
//========================================

INSTANCE DIA_log_NCSprawy (C_INFO)
{
   npc          = quest1_grd_log;
   nr           = 2;
   condition    = DIA_log_NCSprawy_Condition;
   information  = DIA_log_NCSprawy_Info;
   permanent	= TRUE;
   description	= "Zajmijmy si� sprawami Nowego Obozu.";
};

FUNC INT DIA_log_NCSprawy_Condition()
{
    if (MIS_OpiniaOSO == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_log_NCSprawy_Info()
{
    AI_Output (other, self ,"DIA_log_NCSprawy_15_01"); //Zajmijmy si� sprawami Nowego Obozu.
    AI_Output (self, other ,"DIA_log_NCSprawy_03_02"); //Jest kilka wa�nych spraw do om�wienia.

    Info_ClearChoices		(DIA_log_NCSprawy);
    Info_AddChoice		(DIA_log_NCSprawy, DIALOG_BACK, DIA_log_NCSprawy_BACK);
	if (watermage_enterto_temple == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Pozw�l Magom Wody zbada� �wi�tynie w dolinie.", DIA_log_NCSprawy_Temple);
	};
	if (trade_with_ricelord == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Zezw�l na handel z Nowym Obozem. (handel przyniesie ma�e dochody!)", DIA_log_NCSprawy_WymieniajRudenaRyz);
	};
	if (trade_with_idiots == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Przymu� Bractwo do wstrzymania handlu z Nowym Obozem.", DIA_log_NCSprawy_HandelBractwoNC);
	};
	if (more_guradians_conwoy == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Wzmocnij ochron� konwoj�w z rud�. (zwi�ksza zyski z wymiany!)", DIA_log_NCSprawy_WzmocnijStraze);
	};
	if (guardians_back_to_OC == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Wycofaj my�liwych z teren�w Nowego Obozu! (zmniejszony zysk)", DIA_log_NCSprawy_WycofajCieni);
	};
};

FUNC VOID DIA_log_NCSprawy_BACK()
{
    Info_ClearChoices		(DIA_log_NCSprawy);
};

FUNC VOID DIA_log_NCSprawy_Temple()
{
    AI_Output (other, self ,"DIA_log_NCSprawy_Temple_15_01"); //Pozw�l Magom Wody zbada� �wi�tynie w dolinie.
    AI_Output (self, other ,"DIA_log_NCSprawy_Temple_03_02"); //Corristo nie b�dzie zadowolony...
    OpiniaNC = OpiniaNC + 10;
	OpiniaOC = OpiniaOC - 1;
	watermage_enterto_temple = true;
};

FUNC VOID DIA_log_NCSprawy_WymieniajRudenaRyz()
{
    AI_Output (other, self ,"DIA_log_NCSprawy_WymieniajRudenaRyz_15_01"); //Zezw�l na handel z Nowym Obozem.
    AI_Output (self, other ,"DIA_log_NCSprawy_WymieniajRudenaRyz_03_02"); //Ten handel jest ma�o dochodowy. Miej to na uwadze. Sprawami ekonomicznymi Obozu zajmuje si� Bartholo.
    OpiniaNC = OpiniaNC + 5;
	OpiniaOC = OpiniaOC - 1;
	trade_with_ricelord = true;
	przychody_obozu = przychody_obozu + 70;
};

FUNC VOID DIA_log_NCSprawy_HandelBractwoNC()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_HandelBractwoNC_15_01"); //Przymu� Bractwo do wstrzymania handlu z Nowym Obozem.
    AI_Output (self, other ,"DIA_log_NCSprawy_HandelBractwoNC_03_02"); //Znacz�co poprawi to nasze przychody. Bartholo b�dzie z ciebie zadowolony, ale Lee si� nie�le wkurzy.
    OpiniaNC = OpiniaNC - 5;
	OpiniaOC = OpiniaOC + 10;
	trade_with_idiots = true; 
	przychody_obozu = przychody_obozu + 100;
};

FUNC VOID DIA_log_NCSprawy_WzmocnijStraze()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_WzmocnijStraze_15_01"); //Wzmocnij ochron� konwoj�w z rud�.
    AI_Output (self, other ,"DIA_log_NCSprawy_WzmocnijStraze_03_02"); //Gomez nigdy si� tym nie zaj��... Dobrze!
	OpiniaNC = OpiniaNC - 5;
	OpiniaOC = OpiniaOC + 5;
	more_guradians_conwoy = true;
	przychody_obozu = przychody_obozu + 30;
	
};
func void DIA_log_NCSprawy_WycofajCieni ()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_WzmocnijStraze_15_01"); //Wycofaj my�liwych z rejon�w Nowego Obozu.
    AI_Output (self, other ,"DIA_log_NCSprawy_WzmocnijStraze_03_02"); //Jak chcesz. 
	OpiniaNC = OpiniaNC + 5;
	OpiniaOC = OpiniaOC - 1;
	liczba_straznikow = liczba_straznikow + 5; 
	guardians_back_to_OC = true;
	przychody_obozu = przychody_obozu - 50;
};


//Lista opcji
/* 
+10
1. +20 zysk ma�y 
2. +10 zysk ma�y
te s� ok 

3. +5 zysk ma�y, strata! 

4. -5, du�y zysk
5. - 5, du�y zysk 
*/

//========================================
//-----------------> SCAR_DIE
//========================================

INSTANCE DIA_THORUS_SCAR_DIE (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_SCAR_DIE_Condition;
   information  = DIA_THORUS_SCAR_DIE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_THORUS_SCAR_DIE_Condition()
{
    if (kapitel == 3)
    && (Scar_die == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_SCAR_DIE_Info()
{
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_01"); //St�j! Masz szcz�cie, �e ci� nie by�o w Obozie. Inaczej pomy�la�bym, �e na pewno macza�e� w tym swoje paluchy.
    AI_Output (other, self ,"DIA_THORUS_SCAR_DIE_15_02"); //Nie bardzo rozumiem. Co si� sta�o?
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_03"); //Zabito Magnata. Ot co si� sta�o! Mam teraz pe�ne r�ce roboty. Zab�jca mia� na sobie zbroj� moich ludzi.
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_04"); //Je�li oka�e si�, �e dosz�o do zdrady Gomez urwie mi �eb!
    AI_Output (other, self ,"DIA_THORUS_SCAR_DIE_15_05"); //Je�li b�d� co� wiedzia� na jego temat z pewno�ci� ci powiem.
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_06"); //Ta... Z pewno�ci�. Id� ju� i nie kr�� si� tu!
    B_LogEntry                     (CH3_ScarMurder,"Thorus zaczepi� mnie i powiedzia�, �e w Starym Obozie zabito Magnata Blizn�. To Kosa macza� w tym palce. Musz� szybko do niego wr�ci� po wyja�nienia.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POKABLOWAC_DOBRA_RZECZ
//========================================

INSTANCE DIA_THORUS_POKABLOWAC_DOBRA_RZECZ (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_Condition;
   information  = DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_Info;
   permanent	= FALSE;
   description	= "Baal Taran chce zrobi� z kowala Huno kolejnego �wira.";
};

FUNC INT DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Huno_pali == false)
	&& (Huno_drugs_level < 1)
	&& (!Npc_KnowsInfo (hero, DIA_Huno_HELLO2))
    {
    return TRUE;
    };
};

//fixed 1210
FUNC VOID DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_Info()
{
    AI_Output (other, self ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_15_01"); //Baal Taran chce zrobi� z kowala Huno kolejnego �wira.
    AI_Output (other, self ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_15_02"); //Namawia mnie, abym spr�bowa� w jaki� spos�b uzale�ni� kowala od bagiennego ziela. Jednak nie chc� tego robi�.
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_03"); //Huno jest wa�n� osob� w Obozie. Zaopatruje Zewn�trzny Pier�cie� w bro� oraz wyrabia kilofy.
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_04"); //Dobrze, �e mi o tym powiedzia�e�. Ju� ja sobie porozmawiam z tym Nowicjuszem. 
    B_GiveInvItems (self, other, ItMiNugget, 150);
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_05"); //My�l�, �e powiniene� porozmawia� z Huno i mu o tym powiedzie�. Mo�e jako� ci� wynagrodzi? Kto wie...
    B_LogEntry                     (CH1_Druggy,"Popsu�em zadanie, ale my�l�, �e przys�u�y�em si� Staremu Obozowi. Kowal to wa�ny mieszkaniec Obozu.");
    Log_SetTopicStatus       (CH1_Druggy, LOG_FAILED);
    MIS_Druggy = LOG_FAILED;

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BANDYTA_GATE
//========================================

INSTANCE DIA_Thorus_BANDYTA_GATE (C_INFO)
{
   npc          = Grd_200_Thorus;
   nr           = 1;
   condition    = DIA_Thorus_BANDYTA_GATE_Condition;
   information  = DIA_Thorus_BANDYTA_GATE_Info;
   permanent	= FALSE;
   description	= "Chcia�bym dosta� si� do zamku.";
};

FUNC INT DIA_Thorus_BANDYTA_GATE_Condition()
{
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
    var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU) 
	&& (wache212.aivar[AIV_PASSGATE] == false) && (wache213.aivar[AIV_PASSGATE] == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Thorus_BANDYTA_GATE_Info()
{
    AI_Output (other, self ,"DIA_Thorus_BANDYTA_GATE_15_01"); //Chcia�bym dosta� si� do zamku.
    AI_Output (self, other ,"DIA_Thorus_BANDYTA_GATE_03_02"); //Chyba �artujesz. Nosisz pancerz jednego z tych sukinsyn�w, kt�rzy atakuj� nasze konwoje. Zapomnij o tym. 
    AI_Output (self, other ,"DIA_Thorus_BANDYTA_GATE_03_03"); //Nie wiem, czy jeste� w bandzie Quentina, ale widz�, ze masz z nim jaki� kontakt. Nie chc� mie� z tob� nic wsp�lnego.	
	
	Log_CreateTopic		(CH1_CastleEntranceBandit,LOG_MISSION);
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_RUNNING);
	B_LogEntry			(CH1_CastleEntranceBandit,"Thorus nie chce mnie wpu�ci� do zamku, bo zadaj� si� z Quentinem. Jedynym sposobem na wej�cie do zamku jest przekupstwo. Problem w tym, �e tysi�c bry�ek rudy to ca�kiem sporo, a w�tpi� �eby Quentin chcia� mi to zrefundowa�...");
	
};

//========================================
//-----------------> DIEGO_PASS
//========================================

INSTANCE DIA_Thorus_DIEGO_PASS (C_INFO)
{
   npc          = Grd_200_Thorus;
   nr           = 1;
   condition    = DIA_Thorus_DIEGO_PASS_Condition;
   information  = DIA_Thorus_DIEGO_PASS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Thorus_DIEGO_PASS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Thorus_DIEGO_PASS_Info()
{
    AI_Output (self, other ,"DIA_Thorus_DIEGO_PASS_03_01"); //Naprawd� nie wiem co� ty za jeden i sk�d masz ten pancerz, ale Diego r�czy za ciebie, wi�c mo�esz przej��.
    AI_Output (self, other ,"DIA_Thorus_DIEGO_PASS_03_02"); //Tylko szybko. Nie chc� ci� ju� ogl�da�!
    AI_StopProcessInfos	(self);
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_SUCCESS);
	B_LogEntry			(CH1_CastleEntranceBandit,"Uda�o si�! Wiedzia�em, �e na Diego mo�na polega�. Teraz mam dost�p do zamku.");
	//MIS_WejscieDoZamku = LOG_SUCCESS; 
	b_givexp (250);
};

//========================================
//-----------------> WPADKA_BERG
//========================================

INSTANCE DIA_Thorus_WPADKA_BERG (C_INFO)
{
   npc          = Grd_200_Thorus;
   nr           = 1;
   condition    = DIA_Thorus_WPADKA_BERG_Condition;
   information  = DIA_Thorus_WPADKA_BERG_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Thorus_WPADKA_BERG_Condition()
{
if (berg_problemy == true)
{
    return TRUE;
};
};
FUNC VOID DIA_Thorus_WPADKA_BERG_Info()
{
    AI_Output (self, other ,"DIA_Thorus_WPADKA_BERG_03_01"); //Hej, ty! S�ysza�em, �e chcia�e� okra�� piwnice Magnat�w i zaatakowa�e� jednego z moich ch�opc�w, w celu zdobycia klucza do nich.
    AI_Output (other, self ,"DIA_Thorus_WPADKA_BERG_15_02"); //Mog� to wyja�ni�.
    AI_Output (self, other ,"DIA_Thorus_WPADKA_BERG_03_03"); //Wsad� sobie w dup� te wyja�nienia! Osobi�cie dopilnuj�, �eby r�czki ci� wi�cej nie �wierzbi�y, sukinsynu!
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> PRZEGRANA_GRY
//========================================

INSTANCE DIA_THORUS_PRZEGRANA_GRY (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_PRZEGRANA_GRY_Condition;
   information  = DIA_THORUS_PRZEGRANA_GRY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_THORUS_PRZEGRANA_GRY_Condition()
{
	if (Gravo_doniosl_Thorusowi == true)
	{
    return TRUE;
	};
};

FUNC VOID DIA_THORUS_PRZEGRANA_GRY_Info()
{
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_01"); //Gravo doni�s� mi, �e pracujesz dla Bandyt�w.
    AI_Output (other, self ,"DIA_THORUS_PRZEGRANA_GRY_15_02"); //I co w zwi�zku z tym?
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_03"); //To, �e nie do�yjesz jutra wstr�tny sukinsynu.
    AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_04"); //Chyba, �e wyjawisz mi, gdzie znajduje si� ta wyl�garnia robactwa.
    AI_Output (other, self ,"DIA_THORUS_PRZEGRANA_GRY_15_05"); //Sam nie mam poj�cia, gdzie to jest. 
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_06"); //Do��!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 4    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//========================================
//-----------------> Kapitel4_Camp
//========================================

INSTANCE DIA_THORUS_Kapitel4_Camp (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_Kapitel4_Camp_Condition;
   information  = DIA_THORUS_Kapitel4_Camp_Info;
   permanent	= FALSE;
   description	= "Dlaczego porzuci�e� Stary Ob�z?";
};

FUNC INT DIA_THORUS_Kapitel4_Camp_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};

FUNC VOID DIA_THORUS_Kapitel4_Camp_Info()
{
    AI_Output (other, self ,"DIA_THORUS_Kapitel4_Camp_15_01"); //Dlaczego porzuci�e� Stary Ob�z?
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_02"); //Kolejny raz wtr�casz si� w nie swoje sprawy. 
    AI_Output (other, self ,"DIA_THORUS_Kapitel4_Camp_15_03"); //Jestem po prostu ciekaw.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_04"); //Ciekawo�� to pierwszy stopie� do piek�a, ale niech ci b�dzie. Pomog� ci si� tam dosta�...
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_06"); //Gomez po raz kolejny udowodni� jakim jest durniem. M�wi�em mu, �eby nie wysy�a� tak ma�ego oddzia�u na Obozu Bandyt�w.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_07"); //To by�a pewna �mier� dla naszych Stra�nik�w, a ja mam jedn� zasad�: jestem lojalny wobec swoich ludzi.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_08"); //Gomez po prostu tego nie rozumia�.
};

//========================================
//-----------------> Kapitel4_Raven
//========================================

INSTANCE DIA_Thorus_Kapitel4_Raven (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_Thorus_Kapitel4_Raven_Condition;
   information  = DIA_Thorus_Kapitel4_Raven_Info;
   permanent	= FALSE;
   description	= "A gdzie jest teraz Kruk?";
};

FUNC INT DIA_Thorus_Kapitel4_Raven_Condition()
{
    if (kapitel >= 4) && (Npc_KnowsInfo (hero, DIA_THORUS_Kapitel4_Camp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Thorus_Kapitel4_Raven_Info()
{
    AI_Output (other, self ,"DIA_Thorus_Kapitel4_Raven_15_01"); //A gdzie jest teraz Kruk?
    AI_Output (self, other ,"DIA_Thorus_Kapitel4_Raven_03_02"); //W Starym Obozie, a co? Chcesz pogada� z szefem.
	AI_Output (other, self ,"DIA_Thorus_Kapitel4_Raven_15_03"); //Jestem ciekaw, co tam robi.
    AI_Output (self, other ,"DIA_Thorus_Kapitel4_Raven_03_04"); //To nie twoja sprawa! Za�atwia wa�ne interesy!
};