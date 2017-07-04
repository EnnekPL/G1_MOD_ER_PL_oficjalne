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
	description = "Pewnie nie bêdziesz chcia³ wpuœciæ mnie do zamku?";
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
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie bêdziesz chcia³ wpuœciæ mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Tylko ludzie Gomeza maj¹ prawo wstêpu.
};

// ************************************************************
// 					Ich will für Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Chcê pracowaæ dla Gomeza.";
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
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chcê pracowaæ dla Gomeza.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Czy¿by? A czemu myœlisz, ¿e Gomez chcia³by, ¿eby ktoœ taki jak ty dla niego pracowa³?
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
	description = "Diego powiedzia³, ¿e to TY podejmujesz takie decyzje.";
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
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego powiedzia³, ¿e to TY podejmujesz takie decyzje.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Hmm... Jeœli Diego uwa¿a, ¿e jesteœ w porz¹dku, to czemu SAM siê tob¹ nie zajmie?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //S³uchaj uwa¿nie: Diego podda ciê najpierw testowi. Jeœli ON uzna, ¿e siê nadajesz, ja wpuszczê ciê do zamku na spotkanie z Gomezem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //To, co bêdzie póŸniej, zale¿y ju¿ tylko od ciebie, jasne?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Porozmawiam z Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus poradzi³ mi, bym porozmawia³ z Diego. To on oceni, czy nadajê siê na cz³onka Starego Obozu.");
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
	description = "Dlaczego sam nie poddasz mnie próbie?";
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
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Dlaczego sam nie poddasz mnie próbie?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nie takie proste, ch³opcze. Nowy, który chce tu do czegoœ dojœæ, potrzebuje opiekuna.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Tym opiekunem musi byæ jeden z ludzi Gomeza. I to w³aœnie on podda ciê próbie.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A jeœli narobisz k³opotów to on poniesie za nie odpowiedzialnoœæ. Takie s¹ tutaj zasady.
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
	description = "Na pewno znajdzie siê dla mnie jakieœ zadanie...";
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
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Na pewno znajdzie siê dla mnie jakieœ zadanie...
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nie. Rzeczy, którymi zajmuj¹ siê Stra¿nicy przerastaj¹ twoje mo¿liwoœci, ch³opcze.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Trzymaj siê poleceñ swojego opiekuna.
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
	description = "Potrafiê sprostaæ ka¿demu zadaniu, które mi powierzysz.";
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
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Potrafiê sprostaæ ka¿demu zadaniu, które mi powierzysz.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Och? A¿ tak ci zale¿y na wpadce? Hmm. Jest jedna rzecz, któr¹ mo¿e siê zaj¹æ wy³¹cznie cz³owiek nie bêd¹cy w s³u¿bie Gomeza.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale uprzedzam ciê: jak to schrzanisz, bêdziesz mia³ nie lada k³opoty.
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
	description = "Jestem gotów.";
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
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jestem gotów.
	/*if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_01"); //Nie, nie jesteœ. Zadajesz siê z Bandytami i masz czelnoœæ do mnie przychodziæ.
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_02"); //Wynoœ siê, albo ciê zabijê.
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self, other,"Info_Thorus_MordragKo_OfferRefuse_09_03"); //Wybra³eœ pracê w kopalni. R¹k do pracy nigdy nie za wiele. Nie mogê ci powierzyæ takiego zadania.
	}
	else
	{
	*/
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ci za chwilê powiem, musi pozostaæ miêdzy nami, rozumiemy siê?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasne.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Pewien cz³owiek z Nowego Obozu sprawia nam problemy. Nazywa siê Mordrag i przyw³aszczy³ sobie kilka rzeczy nale¿¹cych do Magnatów.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Oczywiœcie to samo mo¿na powiedzieæ o wielu Szkodnikach z Nowego Obozu, ale Mordrag ma czelnoœæ zjawiaæ siê w NASZYM Obozie i odsprzedawaæ NASZE rzeczy NASZYM ch³opcom!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //A to ju¿ za wiele. Niestety, ³ajdak wie, ¿e nie mogê z tym nic zrobiæ.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Dlaczego?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Bo jest pod opiek¹ Magów.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer, "Zajmê siê tym." 							,Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Chcesz, ¿ebym go zabi³, tak?" 						,Info_Thorus_MordragKo_KillHim);
	if (HeroKnowWhereIsMordrag == FALSE)
	{
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Gdzie znajdê Mordraga?" 								,Info_Thorus_MordragKo_Where);
	};
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Dlaczego Magowie broni¹ Mordraga?"		,Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Widzê, ¿e masz trochê problemów z Magami..."	,Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	zlecil_Thorus = true;
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus poprosi³ mnie, bym usun¹³ z Obozu Szkodnika imieniem Mordrag. Nie interesuje go jak tego dokonam, byleby tylko nikt siê nie dowiedzia³, ¿e on macza³ w tym palce.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	};
//};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Zajmê siê tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chcesz, ¿ebym go zabi³, tak?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chcê mieæ pewnoœæ, ¿e ju¿ nigdy wiêcej siê tu nie pojawi. Jak to osi¹gniesz - to ju¿ twoja sprawa.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Gdzie znajdê Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Krêci siê przy po³udniowej bramie, po przeciwnej stronie zamku, tu¿ za wejœciem. Sukinsyn boi siê pojawiaæ bli¿ej centrum.
	B_LogEntry(CH1_MordragKO, "Mordrag urzêduje przy po³udniowej bramie, za zamkiem.");
	HeroKnowWhereIsMordrag = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Dlaczego Magowie broni¹ Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Bo s³u¿y im za pos³añca. Nasi magowie utrzymuj¹ kontakty z czarodziejami z Nowego Obozu. Czêsto wymieniaj¹ informacje za poœrednictwem goñców.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Podejrzewam, ¿e nieŸle siê wkurz¹ na wieœæ, ¿e coœ przydarzy³o siê ich kurierowi.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co ze mn¹? Co Magowie mog¹ mi zrobiæ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jesteœ tu nowy, nic ci nie bêdzie. Ale ja odpowiadam za wszystko, co robi¹ moi ludzie. Dlatego musisz trzymaæ jêzyk za zêbami.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Widzê, ¿e masz trochê problemów z Magami...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Tak. I to problemów, które nie ³atwo rozwi¹zaæ. Kilka lat temu jeden z Cieni próbowa³ zasztyletowaæ we œnie Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Faceta znaleziono potem w Zewnêtrznym Pierœcieniu. Jeœli chodzi o œcis³oœæ - rozsmarowanego PO CA£YM Zewnêtrznym Pierœcieniu.
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
	description = "Wracaj¹c do Mordraga...";
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
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze, "Zajmê siê tym." 	,Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze, "Gdzie znajdê Mordraga?" 	,Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Mordrag ju¿ nigdy nikogo nie okradnie!" ,Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Facet ju¿ nigdy siê tu nie poka¿e!" ,Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Zajmê siê tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag ju¿ nigdy nikogo nie okradnie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Chcesz powiedzieæ, ¿e go pokona³eœ? NieŸle, ch³opcze.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO, "Thorus jest mi wdziêczny za usuniêcie Mordraga. Zyska³em wp³ywowego przyjaciela.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Facet ju¿ nigdy siê tu nie poka¿e!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Wola³bym, ¿ebyœ go zabi³.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO, "Thorus ucieszy³ siê, ¿e Mordraga nie ma ju¿ w Obozie.");
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
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ty ofiaro! Kaza³em ci TRZYMAÆ JÊZYK ZA ZÊBAMI!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Spartaczy³eœ sprawê! Zapomnij o wszystkim, co ci powiedzia³em. Nie próbuj ju¿ nic wiêcej zdzia³aæ w tej sprawie!
			
	Thorus_MordragKo = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Zadanie od Thorusa! ", 1,-1,"font_new_10_red.tga",2);	
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO, "Thorusowi nie spodoba³o siê, ¿e wspomnia³em o nim Mordragowi. Lepiej bêdzie nie pokazywaæ mu siê teraz na oczy.");
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
	AI_Output (self, other,"Info_Thorus_Sukces234_09_00"); //S³ysza³em, ¿e pozby³eœ siê Mordraga. Jestem pod wra¿eniem. Chcesz, do³¹czyæ do Obozu, tak?
	AI_Output (self, other,"Info_Thorus_Sukces234_09_01"); //Nie powinieneœ mieæ z tym najmniejszych problemów. 
	talk_aboutOpinion_OC = true;	
	B_giveXP (100);
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WEJSCIE_BAU
//========================================
//off odsy³am do DIA_Thorus_BANDYTA_GATE
INSTANCE DIA_THORUS_WEJSCIE_BAU (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_WEJSCIE_BAU_Condition;
   information  = DIA_THORUS_WEJSCIE_BAU_Info;
   permanent	= FALSE;
   description	= "Chcia³bym dostaæ siê do zamku.";
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
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_BAU_15_01"); //Chcia³bym dostaæ siê do zamku.
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_02"); //Chyba ¿artujesz, prêdzej do zamku wpuœci³bym Wrzoda. Nosisz pancerz jednego z tych sukinsynów, którzy atakuj¹ nasze konwoje. Zapomnij o tym. 
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_03"); //Nie wiem czy jesteœ w bandzie Quentina, ale widzê, ¿e masz z nim jakiœ kontakt. Nie chcê mieæ z tob¹ nic wspólnego.
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_BAU_15_04"); //A mo¿e ruda za³atwi sprawê?
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_BAU_03_05"); //(spogl¹da)
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
	description = "Czy za odpowiedni¹ sumkê móg³byœ mnie wpuœciæ do zamku?";
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
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Czy za odpowiedni¹ sumkê móg³byœ mnie wpuœciæ do zamku?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za odpowiedni¹ sumkê... 
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Ile?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //No có¿ - liczenie rudy musi potrwaæ odpowiednio d³ugo. Doœæ d³ugo, ¿eby ca³kowicie poch³on¹æ uwagê moj¹ i moich ch³opców. Korzystaj¹c z naszej nieuwagi, móg³byœ przemkn¹æ siê do œrodka...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Czyli ile konkretnie?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Myœlê, ¿e przeliczenie 1000 bry³ek zajmie nam wystarczaj¹co du¿o czasu.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 bry³ek?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Có¿, gdybyœ do³¹czy³ do Gomeza, móg³byœ wejœæ do zamku za darmo.
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
	description = "Masz tu swoje 1000 bry³ek rudy, a teraz pozwól mi przejœæ!";
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
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bry³ek rudy, a teraz pozwól mi przejœæ!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porz¹dku, idŸ. Tylko jak ju¿ bêdziesz w œrodku, nie wywiñ czegoœ g³upiego, dobra?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		Info_Thorus_Give1000Ore.permanent = 0;
	if (Npc_GetTrueGuild (other)==GIL_BAU)
    {
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_SUCCESS);
	B_LogEntry			(CH1_CastleEntranceBandit,"Có¿... zap³aci³em Thorusowi 1000 bry³ek rudy. Innego wyjœcia nie by³o.");
	};
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Próbujesz mnie okpiæ, ch³opcze? Nie masz 1000 bry³ek rudy!
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
   description	= "Masz mnie wpuœciæ. Mam tu pierœcieñ ognia.";
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
    AI_Output (other, self ,"DIA_THORUS_WEJSCIE_RING_FIRE_15_01"); //Masz mnie wpuœciæ. Mam tu pierœcieñ ognia.
    AI_Output (self, other ,"DIA_THORUS_WEJSCIE_RING_FIRE_03_02"); //Kolejny s³ugus Magów... W³aŸ!
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
    AI_StopProcessInfos	(self);
};

	
// ************************************************************
// 					Brief für Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 0;
	description = "Muszê siê dostaæ do zamku. Mam list do Arcymistrza Magów Ognia.";
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
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Muszê siê dostaæ do zamku. Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //I myœlisz, ¿e wpuszczê ciê tak po prostu do œrodka, ¿ebyœ odda³ list i zgarn¹³ nagrodê?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobra, poka¿ ten list.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nie ma mowy. Zapomnij o tym!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //W porz¹dku. Ju¿ zapomnia³em.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Thorus nie chce wpuœciæ mnie do zamku, bym odda³ list Magom. Wydaje mi siê, ¿e powinienem do³¹czyæ do któregoœ z obozów.");
	};
};

