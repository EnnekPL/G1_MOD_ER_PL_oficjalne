// *************************
// Globalvariablen f¸r Story
// *************************
var int	FM_GateOpen;//oryginalna gry


//**************************
// stringi (xD) podczas nauki atrybutÛw
//**************************
var int public_str_cost;
var int public_dex_cost;
var int public_man_cost;

//**************************
// Zmienne c_item
//**************************
var c_item obecny_pancerz;

//**************************
// Zmienne devmode
//**************************
var int devmode_dia_WykonanoXD;
var int devmode_dia_DIA_Quentin_PrzejscieDalej;
var int devmode_dostawyalkoholu;
// *************************
// Pomocnicze zmienne zadaÒ Er 1.4
// *************************
var int Calash_gototavern;
var int Shrat_gototavern;

var int hero_knows_RatfordKiller;
var int Gravo_doniosl_Thorusowi;
var int Trip_wykryty;
var int wpadka_Flint_Jarvis;
var int odliczanie_po_kradziezy;
var int CronosTalk_Sword; 			//øeby cronos gada≥ o miecz, debug
var int MerdarionTalk_Sword;
var int finf_olt;
var int hero_knows_hysenfinder; 	//uøyta w dialogu Josha i Hysena
var int Scar_die; 					//uøyta u Thorusa i Kosy
var int Snake_help;					//uøyta u Kosy i Snake'a
var int TondralNovizesBack;			//uøyta NON_4001_MadNovize & Tondral
var int backDoyle1; 			//perm dia DIA_Raeuber_NAPASC, tru na DIA_Quentin_QUEST4
// *************************
// Zmienne dialogÛw 
// *************************
var int HeroKnowAboutNoSTRwps;
// *************************
// Zmienne g≥Ûwnych elementÛw fabu≥y Er 1.4
// *************************
var int initialization_AbMine_Guilds;
var int player_chose_WaterMages;		//Mag Wody lub Najemnik - rozdzia≥ 2
var int player_can_SLD_to_WaterMage;	//deaful value: false
var int Uriziel1H_possible;				//Xardas
var int URIZIEL1H_LOAD;					//MAGE / KAPITELWESHEL
//-----------------------
const int ZivilAnquatschDist = 300;

const int DurstigeBauern = 10;

var int SLF_FIRE;
var int bractwoenter;
var int browce;
var int Kapitel;
var int Play_Lute;
var int Firstjoint;
var int Secondjoint;
var int Thirdjoint;
var int Fourthjoint;
var int Wissen_Almanach;

var int kaplica_oczyszczona;

var int Points_OC;
var int Points_NC;
var int Points_ST;

var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;
//er ------------------------------
var int Knows_GetLurkerMeat;
var int Knows_GetMoleratW;
var int Knows_GetMoleratT;
var int Knows_GetTrollGroundClaws;
var int Knows_GetTrutkaJaszczura;
var int Knows_AlternativeHPmix;
var int Knows_AlternativeMANAmix;
var int Knows_EdgeArmor;
var int Knows_FireArmor;
var int Knows_PointArmor;
//-------------------------------
var int LesterGuide;

var int Bloodwyn_ProtectionPaid;
var int Bloodwyn_PayDay;
var int Herek_ProtectionBully;
var int Grim_ProtectionBully;
var int Jesse_PayForMe;

var int dusty_bractwo;
var int wpis_Ghoran;

var int NC_Joints_verteilt;
var int Cronos_Messenger;
var int Thorus_MordragMageMessenger;

var int must_talk_corristo;
//-----------------------------------

var int HeroCanBuy_GRDHARMOR;
//****************************FUNKCJE ER !! *********************************
var int bohater_upity;
// **************************************************
//					Whistlers Schwert
// **************************************************
	var int Fisk_SCknows110;
	var int Fisk_ForgetSword;
	var int Fisk_SwordSold;
