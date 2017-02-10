/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* PRZEDMIOTY ZADAÑ - ROZDZIA£ 2
******* Opis: Ró¿norodne przedmioty zwi¹zane z zadaniami.
*****************************************************/

////////////////////////////////////////////////
// Precjoza Cronosa
////////////////////////////////////////////////
INSTANCE ItMi_CronosPrecious (C_Item)
{
	name 				=	"Precjoza Cronosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Wewn¹trz znajduj¹ siê fragmenty";
	TEXT[3]				= "magicznych artefaktów.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/****************************************************
******* ZADANIE: ZAGINIÊCIE R¥CZKI 
******* KLUCZ: ZNAJDUJEMY GO W CHACIE R¥CZKI NA BECZCE
******* JEST SPAWNOWANY SKRYPTEM (NAJPEWNIEJSZA METODA)
******* NOTATKI: DAJE JE NAM DEXTER PO OTWARCIU SKRZYNKI
*****************************************************/

INSTANCE ItMis_KeyFingers(C_Item)
{
	name 					=	"Klucz R¹czki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;

	description				= 	name;
	TEXT[2]					= 	"Znaleziony w chacie Cienia R¹czki";
};	

INSTANCE ItMis_FingersSecretBook(C_Item)
{	
	name 					=	"Notatnik R¹czki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	Use_FingersSecretBook;
	description				=	name;
	TEXT[0]					=	"Spis domów i miejsc,";
	TEXT[1]					=	"które R¹czka chcia³";
	TEXT[2]					=	"obrabowaæ...";
};
	FUNC VOID Use_FingersSecretBook()
	{   
				
					if (ItemUsed_FingersSecretBook == FALSE)
					&& Npc_IsPlayer (self)
					{
						B_GiveXP (100);
						ItemUsed_FingersSecretBook = TRUE;
					
					if (MIS_FingersSeeking == LOG_RUNNING)
					{
					B_LogEntry                     (CH2_FingersSeeking,"Z zapisków Raczki wynika, ¿e planowa³ wiele kradzie¿y. Ostatni na liœcie jest Silas - Szkodnik z Nowego Obozu, prowadz¹cy karczmê.");
					};
					};
					
					var int			nDocID;	
					nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Strona 12"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Chata Mordraga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Chodz¹c wieczorem po obozie zauwa¿y³em w chacie tego  cholernego Szkodnika liczne, choæ ma³o wartoœciowe dobra. Z pewnoœci¹ móg³bym je sprzedawaæ Kopaczom po wy¿szej cenie.");
					Doc_PrintLine	( nDocID,  0, "------------------");
					Doc_PrintLines	( nDocID,  0, "Pod os³on¹ nocy uda³em siê do jego chaty. Tak siê z³o¿y³o, ¿e akurat wybra³ siê do karczmy i zar¿n¹³ w trupa. Obrobienie pustego domu by³o dziecinnie proste. ");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "Strona 13");
					Doc_PrintLine	( nDocID,  1,  "Wypad do Nowego Obozu");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "Postanowi³em udaæ siê do Nowego Obozu i odwiedziæ mojego starego przyjaciela Krzykacza. Mój strój zostawi³em w chacie, aby nie zostaæ rozpoznanym. W karczmie dostrzeg³em dwie dobrze zabezpieczone skrzynie. Myœlê, ¿e wyniesienie butelek z wódk¹ bêdzie op³acalne.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "Sensownie by³oby odci¹gn¹æ uwagê Silasa zanim wejdê do pomieszczenia ze skrzyniami. Krzykacz z pewnoœci¹ mi pomo¿e." );
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					
					Doc_Show		( nDocID );
	};
	
/****************************************************
******* ZADANIE: NOWE NIESAMOWITE ZIELE
******* WIADOMOŒÆ: PROPOZYCJA OD UCZNIA JORU
******* KLUCZ: OTRZYMANY OD UCZNIA JORU
*****************************************************/

INSTANCE ItMis_LetterFromStudent (C_ITEM)
{
	name 					=	"Liœcik od ucznia Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Nowicjusz da³ mi tê kartkê";
	TEXT[3] 				=	"bez s³owa wyjaœnieñ";
	on_state[0]				=	Use_LetterFromStudent;
};