// ************************************************************
// 					Bereit für Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego powiedzia³, ¿e jestem ju¿ gotów, by spotkaæ siê z Gomezem.";
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
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego powiedzia³, ¿e jestem ju¿ gotów, by spotkaæ siê z Gomezem.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //To ja o tym zadecydujê!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //I co zdecydowa³eœ?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Muszê przyznaæ, ¿e ca³kiem nieŸle sobie poradzi³eœ.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Niech bêdzie! Mo¿esz stan¹æ przed Gomezem. On podejmie ostateczn¹ decyzjê co do twojego przyjêcia.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od tej pory musisz radziæ sobie sam, ch³opcze.
				
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
	description = "Mam tu partiê bagiennego ziela dla Gomeza, od Cor Kaloma.";
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
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mam tu partiê bagiennego ziela dla Gomeza, od Cor Kaloma.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Poka¿!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //W porz¹dku, mo¿esz iœæ. Udaj siê prosto do siedziby Magnatów i porozmawiaj z Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Jak na pos³añca masz przy sobie trochê za ma³o ziela! Mam nadziejê, ¿e nie sprzeda³eœ go komuœ innemu! Wróæ, jak bêdziesz mia³ ca³¹ partiê.
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
	description = "Jestem pos³añcem Magów Wody. Muszê siê dostaæ do zamku.";
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
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jestem pos³añcem Magów Wody. Muszê siê dostaæ do zamku.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Masz przy sobie amulet kuriera. Stra¿nicy nie bêd¹ ciê zatrzymywali.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Nie chcê mieæ nic wspólnego z magami! Przestañ mi wreszcie zawracaæ g³owê, dobrze?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //No jaaasne... A amulet pewnie zgubi³eœ, co? Albo ci ukradli, hê?
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
	description = "Jestem Bandyt¹ i mam poselstwo dla Magów Ognia!";
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
	AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_00"); //Jestem Bandyt¹ i mam poselstwo dla Magów Ognia!
		AI_Output (self, other,"Info_Thorus_BAU_ENTER_09_01"); //Bandyta pos³añcem? Od kogo to poselstwo?!
		AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_02"); //Otrzyma³em je od jakiegoœ Maga, zanim mnie tu wrzucono.
		AI_Output (self, other,"Info_Thorus_BAU_ENTER_09_03"); //Nie chcê mieæ nic wspólnego z Magami! PrzechodŸ, ale jak us³yszê o tobie chocia¿ jedno z³e s³owo...
		AI_Output (other, self,"Info_Thorus_BAU_ENTER_15_04"); //Rozumiem. Nie bêdê sprawia³ k³opotów.
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
	description = "Uda³o mi siê. Zosta³em przyjêty do Obozu!";
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
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Uda³o mi siê. Zosta³em przyjêty do Obozu!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratulujê, ch³opcze. Dobrze ci radzê, trzymaj siê blisko Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Do Gomeza lub Kruka idŸ, tylko jeœli masz coœ NAPRAWDÊ wa¿nego do powiedzenia.
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
	description = "Chyba powinieneœ zobaczyæ pewne pismo.";
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
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_00"); //Chyba powinieneœ zobaczyæ pewne pismo.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_01"); //Jakie pismo. O co chodzi?
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_02"); //Od jakiegoœ czasu Bloodwyn wyrz¹dza³ szkody jednemu z naszych Nowicjuszy – Baalowi Parvezowi.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_03"); //Nasy³a³ na niego ludzi, którzy uniemo¿liwiali mu prowadzenie nauk, niszczyli dobytek, podrzucali pisma z pogró¿kami.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_04"); //Niby czemu to robi³?
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_05"); //Nie podoba³o mu siê, ¿e niektórzy Kopacze odchodzili do Bractwa. Traci³ w ten sposób wp³ywy z podatków od bezpieczeñstwa.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_06"); //Dlatego postanowi³ pozbyæ siê Parveza ze Starego Obozu.
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_07"); //Poka¿ to pismo.
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_08"); //Proszê.
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_09"); //Zdumiewaj¹ce. Nie spodziewa³em siê, ¿e Bloodwyn umie pisaæ. Ca³kiem nieŸle mu to idzie... Hmmm... 
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_11"); //Skup siê. Lepiej z nim pogadaj, bo inaczej relacje pomiêdzy naszymi obozami siê popsuj¹, a Magnaci obwini¹ za wszystko ciebie. 
	AI_Output(self, other, "DIA_Thorus_BloodwynsOrder_03_12"); //Ty ju¿ siê o moj¹ skórê nie martw. Za³atwiê to i wasz cz³owiek bêdzie bezpieczny. 
	AI_Output(other, self, "DIA_Thorus_BloodwynsOrder_15_12"); //Miejmy nadzieje.
	
	B_LogEntry	(CH1_ParvezInTroubles, "Thorus obieca³ zaj¹æ siê sprawê i pogadaæ z Bloodwynem.");
	
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
	description = "Jak siê masz?";
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
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak siê masz?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Nowy Obóz nie sprawia nam zbyt wielu k³opotów. Bardziej martwi¹ mnie te œwiry z Sekty.
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
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_01"); //Zaczekaj. To czego dokona³eœ w kopalni by³o naprawdê niesamowite.
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_02"); //Jestem pe³en uznania. Chêtnie widzia³bym ciê w szeregach Stra¿ników, ale wiem, ¿e wewn¹trz chcesz czegoœ innego.
    AI_Output (self, other ,"DIA_Thorus_MAG_OGNIA_NOV_03_03"); //Powinieneœ porozmawiaæ z Corristo.
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
	description		= "Chcia³eœ mi coœ powiedzieæ?"; 
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
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chcia³eœ mi coœ powiedzieæ?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Tak. To, co pokaza³eœ w kopalni, œwiadczy nie tylko o twojej odwadze, ale równie¿ o niepospolitej sile i umiejêtnoœciach.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Chêtnie bym ciê widzia³ w szeregach stra¿y.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale zanim to nast¹pi musisz jeszcze trochê popracowaæ nad swoimi umiejêtnoœciami. Tylko najlepsi mog¹ zostaæ Stra¿nikami.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Dajê ci niepowtarzaln¹ szansê. Co ty na to?
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
	description		= "Chcê zostaæ Stra¿nikiem!"; 
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
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chcê zostaæ Stra¿nikiem!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Mi³o mi to s³yszeæ, ale najpierw muszê ci powiedzieæ to, co mówiê wszystkim nowym rekrutom. S³uchaj uwa¿nie, bo nie bêdê siê powtarza³.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Do tej pory ¿y³eœ na w³asny rachunek, ale to siê od dziœ zmieni. Moi ludzie trzymaj¹ siê razem. Do Stra¿ników nale¿y dbanie o bezpieczeñstwo Magnatów, rudy, obozu i kopalni.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Ruda wydobywana jest przez Kopaczy, ale to my pilnujemy, ¿eby nie po¿ar³y ich pe³zacze. Pertraktacje z królem prowadz¹ Magnaci, ale to my dbamy o ich bezpieczeñstwo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Dniem i noc¹ strze¿emy korytarzy kopalni. Dniem i noc¹ pilnujemy bram Obozu i pozwalamy jego mieszkañcom wieœæ spokojne ¿ycie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Na pocz¹tku byliœmy tylko bez³adn¹ zgraj¹, ale staliœmy siê si³¹, z któr¹ ka¿dy musi siê liczyæ. Ciê¿ko pracowaliœmy, by zas³u¿yæ na tê reputacjê.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od moich ludzi oczekujê wiêc wy³¹cznie jednego: lojalnoœci. Tylko stoj¹c ramiê w ramiê bêdziemy w stanie obroniæ to, co nale¿y do nas...
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //...i przetrwaæ.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Pozosta³ych rzeczy dowiesz siê w swoim czasie. B¹dŸ gotów do pomocy ka¿demu, kto jej potrzebuje, niewa¿ne jak trudne i niebezpieczne to zadanie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //IdŸ do Stone'a i poproœ go o zbrojê i miecz.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Znajdziesz go w kuŸni, w Wewnêtrznym Pierœcieniu.

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
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //A, i jeszcze coœ...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Witamy w Stra¿y...
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,	"Dziœ Thorus przyj¹³ mnie w poczet Stra¿ników. Mogê teraz odebraæ nale¿ny mi pancerz. Dostanê go od Stone'a, w zamku.");
	
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
	description		= "Interesuje mnie œcie¿ka magii..."; 
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
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Interesuje mnie œcie¿ka magii...
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //W takim razie powinieneœ porozmawiaæ z Corristo. To on uczy³ Miltena. Chyba nie powinno byæ ¿adnych przeciwwskazañ.

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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mogê ci pomóc w rozwiniêciu twojej zrêcznoœci i si³y.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus pomo¿e mi popracowaæ nad moj¹ si³¹ i zrêcznoœci¹.");
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
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  GRD_200_Thorus_TEACH_2H (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_TEACH_2H_Condition;
	information		= GRD_200_Thorus_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ?"; 
};
//
FUNC int  GRD_200_Thorus_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  GRD_200_Thorus_TEACH_2H_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"GRD_200_Thorus_TEACH_2H_Info_09_02"); //Szkolê tylko i wy³¹cznie cz³onków naszego Obozu. Wolê ju¿ uczyæ machaæ kilofem byle Kopacza ni¿ jakiegoœ wyrzutka. 

	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko zostanê cz³onkiem Starego Obozu.");
		log_thorusfight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
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
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
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
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_00"); //Chcia³bym nauczyæ siê walki dwurêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_01"); //Bronie dwurêczne wymagaj¹ sporo si³y. S¹ ciê¿kie, a przez to tak¿e wolniejsze.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_02"); //Zmieni siê to jednak w trakcie czynienia przez ciebie postêpów w nauce.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_03"); //Za powolnoœæ bronie dwurêczne odwdziêcz¹ ci siê potê¿nymi obra¿eniami.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_04"); //Ka¿d¹ broñ musisz odpowiednio wyczuæ. Topory s¹ inaczej zbalansowane ni¿ miecze. Pamiêtaj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_06"); //Musisz pracowaæ nad swoj¹ si³¹. Pozwoli ci ona wykonywaæ szybsze ruchy i podnosiæ coraz ciê¿sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_07"); //PóŸniej bêdziesz musia³ poznaæ odpowiedni¹ technikê walki i ³¹cznia ciosów. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_08"); //Na razie nie jesteœ wstanie zadaæ pe³nych obra¿eñ na jakie pozwala ci dana broñ. Spokojnie, zajmiemy siê tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwurêcznych broni?
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_11"); //S¹ d³ugie... Im d³u¿sze tym dalej od siebie mo¿esz trzymaæ przeciwnika. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_12"); //Gdy kupujesz broñ zwracaj uwagê na jej górn¹ czêœæ. Jeœli jest wystarczaj¹co ostra to nawet draœniêcie oponenta z daleka zada mu obra¿enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_14"); //Nie, nie, nie. Omówimy to na nastêpnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy³em ciê jak porz¹dnie trzymaæ broñ i jak wykorzystaæ si³ê bezw³adnoœci ostrza.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_16"); //Pamiêtaj, ¿e im lepiej wyczujesz balans broni tym ³atwiej bêdzie ci ³¹czyæ kolejne ciosy.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_17"); //Musisz wiedzieæ, w którym momencie ponownie siê zamachn¹æ, tak by wykorzystaæ przy tym impet pierwszego uderzenia. Pozwoli ci to oszczêdziæ si³y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_18"); //Stosuj ró¿ne strategie walki. Uderzaj raz z przodu, raz z boku. A póŸniej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_19"); //Uniki z dwurêcznym mieczem w rêku faktycznie mog¹ byæ trudne, dlatego musisz parowaæ ciosy. Æwicz si³ê miêœni r¹k, pleców i klatki piersiowej. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowaæ, bez ryzyka po³amania sobie czegoœ. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
	};
};