// **************************************************
// **************************************************
//					GotoNewcamp Mordrag
// **************************************************
	var int Mordrag_GotoNC_Day;
	
// **************************************************

var int	EnteredOldMine;
var int Kalom_TalkedTo;
var int KALOM_KRAUTBOTE; 
var int Kalom_DeliveredWeed;
var int Lefty_WorkDay;
var int Lefty_Mission;
var int Ricelord_AskedForWater;
var int An_Bauern_verteilt;

var int Lares_InformMordrag;

// Sumpflager
var int Psi_Walk;
var int Ghorim_KickHarlok;
var int Joru_JoinPsi;
var int Joru_Tips_Mage;
var int BaalNamib_Ansprechbar;
var int BaalNamib_Sakrileg;
var int BaalOrun_FetchWeed;
var INT Kalom_DrugMonopol;
var int Stooges_Fled;
var int idiots_deal;

VAR INT Diego_BringList; //MISSIONSVARIABLE
//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
var int InExtremoPlaying;
var int Aaron_lock;
var int Snipes_deal;
var int Ian_gearwheel;
var int CorKalom_BringBook;
var int CorKalom_BringMCQBalls;
var int YBerion_BringFocus; 
var int PresseTourJanuar2001; 
var int Corristo_KDFAufnahme;
var int Saturas_KDWAufnahme;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
var int CorAngar_GotoOGY;	//TRUE oder FALSE
var int CorAngar_FindHerb; 
var int	Fortuno_HasYBerionHerbs;	// TRUE oder FALSE
var int Yberion_dead;
var int BaalLukor_BringParchment;
		// 0:	keine H‰lfte gefunden
		// 1:	die erste H‰lfte gefunden
		// 2:	die zweite H‰lfte gefunden
		// 3:	beide H‰lften gefunden
		// 4:	Kampf gegen BaalLukor
var int CorAngar_SendToNC;
		// FALSE oder TRUE
var int	Saturas_BringFoci;
		// 0:	Auftrag nicht vergeben
		// 1:	Auftrag vergeben, Almanach und 1 Fokus abgeliefert
		// 2:	2 Fokus abgeliefert
		// 3:	3 Foki abgeliefert
		// 4:	4 Foki abgeliefert
		// 5:	5 Foki abgeliefert
var int MonasteryRuin_GateOpen;
		// TRUE oder FALSE
		
var int Troll_Wheel;
		//f¸r Wheel in der Trollschlucht		
		// 0:	Auftrag nicht vergeben
		// 1:	1x vom Spieler angepackt
		// 2:	Winde von Diego repariert
		// 3:	Winde geˆffnet
//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------

var int warned_gorn_or_lester; 			//TRUE oder FALSE			
var int oldHeroGuild;		
var int FMTaken;
var int Lee_freeminereport;
var int FindXardas;
var int FindGolemHearts;
	// 0: Auftrag nicht vergeben
	// 1: Auftrag vergeben
	// 2: ein Herz abgeliefert
	// 3: zwei Herzen abgeliefert
	// 4: drei Herzen abgeliefert
var int FindOrcShaman;					//LOG_RUNNING oder LOG_SUCCESS
var int UrShak_SpokeOfUluMulu;			//TRUE oder FALSE
var int FriendOfUrShak;					//TRUE oder FALSE
var int Gorn_JoinedForFM;				//TRUE oder FALSE
var int Gorn_GotoWolf;					//TRUE oder FALSE
var int	EnteredFreeMine;				//TRUE oder FALSE
var int	FreemineOrc_SuchePotion;		//LOG_RUNNING oder LOG_SUCCESS
var int	FreemineOrc_LookingUlumulu;		//LOG_RUNNING oder LOG_SUCCESS
var int MCPlatesDelivered;				//TRUE oder FALSE

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
var int	OrcCity_Sanctum_OuterGateOpen;
var int OrcCity_Sanctum_OuterGateTried;	//TRUE oder FALSE
var int EnteredTemple;					//TRUE oder FALSE
const int HighPriest_MaxHit = 3;		//Anzahl der Schl‰ge auf den f¸nften Ork-Priester, bis der "SC-hats-kapiert-Dialog" kommt
var int	EncounteredHighPriest;			//TRUE oder FALSE
var int ExploreSunkenTower;				//TRUE oder FALSE
var int LoadSword;						//TRUE oder FALSE
var int	StartChaptersSix;				//TRUE oder FALSE
var int KnowStone;						//TRUE oder FALSE

