/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* KSI GI KLASYCZNE
******* Opis: KsiÍgi w tym pliku dotyczπ najrÛøniejszych
******* rzeczy. Od alchemii, aø po kwestie lore.
******* KsiÍgi klasyczne nie posiadajπ wielu stronic
******* i sπ zrealizowane skryptowo (bez uøycia tekstury z
******* gotowymi napisami).
*****************************************************/

/*****************************************************
******* KATEGORIA: ALCHEMIA
*****************************************************/

INSTANCE ItWr_FullRegeneratePotions (C_Item)
{	
	name 				=	"Pe≥nia øycia i many - przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	200;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_FullPots;
	scemeName			=	"MAP";
	description			= 	"Przepis na mikstury pe≥ni";
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
					Doc_PrintLines	( nDocID,  0, "Pe≥nia øycia");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki:");
					Doc_PrintLine	( nDocID,  0, "- Owoc velais");
					Doc_PrintLines	( nDocID,  0, "- Duøe zio≥a uzdrawiajπce");
					Doc_PrintLines	( nDocID,  0, "- 3 serafisy");
					Doc_PrintLines	( nDocID,  0, "- Butelka oleju syrianicznego");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Pe≥nia many");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki:");
					Doc_PrintLine	( nDocID,  0, "- Nasiona czerwonego buka");
					Doc_PrintLines	( nDocID,  0, "- GÛrski mech");
					Doc_PrintLines	( nDocID,  0, "- 3 kocianki");
					Doc_PrintLines	( nDocID,  0, "- Butelka oleju syrianicznego");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
					
	var int einMal_BkPnie1;
	if (einMal_BkPnie1 == false)
	{
	HeroKnows_AlchemyFullRegenarate = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry			(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia mikstury pe≥ni øycia i many.");	
	einMal_BkPnie1 = true;
	};
};	

/******************************************************************************************/
INSTANCE ItWr_AlchemyPermPotions1(C_Item) //oryginalna instancja ItWr_AlchemyPermPotions1
{	
	name 					=	"Mikstury trwa≥e";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"Tom 1";
	TEXT[3]					= 	"Mikstura si≥y i zrÍcznoúci";
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
  					//STR ogniocierÒ, woda, kocianka, bagienne ziele
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0, "Mikstury trwa≥e");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Mikstura si≥y");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "TÍ jakøe potÍønπ miksturÍ trzeba warzyÊ powoli i delikatnie. Najpierw sok z dwÛch ogniocierniÛw wlewamy do naczynia wype≥nionego olejem syrianicznym. NastÍpnie dorzucamy trzy posiekane kocianki powoli mieszajπc. Gdy zacznie wrzeÊ wrzucamy ususzone bagienne ziele. Wtedy z ogniociernia uwalnia siÍ ca≥a jego esencja. ");
					Doc_PrintLine	( nDocID,  0, "");
					
					// liúÊ dÍbu, woda, kocianka, bagienne ziele
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Mikstura zrÍcznoúci");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "MiksturÍ tÍ warzymy podobnie jak bliüniaczπ dla niej miksturÍ si≥y. Tym razem jednak podstawπ mikstury jest liúÊ wysokiego dÍbu. Z pewnoúciπ dla kaødego poczπtkujπcego alchemika wydaje siÍ to dosyÊ abstrakcyjne. Jednak ten niepozorny liúÊ wp≥ywa na zrÍcznoúÊ ludzkiego cia≥a. Wywar powstaje na oleju syrianicznym.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		

	var int einMal_BkPp1;
	if (einMal_BkPp1 == false)
	{
	HeroKnows_AlchemyPermPotions1 = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia mikstury si≥y i zrÍcznoúci.");	
	einMal_BkPp1 = true;
	};
	};
	
/******************************************************************************************/
INSTANCE ItWr_AlchemyPermPotions2(C_Item) 
{	
	name 					=	"Mikstury trwa≥e";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"Tom 2";
	TEXT[3]					= 	"Mikstura øycia i many";
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
 					Doc_PrintLine	( nDocID,  0, "Mikstury trwa≥e");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Mikstura øycia");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ta mikstura potrafi zwiÍkszyÊ energiÍ øyciowπ wojownika.");
					Doc_PrintLines	( nDocID,  0, "W przeciwieÒstwie do innych mikstur wszystkie sk≥adniki dodajemy dopiero, gdy olej syrianiczny zacznie wrzeÊ. Pierwszym sk≥adnikiem jest ususzone i zmielone krucze ziele (8 sztuk). NastÍpnie dodajemy 3 úwieøe, silne zio≥a uzdrawiajπce. Gotujemy po czym dodajemy dwie psianki.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Mikstura energii");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mag znajπcy sztukÍ alchemii moøe wzmocniÊ swπ magicznπ moc za pomocπ tej mikstury. Podstawowym jej sk≥adnikiem jest dragot (niezbÍdne sπ 2 sztuki), ktÛry uwalnia esencjÍ czarnego ziela (potrzeba 5 sztuk). Obydwa sk≥adniki naleøy uprzednio zasuszyÊ. Wywar powstaje na oleju syrianicznym.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );	
					
	var int einMal_BkPp2;
	if (einMal_BkPp2 == false)
	{
	HeroKnows_AlchemyPermPotions2 = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia mikstury øycia i many.");	
	einMal_BkPp2 = true;
	};
	};
	
/*************************************************************/
INSTANCE ItWr_AlchemySprintPotions(C_Item)
{	
	name 					=	"Mikstury szybkoúci";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	
	TEXT[2]					= 	"";
	TEXT[3]					= 	"Mikstury pozwalajπce na sprint";
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
 					Doc_PrintLine	( nDocID,  0, "Mikstura szybkoúci");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 
  					Doc_PrintLine	( nDocID,  0, "");		
					Doc_PrintLines	( nDocID,  0, "Mikstury szybkoúci pozwalajπ na szybsze przemieszczanie siÍ. Wp≥ywajπ na wydolnoúÊ organizmu kaødego kto je zaøyje. Niezwykle przydatne podczas zwiadÛw. Mikstury moøna sporzπdziÊ z rÛønych roúlin co wp≥ywa na ich intensywnoúÊ. ");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			);//  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Sk≥adniki");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "- zÍbate ziele (do lekkiej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- ciemny grzyb (do úredniej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- orkowe ziele (do duøej mikstury)");
					Doc_PrintLines	( nDocID,  1, "- Serafis");
					Doc_PrintLines	( nDocID,  1, "- woda");
					//Doc_PrintLine	( nDocID,  1, "- olej syrianiczny");
					//Doc_PrintLine	( nDocID,  1, "Przyrzπdzanie");
					//Doc_PrintLine	( nDocID,  1, "");
					//Doc_PrintLines	( nDocID,  1, "Podgrzewamy wodÍ. Gdy osiπgnie odpowiedniπ temperaturÍ, wrzucamy zÍbate ziele (razem z korzeniem). Jest to jedna z najprostszych mikstur. Aby wzmocniÊ jej dzia≥anie postÍpujemy analogicznie jak z innymi miksturami. Zosta≥o to juø opisane w innych ksiπøkach, dlatego nie bÍdÍ przytacza≥. ");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		
					
	var int einMal_BkSP1;
	if (einMal_BkSP1 == false)
	{
	HeroKnows_AlchemySprintPotions = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia mikstur szybkoúci.");	
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
	
	TEXT[2]					= 	"KsiÍga opisuje wywary czasowo";
	TEXT[3]					= 	"zwiÍkszajπce atrybuty wojownika.";
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
					Doc_PrintLines	( nDocID,  0, "Mikstury tymczasowe pozwalajπ na nietrwa≥e podniesienie kluczowych atrybutÛw wojownika takich jak si≥a czy zrÍcznoúÊ. Jest to niezwykle przydatne przed trudnymi walkami. Wszystkie mikstury powstajπ tak samo. RÛøniπ siÍ jedynie g≥Ûwnym sk≥adnikiem.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki");
					Doc_PrintLines	( nDocID,  0, "- Czysty alkohol (do wszystkich mikstur)");
					Doc_PrintLines	( nDocID,  0, "- Bagienne ziele (do wszystkich mikstur)");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "- Leúne zio≥o (do wywaru si≥y)");
					Doc_PrintLines	( nDocID,  1, "- GÛrskie zio≥o (do wywaru many)");
					Doc_PrintLines	( nDocID,  1, "- Polne zio≥o (do wywaru zrÍcznoúci)");
					Doc_PrintLines	( nDocID,  1, "- Nadmorskie zio≥o (do wywaru punktÛw øycia) ");
					Doc_PrintLines	( nDocID,  1, "- Polne i leúne zio≥o (do wywaru potÍgi) ");
					Doc_PrintLines	( nDocID,  1, "Do ch≥odnej wody wrzucamy zio≥o (jakie - zaleøy od mikstury jakπ chcemy przyrzπdziÊ) po czym ca≥oúÊ podgrzewamy. NastÍpnie studzimy");	
					Doc_PrintLines	( nDocID,  1, "i dodajemy bagienne ziele. Jeøeli po≥πczymy leúne");
					Doc_PrintLines	( nDocID,  1, "i polne zio≥o otrzymamy wywar potÍgi, zwiÍkszajπcy si≥Í i zrÍcznoúÊ.");
					Doc_Show		( nDocID );	
	var int einMal_BkWw1;
	if (einMal_BkWw1 == false)
	{
	HeroKnows_AlchemyTimedPotions = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia wywaru si≥y, wywaru many, wywaru zrÍcznoúci, wywaru øycia i wywaru potÍgi.");	
	einMal_BkWw1 = true;
	};							
};		

/******************************************************************************************/	
INSTANCE ItWr_AlchemyPowerPotions(C_Item)
{	
	name 					=	"Napoje krÛlÛw";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	"Napoje potÍgi";
	
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
 					Doc_PrintLine	( nDocID,  0, "Napoje krÛlÛw");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "O obu napojach");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "NapÛj potÍgi i napÛj w≥adzy to dwie potÍøne mikstury. Stosowane zazwyczaj przed waønπ walkπ przez krÛlÛw i dowÛdcÛw dla wzmocnienia wydolnoúci organizmu. Naleøy jednak stosowaÊ je z rozwagπ i rozsπdkiem.");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Sk≥adniki");
					Doc_PrintLines	( nDocID,  1, "- OgniocierÒ (2x napÛj potÍgi, 3x napÛj w≥adzy)");
					Doc_PrintLines	( nDocID,  1, "- LiúÊ dÍbu (1x napÛj potÍgi, 2x napÛj w≥adzy)");
					Doc_PrintLines	( nDocID,  1, "- Roztarte bagienne ziele (1x napÛj potÍgi, 2x napÛj w≥adzy)");
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
	B_LogEntry		(NOTE_AlchemyRecepts,	"UmiejÍtnoúÊ sporzπdzenia najpoju potÍgi i napoju w≥adzy.");	
	einMal_BkPwP1 = true;
	};					
	};		
	
	
	
	
	
/******************************************************************************************/	
	INSTANCE AlchemiaTrwaleWzomcnienia(C_Item)
{	
	name 					=	"XXX KSI GA DO USUNI CIA XXX";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	600;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	TEXT[1]				= "Opisuje jak";
	TEXT[2]				= "wzmacniaÊ";
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
  					Doc_PrintLine	( nDocID,  0, "mikstur trwa≥ych");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Ma≥o ktÛry poczπtkujπcy alchemik wie, øe uwarzonπ miksturÍ moøna wzmocniÊ. Zazwyczaj kojarzπ oni sk≥adniki takie jak: olej syrianiczny i czysty alkohol z innymi miksturami. Moje doúwiadczenia pokaza≥y, øe dolanie butelki oleju syranicznego powoduje wzmocnienie skutkÛw mikstury.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)

					Doc_PrintLines	( nDocID,  1, "Tymczasem dolanie dwÛch butelek alkoholu powoduje jeszcze skuteczniejsze efekty. Widoczne alkohol powoduje wyzwolenie siÍ wyciπgu z chociaøby ogniociernia. Ostatecznie powoduje to wzmocnienie efektu mikstury.");
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
	description			= 	"Wydarta strona ksiπøki";
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
					Doc_PrintLines	( nDocID,  0, "Nasiona ogniociernia wrzucamy do wody. Zalewamy olejem syrianicznym. Dynamicznie mieszamy dodajπc powoli roztarte ziele. NastÍpnie wrzucamy liúÊ dÍbu i zio≥o uzdrawiajπce. Ca≥oúÊ gotujemy do wrzenia."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Powodzenia."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
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
	description				= "Przepisy";
	TEXT[0]					= "Na zupy rybne";
	TEXT[5]					=  NAME_Value;
	COUNT[5]				=  value;
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
 					Doc_PrintLines	( nDocID,  0, "Pstrπg tÍczowy"					);		
Doc_PrintLine	( nDocID,  0, "");					
					Doc_PrintLines	( nDocID,  0, "Ta niezwykle silna ryba jest cennym ≥upem. Trudno jπ z≥owiÊ. Jednak zupa z dwÛch sztuk moøe znacznie podnieúÊ naszπ magicznπ moc. Warto dodaÊ do takiej zupy takøe ryø.");
					Doc_PrintLines	( nDocID,  0, "Pstrπg pospolity"	);	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Do zupy z pstrπga naleøy dodaÊ duøπ iloúÊ soli. Moøna jπ takøe doprawiÊ odrobinπ wina. ");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Sandacz"					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "ZupÍ z sandacza warto przygotowaÊ wraz z zio≥ami leczniczymi. PonoÊ spoøycie kilku takich zup podnosi wytrzyma≥oúÊ."	);
					Doc_PrintLine	( nDocID,  1, "Karaú"					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Zupa z karasi najlepiej smakuje z suchym chlebem. Trzeba pamiÍtaÊ, aby nie gotowaÊ jej z byt d≥ugo.");
					Doc_Show		( nDocID );
					
					if (HeroKnows_CookingFish == FALSE)
					{
					HeroKnows_CookingFish = TRUE;
					Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
					B_LogEntry		(NOTE_CookingRecepts,	"UmiejÍtnoúÊ przyrzπdzenia zup rybnych.");
					};
	};
/******************************************************************************************/	
INSTANCE ItWe_PrzepisMoleratSoup (C_Item)
{	
	name 				=	"Przepis na zupÍ z kretoszczura";

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
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- sad≥o kretoszczura"					);
					Doc_PrintLine	( nDocID,  0, "- 3 sztuki miÍsa"					);
					Doc_PrintLine	( nDocID,  0, "- sÛl"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy miÍso. NastÍpnie czekamy aø zacznie wrzeÊ. Dopiero potem delikatnie wlewamy t≥uszcz i mieszamy. Solimy na koÒcu. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pyszna zupa dla myúliwego w sam raz na ch≥odne dni."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Kˆnigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisSnafSoup (C_Item)
{	
	name 				=	"Przepis na potrawkÍ z chrzπszcza";

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
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 chrzπszcze"					);
					Doc_PrintLine	( nDocID,  0, "- 5 piekielnikÛw"					);
					Doc_PrintLine	( nDocID,  0, "- 2 miski ryøu"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy posiekane chrzπszcze. NastÍpnie czekamy aø zacznie wrzeÊ. Potem wrzucamy pokrojone piekielniki i mieszamy to wszystko dosypujπc ryø. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
	INSTANCE przepis_zupaserowa (C_Item)
{	
	name 				=	"Przepis na zupÍ serowπ";

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
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 kawa≥ki sera"					);
					Doc_PrintLine	( nDocID,  0, "- 2 sztuki miÍsa"					);
					Doc_PrintLine	( nDocID,  0, "- bochenek chleba, najlepiej suchego"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Gotujemy miÍso. Gdy wywar zacznie wrzeÊ wrzucamy ser, ktÛry natychmiast siÍ topi. Ca≥oúÊ mieszamy i dodajemy pokrojony na pajdy chleb."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Kˆnigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisCrawelSoup (C_Item)
{	
	name 				=	"Przepis na zupÍ z pe≥zacza";

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
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- wnÍtrznoúci pe≥zacza"					);
					Doc_PrintLine	( nDocID,  0, "- 2x sÛl"					);
					Doc_PrintLine	( nDocID,  0, "- miska ryøu"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Najpierw preparujemy pe≥zacza. Z wnÍtrza delikatnie wycinamy narzπdy wewnÍtrzne. Czekamy, aø sp≥ynie krew. NaciπÊ naleøy delikatnie pod brzuchem. åwieøe flaki wrzucamy do wody z ryøem."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego! Baal Lukor"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Kˆnigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/******************************************************************************************/
INSTANCE ItWe_PrzepisScaSoup (C_Item)
{	
	name 				=	"Przepis na zupÍ ze úcierwojada";

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
					Doc_PrintLine	( nDocID,  0, "Sk≥adniki: "					);
					Doc_PrintLine	( nDocID,  0, "- 3 kawa≥ki miÍsa"					);
					Doc_PrintLine	( nDocID,  0, "- 2x sÛl"					);
					Doc_PrintLine	( nDocID,  0, "- 2 krucze ziela"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Wrzucamy miÍso do gorπcej wody. DopÛki siÍ nie ugotuje suszymy krucze ziele, a nastÍpnie siekamy. Wrzucamy wszystko do gara i dodajemy sÛl."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Tylko nie przesadzaj z solπ."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Kˆnigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/*****************************************************
******* KATEGORIA: LORE
*****************************************************/

INSTANCE ItWr_MenaceToDoyle (C_ITEM)
{
	name 					=	"Kartka z pogrÛøkami";

	mainflag 					=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[1] 				=	"Adresatem pogrÛøek jest Doyle.";
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
	Doc_PrintLines	( nDocID,  0, "Dorwiemy ciebie i twojπ przeklÍtπ bandÍ!");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Skelden");
	Doc_PrintLine	( nDocID,  0, "");

	Doc_Show		( nDocID );
};

/******************************************************************************************/

INSTANCE  ItWr_Mod_IronGarotte(C_Item)
{	
	name 					=	"Øelazna Garota";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Øelazna Garota";

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
					Doc_PrintLine	( nDocID,  0, "Øelazna Garota");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0, "Øelazna Garota to elitarna formacja StraønikÛw dbajπcych o bezpieczeÒstwo MagnatÛw. Od jej cz≥onkÛw wymaga siÍ nie tylko nadzwyczajnych zdolnoúci bojowych, ale teø niemal fanatycznego oddania. Nazwa formacji pochodzi od przydomku skazaÒca Felgora, ktÛry podczas buntu zabi≥ oficera straøy zarzucajπc na jego szyjÍ ≥aÒcuchy od swych kajdan, po czym udusi≥ go miaødøπc mu gardziel.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Jako, øe ten sposÛb uúmiercania przywodzi≥ na myúl zabijanie za pomocπ garoty, Felgor zyska≥ przezwisko Øelaznej Garoty. Od tej pory przytroczywszy sobie do pasa Ûw ≥aÒcuch, nosi≥ go z dumπ jako trofeum, od ktÛrego zyska≥ przydomek. Felgor jeszcze w czasach przed powstaniem bariery by≥ przyjacielem Gomeza, wiÍc gdy przywÛdca magnatÛw postanowi≥ sformowaÊ przybocznπ straø z≥oøonπ z najlepszych i najwierniejszych podw≥adnych, na jej czele postawi≥ w≥aúnie Øelaznπ GarotÍ. ");
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
  					Doc_PrintLine	( nDocID,  0, "czÍúÊ 1");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Nalewki");
					Doc_PrintLines	( nDocID,  0, "Te trunki sπ znane od stuleci swojπ popularnoúÊ zyska≥y dziÍki úwietnemu smakowi oraz prostocie przygotowania. Aby sporzπdziÊ nalewkÍ wystarczy sk≥adniki zalaÊ alkoholem i dodaÊ cukru wed≥ug uznania. Jakie sk≥adniki? - spyta poczπtkujπcy. ");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Tutaj mamy bezwzglÍdnπ swobodÍ dzia≥ania. NajczÍúciej jednak stosuje siÍ utarte przepisy: piÍÊ jab≥ek do dwÛch butelek alkoholu dla nalewki jab≥kowej i dziesiÍÊ jagÛd do dwÛch butelek dla nalewki jagodowej. ");	

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
  					Doc_PrintLine	( nDocID,  0, "czÍúÊ 2");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "MiÛd i wÛda");
					Doc_PrintLines	( nDocID,  0, "MiÛd i wÛdka - oto kolejne po≥πczenie znane od wiekÛw. Wyrobienie takiego miodu nie jest aø tak proste, gdyø wymaga czasu i dobrania odpowiednich proporcji. Zazwyczaj wyrabia siÍ pÛ≥toraki: jedna jednostka objÍtoúci brzeczki do po≥owy jednostki wody.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Z piwem miodowym sprawa wyglπda podobnie. Do brzeczki piwnej wystarczy dolaÊ miodu. PÛüniej wystarczy odrobina cierpliwoúci, aby trunek osiπgnπ≥ w≥aúciwy smak. ");	

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
  					Doc_PrintLine	( nDocID,  0, "czÍúÊ 3");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "WÛda z zio≥a");
					Doc_PrintLines	( nDocID,  0, "W zapiskach starego alchemika pracujπcego w mojej karczmie znalaz≥em ongiú przepis na absynt - alkohol powsta≥y wy≥πcznie z fermentacji ziÛ≥. Fermentacji naleøy poddaÊ wy≥πcznie zio≥a Serafisa lub orkowego ziela. ");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "£atwiej zrobiÊ nalewkÍ zio≥owπ. Porzπdny smak otrzymujemy, gdy zalejemy czystym alkoholem jedno leúne i dwa gÛrskie zio≥a.");	

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
					Doc_PrintLines	( nDocID,  0, "Jak zabiÊ magnata albo barona? To pytanie zadaje sobie wielu m≥odych zabÛjcÛw wykonujπcych rÛøne roboty dla swoich gildii. O ile zabicie rybaka i ukrycie zw≥ok nie jest dla nich wyzywaniem, o tyle pozbycie siÍ waønej szychy z obstawπ, juø tak. Na pomoc przychodzi alchemia. Jak wiadomo bogacze lubiπ siÍ zabawiÊ i nieüle popiÊ. PodsunπÊ im butelkÍ 'specjalnego' alkoholu nie jest tak trudno jak wyeliminowaÊ po cichu.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLines	( nDocID,  1, "Jak takowy trunek sporzπdziÊ? Trunek, ktÛry bÍdzie niczym cios sztyletu, zabijajπcy podpitego magnata niemaløe w momencie wypicia. Na stole alchemicznym naleøy po≥πczyÊ trolest i bagienne ziele. Reakcja, ktÛra zachodzi miedzy sokami tych dwÛch roúlin wywo≥a silnπ fermentacjÍ. Jednoczeúnie zapach ziÛ≥ upodobni napÛj do zwyczajnej nalewki. DziÍki temu nikt nie bÍdzie nic podejrzewa≥. Reszta zaleøy juø tylko od dobrego pos≥aÒca, ktÛry dostarczy 'podarek'.");	

					Doc_Show		( nDocID );				
	};		


//***********************************************************************************************
//********** NOWE MENU STATYSTYK  
//***********************************************************************************************
INSTANCE ZdolnosciLowieckie (C_Item)
{	
	name 				=	"Moje zdolnoúci ≥owieckie";

	mainflag 			=	ITEM_KAT_DOCS;
	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFunc1Skills;
	scemeName			=	"MAP";
	description			=   "Moje zdolnoúci ≥owieckie";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
}; 
func void UseFunc1Skills ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "STATUS_BACK.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "Font_Old_10_WhiteStats.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
Doc_PrintLine	( nDocID,  0, "UmiejÍtnoúci myúliwskie");		
Doc_PrintLine	( nDocID,  0, "");	
						if (Knows_GetTeeth == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie k≥Ûw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie k≥Ûw");
};
if (Knows_GetClaws == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie pazurÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie pazurÛw");
};

if (Knows_GetFur == true)
{
Doc_PrintLine	( nDocID,  0, "1 åciπganie futer");
} else {
Doc_PrintLine	( nDocID,  0, "0 åciπganie futer");
};

if (Knows_GetHide == true)
{
Doc_PrintLine	( nDocID,  0, "1 SkÛrowanie gadÛw");
} else { 
Doc_PrintLine	( nDocID,  0, "0 SkÛrowanie gadÛw");
};

if (Knows_GetMCMandibles == true)
{
Doc_PrintLine	( nDocID,  0, "1 Patroszenie pe≥zaczy");
} else { 
Doc_PrintLine	( nDocID,  0, "0 Patroszenie pe≥zaczy");
};

if (Knows_GetMCPlates == true)
{
Doc_PrintLine	( nDocID,  0, "1 Zdejmowanie p≥ytek pancerzy");
} else {
Doc_PrintLine	( nDocID,  0, "0 Zdejmowanie p≥ytek pancerzy");
};

if (Knows_GetBFSting == true)
{
Doc_PrintLine	( nDocID,  0, "1 Øπd≥a krwiopijcÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Øπd≥a krwiopijcÛw");
};

if (Knows_GetUluMulu == true)
{
Doc_PrintLine	( nDocID,  0, "1 £owiectwo orkÛw (Ulu-Mulu)");
} else {
Doc_PrintLine	( nDocID,  0, "0 £owiectwo orkÛw (Ulu-Mulu)");
};
if (Knows_GetLurkerMeat == true)
{
Doc_PrintLine	( nDocID,  0, "1 Pozyskiwanie miÍsa gadÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Pozyskiwanie miÍsa gadÛw");
};
if (Knows_GetMoleratW == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wycinanie wπtroby kretoszczurÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wycinanie wπtroby kretoszczurÛw");
};
if (Knows_GetMoleratT == true)
{
Doc_PrintLine	( nDocID,  0, "1 Pozyskiwanie sad≥a");
} else {
Doc_PrintLine	( nDocID,  0, "0 Pozyskiwanie sad≥a");
};
if (Knows_GetTrollGroundClaws == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie k≥Ûw trolla ziemnego");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie k≥Ûw trolla ziemnego");
};
if (Knows_GetTrutkaJaszczura == true)
{
Doc_PrintLine	( nDocID,  0, "1 Usuwanie trucizny jaszczurÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Usuwanie trucizny jaszczurÛw");
};

if (Knows_EdgeArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma≥oúÊ wojownika");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma≥oúÊ wojownika");
};

	if (Knows_FireArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma≥oúÊ ≥owcy smokÛw");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma≥oúÊ ≥owcy smokÛw");
};	
	if (Knows_PointArmor == true)
{
Doc_PrintLine	( nDocID,  0, "1 Wytrzyma≥oúÊ ≥ucznika");
} else {
Doc_PrintLine	( nDocID,  0, "0 Wytrzyma≥oúÊ ≥ucznika");
};	
			Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};




//---------------------------------------------------------------------------------------------------------------------------|
//-----------> åwiÍty Múciciel
//---------------------------------------------------------------------------------------------------------------------------|
//created by Nocturn

INSTANCE ItWr_HallowedAvengerRepice (C_ITEM)
{
	name 					=	"åwiÍty Múciciel";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Stara ksiÍga opisujπca broÒ";
	TEXT[3] 				=	"stworzonπ do walki ze z≥em.";
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
	Doc_PrintLines	( nDocID,  0, "åwiÍty Múciciel");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "...Innos nienawidzi≥ poczynaÒ swego brata, dlatego podarowa≥ ludziom úwiat≥o, by mogli rozúwietlaÊ mrok i walczyÊ z nim. Ale Beliar nie mÛg≥ znieúÊ tego widoku i stworzy≥ BestiÍ, ktÛra nios≥a chaos i úmierÊ. Pan úwiat≥a nie mÛg≥ do tego dopuúciÊ, dlatego przekaza≥ wrÍczy≥ cz≥owiekowi ogieÒ i nauczy≥ go rzemios≥a kowalskiego. Cz≥owiek nie zmarnowa≥ tych darÛw, rozwija≥ je.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_15_book.tga");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "Pewnego dnia uda≥o mu siÍ ");
	Doc_PrintLines	( nDocID,  1, "stworzyÊ idealne ostrze. ");
	Doc_PrintLines	( nDocID,  1, "Innos widzπc to, ucieszy≥ ");
	Doc_PrintLines	( nDocID,  1, "siÍ i przela≥ czÍúÊ swej ");
	Doc_PrintLines	( nDocID,  1, "boskiej mocy w miecz, ktÛry ");
	Doc_PrintLines	( nDocID,  1, "zosta≥ ochrzczony ");
	Doc_PrintLines	( nDocID,  1, "''åwiÍtym Múcicielem''. ");
	Doc_PrintLines	( nDocID,  1, "Dzierøy≥o go wielu ");
	Doc_PrintLines	( nDocID,  1, "wspania≥ych wojownikÛw ");
	Doc_PrintLines	( nDocID,  1, "oddajπcych czeúÊ dobru, ");
	Doc_PrintLines	( nDocID,  1, "dziÍki czemu z≥o ");
	Doc_PrintLines	( nDocID,  1, "zosta≥o unicestwione i ");
	Doc_PrintLines	( nDocID,  1, "cz≥owiek mÛg≥ wieúÊ ");
	Doc_PrintLines	( nDocID,  1, "dostatnie øycie...");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "Miecz zosta≥ wykuty z:");
	Doc_PrintLines	( nDocID,  1, "- 3 sztabek magicznej rudy");
	Doc_PrintLines	( nDocID,  1, "- 5 stalowych prÍtÛw");
	Doc_PrintLines	( nDocID,  1, "- sztabki z≥ota");
	Doc_PrintLines	( nDocID,  1, "- 4 bry≥ek czarnej rudy");
	Doc_PrintLines	( nDocID,  1, "- Esencji åwiat≥a");
	Doc_Show		( nDocID );
};


/////////////////////////////////////////////////////////////////////
// KSI GI I NOTATKI FABULARNE
// REGA£ W SIEDZIBIE MAG”W OGNIA
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
					Doc_PrintLines	( nDocID,  0, "Za potÍgÍ magii! "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "èle siÍ sta≥o, gdyø oto rzeka poch≥onÍ≥a zamek Revaran. Lord Etienne obwinia o to nas, MagÛw Ognia i naszπ tamÍ, ktÛrπ byliúmy postawili nieopodal Trellis. Etienne domaga siÍ od nas rozebrania zapory rzecznej i odbudowy tej g≥Ûwnej twierdzy paladynÛw. "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "ChoÊ Innos jest z nami, to przywÛdca paladynÛw ma niema≥e wp≥ywy i wszystkie je zamierza wykorzystaÊ przeciwko Koúcio≥owi MagÛw Ognia. Jako, øe przy Gomezie bracie stoicie, wtedy namawiajcie pierwszego z magnatÛw by przed krÛlem za nami przemawia≥. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niechaj spe≥ni siÍ wola Innosa! "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Vengardu i najwyøszy arcykap≥an Myrtany"					);
					Doc_PrintLine	( nDocID,  0, "Arcymag Karrypto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_DisputeAboutRevaran (C_Item)
{	
	name 				=	"SpÛr o twierdzÍ Revaran";

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
					Doc_PrintLines	( nDocID,  0, "Wielkim smutkiem nape≥nione jest me serce, gdy przykroúci doznajemy od tych, ktÛrzy z woli Innosa winni nam pos≥uszeÒstwo i szacunek. Oto Lord Etienne w dalszym ciπgu nie ustaje i kolejny juø raz domaga siÍ przed krÛlem, byúmy wyburzyli tamÍ trellijskπ i w≥asnym sumptem twierdzÍ w Revaran odbudowali. "					);
					Doc_PrintLines	( nDocID,  0, "Ten niewdziÍcznik i zaka≥a Zakonu PaladynÛw nigdy nie wydosta≥by siÍ z biedy mu przyrodzonej, gdyby nie to, øe mag Loukanis poda≥ mu pomocnπ d≥oÒ. To on przygarnπ≥ go na nauki, a wyciπgnπwszy z bodermarskiej ulicy, utorowa≥ mu drogÍ w szeregi rycerzy Innosa. Gdyby nie dobry Loukanis, Etienne nigdy nawet nie oglπda≥by tych murÛw, o ktÛre teraz siÍ piekli. "	);
					Doc_PrintLines	( nDocID,  0, "Jak on úmie nastawaÊ na dobra, bÍdπce w≥asnoúciπ åwiÍtego Koúcio≥a Innosa? Jak on úmie øπdaÊ i czyniÊ wstrÍty magom, ktÛrym wszystko zawdziÍcza. Nie przemoøe jednak pycha, choÊby najwiÍksza, bram úwiπtyni Innosa, gdyø Pan Ognia jest bogiem sprawiedliwych. "					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Vengardu i najwyøszy arcykap≥an Myrtany - Arcymag Karrypto"					);
					//Doc_PrintLine	( nDocID,  0, "Arcymag Karrypto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	

/////////////////////////////////////////////////////////////////////
// KSI GI I NOTATKI FABULARNE
// DOKUMENTY BARTHOLO
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Mod_BartholoAssets (C_Item)
{	
	name 				=	"Potwierdzenie udzia≥Ûw";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	3000;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_Book_BartholoAssets;
	scemeName			=	"MAP";
	description			= 	"Zaúwiadczenie posiadania udzia≥Ûw - kopia";
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
					Doc_PrintLines	( nDocID,  0, "Certyfikat posiadania udzia≥Ûw - kopia"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niniejszy dokument zaúwiadcza, øe Pan Bartholo Ergalla, jest w posiadaniu 3 000 pe≥noprawnych akcji o wartoúci 1 guldena kaødy w Gildii Handlowej Araxos z siedzibπ w sto≥ecznym Vengardzie. "					);
					//Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Naleøna czÍúÊ zyskÛw, ustalana wed≥ug wartoúci udzia≥Ûw z kwot przeznaczanych corocznie do rozdzielenia odpowiednim zarzπdzeniem Rady Dwunastu, bÍdzie wyp≥acana wspÛlnikowi, lub jego pe≥nomocnikowi za okazaniem niniejszego certyfikatu "	);
					Doc_PrintLines	( nDocID,  0, ""					);
				//	Doc_PrintLines	( nDocID,  0, "Niniejszy dokument poúwiadczajπcy posiadanie udzia≥Ûw w Gildii oraz same udzia≥y podlegajπ prawom nadanym w Przywileju KrÛlewskim dla Gildii Handlowej Araxos i wewnÍtrznym przepisom Gildii (kopie ww. dokumentÛw moøna otrzymaÊ w Domach Gildii), ktÛrych przestrzegania Udzia≥owiec podejmuje siÍ nabywajπc akcje. "							);
				//	Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niniejszy certyfikat jest niewaøny, jeúli nie zosta≥ podpisany na odwrocie przez Reprezentanta Gildii ds. Obrotu Udzia≥ami oraz jeúli nie zosta≥ wpisany do Rejestru Udzia≥owcÛw. PrawomocnoúÊ niniejszego dokumentu poúwiadczajπ z≥oøone niøej podpisy urzÍdnikÛw oraz stosowna pieczÍÊ."							);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					//Doc_PrintLines	( nDocID,  0, ""							);
					//Doc_PrintLines	( nDocID,  0, "Delegat Gildii Araxos i opiekun Domu Gildii na Khorinis"							);
					Doc_PrintLines	( nDocID,  0, "Ormellius Reberio                     "							);
					Doc_PrintLines	( nDocID,  0, "Glabrio Nirenza"							);
					//Doc_PrintLines	( nDocID,  0, "Reprezentant Gildii ds. Obrotu Udzia≥ami, w Domu Gildii na Khorinis "							);
				//	Doc_PrintLines	( nDocID,  0, "Glabrio Nirenza "							);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus		
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_BartholoPowerOfAttorney (C_Item)
{	
	name 				=	"Pe≥nomocnictwa - kopia";

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
					Doc_PrintLines	( nDocID,  0, "Kopia Pe≥nomocnictw"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ja, Bartholo z domu Ergalla, oúwiadczam, øe wydajÍ Bankowi Øelaznemu [z siedzibπ w Vengardzie], wszelkie pe≥nomocnictwa do przyjmowania w moim imieniu i przechowywania pieniÍdzy wyp≥acanych z tytu≥u posiadanych przeze mnie akcji Gildii Handlowej Araxos (z siedzibπ w Vengardzie)."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zgodnie z zapisami Przywileju KrÛlewskiego dla Gildii Handlowej Araxos i wewnÍtrznymi prawami obowiπzujπcymi w gildii, poúwiadczam tym pismem przekazanie Bankowi Øelaznemu wymaganego certyfikatu oraz nadajÍ Bankowi Øelaznemu prawa pos≥ugiwania siÍ owym certyfikatem w granicach wyznaczonych w niniejszym dokumencie."	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					Doc_PrintLines	( nDocID,  0, "Bartholo z domu Ergalla"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_BartholoSafeConduct (C_Item)
{	
	name 				=	"Glejt uniewinniajπcy";

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
					Doc_PrintLines	( nDocID,  0, "My sÍdzia Trybuna≥u KrÛlewskiego, Honorius z rodu Neridio, poúwiadczamy swym imieniem, øe niniejszym Bartholo z domu Ergalla zdo≥a≥ sp≥aciÊ swe winy wzglÍdem KrÛlestwa Myrtany uiszczajπc stosowne zadoúÊuczynienie na poczet skarbca krÛlewskiego. Niniejszy dokument przywraca rzeczonemu skazaÒcowi status cz≥owieka wolnego i koÒczy okres odbywania orzeczonej uprzednio przez sπd kary. "	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
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
					Doc_PrintLines	( nDocID,  0, "Ja, Lord Derbent, pan na zamku w Derbent i w≥aúciciel rozleg≥ych posiad≥oúci niniejszym potwierdzamy, øe Bartholo z domu Ergalla otrzyma≥ od nas prawo zbudowania wioski na nie wiÍcej, niø piÍÊdziesiπt osÛb oraz nie wiÍkszej, niø 400 stÛp w dowolnym kierunku. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pan Bartholo i jego dziedzice na mocy przywileju lokacyjnego majπ prawo  dzierøawy, zamieszkania, zbiorÛw i wykonywania zawodu w lasach i ciekach wodnych przyleg≥ych do wioski Sahlberl, lecz leøπcych nie dalej niø 50 krokÛw od granic wioski. "	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pan Bartholo przyjmuje na siebie obowiπzek chronienia mieszkaÒcÛw wioski, a takøe wszystkich, ktÛrzy w wiosce przebywajπ. Jednoczeúnie wyznaczone zostaje kolonizatorowi prawo wydawania wyrokÛw na terenie Sahlberl w imieniu naszym, a takøe do wyznaczenia sÍdziÛw w swoim zastÍpstwie."							);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nam zaú i potomkom naszym przys≥ugiwaÊ bÍdzie piπta czÍúÊ od danin zebranych w Sahlberl i trzecia od wyrokÛw zasπdzonych w imieniu naszem. Jeúli Pan Bartholo i jego dziedzice nie bÍdπ przestrzegaÊ niniejszych postanowieÒ, nadanie to stanie siÍ ca≥kowicie niewaøne, zaú prawa do ziem po wyroku sπdu krÛlewskiego powrÛcπ do nas, Lorda Derbent i dziedzicÛw naszych. "	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podpisano"							);
					Doc_PrintLines	( nDocID,  0, "Lord Haringren z rodu Derbent"							);
					Doc_PrintLines	( nDocID,  0, "w imieniu Barthola Ergalli, przedstawiciel Banku Øelaznego, Lazare Peverel"							);
					Doc_PrintLines	( nDocID,  0, ""							);
					Doc_PrintLines	( nDocID,  0, "PieczÍÊ UrzÍdnika ds. RejestrÛw w Geldern"							);
					Doc_PrintLines	( nDocID,  0, "Radca Orvald Tevyn "							);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	

/////////////////////////////////////////////////////////////////////
// LISTY DO MAG”W WODY
// REGA£ U MAG”W WODY
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
	TEXT[3]				= 	"Korespondencja prywatna MagÛw Wody";
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
					Doc_PrintLines	( nDocID,  0, "Za potÍgÍ magii,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Po zdobyciu Varantu innosycki krÛl Myrtany pragnπ≥ umniejszyÊ Adanosa i wywyøszyÊ swojego boga. Ustanowienie innosyckiego patriarchatu dla adanosyckiej krainy i wzmoøona dzia≥alnoúÊ misyjna MagÛw Ognia musia≥y doprowadziÊ do tego nieszczÍsnego buntu, ktÛry wojska Rhobara II wnet utopi≥y we krwi... "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Za cenÍ wiernoúci Myrtanie i przyjÍcia niektÛrych obcych nam doktryn religijnych, zdo≥aliúmy uchroniÊ Varant przed chaosem, a KoúciÛ≥ nasz przed przeúladowaniem. Niestety wielu VarantczykÛw nie rozumiejπc naszych wyborÛw, zwπtpi≥o w nas, magÛw wody, a co gorsza nierzadko teø w Adanosa. RÛwnieø coraz czÍúciej s≥yszy siÍ, øe wielu VarantczykÛw niegodzπcych siÍ z niewolπ ucieka na dalekie po≥udnie, bÍdπce gniazdem herezji i odszczepieÒstwa. Tam, o zgrozo, zazwyczaj dostajπ siÍ pod wp≥ywy tamtejszych sekt."	);
					Doc_PrintLines	( nDocID,  0, "Ciemne chmury gromadzπ siÍ na po≥udniowym wschodzie. O, Adanosie, strzeø nas i nie zachowaj rozum w mieszkaÒcach Varantu... "					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Mora Sul"					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Edirne"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
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
	TEXT[3]				= 	"Korespondencja prywatna MagÛw Wody";
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
					Doc_PrintLines	( nDocID,  0, "Po niedawnym buncie, ktÛry z takπ mocπ i gwa≥townoúciπ wybuch≥ w Bakareshu i Bradze, na KoúciÛ≥ Adanosa i na krainÍ wiernπ Panu Wody spad≥ odwet wojsk krÛla Myrtany. Dla ratowania wiary oraz Varantu musieliúmy pÛjúÊ na ugodÍ z krÛlem. Byliúmy zmuszeni nie tylko uznaÊ w Rhobarze II i jego nastÍpcach prawowitych panÛw Varantu, ale teø iúÊ na ustÍpstwa w kwestiach religijnych i uznaÊ dominujπcπ pozycjÍ Koúcio≥a Innosa wzglÍdem kultu Adanosa. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Niestety wielu VarantczykÛw uzna≥o Konkordat Po≥udniowy za zdradÍ. Upadek buntu zaowocowa≥ o wiele gorszπ klÍskπ, bo upadkiem ducha i wiary w to, øe Adanos czuwa nad naszπ krainπ. Ugoda zaú odwrÛci≥a odwrÛci≥a ludzi od nas, od úwiÍtych kap≥anÛw Adanosa. "	);
					Doc_PrintLines	( nDocID,  0, "Niech Adanos ma nas w swojej opiece "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Bakareshu "					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Mursin "					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	

INSTANCE ItWr_Mod_AnxietyofEdirne (C_Item) //dodane
{	
	name 				=	"NiepokÛj arcymaga Edirne";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=   Use_Book_AnxietyofEdirne;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[3]				= 	"Korespondencja prywatna MagÛw Wody";
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
					Doc_PrintLines	( nDocID,  0, "Ostatnimi czasy coraz bardziej niepokojπce wieúci dochodzπ z po≥udniowego pogranicza. Martwiπ mnie szczegÛlnie sekty tak zwanych asasynÛw, ktÛrzy nie tylko obiecujπ wyzwolenie Varantu z rπk najeüdücÛw, ale teø pragnπ uczyniÊ go krainπ oddanπ Beliarowi. "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Moc Pana úmierci jest ogromna ale ona pod sztandarem wolnoúci niesie niewolÍ chaosu, tak jak ca≥kowity triumf Innosa oznacza≥by tyraniÍ praw. Dlatego teø musieliúmy uznaÊ w Rhobarze II naszego prawowitego w≥adcÍ, by przetrwaÊ i staÊ siÍ w KrÛlestwie ostojπ rÛwnowagi. Beliar nie moøe przynieúÊ adanosyckiej krainie wyzwolenia, lecz jedynie krew, chaos i zniszczenie. Varant potrzebuje pokoju! Przeto obawa przed widmem z po≥udnia tym bardziej wiπzaÊ musi nasz los z KrÛlestwem Innosa... "	);
					Doc_PrintLines	( nDocID,  0, "Niech triumfuje wola Adanosa "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Patriarcha Mora Sul "					);
					Doc_PrintLines	( nDocID,  0, "Arcymag Edirne"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus				
					Doc_Show		( nDocID );
};	
/////////////////////////////////////////////////////////////////////
// DOLA Z£ODZIEJA
// REGA£ W POMIESZCZENIU MAGNAT”W
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_FateOfThief1 (C_ITEM) //dodane
{
	name 					=	"Dola Z≥odzieja";

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
	Doc_PrintLines	( nDocID,  0, "Dola Z≥odzieja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Pragniesz wzbogaciÊ siÍ na drodze kradzieøy kieszonkowej? ZaznaÊ wspania≥ego øycia z≥odzieja kpiπcego sobie z wszelkich staraÒ, úledztw i poúcigÛw straøy miejskiej? WypchaÊ sobie kieszenie po brzegi podwÍdzonym bogatym kupcom z≥otem? A moøe po prostu wÍdrowaÊ nocπ po domach zwyczajnych obywateli w poszukiwaniu monet i bogatego øycia? Pos≥uchaj dobrej rady, podziel siÍ swoimi przemyúleniami z rodzinπ. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_FateOfThief,	LOG_NOTE);
		B_LogEntry		(BookLog_FateOfThief,	"CzÍúÊ I");
	B_LogEntry		(BookLog_FateOfThief,	"Pragniesz wzbogaciÊ siÍ na drodze kradzieøy kieszonkowej? ZaznaÊ wspania≥ego øycia z≥odzieja kpiπcego sobie z wszelkich staraÒ, úledztw i poúcigÛw straøy miejskiej? WypchaÊ sobie kieszenie po brzegi podwÍdzonym bogatym kupcom z≥otem? A moøe po prostu wÍdrowaÊ nocπ po domach zwyczajnych obywateli w poszukiwaniu monet i bogatego øycia? Pos≥uchaj dobrej rady, podziel siÍ swoimi przemyúleniami z rodzinπ. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Ach, bolπ CiÍ úlady po ojcowskim pasie? O, to dobrze. ByÊ moøe dobry ojczulek w≥aúnie wybi≥ Ci z g≥owy najg≥upszπ myúl, rozwydrzonego bachora, liczπcego na ≥atwy zysk. Jeøeli dosta≥eú solidne lanie, to juø raczej wyroúniesz na przyzwoitego cz≥owieka. Domyúlam siÍ, øe jednak zignorowa≥eú mojπ wskazÛwkÍ i albo jesteú upartym mato≥em, albo straønikiem s≥uøbowo przeglπdajπcym tπ ksiÍgÍ i prÛbujπcym dziÍki niej lepiej poznaÊ techniki zwalczanej przez Ciebie profesji.");
	
	B_LogEntry		(BookLog_FateOfThief,	"Istnieje teø inna moøliwoúÊ, na ktÛrπ jednak niezbyt liczÍ. Moøliwe, øe jesteú tym jednym przypadkiem na 30, ktÛrzy myúlπ, øe coú potrafiπ i w rzeczywistoúci tak jest. WiÍksza jednak jest szansa na to, øe zgnijesz w wiÍzieniu, lub od razu zostaniesz wys≥any do Koloni Karnej. Jeøeli jednak zwietrzy≥eú zapach szmalu i naprawdÍ jesteú na tyle odwaøny, lub g≥upi, øe nie boisz siÍ ryzyka to znajdü chwilÍ by poúwiÍciÊ czas na tπ lekturÍ. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"ByÊ moøe po tym krÛtkim wstÍpie uwaøasz mnie za nadÍtego bufona, co? SpÛjrz jednak na ok≥adkÍ i zobacz imiÍ autora. Jeúli to imiÍ nic Ci nie mÛwi, to albo nie pochodzisz z Khorinis, albo jesteú skoÒczonym kpem i g≥upkiem. DoúÊ rzec, øe jestem za≥oøycielem Gildii Z≥odziei na jednej z najwiÍkszych wysp znanego nam úwiata. Jeøeli juø zdo≥a≥em przykuÊ Twojπ uwagÍ, to zaczniemy od czegoú prostego. Czegoú, co jest podstawπ zawodu z≥odzieja - otwieranie zamkÛw i kradzieø kieszonkowa. Za ≥atwe? RzuÊ wiÍc weso≥o ksiÍgÍ w kπt, albo utop w ka≥uøy. åmia≥o! Ot taka proúcizna, a ilu juø wszechwiedzπcych, kpiπc sobie z opisanych tu zasad zawis≥o na szubienicy, czy za sprawπ kata straci≥o d≥oÒ, albo od razu ca≥e ramiÍ. Kaødy kto zlekcewaøy≥ opisane tu zasady, wpad≥ w rÍce straøy i raczej juø nie wyszed≥ stamtπd o w≥asnych si≥ach. Jeøeli zdo≥asz w pe≥ni opanowaÊ opisane techniki, to masz szansÍ zbiÊ fortunÍ. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Najprostszπ z umiejÍtnoúci jest kradzieø kieszonkowa, choÊ aø úmiesznym jest ilu rozpoczynajπcych swπ z≥odziejskπ przygodÍ nawet tego nie umie zrobiÊ dobrze. Takich ≥ajz wúrÛd szanujπcej siÍ Gildii Z≥odziei z Khorinis siÍ nie øa≥uje, ani tym bardziej nie ratuje. Chyba, øe mogπ puúciÊ farbÍ. Do rzeczy. Na samym poczπtku musisz poznaÊ swoje otoczenie i opracowaÊ odpowiednie podejúcie. Zadaj sobie pytanie gdzie i kiedy chcesz dokonaÊ rabunku oraz oczywiúcie kto ma byÊ Twojπ ofiarπ. Oba zagadnienia majπ podobnπ wagÍ. åledü swÛj cel, wystrzegajπc siÍ jednak poúpiechu, by nie zwrÛciÊ na siebie uwagi ofiary i jej nie sp≥oszyÊ. PrÍdzej, czy pÛüniej znajdzie siÍ w jakimú odosobnionym miejscu, gdzie nie siÍga wzrok straønikÛw miejskich i bÍdzie moøna bez niepotrzebnego zagroøenia ze wszystkim siÍ zebraÊ. PamiÍtaj jednak, øeby nie stawiaÊ wszystkiego na jednπ kartÍ. Trzeba wiedzieÊ, kiedy sobie darowaÊ rozpracowywanie zbyt ryzykownego celu. Jest tylu kupcÛw z wype≥nionymi z≥otem kieszeniami, øe nie warto daÊ siÍ z≥apaÊ dla jednego celu. To by≥ b≥πd, ktÛry pope≥ni≥ mÛj kompan Donnat, na d≥ugo nim Gildia na Khorinis zaczÍ≥a siÍ tworzyÊ. Jedynie uúmiech losu sprawi≥, øe znalaz≥ siÍ pewien podrÛønik, ktÛry pomÛg≥ mi wydostaÊ towarzysza.");

	B_LogEntry		(BookLog_FateOfThief,	"Nie mniej by≥o ciÍøko i na Twoim miejscu nie liczy≥bym na podobny ≥ut szczÍúcia. PamiÍtaj by nie rozpoczynaÊ skradania jeøeli ktokolwiek CiÍ widzi. Podczas skradania staraj siÍ zajúÊ nieúwiadomπ ofiarÍ od ty≥u. I uwijaj siÍ w miarÍ sprawnie, bo ofiara siÍ zorientuje. Zastanawiaj siÍ zbyt d≥ugo co masz wziπÊ, a na pewno Twoja kariera rzezimieszka zakoÒczy siÍ rÛwnie szybko, co siÍ zaczÍ≥a. Nie zabieraj teø przesadnie duøo, bo po pierwsze to nie podobna siÍ bogom, hehe, a ponadto czas... ZwiÍksza siÍ teø ryzyko, øe ofiara poczuje jakiú nienaturalny ruch w swojej kieszeni, lub wyjmowana rzecz siÍ zaczepi. Jeøeli chcesz byÊ prawdziwym z≥odziejem, musisz umieÊ podejúÊ do celu i zwiaÊ, w mniej niø 7 sekund. ");
	
	B_LogEntry		(BookLog_FateOfThief,	"Nie bez powodu zwyk≥o siÍ powiadaÊ, øe noc jest sojusznikiem z≥odzieja. Bo tak w rzeczywistoúci jest! W ciemnoúci CiÍ nie widaÊ, co daje Ci przewagÍ. Czasami siÍ zdarza, øe trzeba okraúÊ kogoú w dzieÒ. Nieraz i ja musia≥em cichcem obrabowaÊ kupca w ciπgu dnia. Jedynie chyba dla pomnoøenia swojej s≥awy i czystej z≥oúliwoúci, bo tych nadÍtych kupcÛw z 'wszechw≥adnego Araxos' zwyczajnie nie trawiÍ, wymieniÍ kilka obrabowanych przeze mnie 'wielkich handlarzy': Perion z Vengardu - ≥up warty 1730 sztuk z≥ota, Hilmar z Ardei - ≥up warty 1492 sztuki z≥ota, Renhl Trellijczyk - ≥up warty 1183 sztuki z≥ota, Terhol z Khorinis - ≥up warty 972 sztuki z≥ota ... i rzesza innej kupieckiej úmietanki, w tym Parglen z Trellis, Gronertz z Juran, Kallun z Faring i inni. ");
};

INSTANCE ItWr_FateOfThief2 (C_ITEM) //dodane
{
	name 					=	"Dola Z≥odzieja";

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
	Doc_PrintLines	( nDocID,  0, "Dola Z≥odzieja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Jest to tom drugi poradnika dla z≥odziei autorstwa mojego, to jest Samela z Khorinis. Jeøeli nie czyta≥eú pierwszego i nie zamierzasz go przeczytaÊ, to jesteú pÛ≥g≥Ûwkiem... Powiem ci coú smarkaczu. Kaøda litera tego poradnika i kaødy jego przecinek zapisane sπ krwiπ tych mπdrali, ktÛrzy zjad≥szy wszystkie rozumy chcieli na nowo odkrywaÊ okrÍønπ drogÍ do chÍdoøonej Myrtany... ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_FateOfThief2,	LOG_NOTE);
		B_LogEntry		(BookLog_FateOfThief2,	"CzÍúÊ II");
	B_LogEntry		(BookLog_FateOfThief2,	"Jest to tom drugi poradnika dla z≥odziei autorstwa mojego, to jest Samela z Khorinis. Jeøeli nie czyta≥eú pierwszego i nie zamierzasz go przeczytaÊ, to jesteú pÛ≥g≥Ûwkiem... Powiem ci coú smarkaczu. Kaøda litera tego poradnika i kaødy jego przecinek zapisane sπ krwiπ tych mπdrali, ktÛrzy zjad≥szy wszystkie rozumy chcieli na nowo odkrywaÊ okrÍønπ drogÍ do chÍdoøonej Myrtany. Zresztπ, zrobisz jak uwaøasz i szczerze powiedziawszy mam w g≥Íbokim powaøaniu øycie takich zarozumia≥ych g≥upcÛw. W sumie w podobnym stopniu przejmowa≥by siÍ øyciem Twoim, gdyby nie jakaú minimalna szansa, øe szkolÍ w≥aúnie przysz≥ego wielkiego z≥odzieja. ByÊ moøe nie okaøesz siÍ miÍsem armatnim i do czegoú w øyciu dojdziesz, a ja stanÍ siÍ mistrzem kolejnego mistrza fachu... Zobaczymy, lecz bardziej prawdopodobne, øe jesteú jednym z tych dwudziestu dziewiÍciu mato≥Ûw, ktÛrzy koÒczπ swÛj øywot w miejskich lochach. ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Do rzeczy... Drugπ z umiejÍtnoúci jest sztuka otwierania zamkÛw. Sztuka, wspania≥e s≥owo, lecz ja rzek≥bym poezja. Nas≥uchiwanie w ciszy i skupieniu kolejnego drgniÍcia ma≥ych mechanizmÛw, gdy czas zdaje siÍ p≥ynπÊ wolniej, a wszystkie düwiÍki zdajπ siÍ wype≥niaÊ owπ wiecznoúÊ. Rzek≥byú, øe to synestezja, gdybyú musia≥ miesiπc przebywaÊ na jednej ≥ajbie z pewnym nawiedzonym poetπ, kiedy to obczaja≥em sygnet rodowy pewnego kupca. PomyúleÊ, øe te wszystkie mÍki dla jednego pierúcienia, ktÛry od innych rÛøni siÍ tylko tym, øe jego oko wykonane by≥o z czarnej per≥y. Chcesz znaÊ imiÍ kupca? ProszÍ bardzo. Serpelin z Vengardu. Co do owego poety, to imiÍ jego wiele by Ci nie powiedzia≥o, gdyø przedwczeúnie skoÒczy≥ øywot. PonoÊ zeúliznπ≥ poúliznπ≥ siÍ w trelijskim porcie i tak skrÍci≥ kark. EchÖ Niech Beliar porwie paniczy, rozkoszujπcych siÍ w wierszykach spisanych na zwiÍd≥ych pergaminach przez ckliwych i p≥aczliwych poetÛw. Otwieranie zamkÛw, oto poezja øycia! ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Podobnie jak nie ma dwÛch takich samych kobiet, tak i prÛøno szukaÊ takich samych zamkÛw. Kaødy z zamkÛw zachowuje siÍ inaczej niø pozosta≥e, ma w≥asnπ duszÍ i charakter nadany im przez  úlusarza. Kaødy w odmienny sposÛb podejmuje siÍ gry z z≥odziejem prÛbujπcym go rozpracowaÊ, w czym jest tak podobny do osobowoúci cz≥owieka. Nie jest to jednak aø takie trudne, przynajmniej w przypadku zwyk≥ych zamkÛw, na ktÛre staÊ przeciÍtnego mieszczanina. TrochÍ inaczej sprawa sie ma z tymi naleøπcymi do bogaczy, mogπcych sobie pozwoliÊ na bardziej skomplikowane mechanizmy. Jednak i tu obowiπzuje taka sama zasada, wymagajπca od z≥odzieja wiÍcej doúwiadczenia i umiejÍtnoúci. Dostanie siÍ do zabezpieczonego wnÍtrza jest o wiele prostsze, jeøeli podczas roboty nie tracisz g≥owy i cierpliwoúci. Zadbaj o to by za≥atwiÊ sobie porzπdne wytrychy. Nie warto ich kupowaÊ od niesprawdzonych ludzi, gdyø w czasie prÛby mogπ zawieúÊ. PamiÍtaj, by zaopatrzyÊ siÍ w odpowiedni ich zapas, przed akcjπ. Wykonujπc robotÍ, staraj siÍ nie spieszyÊ, a juø w øadnym wypadku nie naciskaÊ na wytrych. Co, øe jak siÍ wkurzysz to musisz siÍ na czymú wy≥adowaÊ? To daruj sobie czytanie dalszych stron ksiπøki i wybierz sobie jakπú innπ profesjÍ, bo do tej siÍ za grosz nie nadajesz. Tu potrzeba opanowania. W chwilach s≥aboúci moøesz przygryüÊ wargi, smacznego, moja Ty krwioøercza mordo. Oprzytomniej chÍdoøony smarkaczu! ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"W momencie gdy zapadki zacznπ siÍ w≥aúciwie ustawiaÊ, poczujesz leciutkie drganie wytrycha. Widacz jesteú na dobrej drodze. Zwolnij wtedy odrobinÍ i krÍÊ. Jak za chwilÍ üle przekrÍcisz wytrych, to zaczynasz od nowa. ZapamiÍtuj wiÍc sekwencjÍ w jakiej przekrÍca≥eú wytrych. Moøesz teø na chybi≥ trafi≥ krÍciÊ wytrychami, lecz po 60 obudzisz siÍ z kilkunastoma z≥amanymi prÍtami w rÍce i z irytacjπ w swym pustym ≥bie. ");
	
	B_LogEntry		(BookLog_FateOfThief2,	"Dobrnπ≥eú w≥aúnie do koÒca ksiÍgi.. Moøesz siÍ zøymaÊ, øe o tym wszystkim wiedzia≥eú, moøliwe. Wtedy gratulujÍ dobrego mistrza. Nie zamierzam CiÍ przekonywaÊ do s≥usznoúci moich racji. RÍczÍ jednak honorem z≥odzieja, øe stosujπc siÍ do opisanych tu wskazÛwek i szlifujπc w ich duchu swe umiejÍtnoúci, zostaniesz prawdziwym rzezimieszkiem. Potrzeba jedynie duøo cierpliwoúci i jeszcze wiÍcej praktyki. ByÊ moøe staniesz siÍ rÛwnie dobry jak ja. Moøesz pÛjúÊ teø swojπ drogπ, odrzucajπc moje rady i skoÒczyÊ za kratami. ");

	B_LogEntry		(BookLog_FateOfThief2,	"Za≥oøyciel Gildii Z≥odziei na Khorinis, Samel");
};

/////////////////////////////////////////////////////////////////////
// PROJEKTOWANIE ZAMK”W
// CHATA R•CZKI
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LockProjects (C_ITEM) //dodane
{
	name 					=	"Projektowanie zamkÛw";

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
	Doc_PrintLines	( nDocID,  0, "Projektowanie zamkÛw");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Wiele miesiÍcy pracy kosztowa≥a mnie dzie≥o, ktÛre ostatecznie ma myúl zrodzi≥a. Dziú dumnym jestem, øe stworzy≥em recepturÍ, ktÛra pozwoli utrudniÊ øywot z≥odziejom i wszelkiemu bezeceÒstwu owej zakazanej profesji. Wielu rabusiÛw w swym obrzydliwym fachu nastawiona jest jedynie na rozpracowywanie zamkÛw i ≥amanie zabezpieczeÒ, byle tylko dostaÊ siÍ do bogactwa strzeøonego przez zamek. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_LockProjects,	LOG_NOTE);
	B_LogEntry		(BookLog_LockProjects,	"Projektowanie zamkÛw");
	B_LogEntry		(BookLog_LockProjects,	"Wiele miesiÍcy pracy kosztowa≥a mnie dzie≥o, ktÛre ostatecznie ma myúl zrodzi≥a. Dziú dumnym jestem, øe stworzy≥em recepturÍ, ktÛra pozwoli utrudniÊ øywot z≥odziejom i wszelkiemu bezeceÒstwu owej zakazanej profesji. Wielu rabusiÛw w swym obrzydliwym fachu nastawiona jest jedynie na rozpracowywanie zamkÛw i ≥amanie zabezpieczeÒ, byle tylko dostaÊ siÍ do bogactwa strzeøonego przez zamek. ");
	
	B_LogEntry		(BookLog_LockProjects,	"Wiele lat przepracowawszy jako úlusarz, postanowi≥em opracowaÊ system zamkÛw, ktÛre bÍdπ potrafi≥y powstrzymaÊ takich rabusiÛw. PierwszorzÍdnπ rzeczπ sπ materia≥y, jakich zwyk≥o siÍ uøywaÊ do wytwarzania zabezpieczeÒ. Niestety wciπø, mimo moich wysi≥kÛw, wielu uøywa miedzi, lub mosiπdzu. Metale te sπ jednak wielce u≥omne i nienadajπce siÍ do strzeøenia kosztownoúci, gdyø ulegajπ pod wp≥ywem wystarczajπco silnego kopniÍcia. Dlatego radzÍ zrezygnowaÊ z nich na rzecz stali, w ostatecznoúci øelaza. Wytrzymalsze metale sπ niestety doúÊ kosztowne i trzeba przy tym wykonaÊ specjalne drzwi z tego samego materia≥u. Zdarza≥o siÍ, øe straø miejska na moim Khorinis, a takøe w innych czÍúciach KrÛlestwa Myrtany natyka≥a siÍ na dÍbowπ skrzyniÍ o nienaruszonym i zamkniÍtym zamku.");
	
	B_LogEntry		(BookLog_LockProjects,	"Jeøeli juø uporano siÍ z tym problemem, naleøa≥oby przyjrzeÊ siÍ ustawieniu zapadek. W przypadku gdy ustawimy je pod kπtem oúmiu stopni wzglÍdem dziurki, zamek bÍdzie otwiera≥ siÍ g≥adki, zaú rabuú bÍdzie mieÊ nie lada problem z otworzeniem go zwyczajnym wytrychem. Innym waønym zagadnieniem sπ sprÍøyny od zapadek. Najlepszym rozwiπzaniem jest wykonanie kaødej przez innego kowala, albowiem kaødy rzemieúlnik przygotuje sprÍøynÍ o innym napiÍciu niø jego koledzy po fachu. Zastosowanie owych wskazaÒ powinno doúÊ znacznie utrudniÊ øycie z≥odzieja, sprawiajπc trudnoúÊ zarÛwno pospolitym szperaczom jak i doúwiadczonym z≥odziejom.");
	
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
	Doc_PrintLines	( nDocID,  0, "My z≥odzieje Khorinis, spod tyrani i praw w≥adcÛw wyjÍci, jedynie dumie z≥odzieja ho≥dujemy i z≥odziejskiemu zwyczajowi podlegamy. Przez Samela gildia za≥oøona, za jego teø sprawπ znaki wielce poøyteczne otrzyma≥a.  ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_SammelsSigns,	LOG_NOTE);
	B_LogEntry		(BookLog_SammelsSigns,	"Znaki Sammela");
	B_LogEntry		(BookLog_SammelsSigns,	"My z≥odzieje Khorinis, spod tyrani i praw w≥adcÛw wyjÍci, jedynie dumie z≥odzieja ho≥dujemy i z≥odziejskiemu zwyczajowi podlegamy. Przez Samela gildia za≥oøona, za jego teø sprawπ znaki wielce poøyteczne otrzyma≥a.");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Pierwszym ze znakÛw jest 'RamiÍ Samela' z≥odzieja broniπce. Znak ten g≥osi, øe miejsce nim oznaczone bezpiecznym jest dla rabusia, w naszym towarzystwie zrzeszonego. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Drugim jest 'TrÛjzπb', co znaczenie ma odwrotne do pierwszego spoúrÛd znakÛw. Øycie mi≥ujπcy niech od miejsca nim ozdobionego trzyma siÍ z daleka, gdyø jeno zgubÍ prawy z≥odziej w nim znaleüÊ moøe. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Trzecim jest 'Studnia', ktÛra znakiem jest widomym, øe mieszkaÒcy tego miejsca sπ chronieni przez gildiÍ i øaden spoúrÛd szanujπcych siÍ z≥odziei nie ma prawa ich okradaÊ.");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Czwartym jest 'Skrzynia', czyli znak, øe nieopodal znajduje siÍ coú godnego uwagi z≥odzieja. Wyryta na murze, czy drzwiach przez z≥odzieja dla z≥odzieja. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Te oto znaki wyskrobano na úcianach budynkÛw, drzwiach, czy murach. Zdarzy siÍ, øe i na sπsiadujπcym drzewie z wartym odwiedzenia domem. Tak oto porozumiewamy siÍ ze sobπ, co wskazÛwkπ jest dla starych wyjadaczy i poradπ dla nowych cz≥onkÛw gildii. Starym wsparciem w pomnoøeniu ≥upÛw, nowym pomocπ w unikniÍciu tarapatÛw. W pamiÍci kaødego prawdziwego z≥odzieja zapisane, na pergaminie dla zakonu naszego spisane. ");
	
	B_LogEntry		(BookLog_SammelsSigns,	"Spisane piÛrem Lutharda z Khorinis");
};

/////////////////////////////////////////////////////////////////////
// O SZKOLENIU ØO£NIERZA
// POK”J THORUSA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HowToTrainSoldiers (C_ITEM) //dodane 
{
	name 					=	"O szkoleniu øo≥nierzy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	75;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2] 				=	"Autor: Javier z Vengardu";
	TEXT[3] 				=	"KsiÍga o øo≥nierskim rzemioúle";
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
	Doc_PrintLines	( nDocID,  0, "O szkoleniu øo≥nierzy");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "'Wszystko na tym úwiecie ma swojπ cenÍ'. Ta czÍsto i bezrefleksyjnie powtarzana formu≥ka, choÊ brzmi banalnie to jednak w pe≥ni oddaje regu≥y rzπdzπce úwiatem oraz wojnπ. OtÛø cena øo≥nierza, jakkolwiek brutalnie brzmi gdyø mowa tu o ludzkim øyciu, rÛwnieø jest policzalna. Jest to czas i koszt wyszkolenia, uzbrojenia i wyposaøenia nowego øo≥daka na zmianÍ.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HowToTrainSoldiers,	LOG_NOTE);
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"O szkoleniu øo≥nierzy");
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"''Wszystko na tym úwiecie ma swojπ cenÍ' - ta czÍsto i bezrefleksyjnie powtarzana formu≥ka, choÊ brzmi banalnie to jednak w pe≥ni oddaje regu≥y rzπdzπce úwiatem oraz wojnπ. OtÛø cena øo≥nierza, jakkolwiek brutalnie brzmi gdyø mowa tu o ludzkim øyciu, rÛwnieø jest policzalna. Jest to czas i koszt wyszkolenia, uzbrojenia i wyposaøenia nowego øo≥daka na zmianÍ. Regu≥y gry siÍ tu nie zmieniajπ, choÊ kaøda epoka ma w≥aúciwπ dla siebie progowπ wartoúÊ, powyøej ktÛrej nie ma sensu przygotowywanie wojownika.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Z poziom mistrzowski moøna uznaÊ jedynie taki stan, gdy osiπgnie siÍ odpowiedni stopieÒ wyszkolenia, dajπcego przewagÍ nad przeciwnikiem, nie wk≥adajπc w przeciÍtnego øo≥daka nazbyt wiele pieniÍdzy i umiejÍtnoúci. Po co zuøywaÊ si≥y i z≥oto na przekszta≥cenie statystycznego øo≥nierza w mistrza miecza najwyøszej klasy, skoro i tak nie ustrzeøe go to ani przed be≥tem z kuszy, ani, co jest jeszcze bardziej ponure, od krwawej biegunki?");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Dobrym przyk≥adem jest walka wrÍcz, ktÛra to jest sztukπ ze wszech miar poøytecznπ dla øo≥nierza kaødej armii. Niemniej by taki øo≥dak mia≥ osiπgnπÊ mistrzostwo w tym fechtunku, potrzebne sπ d≥ugie lata nieustannych ÊwiczeÒ i treningÛw. Jak wiadomo, na øo≥daku spoczywa masa obowiπzkÛw zwiπzanych z funkcjonowaniem obozu, wiÍc moøna zastosowaÊ kilka rozwiπzaÒ. W myrtaÒskim wojsku uznano, øe øo≥nierz musi opanowaÊ oko≥o dwunastu tuzinÛw chwytÛw, ale za to kombinacje ruchÛw muszπ zostaÊ wbite w podúwiadomoúÊ, dos≥ownie do poziomu odruchÛw. ");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Rzecz jasna nie da siÍ przewidzieÊ wszystkich moøliwoúci, wiÍc nawet wyszkolony w dwunastu odruchach øo≥nierz moøe staÊ siÍ ofiarπ mistrza walki wrÍcz. Pytanie tylko ilu tacy nieliczni mistrzowie zabijπ wrogÛw, gdy zaleje ich chmara øo≥dakÛw.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Inaczej sprawa siÍ ma w przypadku gdy moøliwoúci uzupe≥nienia strat rekrutami sπ ograniczone. Wtedy jedynym wyjúciem jest podnoszenie kwalifikacji moøliwie jak najwiÍkszej iloúci cz≥onkÛw oddzia≥u. Niemniej na d≥uøszπ metÍ i tak wygrywa ta armia, ktÛra ma zdolnoúÊ odnowy.");
	
	B_LogEntry		(BookLog_HowToTrainSoldiers,	"Javier z Vengardu");
};

/////////////////////////////////////////////////////////////////////
// CI ØKI PANCERZ
// NA STOLIKU STONE'A
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HeavyArmor (C_ITEM)  //dodane
{
	name 					=	"CiÍøka Zbroja";

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
	Doc_PrintLines	( nDocID,  0, "CiÍøka Zbroja");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "CiÍøka zbroja musi byÊ wytrzyma≥a. Jako masywny pancerz ma wytrzymaÊ kolejne tÍgie ciosy zadawane orÍøem przeciwnika. Taka zbroja ma ochraniaÊ nie tylko przed ostrzem miecza, czy uderzeniem m≥ota, lecz musi ochroniÊ cz≥owieka przed atakiem rozmaitych rodzajÛw broni, w tym przed rÛønego gatunku ≥ukami i oszczepami.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HeavyArmor,	LOG_NOTE);
	B_LogEntry		(BookLog_HeavyArmor,	"CiÍøka Zbroja");
	B_LogEntry		(BookLog_HeavyArmor,	"'CiÍøka zbroja musi byÊ wytrzyma≥a. Jako masywny pancerz ma wytrzymaÊ kolejne tÍgie ciosy zadawane orÍøem przeciwnika. Taka zbroja ma ochraniaÊ nie tylko przed ostrzem miecza, czy uderzeniem m≥ota, lecz musi ochroniÊ cz≥owieka przed atakiem rozmaitych rodzajÛw broni, w tym przed rÛønego gatunku ≥ukami i oszczepami. Nieco gorzej ma siÍ sprawa z kuszπ, gdyø ta czÍsto jest w stanie przebiÊ nawet najlepszy pancerz i zadaje o wiele powaøniejsze obraøenia. ");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Kowal potrzebuje skÛr, ktÛre muszπ byÊ przerobione na skÛrzane paski. Te s≥uøπ do wykonania wiπzaÒ i uprzÍøy. ObrÛbka øelaza i stali jest ma≥o skomplikowana, co czyni je doúÊ ≥atwymi do przetworzenia. Potrzeba jedynie je rozgrzaÊ i uformowaÊ kszta≥t kolejnymi uderzeniami kowalskiego m≥ota. Temperatura kuüni nie odgrywa wiÍkszej roli. Unikaj odpi≥owywania metalu, gdyø nie warto marnowaÊ dobrego materia≥u. Staraj siÍ oszczÍdzaÊ materia≥ i formuj go aø do uzyskania satysfakcjonujπcego kszta≥tu.");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Przed zabraniem siÍ za wykuwanie ciÍøkiej zbroi, powinieneú zgromadziÊ duøπ iloúÊ øelaza, gdyø wykucie kompletnego pancerza poch≥onie spory dzia≥ owego kruszcu. Stalowa zbroja wymaga analogicznej iloúci stali, lecz i tak bÍdzie potrzebne rÛwnieø øelazo. ");
	
	B_LogEntry		(BookLog_HeavyArmor,	"Hildur z Ardei");
};

/////////////////////////////////////////////////////////////////////
// SKR”CONA HISTORIA KHORINIS
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
	TEXT[3] 				=	"SkrÛcona historia Khorinis";
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
	Doc_PrintLines	( nDocID,  0, "SkrÛcona historia Khorinis");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Na poczπtku plemiona wyspy Khorinis, zwanej dawniej rÛwnieø wyspπ Kahr, wyzwoli≥y siÍ spod dominacji zagadkowego ludu Budowniczych. W wyniku zetkniÍcia siÍ z Budowniczymi, czÍúÊ plemion przyjÍ≥a kult Adanosa. Jedno z takich plemion dowodzone przez przedstawicieli rodu UkarÛw, wybi≥o siÍ na pierwszeÒstwo i narzuci≥o swπ wolÍ pozosta≥ym szczepom. Ukarowie dali poczπtek KrÛlestwu Kahr, ktÛrego byli w≥adcami aø po kres istnienia niepodleg≥ego paÒstwa.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HistoryOfKhorinis,	LOG_NOTE);
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"SkrÛcona historia Khorinis");
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"''Na poczπtku plemiona wyspy Khorinis, zwanej dawniej rÛwnieø wyspπ Kahr, wyzwoli≥y siÍ spod dominacji zagadkowego ludu Budowniczych. W wyniku zetkniÍcia siÍ z Budowniczymi, czÍúÊ plemion przyjÍ≥a kult Adanosa. Jedno z takich plemion dowodzone przez przedstawicieli rodu UkarÛw, wybi≥o siÍ na pierwszeÒstwo i narzuci≥o swπ wolÍ pozosta≥ym szczepom. Ukarowie dali poczπtek KrÛlestwu Kahr, ktÛrego byli w≥adcami aø po kres istnienia niepodleg≥ego paÒstwa. Zdo≥ali nawrÛciÊ zjednoczone przez siebie ludy i zepchnÍli orkÛw do GÛrniczej Doliny. Tam wybudowali Klasztor Zmiennokszta≥tnych, w ktÛrym mieszkali kap≥ani Adanosa - z tym, øe kult Adanosa na wyspie mia≥ wyraüne cechy druidzkie. ");
	
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"Potem nadesz≥y klÍski. Toczone bez powodzenia wojny z Vengardem os≥abi≥y powaønie KrÛlestwo. RÛwnieø inny wrÛg dawa≥ o sobie znaÊ. Oto orkowie, nasilajπ swÛj napÛr na GÛrniczπ DolinÍ i niebawem odrywajπ tπ czÍúÊ wyspy od KrÛlestwa Kahr. Kolejne wojny toczone o odzyskanie GÛrniczej Doliny nie zdo≥a≥y przywrÛciÊ tej krainy Ukarom. Uda≥o siÍ jednak powstrzymaÊ zagraøajπcy KrÛlestwu pochÛd orkÛw na po≥noc. Dla odbudowy krÛlestwa w≥adcy Khorinis rozpoczÍli sprowadzaÊ myrtaÒskich osadnikÛw na wyspÍ. Wraz z przybyszami na wyspÍ dociera≥ rÛwnieø nieznany tu wczeúniej kult Innosa, by za krÛla Firentisa powstaÊ mia≥ na Khorinis Klasztor MagÛw Ognia. ");
	
	B_LogEntry		(BookLog_HistoryOfKhorinis,	"Ostatni z krÛlÛw Kahr, zagroøony w stolicy przez oblegajπcych miasto portowe orkÛw przyzwa≥ na pomoc krÛla Rhobara I, ktÛrego wtedy teø uczyni≥ swym dziedzicem. KrÛlowie Myrtany, przy≥πczywszy Khorinis do swego krÛlestwa, odbili z rπk orkÛw GÛrniczπ DolinÍ i wybudowali na jej terenie wiele zamkÛw.");
};

/////////////////////////////////////////////////////////////////////
// KLUCZ DO MYRTANY
// SKRZYNIA W åWIECIE
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
	Doc_PrintLines	( nDocID,  0, "Przez wiele wiekÛw magiczna ruda cieszy≥a siÍ uznaniem jedynie alchemikÛw i magÛw, ktÛrzy postrzegali jπ wy≥πcznie jako ürÛd≥o magicznej energii. ChoÊ niektÛrzy podejmowali prÛby zastosowania owego kruszcu w kowalstwie, to efekty takich eksperymentÛw by≥y nader mizerne. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  1, "Dopiero na wiek przed przybyciem Rhobara I do Myrtany, kowale nordmarscy odkryli metodÍ obrÛbki rudy pozwalajπcπ na wykorzystanie jej do produkcji broni.  Wynalazek ten znaczπco wp≥ynπ≥ na bieg naszej historii, gdyø Rhobarowie potrafili wykorzystaÊ go do zapewnienia swym wojskom przewagi nad armiami wrogÛw. Dziú juø z pewnoúciπ moøna rzec, øe gdyby nie magiczna ruda, nigdy nie powsta≥aby zjednoczona Myrtana.");

	Doc_Show		( nDocID );
};

/////////////////////////////////////////////////////////////////////
// CIENIOSTW”R BRUNATNY
// DO ZAKUPU U MYåLIWYCH
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrownShadowbeast (C_ITEM) //dodane
{
	name 					=	"CieniostwÛr brunatny";

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
	Doc_PrintLines	( nDocID,  0, "Cieniostwory to jeden z najgroüniejszych gatunkÛw zwierzπt jakie zamieszkujπ znany nam úwiat. Owe zwierzÍta wystÍpujπ na obszarze Myrtany, Nordmaru i Varantu. Sπ spotykane rÛwnieø na licznych wyspach Wielkiego Morza, m.in. na Khorinis. Istniejπ rÛøne odmiany owej straszliwej bestii, ktÛre niejednokrotnie bardzo siÍ od siebie rÛøniπ cechami wyglπdu zewnÍtrznego.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_BrownShadowbeast,	LOG_NOTE);
	B_LogEntry		(BookLog_BrownShadowbeast,	"CieniostwÛr brunatny");
	B_LogEntry		(BookLog_BrownShadowbeast,	"''Cieniostwory to jeden z najgroüniejszych gatunkÛw zwierzπt jakie zamieszkujπ znany nam úwiat. Owe zwierzÍta wystÍpujπ na obszarze Myrtany, Nordmaru i Varantu. Sπ spotykane rÛwnieø na licznych wyspach Wielkiego Morza, m.in. na Khorinis. Istniejπ rÛøne odmiany owej straszliwej bestii, ktÛre niejednokrotnie bardzo siÍ od siebie rÛøniπ cechami wyglπdu zewnÍtrznego. Wyglπdem cieniostwory przypominajπ duøego, umiÍúnionego psa, z zakrzywionym do ty≥u rogiem, paszczπ naszpikowanπ zÍbami i ≥apami uzbrojonymi w ostre pazury.");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Ta jednak ksiÍga opisuje rodzaj cieniostwora, ktÛry spotkaÊ moøna na Khorinis i wyspach sπsiadujπcych. Owa szczegÛlna odmiana zosta≥a nazwana cieniostworem brunatnym, a to przez wzglπd na umaszczenie ich sierúci. CieniostwÛr brunatny, podobnie jak jego kuzyni z innych stron úwiata, posiada charakterystyczny, lekko zakrzywiony do ty≥u rÛg wyrastajπcy mu na gÛrnej czÍúci g≥owy. RÛg ten s≥uøy do przeszywania nim ofiar owej ogromnej bestii i jest wykorzystywany na podobieÒstwo ostrzy stosowany przez ludzi. ");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Do cech wyraünie wyrÛøniajπcych go na tle fauny Khorinis naleøπ zdecydowanie rozmiary, znacznie przewyøszajπce rozmiar cz≥owieka. Jego masywne cielsko trzyma siÍ na czterech silnych ≥apach, z czego dwie przednie wykorzystywane sπ przez cieniostwora do ataku. One to wespÛ≥ z pokaünymi zÍbami s≥uøπ jako narzÍdzie polowaÒ i obrony, a takøe do rozrywania miÍsa z≥owionej zdobyczy. Na uwagÍ zas≥ugujπ teø wspomniane juø k≥y bestii, bÍdπce doskona≥π broniπ, potrafiπcπ rozciπÊ i przeøuÊ nawet najtwardsze p≥aty miÍsa. ");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Owe zwierzÍta upodoba≥y sobie ciche i pozbawione úwiat≥a s≥onecznego miejsca, takie jak ciemne lasy, jaskinie, groty, rzadziej ruiny. Od tej w≥aúciwoúci pochodzi w≥aúnie nazwa ca≥ego gatunku. Zwykle cieniostwÛr wrÍcz manifestuje swoje terytorium i obecnoúÊ, masakrujπc swoje ofiary - wokÛ≥ kryjÛwek tych stworÛw moøna czÍsto znaleüÊ ogromne iloúci krwi, krwawe úlady ≥ap, a takøe ogromne iloúci koúci i szkieletÛw. CieniostwÛr poluje nocami, a za dnia úpi. Jego ofiarami padajπ mniejsze od niego stworzenia, a bÍdπc jednym z najwiÍkszych drapieøcÛw, jako swÛj potencjalny posi≥ek traktuje on w≥aúciwie wszystkie zwierzÍta. Jego poøywieniem najczÍúciej sπ úcierwojady, jelenie i inne drobne ssaki. Cz≥owiek, nie dorÛwnujπc mu wielkoúciπ i si≥π jest rÛwnieø uwaøany przez tπ bestiÍ za ≥akomy kπsek, od czasu do czasu wzbogacajπcy i tak juø bogatπ dietÍ cieniostwora.");
	
	B_LogEntry		(BookLog_BrownShadowbeast,	"Na szczÍúcie ten wielki i groüny drapieøca prowadzi samotny tryb øycia, spotykajπc siÍ z innymi osobnikami w czasie godÛw, ale teø w walce, w przypadku naruszenia przez innego cieniostwora swego terytorium. Szansa natkniÍcia siÍ na wiÍcej niø jednego cieniostwora jest stosunkowo niewielka. Mimo to spotkanie juø jednego osobnika radykalnie zmniejsza szanse nieszczÍúliwego cz≥owieka na wyjúcie ca≥o ze spotkania. Atakowanie go jest pomy≥kπ zw≥aszcza nocπ, poniewaø wtedy jest w pe≥ni si≥. Najlepiej zakraúÊ siÍ do niego za dnia, lecz i to bywa niebezpieczne, poniewaø drapieønik czuwa nawet podczas snu. Broni siÍ gryzπc, drapiπc, a nawet szarøuje wyrzucajπc przeciwnika w gÛrÍ. CieniostwÛr jest bardzo szybki i ucieczka przed nim jest trudna, ale moøliwa tylko, gdy w porÍ zaczniemy uciekaÊ");
};

/////////////////////////////////////////////////////////////////////
// PR”BA WODY
// BIBLIOTEKA MAG”W
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_WaterTry (C_ITEM) //dodane
{
	name 					=	"PrÛba Wody";

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
	Doc_PrintLines	( nDocID,  0, "PrÛba Wody");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Dawniej kaødy nowicjusz Zakonu MagÛw Adanosa, gdy mija≥ pierwszy rok nauki poddawany by≥ prÛbie wody. By≥ to siÍgajπcy niepamiÍtnych czasÛw zwyczaj, praktykowany wúrÛd kap≥anÛw Adanosa na wyspie Vaduz. M≥odych prowadzono nad brzegi jeziora, gdzie wyprowadzeni na p≥yciznÍ byli zanurzani. Starsi bracia trzymali im g≥owy pod wodπ, czekajπc aø p≥uca zanurzanych wype≥niπ siÍ wodπ, a nowicjusze wyzionπ ducha.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_WaterTry,	LOG_NOTE);
	B_LogEntry		(BookLog_WaterTry,	"PrÛba Wody");
	B_LogEntry		(BookLog_WaterTry,	"''Dawniej kaødy nowicjusz Zakonu MagÛw Adanosa, gdy mija≥ pierwszy rok nauki poddawany by≥ prÛbie wody. By≥ to siÍgajπcy niepamiÍtnych czasÛw zwyczaj, praktykowany wúrÛd kap≥anÛw Adanosa na wyspie Vaduz. M≥odych prowadzono nad brzegi jeziora, gdzie wyprowadzeni na p≥yciznÍ byli zanurzani. Starsi bracia trzymali im g≥owy pod wodπ, czekajπc aø p≥uca zanurzanych wype≥niπ siÍ wodπ, a nowicjusze wyzionπ ducha. NastÍpnie wyciπgano ich na brzeg, gdzie adepci wypompowywali wody z wnÍtrz nieprzytomnych cia≥. Gdy juø to uczyniono, kap≥an prowadzπcy uroczystoúÊ wt≥acza≥ w gardziel nowicjuszy powietrze z p≥uc swoich, by za sprawπ Adanosa øycie im wrÛciÊ. Tak oto Pan Wody wed≥ug swej woli orzeka≥ kto godnym jest, pe≥nienia pos≥ugi kap≥aÒskiej. Ten kto pod wp≥ywem tchnienia maga wody powraca≥ z KrÛlestwa Adanosa, w pe≥ni wchodzi≥ juø do Zakonu Kap≥anÛw Wody i choÊ nie by≥ jeszcze kap≥anem, to zyskiwa≥ prawo zg≥Íbiania boskich tajemnic. Wielu jednak Adanos pozostawi≥ w zaúwiatach, sprawiedliwych wezwawszy do swojego tronu, bezecnych zostawiajπc na pastwÍ Beliara. ");
	
	B_LogEntry		(BookLog_WaterTry,	"Przez wieki kolejni nowicjusze poddawani byli prÛbie wody, otwierajπc tym samym sobie drogÍ do kap≥aÒstwa. Wed≥ug zapisÛw zwyczaj ten wywodziÊ siÍ mia≥ od jednego z protoplastÛw Zakonu Adanosa na Vaduz, ktÛry to wyzwa≥ na pojedynek pogaÒskich szamanÛw. I Abelion, i ba≥wochwalcy mieli dowieúÊ mocy swych bogÛw oddajπc swych przyjaciÛ≥ wodzie i oøywiajπc ich martwe cia≥a. ZwyciÍstwo Abeliona sprawi≥o, øe krÛl Brandilios uzna≥ prawdziwoúÊ kultu Adanosa i uczyni≥ go wyznaniem panujπcym na Vaduz. Na 82 lata przed powstaniem KrÛlestwa Myrtany zdarzy≥a siÍ rzecz dziwna. Oto wszystkich oúmiu ch≥opcÛw oddanych wodzie, nie zosta≥o oøywionych. A byli to synowie rodÛw znacznych na Vaduz i wnet sprawÍ wniesiono do samego krÛla Mallandora. W≥adca Ûw madry zna≥ swoich poddanych i synÛw moønych. Orzek≥ wiÍc o prawoúci utopionych ch≥opcÛw. Rzek≥ wiÍc: 'Wina nie tkwi w nowicjuszach tych, ani w lordach moich. ByÊ moøe Adanos chce nas przed nieprawoúciami ostrzec, co wúrÛd jego s≥ug siÍ zalÍg≥y'. Zaøπda≥ przeto od bogatych hierarchÛw, øeby poddali siÍ prÛbie wody, na znak, øe Adanos nowicjuszy za grzechy zwierzchnikÛw nie karze. A powiadajπ mÍdrcy niektÛrzy, øe przebieg≥y krÛl pragnπ≥ tym sposobem w swojπ garúÊ wziπÊ KoúciÛ≥ Adanosa. Hierarchowie nie chcieli na to przystaÊ. Na wieúÊ o tragicznej prÛbie wody, zarÛwno szlachcice, jak i ch≥opi nie chcieli juø dzieci swych do klasztoru na kap≥any wysy≥aÊ, by synowie ich nie podzielili losu potopionych. MiÍdzy sobπ zakrzykneli: 'Czemu mielibyúmy daniny im sk≥adaÊ, skoro takich rzeczy siÍ dopuszczajπ. S≥ab≥ Zakon, s≥ab≥ klasztor. Niebawem przy krÛlu zgromadzili siÍ kap≥ani Adanosa z innych stron úwiata przybyli, a do nich do≥πczyli teø miejscowi magowie niechÍtni prze≥oøonym i rzekli: 'Jeøeli patriarchowie Vaduz sπ prawi i Adanosowi mi≥e sπ prÛby wody, to bÛstwo da im zwyciÍstwo w prÛbie wody!'.");
	
	B_LogEntry		(BookLog_WaterTry,	"Zakon MagÛw Wody nie mia≥ wyboru i musia≥ siÍ w koÒcu zgodziÊ na przyjÍcie wyzwania. Zanurzono tedy kap≥anÛw, co przy tronie krÛla siÍ gromadzili, a Adanos wrÛci≥ ich do øycia. Zanurzono potem hierarchÛw i ducha wyzionÍli, a gdy przywrÛcono tych do øycia zdolnoúÊ mowy postradali. I rzek≥ krÛl: 'Prawi to sπ mÍøowie Adanosa, lecz bÛstwo odebra≥o im jÍzyki. Niechaj wiÍc przemawiajπ Ci co s≥usznie prawiπ'! Zgodnie z wolπ Adanosa, od tej pory zaniechano owych praktyk na nowicjuszach. Zwyczaj ten jednak do koÒca nie zanik≥ i niejednokrotnie w pÛüniejszych czasach co bardziej gorliwi i tradycyjnie nastawieni nowicjusze wypraszali dla siebie prÛby wody. Kap≥ani niezbyt jednak chÍtnie zezwalali na te proúby, albowiem uznano ten sposÛb dowodzenia swych racji za archaiczny i wielce niepewny, wszak nie tylko Adanos mia≥ boskπ moc...");
	
};

/////////////////////////////////////////////////////////////////////
// HEINARA WIEDZA O SZKIELETACH
// WIEØA XARDASA
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
	Doc_PrintLines	( nDocID,  0, "Jest rzeczπ doúÊ trudnπ powiedzieÊ coú konkretnego, co by dotyczy≥o wszelkiego oøywieÒca pozbawionego cielesnej pow≥oki, to jest szkieletÛw. WiÍc ich si≥a i zrÍcznoúÊ zdajπ siÍ zaleøeÊ od tego, jak silni i zrÍczni byli oni za øycia. Podobnie stopieÒ opanowania umiejÍtnoúci bojowych zapewne jest odzwierciedleniem zdolnoúci øywego cz≥owieka. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_HeinarSceletons,	LOG_NOTE);
	B_LogEntry		(BookLog_HeinarSceletons,	"Heinara wiedza o szkieletach");
	B_LogEntry		(BookLog_HeinarSceletons,	"Jest rzeczπ doúÊ trudnπ powiedzieÊ coú konkretnego, co by dotyczy≥o wszelkiego oøywieÒca pozbawionego cielesnej pow≥oki, to jest szkieletÛw. WiÍc ich si≥a i zrÍcznoúÊ zdajπ siÍ zaleøeÊ od tego, jak silni i zrÍczni byli oni za øycia. Podobnie stopieÒ opanowania umiejÍtnoúci bojowych zapewne jest odzwierciedleniem zdolnoúci øywego cz≥owieka. Nic wiÍc dziwnego, øe na swej drodze podrÛønik spotka ca≥π gamÍ owych istot, a kaødy szkielet bÍdzie nieco innym wyzwaniem. Nie jest to jednak powÛd do obaw, gdyø ci co raz zginÍli, mogπ zginπÊ i drugi, a i trzeci jak bogowie zdarzπ.  ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Wbrew bajkom rozhisteryzowanych bab i nie posiadajπcych mÍstwa w sercu pajacÛw, 'zabicie' szkieletu nie jest specjalnie trudne. Wystarczy nieco umiejÍtnoúci bojowych i wprawy, by ostatecznie wys≥aÊ to úcierwo na drugi úwiat (nie mÛwiÍ o histeryczkach!). Zapewniam, øe do zabicia szkieletu nie potrzeba zaczarowanej broni, ani czarÛw. NaprawdÍ wystarczy zdaÊ siÍ na zwyczajne uzbrojenie, pozostajπce na wyposaøeniu myúliwego. Rzecz jasna z wy≥πczeniem ≥ukÛw, bo strza≥y przez szkielet przelecπ. ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Istniejπ jednak pewne rodzaje szkieletÛw, ktÛre rÛøniπ siÍ od pozosta≥ych i ktÛre lepiej unikaÊ. Moøna o nich powiedzieÊ, øe wydajπ siÍ czerpaÊ wiÍkszπ czÍúÊ mocy z energii czaru niø z tworzπcej je materii. Owe istoty sπ szczegÛlnie niebezpieczne i naleøy ich unikaÊ. Niemniej sπ one teø niezwykle rzadkie, zaú tÍpienie ich to juø robota dla inkwizytorÛw, a nie dla zwyk≥ych myúliwych, czy wojakÛw. ");
	
	B_LogEntry		(BookLog_HeinarSceletons,	"Heinar z Khorinis");
};

/////////////////////////////////////////////////////////////////////
// INFERIUSY
// WIEØA XARDASA
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
	Doc_PrintLines	( nDocID,  0, "SpoúrÛd ponurych wypaczeÒ nekromantÛw, jednym z najstraszniejszych bluünierstw jest niewπtpliwie tworzenie inferiusa. Nekromanta oøywiajπc wydarte ziemi cia≥o zmar≥ego, czyni je swym bezwolnym narzÍdziem. Bezczeszczπc zw≥oki zmar≥ego i dokonujπc gwa≥tu na naturze, tworzy z nich jednoczeúnie niewolne monstrum. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Inferiusy,	LOG_NOTE);
	B_LogEntry		(BookLog_Inferiusy,	"Inferiusy");
	B_LogEntry		(BookLog_Inferiusy,	"SpoúrÛd ponurych wypaczeÒ nekromantÛw, jednym z najstraszniejszych bluünierstw jest niewπtpliwie tworzenie inferiusa. Nekromanta oøywiajπc wydarte ziemi cia≥o zmar≥ego, czyni je swym bezwolnym narzÍdziem. Bezczeszczπc zw≥oki zmar≥ego i dokonujπc gwa≥tu na naturze, tworzy z nich jednoczeúnie niewolne monstrum. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Wbrew pozorom nekromanci nie wskrzeszajπ wcale zmar≥ych, ani nie powracajπ im øycia. Za sprawπ czarnej magii w truchle pojawia siÍ nekromanckie tchnienie, ktÛre niewoli cia≥o zmar≥ego i czyni je powolnym woli nekromanty. Tak oto powstajπ z ziemi trupy naszych bliünich, zaú ich rozk≥adajπce siÍ cia≥a i koúci budzπ grozÍ w øywych. Inferiusy mogπ ujawniaÊ siÍ jako szkielety, bπdü ulegajπce rozpadowi chodzπce zw≥oki. W dodatku jak podajπ ludzie, ktÛrym dane by≥o spotkaÊ inferiusa, w oczach oøywieÒca moøna dostrzec niewyobraøalne cierpienie. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Czyn nekromandki jest zbrodniπ przeciwko prawom boskim i przeciw przyrodzonej godnoúci cz≥owieka - przeciwko temu darowi jakim w swej mπdroúci obdarzyli nas bogowie. Owo wynaturzenie sprowadza oøywione zw≥oki do poziomu krwioøerczego zwierzÍcia, ktÛre jest gotowe zaatakowaÊ kaødego napotkanego cz≥owieka. Inferiusy to øywiπ siÍ padlinπ. Na tym jednak nie koniec, gdyø poøerajπ nawet ludzkie zw≥oki, ≥amiπc kolejne z praw boskich. Nie one sπ jednak winne owym wystÍpkom, jeno plugawi nekromanci, ktÛrzy w swej pysze powo≥ali do øycia inferiusa. W ciπgu wiekÛw moc z≥ego sta≥o siÍ za sprawπ tych bezecnych magusÛw. Zdarzali siÍ w≥adcy, ktÛrzy nachylali ucha ku podszeptom nekromantÛw, by pognÍbic swych wrogÛw. Inni spoúrÛd plugawych magusÛw dzia≥ali na w≥asnπ rÍkÍ.");
	
	B_LogEntry		(BookLog_Inferiusy,	"Dobry nasz Innos, Pan Ognia przedwieczny, w swej ≥asce obdarzy≥ ludzi wspania≥ym b≥ogos≥awieÒstwem. Z jego nakazu, kaødy prawowierny Innosyta winien jest udzieliÊ zmar≥emu pochÛwku w imiÍ Innosa. Wielu ludzi zignorowa≥o ten nakaz, gdyø nie ufa≥a mπdroúci Pana Ognia. Dopiero z czasem ludzie odkryli, øe Innos nie bez przyczyny da≥ ludziom owe przykazanie, gdyø ten kto zgodnie z obrzπdkiem Innosyckim by≥ pochowany, ten by≥ jego ≥askπ chroniony przed praktykπ nekromanckπ. DziÍki owemu b≥ogos≥awieÒstwu 'oøywieÒcem' nie stanie siÍ cz≥owiek naleøycie pochowany. Jasnym wiÍc siÍ staje, øe odmÛwienie pochÛwku zmar≥emu jest w≥aúciwie wydaniem jego cia≥a na pastwÍ nekromantÛw, a co za tym idzie podobny postÍpek jest cieøkim przewinieniem wobec bogÛw. ");
	
	B_LogEntry		(BookLog_Inferiusy,	"Istniejπ teø niespokojne dusze, ktÛre umierajπc úmierciπ gwa≥townπ, lub utrzymywane na tym úwiecie ziemskimi sprawami, pozostajπ na tym padole. Ich úwiadomoúÊ i w≥adza nad cia≥em jest niewiele wiÍksza niø nieszczÍúnikÛw oøywionych przez nekromantÍ. To czyni takie dusze podobnymi do inferiusÛw. Jednak nimi nie sπ. Niemniej godny pochÛwek i tu dzia≥a z podobnπ mocπ. Przeto KoúciÛ≥ Innosa i KoúciÛ≥ Adanosa nakazujπ swym wiernym grzebanie zmar≥ych, niezaleønie od wiary i pochodzenia grzebanego. Podobnie czyniπ i plemiona pogaÒskie, lecz u nich z innej to przyczyny siÍ dziaÊ musi. ");
};


/////////////////////////////////////////////////////////////////////
// åCIERWOJAD BIA£Y
// DO KUPIENIA U MYåLIWYCH
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_WhiteScavenger (C_ITEM) //dodane
{
	name 					=	"åcierwojad bia≥y";

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
	Doc_PrintLines	( nDocID,  0, "åcierwojad bia≥y");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "åcierwojady sπ niezwykle zrÛønicowanπ gatunkowo grupπ zwierzπt. WystÍpujπ zarÛwno na ≥πkach i lasach Zielonej Myrtany, jak i na licznych wyspach po≥oøonych na wschÛd od Kontynentu. Te wielkie ptaki zaliczane sπ do nielotÛw. ChoÊ istnieje wiele rodzajÛw úcierwojadÛw, to ksiÍga ta skupia siÍ jedynie na bia≥o-niebieskawym nieopierzonym úcierwojadzie z Khorinis, ktÛra to odmiana nazywana jest úcierwojadem bia≥ym.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_WhiteScavenger,	LOG_NOTE);
	B_LogEntry		(BookLog_WhiteScavenger,	"åcierwojad bia≥y");
	B_LogEntry		(BookLog_WhiteScavenger,	"åcierwojady sπ niezwykle zrÛønicowanπ gatunkowo grupπ zwierzπt. WystÍpujπ zarÛwno na ≥πkach i lasach Zielonej Myrtany, jak i na licznych wyspach po≥oøonych na wschÛd od Kontynentu. Te wielkie ptaki zaliczane sπ do nielotÛw. ChoÊ istnieje wiele rodzajÛw úcierwojadÛw, to ksiÍga ta skupia siÍ jedynie na bia≥o-niebieskawym nieopierzonym úcierwojadzie z Khorinis, ktÛra to odmiana nazywana jest úcierwojadem bia≥ym. Opisywany rodzaj zamieszkuje ca≥y obszar wyspy Khorinis, poczπwszy od ≥πk, pÛl i lasÛw rozpoúcierajπcych siÍ u podnÛøy miasta portowego, aø po wiÍziennπ GÛrniczπ DolinÍ. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"åcierwojad bia≥y swymi rozmiarami gÛruje tam nad wszelkim ptactwem jakie znajdziemy na terenie wyspy. Porusza siÍ na dwÛch tylnych koÒczynach, zakoÒczonych ostrymi pazurami. Posiada rÛwnieø masywny dziÛb, s≥uøπcy mu podobnie jak szpony podczas ≥owÛw do atakowania ofiary, a nastÍpnie do rozrywania jej miÍsa. ChoÊ tu naleøy dodaÊ, øe ani szpony úcierwojada, ani dziÛb nie sπ uwaøane za nazbyt poøπdane trofeum myúliwskie. Podobnie rzecz siÍ ma z ich ≥uskowatπ skÛrπ, czy niewykszta≥conymi niemal skrzyd≥ami. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"Gatunek ten podobnie jak jego krewniacy z Kontynentu, czy Wysp Po≥udniowych, øywi siÍ drobnymi zwierzÍtami polnymi i padlinπ. Temu ostatniemu sk≥adnikowi swej diety zawdziÍcza swπ niechlubnπ nazwÍ úcierwojada. åcierowjad bia≥y wiÍkszoúÊ dnia poúwiÍca rozgrzebywaniu ziemi w poszukiwaniu poøywienia, choÊ niekiedy moøna zaobserwowaÊ teø jak Ûw ptak poluje na inne zwierzÍta. Jest w stanie zaatakowaÊ mniejsze od siebie istoty jak owce, szczury, a w grupie rÛwnieø pojedyncze wilki. Jak przysta≥o na ptaki, przedstawiciele tego gatunku sπ jajorodne. ");
	
	B_LogEntry		(BookLog_WhiteScavenger,	"Zalicza siÍ je do zwierzπt stadnych øyjπcych w grupach od 3-7 osobnikÛw razem zdobywajπcych poøywienie, choÊ moøna spotkaÊ rÛwnieø pojedyncze osobniki prowadzπce samotny tryb øycia. åcierwojady sπ czÍstym obiektem ≥owÛw myúliwych, albowiem ich miÍso, odpowiednio przyrzπdzane jest  w stanie dogodziÊ niemal kaødemu podniebieniu - moøe z wyjπtkiem kosmopolitycznej warstwy wielkiego kupiectwa, lubujπcej siÍ w egzotycznych potrawach. RÛwnieø jaja úcierwojadÛw cieszπ siÍ opiniπ bardzo poøywnego i obok miÍsa stanowiπ jednπ z podstaw diety myúliwych polujπcych w lasach Myrtany, Khorinis, Vaduz i Wysp Po≥udniowych...");
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

	TEXT[2] 				=	"Prawo myrtaÒskie";
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
	Doc_PrintLines	( nDocID,  0, "Spisane oto zasady dotyczπce dziedziczenia w KrÛlestwie Myrtany obowiπzujπce.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_PrivilegeInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_PrivilegeInheritance,	"Przywilej dziedziczenia");
	B_LogEntry		(BookLog_PrivilegeInheritance,	"1. Jeúli umrze ktÛryú z poúrÛd naszych hrabiÛw i baronÛw lub innych wasali dzierøπcych dobra naprawie rycerskim, a w chwili úmierci jego spadkobierca by≥ juø pe≥noletni i obowiπzany úwiadczyÊ nam daniny niechaj posiπdzie lenno swoje p≥acπc daniny jak dawniej, mianowicie dziedzic lub dziedzice hrabiego dzierøπcego ca≥kowitπ baroniÍ hrabiowskπ - sto funtÛw; dziedzic lub dziedzice barona dzierøπcego ca≥kowitπ baroniÍ rÛwnieø ñsto funtÛw, dziedzic lub dziedzice rycerza posiadajπcego pe≥ne lenno nie wiÍcej jak sto szylingÛw; kto zaú winien by mniej úwiadczyÊ, niechaj da mniej na zasadzie dawnego zwyczaju feuda≥Ûw.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"2. Gdyby zaú dziedzic takiegoø lenna by≥ niepe≥noletni i pozostawa≥ jeszcze pod opiekπ, to gdy tylko osiπgnie lata sprawne niechaj obejmie swoje dziedzictwo nie p≥acπc ani relevium, ani teø innej op≥aty.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"3. Opiekun ziemi takiego dziedzica, ktÛry nie posiad≥ lat sprawnych nie powinien pobieraÊ z ziemi dziedzica nic ponad s≥uszne op≥aty, s≥uszne zwyczaje i s≥uszne powinnoúci i to bez zniszczeÒ i ubytkÛw w ludziach i inwentarzu, a jeúli my powierzymy tego rodzaju opiekÍ nad majπtkiem szeryfowi, lub komukolwiek innemu, kto bÍdzie obowiπzany wobec nas do rozliczeÒ z dochodÛw i wydatkÛw i tenøe powierzone sobie dobra doprowadzi do upadku i spustoszenia, úciπgniemy od niego odszkodowanie a lenno powierzymy dwom pe≥noprawnym i godnym zaufania ludziom i oni rozliczaÊ siÍ bÍdπ z nami lub z tym komu ich przydzielimy. Jeúli zaú oddamy lub sprzedamy komukolwiek opiekÍ nad tymi dobrami i ten okaza≥by siÍ odpowiedzialny za ruinÍ i spustoszenie to utraci opiekÍ, ktÛra zostanie przekazana dwom pe≥noprawnym i godnym zaufania ludziom z tegoø lenna, ktÛrzy przed nami bÍdπ odpowiedzialni w sposÛb wyøej okreúlony.");
	
	B_LogEntry		(BookLog_PrivilegeInheritance,	"4. Zaú opiekun jak d≥ugo sprawowa≥ bÍdzie opiekÍ nad ziemiπ powinien z uzyskanych z ziemi dochodÛw dbaÊ o domy, ogrodzenia, zabudowania, stawy, m≥yny i inne przynaleøne do posiad≥oúci urzπdzenia, a gdy dziedzic osiπgnie lata sprawne opiekun winien mu oddaÊ ca≥π, jego posiad≥oúÊ wyposaøonπ w p≥ugi i narzÍdzia stosowane do okresowych potrzeb uprawy roli i sposobu jej uøytkowania.");
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

	TEXT[2] 				=	"Prawo myrtaÒskie";
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
	Doc_PrintLines	( nDocID,  0, "Kupieckie przywileje przez krÛla Myrtany Rohobara I przyznane gildiom kupieckim.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_MerchantInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_MerchantInheritance,	"Przywilej kupiecki");
	B_LogEntry		(BookLog_MerchantInheritance,	"Niechaj wszyscy kupcy, zarÛwno obracajπcy wielkim kapita≥em i drobni handlarze, pochodzπcy z ziem KrÛlestwa Myrtany i krajÛw postronnych od Nas, KrÛla Myrtany, ten przywilej otrzymujπ. ");
	
	B_LogEntry		(BookLog_MerchantInheritance,	"Wszyscy kupcy celem dokonywania zakupu i sprzedaøy towaru, prÛcz dÛbr rozporzπdzeniem naszym spod obrotu wyjÍtych, majπ prawo swobodnego i bezpiecznego podrÛøowania po ziemiach KrÛlestwa Myrtany, mogπc bez wstrÍtÛw z czyjejkolwiek strony przybywaÊ, przemierzaÊ i opuszczaÊ ziemie bÍdπce w≥adztwem KrÛla Myrtany. Niechaj majπ prawo podrÛøowaÊ zarÛwno na lπdzie, jak i na morzu wed≥ug dawnych sprawiedliwych zwyczajÛw, bez øadnych bezprawnie pobieranych op≥at.");
	
	B_LogEntry		(BookLog_MerchantInheritance,	"W godzinie kiedy düwiÍk trπb og≥osi wojnÍ, wtedy na czas trwania konfliktu z przywileju swobodnej podrÛøy wy≥πczeni zostajπ kupcy z kraz kraju znajdujπcego siÍ w wojnie z nami; a jeúli tacy znajdπ siÍ w naszym krÛlestwie na poczπtku wojny, winni byÊ zatrzymani bez szkody dla ich osÛb i mienia do tego czasu, dopÛki My nie dowiemy siÍ, w jaki sposÛb traktowani sπ kupcy z Naszego krÛlestwa, ktÛrzy w owym w≥aúnie czasie znaj dowali siÍ w kraju prowadzπcym wojnÍ z nami; a jeúli nasi sπ tam bezpieczni, wÛwczas i ci zaøywaÊ bÍdπ bezpieczeÒstwa w naszym krÛlestwie.");
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

	TEXT[2] 				=	"Prawo myrtaÒskie";
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
	Doc_PrintLines	( nDocID,  0, "Przywileje przys≥ugujπce lichwiarzom w KrÛlestwie Myrtany. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_UsouriusInheritance,	LOG_NOTE);
	B_LogEntry		(BookLog_UsouriusInheritance,	"Przywilej lichwiarski");
	B_LogEntry		(BookLog_UsouriusInheritance,	"Wiele zamieszania i niesprawiedliwoúci siÍ zrodzi≥o z nieuporzπdkowania kwestii dziedziczenia d≥ugu, ktÛry zmar≥y u lichwiarza przed úmierciπ zaciπgnπ≥. Przeto ustanowiony zostaje w ca≥ym KrÛlestwie jeden zwyczaj, wed≥ug ktÛrego w ca≥ym KrÛlestwie Myrtany ma siÍ od momentu jego og≥oszenia postÍpowaÊ. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"Jeúli poddany naszego KrÛlestwa, czy cz≥owiek z krain oúciennych do w≥adztwa naszego przybywajπcy, pobra≥ jakπkolwiek mniejszπ lub wiÍkszπ poøyczkÍ od lichwiarza z KrÛlestwa Myrtany i umar≥ przed jej sp≥atπ, d≥ug ten nie podlega oprocentowaniu tak d≥ugo dopÛki dziedzic nie osiπgnie wieku pe≥noletniego. Lichwiarz zaú, nic ponad zapisanπ naleønoúÊ, z tego tytu≥u pobraÊ nie moøe, prÛcz tego co mu siÍ zgodnie z umowπ naleøy. Jednoczeúnie kontrakt zawarty miÍdzy wierzycielem i d≥uønikiem, staje siÍ umowπ chronionπ prawem krÛlewskim i jej niedotrzymanie zgodnie z prawem krÛlewskim bÍdzie karane. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"I jeúli ktoú umrze potomka nie zostawiwszy, a winien bÍdzie lichwiarzowi, wdowa po nim podejmuje siÍ d≥ug ten sp≥aciÊ. Poøyczone pieniπdze nie podlegajπ oprocentowaniu przez dwa trzy lata i osiem dni, gdyø jest to czas w ktÛrym wdowa ma zgromadziÊ pieniπdze potrzebne na d≥ugu pokrycie. ");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"Øaden wierzyciel nie zagarnie teø øadnej posiad≥oúci, ani dochodu z tytu≥u jakiejkolwiek zaleg≥oúci, jak d≥ugo ruchomoúci d≥uønika wystarczπ na pokrycie tej zaleg≥oúci, tak d≥ugo rÛwnieø porÍczyciele nie bÍdπ pociπgniÍci do pokrycia d≥ugu, dopÛki w≥aúciwy d≥uønik posiada odpowiedni úrodek i dopiero gdy w≥aúciwego d≥uønika nie bÍdzie staÊ na zap≥atÍ, porÍczyciele stanπ siÍ odpowiedzialni za d≥ug i jeúli zechcπ obejmπ ziemiÍ i dochody d≥uønika i zatrzymajπ dopÛki nie uzyskajπ zadoúÊuczynienia za wydatki jakie za niego pokryli, chyba øe w≥aúciwy d≥uønik wykaøe, øe wywiπza≥ siÍ wobec swoich porÍczycieli.");
	
	B_LogEntry		(BookLog_UsouriusInheritance,	"W podobny sposÛb dziaÊ ma siÍ z naleønoúciami u innych osÛb aniøeli u lichwiarza zaciπgniÍte, co by prawa wierzyciela do w≥asnoúci swej broniÊ, zaú poddanych naszych przed ruinπ uchroniÊ. ");
};

/////////////////////////////////////////////////////////////////////
// ZNAKI Z£ODZIEJSKIE... UTRACONE
// CHATA W STARYM OBOZIE
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LostThiefSigns (C_ITEM) //d
{
	name 					=	"Utracone znaki z≥odziejskie";

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
	Doc_PrintLines	( nDocID,  0, "Utracone znaki z≥odziejskie");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Przez oko≥o lat stu i jeszcze po≥owy tego, Gildia uøywa≥a znakÛw danych nam przez Samela. Symboli po dwakroÊ utrwalonych, bo raz - w pamiÍci naszej, a dwa - w ksiÍdze piÛrem Lutharda spisanej. DziÍki nim wiedzieliúmy gdzie skarb na nas czeka, a gdzie niebezpieczeÒstwo siÍ na z≥odzieja czai. Kres jednak nasta≥ dni, w ktÛrych znakÛw tych mogliúmy uøywaÊ. ");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_LostThiefSigns,	LOG_NOTE);
	B_LogEntry		(BookLog_LostThiefSigns,	"Utracone znaki z≥odziejskie");
	B_LogEntry		(BookLog_LostThiefSigns,	"Przez oko≥o lat stu i jeszcze po≥owy tego, Gildia uøywa≥a znakÛw danych nam przez Samela. Symboli po dwakroÊ utrwalonych, bo raz - w pamiÍci naszej, a dwa - w ksiÍdze piÛrem Lutharda spisanej. DziÍki nim wiedzieliúmy gdzie skarb na nas czeka, a gdzie niebezpieczeÒstwo siÍ na z≥odzieja czai. Kres jednak nasta≥ dni, w ktÛrych znakÛw tych mogliúmy uøywaÊ. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Oto po úmierci kupca Selwyna Ravelli, co w przyjaüni z naszπ Gildiπ øy≥ i dzieli≥ z nami owoce swej pracy, jego majπtek i interes odziedziczy≥ Lutero Ravella - syn jego i zaka≥a dumnej rodziny. On to wiernoúci nam, wspÛ≥pracownikom swego ojca, nie chcia≥ dotrzymaÊ i z≥oto chciwie przy sobie chowa≥. A g≥upio czyni≥, gdyø z≥oto owe Selwyn zgromadzi≥ razem z nami i przy naszej pomocy swego z≥ota strzeg≥. I przy nas pomnoøy≥o siÍ bogactwo starego Ravelli, ktÛre po nim otrzyma≥ jego g≥upi syn. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Gdy wtedy Lutero odrzuci≥ przyjaüÒ naszπ, przywÛdca Gildi Z≥odziei, ktÛrym w tym czasie by≥ Galid rzek≥ do nas: 'Dom rodu Ravella nie jest juø nam przyjazny, wiÍc jego mury nie majπ prawa pieczÍtowaÊ siÍ znakiem Studni'. Tej nocy wyruszy≥ m≥ody brat nasz Dickon, by symbol Studni zmazaÊ i nowy na rezydencji Ravelli wyryÊ. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Kto wie, czy b≥Ídem ch≥opca, czy z≥oúliwoúciπ losu, Dickon zosta≥ zauwaøony i pochwycony przez straøe. O ile jednak w misji swej tamtej nocy zawiÛd≥, to swym oddaniem i poúwiÍceniem w niema≥ej mierze sp≥aci≥ swÛj d≥ug. Oto w koszarach przetrzymywany o chlebie i wodzie, w brutalny sposÛb przes≥uchiwany i do zdrady Gildii namawiany, nie uleg≥. Skazanego Dickona, zes≥ano do Kolonii Karnej, gdzie za konsekwencjÍ swego b≥Ídu mia≥ srodze pokutowaÊ. Nie wyjawi≥ jednak straøom, gdzie nasza Gildia posiada kryjÛwkÍ, ani nie sprzeda≥ øadnego ze swych towarzyszy. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Co oczywiste, po z≥apaniu Dickona straø siÍ owymi znakami wielce zainteresowa≥a. Lutero uczyni≥ wszystko, by naprowadziÊ straøe na trop wiodπcy do Gildii Z≥odziei, samemu skrzÍtnie maskujπc wspÛ≥pracÍ swego ojca z nami. Pojawi≥a siÍ obawa, øe znaki, ktÛre dawniej tylekroÊ nam s≥uøy≥y, teraz mogπ wskazaÊ nieprzyjacielowi drogÍ do naszej kwatery g≥Ûwnej. Zagroøeni teø byli zaprzyjaünieni z nami bogacze, gdyø na ich domach widnia≥y symbole, ktÛre z≥amane przez straøe, mog≥y rzuciÊ cieÒ podejrzenia na dzia≥alnoúÊ owych ludzi interesu. Albowiem tak jak kodeks z≥odzieja kaøe zachowaÊ lojalnoúÊ wzglÍdem przyjaciÛ≥, tak dla kupca waøna jest reputacja, ktÛra zawsze w kupieckich transakcjach musi byÊ uwzglÍdniana. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Rozes≥aliúmy wtedy listy do zaprzyjaünionych bogaczy, co by odnaleüli owe znaki i usunÍli je ze swych domostw. Wielu z nich nie pos≥ucha≥o naszych prÛúb, gdyø wiπza≥o rozmaite nadziejÍ z rozbiciem nas przez straøe. Tacy fa≥szywi przyjaciele wskazywali jednoczeúnie úledczym opisane w owych listach symbole. Mπdrzy ludzie jednak wiedzieli, øe zniszczenie prawej i honorowej organizacji z≥odziejskiej, rzπdzπcej siÍ zwyczajem z≥odziejskim i zwalczajπcej z≥odziejskich partaczy, oznaczaÊ bÍdzie chaos i przyniesie wszystkim jedynie szkody. Rozumnie widzπc zysk w istnieniu Gildii Z≥odziei, nak≥onili oni ucha do prÛúb naszych serdecznych i postπpili zgodnie z treúciπ pism. Ci wiele sympatii u nas tym uczynkiem zdobyli, gdyø okazali siÍ nie tylko prawdziwymi przyjaciÛ≥mi Gildii, ale teø ludümi mπdrymi. Jednoczeúnie staraniem naszym z miasta zniknÍ≥y wszystkie 'Ramiona Samela', a takøe wiele innych znakÛw. Jedynie w strzeøonym GÛrnym Mieúcie wiele symboli siÍ uchowa≥o, a to przez wzglπd na wzmoøone zainteresowani nimi jakie przejawia≥a straø. Niestety, w przeciπgu kilku tygodni úledztwa znaki owe z≥amano. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Gdy Galid i inni siÍ zgromadzili, wiele nad tym nieszczÍúciem radzono. Jedni powiadali by ustalone przed laty znaki zachowaÊ i wrÛciÊ do nich w czasie ku temu stosownym, to jest gdy sprawa przycichnie. Inni radzili by na nieprzyjacio≥ach siÍ zemúciÊ i Studniπ oznakowaÊ domostwa bogaczy, co by na nich straøe sprowadziÊ. A znak ten znany by≥ juø dla straøy. Clagius, cz≥owiek za swÛj spryt wielce powaøany wsta≥ i przemÛwi≥: 'GardzÍ g≥upcami, co sπdzπ, øe straø kiedykolwiek o tak zdobytej cennej wiedzy zapomni. GardzÍ teø g≥upcami, co karki swoje i swych braci chcπ nadstawiaÊ, byle tylko garstce zdradzieckich gnid zaszkodziÊ. G≥upim jest ten co owce swe przeznaczone na we≥nÍ w wybuchu z≥oúci zabija. Mamy wiÍc ksiÍgi o znakach, ktÛre poøytku nam juø nie przyniosπ. UczyÒmy wiÍc kolejne takie ksiÍgi i uøywajπc poúrednikÛw, sprzedajmy je za wielkπ sumÍ z≥ota bogaczom, tak by myúleli, øe nas przechytrzyli!'");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Cz≥onkowie Gildii poszli za radπ Clagiusa i tak uczynili. Sprzedali wtedy 5 ksiπg bogatym kupcom, ktÛrzy wiele z≥ota za nie zap≥acili. Sprzedaliúmy 3 w≥adzom miasta, ktÛre wys≥a≥y jednπ trefnπ ksiÍgÍ na Juran, a drugπ aø do Vengardu, co by wspomÛc ich straøe w walce z tamtejszymi gildiami z≥odziei. Dopiero z czasem ci g≥upcy mieli poznaÊ prawdziwπ wartoúÊ tego, za co zap≥acili ciÍøkim z≥otem. ");
	
	B_LogEntry		(BookLog_LostThiefSigns,	"Raduj siÍ przeto duchu Samela, jeúliú poúrÛd nas, czy w piek≥ach jeøeli istniejπ. Oto nawet gdy szyfry Twe wpad≥y w rÍce nieprzyjaciÛ≥, to dziÍki z≥odziejskiemu sprytowi okpiliúmy kupcÛw i straøe, a stratÍ niema≥π obrÛciliúmy w zysk jeszcze wiÍkszy. Na chwa≥Í dumnej Gildii Z≥odziei Khorinis. ");
};


/////////////////////////////////////////////////////////////////////
// ARAXOS
// OB”Z BANDYT”W - SKRZYNIA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Araxos (C_ITEM) //d
{
	name 					=	"Araxos - KrÛlowa MÛrz";

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
	Doc_PrintLines	( nDocID,  0, "Araxos - KrÛlowa MÛrz");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Wielka Gildia Handlowa Araxos jest najwiÍkszπ i najbogatszπ ze wszystkich organizacji kupieckich znanego nam úwiata. Nasza potÍøna flota przemierza morza i oceany, prowadzπc oøywionπ wymianÍ handlowπ wykraczajπcπ daleko poza granicÍ KrÛlestwa Myrtany.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Araxos,	LOG_NOTE);
	B_LogEntry		(BookLog_Araxos,	"Araxos - KrÛlowa MÛrz");
	B_LogEntry		(BookLog_Araxos,	"Wielka Gildia Handlowa Araxos jest najwiÍkszπ i najbogatszπ ze wszystkich organizacji kupieckich znanego nam úwiata. Nasza potÍøna flota przemierza morza i oceany, prowadzπc oøywionπ wymianÍ handlowπ wykraczajπcπ daleko poza granicÍ KrÛlestwa Myrtany. Jeszcze w czasach samodzielnych krÛlestw, rozpoczÍliúmy kolonizacjÍ wielu wysp po≥oøonych na wschodzie, a prawa do nich zosta≥y potwierdzone uroczystym przywilejem danym nam od KrÛla Myrtany. Rozpoczynajπc swπ drogÍ jako vengardzkie towarzystwo kupieckie, zdo≥aliúmy siÍ staÊ potÍønπ gildiπ handlowπ posiadajπcπ liczne wyspy, kopalnie, przywileje i monopole, tak na w≥asnoúÊ, jak rÛwnieø w dzierøawie. ");
	
	B_LogEntry		(BookLog_Araxos,	"Nic wiÍc dziwnego, øe nasze bogactwo budzi zazdroúÊ wielu ludzi i przyczynia siÍ do rozpowszechniania o nas z≥oúliwych plotek. Wbrew temu co twierdzπ leniwi i g≥upi, powodzenie w interesach moøna osiπgnπÊ bez odwo≥ywania siÍ do mocy Beliara, czy siÍgania po czarnπ magiÍ. Przewodnik ten postanowi≥em napisaÊ w≥aúnie dla ludzi, ktÛrzy chcieliby nas zrozumieÊ, lub siÍ do nas przy≥πczyÊ.  ");
	
	B_LogEntry		(BookLog_Araxos,	"Gildia Araxos jest najbogatszπ i najwiÍkszπ z organizacji kupieckich. Dla uszanowania naszych poczπtkÛw, siedzibπ w≥adz gildii uczyniliúmy sto≥eczny Vengard, gdzie od wiekÛw rezyduje Rada Dwunastu z≥oøona z najwiÍkszych kupcÛw naszej kompanii handlowej. Jednak nie zamykamy siÍ jedynie w obrÍbie tradycji. W dniach, w ktÛrych Innos uczyni≥ swymi wybraÒcami dynastiÍ nordmarskπ, uznaliúmy w KrÛlach Myrtany swych opiekunÛw i jako Wielka Gildia Araxos weszliúmy w nowπ epokÍ naszych dziejÛw. ");
	
	B_LogEntry		(BookLog_Araxos,	"Wieki naszego istnienia wiele nas nauczy≥y. Kupiec jest stworzony do obrotu pieniπdzem i to trzos pe≥ny z≥ota, a nie miecz winien byÊ jego broniπ. Kiedy nie da siÍ uniknπÊ konfrontacji, najlepiej sypnπÊ najemnikom z≥otem i daÊ im walczyÊ z naszym nieprzyjacielem. Nawet jednak wtedy to w≥aúnie z≥oto jest naszym prawdziwym orÍøem. ");
	
	B_LogEntry		(BookLog_Araxos,	"Niejednokrotnie wrogowie przewyøszali nas na polach bitew, zwyciÍøajπc øelazem i liczebnoúciπ. Jednak, gdy wojny dobiega≥y koÒca, okazywa≥o siÍ, nasi wrogowie sπ zad≥uøeni u naszych kupcÛw i przez to zdani na naszπ ≥askÍ. Tak oto szlachetne i piÍkne z≥oto wygrywa≥o nad brutalnym i barbarzyÒskim øelazem. ");
	
	B_LogEntry		(BookLog_Araxos,	"Naszπ matkπ jest morze, a ojcem s≥odki Vengard. Jesteúmy dzieÊmi wÛd, a naszym domem sπ statki. GÛrujemy przeto nad handlarzami z gelderyjskiej gildii Mentes, ktÛra nie zna morza, jeno zatÍch≥e i ciemne korytarze ich krecich kopalÒ. KtÛraø z gildii dorÛwna naszej flocie, ktÛra nie tylko nam transportem, ale i broniπ? Ona nam drewnianym murem! ");
	
	B_LogEntry		(BookLog_Araxos,	"GoÒ za fortunπ i chwytaj jπ, jeúli widzisz ku temu okazjÍ. Nie pozwÛl jednak by perspektywa zysku ciÍ zaúlepia≥a i odbiera≥a trzeüwy osπd, gdyø z tego jeno strata, a nie zysk wyniknπÊ moøe. Zwaø na swπ reputacjÍ i miej jπ w swej pieczy, gdyø posiada ona wielkπ wartoúÊ w handlu. WartoúÊ o wiele wiÍkszπ niø jest w stanie to pojπÊ, ta rzesza prostakÛw aspirujπcych do miana kupcÛw. W kaødej transakcji wartoúÊ jakπ stanowi reputacja powinna byÊ brana pod uwagÍ w nie mniejszym stopniu niø korzyúci materialne. Oszustwa, czy kradzieøe nie mÛwiπc juø o mordach, majπ to do siebie, øe oprÛcz konsekwencji prawnych, üle wp≥ywajπ na interesy. Jeøeli kogoú oszukasz, albo okradniesz, to czy taki ktoú bÍdzie chcia≥ zawieraÊ jeszcze kiedyú z tobπ transakcje?");
	
	B_LogEntry		(BookLog_Araxos,	"Martwy wrÛg to teø niekoniecznie dobry wrÛg, gdyø nawet nieprzyjaciel moøe w przysz≥oúci staÊ siÍ twoim partnerem handlowym.");
	
	B_LogEntry		(BookLog_Araxos,	"Kupiec z Wielkiej Gildii Araxos powinien mieÊ dobry refleks i wyczucie. Kto nie potrafi dotrzymaÊ kroku duchowi czasÛw i interesÛw, ten juø na wstÍpie przegrywa. ∆wiczyÊ siÍ w retoryce i mÛwiÊ przekonujπco, handlowaÊ z najlepszymi i osiπgaÊ zysk - oto cele jakie powinien wyznaczaÊ sobie kaødy, kto nosi pierúcieÒ gildii. ");
	
	B_LogEntry		(BookLog_Araxos,	"Jeøeli pragniesz do nas do≥πczyÊ, udaj siÍ do najbliøszego Domu Gildii i poddaj siÍ prÛbie. Udowodnij, øe posiadasz odpowiednie umiejetnoúci, a zasilisz szeregi Wielkiej Gildii Araxos. Wykaø siÍ zapa≥em i inicjatywπ, a zapewnisz sobie awans w hierarchii naszej kompanii kupieckiej. Ku chwale KrÛlowej MÛrz, niezwyciÍøonej i wiecznej, Wielkiej Gildii Handlowej Araxos.");
};

/////////////////////////////////////////////////////////////////////
// PRZYPOWIEå∆ O DW”CH ASCETACH
// W åWI•TYNI Y'BERIONA
// NAPISANE PRZEZ WYZYSKKA | WYKONANE PRZEZ OUTLANDERA
/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Ascetic (C_ITEM) //d
{
	name 					=	"PrzypowieúÊ o dwÛch ascetach";

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
	Doc_PrintLines	( nDocID,  0, "PrzypowieúÊ o dwÛch ascetach");
	Doc_SetFont 	( nDocID,  0, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Historyjka ta podobnie jak wiele innych przez wiele wiekÛw krπøy≥a w formie podania opowiadanego przy ogniskach. DwÛch ascetÛw, ktÛrzy sπ g≥Ûwnymi bohaterami tej opowieúci sπ typem postaci doúÊ czÍsto wystÍpujπcych w varanckich legendach. Geneza tych legend siÍga czasÛw, gdy z morza po zag≥adzie Pradawnych wy≥oni≥ siÍ lπd, ktÛry sta≥ siÍ domem zesz≥ych z gÛr koczownikÛw.");


	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
	Doc_SetFont 	( nDocID,  1, "font_10_book.TGA");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLines	( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

	Doc_Show		( nDocID );
	Log_CreateTopic	(BookLog_Ascetic,	LOG_NOTE);
	B_LogEntry		(BookLog_Ascetic,	"PrzypowieúÊ o dwÛch ascetach");
	B_LogEntry		(BookLog_Ascetic,	"Historyjka ta podobnie jak wiele innych przez wiele wiekÛw krπøy≥a w formie podania opowiadanego przy ogniskach. DwÛch ascetÛw, ktÛrzy sπ g≥Ûwnymi bohaterami tej opowieúci sπ typem postaci doúÊ czÍsto wystÍpujπcych w varanckich legendach. Geneza tych legend siÍga czasÛw, gdy z morza po zag≥adzie Pradawnych wy≥oni≥ siÍ lπd, ktÛry sta≥ siÍ domem zesz≥ych z gÛr koczownikÛw. Nowi mieszkaÒcy Varantu, choÊ wyznawali Adanosa, to podjÍli siÍ przemierzania szlaku, ktÛrym przed wiekami przemierza≥ wybraniec Innosa zwany Wiecznym WÍdrowcem. Czynili to dla przeb≥agania bogÛw, by juø nigdy nie zsy≥ali potopu na ziemie, ktÛre teraz sta≥y siÍ ich domem. Z czasem jednak coraz wiÍcej KoczownikÛw, ktÛrzy potem przyjÍli nazwÍ VarantczykÛw, decydowa≥a sie na osiad≥y tryb øycia. Tak oto powsta≥y miasta. RÛwnoczeúnie wielu bardzo religijnych mieszkaÒcÛw po≥udnia zaczÍ≥o szukaÊ nowych, bardziej indywidualnych form rozwijania swego øycia duchowego. Zaczπ≥ siÍ wiÍc rozwijaÊ adanosycki ruch pustelniczy. NiektÛrzy spoúrÛd koczownikÛw decydowali siÍ w ramach tego nurtu na samotne øycie w ascezie, pozbawione uciech i skoncentrowane na Adanosie. Jednymi z takich úwiÍtych szaleÒcÛw byli w≥aúnie bohaterowie tej opowiastki. ");
	
	B_LogEntry		(BookLog_Ascetic,	"W tym doúÊ niesprecyzowanym czasie, dwaj úwiπtobliwi mÍøowie Adanosa przemierzali pustynnπ drogÍ. Tradycja nada≥a pierwszemu z nich imiÍ Sekhtem i kaza≥a w nim upatrywaÊ syna jednego z naczelnikÛw koczowniczych w≥adcÛw, ktÛry sprzeciwiwszy siÍ swemu ojcu skalanemu zbrodniπ zabÛjstwa brata, wyrzek≥ siÍ splendoru øycia ksiπøπt i uda≥ siÍ na pustyniÍ pokutowaÊ za grzechy rodzica. PonoÊ miastem, ktÛre m≥ody Sekhtem opuúci≥ mia≥o byÊ Mora Sul, co z jednej strony wiπøe s≥awnego bohatera podaÒ z owym miastem, a z drugiej nie przysparza dobrej s≥awy ginπcym w mrokach dziejÛw poczπtkom tego miasta. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Jego towarzysz, imieniem Zummur, mia≥ byÊ za to rabusiem morskim, ktÛry w czasie jednej z potyczek z innπ szajkπ zosta≥ ciÍøko ranny i niemal na ≥oøu úmierci proszπc Adanosa o uratowanie mu øycia, obieca≥ bÛstwu, øe gdyby dostπpi≥ tej ≥aski to porzuci bandyterkÍ i zostanie pustelnikiem. Pan Wody by≥ dla niego ≥askawy, bo gdy Zummur odzyska≥ zdrowie i zapomnia≥ o przysiedze, Adanos nie powziπ≥ zemsty, lecz postawi≥ na jego drodze Sekhtema, ktÛry przypomnia≥ mu o obietnicy z≥oøonej bÛstwu. Od tej pory by≥y wataøka, w towarzystwie Sekhtema przemierza≥ pustyniÍ, strzegπc raz danego Adanosowi s≥owa. Obaj pogrπøeni w rozmyúlaniach o naturze Pana Wody, niekiedy teø siÍgali po sznury przypiÍte do ich pasÛw, by zarzuciwszy je sobie na plecy, oddawaÊ siÍ praktyce samobiczowania. By≥a to forma pokuty i dobrowolnego umartwiania swego cia≥a, celem upokorzenia swej cielesnoúci i zwiπzanych z niπ s≥aboúci. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Przemierzajπc Varant nie zwaøali ani na dziennπ spiekotÍ, ani na nocne ch≥ody. Owego dnia szli drogπ w czasie deszczu, ktÛrego krople boleúnie smaga≥y ich twarze. Idπc tak, napotkali urodziwπ niewiastÍ, ktÛra schroni≥a siÍ pod drzewem. Owo dziewczÍ zawo≥a≥o pustelnikÛw i poprosi≥o, øeby przenieúli jπ przez rwπcy strumyk. åwiπtobliwi mÍøowie spojrzeli na siebie, odbywajπc niemπ naradÍ. W koÒcu Sekhtem zdecydowa≥ siÍ poúpieszyÊ nieiwiúcie. Zummur sta≥ jednak milczπco dajπc do zrozumienia, øe nie aprobuje postÍpowania towarzysza. Z wyrzutem tylko spoglπda≥ na Sekhtema, ktÛry w tym czasie podniÛs≥ dziewczynÍ i ze spokojem przeniÛs≥ jπ przez strumyk. Ten zaú postawiwszy jπ na ziemi wrÛci≥ siÍ do Zummura. Surowe oblicze czekajπcego pod drzewem by≥ego wataøki zdradza≥o, jego wyraüne niezadowolenie. ");
	
	B_LogEntry		(BookLog_Ascetic,	"Bez s≥owa wyruszyli obaj w dalszπ drogÍ. Poniewaø pustelnicy wÍdrujπcy po Varancie zwykli siÍ doskonaliÊ w cnocie ciszy i cierpliwoúci, Zummur zabra≥ g≥os dopiero dwunstego dnia po spotkaniu niewiasty nad rwπcym strumieniem: 'Porzuciliúmy nasze miasta, zostawiliúmy nasze domy, nasze trzody i nasze rodziny, nasze wygody i pragnienia. Wyrzekliúmy siÍ teø szczÍúcia domowego ogniska i poprzysiÍgliúmy zapomnieÊ o niewiastach. Oddaliúmy siÍ Adanosowi i jedynie do niego naleøymy. Czemu wiÍc przenios≥eú owπ niewiastÍ przez strumieÒ. Czyøbyú nie zwaøa≥ juø na úluby z≥oøone naszemu bogu?'");
	
	B_LogEntry		(BookLog_Ascetic,	"Na to towarzysz mu odpowiedzia≥: 'Wiele lat temu z≥oøy≥em Adanosowi úluby, øe zapomnÍ o niewiastach i przysiÍgÍ mojπ wype≥ni≥em. Czemu wiÍc tobie, drogi przyjacielu siÍ to nie uda≥o?'");
};


/////////////////////////////////////////////////////////////////////

// KL SKA I ZWYCI STWO. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall1 (C_ITEM)

{

name ="KlÍska i zwyciÍstwo";

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

Doc_PrintLines( nDocID,  0, "KlÍska i ZwyciÍstwo");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje KrÛlestwa Gothy za krÛla Andaralla Apostaty, ktÛry wypowiedzia≥ wojnÍ bogom i zakaza≥ magii. KsiÍga pochodzπca z krÍgÛw innosyckich i propagujπca kap≥aÒskπ wersjÍ tych wydarzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall1,LOG_NOTE);

B_LogEntry(BookLog_Andarall1,"KlÍska i zwyciÍstwo. Tom I");

B_LogEntry(BookLog_Andarall1,"MinÍ≥y dwa wieki odkπd Troghdan Wielki przyjπ≥ wiarÍ innosyckπ, dajπc tym samym poczπtek KrÛlestwu Gothy. Potomkowie wielkiego w≥adcy, kontynuowali jego dzie≥o, poszerzajπc granice paÒstwa i pomnaøajπc chwa≥Í zwyciÍskiej korony. Ich to mπdroúci i odwadze KrÛlestwo Gothy zawdziÍcza≥o swπ potÍgÍ.†Po úmierci Mergi III, w≥adzÍ objπ≥ synowiec zmar≥ego krÛla ñ m≥ody ksiπøÍ Andarall. WstÍpujπcy na tron w≥adca, od najm≥odszych lat przejawia≥ ogromnπ pasjÍ do nauki. Jako ch≥opiec zaczytywa≥ siÍ w traktatach z dziedziny techniki i wszelkiej wynalazczoúci, wykazujπc jednak przy tym niechÍÊ do magii.");

B_LogEntry(BookLog_Andarall1,"Wprawia≥o to jego preceptorÛw w niema≥e zak≥opotanie, gdyø to kap≥ani Innosa, jako najbardziej wykszta≥ceni ludzie, odpowiadali wtedy za nauczanie dzieci moønych. Dzie≥o kszta≥cenia ma≥ego Andaralla nie naleøa≥o do prostych, gdyø ch≥opiec z oporami i niechÍciπ uczy≥ siÍ o bogach. PrÍdko teø znienawidzi≥ magÛw.†Gdy Andarall nieco podrÛs≥, czÍsto wymyka≥ siÍ z pa≥acu, by odwiedzaÊ miejskie kuünie, stocznie, czy zwyk≥e warsztaty rzemieúlnicze. Tam ca≥ymi dniami przypatrywa≥ siÍ pracy robotnikÛw i majstrÛw. SzczegÛlnie ciekawi≥y go wszelkiego rodzaju maszyny i sposÛb, w jaki one dzia≥ajπ. Oczywiúcie ani rodzice Andaralla, ani krÛl Meriga nie pochwalali technicznych zainteresowaÒ m≥odzieÒca. Jeszcze wiÍkszy sprzeciw budzi≥y w nich jego przechadzki, gdyø obawiano siÍ o bezpieczeÒstwo nastÍpcy tronu. Trudno jednak by≥o kontrolowaÊ m≥odego Andaralla.");

B_LogEntry(BookLog_Andarall1,"M≥ody w≥adca mia≥ w przysz≥oúci okazaÊ siÍ najzacieklejszym spoúrÛd wszystkich bluüniercÛw, jakich zrodzi≥a†ziemia gocka. Jako krÛl, wydajπc wojnÍ bogom i wierze, okry≥ on haÒbπ swe imiÍ i splami≥ honor w≥asnego rodu. Mia≥ teø zyskaÊ przydomek Apostaty, tak, øe juø za øycia nazywano go Andarallem Apostatπ. Przed nim nie by≥o rÛwnie wielkiego wroga Innosa, ani teø nie bÍdzie wiÍkszego. Poczπtek zdawa≥ siÍ nie zapowiadaÊ jeszcze rzeczy ostatecznych. M≥ody krÛl zgodnie z tradycjπ wziπ≥ udzia≥ w uroczystym pochÛwku swego stryja i razem z kap≥anami odprowadzi≥ doczesne szczπtki Merigi w miejsce wiecznego†spoczynku.");

B_LogEntry(BookLog_Andarall1,"Po objÍciu w≥adzy Andarall zdecydowa≥ siÍ jednak odsunπÊ MagÛw Ognia od tronu krÛlewskiego, choÊ jego wielcy poprzednicy zwykli byli polegaÊ na†mπdroúci i radzie kap≥anÛw. W ich miejsce, m≥ody w≥adca otoczy≥ siÍ rozmaitymi szarlatanami, ktÛrzy w swej bezboønoúci odrzucali istnienie i moc bogÛw. Zamiast kultu Innosa ñ kult cyfr i liczb, zamiast miecza podniesionego w obronie wiary ñ cyrkiel i wÍgielnica. Dawne prawa, dane ludziom od bogÛw, zosta≥y zastπpione prawami wymyúlanymi przez majstrÛw i cieúlÛw. Monarcha i jego nowi doradcy dopuszczali siÍ ba≥wochwalstwa, oddajπc nauce czeúÊ naleønπ bogom.");

B_LogEntry(BookLog_Andarall1,"G≥upio jednak czyni≥ Andarall i otaczajπcy go bluüniercy, gdyø niedoskona≥a jest myúl cz≥owiecza i nijak jej rÛwnaÊ siÍ z mπdroúciπ bogÛw.");



B_LogEntry(BookLog_Andarall1,"KONIEC TOMU PIERWSZEGO");
};

/////////////////////////////////////////////////////////////////////

// KL SKA I ZWYCI STWO. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall2 (C_ITEM)

{

name ="KlÍska i zwyciÍstwo. Tom II";

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

Doc_PrintLines( nDocID,  0, "KlÍska i zwyciÍstwo. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje KrÛlestwa Gothy za krÛla Andaralla Apostaty, ktÛry wypowiedzia≥ wojnÍ bogom i zakaza≥ magii. KsiÍga pochodzπca z krÍgÛw innosyckich i propagujπca kap≥aÒskπ wersjÍ tych wydarzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall2,LOG_NOTE);

B_LogEntry(BookLog_Andarall2,"KlÍska i zwyciÍstwo. Tom II");

B_LogEntry(BookLog_Andarall2,"");

B_LogEntry(BookLog_Andarall2,"KrÛl Andarall utwierdziwszy siÍ na tronie, powziπ≥ niezwykle zuchwa≥y zamys≥. Wrogi bogom monarcha postanowi≥ przekonaÊ lud do porzucenia bogÛw i zastπpienia ich kultem nauki. Za swego g≥Ûwnego wroga Andarall uzna≥ KoúciÛ≥ Innosa. Kryjπc zrazu swoje zamiary powoli z grona wyøszych urzÍdnikÛw kaza≥ usuwaÊ MagÛw Ognia i ludzi wiernych Innosowi. ZaczÍto teø g≥osiÊ, øe magia jest rzeczπ niebezpiecznπ. Z rozkazu Andaralla w tajemnicy zniszczono znajdujπce siÍ w archiwach zamkowych ksiÍgi o bogach i magii. Sp≥onÍ≥y wtedy liczne staroøytne traktaty varanckie, ktÛre przodkowie Andaralla†zgromadzili po zag≥adzie Imperium Pradawnych. PrzeklÍty w≥adca nie oszczÍdzi≥ nawet tych ksiπg, ktÛre przyby≥y na pÛ≥noc wraz z pierwszπ misjπ innosyckπ, sprowadzonπ jeszcze przez za≥oøyciela KrÛlestwa GothÛw i JelkalÛw.†");

B_LogEntry(BookLog_Andarall2,"Z biegiem lat Apostata zrzuca≥ juø resztki pozorÛw i coraz jawniej prowadzi≥ walkÍ z kultem Innosa. Niebawem pyszny w≥adca mia≥ wydaÊ dla ca≥ego krÛlestwa dekret, w ktÛrym pod groübπ kary úmierci zakazywa≥ uøywania magii. Poleci≥ teø swym øo≥dakom przeszukaÊ kraj i znaleüÊ wszystkie magiczne ksiÍgi.");

B_LogEntry(BookLog_Andarall2,"ChoÊ Magowie Ognia starali siÍ uchroniÊ w murach úwiπtynnych tyle pism ile to by≥o moøliwe, to siepacze Andaralla nie mieli czci dla innosowego przybytku i niejednokrotnie nawiedzali rÛwnieø koúcio≥y i klasztory w poszukiwaniu ksiπg. Na szczÍúcie nie odwaøyli siÍ jeszcze oblegaÊ wiÍkszych, otoczonych murem opactw.†");

B_LogEntry(BookLog_Andarall2,"Wnet na ziemiach KrÛlestwa GothÛw i JelkalÛw zap≥onÍ≥y stosy, ktÛre poch≥onÍ≥y setki traktatÛw z dziedziny teologii i run.†Apostata nie poprzesta≥ jednak na tym i wkrÛtce rozpoczÍ≥y siÍ brutalne przeúladowanie Koúcio≥a i wyznawcÛw Innosa. Na mocy nowych praw ludzie nie mogli nawet gromadziÊ siÍ na uroczystoúciach religijnych. W walce z kultem Innosa, Andarall gotÛw by≥ jednak tolerowaÊ pogaÒskie praktyki, jakie dotπd szerzy≥y siÍ poúrÛd ciemnego ludu Jelkali i Gothy. Wszystko po to by sprowadziÊ zgubÍ na KoúciÛ≥ Innosa.");

B_LogEntry(BookLog_Andarall2,"Ludzi wiernych bogom, ktÛrzy nie chcieli wyrzec siÍ swej wiary bezwzglÍdnie mordowano. Ofiarπ okrutnych przeúladowaÒ padali zarÛwno Magowie Ognia, jak i zwykli poddani KrÛlestwa. Z rozkazu Andaralla wybijano ca≥e wsie, ktÛrych mieszkaÒcy pozostawali wierni bogom. NajwiÍksza jednak rzeü mia≥a miejsce w wiosce Brennus, ktÛrej mieszkaÒcy odmÛwili wydania przebywajπcego we wsi Maga Ognia, Aretino. Oddzia≥y wierne Andarallowi nie oszczÍdzi≥y nawet zwierzπt, zrÛwnujπc ca≥π osady z ziemiπ.");

B_LogEntry(BookLog_Andarall2,"Przeúladowania trwa≥y juø czternaúcie lat. W tym czasie poch≥onÍ≥y øycie ogromnej rzeszy niewinnych ludzi. W imiÍ idei Andaralla i jego ba≥wochwalstwa przelano morze krwi, a niezliczona liczba wsi zosta≥a zrÛwnana z ziemiπ. Wtedy to, w czternastym roku panowania Apostaty sta≥o siÍ coú dziwnego. Oto na ziemiach KrÛlestwa Gothy i Jelkali pojawi≥a siÍ skrzydlata bestia ñ ogromne, krwioøercze monstrum przyby≥e z otch≥ani. StwÛr nawiedziwszy umartwiony kraj, zaczÍ≥a pustoszyÊ rozleg≥e ziemie KrÛlestwa, siejπc strach i zniszczenie gdziekolwiek siÍ nie pojawi≥a. Dla Gothy nasta≥y najmroczniejsze dni w jej d≥ugich dziejach...");

B_LogEntry(BookLog_Andarall2,"KONIEC TOMU DRUGIEGO");

};

/////////////////////////////////////////////////////////////////////

// KL SKA I ZWYCI STWO. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////




INSTANCE ItWr_Andarall3 (C_ITEM)

{

name ="KlÍska i zwyciÍstwo. Tom III";

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

Doc_PrintLines( nDocID,  0, "KlÍska i zwyciestwo. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje KrÛlestwa Gothy za krÛla Andaralla Apostaty, ktÛry wypowiedzia≥ wojnÍ bogom i zakaza≥ magii. KsiÍga pochodzπca z krÍgÛw innosyckich i propagujπca kap≥aÒskπ wersjÍ tych wydarzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall3,LOG_NOTE);

B_LogEntry(BookLog_Andarall3,"KlÍska i zwyciÍstwo. Tom III");

B_LogEntry(BookLog_Andarall3,"Skrzydlata bestia nawiedziwszy KrÛlestwo GothÛw i JelkalÛw, zasta≥a kraj w najmroczniejszej godzinie jego dziejÛw. Od lat juø na jego tronie Gothy zasiada≥ Andarall Apostata, ktÛry to wypowiedzia≥ wojnÍ bogom i dπøy≥ do zastπpienia ich kultem nauki. Z≥owieszcze plany krÛla da≥y poczπtek straszliwym przeúladowaniom, ktÛre poch≥onÍ≥y tysiπce istnieÒ ludzkich, nie mÛwiπc juø o dziesiπtkach zburzonych osad i niezliczonej liczbie ksiπg spalonych z rozkazu krÛla. Monstrum tylko dope≥ni≥o obrazu grozy zniszczenia.");

B_LogEntry(BookLog_Andarall3,"Z poczπtku przeklÍty w≥adca liczy≥ na to, øe za sprawπ spustoszeÒ dokonywanych przez monstrum, tym ≥atwiej bÍdzie moøna wcieliÊ w zniszczonym kraju krÛlewskie wizje w øycie. Winπ za sprowadzenie bestii prÛbowa≥ obciπøaÊ nawet magiÍ i MagÛw Ognia, szydzπc z nich jednoczeúnie, øe nie potrafili zapanowaÊ nad przywo≥anym przez nich samych monstrum.");

B_LogEntry(BookLog_Andarall3,"Gdy jednak spostrzeg≥, øe bestia stanowi zagroøenie dla jego panowania, zebra≥ potÍønπ armiÍ i wyruszy≥ przeciwko potworowi. Na wezwanie Andaralla odpowiedzieli liczni baronowie i rycerze a nawet ch≥opi i mieszczanie. Nie uczynili tego jednak z mi≥oúci do okrutnego w≥adcy, lecz dla ratowania swego kraju. Na czele tych si≥ ruszy≥ na spotkanie z potÍønym monstrum. Skrzydlaty potwÛr na swoje leøe wybra≥ bory nieopodal wioski Haderus. Wyda≥ tam bestii bitwÍ†i w krwawym boju straci≥ trzeciπ czÍúÊ swej licznej armii. By≥ to dzieÒ, w ktÛrym krew GothÛw i JelkalÛw zamieni≥a pola haderusowe w szkar≥atne grzÍzawisko tak, øe przez nastÍpne dziesiπtki lat øadna innosycka dusza nie odwaøy≥a siÍ juø piÊ wody z okolicznych jezior i stawÛw. Zaprzestano teø ≥owienia w ryb w pobliskich wodach.");

B_LogEntry(BookLog_Andarall3,"Pycha Apostaty by≥a nieprzebrana i mimo b≥agaÒ swych rycerzy, nie godzi≥ siÍ on zarzπdziÊ odwrotu. Trwa≥a wiÍc rzeü, øywiπca øπdne triumfu serce przeniewiercy. Øo≥nierze spostrzeg≥szy wreszcie, øe Andarall w swym szaleÒstwie wydaje ich na zgubÍ, zaczÍli t≥umnie uchodziÊ z pola bitwy. Buta Apostaty by≥a jednak niezmierzona i czyni≥a úlepym umys≥ krÛla. Kolejni lordowie na rÛwni z nimi widzπc ob≥Íd w≥adcy, dawali, swoim oddzia≥om sygna≥ do odwrotu. By≥ to koniec bitwy.");

B_LogEntry(BookLog_Andarall3,"Andarall na widok wycofujπcych siÍ poddanych, zrozumia≥ øe nawet trwajπcy dotπd przy nim towarzysze†siÍ od niego odwrÛcili. Ujrza≥ w tamtej godzinie ca≥y ogrom swej klÍski. Osamotniony dosiad≥ wiÍc swego rumaka i dobywszy ostrza, z bluünierczym okrzykiem na ustach ruszy≥ w straceÒczym geúcie ku demonowi.");

B_LogEntry(BookLog_Andarall3,"Gdy tylko Andarall zbliøy≥ siÍ do bestii, ta zrzuci≥a go z wierzchowca. PotwÛr nastπpiwszy na sponiewierane cia≥o przeklÍtego w≥adcy, do reszty je zmiaødøy≥ i uczyni≥ sobie ucztÍ z jego truch≥a. Tak oto dokona≥ siÍ øywot nieprzejednanego wroga bogÛw, ktÛry w swej bucie odwaøy≥ siÍ wypowiedzieÊ im wojnÍ.");

B_LogEntry(BookLog_Andarall3,"Dwa lata jeszcze demon pustoszy≥ ziemie KrÛlestwa Gothy, zrÛwnujπc wioski z ziemiπ, mordujπc niewinnych ludzi, niszczπc zasiewy, a nawet zagraøajπc znacznym†miastom. PaÒstwo stworzone przez Troghdana, a budowane przez jego nastÍpcÛw pogrπøy≥o siÍ w chaosie i stanÍ≥o na krawÍdzi rozpadu.");

B_LogEntry(BookLog_Andarall3,"Od znÍkanego KrÛlestwa oderwali siÍ Jelkalowie z zachodu, ktÛrych najwiÍkszym grodem by≥ Vengard. Odpad≥a teø†Veluca nazwana pÛüniej Monterπ. Nasta≥ g≥Ûd, a wraz z nim pojawi≥y siÍ choroby i zarazy, ktÛre nawiedzi≥y ca≥y kraj. W tych dniach klÍski nie obsiewano pÛl i jedynie úmierÊ zbiera≥a obfite øniwoÖ");

B_LogEntry(BookLog_Andarall3,"Tak oto poddani KrÛlestwa Gothy p≥acili za bluünierstwa swego w≥adcy. W obliczu nieszczÍúcia ludzie poczÍli zwracaÊ siÍ ku bogom, tÍsknie wyczekujπc stamtπd nie tylko ocalenia, ale rÛwnieø pocieszenia. Na nowo w úwiπtyniach rozleg≥a siÍ úwiÍte pieúni i modlitwy, tym øarliwsze, øe przez wiele lat zakazane.");

B_LogEntry(BookLog_Andarall3,"Do przydroønych kapliczek powrÛci≥ blask úwiec, rozjaúniajπc mroki, sprowadzone na kraj przez butnego ApostatÍ. ChoÊ lud Gothy wciπø wiele cierpia≥, to na ziemiach KrÛlestwa dokonywa≥o siÍ wielkie oczyszczenie, ktÛre mia≥o przygotowaÊ lud na majπcπ niebawem nadejúÊ godzinÍ wyzwolenia. Kraj podnosi≥ siÍ z ruiny.");

B_LogEntry(BookLog_Andarall3,"MieszkaÒcy nie zapomnieli rÛwnieø o owych szarlatanach, ktÛrymi znienawidzony krÛl zwyk≥ siÍ otaczaÊ za øycia. Oto poboøny lud p≥onπ≥ úwiÍtym gniewem i ruszy≥ przeciwko bluüniercom, ktÛrzy zaúlepieni pychπ,†úmieli wypowiedzieÊ wojnÍ nie tylko bogom, ale i ludziom. Dla tych nasta≥ dzieÒ straszliwego sπdu. 
");

B_LogEntry(BookLog_Andarall3,"Wywleczono z domu astronoma Ebrandta, ktÛry niecny prym wiÛd≥ by≥ wúrÛd doradcÛw Andaralla. Ten doczeka≥ siÍ kary potwornej, gdyø zosta≥ przez ludzi rozszarpany. By≥a to jednak kara sprawiedliwa. Podobny teø los spotka≥, matematykÛw Alherodiona i Mergarda, a takøe alchemika Sergulliona i innych szarlatanÛw.");

B_LogEntry(BookLog_Andarall3,"Jeszcze wiele tygodni rozcz≥onkowane kawa≥ki cia≥ tych bluüniercÛw wala≥y siÍ po ulicach miast Gothy. Dopiero  Magowie Ognia zdo≥ali nak≥oniÊ rozwúcieczony lud, by te zosta≥y zebrane i pochowane wed≥ug nakazÛw danych od bogÛw. Gdyø triumf bogÛw, mia≥ byÊ rÛwnieø triumfem praw danych ludziom od bogÛw.");

B_LogEntry(BookLog_Andarall3,"KONIEC TOMU TRZECIEGO");

};
/////////////////////////////////////////////////////////////////////

// KL SKA I ZWYCI STWO. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall4 (C_ITEM)

{

name ="KlÍska i zwyciÍstwo. Tom IV";

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

Doc_PrintLines( nDocID,  0, "KlÍska i zwyciÍstwo. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje KrÛlestwa Gothy za krÛla Andaralla Apostaty, ktÛry wypowiedzia≥ wojnÍ bogom i zakaza≥ magii. KsiÍga pochodzπca z krÍgÛw innosyckich i propagujπca kap≥aÒskπ wersjÍ tych wydarzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall4,LOG_NOTE);

B_LogEntry(BookLog_Andarall4,"KlÍska i zwyciÍstwo. Tom IV");

B_LogEntry(BookLog_Andarall4,"Od czasÛw przeúladowaÒ ze strony Andaralla, krπg MagÛw Ognia dozna≥ wielu krzywd. Ogromna rzesza†kap≥anÛw zosta≥a zamordowana, wielu teø wtrπcono do lochÛw i wiÍziono na rÛwni z ludümi wystÍpnymi. Bezboøny w≥adca niczego nie pragnπ≥ tak mocno jak rozbicia i ostatecznego unicestwienia Koúcio≥a Innosa.");

B_LogEntry(BookLog_Andarall4,"Apostata bardzo obawia≥ siÍ MagÛw Ognia i widzia≥ w kulcie Innosa g≥Ûwnπ przeszkodÍ na drodze do realizacji swych z≥owieszczych planÛw. Na czele Koúcio≥a w KrÛlestwie Gothy sta≥ w tym czasie sÍdziwy arcymag Larund z Vengardu, ktÛry objπ≥ urzπd patriarszy w trzecim roku panowania przeklÍtego w≥adcy. By≥ to mπø ca≥ym sercem i umys≥em oddany Innosowi, a przy tym wielce uczony i roztropny. PamiÍta≥ wiÍc o tym, øe kult Innosa zosta≥ sprowadzony na te ziemie przez pierwszego krÛla Gothy. To w≥aúnie opiece nastÍpcÛw Troghdana wyznanie innosyckie zapewnia≥o swÛj rozkwit po upadku Imperium Pradawnych.");

B_LogEntry(BookLog_Andarall4,"Arcykap≥an Larund pragnπ≥ zachowaÊ owπ uúwiÍconπ wiekami tradycjÍ i dπøy≥ do tego, by utrzymaÊ pokÛj miÍdzy úwiπtyniπ i tronem. Wiedzia≥, øe obecny krÛl kiedyú przeminie, a KrÛlestwo Gothy rzπdzone przez kolejnych w≥adcÛw, bÍdzie trwaÊ. Upatrywa≥ wiÍc nadziei w nastÍpcach majπcych przyjúÊ po Andarallu. Czcigodny, pierwszy arcymag, dπøy≥ wiÍc do zgody i stara≥ siÍ powúciπgaÊ dzia≥ania monarchy, a to dla zachowania Koúcio≥a i KrÛlestwa. Jeøeli tkwi w postÍpowaniu tego úwiπtobliwego kap≥ana przewina, to w tym, øe przebieg≥y Apostata zdo≥a≥ wykorzystaÊ tπ dobroÊ ducha by obrÛciÊ jπ na szkodÍ Gothy i Wiary.");

B_LogEntry(BookLog_Andarall4,"Nie szczÍdzi≥ jednak wysi≥kÛw mag Larund, by broniÊ powierzonony mu lud. Wpierw dπøπc do pojednania z krÛlem i zawrÛcenia w≥adcy z drogi odstÍpstwa, a ujrzawszy jego prawdziwe intencje, ze wszystkich si≥ starajπc mu siÍ przeszkodziÊ. Niebawem z tego powodu by≥ zmuszony uciekaÊ ze stolicy, albowiem gdy przyjaciele Larunda dowiedzieli siÍ o tym, øe bluünierca zamierza go aresztowaÊ, zdo≥ali namÛwiÊ sÍdziwego kap≥ana do ratowania w≥asnego øycia. Od tamtej pory musia≥ latami uchodziÊ przed siepaczami krÛla, ktÛry postawi≥ sobie za cel pojmanie najwyøszego arcymaga i zwierzchnika Koúcio≥a Innosa w Gocie.");

B_LogEntry(BookLog_Andarall4,"Ukrywajπc siÍ po majπtkach i wsiach, naucza≥ o bliskim koÒcu Andaralla, ktÛry musi ulec wobec potÍgi bogÛw. Tam gdzie tylko pojawi≥ siÍ Larund, tam duch, chylπcy siÍ ku upadkowi, rych≥o powstawa≥ i gotÛw by≥ na nowo walczyÊ o Innosa. Dobry patriarcha uczyniwszy wiele dobrego odszed≥ wkrÛtce do Pana Ognia.");

B_LogEntry(BookLog_Andarall4,"Wielka to by≥a strata dla ludu Gothy i rÛwnie wielka radoúÊ dla niegodziwego w≥adcy. Zbyt wczesne by≥y jednak triumfy z≥ego krÛla, gdyø niebawem i on sam mia≥ dope≥niÊ swego przeklÍtego øywota. Niestety po úmierci Larund, wobec przeúladowaÒ, krπg MagÛw Ognia nie zdo≥a≥ siÍ zebraÊ i wy≥oniÊ jego nastÍpcy.");

B_LogEntry(BookLog_Andarall4,"W czasie tym ukrywajπcy siÍ przed ludümi tyrana mÍøowie Innosa pozostawali w rozproszeniu. W≥adca do≥oøy≥ wszelkich staraÒ, by krπg nie mÛg≥ wybraÊ pierwszego arcymaga i d≥ugo jeszcze tron patriarszy pozostawa≥ nieobsadzony.†W drugim roku bezkrÛlewia za sprawπ kap≥ana Sigunda zosta≥ jednak zjednoczony.");

B_LogEntry(BookLog_Andarall4,"PrzywrÛciwszy po úmierci Andaralla jednoúÊ Koúcio≥a Innosa, stanπ≥†Sigund jak rÛwny z rÛwnym na przeciwko bestii. Wyda≥ jej wtedy úmiertelny bÛj na polach przed sto≥ecznym grodem Troghdana. I p≥onπ≥ w nim gniew Innosa, ktÛry uczyni≥ kap≥aÒskie ramiÍ silnym. Sigund i bestia walczyli trzy dni i trzy noce.");

B_LogEntry(BookLog_Andarall4,"W tym zaklÍtym taÒcu si≥y úwiat≥oúci mierzy≥y siÍ z grozπ piekie≥. åwiÍta modlitwa kap≥aÒska przeplata≥a siÍ z s≥owami prastarych zaklÍÊ. W trzecim dniu niezwyk≥a si≥a wstπpi≥a w cia≥o Sigunda. Z imieniem Innosa na ustach, skierowa≥ swÛj kostur w stronÍ bestii i wbiwszy go w jej bok, zdo≥a≥ ja pokonaÊ. ");

B_LogEntry(BookLog_Andarall4,"Wreszcie rozleg≥ siÍ przeraüliwy ryk, jakoby trzy wielkie armiÍ wydoby≥y ze swych øo≥nierskich gardzieli najdzikszy okrzyk wojenny. JasnoúÊ niewypowiedziana spowi≥a miejsce epickiego boju, ogarniajπca nawet wszystkich tych, ktÛrzy z murÛw przypatrywali siÍ walce kap≥ana z demonicznym monstrum.");

B_LogEntry(BookLog_Andarall4,"Tak oto dokonywa≥a siÍ wspÛlna ofiara kap≥ana, ziemi i ludu, ktÛra mia≥a odkupiÊ bluüniercze panowanie Apostaty. Niebawem ich oczom ukaza≥a siÍ postaÊ Sigunda, ktÛry opierajπc siÍ o kostur sta≥ samotnie na miejscu zwyciÍskiego boju. KrÛlestwo Gothy zosta≥o uwolnione spod mocy potwora.");

B_LogEntry(BookLog_Andarall4,"Lud Gothy by≥ wdziÍczny swemu wybawcy. Pojawi≥y siÍ g≥osy nawo≥ujπce do wyniesienia Sigunda na krÛlewski tron i wyraøajπce nadziejÍ, øe jako za≥oøyciel dynastii, przywrÛci Gocie dawnπ chwa≥Í. Z kolei†Magowie Ognia chcieli by objπ≥ jako ten ktÛry ich zjednoczy≥, objπ≥ tron patriarszy jako nastÍpcπ Larunda.");

B_LogEntry(BookLog_Andarall4,"Stanπ≥ wiÍc wybawiciel Gothy przed trudnym wyborem. Decyzji nie u≥atwia≥y namowy samozwaÒczych doradcÛw, z ktÛrych jedni pragnÍli widzieÊ mÍønego kap≥ana na tronie krÛlewskim, a inni na patriarszym. Roztropny mag postanowi≥ nie polegaÊ na sπdach ludzkich, bÍdπcych dzie≥em niedoskona≥ego umys≥u.");

B_LogEntry(BookLog_Andarall4,"Sigund wiedzia≥, øe gdyby mπdroúci poszukiwa≥ w myúli cz≥owieczej, zb≥πdzi≥by tak samo jak z≥ej pamiÍci Andarall Apostata. Uda≥ siÍ przeto przed o≥tarz Innosa by w modlitwie szukaÊ odpowiedzi na nurtujπce go pytania.");

B_LogEntry(BookLog_Andarall4,"KONIEC TOMU CZWARTEGO");

};
/////////////////////////////////////////////////////////////////////

// KL SKA I ZWYCI STWO. TOM V

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Andarall5 (C_ITEM)

{

name ="KlÍska i zwyciÍstwo. Tom V";

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

Doc_PrintLines( nDocID,  0, "KlÍska i zwyciÍstwo. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dzieje KrÛlestwa Gothy za krÛla Andaralla Apostaty, ktÛry wypowiedzia≥ wojnÍ bogom i zakaza≥ magii. KsiÍga pochodzπca z krÍgÛw innosyckich i propagujπca kap≥aÒskπ wersjÍ tych wydarzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Andarall5,LOG_NOTE);

B_LogEntry(BookLog_Andarall5,"KlÍska i zwyciÍstwo. Tom V");

B_LogEntry(BookLog_Andarall5,"Sigund udawszy siÍ do úwiπtyni w Grodzie Troghdana, pogrπøy≥ siÍ w modlitwie. W jej murach, ca≥y dzieÒ i ca≥π noc prosi≥ Innosa, by ten natchnπ≥ go radπ i pozwoli≥ mu podjπÊ w≥aúciwπ decyzjÍ. Gdy po wielu godzinach odnaleüli go natrÍtni ëdoradcyí, ten powstawszy, oznajmi≥ wszystkim, øe dokona≥ juø wyboru. ZwyciÍski kap≥an, mimo gorπcych prÛúb i nalegaÒ, nie zgodzi≥ siÍ zostaÊ krÛlem. Wskaza≥ jednak prawowitego nastÍpcÍ w osobie Edricka, ktÛry by≥ synem krÛlewskiego rodu i kuzynem Andaralla. Decyzja Sigunda zdziwi≥a jednak wielu zgromadzonych, gdyø nie rozumieli oni mπdroúci tego wyboru.");

B_LogEntry(BookLog_Andarall5,"NiechÍÊ budzi≥a sama dynastia, ktÛrπ haÒbπ okry≥ odszczepieniec. Tak wiele z≥a dla imienia rodu Troghdana wyrzπdzi≥ Andarall. PrzemÛwi≥ wtedy Sigund do ludzi powtÛrnie: ëO s≥aba pamiÍci ludzka, øebyú przez jednego przeniewiercÍ odrzuca≥a tyle pokoleÒ mπdrych i wiernych krÛlÛw, ktÛrzy byli wam dobroczyÒcamií. Po chwili oznajmi≥ rÛwnieø, øe nie moøna rozpoczynaÊ zaprowadzania porzπdku w KrÛlestwie od pogwa≥cenia úwiÍtych praw danych ludziom od bogÛw, gdyø w≥aúnie na szarganiu tych úwiÍtych praw swe panowanie budowa≥ odszczepieniec,†Andarall. PowtÛrzenie tego b≥Ídu sprowadzi≥oby na GothÍ jedynie wiÍcej cierpienia. Jako duchowny, ktÛry zosta≥ oddany na s≥uøbÍ bogom, Sigund nie chcia≥ rÛwnieø porzucaÊ Zakonu MagÛw Ognia nawet dla korony, albowiem wiπza≥o go kap≥aÒskie przymierze z Innosem. To takøe roztropny Mag Ognia powiedzia≥ zebranym w úwiπtyni, a oni widzieli, øe mπdroúÊ samego Innosa przez niego przemawia.");

B_LogEntry(BookLog_Andarall5,"Osiem dni po og≥oszeniu przez Sigunda decyzji, do stolicy przybyli Magowie Ognia ze wszystkich stron KrÛlestwa Gothy. WúrÛd zebranych by≥ rÛwnieø ten, ktÛry zwyciÍøy≥ bestiÍ. Zebrani mieli radziÊ nad odbudowπ Koúcio≥a, ktÛry pognÍbiony w czasach Andaralla Apostaty, mia≥ na nowo staÊ siÍ øywym cia≥em. Na synodzie tym to przywrÛcono staroøytnπ sukcesjÍ patriarchÛw Gothy, zapoczπtkowanπ jeszcze przez arcykap≥ana Dhibuina, ktÛry przyby≥ tu z Varantu na czele misji innosyckiej sprowadzonej przez Troghdana Wielkiego. G≥owπ krÍgu MagÛw Ognia Gothy obrano Sigunda, ktÛry na chwa≥Í Innosa i wybÛr ten przyjπ≥.");

B_LogEntry(BookLog_Andarall5,"WyklÍto przy tym dorÛwnujπcego pychπ Andarallowi, maga Burangarda, ktÛry wykorzystujπc zamÍt po úmierci Larunda, samozwaÒczo obwo≥a≥ siÍ zwierzchnikiem Koúcio≥a Gothy. Zdrajca ten mimo licznych napomnieÒ nie chcia≥ siÍ ukorzyÊ. Majπcy niebawem objπÊ tron, Edrick wyruszy≥ wiÍc przeciwko niemu na wyprawÍ, a pokonawszy heretyckiego kap≥ana, srodze go ukara≥. Przysz≥y w≥adca w czasie wyprawy dowiÛd≥, øe nie tylko z krwi i úwiÍtego prawa godzien jest tronu, ale i z mÍstwa, i z wiary gorπcej.†Niebawem teø Sigund dokona≥ aktu koronacji Edricka II, wieÒczπc g≥owÍ prawowitego nastÍpcy tronu koronπ Troghdana Wielkiego.");

B_LogEntry(BookLog_Andarall5,"Pokonanie bestii i dzia≥alnoúÊ Sigunda przyczyni≥a siÍ do odbudowania Koúcio≥a Innosa, ktÛry po latach przeúladowaÒ przez Andaralla, na nowo mÛg≥ roztoczyÊ opiekÍ nad wiernym ludem Gothy. WspÛlnie z Edrickiem umacniali kult innosycski i walnie przyczynili siÍ do nawrÛcenia JelkalÛw na prawdziwπ wiarÍ. †");

B_LogEntry(BookLog_Andarall5,"I kiedy nadszed≥ kres ziemskiej wÍdrÛwki Sigunda, Innos przyzwa≥  patriarchÍ do siebie. Ziemskie szczπtki zas≥uøonego maga zosta≥y pochowane najwyøszymi honorami i splendorem, øegnane t≥umnie przez wdziÍczny lud Gothy. Spoczπ≥ on wtedy u obok innych patriarchÛw, úpiπcych snem wiecznym.");

B_LogEntry(BookLog_Andarall5,"Tak oto koÒczπ siÍ dzieje Andaralla Agnostyka i Sigunda Wiernego ñ dwÛch mÍøÛw, co dwie rÛøne drogi obrali. Ku przestrodze miej czytelniku los butnego krÛla, co cz≥owiekiem jeno bÍdπc, w swÛj umys≥ cz≥owieczy i z tej racji niedoskona≥y úwiÍcie zawierzy≥.");

B_LogEntry(BookLog_Andarall5,"Skreúlone piÛrem Sevolda, pokornego mnicha z Klasztoru Innosa w Nordmarze");

B_LogEntry(BookLog_Andarall5,"KONIEC TOMU V, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// ROZWAØANIA O BOGACH

// SUGEROWANA LOKACJA: OB”Z BANDYT”W, CHATA QUENTINA 

// NAPISANE PRZEZ WYZYSKKA NA PODSTAWIE DIALOGU Z GERRICKIEM (ARCANIA)

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_OurGods (C_ITEM) //d

{

name ="Rozwaøania o bogach";

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

Doc_PrintLines( nDocID,  0, "Rozwaøania o bogach");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[DoúÊ obrazoburcze rozwaøania o trzech bogach i ich stosunku do cz≥owieka. Spisane w formie nader niezobowiπzujπcej.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_OurGods,LOG_NOTE);

B_LogEntry(BookLog_OurGods,"Rozwaøania o bogach");

B_LogEntry(BookLog_OurGods,"W dzieciÒstwie zapewno uczono ciÍ czciÊ, mi≥owaÊ i lÍkaÊ siÍ boga s≥oÒca. Mam racjÍ? OgieÒ, úwiat≥o, ≥ad... ucieleúnienie wszystkiego, co dobre na tym úwiecie, zgadza siÍ? OtÛø nie, nie zgadza siÍ! Innos nie jest przyjacielem ludzkoúci! Gdyby nie jego bracia, dawno zaprowadzi≥by na úwiecie ca≥kowity ≥ad! Surowy i bezlitosny! Innos nienawidzi wolnoúci! Øe niby zaprowadzenie ≥adu na úwiecie to dobro? KrÛlowie Myrtany zaprowadzajπ ≥ad na úwiecie najeødøajπc inne krÛlestwa.");

B_LogEntry(BookLog_OurGods,"RÛwnieø Beliar nie dπøy do mi≥oúci i pokoju. Ale nie dπøy do takich potwornoúci jakie przypisuja mu kap≥ani Innosa. Beliar bynajmniej nie jest przyjacielem ludzkoúci, co nie oznacza, øe nie jest do pewnego stopnia jej sojusznikiem. To zaprzysiÍg≥y wrÛg ludzi, ale symbolizuje takøe wolnoúÊ, pewnoúÊ siebie, niezaleønoúÊ i ambicjÍ. O tym Ci w úwiπtyni nie mÛwili, prawda? A co do burzy, piorunÛw i cienia? Odrobina deszczu jeszcze nikomu nie zaszkodzi≥a, a bez ciemnoúci jak niby cz≥owiek mia≥by zasnπÊ?");

B_LogEntry(BookLog_OurGods,"Adanos to trzeci z braci. To ciekawy przypadek. Innos ma tylko najwiÍcej wyznawcÛw, lecz to dziÍki Adanosowi przetrwaliúmy. Wprawdzie to nie on nas stworzy≥, ale z pewnoúciπ nie dopuúci≥ do tego, by jego bracia zniszczyli nas w trakcie k≥Ûtni. Adanos symbolizuje rÛwnowagÍ. årodek. Wszystko, co ciÍ otacza - ca≥y úwiat - to sfera Adanosa. Tu trzyma swych braci w ryzach. Zdawa≥oby siÍ wiÍc, øe to Adanos mia≥by byÊ tym dobrym bogiem. CÛø, o ile mi wiadomo, sprzyja ludziom. Lecz rzadko siÍ angaøuje - chyba, øe ma unicestwiÊ ca≥π cywilizacjÍ. Jeúli trzeba przywrÛciÊ rÛwnowagÍ Adanos potrafi nieüle poszaleÊ, ha, ha. A wiÍc - nie.");

B_LogEntry(BookLog_OurGods,"Moim zdaniem nie ma dobrych i z≥ych bogÛw, jak chcieliby to przedstawiaÊ ich kap≥ani, ktÛrych interesuje tylko jedna strona medalu. Bogowie to po prostu sπ bogowie. Sπ i tyle.");

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

Doc_PrintLines( nDocID,  0, "[KsiÍga wydana przez InkwizycjÍ MagÛw Ognia, traktujπca o najczarniejszych praktykach nekromanckich. Tom poúwiÍcony mariturom.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Maritura,LOG_NOTE);

B_LogEntry(BookLog_Maritura,"Praktyki nekromanckie. Maritury");

B_LogEntry(BookLog_Maritura,"ëSzczÍúliwy kto nie zetknπ≥ siÍ z opisywanymi tu rzeczami. Zgubiony, kto ich nie poznawszy wczeúniej, nieuzbrojony w wiedzÍ z nimi siÍ spotkaÖí (Inkwizytor Locarno Derbent)");

B_LogEntry(BookLog_Maritura,"Maritura to jeden z najpaskudniejszych wynalazkÛw czarnej magii. Wed≥ug opisÛw zawartych w ksiÍgach z tej dziedziny i potwierdzonych przez autorytety inkwizycji MagÛw Ognia, artefakt ten ma formÍ statuetki zawierajπcej w sobie duszÍ øywej istoty. Wprawdzie zdarza≥y siÍ pojedyncze przypadki nasycenia posπøka duszπ zwierzÍcia, lecz nie by≥y to raczej ofiary docelowe, a zwyk≥a wprawa przed wykonaniem maritury prawdziwej. Docelowπ ofiarπ tej praktyki nekromanckiej mieli byÊ ludzie i ich dusze.");

B_LogEntry(BookLog_Maritura,"PrzeklÍty magus pochwyciwszy nieszczÍúnika przystÍpuje do makabrycznych przygotowaÒ, w czasie ktÛrych na drodze rytualnych naciÍÊ opisanych w ksiÍgach nekromanckich przygotowuje cia≥o øywej ofiary do w≥aúciwego rytua≥u. Mimo, øe dla powodzenia rytua≥u Czarny Mag musi zadbaÊ aby ofiara nie umar≥a w trakcie powstawania maritury, to jednak øadna to pociecha dla zamÍczanego. Z przyczyn oczywistych, ksiÍga ta opisywaÊ ich nie ma zamiaru, by nie rozpowszechniaÊ zarazy i wiedzy nekromanckiej, a jπ zwalczaÊ.");

B_LogEntry(BookLog_Maritura,"W czasie rytua≥u w≥aúciwego wydzierana z cia≥a dusza nieszczÍsnej istoty zostaje nagiÍta do woli Czarnego Maga, a nastÍpnie uwiÍziona w obrÍbie mariturycznego posπøku. Duch uwiÍziony w mariturze staje siÍ bezwolnym narzÍdziem nekromanty. Ofiara zamkniÍta rytua≥em w statuetce cierpi potworne katusze nie mogπc, jak nakazuje tego natura, odejúÊ do wiecznoúci. Duch pozostaje wiÍüniem maritury przez stulecia, a nawet tysiπce lat, co jest zaleøne od mocy Czarnego Maga, ktÛry jπ stworzy≥. Na szczÍúcie z biegiem wiekÛw si≥a tego magicznego wiÍzienia s≥abnie i dusza zgodnie z prawami natury moøe odejúÊ do bogÛw. Nim tak siÍ stanie nieszczÍúnik, choÊ bezwolny w dzia≥aniu i w s≥owie, lecz úwiadomy i odczuwajπcy nieustanne cierpienie, musi czekaÊ przez ca≥e epokiÖ");

B_LogEntry(BookLog_Maritura,"Ten mroczny artefakt potrafiπ stworzyÊ jedynie potÍøni nekromanci, gdyø z≥amanie woli zaklinanego ducha ludzkiego i uczynienie go pos≥usznym wymaga niema≥ej mocy i wiedzy z dziedziny czarnej magii.†To tylko daje nadziejÍ na to, øe proceder ten dziÍki magom inkwizytorom nareszcie zostanie z≥amany.");

B_LogEntry(BookLog_Maritura,"Maritury s≥uøπ g≥Ûwnie jako broÒ, choÊ przez wzglπd na ich trwa≥oúÊ niejednokrotnie czyniono z nich pos≥aÒcÛw, ktÛrzy mieli zachowaÊ wiadomoúÊ od Czarnego Maga i zanieúÊ jπ, choÊby w dalekπ przysz≥oúÊ. Ojcowie inkwizytorzy nie jeden raz od zaklÍtych istot s≥yszeli inkantacje beliaryckie, z czarnoksiÍskich ksiπg, ktÛre s≥udzy Innosa zniszczyli wiele wiekÛw przedtem.");

B_LogEntry(BookLog_Maritura,"PotÍøniejsi nekromanci potrafili rÛwnieø ustami wiÍünia posπøku wypowiedzieÊ zaklÍcia, ktÛrymi nieszczÍsny duch atakowa≥ tych, ktÛrzy otworzyli mariturÍ. Tak siÍ sta≥o w siedzibie inkwizycji w Dumar, gdzie zaklÍty duch sprowadzi≥ burzÍ ognia na gmach úwiπtobliwych tropicieli nekromancji.");

B_LogEntry(BookLog_Maritura,"Zdarza≥o siÍ takøe, øe za poúrednictwem wiÍünia posπøku, Czarny Mag prÛbowa≥ opÍtaÊ tego, kto mia≥ kontakt z owym przedmiotem.†To czyni mariturÍ niezwykle niebezpiecznπ nie tylko dla tego kto nieúwiadomie siÍ na niπ natknie, ale i dla tych, ktÛrzy postanowiπ jπ zniszczyÊ.");

B_LogEntry(BookLog_Maritura,"ChoÊ maritura jest jednym z najplugawszych odstÍpstw, artefakt ten pojawia≥ siÍ sporadycznie nawet na dworach z dawien czczπcych Innosa. Sam w≥adca Gothy, Meriga II, udaremniwszy spisek swych braci, nakaza≥ uwiÍziÊ ich duchy w oúmiu marituralnych posπøkach. Chcπc ich przy tym upokorzyÊ, zmusi≥ owych zdrajcÛw, by w≥asnymi ustami przez wieki potÍpiali zdradÍ jakiej siÍ dopuúcili, a jednoczeúnie wychwalali wielkoúÊ KrÛlestwa Gothy i swego brata - krÛla Merigi II. Zostali oni uwolnieni dopiero za krÛla Edricka II, gdy po obaleniu Andaralla Apostaty arcymag Sigund wyjednawszy u mi≥oúciwego w≥adcy ≥askÍ dla zdradzieckich braci Merigi II, zniszczy≥ owe posπøki wiπøπce nieszczÍúnikÛw z tym úwiatem. Od tamtej pory øaden z krÛlÛw Gothy nie mia≥ juø nigdy karaÊ nawet najgorszego zdrajcy w sposÛb tak uw≥aczajπcy prawom danym od bogÛw.");

B_LogEntry(BookLog_Maritura,"Niestety zdarza siÍ teø, øe mag zaúlepiony pychπ i ambicjπ, pragnπc dowieúÊ swych umiejÍtnoúci, tworzy Ûw straszliwy artefakt. DopÛki wiÍc prÛøna wola bÍdzie zwodziÊ rozumy uczonych, dopÛty inkwizycja bÍdzie musia≥a tropiÊ i zwalczaÊ tych, ktÛrzy dopuszczajπ siÍ owego plugawego bluünierstwa.");

B_LogEntry(BookLog_Maritura,"KONIEC");
};

/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM I

// SUGEROWANA LOKACJA: OB”Z MYåLIWYCH, NA STOLE ALCHEMICZNYM, ALBO NIEOPODAL; WAØNE BY BY£Y W POBLIØU CLAWA, BO W ZA£OØENIU TE KSIEGI NALEØ• DO NIEGO 

// ALTERNATYWNIE CLAW M”G£BY NAM DA∆ JE RAZEM Z 250 BRY£KAMI RUDY JAKO NAGROD  ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap≥anach Myrtany, opisujπcy druidzki kult i jego historiÍ]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana1,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany. Tom I");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany to prymitywni magowie natury, bÍdπcy kap≥anami Adanosa - boga natury i rÛwnowagi. Mimo to niewiele majπ wspÛlnego z Magami Wody, gdyø ci zwykli postrzegaÊ druidzkich kap≥anÛw jako pÛ≥pogaÒskich parweniuszy, nazywajπc ich przy tym pogardliwie szamanami. Podobnie lekcewaøπcy stosunek majπ do nich kap≥ani Innosa, jednak ani Magowie Ognia, ani Magowie Wody nie podejmujπ siÍ przeúladowania druidÛw. Przynajmniej od czasu, gdy owi magowie natury wyrzekli siÍ pogaÒskich bÛstw i powrÛcili do zarzuconego przed wiekami kultu Adanosa.†");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Domem druida jest las, gdzie ukryty przed cywilizacjπ mag natury, moøe w spokoju kontemplowaÊ przyrodÍ, opiekowaÊ siÍ zwierzynπ leúnπ i w prastarym obrzÍdzie oddawaÊ czeúÊ Panu Natury. Przychodzπ do nich rÛwnieø ludzie z okolicznych wiosek jako do uzdrowicieli. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"WokÛ≥ druida, lub grupy druidÛw tworzy siÍ zazwyczaj niewielka wspÛlnota goÒcÛw leúnych, liczπca sobie nie wiÍcej niø trzydziestu cz≥onkÛw. Przypomina ona poniekπd plemiona sprzed wiekÛw, kiedy to kult druidzki dominowa≥ w ca≥ej Myrtanie. Jednak zarÛwno GoÒcy Leúni, jak i druidzi wokÛ≥ ktÛrych siÍ skupiajπ, stanowiπ juø jedynie relikt przesz≥oúci, trzymajπcy siÍ resztkami si≥ i nieuchronnie ustÍpujπcy z areny dziejÛw. Zapewne dlatego inkwizycja MagÛw Ognia toleruje jeszcze ostatki obecnoúci druidÛw na tych ziemiach.†");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Pierwotnie Krainy Centralne Kontynentu, a takøe niewyja≥owiony jeszcze przez wody potopu Varant, mia≥y powszechnie czciÊ Adanosa na mod≥Í druidzkπ. Owi prymitywni magowie pe≥niπc funkcje kap≥aÒskie, cieszyli siÍ najwiÍkszym obok wodzÛw pos≥uchem w plemionach rzπdzπcych tymi krajami. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Od poczπtku druidyzm myrtaÒski úciúle by≥ zwiπzany z kultem przyrody, zaú Adanos odbiera≥ czeúÊ jako bÛstwo øyciodajnej wody i natury. Z biegiem wiekÛw ludzie odchodzili jednak od pierwotnej czystoúci, a wiara ich zaczÍ≥a ulegaÊ podobnej degeneracji. Coraz czÍúciej obok Adanosa pojawiali siÍ fa≥szywi bogowie, ktÛrzy najpierw odbierali wspÛlnπ z prawdziwym bÛstwem czeúÊ, a nastÍpnie je wypierali. Obiektem kultu stawa≥y siÍ jeziora i doliny, ska≥y i úwiÍte gaje, a Adanos odchodzi≥ w zapomnienie.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Sta≥o siÍ to na d≥ugo przed powo≥aniem Wiecznego WÍdrowca i powstaniem Imperium Pradawnych w Varancie. Gdy wiÍc wyznajπcy Innosa Pradawni zetknÍli siÍ w Myrtanie z druidyzmem, ten by≥ juø kultem pogaÒskim i jako pogaÒski kult, by≥ przez nich zwalczany.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Tak oto upad≥ kult Adanosa w druidyzmie, ustÍpujπc miejsca pogaÒstwu i fa≥szywym bÛstwom.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM II

// ALTERNATYWNIE CLAW M”G£BY NAM DA∆ JE RAZEM Z 250 BRY£KAMI RUDY JAKO NAGROD  ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap≥anach Myrtany, opisujπcy druidzki kult i jego historiÍ]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana2,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana2,"Druidzi Myrtany. Tom II");

B_LogEntry(BookLog_DruidsOfMyrtana2,"ChoÊ pierwotnie druidzi wyznawali Adanosa, to z biegiem wiekÛw, zaczÍli czciÊ rÛwnieø fa≥szywych bogÛw. Niebawem teø zastπpili nimi Pana Wody, lub sprowadzili go do roli pomniejszego bÛstwa w druidzkim panteonie. Juø Pradawni za czasÛw Imperium Varanckiego nie rozpoznawali w nich adanosytÛw, lecz traktowali ich jak pogan. Nie inaczej czynili w≥adcy w dobie ukszta≥towanych, monarchii myrtaÒskich. KrÛlowie ci zrozumiawszy jednak, øe nie zdo≥ajπ wypleniÊ druidyzmu mieczem, postanowili uczyniÊ go wyznaniem innosyckim.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Groüny Pan Ognia, strzegπcy krÛlewskiego prawa i niezrozumia≥ego dla pogaÒskiej ludnoúci porzπdku, by≥ dla druidÛw bogiem obcym i nie potrafili go przyjπÊ. Magowie Ognia dojrzawszy wtedy w druidyzmie ukryty pierwiastek adanosycki, postanowili przyjúÊ do druidÛw z bardziej zrozumia≥ym dla tych pogan bÛstwem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Wpierw przeto odnawiano kult Adanosa poúrÛd bÛstw pogaÒskich, a gdy Adanos na trwale zagoúci≥ w panteonie druidzkim, krÛlowie i Magowie Ognia dok≥adali wszelkich staraÒ by sta≥ siÍ nastÍpnie najwaøniejszym, a potem jedynym bÛstwem - rzecz jasna obok Innosa. Tak oto kult druidzki oczyúci≥ siÍ z nalecia≥oúci pogaÒskich i powrÛci≥ do wiary, od ktÛrej przed wiekami odstπpi≥.†Z czasem jednak dominujπce wyznanie wypiera≥o druidyzm i coraz wiÍcej ludzi decydowa≥o siÍ przyjπÊ kult Innosa. Do dziú na ziemiach Myrtany osta≥y siÍ nieliczne wspÛlnoty druidzkie.†");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Piszπc o druidach nie sposÛb nie wspomnieÊ o tym, øe czÍúÊ z nich posiada umiejÍtnoúÊ, czy raczej moc przemiany w zwierzÍta. UmoøliwiaÊ im to majπ magiczne kamienie, o ktÛrych pochodzeniu trudno dziú przesπdzaÊ. Sπ one niezwykle rzadkie i jako relikwie sπ od wiekÛw przekazywane w obrÍbie krÍgu druidzkiego.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Kaødy kamieÒ ma posiadaÊ swego zwierzÍcego patrona, ktÛrego postaÊ moøe przyjπÊ osoba dzierøπca Ûw magiczny artefakt. Uøywanie ich wiπøe siÍ jednak z ryzykiem, gdyø podania g≥oszπ, øe niejeden cz≥owiek przybrawszy postaÊ zwierzÍcia nie mia≥ juø powrotu do swojej ludzkiej postaci. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Pos≥ugiwanie siÍ wiÍc tym rodzajem magii wymaga ogromnej wiedzy i odwagi na ktÛrπ mÛg≥by siÍ zdobyÊ jedynie ktoú úwiÍcie wierzπcy w system wartoúci wyznawany przez druidÛw. Dla nich øycia w skÛrze zwierzÍcia by≥oby jedynie innπ formπ zespolenia z czczonπ przez nich naturπ i jej opiekunem - Adanosem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Kamienie te mia≥y jeszcze tπ w≥aúciwoúÊ, øe w pobliøe miejsca pobytu ich posiadacza przybywa≥y owe zwierzÍta. Nie czyni≥y mu jednak szkody, gdyø moc kamienia uspokaja≥a nawet krwioøercze bestie, tak, øe stawa≥y sie niegroüne dla cz≥owieka. I bez tego jednak druidzi potrafili od zawsze oswoiÊ leúne zwierzÍta.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"WiÍksze niebezpieczeÒstwo stanowili pojawiajπcy siÍ od czasu do czasu moønow≥adcy, pragnπcy zdobyÊ kamienie przemian. Osaczony druid zazwyczaj wola≥ zniszczyÊ ten magiczny przedmiot niø pozwoliÊ, by ten dosta≥ siÍ w niepowo≥ane rÍce.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Niekiedy teø zaklinali owe kamienie, tego ktÛry je zdoby≥. W kaødym razie, w wiÍkszoúci legend prÛba zdobycia kamienia przemiany koÒczy≥a sie øa≥oúnie dla chciwca.†Mimo to wszystko wskazuje na to, øe wiele wiekÛw po koÒcu ery druidÛw, nadchodzi czas, gdy zaniknπ teø ocala≥e dotπd wspÛlnoty druidzkie.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Nawet jednak wtedy, gdy na ziemiach myrtaÒskich nie bÍdzie juø ani jednego spoúrÛd tych prymitywnych magÛw, to ruch druidzki odcisnπ≥ trwa≥e piÍtno na historii naszego Kontynentu i jako taki, nigdy nie zginie, gdyø bÍdzie trwaÊ w pieúni i w s≥owie kronikarza. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"KONIEC TOMU II, OSTATNIEGO ");

};


/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA 

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades1 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom I";

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

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades1,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"ZaprzysiÍgli. Tom I");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Historia ZaprzysiÍg≥ych zaczyna siÍ w doúÊ trudnej do okreúlenia przesz≥oúci. Niepodobna jest ustaliÊ za czyjego panowania owo bractwo siÍ zrodzi≥o. Wiadomym jest jednak, øe po wiekach swego istnienia, zosta≥o z≥amane i rozbite przez wielkiego emira Khalima z Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Od wiekÛw smagane pustynnym s≥oÒcem, posiadajπce nieprzyjazny dla cz≥owieka  klimat, po≥udniowe kraÒce Varantu, by≥y gniazdem sekciarstwa i odszczepieÒstwa. Na owe ziemie wyruszali rÛwnieø ascetyczni mÍøowie w samotnoúci i wyrzeczeniu siÍ wygÛd poszukujπcy bliskoúci z Adanosem. Jednym z nich by≥ Ayam. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Niewiele wiadomo o tej postaci, po za wπtpliwπ informacjπ jakoby by≥ magiem wody i kap≥anem Adanosa. Przebywajπc w swej pustelni, mia≥ doznaÊ tajemniczej wizji, w ktÛrej ujrza≥ Beliara i ludzkie dzieciÍ pos≥ane przez niego na úwiat. Owa istota mia≥a sprowadziÊ na ludzi liczne nieszczÍúcia i zjednoczywszy ich w Beliarze, rozpoczπÊ panowanie mrocznego boga na ziemi. Zapowiadany w wizji cz≥owiek mia≥ w przysz≥oúci siÍ narodziÊ i staÊ siÍ Patriarchπ Cienia. Wed≥ug wierzeÒ sekty ZaprzysiÍg≥ych w kolejnych objawieniach, Adanos poleci≥ Ayamowi powo≥aÊ do øycia zakon, majπcy przygotowaÊ siÍ na przyjúcie i walkÍ z Patriarchπ Cienia. Natchniony owymi wizjami pustelnik, zgromadzi≥ wokÛ≥ siebie krπg uczniÛw, ktÛrzy uwierzyli w jego pos≥annictwo. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Gdy sekta siÍ juø zawiπza≥a, do Ayama mia≥ znÛw przemÛwiÊ Pan Wody. Odpowiadajπc na modlitwy o powstrzymanie przyjúcia S≥ugi Beliara, Adanos mia≥ rzec, øe biegu wydarzeÒ nie moøna odwrÛciÊ i Patriarcha Cienia musi przyjúÊ na úwiat. Pan Wody, wskaza≥ im jednak ratunek. Mia≥o nim piÍÊ úwiÍtych sztyletÛw, ktÛre wed≥ug wierzeÒ ZaprzysiÍg≥ych, jako rytualne ostrza kap≥aÒskie by≥y przechowywane w úwiπtyniach, wyznajπcych Innosa, Pradawnych. Ostrza te zaginÍ≥y, gdy przed wiekami Pan Wody ukara≥ potopem pychÍ staroøytnych VarantczykÛw.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"ZaprzysiÍgli uwaøajπ, øe Patriarcha Cienia ma przychodziÊ na úwiat przyobleczony w cia≥o ludzkie, do czasu gdy w rytualny sposÛb owych piÍÊ ostrzy nie zostanie wbitych w jego cia≥o. Ma to byÊ jedyna broÒ zdolna uúmierciÊ Pos≥aÒca Ciemnoúci. Wbicie niekompletnej liczby sztyletÛw wiπza≥o siÍ jedynie ze zniszczeniem jedynie jego cz≥owieczej pow≥oki, z zachowaniem ducha tej plugawej istoty. W takim przypadku, Patriarcha Ciemnoúci w stosownej godzinie mia≥ objawiaÊ siÍ w kolejnym wcieleniu.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Ayam i do koÒca swych dni sta≥ na czele sekty ZaprzysiÍg≥ych, poszerzajπc jej krπg i poszukujπc owych artefaktÛw. Jego nastÍpcy zdo≥ali ponoÊ zgromadziÊ wszystkie piÍÊ sztyletÛw, choÊ rÛwnie dobrze mog≥y byÊ one falsyfikatami. Nie trudno sobie przecieø wyobraziÊ sytuacje, gdy przywÛdcy sekty obawiajπc siÍ konsekwencji odkrycia, øe sztylety z wizji za≥oøyciela zakonu nigdy nie istnia≥y, kazali jakiemuú nadzwyczaj zdolnemu kowalowi wykuÊ fa≥szywe ostrza. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Jakkolwiek by nie by≥o, dziú zarÛwno badacze z krÍgÛw kap≥aÒskich, jak i niezwiπzani z nimi uczeni, sk≥onni sπ widzieÊ w Ayamie nie tylko heretyka, ale rÛwnieø cz≥owieka niezrÛwnowaøonego, ktÛry da≥ poczπtek groünej sekcie. Historia ta nie koÒczy siÍ jednak na szalonym pustelnikuÖ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA (WAØNE BY CA£Y KOMPLET ZNALAZ£ SI  W JEDNEJ Z TYCH DW”CH BIBLIOTEK)

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades2 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom II";

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

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades2,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"ZaprzysiÍgli. Tom II");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"W ciπgu wiekÛw zaprzysiÍgli odnajdywali w rÛønych znacznych osobistoúciach postaÊ Patriarchy Cienia. Mieli ich rozpoznawaÊ po czynach, lub znamionach na ciele. Ofiarπ zakonu, czy raczej wielu rÛønych zakonÛw, gdyø w ciπgu wiekÛw wewnπtrz sekty dochodzi≥o do licznych podzia≥Ûw, pad≥o wiele znamienitych ludzi. WúrÛd ich ofiar by≥o miÍdzy innymi kilku dowÛdcÛw wojskowych z Mora Sul i Bragi, a takøe wielu znacznych kupcÛw z ca≥ego Varantu. NajwiÍkszym jednak ich Ñdokonaniemî, a zarazem tym ktÛry przyniÛs≥ im tyle s≥awy, co i zguby, by≥o uúmiercenie w≥adcy Bragi - emira Bilyi i jego dwÛch synÛw. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Na fali rozruchÛw i fanatyzmu, podsycanego plotkami o czarnoksiÍskich praktykach na dworze emira, rozjuszony t≥um ruszy≥ przeciwko przyrodzonym panom. W wyniku buntu do w≥adzy zostali wyniesieni ZaprzysiÍgli pod wodzπ maga Abdahela. Podczas rebelii emir Bilyia i jego synowie zostali bestialsko zasztyletowani przez cz≥onkÛw sekty, a ich cia≥a spalone na g≥Ûwnym placu miasta. ZaprzysiÍg≥ym nie uda≥o siÍ jednak dope≥niÊ rytua≥u w ca≥oúci, gdyø jedno z ostrzy mia≥o zaginπÊ w ferworze walk toczonych na ulicach z wojskami broniπcego siÍ emira.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Po przejÍciu w≥adzy, ZaprzysiÍgli wygnali tych spoúrÛd magÛw wody, ktÛrzy im siÍ sprzeciwiali i wespÛ≥ z przychylnymi im kap≥anami, zaczÍli otwarcie propagowaÊ swe doktryny w zdobytym mieúcie. Do zakonu do≥πczali kolejni cz≥onkowie, a w Bradze zaczÍ≥y siÍ szerzyÊ heretyckie pisma. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Wnet zaczÍto poszukiwaÊ rzekomych winnych nieudanego rytua≥u, gdyø sπdzono, øe do zakonu przeniknÍli zdrajcy. Wierzono, øe to wyznawcy Beliara pragnπc za wszelkπ cenÍ zapobiec unicestwieniu Pos≥aÒca, mieli wykraúÊ jedno brakujπce ostrze. CieÒ podejrzenia pad≥ rÛwnieø na ludzi posπdzanych o sprzyjanie emirom.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Z rozkazu Abdahela kaøde z narodzonych dzieci musia≥o byÊ sprawdzane pod kπtem znamion, ktÛre mog≥yby wskazywaÊ na to, øe ich cia≥a sta≥y siÍ domem Pos≥aÒca Beliara. Praktyki te poch≥onÍ≥y niejedno istnienie, podobnie jak przeúladowanie wszystkich ludzi podejrzanych o sprzyjanie zamordowanemu w≥adcy. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Powracajπcy z wojny Hakim ñ w≥adca Mora Sul, obleg≥ BragÍ i zdobywszy jπ po dwÛch dniach, pomúci≥ úmierÊ emira i przywrÛci≥ porzπdek w mieúcie. Osadziwszy na tronie towarzyszπcego mu podczas wyprawy syna zabitego emira Bilyi ñ Nuwasa, wyruszy≥ w drogÍ powrotnπ do swojego krÛlestwa. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"ZaprzysiÍgli ponieúli wtedy klÍskÍ podwÛjnπ, gdyø z jednej strony zostali przetrzebieni i utracili swe sztylety, a z drugiej nie dokonali w pe≥ni rytua≥u. Nowa w≥adca do≥oøy≥ wszelkich staraÒ by wypleniÊ tπ sektÍ ze swojego miasta i ukaraÊ tych kap≥anÛw Adanosa, ktÛrzy opowiedzieli siÍ po stronie Abdahela. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Nie wiadomo co siÍ sta≥o z przywÛdcπ ZaprzysiÍg≥ych, gdyø nie odnaleziono jego zw≥ok. Po upadku rzπdÛw sekty w Bradze, historia g≥ucho milczy na temat dalszych losÛw Abdahela. Moøna wiÍc przyjπÊ, øe nie odegra≥ juø w niej øadnej znaczπcej roli. ChoÊ kto wie, jakπ wiedzÍ mogπ posiadaÊ tu sami ZaprzysiÍgli.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Pewnym jest, øe Hakim po zdobyciu Bragi i przywrÛceniu jej prawowitemu emirowi, uwiÛz≥ zdobyte sztylety ze sobπ. Od tej pory cztery z nich przez wiele wiekÛw, spoczywa≥y w skarbcu w wielkim mieúcie Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA (WAØNE BY CA£Y KOMPLET ZNALAZ£ SI  W JEDNEJ Z TYCH DW”CH BIBLIOTEK)

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades3 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom III";

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

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades3,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"ZaprzysiÍgli. Tom III");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Od czasÛw emira Hakima cztery rytualne sztylety ZaprzysiÍg≥ych przebywa≥y w Mora Sul, bÍdπc niemym úwiadectwem straszliwych wydarzeÒ z przesz≥oúci. Taki stan rzeczy trwa≥ do czasÛw, gdy Lukkor i Gellon zostali pokonani przez Rhobara II, a Varant zosta≥ dosta≥ siÍ pod panowanie krÛlÛw Myrtany. Jednak wojska Rhobara zdobywszy Mora Sul i wkroczywszy do skarbca wielkiego emira, znalaz≥y w zamku tylko trzy spoúrÛd czterech z≥oøonych tam rytualnych sztyletÛw. To co sta≥o siÍ z czwartym oraz piπtym z úwiÍtych ostrzy Zakonu ZaprzysiÍg≥ych, do dziú pozostaje zagadkπ. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Znam uczonych, ktÛrzy twierdzπ, øe sam Lukkor podarowa≥ ZaprzysiÍg≥ym jeden ze sztyletÛw, majπc nadziejÍ, øe ci obiorπ sobie za cel innosyckiego w≥adcÍ wkraczajπcego do adanosyckiego Varantu. Sπ teø tacy, co obstajπ przy tym, øe zakon zdo≥a≥ wykraúÊ jedno z ostrzy ze skarbca i do dziú kontynuuje swe dzie≥o.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Z ciekawszych hipotez, niektÛrzy sπ sk≥onni domniemywaÊ, øe krÛlewski wywiad Myrtany zdo≥a≥ zinfiltrowaÊ szeregi bractwa i wykorzystuje zakon w swoich grach, eliminujπc osoby stanowiπce zagroøenie dla paÒstwa RhobarÛw. Ze wzglÍdu na stopieÒ tajnoúci zwiπzany z wywiadem, moøna o tym jedynie domniemywaÊ.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Inne zakony wywodzπce siÍ z ZaprzysiÍg≥ych, zachowujπc pod≥oøe religijne, pada≥y ofiarπ manipulacji ze strony moønych, pragnπcych siÍ pozbyÊ konkretnych ludzi. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Jako poparcie twierdzeÒ jakoby ta sekta w dalszym ciπgu dzia≥a≥a, przywo≥uje siÍ rozmaite przypadki morderstw znamienitych osÛb, lecz úledztwa prowadzone przez straø krÛlewskπ i inkwizycjÍ MagÛw Ognia, nie potwierdzi≥y zwiπzkÛw tych zabÛjstw ze staroøytnπ sektπ varanckπ. Moøe poza jednym przypadkiem, gdy jakiú wariat wdar≥ siÍ na przyjÍcie vengardzkiego kupca Elberta i prÛbowa≥ go zasztyletowaÊ 'staroøytnym ostrzem'. ”w artefakt okaza≥ siÍ jedynie stylizowanym noøem, wykutym kilka tygodni wczeúniej  w kuüni miejscowego kowala. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Mimo to wciπø wielu ludzi, nawet powaønych, utrzymujÍ, øe sekta ZaprzysiÍg≥ych dzia≥a do dziú i jako taka ma mieÊ niema≥y wp≥yw na wydarzenia w naszym KrÛlestwieÖ ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"KONIEC TOMU III, OSTATNIEGO");

};

/////////////////////////////////////////////////////////////////////

// KLUCZ DO MYRTANY

// SUGEROWANA LOKACJA: NA REGALE W JEDNEJ Z KOMNAT KWATERY MAGNAT”W

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[KrÛtki traktat o roli magicznej rudy w powstaniu i ekspansji Myrtany]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_VarensBook,LOG_NOTE);

B_LogEntry(BookLog_VarensBook,"Klucz do Myrtany");

B_LogEntry(BookLog_VarensBook,"Przez wiele wiekÛw magiczna ruda cieszy≥a siÍ uznaniem jedynie alchemikÛw i magÛw, ktÛrzy postrzegali jπ wy≥πcznie jako ürÛd≥o magicznej energii. ChoÊ niektÛrzy podejmowali prÛby zastosowania owego kruszcu w kowalstwie, to efekty takich eksperymentÛw by≥y nader mizerne. ");

B_LogEntry(BookLog_VarensBook,"Dopiero na wiek przed przybyciem Rhobara I do Myrtany, kowale nordmarscy odkryli metodÍ obrÛbki rudy pozwalajπcπ na wykorzystanie jej do produkcji broni.†Dokonanie to przypisuje siÍ niejakiemu Angirowi, mistrzowi kuüni pochodzπcemu Klanu M≥ota.");

B_LogEntry(BookLog_VarensBook,"Wynalazek ten znaczπco wp≥ynπ≥ na bieg naszej historii, gdyø Rhobarowie potrafili wykorzystaÊ go do zapewnienia swym armiom przewagi nad wojskami wrogÛw. Dziú juø z pewnoúciπ moøna rzec, øe gdyby nie magiczna ruda, nigdy nie powsta≥aby zjednoczona Myrtana.");

B_LogEntry(BookLog_VarensBook,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM I

// SUGEROWANA LOKACJA: OB”Z £OWC”W ORK”W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Historia NordmarczykÛw]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar1,"Nordmarczycy. Tom I");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed≥ug najstarszych podaÒ przodkowie NordmarczykÛw pierwotnie byli pogaÒskim ludem zamieszkujπcym Mroüne Wyspy, po≥oøone na pÛ≥nocny-wschÛd od Myrtany. Stamtπd ich przodkowie przybyli na ziemie, ktÛre dziú zwiemy Sundmarem, a nad ktÛrymi w naszych czasach gÛruje zbudowana przez krÛlÛw Gothy twierdza Faring.");

B_LogEntry(BookLog_HistoryOfNordmar1,"BarbarzyÒcy mieli przyp≥ynπÊ na Kontynent w poszukiwaniu ziemi, prowadzeni przez pÛ≥-legendarnego Rangulda, ktÛry sta≥ siÍ wspÛlnym przodkiem dzisiejszych NordmarczykÛw i SundmarczykÛw. ZarÛwno jedni jak i drudzy wierzπ, øe obie te krainy, po dwÛch stronach prze≥Íczy, nadane im zosta≥y przez przez bogÛw.");

B_LogEntry(BookLog_HistoryOfNordmar1,"To przekonanie wywodzi siÍ widocznie jeszcze z czasÛw wspÛlnoty obu ga≥Ízi ludu przyby≥ego z Mroünych Wysp. Z tym, øe o ile dawniej bogowie ci musieli byÊ pogaÒscy, o tyle dziú miejsce starych w tej opowieúci zajmuje myrtaÒski Innos, ktÛrego kult przyby≥ do ludÛw pÛ≥nocy dopiero wiele wiekÛw pÛüniej.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Z przybyciem Rangulda na Kontynent wiπøe siÍ pewna legenda. W dniach nieurodzaju jaki dotknπ≥ Mroüne Wyspy, Ranguld uda≥ sie do wyroczni, gdzie us≥ysza≥ o ëzielonym lπdzie na Po≥udniuí. Praprzodek dzisiejszych ludÛw pÛ≥nocy u boku swych towarzyszy, wyruszy≥ wiÍc na wyprawÍ, we wskazanym przez bogÛw kierunku.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Tak dotar≥ do Sundmaru, gdzie pokonawszy plemiÍ jaszczuroludzi, mia≥ w nagrodÍ otrzymaÊ od bogÛw dla swoich potomkÛw owe ziemie. Tyle przekazuje nam legenda.† Wiadomym jest jednak, øe przodkowie dzisiejszych ludÛw pÛ≥nocy od niepamiÍtnych czasÛw toczyli zaøarte boje ze swymi jelkalskimi sπsiadami.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Na d≥ugo jeszcze przed narodzinami krÛla GothÛw, Troghdana, ktÛry zjednoczy≥ liczne szczepy JelkalÛw, przodkowie NordmarczykÛw zostali przez nich pokonani. Potomkom Rangulda grozi≥a niewola. W dniach klÍski dzia≥alnoúÊ swπ rozpoczπ≥ niejaki Dorganard, pochodzπcy najpewniej z jednego z zagroøonych plemion.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed≥ug nordmarskiej tradycji, Dorganard mia≥ byÊ wybraÒcem bogÛw, ktÛremu bogowie polecili ocalenie jego ludu i poprowadzenie go ku ziemiom pÛ≥nocy. Z woli bogÛw, bezkresne ziemie za prze≥Íczπ mia≥y na wieki staÊ siÍ ich dziedzictwem. Z tπ nowinπ Dorganard przemierza≥ wioski i osady, g≥oszπc obietnicÍ bogÛw. ");

B_LogEntry(BookLog_HistoryOfNordmar1,"Za sprawπ jego nauk, rozpoczπ≥ siÍ wielki exodus, podczas ktÛrego ca≥e rodziny zostawia≥y swe domy i biorπc ze sobπ wszelki dobytek przeprawi≥y siÍ na pÛ≥noc. Przodkowie dzisiejszych NordmarczykÛw spotkali tam plemiona orkÛw, ktÛre dziesiπtkowane nieznanπ zarazπ, uleg≥y pod naporem przybyszÛw z po≥udnia.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Potomkowie Rangulda wkrÛtce rozciπgnÍli swe posiadanie na ca≥π krainÍ, opierajπc jej granicÍ o po≥udniowe kraÒce niezbadanych ziem orkÛw. Kolejne wyprawy na pÛ≥noc majπce poszerzyÊ ich w≥adztwo, a napotykajπc na coraz silniejszy opÛr orkÛw uúwiadomi≥y Nordmarczykom, øe granica pozostanie niezmienna.");

B_LogEntry(BookLog_HistoryOfNordmar1,"KONIEC TOMU I");

};


/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM II

// SUGEROWANA LOKACJA: OB”Z £OWC”W ORK”W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Historia NordmarczykÛw]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar2,"Nordmarczycy. Tom II");

B_LogEntry(BookLog_HistoryOfNordmar2,"Mija≥y wieki, a lud ten wzrasta≥ w si≥Í i liczebnoúÊ. W tym czasie jedne klany siÍ rodzi≥y, a inne znÛw zamiera≥y i odchodzi≥y do przesz≥oúci. Ostatecznie ukszta≥towa≥y siÍ trzy szczepy: Klan Ognia, Klan Wilka i Klan M≥ota. Nordmar, choÊ ogromny nie by≥ jednak w stanie wyøywiÊ coraz wiÍkszej populacji.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Rusza≥y wiÍc kolejne wyprawy ku ziemiom po≥udnia, docierajπce aø po w≥oúci podleg≥e Monterze. Nie uwaøali siÍ jednak za ≥upieøcÛw, gdyø wierzyli, øe sami bogowie nadali im Sundmar. Plπdrujπc tamte ziemie mieli wiÍc, jedynie zbieraÊ plony odebranej im ziemi. Nie byli jednak na tyle silni by jπ odzyskaÊ.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Trudno powiedzieÊ kiedy Nordmarczycy stali siÍ ludem czczπcym Innosa. Jest jednak pewnym, øe poczπtki tego kultu muszπ siÍ wiπzaÊ z ≥upieøczymi wyprawami na myrtaÒskie posiad≥oúci Pradawnych. PrzyjÍta z po≥udnia wiara na≥oøy≥a siÍ na prastary kult przodkÛw, tworzπc w≥aúciwπ dla Nordmaru odmianÍ kultu Innosa.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Waøna wydaje siÍ byÊ tu postaÊ Akaschy, ktÛremu w Nordmarze mia≥ siÍ objawiÊ sam Pan Ognia. NiektÛrzy chcieliby widzieÊ w nim postaÊ, ktÛrej Nordmarczycy zawdziÍczajπ okie≥znanie skutej lodem krainy. Pewne podania prÛbujπ go przedstawiÊ nawet jako ucznia Wiecznego WÍdrowca øyjπcego kilkaset lat przed Akaschπ.");

B_LogEntry(BookLog_HistoryOfNordmar2,"RÛwnie niedorzeczna wydaje siÍ myúl, øe Klan Ognia jest najstarszym miejscem w ca≥ym Nordmarze. Niewπtpliwie jednak Akascha by≥ postaciπ zwiπzanπ z Klanem Ognia, a byÊ moøe nawet jego protoplastπ. Ten bohater nordmarskich legend, jako barbarzyÒski wÛdz stoczy≥ liczne zwyciÍskie wojny z orkowymi plemionami.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Jeøeli wierzyÊ tamtejszym podaniom, Akascha prowadzπc swych towarzyszy do kolejnych bojÛw mia≥ znacznie rozszerzyÊ granicÍ Nordmaru. Niosπc ogieÒ na ziemie orkÛw, wydziera≥ owe tereny z ich ≥ap i oddawa≥ we w≥adanie ludziom. Rozszerzy≥ tym samym znacznie granicÍ krainy opanowanej przez potomkÛw Rangulda.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Na tym przyjdzie zakoÒczyÊ opis najstarszych dziejÛw NordmarczykÛw, nie opisawszy krucjat prowadzonych przez jarlÛw Farung na ziemie orkÛw, czy nie wspomniawszy wreszcie o zejúciu z gÛr Rhobara Wielkiego i powstaniu KrÛlestwa Myrtany. RÛwnieø obecne wojny Rhobara II z tym ludem dopiero czekajπ na kronikarza.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Piszπcy te s≥owa ma jednak nadziejÍ, øe ksiÍga ta choÊ w niewielkim stopniu przybliøy chÍtnym dzieje ludÛw pÛ≥nocy, ktÛre choÊ dziú nazywane sπ najczÍúciej barbarzyÒskimi, to wyda≥y spoúrÛd siebie krÛlÛw i jednoczycieli KrÛlestwa Myrtany.");

B_LogEntry(BookLog_HistoryOfNordmar2,"KONIEC TOMU II, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo1,LOG_NOTE);

B_LogEntry(BookLog_HaranHo1,"Haran Ho. Tom I");

B_LogEntry(BookLog_HaranHo1,"Ojciec Harana Ho pochodzi≥ z jednej z wysp, ktÛre tak obficie obsypujπ Wielkie Morze ciπgnπce siÍ na wschÛd od Kontynentu. Niewiele wiadomo o tym, co sk≥oni≥o go do przybycia do Varantu. Jedni powiadajπ, øe by≥ on jednym z wielu, ktÛrzy postanowili szukaÊ szczÍúcia w armii Imperium Pradawnych. Inni, øe mia≥ byÊ jakoby jednym z jeÒcÛw, ktÛry dziÍki swej nadzwyczajnej mπdroúci zdo≥a≥ zjednaÊ sobie uznanie wp≥ywowych osÛb i dziÍki temu zyskaÊ wolnoúÊ. Znajdπ siÍ teø tacy, co bÍdπ twierdziÊ, øe ojciec mÍczennika urodzi≥ siÍ w rodzinie urzÍdnika, blisko zwiπzanego ze úwiπtyniπ MagÛw Ognia.");

B_LogEntry(BookLog_HaranHo1,"Trudno tu rozstrzygnπÊ, ktÛrej wersji naleøa≥oby daÊ pos≥uch. Tym bardziej, øe nawet prawdziwe imiÍ rodzica Harana ginie w mrokach dziejÛw, a to znane z legend pochodzi najpewniej z o wiele pÛüniejszej, juø koczowniczo-varanckiej tradycji.†Legenda przyjmowana zarÛwno przez wyznawcÛw Adanosa, jak rÛwnieø przez nieprzychylny mu KoúciÛ≥ Innosa g≥osi, øe Haran Ho mia≥ byÊ jednym z najznamienitszych wojownikÛw czasÛw Nelezara I. Mia≥ przyjúÊ na úwiat w domu poboønego urzÍdnika, pozostajπcego w Innosyckich krÍgach úwiπtynnych. ");

B_LogEntry(BookLog_HaranHo1,"W przeddzieÒ narodzin Harana, jego ojciec mia≥ straszliwy sen. Oto objawi≥ mu siÍ czerwony gryf - zwierze poúwiÍcone Innosowi. Majestatyczne stworzenie wzrokiem groünym i pe≥nym niewypowiedzianej nienawiúci spoglπda≥o na rodzπce siÍ dziecko. Ojciec zrozumia≥, øe Haran nie jest mi≥ym Panu Ognia. Mi≥oúÊ rodzicielska jednak w nim zwyciÍøy≥a. Uklπk≥ przed ognistym gryfem, oddzielajπc go od dzieciÍcia, a wiedzπc, øe jest to zwierze Innosa, poczπ≥ b≥agaÊ:†ëOszczÍdü mego syna, a darujÍ go Twej úwiπtyni, Innosie! Jeúli z≥π mia≥a byÊ latoroúl moja, niechaj pod Twπ opiekπ wzrasta i s≥uøbπ swπ winÍ okupií");

B_LogEntry(BookLog_HaranHo1,"Majestatyczne stworzenie skierowa≥o swÛj wzrok na b≥agajπcego go cz≥owieka. Ojciec Harana by≥ wiernym i gorliwym Innosytπ, øyjπcym wed≥ug praw ludzkich i boskich. Sam Pan Ognia wiedzia≥, øe w sercu tym p≥onie ogieÒ niewzruszonej wiary. Najstarszy z BogÛw widzπc rozpaczliwe wo≥ania ojca, rozkaza≥ swemu zwierzÍciu by oszczÍdzi≥o ch≥opca. Gryf pos≥uszny woli Innosa, powoli siÍ oddala≥. Krzyk przebudzonego dzieciÍcia zwiastowa≥ koniec snu i rozpoczyna≥ øywot Harana Ho. Dla jednych mia≥ siÍ staÊ kiedyú úwiÍtym, dla innych znÛw przeklÍtym...");

B_LogEntry(BookLog_HaranHo1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo2,LOG_NOTE);

B_LogEntry(BookLog_HaranHo2,"Haran Ho. Tom II");

B_LogEntry(BookLog_HaranHo2,"”smego dnia po narodzinach, ojciec Harana zaniÛs≥ syna do úwiπtyni, by tam ofiarowaÊ go Innosowi. Tym czynem ch≥opiec zosta≥ przeznaczony do stanu kap≥aÒskiego, czym rodzic dope≥ni≥ úlubÛw z≥oøonych Innosowi.†Gdy nadszed≥ czas, ojciec odda≥ Harana na nauki i wychowanie magom ognia. W miarÍ dorastanie stawa≥o siÍ jasne, øe Haran nie nadaje siÍ na kap≥ana. M≥odzieniec bardziej od mπdroúci ksiπg, ceni≥ sobie si≥Í orÍøa. Niejednokrotnie wdawa≥ siÍ w bÛjki z innymi nowicjuszami, czym bynajmniej nie zaskarbi≥ sobie wzglÍdÛw uczonych magÛw. Czas pokaza≥, øe jego prawdziwym powo≥aniem jest s≥uøba wojskowa. Nie ≥amiπc úlubÛw zaprzesta≥ nauki magii i pog≥Íbionych studiÛw teologicznych. WkrÛtce kap≥ani zezwolili mu na wziÍcie udzia≥u w dzia≥aniach wojennych krÛla Nelezara, ktÛry to w≥adca wielkπ ufnoúÊ pok≥ada≥ w Koúciele Innosa.");

B_LogEntry(BookLog_HaranHo2,"Wyprawia≥ sie wiÍc Haran przeciw PraveÒczykom, co w b≥Ídzie pogaÒskim hardo trwali. Lud ten urπga≥ mocy Pradwanych, urzπdzajπc ≥upieøcze wyprawy na ziemie pograniczne, nieustannie im zagraøajπc.†I tu Haran Ho dowiÛd≥ niezbicie, øe powo≥aniem rzemios≥o wojenne to jego prawdziwe powo≥anie. W czasie jednej z bitew z PraveÒczykiem, dokona≥ rzeczy, ktÛra przynios≥a mu s≥awÍ i zwrÛci≥a na niego uwagÍ samego w≥adcy. W trakcie niepomyúlnego dla wojsk imperialnych boju, jeden z oddzia≥Ûw dowodzonych przez krÛlewskiego przyjaciela zosta≥ okrπøony przez wrogÛw. Owym monarszym druhem, a zarazem dowÛdcπ oddzia≥u by≥ Bargalla, pod ktÛrym s≥uøy≥ teø Haran. M≥ody nowicjusz MagÛw Ognia zobaczy≥, øe jego dowÛdca leøy na ziemi bez ducha. Zdoby≥ siÍ wtedy na czyn bohaterski i przedzierajπc siÍ przez zastÍpy wroga, pochwyci≥ nieprzytomnego i wyniÛs≥ z wrogiego okrπøenia.");

B_LogEntry(BookLog_HaranHo2,"W dowÛd wdziÍcznoúci za uratowanie krÛlewskiego przyjaciela wezwa≥ go imperator Nelzar przed swoje oblicze:†ëDowiod≥eú swego mÍstwa nowicjuszu Haranie! Czyn wielki bez nagrody ujúÊ nie moøe, przeto proú o co chcesz, a ja Ci to darujÍ!í. Haran nie prosi≥ o skarby, czy uczone ksiegi. Nie chcia≥ ani zaszczytÛw, ani tytu≥Ûw i majπtkÛw. Poprosi≥ tylko o pozwolenie mu na opuszczenie úwiπtyni i zamieszkanie na po≥udniowym pograniczu, gdzie jako wolny straønik strzeg≥by tamtejszych ziem przed ≥upieøczymi najazdami orkÛw i jaszczuroludzi. ChoÊ Nelzar by≥ nieco zdziwiony takim niecodziennym øyczeniem, zgodzi≥ siÍ. Od tej pory Haran Ho s≥uøy≥ na po≥udniowych stepach Varantu, gdzie na czele konnego oddzia≥u walczy≥ z zielonoskÛrymi rabusiami ñ pozosta≥oúciπ mrocznego przymierza, ktÛre to kilka wiekÛw wczeúniej pokona≥ Semmir I åwiÍty.");

B_LogEntry(BookLog_HaranHo2,"KONIEC TOMU II");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie].");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo3,LOG_NOTE);

B_LogEntry(BookLog_HaranHo3,"Haran Ho. Tom III");

B_LogEntry(BookLog_HaranHo3,"Kolejne lata spÍdzi≥ Haran Ho na po≥udniowych kraÒcach Imperium, broniπc mieszkaÒcÛw pogranicza przed luünymi bandami orkÛw, grasujπcymi w tych stronach. PoúrÛd orkowej zarazy, prym wiod≥a zgraja pod przywÛdztwem Osh-Gereba, ktÛry zdo≥a≥ zgromadziÊ przy sobie wielu podobnych rabusiÛw. Wiedziony øπdzπ ≥upu i krwi ork wyprawia≥ siÍ raz po raz na wioski, siejπc postrach i zniszczenie. Nim na ratunek mieszkaÒcom przybywali straønicy pogranicza, by≥o zazwyczaj juø po wszystkim. ");

B_LogEntry(BookLog_HaranHo3,"Orkowie nawiedzali wioski, by splπdrowawszy je, zbiec z ≥upem daleko na po≥udnie, gdzie przez wzglπd na niechÍtne Varantowi plemiona koczownikÛw i odleg≥oúÊ od varanckich siedzib, bali siÍ zapuszczaÊ nawet øo≥nierze imperium. NiektÛre osady za cenÍ bezpieczeÒstwa decydowa≥y siÍ p≥aciÊ daninÍ Osh-Gerebowi, lecz nawet to nie zawsze je chroni≥o przed najazdami orkÛw.†Sta≥ siÍ przeto herszt orkÛw, kryjπcy siÍ daleko w swych siedzibach na po≥udniu, panem niema≥ej czÍúci pogranicza, dzielπc niemal na rÛwni swπ w≥adzami varanckimi.");

B_LogEntry(BookLog_HaranHo3,"W Haranie Ho znalaz≥ on jednak godnego przeciwnika. Haran nakaza≥ postawiÊ dzwony w kaødej wiosce i wybudowaÊ liczne wieøe obserwacyjne, tworzπc sprawny system alarmowania na wypadek orkowych atakÛw. Ponadto przybysz nie ba≥ siÍ w pogoni za ≥upieøcπ zapuszczaÊ siÍ na niezbadane tereny po≥udnia. IlekroÊ ktÛrπú osadÍ nawiedzili orkowie, dzielny wojownik podπøa≥ na miejsce i krwawo rozprawia≥ siÍ z najeüdücπ. Swπ nieustÍpliwoúciπ i zaciÍciem, wla≥ ducha odwagi w straønikÛw pogranicza, skutecznie stawiajπc czo≥a orkowym bandytom. Z tego powodu prÍdko wiÍc zaskarbi≥ sobie wdziÍcznoúÊ ludzi øyjπcych na pograniczu.†");

B_LogEntry(BookLog_HaranHo3,"Zdarzy≥o siÍ czwartego roku s≥uøby na rubieøach, øe Haran Ho kierowany rosnπcπ ambicjπ uda≥ siÍ w dalekπ pogoÒ za jednym z orkowych podjazdÛw. Im dalej straønicy gnali za wataøkami, tym dalej byli od krain znanych kartografom imperialnym. Na tych ziemiach, to orkowie mieli w swych rÍkach ten niezwykle cenny atut, jakim jest znajomoúÊ terenu. Zwabiwszy Harana Ho do wπwozu, orkowie rozbili jego oddzia≥. Pomimo mÍstwa z jakim rycerz siÍ broni≥, jego los zdawa≥ siÍ byÊ przesπdzony.");

B_LogEntry(BookLog_HaranHo3,"Gdy juø si≥y dowodzone przez Harana Ho niemal ca≥kowicie stopnia≥y, na pomoc przybyli koczownicy - mieszkaÒcy owych nietkniÍtych w≥adzπ InnosytÛw ziem. Nomadzi pod wodzπ maga wody Istvana, zmusili orkÛw do odwrotu, zaú rannego Harana i tych z jego oddzia≥u, ktÛrzy przeøyli zabrali ze sobπ do obozowiska. Tam koczownicy opatrzywszy ich, poczÍli naradzaÊ siÍ, co naleøy zrobiÊ z ocala≥ymi Varantczykami. MieszkaÒcy tych ziem z niechÍciπ spoglπdali na Pradawnych, gdyø pamiÍtali, øe pÛ≥nocni sπsiedzi nieraz prÛbowali podporzπdkowaÊ sobie koczownikÛw.††");

B_LogEntry(BookLog_HaranHo3,"Za radπ Istvana, plemiÍ zdecydowa≥o siÍ poddaÊ przywÛdcÍ oddzia≥u prÛbie. Oto koczownicy ustawili ze swych dzid i oszczepÛw krπg, poczym wprowadzili do niego Harana i jego ocala≥ych towarzyszy. NastÍpnie mag Istvan wprowadzi≥ do krÍgu dwa lwy, naleøπce do plemienia i stanowiπce jakoby czÍúÊ owej wspÛlnoty. Tak oto los uratowanych z zasadzki VarantczykÛw zosta≥ poddany pod osπd Adanosa. Lwy okrπøy≥y trzykrotnie Harana Ho i jego towarzyszy, badajπc ich wzrokiem i gotujπc siÍ do ataku. Zatoczywszy jednak trzeci krπg gwa≥townie rzuci≥y siÍ w kierunku Varantczyka, by obrÛciwszy siÍ na zewnπtrz ko≥a, zajπÊ miejsce u prawego i lewego boku Harana.†ëTen oto cz≥owiek cieszy siÍ ≥askπ Adanosaí ñ rzek≥ mag wody Istvan, wstÍpujπc do owego krÍgu.");

B_LogEntry(BookLog_HaranHo3,"KONIEC TOMU III");

};
/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo4,LOG_NOTE);

B_LogEntry(BookLog_HaranHo4,"Haran Ho. Tom IV");

B_LogEntry(BookLog_HaranHo4,"Haran Ho w wyniku potyczki z orkami, odniÛs≥ powaøne rany, ktÛre przez wiele tygodni nie pozwala≥y mu na powrÛt do domu. Podobnie rzecz siÍ mia≥a z tymi spoúrÛd jego towarzyszy, ktÛrym uda≥o siÍ przeøyÊ bitwÍ. Øy≥ wiÍc poúrÛd koczownikÛw, obserwujπc przy ich przy tym i nasiπkajπc ich kulturπ. Nawet gdy kompani Harana opuúcili juø ziemie koczownikÛw i powrÛcili do Varantu, on zdecydowa≥ siÍ pozostaÊ wúrÛd nomadÛw, ktÛrzy uratowali mu øycie. Z czasem sta≥ siÍ jednym z nich i jako uczeÒ maga Istvana postanowi≥ kroczyÊ drogπ Adanosa. Z≥ama≥ tym samym úluby, ktÛre z≥oøy≥ niegdyú w úwiπtyni Innosa.");

B_LogEntry(BookLog_HaranHo4,"Na d≥ugo zapomniano wtedy o Haranie, ktÛry przez wiele lat øy≥ poúrÛd nomadÛw. Mimo to wieúÊ o konwersji dotar≥a w koÒcu do arcykap≥ana Salviana, rezydujπcego w pa≥acu úwiπtynnym magÛw w Al Shedim, wywo≥ujπc w Salvianie wúciek≥oúÊ. Wysoki Mag Ognia postanowi≥ wiÍc wys≥aÊ do Harana Ho ludzi, ktÛrzy namÛwiliby go do odmiany decyzji. Haran odmÛwi≥, wydajπc tym samym na siebie wyrok úmierci. Od tamtej pory s≥udzy arcykap≥ana rozpoczÍli poúcig za konwertytπ, ukrywajπcym siÍ wraz z nomadami poúrÛd dzikich krain, nieznanych dla VarantczykÛw. ");

B_LogEntry(BookLog_HaranHo4,"Wiele lat ludzie úwiπtyni tropili Harana, lecz ten dziÍki umiejÍtnoúciom bojowym i magii Adanosa wychodzi≥ ca≥o ze wszystkich zasadzek. W czasie jednej z takich potyczek, koczownicy ponieúli dotkliwe straty i dla ratowania siÍ, byli zmuszeni wydaÊ Harana. Pojmanego, zawleczono do Al Shedim, gdzie postawionego przed sπdem prÛbowano zmusiÊ do wyrzeczenia siÍ Adanosa. Haran Ho pozosta≥ jednak niez≥omny. Z rozkazu arcykap≥ana Salvina zosta≥ wiÍc stracony, a dla poniøenia pochwyconego, cia≥u konwertyty odmÛwiono pochÛwku i wrzucono do rzeki.");

B_LogEntry(BookLog_HaranHo4,"Zosta≥o ono jednak wy≥owione przez jego rodzinÍ i z≥oøone w kamiennym grobie. Tam teø zasta≥ je potop, ktÛry zmiÛt≥ z powierzchni ziemi ca≥π cywilizacjÍ Pradawnych i otworzy≥ Koczownikom drogÍ do osiedlenia siÍ na opustosza≥ych ziemiach Varantu. Tak oto koÒczπ siÍ dzieje Harana Ho, ktÛry dla Pradawnych zdrajcπ bÍdπc i renegatem, sta≥ siÍ bohaterem i mÍczennikiem dla ludÛw, ktÛre przyjúÊ po upadku Imperium mia≥y. ");

B_LogEntry(BookLog_HaranHo4,"KONIEC TOMU IV, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// R”D FOLKMAR”W

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA. JEDEN EGZEMPLARZ NA CA£• KOLONI  W ZUPE£NOåCI WYSTARCZY.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_FolkmarFamily (C_ITEM) //d - lochy

{

name ="RÛd FolkmarÛw";

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

Doc_PrintLines( nDocID,  0, "RÛd FolkmarÛw");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[PrÛba rekonstrukcji rodu posiadaczy ziemskich w Khorinis na podstawie zapiskÛw wyrytych na rodzinnych mogi≥ach.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_FolkmarFamily,LOG_NOTE);

B_LogEntry(BookLog_FolkmarFamily,"RÛd FolkmarÛw");

B_LogEntry(BookLog_FolkmarFamily,"Niejednokrotnie bywa≥em z wizytπ w majπtku ziemskim w Khorinis, od pokoleÒ naleøπcym do dumnego rodu FolkmarÛw. Gospodarze zawsze wtedy potrafili mnie godnie ugoúciÊ, nie uchybiajπc godnoúci mojej jako maga ani dobremu imieniu swego domu. Bodücem do napisania tej ksiÍgi by≥o jednak nader smutne wydarzenie. Oto do Innosa odchodzi≥ sÍdziwy senior rodu i w≥aúciciel majπtku ziemskiego ñ szanowny Pan Buvran. ZarÛwno owego statecznego gospodarza, jak i jego rodzinÍ zna≥em doúÊ dobrze i úmierÊ Pana Buvrana wielce mnie zasmuci≥a. Zrozumia≥em wtedy w pe≥ni jak ulotnπ rzeczπ jest ludzkie øycie i ludzka pamiÍÊ. To sk≥oni≥o mnie do tego, by przeúledziÊ napisy z nagrobkÛw widniejπce na rodzinnym cmentarzu. Czas odbiera nam pamiÍÊ, a s≥owa wyryte w kamieniu powoli siÍ zacierajπ. Dlatego teø postanowi≥em spisaÊ widniejπce na nagrobkach s≥owa, by utrwaliÊ dla potomnych dzieje owego waønego dla Khorinis rodu.");

B_LogEntry(BookLog_FolkmarFamily,"1. Gebhard Niedüwiedzia Tarcza.†Mocarz poleg≥y w bitwie z ciemiÍøcπ, w walce o wolnoúÊ ludu Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"2. Folkmar syn Gebharda. Towarzysz Dietmara Ukary i pierwszy posiadacz majπtku ziemskiego.");

B_LogEntry(BookLog_FolkmarFamily,"3. Gerlach syn Folkmara. Zostawi≥ swym synom majπtek po trzykroÊ pomnoøony.");

B_LogEntry(BookLog_FolkmarFamily,"4. Humbert syn Gerlacha. KtÛø jeúli nie on, siÍgnπ≥by aø po prze≥Ícz?");

B_LogEntry(BookLog_FolkmarFamily,"5. Lutbert syn Gerlacha.†M≥odszym bÍdπc, najstarszym siÍ sta≥. Po bracie objπ≥ majπtek ziemski w posiadanie, gospodarzπc aø po kres swych d≥ugich dni.");

B_LogEntry(BookLog_FolkmarFamily,"6. Ekbert syn Lutberta. Mπø stateczny, ojciec po dwakroÊ nieszczÍúciem dotkniÍty. Przedwczeúnie zgas≥, úmierciπ swych ukochanych dzieci strapiony. ");

B_LogEntry(BookLog_FolkmarFamily,"7. Emilda cÛrka Ekberta. DziewczÍ nadzwyczajnej urody, posiadajπce dar widzenia. Rozstrzyga≥a spory, wskazywa≥a przestÍpcÛw, leczy≥a chorych. Los zawistnie strzegπcy swych tajemnic, w zemúcie zes≥a≥ na jej umys≥ szaleÒstwo.");

B_LogEntry(BookLog_FolkmarFamily,"8. Manfred syn Ekberta. Ukochawszy gonitwÍ i pe≥ny zwierzyny las, nad sierp i z≥oto zboøa, rozszarpany przez dzikπ bestiπ myúliwy skona≥ na leúnej polanie.");

B_LogEntry(BookLog_FolkmarFamily,"9. Mourin Z≥oty Sierpiec. Ziarno przez siewce odtrπcone, wyda≥o plon stukrotny. PoboønoúÊ i pracowitoúÊ zapewni≥a majπtkowi ziemskiemu dobrobyt. W klasztorze osiad≥szy na staroúÊ, tam dokona≥ øywota.");

B_LogEntry(BookLog_FolkmarFamily,"10. Hereward syn Mourina. M≥odzieniec ros≥y, odwagÍ i honor noszπcy w sercu. Zginπ≥ úmierciπ bohatera w walce z najeüdücπ z zachodu, broniπc swego kraju u boku dzielnych synÛw Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"11. Folkward syn Mourina. Poszed≥ w úlady brata, zasiliwszy szeregi wojsk KrÛlestwa Kahr. MÍstwem i walecznoúciπ siÍ odznaczywszy, zosta≥ przez samego w≥adcÍ wybrany do osobistej Gwardii.");

B_LogEntry(BookLog_FolkmarFamily,"12. Caspar syn Folkwarda. Po ojcu swego rodziciela wziπ≥ w posiadanie majπtek ziemski, panujπc przez lat wiele dziesiπtkÛw. ålepcem bÍdπc na staroúÊ, nigdy nie ujrza≥ swego jedynego syna.");

B_LogEntry(BookLog_FolkmarFamily,"13. Adalbert syn Caspara. Ziemie ukocha≥ on szczerze, serce swe oddajπc ca≥kowicie sprawom majπtku ziemskiego. Na dziedzica przez Caspara namaszczony zmar≥ przedwczeúnie chorobπ zmoøony. ");

B_LogEntry(BookLog_FolkmarFamily,"14. Udo syn Caspara. Potomek Folkmara, ktÛremu sπdzone by≥o øyÊ w czasach powolnego upadku KrÛlestwa Kahr i zmierzchu krÛlewskiej dynastii UkarÛw. Poleg≥y w walkach toczonych o tron KrÛlestwa.");

B_LogEntry(BookLog_FolkmarFamily,"Tu nastÍpuje kilkupokoleniowa wyrwa, gdyø po úmierci synÛw Caspara brak juø nagrobkÛw aø do pochÛwku Hugona. W tym czasie, zapewne za sprawπ nowinek religijnych rozpowszechnianych przez szerzπce siÍ wÛwczas na wyspie sekty, w≥aúciciele majπtku ziemskiego przyjÍli nieznany wczeúniej zwyczaj palenia zmar≥ych. Wobec braku nagrobkÛw, nie sposÛb odtworzyÊ w tym miejscu historii rodu. W tradycji rodzinnej przetrwa≥o jednak echo o jakimú wÍdrownym mÍdrcu przyby≥ym z po≥udnia i przez wiele lat cieszπcym siÍ goúcinπ tutejszych gospodarzy. Kim by≥, ani jakim doktrynom s≥uøy≥, na wieki pewnie pozostanie tajemnicπ. Oto kolejni Folkmarowie:");

B_LogEntry(BookLog_FolkmarFamily,"15. Hugon syn Widukinda. W cieniu brata wyros≥y, wiÍcej by≥ mnichem, niø gospodarzem. Nad ksiÍgami nieustannie pochylony, nie zwyk≥ doglπdaÊ swego majπtku. W wiedzÍ tedy wzrastajπc, na dobytku swym zaniedbaniem uszczerbek czyni≥.");

B_LogEntry(BookLog_FolkmarFamily,"16. Ordulf syn Hugona. Zmar≥ op≥akiwany przez rodzinÍ i licznych przyjaciÛ≥. Za swego øycia odnowi≥ zabudowÍ majπtku ziemskiego i wybudowa≥ nowy m≥yn. Doøywszy starczego wieku, do ostatnich dni zachowa≥ zdrowie i jasnoúÊ umys≥u.");

B_LogEntry(BookLog_FolkmarFamily,"17. Dietwin syn Ordulfa.†Gospodarz stateczny i cieszπcy siÍ szacunkiem. Zjednawszy sobie mπdroúciπ sπsiadÛw, zyska≥ rolÍ rozjemcy nie z prawa, lecz ze zwyczaju. Zmar≥ doøywszy wieku sÍdziwego");

B_LogEntry(BookLog_FolkmarFamily,"18. Bernard syn Dietwina. Godny potomek Gebharda DÍbowej Tarczy, ktÛry wzorem swego praprzodka potrafi≥ wyginaÊ podkowy. S≥awny swπ si≥π, ≥eb warga by≥ w stanie zmiaødøyÊ w uúcisku swej piÍúci. Gospodarz majπtku ziemskiego");

B_LogEntry(BookLog_FolkmarFamily,"19. Engelbrecht syn Bernarda. Øywot jego przypada≥ na czasy pokoju i takie teø by≥ usposobienia Engelbrechta syn Bernarda.");

B_LogEntry(BookLog_FolkmarFamily,"20. Buvran syn Dietwina. Zasnπ≥ snem wieczny, doøywszy 87 lat. Przez ca≥e swe øycie nigdy nie opuúci≥ swego majπtku ziemskiego, ktÛry ukocha≥ nade wszystko.");

B_LogEntry(BookLog_FolkmarFamily,"Kolejne karty tej ksiπøki zapisze nieuchronny czasÖ Spisane piÛrem Eudamona, Maga Ognia z Klasztoru w Khorinis");

B_LogEntry(BookLog_FolkmarFamily,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// DZIEDZICTWO PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

TEXT[2] ="Autor: Mag Wody†Calamus";

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

Doc_PrintLines( nDocID,  0, "[O wpÛ≥ywie cywilizacji staroøytnego Varantu na úwiat myrtaÒski, a takøe o zwiπzkach Imperium Pradawnych z dzisiejszym Varantem.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HeritageOfAncestors,LOG_NOTE);

B_LogEntry(BookLog_HeritageOfAncestors,"Dziedzictwo Pradawnych");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium Varanckie kilkanaúcie wiekÛw temu†stanowi≥o najwiÍkszπ potÍgÍ na Kontynencie MyrtaÒskim. Zjednoczone przez Wiecznego WÍdrowca rozciπgnÍ≥o swe w≥adztwo na ca≥y Varant i po≥udniowe tereny Krain Centralnych. Zosta≥o unicestwione przez Adanosa, gdy Pradawni podjÍli siÍ budowy portalu za pomocπ ktÛrego Innos mia≥ przekroczyÊ oddzielajπcπ oba wymiary barierÍ i przyjúÊ do Wymiaru Ludzi.");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium zdo≥a≥o jednak wytworzyÊ kulturÍ i religiÍ, ktÛra przetrwa≥a upadek samego paÒstwa i sta≥a siÍ podstawπ cywilizacji rozprzestrzeniajπcej siÍ nastÍpnie na zielone krainy Myrtany, skuty lodem Nordmar i na liczne wyspy i wysepki po≥oøone na wschÛd od Kontynentu.");

B_LogEntry(BookLog_HeritageOfAncestors,"Po unicestwieniu Pradawnych, na lπd powtÛrnie wy≥aniajπcy siÍ z g≥Íbin, przybywali ludzie z gÛr leøπcych na zachodzie. Zwali sie oni koczownikami. Nowi mieszkaÒcy nie byli poganami, choÊ w przeciwieÒstwie do Pradawnych VarantczykÛw nie oddawali czci Innosowi, lecz wyznawali Pana Wody - Adanosa. Wed≥ug legendy, plemiona te mia≥y pochodziÊ od wyklÍtego w≥adcy Varantu - Kalhira II. Wygnany ze swego paÒstwa za prÛbÍ obalenia kultu Innosa i zastπpienia go kultem Adanosa, zbieg≥ w gÛry, gdzie nawraca≥ tamtejsze plemiona KoczownikÛw. Poczπtkowo przyby≥e do Varantu ludy gÛrskie, przemierza≥y wyja≥owiony i zamieniony przez bogÛw w pustyniÍ lπd, kroczπc szlakiem Wiecznego WÍdrowca. Jednak z biegiem lat coraz wiÍcej ludzi decydowa≥o siÍ na osiad≥y tryb øycia. W oazach zaczÍ≥y wiÍc powstawaÊ wioski i miasta. ");

B_LogEntry(BookLog_HeritageOfAncestors,"NastÍpnym etapem by≥o powstanie paÒstw. Na czele owych czÍsto rywalizujπcych ze sobπ krÛlestw, stawali adanosyccy w≥adcy. NajpotÍøniejszymi mia≥y siÍ okazaÊ Mora Sul i Bakareshu. Niebawem ludy pustyni mia≥y same siebie przezwaÊ Varantczykami, przejmujπc tym samym nazwÍ dawnych mieszkaÒcÛw tej krainy. Mimo to pamiÍÊ o poczπtkach kaza≥a im zachowaÊ pierwotnπ nazwÍ swego ludu, wiÍc od wiekÛw prowadzπcy osiad≥y tryb øycia mieszkaÒcy Varantu okreúlajπ siÍ rÛwnieø mianem KoczownikÛw.†");

B_LogEntry(BookLog_HeritageOfAncestors,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// PIEå— O WYZWOLENIU

// SUGEROWANA LOKACJA: LOCHY STAREGO OBOZU (PUSTA CELA, PE£NA KOåCIOTRUP”W). KSI GA PRZY JEDNYM ZE SZKIELET”W

// KATEGORIA: UNIKATOWE - TYLKO JEDNA 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_IsNomineVacans (C_ITEM) //d

{

name ="PieúÒ o wyzwoleniu";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_02.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Ognia†Telavio";

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

Doc_PrintLines( nDocID,  0, "PieúÒ o wyzwoleniu");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dociekania poúwiÍcone zagadkowemu hymnowi.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_IsNomineVacans,LOG_NOTE);

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu");

B_LogEntry(BookLog_IsNomineVacans,"Is nomine vacans liberabit vobis ex servitus. Is nomine vacans reddet vobis ars magica. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. ");

B_LogEntry(BookLog_IsNomineVacans,"Advemini custos templorum. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. Advemini custos templorum.†");

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu zalicza siÍ do najstarszych i najbardziej tajemniczych tekstÛw, ktÛrych geneza ginie w mrokach dziejÛw. Zosta≥a ona napisana w jednym z dialektÛw jÍzyka Pradawnych ñ w jÍzyku kap≥anÛw Innosa. Jest to mowa archaiczna, gdyø pos≥ugiwali siÍ niπ w≥aúciwie jedynie najwyøsi kap≥ani Imperium Pradawnych. Skπd wiÍc w tekúcie pojawiajπ siÍ s≥owa o Vengardzie, ktÛry nigdy nie popad≥ w zaleønoúÊ od potÍønego paÒstwa Pradawnych?");

B_LogEntry(BookLog_IsNomineVacans,"Czy tekst traktuje o wydarzeniach z przesz≥oúci i nadziei tamtych ludzi na wybawienie przez tajemniczego bohatera, czy teø jest to moøe forma przepowiedni, ktÛra dopiero ma siÍ wype≥niÊ?†Czym jest teø owa moc magiczna, ktÛra ma zostaÊ przywrÛcona przez nieznanego z imienia bohatera? Czy rzecz siÍ tyczy staroøytnych czarÛw, ktÛre zosta≥y utracone w momencie zag≥ady Imperium Pradawnych? Odzyskanie tej wiedzy by≥oby zapewne istnym przewrotem w dziedzinie nauk magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Kwestia autorstwa rÛwnieø pozostaje nierozwiπzana. JÍzyk wskazywa≥by na kap≥anÛw Varantu, lub krÍgi duchowne pozostajπce pod wp≥ywem Imperium. Najpopularniejsze z hipotez mÛwiπ o ocala≥ych Pradawnych, ktÛrzy op≥akiwali upadek swej cywilizacji i øywili wiarÍ w to, øe uda siÍ zachowaÊ jego dziedzictwo, a nawet odbudowaÊ utraconπ wielkoúÊ. ");

B_LogEntry(BookLog_IsNomineVacans,"Moøliwe teø, øe okrπøeni z wszystkich stron przez barbarzyÒcÛw Pradawni z niezatopionych pÛ≥nocnych ziem dawnego krÛlestwa, w cudownym wybraÒcu bogÛw upatrywali swego wybawiciela. Skπd wiÍc wziπ≥ siÍ w pieúni Vengard?");

B_LogEntry(BookLog_IsNomineVacans,"Nie wykluczajπc powyøszych przypuszczeÒ, moøna siÍ pokusiÊ o innπ teoriÍ. OtÛø mog≥a powstaÊ w czasach zagroøenia jakiejú innosyckiej spo≥ecznoúci, ktÛra byÊ moøe utraci≥a swych magÛw i co za tym idzie, rÛwnieø magicznπ moc. Wyraøa wiÍc ona wiarÍ w powrÛt utraconej wiedzy. Bohaterem by≥by wiÍc cz≥owiek obcy, przyby≥y z innych stron, ktÛrego imiÍ by≥oby im wczeúniej nieznane. ByÊ moøe chodzi≥o od pos≥aÒca bogÛw.");

B_LogEntry(BookLog_IsNomineVacans,"Pomimo niezrozumia≥ego jÍzyka, a moøe w≥aúnie dziÍki temu pieúÒ siÍ rozpowszechni≥a w ca≥ej Myrtanie. Moøna przypuszczaÊ, øe archaiczne brzmienie jej s≥Ûw musia≥o przywodziÊ na myúl zaklÍcia, z czym wiπza≥oby siÍ nadawanie utworowi w≥aúciwoúci magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Uczeni wspominajπ, øe po zdobyciu Gothy przez wojska Monteriusa II, d≥ugo jeszcze niegodzπcy siÍ z klÍskπ, ukrywajπcy siÍ po lasach partyzanci úpiewali tπ pieúÒ. DomyúlaÊ siÍ moøna, øe owi rycerze zamiast Vengardu wymieniali nazwÍ zdobytego swego miasta, ktÛre znalaz≥o ku ich rozpaczy znalaz≥o siÍ w rÍkach wroga.");

B_LogEntry(BookLog_IsNomineVacans,"Najstarszy jednak spisany tekst pieúni pochodzi od Reginalda, ktÛry w swych ëHymnach Myrtanyí zawar≥ jπ w wersji vengardzkiej. Reginald milczy jednak o tym, kiedy powsta≥a i w jakich okolicznoúciach zosta≥a odúpiewana.");

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu zapewne pobrzmiewa≥a jeszcze na ziemiach Krain Centralnych w czasach podbojÛw RhobarydÛw, kiedy to dzielni krÛlowie jednoczyli rozbitπ na szereg krÛlestw zielonπ MyrtanÍ. Wraz ze zrastaniem siÍ ziem zjednoczonych pod ber≥em RhobarydÛw, pieúÒ ta uleg≥a zapomnieniu, aø w koÒcu nikt juø jej nie wznosi≥. Oby juø nigdy w KrÛlestwie Myrtany jej s≥owa nie rozleg≥y siÍ na nowo po lasach i skalnych ostÍpachÖ");

B_LogEntry(BookLog_IsNomineVacans,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI . TOM I

// SUGEROWANA LOKACJA: G”RSKA FORTECA

// NIEDOST PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian1 (C_ITEM)

{

name ="Jaszczurze plemiÍ. Tom I";

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

Doc_PrintLines( nDocID,  0, "Jaszczurze plemiÍ. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksiπg traktujπcych o smokach, jaszczurocz≥ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian1,LOG_NOTE);

B_LogEntry(BookLog_Draconian1,"Jaszczurze plemiÍ. Tom I");

B_LogEntry(BookLog_Draconian1,"Kwestia, ktÛrej poúwiÍci≥em owπ ksiÍgÍ, nurtowa≥a mnie od wielu lat i jest owocem mozolnych badaÒ jakich siÍ dla jej zg≥Íbienia podjπ≥em. O zagadkowym rodzaju gadzich istot mia≥em okazjÍ us≥yszeÊ niejednokrotnie juø za m≥odu, gdy wÍdrowni bardowie przybywali na gocki zamek mego pana ñ krÛla Endricka. Dane mi by≥o wtedy poznaÊ pieúni o bohaterach z zamierzch≥ej przesz≥oúci, ktÛre musia≥y nieúÊ w sobie echa wydarzeÒ z zamierzch≥ej, czÍsto jeszcze plemiennej przesz≥oúci. Wybuja≥a wyobraünia kolejnych pokoleÒ wÍdrownych poetÛw musia≥a je jednak zniekszta≥ciÊ. By≥y wúrÛd nich takøe opowieúci o smokach.");

B_LogEntry(BookLog_Draconian1,"RÛwnieø stare ksiÍgi traktujπce o owych gadach dostarcza≥y sprzecznych informacji. Gdy w jednych te istoty mia≥y byÊ ogromnymi gadami, ziejπcymi ogniem, to w innych jawi≥y siÍ jako øyjπce w plemionach dwunoøne humanoidy. Zdarza≥y siÍ takøe takie legendy i wzmianki, gdzie wystÍpowa≥y oba rodzaje smokÛw. Z czego wynika≥y rÛønice w opisach? Czy walki ze smokami, lub smoczymi plemionami sπ jedynie echem walk toczonych miÍdzy ludümi? Czy moøe zwyciÍzcy dopiero z czasem oblekli pokonanych w gadzie skÛry? A moøe niektÛre szczepy s≥uøy≥y smokom, zyskujπc przez to miano smoczych? Pytania te czeka≥y na odpowiedü.");

B_LogEntry(BookLog_Draconian1,"Wertujπc kolejne ksiÍgi i pergaminy, zaczπ≥em sobie uúwiadamiaÊ, øe legendy i kroniki opisujπ co najmniej dwa gatunki smoczych istot. Los by≥ dla mnie ≥askawy, gdyø jako nadworny bibliotekarz krÛla Edricka I mog≥em prosiÊ mego w≥adcÍ o pomoc w dostÍpie do ksiÍgozbiorÛw miast podleg≥ych wielkiej Gocie. A by≥o to krÛlestwo obejmujπce ca≥π JelkalÍ, w tym takøe VelukÍ i pobierajπce daniny od wielu wodzÛw plemiennych. Nie dziwi wiÍc, øe sπsiedni w≥adcy obawiajπc siÍ potÍønego krÛla, starali siÍ pozyskaÊ jego przychylnoúÊ. DziÍki ≥asce Endricka I, otwiera≥o mi to wrota do niemal kaødej biblioteki w Myrtanie.");

B_LogEntry(BookLog_Draconian1,"Jednak wieloletnie badania, choÊ nie bezowocne, nie da≥y mi tyle, co jedno, ale za to waøne odkrycie. Studiujπc kolejne ksiÍgi, coraz czÍúciej natrafi≥em na pojedyncze wzmianki o skale, na ktÛrej w zamierzch≥ej przesz≥oúci miano jakoby uwieczniÊ dzieje smoczego rodzaju. Chwilowa radoúÊ, prÍdko jednak ustÍpowa≥a zwπtpieniu, ktÛre choÊ wtedy by≥o uzasadnione, to dziú cieszÍ siÍ, øe mu nie uleg≥em. Mia≥em oto jedynie wπtpliwe wzmianki o pewnej staroøytnej skale, ktÛra stanowi≥a obietnicÍ rozwik≥ania choÊ w czÍúci owej nurtujπcej mnie od lat zagadki.");

B_LogEntry(BookLog_Draconian1,"SÍk w tym, øe nie by≥o pewne, czy ta ska≥a na ktÛrej ponoÊ wykuto historiÍ owych mitycznych stworzeÒ w ogÛle istnia≥a. Jeøeli przecieø istnia≥a, to mog≥a nie dotrwaÊ do naszych czasÛw. Nie mia≥em teø pewnoúci, czy wyryte na skale wizerunki nie bÍdπ po prostu zwyk≥ymi obrazkami, czy jakπú kolejnπ legendπ. Istnienie tej konstrukcji poúwiadcza≥y tylko wzmianki z wielowiekowych, sypiπcych siÍ juø pergaminÛw, zaú bliøsze moim czasom zapisy na ten temat uparcie milcza≥y. Z mglistych wskazÛwek wywnioskowa≥em, øe poszukiwania powinienem rozpoczπÊ w Dhirim ñ kraju od wiekÛw zamieszka≥ym przez lud GuldernÛw.");

B_LogEntry(BookLog_Draconian1,"Podsumowujπc, nie wiedzia≥em gdzie dok≥adnie owa úciana siÍ znajduje, nie wiedzia≥em co w≥aúciwie zawiera, nie wiedzia≥em czy jej odnalezienie wniesie cokolwiek do nauki, nie wiedzia≥em wreszcie czy ona w ogÛle istnieje!†Postanowi≥em jednak podjπÊ siÍ tropu zes≥anego przez los, nie baczπc na te wπtpliwoúci.");

B_LogEntry(BookLog_Draconian1,"PrÛba lokalizacji poszukiwanego obiektu nie by≥a ≥atwa. Od wiekÛw nikt o tej skale nie wspomina≥, ani tym bardziej nie oglπda≥ na oczy. Za zgodπ krÛla Edricka opuúci≥em dwÛr i ruszy≥em w d≥ugπ drogÍ ku krajom na zachodzie Kontynentu. Jak siÍ okaza≥o, mia≥em tam spÍdziÊ kolejne kilkanaúcie lat mego øycia.");

B_LogEntry(BookLog_Draconian1,"Przybywszy na dwÛr krÛla Dhirim, Almera II, stawi≥em siÍ przed jego obliczem. W≥adca GuldernÛw nie by≥ mi zbytnio przychylny, gdyø podobnie jak jego poddani, uwaøa≥, øe pragnÍ wydrzeÊ i ukraúÊ skarby ich ziemi. Podobnie myúleli teø moøni, jakimi Almer siÍ otacza≥. Nie úmieli jednak siÍ sprzeciwiaÊ Gocie. Mimo niechÍci dworu i ludu, zdo≥a≥em sobie zjednaÊ mir wúrÛd gulderyjskich uczonych i czÍúci magÛw. Ciekawi wyniku moich badaÒ, chÍtnie s≥uøyli mi swπ wiedzπ i goúcinπ. Wiedzieli, øe moje dociekania mogπ przyczyniÊ siÍ do lepszego poznania historii ziem zamieszkanych przez ich lud. Jestem im za to wdziÍczny.");

B_LogEntry(BookLog_Draconian1,"KONIEC TOMU I");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI . TOM II

// SUGEROWANA LOKACJA: G”RSKA FORTECA

// NIEDOST PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////


INSTANCE ItWr_Draconian2 (C_ITEM)

{

name ="Jaszczurze plemiÍ. Tom II";

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

Doc_PrintLines( nDocID,  0, "Jaszczurze plemiÍ. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksiπg traktujπcych o smokach, jaszczurocz≥ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian2,LOG_NOTE);

B_LogEntry(BookLog_Draconian2,"Jaszczurze plemiÍ. Tom II");

B_LogEntry(BookLog_Draconian2,"Poszukiwania trwa≥y lat osiem i zawiod≥y mnie na pÛ≥nocny zachÛd od stolicy KrÛlestwa Dhirim. Opierajπc siÍ na wiadomoúciach jakich dostarczy≥ mi pisma z Bibliotece KrÛlewskiej w Geldern, ruszy≥em ku wiosce Guldar. MieszkaÒcy owej osady praktykowali z dawna dziwny zwyczaj, ktÛry przyku≥ mojπ uwagÍ. OtÛø mieszkaÒcy tej wioski co roku zanosili w uroczystym orszaku,  zgromadzonπ w beczkach zwierzÍcπ krew do okolicznych jaskiÒ i jπ tam wylewali. Z obrzÍdem tym wiπza≥a siÍ pewna legenda, g≥oszπca, øe w przesz≥oúci ziemie przodkÛw mieszkaÒcÛw wsi by≥y nawiedzane przez gady, ktÛre atakowa≥y ludzi i zwierzÍta. Gady te mia≥y mieÊ w owych jaskiniach swoje leøe. Jednak, gdy wiele pokoleÒ temu ich dziadowie zawarli przymierze z jaszczurami, te juø wiÍcej nie niepokoi≥y wioski. Warunkiem przymierza mia≥a byÊ daÒ z≥oøona z kwi zwierzÍcej, ktÛra mia≥a nasyciÊ bestie. Od tej pory mieszkaÒcy co roku dokonujπ tego obrzÍdu.");

B_LogEntry(BookLog_Draconian2,"Jako naukowiec postanowi≥em zbadaÊ te jamy. Jak siÍ mia≥em niebawem przekonaÊ úciany z jednej z nich pokryte by≥y malowid≥ami przedstawiajπcymi humanoidalne gady. Wiedzia≥em, øe jestem na w≥aúciwej drodze. W ciπgu piÍciu miesiÍcy odkry≥em po≥oøenie ska≥y dziejÛw - znajdowa≥a siÍ ona g≥Íboko pod ziemiπ.†PiÍÊ lat trwa≥o wydobywanie jej na powierzchnie. Powoli ods≥ania≥y siÍ przed nami kolejne rysunki i malowid≥a, odkrywajπce przed naszymi oczyma prawdÍ o tych pradawnych istotach. Juø pobieøny oglπd tablicy potwierdzi≥ moje przypuszczenia. Gady z opowieúci i kronik nie sπ wytworem wyobraüni!");

B_LogEntry(BookLog_Draconian2,"Z tym, øe nie naleøa≥oby mÛwiÊ o jednym, lecz przynajmniej o trzech gatunkach tych stworzeÒ. Pierwszπ ich odmianπ jest smok w≥aúciwy, zwany teø patriarchalnym. Sπ to ogromnych rozmiarÛw jaszczury, potrafiπce lataÊ i ziaÊ ogniem. Jako najpotÍøniejsze z nich, majπ byÊ rÛwnieø przodkami pozosta≥ych dwÛch odmian. Ten rodzaj smoka mia≥ byÊ nader inteligentnym stworzeniem, w≥adajπcym magiπ, a przy tym czczonym przez trzeciπ z opisanych tu odmian.");

B_LogEntry(BookLog_Draconian2,"Drugπ sπ smoki pomniejsze zwane ømijcami, czyli tÍpe zwierzÍta, pozbawione magicznej mocy i o wiele mniejsze od smokÛw w≥aúciwych. To w≥aúnie ømijce sπ ulubionym elementem opowieúci rycerskich, w ktÛrych úmia≥kowie w lúniπcych zbrojach uwalniajπ ludzi spod smoczego jarzma.");

B_LogEntry(BookLog_Draconian2,"Trzecim i zdecydowanie najciekawszym rodzajem sπ jaszczuroludzie, ktÛrzy sπ po≥πczeniem gada i cz≥owieka. Wzrost jaszczurocz≥eka porÛwnywalny by≥ ze wzrostem orka. By≥y to istoty inteligentne i sπ zdolne nawet do stworzenia w≥asnej cywilizacji. åwiadectwem tego jest choÊby owa monumentalna wykuta przez nich p≥yta, z ktÛrej czerpiÍ o nich wiedzÍ wiedze, czy ruiny miasta rozpoúcierajπce siÍ u podnÛøy ska≥.");

B_LogEntry(BookLog_Draconian2,"Powiedziano tu juø, øe jaszczuroludzie otacza≥y kultem smoki patriarchalne. To jednak nie wyczerpuje tematu zaleønoúci miÍdzy tymi dwiema odmianami. Zwiπzek miÍdzy nimi by≥ o wiele wiÍkszy i úciúlejszy niø miÍdzy bÛstwem i cz≥owiekiem. Dla jaszczuroludzi smoki w≥aúciwe nie by≥y jedynie przedmiotem kultu. Wed≥ug gadzich wierzeÒ kaødy jaszczurocz≥ek ma byÊ bezpoúrednim potomkiem smoka. Poniewaø smoki patriarchalne nie sπ mieszkaÒcami tego úwiata, to ≥πcznoúÊ z nimi jest moøliwa jedynie poprzez trans, jakiemu poddajπ siÍ kap≥anki. W jego wyniku sk≥adane sπ jaja z potomstwem smoka patronujπcego plemieniu. Tak w≥aúnie mia≥y przychodziÊ na úwiat kolejne pokolenia jaszczurocz≥ekÛw. Moøliwe teø, øe czczone przez jaszczuroludzi smoki nie by≥y tworami rzeczywistymi, lecz zmyúlonymi dla potrzeby mitu istotami. NastÍpstwem takiego przypuszczenia by≥oby stwierdzenie, øe wúrÛd jaszczuroludzi odbywa≥o siÍ dzieworÛdztwo.");

B_LogEntry(BookLog_Draconian2,"KONIEC TOMU II");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI . TOM III

// SUGEROWANA LOKACJA: G”RSKA FORTECA

// NIEDOST PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian3 (C_ITEM)

{

name ="Jaszczurze plemiÍ. Tom III";

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

Doc_PrintLines( nDocID,  0, "Jaszczurze plemiÍ. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksiπg traktujπcych o smokach, jaszczurocz≥ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworzeÒ]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian3,LOG_NOTE);

B_LogEntry(BookLog_Draconian3,"Jaszczurze plemiÍ. Tom III");

B_LogEntry(BookLog_Draconian3,"WúrÛd jaszczuroludzi, samice stanowi≥y jedynie niewielkπ czÍúÊ populacji. Nie uw≥acza≥o to jednak ich roli, gdyø jako kap≥anki sta≥y na czele plemienia i to one porozumiewaÊ siÍ mia≥y ze smokiem-patronem. Do szamanek naleøa≥o teø wyznaczanie wodza, ktÛry w czasie wojny stawa≥ na czele plemienia. Jaszczuroludzie byli spo≥eczeÒstwem podzielonym na kasty. OprÛcz kap≥anek, plemiÍ tworzπ zaopatrujπcy wspÛlnotÍ w øywnoúÊ myúliwi oraz wojownicy. W momencie zagroøenia obie te kasty podejmujπ siÍ walki w obronie szczepu. ChoÊ nie znali oni rolnictwa, to nieobca im by≥a hodowla zwierzπt (m.in. úwiÒ, czy dzikich psÛw, ale takøe swych pobratymcÛw - smokÛw-ømijcÛw). Zdarza≥o siÍ nawet, øe w ≥apali ludzi i zmuszali ich do prac w swych osadach. Taka forma niewolnictwa nasili≥a siÍ szczegÛlnie w czasach istnienia krÛlestwa.");

B_LogEntry(BookLog_Draconian3,"WrÛÊmy na chwilÍ do ich mitologii, ktÛra wydaje siÍ wspÛlna dla ca≥ego gatunku. OtÛø kaøde plemiÍ uwaøa≥o siÍ za przodka jednego ze smokÛw, choÊ zdarza≥o siÍ, øe kilka szczepÛw mia≥o wspÛlnego patrona. Dane plemiÍ czczπc swego ojca, choÊ uznawa≥o realnoúÊ innych, to nie widzia≥o potrzeby oddawania im czci.  Same smoki patriarchalne rÛwnieø majπ mieÊ wspÛlnego ojca, ktÛry by≥ pierwszym spoúrÛd nich. Jego imiÍ to Hirad, lub Hirad-Khor. Mia≥ on przed wiekami zostaÊ stworzony przez niepodzielonego jeszcze Innosa. Zbuntowawszy siÍ przeciw Innosowi, mia≥ swπ klÍskÍ przyp≥aciÊ wiecznym wiÍzieniem w KrÛlestwie Beliara.");

B_LogEntry(BookLog_Draconian3,"Obecny w mitologii jaszczuroludzi wπtek buntu przeciw pierwszemu z bogÛw, jest szczegÛlnie ciekawy w úwietle teorii g≥oszonych przez niektÛrych uczonych. Niepodzielony jeszcze Innos mia≥ powo≥aÊ do øycia stworzenia zwane Przedwiecznymi Istotami. Mia≥y byÊ, wed≥ug heretykÛw, najpotÍøniejszymi istotami jakie kiedykolwiek stworzono, gdyø powsta≥y one w czasach skumulowanej mocy rozdzielonej obecnie na Innosa, Beliara i Adanosa. ZostawiÍ jednak herezjarchÛw z ich wywodami i powrÛcÍ juø do tego, co stanowi w≥aúciwy przedmiot moich dociekaÒ.");

B_LogEntry(BookLog_Draconian3,"Jedynym potomstwem pierwszego smoka by≥y smoki patriarchalne, ktÛre da≥y poczπtek jaszczurocz≥ekom i sta≥y siÍ patronami jaszczurzych plemion. Od chwili uwiÍzienia Hirad-Hora wiÍcej smoczych patriarchÛw mia≥o siÍ juø nie pojawiÊ, gdyø øaden z bogÛw nie pragnπ≥ uwolnienia i powrotu tej potÍønej istoty.");

B_LogEntry(BookLog_Draconian3,"OmÛwiwszy dwa spoúrÛd rodzajÛw smoczych gadÛw, przyszed≥ czas by przyjrzeÊ siÍ owym ømijcom. ChoÊ rÛøniπ siÍ od dwÛch opisanych wczeúniej, to jednak ich pochodzenie ≥πczy je silnie z jaszczuroludümi i smokami-patriarszymu. Jak moøna odczytaÊ ze ska≥y dziejÛw, niekiedy szamanki wydawa≥y teø ømijcÛw na úwiat. ChoÊ ømijce pochodzπ od jaszczuroludzi, to w przeciwieÒstwie do nich, sπ w stanie ≥πczyÊ siÍ z osobnikami sobie podobnymi i wydawaÊ p≥odne potomstwo. ZwierzÍta te øy≥y zarÛwno wúrÛd jaszczuroludzi pe≥niπc rolÍ zwierzπt bojowych, niekiedy nawet otaczane szacunkiem. Inne zamieszkiwa≥y jaskinie i lasy.");

B_LogEntry(BookLog_Draconian3,"KONIEC TOMU III");

};
/////////////////////////////////////////////////////////////////////

// JASZCZURZE PLEMI . TOM IV

// SUGEROWANA LOKACJA: G”RSKA FORTECA

// NIEDOST PNA U HANDLARZY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Draconian4 (C_ITEM)

{

name ="Jaszczurze plemiÍ. Tom IV";

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

Doc_PrintLines( nDocID,  0, "Jaszczurze plemiÍ. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Jedna z pierwszych ksiπg traktujπcych o smokach, jaszczurocz≥ekach i smokach pomniejszych, napisana przez badacza historii i natury tych stworzeÒ.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Draconian4,LOG_NOTE);

B_LogEntry(BookLog_Draconian4,"Jaszczurze plemiÍ. Tom IV");

B_LogEntry(BookLog_Draconian4,"W przesz≥oúci jaszczuroludzie mieli toczyÊ wiele wojen, tak z ludümi, jak i z plemionami swych pobratymcÛw. Podczas nich zdarzaÊ siÍ mia≥o, øe zagroøone klan przyzywa≥ na ziemiÍ swego patrona, by wspomÛg≥ ich w walce. Czasami przywo≥ane na úwiat ginÍ≥y w czasie bitew, lub by≥y zabijane przez bohaterÛw. åmierÊ patrona mia≥a skazywaÊ plemiÍ na zag≥adÍ, choÊ niekiedy taki szczep oddawa≥ siÍ pod opiekÍ innego smoka patriarchalnego. To pozwala≥o zachowaÊ istnienie klanu.");

B_LogEntry(BookLog_Draconian4,"W dawnych czasach, na d≥ugo przed powo≥aniem Wiecznego WÍdrowca, jaszczuroludzie mieli stworzyÊ na zachodzie kontynentu krÛlestwo, ≥πczπce wiele plemion. ChoÊ posiada≥o jednego krÛla, to w istocie by≥o jedynie konfederacjπ, ktÛra mimo to mia≥a przetrwaÊ oko≥o stu lat. Niewiele wiadomo o tym paÒstwie, prÛcz tego, øe w stolicy rezydowa≥o czterech wodzÛw pochodzπcych z najsilniejszych szczepÛw. CzÍúÊ jednak plemion pragnÍ≥a odebraÊ szamanki mniej licznym szczepom i oddaÊ je na s≥uøbÍ swoim patronom. Wskutek walk wewnÍtrznych, KrÛlestwo siÍ rozpad≥o.");

B_LogEntry(BookLog_Draconian4,"Ma≥o wiemy o dalszych losach jaszczuroludzi, gdyø powrÛt do plemiennoúci nie sprzyja≥ rozwojowi pisma.†Wiadomo tylko, øe byli czÍúciπ si≥ beliaryckich w epoce Pradawnych. PÛüniejszy o wiele wiekÛw wysyp pieúni o wyprawach na jaszczuroludzi jest zapewne echem walk plemion ludzkich z jaszczurzymi.");

B_LogEntry(BookLog_Draconian4,"Czy smocze gady sπ wiÍc gatunkiem wymar≥ym? Wola≥bym unikaÊ tak kategorycznych stwierdzeÒ. Wobec pog≥osek dochodzπcych z po≥udniowych kraÒcÛw Varantu, odpowiem wiÍc nieco wymijajπco. ZarÛwno jaszczuroludzie, jak i ømijce na terenie zielonej Myrtany i ca≥ego znanego nam úwiata naleøy uznaÊ za wymar≥y.");

B_LogEntry(BookLog_Draconian4,"Na tym koÒczÍ wywÛd o dziejach i kulturze tego fascynujπcego gatunku. Mimo jednak 29 lat badaÒ, poúwiÍci≥em tym badaniom, nauka o tych stworzeniach jest dopiero w powijakach. Majπc juø niewiele øycia przed sobπ, pragnÍ by dzie≥o to by≥o podjÍte i kontynuowane przez nastÍpne pokolenia badaczy...");

B_LogEntry(BookLog_Draconian4,"KONIEC TOMU IV, OSTATNIEGO");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant1,"Dzieje Varantu. Tom I");

B_LogEntry(BookLog_HistoryOfVarant1,"O, Imperium Prastare!†PiÍkno Twe przez piaski pustyni rzewnie zasypane; Twe dzieje z g≥Íbi wiekÛw na nowo dziú przywo≥ane! Niechaj Ty, ktÛre rÍkπ gniewnego Adanosa na zag≥adÍ skazane; W pieúni chwalebnej, piÛrem kronikarza øywym przez chwilÍ siÍ stanie! O wielkie monarchy, Innosa dawne s≥ugi!Od Wiecznego WÍdrowca wyúcie Pana Ognia wybraÒce; Dziú za sprawπ dziejopisa; Na ziemski padÛ≥ powracajcie!  A Ty spÛjrz cz≥owiecze, spÛjrzcie po wiekach nastÍpujπcy po nich potomni; S≥ysz modlitwÍ piachu i modlitwÍ wiekÛw, niech pamiÍÊ o Imperium nigdy nie ustπpi. ");

B_LogEntry(BookLog_HistoryOfVarant1,"W czasach zamierzch≥ych, gdy úwiat by≥ jeszcze m≥odym, wszelki duch ziemie zamieszkujπcy przed Innosem i Adanosem bi≥ pok≥ony i mod≥y poboøne ku nim zanosi≥. NastÍpowa≥y wiÍc po sobie kolejne pokolenia, mija≥y lata i wieki, oddalajπc ludzkoúÊ od pierwotnej czystoúci i prawdy. Piach zapomnienia zakrywa≥ z wolna pamiÍÊ o latach b≥ogos≥awionych, gdy ludzie øyli w prawdzie i w szczÍúciu. Z pokolenia na pokolenie rodzaj cz≥owieczy z drogi prawoúci coraz bardziej zstÍpowa≥ i w bezeceÒstwie siÍ pogrπøa≥.");

B_LogEntry(BookLog_HistoryOfVarant1,"W swym zapomnieniu ludzie zwrÛcili swe serca ku ba≥wanom, ktÛre sobie uczynili i ku demonom nieczystym, ktÛre zwiod≥y wielu.†I nasta≥y czasy, gdy w b≥Ídzie pogaÒstwa pogrπøy≥y siÍ niemal wszystkie ludy. Jedynie nieliczni pozostali wierni prawdziwym bogom, doznajπc przez to z rπk ba≥wochwalcÛw krzyw wiele i ucisku. Powo≥a≥ wiÍc Innos jednego spoúrÛd prawych, by wyruszy≥ ku krajom b≥πdzπcym. Nakaza≥ mu opuúciÊ dom swÛj rodzinny i udaÊ siÍ z innosyckim pos≥annictwem do szczepÛw pogrπøonych w odstÍpstwie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Zostawiwszy dom ojca swego, cz≥owiek sta≥ siÍ Wiecznym WÍdrowcem i nauczycielem ludÛw. Przemierza≥ odtπd ca≥y øyzny Varant z uczniami swemi, rozjaúniajπc mroki pogaÒskiego zabobonu. NiÛs≥ on oczyszczenie s≥owem i ogniem, s≥awiπc imiÍ Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant1,"I przemierza≥ Wieczny WÍdrowiec Varant przez lat siedemnaúcie i szeúÊdziesiπt osiem dni, a wielu za jego sprawπ odmieni≥o swπ wiarÍ i porzuci≥o b≥Ídy pogaÒstwa. Ros≥a wiÍc liczba tych, ktÛrych Wieczny WÍdrowiec prowadzi≥.");

B_LogEntry(BookLog_HistoryOfVarant1,"Wejrza≥ wtedy Innos na coraz liczniejsze szeregi podπøajπcych za nauczycielem ludÛw i uzna≥, øe Wieczny WÍdrowiec gotÛw jest juø wype≥niÊ swoje przeznaczenie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Pan Ognia przeto powtÛrnie przemÛwi≥ do Wiecznego WÍdrowca: 'Od≥Ûø swÛj Kostur', a w jego miejsce Innos da≥ mu Ber≥o i Wieczny WÍdrowiec zosta≥ Jego s≥ugπ. Tak oto Wieczny WÍdrowiec przesta≥ byÊ tu≥aczym pielgrzymem, a sta≥ siÍ wybraÒcem i namiestnikiem Innosa na ziemi.");

B_LogEntry(BookLog_HistoryOfVarant1,"On to mia≥ przywrÛciÊ ziemiÍ varanckπ prawdziwym bogom i zaprowadziÊ krÛlestwo Innosa na ziemiÖ");

B_LogEntry(BookLog_HistoryOfVarant1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant2,"Dzieje Varantu. Tom II");

B_LogEntry(BookLog_HistoryOfVarant2,"Ujrza≥ tedy Beliar, øe Innos pragnie zaprowadziÊ swoje krÛlestwo w Varancie i uczyniÊ ziemie varanckπ pos≥usznπ swemu s≥owu. I p≥onπ≥ gniew Beliara, a cieÒ jego pad≥ w serca czcicieli Pana Ciemnoúci. ");

B_LogEntry(BookLog_HistoryOfVarant2,"I przebudzili siÍ szamani orkowych szczepÛw, a szczepy ich jednoczy≥y siÍ pod czarnymi sztandarami Mrocznego Boga. Na wezwanie Beliara odpowiedzia≥y plemiona prastarej rasy jaszczuroludzi, przezywanej teø od ojca ich ojcÛw Hiradhorianami, lub Hiradami. ");

B_LogEntry(BookLog_HistoryOfVarant2,"PoúrÛd si≥ cienia znaleüli siÍ teø odszczepieÒcy, ktÛrzy czeúÊ oddawali demonom i rozmaitym ba≥wanom. Ci za podszeptem czczonych bestii, ktÛre nÍdznymi s≥ugami by≥y Beliara, przystali do wrogÛw Innosa. Pod sztandar cienia wspÛlny przybyli rÛwnieø sojusznicy, ktÛrzy nie z czci dla Beliara na düwiÍk czarnego rogu odpowiedzieli, ino ze strachu przed zwyciÍstwem Pana Ognia. Ci oto w rosnπcej potÍdze wyznawcÛw Innosa widzieli zagroøenie dla swych fa≥szywych bogÛw.");

B_LogEntry(BookLog_HistoryOfVarant2,"I trwa≥y wojny krwawe lat wiele, i w rwπcej szkar≥atnej rzece ≥πczy≥a siÍ krew wrogÛw úmiertelnych. W jednym ponurym biegu spajajπc tych, ktÛrych nienawiúÊ wyznawanych bogÛw dzieli≥a. ");

B_LogEntry(BookLog_HistoryOfVarant2,"Przeminπ≥ øywot Wiecznego WÍdrowca i trafi≥ on do niebios, gdy w czasie jednej z bitew przez wrogÛw bÍdπc osaczonym, rÍkπ Innosa zosta≥ øywcem zabrany do wiecznoúci. Tak oto Pan Ognia nagrodzi≥ Swego s≥ugÍ. Po nim panowa≥ Akheld ñ syn jego, zaú brat Akhelda - †Semmir zakoÒczy≥ wojnÍ za sprawπ úwiÍtych relikwii danych mu przez Adanosa. DziÍki nim rozgromiono ostatecznie armiÍ wszetecznego wroga i skalano jego obrzydliwe gniazdo w Eresh-Ugall na po≥udniu, a niedobitki paskudztwa wygnano z Varantu.");

B_LogEntry(BookLog_HistoryOfVarant2,"Po nim nasta≥y kolejne pokolenia krÛlÛw, panujπcych w s≥odkim Varancie z wyøyn tronu miasta Al.-Shedim. NastÍpujπcy kolejno w≥adcy budowali KrÛlestwo Innosa, wznoszπc wspania≥e úwiπtynie ku czci ukochanego przez nich Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant2,"Niech s≥awiπ siÍ imiona dwÛch synÛw Semmirowych Akhelda II i Tellosa I,†ZwyciÍskich w≥adcÛw, co wielki najazd barbarzyÒskiego PraveÒczyka odpierali!†Niech po wsze czasy przetrwa imiÍ walecznego i dzielnego krÛla, Teminnara;†Co Trellium pogaÒstwu bezecnemu wydar≥ i do o≥tarza Innnosa do≥πczy≥.†Chwa≥a Seminnarowi III co Velucii przyniÛs≥ imiÍ Innosowe!†Chwa≥a Tellosowi III co kraj PraveÒczykÛw uczyni≥ sobie pos≥usznym!†Chwa≥a budowniczym úwiπtyÒ i w≥adcom wiekÛw dawnych!†");

B_LogEntry(BookLog_HistoryOfVarant2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant3,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant3,"Dzieje Varantu. Tom III");

B_LogEntry(BookLog_HistoryOfVarant3,"Nadszed≥ zmierzch øycia Tellosa III, ktÛry to doøywszy wieku sÍdziwego, nie doczeka≥ siÍ upragnionego dziedzica. Dopiero, gdy duch dobrego w≥adcy opuúci≥ leciwe cia≥o, na úwiat przyszed≥ syn jego i jedyny nastÍpca varanckiego tronu. Pogrobowiec otrzyma≥ imiÍ ojca, pragnπc by wszelkie ≥aski jakie sp≥ynÍ≥y na wielkiego rodzica, sta≥y siÍ udzia≥em dziedzica korony. MπdroúÊ, zwyciÍstwo i d≥ugowiecznoúÊ ñ oto b≥ogos≥awieÒstwa panowania Tellosa III.");

B_LogEntry(BookLog_HistoryOfVarant3,"Los jednak chcia≥ by tylko spoúrÛd tych trzech b≥ogos≥awieÒstw zyska≥ czwarty w≥adca tego imienia. Z nadziejπ poddani wyczekiwali dnia, w ktÛrym m≥ody krÛl przejmie samodzielne rzπdy, gdyø mπdroúÊ i wiedza ch≥opca zapowiada≥a b≥ogos≥awione panowanie. Mieliúmy wielkich w≥adcÛw ñ powiada≥ podÛwczas lud Varantu ñ ktÛrzy uczynili nasz kraj wielkim i potÍønym. Ten jednak pomnoøy tπ potÍgÍ jak nikt przed nim i Imperium Innosa siÍgnie podnÛøy skutych lodem gÛr Nordmaru!");

B_LogEntry(BookLog_HistoryOfVarant3,"W dziewiπtym roku regencji st≥umiono powstanie PraveÒczykÛw, ktÛrzy prÛbowali oderwaÊ siÍ na powrÛt od Innosyckiego Imperium. Pobito i zmuszono do odejúcia takøe pogaÒskich JelkalÛw z pÛ≥nocnych lasÛw, ktÛrzy wyszyli ze swych siedzib, by wesprzeÊ bunt ludÛw wybrzeøa. Tak oto udzia≥em tego panowania sta≥o siÍ zwyciÍstwo, ktÛre wszyscy poczytywali za zapowiedü przysz≥ych pomyúlnoúci.†Nie dane jednak by≥o Tellosowi IV spe≥niÊ pok≥adanych w nim nadziei, gdyø w czternastym roku swego øywota zapad≥ ciÍøko na zdrowiu. PonoÊ zawaøy≥ tu ciÍøki grzech jego rodzicielki ñ Nasiry, ktÛra wzgardziwszy pamiÍciπ swego zmar≥ego mÍøa, odda≥a swe serce jednemu z moønych panÛw Imperium. Bogowie ukarali niewiernπ øonÍ úmierciπ jej jedynego syna. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Tak oto przez wzglπd na wielkie czyny potomkÛw Tellosa IV, nie dane mu by≥o oglπdaÊ juø wiÍcej sromoty jakiej dopuúci≥a siÍ jego rodzicielka. Zmoøony chorobπ i trawiony okropnπ gorπczkπ m≥odziutki w≥adca, odszed≥ do wiecznoúci, nie objπwszy samodzielnych rzπdÛw. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Na Tellosie IV wygas≥a pradawna dynastia AkhelidÛw, wywodzπca siÍ od Wiecznego WÍdrowca. Dawni krÛlowie zasnÍli b≥ogos≥awionym snem nieprzespanym, ≥πczπc siÍ na wieki z Innosem ñ bogiem, ktÛremu wszyscy oni s≥uøyli.†Rozpacz niewys≥owiona wla≥a siÍ w serca dumnego ludu Varantu. Oto odeszli panowie przyrodzeni, w≥adcy nasi i opiekunowie! ñ mÛwili Varantczycy - KtÛø nad nich by≥ wyøszy i ktÛø im rÛwnym byÊ moøe?");

B_LogEntry(BookLog_HistoryOfVarant3,"KONIEC TOMU III");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant4,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant4,"Dzieje Varantu. Tom IV");

B_LogEntry(BookLog_HistoryOfVarant4,"Smutek i øa≥oba po úmierci m≥odziutkiego pogrobowca, niebawem ustπpi≥y szczÍkowi orÍøa i wojennej poøodze. Oto wy≥onili siÍ kolejni pretendenci, ksiπøÍta, panowie, ktÛrzy topiπc kraj we krwi walk pobratymczych, wyrπbywali swπ drogÍ do ber≥a Varantu. Wygranπ mia≥a byÊ tutaj upragniona korona dla jednego z panÛw varanckich, a cenÍ za ambicjÍ moønych p≥aci≥o Imperium i sami Varantczycy. Ileø to z≥a wywo≥a≥ jeden postÍpek niewiernej krÛlowej Nasiry!");

B_LogEntry(BookLog_HistoryOfVarant4,"Niebawem w wielkiej haÒbie od Imperium odpad≥o Praven, ktÛre niegdyú Tellos III zdoby≥ i przyprowadzi≥ pod o≥tarz Innosowy. BarbarzyÒcy dokonali rzezi MagÛw Ognia i rozbili úwiÍte posπgi, bezczeszczπc úwiπtynie i oddajπc owe úwiÍte przybytki pogaÒskim ba≥wanom. Najazd JelkalÛw, SundmarczykÛw i GuldernÛw nawiedzi≥ ziemie Veluki, straszliwie je pustoszπc. DziÍki ≥asce Innosa osta≥o siÍ jednak miasto, w ktÛrym przed ostrzem barbarzyÒcy schroni≥o siÍ wielu. Warowni veluckiej, ktÛra w przysz≥oúci otrzyma imiÍ Monteriusa, a zdobytej niegdyú przez Semmira III, broni≥ patriarcha innosycki Mergellon, co bratem by≥ niewiernej krÛlowej.†");

B_LogEntry(BookLog_HistoryOfVarant4,"Nasta≥y straszliwe lata wojen i poøogi. Oto Innosyta morduje InnosytÍ, czyniπc to z rÛwnπ zaciek≥oúciπ i okrucieÒstwem, jakoby czyni≥ to barbarzyÒca. Ujrza≥y s≥aboúÊ Varantu pogaÒskie plemiona i jak hieny ruszy≥y na ranionego lwa, by na jego ciele urzπdziÊ sobie ucztÍ. I nie by≥o krainy w Imperium, gdzie by nie s≥yszano rogu poprzedzajπcego pochÛd wszelakiego barbarzyÒcy. Owe plemiona przybywa≥y nie tylko wiedzione øπdzπ z≥ota, ale teø wzywali ich liczni pretendenci.");

B_LogEntry(BookLog_HistoryOfVarant4,"Moøni pragnπc wykorzystaÊ barbarzyÒcÛw w walce o ber≥o Varantu, op≥acali ich nie z≥otem ze swych skarbcÛw, lecz krwiπ i cierpieniem poddanych Imperium. Chcecie z≥ota i zap≥aty, to weücie jπ z varanckich wiosek i miast!†Niechaj przeklÍci bÍdπ ksiπøÍta, co øyciem InnosytÛw kupczyli. Niechaj przeklÍci bÍdπ moøni panowie, co lud swÛj na pastwÍ barbarzyÒcy wydaliÖ");

B_LogEntry(BookLog_HistoryOfVarant4,"Magowie Ognia widzπc ogieÒ, jaki zap≥onπ≥ w Varrancie postanowili ukryÊ relikwie Adanosa w swych úwiπtyniach, by ni poganie, ni pretendenci do tronu ich swπ rÍkπ nie sprofanowali i do boju bratobÛjczego nie wykorzystali. Wszeteczni pretendenci gotowi byli jednak wyciπgnπÊ swe nieczyste rÍce po relikwie Adanosa, ktÛre niegdyú Pan Wody powierzy≥ Akheldowi I. Ci przyprowadzali swe wojska przed bramy miast úwiπtynnych, zbrojnie prÛbujπc zmusiÊ mÍøÛw Innosa do wydania úwiÍtych artefaktÛw, lecz bram úwiπtynnych nie przemogli.");

B_LogEntry(BookLog_HistoryOfVarant4,"Tak mija≥y lata pe≥ne niepokoju i wojen, wyniszczajπcych Imperium Varantu. PaÒstwa bÍdπcego dzie≥em Innosa i jego wybraÒcÛwÖ");

B_LogEntry(BookLog_HistoryOfVarant4,"KONIEC TOMU IV");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM V

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant5,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant5,"Dzieje Varantu. Tom V");

B_LogEntry(BookLog_HistoryOfVarant5,"Wojny trwa≥y d≥ugo. Spustoszono kraje Varantu, zasiano ziarno podzia≥u zatruwajπcego krew pobratymczπ. W tych latach úmierÊ zebra≥a nadzwyczaj sowite øniwo na ziemiach Imperium i na d≥ugo zamilk≥y hymny pochwalne na czeúÊ Innosa, ustÍpujπc b≥agalnym i pokutnym pieúniom. Nie godzi siÍ kalaÊ kart tej ksiÍgi imionami tej rzeszy moønych, ktÛrzy tyle nieszczÍúÊ na kraj swÛj sprowadzili. Niechaj teø imiÍ owego wszetecznika, z ktÛrym krÛlowa dopuúci≥a siÍ sromu, bÍdzie po wszystkie czasy zapomniane, co by w øadnej modlitwie ono nie pad≥o.");

B_LogEntry(BookLog_HistoryOfVarant5,"MinÍ≥o 12 lat ciÍøkiej wojny, gdy na stolicy zasiad≥ imperator. Duøo by opowiadaÊ o tym, co dzia≥o siÍ w czasach wojen. DoúÊ rzec, øe na tronie zasiad≥ cz≥owiek roztropny i mπdry. On to odrzuci≥ swe stare imiÍ i koronowa≥ siÍ jako Akheld III. Uczyni≥ on to na znak tego, øe jak pierwsi Akhelidzi budowali o≥tarz Pana Ognia, tak on go odnawia i do potÍgi zamierza przywrÛciÊ. Godny to czyn i pe≥ny pokory, gdyø w≥adca Ûw postanowi≥ budowaÊ chwa≥Í Imperium, nie zaú s≥awÍ swego imienia, czy rodu. Odrzuciwszy przeto imiÍ grzeszne i krwiπ pobratymczπ skalane, da≥ poczπtek dynastii Odnowicieli. Akheld III panowa≥ 27 lat, przywracajπc ≥ad tam, gdzie smuta porzπdek zburzy≥a.");

B_LogEntry(BookLog_HistoryOfVarant5,"Po nim panowa≥ jego syn co Kalhirem ObroÒcπ zosta≥ przezwany, albowiem powstrzyma≥ najazd barbarzyÒcÛw z Praven, p≥acπc za zwyciÍstwo w≥asnym øywotem. Podania g≥oszπ, øe w przededniu bitwy mia≥ widzenie. Ujrza≥ on Wiecznego Wedrowca, dzierøπcego w jednej rÍce tarczÍ, a w drugiej wagÍ. Kalhir us≥ysza≥, øe dopiero jego w≥asna krew uøyüniajπca pola wokÛ≥ Trellium, zapewni dwadzieúcia lat pokoju od napadÛw barbarzyÒcÛw z wybrzeøa. Majπc w pamiÍci s≥owa za≥oøyciela Imperium Varanckiego, Kalhir nazajutrz poprowadzi≥ swych øo≥nierzy do boju.");

B_LogEntry(BookLog_HistoryOfVarant5,"W czasie walk, szala zwyciÍstwa przechyli≥a siÍ na stronÍ PraveÒczykÛw, tak, øe doradcy poczÍli namawiaÊ w≥adcÍ, do tego by opuúci≥ pole bitwy. Ten siÍ jednak stanowczo siÍ sprzeciwi≥ tym radom. Wiedzπc, øe wygrana bitwa zapewni pokÛj Imperium, zebra≥ swych rozproszonych øo≥nierzy i ruszy≥ do ataku, w czasie ktÛrego poleg≥. Bitwa pozostawa≥a nierozstrzygniÍta, gdyø obie strony poniÛs≥szy dotkliwe straty, poniecha≥y dalszej walki.");

B_LogEntry(BookLog_HistoryOfVarant5,"Proroctwo jednak siÍ wype≥ni≥o i przez dwadzieúcia trzy lata ziemie Varantu nie widzia≥y najazdu PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant5,"KONIEC TOMU V");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant6,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant6,"Dzieje Varantu. Tom VI");

B_LogEntry(BookLog_HistoryOfVarant6,"Trzecim spoúrÛd w≥adcÛw z dynastii Odnowicieli by≥ Kalhir II, syn Kalhira I ObroÒcy. Ten powiÛd≥ raz jeszcze synÛw Varantu w kraj PraveÒczykÛw i wydar≥ im zachodniπ czÍúÊ wybrzeøa, gdzie wybudowa≥ warowny grÛd w Trellium. Pragnπ≥ teø ruszyÊ dalej, ku Jelkali i Nordmarowi, jednak moøni wyraünie siÍ temu sprzeciwiali, gdyø pragnÍli pokoju i obawiali siÍ wzrostu znaczenia imperatora.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nowa dynastia nie mia≥a jednak rÛwnie silnej pozycji, co Akhelidzi. Moøni panowie pragnÍli widzieÊ w Odnowicielach jedynie wyniesionych na wyøyny moønow≥adcÛw. Czynili przeto owym krÛlom wiele wstrÍtÛw i ciπgle knuli przeciwko nim. ");

B_LogEntry(BookLog_HistoryOfVarant6,"M≥ody Kalhir, pragnπc przywrÛciÊ imperatorom poprzednia potÍgÍ, zwrÛci≥ siÍ wtedy do kap≥anÛw ognia by ci wydali mu úwiÍte relikwie Adanosa. Pragnπ≥ dziÍki mocy owych artefaktÛw, zmusiÊ moønow≥adcÛw do pos≥uchu. åwiπtobliwi magowie odmÛwili jednak ambitnemu w≥adcy, gdyø nie takie by≥o przeznaczenie daru Adanosa. Od wiekÛw artefakty by≥y otaczane úwiπtobliwπ czciπ i takie pos≥uøenie siÍ nimi mia≥oby wymiar úwiÍtokradztwa.");

B_LogEntry(BookLog_HistoryOfVarant6,"Kalhir uzna≥ przeto, øe Magowie Ognia rÛwnieø dπøπ do os≥abienia pozycji krÛla. Posπdza≥ teø ich o chÍÊ przejÍcia realnej w≥adzy w paÒstwie i o wspÛ≥pracÍ z moønow≥adcami. Imperator powoli zaczπ≥ sk≥aniaÊ siÍ ku kultowi Adanosa, w magach wody szukajπc przeciwwagi dla potÍgi kap≥anÛw Innosa. Pojawi≥y siÍ nawet g≥osy, øe krÛl zamierza odebraÊ najwaøniejsze úwiπtynie magom ognia i przekazaÊ je Adanosytom. Starajπc siÍ pomniejszyÊ potÍgÍ InnosytÛw, zaczπ≥ domagaÊ siÍ udzia≥u w wyborze innosyckich arcymagÛw.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie Ognia t≥umaczyli krÛlowi, øe jest to wbrew prawom i obyczajom, lecz w≥adca nie s≥ucha≥ mπdroúci kap≥anÛw, lecz wola≥ polegaÊ na radach nierozumnych ludzi.†SpÛr majπcy doprowadziÊ do upadku w≥adcy rozgorza≥ dopiero po úmierci arcymaga Salima, kiedy to krÛl samowolnie namaúci≥ Ragheba na nastÍpcÍ pierwszego spoúrÛd kap≥anÛw Innosa. Tak oto Kalhir II przeciw prawom úwiÍtym wystπpi≥, pragnπc w miejsce regu≥ tradycjπ uúwiÍconych, tyraÒskπ swπ wolÍ zaprowadziÊ.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nie zwaøajπc na napomnienia i przestrogi, ktÛrych dobrzy doradcy i úwiÍci mÍøowie mu nie szczÍdzili, øπdzπ krÛl zaúlepiony, trwa≥ w swym szaleÒstwie. Dusza jego pomys≥ wnet przebieg≥y zrodzi≥a. Postanowi≥ Kalhir magÛw do swego pa≥acu zaprosiÊ, co by z nimi pertraktowaÊ i zgodÍ osiπgnπÊ. Kaza≥ wiÍc w≥adca rozes≥aÊ pisma do úwiÍtych mÍøÛw, proszπc ich o przybycie.†Magowie Ognia prÍdko spisek w tym dostrzegli. Zebrawszy siÍ na naradzie, rÛønie pragnÍli czyniÊ. Najzacieklejsi w krÛlu heretyka juø dostrzegli i przeciw niemu radzili siÍ juø sposobiÊ.");

B_LogEntry(BookLog_HistoryOfVarant6,"Drudzy przed pochopnoúciπ ostrzegali i miÍdzy odmowπ przybycia, a innym miejscem spotkania siÍ stawiali. G≥os zabra≥ przeto mag Udin, co dotπd w milczeniu s≥owom swych braci siÍ przys≥uchiwa≥:†ëKtÛø z nas weümie na siebie krew? W≥adca nasz kroczy úcieøkπ, by dotrzeÊ niebawem tam, skπd nie bÍdzie juø powrotu. Oto Kalhir jeszcze raz za siÍ spoglπda, w czym odmiana jego drogi byÊ moøe. Czyø zdradziecki zamiar siÍ za tym kryje? Serce jego przed oczyma naszemi zakryte, lecz ktÛø zdrajcπ bÍdzie, jeøeli ostatniej prÛby ratowania pokoju, Wiary i krÛlestwa siÍ nie podejmiemy! OdmÛwimy goúciny w jego pa≥acu? Tedyø on ku nam w goúcinÍ przybÍdzie, wojska swe na úwiπtynne miasto prowadzπc! PrzybÍdziemy na wezwanie do jego pa≥acu? Tedyø on bÍdzie mia≥ úwiÍty zakon MagÛw Ognia w swej tyraÒskiej mocy! Trzech przeto braci poúrÛd nas wybierzmy i niechaj oni w imieniu úwiπtyni przed Kalhirem przemawiajπ!í.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie przychylili siÍ do s≥Ûw Udina, wysy≥ajπc jego oraz dwÛch wybranych poúrÛd zgromadzenia. Trzej stawili siÍ przeto przed obliczem krÛla. W zapamiÍtaniu swym Kalhir zaøπda≥, by po wszystkie czasy, to krÛlowie arcymagÛw mianowali, jako urzÍdnikÛw krÛlewskich i dworakÛw siÍ mianuje.");

B_LogEntry(BookLog_HistoryOfVarant6,"W≥adca oszala≥y, wzgardziwszy zgodπ, g≥uchym by≥ na g≥os úwiÍtych mÍøÛw Innosa. W pa≥acu swym uwiÍziwszy Udina i jego towarzyszy, obleg≥ on úwiπtyniÍ, ktÛrπ wczeúniej zarzπdza≥ Salim, øπdajπc by Magowie Ognia uznali uzurpatora nowym arcymagiem. Wiedziano jednak, øe Kalhir nie pragnie wcale pokoju i spÛr ten jest czÍúciπ planu zdobycia relikwii Adanosa.†Kap≥ani wezwali przeto lud do obrony úwiÍtego przybytku. WyklÍto jednoczeúnie doradcÛw krÛla, ktÛrych obwiniano o namawianie w≥adcy do tych szaleÒczych czynÛw.");

B_LogEntry(BookLog_HistoryOfVarant6,"Varant odpowiedzia≥ na wezwanie kap≥anÛw. D≥ugo jeszcze ludzie przychodzili do krÛla b≥agajπc go by zaniecha≥ dzia≥aÒ g≥upich i nie sprowadza≥ zguby na paÒstwo. Na nic jednak b≥agania i namowy, wobec pychy zaúlepiajπcej serce Kalhira. Tak oto rozpoczÍ≥a siÍ wojna, ktÛrej koniec wiÛd≥ pod mury stolicy.");

B_LogEntry(BookLog_HistoryOfVarant6,"KONIEC TOMU VI");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant7,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant7,"Dzieje Varantu. Tom VII");

B_LogEntry(BookLog_HistoryOfVarant7,"Walki trwa≥y d≥ugo. Powstali synowie Varantu przeciw sobie, jedni przy krÛlu swym, inni przy kap≥anach. DoúÊ rzec, øe Kalhirowi wielu dobrych ludzi poczπtkowo s≥uøy≥o, lecz z czasem go odstÍpowali, gdyø na jego czyny godziÊ siÍ nie mogli. Podobnie przy úwiπtyni, obok szczerych wyznawcÛw Innosa, stanÍli ci, ktÛrym silna w≥adza krÛlewska przykrπ zawsze by≥a. Powoli jednak szala zaczyna≥a przechylaÊ siÍ na stronÍ MagÛw Ognia i ich sojusznikÛw.");

B_LogEntry(BookLog_HistoryOfVarant7,"W poszukiwaniu sprzymierzeÒcÛw Kalhir zwrÛci≥ siÍ do plemion barbarzyÒskich, wysy≥ajπc do nich swych wiernych ludzi z obietnicπ skarbÛw i zachÍcajπc ich do ≥upienia przygranicznych posiad≥oúci moønow≥adcÛw.†Wojna jednak zaprowadzi≥a wojska úwiπtyni aø pod mury stolicy w Al-Shedim, gdzie musia≥ siÍ chroniÊ úwiÍtokradca. OblÍøony w swym zamku przez VarantczykÛw Kalhir, wyczekiwa≥ przybycia wiernych mu ostatnich oddzia≥Ûw varanckich. Wierni mu dowÛdcy mieli przyprowadziÊ ze sobπ rÛwnieø najemnikÛw z pogaÒskich plemion pÛ≥nocy. W≥adca zdawa≥ sobie sprawÍ, øe jego panowanie jest zagroøone. Z kaødπ kolejnπ klÍskπ, topnia≥a w nim zaciek≥oúÊ i wola walki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Wreszcie Kalhir postanowi≥ wezwaÊ przed swe oblicze Udina oraz dwÛch towarzyszπcych mu magÛw. åwiÍty mπø przemÛwi≥ jednak do swego w≥adcy tymi s≥owami:†ëPrzybyliúmy jako pos≥aÒcy pokoju i zgody, a staliúmy siÍ wiÍüniami krÛla Varantu, lecz i imperator dziú jest uwiÍziony. Czterech mÍøÛw to wiÍüniowie, lecz tylko jeden gniewu bogÛw winien siÍ obawiaÊ! By≥ dawniej czas wyboru, lecz wybÛr dokonany czynami krÛla zosta≥ przypieczÍtowany...í");

B_LogEntry(BookLog_HistoryOfVarant7,"Ujrza≥ wtedy Kalhir, øe nie ma juø drogi powrotnej. Wojna zatru≥a krew pobratymczπ, a krÛl sprowadzajπc na swÛj kraj barbarzyÒcÛw sta≥ siÍ w oczach wielu swych poddanych renegatem. Oto úwiπtynia w triumfach swych podesz≥a aø pod mury stolicy, a wojska jej i kap≥ani pragnπ z≥oøyÊ go z≥amaÊ. Za radπ fa≥szywego arcymaga, Ragheba, postanowi≥ Kalhir zdobyÊ siÍ na czyn straszliwy. Ku Praven swe oczy przeto zwraca, nie z mieczem w d≥oni, lecz z nadziejπ pomocy ze strony barbarzyÒcy. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Pos≥a≥ monarcha do swych dawnych wrogÛw propozycjÍ przymierza, wydarte im niegdyú przez niego Trellium obiecujπc w zamian. Tak oto ziemie przywiedzione przez Kalhira II do o≥tarza Innosa, ten sam Kalhir na pastwÍ barbarzyÒcÛw wydawa≥.");

B_LogEntry(BookLog_HistoryOfVarant7,"Praven odpowiedzia≥o na wezwanie imperatora i ruszy≥o w granicÍ KrÛlestwa Innosa. Na rozkaz Kalhira wiÍkszoúÊ garnizonu pod wodzπ Omrana opuúci≥a twierdzÍ trellijskπ, lecz czÍúÊ øo≥nierzy odmÛwi≥a uczynienia tego i zamknÍ≥a siÍ w zamku. Owi wierni synowie varanckiej ziemi skupili siÍ wokÛ≥ najstarszego z nich rangπ, dobrego Sargona Tarczownika. Rozsierdzi≥o to wielce barbarzyÒcÛw, ktÛrzy zakrzyknπwszy ÑZdrada!î, rzucili siÍ na opuszczajπcych twierdzÍ øo≥nierzy Omrana. Sam dowÛdca garnizonu nie uszed≥ rzezi, jakπ zgotowali mu ësojusznicyí.");

B_LogEntry(BookLog_HistoryOfVarant7,"Najeüdücy rozpoczÍli oblÍøenie warowni, ktÛra bohatersko broni≥a siÍ przez cztery ksiÍøyce. Z tego teø powodu wiÍksza czÍúÊ PraveÒczykÛw zosta≥a na pÛ≥nocy, gdzie oblega≥a Trellium i nie ruszy≥a z krÛlewskimi wojskami na odsiecz imperatorowi. CzÍúÊ jednak z barbarzyÒskich sprzymierzeÒcÛw krÛla, wespÛ≥ z najemnikami i oddzia≥ami wiernymi Kalhirowi ruszy≥a ku murom Al-Shedim.†Odsiecz, bÍdπca jedynπ nadziejπ krÛla, nie zdo≥a≥a przerwaÊ oblÍøenia i przebiÊ siÍ do zamku. Stolica zosta≥a niebawem zdobyta, a krÛla wydano triumfujπcym Varantczykom.");

B_LogEntry(BookLog_HistoryOfVarant7,"Pojmany Kalhir czekaÊ mia≥ na wyrok magÛw, zamkniÍty w areszcie w jednej ze úwiπtyÒ. W zdobytym zamku nie odnaleziono jednak fa≥szywego arcymaga ñ Regheba. Po upadku w≥adcy, ktÛry prÛbowa≥ wynieúÊ Regheba na miejsce nie przystojπce temu cz≥owiekowi, uciekinier nie stanowi≥ juø jednak zagroøenia.");

B_LogEntry(BookLog_HistoryOfVarant7,"Uwolniony Udin sta≥ siÍ bohaterem i jako taki, zosta≥ wybrany przez mÍøÛw Innosa arcymagiem. Pozostawa≥ jeszcze problem oblÍøonego Trellium i grasujπcych po Varancie band, ktÛre na wieúÊ o klÍsce Kalhira, odrzuci≥y dowÛdztwo genera≥Ûw i powrÛci≥y do swych siedzib na pÛ≥nocy, po drodze biorπc jeÒcÛw i ≥upy. Genera≥owie i pozostali jeszcze przy nich øo≥nierze od≥πczyli siÍ od tego pochodu, lecz wnet zostali rozbici przez wojska Varantu. Niebawem teø Varantczycy przybyli z odsieczπ obroÒcom Trellium, pobijajπc PraveÒczykÛw w bitwie.†");

B_LogEntry(BookLog_HistoryOfVarant7,"Po powrocie do stolicy, postanowiono zdetronizowaÊ Kalhira II. Jednoczeúnie krÛlem Varantu okrzykniÍto Tizgara, brata ustÍpujπcego w≥adcy. Samego teø Kalhira uznano za przeklÍtego i skazano na wieczne wygnanie. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Kalkhir PrzeklÍty wraz z kilkoma swymi s≥ugami uda≥ siÍ wtedy ku gÛrom na wschodzie, gdzie wúrÛd tamtejszych plemion mia≥ spÍdziÊ resztÍ øycia. Jemu to tamtejsze ludy zawdziÍczajπ przyjÍcie kultu Adanosa, ktÛremu do Kalhir po kres swoich dni pozosta≥ wierny. Cz≥owiek ten nigdy juø nie pojawi≥ siÍ w Varancie, choÊ raz jeden spotka≥ siÍ ze swoim bratem, krÛlem Tizgarem, lecz nawet wtedy øaden z braci nie przekroczy≥ granicznej rzeki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Potomkowie Kalhira II PrzeklÍtego mieli po wielkim potopie zejúÊ z gÛr i zasiedliÊ ca≥y pustynny juø Varant. Tak oto sta≥ siÍ on protoplastπ dzisiejszych mieszkaÒcÛw po≥udniowej czÍúci Kontynentu Myrtany. Jemu teø Varant zawdziÍcza adanosycki charakter tej krainy, gdyø potomkowi Kalhira, podobnie jak on sam byli wyznawcami Pana Wody. O ile wiÍc Pradawni zwali Kalhira PrzeklÍtym, o tyle Koczownicy wolπ go nazywaÊ Kalhirem Praojcem.");

B_LogEntry(BookLog_HistoryOfVarant7,"KONIEC TOMU VII");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VIII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant8,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant8,"Dzieje Varantu. Tom VIII");

B_LogEntry(BookLog_HistoryOfVarant8,"NastÍpcπ Kalhira PrzeklÍtego by≥ Tizgar zwany Chromym. By≥ on cz≥owiekiem úwiat≥ym i wykszta≥conym, gdyø przez wzglπd na starszeÒstwo Kalhira i wrodzone kalectwo, nie chowano go na krÛla, ino na maga. åwiÍtym mÍøom teø tron zawdziÍcza≥, gdyø po upadku Kalhira PrzeklÍtego, niektÛrzy moøni pragnÍli haÒbÍ upad≥ego na ca≥y rÛd krÛlewski rozciπgnπÊ i od w≥adzy dynastiÍ tπ odsunπÊ. Tak teø chcieli niektÛrzy magowie, lecz roztropny Udin przejrza≥ zamiary moønow≥adcÛw i do rzeczy podobnych nie dopuúci≥.");

B_LogEntry(BookLog_HistoryOfVarant8,"Tizgar okaza≥ siÍ w≥adcπ dobrym i mπdrym. Wyrzek≥ siÍ drogi swego brata i po wszystkie czasy uczyni≥ kap≥anÛw ognia straønikami relikwii, ktÛre niegdyú zapewni≥y Semmirowi I zwyciÍstwo nad hordami Beliara. Nowy krÛl troszczy≥ siÍ o kult Innosa, wspierajπc misje na ziemie barbarzyÒcÛw. On teø rozpoczπ≥ budowÍ úwiπtyni w Veluce, ku przeb≥aganiu za grzechy brata i krew przelanπ w walkach o tron przez swego dziada.†Nie mÛg≥ on podejmowaÊ wypraw wojennych na pogan, gdyø w≥adzÍ krÛlewskπ zasta≥ on s≥abszπ niø poprzednicy jego. Ileø mu wstrÍtÛw moøni czynili! DziÍki jego jednak staraniom podnoszono kraj z ruiny, zaú na zgliszczach odradza≥o siÍ z wolna to, co wojna odebra≥a. Po okresie wojen na ziemiach na po≥udnie od Zatoki PraveÒskiej zapanowa≥ upragniony pokÛj. Jedynie pÛ≥nocne rubieøe krÛlestwa wciπø by≥y trapione przez zwyczajowe juø najazdy barbarzyÒcÛw.");

B_LogEntry(BookLog_HistoryOfVarant8,"Za sprawπ Tizgara Chromego wydano wiele sprawiedliwych praw, ktÛre na rÛwni z dzie≥em odbudowy kraju, uczyni≥y postaÊ tego krÛla, tak mi≥π sercu trzech kronikarzy, spisujπcych jego historiÍ. Do jego niewπtpliwych zas≥ug naleøy teø utrzymanie jednoúci paÒstwa, zagroøonej przez ambicje moønych. By≥by wiÍcej on zapewne dobrego uczyni≥ i byÊ moøe, panujπc w kraju niezniszczonym wojnπ, zas≥uøy≥ sobie na przydomek ÑWielkiî, lecz nie sposÛb odpowiedzieÊ jednoznacznie na to pytanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"KrÛl ten w zwyczaju mia≥ wieczory spÍdzaÊ s≥uchajπc úpiewu s≥owikÛw w swych pa≥acowych ogrodach. Dnia pewnego, doøywszy juø sÍdziwego wieku, usnπ≥ raczπc siÍ owπ ukochanπ melodiπ. Zasypiajπc, zapad≥ wtenczas w sen wieczny. Takπ oto pociechπ bogowie os≥odzili poczciwemu krÛlowi wiek starczy i przemijanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"Mπø Ûw poboøny nie zostawi≥ po sobie syna, wiÍc w≥adzÍ po nim przejÍli potomkowie wuja Akhelda III zwanego Tufailem, a od zamku przez nich posiadanego nazwani Mussanitami. Niemniej ich w≥adza nie dorÛwnywa≥a w≥adzy AkhelidÛw i Odnowicieli, albowiem wyniesieni spoúrÛd moønych, nie mieli podobnego powaøania ludu jak poprzednia dynastia. Pierwszym krÛlem z dynastii MussanitÛw by≥ Nelzar I, ktÛry po úmierci Tizgara wstπpi≥ na tron.");

B_LogEntry(BookLog_HistoryOfVarant8,"KONIEC TOMU VIII");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IX

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant9,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant9,"Dzieje Varantu. Tom IX");

B_LogEntry(BookLog_HistoryOfVarant9,"Nie godzi≥ siÍ jednak Nelezar, aby emirowie mu dyktat czynili, toteø pragnπ≥ wzmocniÊ swe panowanie. Na podobieÒstwo poprzedniego w≥adcy zdecydowa≥ otaczaÊ siÍ poboønymi kap≥anami Innosa, w ktÛrych Tizgar odnajdywa≥ za swych rzπdÛw wsparcie. Nelzar dokoÒczy≥ rozpoczÍtπ przez poprzednika budowÍ wspania≥ej úwiπtyni Innosa w Veluce. ZwieÒczone dzie≥o sk≥oni≥o m≥odego w≥adcÍ do snucia wizji nawrÛcenia pogaÒskich szczepÛw, zamieszkujπcych ziemie na pÛ≥noc od Zatoki PraveÒskiej.");

B_LogEntry(BookLog_HistoryOfVarant9,"Imperium oddane przez Tizgara nastÍpcom, nie by≥o juø tym pogorzeliskiem wycieÒczonym wojnπ domowπ. Myúl o wyprawie wojennej i ostatecznym zaøegnaniu zagroøenie ze strony PraveÒczykÛw, cieszy≥a siÍ aprobatπ m≥odego i ambitnego arcymaga Kalido, widzπcego w tym okazjÍ do umocnienia pozycji kap≥anÛw Innosa. W ciπgu swego panowania Nelzar poprowadzi≥ ≥πcznie piÍÊ wypraw na Praven, ostatecznie luüno uzaleøniajπc kraj ten od Imperium. Nie uda≥o siÍ jednak zaprowadziÊ w kraju tym wiary w Innosa, zaú wszelkie prÛby uczynienia tego koÒczy≥y siÍ úmierciπ kap≥anÛw, lub wybuchem buntu i kolejnπ wyprawπ wojennπ. Porzucono wiÍc starania o nawrÛcenie PraveÒczykÛw, zadawalajπc siÍ jedynie daninπ i bezpieczeÒstwem od atakÛw ze strony tego ludu barbarzyÒskiego.");

B_LogEntry(BookLog_HistoryOfVarant9,"Kres d≥ugiego panowania Nelezara I przyniÛs≥ kolejne niepokoje, albowiem przeciw nastÍpujπcemu po zmar≥ym Semmirowi III wystπpi≥ jego przyrodni brat z ≥oøa nieprawego. Ohyda jego czynu skaza≥a zdrajcÍ na zapomnienie, toteø imiÍ jego zostanie przemilczane. OdstÍpca zyska≥ wsparcie wielu moønych, ktÛrzy znaleüli w tym pretekst do wystπpienia przeciw w≥adzy krÛla. Sta≥o siÍ tak, øe Semmir musia≥ zbiegaÊ z zagroøonej stolicy do dworu w Mussan, a Al Shedim zasiad≥ uzurpator. £aska Innosa úwieci≥a jednak nad prawowitym krÛlem i ten niebawem zrzuci≥ zdrajcÍ z tronu.");

B_LogEntry(BookLog_HistoryOfVarant9,"Cena sporu by≥a jednak ogromna, albowiem za≥ama≥a siÍ w≥adza centralna. Od tej chwili w≥adca Wielkiego Imperium Varanckiego sta≥ siÍ jedynie nominalnym zwierzchnikiem emirÛw, zaú jego rzπdy ogranicza≥y siÍ do terenÛw przyleg≥ych do stolicy w Al Shedim. W obliczu zawieruchy, w≥adzÍ zwierzchniπ Varantu zrzucili PraveÒczycy, ktÛrzy na nowo zaczÍli najeødøaÊ pogranicze...");

B_LogEntry(BookLog_HistoryOfVarant9,"KONIEC TOMU IX");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM X

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant10,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant10,"Dzieje Varantu. Tom X");

B_LogEntry(BookLog_HistoryOfVarant10,"W czasach pierwszych MussanitÛw na po≥udniu zalÍg≥y siÍ stworzenia, ktÛre przepÍdzone przez Akhelda I, znÛw rozpostar≥y mrok w swych dawnych siedzibach. I rozleg≥y mod≥y ku czci Beliara i demonÛw jego w krainach, a úpiewy obrazoburcze na haÒbÍ Innosa siÍ w gnieüdzie tym, w Eresh-Ugall na nowo zalÍg≥y. Czymøe by≥ wtedy Varant rozbity na w≥adztwa udzielnych emirÛw? KrÛla w≥adza w stolicy uwiÍziona, zaú jedynym spoiwem dawnej jednoúci stali siÍ Magowie Ognia, tak przez imperatora wspierani.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wnet jednak emirowie poznali siÍ, øe przez mÍøÛw Innosyckich krÛl wzmacnia swe w≥adanie. Wywyøszyli wiÍc magÛw wody ponad czcicieli ognia, by ci ostojπ ich panowania siÍ stali. Semmir dwadzieúcia lat swe rzπdy monarsze sprawowa≥, wyprawiajπc siÍ bez zwyciÍstwa dwa razy na PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant10,"Po nim nasta≥ syn jego Asmatila. Syn Semmirowy znalaz≥ sojusznika w Troghdanie jednym spoúrÛd wodzÛw pÛ≥nocnych, ktÛry przyjπ≥ wiarÍ z rπk Koúcio≥a Innosyckiego i namaszczony na krÛla wszystkich JelkalÛw najecha≥ wespÛ≥ z krÛlem ziemie emirÛw, czyniπc sobie na powrÛt poddanymi emirÛw Tahira i Dakhusa. LÍkajπcy siÍ o swe panowanie pozostali emirowie zawiπzali wtedy spisek niecny i wystπpili przeciwko imperatorowi, dajπc poczπtek nowej wojnie, ktÛra sprowadzi≥a na Varant najeüdücÛw z pÛ≥nocy.");

B_LogEntry(BookLog_HistoryOfVarant10,"W niej to si≥y zjednoczone pod ber≥em Asmatili wspierane by≥y przez jelkalskie posi≥ki krÛla Troghdana i DhirimijczykÛw, zaú buntownicy pod wodzπ emira Nelacha prowadzili u swego boku PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant10,"Dwa lata armie krÛlewskie i emirowskie czyni≥y spustoszenie na ziemiach Varantu, by po nierozstrzygniÍtej bitwie przyznaÊ znaczniejszym emirom tytu≥y krÛlewskie, a mniejszym Panom ksiπøÍce. Przy Asmatili mia≥y pozostaÊ dotychczas zdobyte ziemie i nominalne prawo do rozsπdzania sporÛw miÍdzy emirami.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wielki krÛl nie zrezygnowa≥ jednak z planu zjednoczenia w≥adztwa Innosyckiego i juø po smierci emira Vinkila w Kaldhice i wstπpieniu na tron brata zmar≥ego, wyruszy≥ z wyprawπ majπcπ na celu osadzenie tam wygnanπ krÛlowπ i pogrobowca.");

B_LogEntry(BookLog_HistoryOfVarant10,"LÍkajπcy siÍ o swe panowanie emir Salim, wezwa≥ wiÍc na pomoc orkÛw, ktÛrymi teø obsadzi≥ swÛj zamek. Wyprawa krÛlewska zosta≥a odparta, a Asmatila by≥ zmuszony powrÛciÊ do Al Shedim, uwoøπc ze sobπ wdowÍ i pogrobowca. Emir Salim niebawem w ohydnym czynie wygna≥ ze swojego miasta kap≥anÛw Innosa i w ich miejsce sprowadzi≥ czarnych magÛw. Za jego potwornym uczynkiem cieÒ pad≥ na KhaldikÍ i pogrπøy≥ siÍ ona beliaryckim b≥Ídzie.");

B_LogEntry(BookLog_HistoryOfVarant10,"KONIEC TOMU X");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant11,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant11,"Dzieje Varantu. Tom XI");

B_LogEntry(BookLog_HistoryOfVarant11,"I nasta≥ czas walki, kiedy to Varant øyünia≥ krwiπ Beliara i Innosa. Na satrapÛw, co w swym bluünierstwie krÛlami siÍ mienili, spad≥ gniew Innosa rÍkami barbarzyÒcy wymierzony. Szala≥ wiÍc lud pierwotny, co swe siedziby mia≥ na pÛ≥nocy Zatoki PraveÒskiej.");

B_LogEntry(BookLog_HistoryOfVarant11,"Sprawiedliwoúci na emirach dopomina≥ siÍ Gorghian prowadzπcy dzielnych JelkalÛw. ”w panowa≥ w Gocie po bracie swym Troghdanie, a choÊ niecnie tron zdoby≥, dzielnym w≥adcπ i pos≥usznikiem Innosa siÍ okaza≥. Z pÛ≥nocnych puszcz Dhirim, wyjawi≥o siÍ pogaÒscy Dhirmijczycy z Guldern, co niesprzymierzeni z krÛlem, na wzÛr PraveÒczykÛw biczem boøym siÍ jawili. Czy prawdπ jest li to, øe ludzie Zatoki w przymierze z plugastwem Beliarowym weszli? Skromny kap≥an nie rozsπdzi. Krew la≥a siÍ strumieniami na wszystkich granicach, by niczym rzeka jednoczπca strumienie, imperium do jednoúci przywo≥aÊ. Kolejni satrapowie do przyjaüni z krÛlem przychodzili, by odeprzeÊ PraveÒczykÛw i gÛrniczych GuldernÛw. Wielki KrÛl zatrzyma≥ lud ze wschodu i GuldernijcÛw do przyjaüni nak≥oni≥. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Wzesz≥o wiÍc ponownie s≥oÒce nad zjednoczonym Imperium. Nie by≥a to jednak si≥a AkhelidÛw i Odnowicieli, albowiem nie jeden satrapa, uznajπc w≥adzÍ Al Shedim, wciπø krÛlem siÍ mieni≥. Rodzi≥o siÍ nowe paÒstwo, ktÛre podobnie jak øycie ludzkie w bÛlach na úwiat przychodzi. Mierzyli siÍ wiÍc Beliaryci z Innosytami, a øaden nie by≥ w stanie zniszczyÊ drugiego. Innos przemÛwi≥ do swych s≥ug: Ñ Wznieúcie dla mnie portal, abym mÛg≥ rzπdziÊ w tej czÍúci úwiata przez ca≥π wiecznoúÊ.î I Jego s≥udzy spe≥nili to øπdanie. Podobnie uczynili Beliaryci, wznoszπc portal dla swego boga. Asmatila rozkaza≥ teø wynieúÊ artefakty Adanosa ze úwiπtyÒ, albowiem chcia≥ ich uøyÊ przeciw wrogowi. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Usta≥y wtedy wielkie bitwy i jedynie drobne potyczki na granicach przypomina≥y o trwajπcej wojnie. Beliaryci pierwsi wznieúli swÛj portal i sprowadzili na úwiat bestie Beliara pod wodzπ potÍønego najstarszego ze smokÛw. WkrÛtce obie armie spotka≥y siÍ na granicach, gdzie mia≥a siÍ rozstrzygnπÊ wojna bogÛw. Armii Varantu towarzyszy≥y posi≥ki z Guldern, Jelkali, a nawet z Vengardu. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Orkowie, jaszczuroludzie i bestie Beliara na czele ze smokami zwerbowali nie tylko gobliny, ogry i shraty, ale teø potÍøne trolle. Oba wojska sta≥y przed sobπ twarzπ w twarz, zaú kap≥ani obu stron odprawiali kolejne przedbitewne obrzÍdy ku czci swych bogÛw. Wnet rytualne trπby zamilk≥y, ustÍpujπc wojskowym rogom dajπcym sygna≥ do walki. Dzikie  hordy na czele z trollami ruszy≥y przeciw zwartym oddzia≥om varranckim. Nagle oczom walczπcych ukaza≥a siÍ wielka niczym gÛra Archolos fala, ktÛra chwilÍ potem przykry≥a ca≥e pole bitwy, idπc dalej w g≥πb krainy. Kolejno w wodzie pogrπøa≥y siÍ miasta, wsie, lasy, ≥πki, a nawet gÛry, oga≥acajπc te miejsca z wszelkiego øycia. Woda poch≥onÍ≥a Kostur i Ber≥o, zaú piÍÊ boskich artefaktÛw kap≥ani ognia umieúcili w úwiπtyniach.");

B_LogEntry(BookLog_HistoryOfVarant11,"KONIEC TOMU XI");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

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

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

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

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant12,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant12,"Dzieje Varantu. Tom XII");

B_LogEntry(BookLog_HistoryOfVarant12,"Fale da≥y kres wielkiemu Imperium Varantu, ktÛre od Wiecznego WÍdrowca do Asmatila istnia≥o 437 lat. ChoÊ morze po kilku latach poczÍ≥o ustÍpowaÊ, ods≥oniÍty lπd rÛøni≥ siÍ od dawnego obrazu krainy. W miejsce urodzajnej i øyznej ziemi, zjawi≥y siÍ nieprzebyte piaski. Owe piaski poch≥onÍ≥y dawne miasta i rzeki, czyniπc Varant niepodobnym do starego. PÛ≥nocne miasta dawnego imperium poczÍ≥y upadaÊ pod naporem wyzwalajπcej siÍ ludnoúci tubylczej i jej kolejnych najazdÛw. Trwa≥e okaza≥y siÍ dzieci tego tworu, gdzie Korona Troghdana podjÍ≥a p≥aszcz dziedzictwa Varantu. ");

B_LogEntry(BookLog_HistoryOfVarant12,"RÛwnieø wúrÛd NordmarczykÛw kwit≥ kult Innosa, przyniesiony przez jednego z niewolnikÛw do tej nieprzyjaznej krainy. LudnoúÊ, ktÛra mia≥a tworzyÊ nowy Varant by≥a inna od dawnych jego gospodarzy. Wywodzi≥a siÍ ona z wypÍdzonych w gÛry przez AkhelidÛw pogan, ktÛrzy pod wp≥ywem maga wody Almira przyjeli kult Adanosa w czasach dynastii MussanitÛw. Na pÛ≥nocy dzisiejszej pustyni osiedlili siÍ z rzadka PraveÒczycy, zaú na wschodzie nie brakowa≥o przybyszy z Wysp Po≥udniowych. Wieúci te spisali ku pamiÍci potomnoúci Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium. ");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII AKHELID”W");

B_LogEntry(BookLog_HistoryOfVarant12,"1. Wieczny WÍdrowiec ");

B_LogEntry(BookLog_HistoryOfVarant12,"2. Akheld I syn Wiecznego WÍdrowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"3. Semmir I syn Wiecznego WÍdrowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"4. Akheld II syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"5. Tellos I syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"6. Teminnar I syn Tellosa I");

B_LogEntry(BookLog_HistoryOfVarant12,"7. Semmir II  syn Teminnara I");

B_LogEntry(BookLog_HistoryOfVarant12,"8. Tellos II syn Semmira II");

B_LogEntry(BookLog_HistoryOfVarant12,"9. Tellos III syn Tellosa II");

B_LogEntry(BookLog_HistoryOfVarant12,"10. Tellos IV syn Tellosa III");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII ODNOWICIELI ");

B_LogEntry(BookLog_HistoryOfVarant12,"Akheld III");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir I ObroÒca syn Akhelda III ");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir II PrzeklÍty syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"Tizgar I Chromy syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII MUSSANIT”W");

B_LogEntry(BookLog_HistoryOfVarant12,"Nelezar I syn Delezara Mussanity ");

B_LogEntry(BookLog_HistoryOfVarant12,"Semmir III syn Nelezara I");

B_LogEntry(BookLog_HistoryOfVarant12,"Asmatila I ZwyciÍzca syn Semmira III ");

B_LogEntry(BookLog_HistoryOfVarant12,"KONIEC TOMU XII, OSTATNIEGO");

};
/////////////////////////////////////////////////////////////////////

// GULDERNOWIE Z DHIRIM

// SUGEROWANA LOKACJA: REGA£ NIEOPODAL BULITA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Historia GuldernÛw - przodkÛw dzisiejszych mieszkaÒcÛw Geldern]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Gulderns,LOG_NOTE);

B_LogEntry(BookLog_Gulderns,"Guldernowie z Dhirim");

B_LogEntry(BookLog_Gulderns,"Dumne KrÛleswto Gothy nie by≥o jedynym, ktÛre mog≥o roúciÊ sobie prawa do tytu≥u spadkobiercy Imperium Pradawnych. W staroøytnoúci tereny, nad ktÛrymi gÛruje dziú wielkie miasto Geldern, zamieszkane by≥y przez barbarzyÒskie ludy GuldernÛw. Plemiona te niejednokrotnie najeødøa≥y varanckie posiad≥oúci, a takøe sam Varant Pradawnych. To w≥aúnie owym plemionom, miasto Geldern zawdziÍcza swojπ nazwÍ.†U schy≥ku Imperium tereny te posiada≥y juø oøywione kontakty handlowe z Varantem. Wraz z towarami i dobrami materialnymi, na ziemie te dociera≥y rÛwnieø wp≥ywy kulturalne i religijne. Za sprawπ zetkniÍcia siÍ z zaawansowanπ cywilizacjπ zaczÍ≥y powstawaÊ oúrodki miejskie, a w ostatnich dekadach Imperium rÛwnieø pierwsze paÒstwa. ");

B_LogEntry(BookLog_Gulderns,"KrÛtki epizod podboju tych ziem przez sπsiadÛw w okresie wÍdrÛwki ludÛw po upadku Imperium przyhamowa≥ ten proces. Ostatecznie jednak na tych terenach powsta≥o potÍøne krÛlestwo, ktÛre przyjÍ≥o jako swojπ, varanckπ nazwÍ tej krainy, czyli Dhirim. W≥adcy zjednoczonej krainy na znak swojej potÍgi postanowili wybudowaÊ wspania≥π stolicÍ, ktÛrπ nazwali Geldern, to jest 'miasto GuldernÛw'. Kraj ten opar≥ siÍ na dwÛch zasadniczych filarach - †eksploatacji wielkich kopalÒ i zachowywaniu dziedzictwa Imperium Varantu.†");

B_LogEntry(BookLog_Gulderns,"Mimo rozkwitu i bogactwa krÛlestwa nie powiod≥y siÍ podejmowane przez krÛlÛw Dhirim prÛby ekspansji, ktÛre napotyka≥y na silny opÛr ze strony potÍønych krÛlÛw Gothy i przeøywajπcych swÛj z≥oty wiek TrellijczykÛw. W obliczu kolejnych klÍsk, Dhirimijczycy porzucili myúl o podbojach i skupili siÍ na rozwoju w≥asnych ziem. Zapewniwszy sobie w ciπgu wiekÛw dobrobyt i republikaÒskie instytucje, krÛlestwo postanowi≥o trwaÊ w izolacjonizmie. ChoÊ zdarzali siÍ w≥adcy aktywnie angaøujπcy siÍ w walki na Kontynencie, to jednak aø po kres niepodleg≥ego bytu pozosta≥o wierne drodze dominacji handlowej i wystrzegania siÍ wojen. ");

B_LogEntry(BookLog_Gulderns,"SwÛj dobrobyt w ogromnej mierze Dhirimijczycy zawdziÍczali handlowi i wydobyciu, organizowanemu przez miejscowych kupcÛw. Zrzeszeni w wielkiej gelderyjskiej gildii Menthes, rozpoczÍli d≥ugi marsz zmierzajπcy wpierw do wspÛ≥udzia≥u we w≥adzy, a nastÍpnie do marginalizacji siedzπcych w stolicy krÛlÛw. ");

B_LogEntry(BookLog_Gulderns,"Wraz z wykszta≥ceniem siÍ republikaÒskich form rzπdÛw, coraz czÍúciej KrÛlestwo Dhirim nazywano od miasta KrÛlestwem Geldern, a nawet Republikπ Kupieckπ Geldern.†W schy≥kowej fazie niepodleg≥ego bytu, mia≥ miejsce kryzys istniejπcych w Dhirim instytucji republikaÒskich. ");

B_LogEntry(BookLog_Gulderns,"Wzrost znaczenia oligarchii wielkich kupcÛw z gildii Menthes budzi≥ sprzeciw obywateli miasta. Na fali owego niezadowolenia w≥adzÍ przechwytywali rozmaici tyranii. Nie mogπc powstrzymaÊ kryzysu paÒstwa i spe≥niÊ pok≥adanych w nich przez t≥um nadziei, w≥adza tyranÛw by≥a nieustannie zagroøona. ");

B_LogEntry(BookLog_Gulderns,"Przeciwko nim nieustannie spiskowali wielcy kupcy, pragnπcy powrotu oligarchii. W tej sytuacji tyrani szukali wsparcia potÍønych krÛlÛw Myrtany. Za tyrana Sangero, nastπpi≥o jednak odwrÛcenie przymierzy. Za cenÍ powrotu republikaÒsko-oligarchicznych form w Geldern i zagwarantowanie przywilejÛw kupcom, gildia zgodzi≥a siÍ uznaÊ w≥adzÍ krÛla Myrtany.†Od tej pory kraina ta sta≥a siÍ czÍúciπ nordmarskiej monarchii RhobarÛw. ");

B_LogEntry(BookLog_Gulderns,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// SUNDMARCZYCY

// LOKALIZACJA: DOWOLNA (NP. REGA£ W KOMNACIE GDZIE åPI M.IN. THORUS)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

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

Doc_PrintLines( nDocID,  0, "[Traktat o Sundmarczykach - pobratymcach NordmarczykÛw, zamieszkujπcych tereny wokÛ≥ twierdzy Faring.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Sundmarians,LOG_NOTE);

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy");

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy to lud zamieszkujπcy pÛ≥nocne ziemie Krain Centralnych. Do Sundmaru mieli przybyÊ wiele wiekÛw temu, prowadzeni przez swego praojca ñ Rangulda. Ich praojczyznπ mia≥y byÊ wiecznie skute lodem Mroüne Wyspy, leøπce na pÛ≥nocny-wschÛd od KrÛlestwa Myrtany, ktÛre dziú sπ domem pÛ≥dzikich piratÛw. ");

B_LogEntry(BookLog_Sundmarians,"Wed≥ug chÍtnie powtarzanej przez SundmarczykÛw legendy, Sundmar jest ziemiπ powierzonπ Ranguldowi i jego potomkom przez bogÛw. Bogowie mieli jπ im obiecaÊ, po tym jak Sundmarczycy pokonali plemiÍ jaszczuroludzi, ktÛre to stworzenia obok orkÛw w najdawniejszych czasach zamieszkiwa≥y te ziemie. ");

B_LogEntry(BookLog_Sundmarians,"Po wyparciu smoczego potomstwa, przez wieki Sundmarczycy toczyli walki ze swymi sπsiadami z po≥udnia - Jelkalami, czyli przodkami dzisiejszych VengardczykÛw, GothÛw i w mniejszym stopniu mieszkaÒcÛw Montery. Wobec poniesionej klÍski, czÍúÊ plemion sundmarskich pod wodzπ Dagonarda porzuci≥o swe ojczyste strony i wyruszy≥o do Nordmaru. Wydarzenia te ginπ jednak w mrokach dziejÛw i trudno rzec, w jakiej wojnie ponieúli oni klÍskÍ i jakich poraøka by≥a rozmiarÛw. ");

B_LogEntry(BookLog_Sundmarians,"Ci Sundmarczycy, ktÛrzy podπøyli za Dagonardem, mieli ponoÊ uchodziÊ przed niewolπ. Wiadomym jednak jest za sprawπ legendy o Bardorze, øe po rozpadzie pierwotnego ludu na dwa narody, Sundmarczycy jeszcze przez wiele lat toczyli wojny z Jelkalami jak rÛwny z rÛwnym.†");

B_LogEntry(BookLog_Sundmarians,"W ciπgu wiekÛw Sundmarczycy zostali podbici przez JelkalÛw z Gothy i zmuszeni do poddaÒstwa. Po serii powstaÒ i buntÛw, ostatecznie zapanowa≥ pokÛj. PÛ≥tora wieku po ostatecznej klÍsce, rozpoczÍ≥a siÍ era ≥upieøczych najazdÛw NordmarczykÛw na tereny po≥oøone w centralnej Myrtanie. Kaøda z takich wypraw przechodzi≥a przez tereny zamieszkane przez SundmarczykÛw, przynoszπc temu ludowi wielkie szkody. W czasach Merigi II Gockiego, powsta≥a twierdza Farung, ktÛra mia≥a umocniÊ jego panowanie nad tπ krainπ i postawiÊ tamÍ dla NordmarczykÛw. Ataki barbarzyÒcÛw z pÛ≥nocy jednak nie usta≥y.");

B_LogEntry(BookLog_Sundmarians,"Za Merigi IV, przyzwani przez toczπcego z krÛlem GothÛw wojnÍ Monteriusa II z Montery, Nordmarczycy pod wodzπ Hrothgara zdobyli Farung i obsadzili swojπ za≥ogπ. DowÛdca NordmarczykÛw prÍdko mianowa≥ siÍ jarlem, tworzπc udzielne paÒstwo w Farung. On i jego przodkowie rozpoczÍli proces kolonizacji Sundmaru przez osadnikÛw sprowadzonych z pÛ≥nocy, pragnπcych øyÊ w ≥agodniejszym klimacie. Tym sposobem zmienia≥a siÍ substancja tworzπca lud SundmarzczykÛw, gdyø przybysze z Nordmaru zasilili jego populacjÍ.");

B_LogEntry(BookLog_Sundmarians,"Poczπtkowe walki jarlÛw z nordmarskimi najazdami ≥upieøczymi usta≥y wraz z pobiciem wodza Vurlsena Niedüwiedzia, po ktÛrym to Sundmarczycy i Nordmarczycy rozpoczÍli erÍ krucjat pÛ≥nocnych, wiodπcych na ziemie orkÛw. W pogodzeniu dwÛch ga≥Ízi Rangulda ogromne zas≥ugi mieli kap≥ani Innosa skupieni w klasztorze w Nordmarze.†");

B_LogEntry(BookLog_Sundmarians,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// O PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// RANGA RELIGIJNA TEJ OPOWIEåCI JEST ZBYT DUØA BY KSI G  T• MOØNA BY£O KUPOWA∆ U HANDLARZY, LUB ZNAJDOWA∆ W DOMACH SKAZA—C”W

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

TEXT[2] ="åwiÍte pisma";

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

Doc_PrintLines( nDocID,  0, "[åwiÍte pisma o powstaniu i zag≥adzie staroøytnego ludu Pradawnych z Varantu]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_AncientKnowledge,LOG_NOTE);

B_LogEntry(BookLog_AncientKnowledge,"O Pradawnych");

B_LogEntry(BookLog_AncientKnowledge,"Na poczπtku krainÍ tÍ zamieszkiwali koczownicy i Wieczny WÍdrowiec wskaza≥ im drogÍ. I Innos przemÛwi≥ do Wiecznego WÍdrowca: ëOd≥Ûø swÛj kostur.í I w jego miejsce Innos da≥ mu ber≥o. I Wieczny WÍdrowiec zosta≥ jego s≥ugπ. I Innos obdaøy≥ go czÍúciπ swej boskiej mocy, by mÛg≥ powstrzymaÊ Beliara.");

B_LogEntry(BookLog_AncientKnowledge,"I mocπ tπ by≥ ogieÒ. I mia≥ nad nim w≥adzÍ. Ale niektÛrzy spoúrÛd koczownikÛw nie podπøyli za Innosem. I lud koczownikÛw podzieli≥ siÍ na dwie czÍúci. Ci, ktÛrzy podπøyli za Innosem, stali siÍ ludem Varantu. ");

B_LogEntry(BookLog_AncientKnowledge,"A s≥udzy Innosa pokonali armiÍ istot Beliara i wznieúli wspania≥e úwiπtynie ku chwale Innosa, a ber≥o sta≥o siÍ symbolem ich w≥adzy. I triumfowa≥ Innos, gdyø kraina ta sta≥a siÍ mu pos≥usznπ, a jej w≥adcami byli odtπd jego s≥udzy.");

B_LogEntry(BookLog_AncientKnowledge,"I Innos przemÛwi≥ do swych s≥ug: ëWznieúcie dla mnie portal, abym mÛg≥ rzπdziÊ w tej czÍúci úwiata przez ca≥π wiecznoúÊ.í I jego s≥udzy spe≥nili to øπdanie. A kiedy Beliar zobaczy≥, co robili s≥udzy Innosa, uniÛs≥ siÍ gniewem. I istota pe≥na staroøytnej mocy przyby≥a na jego wezwanie i powsta≥a z ziemi. ");

B_LogEntry(BookLog_AncientKnowledge,"A wraz z niπ inne potÍøne istoty. Ale nadszed≥ kres potÍønych istot, albowiem taka by≥a wola Adanosa. I Adanos zes≥a≥ powÛdü, a ta zmy≥a je z powierzchni ziemi. Kiedy s≥uga Innosa zobaczy≥, co siÍ dzieje, zamknπ≥ w úwiπtyniach piÍÊ boskich artefaktÛw Adanosa. ");

B_LogEntry(BookLog_AncientKnowledge,"I lud Varantu zginπ≥, a kostur i ber≥o pogrπøy≥y siÍ w wodzie. I rzek≥ Adanos do swych braci: ëNigdy wiÍcej wasza stopa nie postanie na mej ziemi, albowiem jest ona úwiÍta! Oto moja wola.í");

};

/////////////////////////////////////////////////////////////////////

// LORD ETIENNE

// SUGEROWANA LOKACJA: NA ZAMKU W KOMNACIE GOMEZA 

// KSI GA TA MOG£ABY ZAINTERESOWA∆ TYCH LUDZI, KT”RZY MAJ• OØYWIONE STOSUNKI ZE åWIATEM ZEWN TRZNYM. NIE PRZEZNACZONA RACZEJ DLA HANDLARZY, GDYØ ZWYK£YCH SKAZA—C”W ONA NIE ZAINTERESUJE. 

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

Doc_PrintLines( nDocID,  0, "[KsiÍga z cyklu 'Najwaøniejsze postacie KrÛlestwa Myrtany', traktujπca o obecnym wielkim mistrzu Zakonu PaladynÛw.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LordEtienne,LOG_NOTE);

B_LogEntry(BookLog_LordEtienne,"Lord Etienne");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne to wielki mistrz Zakonu PaladynÛw. Jest panem na zamku w Reveran ñ g≥Ûwnej siedzibie paladynÛw i ich najwaøniejszym oúrodku szkoleniowym. Stamtπd teø sprawuje dowÛdztwo nad podleg≥ymi Zakonowi zamkami paladynÛw w ca≥ym KrÛlestwiem Myrtany. Jest przy tym niezwykle ambitny, co czyni z niego jednπ z najbardziej wp≥ywowych postaci w paÒstwie RhobarÛw. Wed≥ug niektÛrych, mÛg≥ braÊ udzia≥ w zamordowaniu krÛlowej, choÊ úledztwo prowadzone na dworze krÛlewskim nie potwierdzi≥o tych pog≥osek.");

B_LogEntry(BookLog_LordEtienne,"Przysz≥y zwierzchnik paladynÛw urodzi≥ siÍ w ubogiej rodzinie na jednej z leøπcych na po≥udniowy-wschÛd wysp ñ na Bodermarze. Wychowany na ulicach, by≥ na dobrej drodze, by skoÒczyÊ øycie w szeregach portowej biedoty. Los siÍ jednak do niego uúmiechnπ≥. Pewien potencja≥ dostrzeg≥ w nim jeden z rycerzy przebywajπcych czasowo na Bodermarze. Ten zaprowadzi≥ go do rezydujπcego w mieúcie Maga Ognia ñ Loukanisa, proszπc úwiπtobliwego kap≥ana by zgodzi≥ siÍ nauczaÊ m≥odego Etienne.");

B_LogEntry(BookLog_LordEtienne,"Mag ognia siÍ zgodzi≥, choÊ wieúÊ niesie, øe niechÍtnie. Szybko siÍ jednak okaza≥o siÍ, øe oddany na naukÍ m≥odzieniec jest nader pojÍtnym uczniem. Etienne szczegÛlnie upodoba≥ sobie ksiÍgi o paladynach i wyprawach na orkÛw. Pasjonowa≥y go szczegÛlnie krucjaty pÛ≥nocne prowadzone przez jarlÛw Farung. Mag Loukanis spostrzeg≥szy zainteresowanie ch≥opca tematykπ wojen z orkami oraz rycerstwem, pomÛg≥ mu trafiÊ do g≥Ûwnego oúrodka szkoleniowego dla paladynÛw na zamku Revaran. Tak rozpoczÍ≥a siÍ kariera przysz≥ego wielkiego mistrza w Zakonie PaladynÛw. ");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne jako rycerz Zakonu bra≥ udzia≥ w wielu walkach z orkami, w czasie ktÛrych odznaczy≥ siÍ odwagπ i mÍstwem. Pozwoli≥o mu to awansowaÊ na kolejne stopnie zakonnej hierarchii. W wieku 38 lat, jako zas≥uøony i szanowany cz≥onek bractwa, zosta≥ wybrany na zwierzchnika Zakonu PaladynÛw. Od tej pory stoi na ich czele.");

};

/////////////////////////////////////////////////////////////////////

// KAHRE—CZYCY Z KAHR

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA/BIBLIOTEKA MAG”W WODY/W KOMNACIE BARTHOLO

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Kahr (C_ITEM) //d

{

name ="KahreÒczycy z Kahr";

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

Doc_PrintLines( nDocID,  0, "KahreÒczycy z Kahr");

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

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Kahr,LOG_NOTE);

B_LogEntry(BookLog_Kahr,"KahreÒczycy z Kahr");

B_LogEntry(BookLog_Kahr,"Wyspa Khorinis to jedna z najwaøniejszych prowincji KrÛlestwa Myrtany. Status prowincji strategicznej zawdziÍcza po≥oøonej na po≥udniu wyspy, GÛrniczej Dolinie, gdzie wydobywana jest magiczna ruda - niezwykle cenny surowiec, wykorzystywany do produkcji wytrzyma≥ej broni.");

B_LogEntry(BookLog_Kahr,"Nim jednak Khorinis sta≥a siÍ czÍúciπ KrÛlestwa Myrtany, przez stulecia tworzy≥a w≥asnπ historiÍ. Kim sπ KahreÒczycy? Przodkowie dzisiejszych mieszkaÒcÛw Khorinis, zwanego dawniej Kahr, od niepamiÍtnych czasÛw zamieszkiwali wyspÍ. ");

B_LogEntry(BookLog_Kahr,"Nie byli przy tym jedynymi mieszkaÒcami staroøytnego Khorinis, gdyø dom mia≥y tu rÛwnieø liczne orkowe klany. W trudnej do okreúlenia przesz≥oúci na wyspie rozkwit≥a zagadkowa cywilizacja budowniczych piramid. Niewiele moøna powiedzieÊ o tym ludzie, poza tym, øe oprÛcz wzoszenia monumentalnych budowli, wyznawali Adanosa. Trwa≥ym úladem ich obecnoúci w historii wyspy jest to, øe czÍúÊ spoúrÛd podporzπdkowanych im plemion przyjÍ≥a kult Budowniczych.");

B_LogEntry(BookLog_Kahr,"To dziÍki temu tajemniczemu ludowi, gdy barbarzyÒscy wodzowie z dynastii UkarÛw zdo≥ali narzuciÊ swπ w≥adzÍ sπsiednim szczepom, nowopowsta≥e KrÛlestwo Kahr przyjÍ≥o kult Adanosa. RÛøni≥ siÍ on jednak znacznie od wyznania panujπcego w dzisiejszym KrÛlestwie Myrtany. Religia KahreÒczykÛw nosi≥a wyraüne cechy druidyzmu z w≥aúciwymi dla niego kamiennymi krÍgami i czciπ oddawanπ si≥om natury. Wprawdzie w wierzeniach ich obecny by≥ Beliar jako przeciwnik dobrego Adanosa, lecz dopiero w pÛüniejszych wiekach na wyspÍ dotar≥ kult Innosa.");

B_LogEntry(BookLog_Kahr,"Dzieje Khorinis nierozerwalnie wiπøπ siÍ z rodem UkarÛw, ktÛrego za≥oøycielem mia≥ byÊ mocarz imieniem Ukara. Wed≥ug legendy rodowej w dawnych czasach obfite ziemie nad brzegami Khorinis mia≥y byÊ we w≥adaniu olbrzyma, ktÛry ciemiÍøy≥ okoliczne plemiona i zmusza≥ je do dawania niema≥ej daniny. ");

B_LogEntry(BookLog_Kahr,"Ludziom przychodzi≥o wiÍc niejednokrotnie cierpieÊ g≥Ûd. Zmyúlny Ukara postanowi≥ wtedy zdobyÊ siÍ na fortel. Przebrawszy siÍ wtedy za chromego, poszed≥ do olbrzyma i poprosi≥ go o kilka pÍdzi ziemi. Olbrzym rzek≥ na to, øe s≥aby øebrak dostanie tyle ziemi, ile sam weümie przesunπwszy wielki g≥az. Ukara siÍ zgodzi≥ i zrzuciwszy øebrackie ≥achmany, podniÛs≥ wielki g≥az i zaniÛs≥ go, wytyczajπc tym samym granicÍ przysz≥ego miasta Khorinis. Uwolnione plemiona z radoúciπ okrzyknÍ≥y dzielnego UkarÍ swoim przywÛdcπ, a po nim panowali jego synowie i wnukowie. Tyle legenda. W rzeczywistoúci rÛd UkarÛw zdo≥a≥ rozciπgnπÊ swojπ w≥adzÍ na wiÍkszπ czÍúÊ wyspy, a takøe wyprzeÊ orkÛw daleko na po≥udnie, do GÛrniczej Doliny. Na ziemiach plemienia, z ktÛrego Ukarowie siÍ wywodzili, powsta≥o wspania≥e miasto Khorinis, zwane teø dawniej Kahr.");

B_LogEntry(BookLog_Kahr,"Przejúciowo zdo≥ali teø opanowaÊ GÛrniczπ DolinÍ, na ktÛrej terenach wybudowali cytadelÍ. W GÛrniczej Dolinie Ukarowie ufundowali rÛwnieø warowny klasztor, w ktÛrym rezydowaÊ mieli druidzcy kap≥ani Adanosa. ChoÊ niektÛrzy twierdzπ, øe mnisi oddawali tam czeúÊ rÛwnieø pogaÒskim bogom tej wyspy.†");

B_LogEntry(BookLog_Kahr,"W po≥owie swej drogi, KrÛlestwo Kahr znalaz≥o siÍ na rÛwni pochy≥ej. D≥ugotrwa≥e wojny z Vengardem, wywo≥ane prÛbπ powstrzymania ekspansji vengardzkiej gildii Araxos, zakoÒczy≥y siÍ klÍskπ i spaleniem ca≥ego portu Khorinis. W tym czasie narasta≥o teø zagroøenie ze strony klanÛw orkowych, zamieszkujπcych GÛrniczπ DolinÍ. NapÛr ze strony orkÛw, a nastÍpnie utrata GÛrniczej Doliny i prÛby jej odzyskania wiele kosztowa≥y KrÛlestwo Kahr.  ");

B_LogEntry(BookLog_Kahr,"Mimo niepowodzeÒ krÛlowie zdo≥ali powstrzymaÊ hordy zielonoskÛrych i obroniÊ niepodleg≥oúÊ wyspy przed zakusami vengardzkiej gildii Araxos.†Dla odbudowy wyspy krÛlowie Kahr rozpoczÍli doúÊ energicznπ sprowadzania osadnikÛw z Kontynentu. Przybysze pochodzπcy g≥Ûwnie z Vengardu, Ardei i Montery przynieúli ze sobπ kult Innosa. Z biegiem lat coraz wiÍksze znaczenie na dworze w≥adcÛw zdobywali gÛrujπcy swym wykszta≥ceniem nad druidami Magowie Ognia. Z nadania krÛla Firentisa, otrzymali oni tereny pod budowÍ klasztoru Innosa na Khorinis. Osadnictwo myrtaÒskie przyczynia≥o siÍ do powolnej zmiany oblicza Khorinis. Przygotowywa≥o teø grunt pod wydarzenia przysz≥e, kiedy to wyspa mia≥a staÊ siÍ czÍúciπ zjednoczonej monarchii RhobarÛw. ");

B_LogEntry(BookLog_Kahr,"Ostatnim z krÛlÛw Kahr by≥ wnuk Firentisa - Wilfried Ukara, za ktÛrego paÒstwo musia≥o toczyÊ ciÍøkie walki z orkami z po≥udnia. BarbarzyÒskie klany orkÛw, zjednoczone pod wodzπ potÍønego herszta Gherr-Uzgha zdo≥a≥y rozbiÊ armiÍ Kahr i obleg≥y stolicÍ Khorinis. KrÛl Wilfried nie mia≥ wyboru. Dla ratowania krÛlestwa zawar≥ przymierze z krÛlem Rhobarem I, za cenÍ ustanowienia go dziedzicem zagroøonej korony. ZwyciÍska odsiecz uchroni≥a Khorinis przed upadkiem, a po úmierci Wilfrieda i st≥umieniu buntu jego krewnych, Khorinis sta≥a siÍ per≥π w koronie krÛlÛw Myrtany. Tak oto koÒczy siÍ historia Kahr, a rozpoczyna historia krÛlewskiej prowincji Khorinis.†");

B_LogEntry(BookLog_Kahr,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// FRAGMENT KRONIK DOMINACJI

// SUGEROWANA LOKALIZACJA: WIEØA XARDASA, DOPIERO W V ROZDZIALE/G”RSKA TWIERDZA /d

// ZAKAZANA W KR”LESTWIE MYRTANY HERETYCKA KSI GA. BARDZO RZADKA. 

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

Doc_PrintLines( nDocID,  0, "[Rzadkie, heretyckie oficjalnie zakazane w KrÛlestwie Myrtany. Jeden z ostatnich ocala≥ych rÍkopisÛw.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_ChroniclesOfDomination,LOG_NOTE);

B_LogEntry(BookLog_ChroniclesOfDomination,"Fragment Kronik Dominacji");

B_LogEntry(BookLog_ChroniclesOfDomination,"W dniu prÛby ognia dostπpi≥em zaszczytu wejrzenia do Kronik Dominacji - dzie≥a przechowywanego w Klasztorze Innosa w Nordmarze. KsiÍga ta zawiera jednak wiele tajemnic Zakonu MagÛw Ognia, dlatego zosta≥a zapieczÍtowana przy pomocy niezwykle potÍønej magii. Tylko najwyøsi magowie posiedli wiedzÍ pozwalajπcπ jπ czytaÊ, a przede mnπ postawiono jedynie zadanie otworzenia choÊby fragmentu tej ksiÍgi, czym mia≥em udowodniÊ, øe jestem godny przywdziania szaty Maga Ognia.");

B_LogEntry(BookLog_ChroniclesOfDomination,"Po wielu miesiπcach przygotowaÒ, kiedy zg≥Íbia≥em wiedzÍ majπcπ pomÛc mi podo≥aÊ zadaniu, zosta≥em wezwany przez arcymaga Sevolda i o zachodzie s≥oÒca zaprowadzony na najniøsze piÍtra Biblioteki Klasztornej, gdzie przechowywana by≥a owa relikwia. RozpoczÍ≥a siÍ prÛba. ChoÊ prÛbowa≥em odkryÊ jak najwiÍcej jej tajemnic, to zdo≥a≥em odczytaÊ jedynie niewielki jej fragment. To co jednak ukaza≥o siÍ mym oczom, sprawi≥o, øe zwπtpi≥em w nauki g≥oszone przez KoúciÛ≥ Innosa. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Mimo, øe przeszed≥em prÛbÍ ognia i sta≥em siÍ jednym z magÛw, niebawem porzuci≥em swych braci, ktÛrzy stali siÍ mi obcymi. Od tej pory musia≥em uchodziÊ przed ich gniewem. ChoÊ ≥amiÍ przysiÍgÍ z≥oøonπ Innosowi i Koúcio≥owi Ognia, postanowi≥em utrwaliÊ na papierze, to co wtedy ujrza≥em:");

B_LogEntry(BookLog_ChroniclesOfDomination,"ëI powo≥a≥ Innos do øycia potÍøne istoty, lecz one znajπc moc danπ im przez stwÛrcÍ, odrzuci≥y go i zwrÛci≥y siÍ przeciw niemu. A by≥o to jeszcze nim z Innosa powsta≥ Beliar i Adanos. I mocarne potÍgπ niepodzielnego Innosa, sta≥y siÍ nieúmiertelne.í ");

B_LogEntry(BookLog_ChroniclesOfDomination,"ëA Trzej powstali z Jednego, jednoczπc swπ wolÍ i moc raz jeszcze, przemogli potÍøne istoty i...í Tutaj koÒczy siÍ fragment, ktÛry ksiÍga przede mnπ ods≥oni≥a. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Czy wiÍc to moøliwe, øe Magowie Ognia ukrywali przed nami istnienie Przedwiecznych Istot, powo≥anych do øycia mocπ niepodzielonego wÛwczas jeszcze Innosa? Czy ci wszyscy herezjarchowie g≥oszπcy ich istnienie byli bliøsi prawdy niø Magowie Ognia g≥oszπcy ludowi nieistnienie tych bytÛw?");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nigdy juø ani Innos, ani Beliar, ani Adanos nie mia≥ w≥adaÊ mocπ wszystkich Trojga, wiÍc jako istoty stworzone przez Innosa sprzed podzia≥u, by≥yby najpotÍøniejszymi ze stworzonych bytÛw i ustÍpowa≥yby jedynie bogom. Moøe nawet stanowi≥yby dla nich zagroøenie? Czy te przedwieczne istoty przetrwa≥y jak pozwala≥aby przypuszczaÊ wzmianka o ich nieúmiertelnoúci? A moøe zosta≥y uwiÍzione? Tylko przez kogo i kiedy? Przez pierwotnego Innosa, czy przez wszystkich Innosa i dwÛch jego Braci? Czy ludzie juø wtedy istnieli? Rodzi siÍ teø pytanie najwaøniejsze: czy te potÍøne istoty majπ wp≥yw na nasz úwiat? A jeúli tak, to jaki? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Jak wiemy, KoúciÛ≥ Innosa g≥osi, øe wszelka moc magiczna pochodzi od bogÛw. Jednak nie tylko czciciele bÛstw prawdziwych potrafiπ pos≥ugiwaÊ siÍ magiπ, by wspomnieÊ choÊby o pogaÒskich magach. NiektÛre krÍgi innosyckie w kaødym pogaÒskim bÛstwie chcia≥yby widzieÊ o ile nie pustπ figurkÍ, to chocby jednπ z kolejnych masek Beliara. Czemu wiÍc magia, ktÛrπ pos≥ugujπ siÍ poganie okazuje siÍ rÛøna od tej w≥aúciwej dla Beliara? Czy demony Beliara jako czπstka jego mocy, nie pos≥ugiwa≥yby siÍ magiπ swego stwÛrcy? Czy wiÍc za pogaÒskimi bÛstwami nie kryjπ siÍ w≥aúnie owe przedwieczne istoty? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nim KrÛlowie Myrtany wprowadzili w øycie postanowienia soboru vengardzkiego reformujπcego i ujednolicajπcego Kult MyrtaÒski, w niektÛrych innosyckich i adanosyckiech krÍgach kap≥aÒskich istnia≥y doktryny, ktÛre w rÛønym stopniu uznawa≥y istnienie Przedwiecznych Istot. Czemu wiÍc odrzucono te tradycje? ByÊ moøe dlatego, øe prym na obradach soboru wiedli niechÍtni im kap≥ani z Gothy. Zapewne obawiano siÍ teø, by ludzie wierzπc w realnoúÊ tych bytÛw, nie szukali w nich alternatywy do trzech w≥aúciwych bogÛw.");

B_LogEntry(BookLog_ChroniclesOfDomination,"ChoÊ wiem, øe ksiÍga ta zostanie uznana przez úwiπtobliwych MagÛw Ognia za heretyckπ, a ci co wejdπ w jej posiadanie naraøπ siÍ na gniew inkwizytorÛw, to nie mog≥em odrzuciÊ i skazaÊ na zapomnienie tej wiedzy. Musi ona przetrwaÊ, gdyø okupiono jπ ogromnπ cenπ.");

B_LogEntry(BookLog_ChroniclesOfDomination,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// OPACTWO NORDMARSKIE

// SUEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA /d

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE NA PODSTAWIE GOTHICPEDII Z ROZWINIECIEM T£A HISTORYCZNEGO

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

Doc_PrintLines( nDocID,  0, "[O historii i architekturze opactwa MagÛw Ognia w Nordmarze.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_NordmarAbbey,LOG_NOTE);

B_LogEntry(BookLog_NordmarAbbey,"Opactwo Nordmarskie");

B_LogEntry(BookLog_NordmarAbbey,"Jeden z najwaøniejszych klasztorÛw MagÛw Ognia znajduje siÍ w Nordmarze. Sam obiekt nie grzeszy rozmiarami, lecz posiada grotÍ z posπgiem Innosa, gdzie Pan Ognia niegdyú objawi≥ siÍ ludziom. Ponadto klasztor posiada imponujπcy zasÛb wiedzy w postaci s≥awnej biblioteki.");

B_LogEntry(BookLog_NordmarAbbey,"Stare opowieúci przedstawiajπ takowπ historiÍ powstania klasztoru: Nordmarczyk imieniem Rhobar pewnego dnia zapuúci≥ siÍ w okoliczne gÛry na polowanie. Jednak niespodziewanie na jego drodze stanÍ≥a tajemnicza bestia. M≥ody wojownik po ucieczce skry≥ siÍ przed potworem w jaskini. Jednak ten podπøy≥ za nim.Kiedy Rhobar myúla≥, øe to koniec, niespodziewanie w jego rÍkach znalaz≥o siÍ magiczne ostrze, ktÛre pos≥uøy≥ mu w walce. Po zabiciu bestii miejsce to wype≥ni≥o úwiat≥o, a z niebios wydoby≥ siÍ g≥os Innosa. BÛg sprawiedliwych kaza≥ swemu wybraÒcowi poprowadziÊ swÛj lud na rÛwniny i tam za≥oøyÊ krÛlestwo jego wyznawcÛw. Niebawem teø Magowie Ognia postanowili w tym miejscu za≥oøyÊ g≥Ûwne sanktuarium Innosa, a w jaskini gdzie objawi≥ siÍ Innos wznieúli o≥tarz bogu úwiat≥a.");

B_LogEntry(BookLog_NordmarAbbey,"Klasztor powsta≥y w miejscu, gdzie rozpoczyna siÍ historia KrÛlestwa Myrtany zosta≥ otoczony szczegÛlnπ opiekπ jej w≥adcÛw. Wspierany przez krÛlÛw mia≥ staÊ siÍ centralnym miejscem myrtaÒskiego Innosytyzmu. Niebawem teø sta≥ siÍ celem wÍdrÛwek pielgrzymÛw, tak z Myrtany jak i z innych zakπtkÛw úwiata.  W tym miejscu znajdowa≥a siÍ niema≥a iloúÊ pism oraz wiele magicznych artefaktÛw, choÊ wiÍkszoúÊ z nich w czasie wojny zosta≥o odes≥anych na po≥udnie, do Myrtany. W klasztornej bibliotece ma siÍ jednak znajdowaÊ rÛwnieø Kronika Dominacji, opisujπca historiÍ MagÛw Ognia i zawierajπca wiele tajemnic zakonu. Z tego teø powodu zosta≥a zapieczÍtowana niezwykle potÍønymi zaklÍciami, chroniπcymi jπ przed profanami pragnπcymi bezprawnie wejúÊ w posiadanie zarezerwowanej dla magÛw wiedzy. Do ksiÍgi tej majπ prawo zbliøyÊ siÍ jedynie najwyøsi spoúrÛd magÛwÖ");

B_LogEntry(BookLog_NordmarAbbey,"Biblioteka. To tu znajduje siÍ ksiÍgozbiÛr, ktÛry swego czasu przewyøsza≥ nawet ten z klasztoru na wyspie Khorinis. Biblioteka ma spiralnπ, schodzπcπ w dÛ≥ budowÍ, im niøej siÍ schodzi tym starsze ksiÍgi moøna znaleüÊ. Wzd≥uø schodÛw jest wiele pokoikÛw, w ktÛrych magowie mogπ poúwiÍcaÊ siÍ lekturze. Na najniøszym poziomie biblioteki znajdujπ niedostÍpne dla pielgrzymÛw tajne archiwa, w ktÛrych przechowywane sπ ksiÍgi przeznaczone jedynie dla magÛw.");

B_LogEntry(BookLog_NordmarAbbey,"åwiπtynia. Jest to najwiÍkszy budynek w Klasztorze, a takøe cel wÍdrÛwki pielgrzymÛw przybywajπcych do Nordmaru. Magowie przychodzπ tu co dzieÒ by modliÊ siÍ w tym miejscu do Innosa.");

B_LogEntry(BookLog_NordmarAbbey,"Dom magÛw. Jest to siedziba Rady Ognia z≥oøonej z piÍciu wysokich arcymagÛw klasztoru. Mieúci siÍ tu rÛwnieø nominalna siedziba najwyøszego arcymaga KrÛlestwa Myrtany, choÊ od dawna utar≥ siÍ juø zwyczaj, øe g≥owa Koúcio≥a Innosa na sta≥e zwyk≥a rezydowaÊ w sto≥ecznym Vengardzie.");

B_LogEntry(BookLog_NordmarAbbey,"Jaskinia oúwiecenia. To najwaøniejszy obiekt, do ktÛrego wstÍp majπ jedynie arcyMagowie Ognia oraz wybrani. Jest to w≥aúciwie centrum myrtaÒskiego Innosytyzmu. Znajduje siÍ w sporym pÍkniÍciu ska≥y, w ktÛrej wykuto ogromny pomnik Innosa w miejscu, gdzie wed≥ug tradycji, Pan Ognia objawi≥ siÍ Rhobarowi.");

B_LogEntry(BookLog_NordmarAbbey,"ChoÊ klasztor, bÍdπcy celem wÍdrÛwek licznych pielgrzymÛw, po≥oøony jest na ziemiach barbarzyÒskich NordmarczykÛw, ktÛry to lud w s≥ynπ≥ w przesz≥oúci z ≥upieøczych wypraw na po≥udnie, to jednak mieszkaÒcy pÛ≥nocy nie zwykli krzywdziÊ pielgrzymÛw zmierzajπcych do úwiÍtego przybytku. Sami Nordmarczycy, jako gorliwi wyznawcy Innosa, otaczajπ MagÛw Ognia oraz sam klasztor ogromnym szacunkiem i gotowi sπ go broniÊ za wszelkπ cenÍ. Dlatego teø, mimo, øe sanktuarium znajduje siÍ w krainie sπsiadujπcej z ziemiami orkÛw, to nigdy orkowie nie zdo≥ali mu realnie zagroziÊ.");

B_LogEntry(BookLog_NordmarAbbey,"Tu koÒczÍ swÛj opis klasztoru w Nordmarze, skreúlony piÛrem skromnego pielgrzyma, Aidepa Thigo");

B_LogEntry(BookLog_NordmarAbbey,"KONIEC");

};
/////////////////////////////////////////////////////////////////////

// LEGENDY ARGAA—SKIE

// SUGEROWANA LOKACJA: OPUSZCZONY SKALNY POK”J NIEOPODAL G”RSKIEJ TWIERDZY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH /d

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LegendsofArgaania (C_ITEM)

{

name ="Legendy argaaÒskie";

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

Doc_PrintLines( nDocID,  0, "Legendy argaaÒskie");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[KsiÍga opisujπca pogaÒskie legendy i wierzenia Wysp Po≥udniowych oraz Argaani.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LegendsofArgaania,LOG_NOTE);

B_LogEntry(BookLog_LegendsofArgaania,"Legendy argaaÒskie");

B_LogEntry(BookLog_LegendsofArgaania,"MieszkaÒcy Wysp Po≥udniowych od wiekÛw juø wyznajπ bogÛw, ktÛrych czci≥o i czci siÍ w KrÛlestwie Myrtany. Mimo to, jak w wiÍkszoúci krain, tak i tu, na wyspie Argaan, moøna znaleüÊ pozosta≥oúci dawnych kultÛw. G≥Ûwnym bÛstwem pogaÒskiego panteonu ArgaaÒczykÛw by≥a Bogini, ktÛra wed≥ug wierzeÒ staroøytnych mieszkaÒcÛw Wysp Po≥udniowych mia≥a staÊ na straøy harmonii i strzec rÛwnowagi we wszechúwiecie. Bogini by≥a wiÍc nieco podobna do Adanosa i pewnie dlatego dzisiejsi mieszkaÒcy wyspy chÍtniej oddajπ czeúÊ Panu Wody, niø jego boskiemu bratu bÍdπcemu Panem Ognia. Ciekawym rysem tej mitologii jest to, øe owe bÛstwo mia≥o ≥πczyÊ w sobie nawzajem zwalczajπce i rÛwnowaøπce siÍ pierwiastki chaosu i porzπdku. ");

B_LogEntry(BookLog_LegendsofArgaania,"Niekiedy z owych wierzeÒ pogaÒskich ewoluowa≥y niezwykle obrazoburcze doktryny religijne. W wyniku docierania na wyspÍ wp≥ywÛw innosyckich i adanosyckich, a byÊ moøe rÛwnieø beliaryckich, wúrÛd niektÛrych pogan wykszta≥ci≥o siÍ przekonanie, øe pod postaciπ Adanosa kryje siÍ w≥aúnie Bogini. Konsekwencjπ tego typu przekonaÒ by≥o uznanie Innosa i Beliara za spersonifikowane si≥y wewnπtrz umys≥u Bogini, majπce reprezentowaÊ elementy anarchii i ≥adu. To niezwykle obrazoburcze oczywiúcie twierdzenie, mia≥y pokutowaÊ jeszcze d≥ugo po tym jak Wyspy Po≥udniowe sta≥y siÍ krainπ adanosyckπ. Nawet dziú dziwnie øywe sπ pog≥oski jakoby w prastarym Klasztorze na Skale, zamieszka≥ym przez magÛw wody, potajemnie praktykowano kult Bogini. Niemniej inkwizycja MagÛw Ognia zbadawszy sprawÍ zaprzeczy≥a takowym rewelacjom, wiÍc naleøa≥oby je w≥oøyÊ miÍdzy bajkiÖ");

B_LogEntry(BookLog_LegendsofArgaania,"Jednπ z najbardziej znanych legend z Wysp Po≥udniowych, jest ta o pogaÒskim bÛstwie, zwanym Boginiπ i wojnie jakπ wyznawczynie tego bÛstwa toczy≥y miÍdzy sobπ. Legenda g≥osi, øe jeszcze zanim ludzie zaczÍli rzπdziÊ úwiatem, na Argaanii panowa≥ kult Bogini. By≥a ona symbolem harmonii i opiekunem natury. S≥uøy≥y jej demonice Ahn'Bael, bÍdπce ucieleúnieniem chaosu oraz siostry Ahn'Nosiri, strzegπce porzπdku. Bogini kierowa≥a swoimi s≥uøebnicami, tak by na úwiecie panowa≥a harmonia. DziÍki rÛwnowadze ludzie nie cierpieli ani niewoli chaosu, ani tyranii praw, a Bogini odbiera≥a od ludzi czeúÊ.");

B_LogEntry(BookLog_LegendsofArgaania,"PÛ≥boskie s≥uøebnice wyrwa≥y siÍ jednak spod kontroli Bogini i dosz≥o miÍdzy nimi do wojny, ktÛra by≥a bardzo wyczerpujπca dla obu stron. Wed≥ug legendy mia≥a przeøyÊ tylko jedna Ahn'Nosiri - Selena, a Ahn'Bael mia≥y pogrπøyÊ siÍ we únie i czekaÊ na czas przebudzenia. Wed≥ug legendy po wojnie kult bogini zaczπ≥ podupadaÊ i ostatecznie wypar≥a go wiara w trzy bÛstwa. Po latach na Argaanii na czo≥o wysunπ≥ siÍ rÛd z Setarrif, a jego przywÛdca, Ethorn I, podporzπdkowa≥ sobie ca≥π ArgaaniÍ oraz z nieznanych przyczyn toczy≥ zwyciÍskπ wojnÍ z Jarkendarem. ");

B_LogEntry(BookLog_LegendsofArgaania,"W ciπgu nastÍpnych wiekÛw KrÛlestwo Argaanii sprawnie prosperowa≥o, osiπgajπc coraz wyøszy poziom rozwoju. Kres potÍgi KrÛlestwu Argaanii przynios≥a dopiero ekspansja krÛla Myrtany Rhobara II, ktÛry podbi≥ Wyspy Po≥udniowe i ustanowi≥ w nich krÛlewskπ prowincjÍ. Rozpoczyna≥a siÍ nowa era w dziejach Argaani.");

B_LogEntry(BookLog_LegendsofArgaania,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// PER£A WYSP PO£UDNIOWYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA /d

// NAPISANE NA GRUNCIE ARTYKU£U Z GOTHICPEDII Z ROZWINI CIEM HISTORII LORDA DOMINIQUE

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Argaania (C_ITEM)

{

name ="Per≥a Wysp Po≥udniowych";

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

Doc_PrintLines( nDocID,  0, "Per≥a Wysp Po≥udniowych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia i opis geograficzny Argaani, z uwzglÍdnieniem podboju przez KrÛlestwo Myrtany.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Argaania,LOG_NOTE);

B_LogEntry(BookLog_Argaania,"Per≥a Wysp Po≥udniowych");

B_LogEntry(BookLog_Argaania,"Argaan, zwana teø Argaaniπ to wysuniÍta najbardziej na pÛ≥noc wyspa archipelagu Wysp Po≥udniowych, a dziú czÍúÊ KrÛlestwa Myrtany. Do krÛlestwa przy≥πczy≥ jπ krÛl Rhobar w czasie przes≥awnej kampanii wojennej, w czasie ktÛrej odznaczyÊ siÍ mia≥ Lord Dominique.");

B_LogEntry(BookLog_Argaania,"Argaania posiada gÛrzystπ rzeübÍ terenu o skalistym pod≥oøu. Jest zapewne wyspπ pochodzenia wulkanicznego, o czym úwiadczy jej stopniowo obniøajπca siÍ od centrum wyspy wysokoúÊ bezwzglÍdna nad poziomem morza oraz bogata rzeüba, urozmaicona licznymi wzgÛrzami, nierÛwnoúciami, urwiskami, kotlinami i klifami. Znamiennπ czÍúÊ wyspy zajmuje pasmo GÛry Bia≥ookiej, ktÛrej niedostÍpne szczyty nie zosta≥y zbadane przez cz≥owieka. Zdecydowanπ wiÍkszoúÊ linii brzegowej wyspy stanowiπ klify. Plaø i ≥agodnych brzegÛw jest bardzo ma≥o i sπ niewielkich rozmiarÛw. Eksploracja Argaanii jest utrudniona ze wzglÍdu na wystÍpowanie licznych pasm wzgÛrz oraz ska≥, ktÛrych uniemoøliwiajπcymi piechurowi przemarsz. PoszczegÛlne jej krainy oddzielone sπ od siebie wπskimi prze≥Íczami, ktÛre ze strategicznego punktu widzenia, stwarzajπ wiele moøliwoúci ataku oraz obrony.");

B_LogEntry(BookLog_Argaania,"W pÛ≥nocnej oraz zachodniej czÍúci Argaanii dominuje klimat umiarkowany. PodstawÍ roúlinnoúci stanowiπ gÍste trawy, niskie krzewy oraz lasy iglaste, liúciaste i mieszane. Pospolicie spotykanymi roúlinami sπ ziela lecznicze, ziela many i ogrzyliúcie. Powszechnie wystÍpujπcπ zwierzynπ sπ wilki, úcierwojady, dziki i krwiopijcy. Stale wzrasta takøe populacja goblinÛw. Klimat sprzyja osadnictwu oraz uprawie roli, a okoliczne wody zasobne sπ w ryby. Dlatego w  tej strefie klimatycznej wystÍpuje najwiÍcej skupisk ludnoúci argaaÒskiej ñ miÍdzy innymu miasta: Stewark oraz Thorniara, Zamek SrebrowÛd czy obozowiska na po≥y adanosyckich GoÒcÛw Leúnych, ktÛrzy niegdyú zamieszkiwali rÛwnieø MyrtanÍ.");

B_LogEntry(BookLog_Argaania,"Po≥udnie oraz wschÛd wyspy zdominowa≥ klimat tropikalny. Na po≥udniu wykszta≥ci≥o siÍ wielkie bagno, ponad ktÛrym wznosi siÍ ogromne drzewo Tooshoo, ktÛremu przypisuje siÍ w≥aúciwoúci magiczne ñ zapewne wiara takowa wywodzi siÍ jeszcze z czasÛw pogaÒskich. Na owych bagnach wystÍpuje bardzo bujna szata roúlinnoúci ñ od paproci, przez palmy, po ogromne drzewa o roz≥oøystych koronach i rozwarstwiajπcych siÍ u nasady pniach. Rejon ten zasobny jest takøe w bagienne ziele, ktÛre stanowi sk≥adnik zanej uøywki. Na nieprzygotowanego wÍdrowca w terenach czai siÍ tam jednak wiele niebezpieczeÒstw: podmok≥e pod≥oøe, gorπca temperatura, bardzo wysoka wilgotnoúÊ powietrza oraz wiele okazÛw egzotycznych zwierzπt, takich jak wÍøe b≥otne, jaszczury, topielce, zÍbacze oraz krwiopijce.");

B_LogEntry(BookLog_Argaania,"WschÛd wyspy z kolei pokrywa gÍsta oraz niebezpieczna døungla. Ze wzglÍdu na bardzo ciÍøkie warunki klimatyczne oraz terenowe w wiÍkszoúci jest ona niezamieszka≥a. Døungla jest natomiast domem dla wielu egzotycznych gatunkÛw zwierzπt, m.in. brzytwiakÛw, úcierwojadÛw, koúciojadÛw, szuwarnikÛw, a nawet cieniostworÛw i trolli. Mimo wszystko w sercu døungli zlokalizowane jest prastare miasto Setarrif, bÍdπce jednoczeúnie stolicπ wyspy.");

B_LogEntry(BookLog_Argaania,"Po≥udniowo-wschodni kraniec wyspy to ja≥owy oraz wulkaniczny obszar Czarnych JarÛw ñ sieci stromych wzgÛrz, wπwozÛw oraz klifÛw. Ten obszar prawdopodobnie w ogÛle nie pozwala na osadnictwo, jednak na wyskoim klifie na skraju wyspy po≥oøony jest pradawny klasztor, znajdujπcy siÍ w posiadaniu tamtejszych magÛw wody.");

B_LogEntry(BookLog_Argaania,"Samo centrum Argaani stanowi pasmo GÛry Bia≥ookiej. Wysokie po≥oøenie nad poziomem morza sprawia, øe pasmo gÛrskie pokrywa warstwa wiecznego úniegu, a obszar nie nadaje siÍ do zamieszkania.");

B_LogEntry(BookLog_Argaania,"NajwiÍksze skupiska ludnoúci zlokalizowane sπ w miastach i osadach oraz ich okolicach. NajwiÍcej skupisk ludnoúci znajduje siÍ w zachodniej oraz pÛ≥nocnej czÍúci wyspy, w ktÛrej to warunki klimatyczne sπ najdogodniejsze. Tutaj teø powsta≥y najwiÍksze ludzkie osady na wyspie. MieszkaÒcy Argaanii trudniπ siÍ rÛønorodnymi zawodami. Dominujπcymi sπ kupiectwo, ≥owiectwo oraz alchemia, lecz spora czÍúÊ ludnoúci zajmuje siÍ rÛwnieø uprawπ roli i rybo≥Ûwstwem. W Setarrif z kolei powaønπ rolÍ odgrywa tkactwo oraz zdobnictwo, o czym úwiadczπ wyjπtkowo ozdobione szaty setarrifczykÛw. ");

B_LogEntry(BookLog_Argaania,"Podzia≥ spo≥eczny obejmuje klasy moønow≥adztwa, do ktÛrego wliczajπ siÍ przede wszystkim rycerstwo, magowie, osoby z krÍgÛw rzπdzπcych miastami i spokrewnione z dworem setarrifskim, oraz klas niøszych, takich jak szeroko rozumiane mieszczaÒstwo, ch≥opstwo, rybacy czy myúliwi. Niewielkπ czÍúÊ populacji stanowiπ rÛwnieø imigranci z Myrtany oraz Khorinis, ktÛrzy w wiÍkszoúci nap≥ynÍli tu juø po podboju Wysp Po≥udniowych przez krÛla Rhobara. CzÍúÊ z nich to urzÍdnicy, lub rzadziej osadnicy wojskowi, choÊ coraz czÍúciej moøna tu teø spotkaÊ cywilnych MyrtaÒczykÛw. ");

B_LogEntry(BookLog_Argaania,"Na Argaanii swe naturalne siedziby majπ rÛwnieø orkowie. Rasa orkÛw argaaÒskich stoi na zdecydowanie niøszym poziomie od orkÛw z kontynentu, lecz nieznacznie wyøszym od odmiany z Khorinis. Dwa orkowe szczepy majπ swoje siedziby w jaskiniach w Srebrowodzie oraz w jaskinich miÍdzy bagnami a Czarnymi Jarami.");

B_LogEntry(BookLog_Argaania,"Granice jednostek admnistracyjnych Argaanii zosta≥y oparte w przybliøeniu na podstawie rzek, pasm gÛrskich oraz wπwozÛw. Prawdopodobnie zosta≥y wytyczane wraz z rozwojem KrÛlestwa Argaanii, jednak po podboju przez MyrtanÍ zosta≥y zachowane. ");

B_LogEntry(BookLog_Argaania,"Na wyspie znajdujπ siÍ rÛwnieø wieøe straønicze, ktÛre zosta≥y postawione przez jednego z krÛlÛw Wysp Po≥udniowych. Ich system ostrzegawczy polega na tym, øe gdy straønicy bÍdπ widzieli z jednej z wieø statki nieprzyjaciela, zapalπ ogieÒ ostrzegawczy. Wtedy zauwaøa to druga wieøa, potem trzecia i tak sygna≥ dociera do najbliøszego miasta, gdzie organizowano oddzia≥y do obrony. Takie wieøe do dziú znajdujπ siÍ na terenie wokÛ≥ brzegÛw wyspy Argaan, a krÛl Rhobar II do≥oøy≥ wszelkich staraÒ by je odbudowaÊ i odnowiÊ ich system.");

B_LogEntry(BookLog_Argaania,"G≥Ûwnym miastem wyspy i za razem stolicπ przedmyrtaÒskiego KrÛlestwa jest Setarrif ñ po≥oøony na wschodzie wyspy kompleks pa≥acÛw, bÍdπcy siedzibπ g≥owy paÒstwa, dworu krÛlewskiego oraz moønow≥adztwa. Miasto oprÛcz funkcji reprezentacyjnej, pe≥ni rÛwnieø funkcjÍ obronnπ. W obrÍbie Setariff znajduje siÍ rÛwnieø kopalnia licznych szlachetnych minera≥Ûw, m.in. z≥ota i magicznej rudy, co od wiekÛw zapewnia≥o miastu dostatek.");

B_LogEntry(BookLog_Argaania,"Na pÛ≥wyspie na pÛ≥nocy leøy najwiÍksze miasto wyspy ñ Thorniara. Osada sta≥a siÍ siedzibπ w≥adz myrtaÒskich po podboju Argaanii. Po wygranej kampanii, osiad≥ w niej pierwszy krÛlewski namiestnik wysp, Lord Dominique.");

B_LogEntry(BookLog_Argaania,"W czasie krÛtkiego okresu swego panowania Lorda Dominique, prÛbowa≥ on nak≥oniÊ jej mieszkaÒcÛw wysp do wiÍkszego poszanowania dla Innosa, gdyø dotychczas kult po≥udniowcÛw skupia≥ siÍ na Adanosie, a Innos pozostawa≥ niejako w cieniu swego boskiego brata. W celu nawrÛcenia mieszkaÒcÛw Wysp Po≥udniowych, pochowa≥ z≥ote posπøki Innosa po ca≥ej wyspie. Lud Argaanii jednak nie wykaza≥ siÍ znacznym zapa≥em w poszukiwaniach; znalezionymi posπøkami zaczÍto handlowaÊ. Lord Dominique siÍ tym bardzo zasmuci≥. Bohater wojenny nie czujπc siÍ dobrze w roli zarzπdcy, a takøe czujπc niechÍÊ czy nawet nienawiúÊ mieszkaÒcÛw wysp do jego osoby prosi krÛla o odebranie mu jego funkcji i oddelegowanie go do walk na froncie.");

B_LogEntry(BookLog_Argaania,"Rhobar II przysta≥ na proúbÍ zas≥uøonego paladyna i namiestnikiem Argaani, a co za tym idzie rÛwnieø wszystkich pozosta≥ych wysp archipelagu mianowa≥ Lorda Trontera. Rycerz ten, choÊ nie by≥ czÍúciπ paladynem, to sprawowa≥ namiestnictwo nad Srebrowodem, bÍdπcym jednπ z prowincji argaaÒskich. W przysz≥oúci Lord Dominique mia≥ powrÛciÊ na ArganiÍ, gdyø po tym jak poleg≥ w czasie walk z orkami, szczπtki jego zosta≥y sprowadzone na wyspÍ, na ktÛrej odniÛs≥ swe najwiÍksze zwyciÍstwo, ktÛre zapewni≥o mu nieúmiertelnoúÊ wúrÛd potomnych. Zosta≥ pochowany w grobowcu niedaleko Thorniary. ");

B_LogEntry(BookLog_Argaania,"Ze wzglÍdu na duøy port oraz po≥oøenie na szlaku handlowym, Thorniara ma kluczowe znaczenie gospodarcze, a dziÍki potÍønej twierdzy i murom obronnym, posiada ogromne walory obronne i militarne. Miastu podlegajπ rÛwnieø okoliczne wioski i farmy.");

B_LogEntry(BookLog_Argaania,"ZachÛd wyspy obejmuje Baronia Stewark. Po≥oøony na przeciÍciu szlakÛw handlowych region jest rÛwnieø zapleczem rolniczym i rybackim ca≥ej wyspy. PieczÍ nad prowincjπ sprawuje silnie ufortyfikowane miasto-twierdza Stewark.");

B_LogEntry(BookLog_Argaania,"W centralnej czÍúci wyspy leøy Baronia SrebrowÛd. W jej obrÍbie znajduje siÍ siedziba GoÒcÛw Leúnych, siedlisko orkÛw, stolicÍ administracyjnπ regionu stanowi zaú Zamek SrebrowÛd. Prowincja ta nastawiona jest przede wszystkim na ≥owiectwo oraz wymianÍ handlowπ z przyjaünie nastawionym do ludzi klanem orkÛw.");

B_LogEntry(BookLog_Argaania,"Na klifie na po≥udniowo-wschodnim pÛ≥wyspie Argaanii mieúci siÍ klasztor, w ktÛrym mnisi oddajπ czeúÊ Adanosowi, choÊ niektÛre pog≥oski uporczywie twierdzπ, jakoby w murach tych mia≥ przetrwaÊ pogaÒski kult Bogini wyznawanej niegdyú na wyspie.");

B_LogEntry(BookLog_Argaania,"KONIEC");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM I

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart1,LOG_NOTE);

B_LogEntry(BookLog_Markwart1,"Kodeks Markwarta. Tom I");

B_LogEntry(BookLog_Markwart1,"Dla poøytku potomnoúci, uczony Markwart, zebra≥ ch≥opskie prawo zwyczajowe obowiπzujπce w okolicach Montery i wyda≥ w kilku tomach. Za zgodπ i z b≥ogos≥awieÒstwem KrÛla, podjπ≥ siÍ opracowania jednolitego sposobu postÍpowania w sprawach wiejskich, by w ca≥ym paÒstwie obowiπzywa≥o wspÛlne prawo w tej materii. ");

B_LogEntry(BookLog_Markwart1,"ZbiÛr praw uwzglÍdnia tylko przypadki mogπce mieÊ miejsce w úrodowisku ch≥opskim. PominiÍto przy tym miasta, gdyø te posiadajπ odrÍbne przywileje dane im od monarchÛw i panÛw feudalnych.  W spisie tym prÛøno szukaÊ odpowiedzi na pytania, w jaki sposÛb karaÊ zabÛjstwa, oszustwa, czy krzywoprzysiÍstwo. ");

B_LogEntry(BookLog_Markwart1,"Wymienionych wyøej przestÍpstw jako mogπcych mieÊ miejsce rÛwnieø poza wsiπ, naleøy szukaÊ w bardziej ogÛlnych zbiorach praw, ktÛrych zapisy obowiπzujπ takøe ch≥opÛw.†Z woli mi≥oúciwego krÛla Rhobara II, jedynego w≥adcy Myrtany i namiestnika Innosa na ziemi, do rπk czytelnika trafia nowe wydanie tego dzie≥a.");

B_LogEntry(BookLog_Markwart1,"Ku Chwale Pana Ognia, co bogiem jest prawa i porzπdku. Redagowa≥†Socius z Vengardu");

B_LogEntry(BookLog_Markwart1,"Rozdzia≥ I: O pozwie");

B_LogEntry(BookLog_Markwart1,"ß1. Jeøeli zgodnie z krÛlewskimi prawami ktoú zostanie pozwany przed sπd i nie stawi siÍ przed jego oblicze, zostanie zasπdzony na zap≥atÍ 300 sztuk z≥ota, o ile nie powstrzyma≥a go od stawienia siÍ si≥a przemoøna.");

B_LogEntry(BookLog_Markwart1,"ß2. Ten zaú kto pozwa≥ innego a sam nie stawi≥ siÍ przed oblicze sπdu, jeøeli go nie powstrzyma≥a si≥a przemoøna zap≥aci 300 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart1,"KONIEC TOMU I");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM II

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart2,LOG_NOTE);

B_LogEntry(BookLog_Markwart2,"Kodeks Markwarta. Tom II");

B_LogEntry(BookLog_Markwart2,"Rozdzia≥ II: O kradzieøy wieprzÛw†");

B_LogEntry(BookLog_Markwart2,"ß1. Jeøeli ktoú ukradnie prosiÍ od maciory z zagrody i zostanie mu to udowodnione bÍdzie zasπdzony na 24 sztuk z≥ota†");

B_LogEntry(BookLog_Markwart2,"ß2. Jeøeli ktoú ukradnie prosiÍ mogπce øyÊ bez maciory i zostanie mu to udowodnione, bÍdzie zasπdzony na 36 sztuk z≥ota");

B_LogEntry(BookLog_Markwart2,"ß3. Jeøeli ktoú ukradnie dwuletniπ úwiniÍ bÍdzie zasπdzony na 50 sztuk z≥ota oraz zap≥atÍ szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß4. Jeøeli ktoú ukradnie odyÒca zostanie zasπdzony na 50 sztuk z≥ota oraz zap≥atÍ jego wartoúci i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß5. Jeøeli ktoú ukradnie karmiπcπ maciorÍ zap≥aci 60 sztuk z≥ota, a ponadto zap≥aci odszkodowanie i kwotÍ za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß6. Jeøeli ktoú ukradnie wieprza przeznaczonego na ofiarÍ, a ten kto go postrada≥ przy pomocy úwiadkÛw udowodni, øe by≥o to zwierzÍ ofiarne bÍdzie zasπdzony na 75 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß7. Jeøeli ktoú ukradnie wieprza nie przeznaczonego na ofiarÍ bÍdzie zasπdzony na 40 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"KONIEC TOMU II");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM III

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart3,LOG_NOTE);

B_LogEntry(BookLog_Markwart3,"Kodeks Markwarta. Tom III");

B_LogEntry(BookLog_Markwart3,"Rozdzia≥ III: O kradzieøy krÛw");

B_LogEntry(BookLog_Markwart3,"ß1. Jeøeli ktoú ukradnie cielÍ od krowy i zostanie mu to udowodnione zasπdzony bÍdzie na 340 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart3,"ß2. Jeøeli ktoú ukradnie cielÍ mogπce øyÊ bez krowy i zostanie mu to udowodnione, bÍdzie zasπdzony na 54 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart3,"ß3. Jeøeli ktoú ukradnie dwuletniπ krowÍ zostanie zasπdzony na 70 sztuk z≥ota oraz zap≥atÍ szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß4. Jeøeli ktoú ukradnie byka zostanie zasπdzony na 80 sztuk z≥ota oraz zap≥atÍ jego wartoúci i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß5. Jeøeli ktoú ukradnie karmiπcπ krowÍ zap≥aci 80 sztuk z≥ota, a ponadto zap≥aci odszkodowanie i kwotÍ za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß6. Jeøeli ktoú ukradnie byka przeznaczonego na ofiarÍ, a ten kto go postrada≥ przy pomocy úwiadkÛw udowodni, øe by≥o to zwierzÍ ofiarne zostanie zasπdzony na 80 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß7. Jeøeli ktoú ukradnie wieprza nie przeznaczonego na ofiarÍ zostanie zasπdzony na 70 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"KONIEC TOMU III");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IV

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart4,LOG_NOTE);

B_LogEntry(BookLog_Markwart4,"Kodeks Markwarta. Tom IV");

B_LogEntry(BookLog_Markwart4,"Rozdzia≥ IV: O kradzieøy owiec i kÛz†");

B_LogEntry(BookLog_Markwart4,"ß1. Jeøeli ktoú ukradnie jagniÍ, kozy zostanie zasπdzony na 7 sztuk z≥ota oraz sp≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß2. Jeøeli ktoú ukradnie rocznego lub dwuletniego barana zostanie skazany na 120 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß3. Jeøeli ktoú ukradnie owce zostanie skazany na 20 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart4,"ß4. Jeøeli ktoú ukradnie ma≥π kozÍ zostanie zasπdzony na 7 sztuk z≥ota oraz sp≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß5. Jeøeli ktoú ukradnie rocznego lub dwuletniego koz≥a zostanie skazany na 12 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß6. Jeøeli ktoú ukradnie kozÍ, zostanie skazany na 20 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"KONIEC TOMU IV");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM V

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart5,LOG_NOTE);

B_LogEntry(BookLog_Markwart5,"Kodeks Markwarta. Tom V");

B_LogEntry(BookLog_Markwart5,"Rozdzia≥ V: O kradzieøy psÛw i pszczÛ≥");

B_LogEntry(BookLog_Markwart5,"ß1. Jeøeli ktoú ukradnie tresowanego psa ≥owieckiego zostanie skazany na 40 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß2. Jeøeli ktoú ukradnie charta - naganiacza zostanie skazany na 40 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß3. Jeøeli ktoú ukradnie lub zabije psa pasterskiego zostanie skazany na 120 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß4. Kto ukradnie jeden lub wiÍcej pni pszczÛ≥ pozostajπcych w zamkniÍciu i pod dachem zostanie skazany na 80 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart5,"ß5. Kto ukradnie jeden lub wiÍcej uli z pszczo≥ami pozostajπcymi na otwartej przestrzeni zostanie skazany na 50 sztuk z≥ota,†oprÛcz odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart5,"KONIEC TOMU V");

};

/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IX

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

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

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu Magicznej Bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart9,LOG_NOTE);

B_LogEntry(BookLog_Markwart9,"Kodeks Markwarta. Tom IX");

B_LogEntry(BookLog_Markwart9,"Rozdzia≥ IX: O szkodach wyrzπdzonych w zasiewach, lub w innych ogrodzonych uprawach");

B_LogEntry(BookLog_Markwart9,"ß1. Kto cudze zwierzÍ, konia lub wo≥u oznakuje zostanie skazany na 180 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß2. Kto zastanie w swoich zasiewach cudze byd≥o, nie moøe go zabiÊ. Gdyby to uczyni≥ i obwieúci≥, winien wynagrodziÊ szkodÍ, a to co zabi≥ zachowa dla siebie. Jeøeli jednak tego nie og≥osi≥ a zostanie mu to udowodnione, bÍdzie on skazany na 150 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß3. Kto w swoich zasiewach zastanie cudze byd≥o bez nadzoru i zamknie je w ukryciu nie og≥aszajπc tego, a czÍúÊ byd≥a zdechnie zostanie on skazany na 160 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß4. Kto przez swoje niedbalstwo wyrzπdzi krzywdÍ u wo≥u lub innego zwierzÍcia i wyzna to swojemu panu winien wynagrodziÊ szkodÍ. Jeøeli jednak k≥amie, a zostanie mu to udowodnione zostanie on skazany na 120 sztuk z≥ota, oprÛcz wynagrodzenia szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß5. Kto czyjeú úwinie lub byd≥o pozostajπce pod straøπ pastucha wpÍdzi w cudze zasiewy i mimo jego wykrÍtÛw zostanie mu to udowodnione zostanie on skazany na 200 sztuk z≥ota, oprÛcz odszkodowania strat i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß6. Jeøeli czyjeú zwierze zostanie zajÍte z powodu wyrzπdzonych szkÛd na cudzym polu, w≥aúciciel zwierzÍcia wynagrodzi poniesione straty a nadto zap≥aci 100 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart9,"ß7. Jeøeli ktoú kierujπc siÍ wrogoúciπ lub zuchwa≥oúciπ waøy siÍ si≥π odebraÊ byd≥o zajÍte z tytu≥u szkÛd wyrzπdzonych w polu lub wykraúÊ je spod zamkniÍcia zastanie skazany na 200 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart9,"ß8. Kto otwiera cudze ogrodzenia i na jakiekolwiek uprawy skieruje trzodÍ, co zostanie przez úwiadkÛw udowodnione, zostanie on skazany na rzecz poszkodowanego na wyrÛwnanie szacowanych strat a ponadto na 200 sztuk z≥ota.†");

B_LogEntry(BookLog_Markwart9,"KONIEC TOMU IX");

};