FUNC VOID Thorus_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Thorus_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_26"); //To ju¿ nasza ostatnia lekcja. Poka¿ê ci sztuczki, które pozwol¹ ci jeszcze lepiej wyczuæ broñ.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_27"); //Musisz nauczyæ siê rozpoznawaæ s³abe punkty przeciwników i skupiaæ siê na nich.
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Thorus_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(GRD_200_Thorus_TEACH_2H_START);
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,DIALOG_BACK,GRD_200_Thorus_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Thorus_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Thorus_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Thorus_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Thorus_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Thorus_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Thorus_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Thorus_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Thorus_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Thorus_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(GRD_200_Thorus_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Thorus_teach_2h10);
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
	if //(Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2) //to trzeba usun¹æ && 
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chcia³bym nauczyæ siê pos³ugiwaæ dwurêcznym mieczem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy siê podstawami.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"GRD_200_Thorus_NO_ENOUGHT_STR_1"); //Musisz jeszcze sporo poæwiczyæ zanim nauczysz siê dobrze walczyæ!
	PrintScreen	("Warunek: Si³a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o walce dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
	}
	else
	{
	AI_Output			(self,other,"GRD_200_Thorus_NO_ENOUGHT_STR_1"); //Musisz jeszcze sporo poæwiczyæ zanim nauczysz siê dobrze walczyæ!
	PrintScreen	("Warunek: Si³a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
   description	= "Œwistak okaza³ siê byæ zdrajc¹!";
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
    AI_Output (other, self ,"DIA_THORUS_ZDRADA_15_01"); //Œwistak okaza³ siê byæ zdrajc¹!
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_02"); //Tak, s³ysza³em ju¿ o tym.
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_03"); //Przebrzyd³y sukinsyn. Nie wyp³aci siê do koñca ¿ycia!
    AI_Output (self, other ,"DIA_THORUS_ZDRADA_03_04"); //Ale tobie chyba nale¿y siê jakaœ nagroda. WeŸ tê rudê.
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
   description	= "Z³y zabi³ Neka!";
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
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_01"); //Z³y zabi³ Neka!
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_02"); //Doprawdy?
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_03"); //A masz na to dowody?
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_04"); //Tak. Skaza mówi³...
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_05"); //Ha ha! Skaza mówi³... Ten œmierdz¹cy Szkodnik? 
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_06"); //Ch³opcze, wiesz gdzie ja mam to, co Skaza mówi³?
    AI_Output (other, self ,"DIA_THORUS_DEDLIGO_15_07"); //W dupie?
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_08"); //Dok³adnie. Mam doœæ tego z³odzieja i tego, ¿e wszystko uchodzi mu na sucho.
    AI_Output (self, other ,"DIA_THORUS_DEDLIGO_03_09"); //ZnajdŸ mi prawdziwe dowody lub co najmniej trzech œwiadków i wtedy przyjdŸ.
    B_LogEntry                     (CH1_SpysProblems,"Thorus nie wierzy w s³owa Skazy. Muszê znaleŸæ œwiadków lub jakieœ dowody.");
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
   description	= "Mam trzech œwiadków.";
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
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_01"); //Mam trzech œwiadków.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_02"); //Co?!
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_03"); //Ktoœ tu chyba za bardzo wierzy w swoich ludzi.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_04"); //A ja przecie¿ mówi³em, ¿e coœ jest na rzeczy.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_05"); //Nie denerwuj mnie!
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_06"); //No chodŸ. Jesse, Kyle i Tippler chc¹ z tob¹ porozmawiaæ.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_07"); //Dobra, wierzê ci.
	AI_TurnAway (GRD_200_Thorus,other);
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_08"); //Ch³opcy! Wiecie, co robiæ. Zaj¹æ siê nim.
	AI_TurnToNpc(GRD_200_Thorus,hero);
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_09"); //Jestem zawiedziony. Ufa³em Z³emu. 
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_10"); //Obawiam siê o rekrutacje w Obozie. Muszê porozmawiaæ z Diego.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_11"); //Jednak w dalszym ci¹gu uwa¿am, ¿e Skaza to z³odziej.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_12"); //Porozmawiajmy o moim wynagrodzeniu.
    AI_Output (self, other ,"DIA_THORUS_ICHTROJE_03_13"); //Zapomnij. Nic ci nie kaza³em.
    AI_Output (other, self ,"DIA_THORUS_ICHTROJE_15_14"); //Szkoda. To ja ju¿ sobie pójdê.
    B_LogEntry                     (CH1_SpysProblems,"Gdy Thorus dowiedzia³ siê o machlojkach Z³ego, natychmiast rozkaza³ zamkn¹æ go w lochach. Skaza bêdzie bardzo zadowolony z takiego obrotu spraw.");
	
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
   description	= "Masz dla mnie jakieœ zadanie?";
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
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_01"); //Masz dla mnie jakieœ zadanie?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_02"); //Coœ ma³ego na pewno siê znajdzie.
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_03"); //W czym rzecz?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_04"); //Dawno nie widzia³em tu nikogo nowego, ¿adnej nowej twarzy. Skazañcy widocznie nas omijaj¹.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_05"); //Uciekaj¹ do innych obozów, a przecie¿ tu maj¹ pracê, jedzenie i inne wygody...
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_06"); //Jak tak dalej pójdzie to nied³ugo braknie nam górników w kopalni. 
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_07"); //Jak temu zaradziæ?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_08"); //Przypuszczam, ¿e na placu wymian dzieje siê coœ z³ego. 
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_09"); //TO BULLIT!
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_10"); //Bullit? Niby dlaczego?
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_11"); //Gdy zrzucono mnie za Barierê, dosta³em od niego porz¹dnie w pysk.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_12"); //hmm, doprawdy? Myœla³em, ¿e spad³eœ z konia. He he...
    AI_Output (other, self ,"DIA_THORUS_QuestGRD1_15_13"); //Darujmy sobie docinki...
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_14"); //W porz¹dku. Tak tylko ¿artowa³em.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_15"); //Mo¿e i Bullit macza w tym palce. Bêdê musia³ z nim pogadaæ, ale zanim to zrobiê...
	AI_Output (self, other ,"DIA_THORUS_QuestGRD1_03_16"); //Dziœ mieli zostaæ zrzuceni nowi skazañcy. PrzyprowadŸ mi jednego. Jeœli Bullit, któregoœ z nich odstraszy³, to niech mi o tym powie.
	
    MIS_BullitBadass = LOG_RUNNING;
	
    Log_CreateTopic         (CH2_BullitBadass, LOG_MISSION);
    Log_SetTopicStatus      (CH2_BullitBadass, LOG_RUNNING);
    B_LogEntry              (CH2_BullitBadass,"Thorus kaza³ mi odkryæ, który z jego ludzi odstrasza nowych skazañców. Jestem pewien, ¿e to wina Bullita. Muszê tylko znaleŸæ na niego jakieœ dowody. Dziœ na plac wymian maj¹ zostaæ zrzuceni nowi skazañcy. Je¿eli kogoœ tam spotkam, mam zadbaæ, aby przyby³ do Starego Obozu.");
	
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
   description	= "By³em na placu wymian.";
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
    AI_Output (other, self ,"DIA_THORUS_Swadek_15_01"); //By³em na placu wymian. Rozmawia³em z nowym skazañcem.
    AI_Output (self, other ,"DIA_THORUS_Swadek_03_02"); //W³aœnie zauwa¿y³em go w Obozie. Jakieœ przemyœlenia?
    AI_Output (other, self ,"DIA_THORUS_Swadek_15_03"); //Powinieneœ z nim pogadaæ. Ja zrobi³em, to co mia³em zrobiæ.
    AI_Output (self, other ,"DIA_THORUS_Swadek_03_04"); //No dobra, zobaczymy co mi powie. Mo¿esz ju¿ iœæ.

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
// DIALOG USUNIÊTY =======================
//========================================
INSTANCE DIA_THORUS_HahahaSpierdalaj (C_INFO)
{
   npc          = GRD_200_THORUS;
   nr           = 1;
   condition    = DIA_THORUS_HahahaSpierdalaj_Condition;
   information  = DIA_THORUS_HahahaSpierdalaj_Info;
   permanent	= FALSE;
   description	= "Bartholo pozwoli³ mi rozmawiaæ z Gomezem.";
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
    AI_Output (other, self ,"DIA_THORUS_HahahaSpierdalaj_15_01"); //Bartholo pozwoli³ mi rozmawiaæ z Gomezem.
    AI_Output (self, other ,"DIA_THORUS_HahahaSpierdalaj_03_02"); //Widzia³em, ¿e o czymœ z nim rozmawia³eœ.
    AI_Output (self, other ,"DIA_THORUS_HahahaSpierdalaj_03_03"); //No dobrze. Skoro taka jest jego wola, to mo¿esz wejœæ.
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;   
	MIS_KosztemQuentina = LOG_RUNNING;

    Log_CreateTopic            (CH1_KosztemQuentina, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KosztemQuentina, LOG_RUNNING);
    B_LogEntry                     (CH1_KosztemQuentina,"Zdecydowa³em siê porzuciæ Bandytów i iœæ prosto do Gomeza. Taka szansa ju¿ siê nie powtórzy.");

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
   description	= "Flint odnalaz³ œcie¿kê do Wolnej Kopalni.";
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
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_01"); //Przysy³a mnie niejaki Flint. Mam ci przekazaæ ¿e odnalaz³ œcie¿kê do Wolnej Kopalni.
	if (Npc_GetTrueGuild(hero) == GIL_SFB) || (Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_02"); //Uda³o ci siê go znaleŸæ?
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_03"); //Tak, trochê siê zagubi³, ale pomog³em mu uzupe³niæ brakuj¹ce czêœci uk³adanki.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_04"); //To œwietnie. Czujê, ¿e informacje, które wkrótce przeka¿e mi Flint mog¹ nam siê bardzo przydaæ.
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_05"); //Myœlisz o ataku na Woln¹ Kopalnie?
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_06"); //A o czym innym? Przecie¿ nie pójdziemy t¹ œcie¿k¹ do nich na herbatkê!
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_08"); //A co do ciebie: wykona³eœ kawa³ œwietnej roboty. Przyda nam siê ktoœ taki jak ty.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_09"); //Mam rozumieæ, ¿e chcesz siê spotkaæ z Gomezem?
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_10"); //Jasne.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_11"); //W takim razie Stra¿nicy przy bramie nie bêd¹ robiæ ci problemów.
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_12"); //Ach, i jeszcze jedno!
    AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_13"); //Tak?
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_14"); //Jak w ogóle znalaz³eœ Flinta?
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_15_15"); //Najemnik Okyl chcia³ ¿ebym go zabi³. Ja jednak postanowi³em siê z nim dogadaæ.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_16"); //M¹drze post¹pi³eœ. Zanim pójdziesz do Gomeza wróæ do Okyla i powiedz mu, ¿e zabi³eœ Flinta.
    AI_Output (self, other ,"DIA_THORUS_FlintFindPath_03_17"); //Tylko pamiêtaj, ¿eby to zrobiæ, ZANIM wst¹pisz w szeregi Cieni.
	
    B_LogEntry                     (CH1_FlintsOffer,"Zgodnie z poleceniem Flinta Thorus dowiedzia³ siê ode mnie o œcie¿ce przez góry. Otrzyma³em wstêp na plac zamkowy. Zanim jednak pójdê do Gomeza muszê wróciæ do Okyla i powiedzieæ mu, ¿e zabi³em Flinta. Wszystko po to, by st³umiæ podejrzenia Najemników.");

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
   // B_LogEntry               (CH1_SayOkylFlintDead,"Zanim do³¹czê do Obozu, bêdê musia³ powiedzieæ Okylowi, ¿e Flint nie ¿yje. ");
    AI_StopProcessInfos	(self);
	}
	else 
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_19"); //Flint? Doprawdy? 
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_20"); //Tak, natkn¹³em siê na niego w okolicach Wolnej Kopalni. Postanowi³em mu pomóc wróciæ do obozu. 
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_21"); //I uda³o mu siê czegoœ dowiedzieæ?
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_22"); //Znalaz³ ukryt¹ œcie¿kê do Kot³a. Gdyby nie ja, by³by martwy.
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_NOPE_23"); //Dziwi mnie twoja bezinteresownoœæ. Czego ode mnie oczekujesz? Chcesz siê spotkaæ z Gomezem? A mo¿e liczy siê tylko ruda.
	
	Info_ClearChoices (DIA_Thorus_FlintFindPath);
	Info_AddChoice (DIA_THORUS_FlintFindPath,"Chcê siê spotkaæ z Gomezem.",DIA_THORUS_FlintFindPath_GOMEZ);
	Info_AddChoice (DIA_THORUS_FlintFindPath,"Wystarczy mi ruda.",DIA_THORUS_FlintFindPath_ORE);
	
	MIS_FlintsOffer = LOG_FAILED;
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_FAILED);
    B_LogEntry                     (CH1_FlintsOffer,"Nie zyska³em sympatii Thorusa. Lepiej nie bêdê mu teraz wchodzi³ w drogê.");
	};
};