/*
const int Log_GetLogManager_Adr = 10328172; 
func int Log_GetTopicStatus(var string topic) {
   var zCList list; list = _^(Log_GetLogManager_Adr);
   while (list.next);
       list = _^(list.next);
       if (list.data) {
           if (Hlp_StrCmp(MEM_ReadString(list.data), topic)) {
               return MEM_ReadInt(list.data +24); // oCLogTopic.m_enuSection, this engine class doesn't exist in g1
           };
       };
   end;
   return -1;
};
*/
//#####################################################################
//##
//##
//##					Erfahrungspunkte
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	KAPITEL 1
//---------------------------------------------------------------------
// Altes LagerAufnahme
const int	XP_DiegoBringlist   =  400;//750
const int	XP_Fingerstrain		=  100;
const int   XP_Whistlerssword	=  100;//200
const int	XP_kirgovictory		=  150;
const int	XP_Kharimlost		=   50;
const int	XP_kharimvictory	=  200;
const int	XP_Snafcook			=  50;//100
const int	XP_Slysearchfornek	=  150;//250
const int	XP_Thorusmordragko	=  250;	
const int	XP_Thorusmordragdead=  300;
const int	XP_fiskdealer		=  300;
const int	XP_BecomeShadow		= 1000;
const int	XP_DexterKalom		=  350;

const int  	XP_GilbertFound		= 50;//100
const int 	XP_XardasLetter		= 200;
const int 	XP_XardasLetterOPEN = 100;

// Sumpflager-Aufnahme
const int	XP_ArrivedAtPsiCamp			= 125;//200
const int	XP_WeedForJoru				= 50;
const int	XP_ImpressBaalCadar			= 200;//250
const int	XP_ImpressBaalNamib			= 200;//250
const int	XP_DustyJoined				= 200;//250
const int	XP_BribedDustyGuard			= 200;//250
const int	XP_DeliveredDusty			= 300;//500
const int	XP_SentHarlok				= 300;
const int	XP_BaalOrunTalks			= 100;
const int	XP_WeedFromBalor			= 100;
const int	XP_BalorNamedCipher			= 50;
const int	XP_WeedFromViran			= 300;//500
const int	XP_DeliveredWeedHarvest		= 100;
const int	XP_ReportToBaalOrun			= 200;
const int	XP_ImpressedBaalOrun		= 200;
const int	XP_ImpressedBaalTyon		= 175;
const int	XP_BecomeNovice				= 750;
const int	XP_WeedShipmentDelivered	= 200;
const int	XP_WeedShipmentReported		= 200;
const int 	XP_JackoRetired				= 380;//500
const int 	XP_DrugMonopol				= 460;//750

// Aufnahme Neues Lager
const int	XP_ArrivedWithMordrag		= 125;//200
const int	XP_LeftyCarriedWater		= 75;//100
const int	XP_LeftyConfronted			= 235;//300
const int	XP_KickedShrike				= 200;
const int	XP_ReportedKickedShrike		= 100;
const int	XP_ReportDeadDamLurker		= 300;
const int 	XP_CronosLetter				= 200;

const int	XP_CheatedIntoLaresHut		= 200;//250
const int	XP_GiveRingToLares			= 250;
const int	XP_GiveListToLares			= 250;
const int	XP_ReportListDeliveryToLares= 400;//750

