///////////////////////////////////////////////////////////////////////////////////////////
// Zmienne globalne 
// Gothic Edycja Rozszerzona 1.4+
// gothic1210
// 20 stycznia 2015
///////////////////////////////////////////////////////////////////////////////////////////

//***Stary Obóz***
//***Zmienne zadañ***

var int MIS_FirstQuest;
const string Ch1_FirstQuest 				= "Kwatermistrz z placu wymian";

var int MIS_ZmianaLorenza;
const string CH1_ZmianaLorenza 				= "Nowa zmiana do Kopalni";

var int MIS_FightWithNaldur;
const string CH1_FightWithNaldur 			= "Pojedynek z Naldurem";

var int MIS_BuddlerDanny;
const string CH1_BuddlerDanny 				= "Przyjaciel z Kopalni";

var int MIS_ToOldMine;
const string CH1_ToOldMine 					= "Droga do Starej Kopalni";

var int MIS_ChestAndPlate;
const string CH1_ChestAndPlate 				= "Skrzynia i talerz";

var int MIS_Niepokorny_Kopacz;
const string CH1_Niepokorny_Kopacz 			= "Niepokorny Kopacz";

var int MIS_WhoeverPoursSand;
const string CH1_WhoeverPoursSand 			= "Kto komu piasek sypie";

var int MIS_ZlecenieJima;
const string CH1_ZlecenieJima 				= "Zbezczeszczone o³tarze";

var int MIS_Obrona_Placu;
const string CH1_Obrona_Placu   	  		= "Obrona placu wymian";

var int MIS_NEW_GOD;
const string CH2_New_God      				= "Nieznany bóg";

var int MIS_SnafBag;
const string CH4_SnafBag 					= "Sakiewka Snafa";

//***Bractwo Œni¹cego***
//***Zmienne zadañ***

var int MIS_GhoransVine;
const string CH1_GhoransVine	      		= "Obozowy margunios";

var int MIS_ParvezInTroubles;
const string CH1_ParvezInTroubles 			= "Parvez w tarapatach";

var int MIS_MessengerRecall;
const string CH2_MessengerRecall 			= "Przywo³anie pos³añca Œni¹cego";

var int MIS_SellElixer;
const string CH3_SellElixer    		 		= "Sprzeda¿ eliksirów";

var int MIS_ToxicFumes;
const string CH4_ToxicFumes 				= "Truj¹ce opary";

var int MIS_GoldMedallion;
const string CH4_GoldMedallion 				= "Z³oty medalion";

//***Obóz Bandytów***
//***Zmienne zadañ***

var int MIS_DestroyedGrave;
const string CH1_DestroyedGrave	    		= "Zniszczony grób";

var int MIS_SupportFromOrcHunters;
const string CH1_SupportFromOrcHunters      = "Pomoc ³owców orków";

var int BANMordragRaport;
const string CH1_BANMordragRaport    		= "Wieœci od Skazy";

var int MordragProblemOC;
const string CH1_MordragProblemOC    		= "Problemy Skazy";

var int MIS_DraxTest;
const string CH1_DraxTest      				= "Test Draxa";

var int MIS_KalomsNewWeed;
const string CH2_KalomsNewWeed      		= "Przepis na niesamowite ziele";

//***Nowy Obóz***
//***Zmienne zadañ*** 

var int MIS_LurkersInHut;
const string CH1_LurkersInHut    			= "Rybacka chata";

var int MIS_Scams;
const string CH1_Scams     					= "Przekrêty";

var int MIS_StupidMagican;
const string CH2_StupidMagican      		= "Szkodnik-magik w Nowym Obozie";

var int MIS_TreasureOldGuard;
const string CH2_TreasureOldGuard 			= "Skarb starego Stra¿nika";

//***Kolonia***
//***Zmienne zadañ***

var int MIS_MagicalCrystals;
const string CH1_MagicalCrystals      		= "Szturm na Barierê";

var int MIS_GhostsOldStories;
const string Ch1_GhostsOldStories 			= "Piêtno przesz³oœci";

var int MIS_Women;
const string CH1_Women 						= "Tajemnicza kobieta";

var int MIS_Massage;
const string CH1_Massage 					= "List do Magów Ognia";

var int MIS_GrimAmulet;
const string CH1_GrimAmulet 				= "Amulet Magnatów";

var int MIS_SickHunter;
const string CH2_SickHunter     			= "Chory myœliwy";

var int MIS_CorristoEvil;
const string CH4_CorristoEvil      			= "Ucieczka Corristo";

const string CH1_HelpJesse 					= "Przys³uga za przys³ugê";

const string CH1_KdWCourier 				= "Kurier Magów Wody";

//***Nauka***
//***Logi***

const string NOTE_AlchemyRecepts  	= "Umiejêtnoœæ alchemii";
const string NOTE_CookingRecepts  	= "Umiejêtnoœæ gotowania";

//***Pomocnicze***
//***Dialogi***
var int MeetTemplerInCitadel;//DIA_Tpl_1408_Templer
var int HeroPermitToKillFingers;//Wedge, Diego
var int HeroKillNek;//Snaf, Fletcher
var int HeroNeedCollectMoreOre_VLK_560;//VLK_560
var int HeroKnowAbelIsWinemaker;//VLK_560, Abel
var int ArtegorIsDistracted;//Oczekuj¹cy (K³ykacz), Artegor
var int JensIsVictimOfKereth;
var int CanTellToGomezAboutSecretPath;//Thorus & Gomez (zadanie ze œcie¿k¹ do wolnej kopalni)
var int Choice_BergsRing;//TRUE pomagam, FALSE nie pomagam
var int QuestFromOkyl;
var int QuestFromOrik;

//***Pomocnicze***
//***Wld_GetDay***
var int NiepokornyKopacz;
var int UscanDay;
var int Day_BeliarShrine;
var int Day_InnosShrine;

//***Pomocnicze***
//***Przedmioty***
var int ItemUsed_ReceptClarityMixture; 	//ItWr_Mod_ReceptClarityMixture | Chapter 4
var int ItemUsed_FingersSecretBook; 	//Poszukiwania R¹czki | Chapter 2
var int ItemUsed_CraigsMapKeySpawn;		//ItMi_CraigsMap
var int ItemUsed_LetterFromStudent;		//ItMis_LetterFromStudent

//***Pomocnicze***
//***Alchemia***
var int HeroKnows_AlchemyPermPotions1; //mikstura si³y i zrêcznoœci
var int HeroKnows_AlchemyPermPotions2; //mikstura ¿ycia i many
var int HeroKnows_AlchemySprintPotions; //mikstury szybkoœci
var int HeroKnows_AlchemyTimedPotions; //wywary tymczasowe
var int HeroKnows_AlchemyPotionsPower; //wywary potêgi
var int HeroKnows_AlchemyFullRegenarate; //pe³nie
var int empty_var;

//***Pomocnicze***
//***Gotowanie***
var int HeroKnows_CookingFish; //zupy rybne

var int MIS_GamalHelp; //nope
const string Ch1_GamalHelp		 			= "Propozycja Gamala";