func void DIA_THORUS_FlintFindPath_GOMEZ ()
{
	AI_Output (other, self ,"DIA_THORUS_FlintFindPath_HERO_24"); //Chcê siê spotkaæ z Gomezem.
	if (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_PSIONIC_25"); //Nic ci po spotkaniu z Gomezem. Lepiej wracaj na bagna.
	}
	else if (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_KDF) //Nie wiadomo co Psimogoth wykombinuje tym razem :))))
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_WTF_26"); //Jeszcze nie zd¹¿y³eœ siê na niego napatrzeæ? Wracaj do swojej roboty.
	}
	else //no kurwa albo bandyta, albo ktoœ z nowego obozu - innej opcji nie ma, chyba ¿e Psimogoth znowu coœ odjebie...
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_BAN_27"); //Ktoœ twojego pokroju chcia³by siê zobaczyæ z Gomezem tylko po to, ¿eby go zabiæ. Nie pozwolê na to.
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
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_ORE_HH_29"); //Masz! Mo¿esz siê schlaæ do nieprzytomnoœci.
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget,100);
	}
	else 
	{
	AI_Output (self, other ,"DIA_THORUS_FlintFindPath_GOMEZ_BAN_27"); //Ktoœ twojego pokroju chcia³by siê zobaczyæ z Gomezem tylko po to, ¿eby go zabiæ. Nie pozwolê na to.
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
   description	= "Masz dla mnie jakieœ inne zadanie?";
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
    AI_Output (other, self ,"DIA_THORUS_QuestGRD_15_01"); //Masz dla mnie jakieœ inne zadanie?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_02"); //Ju¿ ci siê znudzi³o?
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_03"); //No to w takim razie mo¿esz eskortowaæ Kopaczy do Starej Kopalni.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_04"); //Pomo¿e ci w tym trzech moich ludzi.
    AI_Output (self, other ,"DIA_THORUS_QuestGRD_03_05"); //Pogadaj ze stra¿nikiem konwoju. On da ci dalsze instrukcje.
    MIS_BuddlersEscort = LOG_RUNNING;

    Log_CreateTopic          (CH2_BuddlersEscort, LOG_MISSION);
    Log_SetTopicStatus       (CH2_BuddlersEscort, LOG_RUNNING);
    B_LogEntry               (CH2_BuddlersEscort,"Wreszcie coœ ciekawego. Tym razem mam eskortowaæ Kopaczy do Starej Kopalni. Wiêcej informacji uzyskam od stra¿nika konwoju. Chyba widzia³em go na placu zamkowym.");
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
   description	= "Zakoñczy³em eskortê. Masz dla mnie kolejne zlecenie?";
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
    AI_Output (other, self ,"DIA_THORUS_ZLECENIE_NA_OBRONE_15_01"); //Zakoñczy³em eskortê. Masz dla mnie kolejne zlecenie?
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_02"); //Tak. Podczas twojej nieobecnoœci wrócili do mnie zwiadowcy z placu wymian.
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_03"); //Grupka Bandytów chce zaatakowaæ to miejsce i obrabowaæ skrzynie. Mamy tam ledwie szeœciu ludzi i jednego robotnika.
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_04"); //IdŸ tam i dopilnuj, ¿eby ¿aden Bandyta nie prze¿y³. 
    AI_Output (self, other ,"DIA_THORUS_ZLECENIE_NA_OBRONE_03_05"); //Tylko siê poœpiesz!
    MIS_ReplacePointDefense = LOG_RUNNING;

    Log_CreateTopic          (CH2_ReplacePointDefense, LOG_MISSION);
    Log_SetTopicStatus       (CH2_ReplacePointDefense, LOG_RUNNING);
    B_LogEntry               (CH2_ReplacePointDefense,"Muszê jak najszybciej udaæ siê na plac wymian. podobno grupa Bandytów chce napaœæ na naszych ludzi.");
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
	
	GRD_2005_Stra¿nik.flags = NPC_FLAG_IMMORTAL;
	GRD_2002_Stra¿nik.flags = NPC_FLAG_IMMORTAL;
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
   description	= "By³em na placu wymian.";
};