const int	XP_DistributedWeedForKagan	= 200;
const int	XP_BaalIsidroSpendDrink		= 100;
const int	XP_BaalIsidroTellPlans		= 200;
const int	XP_BaalIsidroPayShare		= 300;//500
const int	XP_BaalIsidroPayLares		= 300;//500

const int	XP_BecomeBandit				= 1000;

const int	XP_AssistMordrag			= 180;//250

//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
const int	XP_BringFocusToYBerion		=	500;
const int	XP_BringFocusToCorKalom		=	150;
const int	XP_LureAaronAway			=	50;
const int	XP_SellKeyToAaron			=	25;
const int	XP_LureUlbertAway			=	50;
const int	XP_BringGearWheel			=	500;
const int	XP_HireGorNaKosh			=	100;
const int	XP_HireGorNaBar				=	100;
const int	XP_HireGorNaVid				=	100;
const int	XP_OpenAsghansGate			=	500;
const int	XP_BringMCEggs				=	1000;
const int	XP_BringBook				=	1500;

const int	XP_ReportToMordrag			= 250;
const int 	XP_ReportToRaven			= 250;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
const int	XP_SaveBaalLukor			=	500;		//22.01.01: Ork-Graveyard enth‰lt 4620 XP
const int	XP_ReportToCorAngar			=	1500;
const int	XP_FindHerbs				=	800;
const int	XP_GetCronosPermission		=	180;
const int	XP_SayCorrectParole			=	50;
const int	XP_DeliverFocusToSaturas	=	250;
const int	XP_DeliverBookToSaturas		=	250;
const int	XP_DeliverSecondFocus		=	2000;
const int	XP_DeliverThirdFocus		=	2000;
const int	XP_DeliverFourthFocus		=	2500;
const int	XP_DeliverFifthFocus		=	3000;


//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------
const int	XP_MessageForGorn			=	650;
const int	XP_ReportToSaturas			=	300; // Feuermagier tot!
const int	XP_DeliveredGolemhearts		=	1500;
const int	XP_FoundOrcShaman			=	1000;
const int	XP_ReturnedFromUrShak		=	1000;
const int	XP_GornJoins				=	1000;
const int	XP_FoundOrcSlave			=	1500;
const int	XP_CuredOrcSlave			=	1500;
const int	XP_DeliveredMCPlates		=	1800;
const int	XP_GotUluMulu				=	7500;
const int	XP_GorMCPlateArmor			=	500;

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
const int	XP_RetreatFromLastPriest	=	800;
const int	XP_ShowUrizielToXardas		=	1000;
const int	XP_ReturnedFromSunkenTower	=	2000;
const int	XP_LoadedUriziel			=	4500;


//---------------------------------------------------------------------
//	KAPITEL 6
//---------------------------------------------------------------------




//#####################################################################
//##
//##
//##					Lernkosten
//##
//##
//#####################################################################

const int	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
const int	LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
const int	LPCOST_ATTRIBUTE_MANA		=	1;	

const int	LPCOST_TALENT_MAGE_1		=	10;	
const int	LPCOST_TALENT_MAGE_2		=	15;	
const int	LPCOST_TALENT_MAGE_3		=	20;	
const int	LPCOST_TALENT_MAGE_4		=	25;	
const int	LPCOST_TALENT_MAGE_5		=	30;	
const int	LPCOST_TALENT_MAGE_6		=	40;	

const int	LPCOST_TALENT_1H_1			=	20;	
const int	LPCOST_TALENT_1H_2			=	40;	
const int	LPCOST_TALENT_2H_1			=	20;	
const int	LPCOST_TALENT_2H_2			=	40;	

const int	LPCOST_TALENT_BOW_1			=	20;	
const int	LPCOST_TALENT_BOW_2			=	40;	
const int	LPCOST_TALENT_CROSSBOW_1	=	20;	
const int	LPCOST_TALENT_CROSSBOW_2	=	40;	

