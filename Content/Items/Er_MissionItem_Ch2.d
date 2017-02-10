/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* PRZEDMIOTY ZADA� - ROZDZIA� 2
******* Opis: R�norodne przedmioty zwi�zane z zadaniami.
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
	TEXT[2]				= "Wewn�trz znajduj� si� fragmenty";
	TEXT[3]				= "magicznych artefakt�w.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/****************************************************
******* ZADANIE: ZAGINI�CIE R�CZKI 
******* KLUCZ: ZNAJDUJEMY GO W CHACIE R�CZKI NA BECZCE
******* JEST SPAWNOWANY SKRYPTEM (NAJPEWNIEJSZA METODA)
******* NOTATKI: DAJE JE NAM DEXTER PO OTWARCIU SKRZYNKI
*****************************************************/

INSTANCE ItMis_KeyFingers(C_Item)
{
	name 					=	"Klucz R�czki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;

	description				= 	name;
	TEXT[2]					= 	"Znaleziony w chacie Cienia R�czki";
};	

INSTANCE ItMis_FingersSecretBook(C_Item)
{	
	name 					=	"Notatnik R�czki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	Use_FingersSecretBook;
	description				=	name;
	TEXT[0]					=	"Spis dom�w i miejsc,";
	TEXT[1]					=	"kt�re R�czka chcia�";
	TEXT[2]					=	"obrabowa�...";
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
					B_LogEntry                     (CH2_FingersSeeking,"Z zapisk�w Raczki wynika, �e planowa� wiele kradzie�y. Ostatni na li�cie jest Silas - Szkodnik z Nowego Obozu, prowadz�cy karczm�.");
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
					Doc_PrintLines	( nDocID,  0, "Chodz�c wieczorem po obozie zauwa�y�em w chacie tego  cholernego Szkodnika liczne, cho� ma�o warto�ciowe dobra. Z pewno�ci� m�g�bym je sprzedawa� Kopaczom po wy�szej cenie.");
					Doc_PrintLine	( nDocID,  0, "------------------");
					Doc_PrintLines	( nDocID,  0, "Pod os�on� nocy uda�em si� do jego chaty. Tak si� z�o�y�o, �e akurat wybra� si� do karczmy i zar�n�� w trupa. Obrobienie pustego domu by�o dziecinnie proste. ");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "Strona 13");
					Doc_PrintLine	( nDocID,  1,  "Wypad do Nowego Obozu");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "Postanowi�em uda� si� do Nowego Obozu i odwiedzi� mojego starego przyjaciela Krzykacza. M�j str�j zostawi�em w chacie, aby nie zosta� rozpoznanym. W karczmie dostrzeg�em dwie dobrze zabezpieczone skrzynie. My�l�, �e wyniesienie butelek z w�dk� b�dzie op�acalne.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "Sensownie by�oby odci�gn�� uwag� Silasa zanim wejd� do pomieszczenia ze skrzyniami. Krzykacz z pewno�ci� mi pomo�e." );
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					
					Doc_Show		( nDocID );
	};
	
/****************************************************
******* ZADANIE: NOWE NIESAMOWITE ZIELE
******* WIADOMO��: PROPOZYCJA OD UCZNIA JORU
******* KLUCZ: OTRZYMANY OD UCZNIA JORU
*****************************************************/

INSTANCE ItMis_LetterFromStudent (C_ITEM)
{
	name 					=	"Li�cik od ucznia Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Nowicjusz da� mi t� kartk�";
	TEXT[3] 				=	"bez s�owa wyja�nie�";
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
	Doc_PrintLines	( nDocID,  0, "Spotkajmy si� przy stoisku Fortuno.");
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
	TEXT[2]					= 	"Otwiera skrzyni� w chacie Joru";
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
	TEXT[0]					=	"Lista przepis�w jakie";
	TEXT[1]					=	"Joru przechwyci� od ";
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
					Doc_PrintLine	( nDocID,  0, "Lista przepis�w"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "1. Miodowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "2. Grzybowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "3. Zio�owy Nowicjusz");
					Doc_PrintLines	( nDocID,  0, "--- bardzo udany przepis --- sprzedany Jacko z Nowego Obozu");
					Doc_PrintLine	( nDocID,  0,  "4. Mrok P�nocy");
					Doc_PrintLines	( nDocID,  0,  "--- przepis sprzedany gdzie si� tylko da�o");
					Doc_PrintLine	( nDocID,  0,  "-----");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "170 bry�ek rudy + 90... 260 ----");
					Doc_PrintLine	( nDocID,  1,  "-----------");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "5. Oddech �ni�cego - nie sprzedany" );
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "-- rzeczy do zrobienia:");
					Doc_PrintLines	( nDocID,  1,  "- u�o�y� przypowie�� o �ni�cym");
					Doc_PrintLines	( nDocID,  1,  "- spotkanie z Baal Lukorem");
					Doc_PrintLines	( nDocID,  1,  "- poprosi� Balora o kontakt do kupca");
					
					Doc_Show		( nDocID );
};