FUNC INT DIA_THORUS_PLAC_WYMIAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_OBRONA))
    && (Npc_KnowsInfo (hero, DIA_Robotnik_OBRONA_2))
    && (Npc_KnowsInfo (hero, DIA_Stra¿nik_OBRONA_1))
    && (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_THORUS_PLAC_WYMIAN_Info()
{
    AI_Output (other, self ,"DIA_THORUS_PLAC_WYMIAN_15_01"); //By³em na placu wymian. Rzeczywiœcie krêci³ siê tam spory oddzia³ Bandytów.
    AI_Output (other, self ,"DIA_THORUS_PLAC_WYMIAN_15_02"); //Uda³o nam siê ich pozbyæ.
    AI_Output (self, other ,"DIA_THORUS_PLAC_WYMIAN_03_03"); //Doskonale. To oduczy Quentina zadzierania z moimi ludŸmi.
    AI_Output (self, other ,"DIA_THORUS_PLAC_WYMIAN_03_04"); //Masz tu swój ¿o³d. 
    B_LogEntry                     (CH2_ReplacePointDefense,"Zadanie zosta³o wykonane. Plac wymian jest bezpieczny.");
    Log_SetTopicStatus       (CH2_ReplacePointDefense, LOG_SUCCESS);
    MIS_ReplacePointDefense = LOG_SUCCESS;

    B_GiveXP (158);
	
	GRD_2005_Stra¿nik.flags = 0;
	GRD_2002_Stra¿nik.flags = 0;
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
    AI_Output (other, self ,"DIA_THORUS_QuestsForGuradians_15_01"); //Chcê wys³aæ Stra¿ników na misje.
    AI_Output (self, other ,"DIA_THORUS_QuestsForGuradians_03_02"); //Co konkretnie chcesz zrobiæ?

    Info_ClearChoices		(DIA_THORUS_QuestsForGuradians);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, DIALOG_BACK, DIA_THORUS_QuestsForGuradians_BACK);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Zaatakujcie Bandytów! (zysk: 200 bry³ek, Stra¿nicy: 10)", DIA_THORUS_QuestsForGuradians_NpadNaBadytow);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Przeszukajcie lasy! (zysk: 300 bry³ek, Stra¿nicy: 15)", DIA_THORUS_QuestsForGuradians_ExploreWood);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Polujcie na wilki! (zysk: skóry, stra¿nicy: 10)", DIA_THORUS_QuestsForGuradians_PolowanieNaWilki);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Zdob¹dŸcie miêso! (zysk: miêso, Stra¿nicy: 10)", DIA_THORUS_QuestsForGuradians_PolujcieNaPotwory);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Napadajcie na w³óczêgów! (zysk: 150 bry³ek, Stra¿nicy: 5)", DIA_THORUS_QuestsForGuradians_Grabieze);
    Info_AddChoice		(DIA_THORUS_QuestsForGuradians, "Polujcie na plugawe stworzenia! (zysk: 550 bry³ek, Stra¿nicy: 20)", DIA_THORUS_QuestsForGuradians_PolujcieNaBesie);
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
   description	= "Jak wygl¹daj¹ stosunki z Nowym Obozem?";
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
    AI_Output (other, self ,"DIA_THORUS_StosunkiZNO_15_01"); //Jak wygl¹daj¹ stosunki z Nowym Obozem?
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_03_02"); //Nie jest najlepiej. Ostatnio relacje siê och³odzi³y.
    AI_Output (self, other ,"DIA_THORUS_StosunkiZNO_03_03"); //Przypuszczam, ¿e Najemnicy wpadli na trop naszych ludzi.

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
    AI_Output (self, other ,"DIA_log_Sprawa2_03_01"); //Hej. Mam kolejn¹ wa¿n¹ sprawê.
    AI_Output (other, self ,"DIA_log_Sprawa2_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_log_Sprawa2_03_03"); //Nasi ludzie zostali zaatakowani, poluj¹c na kretoszczury.
    AI_Output (self, other ,"DIA_log_Sprawa2_03_04"); //Szkodnicy z Nowego Obozu uwa¿aj¹, ¿e wkroczyliœmy na ich teren ³owiecki.
    AI_Output (self, other ,"DIA_log_Sprawa2_03_05"); //Mamy wycofaæ wojska, czy walczyæ?

    Info_ClearChoices		(DIA_log_Sprawa2);
    Info_AddChoice		(DIA_log_Sprawa2, "Walczcie! (500 bry³ek rudy, 30 sztuk miêsa)", DIA_log_Sprawa2_Zostancie);
    Info_AddChoice		(DIA_log_Sprawa2, "Wycofajcie siê! (lepsze stosunki z NO)", DIA_log_Sprawa2_Wycofaj);
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
    AI_Output (other, self ,"DIA_log_Sprawa2_Wycofaj_15_01"); //Wycofajcie siê!
    AI_Output (self, other ,"DIA_log_Sprawa2_Wycofaj_03_02"); //Skoro w³aœnie tego chcesz.
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
   description	= "Zajmijmy siê sprawami Nowego Obozu.";
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
    AI_Output (other, self ,"DIA_log_NCSprawy_15_01"); //Zajmijmy siê sprawami Nowego Obozu.
    AI_Output (self, other ,"DIA_log_NCSprawy_03_02"); //Jest kilka wa¿nych spraw do omówienia.

    Info_ClearChoices		(DIA_log_NCSprawy);
    Info_AddChoice		(DIA_log_NCSprawy, DIALOG_BACK, DIA_log_NCSprawy_BACK);
	if (watermage_enterto_temple == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Pozwól Magom Wody zbadaæ œwi¹tynie w dolinie.", DIA_log_NCSprawy_Temple);
	};
	if (trade_with_ricelord == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Zezwól na handel z Nowym Obozem. (handel przyniesie ma³e dochody!)", DIA_log_NCSprawy_WymieniajRudenaRyz);
	};
	if (trade_with_idiots == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Przymuœ Bractwo do wstrzymania handlu z Nowym Obozem.", DIA_log_NCSprawy_HandelBractwoNC);
	};
	if (more_guradians_conwoy == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Wzmocnij ochronê konwojów z rud¹. (zwiêksza zyski z wymiany!)", DIA_log_NCSprawy_WzmocnijStraze);
	};
	if (guardians_back_to_OC == false)
	{
    Info_AddChoice		(DIA_log_NCSprawy, "Wycofaj myœliwych z terenów Nowego Obozu! (zmniejszony zysk)", DIA_log_NCSprawy_WycofajCieni);
	};
};