const int	LPCOST_TALENT_ACROBAT		=	10;	
const int	LPCOST_TALENT_SNEAK			=	10;	
const int	LPCOST_TALENT_PICKLOCK_1	=	10;	
const int	LPCOST_TALENT_PICKLOCK_2	=	20;	
const int	LPCOST_TALENT_PICKPOCKET_1	=	10;	
const int	LPCOST_TALENT_PICKPOCKET_2	=	20;	

const int   LPCOST_TALENT_LIFE_1        =   8;
const int   LPCOST_TALENT_LIFE_2        =   15;
//edycja rozszerzona 1.4
const int   LPCOST_TALENT_ALCHEMY_1     =   10;
const int   LPCOST_TALENT_ALCHEMY_2     =   20;
const int   LPCOST_TALENT_SMITH_1	    =   10;
const int   LPCOST_TALENT_SMITH_2	    =   20;
/*-------------------------------------------------------------------------

						LOG EINTRAGS VARIABLEN
( da die Logeintr‰ge nicht einfach so in permanenten Infos stehen d¸rfen!) 

--------------------------------------------------------------------------*/
var int log_gornatothfight;
var int log_gornatothtrain;
var int log_wolftrain;
var int log_baalcadarsell;
var int log_baalcadartrain;
var int log_diegotrain;
var int log_scorpiocrossbow;
var int log_thorustrain;
var int log_thorusfight;
var int log_wedgelearn;
var int log_scattytrain;
var int log_cavalorntrain;

var int Dexter_Traded;
var int Scorpio_Exile;

//------------------------------------------------------------------------
//	Allgemeine Hilfsvariablen
//------------------------------------------------------------------------
var int LeftyDead;

//****************************************************
// EDYCJA ROZSZERZONA 
// ZMIENNE FUNKCJI I MONOLOG”W
//****************************************************

//------------------------------------------------------------------------
// MONOLOGI
//-------------------------------------------------------------------------

var int monolog;
const int Sleepabit = 50;
const int CookPan = 1;
const int Palisada2 = 2;
const int FirePiec = 3;
const int alchemia = 4;
const int Kowalstwo = 5;
const int Gotowanie = 6;
const int Wydobycie = 7;
const int Sharp = 8;
const int Fajka = 9;
const int Wytop = 10;
const int Wydobycie2 = 11;
const int Gniot = 12;
const int Rybactwo = 13;
const int MurObronny = 14;
const int Drewno = 15;
const int Innos = 16;
const int Beliar = 17;
const int Kaplica_Przekleta = 18;
const int Grob1 = 19;
const int Grob2 = 20;
const int Grob3 = 21;
const int B_Palisada1 = 22;
const int B_Palisada2 = 23;
const int B_Palisada3 = 24;
const int B_Palisada4 = 25;
const int B_Palisada5 = 26;

//-----Minning Old Mine------
const int OreVein_01_OM = 27;
const int OreVein_02_OM = 28;
const int OreVein_03_OM = 29;
const int OreVein_04_OM = 30;
const int OreVein_05_OM = 31;
//-----Minning Old World------
const int OreVein_06_FMC = 32;
const int OreVein_07_FMC = 33;
const int GoldVein_01_OW = 34;
const int GoldVein_02_OW = 35;
const int GoldVein_03_OW = 36;
const int OreVein_08_OM = 37;
const int OreVein_09_OM = 38;
const int OreVein_010_OM = 39;
const int OreVein_011_FMC = 40;
const int OreVein_012_FMC = 41;
const int OreVein_013_FMC = 42;

const int GhostAltar = 43;
var int GhoranTalk; // potrzebna do warunku w monologu Alchemii

//poszczegÛlne fragmenty palisady 
var int naprawiono_P1;
var int naprawiono_P2;
var int naprawiono_P3;
var int naprawiono_P4;
var int naprawiono_P5;
//------------------------------------------------------------------------
// SKILLS
//-------------------------------------------------------------------------
var int AlchemyKnows;

