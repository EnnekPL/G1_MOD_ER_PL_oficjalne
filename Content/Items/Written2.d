//Ksi�gi do zada� z Mrocznym Bractwem
var int darksect1Czytane;
var int darksect2Czytane;
var int darksect3Czytane;
var int darksect4Czytane;
var int darksect5Czytane;
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_01(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 1";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 1";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_01;
};

	FUNC VOID Use_DarkSect_01()
	{   
	if (darksect1Czytane == false)
	{
	  MIS_MroczneBractwo = LOG_RUNNING;

    Log_CreateTopic            (CH1_MroczneBractwo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MroczneBractwo, LOG_RUNNING);
    B_LogEntry                     (CH1_MroczneBractwo,"Ksi�ga kt�r� otrzyma�em od Magnusa zawiera�a ciekaw� histori�. Mo�e warto pozna� dalsz� tre�� tej opowie�ci?");
B_GiveXP (200);
darksect1Czytane = true;
};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, " Klasztor mnich�w sta� na kraw�dzi skalnego klifu. By�a to budowla solidna o mocnych fundamentach. W ko�cu przy budowie pomagali najlepsi in�ynierowie znani na Khorinis. W najbardziej wysuni�tej w stron� morza cz�ci kompleksu znajdowa�a si� wie�a. Niegdy� s�u�y�a za czytelni� jednak p�niej jej rola si� zmieni�a. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "To w�a�nie te skromne i zimne mury sta�y si�  nasz� w�asn� �wi�tyni�. Czytelnik z pewno�ci� nie zrozumie tych wyrwanych z kontekstu zda�. Spiesz� wi�c z pomoc�. Wszystko zacz�o si� gdy Elner znalaz� ksi�g� w kt�rej opisane by�y prastare techniki walki skrytych zab�jc�w. Postanowi� posi��� wiedz� legendarnych skrytob�jc�w. ");
					Doc_Show		( nDocID );
					
	};
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_02(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 2";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 2";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_02;
};

	FUNC VOID Use_DarkSect_02()
	{ 
		if (darksect2Czytane == false)
	{
	  B_GiveXP (200);
    B_LogEntry                     (CH1_MroczneBractwo,"Z drugiego tomu sagi dowiedzia�em si�, �e uczniowie klasztoru posiadali wiedz� pradawnych zab�jc�w. W Wie�y Mgie� znale�li cenn� bro�, kt�r� ukryli w cytadeli.");
darksect1Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Razem z Finarem zostali�my szybko wci�gni�ci do sekty. Elner by� bowiem naszym wiernym przyjacielem. Nigdy nie mia�em w r�kach porz�dnej broni bia�ej� Od tamtej pory wszystko si� zmieni�o. Szybko zacz��em si� uczy� umiej�tno�ci bojowych zaniedbuj�c lekcje magii. Z czasem do naszego kr�gu dopu�cili�my Rona � nowego ucznia.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Kolejnym prze�omem by�a noc, podczas kt�rej Elner postanowi� z�ama� zakaz Mistrza. Chcia� dosta� si� do katakumb pod Wie�� Mgie�. Uwa�a�, �e znajdzie tam jak�� wskaz�wk� dotycz�c� zab�jc�w. I rzeczywi�cie mu si� to uda�o. Zdobyli�my wspania�e szaty legendarnych zab�jc�w. Ale najwa�niejsza by�a bro�, kt�r� postanowili�my ukry� w starej cytadeli�");
					Doc_Show		( nDocID );
	};	
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_03(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 3";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 3";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_03;
};

	FUNC VOID Use_DarkSect_03()
	{   
			if (darksect2Czytane == false)
	{
	   B_GiveXP (400);
    B_LogEntry                     (CH1_MroczneBractwo,"Niedoszli asasyni musieli opu�ci� klasztor. Wszystkie zgromadzone bronie ukryli w katakumbach na szczycie, na kt�rym niegdy� sta�a cytadela. ");
darksect3Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Bro�, pancerze, amulety� Wszystkie znalezione pozosta�o�ci po asasynach zabrali�my ze sob�. Klasztor nie by� ju� bezpiecznym miejscem. Musieli�my ukry� nasze rzeczy gdzie� indziej. Elner chcia� wykorzysta� pozosta�o�ci prastarej budowli znajduj�cej si� na wzniesieniu w centrum doliny.  Pron odkry� drog� do sekretnych katakumb. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Ciche, zapomniane miejsce na szczycie g�ry uznali�my za nasz� now� kryj�wk�. Mogli�my si� wreszcie skupi� na mieczu znalezionym w wie�y. L�ni�ce, d�ugie ostrze. Pocz�tkowo zdziwi�o nas, �e nie jest to sztylet. Brakowa�o tylko czaru wskrzeszaj�cego poleg�ych wrog�w. ");
					Doc_Show		( nDocID );
	};	

/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_04(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 4";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 4";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_04;
};

	FUNC VOID Use_DarkSect_04()
	{   
				if (darksect4Czytane == false)
	{
	 B_GiveXP (550);
    B_LogEntry                     (CH1_MroczneBractwo,"Asasyni pr�bowali zakl�� miecz, jednak czar spocz�� nie na tym ostrzu na kt�rym planowano. Zakl�ta bro� do tej pory nie zosta�a odnaleziona.  Tymczasem Nowicjusze zostali wyrzuceni z klasztoru. Zacz�li zabija� dla pieni�dzy i s�awy.");
darksect4Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Z zapis�w pozostawionych przez asasyn�w dowiedzieli�my si�, �e pr�ba zakl�cia miecza uda�a si�. Jednak nie na tym mieczu, kt�ry znale�li�my. Przez przypadek inne ostrze pad�o ofiar� zakl�cia. Fala czarnej energii spowodowa�a o�ywienie martwych cia� marynarzy. Skrytob�jcy nie mog�c sobie poradzi� w otwartej walce musieli opu�ci� wie�e. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  );  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID, 1, "Wiele lat szukali�my zakl�tego ostrza. Nasze wysi�ki posz�y na marne. Z czasem wyrzucono nas z klasztoru. Zostali�my z niczym. Elner postanowi�, �e wykorzystamy swoje nowe umiej�tno�ci. Zacz�li�my zabija� dla z�ota. Stali�my si� znani w�r�d rzezimieszk�w i oprych�w. Pocz�tkowo podoba�o mi si� to. P�niej wszystko si� zmieni�o.");
					Doc_Show		( nDocID );
	};		
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_05(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 5";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 5";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_05;
};

	FUNC VOID Use_DarkSect_05()
	{   
	if (darksect5Czytane == false)
	{
	  B_GiveXP (550);
    B_LogEntry                     (CH1_MroczneBractwo,"Nieprzygotowani do zabijania niedoszli asasyni powoli zacz�li si� rozsypywa�. G��wny za�o�yciel Mrocznego Bractwa na tyle wci�gn�� si� w �wiat asasyn�w, �e zapomnia� o przyjacio�ach. Nieznany mi z imienia przyjaciel Elnera postanowi� zabi� przyjaciela. Chcia� pom�ci� wszystkich, kt�rzy niewinnie zgin�li z r�ki Mrocznego Bractwa. Wojownicy stoczyli walk�. Walczyli do ko�ca. �aden z nich nie prze�y�. Po Mrocznym Bractwie pozosta�y wy��cznie kroniki...");
    B_GiveXP (550);
	darksect5Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Pierwszy wypali� si� Ron. By� z nas najm�odszy. Nie radzi� sobie z tym wszystkim. Cz�sto musieli�my zabija� niewinnych ludzi, kt�ry poza tym, �e byli przeszkod� w karierze kogo� innego nic z�ego nie zrobili. Powiesi� si� na drzewie w pobli�u cytadeli. Pron d�ugo nie m�g� si� pogodzi� ze �mierci� towarzysza. By� tak roztrz�siony, �e kilka dni p�niej zosta� zabity przy wykonywaniu zlecenia. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Zosta�em tylko ja z Elnerem. Elner w og�le nie przej�� si� �mierci� ani Rona, ani Prona. Wtedy do mnie dotar�o, �e to ju� nie ten cz�owiek co kiedy�. Postanowi�em go zabi�, aby pom�ci� wszystkich niewinnych, kt�rzy zgin�li z naszej r�ki. Dzi� w cytadeli poleje si� krew�");
					Doc_Show		( nDocID );
	};	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_Tower01(C_Item)
{	
	name 					=	"Wyprawa do Wie�y Mgie� TOM 1";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Wyprawa do Wie�y Mgie�";
		TEXT[2]				=	 "TOM 1";
	TEXT[5]					=	 NAME_Value;
	COUNT[5]				=	 value;
	on_state[0]				=	Use_DarkSectTower_01;
};

	FUNC VOID Use_DarkSectTower_01()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wyprawa"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "W tym tomie streszcz� to czego dowiedzia�em si� o Wie�y Mgie�. O tej tajemniczej budowli s�ysza�em wiele. Pono� w zamierzch�ych czasach mia�a s�u�y� jako latarnia morska, jednak w jej okolicy nie wida� �adnych �lad�w budowy portu lub czegokolwiek zwi�zanego z �eglug�. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Bardziej prawdopodobne, �e s�u�y�a jako krypta do chowania martwych �eglarzy i wilk�w morskich. Sensowna wydaje si� opowie�� ��cz�ca obie wersje wydarze�: zarz�dzono budow� latarni jednak z nieznanych powod�w zako�czono prac�. Zrezygnowano r�wnie� z budowy portu. Wkr�tce u wybrze�y rozbi� si� statek. Martwych �eglarzy pochowano w�a�nie w wie�y. ");
					Doc_Show		( nDocID );
	};		
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_Tower02(C_Item)
{	
	name 					=	"Wyprawa do Wie�y Mgie� TOM 2";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	"Wyprawa do Wie�y Mgie�";
		TEXT[2]				=	"TOM 2";
	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	Use_DarkSectTower_02;
};

	FUNC VOID Use_DarkSectTower_02()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wyprawa"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Co ma to wsp�lnego z tajemniczymi skrytob�jcami? Nie mam poj�cia. Wed�ug �r�de�, kt�re znalaz� Elner, skrytob�jcy byli rozproszeni po ca�ej dolinie. Gdy wszyscy zapomnieli o  marynarzach, widocznie musieli zaj�� wie�� i wykorzysta� j� jako swoj� kryj�wk�. P�niej postanowili opu�ci� nowe miejsce�");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Nie bez powodu. Asasyni rozpocz�li eksperymentowa� z czarn� magi�. Chcieli stworzy� pot�n� bro�, kt�ra potrafi wskrzesi� martwego wroga i wykorzysta� go jak swego s�ug�. Szybko okaza�o si�, �e nie jest to �atwe. Przez przypadek nieudolni magowie o�ywili za�og� ca�ego statku. Wielu z nich zgin�o w walce. To ich pancerze znale�li�my w wie�y. ");
					Doc_Show		( nDocID );
	};		