FUNC VOID DIA_log_NCSprawy_BACK()
{
    Info_ClearChoices		(DIA_log_NCSprawy);
};

FUNC VOID DIA_log_NCSprawy_Temple()
{
    AI_Output (other, self ,"DIA_log_NCSprawy_Temple_15_01"); //Pozwól Magom Wody zbadaæ œwi¹tynie w dolinie.
    AI_Output (self, other ,"DIA_log_NCSprawy_Temple_03_02"); //Corristo nie bêdzie zadowolony...
    OpiniaNC = OpiniaNC + 10;
	OpiniaOC = OpiniaOC - 1;
	watermage_enterto_temple = true;
};

FUNC VOID DIA_log_NCSprawy_WymieniajRudenaRyz()
{
    AI_Output (other, self ,"DIA_log_NCSprawy_WymieniajRudenaRyz_15_01"); //Zezwól na handel z Nowym Obozem.
    AI_Output (self, other ,"DIA_log_NCSprawy_WymieniajRudenaRyz_03_02"); //Ten handel jest ma³o dochodowy. Miej to na uwadze. Sprawami ekonomicznymi Obozu zajmuje siê Bartholo.
    OpiniaNC = OpiniaNC + 5;
	OpiniaOC = OpiniaOC - 1;
	trade_with_ricelord = true;
	przychody_obozu = przychody_obozu + 70;
};