////------------------------------------------------------------------------
// GRY I LOSOWANIE
//-------------------------------------------------------------------------
var int gra1;
var int fart;
var int Losowanie_fish1;
var int Losowanie_fish2;
var int Losowanie_fish3;
var int Losowanie_fish4;
var int Losowanie_pstragRice;
var int Losowanie_pstragMieso;
//*******************************************************
// 	GOTHIC EDYCJA ROZSZERZONA 
//  ZMIENNE ZADA—  (POMOCNICZE)
//  26 LIPEC 2012
//*******************************************************

//**********************************
// Stary ObÛz
//**********************************
var int Melvin_oszuka;
var int Melvin_;
//*******************************
// ObÛz bandytÛw
//********************************
///////Edycaj rzoszerzona




//dodatkowe
var int pierscienieEBR;
var int HeroUseRuneB;
var int heroKnowsPoszukiwacze;
//zadania STARE!
var int Jedzenie_zplacu;

var int BANDITOS_ZAUFANIE;
var int BANDITOS_MORDRAG;
var int Problem_ZLY;
var int ZLY_Poplecznicy;


var int BANDITOS_RINGS;
var int MartinLevel;

//**********OPUSZCZONE KOPALNIA************* CH4
var int HeroMaArtefakt; //zmienna odpowiada za dialog zwiπzany z wyjúciem z opuszczonej kopalni, wyszliúmy z kamieniem czy bez?  
var int listLearn;
var int RockyRobiZaDoyle; //1.4 juø nie potrzebne bo rocky nie moøe robiÊ za doyle, bo doyle wraca do obozu tak czy inaczej i zadanie musimy wykonaÊ, aby pÛjúÊ dalej

//**********QUEST - KOPALNIA Z£OTA *************************
var int will_herosay_zawsze;
//czas
var int uplyw_czasu;
//**********FUNKCJE DODATKOWE*************
var int LicznikExp;
var int AutoHealth;
var int Chapters_Spawn; //niepotrzebna
var int hero_regeneruje_mana;
//inne zwiπzane z zadaniami
var int wypierdalajBANDITOS; // true or false - ener to banditos camp
var int wkurwienieDoyla; // poziom wkurwienia Doyla. Jeøeli osiπgnie 3 to ten zacznie nas atakowaÊ.
var int ruda; //czy zosta≥eú oszukany przez Patrosa
var int przejscieSo2;
var int pomocHakan;
var int niedobryHakan;
var int NoJointToBanditos; // if true to nikt z nami nie rozmawia
var int ringsINFOS; 
var int CHARGE_Hanis;
var int Kirgo_Charged; //deaf
var int Kharim_Charged; //deaf
var int hero_moze_walczyc;
var int RobotnicyWhistlera;
var int ShratHaveWork;
var int timer_ClawQuest; 
var int oltarzLOC; //lokalizacja o≥tarza
var int SwordClear;
var int herbatka_crnonos;
var int HeroKnowsScattyThief;
var int Palisada_Mysliwych; // stan pracy 
var int pancerz_bustera;//do zadania od Wilka 
var int zastraszenie_isidro;

var int hero_join_fn;