FUNC VOID Use_LetterFromStudent()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  1);
	Doc_SetPage 	( nDocID,  0, "letters.TGA", 0);
	Doc_SetMargins	( nDocID,  -1,  50, 50, 50, 50, 1);
	Doc_SetFont 	( nDocID,  -1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Spotkajmy siê przy stoisku Fortuno.");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_Show		( nDocID );
	
	if (ItemUsed_LetterFromStudent == false)
	{
	ItemUsed_LetterFromStudent = TRUE;
	};
};

INSTANCE ItMis_JoruKey(C_Item)
{
	name 					=	"Klucz Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;

	description				= 	name;
	TEXT[2]					= 	"Otwiera skrzyniê w chacie Joru";
};	

INSTANCE ItMis_JoruSecretBook(C_Item)
{	
	name 					=	"Notatnik Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	Use_JoruSecretBook;
	description				=	name;
	TEXT[0]					=	"Lista przepisów jakie";
	TEXT[1]					=	"Joru przechwyci³ od ";
	TEXT[2]					=	"Guru...";
};
	FUNC VOID Use_JoruSecretBook()
	{   
					
					var int			nDocID;	
					nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Lista przepisów"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "1. Miodowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "2. Grzybowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "3. Zio³owy Nowicjusz");
					Doc_PrintLines	( nDocID,  0, "--- bardzo udany przepis --- sprzedany Jacko z Nowego Obozu");
					Doc_PrintLine	( nDocID,  0,  "4. Mrok Pó³nocy");
					Doc_PrintLines	( nDocID,  0,  "--- przepis sprzedany gdzie siê tylko da³o");
					Doc_PrintLine	( nDocID,  0,  "-----");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "170 bry³ek rudy + 90... 260 ----");
					Doc_PrintLine	( nDocID,  1,  "-----------");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "5. Oddech Œni¹cego - nie sprzedany" );
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "-- rzeczy do zrobienia:");
					Doc_PrintLines	( nDocID,  1,  "- u³o¿yæ przypowieœæ o Œni¹cym");
					Doc_PrintLines	( nDocID,  1,  "- spotkanie z Baal Lukorem");
					Doc_PrintLines	( nDocID,  1,  "- poprosiæ Balora o kontakt do kupca");
					
					Doc_Show		( nDocID );
};

INSTANCE ItMis_RecipeSlepperBreath (C_Item)
{	
	name 				=	"Receptura: Oddech Œni¹cego";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseNovizeRecepte;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"Receptura na mocniejsze ziele";	
	TEXT[5]				= 	NAME_Value;		COUNT[5]			= 	value;
	
};
func void UseNovizeRecepte ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Oddech Œni¹cego"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Sprawa wygl¹da dosyæ prosto. PóŸnym wieczorem próbowaliœmy opracowaæ coœ nowego. Doszliœmy do wniosku, ¿eby dodaæ drug¹ najpospolitsz¹ roœlinê na bagnie. Mianowicie - s³abe ziele lecznicze. Da³o to œwietny efekt, jednak dla aromatu dodaliœmy jeszcze nasiona czerwonego buka."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};	



//*******************************************
// EDYCJA ROZSZERZONA
// 27 LIPIEC
//********************************************

