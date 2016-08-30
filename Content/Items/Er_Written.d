/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* KSI�GI KLASYCZNE
******* Opis: Ksi�gi w tym pliku dotycz� najr�niejszych
******* rzeczy. Od alchemii, a� po kwestie lore.
******* Ksi�gi klasyczne nie posiadaj� wielu stronic
******* i s� zrealizowane skryptowo (bez u�ycia tekstury z
******* gotowymi napisami).
*****************************************************/

/*****************************************************
******* KATEGORIA: ALCHEMIA
*****************************************************/

INSTANCE ItWr_FullRegeneratePotions (C_Item)
{	
	name 				=	"Pe�nia �ycia i many - przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	200;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_FullPots;
	scemeName			=	"MAP";
	description			= 	"Przepis na mikstury pe�ni";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_FullPots ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Pe�nia �ycia");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk�adniki:");
					Doc_PrintLine	( nDocID,  0, "- Owoc velais");
					Doc_PrintLines	( nDocID,  0, "- Du�e zio�a uzdrawiaj�ce");
					Doc_PrintLines	( nDocID,  0, "- 3 serafisy");
					Doc_PrintLines	( nDocID,  0, "- Butelka oleju syrianicznego");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Pe�nia many");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk�adniki:");
					Doc_PrintLine	( nDocID,  0, "- Nasiona czerwonego buka");
					Doc_PrintLines	( nDocID,  0, "- G�rski mech");
					Doc_PrintLines	( nDocID,  0, "- 3 kocianki");
					Doc_PrintLines	( nDocID,  0, "- Butelka oleju syrianicznego");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
					
	var int einMal_BkPnie1;
	if (einMal_BkPnie1 == false)
	{
	HeroKnows_AlchemyFullRegenarate = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry			(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia mikstury pe�ni �ycia i many.");	
	einMal_BkPnie1 = true;
	};
};	

/******************************************************************************************/
INSTANCE ItWr_AlchemyPermPotions1(C_Item) //oryginalna instancja ItWr_AlchemyPermPotions1
{	
	name 					=	"Mikstury trwa�e";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"Tom 1";
	TEXT[3]					= 	"Mikstura si�y i zr�czno�ci";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Book_AlchemyPermPotions1;
};

	FUNC VOID Use_Book_AlchemyPermPotions1()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					//STR ogniocier�, woda, kocianka, bagienne ziele
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Mikstury trwa�e");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Mikstura si�y");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "T� jak�e pot�n� mikstur� trzeba warzy� powoli i delikatnie. Najpierw sok z dw�ch ogniocierni�w wlewamy do naczynia wype�nionego olejem syrianicznym. Nast�pnie dorzucamy trzy posiekane kocianki powoli mieszaj�c. Gdy zacznie wrze� wrzucamy ususzone bagienne ziele. Wtedy z ogniociernia uwalnia si� ca�a jego esencja. ");
					Doc_PrintLine	( nDocID,  0, "");
					
					// li�� d�bu, woda, kocianka, bagienne ziele
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Mikstura zr�czno�ci");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mikstur� t� warzymy podobnie jak bli�niacz� dla niej mikstur� si�y. Tym razem jednak podstaw� mikstury jest li�� wysokiego d�bu. Z pewno�ci� dla ka�dego pocz�tkuj�cego alchemika wydaje si� to dosy� abstrakcyjne. Jednak ten niepozorny li�� wp�ywa na zr�czno�� ludzkiego cia�a. Wywar powstaje na oleju syrianicznym.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		

	var int einMal_BkPp1;
	if (einMal_BkPp1 == false)
	{
	HeroKnows_AlchemyPermPotions1 = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia mikstury si�y i zr�czno�ci.");	
	einMal_BkPp1 = true;
	};
	};
	
/******************************************************************************************/
INSTANCE ItWr_AlchemyPermPotions2(C_Item) 
{	
	name 					=	"Mikstury trwa�e";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"Tom 2";
	TEXT[3]					= 	"Mikstura �ycia i many";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;	
	on_state[0]				=	Use_Book_AlchemyPermPotions2;
};

	FUNC VOID Use_Book_AlchemyPermPotions2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Mikstury trwa�e");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Mikstura �ycia");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ta mikstura potrafi zwi�kszy� energi� �yciow� wojownika.");
					Doc_PrintLines	( nDocID,  0, "W przeciwie�stwie do innych mikstur wszystkie sk�adniki dodajemy dopiero, gdy olej syrianiczny zacznie wrze�. Pierwszym sk�adnikiem jest ususzone i zmielone krucze ziele. Nast�pnie dodajemy 3 �wie�e, silne zio�a uzdrawiaj�ce. Gotujemy po czym dodajemy psiank�.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Mikstura energii");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mag znaj�cy sztuk� alchemii mo�e wzmocni� sw� magiczn� moc za pomoc� tej mikstury. Podstawowym jej sk�adnikiem jest dragot, kt�ry uwalnia esencj� czarnego ziela. Obydwa sk�adniki nale�y uprzednio zasuszy�. Na koniec nale�y dorzuci� kilka li�ci psianki. Wywar powstaje na oleju syrianicznym.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );	
					
	var int einMal_BkPp2;
	if (einMal_BkPp2 == false)
	{
	HeroKnows_AlchemyPermPotions2 = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia mikstury �ycia i many.");	
	einMal_BkPp2 = true;
	};
	};
	
/*************************************************************/
INSTANCE ItWr_AlchemySprintPotions(C_Item)
{	
	name 					=	"Mikstury szybko�ci";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"";
	TEXT[3]					= 	"Mikstury pozwalaj�ce na sprint";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;	
	on_state[0]				= 	Use_Book_AlchemySprintPotions;
};

	FUNC VOID Use_Book_AlchemySprintPotions()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					//1.Seite
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");	
 					Doc_PrintLine	( nDocID,  0, "Mikstura szybko�ci");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 
  					Doc_PrintLine	( nDocID,  0, "");		
					Doc_PrintLines	( nDocID,  0, "Mikstury szybko�ci pozwalaj� na szybsze przemieszczanie si�. Wp�ywaj� na wydolno�� organizmu ka�dego kto je za�yje. Niezwykle przydatne podczas zwiad�w. Mikstury mo�na sporz�dzi� z r�nych ro�lin co wp�ywa na ich intensywno��. ");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			);//  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Sk�adniki");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "- z�bate ziele (do lekkiej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- ciemny grzyb (do �redniej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- orkowe ziele (do du�ej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- Serafis");
					Doc_PrintLines	( nDocID,  1, "- woda");
					//Doc_PrintLine	( nDocID,  1, "- olej syrianiczny");
					//Doc_PrintLine	( nDocID,  1, "Przyrz�dzanie");
					//Doc_PrintLine	( nDocID,  1, "");
					//Doc_PrintLines	( nDocID,  1, "Podgrzewamy wod�. Gdy osi�gnie odpowiedni� temperatur�, wrzucamy z�bate ziele (razem z korzeniem). Jest to jedna z najprostszych mikstur. Aby wzmocni� jej dzia�anie post�pujemy analogicznie jak z innymi miksturami. Zosta�o to ju� opisane w innych ksi��kach, dlatego nie b�d� przytacza�. ");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		
					
	var int einMal_BkSP1;
	if (einMal_BkSP1 == false)
	{
	HeroKnows_AlchemySprintPotions = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia mikstur szybko�ci.");	
	einMal_BkSP1 = true;
	};					
};	
	
/******************************************************************************************/	
INSTANCE ItWr_AlchemyTimedPotions(C_Item)
{	
	name 					=	"Wywary";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	500;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"Ksi�ga opisuje wywary czasowo";
	TEXT[3]					= 	"zwi�kszaj�ce atrybuty wojownika.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				= Use_Book_AlchemyTimedPotions;
};

	FUNC VOID Use_Book_AlchemyTimedPotions ()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Mikstury");
  					Doc_PrintLine	( nDocID,  0, "tymczasowe");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "O napojach");
					Doc_PrintLines	( nDocID,  0, "Mikstury tymczasowe pozwalaj� na nietrwa�e podniesienie kluczowych atrybut�w wojownika takich jak si�a czy zr�czno��. Jest to niezwykle przydatne przed trudnymi walkami. Wszystkie mikstury powstaj� tak samo. R�ni� si� jedynie g��wnym sk�adnikiem.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk�adniki");
					Doc_PrintLines	( nDocID,  0, "- Czysty alkohol (do wszystkich mikstur)");
					Doc_PrintLines	( nDocID,  0, "- Bagienne ziele (do wszystkich mikstur)");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "- Le�ne zio�o (do wywaru si�y)");
					Doc_PrintLines	( nDocID,  1, "- G�rskie zio�o (do wywaru many)");
					Doc_PrintLines	( nDocID,  1, "- Polne zio�o (do wywaru zr�czno�ci)");
					Doc_PrintLines	( nDocID,  1, "- Nadmorskie zio�o (do wywaru punkt�w �ycia) ");
					Doc_PrintLines	( nDocID,  1, "- Polne i le�ne zio�o (do wywaru pot�gi) ");
					Doc_PrintLines	( nDocID,  1, "Do ch�odnej wody wrzucamy zio�o (jakie - zale�y od mikstury jak� chcemy przyrz�dzi�) po czym ca�o�� podgrzewamy. Nast�pnie studzimy");	
					Doc_PrintLines	( nDocID,  1, "i dodajemy bagienne ziele. Je�eli po��czymy le�ne");
					Doc_PrintLines	( nDocID,  1, "i polne zio�o otrzymamy wywar pot�gi, zwi�kszaj�cy si�� i zr�czno��.");
					Doc_Show		( nDocID );	
	var int einMal_BkWw1;
	if (einMal_BkWw1 == false)
	{
	HeroKnows_AlchemyTimedPotions = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia wywaru si�y, wywaru many, wywaru zr�czno�ci, wywaru �ycia i wywaru pot�gi.");	
	einMal_BkWw1 = true;
	};							
};		

/******************************************************************************************/	
INSTANCE ItWr_AlchemyPowerPotions(C_Item)
{	
	name 					=	"Napoje kr�l�w";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	"Napoje pot�gi";
	
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				= 	Use_Book_AlchemyPowerPotions;
};

	FUNC VOID Use_Book_AlchemyPowerPotions ()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Napoje kr�l�w");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "O obu napojach");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Nap�j pot�gi i nap�j w�adzy to dwie pot�ne mikstury. Stosowane zazwyczaj przed wa�n� walk� przez kr�l�w i dow�dc�w dla wzmocnienia wydolno�ci organizmu. Nale�y jednak stosowa� je z rozwag� i rozs�dkiem.");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Sk�adniki");
					Doc_PrintLines	( nDocID,  1, "- Roztarte nasiona ogniociernia (nap�j pot�gi)");
					Doc_PrintLines	( nDocID,  1, "- Roztarte bagienne ziele (nap�j w�adzy)");
					Doc_PrintLines	( nDocID,  1, "- 3 Psianki");
					Doc_PrintLines	( nDocID,  1, "- Olej syrianiczny");
					Doc_PrintLines	( nDocID,  1, "- Czysty alkohol");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		
					
	var int einMal_BkPwP1;
	if (einMal_BkPwP1 == false)
	{
	HeroKnows_AlchemyPotionsPower = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia najpoju pot�gi i napoju w�adzy.");	
	einMal_BkPwP1 = true;
	};					
	};		
	
	
	
	
	
/******************************************************************************************/	
	INSTANCE AlchemiaTrwaleWzomcnienia(C_Item)
{	
	name 					=	"XXX KSI�GA DO USUNI�CIA XXX";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	TEXT[1]				= "Opisuje jak";
	TEXT[2]				= "wzmacnia�";
	TEXT[3]				= "mikstury.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_AlchemySTRZRE12;
};

	FUNC VOID UseItWr_AlchemySTRZRE12()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Wzmocnienia ");
  					Doc_PrintLine	( nDocID,  0, "mikstur trwa�ych");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Ma�o kt�ry pocz�tkuj�cy alchemik wie, �e uwarzon� mikstur� mo�na wzmocni�. Zazwyczaj kojarz� oni sk�adniki takie jak: olej syrianiczny i czysty alkohol z innymi miksturami. Moje do�wiadczenia pokaza�y, �e dolanie butelki oleju syranicznego powoduje wzmocnienie skutk�w mikstury.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)

					Doc_PrintLines	( nDocID,  1, "Tymczasem dolanie dw�ch butelek alkoholu powoduje jeszcze skuteczniejsze efekty. Widoczne alkohol powoduje wyzwolenie si� wyci�gu z chocia�by ogniociernia. Ostatecznie powoduje to wzmocnienie efektu mikstury.");
					Doc_Show		( nDocID );
					
				
					
	};

	
	


	
/******************************************************************************************/	
INSTANCE ItWr_Seite3temple (C_Item)
{	
	name 				=	"Wydarta strona";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	200;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseSeite3;
	scemeName			=	"MAP";
	description			= 	"Wydarta strona ksi��ki";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseSeite3 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Przygotowanie mikstury"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Nasiona ogniociernia wrzucamy do wody. Zalewamy olejem syrianicznym. Dynamicznie mieszamy dodaj�c powoli roztarte ziele. Nast�pnie wrzucamy li�� d�bu i zio�o uzdrawiaj�ce. Ca�o�� gotujemy do wrzenia."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Powodzenia."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

/*****************************************************
******* KATEGORIA: PRZEPISY KUCHARSKIE
*****************************************************/

INSTANCE RezepturenFish (C_ITEM)
{	
	name 					=	"Przepisy na zupy rybne";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Przepisy";
	TEXT[0]				= "Na zupy rybne";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseRezepturenFish;
};

	FUNC VOID UseRezepturenFish()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite
					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Zupy");
					Doc_PrintLine	( nDocID,  0, "   rybne");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
 					Doc_PrintLines	( nDocID,  0, "Pstr�g t�czowy"					);			
					Doc_PrintLines	( nDocID,  0, "Ta niezwykle silna ryba jest cennym �upem. Trudno j� z�owi�. Jednak zupa z dw�ch sztuk mo�e znacznie podnie�� nasz� magiczn� moc. Warto doda� do takiej zupy tak�e ry�.");
					Doc_PrintLines	( nDocID,  0, "Pstr�g pospolity"	);	
					Doc_PrintLines	( nDocID,  0, "Do zupy z pstr�ga nale�y doda� du�� ilo�� soli. Mo�na j� tak�e doprawi� odrobin� wina. ");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Sandacz"					);
					Doc_PrintLines	( nDocID,  1, "Zup� z sandacza warto przygotowa� wraz z zio�ami leczniczymi. Pono� spo�ycie kilku takich zup podnosi wytrzyma�o��."	);
					Doc_PrintLines	( nDocID,  1, "Kara�"					);
					Doc_PrintLines	( nDocID,  1, "Zupa z karasi najlepiej smakuje z suchym chlebem. ");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/	
INSTANCE ItWe_PrzepisMoleratSoup (C_Item)
{	
	name 				=	"Przepis na zup� z kretoszczura";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisMoleratSoup;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisMoleratSoup ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk�adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- sad�o kretoszczura"					);
					Doc_PrintLine	( nDocID,  0, "- 3 sztuki mi�sa"					);
					Doc_PrintLine	( nDocID,  0, "- s�l"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy mi�so. Nast�pnie czekamy a� zacznie wrze�. Dopiero potem delikatnie wlewamy t�uszcz i mieszamy. Solimy na ko�cu. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pyszna zupa dla my�liwego w sam raz na ch�odne dni."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisSnafSoup (C_Item)
{	
	name 				=	"Przepis na potrawk� z chrz�szcza";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisSnafSoup;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisSnafSoup ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk�adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 chrz�szcze"					);
					Doc_PrintLine	( nDocID,  0, "- 5 piekielnik�w"					);
					Doc_PrintLine	( nDocID,  0, "- 2 miski ry�u"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy posiekane chrz�szcze. Nast�pnie czekamy a� zacznie wrze�. Potem wrzucamy pokrojone piekielniki i mieszamy to wszystko dosypuj�c ry�. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
	INSTANCE przepis_zupaserowa (C_Item)
{	
	name 				=	"Przepis na zup� serow�";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisSerSoup;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisSerSoup ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk�adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 kawa�ki sera"					);
					Doc_PrintLine	( nDocID,  0, "- 2 sztuki mi�sa"					);
					Doc_PrintLine	( nDocID,  0, "- bochenek chleba, najlepiej suchego"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Gotujemy mi�so. Gdy wywar zacznie wrze� wrzucamy ser, kt�ry natychmiast si� topi. Ca�o�� mieszamy i dodajemy pokrojony na pajdy chleb."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisCrawelSoup (C_Item)
{	
	name 				=	"Przepis na zup� z pe�zacza";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisKRW;
	scemeName			=	"MAP";
	description			=   name;

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisKRW ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk�adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- wn�trzno�ci pe�zacza"					);
					Doc_PrintLine	( nDocID,  0, "- 2x s�l"					);
					Doc_PrintLine	( nDocID,  0, "- miska ry�u"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Najpierw preparujemy pe�zacza. Z wn�trza delikatnie wycinamy narz�dy wewn�trzne. Czekamy, a� sp�ynie krew. Naci�� nale�y delikatnie pod brzuchem. �wie�e flaki wrzucamy do wody z ry�em."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego! Baal Lukor"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisScaSoup (C_Item)
{	
	name 				=	"Przepis na zup� ze �cierwojada";

	mainflag 			=	ITEM_KAT_DOCS;

	value 				=	15;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisSCA;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void UsePrzepisSCA ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk�adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 kawa�ki mi�sa"					);
					Doc_PrintLine	( nDocID,  0, "- 2x s�l"					);
					Doc_PrintLine	( nDocID,  0, "- 2 krucze ziela"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Wrzucamy mi�so do gor�cej wody. Dop�ki si� nie ugotuje suszymy krucze ziele, a nast�pnie siekamy. Wrzucamy wszystko do gara i dodajemy s�l."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Tylko nie przesadzaj z sol�."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/*****************************************************
******* KATEGORIA: LORE
*****************************************************/

INSTANCE ItWr_MenaceToDoyle (C_ITEM)
{
	name 					=	"Kartka z pogr�kami";

	mainflag 					=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[1] 				=	"Adresatem pogr�ek jest Doyle.";
	TEXT[3] 				=	"";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseMenaceToDoyle;
};

FUNC VOID UseMenaceToDoyle()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  1);
	Doc_SetPage 	( nDocID,  0, "letters.TGA", 0);
	Doc_SetMargins	( nDocID,  -1,  50, 50, 50, 50, 1);
	Doc_SetFont 	( nDocID,  -1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");

	Doc_PrintLines	( nDocID,  0, "Doyle, ty sukinsynu!");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Dorwiemy ciebie i twoj� przekl�t� band�!");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Skelden");
	Doc_PrintLine	( nDocID,  0, "");

	Doc_Show		( nDocID );
};

/******************************************************************************************/

INSTANCE  ItWr_Mod_IronGarotte(C_Item)
{	
	name 					=	"�elazna Garota";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"�elazna Garota";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Book_IronGarotte;
	
	
};
	FUNC VOID Use_Book_IronGarotte()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "�elazna Garota");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0, "�elazna Garota to elitarna formacja Stra�nik�w dbaj�cych o bezpiecze�stwo Magnat�w. Od jej cz�onk�w wymaga si� nie tylko nadzwyczajnych zdolno�ci bojowych, ale te� niemal fanatycznego oddania. Nazwa formacji pochodzi od przydomku skaza�ca Felgora, kt�ry podczas buntu zabi� oficera stra�y zarzucaj�c na jego szyj� �a�cuchy od swych kajdan, po czym udusi� go mia�d��c mu gardziel.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Jako, �e ten spos�b u�miercania przywodzi� na my�l zabijanie za pomoc� garoty, Felgor zyska� przezwisko �elaznej Garoty. Od tej pory przytroczywszy sobie do pasa �w �a�cuch, nosi� go z dum� jako trofeum, od kt�rego zyska� przydomek. Felgor jeszcze w czasach przed powstaniem bariery by� przyjacielem Gomeza, wi�c gdy przyw�dca magnat�w postanowi� sformowa� przyboczn� stra� z�o�on� z najlepszych i najwierniejszych podw�adnych, na jej czele postawi� w�a�nie �elazn� Garot�. ");
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/

	
/*****************************************************
******* KATEGORIA: PRZEPISY NA ALKOHOLE
*****************************************************/

INSTANCE ItWr_SpiritsRecipte1(C_Item)
{	
	name 					=	"Prawdziwe alkohole";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Prawdziwe alkohole cz.1";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseSpiritsRecipte1;
};

	FUNC VOID UseSpiritsRecipte1()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;			
					Doc_SetPages	( nDocID,  2 );                      

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  
 					Doc_PrintLine	( nDocID,  0, "Prawdziwe");
					Doc_PrintLine	( nDocID,  0, "    alkohole");
  					Doc_PrintLine	( nDocID,  0, "cz�� 1");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Nalewki");
					Doc_PrintLines	( nDocID,  0, "Te trunki s� znane od stuleci swoj� popularno�� zyska�y dzi�ki �wietnemu smakowi oraz prostocie przygotowania. Aby sporz�dzi� nalewk� wystarczy sk�adniki zala� alkoholem i doda� cukru wed�ug uznania. Jakie sk�adniki? - spyta pocz�tkuj�cy. ");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Tutaj mamy bezwzgl�dn� swobod� dzia�ania. Najcz�ciej jednak stosuje si� utarte przepisy: pi�� jab�ek do dw�ch butelek alkoholu dla nalewki jab�kowej i dziesi�� jag�d do dw�ch butelek dla nalewki jagodowej. ");	

					Doc_Show		( nDocID );
					
				
					
	};
/******************************************************************************************/
INSTANCE ItWr_SpiritsRecipte2(C_Item)
{	
	name 					=	"Prawdziwe alkohole";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Prawdziwe alkohole cz.2";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseSpiritsRecipte2;
};

	FUNC VOID UseSpiritsRecipte2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;			
					Doc_SetPages	( nDocID,  2 );                      

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  
 					Doc_PrintLine	( nDocID,  0, "Prawdziwe");
					Doc_PrintLine	( nDocID,  0, "    alkohole");
  					Doc_PrintLine	( nDocID,  0, "cz�� 2");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Mi�d i w�da");
					Doc_PrintLines	( nDocID,  0, "Mi�d i w�dka - oto kolejne po��czenie znane od wiek�w. Wyrobienie takiego miodu nie jest a� tak proste, gdy� wymaga czasu i dobrania odpowiednich proporcji. Zazwyczaj wyrabia si� p�toraki: jedna jednostka obj�to�ci brzeczki do po�owy jednostki wody.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Z piwem miodowym sprawa wygl�da podobnie. Do brzeczki piwnej wystarczy dola� miodu. P�niej wystarczy odrobina cierpliwo�ci, aby trunek osi�gn�� w�a�ciwy smak. ");	

					Doc_Show		( nDocID );				
	};	
/******************************************************************************************/
INSTANCE ItWr_SpiritsRecipte3(C_Item)
{	
	name 					=	"Prawdziwe alkohole";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Prawdziwe alkohole cz.3";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseSpiritsRecipte3;
};

	FUNC VOID UseSpiritsRecipte3()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;			
					Doc_SetPages	( nDocID,  2 );                      

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  
 					Doc_PrintLine	( nDocID,  0, "Prawdziwe");
					Doc_PrintLine	( nDocID,  0, "    alkohole");
  					Doc_PrintLine	( nDocID,  0, "cz�� 3");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "W�da z zio�a");
					Doc_PrintLines	( nDocID,  0, "W zapiskach starego alchemika pracuj�cego w mojej karczmie znalaz�em ongi� przepis na absynt - alkohol powsta�y wy��cznie z fermentacji zi�. Fermentacji nale�y podda� wy��cznie zio�a Serafisa lub orkowego ziela. ");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "�atwiej zrobi� nalewk� zio�ow�. Porz�dny smak otrzymujemy, gdy zalejemy czystym alkoholem jedno le�ne i dwa g�rskie zio�a.");	

					Doc_Show		( nDocID );				
	};	
/******************************************************************************************/
INSTANCE ItWr_NiczymCiosSztyletu(C_Item)
{	
	name 					=	"Niczym cios sztyletu";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Niczym cios sztyletu";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseBookAboutAlco1;
};

	FUNC VOID UseBookAboutAlco1()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;			
					Doc_SetPages	( nDocID,  2 );                      

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  
 					Doc_PrintLine	( nDocID,  0, "Cios");
					Doc_PrintLine	( nDocID,  0, "    sztyletu");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Jak zabi� magnata albo barona? To pytanie zadaje sobie wielu m�odych zab�jc�w wykonuj�cych r�ne roboty dla swoich gildii. O ile zabicie rybaka i ukrycie zw�ok nie jest dla nich wyzywaniem, o tyle pozbycie si� wa�nej szychy z obstaw�, ju� tak. Na pomoc przychodzi alchemia. Jak wiadomo bogacze lubi� si� zabawi� i nie�le popi�. Podsun�� im butelk� 'specjalnego' alkoholu nie jest tak trudno jak wyeliminowa� po cichu.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Jak takowy trunek sporz�dzi�? Trunek, kt�ry b�dzie niczym cios sztyletu, zabijaj�cy podpitego magnata niemal�e w momencie wypicia. Na stole alchemicznym nale�y po��czy� trolest i bagienne ziele. Reakcja, kt�ra zachodzi miedzy sokami tych dw�ch ro�lin wywo�a siln� fermentacj�. Jednocze�nie zapach zi� upodobni nap�j do zwyczajnej nalewki. Dzi�ki temu nikt nie b�dzie nic podejrzewa�. Reszta zale�y ju� tylko od dobrego pos�a�ca, kt�ry dostarczy 'podarek'.");	

					Doc_Show		( nDocID );				
	};		


//***********************************************************************************************
//********** NOWE MENU STATYSTYK  
//***********************************************************************************************
INSTANCE ZdolnosciLowieckie (C_Item)
{	
	name 				=	"Moje zdolno�ci �owieckie";

	mainflag 			=	ITEM_KAT_DOCS;
	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFunc1Skills;
	scemeName			=	"MAP";
	description			=   "Moje zdolno�ci �owieckie";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
}; 
func void UseFunc1Skills ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "MENU_INGAME.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "Font_Old_10_WhiteStats.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
Doc_PrintLine	( nDocID,  0, "Moje zdolno�ci �owieckie");		
Doc_PrintLine	( nDocID,  0, "");	
						if (Knows_GetTeeth == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie k��w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie k��w");
};
if (Knows_GetClaws == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie pazur�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie pazur�w");
};

if (Knows_GetFur == true)
{
Doc_PrintLine	( nDocID,  0, "1 �ci�ganie futer");
} else {
Doc_PrintLine	( nDocID,  0, "0 �ci�ganie futer");
};

if (Knows_GetHide == true)
{
Doc_PrintLine	( nDocID,  0, "1 Sk�rowanie gad�w");
} else { 
Doc_PrintLine	( nDocID,  0, "0 Sk�rowanie gad�w");
};

if (Knows_GetMCMandibles == true)
{
Doc_PrintLine	( nDocID,  0, "1 Patroszenie pe�zaczy");
} else { 
Doc_PrintLine	( nDocID,  0, "0 Patroszenie pe�zaczy");
};

if (Knows_GetMCPlates == true)
{
Doc_PrintLine	( nDocID,  0, "1 Zdejmowanie p�ytek pancerzy");
} else {
Doc_PrintLine	( nDocID,  0, "0 Zdejmowanie p�ytek pancerzy");
};

if (Knows_GetBFSting == true)
{
Doc_PrintLine	( nDocID,  0, "1 ��d�a krwiopijc�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 ��d�a krwiopijc�w");
};

if (Knows_GetUluMulu == true)
{
Doc_PrintLine	( nDocID,  0, "1 �owiectwo ork�w (Ulu-mulu)");
} else {
Doc_PrintLine	( nDocID,  0, "0 �owiectwo ork�w (Ulu-mulu)");
};
if (Knows_GetLurkerMeat == true)
{
Doc_PrintLine	( nDocID,  0, "1 Pozyskiwanie mi�sa gad�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Pozyskiwanie mi�sa gad�w");
};
if (Knows_GetMoleratW == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wycinanie w�troby kretoszczur�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wycinanie w�troby kretoszczur�w");
};
if (Knows_GetMoleratT == true)
{
Doc_PrintLine	( nDocID,  0, "1 Pozyskiwanie sad�a");
} else {
Doc_PrintLine	( nDocID,  0, "0 Pozyskiwanie sad�a");
};
if (Knows_GetTrollGroundClaws == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie k��w trolla ziemnego");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie k��w trolla ziemnego");
};
if (Knows_GetTrutkaJaszczura == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie trucizny jaszczur�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie trucizny jaszczur�w");
};

if (Knows_EdgeArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma�o�� wojownika");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma�o�� wojownika");
};

	if (Knows_FireArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma�o�� �owcy smok�w");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma�o�� �owcy smok�w");
};	
	if (Knows_PointArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma�o�� �ucznika");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma�o�� �ucznika");
};	
			Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};




//---------------------------------------------------------------------------------------------------------------------------|
//-----------> �wi�ty M�ciciel
//---------------------------------------------------------------------------------------------------------------------------|
//created by Nocturn

INSTANCE ItWr_HallowedAvengerRepice (C_ITEM)
{
	name 					=	"�wi�ty M�ciciel";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Stara ksi�ga opisuj�ca bro�";
	TEXT[3] 				=	"stworzon� do walki ze z�em.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseHallowedAvengerRepice;
};

FUNC VOID UseHallowedAvengerRepice()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "�wi�ty M�ciciel");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "...Innos nienawidzi� poczyna� swego brata, dlatego podarowa� ludziom �wiat�o, by mogli roz�wietla� mrok i walczy� z nim. Ale Beliar nie m�g� znie�� tego widoku i stworzy� Besti�, kt�ra nios�a chaos i �mier�. Pan �wiat�a nie m�g� do tego dopu�ci�, dlatego przekaza� wr�czy� cz�owiekowi ogie� i nauczy� go rzemios�a kowalskiego. Cz�owiek nie zmarnowa� tych dar�w, rozwija� je.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_15_book.tga");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "Pewnego dnia uda�o mu si� ");
	Doc_PrintLines	( nDocID,  1, "stworzy� idealne ostrze. ");
	Doc_PrintLines	( nDocID,  1, "Innos widz�c to, ucieszy� ");
	Doc_PrintLines	( nDocID,  1, "si� i przela� cz�� swej ");
	Doc_PrintLines	( nDocID,  1, "boskiej mocy w miecz, kt�ry ");
	Doc_PrintLines	( nDocID,  1, "zosta� ochrzczony ");
	Doc_PrintLines	( nDocID,  1, "''�wi�tym M�cicielem''. ");
	Doc_PrintLines	( nDocID,  1, "Dzier�y�o go wielu ");
	Doc_PrintLines	( nDocID,  1, "wspania�ych wojownik�w ");
	Doc_PrintLines	( nDocID,  1, "oddaj�cych cze�� dobru, ");
	Doc_PrintLines	( nDocID,  1, "dzi�ki czemu z�o ");
	Doc_PrintLines	( nDocID,  1, "zosta�o unicestwione i ");
	Doc_PrintLines	( nDocID,  1, "cz�owiek m�g� wie�� ");
	Doc_PrintLines	( nDocID,  1, "dostatnie �ycie...");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "Miecz zosta� wykuty z:");
	Doc_PrintLines	( nDocID,  1, "- 3 sztabek magicznej rudy");
	Doc_PrintLines	( nDocID,  1, "- 5 stalowych pr�t�w");
	Doc_PrintLines	( nDocID,  1, "- sztabki z�ota");
	Doc_PrintLines	( nDocID,  1, "- 4 bry�ek czarnej rudy");
	Doc_PrintLines	( nDocID,  1, "- Esencji �wiat�a");
	Doc_Show		( nDocID );
};


/////////////////////////////////////////////////////////////////////
// KSI�GI I NOTATKI FABULARNE
// REGA� W SIEDZIBIE MAG�W OGNIA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Mod_AboutCastleRevaran (C_Item)
{	
	name 				=	"Zniszczenie twierdzy Revaran";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_AboutCastleRevaran;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_AboutCastleRevaran ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Za pot�g� magii! "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "�le si� sta�o, gdy� oto rzeka poch�on�a zamek Revaran. Lord Etienne obwinia o to nas, Mag�w Ognia i nasz� tam�, kt�r� byli�my postawili nieopodal Trellis. Etienne domaga si� od nas rozebrania zapory rzecznej i odbudowy tej g��wnej twierdzy paladyn�w. "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Cho� Innnos jest z nami, to przyw�dca paladyn�w ma niema�e wp�ywy i wszystkie je zamierza wykorzysta� przeciwko Ko�cio�owi Mag�w Ognia. Jako, �e przy Gomezie bracie stoicie, wtedy namawiajcie pierwszego z magnat�w by przed kr�lem za nami przemawia�. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niechaj spe�ni si� wola Innosa! "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Vengardu i najwy�szy arcykap�an Myrtany"					);
					Doc_PrintLine	( nDocID,  0, "Arcymag Karrypto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_DisputeAboutRevaran (C_Item)
{	
	name 				=	"Sp�r o twierdz� Revaran";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_DisputeAboutRevaran;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_DisputeAboutRevaran ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTER2.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 25, 25, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Bracie Corristo, "					);
					Doc_PrintLines	( nDocID,  0, "Wielkim smutkiem nape�nione jest me serce, gdy przykro�ci doznajemy od tych, kt�rzy z woli Innosa winni nam pos�usze�stwo i szacunek. Oto Lord Etienne w dalszym ci�gu nie ustaje i kolejny ju� raz domaga si� przed kr�lem, by�my wyburzyli tam� trellijsk� i w�asnym sumptem twierdz� w Revaran odbudowali. "					);
					Doc_PrintLines	( nDocID,  0, "Ten niewdzi�cznik i zaka�a Zakonu Paladyn�w nigdy nie wydosta�by si� z biedy mu przyrodzonej, gdyby nie to, �e mag Loukanis poda� mu pomocn� d�o�. To on przygarn�� go na nauki, a wyci�gn�wszy z bodermarskiej ulicy, utorowa� mu drog� w szeregi rycerzy Innosa. Gdyby nie dobry Loukanis, Etienne nigdy nawet nie ogl�da�by tych mur�w, o kt�re teraz si� piekli. "	);
					Doc_PrintLines	( nDocID,  0, "Jak on �mie nastawa� na dobra, b�d�ce w�asno�ci� �wi�tego Ko�cio�a Innosa? Jak on �mie ��da� i czyni� wstr�ty magom, kt�rym wszystko zawdzi�cza. Nie przemo�e jednak pycha, cho�by najwi�ksza, bram �wi�tyni Innosa, gdy� Pan Ognia jest bogiem sprawiedliwych. "					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Vengardu i najwy�szy arcykap�an Myrtany - Arcymag Karrypto"					);
					//Doc_PrintLine	( nDocID,  0, "Arcymag Karrypto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

/////////////////////////////////////////////////////////////////////
// KSI�GI I NOTATKI FABULARNE
// DOKUMENTY BARTHOLO
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Mod_BartholoAssets (C_Item)
{	
	name 				=	"Potwierdzenie udzia��w";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	3000;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_BartholoAssets;
	scemeName			=	"MAP";
	description			= 	"Za�wiadczenie posiadania udzia��w - kopia";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_BartholoAssets ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Certyfikat posiadania udzia��w - kopia"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niniejszy dokument za�wiadcza, �e Pan Bartholo Ergalla, jest w posiadaniu 3 000 pe�noprawnych akcji o warto�ci 1 guldena ka�dy w Gildii Handlowej Araxos z siedzib� w sto�ecznym Vengardzie. "					);
					//Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nale�na cz�� zysk�w, ustalana wed�ug warto�ci udzia��w z kwot przeznaczanych corocznie do rozdzielenia odpowiednim zarz�dzeniem Rady Dwunastu, b�dzie wyp�acana wsp�lnikowi, lub jego pe�nomocnikowi za okazaniem niniejszego certyfikatu "	);
					Doc_PrintLines	( nDocID,  0, ""					);
				//	Doc_PrintLines	( nDocID,  0, "Niniejszy dokument po�wiadczaj�cy posiadanie udzia��w w Gildii oraz same udzia�y podlegaj� prawom nadanym w Przywileju Kr�lewskim dla Gildii Handlowej Araxos i wewn�trznym przepisom Gildii (kopie ww. dokument�w mo�na otrzyma� w Domach Gildii), kt�rych przestrzegania Udzia�owiec podejmuje si� nabywaj�c akcje. "							);
				//	Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niniejszy certyfikat jest niewa�ny, je�li nie zosta� podpisany na odwrocie przez Reprezentanta Gildii ds. Obrotu Udzia�ami oraz je�li nie zosta� wpisany do Rejestru Udzia�owc�w. Prawomocno�� niniejszego dokumentu po�wiadczaj� z�o�one ni�ej podpisy urz�dnik�w oraz stosowna piecz��."							);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					//Doc_PrintLines	( nDocID,  0, ""							);
					//Doc_PrintLines	( nDocID,  0, "Delegat Gildii Araxos i opiekun Domu Gildii na Khorinis"							);
					Doc_PrintLines	( nDocID,  0, "Ormellius Reberio                     "							);
					Doc_PrintLines	( nDocID,  0, "Glabrio Nirenza"							);
					//Doc_PrintLines	( nDocID,  0, "Reprezentant Gildii ds. Obrotu Udzia�ami, w Domu Gildii na Khorinis "							);
				//	Doc_PrintLines	( nDocID,  0, "Glabrio Nirenza "							);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus		
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_BartholoPowerOfAttorney (C_Item)
{	
	name 				=	"Pe�nomocnictwa - kopia";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	2500;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_BartholoPowerOfAttorney;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_BartholoPowerOfAttorney ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Kopia Pe�nomocnictw"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ja, Bartholo z domu Ergalla, o�wiadczam, �e wydaj� Bankowi �elaznemu [z siedzib� w Vengardzie], wszelkie pe�nomocnictwa do przyjmowania w moim imieniu i przechowywania pieni�dzy wyp�acanych z tytu�u posiadanych przeze mnie akcji Gildii Handlowej Araxos (z siedzib� w Vengardzie)."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zgodnie z zapisami Przywileju Kr�lewskiego dla Gildii Handlowej Araxos i wewn�trznymi prawami obowi�zuj�cymi w gildii, po�wiadczam tym pismem przekazanie Bankowi �elaznemu wymaganego certyfikatu oraz nadaj� Bankowi �elaznemu prawa pos�ugiwania si� owym certyfikatem w granicach wyznaczonych w niniejszym dokumencie."	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					Doc_PrintLines	( nDocID,  0, "Bartholo z domu Ergalla"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_BartholoSafeConduct (C_Item)
{	
	name 				=	"Glejt uniewinniaj�cy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	500;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_BartholoSafeConduct;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_BartholoSafeConduct ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "My s�dzia Trybuna�u Kr�lewskiego, Honorius z rodu Neridio, po�wiadczamy swym imieniem, �e niniejszym Bartholo z domu Ergalla zdo�a� sp�aci� swe winy wzgl�dem Kr�lestwa Myrtany uiszczaj�c stosowne zado��uczynienie na poczet skarbca kr�lewskiego. Niniejszy dokument przywraca rzeczonemu skaza�cowi status cz�owieka wolnego i ko�czy okres odbywania orzeczonej uprzednio przez s�d kary. "	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};

INSTANCE ItWr_Mod_BartholoAct (C_Item)
{	
	name 				=	"Akt nadania ziem";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	4000;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_BartholoAct;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_BartholoAct ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Akt nadania ziem"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ja, Lord Derbent, pan na zamku w Derbent i w�a�ciciel rozleg�ych posiad�o�ci niniejszym potwierdzamy, �e Bartholo z domu Ergalla otrzyma� od nas prawo zbudowania wioski na nie wi�cej, ni� pi��dziesi�t os�b oraz nie wi�kszej, ni� 400 st�p w dowolnym kierunku. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pan Bartholo i jego dziedzice na mocy przywileju lokacyjnego maj� prawo  dzier�awy, zamieszkania, zbior�w i wykonywania zawodu w lasach i ciekach wodnych przyleg�ych do wioski Sahlberl, lecz le��cych nie dalej ni� 50 krok�w od granic wioski. "	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pan Bartholo przyjmuje na siebie obowi�zek chronienia mieszka�c�w wioski, a tak�e wszystkich, kt�rzy w wiosce przebywaj�. Jednocze�nie wyznaczone zostaje kolonizatorowi prawo wydawania wyrok�w na terenie Sahlberl w imieniu naszym, a tak�e do wyznaczenia s�dzi�w w swoim zast�pstwie."							);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nam za� i potomkom naszym przys�ugiwa� b�dzie pi�ta cz�� od danin zebranych w Sahlberl i trzecia od wyrok�w zas�dzonych w imieniu naszem. Je�li Pan Bartholo i jego dziedzice nie b�d� przestrzega� niniejszych postanowie�, nadanie to stanie si� ca�kowicie niewa�ne, za� prawa do ziem po wyroku s�du kr�lewskiego powr�c� do nas, Lorda Derbent i dziedzic�w naszych. "	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					Doc_PrintLines	( nDocID,  0, "Lord Haringren z rodu Derbent"							);
					Doc_PrintLines	( nDocID,  0, "w imieniu Barthola Ergalli, przedstawiciel Banku �elaznego, Lazare Peverel"							);
					Doc_PrintLines	( nDocID,  0, ""							);
					Doc_PrintLines	( nDocID,  0, "Piecz�� Urz�dnika ds. Rejestr�w w Geldern"							);
					Doc_PrintLines	( nDocID,  0, "Radca Orvald Tevyn "							);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

/////////////////////////////////////////////////////////////////////
// LISTY DO MAG�W WODY
// REGA� U MAG�W WODY
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Mod_LetterFromVarant (C_Item) //dodane 
{	
	name 				=	"List z Varantu";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_LetterFromVarant;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				= 	"Korespondencja prywatna Mag�w Wody";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_LetterFromVarant ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 30, 30, 30, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Za pot�g� magii,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Po zdobyciu Varantu innosycki kr�l Myrtany pragn�� umniejszy� Adanosa i wywy�szy� swojego boga. Ustanowienie innosyckiego patriarchatu dla adanosyckiej krainy i wzmo�ona dzia�alno�� misyjna Mag�w Ognia musia�y doprowadzi� do tego nieszcz�snego buntu, kt�ry wojska Rhobara II wnet utopi�y we krwi... "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Za cen� wierno�ci Myrtanie i przyj�cia niekt�rych obcych nam doktryn religijnych, zdo�ali�my uchroni� Varant przed chaosem, a Ko�ci� nasz przed prze�ladowaniem. Niestety wielu Varantczyk�w nie rozumiej�c naszych wybor�w, zw�tpi�o w nas, mag�w wody, a co gorsza nierzadko te� w Adanosa. R�wnie� coraz cz�ciej s�yszy si�, �e wielu Varantczyk�w niegodz�cych si� z niewol� ucieka na dalekie po�udnie, b�d�ce gniazdem herezji i odszczepie�stwa. Tam, o zgrozo, zazwyczaj dostaj� si� pod wp�ywy tamtejszych sekt."	);
					Doc_PrintLines	( nDocID,  0, "Ciemne chmury gromadz� si� na po�udniowym wschodzie. O, Adanosie, strze� nas i nie zachowaj rozum w mieszka�cach Varantu... "					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Mora Sul"					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Edirne"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_AccidensInVarant (C_Item) //dodane
{	
	name 				=	"Varanckie wypadki";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=   Use_Book_AccidensInVarant;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[3]				= 	"Korespondencja prywatna Mag�w Wody";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_AccidensInVarant ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Bracie Saturasie,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Po niedawnym buncie, kt�ry z tak� moc� i gwa�towno�ci� wybuch� w Bakareshu i Bradze, na Ko�ci� Adanosa i na krain� wiern� Panu Wody spad� odwet wojsk kr�la Myrtany. Dla ratowania wiary oraz Varantu musieli�my p�j�� na ugod� z kr�lem. Byli�my zmuszeni nie tylko uzna� w Rhobarze II i jego nast�pcach prawowitych pan�w Varantu, ale te� i�� na ust�pstwa w kwestiach religijnych i uzna� dominuj�c� pozycj� Ko�cio�a Innosa wzgl�dem kultu Adanosa. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niestety wielu Varantczyk�w uzna�o Konkordat Po�udniowy za zdrad�. Upadek buntu zaowocowa� o wiele gorsz� kl�sk�, bo upadkiem ducha i wiary w to, �e Adanos czuwa nad nasz� krain�. Ugoda za� odwr�ci�a odwr�ci�a ludzi od nas, od �wi�tych kap�an�w Adanosa. "	);
					Doc_PrintLines	( nDocID,  0, "Niech Adanos ma nas w swojej opiece "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Bakareshu "					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Mursin "					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_AnxietyofEdirne (C_Item) //dodane
{	
	name 				=	"Niepok�j arcymaga Edirne";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=   Use_Book_AnxietyofEdirne;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[3]				= 	"Korespondencja prywatna Mag�w Wody";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_Book_AnxietyofEdirne ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_OFFICIAL.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Ku chwale Adanosa ,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ostatnimi czasy coraz bardziej niepokoj�ce wie�ci dochodz� z po�udniowego pogranicza. Martwi� mnie szczeg�lnie sekty tak zwanych asasyn�w, kt�rzy nie tylko obiecuj� wyzwolenie Varantu z r�k naje�d�c�w, ale te� pragn� uczyni� go krain� oddan� Beliarowi. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Moc Pana �mierci jest ogromna ale ona pod sztandarem wolno�ci niesie niewol� chaosu, tak jak ca�kowity triumf Innosa oznacza�by tyrani� praw. Dlatego te� musieli�my uzna� w Rhobarze II naszego prawowitego w�adc�, by przetrwa� i sta� si� w Kr�lestwie ostoj� r�wnowagi. Beliar nie mo�e przynie�� adanosyckiej krainie wyzwolenia, lecz jedynie krew, chaos i zniszczenie. Varant potrzebuje pokoju! Przeto obawa przed widmem z po�udnia tym bardziej wi�za� musi nasz los z Kr�lestwem Innosa... "	);
					Doc_PrintLines	( nDocID,  0, "Niech triumfuje wola Adanosa "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Mora Sul "					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Edirne"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus				
					Doc_Show		( nDocID );
};	
/////////////////////////////////////////////////////////////////////
// DOLA Z�ODZIEJA
// REGA� W POMIESZCZENIU MAGNAT�W
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_FateOfThief1 (C_ITEM) //dodane
{
	name 					=	"Dola Z�odzieja";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Tom I ";
	TEXT[3] 				=	"Autor: Samel";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Book_FateOfThief1;
};

FUNC VOID Use_Book_FateOfThief1()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Dola Z�odzieja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Pragniesz wzbogaci� si� na drodze kradzie�y kieszonkowej? Zazna� wspania�ego �ycia z�odzieja kpi�cego sobie z wszelkich stara�, �ledztw i po�cig�w stra�y miejskiej? Wypcha� sobie kieszenie po brzegi podw�dzonym bogatym kupcom z�otem? A mo�e po prostu w�drowa� noc� po domach zwyczajnych obywateli w poszukiwaniu monet i bogatego �ycia? Pos�uchaj dobrej rady, podziel si� swoimi przemy�leniami z rodzin�. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_FateOfThief,	LOG_NOTE);
		B_LogEntry		(BookLog_FateOfThief,	"Cz�� I");
	B_LogEntry		(BookLog_FateOfThief,	"Pragniesz wzbogaci� si� na drodze kradzie�y kieszonkowej? Zazna� wspania�ego �ycia z�odzieja kpi�cego sobie z wszelkich stara�, �ledztw i po�cig�w stra�y miejskiej? Wypcha� sobie kieszenie po brzegi podw�dzonym bogatym kupcom z�otem? A mo�e po prostu w�drowa� noc� po domach zwyczajnych obywateli w poszukiwaniu monet i bogatego �ycia? Pos�uchaj dobrej rady, podziel si� swoimi przemy�leniami z rodzin�. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Ach, bol� Ci� �lady po ojcowskim pasie? O, to dobrze. By� mo�e dobry ojczulek w�a�nie wybi� Ci z g�owy najg�upsz� my�l, rozwydrzonego bachora, licz�cego na �atwy zysk. Je�eli dosta�e� solidne lanie, to ju� raczej wyro�niesz na przyzwoitego cz�owieka. Domy�lam si�, �e jednak zignorowa�e� moj� wskaz�wk� i albo jeste� upartym mato�em, albo stra�nikiem s�u�bowo przegl�daj�cym t� ksi�g� i pr�buj�cym dzi�ki niej lepiej pozna� techniki zwalczanej przez Ciebie profesji.");
	
	B_LogEntry		(BookLog_FateOfThief,	"Istnieje te� inna mo�liwo��, na kt�r� jednak niezbyt licz�. Mo�liwe, �e jeste� tym jednym przypadkiem na 30, kt�rzy my�l�, �e co� potrafi� i w rzeczywisto�ci tak jest. Wi�ksza jednak jest szansa na to, �e zgnijesz w wi�zieniu, lub od razu zostaniesz wys�any do Koloni Karnej. Je�eli jednak zwietrzy�e� zapach szmalu i naprawd� jeste� na tyle odwa�ny, lub g�upi, �e nie boisz si� ryzyka to znajd� chwil� by po�wi�ci� czas na t� lektur�. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"By� mo�e po tym kr�tkim wst�pie uwa�asz mnie za nad�tego bufona, co? Sp�jrz jednak na ok�adk� i zobacz imi� autora. Je�li to imi� nic Ci nie m�wi, to albo nie pochodzisz z Khorinis, albo jeste� sko�czonym kpem i g�upkiem. Do�� rzec, �e jestem za�o�ycielem Gildii Z�odziei na jednej z najwi�kszych wysp znanego nam �wiata. Je�eli ju� zdo�a�em przyku� Twoj� uwag�, to zaczniemy od czego� prostego. Czego�, co jest podstaw� zawodu z�odzieja - otwieranie zamk�w i kradzie� kieszonkowa. Za �atwe? Rzu� wi�c weso�o ksi�g� w k�t, albo utop w ka�u�y. �mia�o! Ot taka pro�cizna, a ilu ju� wszechwiedz�cych, kpi�c sobie z opisanych tu zasad zawis�o na szubienicy, czy za spraw� kata straci�o d�o�, albo od razu ca�e rami�. Ka�dy kto zlekcewa�y� opisane tu zasady, wpad� w r�ce stra�y i raczej ju� nie wyszed� stamt�d o w�asnych si�ach. Je�eli zdo�asz w pe�ni opanowa� opisane techniki, to masz szans� zbi� fortun�. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Najprostsz� z umiej�tno�ci jest kradzie� kieszonkowa, cho� a� �miesznym jest ilu rozpoczynaj�cych sw� z�odziejsk� przygod� nawet tego nie umie zrobi� dobrze. Takich �ajz w�r�d szanuj�cej si� Gildii Z�odziei z Khorinis si� nie �a�uje, ani tym bardziej nie ratuje. Chyba, �e mog� pu�ci� farb�. Do rzeczy. Na samym pocz�tku musisz pozna� swoje otoczenie i opracowa� odpowiednie podej�cie. Zadaj sobie pytanie gdzie i kiedy chcesz dokona� rabunku oraz oczywi�cie kto ma by� Twoj� ofiar�. Oba zagadnienia maj� podobn� wag�. �led� sw�j cel, wystrzegaj�c si� jednak po�piechu, by nie zwr�ci� na siebie uwagi ofiary i jej nie sp�oszy�. Pr�dzej, czy p�niej znajdzie si� w jakim� odosobnionym miejscu, gdzie nie si�ga wzrok stra�nik�w miejskich i b�dzie mo�na bez niepotrzebnego zagro�enia ze wszystkim si� zebra�. Pami�taj jednak, �eby nie stawia� wszystkiego na jedn� kart�. Trzeba wiedzie�, kiedy sobie darowa� rozpracowywanie zbyt ryzykownego celu. Jest tylu kupc�w z wype�nionymi z�otem kieszeniami, �e nie warto da� si� z�apa� dla jednego celu. To by� b��d, kt�ry pope�ni� m�j kompan Donnat, na d�ugo nim Gildia na Khorinis zacz�a si� tworzy�. Jedynie u�miech losu sprawi�, �e znalaz� si� pewien podr�nik, kt�ry pom�g� mi wydosta� towarzysza.");

	B_LogEntry		(BookLog_FateOfThief,	"Nie mniej by�o ci�ko i na Twoim miejscu nie liczy�bym na podobny �ut szcz�cia. Pami�taj by nie rozpoczyna� skradania je�eli ktokolwiek Ci� widzi. Podczas skradania staraj si� zaj�� nie�wiadom� ofiar� od ty�u. I uwijaj si� w miar� sprawnie, bo ofiara si� zorientuje. Zastanawiaj si� zbyt d�ugo co masz wzi��, a na pewno Twoja kariera rzezimieszka zako�czy si� r�wnie szybko, co si� zacz�a. Nie zabieraj te� przesadnie du�o, bo po pierwsze to nie podobna si� bogom, hehe, a ponadto czas... Zwi�ksza si� te� ryzyko, �e ofiara poczuje jaki� nienaturalny ruch w swojej kieszeni, lub wyjmowana rzecz si� zaczepi. Je�eli chcesz by� prawdziwym z�odziejem, musisz umie� podej�� do celu i zwia�, w mniej ni� 7 sekund. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Nie bez powodu zwyk�o si� powiada�, �e noc jest sojusznikiem z�odzieja. Bo tak w rzeczywisto�ci jest! W ciemno�ci Ci� nie wida�, co daje Ci przewag�. Czasami si� zdarza, �e trzeba okra�� kogo� w dzie�. Nieraz i ja musia�em cichcem obrabowa� kupca w ci�gu dnia. Jedynie chyba dla pomno�enia swojej s�awy i czystej z�o�liwo�ci, bo tych nad�tych kupc�w z 'wszechw�adnego Araxos' zwyczajnie nie trawi�, wymieni� kilka obrabowanych przeze mnie 'wielkich handlarzy': Perion z Vengardu - �up warty 1730 sztuk z�ota, Hilmar z Ardei - �up warty 1492 sztuki z�ota, Renhl Trellijczyk - �up warty 1183 sztuki z�ota, Terhol z Khorinis - �up warty 972 sztuki z�ota ... i rzesza innej kupieckiej �mietanki, w tym Parglen z Trellis, Gronertz z Juran, Kallun z Faring i inni. ");
};

INSTANCE ItWr_FateOfThief2 (C_ITEM) //dodane
{
	name 					=	"Dola Z�odzieja";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Tom II";
	TEXT[3] 				=	"Autor: Samel";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Book_FateOfThief2;
};

FUNC VOID Use_Book_FateOfThief2()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Dola Z�odzieja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Jest to tom drugi poradnika dla z�odziei autorstwa mojego, to jest Samela z Khorinis. Je�eli nie czyta�e� pierwszego i nie zamierzasz go przeczyta�, to jeste� p�g��wkiem... Powiem ci co� smarkaczu. Ka�da litera tego poradnika i ka�dy jego przecinek zapisane s� krwi� tych m�drali, kt�rzy zjad�szy wszystkie rozumy chcieli na nowo odkrywa� okr�n� drog� do ch�do�onej Myrtany... ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_FateOfThief2,	LOG_NOTE);
		B_LogEntry		(BookLog_FateOfThief2,	"Cz�� II");
	B_LogEntry		(BookLog_FateOfThief2,	"Jest to tom drugi poradnika dla z�odziei autorstwa mojego, to jest Samela z Khorinis. Je�eli nie czyta�e� pierwszego i nie zamierzasz go przeczyta�, to jeste� p�g��wkiem... Powiem ci co� smarkaczu. Ka�da litera tego poradnika i ka�dy jego przecinek zapisane s� krwi� tych m�drali, kt�rzy zjad�szy wszystkie rozumy chcieli na nowo odkrywa� okr�n� drog� do ch�do�onej Myrtany. Zreszt�, zrobisz jak uwa�asz i szczerze powiedziawszy mam w g��bokim powa�aniu �ycie takich zarozumia�ych g�upc�w. W sumie w podobnym stopniu przejmowa�by si� �yciem Twoim, gdyby nie jaka� minimalna szansa, �e szkol� w�a�nie przysz�ego wielkiego z�odzieja. By� mo�e nie oka�esz si� mi�sem armatnim i do czego� w �yciu dojdziesz, a ja stan� si� mistrzem kolejnego mistrza fachu... Zobaczymy, lecz bardziej prawdopodobne, �e jeste� jednym z tych dwudziestu dziewi�ciu mato��w, kt�rzy ko�cz� sw�j �ywot w miejskich lochach. ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Do rzeczy... Drug� z umiej�tno�ci jest sztuka otwierania zamk�w. Sztuka, wspania�e s�owo, lecz ja rzek�bym poezja. Nas�uchiwanie w ciszy i skupieniu kolejnego drgni�cia ma�ych mechanizm�w, gdy czas zdaje si� p�yn�� wolniej, a wszystkie d�wi�ki zdaj� si� wype�nia� ow� wieczno��. Rzek�by�, �e to synestezja, gdyby� musia� miesi�c przebywa� na jednej �ajbie z pewnym nawiedzonym poet�, kiedy to obczaja�em sygnet rodowy pewnego kupca. Pomy�le�, �e te wszystkie m�ki dla jednego pier�cienia, kt�ry od innych r�ni si� tylko tym, �e jego oko wykonane by�o z czarnej per�y. Chcesz zna� imi� kupca? Prosz� bardzo. Serpelin z Vengardu. Co do owego poety, to imi� jego wiele by Ci nie powiedzia�o, gdy� przedwcze�nie sko�czy� �ywot. Pono� ze�lizn�� po�lizn�� si� w trelijskim porcie i tak skr�ci� kark. Ech� Niech Beliar porwie paniczy, rozkoszuj�cych si� w wierszykach spisanych na zwi�d�ych pergaminach przez ckliwych i p�aczliwych poet�w. Otwieranie zamk�w, oto poezja �ycia! ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Podobnie jak nie ma dw�ch takich samych kobiet, tak i pr�no szuka� takich samych zamk�w. Ka�dy z zamk�w zachowuje si� inaczej ni� pozosta�e, ma w�asn� dusz� i charakter nadany im przez  �lusarza. Ka�dy w odmienny spos�b podejmuje si� gry z z�odziejem pr�buj�cym go rozpracowa�, w czym jest tak podobny do osobowo�ci cz�owieka. Nie jest to jednak a� takie trudne, przynajmniej w przypadku zwyk�ych zamk�w, na kt�re sta� przeci�tnego mieszczanina. Troch� inaczej sprawa sie ma z tymi nale��cymi do bogaczy, mog�cych sobie pozwoli� na bardziej skomplikowane mechanizmy. Jednak i tu obowi�zuje taka sama zasada, wymagaj�ca od z�odzieja wi�cej do�wiadczenia i umiej�tno�ci. Dostanie si� do zabezpieczonego wn�trza jest o wiele prostsze, je�eli podczas roboty nie tracisz g�owy i cierpliwo�ci. Zadbaj o to by za�atwi� sobie porz�dne wytrychy. Nie warto ich kupowa� od niesprawdzonych ludzi, gdy� w czasie pr�by mog� zawie��. Pami�taj, by zaopatrzy� si� w odpowiedni ich zapas, przed akcj�. Wykonuj�c robot�, staraj si� nie spieszy�, a ju� w �adnym wypadku nie naciska� na wytrych. Co, �e jak si� wkurzysz to musisz si� na czym� wy�adowa�? To daruj sobie czytanie dalszych stron ksi��ki i wybierz sobie jak�� inn� profesj�, bo do tej si� za grosz nie nadajesz. Tu potrzeba opanowania. W chwilach s�abo�ci mo�esz przygry�� wargi, smacznego, moja Ty krwio�ercza mordo. Oprzytomniej ch�do�ony smarkaczu! ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"W momencie gdy zapadki zaczn� si� w�a�ciwie ustawia�, poczujesz leciutkie drganie wytrycha. Widacz jeste� na dobrej drodze. Zwolnij wtedy odrobin� i kr��. Jak za chwil� �le przekr�cisz wytrych, to zaczynasz od nowa. Zapami�tuj wi�c sekwencj� w jakiej przekr�ca�e� wytrych. Mo�esz te� na chybi� trafi� kr�ci� wytrychami, lecz po 60 obudzisz si� z kilkunastoma z�amanymi pr�tami w r�ce i z irytacj� w swym pustym �bie. ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Dobrn��e� w�a�nie do ko�ca ksi�gi.. Mo�esz si� z�yma�, �e o tym wszystkim wiedzia�e�, mo�liwe. Wtedy gratuluj� dobrego mistrza. Nie zamierzam Ci� przekonywa� do s�uszno�ci moich racji. R�cz� jednak honorem z�odzieja, �e stosuj�c si� do opisanych tu wskaz�wek i szlifuj�c w ich duchu swe umiej�tno�ci, zostaniesz prawdziwym rzezimieszkiem. Potrzeba jedynie du�o cierpliwo�ci i jeszcze wi�cej praktyki. By� mo�e staniesz si� r�wnie dobry jak ja. Mo�esz p�j�� te� swoj� drog�, odrzucaj�c moje rady i sko�czy� za kratami. ");

	B_LogEntry		(BookLog_FateOfThief2,	"Za�o�yciel Gildii Z�odziei na Khorinis, Samel");
};

/////////////////////////////////////////////////////////////////////
// PROJEKTOWANIE ZAMK�W
// CHATA R�CZKI
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LockProjects (C_ITEM) //dodane
{
	name 					=	"Projektowanie zamk�w";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Nathed z Khorinis";
	TEXT[3] 				=	"";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]			=	Use_Book_LockProjects;
};

FUNC VOID Use_Book_LockProjects()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Projektowanie zamk�w");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Wiele miesi�cy pracy kosztowa�a mnie dzie�o, kt�re ostatecznie ma my�l zrodzi�a. Dzi� dumnym jestem, �e stworzy�em receptur�, kt�ra pozwoli utrudni� �ywot z�odziejom i wszelkiemu bezece�stwu owej zakazanej profesji. Wielu rabusi�w w swym obrzydliwym fachu nastawiona jest jedynie na rozpracowywanie zamk�w i �amanie zabezpiecze�, byle tylko dosta� si� do bogactwa strze�onego przez zamek. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_LockProjects,	LOG_NOTE);
	B_LogEntry		(BookLog_LockProjects,	"Projektowanie zamk�w");
	B_LogEntry		(BookLog_LockProjects,	"Wiele miesi�cy pracy kosztowa�a mnie dzie�o, kt�re ostatecznie ma my�l zrodzi�a. Dzi� dumnym jestem, �e stworzy�em receptur�, kt�ra pozwoli utrudni� �ywot z�odziejom i wszelkiemu bezece�stwu owej zakazanej profesji. Wielu rabusi�w w swym obrzydliwym fachu nastawiona jest jedynie na rozpracowywanie zamk�w i �amanie zabezpiecze�, byle tylko dosta� si� do bogactwa strze�onego przez zamek. ");
	
	B_LogEntry		(BookLog_LockProjects,	"Wiele lat przepracowawszy jako �lusarz, postanowi�em opracowa� system zamk�w, kt�re b�d� potrafi�y powstrzyma� takich rabusi�w. Pierwszorz�dn� rzecz� s� materia�y, jakich zwyk�o si� u�ywa� do wytwarzania zabezpiecze�. Niestety wci��, mimo moich wysi�k�w, wielu u�ywa miedzi, lub mosi�dzu. Metale te s� jednak wielce u�omne i nienadaj�ce si� do strze�enia kosztowno�ci, gdy� ulegaj� pod wp�ywem wystarczaj�co silnego kopni�cia. Dlatego radz� zrezygnowa� z nich na rzecz stali, w ostateczno�ci �elaza. Wytrzymalsze metale s� niestety do�� kosztowne i trzeba przy tym wykona� specjalne drzwi z tego samego materia�u. Zdarza�o si�, �e stra� miejska na moim Khorinis, a tak�e w innych cz�ciach Kr�lestwa Myrtany natyka�a si� na d�bow� skrzyni� o nienaruszonym i zamkni�tym zamku.");
	
	B_LogEntry		(BookLog_LockProjects,	"Je�eli ju� uporano si� z tym problemem, nale�a�oby przyjrze� si� ustawieniu zapadek. W przypadku gdy ustawimy je pod k�tem o�miu stopni wzgl�dem dziurki, zamek b�dzie otwiera� si� g�adki, za� rabu� b�dzie mie� nie lada problem z otworzeniem go zwyczajnym wytrychem. Innym wa�nym zagadnieniem s� spr�yny od zapadek. Najlepszym rozwi�zaniem jest wykonanie ka�dej przez innego kowala, albowiem ka�dy rzemie�lnik przygotuje spr�yn� o innym napi�ciu ni� jego koledzy po fachu. Zastosowanie owych wskaza� powinno do�� znacznie utrudni� �ycie z�odzieja, sprawiaj�c trudno�� zar�wno pospolitym szperaczom jak i do�wiadczonym z�odziejom.");
	
	B_LogEntry		(BookLog_LockProjects,	"Nathed z Khorinis");
};

/////////////////////////////////////////////////////////////////////
// ZNAKI SAMELA
// CHATA KLINA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_SammelsSigns (C_ITEM) //dodane
{
	name 					=	"Znaki Sammela";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Luthard z Khorinis";
	TEXT[3] 				=	"";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]			=	Use_Book_SammelsSigns;
};

FUNC VOID Use_Book_SammelsSigns()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Znaki Sammela");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "My z�odzieje Khorinis, spod tyrani i praw w�adc�w wyj�ci, jedynie dumie z�odzieja ho�dujemy i z�odziejskiemu zwyczajowi podlegamy. Przez Samela gildia za�o�ona, za jego te� spraw� znaki wielce po�yteczne otrzyma�a.  ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_SammelsSigns,	LOG_NOTE);
	B_LogEntry		(BookLog_SammelsSigns,	"Znaki Sammela");
	B_LogEntry		(BookLog_SammelsSigns,	"My z�odzieje Khorinis, spod tyrani i praw w�adc�w wyj�ci, jedynie dumie z�odzieja ho�dujemy i z�odziejskiemu zwyczajowi podlegamy. Przez Samela gildia za�o�ona, za jego te� spraw� znaki wielce po�yteczne otrzyma�a.");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Pierwszym ze znak�w jest 'Rami� Samela' z�odzieja broni�ce. Znak ten g�osi, �e miejsce nim oznaczone bezpiecznym jest dla rabusia, w naszym towarzystwie zrzeszonego. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Drugim jest 'Tr�jz�b', co znaczenie ma odwrotne do pierwszego spo�r�d znak�w. �ycie mi�uj�cy niech od miejsca nim ozdobionego trzyma si� z daleka, gdy� jeno zgub� prawy z�odziej w nim znale�� mo�e. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Trzecim jest 'Studnia', kt�ra znakiem jest widomym, �e mieszka�cy tego miejsca s� chronieni przez gildi� i �aden spo�r�d szanuj�cych si� z�odziei nie ma prawa ich okrada�.");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Czwartym jest 'Skrzynia', czyli znak, �e nieopodal znajduje si� co� godnego uwagi z�odzieja. Wyryta na murze, czy drzwiach przez z�odzieja dla z�odzieja. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Te oto znaki wyskrobano na �cianach budynk�w, drzwiach, czy murach. Zdarzy si�, �e i na s�siaduj�cym drzewie z wartym odwiedzenia domem. Tak oto porozumiewamy si� ze sob�, co wskaz�wk� jest dla starych wyjadaczy i porad� dla nowych cz�onk�w gildii. Starym wsparciem w pomno�eniu �up�w, nowym pomoc� w unikni�ciu tarapat�w. W pami�ci ka�dego prawdziwego z�odzieja zapisane, na pergaminie dla zakonu naszego spisane. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Spisane pi�rem Lutharda z Khorinis");
};

/////////////////////////////////////////////////////////////////////
// O SZKOLENIU �O�NIERZA
// POK�J THORUSA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HowToTrainSoldiers (C_ITEM) //dodane 
{
	name 					=	"O szkoleniu �o�nierzy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Javier z Vengardu";
	TEXT[3] 				=	"Ksi�ga o �o�nierskim rzemio�le";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_HowToTrainSoldiers;
};

FUNC VOID Use_Book_HowToTrainSoldiers()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "O szkoleniu �o�nierzy");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "'Wszystko na tym �wiecie ma swoj� cen�'. Ta cz�sto i bezrefleksyjnie powtarzana formu�ka, cho� brzmi banalnie to jednak w pe�ni oddaje regu�y rz�dz�ce �wiatem oraz wojn�. Ot� cena �o�nierza, jakkolwiek brutalnie brzmi gdy� mowa tu o ludzkim �yciu, r�wnie� jest policzalna. Jest to czas i koszt wyszkolenia, uzbrojenia i wyposa�enia nowego �o�daka na zmian�.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HowToTrainSoldiers,	LOG_NOTE);
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"O szkoleniu �o�nierzy");
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"''Wszystko na tym �wiecie ma swoj� cen�' - ta cz�sto i bezrefleksyjnie powtarzana formu�ka, cho� brzmi banalnie to jednak w pe�ni oddaje regu�y rz�dz�ce �wiatem oraz wojn�. Ot� cena �o�nierza, jakkolwiek brutalnie brzmi gdy� mowa tu o ludzkim �yciu, r�wnie� jest policzalna. Jest to czas i koszt wyszkolenia, uzbrojenia i wyposa�enia nowego �o�daka na zmian�. Regu�y gry si� tu nie zmieniaj�, cho� ka�da epoka ma w�a�ciw� dla siebie progow� warto��, powy�ej kt�rej nie ma sensu przygotowywanie wojownika.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Z poziom mistrzowski mo�na uzna� jedynie taki stan, gdy osi�gnie si� odpowiedni stopie� wyszkolenia, daj�cego przewag� nad przeciwnikiem, nie wk�adaj�c w przeci�tnego �o�daka nazbyt wiele pieni�dzy i umiej�tno�ci. Po co zu�ywa� si�y i z�oto na przekszta�cenie statystycznego �o�nierza w mistrza miecza najwy�szej klasy, skoro i tak nie ustrze�e go to ani przed be�tem z kuszy, ani, co jest jeszcze bardziej ponure, od krwawej biegunki?");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Dobrym przyk�adem jest walka wr�cz, kt�ra to jest sztuk� ze wszech miar po�yteczn� dla �o�nierza ka�dej armii. Niemniej by taki �o�dak mia� osi�gn�� mistrzostwo w tym fechtunku, potrzebne s� d�ugie lata nieustannych �wicze� i trening�w. Jak wiadomo, na �o�daku spoczywa masa obowi�zk�w zwi�zanych z funkcjonowaniem obozu, wi�c mo�na zastosowa� kilka rozwi�za�. W myrta�skim wojsku uznano, �e �o�nierz musi opanowa� oko�o dwunastu tuzin�w chwyt�w, ale za to kombinacje ruch�w musz� zosta� wbite w pod�wiadomo��, dos�ownie do poziomu odruch�w. ");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Rzecz jasna nie da si� przewidzie� wszystkich mo�liwo�ci, wi�c nawet wyszkolony w dwunastu odruchach �o�nierz mo�e sta� si� ofiar� mistrza walki wr�cz. Pytanie tylko ilu tacy nieliczni mistrzowie zabij� wrog�w, gdy zaleje ich chmara �o�dak�w.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Inaczej sprawa si� ma w przypadku gdy mo�liwo�ci uzupe�nienia strat rekrutami s� ograniczone. Wtedy jedynym wyj�ciem jest podnoszenie kwalifikacji mo�liwie jak najwi�kszej ilo�ci cz�onk�w oddzia�u. Niemniej na d�u�sz� met� i tak wygrywa ta armia, kt�ra ma zdolno�� odnowy.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Javier z Vengardu");
};

/////////////////////////////////////////////////////////////////////
// CIʯKI PANCERZ
// NA STOLIKU STONE'A
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HeavyArmor (C_ITEM)  //dodane
{
	name 					=	"Ci�ka Zbroja";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Hildur z Ardei";
	TEXT[3] 				=	"Literatura w sam raz dla kowala";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_HeavyArmor;
};

FUNC VOID Use_Book_HeavyArmor()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Ci�ka Zbroja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Ci�ka zbroja musi by� wytrzyma�a. Jako masywny pancerz ma wytrzyma� kolejne t�gie ciosy zadawane or�em przeciwnika. Taka zbroja ma ochrania� nie tylko przed ostrzem miecza, czy uderzeniem m�ota, lecz musi ochroni� cz�owieka przed atakiem rozmaitych rodzaj�w broni, w tym przed r�nego gatunku �ukami i oszczepami.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HeavyArmor,	LOG_NOTE);
	B_LogEntry		(BookLog_HeavyArmor,	"Ci�ka Zbroja");
	B_LogEntry		(BookLog_HeavyArmor,	"'Ci�ka zbroja musi by� wytrzyma�a. Jako masywny pancerz ma wytrzyma� kolejne t�gie ciosy zadawane or�em przeciwnika. Taka zbroja ma ochrania� nie tylko przed ostrzem miecza, czy uderzeniem m�ota, lecz musi ochroni� cz�owieka przed atakiem rozmaitych rodzaj�w broni, w tym przed r�nego gatunku �ukami i oszczepami. Nieco gorzej ma si� sprawa z kusz�, gdy� ta cz�sto jest w stanie przebi� nawet najlepszy pancerz i zadaje o wiele powa�niejsze obra�enia. ");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Kowal potrzebuje sk�r, kt�re musz� by� przerobione na sk�rzane paski. Te s�u�� do wykonania wi�za� i uprz�y. Obr�bka �elaza i stali jest ma�o skomplikowana, co czyni je do�� �atwymi do przetworzenia. Potrzeba jedynie je rozgrza� i uformowa� kszta�t kolejnymi uderzeniami kowalskiego m�ota. Temperatura ku�ni nie odgrywa wi�kszej roli. Unikaj odpi�owywania metalu, gdy� nie warto marnowa� dobrego materia�u. Staraj si� oszcz�dza� materia� i formuj go a� do uzyskania satysfakcjonuj�cego kszta�tu.");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Przed zabraniem si� za wykuwanie ci�kiej zbroi, powiniene� zgromadzi� du�� ilo�� �elaza, gdy� wykucie kompletnego pancerza poch�onie spory dzia� owego kruszcu. Stalowa zbroja wymaga analogicznej ilo�ci stali, lecz i tak b�dzie potrzebne r�wnie� �elazo. ");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Hildur z Ardei");
};

/////////////////////////////////////////////////////////////////////
// SKR�CONA HISTORIA KHORINIS
// JEDNA Z CHAT W STARYM OBOZIE
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfKhorinis (C_ITEM) //dodane
{
	name 					=	"Historia Khorinis";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	20;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Seregor z Khorinis";
	TEXT[3] 				=	"Skr�cona historia Khorinis";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_HistoryOfKhorinis;
};

FUNC VOID Use_Book_HistoryOfKhorinis()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Skr�cona historia Khorinis");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Na pocz�tku plemiona wyspy Khorinis, zwanej dawniej r�wnie� wysp� Kahr, wyzwoli�y si� spod dominacji zagadkowego ludu Budowniczych. W wyniku zetkni�cia si� z Budowniczymi, cz�� plemion przyj�a kult Adanosa. Jedno z takich plemion dowodzone przez przedstawicieli rodu Ukar�w, wybi�o si� na pierwsze�stwo i narzuci�o sw� wol� pozosta�ym szczepom. Ukarowie dali pocz�tek Kr�lestwu Kahr, kt�rego byli w�adcami a� po kres istnienia niepodleg�ego pa�stwa.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HistoryOfKhorinis,	LOG_NOTE);
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"Skr�cona historia Khorinis");
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"''Na pocz�tku plemiona wyspy Khorinis, zwanej dawniej r�wnie� wysp� Kahr, wyzwoli�y si� spod dominacji zagadkowego ludu Budowniczych. W wyniku zetkni�cia si� z Budowniczymi, cz�� plemion przyj�a kult Adanosa. Jedno z takich plemion dowodzone przez przedstawicieli rodu Ukar�w, wybi�o si� na pierwsze�stwo i narzuci�o sw� wol� pozosta�ym szczepom. Ukarowie dali pocz�tek Kr�lestwu Kahr, kt�rego byli w�adcami a� po kres istnienia niepodleg�ego pa�stwa. Zdo�ali nawr�ci� zjednoczone przez siebie ludy i zepchn�li ork�w do G�rniczej Doliny. Tam wybudowali Klasztor Zmiennokszta�tnych, w kt�rym mieszkali kap�ani Adanosa - z tym, �e kult Adanosa na wyspie mia� wyra�ne cechy druidzkie. ");
	
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"Potem nadesz�y kl�ski. Toczone bez powodzenia wojny z Vengardem os�abi�y powa�nie Kr�lestwo. R�wnie� inny wr�g dawa� o sobie zna�. Oto orkowie, nasilaj� sw�j nap�r na G�rnicz� Dolin� i niebawem odrywaj� t� cz�� wyspy od Kr�lestwa Kahr. Kolejne wojny toczone o odzyskanie G�rniczej Doliny nie zdo�a�y przywr�ci� tej krainy Ukarom. Uda�o si� jednak powstrzyma� zagra�aj�cy Kr�lestwu poch�d ork�w na po�noc. Dla odbudowy kr�lestwa w�adcy Khorinis rozpocz�li sprowadza� myrta�skich osadnik�w na wysp�. Wraz z przybyszami na wysp� dociera� r�wnie� nieznany tu wcze�niej kult Innosa, by za kr�la Firentisa powsta� mia� na Khorinis Klasztor Mag�w Ognia. ");
	
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"Ostatni z kr�l�w Kahr, zagro�ony w stolicy przez oblegaj�cych miasto portowe ork�w przyzwa� na pomoc kr�la Rhobara I, kt�rego wtedy te� uczyni� swym dziedzicem. Kr�lowie Myrtany, przy��czywszy Khorinis do swego kr�lestwa, odbili z r�k ork�w G�rnicz� Dolin� i wybudowali na jej terenie wiele zamk�w.");
};

/////////////////////////////////////////////////////////////////////
// KLUCZ DO MYRTANY
// SKRZYNIA W �WIECIE
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_KeyToMyrtana (C_ITEM) //dodane
{
	name 					=	"Klucz do Myrtany";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	125;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Varen z Faring";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_KeyToMyrtana;
};

FUNC VOID Use_Book_KeyToMyrtana()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Klucz do Myrtany");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Przez wiele wiek�w magiczna ruda cieszy�a si� uznaniem jedynie alchemik�w i mag�w, kt�rzy postrzegali j� wy��cznie jako �r�d�o magicznej energii. Cho� niekt�rzy podejmowali pr�by zastosowania owego kruszcu w kowalstwie, to efekty takich eksperyment�w by�y nader mizerne. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  1, "Dopiero na wiek przed przybyciem Rhobara I do Myrtany, kowale nordmarscy odkryli metod� obr�bki rudy pozwalaj�c� na wykorzystanie jej do produkcji broni.  Wynalazek ten znacz�co wp�yn�� na bieg naszej historii, gdy� Rhobarowie potrafili wykorzysta� go do zapewnienia swym wojskom przewagi nad armiami wrog�w. Dzi� ju� z pewno�ci� mo�na rzec, �e gdyby nie magiczna ruda, nigdy nie powsta�aby zjednoczona Myrtana.");

	Doc_Show		( nDocID );
};

/////////////////////////////////////////////////////////////////////
// CIENIOSTW�R BRUNATNY
// DO ZAKUPU U MY�LIWYCH
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrownShadowbeast (C_ITEM) //dodane
{
	name 					=	"Cieniostw�r brunatny";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Deglan syn Norwida";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_BrownShadowbeast;
};

FUNC VOID Use_Book_BrownShadowbeast()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Klucz do Myrtany");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Cieniostwory to jeden z najgro�niejszych gatunk�w zwierz�t jakie zamieszkuj� znany nam �wiat. Owe zwierz�ta wyst�puj� na obszarze Myrtany, Nordmaru i Varantu. S� spotykane r�wnie� na licznych wyspach Wielkiego Morza, m.in. na Khorinis. Istniej� r�ne odmiany owej straszliwej bestii, kt�re niejednokrotnie bardzo si� od siebie r�ni� cechami wygl�du zewn�trznego.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_BrownShadowbeast,	LOG_NOTE);
	B_LogEntry		(BookLog_BrownShadowbeast,	"Cieniostw�r brunatny");
	B_LogEntry		(BookLog_BrownShadowbeast,	"''Cieniostwory to jeden z najgro�niejszych gatunk�w zwierz�t jakie zamieszkuj� znany nam �wiat. Owe zwierz�ta wyst�puj� na obszarze Myrtany, Nordmaru i Varantu. S� spotykane r�wnie� na licznych wyspach Wielkiego Morza, m.in. na Khorinis. Istniej� r�ne odmiany owej straszliwej bestii, kt�re niejednokrotnie bardzo si� od siebie r�ni� cechami wygl�du zewn�trznego. Wygl�dem cieniostwory przypominaj� du�ego, umi�nionego psa, z zakrzywionym do ty�u rogiem, paszcz� naszpikowan� z�bami i �apami uzbrojonymi w ostre pazury.");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Ta jednak ksi�ga opisuje rodzaj cieniostwora, kt�ry spotka� mo�na na Khorinis i wyspach s�siaduj�cych. Owa szczeg�lna odmiana zosta�a nazwana cieniostworem brunatnym, a to przez wzgl�d na umaszczenie ich sier�ci. Cieniostw�r brunatny, podobnie jak jego kuzyni z innych stron �wiata, posiada charakterystyczny, lekko zakrzywiony do ty�u r�g wyrastaj�cy mu na g�rnej cz�ci g�owy. R�g ten s�u�y do przeszywania nim ofiar owej ogromnej bestii i jest wykorzystywany na podobie�stwo ostrzy stosowany przez ludzi. ");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Do cech wyra�nie wyr�niaj�cych go na tle fauny Khorinis nale�� zdecydowanie rozmiary, znacznie przewy�szaj�ce rozmiar cz�owieka. Jego masywne cielsko trzyma si� na czterech silnych �apach, z czego dwie przednie wykorzystywane s� przez cieniostwora do ataku. One to wesp� z poka�nymi z�bami s�u�� jako narz�dzie polowa� i obrony, a tak�e do rozrywania mi�sa z�owionej zdobyczy. Na uwag� zas�uguj� te� wspomniane ju� k�y bestii, b�d�ce doskona�� broni�, potrafi�c� rozci�� i prze�u� nawet najtwardsze p�aty mi�sa. ");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Owe zwierz�ta upodoba�y sobie ciche i pozbawione �wiat�a s�onecznego miejsca, takie jak ciemne lasy, jaskinie, groty, rzadziej ruiny. Od tej w�a�ciwo�ci pochodzi w�a�nie nazwa ca�ego gatunku. Zwykle cieniostw�r wr�cz manifestuje swoje terytorium i obecno��, masakruj�c swoje ofiary - wok� kryj�wek tych stwor�w mo�na cz�sto znale�� ogromne ilo�ci krwi, krwawe �lady �ap, a tak�e ogromne ilo�ci ko�ci i szkielet�w. Cieniostw�r poluje nocami, a za dnia �pi. Jego ofiarami padaj� mniejsze od niego stworzenia, a b�d�c jednym z najwi�kszych drapie�c�w, jako sw�j potencjalny posi�ek traktuje on w�a�ciwie wszystkie zwierz�ta. Jego po�ywieniem najcz�ciej s� �cierwojady, jelenie i inne drobne ssaki. Cz�owiek, nie dor�wnuj�c mu wielko�ci� i si�� jest r�wnie� uwa�any przez t� besti� za �akomy k�sek, od czasu do czasu wzbogacaj�cy i tak ju� bogat� diet� cieniostwora.");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Na szcz�cie ten wielki i gro�ny drapie�ca prowadzi samotny tryb �ycia, spotykaj�c si� z innymi osobnikami w czasie god�w, ale te� w walce, w przypadku naruszenia przez innego cieniostwora swego terytorium. Szansa natkni�cia si� na wi�cej ni� jednego cieniostwora jest stosunkowo niewielka. Mimo to spotkanie ju� jednego osobnika radykalnie zmniejsza szanse nieszcz�liwego cz�owieka na wyj�cie ca�o ze spotkania. Atakowanie go jest pomy�k� zw�aszcza noc�, poniewa� wtedy jest w pe�ni si�. Najlepiej zakra�� si� do niego za dnia, lecz i to bywa niebezpieczne, poniewa� drapie�nik czuwa nawet podczas snu. Broni si� gryz�c, drapi�c, a nawet szar�uje wyrzucaj�c przeciwnika w g�r�. Cieniostw�r jest bardzo szybki i ucieczka przed nim jest trudna, ale mo�liwa tylko, gdy w por� zaczniemy ucieka�");
};

/////////////////////////////////////////////////////////////////////
// PR�BA WODY
// BIBLIOTEKA MAG�W
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_WaterTry (C_ITEM) //dodane
{
	name 					=	"Pr�ba Wody";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	140;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Stirius z Vaduz";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_WaterTry;
};

FUNC VOID Use_Book_WaterTry()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Pr�ba Wody");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Dawniej ka�dy nowicjusz Zakonu Mag�w Adanosa, gdy mija� pierwszy rok nauki poddawany by� pr�bie wody. By� to si�gaj�cy niepami�tnych czas�w zwyczaj, praktykowany w�r�d kap�an�w Adanosa na wyspie Vaduz. M�odych prowadzono nad brzegi jeziora, gdzie wyprowadzeni na p�ycizn� byli zanurzani. Starsi bracia trzymali im g�owy pod wod�, czekaj�c a� p�uca zanurzanych wype�ni� si� wod�, a nowicjusze wyzion� ducha.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_WaterTry,	LOG_NOTE);
	B_LogEntry		(BookLog_WaterTry,	"Pr�ba Wody");
	B_LogEntry		(BookLog_WaterTry,	"''Dawniej ka�dy nowicjusz Zakonu Mag�w Adanosa, gdy mija� pierwszy rok nauki poddawany by� pr�bie wody. By� to si�gaj�cy niepami�tnych czas�w zwyczaj, praktykowany w�r�d kap�an�w Adanosa na wyspie Vaduz. M�odych prowadzono nad brzegi jeziora, gdzie wyprowadzeni na p�ycizn� byli zanurzani. Starsi bracia trzymali im g�owy pod wod�, czekaj�c a� p�uca zanurzanych wype�ni� si� wod�, a nowicjusze wyzion� ducha. Nast�pnie wyci�gano ich na brzeg, gdzie adepci wypompowywali wody z wn�trz nieprzytomnych cia�. Gdy ju� to uczyniono, kap�an prowadz�cy uroczysto�� wt�acza� w gardziel nowicjuszy powietrze z p�uc swoich, by za spraw� Adanosa �ycie im wr�ci�. Tak oto Pan Wody wed�ug swej woli orzeka� kto godnym jest, pe�nienia pos�ugi kap�a�skiej. Ten kto pod wp�ywem tchnienia maga wody powraca� z Kr�lestwa Adanosa, w pe�ni wchodzi� ju� do Zakonu Kap�an�w Wody i cho� nie by� jeszcze kap�anem, to zyskiwa� prawo zg��biania boskich tajemnic. Wielu jednak Adanos pozostawi� w za�wiatach, sprawiedliwych wezwawszy do swojego tronu, bezecnych zostawiaj�c na pastw� Beliara. ");
	
	B_LogEntry		(BookLog_WaterTry,	"Przez wieki kolejni nowicjusze poddawani byli pr�bie wody, otwieraj�c tym samym sobie drog� do kap�a�stwa. Wed�ug zapis�w zwyczaj ten wywodzi� si� mia� od jednego z protoplast�w Zakonu Adanosa na Vaduz, kt�ry to wyzwa� na pojedynek poga�skich szaman�w. I Abelion, i ba�wochwalcy mieli dowie�� mocy swych bog�w oddaj�c swych przyjaci� wodzie i o�ywiaj�c ich martwe cia�a. Zwyci�stwo Abeliona sprawi�o, �e kr�l Brandilios uzna� prawdziwo�� kultu Adanosa i uczyni� go wyznaniem panuj�cym na Vaduz. Na 82 lata przed powstaniem Kr�lestwa Myrtany zdarzy�a si� rzecz dziwna. Oto wszystkich o�miu ch�opc�w oddanych wodzie, nie zosta�o o�ywionych. A byli to synowie rod�w znacznych na Vaduz i wnet spraw� wniesiono do samego kr�la Mallandora. W�adca �w madry zna� swoich poddanych i syn�w mo�nych. Orzek� wi�c o prawo�ci utopionych ch�opc�w. Rzek� wi�c: 'Wina nie tkwi w nowicjuszach tych, ani w lordach moich. By� mo�e Adanos chce nas przed nieprawo�ciami ostrzec, co w�r�d jego s�ug si� zal�g�y'. Za��da� przeto od bogatych hierarch�w, �eby poddali si� pr�bie wody, na znak, �e Adanos nowicjuszy za grzechy zwierzchnik�w nie karze. A powiadaj� m�drcy niekt�rzy, �e przebieg�y kr�l pragn�� tym sposobem w swoj� gar�� wzi�� Ko�ci� Adanosa. Hierarchowie nie chcieli na to przysta�. Na wie�� o tragicznej pr�bie wody, zar�wno szlachcice, jak i ch�opi nie chcieli ju� dzieci swych do klasztoru na kap�any wysy�a�, by synowie ich nie podzielili losu potopionych. Mi�dzy sob� zakrzykneli: 'Czemu mieliby�my daniny im sk�ada�, skoro takich rzeczy si� dopuszczaj�. S�ab� Zakon, s�ab� klasztor. Niebawem przy kr�lu zgromadzili si� kap�ani Adanosa z innych stron �wiata przybyli, a do nich do��czyli te� miejscowi magowie niech�tni prze�o�onym i rzekli: 'Je�eli patriarchowie Vaduz s� prawi i Adanosowi mi�e s� pr�by wody, to b�stwo da im zwyci�stwo w pr�bie wody!'.");
	
	B_LogEntry		(BookLog_WaterTry,	"Zakon Mag�w Wody nie mia� wyboru i musia� si� w ko�cu zgodzi� na przyj�cie wyzwania. Zanurzono tedy kap�an�w, co przy tronie kr�la si� gromadzili, a Adanos wr�ci� ich do �ycia. Zanurzono potem hierarch�w i ducha wyzion�li, a gdy przywr�cono tych do �ycia zdolno�� mowy postradali. I rzek� kr�l: 'Prawi to s� m�owie Adanosa, lecz b�stwo odebra�o im j�zyki. Niechaj wi�c przemawiaj� Ci co s�usznie prawi�'! Zgodnie z wol� Adanosa, od tej pory zaniechano owych praktyk na nowicjuszach. Zwyczaj ten jednak do ko�ca nie zanik� i niejednokrotnie w p�niejszych czasach co bardziej gorliwi i tradycyjnie nastawieni nowicjusze wypraszali dla siebie pr�by wody. Kap�ani niezbyt jednak ch�tnie zezwalali na te pro�by, albowiem uznano ten spos�b dowodzenia swych racji za archaiczny i wielce niepewny, wszak nie tylko Adanos mia� bosk� moc...");
	
};

/////////////////////////////////////////////////////////////////////
// HEINARA WIEDZA O SZKIELETACH
// WIE�A XARDASA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HeinarSceletons (C_ITEM) //dodane
{
	name 					=	"Heinara wiedza o szkieletach ";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Heinar z Khorinis";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_HeinarSceletons;
};

FUNC VOID Use_Book_HeinarSceletons()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Heinara wiedza o szkieletach");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Jest rzecz� do�� trudn� powiedzie� co� konkretnego, co by dotyczy�o wszelkiego o�ywie�ca pozbawionego cielesnej pow�oki, to jest szkielet�w. Wi�c ich si�a i zr�czno�� zdaj� si� zale�e� od tego, jak silni i zr�czni byli oni za �ycia. Podobnie stopie� opanowania umiej�tno�ci bojowych zapewne jest odzwierciedleniem zdolno�ci �ywego cz�owieka. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HeinarSceletons,	LOG_NOTE);
	B_LogEntry		(BookLog_HeinarSceletons,	"Heinara wiedza o szkieletach");
	B_LogEntry		(BookLog_HeinarSceletons,	"Jest rzecz� do�� trudn� powiedzie� co� konkretnego, co by dotyczy�o wszelkiego o�ywie�ca pozbawionego cielesnej pow�oki, to jest szkielet�w. Wi�c ich si�a i zr�czno�� zdaj� si� zale�e� od tego, jak silni i zr�czni byli oni za �ycia. Podobnie stopie� opanowania umiej�tno�ci bojowych zapewne jest odzwierciedleniem zdolno�ci �ywego cz�owieka. Nic wi�c dziwnego, �e na swej drodze podr�nik spotka ca�� gam� owych istot, a ka�dy szkielet b�dzie nieco innym wyzwaniem. Nie jest to jednak pow�d do obaw, gdy� ci co raz zgin�li, mog� zgin�� i drugi, a i trzeci jak bogowie zdarz�.  ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Wbrew bajkom rozhisteryzowanych bab i nie posiadaj�cych m�stwa w sercu pajac�w, 'zabicie' szkieletu nie jest specjalnie trudne. Wystarczy nieco umiej�tno�ci bojowych i wprawy, by ostatecznie wys�a� to �cierwo na drugi �wiat (nie m�wi� o histeryczkach!). Zapewniam, �e do zabicia szkieletu nie potrzeba zaczarowanej broni, ani czar�w. Naprawd� wystarczy zda� si� na zwyczajne uzbrojenie, pozostaj�ce na wyposa�eniu my�liwego. Rzecz jasna z wy��czeniem �uk�w, bo strza�y przez szkielet przelec�. ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Istniej� jednak pewne rodzaje szkielet�w, kt�re r�ni� si� od pozosta�ych i kt�re lepiej unika�. Mo�na o nich powiedzie�, �e wydaj� si� czerpa� wi�ksz� cz�� mocy z energii czaru ni� z tworz�cej je materii. Owe istoty s� szczeg�lnie niebezpieczne i nale�y ich unika�. Niemniej s� one te� niezwykle rzadkie, za� t�pienie ich to ju� robota dla inkwizytor�w, a nie dla zwyk�ych my�liwych, czy wojak�w. ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Heinar z Khorinis");
};

/////////////////////////////////////////////////////////////////////
// INFERIUSY
// WIE�A XARDASA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Inferiusy (C_ITEM)
{
	name 					=	"Inferiusy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Silezar z Gothy";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_Inferiusy;
};

FUNC VOID Use_Book_Inferiusy()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Inferiusy");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Spo�r�d ponurych wypacze� nekromant�w, jednym z najstraszniejszych blu�nierstw jest niew�tpliwie tworzenie inferiusa. Nekromanta o�ywiaj�c wydarte ziemi cia�o zmar�ego, czyni je swym bezwolnym narz�dziem. Bezczeszcz�c zw�oki zmar�ego i dokonuj�c gwa�tu na naturze, tworzy z nich jednocze�nie niewolne monstrum. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Inferiusy,	LOG_NOTE);
	B_LogEntry		(BookLog_Inferiusy,	"Inferiusy");
	B_LogEntry		(BookLog_Inferiusy,	"Spo�r�d ponurych wypacze� nekromant�w, jednym z najstraszniejszych blu�nierstw jest niew�tpliwie tworzenie inferiusa. Nekromanta o�ywiaj�c wydarte ziemi cia�o zmar�ego, czyni je swym bezwolnym narz�dziem. Bezczeszcz�c zw�oki zmar�ego i dokonuj�c gwa�tu na naturze, tworzy z nich jednocze�nie niewolne monstrum. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Wbrew pozorom nekromanci nie wskrzeszaj� wcale zmar�ych, ani nie powracaj� im �ycia. Za spraw� czarnej magii w truchle pojawia si� nekromanckie tchnienie, kt�re niewoli cia�o zmar�ego i czyni je powolnym woli nekromanty. Tak oto powstaj� z ziemi trupy naszych bli�nich, za� ich rozk�adaj�ce si� cia�a i ko�ci budz� groz� w �ywych. Inferiusy mog� ujawnia� si� jako szkielety, b�d� ulegaj�ce rozpadowi chodz�ce zw�oki. W dodatku jak podaj� ludzie, kt�rym dane by�o spotka� inferiusa, w oczach o�ywie�ca mo�na dostrzec niewyobra�alne cierpienie. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Czyn nekromancki jest zbrodni� przeciwko prawom boskim i przeciw przyrodzonej godno�ci cz�owieka - przeciwko temu darowi jakim w swej m�dro�ci obdarzyli nas bogowie. Owo wynaturzenie sprowadza o�ywione zw�oki do poziomu krwio�erczego zwierz�cia, kt�re jest gotowe zaatakowa� ka�dego napotkanego cz�owieka. Inferiusy to �ywi� si� padlin�. Na tym jednak nie koniec, gdy� po�eraj� nawet ludzkie zw�oki, �ami�c kolejne z praw boskich. Nie one s� jednak winne owym wyst�pkom, jeno plugawi nekromanci, kt�rzy w swej pysze powo�ali do �ycia inferiusa. W ci�gu wiek�w moc z�ego sta�o si� za spraw� tych bezecnych magus�w. Zdarzali si� w�adcy, kt�rzy nachylali ucha ku podszeptom nekromant�w, by pogn�bic swych wrog�w. Inni spo�r�d plugawych magus�w dzia�ali na w�asn� r�k�.");
	
	B_LogEntry		(BookLog_Inferiusy,	"Dobry nasz Innos, Pan Ognia przedwieczny, w swej �asce obdarzy� ludzi wspania�ym b�ogos�awie�stwem. Z jego nakazu, ka�dy prawowierny Innosyta winien jest udzieli� zmar�emu poch�wku w imi� Innosa. Wielu ludzi zignorowa�o ten nakaz, gdy� nie ufa�a m�dro�ci Pana Ognia. Dopiero z czasem ludzie odkryli, �e Innos nie bez przyczyny da� ludziom owe przykazanie, gdy� ten kto zgodnie z obrz�dkiem Innosyckim by� pochowany, ten by� jego �ask� chroniony przed praktyk� nekromanck�. Dzi�ki owemu b�ogos�awie�stwu 'o�ywie�cem' nie stanie si� cz�owiek nale�ycie pochowany. Jasnym wi�c si� staje, �e odm�wienie poch�wku zmar�emu jest w�a�ciwie wydaniem jego cia�a na pastw� nekromant�w, a co za tym idzie podobny post�pek jest cie�kim przewinieniem wobec bog�w. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Istniej� te� niespokojne dusze, kt�re umieraj�c �mierci� gwa�town�, lub utrzymywane na tym �wiecie ziemskimi sprawami, pozostaj� na tym padole. Ich �wiadomo�� i w�adza nad cia�em jest niewiele wi�ksza ni� nieszcz�nik�w o�ywionych przez nekromant�. To czyni takie dusze podobnymi do inferius�w. Jednak nimi nie s�. Niemniej godny poch�wek i tu dzia�a z podobn� moc�. Przeto Ko�ci� Innosa i Ko�ci� Adanosa nakazuj� swym wiernym grzebanie zmar�ych, niezale�nie od wiary i pochodzenia grzebanego. Podobnie czyni� i plemiona poga�skie, lecz u nich z innej to przyczyny si� dzia� musi. ");
};


/////////////////////////////////////////////////////////////////////
// �CIERWOJAD BIA�Y
// DO KUPIENIA U MY�LIWYCH
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_WhiteScavenger (C_ITEM) //dodane
{
	name 					=	"�cierwojad bia�y";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	90;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Grainwaid z Khorinis";
	TEXT[3] 				=	"";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_WhiteScavenger;
};

FUNC VOID Use_Book_WhiteScavenger()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "�cierwojad bia�y");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "�cierwojady s� niezwykle zr�nicowan� gatunkowo grup� zwierz�t. Wyst�puj� zar�wno na ��kach i lasach Zielonej Myrtany, jak i na licznych wyspach po�o�onych na wsch�d od Kontynentu. Te wielkie ptaki zaliczane s� do nielot�w. Cho� istnieje wiele rodzaj�w �cierwojad�w, to ksi�ga ta skupia si� jedynie na bia�o-niebieskawym nieopierzonym �cierwojadzie z Khorinis, kt�ra to odmiana nazywana jest �cierwojadem bia�ym.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_WhiteScavenger,	LOG_NOTE);
	B_LogEntry		(BookLog_WhiteScavenger,	"�cierwojad bia�y");
	B_LogEntry		(BookLog_WhiteScavenger,	"�cierwojady s� niezwykle zr�nicowan� gatunkowo grup� zwierz�t. Wyst�puj� zar�wno na ��kach i lasach Zielonej Myrtany, jak i na licznych wyspach po�o�onych na wsch�d od Kontynentu. Te wielkie ptaki zaliczane s� do nielot�w. Cho� istnieje wiele rodzaj�w �cierwojad�w, to ksi�ga ta skupia si� jedynie na bia�o-niebieskawym nieopierzonym �cierwojadzie z Khorinis, kt�ra to odmiana nazywana jest �cierwojadem bia�ym. Opisywany rodzaj zamieszkuje ca�y obszar wyspy Khorinis, pocz�wszy od ��k, p�l i las�w rozpo�cieraj�cych si� u podn�y miasta portowego, a� po wi�zienn� G�rnicz� Dolin�. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"�cierwojad bia�y swymi rozmiarami g�ruje tam nad wszelkim ptactwem jakie znajdziemy na terenie wyspy. Porusza si� na dw�ch tylnych ko�czynach, zako�czonych ostrymi pazurami. Posiada r�wnie� masywny dzi�b, s�u��cy mu podobie jak szpony podczas �ow�w do atakowania ofiary, a nast�pnie do rozrywania jej mi�sa. Cho� tu nale�y doda�, �e ani szpony �cierwojada, ani dzi�b nie s� uwa�ane za nazbyt po��dane trofeum my�liwskie. Podobnie rzecz si� ma z ich �uskowat� sk�r�, czy niewykszta�conymi niemal skrzyd�ami. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"Gatunek ten podobnie jak jego krewniacy z Kontynentu, czy Wysp Po�udniowych, �ywi si� drobnymi zwierz�tami polnymi i padlin�. Temu ostatniemu sk�adnikowi swej diety zawdzi�cza sw� niechlubn� nazw� �cierwojada. �cierowjad bia�y wi�kszo�� dnia po�wi�ca rozgrzebywaniu ziemi w poszukiwaniu po�ywienia, cho� niekiedy mo�na zaobserwowa� te� jak �w ptak poluje na inne zwierz�ta. Jest w stanie zaatakowa� mniejsze od siebie istoty jak owce, szczury, a w grupie r�wnie� pojedyncze wilki. Jak przysta�o na ptaki, przedstawiciele tego gatunku s� jajorodne. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"Zalicza si� je do zwierz�t stadnych �yj�cych w grupach od 3-7 osobnik�w razem zdobywaj�cych po�ywienie, cho� mo�na spotka� r�wnie� pojedyncze osobniki prowadz�ce samotny tryb �ycia. �cierwojady s� cz�stym obiektem �ow�w my�liwych, albowiem ich mi�so, odpowiednio przyrz�dzane jest  w stanie dogodzi� niemal ka�demu podniebieniu - mo�e z wyj�tkiem kosmopolitycznej warstwy wielkiego kupiectwa, lubuj�cej si� w egzotycznych potrawach. R�wnie� jaja �cierwojad�w ciesz� si� opini� bardzo po�ywnego i obok mi�sa stanowi� jedn� z podstaw diety my�liwych poluj�cych w lasach Myrtany, Khorinis, Vaduz i Wysp Po�udniowych...");
};

/////////////////////////////////////////////////////////////////////
// PRZYWILEJ DZIEDZICZENIA
// TWIERDZA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_PrivilegeInheritance (C_ITEM) //do
{
	name 					=	"Przywilej dziedziczenia";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Prawo myrta�skie";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_PrivilegeInheritance;
};

FUNC VOID Use_Book_PrivilegeInheritance()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Przywilej dziedziczenia");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Spisane oto zasady dotycz�ce dziedziczenia w Kr�lestwie Myrtany obowi�zuj�ce.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_PrivilegeInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_PrivilegeInheritance,	"Przywilej dziedziczenia");
	B_LogEntry		(BookLog_PrivilegeInheritance,	"1. Je�li umrze kt�ry� z po�r�d naszych hrabi�w i baron�w lub innych wasali dzier��cych dobra naprawie rycerskim, a w chwili �mierci jego spadkobierca by� ju� pe�noletni i obowi�zany �wiadczy� nam daniny niechaj posi�dzie lenno swoje p�ac�c daniny jak dawniej, mianowicie dziedzic lub dziedzice hrabiego dzier��cego ca�kowit� baroni� hrabiowsk� - sto funt�w; dziedzic lub dziedzice barona dzier��cego ca�kowit� baroni� r�wnie� �sto funt�w, dziedzic lub dziedzice rycerza posiadaj�cego pe�ne lenno nie wi�cej jak sto szyling�w; kto za� winien by mniej �wiadczy�, niechaj da mniej na zasadzie dawnego zwyczaju feuda��w.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"2. Gdyby za� dziedzic takiego� lenna by� niepe�noletni i pozostawa� jeszcze pod opiek�, to gdy tylko osi�gnie lata sprawne niechaj obejmie swoje dziedzictwo nie p�ac�c ani relevium, ani te� innej op�aty.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"3. Opiekun ziemi takiego dziedzica, kt�ry nie posiad� lat sprawnych nie powinien pobiera� z ziemi dziedzica nic ponad s�uszne op�aty, s�uszne zwyczaje i s�uszne powinno�ci i to bez zniszcze� i ubytk�w w ludziach i inwentarzu, a je�li my powierzymy tego rodzaju opiek� nad maj�tkiem szeryfowi, lub komukolwiek innemu, kto b�dzie obowi�zany wobec nas do rozlicze� z dochod�w i wydatk�w i ten�e powierzone sobie dobra doprowadzi do upadku i spustoszenia, �ci�gniemy od niego odszkodowanie a lenno powierzymy dwom pe�noprawnym i godnym zaufania ludziom i oni rozlicza� si� b�d� z nami lub z tym komu ich przydzielimy. Je�li za� oddamy lub sprzedamy komukolwiek opiek� nad tymi dobrami i ten okaza�by si� odpowiedzialny za ruin� i spustoszenie to utraci opiek�, kt�ra zostanie przekazana dwom pe�noprawnym i godnym zaufania ludziom z tego� lenna, kt�rzy przed nami b�d� odpowiedzialni w spos�b wy�ej okre�lony.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"4. Za� opiekun jak d�ugo sprawowa� b�dzie opiek� nad ziemi� powinien z uzyskanych z ziemi dochod�w dba� o domy, ogrodzenia, zabudowania, stawy, m�yny i inne przynale�ne do posiad�o�ci urz�dzenia, a gdy dziedzic osi�gnie lata sprawne opiekun winien mu odda� ca��, jego posiad�o�� wyposa�on� w p�ugi i narz�dzia stosowane do okresowych potrzeb uprawy roli i sposobu jej u�ytkowania.");
};

/////////////////////////////////////////////////////////////////////
// PRZYWILEJ KUPIECKI
// TWIERDZA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_MerchantInheritance (C_ITEM)
{
	name 					=	"Przywilej kupiecki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Prawo myrta�skie";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_MerchantInheritance;
};

FUNC VOID Use_Book_MerchantInheritance()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Przywilej kupiecki");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Kupieckie przywileje przez kr�la Myrtany Rohobara I przyznane gildiom kupieckim.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_MerchantInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_MerchantInheritance,	"Przywilej kupiecki");
	B_LogEntry		(BookLog_MerchantInheritance,	"Niechaj wszyscy kupcy, zar�wno obracaj�cy wielkim kapita�em i drobni handlarze, pochodz�cy z ziem Kr�lestwa Myrtany i kraj�w postronnych od Nas, Kr�la Myrtany, ten przywilej otrzymuj�. ");
	
	B_LogEntry		(BookLog_MerchantInheritance,	"Wszyscy kupcy celem dokonywania zakupu i sprzeda�y towaru, pr�cz d�br rozporz�dzeniem naszym spod obrotu wyj�tych, maj� prawo swobodnego i bezpiecznego podr�owania po ziemiach Kr�lestwa Myrtany, mog�c bez wstr�t�w z czyjejkolwiek strony przybywa�, przemierza� i opuszcza� ziemie b�d�ce w�adztwem Kr�la Myrtany. Niechaj maj� prawo podr�owa� zar�wno na l�dzie, jak i na morzu wed�ug dawnych sprawiedliwych zwyczaj�w, bez �adnych bezprawnie pobieranych op�at.");
	
	B_LogEntry		(BookLog_MerchantInheritance,	"W godzinie kiedy d�wi�k tr�b og�osi wojn�, wtedy na czas trwania konfliktu z przywileju swobodnej podr�y wy��czeni zostaj� kupcy z kraz kraju znajduj�cego si� w wojnie z nami; a je�li tacy znajd� si� w naszym kr�lestwie na pocz�tku wojny, winni by� zatrzymani bez szkody dla ich os�b i mienia do tego czasu, dop�ki My nie dowiemy si�, w jaki spos�b traktowani s� kupcy z Naszego kr�lestwa, kt�rzy w owym w�a�nie czasie znaj dowali si� w kraju prowadz�cym wojn� z nami; a je�li nasi s� tam bezpieczni, w�wczas i ci za�ywa� b�d� bezpiecze�stwa w naszym kr�lestwie.");
};

/////////////////////////////////////////////////////////////////////
// PRZYWILEJ LICHWIARSKI
// TWIERDZA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_UsouriusInheritance (C_ITEM)
{
	name 					=	"Przywilej lichwiarski";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Prawo myrta�skie";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_UsouriusInheritance;
};

FUNC VOID Use_Book_UsouriusInheritance()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Przywilej lichwiarski");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Przywileje przys�uguj�ce lichwiarzom w Kr�lestwie Myrtany. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_UsouriusInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_UsouriusInheritance,	"Przywilej lichwiarski");
	B_LogEntry		(BookLog_UsouriusInheritance,	"Wiele zamieszania i niesprawiedliwo�ci si� zrodzi�o z nieuporz�dkowania kwestii dziedziczenia d�ugu, kt�ry zmar�y u lichwiarza przed �mierci� zaci�gn��. Przeto ustanowiony zostaje w ca�ym Kr�lestwie jeden zwyczaj, wed�ug kt�rego w ca�ym Kr�lestwie Myrtany ma si� od momentu jego og�oszenia post�powa�. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"Je�li poddany naszego Kr�lestwa, czy cz�owiek z krain o�ciennych do w�adztwa naszego przybywaj�cy, pobra� jak�kolwiek mniejsz� lub wi�ksz� po�yczk� od lichwiarza z Kr�lestwa Myrtany i umar� przed jej sp�at�, d�ug ten nie podlega oprocentowaniu tak d�ugo dop�ki dziedzic nie osi�gnie wieku pe�noletniego. Lichwiarz za�, nic ponad zapisan� nale�no��, z tego tytu�u pobra� nie mo�e, pr�cz tego co mu si� zgodnie z umow� nale�y. Jednocze�nie kontrakt zawarty mi�dzy wierzycielem i d�u�nikiem, staje si� umow� chronion� prawem kr�lewskim i jej niedotrzymanie zgodnie z prawem kr�lewskim b�dzie karane. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"I je�li kto� umrze potomka nie zostawiwszy, a winien b�dzie lichwiarzowi, wdowa po nim podejmuje si� d�ug ten sp�aci�. Po�yczone pieni�dze nie podlegaj� oprocentowaniu przez dwa trzy lata i osiem dni, gdy� jest to czas w kt�rym wdowa ma zgromadzi� pieni�dze potrzebne na d�ugu pokrycie. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"�aden wierzyciel nie zagarnie te� �adnej posiad�o�ci, ani dochodu z tytu�u jakiejkolwiek zaleg�o�ci, jak d�ugo ruchomo�ci d�u�nika wystarcz� na pokrycie tej zaleg�o�ci, tak d�ugo r�wnie� por�czyciele nie b�d� poci�gni�ci do pokrycia d�ugu, dop�ki w�a�ciwy d�u�nik posiada odpowiedni �rodek i dopiero gdy w�a�ciwego d�u�nika nie b�dzie sta� na zap�at�, por�czyciele stan� si� odpowiedzialni za d�ug i je�li zechc� obejm� ziemi� i dochody d�u�nika i zatrzymaj� dop�ki nie uzyskaj� zado��uczynienia za wydatki jakie za niego pokryli, chyba �e w�a�ciwy d�u�nik wyka�e, �e wywi�za� si� wobec swoich por�czycieli.");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"W podobny spos�b dzia� ma si� z nale�no�ciami u innych os�b ani�eli u lichwiarza zaci�gni�te, co by prawa wierzyciela do w�asno�ci swej broni�, za� poddanych naszych przed ruin� uchroni�. ");
};

/////////////////////////////////////////////////////////////////////
// ZNAKI Z�ODZIEJSKIE... UTRACONE
// CHATA W STARYM OBOZIE
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LostThiefSigns (C_ITEM) //d
{
	name 					=	"Utracone znaki z�odziejskie";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	20;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Darl z Khorinis";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_LostThiefSigns;
};

FUNC VOID Use_Book_LostThiefSigns()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Utracone znaki z�odziejskie");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Przez oko�o lat stu i jeszcze po�owy tego, Gildia u�ywa�a znak�w danych nam przez Samela. Symboli po dwakro� utrwalonych, bo raz - w pami�ci naszej, a dwa - w ksi�dze pi�rem Lutharda spisanej. Dzi�ki nim wiedzieli�my gdzie skarb na nas czeka, a gdzie niebezpiecze�stwo si� na z�odzieja czai. Kres jednak nasta� dni, w kt�rych znak�w tych mogli�my u�ywa�. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_LostThiefSigns,	LOG_NOTE);
	B_LogEntry		(BookLog_LostThiefSigns,	"Utracone znaki z�odziejskie");
	B_LogEntry		(BookLog_LostThiefSigns,	"Przez oko�o lat stu i jeszcze po�owy tego, Gildia u�ywa�a znak�w danych nam przez Samela. Symboli po dwakro� utrwalonych, bo raz - w pami�ci naszej, a dwa - w ksi�dze pi�rem Lutharda spisanej. Dzi�ki nim wiedzieli�my gdzie skarb na nas czeka, a gdzie niebezpiecze�stwo si� na z�odzieja czai. Kres jednak nasta� dni, w kt�rych znak�w tych mogli�my u�ywa�. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Oto po �mierci kupca Selwyna Ravelli, co w przyja�ni z nasz� Gildi� �y� i dzieli� z nami owoce swej pracy, jego maj�tek i interes odziedziczy� Lutero Ravella - syn jego i zaka�a dumnej rodziny. On to wierno�ci nam, wsp�pracownikom swego ojca, nie chcia� dotrzyma� i z�oto chciwie przy sobie chowa�. A g�upio czyni�, gdy� z�oto owe Selwyn zgromadzi� razem z nami i przy naszej pomocy swego z�ota strzeg�. I przy nas pomno�y�o si� bogactwo starego Ravelli, kt�re po nim otrzyma� jego g�upi syn. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Gdy wtedy Lutero odrzuci� przyja�� nasz�, przyw�dca Gildi Z�odziei, kt�rym w tym czasie by� Galid rzek� do nas: 'Dom rodu Ravella nie jest ju� nam przyjazny, wi�c jego mury nie maj� prawa piecz�towa� si� znakiem Studni'. Tej nocy wyruszy� m�ody brat nasz Dickon, by symbol Studni zmaza� i nowy na rezydencji Ravelli wyry�. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Kto wie, czy b��dem ch�opca, czy z�o�liwo�ci� losu, Dickon zosta� zauwa�ony i pochwycony przez stra�e. O ile jednak w misji swej tamtej nocy zawi�d�, to swym oddaniem i po�wi�ceniem w niema�ej mierze sp�aci� sw�j d�ug. Oto w koszarach przetrzymywany o chlebie i wodzie, w brutalny spos�b przes�uchiwany i do zdrady Gildii namawiany, nie uleg�. Skazanego Dickona, zes�ano do Kolonii Karnej, gdzie za konsekwencj� swego b��du mia� srodze pokutowa�. Nie wyjawi� jednak stra�om, gdzie nasza Gildia posiada kryj�wk�, ani nie sprzeda� �adnego ze swych towarzyszy. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Co oczywiste, po z�apaniu Dickona stra� si� owymi znakami wielce zainteresowa�a. Lutero uczyni� wszystko, by naprowadzi� stra�e na trop wiod�cy do Gildii Z�odziei, samemu skrz�tnie maskuj�c wsp�prac� swego ojca z nami. Pojawi�a si� obawa, �e znaki, kt�re dawniej tylekro� nam s�u�y�y, teraz mog� wskaza� nieprzyjacielowi drog� do naszej kwatery g��wnej. Zagro�eni te� byli zaprzyja�nieni z nami bogacze, gdy� na ich domach widnia�y symbole, kt�re z�amane przez stra�e, mog�y rzuci� cie� podejrzenia na dzia�alno�� owych ludzi interesu. Albowiem tak jak kodeks z�odzieja ka�e zachowa� lojalno�� wzgl�dem przyjaci�, tak dla kupca wa�na jest reputacja, kt�ra zawsze w kupieckich transakcjach musi by� uwzgl�dniana. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Rozes�ali�my wtedy listy do zaprzyja�nionych bogaczy, co by odnale�li owe znaki i usun�li je ze swych domostw. Wielu z nich nie pos�ucha�o naszych pr�b, gdy� wi�za�o rozmaite nadziej� z rozbiciem nas przez stra�e. Tacy fa�szywi przyjaciele wskazywali jednocze�nie �ledczym opisane w owych listach symbole. M�drzy ludzie jednak wiedzieli, �e zniszczenie prawej i honorowej organizacji z�odziejskiej, rz�dz�cej si� zwyczajem z�odziejskim i zwalczaj�cej z�odziejskich partaczy, oznacza� b�dzie chaos i przyniesie wszystkim jedynie szkody. Rozumnie widz�c zysk w istnieniu Gildii Z�odziei, nak�onili oni ucha do pr�b naszych serdecznych i post�pili zgodnie z tre�ci� pism. Ci wiele sympatii u nas tym uczynkiem zdobyli, gdy� okazali si� nie tylko prawdziwymi przyjaci�mi Gildii, ale te� lud�mi m�drymi. Jednocze�nie staraniem naszym z miasta znikn�y wszystkie 'Ramiona Samela', a tak�e wiele innych znak�w. Jedynie w strze�onym G�rnym Mie�cie wiele symboli si� uchowa�o, a to przez wzgl�d na wzmo�one zainteresowani nimi jakie przejawia�a stra�. Niestety, w przeci�gu kilku tygodni �ledztwa znaki owe z�amano. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Gdy Galid i inni si� zgromadzili, wiele nad tym nieszcz�ciem radzono. Jedni powiadali by ustalone przed laty znaki zachowa� i wr�ci� do nich w czasie ku temu stosownym, to jest gdy sprawa przycichnie. Inni radzili by na nieprzyjacio�ach si� zem�ci� i Studni� oznakowa� domostwa bogaczy, co by na nich stra�e sprowadzi�. A znak ten znany by� ju� dla stra�y. Clagius, cz�owiek za sw�j spryt wielce powa�any wsta� i przem�wi�: 'Gardz� g�upcami, co s�dz�, �e stra� kiedykolwiek o tak zdobytej cennej wiedzy zapomni. Gardz� te� g�upcami, co karki swoje i swych braci chc� nadstawia�, byle tylko garstce zdradzieckich gnid zaszkodzi�. G�upim jest ten co owce swe przeznaczone na we�n� w wybuchu z�o�ci zabija. Mamy wi�c ksi�gi o znakach, kt�re po�ytku nam ju� nie przynios�. Uczy�my wi�c kolejne takie ksi�gi i u�ywaj�c po�rednik�w, sprzedajmy je za wielk� sum� z�ota bogaczom, tak by my�leli, �e nas przechytrzyli!'");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Cz�onkowie Gildii poszli za rad� Clagiusa i tak uczynili. Sprzedali wtedy 5 ksi�g bogatym kupcom, kt�rzy wiele z�ota za nie zap�acili. Sprzedali�my 3 w�adzom miasta, kt�re wys�a�y jedn� trefn� ksi�g� na Juran, a drug� a� do Vengardu, co by wspom�c ich stra�e w walce z tamtejszymi gildiami z�odziei. Dopiero z czasem ci g�upcy mieli pozna� prawdziw� warto�� tego, za co zap�acili ci�kim z�otem. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Raduj si� przeto duchu Samela, je�li� po�r�d nas, czy w piek�ach je�eli istniej�. Oto nawet gdy szyfry Twe wpad�y w r�ce nieprzyjaci�, to dzi�ki z�odziejskiemu sprytowi okpili�my kupc�w i stra�e, a strat� niema�� obr�cili�my w zysk jeszcze wi�kszy. Na chwa�� dumnej Gildii Z�odziei Khorinis. ");
};


/////////////////////////////////////////////////////////////////////
// ARAXOS
// OB�Z BANDYT�W - SKRZYNIA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Araxos (C_ITEM) //d
{
	name 					=	"Araxos - Kr�lowa M�rz";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	60;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Betto Malintus";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_Araxos;
};

FUNC VOID Use_Book_Araxos()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Araxos - Kr�lowa M�rz");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Wielka Gildia Handlowa Araxos jest najwi�ksz� i najbogatsz� ze wszystkich organizacji kupieckich znanego nam �wiata. Nasza pot�na flota przemierza morza i oceany, prowadz�c o�ywion� wymian� handlow� wykraczaj�c� daleko poza granic� Kr�lestwa Myrtany.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Araxos,	LOG_NOTE);
	B_LogEntry		(BookLog_Araxos,	"Araxos - Kr�lowa M�rz");
	B_LogEntry		(BookLog_Araxos,	"Wielka Gildia Handlowa Araxos jest najwi�ksz� i najbogatsz� ze wszystkich organizacji kupieckich znanego nam �wiata. Nasza pot�na flota przemierza morza i oceany, prowadz�c o�ywion� wymian� handlow� wykraczaj�c� daleko poza granic� Kr�lestwa Myrtany. Jeszcze w czasach samodzielnych kr�lestw, rozpocz�li�my kolonizacj� wielu wysp po�o�onych na wschodzie, a prawa do nich zosta�y potwierdzone uroczystym przywilejem danym nam od Kr�la Myrtany. Rozpoczynaj�c sw� drog� jako vengardzkie towarzystwo kupieckie, zdo�ali�my si� sta� pot�n� gildi� handlow� posiadaj�c� liczne wyspy, kopalnie, przywileje i monopole, tak na w�asno��, jak r�wnie� w dzier�awie. ");
	
	B_LogEntry		(BookLog_Araxos,	"Nic wi�c dziwnego, �e nasze bogactwo budzi zazdro�� wielu ludzi i przyczynia si� do rozpowszechniania o nas z�o�liwych plotek. Wbrew temu co twierdz� leniwi i g�upi, powodzenie w interesach mo�na osi�gn�� bez odwo�ywania si� do mocy Beliara, czy si�gania po czarn� magi�. Przewodnik ten postanowi�em napisa� w�a�nie dla ludzi, kt�rzy chcieliby nas zrozumie�, lub si� do nas przy��czy�.  ");
	
	B_LogEntry		(BookLog_Araxos,	"Gildia Araxos jest najbogatsz� i najwi�ksz� z organizacji kupieckich. Dla uszanowania naszych pocz�tk�w, siedzib� w�adz gildii uczynili�my sto�eczny Vengard, gdzie od wiek�w rezyduje Rada Dwunastu z�o�ona z najwi�kszych kupc�w naszej kompanii handlowej. Jednak nie zamykamy si� jedynie w obr�bie tradycji. W dniach, w kt�rych Innos uczyni� swymi wybra�cami dynasti� nordmarsk�, uznali�my w Kr�lach Myrtany swych opiekun�w i jako Wielka Gildia Araxos weszli�my w now� epok� naszych dziej�w. ");
	
	B_LogEntry		(BookLog_Araxos,	"Wieki naszego istnienia wiele nas nauczy�y. Kupiec jest stworzony do obrotu pieni�dzem i to trzos pe�ny z�ota, a nie miecz winien by� jego broni�. Kiedy nie da si� unikn�� konfrontacji, najlepiej sypn�� najemnikom z�otem i da� im walczy� z naszym nieprzyjacielem. Nawet jednak wtedy to w�a�nie z�oto jest naszym prawdziwym or�em. ");
	
	B_LogEntry		(BookLog_Araxos,	"Niejednokrotnie wrogowie przewy�szali nas na polach bitew, zwyci�aj�c �elazem i liczebno�ci�. Jednak, gdy wojny dobiega�y ko�ca, okazywa�o si�, nasi wrogowie s� zad�u�eni u naszych kupc�w i przez to zdani na nasz� �ask�. Tak oto szlachetne i pi�kne z�oto wygrywa�o nad brutalnym i barbarzy�skim �elazem. ");
	
	B_LogEntry		(BookLog_Araxos,	"Nasz� matk� jest morze, a ojcem s�odki Vengard. Jeste�my dzie�mi w�d, a naszym domem s� statki. G�rujemy przeto nad handlarzami z gelderyjskiej gildii Mentes, kt�ra nie zna morza, jeno zat�ch�e i ciemne korytarze ich krecich kopal�. Kt�ra� z gildii dor�wna naszej flocie, kt�ra nie tylko nam transportem, ale i broni�? Ona nam drewnianym murem! ");
	
	B_LogEntry		(BookLog_Araxos,	"Go� za fortun� i chwytaj j�, je�li widzisz ku temu okazj�. Nie pozw�l jednak by perspektywa zysku ci� za�lepia�a i odbiera�a trze�wy os�d, gdy� z tego jeno strata, a nie zysk wynikn�� mo�e. Zwa� na sw� reputacj� i miej j� w swej pieczy, gdy� posiada ona wielk� warto�� w handlu. Warto�� o wiele wi�ksz� ni� jest w stanie to poj��, ta rzesza prostak�w aspiruj�cych do miana kupc�w. W ka�dej transakcji warto�� jak� stanowi reputacja powinna by� brana pod uwag� w nie mniejszym stopniu ni� korzy�ci materialne. Oszustwa, czy kradzie�e nie m�wi�c ju� o mordach, maj� to do siebie, �e opr�cz konsekwencji prawnych, �le wp�ywaj� na interesy. Je�eli kogo� oszukasz, albo okradniesz, to czy taki kto� b�dzie chcia� zawiera� jeszcze kiedy� z tob� transakcje?");
	
	B_LogEntry		(BookLog_Araxos,	"Martwy wr�g to te� niekoniecznie dobry wr�g, gdy� nawet nieprzyjaciel mo�e w przysz�o�ci sta� si� twoim partnerem handlowym.");
	
	B_LogEntry		(BookLog_Araxos,	"Kupiec z Wielkiej Gildii Araxos powinien mie� dobry refleks i wyczucie. Kto nie potrafi dotrzyma� kroku duchowi czas�w i interes�w, ten ju� na wst�pie przegrywa. �wiczy� si� w retoryce i m�wi� przekonuj�co, handlowa� z najlepszymi i osi�ga� zysk - oto cele jakie powinien wyznacza� sobie ka�dy, kto nosi pier�cie� gildii. ");
	
	B_LogEntry		(BookLog_Araxos,	"Je�eli pragniesz do nas do��czy�, udaj si� do najbli�szego Domu Gildii i poddaj si� pr�bie. Udowodnij, �e posiadasz odpowiednie umiejetno�ci, a zasilisz szeregi Wielkiej Gildii Araxos. Wyka� si� zapa�em i inicjatyw�, a zapewnisz sobie awans w hierarchii naszej kompanii kupieckiej. Ku chwale Kr�lowej M�rz, niezwyci�onej i wiecznej, Wielkiej Gildii Handlowej Araxos.");
};

/////////////////////////////////////////////////////////////////////
// PRZYPOWIE�� O DW�CH ASCETACH
// W �WI�TYNI Y'BERIONA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Ascetic (C_ITEM) //d
{
	name 					=	"Przypowie�� o dw�ch ascetach";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	90;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Betto Malintus";
	TEXT[3] 				=	"";
	TEXT[5]					= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Book_Ascetic;
};

FUNC VOID Use_Book_Ascetic()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  2);

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 0);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 0);


	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);
	Doc_SetFont 	( nDocID,  0, "font_15_book.tga");
	Doc_PrintLines	( nDocID,  0, "Przypowie�� o dw�ch ascetach");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Historyjka ta podobnie jak wiele innych przez wiele wiek�w kr��y�a w formie podania opowiadanego przy ogniskach. Dw�ch ascet�w, kt�rzy s� g��wnymi bohaterami tej opowie�ci s� typem postaci do�� cz�sto wyst�puj�cych w varanckich legendach. Geneza tych legend si�ga czas�w, gdy z morza po zag�adzie Pradawnych wy�oni� si� l�d, kt�ry sta� si� domem zesz�ych z g�r koczownik�w.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Ascetic,	LOG_NOTE);
	B_LogEntry		(BookLog_Ascetic,	"Przypowie�� o dw�ch ascetach");
	B_LogEntry		(BookLog_Ascetic,	"Historyjka ta podobnie jak wiele innych przez wiele wiek�w kr��y�a w formie podania opowiadanego przy ogniskach. Dw�ch ascet�w, kt�rzy s� g��wnymi bohaterami tej opowie�ci s� typem postaci do�� cz�sto wyst�puj�cych w varanckich legendach. Geneza tych legend si�ga czas�w, gdy z morza po zag�adzie Pradawnych wy�oni� si� l�d, kt�ry sta� si� domem zesz�ych z g�r koczownik�w. Nowi mieszka�cy Varantu, cho� wyznawali Adanosa, to podj�li si� przemierzania szlaku, kt�rym przed wiekami przemierza� wybraniec Innosa zwany Wiecznym W�drowcem. Czynili to dla przeb�agania bog�w, by ju� nigdy nie zsy�ali potopu na ziemie, kt�re teraz sta�y si� ich domem. Z czasem jednak coraz wi�cej Koczownik�w, kt�rzy potem przyj�li nazw� Varantczyk�w, decydowa�a sie na osiad�y tryb �ycia. Tak oto powsta�y miasta. R�wnocze�nie wielu bardzo religijnych mieszka�c�w po�udnia zacz�o szuka� nowych, bardziej indywidualnych form rozwijania swego �ycia duchowego. Zacz�� si� wi�c rozwija� adanosycki ruch pustelniczy. Niekt�rzy spo�r�d koczownik�w decydowali si� w ramach tego nurtu na samotne �ycie w ascezie, pozbawione uciech i skoncentrowane na Adanosie. Jednymi z takich �wi�tych szale�c�w byli w�a�nie bohaterowie tej opowiastki. ");
	
	B_LogEntry		(BookLog_Ascetic,	"W tym do�� niesprecyzowanym czasie, dwaj �wi�tobliwi m�owie Adanosa przemierzali pustynn� drog�. Tradycja nada�a pierwszemu z nich imi� Sekhtem i kaza�a w nim upatrywa� syna jednego z naczelnik�w koczowniczych w�adc�w, kt�ry sprzeciwiwszy si� swemu ojcu skalanemu zbrodni� zab�jstwa brata, wyrzek� si� splendoru �ycia ksi���t i uda� si� na pustyni� pokutowa� za grzechy rodzica. Pono� miastem, kt�re m�ody Sekhtem opu�ci� mia�o by� Mora Sul, co z jednej strony wi��e s�awnego bohatera poda� z owym miastem, a z drugiej nie przysparza dobrej s�awy gin�cym w mrokach dziej�w pocz�tkom tego miasta. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Jego towarzysz, imieniem Zummur, mia� by� za to rabusiem morskim, kt�ry w czasie jednej z potyczek z inn� szajk� zosta� ci�ko ranny i niemal na �o�u �mierci prosz�c Adanosa o uratowanie mu �ycia, obieca� b�stwu, �e gdyby dost�pi� tej �aski to porzuci bandyterk� i zostanie pustelnikiem. Pan Wody by� dla niego �askawy, bo gdy Zummur odzyska� zdrowie i zapomnia� o przysiedze, Adanos nie powzi�� zemsty, lecz postawi� na jego drodze Sekhtema, kt�ry przypomnia� mu o obietnicy z�o�onej b�stwu. Od tej pory by�y wata�ka, w towarzystwie Sekhtema przemierza� pustyni�, strzeg�c raz danego Adanosowi s�owa. Obaj pogr��eni w rozmy�laniach o naturze Pana Wody, niekiedy te� si�gali po sznury przypi�te do ich pas�w, by zarzuciwszy je sobie na plecy, oddawa� si� praktyce samobiczowania. By�a to forma pokuty i dobrowolnego umartwiania swego cia�a, celem upokorzenia swej cielesno�ci i zwi�zanych z ni� s�abo�ci. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Przemierzaj�c Varant nie zwa�ali ani na dzienn� spiekot�, ani na nocne ch�ody. Owego dnia szli drog� w czasie deszczu, kt�rego krople bole�nie smaga�y ich twarze. Id�c tak, napotkali urodziw� niewiast�, kt�ra schroni�a si� pod drzewem. Owo dziewcz� zawo�a�o pustelnik�w i poprosi�o, �eby przenie�li j� przez rw�cy strumyk. �wi�tobliwi m�owie spojrzeli na siebie, odbywaj�c niem� narad�. W ko�cu Sekhtem zdecydowa� si� po�pieszy� nieiwi�cie. Zummur sta� jednak milcz�co daj�c do zrozumienia, �e nie aprobuje post�powania towarzysza. Z wyrzutem tylko spogl�da� na Sekhtema, kt�ry w tym czasie podni�s� dziewczyn� i ze spokojem przeni�s� j� przez strumyk. Ten za� postawiwszy j� na ziemi wr�ci� si� do Zummura. Surowe oblicze czekaj�cego pod drzewem by�ego wata�ki zdradza�o, jego wyra�ne niezadowolenie. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Bez s�owa wyruszyli obaj w dalsz� drog�. Poniewa� pustelnicy w�druj�cy po Varancie zwykli si� doskonali� w cnocie ciszy i cierpliwo�ci, Zummur zabra� g�os dopiero dwunstego dnia po spotkaniu niewiasty nad rw�cym strumieniem: 'Porzucili�my nasze miasta, zostawili�my nasze domy, nasze trzody i nasze rodziny, nasze wygody i pragnienia. Wyrzekli�my si� te� szcz�cia domowego ogniska i poprzysi�gli�my zapomnie� o niewiastach. Oddali�my si� Adanosowi i jedynie do niego nale�ymy. Czemu wi�c przenios�e� ow� niewiast� przez strumie�. Czy�by� nie zwa�a� ju� na �luby z�o�one naszemu bogu?'");
	
	B_LogEntry		(BookLog_Ascetic,	"Na to towarzysz mu odpowiedzia�: 'Wiele lat temu z�o�y�em Adanosowi �luby, �e zapomn� o niewiastach i przysi�g� moj� wype�ni�em. Czemu wi�c tobie, drogi przyjacielu si� to nie uda�o?'");
};


/////////////////////////////////////////////////////////////////////

// KL�SKA I ZWYCI�STWO. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall1 (C_ITEM)

{

name ="Kl�ska i zwyci�stwo";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Sevold z Klasztoru Innosa w Nordmarze";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Andarall1;

};

FUNC VOID Use_Book_Andarall1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kl�ska i Zwyci�stwo");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje Kr�lestwa Gothy za kr�la Andaralla Apostaty, kt�ry wypowiedzia� wojn� bogom i zakaza� magii. Ksi�ga pochodz�ca z kr�g�w innosyckich i propaguj�ca kap�a�sk� wersj� tych wydarze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall1,LOG_NOTE);

B_LogEntry(BookLog_Andarall1,"Kl�ska i zwyci�stwo. Tom I");

B_LogEntry(BookLog_Andarall1,"Min�y dwa wieki odk�d Troghdan Wielki przyj�� wiar� innosyck�, daj�c tym samym pocz�tek Kr�lestwu Gothy. Potomkowie wielkiego w�adcy, kontynuowali jego dzie�o, poszerzaj�c granice pa�stwa i pomna�aj�c chwa�� zwyci�skiej korony. Ich to m�dro�ci i odwadze Kr�lestwo Gothy zawdzi�cza�o sw� pot�g�.�Po �mierci Mergi III, w�adz� obj�� synowiec zmar�ego kr�la � m�ody ksi��� Andarall. Wst�puj�cy na tron w�adca, od najm�odszych lat przejawia� ogromn� pasj� do nauki. Jako ch�opiec zaczytywa� si� w traktatach z dziedziny techniki i wszelkiej wynalazczo�ci, wykazuj�c jednak przy tym niech�� do magii.");

B_LogEntry(BookLog_Andarall1,"Wprawia�o to jego preceptor�w w niema�e zak�opotanie, gdy� to kap�ani Innosa, jako najbardziej wykszta�ceni ludzie, odpowiadali wtedy za nauczanie dzieci mo�nych. Dzie�o kszta�cenia ma�ego Andaralla nie nale�a�o do prostych, gdy� ch�opiec z oporami i niech�ci� uczy� si� o bogach. Pr�dko te� znienawidzi� mag�w.�Gdy Andarall nieco podr�s�, cz�sto wymyka� si� z pa�acu, by odwiedza� miejskie ku�nie, stocznie, czy zwyk�e warsztaty rzemie�lnicze. Tam ca�ymi dniami przypatrywa� si� pracy robotnik�w i majstr�w. Szczeg�lnie ciekawi�y go wszelkiego rodzaju maszyny i spos�b, w jaki one dzia�aj�. Oczywi�cie ani rodzice Andaralla, ani kr�l Meriga nie pochwalali technicznych zainteresowa� m�odzie�ca. Jeszcze wi�kszy sprzeciw budzi�y w nich jego przechadzki, gdy� obawiano si� o bezpiecze�stwo nast�pcy tronu. Trudno jednak by�o kontrolowa� m�odego Andaralla.");

B_LogEntry(BookLog_Andarall1,"M�ody w�adca mia� w przysz�o�ci okaza� si� najzacieklejszym spo�r�d wszystkich blu�nierc�w, jakich zrodzi�a�ziemia gocka. Jako kr�l, wydaj�c wojn� bogom i wierze, okry� on ha�b� swe imi� i splami� honor w�asnego rodu. Mia� te� zyska� przydomek Apostaty, tak, �e ju� za �ycia nazywano go Andarallem Apostat�. Przed nim nie by�o r�wnie wielkiego wroga Innosa, ani te� nie b�dzie wi�kszego. Pocz�tek zdawa� si� nie zapowiada� jeszcze rzeczy ostatecznych. M�ody kr�l zgodnie z tradycj� wzi�� udzia� w uroczystym poch�wku swego stryja i razem z kap�anami odprowadzi� doczesne szcz�tki Merigi w miejsce wiecznego�spoczynku.");

B_LogEntry(BookLog_Andarall1,"Po obj�ciu w�adzy Andarall zdecydowa� si� jednak odsun�� Mag�w Ognia od tronu kr�lewskiego, cho� jego wielcy poprzednicy zwykli byli polega� na�m�dro�ci i radzie kap�an�w. W ich miejsce, m�ody w�adca otoczy� si� rozmaitymi szarlatanami, kt�rzy w swej bezbo�no�ci odrzucali istnienie i moc bog�w. Zamiast kultu Innosa � kult cyfr i liczb, zamiast miecza podniesionego w obronie wiary � cyrkiel i w�gielnica. Dawne prawa, dane ludziom od bog�w, zosta�y zast�pione prawami wymy�lanymi przez majstr�w i cie�l�w. Monarcha i jego nowi doradcy dopuszczali si� ba�wochwalstwa, oddaj�c nauce cze�� nale�n� bogom.");

B_LogEntry(BookLog_Andarall1,"G�upio jednak czyni� Andarall i otaczaj�cy go blu�niercy, gdy� niedoskona�a jest my�l cz�owiecza i nijak jej r�wna� si� z m�dro�ci� bog�w.");



B_LogEntry(BookLog_Andarall1,"KONIEC TOMU PIERWSZEGO");
};

/////////////////////////////////////////////////////////////////////

// KL�SKA I ZWYCI�STWO. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall2 (C_ITEM)

{

name ="Kl�ska i zwyci�stwo. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Sevold z Klasztoru Innosa w Nordmarze";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Andarall2;

};

FUNC VOID Use_Book_Andarall2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);


Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kl�ska i zwyci�stwo. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje Kr�lestwa Gothy za kr�la Andaralla Apostaty, kt�ry wypowiedzia� wojn� bogom i zakaza� magii. Ksi�ga pochodz�ca z kr�g�w innosyckich i propaguj�ca kap�a�sk� wersj� tych wydarze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall2,LOG_NOTE);

B_LogEntry(BookLog_Andarall2,"Kl�ska i zwyci�stwo. Tom II");

B_LogEntry(BookLog_Andarall2,"");

B_LogEntry(BookLog_Andarall2,"Kr�l Andarall utwierdziwszy si� na tronie, powzi�� niezwykle zuchwa�y zamys�. Wrogi bogom monarcha postanowi� przekona� lud do porzucenia bog�w i zast�pienia ich kultem nauki. Za swego g��wnego wroga Andarall uzna� Ko�ci� Innosa. Kryj�c zrazu swoje zamiary powoli z grona wy�szych urz�dnik�w kaza� usuwa� Mag�w Ognia i ludzi wiernych Innosowi. Zacz�to te� g�osi�, �e magia jest rzecz� niebezpieczn�. Z rozkazu Andaralla w tajemnicy zniszczono znajduj�ce si� w archiwach zamkowych ksi�gi o bogach i magii. Sp�on�y wtedy liczne staro�ytne traktaty varanckie, kt�re przodkowie Andaralla�zgromadzili po zag�adzie Imperium Pradawnych. Przekl�ty w�adca nie oszcz�dzi� nawet tych ksi�g, kt�re przyby�y na p�noc wraz z pierwsz� misj� innosyck�, sprowadzon� jeszcze przez za�o�yciela Kr�lestwa Goth�w i Jelkal�w.�");

B_LogEntry(BookLog_Andarall2,"Z biegiem lat Apostata zrzuca� ju� resztki pozor�w i coraz jawniej prowadzi� walk� z kultem Innosa. Niebawem pyszny w�adca mia� wyda� dla ca�ego kr�lestwa dekret, w kt�rym pod gro�b� kary �mierci zakazywa� u�ywania magii. Poleci� te� swym �o�dakom przeszuka� kraj i znale�� wszystkie magiczne ksi�gi.");

B_LogEntry(BookLog_Andarall2,"Cho� Magowie Ognia starali si� uchroni� w murach �wi�tynnych tyle pism ile to by�o mo�liwe, to siepacze Andaralla nie mieli czci dla innosowego przybytku i niejednokrotnie nawiedzali r�wnie� ko�cio�y i klasztory w poszukiwaniu ksi�g. Na szcz�cie nie odwa�yli si� jeszcze oblega� wi�kszych, otoczonych murem opactw.�");

B_LogEntry(BookLog_Andarall2,"Wnet na ziemiach Kr�lestwa Goth�w i Jelkal�w zap�on�y stosy, kt�re poch�on�y setki traktat�w z dziedziny teologii i run.�Apostata nie poprzesta� jednak na tym i wkr�tce rozpocz�y si� brutalne prze�ladowanie Ko�cio�a i wyznawc�w Innosa. Na mocy nowych praw ludzie nie mogli nawet gromadzi� si� na uroczysto�ciach religijnych. W walce z kultem Innosa, Andarall got�w by� jednak tolerowa� poga�skie praktyki, jakie dot�d szerzy�y si� po�r�d ciemnego ludu Jelkali i Gothy. Wszystko po to by sprowadzi� zgub� na Ko�ci� Innosa.");

B_LogEntry(BookLog_Andarall2,"Ludzi wiernych bogom, kt�rzy nie chcieli wyrzec si� swej wiary bezwzgl�dnie mordowano. Ofiar� okrutnych prze�ladowa� padali zar�wno Magowie Ognia, jak i zwykli poddani Kr�lestwa. Z rozkazu Andaralla wybijano ca�e wsie, kt�rych mieszka�cy pozostawali wierni bogom. Najwi�ksza jednak rze� mia�a miejsce w wiosce Brennus, kt�rej mieszka�cy odm�wili wydania przebywaj�cego we wsi Maga Ognia, Aretino. Oddzia�y wierne Andarallowi nie oszcz�dzi�y nawet zwierz�t, zr�wnuj�c ca�� osady z ziemi�.");

B_LogEntry(BookLog_Andarall2,"Prze�ladowania trwa�y ju� czterna�cie lat. W tym czasie poch�on�y �ycie ogromnej rzeszy niewinnych ludzi. W imi� idei Andaralla i jego ba�wochwalstwa przelano morze krwi, a niezliczona liczba wsi zosta�a zr�wnana z ziemi�. Wtedy to, w czternastym roku panowania Apostaty sta�o si� co� dziwnego. Oto na ziemiach Kr�lestwa Gothy i Jelkali pojawi�a si� skrzydlata bestia � ogromne, krwio�ercze monstrum przyby�e z otch�ani. Stw�r nawiedziwszy umartwiony kraj, zacz�a pustoszy� rozleg�e ziemie Kr�lestwa, siej�c strach i zniszczenie gdziekolwiek si� nie pojawi�a. Dla Gothy nasta�y najmroczniejsze dni w jej d�ugich dziejach...");

B_LogEntry(BookLog_Andarall2,"KONIEC TOMU DRUGIEGO");

};

/////////////////////////////////////////////////////////////////////

// KL�SKA I ZWYCI�STWO. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////




INSTANCE ItWr_Andarall3 (C_ITEM)

{

name ="Kl�ska i zwyci�stwo. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Sevold z Klasztoru Innosa w Nordmarze";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Andarall3;

};

FUNC VOID Use_Book_Andarall3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kl�ska i zwyciestwo. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje Kr�lestwa Gothy za kr�la Andaralla Apostaty, kt�ry wypowiedzia� wojn� bogom i zakaza� magii. Ksi�ga pochodz�ca z kr�g�w innosyckich i propaguj�ca kap�a�sk� wersj� tych wydarze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall3,LOG_NOTE);

B_LogEntry(BookLog_Andarall3,"Kl�ska i zwyci�stwo. Tom III");

B_LogEntry(BookLog_Andarall3,"Skrzydlata bestia nawiedziwszy Kr�lestwo Goth�w i Jelkal�w, zasta�a kraj w najmroczniejszej godzinie jego dziej�w. Od lat ju� na jego tronie Gothy zasiada� Andarall Apostata, kt�ry to wypowiedzia� wojn� bogom i d��y� do zast�pienia ich kultem nauki. Z�owieszcze plany kr�la da�y pocz�tek straszliwym prze�ladowaniom, kt�re poch�on�y tysi�ce istnie� ludzkich, nie m�wi�c ju� o dziesi�tkach zburzonych osad i niezliczonej liczbie ksi�g spalonych z rozkazu kr�la. Monstrum tylko dope�ni�o obrazu grozy zniszczenia.");

B_LogEntry(BookLog_Andarall3,"Z pocz�tku przekl�ty w�adca liczy� na to, �e za spraw� spustosze� dokonywanych przez monstrum, tym �atwiej b�dzie mo�na wcieli� w zniszczonym kraju kr�lewskie wizje w �ycie. Win� za sprowadzenie bestii pr�bowa� obci��a� nawet magi� i Mag�w Ognia, szydz�c z nich jednocze�nie, �e nie potrafili zapanowa� nad przywo�anym przez nich samych monstrum.");

B_LogEntry(BookLog_Andarall3,"Gdy jednak spostrzeg�, �e bestia stanowi zagro�enie dla jego panowania, zebra� pot�n� armi� i wyruszy� przeciwko potworowi. Na wezwanie Andaralla odpowiedzieli liczni baronowie i rycerze a nawet ch�opi i mieszczanie. Nie uczynili tego jednak z mi�o�ci do okrutnego w�adcy, lecz dla ratowania swego kraju. Na czele tych si� ruszy� na spotkanie z pot�nym monstrum. Skrzydlaty potw�r na swoje le�e wybra� bory nieopodal wioski Haderus. Wyda� tam bestii bitw�i w krwawym boju straci� trzeci� cz�� swej licznej armii. By� to dzie�, w kt�rym krew Goth�w i Jelkal�w zamieni�a pola haderusowe w szkar�atne grz�zawisko tak, �e przez nast�pne dziesi�tki lat �adna innosycka dusza nie odwa�y�a si� ju� pi� wody z okolicznych jezior i staw�w. Zaprzestano te� �owienia w ryb w pobliskich wodach.");

B_LogEntry(BookLog_Andarall3,"Pycha Apostaty by�a nieprzebrana i mimo b�aga� swych rycerzy, nie godzi� si� on zarz�dzi� odwrotu. Trwa�a wi�c rze�, �ywi�ca ��dne triumfu serce przeniewiercy. �o�nierze spostrzeg�szy wreszcie, �e Andarall w swym szale�stwie wydaje ich na zgub�, zacz�li t�umnie uchodzi� z pola bitwy. Buta Apostaty by�a jednak niezmierzona i czyni�a �lepym umys� kr�la. Kolejni lordowie na r�wni z nimi widz�c ob��d w�adcy, dawali, swoim oddzia�om sygna� do odwrotu. By� to koniec bitwy.");

B_LogEntry(BookLog_Andarall3,"Andarall na widok wycofuj�cych si� poddanych, zrozumia� �e nawet trwaj�cy dot�d przy nim towarzysze�si� od niego odwr�cili. Ujrza� w tamtej godzinie ca�y ogrom swej kl�ski. Osamotniony dosiad� wi�c swego rumaka i dobywszy ostrza, z blu�nierczym okrzykiem na ustach ruszy� w strace�czym ge�cie ku demonowi.");

B_LogEntry(BookLog_Andarall3,"Gdy tylko Andarall zbli�y� si� do bestii, ta zrzuci�a go z wierzchowca. Potw�r nast�piwszy na sponiewierane cia�o przekl�tego w�adcy, do reszty je zmia�d�y� i uczyni� sobie uczt� z jego truch�a. Tak oto dokona� si� �ywot nieprzejednanego wroga bog�w, kt�ry w swej bucie odwa�y� si� wypowiedzie� im wojn�.");

B_LogEntry(BookLog_Andarall3,"Dwa lata jeszcze demon pustoszy� ziemie Kr�lestwa Gothy, zr�wnuj�c wioski z ziemi�, morduj�c niewinnych ludzi, niszcz�c zasiewy, a nawet zagra�aj�c znacznym�miastom. Pa�stwo stworzone przez Troghdana, a budowane przez jego nast�pc�w pogr��y�o si� w chaosie i stan�o na kraw�dzi rozpadu.");

B_LogEntry(BookLog_Andarall3,"Od zn�kanego Kr�lestwa oderwali si� Jelkalowie z zachodu, kt�rych najwi�kszym grodem by� Vengard. Odpad�a te��Veluca nazwana p�niej Monter�. Nasta� g��d, a wraz z nim pojawi�y si� choroby i zarazy, kt�re nawiedzi�y ca�y kraj. W tych dniach kl�ski nie obsiewano p�l i jedynie �mier� zbiera�a obfite �niwo�");

B_LogEntry(BookLog_Andarall3,"Tak oto poddani Kr�lestwa Gothy p�acili za blu�nierstwa swego w�adcy. W obliczu nieszcz�cia ludzie pocz�li zwraca� si� ku bogom, t�sknie wyczekuj�c stamt�d nie tylko ocalenia, ale r�wnie� pocieszenia. Na nowo w �wi�tyniach rozleg�a si� �wi�te pie�ni i modlitwy, tym �arliwsze, �e przez wiele lat zakazane.");

B_LogEntry(BookLog_Andarall3,"Do przydro�nych kapliczek powr�ci� blask �wiec, rozja�niaj�c mroki, sprowadzone na kraj przez butnego Apostat�. Cho� lud Gothy wci�� wiele cierpia�, to na ziemiach Kr�lestwa dokonywa�o si� wielkie oczyszczenie, kt�re mia�o przygotowa� lud na maj�c� niebawem nadej�� godzin� wyzwolenia. Kraj podnosi� si� z ruiny.");

B_LogEntry(BookLog_Andarall3,"Mieszka�cy nie zapomnieli r�wnie� o owych szarlatanach, kt�rymi znienawidzony kr�l zwyk� si� otacza� za �ycia. Oto pobo�ny lud p�on�� �wi�tym gniewem i ruszy� przeciwko blu�niercom, kt�rzy za�lepieni pych�,��mieli wypowiedzie� wojn� nie tylko bogom, ale i ludziom. Dla tych nasta� dzie� straszliwego s�du. 
");

B_LogEntry(BookLog_Andarall3,"Wywleczono z domu astronoma Ebrandta, kt�ry niecny prym wi�d� by� w�r�d doradc�w Andaralla. Ten doczeka� si� kary potwornej, gdy� zosta� przez ludzi rozszarpany. By�a to jednak kara sprawiedliwa. Podobny te� los spotka�, matematyk�w Alherodiona i Mergarda, a tak�e alchemika Sergulliona i innych szarlatan�w.");

B_LogEntry(BookLog_Andarall3,"Jeszcze wiele tygodni rozcz�onkowane kawa�ki cia� tych blu�nierc�w wala�y si� po ulicach miast Gothy. Dopiero  Magowie Ognia zdo�ali nak�oni� rozw�cieczony lud, by te zosta�y zebrane i pochowane wed�ug nakaz�w danych od bog�w. Gdy� triumf bog�w, mia� by� r�wnie� triumfem praw danych ludziom od bog�w.");

B_LogEntry(BookLog_Andarall3,"KONIEC TOMU TRZECIEGO");

};
/////////////////////////////////////////////////////////////////////

// KL�SKA I ZWYCI�STWO. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall4 (C_ITEM)

{

name ="Kl�ska i zwyci�stwo. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Sevold z Klasztoru Innosa w Nordmarze";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Andarall4;

};

FUNC VOID Use_Book_Andarall4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kl�ska i zwyci�stwo. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje Kr�lestwa Gothy za kr�la Andaralla Apostaty, kt�ry wypowiedzia� wojn� bogom i zakaza� magii. Ksi�ga pochodz�ca z kr�g�w innosyckich i propaguj�ca kap�a�sk� wersj� tych wydarze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall4,LOG_NOTE);

B_LogEntry(BookLog_Andarall4,"Kl�ska i zwyci�stwo. Tom IV");

B_LogEntry(BookLog_Andarall4,"Od czas�w prze�ladowa� ze strony Andaralla, kr�g Mag�w Ognia dozna� wielu krzywd. Ogromna rzesza�kap�an�w zosta�a zamordowana, wielu te� wtr�cono do loch�w i wi�ziono na r�wni z lud�mi wyst�pnymi. Bezbo�ny w�adca niczego nie pragn�� tak mocno jak rozbicia i ostatecznego unicestwienia Ko�cio�a Innosa.");

B_LogEntry(BookLog_Andarall4,"Apostata bardzo obawia� si� Mag�w Ognia i widzia� w kulcie Innosa g��wn� przeszkod� na drodze do realizacji swych z�owieszczych plan�w. Na czele Ko�cio�a w Kr�lestwie Gothy sta� w tym czasie s�dziwy arcymag Larund z Vengardu, kt�ry obj�� urz�d patriarszy w trzecim roku panowania przekl�tego w�adcy. By� to m�� ca�ym sercem i umys�em oddany Innosowi, a przy tym wielce uczony i roztropny. Pami�ta� wi�c o tym, �e kult Innosa zosta� sprowadzony na te ziemie przez pierwszego kr�la Gothy. To w�a�nie opiece nast�pc�w Troghdana wyznanie innosyckie zapewnia�o sw�j rozkwit po upadku Imperium Pradawnych.");

B_LogEntry(BookLog_Andarall4,"Arcykap�an Larund pragn�� zachowa� ow� u�wi�con� wiekami tradycj� i d��y� do tego, by utrzyma� pok�j mi�dzy �wi�tyni� i tronem. Wiedzia�, �e obecny kr�l kiedy� przeminie, a Kr�lestwo Gothy rz�dzone przez kolejnych w�adc�w, b�dzie trwa�. Upatrywa� wi�c nadziei w nast�pcach maj�cych przyj�� po Andarallu. Czcigodny, pierwszy arcymag, d��y� wi�c do zgody i stara� si� pow�ci�ga� dzia�ania monarchy, a to dla zachowania Ko�cio�a i Kr�lestwa. Je�eli tkwi w post�powaniu tego �wi�tobliwego kap�ana przewina, to w tym, �e przebieg�y Apostata zdo�a� wykorzysta� t� dobro� ducha by obr�ci� j� na szkod� Gothy i Wiary.");

B_LogEntry(BookLog_Andarall4,"Nie szcz�dzi� jednak wysi�k�w mag Larund, by broni� powierzonony mu lud. Wpierw d���c do pojednania z kr�lem i zawr�cenia w�adcy z drogi odst�pstwa, a ujrzawszy jego prawdziwe intencje, ze wszystkich si� staraj�c mu si� przeszkodzi�. Niebawem z tego powodu by� zmuszony ucieka� ze stolicy, albowiem gdy przyjaciele Larunda dowiedzieli si� o tym, �e blu�nierca zamierza go aresztowa�, zdo�ali nam�wi� s�dziwego kap�ana do ratowania w�asnego �ycia. Od tamtej pory musia� latami uchodzi� przed siepaczami kr�la, kt�ry postawi� sobie za cel pojmanie najwy�szego arcymaga i zwierzchnika Ko�cio�a Innosa w Gocie.");

B_LogEntry(BookLog_Andarall4,"Ukrywaj�c si� po maj�tkach i wsiach, naucza� o bliskim ko�cu Andaralla, kt�ry musi ulec wobec pot�gi bog�w. Tam gdzie tylko pojawi� si� Larund, tam duch, chyl�cy si� ku upadkowi, rych�o powstawa� i got�w by� na nowo walczy� o Innosa. Dobry patriarcha uczyniwszy wiele dobrego odszed� wkr�tce do Pana Ognia.");

B_LogEntry(BookLog_Andarall4,"Wielka to by�a strata dla ludu Gothy i r�wnie wielka rado�� dla niegodziwego w�adcy. Zbyt wczesne by�y jednak triumfy z�ego kr�la, gdy� niebawem i on sam mia� dope�ni� swego przekl�tego �ywota. Niestety po �mierci Larund, wobec prze�ladowa�, kr�g Mag�w Ognia nie zdo�a� si� zebra� i wy�oni� jego nast�pcy.");

B_LogEntry(BookLog_Andarall4,"W czasie tym ukrywaj�cy si� przed lud�mi tyrana m�owie Innosa pozostawali w rozproszeniu. W�adca do�o�y� wszelkich stara�, by kr�g nie m�g� wybra� pierwszego arcymaga i d�ugo jeszcze tron patriarszy pozostawa� nieobsadzony.�W drugim roku bezkr�lewia za spraw� kap�ana Sigunda zosta� jednak zjednoczony.");

B_LogEntry(BookLog_Andarall4,"Przywr�ciwszy po �mierci Andaralla jedno�� Ko�cio�a Innosa, stan���Sigund jak r�wny z r�wnym na przeciwko bestii. Wyda� jej wtedy �miertelny b�j na polach przed sto�ecznym grodem Troghdana. I p�on�� w nim gniew Innosa, kt�ry uczyni� kap�a�skie rami� silnym. Sigund i bestia walczyli trzy dni i trzy noce.");

B_LogEntry(BookLog_Andarall4,"W tym zakl�tym ta�cu si�y �wiat�o�ci mierzy�y si� z groz� piekie�. �wi�ta modlitwa kap�a�ska przeplata�a si� z s�owami prastarych zakl��. W trzecim dniu niezwyk�a si�a wst�pi�a w cia�o Sigunda. Z imieniem Innosa na ustach, skierowa� sw�j kostur w stron� bestii i wbiwszy go w jej bok, zdo�a� ja pokona�. ");

B_LogEntry(BookLog_Andarall4,"Wreszcie rozleg� si� przera�liwy ryk, jakoby trzy wielkie armi� wydoby�y ze swych �o�nierskich gardzieli najdzikszy okrzyk wojenny. Jasno�� niewypowiedziana spowi�a miejsce epickiego boju, ogarniaj�ca nawet wszystkich tych, kt�rzy z mur�w przypatrywali si� walce kap�ana z demonicznym monstrum.");

B_LogEntry(BookLog_Andarall4,"Tak oto dokonywa�a si� wsp�lna ofiara kap�ana, ziemi i ludu, kt�ra mia�a odkupi� blu�niercze panowanie Apostaty. Niebawem ich oczom ukaza�a si� posta� Sigunda, kt�ry opieraj�c si� o kostur sta� samotnie na miejscu zwyci�skiego boju. Kr�lestwo Gothy zosta�o uwolnione spod mocy potwora.");

B_LogEntry(BookLog_Andarall4,"Lud Gothy by� wdzi�czny swemu wybawcy. Pojawi�y si� g�osy nawo�uj�ce do wyniesienia Sigunda na kr�lewski tron i wyra�aj�ce nadziej�, �e jako za�o�yciel dynastii, przywr�ci Gocie dawn� chwa��. Z kolei�Magowie Ognia chcieli by obj�� jako ten kt�ry ich zjednoczy�, obj�� tron patriarszy jako nast�pc� Larunda.");

B_LogEntry(BookLog_Andarall4,"Stan�� wi�c wybawiciel Gothy przed trudnym wyborem. Decyzji nie u�atwia�y namowy samozwa�czych doradc�w, z kt�rych jedni pragn�li widzie� m�nego kap�ana na tronie kr�lewskim, a inni na patriarszym. Roztropny mag postanowi� nie polega� na s�dach ludzkich, b�d�cych dzie�em niedoskona�ego umys�u.");

B_LogEntry(BookLog_Andarall4,"Sigund wiedzia�, �e gdyby m�dro�ci poszukiwa� w my�li cz�owieczej, zb��dzi�by tak samo jak z�ej pami�ci Andarall Apostata. Uda� si� przeto przed o�tarz Innosa by w modlitwie szuka� odpowiedzi na nurtuj�ce go pytania.");

B_LogEntry(BookLog_Andarall4,"KONIEC TOMU CZWARTEGO");

};
/////////////////////////////////////////////////////////////////////

// KL�SKA I ZWYCI�STWO. TOM V

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall5 (C_ITEM)

{

name ="Kl�ska i zwyci�stwo. Tom V";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Sevold z Klasztoru Innosa w Nordmarze";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Andarall5;

};

FUNC VOID Use_Book_Andarall5()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kl�ska i zwyci�stwo. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje Kr�lestwa Gothy za kr�la Andaralla Apostaty, kt�ry wypowiedzia� wojn� bogom i zakaza� magii. Ksi�ga pochodz�ca z kr�g�w innosyckich i propaguj�ca kap�a�sk� wersj� tych wydarze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall5,LOG_NOTE);

B_LogEntry(BookLog_Andarall5,"Kl�ska i zwyci�stwo. Tom V");

B_LogEntry(BookLog_Andarall5,"Sigund udawszy si� do �wi�tyni w Grodzie Troghdana, pogr��y� si� w modlitwie. W jej murach, ca�y dzie� i ca�� noc prosi� Innosa, by ten natchn�� go rad� i pozwoli� mu podj�� w�a�ciw� decyzj�. Gdy po wielu godzinach odnale�li go natr�tni �doradcy�, ten powstawszy, oznajmi� wszystkim, �e dokona� ju� wyboru. Zwyci�ski kap�an, mimo gor�cych pr�b i nalega�, nie zgodzi� si� zosta� kr�lem. Wskaza� jednak prawowitego nast�pc� w osobie Edricka, kt�ry by� synem kr�lewskiego rodu i kuzynem Andaralla. Decyzja Sigunda zdziwi�a jednak wielu zgromadzonych, gdy� nie rozumieli oni m�dro�ci tego wyboru.");

B_LogEntry(BookLog_Andarall5,"Niech�� budzi�a sama dynastia, kt�r� ha�b� okry� odszczepieniec. Tak wiele z�a dla imienia rodu Troghdana wyrz�dzi� Andarall. Przem�wi� wtedy Sigund do ludzi powt�rnie: �O s�aba pami�ci ludzka, �eby� przez jednego przeniewierc� odrzuca�a tyle pokole� m�drych i wiernych kr�l�w, kt�rzy byli wam dobroczy�cami�. Po chwili oznajmi� r�wnie�, �e nie mo�na rozpoczyna� zaprowadzania porz�dku w Kr�lestwie od pogwa�cenia �wi�tych praw danych ludziom od bog�w, gdy� w�a�nie na szarganiu tych �wi�tych praw swe panowanie budowa� odszczepieniec,�Andarall. Powt�rzenie tego b��du sprowadzi�oby na Goth� jedynie wi�cej cierpienia. Jako duchowny, kt�ry zosta� oddany na s�u�b� bogom, Sigund nie chcia� r�wnie� porzuca� Zakonu Mag�w Ognia nawet dla korony, albowiem wi�za�o go kap�a�skie przymierze z Innosem. To tak�e roztropny Mag Ognia powiedzia� zebranym w �wi�tyni, a oni widzieli, �e m�dro�� samego Innosa przez niego przemawia.");

B_LogEntry(BookLog_Andarall5,"Osiem dni po og�oszeniu przez Sigunda decyzji, do stolicy przybyli Magowie Ognia ze wszystkich stron Kr�lestwa Gothy. W�r�d zebranych by� r�wnie� ten, kt�ry zwyci�y� besti�. Zebrani mieli radzi� nad odbudow� Ko�cio�a, kt�ry pogn�biony w czasach Andaralla Apostaty, mia� na nowo sta� si� �ywym cia�em. Na synodzie tym to przywr�cono staro�ytn� sukcesj� patriarch�w Gothy, zapocz�tkowan� jeszcze przez arcykap�ana Dhibuina, kt�ry przyby� tu z Varantu na czele misji innosyckiej sprowadzonej przez Troghdana Wielkiego. G�ow� kr�gu Mag�w Ognia Gothy obrano Sigunda, kt�ry na chwa�� Innosa i wyb�r ten przyj��.");

B_LogEntry(BookLog_Andarall5,"Wykl�to przy tym dor�wnuj�cego pych� Andarallowi, maga Burangarda, kt�ry wykorzystuj�c zam�t po �mierci Larunda, samozwa�czo obwo�a� si� zwierzchnikiem Ko�cio�a Gothy. Zdrajca ten mimo licznych napomnie� nie chcia� si� ukorzy�. Maj�cy niebawem obj�� tron, Edrick wyruszy� wi�c przeciwko niemu na wypraw�, a pokonawszy heretyckiego kap�ana, srodze go ukara�. Przysz�y w�adca w czasie wyprawy dowi�d�, �e nie tylko z krwi i �wi�tego prawa godzien jest tronu, ale i z m�stwa, i z wiary gor�cej.�Niebawem te� Sigund dokona� aktu koronacji Edricka II, wie�cz�c g�ow� prawowitego nast�pcy tronu koron� Troghdana Wielkiego.");

B_LogEntry(BookLog_Andarall5,"Pokonanie bestii i dzia�alno�� Sigunda przyczyni�a si� do odbudowania Ko�cio�a Innosa, kt�ry po latach prze�ladowa� przez Andaralla, na nowo m�g� roztoczy� opiek� nad wiernym ludem Gothy. Wsp�lnie z Edrickiem umacniali kult innosycski i walnie przyczynili si� do nawr�cenia Jelkal�w na prawdziw� wiar�. �");

B_LogEntry(BookLog_Andarall5,"I kiedy nadszed� kres ziemskiej w�dr�wki Sigunda, Innos przyzwa�  patriarch� do siebie. Ziemskie szcz�tki zas�u�onego maga zosta�y pochowane najwy�szymi honorami i splendorem, �egnane t�umnie przez wdzi�czny lud Gothy. Spocz�� on wtedy u obok innych patriarch�w, �pi�cych snem wiecznym.");

B_LogEntry(BookLog_Andarall5,"Tak oto ko�cz� si� dzieje Andaralla Agnostyka i Sigunda Wiernego � dw�ch m��w, co dwie r�ne drogi obrali. Ku przestrodze miej czytelniku los butnego kr�la, co cz�owiekiem jeno b�d�c, w sw�j umys� cz�owieczy i z tej racji niedoskona�y �wi�cie zawierzy�.");

B_LogEntry(BookLog_Andarall5,"Skre�lone pi�rem Sevolda, pokornego mnicha z Klasztoru Innosa w Nordmarze");

B_LogEntry(BookLog_Andarall5,"KONIEC TOMU V, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// ROZWA�ANIA O BOGACH

// SUGEROWANA LOKACJA: OB�Z BANDYT�W, CHATA QUENTINA 

// NAPISANE PRZEZ WYZYSKKA NA PODSTAWIE DIALOGU Z GERRICKIEM (ARCANIA)

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_OurGods (C_ITEM) //d

{

name ="Rozwa�ania o bogach";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Anonim";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_OurGods;

};

FUNC VOID Use_Book_OurGods()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Rozwa�ania o bogach");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Do�� obrazoburcze rozwa�ania o trzech bogach i ich stosunku do cz�owieka. Spisane w formie nader niezobowi�zuj�cej.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_OurGods,LOG_NOTE);

B_LogEntry(BookLog_OurGods,"Rozwa�ania o bogach");

B_LogEntry(BookLog_OurGods,"W dzieci�stwie zapewno uczono ci� czci�, mi�owa� i l�ka� si� boga s�o�ca. Mam racj�? Ogie�, �wiat�o, �ad... uciele�nienie wszystkiego, co dobre na tym �wiecie, zgadza si�? Ot� nie, nie zgadza si�! Innos nie jest przyjacielem ludzko�ci! Gdyby nie jego bracia, dawno zaprowadzi�by na �wiecie ca�kowity �ad! Surowy i bezlitosny! Innos nienawidzi wolno�ci! �e niby zaprowadzenie �adu na �wiecie to dobro? Kr�lowie Myrtany zaprowadzaj� �ad na �wiecie naje�d�aj�c inne kr�lestwa.");

B_LogEntry(BookLog_OurGods,"R�wnie� Beliar nie d��y do mi�o�ci i pokoju. Ale nie d��y do takich potworno�ci jakie przypisuja mu kap�ani Innosa. Beliar bynajmniej nie jest przyjacielem ludzko�ci, co nie oznacza, �e nie jest do pewnego stopnia jej sojusznikiem. To zaprzysi�g�y wr�g ludzi, ale symbolizuje tak�e wolno��, pewno�� siebie, niezale�no�� i ambicj�. O tym Ci w �wi�tyni nie m�wili, prawda? A co do burzy, piorun�w i cienia? Odrobina deszczu jeszcze nikomu nie zaszkodzi�a, a bez ciemno�ci jak niby cz�owiek mia�by zasn��?");

B_LogEntry(BookLog_OurGods,"Adanos to trzeci z braci. To ciekawy przypadek. Innos ma tylko najwi�cej wyznawc�w, lecz to dzi�ki Adanosowi przetrwali�my. Wprawdzie to nie on nas stworzy�, ale z pewno�ci� nie dopu�ci� do tego, by jego bracia zniszczyli nas w trakcie k��tni. Adanos symbolizuje r�wnowag�. �rodek. Wszystko, co ci� otacza - ca�y �wiat - to sfera Adanosa. Tu trzyma swych braci w ryzach. Zdawa�oby si� wi�c, �e to Adanos mia�by by� tym dobrym bogiem. C�, o ile mi wiadomo, sprzyja ludziom. Lecz rzadko si� anga�uje - chyba, �e ma unicestwi� ca�� cywilizacj�. Je�li trzeba przywr�ci� r�wnowag� Adanos potrafi nie�le poszale�, ha, ha. A wi�c - nie.");

B_LogEntry(BookLog_OurGods,"Moim zdaniem nie ma dobrych i z�ych bog�w, jak chcieliby to przedstawia� ich kap�ani, kt�rych interesuje tylko jedna strona medalu. Bogowie to po prostu s� bogowie. S� i tyle.");

B_LogEntry(BookLog_OurGods,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// Praktyki nekromancie. Maritury

// SUGEROWANA LOKACJA: DO KUPIENIA U MAGA OGNIA TORREZA

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Maritura (C_ITEM) //d

{

name ="Praktyki nekromanckie. Maritury";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_05.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Inkwizytor Fiorentino";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Maritura;

};


FUNC VOID Use_Book_Maritura()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Praktyki nekromanckie. Maritury");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Ksi�ga wydana przez Inkwizycj� Mag�w Ognia, traktuj�ca o najczarniejszych praktykach nekromanckich. Tom po�wi�cony mariturom.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Maritura,LOG_NOTE);

B_LogEntry(BookLog_Maritura,"Praktyki nekromanckie. Maritury");

B_LogEntry(BookLog_Maritura,"�Szcz�liwy kto nie zetkn�� si� z opisywanymi tu rzeczami. Zgubiony, kto ich nie poznawszy wcze�niej, nieuzbrojony w wiedz� z nimi si� spotka�� (Inkwizytor Locarno Derbent)");

B_LogEntry(BookLog_Maritura,"Maritura to jeden z najpaskudniejszych wynalazk�w czarnej magii. Wed�ug opis�w zawartych w ksi�gach z tej dziedziny i potwierdzonych przez autorytety inkwizycji Mag�w Ognia, artefakt ten ma form� statuetki zawieraj�cej w sobie dusz� �ywej istoty. Wprawdzie zdarza�y si� pojedyncze przypadki nasycenia pos��ka dusz� zwierz�cia, lecz nie by�y to raczej ofiary docelowe, a zwyk�a wprawa przed wykonaniem maritury prawdziwej. Docelow� ofiar� tej praktyki nekromanckiej mieli by� ludzie i ich dusze.");

B_LogEntry(BookLog_Maritura,"Przekl�ty magus pochwyciwszy nieszcz�nika przyst�puje do makabrycznych przygotowa�, w czasie kt�rych na drodze rytualnych naci�� opisanych w ksi�gach nekromanckich przygotowuje cia�o �ywej ofiary do w�a�ciwego rytua�u. Mimo, �e dla powodzenia rytua�u Czarny Mag musi zadba� aby ofiara nie umar�a w trakcie powstawania maritury, to jednak �adna to pociecha dla zam�czanego. Z przyczyn oczywistych, ksi�ga ta opisywa� ich nie ma zamiaru, by nie rozpowszechnia� zarazy i wiedzy nekromanckiej, a j� zwalcza�.");

B_LogEntry(BookLog_Maritura,"W czasie rytua�u w�a�ciwego wydzierana z cia�a dusza nieszcz�snej istoty zostaje nagi�ta do woli Czarnego Maga, a nast�pnie uwi�ziona w obr�bie mariturycznego pos��ku. Duch uwi�ziony w mariturze staje si� bezwolnym narz�dziem nekromanty. Ofiara zamkni�ta rytua�em w statuetce cierpi potworne katusze nie mog�c, jak nakazuje tego natura, odej�� do wieczno�ci. Duch pozostaje wi�niem maritury przez stulecia, a nawet tysi�ce lat, co jest zale�ne od mocy Czarnego Maga, kt�ry j� stworzy�. Na szcz�cie z biegiem wiek�w si�a tego magicznego wi�zienia s�abnie i dusza zgodnie z prawami natury mo�e odej�� do bog�w. Nim tak si� stanie nieszcz�nik, cho� bezwolny w dzia�aniu i w s�owie, lecz �wiadomy i odczuwaj�cy nieustanne cierpienie, musi czeka� przez ca�e epoki�");

B_LogEntry(BookLog_Maritura,"Ten mroczny artefakt potrafi� stworzy� jedynie pot�ni nekromanci, gdy� z�amanie woli zaklinanego ducha ludzkiego i uczynienie go pos�usznym wymaga niema�ej mocy i wiedzy z dziedziny czarnej magii.�To tylko daje nadziej� na to, �e proceder ten dzi�ki magom inkwizytorom nareszcie zostanie z�amany.");

B_LogEntry(BookLog_Maritura,"Maritury s�u�� g��wnie jako bro�, cho� przez wzgl�d na ich trwa�o�� niejednokrotnie czyniono z nich pos�a�c�w, kt�rzy mieli zachowa� wiadomo�� od Czarnego Maga i zanie�� j�, cho�by w dalek� przysz�o��. Ojcowie inkwizytorzy nie jeden raz od zakl�tych istot s�yszeli inkantacje beliaryckie, z czarnoksi�skich ksi�g, kt�re s�udzy Innosa zniszczyli wiele wiek�w przedtem.");

B_LogEntry(BookLog_Maritura,"Pot�niejsi nekromanci potrafili r�wnie� ustami wi�nia pos��ku wypowiedzie� zakl�cia, kt�rymi nieszcz�sny duch atakowa� tych, kt�rzy otworzyli maritur�. Tak si� sta�o w siedzibie inkwizycji w Dumar, gdzie zakl�ty duch sprowadzi� burz� ognia na gmach �wi�tobliwych tropicieli nekromancji.");

B_LogEntry(BookLog_Maritura,"Zdarza�o si� tak�e, �e za po�rednictwem wi�nia pos��ku, Czarny Mag pr�bowa� op�ta� tego, kto mia� kontakt z owym przedmiotem.�To czyni maritur� niezwykle niebezpieczn� nie tylko dla tego kto nie�wiadomie si� na ni� natknie, ale i dla tych, kt�rzy postanowi� j� zniszczy�.");

B_LogEntry(BookLog_Maritura,"Cho� maritura jest jednym z najplugawszych odst�pstw, artefakt ten pojawia� si� sporadycznie nawet na dworach z dawien czcz�cych Innosa. Sam w�adca Gothy, Meriga II, udaremniwszy spisek swych braci, nakaza� uwi�zi� ich duchy w o�miu marituralnych pos��kach. Chc�c ich przy tym upokorzy�, zmusi� owych zdrajc�w, by w�asnymi ustami przez wieki pot�piali zdrad� jakiej si� dopu�cili, a jednocze�nie wychwalali wielko�� Kr�lestwa Gothy i swego brata - kr�la Merigi II. Zostali oni uwolnieni dopiero za kr�la Edricka II, gdy po obaleniu Andaralla Apostaty arcymag Sigund wyjednawszy u mi�o�ciwego w�adcy �ask� dla zdradzieckich braci Merigi II, zniszczy� owe pos��ki wi���ce nieszcz�nik�w z tym �wiatem. Od tamtej pory �aden z kr�l�w Gothy nie mia� ju� nigdy kara� nawet najgorszego zdrajcy w spos�b tak uw�aczaj�cy prawom danym od bog�w.");

B_LogEntry(BookLog_Maritura,"Niestety zdarza si� te�, �e mag za�lepiony pych� i ambicj�, pragn�c dowie�� swych umiej�tno�ci, tworzy �w straszliwy artefakt. Dop�ki wi�c pr�na wola b�dzie zwodzi� rozumy uczonych, dop�ty inkwizycja b�dzie musia�a tropi� i zwalcza� tych, kt�rzy dopuszczaj� si� owego plugawego blu�nierstwa.");

B_LogEntry(BookLog_Maritura,"KONIEC");
};

/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM I

// SUGEROWANA LOKACJA: OB�Z MY�LIWYCH, NA STOLE ALCHEMICZNYM, ALBO NIEOPODAL; WA�NE BY BY�Y W POBLI�U CLAWA, BO W ZA�O�ENIU TE KSIEGI NALE�� DO NIEGO 

// ALTERNATYWNIE CLAW M�G�BY NAM DA� JE RAZEM Z 250 BRY�KAMI RUDY JAKO NAGROD� ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_DruidsOfMyrtana1 (C_ITEM) //d

{

name ="Druidzi Myrtany. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_05.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Tertulian z Ardei";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_DruidsOfMyrtana1;

};

FUNC VOID Use_Book_DruidsOfMyrtana1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Druidzi Myrtany. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap�anach Myrtany, opisuj�cy druidzki kult i jego histori�]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana1,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany. Tom I");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany to prymitywni magowie natury, b�d�cy kap�anami Adanosa - boga natury i r�wnowagi. Mimo to niewiele maj� wsp�lnego z Magami Wody, gdy� ci zwykli postrzega� druidzkich kap�an�w jako p�poga�skich parweniuszy, nazywaj�c ich przy tym pogardliwie szamanami. Podobnie lekcewa��cy stosunek maj� do nich kap�ani Innosa, jednak ani Magowie Ognia, ani Magowie Wody nie podejmuj� si� prze�ladowania druid�w. Przynajmniej od czasu, gdy owi magowie natury wyrzekli si� poga�skich b�stw i powr�cili do zarzuconego przed wiekami kultu Adanosa.�");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Domem druida jest las, gdzie ukryty przed cywilizacj� mag natury, mo�e w spokoju kontemplowa� przyrod�, opiekowa� si� zwierzyn� le�n� i w prastarym obrz�dzie oddawa� cze�� Panu Natury. Przychodz� do nich r�wnie� ludzie z okolicznych wiosek jako do uzdrowicieli. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Wok� druida, lub grupy druid�w tworzy si� zazwyczaj niewielka wsp�lnota go�c�w le�nych, licz�ca sobie nie wi�cej ni� trzydziestu cz�onk�w. Przypomina ona poniek�d plemiona sprzed wiek�w, kiedy to kult druidzki dominowa� w ca�ej Myrtanie. Jednak zar�wno Go�cy Le�ni, jak i druidzi wok� kt�rych si� skupiaj�, stanowi� ju� jedynie relikt przesz�o�ci, trzymaj�cy si� resztkami si� i nieuchronnie ust�puj�cy z areny dziej�w. Zapewne dlatego inkwizycja Mag�w Ognia toleruje jeszcze ostatki obecno�ci druid�w na tych ziemiach.�");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Pierwotnie Krainy Centralne Kontynentu, a tak�e niewyja�owiony jeszcze przez wody potopu Varant, mia�y powszechnie czci� Adanosa na mod�� druidzk�. Owi prymitywni magowie pe�ni�c funkcje kap�a�skie, cieszyli si� najwi�kszym obok wodz�w pos�uchem w plemionach rz�dz�cych tymi krajami. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Od pocz�tku druidyzm myrta�ski �ci�le by� zwi�zany z kultem przyrody, za� Adanos odbiera� cze�� jako b�stwo �yciodajnej wody i natury. Z biegiem wiek�w ludzie odchodzili jednak od pierwotnej czysto�ci, a wiara ich zacz�a ulega� podobnej degeneracji. Coraz cz�ciej obok Adanosa pojawiali si� fa�szywi bogowie, kt�rzy najpierw odbierali wsp�ln� z prawdziwym b�stwem cze��, a nast�pnie je wypierali. Obiektem kultu stawa�y si� jeziora i doliny, ska�y i �wi�te gaje, a Adanos odchodzi� w zapomnienie.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Sta�o si� to na d�ugo przed powo�aniem Wiecznego W�drowca i powstaniem Imperium Pradawnych w Varancie. Gdy wi�c wyznaj�cy Innosa Pradawni zetkn�li si� w Myrtanie z druidyzmem, ten by� ju� kultem poga�skim i jako poga�ski kult, by� przez nich zwalczany.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Tak oto upad� kult Adanosa w druidyzmie, ust�puj�c miejsca poga�stwu i fa�szywym b�stwom.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM II

// ALTERNATYWNIE CLAW M�G�BY NAM DA� JE RAZEM Z 250 BRY�KAMI RUDY JAKO NAGROD� ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_DruidsOfMyrtana2 (C_ITEM) //d

{

name ="Druidzi Myrtany. Tom II";


mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_05.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Tertulian z Ardei";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_DruidsOfMyrtana2;

};

FUNC VOID Use_Book_DruidsOfMyrtana2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Druidzi Myrtany. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap�anach Myrtany, opisuj�cy druidzki kult i jego histori�]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana2,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana2,"Druidzi Myrtany. Tom II");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Cho� pierwotnie druidzi wyznawali Adanosa, to z biegiem wiek�w, zacz�li czci� r�wnie� fa�szywych bog�w. Niebawem te� zast�pili nimi Pana Wody, lub sprowadzili go do roli pomniejszego b�stwa w druidzkim panteonie. Ju� Pradawni za czas�w Imperium Varanckiego nie rozpoznawali w nich adanosyt�w, lecz traktowali ich jak pogan. Nie inaczej czynili w�adcy w dobie ukszta�towanych, monarchii myrta�skich. Kr�lowie ci zrozumiawszy jednak, �e nie zdo�aj� wypleni� druidyzmu mieczem, postanowili uczyni� go wyznaniem innosyckim.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Gro�ny Pan Ognia, strzeg�cy kr�lewskiego prawa i niezrozumia�ego dla poga�skiej ludno�ci porz�dku, by� dla druid�w bogiem obcym i nie potrafili go przyj��. Magowie Ognia dojrzawszy wtedy w druidyzmie ukryty pierwiastek adanosycki, postanowili przyj�� do druid�w z bardziej zrozumia�ym dla tych pogan b�stwem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Wpierw przeto odnawiano kult Adanosa po�r�d b�stw poga�skich, a gdy Adanos na trwale zago�ci� w panteonie druidzkim, kr�lowie i Magowie Ognia dok�adali wszelkich stara� by sta� si� nast�pnie najwa�niejszym, a potem jedynym b�stwem - rzecz jasna obok Innosa. Tak oto kult druidzki oczy�ci� si� z nalecia�o�ci poga�skich i powr�ci� do wiary, od kt�rej przed wiekami odst�pi�.�Z czasem jednak dominuj�ce wyznanie wypiera�o druidyzm i coraz wi�cej ludzi decydowa�o si� przyj�� kult Innosa. Do dzi� na ziemiach Myrtany osta�y si� nieliczne wsp�lnoty druidzkie.�");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Pisz�c o druidach nie spos�b nie wspomnie� o tym, �e cz�� z nich posiada umiej�tno��, czy raczej moc przemiany w zwierz�ta. Umo�liwia� im to maj� magiczne kamienie, o kt�rych pochodzeniu trudno dzi� przes�dza�. S� one niezwykle rzadkie i jako relikwie s� od wiek�w przekazywane w obr�bie kr�gu druidzkiego.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Ka�dy kamie� ma posiada� swego zwierz�cego patrona, kt�rego posta� mo�e przyj�� osoba dzier��ca �w magiczny artefakt. U�ywanie ich wi��e si� jednak z ryzykiem, gdy� podania g�osz�, �e niejeden cz�owiek przybrawszy posta� zwierz�cia nie mia� ju� powrotu do swojej ludzkiej postaci. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Pos�ugiwanie si� wi�c tym rodzajem magii wymaga ogromnej wiedzy i odwagi na kt�r� m�g�by si� zdoby� jedynie kto� �wi�cie wierz�cy w system warto�ci wyznawany przez druid�w. Dla nich �ycia w sk�rze zwierz�cia by�oby jedynie inn� form� zespolenia z czczon� przez nich natur� i jej opiekunem - Adanosem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Kamienie te mia�y jeszcze t� w�a�ciwo��, �e w pobli�e miejsca pobytu ich posiadacza przybywa�y owe zwierz�ta. Nie czyni�y mu jednak szkody, gdy� moc kamienia uspokaja�a nawet krwio�ercze bestie, tak, �e stawa�y sie niegro�ne dla cz�owieka. I bez tego jednak druidzi potrafili od zawsze oswoi� le�ne zwierz�ta.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Wi�ksze niebezpiecze�stwo stanowili pojawiaj�cy si� od czasu do czasu mo�now�adcy, pragn�cy zdoby� kamienie przemian. Osaczony druid zazwyczaj wola� zniszczy� ten magiczny przedmiot ni� pozwoli�, by ten dosta� si� w niepowo�ane r�ce.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Niekiedy te� zaklinali owe kamienie, tego kt�ry je zdoby�. W ka�dym razie, w wi�kszo�ci legend pr�ba zdobycia kamienia przemiany ko�czy�a sie �a�o�nie dla chciwca.�Mimo to wszystko wskazuje na to, �e wiele wiek�w po ko�cu ery druid�w, nadchodzi czas, gdy zanikn� te� ocala�e dot�d wsp�lnoty druidzkie.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Nawet jednak wtedy, gdy na ziemiach myrta�skich nie b�dzie ju� ani jednego spo�r�d tych prymitywnych mag�w, to ruch druidzki odcisn�� trwa�e pi�tno na historii naszego Kontynentu i jako taki, nigdy nie zginie, gdy� b�dzie trwa� w pie�ni i w s�owie kronikarza. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"KONIEC TOMU II, OSTATNIEGO ");

};


/////////////////////////////////////////////////////////////////////

// ZAPRZYSI�GLI. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY/BIBLIOTEKA XARDASA 

// RACZEJ NIEDOST�PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades1 (C_ITEM)

{

name ="Zaprzysi�gli. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Dunarda Caniana z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades1;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Zaprzysi�gli. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, kt�ra wierzy�a w rych�e objawienie si� ludzkiej manifestacji Beliara i stawia�a sobie za cel unicestwienie ka�dorazowej cz�owieczej inkarnacji boga ciemno�ci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades1,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Zaprzysi�gli. Tom I");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Historia Zaprzysi�g�ych zaczyna si� w do�� trudnej do okre�lenia przesz�o�ci. Niepodobna jest ustali� za czyjego panowania owo bractwo si� zrodzi�o. Wiadomym jest jednak, �e po wiekach swego istnienia, zosta�o z�amane i rozbite przez wielkiego emira Khalima z Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Od wiek�w smagane pustynnym s�o�cem, posiadaj�ce nieprzyjazny dla cz�owieka  klimat, po�udniowe kra�ce Varantu, by�y gniazdem sekciarstwa i odszczepie�stwa. Na owe ziemie wyruszali r�wnie� ascetyczni m�owie w samotno�ci i wyrzeczeniu si� wyg�d poszukuj�cy blisko�ci z Adanosem. Jednym z nich by� Ayam. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Niewiele wiadomo o tej postaci, po za w�tpliw� informacj� jakoby by� magiem wody i kap�anem Adanosa. Przebywaj�c w swej pustelni, mia� dozna� tajemniczej wizji, w kt�rej ujrza� Beliara i ludzkie dzieci� pos�ane przez niego na �wiat. Owa istota mia�a sprowadzi� na ludzi liczne nieszcz�cia i zjednoczywszy ich w Beliarze, rozpocz�� panowanie mrocznego boga na ziemi. Zapowiadany w wizji cz�owiek mia� w przysz�o�ci si� narodzi� i sta� si� Patriarch� Cienia. Wed�ug wierze� sekty Zaprzysi�g�ych w kolejnych objawieniach, Adanos poleci� Ayamowi powo�a� do �ycia zakon, maj�cy przygotowa� si� na przyj�cie i walk� z Patriarch� Cienia. Natchniony owymi wizjami pustelnik, zgromadzi� wok� siebie kr�g uczni�w, kt�rzy uwierzyli w jego pos�annictwo. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Gdy sekta si� ju� zawi�za�a, do Ayama mia� zn�w przem�wi� Pan Wody. Odpowiadaj�c na modlitwy o powstrzymanie przyj�cia S�ugi Beliara, Adanos mia� rzec, �e biegu wydarze� nie mo�na odwr�ci� i Patriarcha Cienia musi przyj�� na �wiat. Pan Wody, wskaza� im jednak ratunek. Mia�o nim pi�� �wi�tych sztylet�w, kt�re wed�ug wierze� Zaprzysi�g�ych, jako rytualne ostrza kap�a�skie by�y przechowywane w �wi�tyniach, wyznaj�cych Innosa, Pradawnych. Ostrza te zagin�y, gdy przed wiekami Pan Wody ukara� potopem pych� staro�ytnych Varantczyk�w.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Zaprzysi�gli uwa�aj�, �e Patriarcha Cienia ma przychodzi� na �wiat przyobleczony w cia�o ludzkie, do czasu gdy w rytualny spos�b owych pi�� ostrzy nie zostanie wbitych w jego cia�o. Ma to by� jedyna bro� zdolna u�mierci� Pos�a�ca Ciemno�ci. Wbicie niekompletnej liczby sztylet�w wi�za�o si� jedynie ze zniszczeniem jedynie jego cz�owieczej pow�oki, z zachowaniem ducha tej plugawej istoty. W takim przypadku, Patriarcha Ciemno�ci w stosownej godzinie mia� objawia� si� w kolejnym wcieleniu.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Ayam i do ko�ca swych dni sta� na czele sekty Zaprzysi�g�ych, poszerzaj�c jej kr�g i poszukuj�c owych artefakt�w. Jego nast�pcy zdo�ali pono� zgromadzi� wszystkie pi�� sztylet�w, cho� r�wnie dobrze mog�y by� one falsyfikatami. Nie trudno sobie przecie� wyobrazi� sytuacje, gdy przyw�dcy sekty obawiaj�c si� konsekwencji odkrycia, �e sztylety z wizji za�o�yciela zakonu nigdy nie istnia�y, kazali jakiemu� nadzwyczaj zdolnemu kowalowi wyku� fa�szywe ostrza. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Jakkolwiek by nie by�o, dzi� zar�wno badacze z kr�g�w kap�a�skich, jak i niezwi�zani z nimi uczeni, sk�onni s� widzie� w Ayamie nie tylko heretyka, ale r�wnie� cz�owieka niezr�wnowa�onego, kt�ry da� pocz�tek gro�nej sekcie. Historia ta nie ko�czy si� jednak na szalonym pustelniku�");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// ZAPRZYSI�GLI. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY/BIBLIOTEKA XARDASA (WA�NE BY CA�Y KOMPLET ZNALAZ� SI� W JEDNEJ Z TYCH DW�CH BIBLIOTEK)

// RACZEJ NIEDOST�PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades2 (C_ITEM)

{

name ="Zaprzysi�gli. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Canian z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades2;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Zaprzysi�gli. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, kt�ra wierzy�a w rych�e objawienie si� ludzkiej manifestacji Beliara i stawia�a sobie za cel unicestwienie ka�dorazowej cz�owieczej inkarnacji boga ciemno�ci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades2,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Zaprzysi�gli. Tom II");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"W ci�gu wiek�w zaprzysi�gli odnajdywali w r�nych znacznych osobisto�ciach posta� Patriarchy Cienia. Mieli ich rozpoznawa� po czynach, lub znamionach na ciele. Ofiar� zakonu, czy raczej wielu r�nych zakon�w, gdy� w ci�gu wiek�w wewn�trz sekty dochodzi�o do licznych podzia��w, pad�o wiele znamienitych ludzi. W�r�d ich ofiar by�o mi�dzy innymi kilku dow�dc�w wojskowych z Mora Sul i Bragi, a tak�e wielu znacznych kupc�w z ca�ego Varantu. Najwi�kszym jednak ich �dokonaniem�, a zarazem tym kt�ry przyni�s� im tyle s�awy, co i zguby, by�o u�miercenie w�adcy Bragi - emira Bilyi i jego dw�ch syn�w. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Na fali rozruch�w i fanatyzmu, podsycanego plotkami o czarnoksi�skich praktykach na dworze emira, rozjuszony t�um ruszy� przeciwko przyrodzonym panom. W wyniku buntu do w�adzy zostali wyniesieni Zaprzysi�gli pod wodz� maga Abdahela. Podczas rebelii emir Bilyia i jego synowie zostali bestialsko zasztyletowani przez cz�onk�w sekty, a ich cia�a spalone na g��wnym placu miasta. Zaprzysi�g�ym nie uda�o si� jednak dope�ni� rytua�u w ca�o�ci, gdy� jedno z ostrzy mia�o zagin�� w ferworze walk toczonych na ulicach z wojskami broni�cego si� emira.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Po przej�ciu w�adzy, Zaprzysi�gli wygnali tych spo�r�d mag�w wody, kt�rzy im si� sprzeciwiali i wesp� z przychylnymi im kap�anami, zacz�li otwarcie propagowa� swe doktryny w zdobytym mie�cie. Do zakonu do��czali kolejni cz�onkowie, a w Bradze zacz�y si� szerzy� heretyckie pisma. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Wnet zacz�to poszukiwa� rzekomych winnych nieudanego rytua�u, gdy� s�dzono, �e do zakonu przenikn�li zdrajcy. Wierzono, �e to wyznawcy Beliara pragn�c za wszelk� cen� zapobiec unicestwieniu Pos�a�ca, mieli wykra�� jedno brakuj�ce ostrze. Cie� podejrzenia pad� r�wnie� na ludzi pos�dzanych o sprzyjanie emirom.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Z rozkazu Abdahela ka�de z narodzonych dzieci musia�o by� sprawdzane pod k�tem znamion, kt�re mog�yby wskazywa� na to, �e ich cia�a sta�y si� domem Pos�a�ca Beliara. Praktyki te poch�on�y niejedno istnienie, podobnie jak prze�ladowanie wszystkich ludzi podejrzanych o sprzyjanie zamordowanemu w�adcy. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Powracaj�cy z wojny Hakim � w�adca Mora Sul, obleg� Brag� i zdobywszy j� po dw�ch dniach, pom�ci� �mier� emira i przywr�ci� porz�dek w mie�cie. Osadziwszy na tronie towarzysz�cego mu podczas wyprawy syna zabitego emira Bilyi � Nuwasa, wyruszy� w drog� powrotn� do swojego kr�lestwa. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Zaprzysi�gli ponie�li wtedy kl�sk� podw�jn�, gdy� z jednej strony zostali przetrzebieni i utracili swe sztylety, a z drugiej nie dokonali w pe�ni rytua�u. Nowa w�adca do�o�y� wszelkich stara� by wypleni� t� sekt� ze swojego miasta i ukara� tych kap�an�w Adanosa, kt�rzy opowiedzieli si� po stronie Abdahela. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Nie wiadomo co si� sta�o z przyw�dc� Zaprzysi�g�ych, gdy� nie odnaleziono jego zw�ok. Po upadku rz�d�w sekty w Bradze, historia g�ucho milczy na temat dalszych los�w Abdahela. Mo�na wi�c przyj��, �e nie odegra� ju� w niej �adnej znacz�cej roli. Cho� kto wie, jak� wiedz� mog� posiada� tu sami Zaprzysi�gli.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Pewnym jest, �e Hakim po zdobyciu Bragi i przywr�ceniu jej prawowitemu emirowi, uwi�z� zdobyte sztylety ze sob�. Od tej pory cztery z nich przez wiele wiek�w, spoczywa�y w skarbcu w wielkim mie�cie Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// ZAPRZYSI�GLI. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY/BIBLIOTEKA XARDASA (WA�NE BY CA�Y KOMPLET ZNALAZ� SI� W JEDNEJ Z TYCH DW�CH BIBLIOTEK)

// RACZEJ NIEDOST�PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades3 (C_ITEM)

{

name ="Zaprzysi�gli. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Canian z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades3;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Zaprzysi�gli. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, kt�ra wierzy�a w rych�e objawienie si� ludzkiej manifestacji Beliara i stawia�a sobie za cel unicestwienie ka�dorazowej cz�owieczej inkarnacji boga ciemno�ci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades3,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Zaprzysi�gli. Tom III");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Od czas�w emira Hakima cztery rytualne sztylety Zaprzysi�g�ych przebywa�y w Mora Sul, b�d�c niemym �wiadectwem straszliwych wydarze� z przesz�o�ci. Taki stan rzeczy trwa� do czas�w, gdy Lukkor i Gellon zostali pokonani przez Rhobara II, a Varant zosta� dosta� si� pod panowanie kr�l�w Myrtany. Jednak wojska Rhobara zdobywszy Mora Sul i wkroczywszy do skarbca wielkiego emira, znalaz�y w zamku tylko trzy spo�r�d czterech z�o�onych tam rytualnych sztylet�w. To co sta�o si� z czwartym oraz pi�tym z �wi�tych ostrzy Zakonu Zaprzysi�g�ych, do dzi� pozostaje zagadk�. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Znam uczonych, kt�rzy twierdz�, �e sam Lukkor podarowa� Zaprzysi�g�ym jeden ze sztylet�w, maj�c nadziej�, �e ci obior� sobie za cel innosyckiego w�adc� wkraczaj�cego do adanosyckiego Varantu. S� te� tacy, co obstaj� przy tym, �e zakon zdo�a� wykra�� jedno z ostrzy ze skarbca i do dzi� kontynuuje swe dzie�o.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Z ciekawszych hipotez, niekt�rzy s� sk�onni domniemywa�, �e kr�lewski wywiad Myrtany zdo�a� zinfiltrowa� szeregi bractwa i wykorzystuje zakon w swoich grach, eliminuj�c osoby stanowi�ce zagro�enie dla pa�stwa Rhobar�w. Ze wzgl�du na stopie� tajno�ci zwi�zany z wywiadem, mo�na o tym jedynie domniemywa�.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Inne zakony wywodz�ce si� z Zaprzysi�g�ych, zachowuj�c pod�o�e religijne, pada�y ofiar� manipulacji ze strony mo�nych, pragn�cych si� pozby� konkretnych ludzi. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Jako poparcie twierdze� jakoby ta sekta w dalszym ci�gu dzia�a�a, przywo�uje si� rozmaite przypadki morderstw znamienitych os�b, lecz �ledztwa prowadzone przez stra� kr�lewsk� i inkwizycj� Mag�w Ognia, nie potwierdzi�y zwi�zk�w tych zab�jstw ze staro�ytn� sekt� varanck�. Mo�e poza jednym przypadkiem, gdy jaki� wariat wdar� si� na przyj�cie vengardzkiego kupca Elberta i pr�bowa� go zasztyletowa� 'staro�ytnym ostrzem'. �w artefakt okaza� si� jedynie stylizowanym no�em, wykutym kilka tygodni wcze�niej  w ku�ni miejscowego kowala. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Mimo to wci�� wielu ludzi, nawet powa�nych, utrzymuj�, �e sekta Zaprzysi�g�ych dzia�a do dzi� i jako taka ma mie� niema�y wp�yw na wydarzenia w naszym Kr�lestwie� ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"KONIEC TOMU III, OSTATNIEGO");

};

/////////////////////////////////////////////////////////////////////

// KLUCZ DO MYRTANY

// SUGEROWANA LOKACJA: NA REGALE W JEDNEJ Z KOMNAT KWATERY MAGNAT�W

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_VarensBook (C_ITEM)

{

name ="Klucz do Myrtany";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_04.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Varen z Faring";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_VarensBook;

};

FUNC VOID Use_Book_VarensBook()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Klucz do Myrtany");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Kr�tki traktat o roli magicznej rudy w powstaniu i ekspansji Myrtany]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_VarensBook,LOG_NOTE);

B_LogEntry(BookLog_VarensBook,"Klucz do Myrtany");

B_LogEntry(BookLog_VarensBook,"Przez wiele wiek�w magiczna ruda cieszy�a si� uznaniem jedynie alchemik�w i mag�w, kt�rzy postrzegali j� wy��cznie jako �r�d�o magicznej energii. Cho� niekt�rzy podejmowali pr�by zastosowania owego kruszcu w kowalstwie, to efekty takich eksperyment�w by�y nader mizerne. ");

B_LogEntry(BookLog_VarensBook,"Dopiero na wiek przed przybyciem Rhobara I do Myrtany, kowale nordmarscy odkryli metod� obr�bki rudy pozwalaj�c� na wykorzystanie jej do produkcji broni.�Dokonanie to przypisuje si� niejakiemu Angirowi, mistrzowi ku�ni pochodz�cemu Klanu M�ota.");

B_LogEntry(BookLog_VarensBook,"Wynalazek ten znacz�co wp�yn�� na bieg naszej historii, gdy� Rhobarowie potrafili wykorzysta� go do zapewnienia swym armiom przewagi nad wojskami wrog�w. Dzi� ju� z pewno�ci� mo�na rzec, �e gdyby nie magiczna ruda, nigdy nie powsta�aby zjednoczona Myrtana.");

B_LogEntry(BookLog_VarensBook,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM I

// SUGEROWANA LOKACJA: OB�Z �OWC�W ORK�W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfNordmar1 (C_ITEM)

{

name ="Nordmarczycy. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfNordmar1;

};

FUNC VOID Use_Book_HistoryOfNordmar1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Nordmarczycy. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia Nordmarczyk�w]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar1,"Nordmarczycy. Tom I");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed�ug najstarszych poda� przodkowie Nordmarczyk�w pierwotnie byli poga�skim ludem zamieszkuj�cym Mro�ne Wyspy, po�o�one na p�nocny-wsch�d od Myrtany. Stamt�d ich przodkowie przybyli na ziemie, kt�re dzi� zwiemy Sundmarem, a nad kt�rymi w naszych czasach g�ruje zbudowana przez kr�l�w Gothy twierdza Faring.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Barbarzy�cy mieli przyp�yn�� na Kontynent w poszukiwaniu ziemi, prowadzeni przez p�-legendarnego Rangulda, kt�ry sta� si� wsp�lnym przodkiem dzisiejszych Nordmarczyk�w i Sundmarczyk�w. Zar�wno jedni jak i drudzy wierz�, �e obie te krainy, po dw�ch stronach prze��czy, nadane im zosta�y przez przez bog�w.");

B_LogEntry(BookLog_HistoryOfNordmar1,"To przekonanie wywodzi si� widocznie jeszcze z czas�w wsp�lnoty obu ga��zi ludu przyby�ego z Mro�nych Wysp. Z tym, �e o ile dawniej bogowie ci musieli by� poga�scy, o tyle dzi� miejsce starych w tej opowie�ci zajmuje myrta�ski Innos, kt�rego kult przyby� do lud�w p�nocy dopiero wiele wiek�w p�niej.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Z przybyciem Rangulda na Kontynent wi��e si� pewna legenda. W dniach nieurodzaju jaki dotkn�� Mro�ne Wyspy, Ranguld uda� sie do wyroczni, gdzie us�ysza� o �zielonym l�dzie na Po�udniu�. Praprzodek dzisiejszych lud�w p�nocy u boku swych towarzyszy, wyruszy� wi�c na wypraw�, we wskazanym przez bog�w kierunku.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Tak dotar� do Sundmaru, gdzie pokonawszy plemi� jaszczuroludzi, mia� w nagrod� otrzyma� od bog�w dla swoich potomk�w owe ziemie. Tyle przekazuje nam legenda.� Wiadomym jest jednak, �e przodkowie dzisiejszych lud�w p�nocy od niepami�tnych czas�w toczyli za�arte boje ze swymi jelkalskimi s�siadami.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Na d�ugo jeszcze przed narodzinami kr�la Goth�w, Troghdana, kt�ry zjednoczy� liczne szczepy Jelkal�w, przodkowie Nordmarczyk�w zostali przez nich pokonani. Potomkom Rangulda grozi�a niewola. W dniach kl�ski dzia�alno�� sw� rozpocz�� niejaki Dorganard, pochodz�cy najpewniej z jednego z zagro�onych plemion.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed�ug nordmarskiej tradycji, Dorganard mia� by� wybra�cem bog�w, kt�remu bogowie polecili ocalenie jego ludu i poprowadzenie go ku ziemiom p�nocy. Z woli bog�w, bezkresne ziemie za prze��cz� mia�y na wieki sta� si� ich dziedzictwem. Z t� nowin� Dorganard przemierza� wioski i osady, g�osz�c obietnic� bog�w. ");

B_LogEntry(BookLog_HistoryOfNordmar1,"Za spraw� jego nauk, rozpocz�� si� wielki exodus, podczas kt�rego ca�e rodziny zostawia�y swe domy i bior�c ze sob� wszelki dobytek przeprawi�y si� na p�noc. Przodkowie dzisiejszych Nordmarczyk�w spotkali tam plemiona ork�w, kt�re dziesi�tkowane nieznan� zaraz�, uleg�y pod naporem przybysz�w z po�udnia.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Potomkowie Rangulda wkr�tce rozci�gn�li swe posiadanie na ca�� krain�, opieraj�c jej granic� o po�udniowe kra�ce niezbadanych ziem ork�w. Kolejne wyprawy na p�noc maj�ce poszerzy� ich w�adztwo, a napotykaj�c na coraz silniejszy op�r ork�w u�wiadomi�y Nordmarczykom, �e granica pozostanie niezmienna.");

B_LogEntry(BookLog_HistoryOfNordmar1,"KONIEC TOMU I");

};


/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM II

// SUGEROWANA LOKACJA: OB�Z �OWC�W ORK�W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfNordmar2 (C_ITEM)

{

name ="Nordmarczycy. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfNordmar2;

};

FUNC VOID Use_Book_HistoryOfNordmar2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_REd_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Nordmarczycy. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia Nordmarczyk�w]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar2,"Nordmarczycy. Tom II");

B_LogEntry(BookLog_HistoryOfNordmar2,"Mija�y wieki, a lud ten wzrasta� w si�� i liczebno��. W tym czasie jedne klany si� rodzi�y, a inne zn�w zamiera�y i odchodzi�y do przesz�o�ci. Ostatecznie ukszta�towa�y si� trzy szczepy: Klan Ognia, Klan Wilka i Klan M�ota. Nordmar, cho� ogromny nie by� jednak w stanie wy�ywi� coraz wi�kszej populacji.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Rusza�y wi�c kolejne wyprawy ku ziemiom po�udnia, docieraj�ce a� po w�o�ci podleg�e Monterze. Nie uwa�ali si� jednak za �upie�c�w, gdy� wierzyli, �e sami bogowie nadali im Sundmar. Pl�druj�c tamte ziemie mieli wi�c, jedynie zbiera� plony odebranej im ziemi. Nie byli jednak na tyle silni by j� odzyska�.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Trudno powiedzie� kiedy Nordmarczycy stali si� ludem czcz�cym Innosa. Jest jednak pewnym, �e pocz�tki tego kultu musz� si� wi�za� z �upie�czymi wyprawami na myrta�skie posiad�o�ci Pradawnych. Przyj�ta z po�udnia wiara na�o�y�a si� na prastary kult przodk�w, tworz�c w�a�ciw� dla Nordmaru odmian� kultu Innosa.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Wa�na wydaje si� by� tu posta� Akaschy, kt�remu w Nordmarze mia� si� objawi� sam Pan Ognia. Niekt�rzy chcieliby widzie� w nim posta�, kt�rej Nordmarczycy zawdzi�czaj� okie�znanie skutej lodem krainy. Pewne podania pr�buj� go przedstawi� nawet jako ucznia Wiecznego W�drowca �yj�cego kilkaset lat przed Akasch�.");

B_LogEntry(BookLog_HistoryOfNordmar2,"R�wnie niedorzeczna wydaje si� my�l, �e Klan Ognia jest najstarszym miejscem w ca�ym Nordmarze. Niew�tpliwie jednak Akascha by� postaci� zwi�zan� z Klanem Ognia, a by� mo�e nawet jego protoplast�. Ten bohater nordmarskich legend, jako barbarzy�ski w�dz stoczy� liczne zwyci�skie wojny z orkowymi plemionami.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Je�eli wierzy� tamtejszym podaniom, Akascha prowadz�c swych towarzyszy do kolejnych boj�w mia� znacznie rozszerzy� granic� Nordmaru. Nios�c ogie� na ziemie ork�w, wydziera� owe tereny z ich �ap i oddawa� we w�adanie ludziom. Rozszerzy� tym samym znacznie granic� krainy opanowanej przez potomk�w Rangulda.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Na tym przyjdzie zako�czy� opis najstarszych dziej�w Nordmarczyk�w, nie opisawszy krucjat prowadzonych przez jarl�w Farung na ziemie ork�w, czy nie wspomniawszy wreszcie o zej�ciu z g�r Rhobara Wielkiego i powstaniu Kr�lestwa Myrtany. R�wnie� obecne wojny Rhobara II z tym ludem dopiero czekaj� na kronikarza.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Pisz�cy te s�owa ma jednak nadziej�, �e ksi�ga ta cho� w niewielkim stopniu przybli�y ch�tnym dzieje lud�w p�nocy, kt�re cho� dzi� nazywane s� najcz�ciej barbarzy�skimi, to wyda�y spo�r�d siebie kr�l�w i jednoczycieli Kr�lestwa Myrtany.");

B_LogEntry(BookLog_HistoryOfNordmar2,"KONIEC TOMU II, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo1 (C_ITEM)

{

name ="Haran Ho. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo1;

};

FUNC VOID Use_Book_HaranHo1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Opowie�� o bohaterze-renegacie z czas�w Imperium Pradawnych w Varancie.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo1,LOG_NOTE);

B_LogEntry(BookLog_HaranHo1,"Haran Ho. Tom I");

B_LogEntry(BookLog_HaranHo1,"Ojciec Harana Ho pochodzi� z jednej z wysp, kt�re tak obficie obsypuj� Wielkie Morze ci�gn�ce si� na wsch�d od Kontynentu. Niewiele wiadomo o tym, co sk�oni�o go do przybycia do Varantu. Jedni powiadaj�, �e by� on jednym z wielu, kt�rzy postanowili szuka� szcz�cia w armii Imperium Pradawnych. Inni, �e mia� by� jakoby jednym z je�c�w, kt�ry dzi�ki swej nadzwyczajnej m�dro�ci zdo�a� zjedna� sobie uznanie wp�ywowych os�b i dzi�ki temu zyska� wolno��. Znajd� si� te� tacy, co b�d� twierdzi�, �e ojciec m�czennika urodzi� si� w rodzinie urz�dnika, blisko zwi�zanego ze �wi�tyni� Mag�w Ognia.");

B_LogEntry(BookLog_HaranHo1,"Trudno tu rozstrzygn��, kt�rej wersji nale�a�oby da� pos�uch. Tym bardziej, �e nawet prawdziwe imi� rodzica Harana ginie w mrokach dziej�w, a to znane z legend pochodzi najpewniej z o wiele p�niejszej, ju� koczowniczo-varanckiej tradycji.�Legenda przyjmowana zar�wno przez wyznawc�w Adanosa, jak r�wnie� przez nieprzychylny mu Ko�ci� Innosa g�osi, �e Haran Ho mia� by� jednym z najznamienitszych wojownik�w czas�w Nelezara I. Mia� przyj�� na �wiat w domu pobo�nego urz�dnika, pozostaj�cego w Innosyckich kr�gach �wi�tynnych. ");

B_LogEntry(BookLog_HaranHo1,"W przeddzie� narodzin Harana, jego ojciec mia� straszliwy sen. Oto objawi� mu si� czerwony gryf - zwierze po�wi�cone Innosowi. Majestatyczne stworzenie wzrokiem gro�nym i pe�nym niewypowiedzianej nienawi�ci spogl�da�o na rodz�ce si� dziecko. Ojciec zrozumia�, �e Haran nie jest mi�ym Panu Ognia. Mi�o�� rodzicielska jednak w nim zwyci�y�a. Ukl�k� przed ognistym gryfem, oddzielaj�c go od dzieci�cia, a wiedz�c, �e jest to zwierze Innosa, pocz�� b�aga�:��Oszcz�d� mego syna, a daruj� go Twej �wi�tyni, Innosie! Je�li z�� mia�a by� latoro�l moja, niechaj pod Tw� opiek� wzrasta i s�u�b� sw� win� okupi�");

B_LogEntry(BookLog_HaranHo1,"Majestatyczne stworzenie skierowa�o sw�j wzrok na b�agaj�cego go cz�owieka. Ojciec Harana by� wiernym i gorliwym Innosyt�, �yj�cym wed�ug praw ludzkich i boskich. Sam Pan Ognia wiedzia�, �e w sercu tym p�onie ogie� niewzruszonej wiary. Najstarszy z Bog�w widz�c rozpaczliwe wo�ania ojca, rozkaza� swemu zwierz�ciu by oszcz�dzi�o ch�opca. Gryf pos�uszny woli Innosa, powoli si� oddala�. Krzyk przebudzonego dzieci�cia zwiastowa� koniec snu i rozpoczyna� �ywot Harana Ho. Dla jednych mia� si� sta� kiedy� �wi�tym, dla innych zn�w przekl�tym...");

B_LogEntry(BookLog_HaranHo1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo2 (C_ITEM)

{

name ="Haran Ho. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo2;

};

FUNC VOID Use_Book_HaranHo2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Opowie�� o bohaterze-renegacie z czas�w Imperium Pradawnych w Varancie]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo2,LOG_NOTE);

B_LogEntry(BookLog_HaranHo2,"Haran Ho. Tom II");

B_LogEntry(BookLog_HaranHo2,"�smego dnia po narodzinach, ojciec Harana zani�s� syna do �wi�tyni, by tam ofiarowa� go Innosowi. Tym czynem ch�opiec zosta� przeznaczony do stanu kap�a�skiego, czym rodzic dope�ni� �lub�w z�o�onych Innosowi.�Gdy nadszed� czas, ojciec odda� Harana na nauki i wychowanie magom ognia. W miar� dorastanie stawa�o si� jasne, �e Haran nie nadaje si� na kap�ana. M�odzieniec bardziej od m�dro�ci ksi�g, ceni� sobie si�� or�a. Niejednokrotnie wdawa� si� w b�jki z innymi nowicjuszami, czym bynajmniej nie zaskarbi� sobie wzgl�d�w uczonych mag�w. Czas pokaza�, �e jego prawdziwym powo�aniem jest s�u�ba wojskowa. Nie �ami�c �lub�w zaprzesta� nauki magii i pog��bionych studi�w teologicznych. Wkr�tce kap�ani zezwolili mu na wzi�cie udzia�u w dzia�aniach wojennych kr�la Nelezara, kt�ry to w�adca wielk� ufno�� pok�ada� w Ko�ciele Innosa.");

B_LogEntry(BookLog_HaranHo2,"Wyprawia� sie wi�c Haran przeciw Prave�czykom, co w b��dzie poga�skim hardo trwali. Lud ten ur�ga� mocy Pradwanych, urz�dzaj�c �upie�cze wyprawy na ziemie pograniczne, nieustannie im zagra�aj�c.�I tu Haran Ho dowi�d� niezbicie, �e powo�aniem rzemios�o wojenne to jego prawdziwe powo�anie. W czasie jednej z bitew z Prave�czykiem, dokona� rzeczy, kt�ra przynios�a mu s�aw� i zwr�ci�a na niego uwag� samego w�adcy. W trakcie niepomy�lnego dla wojsk imperialnych boju, jeden z oddzia��w dowodzonych przez kr�lewskiego przyjaciela zosta� okr��ony przez wrog�w. Owym monarszym druhem, a zarazem dow�dc� oddzia�u by� Bargalla, pod kt�rym s�u�y� te� Haran. M�ody nowicjusz Mag�w Ognia zobaczy�, �e jego dow�dca le�y na ziemi bez ducha. Zdoby� si� wtedy na czyn bohaterski i przedzieraj�c si� przez zast�py wroga, pochwyci� nieprzytomnego i wyni�s� z wrogiego okr��enia.");

B_LogEntry(BookLog_HaranHo2,"W dow�d wdzi�czno�ci za uratowanie kr�lewskiego przyjaciela wezwa� go imperator Nelzar przed swoje oblicze:��Dowiod�e� swego m�stwa nowicjuszu Haranie! Czyn wielki bez nagrody uj�� nie mo�e, przeto pro� o co chcesz, a ja Ci to daruj�!�. Haran nie prosi� o skarby, czy uczone ksiegi. Nie chcia� ani zaszczyt�w, ani tytu��w i maj�tk�w. Poprosi� tylko o pozwolenie mu na opuszczenie �wi�tyni i zamieszkanie na po�udniowym pograniczu, gdzie jako wolny stra�nik strzeg�by tamtejszych ziem przed �upie�czymi najazdami ork�w i jaszczuroludzi. Cho� Nelzar by� nieco zdziwiony takim niecodziennym �yczeniem, zgodzi� si�. Od tej pory Haran Ho s�u�y� na po�udniowych stepach Varantu, gdzie na czele konnego oddzia�u walczy� z zielonosk�rymi rabusiami � pozosta�o�ci� mrocznego przymierza, kt�re to kilka wiek�w wcze�niej pokona� Semmir I �wi�ty.");

B_LogEntry(BookLog_HaranHo2,"KONIEC TOMU II");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo3 (C_ITEM)

{

name ="Haran Ho. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo3;

};

FUNC VOID Use_Book_HaranHo3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Opowie�� o bohaterze-renegacie z czas�w Imperium Pradawnych w Varancie].");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo3,LOG_NOTE);

B_LogEntry(BookLog_HaranHo3,"Haran Ho. Tom III");

B_LogEntry(BookLog_HaranHo3,"Kolejne lata sp�dzi� Haran Ho na po�udniowych kra�cach Imperium, broni�c mieszka�c�w pogranicza przed lu�nymi bandami ork�w, grasuj�cymi w tych stronach. Po�r�d orkowej zarazy, prym wiod�a zgraja pod przyw�dztwem Osh-Gereba, kt�ry zdo�a� zgromadzi� przy sobie wielu podobnych rabusi�w. Wiedziony ��dz� �upu i krwi ork wyprawia� si� raz po raz na wioski, siej�c postrach i zniszczenie. Nim na ratunek mieszka�com przybywali stra�nicy pogranicza, by�o zazwyczaj ju� po wszystkim. ");

B_LogEntry(BookLog_HaranHo3,"Orkowie nawiedzali wioski, by spl�drowawszy je, zbiec z �upem daleko na po�udnie, gdzie przez wzgl�d na niech�tne Varantowi plemiona koczownik�w i odleg�o�� od varanckich siedzib, bali si� zapuszcza� nawet �o�nierze imperium. Niekt�re osady za cen� bezpiecze�stwa decydowa�y si� p�aci� danin� Osh-Gerebowi, lecz nawet to nie zawsze je chroni�o przed najazdami ork�w.�Sta� si� przeto herszt ork�w, kryj�cy si� daleko w swych siedzibach na po�udniu, panem niema�ej cz�ci pogranicza, dziel�c niemal na r�wni sw� w�adzami varanckimi.");

B_LogEntry(BookLog_HaranHo3,"W Haranie Ho znalaz� on jednak godnego przeciwnika. Haran nakaza� postawi� dzwony w ka�dej wiosce i wybudowa� liczne wie�e obserwacyjne, tworz�c sprawny system alarmowania na wypadek orkowych atak�w. Ponadto przybysz nie ba� si� w pogoni za �upie�c� zapuszcza� si� na niezbadane tereny po�udnia. Ilekro� kt�r�� osad� nawiedzili orkowie, dzielny wojownik pod��a� na miejsce i krwawo rozprawia� si� z naje�d�c�. Sw� nieust�pliwo�ci� i zaci�ciem, wla� ducha odwagi w stra�nik�w pogranicza, skutecznie stawiaj�c czo�a orkowym bandytom. Z tego powodu pr�dko wi�c zaskarbi� sobie wdzi�czno�� ludzi �yj�cych na pograniczu.�");

B_LogEntry(BookLog_HaranHo3,"Zdarzy�o si� czwartego roku s�u�by na rubie�ach, �e Haran Ho kierowany rosn�c� ambicj� uda� si� w dalek� pogo� za jednym z orkowych podjazd�w. Im dalej stra�nicy gnali za wata�kami, tym dalej byli od krain znanych kartografom imperialnym. Na tych ziemiach, to orkowie mieli w swych r�kach ten niezwykle cenny atut, jakim jest znajomo�� terenu. Zwabiwszy Harana Ho do w�wozu, orkowie rozbili jego oddzia�. Pomimo m�stwa z jakim rycerz si� broni�, jego los zdawa� si� by� przes�dzony.");

B_LogEntry(BookLog_HaranHo3,"Gdy ju� si�y dowodzone przez Harana Ho niemal ca�kowicie stopnia�y, na pomoc przybyli koczownicy - mieszka�cy owych nietkni�tych w�adz� Innosyt�w ziem. Nomadzi pod wodz� maga wody Istvana, zmusili ork�w do odwrotu, za� rannego Harana i tych z jego oddzia�u, kt�rzy prze�yli zabrali ze sob� do obozowiska. Tam koczownicy opatrzywszy ich, pocz�li naradza� si�, co nale�y zrobi� z ocala�ymi Varantczykami. Mieszka�cy tych ziem z niech�ci� spogl�dali na Pradawnych, gdy� pami�tali, �e p�nocni s�siedzi nieraz pr�bowali podporz�dkowa� sobie koczownik�w.��");

B_LogEntry(BookLog_HaranHo3,"Za rad� Istvana, plemi� zdecydowa�o si� podda� przyw�dc� oddzia�u pr�bie. Oto koczownicy ustawili ze swych dzid i oszczep�w kr�g, poczym wprowadzili do niego Harana i jego ocala�ych towarzyszy. Nast�pnie mag Istvan wprowadzi� do kr�gu dwa lwy, nale��ce do plemienia i stanowi�ce jakoby cz�� owej wsp�lnoty. Tak oto los uratowanych z zasadzki Varantczyk�w zosta� poddany pod os�d Adanosa. Lwy okr��y�y trzykrotnie Harana Ho i jego towarzyszy, badaj�c ich wzrokiem i gotuj�c si� do ataku. Zatoczywszy jednak trzeci kr�g gwa�townie rzuci�y si� w kierunku Varantczyka, by obr�ciwszy si� na zewn�trz ko�a, zaj�� miejsce u prawego i lewego boku Harana.��Ten oto cz�owiek cieszy si� �ask� Adanosa� � rzek� mag wody Istvan, wst�puj�c do owego kr�gu.");

B_LogEntry(BookLog_HaranHo3,"KONIEC TOMU III");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo4 (C_ITEM)

{

name ="Haran Ho. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo4;

};

FUNC VOID Use_Book_HaranHo4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Opowie�� o bohaterze-renegacie z czas�w Imperium Pradawnych w Varancie.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo4,LOG_NOTE);

B_LogEntry(BookLog_HaranHo4,"Haran Ho. Tom IV");

B_LogEntry(BookLog_HaranHo4,"Haran Ho w wyniku potyczki z orkami, odni�s� powa�ne rany, kt�re przez wiele tygodni nie pozwala�y mu na powr�t do domu. Podobnie rzecz si� mia�a z tymi spo�r�d jego towarzyszy, kt�rym uda�o si� prze�y� bitw�. �y� wi�c po�r�d koczownik�w, obserwuj�c przy ich przy tym i nasi�kaj�c ich kultur�. Nawet gdy kompani Harana opu�cili ju� ziemie koczownik�w i powr�cili do Varantu, on zdecydowa� si� pozosta� w�r�d nomad�w, kt�rzy uratowali mu �ycie. Z czasem sta� si� jednym z nich i jako ucze� maga Istvana postanowi� kroczy� drog� Adanosa. Z�ama� tym samym �luby, kt�re z�o�y� niegdy� w �wi�tyni Innosa.");

B_LogEntry(BookLog_HaranHo4,"Na d�ugo zapomniano wtedy o Haranie, kt�ry przez wiele lat �y� po�r�d nomad�w. Mimo to wie�� o konwersji dotar�a w ko�cu do arcykap�ana Salviana, rezyduj�cego w pa�acu �wi�tynnym mag�w w Al Shedim, wywo�uj�c w Salvianie w�ciek�o��. Wysoki Mag Ognia postanowi� wi�c wys�a� do Harana Ho ludzi, kt�rzy nam�wiliby go do odmiany decyzji. Haran odm�wi�, wydaj�c tym samym na siebie wyrok �mierci. Od tamtej pory s�udzy arcykap�ana rozpocz�li po�cig za konwertyt�, ukrywaj�cym si� wraz z nomadami po�r�d dzikich krain, nieznanych dla Varantczyk�w. ");

B_LogEntry(BookLog_HaranHo4,"Wiele lat ludzie �wi�tyni tropili Harana, lecz ten dzi�ki umiej�tno�ciom bojowym i magii Adanosa wychodzi� ca�o ze wszystkich zasadzek. W czasie jednej z takich potyczek, koczownicy ponie�li dotkliwe straty i dla ratowania si�, byli zmuszeni wyda� Harana. Pojmanego, zawleczono do Al Shedim, gdzie postawionego przed s�dem pr�bowano zmusi� do wyrzeczenia si� Adanosa. Haran Ho pozosta� jednak niez�omny. Z rozkazu arcykap�ana Salvina zosta� wi�c stracony, a dla poni�enia pochwyconego, cia�u konwertyty odm�wiono poch�wku i wrzucono do rzeki.");

B_LogEntry(BookLog_HaranHo4,"Zosta�o ono jednak wy�owione przez jego rodzin� i z�o�one w kamiennym grobie. Tam te� zasta� je potop, kt�ry zmi�t� z powierzchni ziemi ca�� cywilizacj� Pradawnych i otworzy� Koczownikom drog� do osiedlenia si� na opustosza�ych ziemiach Varantu. Tak oto ko�cz� si� dzieje Harana Ho, kt�ry dla Pradawnych zdrajc� b�d�c i renegatem, sta� si� bohaterem i m�czennikiem dla lud�w, kt�re przyj�� po upadku Imperium mia�y. ");

B_LogEntry(BookLog_HaranHo4,"KONIEC TOMU IV, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// R�D FOLKMAR�W

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA. JEDEN EGZEMPLARZ NA CA�� KOLONI� W ZUPE�NO�CI WYSTARCZY.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_FolkmarFamily (C_ITEM) //d - lochy

{

name ="R�d Folkmar�w";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_04.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Ognia Eudamon";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_FolkmarFamily;

};

FUNC VOID Use_Book_FolkmarFamily()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "R�d Folkmar�w");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Pr�ba rekonstrukcji rodu posiadaczy ziemskich w Khorinis na podstawie zapisk�w wyrytych na rodzinnych mogi�ach.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_FolkmarFamily,LOG_NOTE);

B_LogEntry(BookLog_FolkmarFamily,"R�d Folkmar�w");

B_LogEntry(BookLog_FolkmarFamily,"Niejednokrotnie bywa�em z wizyt� w maj�tku ziemskim w Khorinis, od pokole� nale��cym do dumnego rodu Folkmar�w. Gospodarze zawsze wtedy potrafili mnie godnie ugo�ci�, nie uchybiaj�c godno�ci mojej jako maga ani dobremu imieniu swego domu. Bod�cem do napisania tej ksi�gi by�o jednak nader smutne wydarzenie. Oto do Innosa odchodzi� s�dziwy senior rodu i w�a�ciciel maj�tku ziemskiego � szanowny Pan Buvran. Zar�wno owego statecznego gospodarza, jak i jego rodzin� zna�em do�� dobrze i �mier� Pana Buvrana wielce mnie zasmuci�a. Zrozumia�em wtedy w pe�ni jak ulotn� rzecz� jest ludzkie �ycie i ludzka pami��. To sk�oni�o mnie do tego, by prze�ledzi� napisy z nagrobk�w widniej�ce na rodzinnym cmentarzu. Czas odbiera nam pami��, a s�owa wyryte w kamieniu powoli si� zacieraj�. Dlatego te� postanowi�em spisa� widniej�ce na nagrobkach s�owa, by utrwali� dla potomnych dzieje owego wa�nego dla Khorinis rodu.");

B_LogEntry(BookLog_FolkmarFamily,"1. Gebhard Nied�wiedzia Tarcza.�Mocarz poleg�y w bitwie z ciemi�c�, w walce o wolno�� ludu Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"2. Folkmar syn Gebharda. Towarzysz Dietmara Ukary i pierwszy posiadacz maj�tku ziemskiego.");

B_LogEntry(BookLog_FolkmarFamily,"3. Gerlach syn Folkmara. Zostawi� swym synom maj�tek po trzykro� pomno�ony.");

B_LogEntry(BookLog_FolkmarFamily,"4. Humbert syn Gerlacha. Kt� je�li nie on, si�gn��by a� po prze��cz?");

B_LogEntry(BookLog_FolkmarFamily,"5. Lutbert syn Gerlacha.�M�odszym b�d�c, najstarszym si� sta�. Po bracie obj�� maj�tek ziemski w posiadanie, gospodarz�c a� po kres swych d�ugich dni.");

B_LogEntry(BookLog_FolkmarFamily,"6. Ekbert syn Lutberta. M�� stateczny, ojciec po dwakro� nieszcz�ciem dotkni�ty. Przedwcze�nie zgas�, �mierci� swych ukochanych dzieci strapiony. ");

B_LogEntry(BookLog_FolkmarFamily,"7. Emilda c�rka Ekberta. Dziewcz� nadzwyczajnej urody, posiadaj�ce dar widzenia. Rozstrzyga�a spory, wskazywa�a przest�pc�w, leczy�a chorych. Los zawistnie strzeg�cy swych tajemnic, w zem�cie zes�a� na jej umys� szale�stwo.�");

B_LogEntry(BookLog_FolkmarFamily,"8. Manfred syn Ekberta. Ukochawszy gonitw� i pe�ny zwierzyny las, nad sierp i z�oto zbo�a, rozszarpany przez dzik� besti� my�liwy skona� na le�nej polanie.");

B_LogEntry(BookLog_FolkmarFamily,"9. Mourin Z�oty Sierpiec. Ziarno przez siewce odtr�cone, wyda�o plon stukrotny. Pobo�no�� i pracowito�� zapewni�a maj�tkowi ziemskiemu dobrobyt. W klasztorze osiad�szy na staro��, tam dokona� �ywota.");

B_LogEntry(BookLog_FolkmarFamily,"10. Hereward syn Mourina. M�odzieniec ros�y, odwag� i honor nosz�cy w sercu. Zgin�� �mierci� bohatera w walce z naje�d�c� z zachodu, broni�c swego kraju u boku dzielnych syn�w Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"11. Folkward syn Mourina. Poszed� w �lady brata, zasiliwszy szeregi wojsk Kr�lestwa Kahr. M�stwem i waleczno�ci� si� odznaczywszy, zosta� przez samego w�adc� wybrany do osobistej Gwardii.");

B_LogEntry(BookLog_FolkmarFamily,"12. Caspar syn Folkwarda. Po ojcu swego rodziciela wzi�� w posiadanie maj�tek ziemski, panuj�c przez lat wiele dziesi�tk�w. �lepcem b�d�c na staro��, nigdy nie ujrza� swego jedynego syna.");

B_LogEntry(BookLog_FolkmarFamily,"13. Adalbert syn Caspara. Ziemie ukocha� on szczerze, serce swe oddaj�c ca�kowicie sprawom maj�tku ziemskiego. Na dziedzica przez Caspara namaszczony zmar� przedwcze�nie chorob� zmo�ony. ");

B_LogEntry(BookLog_FolkmarFamily,"14. Udo syn Caspara. Potomek Folkmara, kt�remu s�dzone by�o �y� w czasach powolnego upadku Kr�lestwa Kahr i zmierzchu kr�lewskiej dynastii Ukar�w. Poleg�y w walkach toczonych o tron Kr�lestwa.");

B_LogEntry(BookLog_FolkmarFamily,"Tu nast�puje kilkupokoleniowa wyrwa, gdy� po �mierci syn�w Caspara brak ju� nagrobk�w a� do poch�wku Hugona. W tym czasie, zapewne za spraw� nowinek religijnych rozpowszechnianych przez szerz�ce si� w�wczas na wyspie sekty, w�a�ciciele maj�tku ziemskiego przyj�li nieznany wcze�niej zwyczaj palenia zmar�ych. Wobec braku nagrobk�w, nie spos�b odtworzy� w tym miejscu historii rodu. W tradycji rodzinnej przetrwa�o jednak echo o jakim� w�drownym m�drcu przyby�ym z po�udnia i przez wiele lat ciesz�cym si� go�cin� tutejszych gospodarzy. Kim by�, ani jakim doktrynom s�u�y�, na wieki pewnie pozostanie tajemnic�. Oto kolejni Folkmarowie:");

B_LogEntry(BookLog_FolkmarFamily,"15. Hugon syn Widukinda. W cieniu brata wyros�y, wi�cej by� mnichem, ni� gospodarzem. Nad ksi�gami nieustannie pochylony, nie zwyk� dogl�da� swego maj�tku. W wiedz� tedy wzrastaj�c, na dobytku swym zaniedbaniem uszczerbek czyni�.");

B_LogEntry(BookLog_FolkmarFamily,"16. Ordulf syn Hugona. Zmar� op�akiwany przez rodzin� i licznych przyjaci�. Za swego �ycia odnowi� zabudow� maj�tku ziemskiego i wybudowa� nowy m�yn. Do�ywszy starczego wieku, do ostatnich dni zachowa� zdrowie i jasno�� umys�u.");

B_LogEntry(BookLog_FolkmarFamily,"17. Dietwin syn Ordulfa.�Gospodarz stateczny i ciesz�cy si� szacunkiem. Zjednawszy sobie m�dro�ci� s�siad�w, zyska� rol� rozjemcy nie z prawa, lecz ze zwyczaju. Zmar� do�ywszy wieku s�dziwego");

B_LogEntry(BookLog_FolkmarFamily,"18. Bernard syn Dietwina. Godny potomek Gebharda D�bowej Tarczy, kt�ry wzorem swego praprzodka potrafi� wygina� podkowy. S�awny sw� si��, �eb warga by� w stanie zmia�d�y� w u�cisku swej pi�ci. Gospodarz maj�tku ziemskiego");

B_LogEntry(BookLog_FolkmarFamily,"19. Engelbrecht syn Bernarda. �ywot jego przypada� na czasy pokoju i takie te� by� usposobienia Engelbrechta syn Bernarda.");

B_LogEntry(BookLog_FolkmarFamily,"20. Buvran syn Dietwina. Zasn�� snem wieczny, do�ywszy 87 lat. Przez ca�e swe �ycie nigdy nie opu�ci� swego maj�tku ziemskiego, kt�ry ukocha� nade wszystko.");

B_LogEntry(BookLog_FolkmarFamily,"Kolejne karty tej ksi��ki zapisze nieuchronny czas� Spisane pi�rem Eudamona, Maga Ognia z Klasztoru w Khorinis");

B_LogEntry(BookLog_FolkmarFamily,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// DZIEDZICTWO PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY/BIBLIOTEKA MAG�W OGNIA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HeritageOfAncestors (C_ITEM)

{

name ="Dziedzictwo Pradawnych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Wody�Calamus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HeritageOfAncestors;

};

FUNC VOID Use_Book_HeritageOfAncestors()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dziedzictwo Pradawnych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[O wp�ywie cywilizacji staro�ytnego Varantu na �wiat myrta�ski, a tak�e o zwi�zkach Imperium Pradawnych z dzisiejszym Varantem.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HeritageOfAncestors,LOG_NOTE);

B_LogEntry(BookLog_HeritageOfAncestors,"Dziedzictwo Pradawnych");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium Varanckie kilkana�cie wiek�w temu�stanowi�o najwi�ksz� pot�g� na Kontynencie Myrta�skim. Zjednoczone przez Wiecznego W�drowca rozci�gn�o swe w�adztwo na ca�y Varant i po�udniowe tereny Krain Centralnych. Zosta�o unicestwione przez Adanosa, gdy Pradawni podj�li si� budowy portalu za pomoc� kt�rego Innos mia� przekroczy� oddzielaj�c� oba wymiary barier� i przyj�� do Wymiaru Ludzi.");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium zdo�a�o jednak wytworzy� kultur� i religi�, kt�ra przetrwa�a upadek samego pa�stwa i sta�a si� podstaw� cywilizacji rozprzestrzeniaj�cej si� nast�pnie na zielone krainy Myrtany, skuty lodem Nordmar i na liczne wyspy i wysepki po�o�one na wsch�d od Kontynentu.");

B_LogEntry(BookLog_HeritageOfAncestors,"Po unicestwieniu Pradawnych, na l�d powt�rnie wy�aniaj�cy si� z g��bin, przybywali ludzie z g�r le��cych na zachodzie. Zwali sie oni koczownikami. Nowi mieszka�cy nie byli poganami, cho� w przeciwie�stwie do Pradawnych Varantczyk�w nie oddawali czci Innosowi, lecz wyznawali Pana Wody - Adanosa. Wed�ug legendy, plemiona te mia�y pochodzi� od wykl�tego w�adcy Varantu - Kalhira II. Wygnany ze swego pa�stwa za pr�b� obalenia kultu Innosa i zast�pienia go kultem Adanosa, zbieg� w g�ry, gdzie nawraca� tamtejsze plemiona Koczownik�w. Pocz�tkowo przyby�e do Varantu ludy g�rskie, przemierza�y wyja�owiony i zamieniony przez bog�w w pustyni� l�d, krocz�c szlakiem Wiecznego W�drowca. Jednak z biegiem lat coraz wi�cej ludzi decydowa�o si� na osiad�y tryb �ycia. W oazach zacz�y wi�c powstawa� wioski i miasta. ");

B_LogEntry(BookLog_HeritageOfAncestors,"Nast�pnym etapem by�o powstanie pa�stw. Na czele owych cz�sto rywalizuj�cych ze sob� kr�lestw, stawali adanosyccy w�adcy. Najpot�niejszymi mia�y si� okaza� Mora Sul i Bakareshu. Niebawem ludy pustyni mia�y same siebie przezwa� Varantczykami, przejmuj�c tym samym nazw� dawnych mieszka�c�w tej krainy. Mimo to pami�� o pocz�tkach kaza�a im zachowa� pierwotn� nazw� swego ludu, wi�c od wiek�w prowadz�cy osiad�y tryb �ycia mieszka�cy Varantu okre�laj� si� r�wnie� mianem Koczownik�w.�");

B_LogEntry(BookLog_HeritageOfAncestors,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// PIE�� O WYZWOLENIU

// SUGEROWANA LOKACJA: LOCHY STAREGO OBOZU (PUSTA CELA, PE�NA KO�CIOTRUP�W). KSI�GA PRZY JEDNYM ZE SZKIELET�W

// KATEGORIA: UNIKATOWE - TYLKO JEDNA 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_IsNomineVacans (C_ITEM) //d

{

name ="Pie�� o wyzwoleniu";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Ognia�Telavio";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_IsNomineVacans;

};

FUNC VOID Use_Book_IsNomineVacans()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Pie�� o wyzwoleniu");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dociekania po�wi�cone zagadkowemu hymnowi.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_IsNomineVacans,LOG_NOTE);

B_LogEntry(BookLog_IsNomineVacans,"Pie�� o wyzwoleniu");

B_LogEntry(BookLog_IsNomineVacans,"Is nomine vacans liberabit vobis ex servitus. Is nomine vacans reddet vobis ars magica. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. ");

B_LogEntry(BookLog_IsNomineVacans,"Advemini custos templorum. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. Advemini custos templorum.�");

B_LogEntry(BookLog_IsNomineVacans,"Pie�� o wyzwoleniu zalicza si� do najstarszych i najbardziej tajemniczych tekst�w, kt�rych geneza ginie w mrokach dziej�w. Zosta�a ona napisana w jednym z dialekt�w j�zyka Pradawnych � w j�zyku kap�an�w Innosa. Jest to mowa archaiczna, gdy� pos�ugiwali si� ni� w�a�ciwie jedynie najwy�si kap�ani Imperium Pradawnych. Sk�d wi�c w tek�cie pojawiaj� si� s�owa o Vengardzie, kt�ry nigdy nie popad� w zale�no�� od pot�nego pa�stwa Pradawnych?");

B_LogEntry(BookLog_IsNomineVacans,"Czy tekst traktuje o wydarzeniach z przesz�o�ci i nadziei tamtych ludzi na wybawienie przez tajemniczego bohatera, czy te� jest to mo�e forma przepowiedni, kt�ra dopiero ma si� wype�ni�?�Czym jest te� owa moc magiczna, kt�ra ma zosta� przywr�cona przez nieznanego z imienia bohatera? Czy rzecz si� tyczy staro�ytnych czar�w, kt�re zosta�y utracone w momencie zag�ady Imperium Pradawnych? Odzyskanie tej wiedzy by�oby zapewne istnym przewrotem w dziedzinie nauk magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Kwestia autorstwa r�wnie� pozostaje nierozwi�zana. J�zyk wskazywa�by na kap�an�w Varantu, lub kr�gi duchowne pozostaj�ce pod wp�ywem Imperium. Najpopularniejsze z hipotez m�wi� o ocala�ych Pradawnych, kt�rzy op�akiwali upadek swej cywilizacji i �ywili wiar� w to, �e uda si� zachowa� jego dziedzictwo, a nawet odbudowa� utracon� wielko��. ");

B_LogEntry(BookLog_IsNomineVacans,"Mo�liwe te�, �e okr��eni z wszystkich stron przez barbarzy�c�w Pradawni z niezatopionych p�nocnych ziem dawnego kr�lestwa, w cudownym wybra�cu bog�w upatrywali swego wybawiciela. Sk�d wi�c wzi�� si� w pie�ni Vengard?");

B_LogEntry(BookLog_IsNomineVacans,"Nie wykluczaj�c powy�szych przypuszcze�, mo�na si� pokusi� o inn� teori�. Ot� mog�a powsta� w czasach zagro�enia jakiej� innosyckiej spo�eczno�ci, kt�ra by� mo�e utraci�a swych mag�w i co za tym idzie, r�wnie� magiczn� moc. Wyra�a wi�c ona wiar� w powr�t utraconej wiedzy. Bohaterem by�by wi�c cz�owiek obcy, przyby�y z innych stron, kt�rego imi� by�oby im wcze�niej nieznane. By� mo�e chodzi�o od pos�a�ca bog�w.");

B_LogEntry(BookLog_IsNomineVacans,"Pomimo niezrozumia�ego j�zyka, a mo�e w�a�nie dzi�ki temu pie�� si� rozpowszechni�a w ca�ej Myrtanie. Mo�na przypuszcza�, �e archaiczne brzmienie jej s��w musia�o przywodzi� na my�l zakl�cia, z czym wi�za�oby si� nadawanie utworowi w�a�ciwo�ci magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Uczeni wspominaj�, �e po zdobyciu Gothy przez wojska Monteriusa II, d�ugo jeszcze niegodz�cy si� z kl�sk�, ukrywaj�cy si� po lasach partyzanci �piewali t� pie��. Domy�la� si� mo�na, �e owi rycerze zamiast Vengardu wymieniali nazw� zdobytego swego miasta, kt�re znalaz�o ku ich rozpaczy znalaz�o si� w r�kach wroga.");

B_LogEntry(BookLog_IsNomineVacans,"Najstarszy jednak spisany tekst pie�ni pochodzi od Reginalda, kt�ry w swych �Hymnach Myrtany� zawar� j� w wersji vengardzkiej. Reginald milczy jednak o tym, kiedy powsta�a i w jakich okoliczno�ciach zosta�a od�piewana.");

B_LogEntry(BookLog_IsNomineVacans,"Pie�� o wyzwoleniu zapewne pobrzmiewa�a jeszcze na ziemiach Krain Centralnych w czasach podboj�w Rhobaryd�w, kiedy to dzielni kr�lowie jednoczyli rozbit� na szereg kr�lestw zielon� Myrtan�. Wraz ze zrastaniem si� ziem zjednoczonych pod ber�em Rhobaryd�w, pie�� ta uleg�a zapomnieniu, a� w ko�cu nikt ju� jej nie wznosi�. Oby ju� nigdy w Kr�lestwie Myrtany jej s�owa nie rozleg�y si� na nowo po lasach i skalnych ost�pach�");

B_LogEntry(BookLog_IsNomineVacans,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI�. TOM I

// SUGEROWANA LOKACJA: G�RSKA FORTECA

// NIEDOST�PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian1 (C_ITEM)

{

name ="Jaszczurze plemi�. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Draconian1;

};

FUNC VOID Use_Book_Draconian1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Jaszczurze plemi�. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksi�g traktuj�cych o smokach, jaszczurocz�ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian1,LOG_NOTE);

B_LogEntry(BookLog_Draconian1,"Jaszczurze plemi�. Tom I");

B_LogEntry(BookLog_Draconian1,"Kwestia, kt�rej po�wi�ci�em ow� ksi�g�, nurtowa�a mnie od wielu lat i jest owocem mozolnych bada� jakich si� dla jej zg��bienia podj��em. O zagadkowym rodzaju gadzich istot mia�em okazj� us�ysze� niejednokrotnie ju� za m�odu, gdy w�drowni bardowie przybywali na gocki zamek mego pana � kr�la Endricka. Dane mi by�o wtedy pozna� pie�ni o bohaterach z zamierzch�ej przesz�o�ci, kt�re musia�y nie�� w sobie echa wydarze� z zamierzch�ej, cz�sto jeszcze plemiennej przesz�o�ci. Wybuja�a wyobra�nia kolejnych pokole� w�drownych poet�w musia�a je jednak zniekszta�ci�. By�y w�r�d nich tak�e opowie�ci o smokach.");

B_LogEntry(BookLog_Draconian1,"R�wnie� stare ksi�gi traktuj�ce o owych gadach dostarcza�y sprzecznych informacji. Gdy w jednych te istoty mia�y by� ogromnymi gadami, ziej�cymi ogniem, to w innych jawi�y si� jako �yj�ce w plemionach dwuno�ne humanoidy. Zdarza�y si� tak�e takie legendy i wzmianki, gdzie wyst�powa�y oba rodzaje smok�w. Z czego wynika�y r�nice w opisach? Czy walki ze smokami, lub smoczymi plemionami s� jedynie echem walk toczonych mi�dzy lud�mi? Czy mo�e zwyci�zcy dopiero z czasem oblekli pokonanych w gadzie sk�ry? A mo�e niekt�re szczepy s�u�y�y smokom, zyskuj�c przez to miano smoczych? Pytania te czeka�y na odpowied�.");

B_LogEntry(BookLog_Draconian1,"Wertuj�c kolejne ksi�gi i pergaminy, zacz��em sobie u�wiadamia�, �e legendy i kroniki opisuj� co najmniej dwa gatunki smoczych istot. Los by� dla mnie �askawy, gdy� jako nadworny bibliotekarz kr�la Edricka I mog�em prosi� mego w�adc� o pomoc w dost�pie do ksi�gozbior�w miast podleg�ych wielkiej Gocie. A by�o to kr�lestwo obejmuj�ce ca�� Jelkal�, w tym tak�e Veluk� i pobieraj�ce daniny od wielu wodz�w plemiennych. Nie dziwi wi�c, �e s�siedni w�adcy obawiaj�c si� pot�nego kr�la, starali si� pozyska� jego przychylno��. Dzi�ki �asce Endricka I, otwiera�o mi to wrota do niemal ka�dej biblioteki w Myrtanie.");

B_LogEntry(BookLog_Draconian1,"Jednak wieloletnie badania, cho� nie bezowocne, nie da�y mi tyle, co jedno, ale za to wa�ne odkrycie. Studiuj�c kolejne ksi�gi, coraz cz�ciej natrafi�em na pojedyncze wzmianki o skale, na kt�rej w zamierzch�ej przesz�o�ci miano jakoby uwieczni� dzieje smoczego rodzaju. Chwilowa rado��, pr�dko jednak ust�powa�a zw�tpieniu, kt�re cho� wtedy by�o uzasadnione, to dzi� ciesz� si�, �e mu nie uleg�em. Mia�em oto jedynie w�tpliwe wzmianki o pewnej staro�ytnej skale, kt�ra stanowi�a obietnic� rozwik�ania cho� w cz�ci owej nurtuj�cej mnie od lat zagadki.");

B_LogEntry(BookLog_Draconian1,"S�k w tym, �e nie by�o pewne, czy ta ska�a na kt�rej pono� wykuto histori� owych mitycznych stworze� w og�le istnia�a. Je�eli przecie� istnia�a, to mog�a nie dotrwa� do naszych czas�w. Nie mia�em te� pewno�ci, czy wyryte na skale wizerunki nie b�d� po prostu zwyk�ymi obrazkami, czy jak�� kolejn� legend�. Istnienie tej konstrukcji po�wiadcza�y tylko wzmianki z wielowiekowych, sypi�cych si� ju� pergamin�w, za� bli�sze moim czasom zapisy na ten temat uparcie milcza�y. Z mglistych wskaz�wek wywnioskowa�em, �e poszukiwania powinienem rozpocz�� w Dhirim � kraju od wiek�w zamieszka�ym przez lud Guldern�w.");

B_LogEntry(BookLog_Draconian1,"Podsumowuj�c, nie wiedzia�em gdzie dok�adnie owa �ciana si� znajduje, nie wiedzia�em co w�a�ciwie zawiera, nie wiedzia�em czy jej odnalezienie wniesie cokolwiek do nauki, nie wiedzia�em wreszcie czy ona w og�le istnieje!�Postanowi�em jednak podj�� si� tropu zes�anego przez los, nie bacz�c na te w�tpliwo�ci.");

B_LogEntry(BookLog_Draconian1,"Pr�ba lokalizacji poszukiwanego obiektu nie by�a �atwa. Od wiek�w nikt o tej skale nie wspomina�, ani tym bardziej nie ogl�da� na oczy. Za zgod� kr�la Edricka opu�ci�em dw�r i ruszy�em w d�ug� drog� ku krajom na zachodzie Kontynentu. Jak si� okaza�o, mia�em tam sp�dzi� kolejne kilkana�cie lat mego �ycia.");

B_LogEntry(BookLog_Draconian1,"Przybywszy na dw�r kr�la Dhirim, Almera II, stawi�em si� przed jego obliczem. W�adca Guldern�w nie by� mi zbytnio przychylny, gdy� podobnie jak jego poddani, uwa�a�, �e pragn� wydrze� i ukra�� skarby ich ziemi. Podobnie my�leli te� mo�ni, jakimi Almer si� otacza�. Nie �mieli jednak si� sprzeciwia� Gocie. Mimo niech�ci dworu i ludu, zdo�a�em sobie zjedna� mir w�r�d gulderyjskich uczonych i cz�ci mag�w. Ciekawi wyniku moich bada�, ch�tnie s�u�yli mi sw� wiedz� i go�cin�. Wiedzieli, �e moje dociekania mog� przyczyni� si� do lepszego poznania historii ziem zamieszkanych przez ich lud. Jestem im za to wdzi�czny.");

B_LogEntry(BookLog_Draconian1,"KONIEC TOMU I");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI�. TOM II

// SUGEROWANA LOKACJA: G�RSKA FORTECA

// NIEDOST�PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////


INSTANCE ItWr_Draconian2 (C_ITEM)

{

name ="Jaszczurze plemi�. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Draconian2;

};

FUNC VOID Use_Book_Draconian2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Jaszczurze plemi�. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksi�g traktuj�cych o smokach, jaszczurocz�ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian2,LOG_NOTE);

B_LogEntry(BookLog_Draconian2,"Jaszczurze plemi�. Tom II");

B_LogEntry(BookLog_Draconian2,"Poszukiwania trwa�y lat osiem i zawiod�y mnie na p�nocny zach�d od stolicy Kr�lestwa Dhirim. Opieraj�c si� na wiadomo�ciach jakich dostarczy� mi pisma z Bibliotece Kr�lewskiej w Geldern, ruszy�em ku wiosce Guldar. Mieszka�cy owej osady praktykowali z dawna dziwny zwyczaj, kt�ry przyku� moj� uwag�. Ot� mieszka�cy tej wioski co roku zanosili w uroczystym orszaku,  zgromadzon� w beczkach zwierz�c� krew do okolicznych jaski� i j� tam wylewali. Z obrz�dem tym wi�za�a si� pewna legenda, g�osz�ca, �e w przesz�o�ci ziemie przodk�w mieszka�c�w wsi by�y nawiedzane przez gady, kt�re atakowa�y ludzi i zwierz�ta. Gady te mia�y mie� w owych jaskiniach swoje le�e. Jednak, gdy wiele pokole� temu ich dziadowie zawarli przymierze z jaszczurami, te ju� wi�cej nie niepokoi�y wioski. Warunkiem przymierza mia�a by� da� z�o�ona z kwi zwierz�cej, kt�ra mia�a nasyci� bestie. Od tej pory mieszka�cy co roku dokonuj� tego obrz�du.");

B_LogEntry(BookLog_Draconian2,"Jako naukowiec postanowi�em zbada� te jamy. Jak si� mia�em niebawem przekona� �ciany z jednej z nich pokryte by�y malowid�ami przedstawiaj�cymi humanoidalne gady. Wiedzia�em, �e jestem na w�a�ciwej drodze. W ci�gu pi�ciu miesi�cy odkry�em po�o�enie ska�y dziej�w - znajdowa�a si� ona g��boko pod ziemi�.�Pi�� lat trwa�o wydobywanie jej na powierzchnie. Powoli ods�ania�y si� przed nami kolejne rysunki i malowid�a, odkrywaj�ce przed naszymi oczyma prawd� o tych pradawnych istotach. Ju� pobie�ny ogl�d tablicy potwierdzi� moje przypuszczenia. Gady z opowie�ci i kronik nie s� wytworem wyobra�ni!");

B_LogEntry(BookLog_Draconian2,"Z tym, �e nie nale�a�oby m�wi� o jednym, lecz przynajmniej o trzech gatunkach tych stworze�. Pierwsz� ich odmian� jest smok w�a�ciwy, zwany te� patriarchalnym. S� to ogromnych rozmiar�w jaszczury, potrafi�ce lata� i zia� ogniem. Jako najpot�niejsze z nich, maj� by� r�wnie� przodkami pozosta�ych dw�ch odmian. Ten rodzaj smoka mia� by� nader inteligentnym stworzeniem, w�adaj�cym magi�, a przy tym czczonym przez trzeci� z opisanych tu odmian.");

B_LogEntry(BookLog_Draconian2,"Drug� s� smoki pomniejsze zwane �mijcami, czyli t�pe zwierz�ta, pozbawione magicznej mocy i o wiele mniejsze od smok�w w�a�ciwych. To w�a�nie �mijce s� ulubionym elementem opowie�ci rycerskich, w kt�rych �mia�kowie w l�ni�cych zbrojach uwalniaj� ludzi spod smoczego jarzma.");

B_LogEntry(BookLog_Draconian2,"Trzecim i zdecydowanie najciekawszym rodzajem s� jaszczuroludzie, kt�rzy s� po��czeniem gada i cz�owieka. Wzrost jaszczurocz�eka por�wnywalny by� ze wzrostem orka. By�y to istoty inteligentne i s� zdolne nawet do stworzenia w�asnej cywilizacji. �wiadectwem tego jest cho�by owa monumentalna wykuta przez nich p�yta, z kt�rej czerpi� o nich wiedz� wiedze, czy ruiny miasta rozpo�cieraj�ce si� u podn�y ska�.");

B_LogEntry(BookLog_Draconian2,"Powiedziano tu ju�, �e jaszczuroludzie otacza�y kultem smoki patriarchalne. To jednak nie wyczerpuje tematu zale�no�ci mi�dzy tymi dwiema odmianami. Zwi�zek mi�dzy nimi by� o wiele wi�kszy i �ci�lejszy ni� mi�dzy b�stwem i cz�owiekiem. Dla jaszczuroludzi smoki w�a�ciwe nie by�y jedynie przedmiotem kultu. Wed�ug gadzich wierze� ka�dy jaszczurocz�ek ma by� bezpo�rednim potomkiem smoka. Poniewa� smoki patriarchalne nie s� mieszka�cami tego �wiata, to ��czno�� z nimi jest mo�liwa jedynie poprzez trans, jakiemu poddaj� si� kap�anki. W jego wyniku sk�adane s� jaja z potomstwem smoka patronuj�cego plemieniu. Tak w�a�nie mia�y przychodzi� na �wiat kolejne pokolenia jaszczurocz�ek�w. Mo�liwe te�, �e czczone przez jaszczuroludzi smoki nie by�y tworami rzeczywistymi, lecz zmy�lonymi dla potrzeby mitu istotami. Nast�pstwem takiego przypuszczenia by�oby stwierdzenie, �e w�r�d jaszczuroludzi odbywa�o si� dziewor�dztwo.");

B_LogEntry(BookLog_Draconian2,"KONIEC TOMU II");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI�. TOM III

// SUGEROWANA LOKACJA: G�RSKA FORTECA

// NIEDOST�PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian3 (C_ITEM)

{

name ="Jaszczurze plemi�. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Draconian3;

};

FUNC VOID Use_Book_Draconian3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Jaszczurze plemi�. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksi�g traktuj�cych o smokach, jaszczurocz�ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworze�]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian3,LOG_NOTE);

B_LogEntry(BookLog_Draconian3,"Jaszczurze plemi�. Tom III");

B_LogEntry(BookLog_Draconian3,"W�r�d jaszczuroludzi, samice stanowi�y jedynie niewielk� cz�� populacji. Nie uw�acza�o to jednak ich roli, gdy� jako kap�anki sta�y na czele plemienia i to one porozumiewa� si� mia�y ze smokiem-patronem. Do szamanek nale�a�o te� wyznaczanie wodza, kt�ry w czasie wojny stawa� na czele plemienia. Jaszczuroludzie byli spo�ecze�stwem podzielonym na kasty. Opr�cz kap�anek, plemi� tworz� zaopatruj�cy wsp�lnot� w �ywno�� my�liwi oraz wojownicy. W momencie zagro�enia obie te kasty podejmuj� si� walki w obronie szczepu. Cho� nie znali oni rolnictwa, to nieobca im by�a hodowla zwierz�t (m.in. �wi�, czy dzikich ps�w, ale tak�e swych pobratymc�w - smok�w-�mijc�w). Zdarza�o si� nawet, �e w �apali ludzi i zmuszali ich do prac w swych osadach. Taka forma niewolnictwa nasili�a si� szczeg�lnie w czasach istnienia kr�lestwa.");

B_LogEntry(BookLog_Draconian3,"Wr��my na chwil� do ich mitologii, kt�ra wydaje si� wsp�lna dla ca�ego gatunku. Ot� ka�de plemi� uwa�a�o si� za przodka jednego ze smok�w, cho� zdarza�o si�, �e kilka szczep�w mia�o wsp�lnego patrona. Dane plemi� czcz�c swego ojca, cho� uznawa�o realno�� innych, to nie widzia�o potrzeby oddawania im czci.  Same smoki patriarchalne r�wnie� maj� mie� wsp�lnego ojca, kt�ry by� pierwszym spo�r�d nich. Jego imi� to Hirad, lub Hirad-Khor. Mia� on przed wiekami zosta� stworzony przez niepodzielonego jeszcze Innosa. Zbuntowawszy si� przeciw Innosowi, mia� sw� kl�sk� przyp�aci� wiecznym wi�zieniem w Kr�lestwie Beliara.");

B_LogEntry(BookLog_Draconian3,"Obecny w mitologii jaszczuroludzi w�tek buntu przeciw pierwszemu z bog�w, jest szczeg�lnie ciekawy w �wietle teorii g�oszonych przez niekt�rych uczonych. Niepodzielony jeszcze Innos mia� powo�a� do �ycia stworzenia zwane Przedwiecznymi Istotami. Mia�y by�, wed�ug heretyk�w, najpot�niejszymi istotami jakie kiedykolwiek stworzono, gdy� powsta�y one w czasach skumulowanej mocy rozdzielonej obecnie na Innosa, Beliara i Adanosa. Zostawi� jednak herezjarch�w z ich wywodami i powr�c� ju� do tego, co stanowi w�a�ciwy przedmiot moich docieka�.");

B_LogEntry(BookLog_Draconian3,"Jedynym potomstwem pierwszego smoka by�y smoki patriarchalne, kt�re da�y pocz�tek jaszczurocz�ekom i sta�y si� patronami jaszczurzych plemion. Od chwili uwi�zienia Hirad-Hora wi�cej smoczych patriarch�w mia�o si� ju� nie pojawi�, gdy� �aden z bog�w nie pragn�� uwolnienia i powrotu tej pot�nej istoty.");

B_LogEntry(BookLog_Draconian3,"Om�wiwszy dwa spo�r�d rodzaj�w smoczych gad�w, przyszed� czas by przyjrze� si� owym �mijcom. Cho� r�ni� si� od dw�ch opisanych wcze�niej, to jednak ich pochodzenie ��czy je silnie z jaszczurolud�mi i smokami-patriarszymu. Jak mo�na odczyta� ze ska�y dziej�w, niekiedy szamanki wydawa�y te� �mijc�w na �wiat. Cho� �mijce pochodz� od jaszczuroludzi, to w przeciwie�stwie do nich, s� w stanie ��czy� si� z osobnikami sobie podobnymi i wydawa� p�odne potomstwo. Zwierz�ta te �y�y zar�wno w�r�d jaszczuroludzi pe�ni�c rol� zwierz�t bojowych, niekiedy nawet otaczane szacunkiem. Inne zamieszkiwa�y jaskinie i lasy.");

B_LogEntry(BookLog_Draconian3,"KONIEC TOMU III");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI�. TOM IV

// SUGEROWANA LOKACJA: G�RSKA FORTECA

// NIEDOST�PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian4 (C_ITEM)

{

name ="Jaszczurze plemi�. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Draconian4;

};

FUNC VOID Use_Book_Draconian4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Jaszczurze plemi�. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksi�g traktuj�cych o smokach, jaszczurocz�ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworze�.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian4,LOG_NOTE);

B_LogEntry(BookLog_Draconian4,"Jaszczurze plemi�. Tom IV");

B_LogEntry(BookLog_Draconian4,"W przesz�o�ci jaszczuroludzie mieli toczy� wiele wojen, tak z lud�mi, jak i z plemionami swych pobratymc�w. Podczas nich zdarza� si� mia�o, �e zagro�one klan przyzywa� na ziemi� swego patrona, by wspom�g� ich w walce. Czasami przywo�ane na �wiat gin�y w czasie bitew, lub by�y zabijane przez bohater�w. �mier� patrona mia�a skazywa� plemi� na zag�ad�, cho� niekiedy taki szczep oddawa� si� pod opiek� innego smoka patriarchalnego. To pozwala�o zachowa� istnienie klanu.");

B_LogEntry(BookLog_Draconian4,"W dawnych czasach, na d�ugo przed powo�aniem Wiecznego W�drowca, jaszczuroludzie mieli stworzy� na zachodzie kontynentu kr�lestwo, ��cz�ce wiele plemion. Cho� posiada�o jednego kr�la, to w istocie by�o jedynie konfederacj�, kt�ra mimo to mia�a przetrwa� oko�o stu lat. Niewiele wiadomo o tym pa�stwie, pr�cz tego, �e w stolicy rezydowa�o czterech wodz�w pochodz�cych z najsilniejszych szczep�w. Cz�� jednak plemion pragn�a odebra� szamanki mniej licznym szczepom i odda� je na s�u�b� swoim patronom. Wskutek walk wewn�trznych, Kr�lestwo si� rozpad�o.");

B_LogEntry(BookLog_Draconian4,"Ma�o wiemy o dalszych losach jaszczuroludzi, gdy� powr�t do plemienno�ci nie sprzyja� rozwojowi pisma.�Wiadomo tylko, �e byli cz�ci� si� beliaryckich w epoce Pradawnych. P�niejszy o wiele wiek�w wysyp pie�ni o wyprawach na jaszczuroludzi jest zapewne echem walk plemion ludzkich z jaszczurzymi.");

B_LogEntry(BookLog_Draconian4,"Czy smocze gady s� wi�c gatunkiem wymar�ym? Wola�bym unika� tak kategorycznych stwierdze�. Wobec pog�osek dochodz�cych z po�udniowych kra�c�w Varantu, odpowiem wi�c nieco wymijaj�co. Zar�wno jaszczuroludzie, jak i �mijce na terenie zielonej Myrtany i ca�ego znanego nam �wiata nale�y uzna� za wymar�y.");

B_LogEntry(BookLog_Draconian4,"Na tym ko�cz� wyw�d o dziejach i kulturze tego fascynuj�cego gatunku. Mimo jednak 29 lat bada�, po�wi�ci�em tym badaniom, nauka o tych stworzeniach jest dopiero w powijakach. Maj�c ju� niewiele �ycia przed sob�, pragn� by dzie�o to by�o podj�te i kontynuowane przez nast�pne pokolenia badaczy...");

B_LogEntry(BookLog_Draconian4,"KONIEC TOMU IV, OSTATNIEGO");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant1 (C_ITEM)

{

name ="Dzieje Varantu. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant1;

};

FUNC VOID Use_Book_HistoryOfVarant1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant1,"Dzieje Varantu. Tom I");

B_LogEntry(BookLog_HistoryOfVarant1,"O, Imperium Prastare!�Pi�kno Twe przez piaski pustyni rzewnie zasypane; Twe dzieje z g��bi wiek�w na nowo dzi� przywo�ane! Niechaj Ty, kt�re r�k� gniewnego Adanosa na zag�ad� skazane; W pie�ni chwalebnej, pi�rem kronikarza �ywym przez chwil� si� stanie! O wielkie monarchy, Innosa dawne s�ugi!Od Wiecznego W�drowca wy�cie Pana Ognia wybra�ce; Dzi� za spraw� dziejopisa; Na ziemski pad� powracajcie!  A Ty sp�jrz cz�owiecze, sp�jrzcie po wiekach nast�puj�cy po nich potomni; S�ysz modlitw� piachu i modlitw� wiek�w, niech pami�� o Imperium nigdy nie ust�pi. ");

B_LogEntry(BookLog_HistoryOfVarant1,"W czasach zamierzch�ych, gdy �wiat by� jeszcze m�odym, wszelki duch ziemie zamieszkuj�cy przed Innosem i Adanosem bi� pok�ony i mod�y pobo�ne ku nim zanosi�. Nast�powa�y wi�c po sobie kolejne pokolenia, mija�y lata i wieki, oddalaj�c ludzko�� od pierwotnej czysto�ci i prawdy. Piach zapomnienia zakrywa� z wolna pami�� o latach b�ogos�awionych, gdy ludzie �yli w prawdzie i w szcz�ciu. Z pokolenia na pokolenie rodzaj cz�owieczy z drogi prawo�ci coraz bardziej zst�powa� i w bezece�stwie si� pogr��a�.");

B_LogEntry(BookLog_HistoryOfVarant1,"W swym zapomnieniu ludzie zwr�cili swe serca ku ba�wanom, kt�re sobie uczynili i ku demonom nieczystym, kt�re zwiod�y wielu.�I nasta�y czasy, gdy w b��dzie poga�stwa pogr��y�y si� niemal wszystkie ludy. Jedynie nieliczni pozostali wierni prawdziwym bogom, doznaj�c przez to z r�k ba�wochwalc�w krzyw wiele i ucisku. Powo�a� wi�c Innos jednego spo�r�d prawych, by wyruszy� ku krajom b��dz�cym. Nakaza� mu opu�ci� dom sw�j rodzinny i uda� si� z innosyckim pos�annictwem do szczep�w pogr��onych w odst�pstwie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Zostawiwszy dom ojca swego, cz�owiek sta� si� Wiecznym W�drowcem i nauczycielem lud�w. Przemierza� odt�d ca�y �yzny Varant z uczniami swemi, rozja�niaj�c mroki poga�skiego zabobonu. Ni�s� on oczyszczenie s�owem i ogniem, s�awi�c imi� Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant1,"I przemierza� Wieczny W�drowiec Varant przez lat siedemna�cie i sze��dziesi�t osiem dni, a wielu za jego spraw� odmieni�o sw� wiar� i porzuci�o b��dy poga�stwa. Ros�a wi�c liczba tych, kt�rych Wieczny W�drowiec prowadzi�.");

B_LogEntry(BookLog_HistoryOfVarant1,"Wejrza� wtedy Innos na coraz liczniejsze szeregi pod��aj�cych za nauczycielem lud�w i uzna�, �e Wieczny W�drowiec got�w jest ju� wype�ni� swoje przeznaczenie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Pan Ognia przeto powt�rnie przem�wi� do Wiecznego W�drowca: 'Od�� sw�j Kostur', a w jego miejsce Innos da� mu Ber�o i Wieczny W�drowiec zosta� Jego s�ug�. Tak oto Wieczny W�drowiec przesta� by� tu�aczym pielgrzymem, a sta� si� wybra�cem i namiestnikiem Innosa na ziemi.");

B_LogEntry(BookLog_HistoryOfVarant1,"On to mia� przywr�ci� ziemi� varanck� prawdziwym bogom i zaprowadzi� kr�lestwo Innosa na ziemi�");

B_LogEntry(BookLog_HistoryOfVarant1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant2 (C_ITEM)

{

name ="Dzieje Varantu. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant2;

};

FUNC VOID Use_Book_HistoryOfVarant2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant2,"Dzieje Varantu. Tom II");

B_LogEntry(BookLog_HistoryOfVarant2,"Ujrza� tedy Beliar, �e Innos pragnie zaprowadzi� swoje kr�lestwo w Varancie i uczyni� ziemie varanck� pos�uszn� swemu s�owu. I p�on�� gniew Beliara, a cie� jego pad� w serca czcicieli Pana Ciemno�ci. ");

B_LogEntry(BookLog_HistoryOfVarant2,"I przebudzili si� szamani orkowych szczep�w, a szczepy ich jednoczy�y si� pod czarnymi sztandarami Mrocznego Boga. Na wezwanie Beliara odpowiedzia�y plemiona prastarej rasy jaszczuroludzi, przezywanej te� od ojca ich ojc�w Hiradhorianami, lub Hiradami. ");

B_LogEntry(BookLog_HistoryOfVarant2,"Po�r�d si� cienia znale�li si� te� odszczepie�cy, kt�rzy cze�� oddawali demonom i rozmaitym ba�wanom. Ci za podszeptem czczonych bestii, kt�re n�dznymi s�ugami by�y Beliara, przystali do wrog�w Innosa. Pod sztandar cienia wsp�lny przybyli r�wnie� sojusznicy, kt�rzy nie z czci dla Beliara na d�wi�k czarnego rogu odpowiedzieli, ino ze strachu przed zwyci�stwem Pana Ognia. Ci oto w rosn�cej pot�dze wyznawc�w Innosa widzieli zagro�enie dla swych fa�szywych bog�w.");

B_LogEntry(BookLog_HistoryOfVarant2,"I trwa�y wojny krwawe lat wiele, i w rw�cej szkar�atnej rzece ��czy�a si� krew wrog�w �miertelnych. W jednym ponurym biegu spajaj�c tych, kt�rych nienawi�� wyznawanych bog�w dzieli�a. ");

B_LogEntry(BookLog_HistoryOfVarant2,"Przemin�� �ywot Wiecznego W�drowca i trafi� on do niebios, gdy w czasie jednej z bitew przez wrog�w b�d�c osaczonym, r�k� Innosa zosta� �ywcem zabrany do wieczno�ci. Tak oto Pan Ognia nagrodzi� Swego s�ug�. Po nim panowa� Akheld � syn jego, za� brat Akhelda - �Semmir zako�czy� wojn� za spraw� �wi�tych relikwii danych mu przez Adanosa. Dzi�ki nim rozgromiono ostatecznie armi� wszetecznego wroga i skalano jego obrzydliwe gniazdo w Eresh-Ugall na po�udniu, a niedobitki paskudztwa wygnano z Varantu.");

B_LogEntry(BookLog_HistoryOfVarant2,"Po nim nasta�y kolejne pokolenia kr�l�w, panuj�cych w s�odkim Varancie z wy�yn tronu miasta Al.-Shedim. Nast�puj�cy kolejno w�adcy budowali Kr�lestwo Innosa, wznosz�c wspania�e �wi�tynie ku czci ukochanego przez nich Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant2,"Niech s�awi� si� imiona dw�ch syn�w Semmirowych Akhelda II i Tellosa I,�Zwyci�skich w�adc�w, co wielki najazd barbarzy�skiego Prave�czyka odpierali!�Niech po wsze czasy przetrwa imi� walecznego i dzielnego kr�la, Teminnara;�Co Trellium poga�stwu bezecnemu wydar� i do o�tarza Innnosa do��czy�.�Chwa�a Seminnarowi III co Velucii przyni�s� imi� Innosowe!�Chwa�a Tellosowi III co kraj Prave�czyk�w uczyni� sobie pos�usznym!�Chwa�a budowniczym �wi�ty� i w�adcom wiek�w dawnych!�");

B_LogEntry(BookLog_HistoryOfVarant2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant3 (C_ITEM)

{

name ="Dzieje Varantu. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant3;

};

FUNC VOID Use_Book_HistoryOfVarant3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant3,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant3,"Dzieje Varantu. Tom III");

B_LogEntry(BookLog_HistoryOfVarant3,"Nadszed� zmierzch �ycia Tellosa III, kt�ry to do�ywszy wieku s�dziwego, nie doczeka� si� upragnionego dziedzica. Dopiero, gdy duch dobrego w�adcy opu�ci� leciwe cia�o, na �wiat przyszed� syn jego i jedyny nast�pca varanckiego tronu. Pogrobowiec otrzyma� imi� ojca, pragn�c by wszelkie �aski jakie sp�yn�y na wielkiego rodzica, sta�y si� udzia�em dziedzica korony. M�dro��, zwyci�stwo i d�ugowieczno�� � oto b�ogos�awie�stwa panowania Tellosa III.");

B_LogEntry(BookLog_HistoryOfVarant3,"Los jednak chcia� by tylko spo�r�d tych trzech b�ogos�awie�stw zyska� czwarty w�adca tego imienia. Z nadziej� poddani wyczekiwali dnia, w kt�rym m�ody kr�l przejmie samodzielne rz�dy, gdy� m�dro�� i wiedza ch�opca zapowiada�a b�ogos�awione panowanie. Mieli�my wielkich w�adc�w � powiada� pod�wczas lud Varantu � kt�rzy uczynili nasz kraj wielkim i pot�nym. Ten jednak pomno�y t� pot�g� jak nikt przed nim i Imperium Innosa si�gnie podn�y skutych lodem g�r Nordmaru!");

B_LogEntry(BookLog_HistoryOfVarant3,"W dziewi�tym roku regencji st�umiono powstanie Prave�czyk�w, kt�rzy pr�bowali oderwa� si� na powr�t od Innosyckiego Imperium. Pobito i zmuszono do odej�cia tak�e poga�skich Jelkal�w z p�nocnych las�w, kt�rzy wyszyli ze swych siedzib, by wesprze� bunt lud�w wybrze�a. Tak oto udzia�em tego panowania sta�o si� zwyci�stwo, kt�re wszyscy poczytywali za zapowied� przysz�ych pomy�lno�ci.�Nie dane jednak by�o Tellosowi IV spe�ni� pok�adanych w nim nadziei, gdy� w czternastym roku swego �ywota zapad� ci�ko na zdrowiu. Pono� zawa�y� tu ci�ki grzech jego rodzicielki � Nasiry, kt�ra wzgardziwszy pami�ci� swego zmar�ego m�a, odda�a swe serce jednemu z mo�nych pan�w Imperium. Bogowie ukarali niewiern� �on� �mierci� jej jedynego syna. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Tak oto przez wzgl�d na wielkie czyny potomk�w Tellosa IV, nie dane mu by�o ogl�da� ju� wi�cej sromoty jakiej dopu�ci�a si� jego rodzicielka. Zmo�ony chorob� i trawiony okropn� gor�czk� m�odziutki w�adca, odszed� do wieczno�ci, nie obj�wszy samodzielnych rz�d�w. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Na Tellosie IV wygas�a pradawna dynastia Akhelid�w, wywodz�ca si� od Wiecznego W�drowca. Dawni kr�lowie zasn�li b�ogos�awionym snem nieprzespanym, ��cz�c si� na wieki z Innosem � bogiem, kt�remu wszyscy oni s�u�yli.�Rozpacz niewys�owiona wla�a si� w serca dumnego ludu Varantu. Oto odeszli panowie przyrodzeni, w�adcy nasi i opiekunowie! � m�wili Varantczycy - Kt� nad nich by� wy�szy i kt� im r�wnym by� mo�e?");

B_LogEntry(BookLog_HistoryOfVarant3,"KONIEC TOMU III");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant4 (C_ITEM)

{

name ="Dzieje Varantu. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant4;

};

FUNC VOID Use_Book_HistoryOfVarant4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant4,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant4,"Dzieje Varantu. Tom IV");

B_LogEntry(BookLog_HistoryOfVarant4,"Smutek i �a�oba po �mierci m�odziutkiego pogrobowca, niebawem ust�pi�y szcz�kowi or�a i wojennej po�odze. Oto wy�onili si� kolejni pretendenci, ksi���ta, panowie, kt�rzy topi�c kraj we krwi walk pobratymczych, wyr�bywali sw� drog� do ber�a Varantu. Wygran� mia�a by� tutaj upragniona korona dla jednego z pan�w varanckich, a cen� za ambicj� mo�nych p�aci�o Imperium i sami Varantczycy. Ile� to z�a wywo�a� jeden post�pek niewiernej kr�lowej Nasiry!");

B_LogEntry(BookLog_HistoryOfVarant4,"Niebawem w wielkiej ha�bie od Imperium odpad�o Praven, kt�re niegdy� Tellos III zdoby� i przyprowadzi� pod o�tarz Innosowy. Barbarzy�cy dokonali rzezi Mag�w Ognia i rozbili �wi�te pos�gi, bezczeszcz�c �wi�tynie i oddaj�c owe �wi�te przybytki poga�skim ba�wanom. Najazd Jelkal�w, Sundmarczyk�w i Guldern�w nawiedzi� ziemie Veluki, straszliwie je pustosz�c. Dzi�ki �asce Innosa osta�o si� jednak miasto, w kt�rym przed ostrzem barbarzy�cy schroni�o si� wielu. Warowni veluckiej, kt�ra w przysz�o�ci otrzyma imi� Monteriusa, a zdobytej niegdy� przez Semmira III, broni� patriarcha innosycki Mergellon, co bratem by� niewiernej kr�lowej.�");

B_LogEntry(BookLog_HistoryOfVarant4,"Nasta�y straszliwe lata wojen i po�ogi. Oto Innosyta morduje Innosyt�, czyni�c to z r�wn� zaciek�o�ci� i okrucie�stwem, jakoby czyni� to barbarzy�ca. Ujrza�y s�abo�� Varantu poga�skie plemiona i jak hieny ruszy�y na ranionego lwa, by na jego ciele urz�dzi� sobie uczt�. I nie by�o krainy w Imperium, gdzie by nie s�yszano rogu poprzedzaj�cego poch�d wszelakiego barbarzy�cy. Owe plemiona przybywa�y nie tylko wiedzione ��dz� z�ota, ale te� wzywali ich liczni pretendenci.");

B_LogEntry(BookLog_HistoryOfVarant4,"Mo�ni pragn�c wykorzysta� barbarzy�c�w w walce o ber�o Varantu, op�acali ich nie z�otem ze swych skarbc�w, lecz krwi� i cierpieniem poddanych Imperium. Chcecie z�ota i zap�aty, to we�cie j� z varanckich wiosek i miast!�Niechaj przekl�ci b�d� ksi���ta, co �yciem Innosyt�w kupczyli. Niechaj przekl�ci b�d� mo�ni panowie, co lud sw�j na pastw� barbarzy�cy wydali�");

B_LogEntry(BookLog_HistoryOfVarant4,"Magowie Ognia widz�c ogie�, jaki zap�on�� w Varrancie postanowili ukry� relikwie Adanosa w swych �wi�tyniach, by ni poganie, ni pretendenci do tronu ich sw� r�k� nie sprofanowali i do boju bratob�jczego nie wykorzystali. Wszeteczni pretendenci gotowi byli jednak wyci�gn�� swe nieczyste r�ce po relikwie Adanosa, kt�re niegdy� Pan Wody powierzy� Akheldowi I. Ci przyprowadzali swe wojska przed bramy miast �wi�tynnych, zbrojnie pr�buj�c zmusi� m��w Innosa do wydania �wi�tych artefakt�w, lecz bram �wi�tynnych nie przemogli.");

B_LogEntry(BookLog_HistoryOfVarant4,"Tak mija�y lata pe�ne niepokoju i wojen, wyniszczaj�cych Imperium Varantu. Pa�stwa b�d�cego dzie�em Innosa i jego wybra�c�w�");

B_LogEntry(BookLog_HistoryOfVarant4,"KONIEC TOMU IV");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM V

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant5 (C_ITEM)

{

name ="Dzieje Varantu. Tom V";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant5;

};

FUNC VOID Use_Book_HistoryOfVarant5()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant5,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant5,"Dzieje Varantu. Tom V");

B_LogEntry(BookLog_HistoryOfVarant5,"Wojny trwa�y d�ugo. Spustoszono kraje Varantu, zasiano ziarno podzia�u zatruwaj�cego krew pobratymcz�. W tych latach �mier� zebra�a nadzwyczaj sowite �niwo na ziemiach Imperium i na d�ugo zamilk�y hymny pochwalne na cze�� Innosa, ust�puj�c b�agalnym i pokutnym pie�niom. Nie godzi si� kala� kart tej ksi�gi imionami tej rzeszy mo�nych, kt�rzy tyle nieszcz�� na kraj sw�j sprowadzili. Niechaj te� imi� owego wszetecznika, z kt�rym kr�lowa dopu�ci�a si� sromu, b�dzie po wszystkie czasy zapomniane, co by w �adnej modlitwie ono nie pad�o.");

B_LogEntry(BookLog_HistoryOfVarant5,"Min�o 12 lat ci�kiej wojny, gdy na stolicy zasiad� imperator. Du�o by opowiada� o tym, co dzia�o si� w czasach wojen. Do�� rzec, �e na tronie zasiad� cz�owiek roztropny i m�dry. On to odrzuci� swe stare imi� i koronowa� si� jako Akheld III. Uczyni� on to na znak tego, �e jak pierwsi Akhelidzi budowali o�tarz Pana Ognia, tak on go odnawia i do pot�gi zamierza przywr�ci�. Godny to czyn i pe�ny pokory, gdy� w�adca �w postanowi� budowa� chwa�� Imperium, nie za� s�aw� swego imienia, czy rodu. Odrzuciwszy przeto imi� grzeszne i krwi� pobratymcz� skalane, da� pocz�tek dynastii Odnowicieli. Akheld III panowa� 27 lat, przywracaj�c �ad tam, gdzie smuta porz�dek zburzy�a.");

B_LogEntry(BookLog_HistoryOfVarant5,"Po nim panowa� jego syn co Kalhirem Obro�c� zosta� przezwany, albowiem powstrzyma� najazd barbarzy�c�w z Praven, p�ac�c za zwyci�stwo w�asnym �ywotem. Podania g�osz�, �e w przededniu bitwy mia� widzenie. Ujrza� on Wiecznego Wedrowca, dzier��cego w jednej r�ce tarcz�, a w drugiej wag�. Kalhir us�ysza�, �e dopiero jego w�asna krew u�y�niaj�ca pola wok� Trellium, zapewni dwadzie�cia lat pokoju od napad�w barbarzy�c�w z wybrze�a. Maj�c w pami�ci s�owa za�o�yciela Imperium Varanckiego, Kalhir nazajutrz poprowadzi� swych �o�nierzy do boju.");

B_LogEntry(BookLog_HistoryOfVarant5,"W czasie walk, szala zwyci�stwa przechyli�a si� na stron� Prave�czyk�w, tak, �e doradcy pocz�li namawia� w�adc�, do tego by opu�ci� pole bitwy. Ten si� jednak stanowczo si� sprzeciwi� tym radom. Wiedz�c, �e wygrana bitwa zapewni pok�j Imperium, zebra� swych rozproszonych �o�nierzy i ruszy� do ataku, w czasie kt�rego poleg�. Bitwa pozostawa�a nierozstrzygni�ta, gdy� obie strony poni�s�szy dotkliwe straty, poniecha�y dalszej walki.");

B_LogEntry(BookLog_HistoryOfVarant5,"Proroctwo jednak si� wype�ni�o i przez dwadzie�cia trzy lata ziemie Varantu nie widzia�y najazdu Prave�czyk�w.");

B_LogEntry(BookLog_HistoryOfVarant5,"KONIEC TOMU V");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant6 (C_ITEM)

{

name ="Dzieje Varantu. Tom VI";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant6;

};

FUNC VOID Use_Book_HistoryOfVarant6()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VI");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant6,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant6,"Dzieje Varantu. Tom VI");

B_LogEntry(BookLog_HistoryOfVarant6,"Trzecim spo�r�d w�adc�w z dynastii Odnowicieli by� Kalhir II, syn Kalhira I Obro�cy. Ten powi�d� raz jeszcze syn�w Varantu w kraj Prave�czyk�w i wydar� im zachodni� cz�� wybrze�a, gdzie wybudowa� warowny gr�d w Trellium. Pragn�� te� ruszy� dalej, ku Jelkali i Nordmarowi, jednak mo�ni wyra�nie si� temu sprzeciwiali, gdy� pragn�li pokoju i obawiali si� wzrostu znaczenia imperatora.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nowa dynastia nie mia�a jednak r�wnie silnej pozycji, co Akhelidzi. Mo�ni panowie pragn�li widzie� w Odnowicielach jedynie wyniesionych na wy�yny mo�now�adc�w. Czynili przeto owym kr�lom wiele wstr�t�w i ci�gle knuli przeciwko nim. ");

B_LogEntry(BookLog_HistoryOfVarant6,"M�ody Kalhir, pragn�c przywr�ci� imperatorom poprzednia pot�g�, zwr�ci� si� wtedy do kap�an�w ognia by ci wydali mu �wi�te relikwie Adanosa. Pragn�� dzi�ki mocy owych artefakt�w, zmusi� mo�now�adc�w do pos�uchu. �wi�tobliwi magowie odm�wili jednak ambitnemu w�adcy, gdy� nie takie by�o przeznaczenie daru Adanosa. Od wiek�w artefakty by�y otaczane �wi�tobliw� czci� i takie pos�u�enie si� nimi mia�oby wymiar �wi�tokradztwa.");

B_LogEntry(BookLog_HistoryOfVarant6,"Kalhir uzna� przeto, �e Magowie Ognia r�wnie� d��� do os�abienia pozycji kr�la. Pos�dza� te� ich o ch�� przej�cia realnej w�adzy w pa�stwie i o wsp�prac� z mo�now�adcami. Imperator powoli zacz�� sk�ania� si� ku kultowi Adanosa, w magach wody szukaj�c przeciwwagi dla pot�gi kap�an�w Innosa. Pojawi�y si� nawet g�osy, �e kr�l zamierza odebra� najwa�niejsze �wi�tynie magom ognia i przekaza� je Adanosytom. Staraj�c si� pomniejszy� pot�g� Innosyt�w, zacz�� domaga� si� udzia�u w wyborze innosyckich arcymag�w.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie Ognia t�umaczyli kr�lowi, �e jest to wbrew prawom i obyczajom, lecz w�adca nie s�ucha� m�dro�ci kap�an�w, lecz wola� polega� na radach nierozumnych ludzi.�Sp�r maj�cy doprowadzi� do upadku w�adcy rozgorza� dopiero po �mierci arcymaga Salima, kiedy to kr�l samowolnie nama�ci� Ragheba na nast�pc� pierwszego spo�r�d kap�an�w Innosa. Tak oto Kalhir II przeciw prawom �wi�tym wyst�pi�, pragn�c w miejsce regu� tradycj� u�wi�conych, tyra�sk� sw� wol� zaprowadzi�.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nie zwa�aj�c na napomnienia i przestrogi, kt�rych dobrzy doradcy i �wi�ci m�owie mu nie szcz�dzili, ��dz� kr�l za�lepiony, trwa� w swym szale�stwie. Dusza jego pomys� wnet przebieg�y zrodzi�a. Postanowi� Kalhir mag�w do swego pa�acu zaprosi�, co by z nimi pertraktowa� i zgod� osi�gn��. Kaza� wi�c w�adca rozes�a� pisma do �wi�tych m��w, prosz�c ich o przybycie.�Magowie Ognia pr�dko spisek w tym dostrzegli. Zebrawszy si� na naradzie, r�nie pragn�li czyni�. Najzacieklejsi w kr�lu heretyka ju� dostrzegli i przeciw niemu radzili si� ju� sposobi�.");

B_LogEntry(BookLog_HistoryOfVarant6,"Drudzy przed pochopno�ci� ostrzegali i mi�dzy odmow� przybycia, a innym miejscem spotkania si� stawiali. G�os zabra� przeto mag Udin, co dot�d w milczeniu s�owom swych braci si� przys�uchiwa�:��Kt� z nas we�mie na siebie krew? W�adca nasz kroczy �cie�k�, by dotrze� niebawem tam, sk�d nie b�dzie ju� powrotu. Oto Kalhir jeszcze raz za si� spogl�da, w czym odmiana jego drogi by� mo�e. Czy� zdradziecki zamiar si� za tym kryje? Serce jego przed oczyma naszemi zakryte, lecz kt� zdrajc� b�dzie, je�eli ostatniej pr�by ratowania pokoju, Wiary i kr�lestwa si� nie podejmiemy! Odm�wimy go�ciny w jego pa�acu? Tedy� on ku nam w go�cin� przyb�dzie, wojska swe na �wi�tynne miasto prowadz�c! Przyb�dziemy na wezwanie do jego pa�acu? Tedy� on b�dzie mia� �wi�ty zakon Mag�w Ognia w swej tyra�skiej mocy! Trzech przeto braci po�r�d nas wybierzmy i niechaj oni w imieniu �wi�tyni przed Kalhirem przemawiaj�!�.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie przychylili si� do s��w Udina, wysy�aj�c jego oraz dw�ch wybranych po�r�d zgromadzenia. Trzej stawili si� przeto przed obliczem kr�la. W zapami�taniu swym Kalhir za��da�, by po wszystkie czasy, to kr�lowie arcymag�w mianowali, jako urz�dnik�w kr�lewskich i dworak�w si� mianuje.");

B_LogEntry(BookLog_HistoryOfVarant6,"W�adca oszala�y, wzgardziwszy zgod�, g�uchym by� na g�os �wi�tych m��w Innosa. W pa�acu swym uwi�ziwszy Udina i jego towarzyszy, obleg� on �wi�tyni�, kt�r� wcze�niej zarz�dza� Salim, ��daj�c by Magowie Ognia uznali uzurpatora nowym arcymagiem. Wiedziano jednak, �e Kalhir nie pragnie wcale pokoju i sp�r ten jest cz�ci� planu zdobycia relikwii Adanosa.�Kap�ani wezwali przeto lud do obrony �wi�tego przybytku. Wykl�to jednocze�nie doradc�w kr�la, kt�rych obwiniano o namawianie w�adcy do tych szale�czych czyn�w.");

B_LogEntry(BookLog_HistoryOfVarant6,"Varant odpowiedzia� na wezwanie kap�an�w. D�ugo jeszcze ludzie przychodzili do kr�la b�agaj�c go by zaniecha� dzia�a� g�upich i nie sprowadza� zguby na pa�stwo. Na nic jednak b�agania i namowy, wobec pychy za�lepiaj�cej serce Kalhira. Tak oto rozpocz�a si� wojna, kt�rej koniec wi�d� pod mury stolicy.");

B_LogEntry(BookLog_HistoryOfVarant6,"KONIEC TOMU VI");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant7 (C_ITEM)

{

name ="Dzieje Varantu. Tom VII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant7;

};

FUNC VOID Use_Book_HistoryOfVarant7()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant7,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant7,"Dzieje Varantu. Tom VII");

B_LogEntry(BookLog_HistoryOfVarant7,"Walki trwa�y d�ugo. Powstali synowie Varantu przeciw sobie, jedni przy kr�lu swym, inni przy kap�anach. Do�� rzec, �e Kalhirowi wielu dobrych ludzi pocz�tkowo s�u�y�o, lecz z czasem go odst�powali, gdy� na jego czyny godzi� si� nie mogli. Podobnie przy �wi�tyni, obok szczerych wyznawc�w Innosa, stan�li ci, kt�rym silna w�adza kr�lewska przykr� zawsze by�a. Powoli jednak szala zaczyna�a przechyla� si� na stron� Mag�w Ognia i ich sojusznik�w.");

B_LogEntry(BookLog_HistoryOfVarant7,"W poszukiwaniu sprzymierze�c�w Kalhir zwr�ci� si� do plemion barbarzy�skich, wysy�aj�c do nich swych wiernych ludzi z obietnic� skarb�w i zach�caj�c ich do �upienia przygranicznych posiad�o�ci mo�now�adc�w.�Wojna jednak zaprowadzi�a wojska �wi�tyni a� pod mury stolicy w Al-Shedim, gdzie musia� si� chroni� �wi�tokradca. Obl�ony w swym zamku przez Varantczyk�w Kalhir, wyczekiwa� przybycia wiernych mu ostatnich oddzia��w varanckich. Wierni mu dow�dcy mieli przyprowadzi� ze sob� r�wnie� najemnik�w z poga�skich plemion p�nocy. W�adca zdawa� sobie spraw�, �e jego panowanie jest zagro�one. Z ka�d� kolejn� kl�sk�, topnia�a w nim zaciek�o�� i wola walki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Wreszcie Kalhir postanowi� wezwa� przed swe oblicze Udina oraz dw�ch towarzysz�cych mu mag�w. �wi�ty m�� przem�wi� jednak do swego w�adcy tymi s�owami:��Przybyli�my jako pos�a�cy pokoju i zgody, a stali�my si� wi�niami kr�la Varantu, lecz i imperator dzi� jest uwi�ziony. Czterech m��w to wi�niowie, lecz tylko jeden gniewu bog�w winien si� obawia�! By� dawniej czas wyboru, lecz wyb�r dokonany czynami kr�la zosta� przypiecz�towany...�");

B_LogEntry(BookLog_HistoryOfVarant7,"Ujrza� wtedy Kalhir, �e nie ma ju� drogi powrotnej. Wojna zatru�a krew pobratymcz�, a kr�l sprowadzaj�c na sw�j kraj barbarzy�c�w sta� si� w oczach wielu swych poddanych renegatem. Oto �wi�tynia w triumfach swych podesz�a a� pod mury stolicy, a wojska jej i kap�ani pragn� z�o�y� go z�ama�. Za rad� fa�szywego arcymaga, Ragheba, postanowi� Kalhir zdoby� si� na czyn straszliwy. Ku Praven swe oczy przeto zwraca, nie z mieczem w d�oni, lecz z nadziej� pomocy ze strony barbarzy�cy. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Pos�a� monarcha do swych dawnych wrog�w propozycj� przymierza, wydarte im niegdy� przez niego Trellium obiecuj�c w zamian. Tak oto ziemie przywiedzione przez Kalhira II do o�tarza Innosa, ten sam Kalhir na pastw� barbarzy�c�w wydawa�.");

B_LogEntry(BookLog_HistoryOfVarant7,"Praven odpowiedzia�o na wezwanie imperatora i ruszy�o w granic� Kr�lestwa Innosa. Na rozkaz Kalhira wi�kszo�� garnizonu pod wodz� Omrana opu�ci�a twierdz� trellijsk�, lecz cz�� �o�nierzy odm�wi�a uczynienia tego i zamkn�a si� w zamku. Owi wierni synowie varanckiej ziemi skupili si� wok� najstarszego z nich rang�, dobrego Sargona Tarczownika. Rozsierdzi�o to wielce barbarzy�c�w, kt�rzy zakrzykn�wszy �Zdrada!�, rzucili si� na opuszczaj�cych twierdz� �o�nierzy Omrana. Sam dow�dca garnizonu nie uszed� rzezi, jak� zgotowali mu �sojusznicy�.");

B_LogEntry(BookLog_HistoryOfVarant7,"Naje�d�cy rozpocz�li obl�enie warowni, kt�ra bohatersko broni�a si� przez cztery ksi�yce. Z tego te� powodu wi�ksza cz�� Prave�czyk�w zosta�a na p�nocy, gdzie oblega�a Trellium i nie ruszy�a z kr�lewskimi wojskami na odsiecz imperatorowi. Cz�� jednak z barbarzy�skich sprzymierze�c�w kr�la, wesp� z najemnikami i oddzia�ami wiernymi Kalhirowi ruszy�a ku murom Al-Shedim.�Odsiecz, b�d�ca jedyn� nadziej� kr�la, nie zdo�a�a przerwa� obl�enia i przebi� si� do zamku. Stolica zosta�a niebawem zdobyta, a kr�la wydano triumfuj�cym Varantczykom.");

B_LogEntry(BookLog_HistoryOfVarant7,"Pojmany Kalhir czeka� mia� na wyrok mag�w, zamkni�ty w areszcie w jednej ze �wi�ty�. W zdobytym zamku nie odnaleziono jednak fa�szywego arcymaga � Regheba. Po upadku w�adcy, kt�ry pr�bowa� wynie�� Regheba na miejsce nie przystoj�ce temu cz�owiekowi, uciekinier nie stanowi� ju� jednak zagro�enia.");

B_LogEntry(BookLog_HistoryOfVarant7,"Uwolniony Udin sta� si� bohaterem i jako taki, zosta� wybrany przez m��w Innosa arcymagiem. Pozostawa� jeszcze problem obl�onego Trellium i grasuj�cych po Varancie band, kt�re na wie�� o kl�sce Kalhira, odrzuci�y dow�dztwo genera��w i powr�ci�y do swych siedzib na p�nocy, po drodze bior�c je�c�w i �upy. Genera�owie i pozostali jeszcze przy nich �o�nierze od��czyli si� od tego pochodu, lecz wnet zostali rozbici przez wojska Varantu. Niebawem te� Varantczycy przybyli z odsiecz� obro�com Trellium, pobijaj�c Prave�czyk�w w bitwie.�");

B_LogEntry(BookLog_HistoryOfVarant7,"Po powrocie do stolicy, postanowiono zdetronizowa� Kalhira II. Jednocze�nie kr�lem Varantu okrzykni�to Tizgara, brata ust�puj�cego w�adcy. Samego te� Kalhira uznano za przekl�tego i skazano na wieczne wygnanie. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Kalkhir Przekl�ty wraz z kilkoma swymi s�ugami uda� si� wtedy ku g�rom na wschodzie, gdzie w�r�d tamtejszych plemion mia� sp�dzi� reszt� �ycia. Jemu to tamtejsze ludy zawdzi�czaj� przyj�cie kultu Adanosa, kt�remu do Kalhir po kres swoich dni pozosta� wierny. Cz�owiek ten nigdy ju� nie pojawi� si� w Varancie, cho� raz jeden spotka� si� ze swoim bratem, kr�lem Tizgarem, lecz nawet wtedy �aden z braci nie przekroczy� granicznej rzeki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Potomkowie Kalhira II Przekl�tego mieli po wielkim potopie zej�� z g�r i zasiedli� ca�y pustynny ju� Varant. Tak oto sta� si� on protoplast� dzisiejszych mieszka�c�w po�udniowej cz�ci Kontynentu Myrtany. Jemu te� Varant zawdzi�cza adanosycki charakter tej krainy, gdy� potomkowi Kalhira, podobnie jak on sam byli wyznawcami Pana Wody. O ile wi�c Pradawni zwali Kalhira Przekl�tym, o tyle Koczownicy wol� go nazywa� Kalhirem Praojcem.");

B_LogEntry(BookLog_HistoryOfVarant7,"KONIEC TOMU VII");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VIII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant8 (C_ITEM)

{

name ="Dzieje Varantu. Tom VIII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant8;

};

FUNC VOID Use_Book_HistoryOfVarant8()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VIII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant8,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant8,"Dzieje Varantu. Tom VIII");

B_LogEntry(BookLog_HistoryOfVarant8,"Nast�pc� Kalhira Przekl�tego by� Tizgar zwany Chromym. By� on cz�owiekiem �wiat�ym i wykszta�conym, gdy� przez wzgl�d na starsze�stwo Kalhira i wrodzone kalectwo, nie chowano go na kr�la, ino na maga. �wi�tym m�om te� tron zawdzi�cza�, gdy� po upadku Kalhira Przekl�tego, niekt�rzy mo�ni pragn�li ha�b� upad�ego na ca�y r�d kr�lewski rozci�gn�� i od w�adzy dynasti� t� odsun��. Tak te� chcieli niekt�rzy magowie, lecz roztropny Udin przejrza� zamiary mo�now�adc�w i do rzeczy podobnych nie dopu�ci�.");

B_LogEntry(BookLog_HistoryOfVarant8,"Tizgar okaza� si� w�adc� dobrym i m�drym. Wyrzek� si� drogi swego brata i po wszystkie czasy uczyni� kap�an�w ognia stra�nikami relikwii, kt�re niegdy� zapewni�y Semmirowi I zwyci�stwo nad hordami Beliara. Nowy kr�l troszczy� si� o kult Innosa, wspieraj�c misje na ziemie barbarzy�c�w. On te� rozpocz�� budow� �wi�tyni w Veluce, ku przeb�aganiu za grzechy brata i krew przelan� w walkach o tron przez swego dziada.�Nie m�g� on podejmowa� wypraw wojennych na pogan, gdy� w�adz� kr�lewsk� zasta� on s�absz� ni� poprzednicy jego. Ile� mu wstr�t�w mo�ni czynili! Dzi�ki jego jednak staraniom podnoszono kraj z ruiny, za� na zgliszczach odradza�o si� z wolna to, co wojna odebra�a. Po okresie wojen na ziemiach na po�udnie od Zatoki Prave�skiej zapanowa� upragniony pok�j. Jedynie p�nocne rubie�e kr�lestwa wci�� by�y trapione przez zwyczajowe ju� najazdy barbarzy�c�w.");

B_LogEntry(BookLog_HistoryOfVarant8,"Za spraw� Tizgara Chromego wydano wiele sprawiedliwych praw, kt�re na r�wni z dzie�em odbudowy kraju, uczyni�y posta� tego kr�la, tak mi�� sercu trzech kronikarzy, spisuj�cych jego histori�. Do jego niew�tpliwych zas�ug nale�y te� utrzymanie jedno�ci pa�stwa, zagro�onej przez ambicje mo�nych. By�by wi�cej on zapewne dobrego uczyni� i by� mo�e, panuj�c w kraju niezniszczonym wojn�, zas�u�y� sobie na przydomek �Wielki�, lecz nie spos�b odpowiedzie� jednoznacznie na to pytanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"Kr�l ten w zwyczaju mia� wieczory sp�dza� s�uchaj�c �piewu s�owik�w w swych pa�acowych ogrodach. Dnia pewnego, do�ywszy ju� s�dziwego wieku, usn�� racz�c si� ow� ukochan� melodi�. Zasypiaj�c, zapad� wtenczas w sen wieczny. Tak� oto pociech� bogowie os�odzili poczciwemu kr�lowi wiek starczy i przemijanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"M�� �w pobo�ny nie zostawi� po sobie syna, wi�c w�adz� po nim przej�li potomkowie wuja Akhelda III zwanego Tufailem, a od zamku przez nich posiadanego nazwani Mussanitami. Niemniej ich w�adza nie dor�wnywa�a w�adzy Akhelid�w i Odnowicieli, albowiem wyniesieni spo�r�d mo�nych, nie mieli podobnego powa�ania ludu jak poprzednia dynastia. Pierwszym kr�lem z dynastii Mussanit�w by� Nelzar I, kt�ry po �mierci Tizgara wst�pi� na tron.");

B_LogEntry(BookLog_HistoryOfVarant8,"KONIEC TOMU VIII");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IX

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant9 (C_ITEM)

{

name ="Dzieje Varantu. Tom IX";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant9;

};

FUNC VOID Use_Book_HistoryOfVarant9()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom IX");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant9,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant9,"Dzieje Varantu. Tom IX");

B_LogEntry(BookLog_HistoryOfVarant9,"Nie godzi� si� jednak Nelezar, aby emirowie mu dyktat czynili, tote� pragn�� wzmocni� swe panowanie. Na podobie�stwo poprzedniego w�adcy zdecydowa� otacza� si� pobo�nymi kap�anami Innosa, w kt�rych Tizgar odnajdywa� za swych rz�d�w wsparcie. Nelzar doko�czy� rozpocz�t� przez poprzednika budow� wspania�ej �wi�tyni Innosa w Veluce. Zwie�czone dzie�o sk�oni�o m�odego w�adc� do snucia wizji nawr�cenia poga�skich szczep�w, zamieszkuj�cych ziemie na p�noc od Zatoki Prave�skiej.");

B_LogEntry(BookLog_HistoryOfVarant9,"Imperium oddane przez Tizgara nast�pcom, nie by�o ju� tym pogorzeliskiem wycie�czonym wojn� domow�. My�l o wyprawie wojennej i ostatecznym za�egnaniu zagro�enie ze strony Prave�czyk�w, cieszy�a si� aprobat� m�odego i ambitnego arcymaga Kalido, widz�cego w tym okazj� do umocnienia pozycji kap�an�w Innosa. W ci�gu swego panowania Nelzar poprowadzi� ��cznie pi�� wypraw na Praven, ostatecznie lu�no uzale�niaj�c kraj ten od Imperium. Nie uda�o si� jednak zaprowadzi� w kraju tym wiary w Innosa, za� wszelkie pr�by uczynienia tego ko�czy�y si� �mierci� kap�an�w, lub wybuchem buntu i kolejn� wypraw� wojenn�. Porzucono wi�c starania o nawr�cenie Prave�czyk�w, zadawalaj�c si� jedynie danin� i bezpiecze�stwem od atak�w ze strony tego ludu barbarzy�skiego.");

B_LogEntry(BookLog_HistoryOfVarant9,"Kres d�ugiego panowania Nelezara I przyni�s� kolejne niepokoje, albowiem przeciw nast�puj�cemu po zmar�ym Semmirowi III wyst�pi� jego przyrodni brat z �o�a nieprawego. Ohyda jego czynu skaza�a zdrajc� na zapomnienie, tote� imi� jego zostanie przemilczane. Odst�pca zyska� wsparcie wielu mo�nych, kt�rzy znale�li w tym pretekst do wyst�pienia przeciw w�adzy kr�la. Sta�o si� tak, �e Semmir musia� zbiega� z zagro�onej stolicy do dworu w Mussan, a Al Shedim zasiad� uzurpator. �aska Innosa �wieci�a jednak nad prawowitym kr�lem i ten niebawem zrzuci� zdrajc� z tronu.");

B_LogEntry(BookLog_HistoryOfVarant9,"Cena sporu by�a jednak ogromna, albowiem za�ama�a si� w�adza centralna. Od tej chwili w�adca Wielkiego Imperium Varanckiego sta� si� jedynie nominalnym zwierzchnikiem emir�w, za� jego rz�dy ogranicza�y si� do teren�w przyleg�ych do stolicy w Al Shedim. W obliczu zawieruchy, w�adz� zwierzchni� Varantu zrzucili Prave�czycy, kt�rzy na nowo zacz�li naje�d�a� pogranicze...");

B_LogEntry(BookLog_HistoryOfVarant9,"KONIEC TOMU IX");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM X

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant10 (C_ITEM)

{

name ="Dzieje Varantu. Tom X";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant10;

};

FUNC VOID Use_Book_HistoryOfVarant10()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom X");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant10,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant10,"Dzieje Varantu. Tom X");

B_LogEntry(BookLog_HistoryOfVarant10,"W czasach pierwszych Mussanit�w na po�udniu zal�g�y si� stworzenia, kt�re przep�dzone przez Akhelda I, zn�w rozpostar�y mrok w swych dawnych siedzibach. I rozleg�y mod�y ku czci Beliara i demon�w jego w krainach, a �piewy obrazoburcze na ha�b� Innosa si� w gnie�dzie tym, w Eresh-Ugall na nowo zal�g�y. Czym�e by� wtedy Varant rozbity na w�adztwa udzielnych emir�w? Kr�la w�adza w stolicy uwi�ziona, za� jedynym spoiwem dawnej jedno�ci stali si� Magowie Ognia, tak przez imperatora wspierani.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wnet jednak emirowie poznali si�, �e przez m��w Innosyckich kr�l wzmacnia swe w�adanie. Wywy�szyli wi�c mag�w wody ponad czcicieli ognia, by ci ostoj� ich panowania si� stali. Semmir dwadzie�cia lat swe rz�dy monarsze sprawowa�, wyprawiaj�c si� bez zwyci�stwa dwa razy na Prave�czyk�w.");

B_LogEntry(BookLog_HistoryOfVarant10,"Po nim nasta� syn jego Asmatila. Syn Semmirowy znalaz� sojusznika w Troghdanie jednym spo�r�d wodz�w p�nocnych, kt�ry przyj�� wiar� z r�k Ko�cio�a Innosyckiego i namaszczony na kr�la wszystkich Jelkal�w najecha� wesp� z kr�lem ziemie emir�w, czyni�c sobie na powr�t poddanymi emir�w Tahira i Dakhusa. L�kaj�cy si� o swe panowanie pozostali emirowie zawi�zali wtedy spisek niecny i wyst�pili przeciwko imperatorowi, daj�c pocz�tek nowej wojnie, kt�ra sprowadzi�a na Varant naje�d�c�w z p�nocy.");

B_LogEntry(BookLog_HistoryOfVarant10,"W niej to si�y zjednoczone pod ber�em Asmatili wspierane by�y przez jelkalskie posi�ki kr�la Troghdana i Dhirimijczyk�w, za� buntownicy pod wodz� emira Nelacha prowadzili u swego boku Prave�czyk�w.");

B_LogEntry(BookLog_HistoryOfVarant10,"Dwa lata armie kr�lewskie i emirowskie czyni�y spustoszenie na ziemiach Varantu, by po nierozstrzygni�tej bitwie przyzna� znaczniejszym emirom tytu�y kr�lewskie, a mniejszym Panom ksi���ce. Przy Asmatili mia�y pozosta� dotychczas zdobyte ziemie i nominalne prawo do rozs�dzania spor�w mi�dzy emirami.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wielki kr�l nie zrezygnowa� jednak z planu zjednoczenia w�adztwa Innosyckiego i ju� po smierci emira Vinkila w Kaldhice i wst�pieniu na tron brata zmar�ego, wyruszy� z wypraw� maj�c� na celu osadzenie tam wygnan� kr�low� i pogrobowca.");

B_LogEntry(BookLog_HistoryOfVarant10,"L�kaj�cy si� o swe panowanie emir Salim, wezwa� wi�c na pomoc ork�w, kt�rymi te� obsadzi� sw�j zamek. Wyprawa kr�lewska zosta�a odparta, a Asmatila by� zmuszony powr�ci� do Al Shedim, uwo��c ze sob� wdow� i pogrobowca. Emir Salim niebawem w ohydnym czynie wygna� ze swojego miasta kap�an�w Innosa i w ich miejsce sprowadzi� czarnych mag�w. Za jego potwornym uczynkiem cie� pad� na Khaldik� i pogr��y� si� ona beliaryckim b��dzie.");

B_LogEntry(BookLog_HistoryOfVarant10,"KONIEC TOMU X");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant11 (C_ITEM)

{

name ="Dzieje Varantu. Tom XI";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant11;

};

FUNC VOID Use_Book_HistoryOfVarant11()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom XI");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant11,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant11,"Dzieje Varantu. Tom XI");

B_LogEntry(BookLog_HistoryOfVarant11,"I nasta� czas walki, kiedy to Varant �y�nia� krwi� Beliara i Innosa. Na satrap�w, co w swym blu�nierstwie kr�lami si� mienili, spad� gniew Innosa r�kami barbarzy�cy wymierzony. Szala� wi�c lud pierwotny, co swe siedziby mia� na p�nocy Zatoki Prave�skiej.");

B_LogEntry(BookLog_HistoryOfVarant11,"Sprawiedliwo�ci na emirach dopomina� si� Gorghian prowadz�cy dzielnych Jelkal�w. �w panowa� w Gocie po bracie swym Troghdanie, a cho� niecnie tron zdoby�, dzielnym w�adc� i pos�usznikiem Innosa si� okaza�. Z p�nocnych puszcz Dhirim, wyjawi�o si� poga�scy Dhirmijczycy z Guldern, co niesprzymierzeni z kr�lem, na wz�r Prave�czyk�w biczem bo�ym si� jawili. Czy prawd� jest li to, �e ludzie Zatoki w przymierze z plugastwem Beliarowym weszli? Skromny kap�an nie rozs�dzi. Krew la�a si� strumieniami na wszystkich granicach, by niczym rzeka jednocz�ca strumienie, imperium do jedno�ci przywo�a�. Kolejni satrapowie do przyja�ni z kr�lem przychodzili, by odeprze� Prave�czyk�w i g�rniczych Guldern�w. Wielki Kr�l zatrzyma� lud ze wschodu i Guldernijc�w do przyja�ni nak�oni�. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Wzesz�o wi�c ponownie s�o�ce nad zjednoczonym Imperium. Nie by�a to jednak si�a Akhelid�w i Odnowicieli, albowiem nie jeden satrapa, uznaj�c w�adz� Al Shedim, wci�� kr�lem si� mieni�. Rodzi�o si� nowe pa�stwo, kt�re podobnie jak �ycie ludzkie w b�lach na �wiat przychodzi. Mierzyli si� wi�c Beliaryci z Innosytami, a �aden nie by� w stanie zniszczy� drugiego. Innos przem�wi� do swych s�ug: � Wznie�cie dla mnie portal, abym m�g� rz�dzi� w tej cz�ci �wiata przez ca�� wieczno��.� I Jego s�udzy spe�nili to ��danie. Podobnie uczynili Beliaryci, wznosz�c portal dla swego boga. Asmatila rozkaza� te� wynie�� artefakty Adanosa ze �wi�ty�, albowiem chcia� ich u�y� przeciw wrogowi. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Usta�y wtedy wielkie bitwy i jedynie drobne potyczki na granicach przypomina�y o trwaj�cej wojnie. Beliaryci pierwsi wznie�li sw�j portal i sprowadzili na �wiat bestie Beliara pod wodz� pot�nego najstarszego ze smok�w. Wkr�tce obie armie spotka�y si� na granicach, gdzie mia�a si� rozstrzygn�� wojna bog�w. Armii Varantu towarzyszy�y posi�ki z Guldern, Jelkali, a nawet z Vengardu. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Orkowie, jaszczuroludzie i bestie Beliara na czele ze smokami zwerbowali nie tylko gobliny, ogry i shraty, ale te� pot�ne trolle. Oba wojska sta�y przed sob� twarz� w twarz, za� kap�ani obu stron odprawiali kolejne przedbitewne obrz�dy ku czci swych bog�w. Wnet rytualne tr�by zamilk�y, ust�puj�c wojskowym rogom daj�cym sygna� do walki. Dzikie  hordy na czele z trollami ruszy�y przeciw zwartym oddzia�om varranckim. Nagle oczom walcz�cych ukaza�a si� wielka niczym g�ra Archolos fala, kt�ra chwil� potem przykry�a ca�e pole bitwy, id�c dalej w g��b krainy. Kolejno w wodzie pogr��a�y si� miasta, wsie, lasy, ��ki, a nawet g�ry, oga�acaj�c te miejsca z wszelkiego �ycia. Woda poch�on�a Kostur i Ber�o, za� pi�� boskich artefakt�w kap�ani ognia umie�cili w �wi�tyniach.");

B_LogEntry(BookLog_HistoryOfVarant11,"KONIEC TOMU XI");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant12 (C_ITEM)

{

name ="Dzieje Varantu. Tom XII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant12;

};

FUNC VOID Use_Book_HistoryOfVarant12()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom XII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie�o opisuj�ce narodziny, rozw�j i upadek staro�ytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant12,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant12,"Dzieje Varantu. Tom XII");

B_LogEntry(BookLog_HistoryOfVarant12,"Fale da�y kres wielkiemu Imperium Varantu, kt�re od Wiecznego W�drowca do Asmatila istnia�o 437 lat. Cho� morze po kilku latach pocz�o ust�powa�, ods�oni�ty l�d r�ni� si� od dawnego obrazu krainy. W miejsce urodzajnej i �yznej ziemi, zjawi�y si� nieprzebyte piaski. Owe piaski poch�on�y dawne miasta i rzeki, czyni�c Varant niepodobnym do starego. P�nocne miasta dawnego imperium pocz�y upada� pod naporem wyzwalaj�cej si� ludno�ci tubylczej i jej kolejnych najazd�w. Trwa�e okaza�y si� dzieci tego tworu, gdzie Korona Troghdana podj�a p�aszcz dziedzictwa Varantu. ");

B_LogEntry(BookLog_HistoryOfVarant12,"R�wnie� w�r�d Nordmarczyk�w kwit� kult Innosa, przyniesiony przez jednego z niewolnik�w do tej nieprzyjaznej krainy. Ludno��, kt�ra mia�a tworzy� nowy Varant by�a inna od dawnych jego gospodarzy. Wywodzi�a si� ona z wyp�dzonych w g�ry przez Akhelid�w pogan, kt�rzy pod wp�ywem maga wody Almira przyjeli kult Adanosa w czasach dynastii Mussanit�w. Na p�nocy dzisiejszej pustyni osiedlili si� z rzadka Prave�czycy, za� na wschodzie nie brakowa�o przybyszy z Wysp Po�udniowych. Wie�ci te spisali ku pami�ci potomno�ci Amiridion z Jelkali, Krug syn Amirindiona i Kap�an Darandir z Trellium. ");

B_LogEntry(BookLog_HistoryOfVarant12,"W�ADCY PRADAWNYCH Z DYNASTII AKHELID�W");

B_LogEntry(BookLog_HistoryOfVarant12,"1. Wieczny W�drowiec ");

B_LogEntry(BookLog_HistoryOfVarant12,"2. Akheld I syn Wiecznego W�drowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"3. Semmir I syn Wiecznego W�drowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"4. Akheld II syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"5. Tellos I syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"6. Teminnar I syn Tellosa I");

B_LogEntry(BookLog_HistoryOfVarant12,"7. Semmir II  syn Teminnara I");

B_LogEntry(BookLog_HistoryOfVarant12,"8. Tellos II syn Semmira II");

B_LogEntry(BookLog_HistoryOfVarant12,"9. Tellos III syn Tellosa II");

B_LogEntry(BookLog_HistoryOfVarant12,"10. Tellos IV syn Tellosa III");

B_LogEntry(BookLog_HistoryOfVarant12,"W�ADCY PRADAWNYCH Z DYNASTII ODNOWICIELI ");

B_LogEntry(BookLog_HistoryOfVarant12,"Akheld III");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir I Obro�ca syn Akhelda III ");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir II Przekl�ty syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"Tizgar I Chromy syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"W�ADCY PRADAWNYCH Z DYNASTII MUSSANIT�W");

B_LogEntry(BookLog_HistoryOfVarant12,"Nelezar I syn Delezara Mussanity ");

B_LogEntry(BookLog_HistoryOfVarant12,"Semmir III syn Nelezara I");

B_LogEntry(BookLog_HistoryOfVarant12,"Asmatila I Zwyci�zca syn Semmira III ");

B_LogEntry(BookLog_HistoryOfVarant12,"KONIEC TOMU XII, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// GULDERNOWIE Z DHIRIM

// SUGEROWANA LOKACJA: REGA� NIEOPODAL BULITA

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Gulderns (C_ITEM) //d

{

name ="Guldernowie z Dhirim";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hungard z Brennus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Gulderns;

};

FUNC VOID Use_Book_Gulderns()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Guldernowie z Dhirim");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia Guldern�w - przodk�w dzisiejszych mieszka�c�w Geldern]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Gulderns,LOG_NOTE);

B_LogEntry(BookLog_Gulderns,"Guldernowie z Dhirim");

B_LogEntry(BookLog_Gulderns,"Dumne Kr�leswto Gothy nie by�o jedynym, kt�re mog�o ro�ci� sobie prawa do tytu�u spadkobiercy Imperium Pradawnych. W staro�ytno�ci tereny, nad kt�rymi g�ruje dzi� wielkie miasto Geldern, zamieszkane by�y przez barbarzy�skie ludy Guldern�w. Plemiona te niejednokrotnie naje�d�a�y varanckie posiad�o�ci, a tak�e sam Varant Pradawnych. To w�a�nie owym plemionom, miasto Geldern zawdzi�cza swoj� nazw�.�U schy�ku Imperium tereny te posiada�y ju� o�ywione kontakty handlowe z Varantem. Wraz z towarami i dobrami materialnymi, na ziemie te dociera�y r�wnie� wp�ywy kulturalne i religijne. Za spraw� zetkni�cia si� z zaawansowan� cywilizacj� zacz�y powstawa� o�rodki miejskie, a w ostatnich dekadach Imperium r�wnie� pierwsze pa�stwa. ");

B_LogEntry(BookLog_Gulderns,"Kr�tki epizod podboju tych ziem przez s�siad�w w okresie w�dr�wki lud�w po upadku Imperium przyhamowa� ten proces. Ostatecznie jednak na tych terenach powsta�o pot�ne kr�lestwo, kt�re przyj�o jako swoj�, varanck� nazw� tej krainy, czyli Dhirim. W�adcy zjednoczonej krainy na znak swojej pot�gi postanowili wybudowa� wspania�� stolic�, kt�r� nazwali Geldern, to jest 'miasto Guldern�w'. Kraj ten opar� si� na dw�ch zasadniczych filarach - �eksploatacji wielkich kopal� i zachowywaniu dziedzictwa Imperium Varantu.�");

B_LogEntry(BookLog_Gulderns,"Mimo rozkwitu i bogactwa kr�lestwa nie powiod�y si� podejmowane przez kr�l�w Dhirim pr�by ekspansji, kt�re napotyka�y na silny op�r ze strony pot�nych kr�l�w Gothy i prze�ywaj�cych sw�j z�oty wiek Trellijczyk�w. W obliczu kolejnych kl�sk, Dhirimijczycy porzucili my�l o podbojach i skupili si� na rozwoju w�asnych ziem. Zapewniwszy sobie w ci�gu wiek�w dobrobyt i republika�skie instytucje, kr�lestwo postanowi�o trwa� w izolacjonizmie. Cho� zdarzali si� w�adcy aktywnie anga�uj�cy si� w walki na Kontynencie, to jednak a� po kres niepodleg�ego bytu pozosta�o wierne drodze dominacji handlowej i wystrzegania si� wojen. ");

B_LogEntry(BookLog_Gulderns,"Sw�j dobrobyt w ogromnej mierze Dhirimijczycy zawdzi�czali handlowi i wydobyciu, organizowanemu przez miejscowych kupc�w. Zrzeszeni w wielkiej gelderyjskiej gildii Menthes, rozpocz�li d�ugi marsz zmierzaj�cy wpierw do wsp�udzia�u we w�adzy, a nast�pnie do marginalizacji siedz�cych w stolicy kr�l�w. ");

B_LogEntry(BookLog_Gulderns,"Wraz z wykszta�ceniem si� republika�skich form rz�d�w, coraz cz�ciej Kr�lestwo Dhirim nazywano od miasta Kr�lestwem Geldern, a nawet Republik� Kupieck� Geldern.�W schy�kowej fazie niepodleg�ego bytu, mia� miejsce kryzys istniej�cych w Dhirim instytucji republika�skich. ");

B_LogEntry(BookLog_Gulderns,"Wzrost znaczenia oligarchii wielkich kupc�w z gildii Menthes budzi� sprzeciw obywateli miasta. Na fali owego niezadowolenia w�adz� przechwytywali rozmaici tyranii. Nie mog�c powstrzyma� kryzysu pa�stwa i spe�ni� pok�adanych w nich przez t�um nadziei, w�adza tyran�w by�a nieustannie zagro�ona. ");

B_LogEntry(BookLog_Gulderns,"Przeciwko nim nieustannie spiskowali wielcy kupcy, pragn�cy powrotu oligarchii. W tej sytuacji tyrani szukali wsparcia pot�nych kr�l�w Myrtany. Za tyrana Sangero, nast�pi�o jednak odwr�cenie przymierzy. Za cen� powrotu republika�sko-oligarchicznych form w Geldern i zagwarantowanie przywilej�w kupcom, gildia zgodzi�a si� uzna� w�adz� kr�la Myrtany.�Od tej pory kraina ta sta�a si� cz�ci� nordmarskiej monarchii Rhobar�w. ");

B_LogEntry(BookLog_Gulderns,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// SUNDMARCZYCY

// LOKALIZACJA: DOWOLNA (NP. REGA� W KOMNACIE GDZIE �PI M.IN. THORUS)

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Sundmarians (C_ITEM) //d

{

name ="Sundmarczycy";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Sundmarians;

};

FUNC VOID Use_Book_Sundmarians()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Sundmarczycy");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o Sundmarczykach - pobratymcach Nordmarczyk�w, zamieszkuj�cych tereny wok� twierdzy Faring.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Sundmarians,LOG_NOTE);

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy");

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy to lud zamieszkuj�cy p�nocne ziemie Krain Centralnych. Do Sundmaru mieli przyby� wiele wiek�w temu, prowadzeni przez swego praojca � Rangulda. Ich praojczyzn� mia�y by� wiecznie skute lodem Mro�ne Wyspy, le��ce na p�nocny-wsch�d od Kr�lestwa Myrtany, kt�re dzi� s� domem p�dzikich pirat�w. ");

B_LogEntry(BookLog_Sundmarians,"Wed�ug ch�tnie powtarzanej przez Sundmarczyk�w legendy, Sundmar jest ziemi� powierzon� Ranguldowi i jego potomkom przez bog�w. Bogowie mieli j� im obieca�, po tym jak Sundmarczycy pokonali plemi� jaszczuroludzi, kt�re to stworzenia obok ork�w w najdawniejszych czasach zamieszkiwa�y te ziemie. ");

B_LogEntry(BookLog_Sundmarians,"Po wyparciu smoczego potomstwa, przez wieki Sundmarczycy toczyli walki ze swymi s�siadami z po�udnia - Jelkalami, czyli przodkami dzisiejszych Vengardczyk�w, Goth�w i w mniejszym stopniu mieszka�c�w Montery. Wobec poniesionej kl�ski, cz�� plemion sundmarskich pod wodz� Dagonarda porzuci�o swe ojczyste strony i wyruszy�o do Nordmaru. Wydarzenia te gin� jednak w mrokach dziej�w i trudno rzec, w jakiej wojnie ponie�li oni kl�sk� i jakich pora�ka by�a rozmiar�w. ");

B_LogEntry(BookLog_Sundmarians,"Ci Sundmarczycy, kt�rzy pod��yli za Dagonardem, mieli pono� uchodzi� przed niewol�. Wiadomym jednak jest za spraw� legendy o Bardorze, �e po rozpadzie pierwotnego ludu na dwa narody, Sundmarczycy jeszcze przez wiele lat toczyli wojny z Jelkalami jak r�wny z r�wnym.�");

B_LogEntry(BookLog_Sundmarians,"W ci�gu wiek�w Sundmarczycy zostali podbici przez Jelkal�w z Gothy i zmuszeni do podda�stwa. Po serii powsta� i bunt�w, ostatecznie zapanowa� pok�j. P�tora wieku po ostatecznej kl�sce, rozpocz�a si� era �upie�czych najazd�w Nordmarczyk�w na tereny po�o�one w centralnej Myrtanie. Ka�da z takich wypraw przechodzi�a przez tereny zamieszkane przez Sundmarczyk�w, przynosz�c temu ludowi wielkie szkody. W czasach Merigi II Gockiego, powsta�a twierdza Farung, kt�ra mia�a umocni� jego panowanie nad t� krain� i postawi� tam� dla Nordmarczyk�w. Ataki barbarzy�c�w z p�nocy jednak nie usta�y.");

B_LogEntry(BookLog_Sundmarians,"Za Merigi IV, przyzwani przez tocz�cego z kr�lem Goth�w wojn� Monteriusa II z Montery, Nordmarczycy pod wodz� Hrothgara zdobyli Farung i obsadzili swoj� za�og�. Dow�dca Nordmarczyk�w pr�dko mianowa� si� jarlem, tworz�c udzielne pa�stwo w Farung. On i jego przodkowie rozpocz�li proces kolonizacji Sundmaru przez osadnik�w sprowadzonych z p�nocy, pragn�cych �y� w �agodniejszym klimacie. Tym sposobem zmienia�a si� substancja tworz�ca lud Sundmarzczyk�w, gdy� przybysze z Nordmaru zasilili jego populacj�.");

B_LogEntry(BookLog_Sundmarians,"Pocz�tkowe walki jarl�w z nordmarskimi najazdami �upie�czymi usta�y wraz z pobiciem wodza Vurlsena Nied�wiedzia, po kt�rym to Sundmarczycy i Nordmarczycy rozpocz�li er� krucjat p�nocnych, wiod�cych na ziemie ork�w. W pogodzeniu dw�ch ga��zi Rangulda ogromne zas�ugi mieli kap�ani Innosa skupieni w klasztorze w Nordmarze.�");

B_LogEntry(BookLog_Sundmarians,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// O PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W WODY

// RANGA RELIGIJNA TEJ OPOWIE�CI JEST ZBYT DU�A BY KSI�G� T� MO�NA BY�O KUPOWA� U HANDLARZY, LUB ZNAJDOWA� W DOMACH SKAZA�C�W

// NAPISANE PRZEZ WYZYSKKA

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_AncientKnowledge (C_ITEM)

{

name ="O Pradawnych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="�wi�te pisma";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_AncientKnowledge;

};

FUNC VOID Use_Book_AncientKnowledge()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "O Pradawnych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[�wi�te pisma o powstaniu i zag�adzie staro�ytnego ludu Pradawnych z Varantu]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_AncientKnowledge,LOG_NOTE);

B_LogEntry(BookLog_AncientKnowledge,"O Pradawnych");

B_LogEntry(BookLog_AncientKnowledge,"Na pocz�tku krain� t� zamieszkiwali koczownicy i Wieczny W�drowiec wskaza� im drog�. I Innos przem�wi� do Wiecznego W�drowca: �Od�� sw�j kostur.� I w jego miejsce Innos da� mu ber�o. I Wieczny W�drowiec zosta� jego s�ug�. I Innos obda�y� go cz�ci� swej boskiej mocy, by m�g� powstrzyma� Beliara.");

B_LogEntry(BookLog_AncientKnowledge,"I moc� t� by� ogie�. I mia� nad nim w�adz�. Ale niekt�rzy spo�r�d koczownik�w nie pod��yli za Innosem. I lud koczownik�w podzieli� si� na dwie cz�ci. Ci, kt�rzy pod��yli za Innosem, stali si� ludem Varantu. ");

B_LogEntry(BookLog_AncientKnowledge,"A s�udzy Innosa pokonali armi� istot Beliara i wznie�li wspania�e �wi�tynie ku chwale Innosa, a ber�o sta�o si� symbolem ich w�adzy. I triumfowa� Innos, gdy� kraina ta sta�a si� mu pos�uszn�, a jej w�adcami byli odt�d jego s�udzy.");

B_LogEntry(BookLog_AncientKnowledge,"I Innos przem�wi� do swych s�ug: �Wznie�cie dla mnie portal, abym m�g� rz�dzi� w tej cz�ci �wiata przez ca�� wieczno��.� I jego s�udzy spe�nili to ��danie. A kiedy Beliar zobaczy�, co robili s�udzy Innosa, uni�s� si� gniewem. I istota pe�na staro�ytnej mocy przyby�a na jego wezwanie i powsta�a z ziemi. ");

B_LogEntry(BookLog_AncientKnowledge,"A wraz z ni� inne pot�ne istoty. Ale nadszed� kres pot�nych istot, albowiem taka by�a wola Adanosa. I Adanos zes�a� pow�d�, a ta zmy�a je z powierzchni ziemi. Kiedy s�uga Innosa zobaczy�, co si� dzieje, zamkn�� w �wi�tyniach pi�� boskich artefakt�w Adanosa. ");

B_LogEntry(BookLog_AncientKnowledge,"I lud Varantu zgin��, a kostur i ber�o pogr��y�y si� w wodzie. I rzek� Adanos do swych braci: �Nigdy wi�cej wasza stopa nie postanie na mej ziemi, albowiem jest ona �wi�ta! Oto moja wola.�");

};

/////////////////////////////////////////////////////////////////////

// LORD ETIENNE

// SUGEROWANA LOKACJA: NA ZAMKU W KOMNACIE GOMEZA 

// KSI�GA TA MOG�ABY ZAINTERESOWA� TYCH LUDZI, KT�RZY MAJ� O�YWIONE STOSUNKI ZE �WIATEM ZEWN�TRZNYM. NIE PRZEZNACZONA RACZEJ DLA HANDLARZY, GDY� ZWYK�YCH SKAZA�C�W ONA NIE ZAINTERESUJE. 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LordEtienne (C_ITEM) //d

{

name ="Lord Etienne";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Taurinus Accalia";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_LordEtienne;

};

FUNC VOID Use_Book_LordEtienne()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Lord Etienne");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Ksi�ga z cyklu 'Najwa�niejsze postacie Kr�lestwa Myrtany', traktuj�ca o obecnym wielkim mistrzu Zakonu Paladyn�w.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LordEtienne,LOG_NOTE);

B_LogEntry(BookLog_LordEtienne,"Lord Etienne");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne to wielki mistrz Zakonu Paladyn�w. Jest panem na zamku w Reveran � g��wnej siedzibie paladyn�w i ich najwa�niejszym o�rodku szkoleniowym. Stamt�d te� sprawuje dow�dztwo nad podleg�ymi Zakonowi zamkami paladyn�w w ca�ym Kr�lestwiem Myrtany. Jest przy tym niezwykle ambitny, co czyni z niego jedn� z najbardziej wp�ywowych postaci w pa�stwie Rhobar�w. Wed�ug niekt�rych, m�g� bra� udzia� w zamordowaniu kr�lowej, cho� �ledztwo prowadzone na dworze kr�lewskim nie potwierdzi�o tych pog�osek.");

B_LogEntry(BookLog_LordEtienne,"Przysz�y zwierzchnik paladyn�w urodzi� si� w ubogiej rodzinie na jednej z le��cych na po�udniowy-wsch�d wysp � na Bodermarze. Wychowany na ulicach, by� na dobrej drodze, by sko�czy� �ycie w szeregach portowej biedoty. Los si� jednak do niego u�miechn��. Pewien potencja� dostrzeg� w nim jeden z rycerzy przebywaj�cych czasowo na Bodermarze. Ten zaprowadzi� go do rezyduj�cego w mie�cie Maga Ognia � Loukanisa, prosz�c �wi�tobliwego kap�ana by zgodzi� si� naucza� m�odego Etienne.");

B_LogEntry(BookLog_LordEtienne,"Mag ognia si� zgodzi�, cho� wie�� niesie, �e niech�tnie. Szybko si� jednak okaza�o si�, �e oddany na nauk� m�odzieniec jest nader poj�tnym uczniem. Etienne szczeg�lnie upodoba� sobie ksi�gi o paladynach i wyprawach na ork�w. Pasjonowa�y go szczeg�lnie krucjaty p�nocne prowadzone przez jarl�w Farung. Mag Loukanis spostrzeg�szy zainteresowanie ch�opca tematyk� wojen z orkami oraz rycerstwem, pom�g� mu trafi� do g��wnego o�rodka szkoleniowego dla paladyn�w na zamku Revaran. Tak rozpocz�a si� kariera przysz�ego wielkiego mistrza w Zakonie Paladyn�w. ");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne jako rycerz Zakonu bra� udzia� w wielu walkach z orkami, w czasie kt�rych odznaczy� si� odwag� i m�stwem. Pozwoli�o mu to awansowa� na kolejne stopnie zakonnej hierarchii. W wieku 38 lat, jako zas�u�ony i szanowany cz�onek bractwa, zosta� wybrany na zwierzchnika Zakonu Paladyn�w. Od tej pory stoi na ich czele.");

};

/////////////////////////////////////////////////////////////////////

// KAHRE�CZYCY Z KAHR

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA/BIBLIOTEKA MAG�W WODY/W KOMNACIE BARTHOLO

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Kahr (C_ITEM) //d

{

name ="Kahre�czycy z Kahr";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_04.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Arentus z Khorinis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Kahr;

};

FUNC VOID Use_Book_Kahr()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kahre�czycy z Kahr");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia wyspy Khorinis.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Kahr,LOG_NOTE);

B_LogEntry(BookLog_Kahr,"Kahre�czycy z Kahr");

B_LogEntry(BookLog_Kahr,"Wyspa Khorinis to jedna z najwa�niejszych prowincji Kr�lestwa Myrtany. Status prowincji strategicznej zawdzi�cza po�o�onej na po�udniu wyspy, G�rniczej Dolinie, gdzie wydobywana jest magiczna ruda - niezwykle cenny surowiec, wykorzystywany do produkcji wytrzyma�ej broni.");

B_LogEntry(BookLog_Kahr,"Nim jednak Khorinis sta�a si� cz�ci� Kr�lestwa Myrtany, przez stulecia tworzy�a w�asn� histori�. Kim s� Kahre�czycy? Przodkowie dzisiejszych mieszka�c�w Khorinis, zwanego dawniej Kahr, od niepami�tnych czas�w zamieszkiwali wysp�. ");

B_LogEntry(BookLog_Kahr,"Nie byli przy tym jedynymi mieszka�cami staro�ytnego Khorinis, gdy� dom mia�y tu r�wnie� liczne orkowe klany. W trudnej do okre�lenia przesz�o�ci na wyspie rozkwit�a zagadkowa cywilizacja budowniczych piramid. Niewiele mo�na powiedzie� o tym ludzie, poza tym, �e opr�cz wzoszenia monumentalnych budowli, wyznawali Adanosa. Trwa�ym �ladem ich obecno�ci w historii wyspy jest to, �e cz�� spo�r�d podporz�dkowanych im plemion przyj�a kult Budowniczych.");

B_LogEntry(BookLog_Kahr,"To dzi�ki temu tajemniczemu ludowi, gdy barbarzy�scy wodzowie z dynastii Ukar�w zdo�ali narzuci� sw� w�adz� s�siednim szczepom, nowopowsta�e Kr�lestwo Kahr przyj�o kult Adanosa. R�ni� si� on jednak znacznie od wyznania panuj�cego w dzisiejszym Kr�lestwie Myrtany. Religia Kahre�czyk�w nosi�a wyra�ne cechy druidyzmu z w�a�ciwymi dla niego kamiennymi kr�gami i czci� oddawan� si�om natury. Wprawdzie w wierzeniach ich obecny by� Beliar jako przeciwnik dobrego Adanosa, lecz dopiero w p�niejszych wiekach na wysp� dotar� kult Innosa.");

B_LogEntry(BookLog_Kahr,"Dzieje Khorinis nierozerwalnie wi��� si� z rodem Ukar�w, kt�rego za�o�ycielem mia� by� mocarz imieniem Ukara. Wed�ug legendy rodowej w dawnych czasach obfite ziemie nad brzegami Khorinis mia�y by� we w�adaniu olbrzyma, kt�ry ciemi�y� okoliczne plemiona i zmusza� je do dawania niema�ej daniny. ");

B_LogEntry(BookLog_Kahr,"Ludziom przychodzi�o wi�c niejednokrotnie cierpie� g��d. Zmy�lny Ukara postanowi� wtedy zdoby� si� na fortel. Przebrawszy si� wtedy za chromego, poszed� do olbrzyma i poprosi� go o kilka p�dzi ziemi. Olbrzym rzek� na to, �e s�aby �ebrak dostanie tyle ziemi, ile sam we�mie przesun�wszy wielki g�az. Ukara si� zgodzi� i zrzuciwszy �ebrackie �achmany, podni�s� wielki g�az i zani�s� go, wytyczaj�c tym samym granic� przysz�ego miasta Khorinis. Uwolnione plemiona z rado�ci� okrzykn�y dzielnego Ukar� swoim przyw�dc�, a po nim panowali jego synowie i wnukowie. Tyle legenda. W rzeczywisto�ci r�d Ukar�w zdo�a� rozci�gn�� swoj� w�adz� na wi�ksz� cz�� wyspy, a tak�e wyprze� ork�w daleko na po�udnie, do G�rniczej Doliny. Na ziemiach plemienia, z kt�rego Ukarowie si� wywodzili, powsta�o wspania�e miasto Khorinis, zwane te� dawniej Kahr.");

B_LogEntry(BookLog_Kahr,"Przej�ciowo zdo�ali te� opanowa� G�rnicz� Dolin�, na kt�rej terenach wybudowali cytadel�. W G�rniczej Dolinie Ukarowie ufundowali r�wnie� warowny klasztor, w kt�rym rezydowa� mieli druidzcy kap�ani Adanosa. Cho� niekt�rzy twierdz�, �e mnisi oddawali tam cze�� r�wnie� poga�skim bogom tej wyspy.�");

B_LogEntry(BookLog_Kahr,"W po�owie swej drogi, Kr�lestwo Kahr znalaz�o si� na r�wni pochy�ej. D�ugotrwa�e wojny z Vengardem, wywo�ane pr�b� powstrzymania ekspansji vengardzkiej gildii Araxos, zako�czy�y si� kl�sk� i spaleniem ca�ego portu Khorinis. W tym czasie narasta�o te� zagro�enie ze strony klan�w orkowych, zamieszkuj�cych G�rnicz� Dolin�. Nap�r ze strony ork�w, a nast�pnie utrata G�rniczej Doliny i pr�by jej odzyskania wiele kosztowa�y Kr�lestwo Kahr.  ");

B_LogEntry(BookLog_Kahr,"Mimo niepowodze� kr�lowie zdo�ali powstrzyma� hordy zielonosk�rych i obroni� niepodleg�o�� wyspy przed zakusami vengardzkiej gildii Araxos.�Dla odbudowy wyspy kr�lowie Kahr rozpocz�li do�� energiczn� sprowadzania osadnik�w z Kontynentu. Przybysze pochodz�cy g��wnie z Vengardu, Ardei i Montery przynie�li ze sob� kult Innosa. Z biegiem lat coraz wi�ksze znaczenie na dworze w�adc�w zdobywali g�ruj�cy swym wykszta�ceniem nad druidami Magowie Ognia. Z nadania kr�la Firentisa, otrzymali oni tereny pod budow� klasztoru Innosa na Khorinis. Osadnictwo myrta�skie przyczynia�o si� do powolnej zmiany oblicza Khorinis. Przygotowywa�o te� grunt pod wydarzenia przysz�e, kiedy to wyspa mia�a sta� si� cz�ci� zjednoczonej monarchii Rhobar�w. ");

B_LogEntry(BookLog_Kahr,"Ostatnim z kr�l�w Kahr by� wnuk Firentisa - Wilfried Ukara, za kt�rego pa�stwo musia�o toczy� ci�kie walki z orkami z po�udnia. Barbarzy�skie klany ork�w, zjednoczone pod wodz� pot�nego herszta Gherr-Uzgha zdo�a�y rozbi� armi� Kahr i obleg�y stolic� Khorinis. Kr�l Wilfried nie mia� wyboru. Dla ratowania kr�lestwa zawar� przymierze z kr�lem Rhobarem I, za cen� ustanowienia go dziedzicem zagro�onej korony. Zwyci�ska odsiecz uchroni�a Khorinis przed upadkiem, a po �mierci Wilfrieda i st�umieniu buntu jego krewnych, Khorinis sta�a si� per�� w koronie kr�l�w Myrtany. Tak oto ko�czy si� historia Kahr, a rozpoczyna historia kr�lewskiej prowincji Khorinis.�");

B_LogEntry(BookLog_Kahr,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// FRAGMENT KRONIK DOMINACJI

// SUGEROWANA LOKALIZACJA: WIE�A XARDASA, DOPIERO W V ROZDZIALE/G�RSKA TWIERDZA /d

// ZAKAZANA W KR�LESTWIE MYRTANY HERETYCKA KSI�GA. BARDZO RZADKA. 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_ChroniclesOfDomination (C_ITEM)

{

name ="Fragment Kronik Dominacji";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Anonim";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_ChroniclesOfDomination;

};

FUNC VOID Use_Book_ChroniclesOfDomination()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Mage_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Mage_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Fragment Kronik Dominacji");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Rzadkie, heretyckie oficjalnie zakazane w Kr�lestwie Myrtany. Jeden z ostatnich ocala�ych r�kopis�w.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_ChroniclesOfDomination,LOG_NOTE);

B_LogEntry(BookLog_ChroniclesOfDomination,"Fragment Kronik Dominacji");

B_LogEntry(BookLog_ChroniclesOfDomination,"W dniu pr�by ognia dost�pi�em zaszczytu wejrzenia do Kronik Dominacji - dzie�a przechowywanego w Klasztorze Innosa w Nordmarze. Ksi�ga ta zawiera jednak wiele tajemnic Zakonu Mag�w Ognia, dlatego zosta�a zapiecz�towana przy pomocy niezwykle pot�nej magii. Tylko najwy�si magowie posiedli wiedz� pozwalaj�c� j� czyta�, a przede mn� postawiono jedynie zadanie otworzenia cho�by fragmentu tej ksi�gi, czym mia�em udowodni�, �e jestem godny przywdziania szaty Maga Ognia.");

B_LogEntry(BookLog_ChroniclesOfDomination,"Po wielu miesi�cach przygotowa�, kiedy zg��bia�em wiedz� maj�c� pom�c mi podo�a� zadaniu, zosta�em wezwany przez arcymaga Sevolda i o zachodzie s�o�ca zaprowadzony na najni�sze pi�tra Biblioteki Klasztornej, gdzie przechowywana by�a owa relikwia. Rozpocz�a si� pr�ba. Cho� pr�bowa�em odkry� jak najwi�cej jej tajemnic, to zdo�a�em odczyta� jedynie niewielki jej fragment. To co jednak ukaza�o si� mym oczom, sprawi�o, �e zw�tpi�em w nauki g�oszone przez Ko�ci� Innosa. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Mimo, �e przeszed�em pr�b� ognia i sta�em si� jednym z mag�w, niebawem porzuci�em swych braci, kt�rzy stali si� mi obcymi. Od tej pory musia�em uchodzi� przed ich gniewem. Cho� �ami� przysi�g� z�o�on� Innosowi i Ko�cio�owi Ognia, postanowi�em utrwali� na papierze, to co wtedy ujrza�em:");

B_LogEntry(BookLog_ChroniclesOfDomination,"�I powo�a� Innos do �ycia pot�ne istoty, lecz one znaj�c moc dan� im przez stw�rc�, odrzuci�y go i zwr�ci�y si� przeciw niemu. A by�o to jeszcze nim z Innosa powsta� Beliar i Adanos. I mocarne pot�g� niepodzielnego Innosa, sta�y si� nie�miertelne.� ");

B_LogEntry(BookLog_ChroniclesOfDomination,"�A Trzej powstali z Jednego, jednocz�c sw� wol� i moc raz jeszcze, przemogli pot�ne istoty i...� Tutaj ko�czy si� fragment, kt�ry ksi�ga przede mn� ods�oni�a. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Czy wi�c to mo�liwe, �e Magowie Ognia ukrywali przed nami istnienie Przedwiecznych Istot, powo�anych do �ycia moc� niepodzielonego w�wczas jeszcze Innosa? Czy ci wszyscy herezjarchowie g�osz�cy ich istnienie byli bli�si prawdy ni� Magowie Ognia g�osz�cy ludowi nieistnienie tych byt�w?");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nigdy ju� ani Innos, ani Beliar, ani Adanos nie mia� w�ada� moc� wszystkich Trojga, wi�c jako istoty stworzone przez Innosa sprzed podzia�u, by�yby najpot�niejszymi ze stworzonych byt�w i ust�powa�yby jedynie bogom. Mo�e nawet stanowi�yby dla nich zagro�enie? Czy te przedwieczne istoty przetrwa�y jak pozwala�aby przypuszcza� wzmianka o ich nie�miertelno�ci? A mo�e zosta�y uwi�zione? Tylko przez kogo i kiedy? Przez pierwotnego Innosa, czy przez wszystkich Innosa i dw�ch jego Braci? Czy ludzie ju� wtedy istnieli? Rodzi si� te� pytanie najwa�niejsze: czy te pot�ne istoty maj� wp�yw na nasz �wiat? A je�li tak, to jaki? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Jak wiemy, Ko�ci� Innosa g�osi, �e wszelka moc magiczna pochodzi od bog�w. Jednak nie tylko czciciele b�stw prawdziwych potrafi� pos�ugiwa� si� magi�, by wspomnie� cho�by o poga�skich magach. Niekt�re kr�gi innosyckie w ka�dym poga�skim b�stwie chcia�yby widzie� o ile nie pust� figurk�, to chocby jedn� z kolejnych masek Beliara. Czemu wi�c magia, kt�r� pos�uguj� si� poganie okazuje si� r�na od tej w�a�ciwej dla Beliara? Czy demony Beliara jako cz�stka jego mocy, nie pos�ugiwa�yby si� magi� swego stw�rcy? Czy wi�c za poga�skimi b�stwami nie kryj� si� w�a�nie owe przedwieczne istoty? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nim Kr�lowie Myrtany wprowadzili w �ycie postanowienia soboru vengardzkiego reformuj�cego i ujednolicaj�cego Kult Myrta�ski, w niekt�rych innosyckich i adanosyckiech kr�gach kap�a�skich istnia�y doktryny, kt�re w r�nym stopniu uznawa�y istnienie Przedwiecznych Istot. Czemu wi�c odrzucono te tradycje? By� mo�e dlatego, �e prym na obradach soboru wiedli niech�tni im kap�ani z Gothy. Zapewne obawiano si� te�, by ludzie wierz�c w realno�� tych byt�w, nie szukali w nich alternatywy do trzech w�a�ciwych bog�w.");

B_LogEntry(BookLog_ChroniclesOfDomination,"Cho� wiem, �e ksi�ga ta zostanie uznana przez �wi�tobliwych Mag�w Ognia za heretyck�, a ci co wejd� w jej posiadanie nara�� si� na gniew inkwizytor�w, to nie mog�em odrzuci� i skaza� na zapomnienie tej wiedzy. Musi ona przetrwa�, gdy� okupiono j� ogromn� cen�.");

B_LogEntry(BookLog_ChroniclesOfDomination,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// OPACTWO NORDMARSKIE

// SUEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA /d

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH

// NAPISANE NA PODSTAWIE GOTHICPEDII Z ROZWINIECIEM T�A HISTORYCZNEGO

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_NordmarAbbey (C_ITEM)

{

name ="Opactwo w Nordmarze";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;


TEXT[2] ="Autor: Aidep Thigo";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_NordmarAbbey;

};

FUNC VOID Use_Book_NordmarAbbey()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Opactwo Nordmarskie");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[O historii i architekturze opactwa Mag�w Ognia w Nordmarze.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_NordmarAbbey,LOG_NOTE);

B_LogEntry(BookLog_NordmarAbbey,"Opactwo Nordmarskie");

B_LogEntry(BookLog_NordmarAbbey,"Jeden z najwa�niejszych klasztor�w Mag�w Ognia znajduje si� w Nordmarze. Sam obiekt nie grzeszy rozmiarami, lecz posiada grot� z pos�giem Innosa, gdzie Pan Ognia niegdy� objawi� si� ludziom. Ponadto klasztor posiada imponuj�cy zas�b wiedzy w postaci s�awnej biblioteki.");

B_LogEntry(BookLog_NordmarAbbey,"Stare opowie�ci przedstawiaj� takow� histori� powstania klasztoru: Nordmarczyk imieniem Rhobar pewnego dnia zapu�ci� si� w okoliczne g�ry na polowanie. Jednak niespodziewanie na jego drodze stan�a tajemnicza bestia. M�ody wojownik po ucieczce skry� si� przed potworem w jaskini. Jednak ten pod��y� za nim.Kiedy Rhobar my�la�, �e to koniec, niespodziewanie w jego r�kach znalaz�o si� magiczne ostrze, kt�re pos�u�y� mu w walce. Po zabiciu bestii miejsce to wype�ni�o �wiat�o, a z niebios wydoby� si� g�os Innosa. B�g sprawiedliwych kaza� swemu wybra�cowi poprowadzi� sw�j lud na r�wniny i tam za�o�y� kr�lestwo jego wyznawc�w. Niebawem te� Magowie Ognia postanowili w tym miejscu za�o�y� g��wne sanktuarium Innosa, a w jaskini gdzie objawi� si� Innos wznie�li o�tarz bogu �wiat�a.");

B_LogEntry(BookLog_NordmarAbbey,"Klasztor powsta�y w miejscu, gdzie rozpoczyna si� historia Kr�lestwa Myrtany zosta� otoczony szczeg�ln� opiek� jej w�adc�w. Wspierany przez kr�l�w mia� sta� si� centralnym miejscem myrta�skiego Innosytyzmu. Niebawem te� sta� si� celem w�dr�wek pielgrzym�w, tak z Myrtany jak i z innych zak�tk�w �wiata.  W tym miejscu znajdowa�a si� niema�a ilo�� pism oraz wiele magicznych artefakt�w, cho� wi�kszo�� z nich w czasie wojny zosta�o odes�anych na po�udnie, do Myrtany. W klasztornej bibliotece ma si� jednak znajdowa� r�wnie� Kronika Dominacji, opisuj�ca histori� Mag�w Ognia i zawieraj�ca wiele tajemnic zakonu. Z tego te� powodu zosta�a zapiecz�towana niezwykle pot�nymi zakl�ciami, chroni�cymi j� przed profanami pragn�cymi bezprawnie wej�� w posiadanie zarezerwowanej dla mag�w wiedzy. Do ksi�gi tej maj� prawo zbli�y� si� jedynie najwy�si spo�r�d mag�w�");

B_LogEntry(BookLog_NordmarAbbey,"Biblioteka. To tu znajduje si� ksi�gozbi�r, kt�ry swego czasu przewy�sza� nawet ten z klasztoru na wyspie Khorinis. Biblioteka ma spiraln�, schodz�c� w d� budow�, im ni�ej si� schodzi tym starsze ksi�gi mo�na znale��. Wzd�u� schod�w jest wiele pokoik�w, w kt�rych magowie mog� po�wi�ca� si� lekturze. Na najni�szym poziomie biblioteki znajduj� niedost�pne dla pielgrzym�w tajne archiwa, w kt�rych przechowywane s� ksi�gi przeznaczone jedynie dla mag�w.");

B_LogEntry(BookLog_NordmarAbbey,"�wi�tynia. Jest to najwi�kszy budynek w Klasztorze, a tak�e cel w�dr�wki pielgrzym�w przybywaj�cych do Nordmaru. Magowie przychodz� tu co dzie� by modli� si� w tym miejscu do Innosa.");

B_LogEntry(BookLog_NordmarAbbey,"Dom mag�w. Jest to siedziba Rady Ognia z�o�onej z pi�ciu wysokich arcymag�w klasztoru. Mie�ci si� tu r�wnie� nominalna siedziba najwy�szego arcymaga Kr�lestwa Myrtany, cho� od dawna utar� si� ju� zwyczaj, �e g�owa Ko�cio�a Innosa na sta�e zwyk�a rezydowa� w sto�ecznym Vengardzie.");

B_LogEntry(BookLog_NordmarAbbey,"Jaskinia o�wiecenia. To najwa�niejszy obiekt, do kt�rego wst�p maj� jedynie arcyMagowie Ognia oraz wybrani. Jest to w�a�ciwie centrum myrta�skiego Innosytyzmu. Znajduje si� w sporym p�kni�ciu ska�y, w kt�rej wykuto ogromny pomnik Innosa w miejscu, gdzie wed�ug tradycji, Pan Ognia objawi� si� Rhobarowi.");

B_LogEntry(BookLog_NordmarAbbey,"Cho� klasztor, b�d�cy celem w�dr�wek licznych pielgrzym�w, po�o�ony jest na ziemiach barbarzy�skich Nordmarczyk�w, kt�ry to lud w s�yn�� w przesz�o�ci z �upie�czych wypraw na po�udnie, to jednak mieszka�cy p�nocy nie zwykli krzywdzi� pielgrzym�w zmierzaj�cych do �wi�tego przybytku. Sami Nordmarczycy, jako gorliwi wyznawcy Innosa, otaczaj� Mag�w Ognia oraz sam klasztor ogromnym szacunkiem i gotowi s� go broni� za wszelk� cen�. Dlatego te�, mimo, �e sanktuarium znajduje si� w krainie s�siaduj�cej z ziemiami ork�w, to nigdy orkowie nie zdo�ali mu realnie zagrozi�.");

B_LogEntry(BookLog_NordmarAbbey,"Tu ko�cz� sw�j opis klasztoru w Nordmarze, skre�lony pi�rem skromnego pielgrzyma, Aidepa Thigo");

B_LogEntry(BookLog_NordmarAbbey,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// LEGENDY ARGAA�SKIE

// SUGEROWANA LOKACJA: OPUSZCZONY SKALNY POK�J NIEOPODAL G�RSKIEJ TWIERDZY

// KATEGORIA: ZWYCZAJNE - MO�NA T� KSI�G� DOSTA� U HANDLARZY, LUB ZNALE�� W OG�LNODOST�PNYCH MIEJSCACH /d

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LegendsofArgaania (C_ITEM)

{

name ="Legendy argaa�skie";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Ulran Plautis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_LegendsofArgaania;

};

FUNC VOID Use_Book_LegendsofArgaania()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Brown_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Brown_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Legendy argaa�skie");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Ksi�ga opisuj�ca poga�skie legendy i wierzenia Wysp Po�udniowych oraz Argaani.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LegendsofArgaania,LOG_NOTE);

B_LogEntry(BookLog_LegendsofArgaania,"Legendy argaa�skie");

B_LogEntry(BookLog_LegendsofArgaania,"Mieszka�cy Wysp Po�udniowych od wiek�w ju� wyznaj� bog�w, kt�rych czci�o i czci si� w Kr�lestwie Myrtany. Mimo to, jak w wi�kszo�ci krain, tak i tu, na wyspie Argaan, mo�na znale�� pozosta�o�ci dawnych kult�w. G��wnym b�stwem poga�skiego panteonu Argaa�czyk�w by�a Bogini, kt�ra wed�ug wierze� staro�ytnych mieszka�c�w Wysp Po�udniowych mia�a sta� na stra�y harmonii i strzec r�wnowagi we wszech�wiecie. Bogini by�a wi�c nieco podobna do Adanosa i pewnie dlatego dzisiejsi mieszka�cy wyspy ch�tniej oddaj� cze�� Panu Wody, ni� jego boskiemu bratu b�d�cemu Panem Ognia. Ciekawym rysem tej mitologii jest to, �e owe b�stwo mia�o ��czy� w sobie nawzajem zwalczaj�ce i r�wnowa��ce si� pierwiastki chaosu i porz�dku. ");

B_LogEntry(BookLog_LegendsofArgaania,"Niekiedy z owych wierze� poga�skich ewoluowa�y niezwykle obrazoburcze doktryny religijne. W wyniku docierania na wysp� wp�yw�w innosyckich i adanosyckich, a by� mo�e r�wnie� beliaryckich, w�r�d niekt�rych pogan wykszta�ci�o si� przekonanie, �e pod postaci� Adanosa kryje si� w�a�nie Bogini. Konsekwencj� tego typu przekona� by�o uznanie Innosa i Beliara za spersonifikowane si�y wewn�trz umys�u Bogini, maj�ce reprezentowa� elementy anarchii i �adu. To niezwykle obrazoburcze oczywi�cie twierdzenie, mia�y pokutowa� jeszcze d�ugo po tym jak Wyspy Po�udniowe sta�y si� krain� adanosyck�. Nawet dzi� dziwnie �ywe s� pog�oski jakoby w prastarym Klasztorze na Skale, zamieszka�ym przez mag�w wody, potajemnie praktykowano kult Bogini. Niemniej inkwizycja Mag�w Ognia zbadawszy spraw� zaprzeczy�a takowym rewelacjom, wi�c nale�a�oby je w�o�y� mi�dzy bajki�");

B_LogEntry(BookLog_LegendsofArgaania,"Jedn� z najbardziej znanych legend z Wysp Po�udniowych, jest ta o poga�skim b�stwie, zwanym Bogini� i wojnie jak� wyznawczynie tego b�stwa toczy�y mi�dzy sob�. Legenda g�osi, �e jeszcze zanim ludzie zacz�li rz�dzi� �wiatem, na Argaanii panowa� kult Bogini. By�a ona symbolem harmonii i opiekunem natury. S�u�y�y jej demonice Ahn'Bael, b�d�ce uciele�nieniem chaosu oraz siostry Ahn'Nosiri, strzeg�ce porz�dku. Bogini kierowa�a swoimi s�u�ebnicami, tak by na �wiecie panowa�a harmonia. Dzi�ki r�wnowadze ludzie nie cierpieli ani niewoli chaosu, ani tyranii praw, a Bogini odbiera�a od ludzi cze��.");

B_LogEntry(BookLog_LegendsofArgaania,"P�boskie s�u�ebnice wyrwa�y si� jednak spod kontroli Bogini i dosz�o mi�dzy nimi do wojny, kt�ra by�a bardzo wyczerpuj�ca dla obu stron. Wed�ug legendy mia�a prze�y� tylko jedna Ahn'Nosiri - Selena, a Ahn'Bael mia�y pogr��y� si� we �nie i czeka� na czas przebudzenia. Wed�ug legendy po wojnie kult bogini zacz�� podupada� i ostatecznie wypar�a go wiara w trzy b�stwa. Po latach na Argaanii na czo�o wysun�� si� r�d z Setarrif, a jego przyw�dca, Ethorn I, podporz�dkowa� sobie ca�� Argaani� oraz z nieznanych przyczyn toczy� zwyci�sk� wojn� z Jarkendarem. ");

B_LogEntry(BookLog_LegendsofArgaania,"W ci�gu nast�pnych wiek�w Kr�lestwo Argaanii sprawnie prosperowa�o, osi�gaj�c coraz wy�szy poziom rozwoju. Kres pot�gi Kr�lestwu Argaanii przynios�a dopiero ekspansja kr�la Myrtany Rhobara II, kt�ry podbi� Wyspy Po�udniowe i ustanowi� w nich kr�lewsk� prowincj�. Rozpoczyna�a si� nowa era w dziejach Argaani.");

B_LogEntry(BookLog_LegendsofArgaania,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// PER�A WYSP PO�UDNIOWYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG�W OGNIA /d

// NAPISANE NA GRUNCIE ARTYKU�U Z GOTHICPEDII Z ROZWINI�CIEM HISTORII LORDA DOMINIQUE

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Argaania (C_ITEM)

{

name ="Per�a Wysp Po�udniowych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_01.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Aidep Thigo";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Argaania;

};

FUNC VOID Use_Book_Argaania()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Per�a Wysp Po�udniowych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia i opis geograficzny Argaani, z uwzgl�dnieniem podboju przez Kr�lestwo Myrtany.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Argaania,LOG_NOTE);

B_LogEntry(BookLog_Argaania,"Per�a Wysp Po�udniowych");

B_LogEntry(BookLog_Argaania,"Argaan, zwana te� Argaani� to wysuni�ta najbardziej na p�noc wyspa archipelagu Wysp Po�udniowych, a dzi� cz�� Kr�lestwa Myrtany. Do kr�lestwa przy��czy� j� kr�l Rhobar w czasie przes�awnej kampanii wojennej, w czasie kt�rej odznaczy� si� mia� Lord Dominique.");

B_LogEntry(BookLog_Argaania,"Argaania posiada g�rzyst� rze�b� terenu o skalistym pod�o�u. Jest zapewne wysp� pochodzenia wulkanicznego, o czym �wiadczy jej stopniowo obni�aj�ca si� od centrum wyspy wysoko�� bezwzgl�dna nad poziomem morza oraz bogata rze�ba, urozmaicona licznymi wzg�rzami, nier�wno�ciami, urwiskami, kotlinami i klifami. Znamienn� cz�� wyspy zajmuje pasmo G�ry Bia�ookiej, kt�rej niedost�pne szczyty nie zosta�y zbadane przez cz�owieka. Zdecydowan� wi�kszo�� linii brzegowej wyspy stanowi� klify. Pla� i �agodnych brzeg�w jest bardzo ma�o i s� niewielkich rozmiar�w. Eksploracja Argaanii jest utrudniona ze wzgl�du na wyst�powanie licznych pasm wzg�rz oraz ska�, kt�rych uniemo�liwiaj�cymi piechurowi przemarsz. Poszczeg�lne jej krainy oddzielone s� od siebie w�skimi prze��czami, kt�re ze strategicznego punktu widzenia, stwarzaj� wiele mo�liwo�ci ataku oraz obrony.");

B_LogEntry(BookLog_Argaania,"W p�nocnej oraz zachodniej cz�ci Argaanii dominuje klimat umiarkowany. Podstaw� ro�linno�ci stanowi� g�ste trawy, niskie krzewy oraz lasy iglaste, li�ciaste i mieszane. Pospolicie spotykanymi ro�linami s� ziela lecznicze, ziela many i ogrzyli�cie. Powszechnie wyst�puj�c� zwierzyn� s� wilki, �cierwojady, dziki i krwiopijcy. Stale wzrasta tak�e populacja goblin�w. Klimat sprzyja osadnictwu oraz uprawie roli, a okoliczne wody zasobne s� w ryby. Dlatego w  tej strefie klimatycznej wyst�puje najwi�cej skupisk ludno�ci argaa�skiej � mi�dzy innymu miasta: Stewark oraz Thorniara, Zamek Srebrow�d czy obozowiska na po�y adanosyckich Go�c�w Le�nych, kt�rzy niegdy� zamieszkiwali r�wnie� Myrtan�.");

B_LogEntry(BookLog_Argaania,"Po�udnie oraz wsch�d wyspy zdominowa� klimat tropikalny. Na po�udniu wykszta�ci�o si� wielkie bagno, ponad kt�rym wznosi si� ogromne drzewo Tooshoo, kt�remu przypisuje si� w�a�ciwo�ci magiczne � zapewne wiara takowa wywodzi si� jeszcze z czas�w poga�skich. Na owych bagnach wyst�puje bardzo bujna szata ro�linno�ci � od paproci, przez palmy, po ogromne drzewa o roz�o�ystych koronach i rozwarstwiaj�cych si� u nasady pniach. Rejon ten zasobny jest tak�e w bagienne ziele, kt�re stanowi sk�adnik zanej u�ywki. Na nieprzygotowanego w�drowca w terenach czai si� tam jednak wiele niebezpiecze�stw: podmok�e pod�o�e, gor�ca temperatura, bardzo wysoka wilgotno�� powietrza oraz wiele okaz�w egzotycznych zwierz�t, takich jak w�e b�otne, jaszczury, topielce, z�bacze oraz krwiopijce.");

B_LogEntry(BookLog_Argaania,"Wsch�d wyspy z kolei pokrywa g�sta oraz niebezpieczna d�ungla. Ze wzgl�du na bardzo ci�kie warunki klimatyczne oraz terenowe w wi�kszo�ci jest ona niezamieszka�a. D�ungla jest natomiast domem dla wielu egzotycznych gatunk�w zwierz�t, m.in. brzytwiak�w, �cierwojad�w, ko�ciojad�w, szuwarnik�w, a nawet cieniostwor�w i trolli. Mimo wszystko w sercu d�ungli zlokalizowane jest prastare miasto Setarrif, b�d�ce jednocze�nie stolic� wyspy.");

B_LogEntry(BookLog_Argaania,"Po�udniowo-wschodni kraniec wyspy to ja�owy oraz wulkaniczny obszar Czarnych Jar�w � sieci stromych wzg�rz, w�woz�w oraz klif�w. Ten obszar prawdopodobnie w og�le nie pozwala na osadnictwo, jednak na wyskoim klifie na skraju wyspy po�o�ony jest pradawny klasztor, znajduj�cy si� w posiadaniu tamtejszych mag�w wody.");

B_LogEntry(BookLog_Argaania,"Samo centrum Argaani stanowi pasmo G�ry Bia�ookiej. Wysokie po�o�enie nad poziomem morza sprawia, �e pasmo g�rskie pokrywa warstwa wiecznego �niegu, a obszar nie nadaje si� do zamieszkania.");

B_LogEntry(BookLog_Argaania,"Najwi�ksze skupiska ludno�ci zlokalizowane s� w miastach i osadach oraz ich okolicach. Najwi�cej skupisk ludno�ci znajduje si� w zachodniej oraz p�nocnej cz�ci wyspy, w kt�rej to warunki klimatyczne s� najdogodniejsze. Tutaj te� powsta�y najwi�ksze ludzkie osady na wyspie. Mieszka�cy Argaanii trudni� si� r�norodnymi zawodami. Dominuj�cymi s� kupiectwo, �owiectwo oraz alchemia, lecz spora cz�� ludno�ci zajmuje si� r�wnie� upraw� roli i rybo��wstwem. W Setarrif z kolei powa�n� rol� odgrywa tkactwo oraz zdobnictwo, o czym �wiadcz� wyj�tkowo ozdobione szaty setarrifczyk�w. ");

B_LogEntry(BookLog_Argaania,"Podzia� spo�eczny obejmuje klasy mo�now�adztwa, do kt�rego wliczaj� si� przede wszystkim rycerstwo, magowie, osoby z kr�g�w rz�dz�cych miastami i spokrewnione z dworem setarrifskim, oraz klas ni�szych, takich jak szeroko rozumiane mieszcza�stwo, ch�opstwo, rybacy czy my�liwi. Niewielk� cz�� populacji stanowi� r�wnie� imigranci z Myrtany oraz Khorinis, kt�rzy w wi�kszo�ci nap�yn�li tu ju� po podboju Wysp Po�udniowych przez kr�la Rhobara. Cz�� z nich to urz�dnicy, lub rzadziej osadnicy wojskowi, cho� coraz cz�ciej mo�na tu te� spotka� cywilnych Myrta�czyk�w. ");

B_LogEntry(BookLog_Argaania,"Na Argaanii swe naturalne siedziby maj� r�wnie� orkowie. Rasa ork�w argaa�skich stoi na zdecydowanie ni�szym poziomie od ork�w z kontynentu, lecz nieznacznie wy�szym od odmiany z Khorinis. Dwa orkowe szczepy maj� swoje siedziby w jaskiniach w Srebrowodzie oraz w jaskinich mi�dzy bagnami a Czarnymi Jarami.");

B_LogEntry(BookLog_Argaania,"Granice jednostek admnistracyjnych Argaanii zosta�y oparte w przybli�eniu na podstawie rzek, pasm g�rskich oraz w�woz�w. Prawdopodobnie zosta�y wytyczane wraz z rozwojem Kr�lestwa Argaanii, jednak po podboju przez Myrtan� zosta�y zachowane. ");

B_LogEntry(BookLog_Argaania,"Na wyspie znajduj� si� r�wnie� wie�e stra�nicze, kt�re zosta�y postawione przez jednego z kr�l�w Wysp Po�udniowych. Ich system ostrzegawczy polega na tym, �e gdy stra�nicy b�d� widzieli z jednej z wie� statki nieprzyjaciela, zapal� ogie� ostrzegawczy. Wtedy zauwa�a to druga wie�a, potem trzecia i tak sygna� dociera do najbli�szego miasta, gdzie organizowano oddzia�y do obrony. Takie wie�e do dzi� znajduj� si� na terenie wok� brzeg�w wyspy Argaan, a kr�l Rhobar II do�o�y� wszelkich stara� by je odbudowa� i odnowi� ich system.");

B_LogEntry(BookLog_Argaania,"G��wnym miastem wyspy i za razem stolic� przedmyrta�skiego Kr�lestwa jest Setarrif � po�o�ony na wschodzie wyspy kompleks pa�ac�w, b�d�cy siedzib� g�owy pa�stwa, dworu kr�lewskiego oraz mo�now�adztwa. Miasto opr�cz funkcji reprezentacyjnej, pe�ni r�wnie� funkcj� obronn�. W obr�bie Setariff znajduje si� r�wnie� kopalnia licznych szlachetnych minera��w, m.in. z�ota i magicznej rudy, co od wiek�w zapewnia�o miastu dostatek.");

B_LogEntry(BookLog_Argaania,"Na p�wyspie na p�nocy le�y najwi�ksze miasto wyspy � Thorniara. Osada sta�a si� siedzib� w�adz myrta�skich po podboju Argaanii. Po wygranej kampanii, osiad� w niej pierwszy kr�lewski namiestnik wysp, Lord Dominique.");

B_LogEntry(BookLog_Argaania,"W czasie kr�tkiego okresu swego panowania Lorda Dominique, pr�bowa� on nak�oni� jej mieszka�c�w wysp do wi�kszego poszanowania dla Innosa, gdy� dotychczas kult po�udniowc�w skupia� si� na Adanosie, a Innos pozostawa� niejako w cieniu swego boskiego brata. W celu nawr�cenia mieszka�c�w Wysp Po�udniowych, pochowa� z�ote pos��ki Innosa po ca�ej wyspie. Lud Argaanii jednak nie wykaza� si� znacznym zapa�em w poszukiwaniach; znalezionymi pos��kami zacz�to handlowa�. Lord Dominique si� tym bardzo zasmuci�. Bohater wojenny nie czuj�c si� dobrze w roli zarz�dcy, a tak�e czuj�c niech�� czy nawet nienawi�� mieszka�c�w wysp do jego osoby prosi kr�la o odebranie mu jego funkcji i oddelegowanie go do walk na froncie.");

B_LogEntry(BookLog_Argaania,"Rhobar II przysta� na pro�b� zas�u�onego paladyna i namiestnikiem Argaani, a co za tym idzie r�wnie� wszystkich pozosta�ych wysp archipelagu mianowa� Lorda Trontera. Rycerz ten, cho� nie by� cz�ci� paladynem, to sprawowa� namiestnictwo nad Srebrowodem, b�d�cym jedn� z prowincji argaa�skich. W przysz�o�ci Lord Dominique mia� powr�ci� na Argani�, gdy� po tym jak poleg� w czasie walk z orkami, szcz�tki jego zosta�y sprowadzone na wysp�, na kt�rej odni�s� swe najwi�ksze zwyci�stwo, kt�re zapewni�o mu nie�miertelno�� w�r�d potomnych. Zosta� pochowany w grobowcu niedaleko Thorniary. ");

B_LogEntry(BookLog_Argaania,"Ze wzgl�du na du�y port oraz po�o�enie na szlaku handlowym, Thorniara ma kluczowe znaczenie gospodarcze, a dzi�ki pot�nej twierdzy i murom obronnym, posiada ogromne walory obronne i militarne. Miastu podlegaj� r�wnie� okoliczne wioski i farmy.");

B_LogEntry(BookLog_Argaania,"Zach�d wyspy obejmuje Baronia Stewark. Po�o�ony na przeci�ciu szlak�w handlowych region jest r�wnie� zapleczem rolniczym i rybackim ca�ej wyspy. Piecz� nad prowincj� sprawuje silnie ufortyfikowane miasto-twierdza Stewark.");

B_LogEntry(BookLog_Argaania,"W centralnej cz�ci wyspy le�y Baronia Srebrow�d. W jej obr�bie znajduje si� siedziba Go�c�w Le�nych, siedlisko ork�w, stolic� administracyjn� regionu stanowi za� Zamek Srebrow�d. Prowincja ta nastawiona jest przede wszystkim na �owiectwo oraz wymian� handlow� z przyja�nie nastawionym do ludzi klanem ork�w.");

B_LogEntry(BookLog_Argaania,"Na klifie na po�udniowo-wschodnim p�wyspie Argaanii mie�ci si� klasztor, w kt�rym mnisi oddaj� cze�� Adanosowi, cho� niekt�re pog�oski uporczywie twierdz�, jakoby w murach tych mia� przetrwa� poga�ski kult Bogini wyznawanej niegdy� na wyspie.");

B_LogEntry(BookLog_Argaania,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM I

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart1 (C_ITEM)
{

name ="Kodeks Markwarta. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart1;

};

FUNC VOID Use_Book_Markwart1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart1,LOG_NOTE);

B_LogEntry(BookLog_Markwart1,"Kodeks Markwarta. Tom I");

B_LogEntry(BookLog_Markwart1,"Dla po�ytku potomno�ci, uczony Markwart, zebra� ch�opskie prawo zwyczajowe obowi�zuj�ce w okolicach Montery i wyda� w kilku tomach. Za zgod� i z b�ogos�awie�stwem Kr�la, podj�� si� opracowania jednolitego sposobu post�powania w sprawach wiejskich, by w ca�ym pa�stwie obowi�zywa�o wsp�lne prawo w tej materii. ");

B_LogEntry(BookLog_Markwart1,"Zbi�r praw uwzgl�dnia tylko przypadki mog�ce mie� miejsce w �rodowisku ch�opskim. Pomini�to przy tym miasta, gdy� te posiadaj� odr�bne przywileje dane im od monarch�w i pan�w feudalnych.  W spisie tym pr�no szuka� odpowiedzi na pytania, w jaki spos�b kara� zab�jstwa, oszustwa, czy krzywoprzysi�stwo. ");

B_LogEntry(BookLog_Markwart1,"Wymienionych wy�ej przest�pstw jako mog�cych mie� miejsce r�wnie� poza wsi�, nale�y szuka� w bardziej og�lnych zbiorach praw, kt�rych zapisy obowi�zuj� tak�e ch�op�w.�Z woli mi�o�ciwego kr�la Rhobara II, jedynego w�adcy Myrtany i namiestnika Innosa na ziemi, do r�k czytelnika trafia nowe wydanie tego dzie�a.");

B_LogEntry(BookLog_Markwart1,"Ku Chwale Pana Ognia, co bogiem jest prawa i porz�dku. Redagowa��Socius z Vengardu");

B_LogEntry(BookLog_Markwart1,"Rozdzia� I: O pozwie");

B_LogEntry(BookLog_Markwart1,"�1. Je�eli zgodnie z kr�lewskimi prawami kto� zostanie pozwany przed s�d i nie stawi si� przed jego oblicze, zostanie zas�dzony na zap�at� 300 sztuk z�ota, o ile nie powstrzyma�a go od stawienia si� si�a przemo�na.");

B_LogEntry(BookLog_Markwart1,"�2. Ten za� kto pozwa� innego a sam nie stawi� si� przed oblicze s�du, je�eli go nie powstrzyma�a si�a przemo�na zap�aci 300 sztuk z�ota.");

B_LogEntry(BookLog_Markwart1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM II

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart2 (C_ITEM)

{

name ="Kodeks Markwarta. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart2;

};

FUNC VOID Use_Book_Markwart2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart2,LOG_NOTE);

B_LogEntry(BookLog_Markwart2,"Kodeks Markwarta. Tom II");

B_LogEntry(BookLog_Markwart2,"Rozdzia� II: O kradzie�y wieprz�w�");

B_LogEntry(BookLog_Markwart2,"�1. Je�eli kto� ukradnie prosi� od maciory z zagrody i zostanie mu to udowodnione b�dzie zas�dzony na 24 sztuk z�ota�");

B_LogEntry(BookLog_Markwart2,"�2. Je�eli kto� ukradnie prosi� mog�ce �y� bez maciory i zostanie mu to udowodnione, b�dzie zas�dzony na 36 sztuk z�ota");

B_LogEntry(BookLog_Markwart2,"�3. Je�eli kto� ukradnie dwuletni� �wini� b�dzie zas�dzony na 50 sztuk z�ota oraz zap�at� szkody i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart2,"�4. Je�eli kto� ukradnie ody�ca zostanie zas�dzony na 50 sztuk z�ota oraz zap�at� jego warto�ci i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart2,"�5. Je�eli kto� ukradnie karmi�c� macior� zap�aci 60 sztuk z�ota, a ponadto zap�aci odszkodowanie i kwot� za zw�ok�.");

B_LogEntry(BookLog_Markwart2,"�6. Je�eli kto� ukradnie wieprza przeznaczonego na ofiar�, a ten kto go postrada� przy pomocy �wiadk�w udowodni, �e by�o to zwierz� ofiarne b�dzie zas�dzony na 75 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart2,"�7. Je�eli kto� ukradnie wieprza nie przeznaczonego na ofiar� b�dzie zas�dzony na 40 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM III

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart3 (C_ITEM)

{

name ="Kodeks Markwarta. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart3;

};

FUNC VOID Use_Book_Markwart3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart3,LOG_NOTE);

B_LogEntry(BookLog_Markwart3,"Kodeks Markwarta. Tom III");

B_LogEntry(BookLog_Markwart3,"Rozdzia� III: O kradzie�y kr�w");

B_LogEntry(BookLog_Markwart3,"�1. Je�eli kto� ukradnie ciel� od krowy i zostanie mu to udowodnione zas�dzony b�dzie na 340 sztuk z�ota.");

B_LogEntry(BookLog_Markwart3,"�2. Je�eli kto� ukradnie ciel� mog�ce �y� bez krowy i zostanie mu to udowodnione, b�dzie zas�dzony na 54 sztuk z�ota.");

B_LogEntry(BookLog_Markwart3,"�3. Je�eli kto� ukradnie dwuletni� krow� zostanie zas�dzony na 70 sztuk z�ota oraz zap�at� szkody i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart3,"�4. Je�eli kto� ukradnie byka zostanie zas�dzony na 80 sztuk z�ota oraz zap�at� jego warto�ci i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart3,"�5. Je�eli kto� ukradnie karmi�c� krow� zap�aci 80 sztuk z�ota, a ponadto zap�aci odszkodowanie i kwot� za zw�ok�.");

B_LogEntry(BookLog_Markwart3,"�6. Je�eli kto� ukradnie byka przeznaczonego na ofiar�, a ten kto go postrada� przy pomocy �wiadk�w udowodni, �e by�o to zwierz� ofiarne zostanie zas�dzony na 80 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart3,"�7. Je�eli kto� ukradnie wieprza nie przeznaczonego na ofiar� zostanie zas�dzony na 70 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart3,"KONIEC TOMU III");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IV

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart4 (C_ITEM)

{

name ="Kodeks Markwarta. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart4;

};

FUNC VOID Use_Book_Markwart4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart4,LOG_NOTE);

B_LogEntry(BookLog_Markwart4,"Kodeks Markwarta. Tom IV");

B_LogEntry(BookLog_Markwart4,"Rozdzia� IV: O kradzie�y owiec i k�z�");

B_LogEntry(BookLog_Markwart4,"�1. Je�eli kto� ukradnie jagni�, kozy zostanie zas�dzony na 7 sztuk z�ota oraz sp�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart4,"�2. Je�eli kto� ukradnie rocznego lub dwuletniego barana zostanie skazany na 120 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart4,"�3. Je�eli kto� ukradnie owce zostanie skazany na 20 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zwlok�.");

B_LogEntry(BookLog_Markwart4,"�4. Je�eli kto� ukradnie ma�� koz� zostanie zas�dzony na 7 sztuk z�ota oraz sp�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart4,"�5. Je�eli kto� ukradnie rocznego lub dwuletniego koz�a zostanie skazany na 12 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart4,"�6. Je�eli kto� ukradnie koz�, zostanie skazany na 20 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart4,"KONIEC TOMU IV");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM V

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart5 (C_ITEM)

{

name ="Kodeks Markwarta. Tom V";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart5;

};

FUNC VOID Use_Book_Markwart5()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart5,LOG_NOTE);

B_LogEntry(BookLog_Markwart5,"Kodeks Markwarta. Tom V");

B_LogEntry(BookLog_Markwart5,"Rozdzia� V: O kradzie�y ps�w i pszcz�");

B_LogEntry(BookLog_Markwart5,"�1. Je�eli kto� ukradnie tresowanego psa �owieckiego zostanie skazany na 40 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart5,"�2. Je�eli kto� ukradnie charta - naganiacza zostanie skazany na 40 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart5,"�3. Je�eli kto� ukradnie lub zabije psa pasterskiego zostanie skazany na 120 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart5,"�4. Kto ukradnie jeden lub wi�cej pni pszcz� pozostaj�cych w zamkni�ciu i pod dachem zostanie skazany na 80 sztuk z�ota, opr�cz odszkodowania i kwoty za zwlok�.");

B_LogEntry(BookLog_Markwart5,"�5. Kto ukradnie jeden lub wi�cej uli z pszczo�ami pozostaj�cymi na otwartej przestrzeni zostanie skazany na 50 sztuk z�ota,�opr�cz odszkodowania i kwoty za zwlok�.");

B_LogEntry(BookLog_Markwart5,"KONIEC TOMU V");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IX

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI� MI�DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart9 (C_ITEM)

{

name ="Kodeks Markwarta. Tom IX";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart9;

};

FUNC VOID Use_Book_Markwart9()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "Book_Red_L.tga", 0);

Doc_SetPage ( nDocID,  1, "Book_Red_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom IX");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch�opskie prawo zwyczajowe z okolic Montery, rozci�gni�te na ludno�� wie�niacz� ca�ego Kr�lestwa Myrtany. Po utworzeniu Magicznej Bariery w G�rniczej Dolinie i obj�ciu wi�kszej ilo�ci przest�pstw kar� zes�ania do Kolonii Karnej, spisane tu prawa straci�y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby pozna� pe�n� tre�� ksi�gi zajrzyj do kategorii 'Pozosta�e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart9,LOG_NOTE);

B_LogEntry(BookLog_Markwart9,"Kodeks Markwarta. Tom IX");

B_LogEntry(BookLog_Markwart9,"Rozdzia� IX: O szkodach wyrz�dzonych w zasiewach, lub w innych ogrodzonych uprawach");

B_LogEntry(BookLog_Markwart9,"�1. Kto cudze zwierz�, konia lub wo�u oznakuje zostanie skazany na 180 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart9,"�2. Kto zastanie w swoich zasiewach cudze byd�o, nie mo�e go zabi�. Gdyby to uczyni� i obwie�ci�, winien wynagrodzi� szkod�, a to co zabi� zachowa dla siebie. Je�eli jednak tego nie og�osi� a zostanie mu to udowodnione, b�dzie on skazany na 150 sztuk z�ota oraz zap�at� odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart9,"�3. Kto w swoich zasiewach zastanie cudze byd�o bez nadzoru i zamknie je w ukryciu nie og�aszaj�c tego, a cz�� byd�a zdechnie zostanie on skazany na 160 sztuk z�ota, opr�cz odszkodowania i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart9,"�4. Kto przez swoje niedbalstwo wyrz�dzi krzywd� u wo�u lub innego zwierz�cia i wyzna to swojemu panu winien wynagrodzi� szkod�. Je�eli jednak k�amie, a zostanie mu to udowodnione zostanie on skazany na 120 sztuk z�ota, opr�cz wynagrodzenia szkody i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart9,"�5. Kto czyje� �winie lub byd�o pozostaj�ce pod stra�� pastucha wp�dzi w cudze zasiewy i mimo jego wykr�t�w zostanie mu to udowodnione zostanie on skazany na 200 sztuk z�ota, opr�cz odszkodowania strat i kwoty za zw�ok�.");

B_LogEntry(BookLog_Markwart9,"�6. Je�eli czyje� zwierze zostanie zaj�te z powodu wyrz�dzonych szk�d na cudzym polu, w�a�ciciel zwierz�cia wynagrodzi poniesione straty a nadto zap�aci 100 sztuk z�ota.");

B_LogEntry(BookLog_Markwart9,"�7. Je�eli kto� kieruj�c si� wrogo�ci� lub zuchwa�o�ci� wa�y si� si�� odebra� byd�o zaj�te z tytu�u szk�d wyrz�dzonych w polu lub wykra�� je spod zamkni�cia zastanie skazany na 200 sztuk z�ota.");

B_LogEntry(BookLog_Markwart9,"�8. Kto otwiera cudze ogrodzenia i na jakiekolwiek uprawy skieruje trzod�, co zostanie przez �wiadk�w udowodnione, zostanie on skazany na rzecz poszkodowanego na wyr�wnanie szacowanych strat a ponadto na 200 sztuk z�ota.�");

B_LogEntry(BookLog_Markwart9,"KONIEC TOMU IX");

};