//NAUKA
var int firstinfo_wilson_teach;
//-------Wilk
var int znowu_250_odebrac;//dotyczy zadania z odbiorem dostawy øywnoúci dla £owcÛw 
var int znowu_300_odebrac;
var int oplata_wolfa; 
//-------Zadanie z Gor Na Linem
var int upojenie_senyan;
var int skup_gor_lin;
var int bylem_wodospad;
//----------ARENA-----------------
var int PokonanyKharim;
var int PokonanyPrzezKharim;
var int PokonanyKirgo;
var int PokonanyPrzezKirgo;
//1.4 zmienne straønikÛw EBR
var int liczba_straznikow;
var int liczba_robotnikow;
//1.24
var int run_tokas_sword;
//-------------------- STARY OB”Z 
var int oferta_fiska;
var int guardians_scar;
var int scar_idzie;
var int czas_ucieczki_scar2;
var int czas_ucieczki_scar;
// up≥yw czasu questÛw -------------
var int timer_grd1;
var int timer_grd2;
var int timer_grd3;
var int timer_grd4;
var int timer_grd5;
var int timer_grd6;
var int timer_grd7nc;
var int timer_grd8nc;
var int timer_grd9nc;

var int day_grd1;
var int day_grd2;
var int day_grd3;
var int day_grd4;
var int day_grd5;
var int day_grd6;

var int Gomez_money;

var int OpiniaOC;
var int OpiniaNC;
var int OpiniaSC;
var int OpiniaBC;

var int quest1_grd_log;
var int watermage_enterto_temple;
var int trade_with_ricelord;
var int more_guradians_conwoy;
var int trade_with_idiots;
var int guardians_back_to_OC;
//-------------------------------------

var int przychody_obozu; 
const string name_zmienna = "Przychody Obozu";
//do misjii
var int GoToOM; //wejúcie do Starej Kopalni
var int pogadajgamal;
var int OpinionOM; //opinia w obozie
var int czepianie; //czy straznik nas zaczepia przed wejúciem?
var int kabelOm; //czy wyda≥eú kopacz ze Starej Kopalni
var int CaineFriend;
var int puszcamDrake; //wyjscie z kopalni

var int gestah_lowca;
var int gerard_lowca;
//1.3 Drugs 31 lipiec 2013
var int Huno_drugs_level;
var int Huno_drugs_day;
var int Jackal_drugs_level;
var int Jackal_pali;
var int Jackal_ore;
var int Gravo_pali;
var int Huno_pali;

var int Berg_ring_giveday;
//SO
var int zlecil_Thorus;
var int talk_aboutOpinion_OC;

var int second_d_shawn;
var int inicjacja_HeroMustHelpBandit;
var int go_help_torlof;
/*
//*******************************************************
// 	GOTHIC EDYCJA ROZSZERZONA 
//  ZMIENNE ZADA— DZIENNYCH
//  2013 CZERWIEC
//*******************************************************
*/
var int dzien;
var int day;
var int pensja1;
var int pensja2;
var int robota1;
var int robota1_Oddawanie;
var int dzien_plaszcz;
var int dzien_Jeremiash;
var int dzien_Bartholo_1;
var int dzien_Bartholo_2;

//Nocturn
var int Jim_odrzucilem;

//odbicie obozu bandytÛw
var int PlanA;
var int PlanB;
var int PlanC;

//bunt zbieraczy
var int Homer_KnowsBunt;
var int Horatio_KnowsBunt;
var int Pock_KnowsBunt;
var int Homer_Rozpracowany;
var int DIA_Rufus_Nasi_OFF;
var int Jeremiah_AlcoGiv;
var int If_BuyAlco_Jer;
var int po_buncie;
//Sharky 
var int oszukanieSharkiego;
//Chapter 2



//Chapter 4
var int przekupionyGRD; // dostawca informacji do Starego Obozu

//Stary ObÛz 
var int DIA_FindNekSnaf_OFF;
var int HeroKnowsSlyKillNek;


var int berg_problemy;
//Test Cavalorna
var int knowsRice;
var int knowsOre;
var int knowsOre2;
var int knowsLeather;
var int knowsAidan;

var int wiecejRice;
var int wiecejOre;
var int wiecejLeather;

var int ocenaTest;

var int szpiegostwoON;
var int polowanieON;

var int wybrany_chroniarz; //Misja Kopalnia Z≥ota
var int wybrany_kopacz1;
var int wybrany_kopacz2;