//---------------------------------------------------------------------
//	ULEPSZONY ALKOHOL
//---------------------------------------------------------------------
INSTANCE ItMi_Alchemy_Alcohol_02 (C_Item)
{
	name 				=	"Ulepszony czysty alkohol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			=  name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
//---------------------------------------------------------------------
//	lista R¹czki
//---------------------------------------------------------------------

//-----------------------------------------------
// Receptura Nowicjuszy
//-----------------------------------------------

var int czytane_NotatkiAlchemika;
/* ==================================
Notatki alchemika
========================================= */
INSTANCE NotatkiAlchemika (C_Item)
{	
	name 				=	"Notatki alchemika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseNortes2;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= "Notatki starego alchemika";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseNortes2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "17 listopada"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Zauwa¿y³em, ¿e po bagnie kr¹¿y tak¿e inny badacz. Okaza³o siê, ¿e to Steh. Jeden z naszych Nowicjuszy. Ustali³, ¿e na tych terenach mieszka³a jakaœ rasa. Byli wyj¹tkowo rozwiniêci. Posiadali w³asne pismo, oraz kult. Steh uwa¿a, ¿e byli to ludzie. Ja jednak uwa¿am, ¿e odpowiedŸ znajdê dopiero w jaskini na wzgórzu.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					if (czytane_NotatkiAlchemika == false)
					{
					czytane_NotatkiAlchemika = true;
					B_GiveXP (150);
					};
		
};	

/******************************************************************************************/
INSTANCE It_OdtrutkaNaKaca(C_Item)
{	
	name 				=	"WRONG ITEM!!! Herbatka na kaca";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual	 			=	"ItFo_Potion_Water_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseTea1;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseTea1()
	{
		//print ("Zaraz przestanie mnie boleæ g³owa");
	};
	
//////////////////////////////////////////////////////
// ZADANIE: PRZYWO£ANIE POS£AÑCA ŒNI¥CEGO
//////////////////////////////////////////////////////	
INSTANCE ItWr_MessengerList (C_Item)
{	
	name 				=	"Lista od Y'Beriona";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=  Use_Book_MessengerList;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[2]				= "Te rzeczy s¹ potrzebne,";
	TEXT[3]				= "aby przywo³aæ pos³añca Œni¹cego.";
	//TEXT[5]			= NAME_Value;
	//COUNT[5]		= value;
	
};
func void Use_Book_MessengerList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Widzia³em prosty o³tarz z dwoma kadzid³ami obok. Wyczuwa³em czyj¹œ obecnoœæ lecz nie widzia³em ¿adnej postaci. Czu³em dziwny spokój. Na o³tarzu le¿a³y nastêpuj¹ce przedmioty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					if (Npc_HasItems (hero, ItMi_WhiteWolfBlood) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi¹ bia³ego wilka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi¹ bia³ego wilka (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_RavenHerb_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- krucze ziele (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- krucze ziele (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_Bloodwood_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- nasiona czerwonego buka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- nasiona czerwonego buka (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_utarteJagody_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- utarte nasiona ogniociernia (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- utarte nasiona ogniociernia (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Honey) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- miód (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- miód (brak)"					);
					};
					if (Npc_HasItems (hero, ItMiJoint_3) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- skrêt Zew Nocy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- skrêt Zew Nocy (brak)"					);
					};
					if (Npc_HasItems (hero, ItMi_Alchemy_Quicksilver_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rtêci (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rtêci (brak)"					);
					};
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko by³o niezwykle uporz¹dkowane i mia³em wra¿enie, ¿e ka¿dy z tych elementów ma jakieœ znaczenie."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};	

INSTANCE ItMi_WhiteWolfBlood(C_Item)
{
	name 			=	"Krew bia³ego wilka";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	25;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;

	description		= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpEssenz;
};

INSTANCE ItMi_FakeJoints (C_Item)
{
	name 				=	"Prezent dla Ciphera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Œmierdzi gorzej ni¿ ca³a";
	TEXT[2]				= "ta przeklêta Kolonia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_BloodyShirt (C_Item)
{
	name 				=	"Zakrwawiona koszula";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;
	
	scemeName         = "MAPSEALED";
	description			= name;
	TEXT[2]				= "U¯YJ, aby zbadaæ.";
	//TEXT[2]				= "ta przeklêta Kolonia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
	on_state 				= Use_BloodyShirt;
};

func void Use_BloodyShirt ()
{
var int used_shirt;
if (used_shirt == false) && (MIS_EmanuelsDeals == LOG_RUNNING)
{
used_shirt = true;
 B_LogEntry               (CH1_EmanuelsDeals,"Przy jaskini znalaz³em cia³o martwego Nowicjusza. Jego ubranie by³o silnie przekrwione. Myœlê, ¿e mo¿e mnie ono zaprowadziæ do pozosta³ych rabusiów. ");
 B_GiveXP (50);
};
};