FUNC VOID DIA_log_NCSprawy_HandelBractwoNC()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_HandelBractwoNC_15_01"); //Przymuœ Bractwo do wstrzymania handlu z Nowym Obozem.
    AI_Output (self, other ,"DIA_log_NCSprawy_HandelBractwoNC_03_02"); //Znacz¹co poprawi to nasze przychody. Bartholo bêdzie z ciebie zadowolony, ale Lee siê nieŸle wkurzy.
    OpiniaNC = OpiniaNC - 5;
	OpiniaOC = OpiniaOC + 10;
	trade_with_idiots = true; 
	przychody_obozu = przychody_obozu + 100;
};

FUNC VOID DIA_log_NCSprawy_WzmocnijStraze()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_WzmocnijStraze_15_01"); //Wzmocnij ochronê konwojów z rud¹.
    AI_Output (self, other ,"DIA_log_NCSprawy_WzmocnijStraze_03_02"); //Gomez nigdy siê tym nie zaj¹³... Dobrze!
	OpiniaNC = OpiniaNC - 5;
	OpiniaOC = OpiniaOC + 5;
	more_guradians_conwoy = true;
	przychody_obozu = przychody_obozu + 30;
	
};
func void DIA_log_NCSprawy_WycofajCieni ()
{
	AI_Output (other, self ,"DIA_log_NCSprawy_WzmocnijStraze_15_01"); //Wycofaj myœliwych z rejonów Nowego Obozu.
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
1. +20 zysk ma³y 
2. +10 zysk ma³y
te s¹ ok 

3. +5 zysk ma³y, strata! 

4. -5, du¿y zysk
5. - 5, du¿y zysk 
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
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_01"); //Stój! Masz szczêœcie, ¿e ciê nie by³o w Obozie. Inaczej pomyœla³bym, ¿e na pewno macza³eœ w tym swoje paluchy.
    AI_Output (other, self ,"DIA_THORUS_SCAR_DIE_15_02"); //Nie bardzo rozumiem. Co siê sta³o?
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_03"); //Zabito Magnata. Ot co siê sta³o! Mam teraz pe³ne rêce roboty. Zabójca mia³ na sobie zbrojê moich ludzi.
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_04"); //Jeœli oka¿e siê, ¿e dosz³o do zdrady Gomez urwie mi ³eb!
    AI_Output (other, self ,"DIA_THORUS_SCAR_DIE_15_05"); //Jeœli bêdê coœ wiedzia³ na jego temat z pewnoœci¹ ci powiem.
    AI_Output (self, other ,"DIA_THORUS_SCAR_DIE_03_06"); //Ta... Z pewnoœci¹. IdŸ ju¿ i nie krêæ siê tu!
    B_LogEntry                     (CH3_ScarMurder,"Thorus zaczepi³ mnie i powiedzia³, ¿e w Starym Obozie zabito Magnata Bliznê. To Kosa macza³ w tym palce. Muszê szybko do niego wróciæ po wyjaœnienia.");

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
   description	= "Baal Taran chce zrobiæ z kowala Huno kolejnego œwira.";
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
    AI_Output (other, self ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_15_01"); //Baal Taran chce zrobiæ z kowala Huno kolejnego œwira.
    AI_Output (other, self ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_15_02"); //Namawia mnie, abym spróbowa³ w jakiœ sposób uzale¿niæ kowala od bagiennego ziela. Jednak nie chcê tego robiæ.
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_03"); //Huno jest wa¿n¹ osob¹ w Obozie. Zaopatruje Zewnêtrzny Pierœcieñ w broñ oraz wyrabia kilofy.
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_04"); //Dobrze, ¿e mi o tym powiedzia³eœ. Ju¿ ja sobie porozmawiam z tym Nowicjuszem. 
    B_GiveInvItems (self, other, ItMiNugget, 150);
    AI_Output (self, other ,"DIA_THORUS_POKABLOWAC_DOBRA_RZECZ_03_05"); //Myœlê, ¿e powinieneœ porozmawiaæ z Huno i mu o tym powiedzieæ. Mo¿e jakoœ ciê wynagrodzi? Kto wie...
    B_LogEntry                     (CH1_Druggy,"Popsu³em zadanie, ale myœlê, ¿e przys³u¿y³em siê Staremu Obozowi. Kowal to wa¿ny mieszkaniec Obozu.");
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
   description	= "Chcia³bym dostaæ siê do zamku.";
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
    AI_Output (other, self ,"DIA_Thorus_BANDYTA_GATE_15_01"); //Chcia³bym dostaæ siê do zamku.
    AI_Output (self, other ,"DIA_Thorus_BANDYTA_GATE_03_02"); //Chyba ¿artujesz. Nosisz pancerz jednego z tych sukinsynów, którzy atakuj¹ nasze konwoje. Zapomnij o tym. 
    AI_Output (self, other ,"DIA_Thorus_BANDYTA_GATE_03_03"); //Nie wiem, czy jesteœ w bandzie Quentina, ale widzê, ze masz z nim jakiœ kontakt. Nie chcê mieæ z tob¹ nic wspólnego.	
	
	Log_CreateTopic		(CH1_CastleEntranceBandit,LOG_MISSION);
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_RUNNING);
	B_LogEntry			(CH1_CastleEntranceBandit,"Thorus nie chce mnie wpuœciæ do zamku, bo zadajê siê z Quentinem. Jedynym sposobem na wejœcie do zamku jest przekupstwo. Problem w tym, ¿e tysi¹c bry³ek rudy to ca³kiem sporo, a w¹tpiê ¿eby Quentin chcia³ mi to zrefundowaæ...");
	
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
    AI_Output (self, other ,"DIA_Thorus_DIEGO_PASS_03_01"); //Naprawdê nie wiem coœ ty za jeden i sk¹d masz ten pancerz, ale Diego rêczy za ciebie, wiêc mo¿esz przejœæ.
    AI_Output (self, other ,"DIA_Thorus_DIEGO_PASS_03_02"); //Tylko szybko. Nie chcê ciê ju¿ ogl¹daæ!
    AI_StopProcessInfos	(self);
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	Log_SetTopicStatus	(CH1_CastleEntranceBandit,LOG_SUCCESS);
	B_LogEntry			(CH1_CastleEntranceBandit,"Uda³o siê! Wiedzia³em, ¿e na Diego mo¿na polegaæ. Teraz mam dostêp do zamku.");
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
    AI_Output (self, other ,"DIA_Thorus_WPADKA_BERG_03_01"); //Hej, ty! S³ysza³em, ¿e chcia³eœ okraœæ piwnice Magnatów i zaatakowa³eœ jednego z moich ch³opców, w celu zdobycia klucza do nich.
    AI_Output (other, self ,"DIA_Thorus_WPADKA_BERG_15_02"); //Mogê to wyjaœniæ.
    AI_Output (self, other ,"DIA_Thorus_WPADKA_BERG_03_03"); //WsadŸ sobie w dupê te wyjaœnienia! Osobiœcie dopilnujê, ¿eby r¹czki ciê wiêcej nie œwierzbi³y, sukinsynu!
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
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_01"); //Gravo doniós³ mi, ¿e pracujesz dla Bandytów.
    AI_Output (other, self ,"DIA_THORUS_PRZEGRANA_GRY_15_02"); //I co w zwi¹zku z tym?
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_03"); //To, ¿e nie do¿yjesz jutra wstrêtny sukinsynu.
    AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_04"); //Chyba, ¿e wyjawisz mi, gdzie znajduje siê ta wylêgarnia robactwa.
    AI_Output (other, self ,"DIA_THORUS_PRZEGRANA_GRY_15_05"); //Sam nie mam pojêcia, gdzie to jest. 
    AI_Output (self, other ,"DIA_THORUS_PRZEGRANA_GRY_03_06"); //Doœæ!
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
   description	= "Dlaczego porzuci³eœ Stary Obóz?";
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
    AI_Output (other, self ,"DIA_THORUS_Kapitel4_Camp_15_01"); //Dlaczego porzuci³eœ Stary Obóz?
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_02"); //Kolejny raz wtr¹casz siê w nie swoje sprawy. 
    AI_Output (other, self ,"DIA_THORUS_Kapitel4_Camp_15_03"); //Jestem po prostu ciekaw.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_04"); //Ciekawoœæ to pierwszy stopieñ do piek³a, ale niech ci bêdzie. Pomogê ci siê tam dostaæ...
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_06"); //Gomez po raz kolejny udowodni³ jakim jest durniem. Mówi³em mu, ¿eby nie wysy³aæ tak ma³ego oddzia³u na Obozu Bandytów.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_07"); //To by³a pewna œmieræ dla naszych Stra¿ników, a ja mam jedn¹ zasadê: jestem lojalny wobec swoich ludzi.
    AI_Output (self, other ,"DIA_THORUS_Kapitel4_Camp_03_08"); //Gomez po prostu tego nie rozumia³.
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
    AI_Output (self, other ,"DIA_Thorus_Kapitel4_Raven_03_02"); //W Starym Obozie, a co? Chcesz pogadaæ z szefem.
	AI_Output (other, self ,"DIA_Thorus_Kapitel4_Raven_15_03"); //Jestem ciekaw, co tam robi.
    AI_Output (self, other ,"DIA_Thorus_Kapitel4_Raven_03_04"); //To nie twoja sprawa! Za³atwia wa¿ne interesy!
};