INSTANCE ItMis_RecipeSlepperBreath (C_Item)
{	
	name 				=	"Receptura: Oddech �ni�cego";

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
					Doc_PrintLine	( nDocID,  0, "Oddech �ni�cego"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Sprawa wygl�da dosy� prosto. P�nym wieczorem pr�bowali�my opracowa� co� nowego. Doszli�my do wniosku, �eby doda� drug� najpospolitsz� ro�lin� na bagnie. Mianowicie - s�abe ziele lecznicze. Da�o to �wietny efekt, jednak dla aromatu dodali�my jeszcze nasiona czerwonego buka."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
//	lista R�czki
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
					Doc_PrintLines	( nDocID,  0, "Zauwa�y�em, �e po bagnie kr��y tak�e inny badacz. Okaza�o si�, �e to Steh. Jeden z naszych Nowicjuszy. Ustali�, �e na tych terenach mieszka�a jaka� rasa. Byli wyj�tkowo rozwini�ci. Posiadali w�asne pismo, oraz kult. Steh uwa�a, �e byli to ludzie. Ja jednak uwa�am, �e odpowied� znajd� dopiero w jaskini na wzg�rzu.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
		//print ("Zaraz przestanie mnie bole� g�owa");
	};
	
//////////////////////////////////////////////////////
// ZADANIE: PRZYWO�ANIE POS�A�CA �NI�CEGO
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
	TEXT[2]				= "Te rzeczy s� potrzebne,";
	TEXT[3]				= "aby przywo�a� pos�a�ca �ni�cego.";
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
					Doc_PrintLines	( nDocID,  0, "Widzia�em prosty o�tarz z dwoma kadzid�ami obok. Wyczuwa�em czyj�� obecno�� lecz nie widzia�em �adnej postaci. Czu�em dziwny spok�j. Na o�tarzu le�a�y nast�puj�ce przedmioty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					if (Npc_HasItems (hero, ItMi_WhiteWolfBlood) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi� bia�ego wilka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi� bia�ego wilka (brak)"					);
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
					Doc_PrintLines	( nDocID,  0, "- mi�d (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- mi�d (brak)"					);
					};
					if (Npc_HasItems (hero, ItMiJoint_3) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- skr�t Zew Nocy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- skr�t Zew Nocy (brak)"					);
					};
					if (Npc_HasItems (hero, ItMi_Alchemy_Quicksilver_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rt�ci (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rt�ci (brak)"					);
					};
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko by�o niezwykle uporz�dkowane i mia�em wra�enie, �e ka�dy z tych element�w ma jakie� znaczenie."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};	

INSTANCE ItMi_WhiteWolfBlood(C_Item)
{
	name 			=	"Krew bia�ego wilka";

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
	TEXT[2]				= "�mierdzi gorzej ni� ca�a";
	TEXT[2]				= "ta przekl�ta Kolonia";
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
	TEXT[2]				= "U�YJ, aby zbada�.";
	//TEXT[2]				= "ta przekl�ta Kolonia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
	on_state 				= Use_BloodyShirt;
};

func void Use_BloodyShirt ()
{
var int used_shirt;
if (used_shirt == false) && (MIS_EmanuelsDeals == LOG_RUNNING)
{
used_shirt = true;
 B_LogEntry               (CH1_EmanuelsDeals,"Przy jaskini znalaz�em cia�o martwego Nowicjusza. Jego ubranie by�o silnie przekrwione. My�l�, �e mo�e mnie ono zaprowadzi� do pozosta�ych rabusi�w. ");
 B_GiveXP (50);
};
};