var int UrbanIdzie; //uøyte w DIA_VLK_565_Urban i DIA_GRD_201_Jackal
var int UrbanPobity;
var int TogardPrzekonany; //uøyte u Togarda i Lorenzo
/*
//*******************************************************
// 	GOTHIC EDYCJA ROZSZERZONA 
//  ZMIENNE MIKSTUR TYMCZASOWYCH
//  7 PAèDZIERNIK 2012
//	AKTUALIZACJA 6 GRUDNIA 2014
//*******************************************************
*/
var int Pot_StrenghtTimeStart;
var int Pot_DexTimeStart;
var int Pot_ManaTimeStart;
var int Pot_MasterTimeStart;
var int Pot_HPTimeStart;

var int Pot_StrenghtTimeStart_Activated;
var int Pot_DexTimeStart_Activated;
var int Pot_ManaTimeStart_Activated;
var int Pot_MasterTimeStart_Activated;
var int Pot_HPTimeStart_Activated;
/*
//*******************************************************
// 	GOTHIC EDYCJA ROZSZERZONA 
//  ZMIENNE ZADA— (MIS)
//  26 LIPEC 2012
//*******************************************************
*/
//poczπtki u bandytÛw
var int MIS_BANDITOS_CAMP;
var int MIS_BANDITOS_ZAUFANIE;
var int MIS_BANDITOS_MORDRAG;
//edit by Hastes 
var int MIS_Snaf_Przepis;
var int MIS_Przepis_Snaf;
var int MIS_Melvin_D≥ug;
// edit by gothic1210

//********************************************
// OB”Z PRZY KOPALNI
//********************************************
var int MIS_EasyJoinOC;
var int MIS_MiksturaTrujacaOM;
var int MIS_RudaJoelowiOM;
var int MIS_MineEnter;
var int MIS_Kopacz;
var int MIS_AwansCien;
var int MIS_TestOc;
var int MIS_GrimOc;
//********************************************
// BRACTWO
//********************************************
//********************************************
// BANDYCI
//********************************************
var int MIS_AtakNaOC;
var int MIS_Poszukiwacze;
var int MIS_materials4Rocky;
var int dupa;
var int MIS_NoweKola;
var int MIS_NewWeed3BAU; //usuniÍte
//********************************************
// NOWY OB”Z
//********************************************
//********************************************
// STARY OB”Z
//********************************************
var int MIS_KosztemQuentina;
//********************************************
// KOLONIA
//********************************************
var int MIS_CavalornFuck;
var int MIS_VartSeeking2;
//czarny mag
var int MIS_blackMage;
var int MIS_lekiDlaAva;
var int MIS_WlakaZczarym;
var int MIS_LowcyPoszukiwaczy;
var int MIS_MagWGoorach1;
var int MIS_Cytadelaposzukiwacz;
var int MIS_ListDoCronosa;
var int MIS_helpSld1;
var int MIS_MagazynBroni;
var int MIS_NekInNC;
var int MIS_AlternativBanditoSCamp;

//var int MIS_GuazyDrena;
//var int MIS_megaSpam;
var int MIS_HelpBrothersBra;//z≥e
//potrzebne
var int MIS_MagnatTrololo;
var int MIS_OpiniaOSO;
var int MIS_FightWithScar;
var int MIS_UCieczkaShrata;
var int MIS_PorwanieAlexa;


var int MIS_NieSpelnionaZemsta;//usuniÍte
var int MIS_DrogaDoKopalni;

var int MIS_MroczneBractwo;//usuniÍte
var int MIS_ZieleClawa;
var int MIS_ZabojstwBlizny;
var int MIS_JosepZniknal;
var int MIS_DziwnyJosep;
var int MIS_WalkiBractwo;


var int MIS_4Friends;


var int MIS_Fire_Novize;

var int mis_firenovize;



var int MIS_Stan_gerarda;
var int MIS_ObronaWK;

