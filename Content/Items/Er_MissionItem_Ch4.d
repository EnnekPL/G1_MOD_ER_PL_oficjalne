/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4.5
******* PRZEDMIOTY FABULARNE MODYFIKACJI
******* Opis: Znajduj� si� tutaj r�norodne przedmioty niezb�dne
******* do wykonania zada� pobocznych i g��wnych. Przedmioty s�
******* zwi�zane wy��cznie z modyfikacj�.
******* GOTHIC1210
*****************************************************/

/****************************************************
******* KAMIE� Z OPUSZCZONEJ KOPALNI
******* Opis: ten kamie� przypomina wygl�dem kolejny kamie�
******* ogniskuj�cy. Poszukuje go Corristo. Znajdujemy 
******* go przy ciele nekromanty Isenthora.
*****************************************************/
INSTANCE Focus_Corristo(C_Item)
{	
	name 				=	"Kamie� z opuszczonej kopalni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Ten kamie� potrafi zjednoczy� moc";
	TEXT[2]				=	"pochodz�c� z wielu magicznych �r�de�.";
};

/******************************************************************************************/
INSTANCE ItWrWorldmapDrax(C_Item)
{	
	name 					=	"Mapa dzia�a� Bandyt�w";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapDrax;

	description				= name;
	TEXT[0]					= "To zwyk�a mapa Koloni";
	TEXT[1]					= "na kt�rej zaznaczono";
	TEXT[2]					= "miejsca star� Bandyt�w.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapDrax()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_Drax.tga", 	1	);  //  1 -> DO NOT SCALE 

					Doc_Show		( nDocID 	);
	};

/******************************************************************************************/
INSTANCE  draxAmulet(C_Item)
{
	name 			=	"Amulet Draxa";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	60;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_DraxAm;
	on_unequip		=	UnEquip_DraxAm;

	description		= "Amulet Draxa";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_DraxAm()
	{
	 	self.protection [PROT_FIRE] += 7;
	};


	FUNC VOID UnEquip_DraxAm()
	{
		self.protection [PROT_FIRE] -= 7;
	};
	
/********************************************************************************/
INSTANCE ItMi_Listdraxa (C_Item)
{	
	name 				=	"Ostatni list Draxa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsedraxList;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"List pozostawiony przez Draxa";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void UseDraxList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Nie tak mia�o to wszystko wygl�da�. Ten list jest moj� spowiedzi� przed �mierci�. Przyznaj� si� do zabicia moje przyjaciela Ratforda. Pok��cili�my si� o rud� i w z�o�ci rani�em go �miertelnie. Zobaczyli to Stra�nicy patroluj�cy okolic� i zaproponowali mi wsp�prac�. Zaoferowali mi rud� w zamian za wyprowadzenie z obozu tego kolesia, kt�rego imienia nawet nie znam. Podwajali nagrod� za wyprowadzenie Quentina wraz z nim. Um�wili�my si�, �e zbior� si� w du�ej grupie na posterunku przy mo�cie. "	);
					Doc_PrintLines	( nDocID,  0, "Jednak wszystko si� posypa�o, bo z niewiadomych dla mnie przyczyn nie zd��yli si� zebra�. Na domiar z�ego poszli z nami Pun i tych dw�ch do�wiadczonych �o�nierzy z obozu �owc�w ork�w. Wybili moich nowych sojusznik�w do nogi. Nie mam rudy, nie mam sojusznik�w, a wi�c nic tu po mnie..."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					
					var int heroread_draxletter;
					if (heroread_draxletter == false)     
					{
					B_LogEntry                     (CH4_FindFriends,"Znalaz�em cia�o Draxa w lesie. Le�a� przy nim list w kt�rym przyznaje si� do zdrady i zab�jstwa Ratforda. Okaza�o si�, �e wszystko uknu� wraz ze Stra�nikami, jednak ich wsp�lny plan nie wypali�. Pora przekaza� te rewelacje Quentinowi. ");
					heroread_draxletter = true;
					B_giveXP (500);
					};
					
};
/********************************************************************************/
	INSTANCE vartSword (C_Item)
{	
	name 				=	"Miecz Varta";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	120;

	damageTotal			= 	35;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_1H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE BigGear(C_Item)
{	
	name 				=	"Du�e ko�o z�bate";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Ko�o z du�ymi z�bkami.";
};

//**********************************
// Klucz pirata
//*********************************
INSTANCE PiratKey01(C_Item)
{	
	name 					=	"Klucz do skrzy� ze skarbem";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description				= 	"Klucz do skrzy� ze skarbem";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//**********************************
// Eliksir oczyszczenia
//*********************************
INSTANCE ItFo_Potion_Clear(C_Item)
{
	name 			=	"Mikstura oczyszczenia";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MISSION;

	value 			=	500;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseClearMix;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	TEXT[2]			= 	"Mikstura oczyszcza umys� tego,";
	TEXT[3]			= 	"kto j� wypije.";
	TEXT[5]			= 	NAME_Value;					COUNT[5]	= 500;
};

	FUNC VOID UseClearMix()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	200);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	200);
		Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
		B_GiveXP (200);
		Print ("Oczy�ci�e� sw�j umys�!");
	};	

INSTANCE WorldMap2Pirat(C_Item)
{	
	name 					=	"Mapa do skarbu";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	350;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapHQ_PIR;

	description				= name;
	TEXT[0]					= "Na tej mapie pokazano,";
	TEXT[1]					= "gdzie ukryty jest skarb";
	TEXT[2]					= "starego pirata.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapHQ_PIR()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_Pirat.tga", 	1	);  //  1 -> DO NOT SCALE 


					Doc_Show		( nDocID 	);
	};
	
//---------------------------------------------------------------------
//	Pami�tnik Grimesa
//---------------------------------------------------------------------
INSTANCE ItMis_PamietnikGrimesa1(C_Item)
{	
	name 				=	"Karta pami�tnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa1;
	scemeName			=	"MAP";
	description			= 	"Pami�tnik Grimesa";
	TEXT[2]				= 	"Strona 1";

	
};
func void UsePamietnikGrimesa1 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "28 lipca"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "S�ysza�em plotki, �e pono� kr�l Rhobar ma jakie� nowe plany wzgl�dem G�rniczej Doliny. Pods�ucha�em rozmow� Stra�nik�w i m�wili co� o uniemo�liwieniu ucieczki wi�niom oraz �e do Doliny przyb�dzie 12 Mag�w. To nie oznacza nic dobrego... "	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "1 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Stra�nicy mieli racje. Rzeczywi�cie do Kolonii przybyli Magowie, ich przyw�dca zwie si� Xardas i pochodzi z Klasztoru Mag�w Ognia w Khorinis. Zdaje si�, �e co� wa�nego wydarzy si� w najbli�szych dniach, wi�niowie s� zaniepokojeni.");
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa2(C_Item)
{	
	name 				=	"Karta pami�tnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa2;
	scemeName			=	"MAP";
	description			= 	"Pami�tnik Grimesa";
	TEXT[2]				= 	"Strona 2";

	
};
func void UsePamietnikGrimesa2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "3 sierpnia"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Niech to szlag. Magowie utworzyli nad G�rnicz� Dolin� Magiczn� Barier�, podobno co� posz�o nie tak i Bariera wymkn�a si� spod kontroli poch�aniaj�c nawet tereny morskie oraz Terytorium Ork�w. S�ysza�em, �e jeden z wi�ni�w planuje otwarcie sprzeciwi� si� Stra�nikom, nazywa si� Gomez i pono� to kawa� drania. Oby nic z�ego si� nie sta�o."	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "4 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Sta�o si�. Gomez przej�� w�adz� w zamku, jaki� cudem przekona� do tego pomys�u spor� ilo�� wi�ni�w z kopalni. Pono� wszyscy Stra�nicy zgin�li, Magowie pozostali w zamku, zmuszeni do podporz�dkowania si� Gomezowi, a on sam planuje zawrze� jak�� umow� z Rhobarem polegaj�c� na wymianie.");
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa3(C_Item)
{	
	name 				=	"Karta pami�tnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa3;
	scemeName			=	"MAP";
	description			= 	"Pami�tnik Grimesa";
	TEXT[2]				= 	"Strona 3";

	
};
func void UsePamietnikGrimesa3 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "10 sierpnia"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Umowa rzeczywi�cie zosta�a zawarta, Gomez zawar� pakt z kr�lem Rhobarem, kt�ry wys�a� swoich ludzi z Vengardu do Khorinis, w celu pertraktacji. Ja si� wol� w te sprawy nie miesza�, lepiej si� zaj�� kopaniem rudy. "	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "22 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Co� niedobrego dzieje si� w kopalni, w ostatnich dniach podpory zacz�y strasznie trzeszcze�, mam nadzieje �e kopalnia si� nie zawali, bo inaczej marny los Gomeza i jego pertraktacji z Kr�lem..."	);
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa4(C_Item)
{	
	name 				=	"Karta pami�tnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa4;
	scemeName			=	"MAP";
	description			= 	"Pami�tnik Grimesa";
	TEXT[2]				= 	"Strona 4";

	
};
func void UsePamietnikGrimesa4 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "30 sierpnia"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Cholera, podpory trzeszcz� coraz bardziej. S�ycha� te� inne dziwne d�wi�ki. W�r�d zarz�dc�w kopalni r�wnie� wyczuwam niepok�j. Wys�ali do Starego Obozu po�ow� ludzi z kopalni. Ja zosta�em. Przypuszczam, �e pozostali zostan� oddelegowani do Starej Kopalni. Tutaj nie mamy ju� czego szuka�. Wczoraj wieczorem w�r�d mroku widzia�em dwa czerwone �lepia. Ten widok ci�gle tkwi mi w pami�ci. Nie mog� spa� i mimo i� mam tyle lat na karku, okropnie si� boj�. Pora si� zmywa�."	);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItWr_RejestrWydobycia(C_Item)
{	
	name 					=	"Rejestr wydobycia";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseRejestr1;
};

	FUNC VOID UseRejestr1()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
		
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "Rejestr wydobycia");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "W kopalni zaczynaj� si� dzia� z�e rzeczy. Postanowi�em wi�c sporz�dzi� rejestr stanu w jakim znajduje si� kopalnia na dzisiejszy dzie�, czyli 27 lipca. Zako�czyli�my wydobycie w g��wnej niszy oraz w korytarzach od niej prowadz�cych, a� do Du�ej Sali. W tych miejscach z�o�a zosta�y wyczerpane.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "Ilo�� surowca w Du�ej Sali szacuj� na 250 skrzy�. Przy utrzymaniu tego tempa pracy wydob�dziemy to w ci�gu najbli�szych o�miu miesi�cy. Korytarz zaj�ty przez pe�zacze nie jest zbyt zasobny. My�l�, �e 20 skrzy� to maksimum. Rok, mo�e p�tora i b�dziemy musieli si� st�d wynosi�. ");

		Doc_Show		( nDocID );
	};
	
	
	
/****************************************************
******* LIST NAPISANY PRZEZ FELGORA �ELAZN� GAROT�		
******* Opis: Dokument wa�ny dla fabularnego postrzegania    
******* przez gracza Garotnik�w. Opowiada o oszustwie
******* jakiego dokona� Skelden zdradzaj�c Felgora.
******* Dokument znajduje si� w ekwipunku Skeldena.
*****************************************************/
INSTANCE ItMi_LastFelgorLetter (C_Item)
{	
	name 				=	"List Felgora �elaznej Garoty";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_LastFelgorLetter;
	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2]				= 	"List napisa� Felgor �elazna Garora";
	
	
};
func void Use_LastFelgorLetter ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Zaklinam ci� Gomez, nie dawaj wiary s�owom Skeldena. To chciwa �mija, kt�ra s�czy jad w twe uszy, kierowana jedynie pragnieniem przechwycenia dow�dztwa w stra�y przybocznej. Nie pozw�l mu dopi�� swego. Skoro ten padalec zdradzi� mnie, przyjdzie dzie�, w kt�rym zdradzi i ciebie. Wiem, �e mi nie wierzysz. Inaczej bym by� teraz zupe�nie gdzie indziej. Zaklinam ci�, je�eli nie na Innosa, to na moje �ycie, a je�eli i to nic nie warte to uczy� to przez wzgl�d na moj� wieloletni� s�u�b�. Przeszukaj komnat� tej gnidy, tam znajdziesz odpowied� na wszystkie pytania."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Felgor �elazna Garota"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/****************************************************
******* BARDZO STARE NOTATKI		
******* Opis: Notatki mo�na kupi� u Baal Cadara. Przepis    
******* na mikstur� oczyszczenia jest niezb�dny do 
******* wykonania zadania na zostanie Guru zlecanego
******* przez Cor Angara.
*****************************************************/
var int staraKartka;
INSTANCE ItWr_Mod_ReceptClarityMixture(C_Item)
{	
	name 					=	"Bardzo stare notatki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	400;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	name;
	TEXT[1]					= 	"Ta stara ksi�ga �mierdzi trupem.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				= 	Use_ReceptClarityMixture;
};

	FUNC VOID Use_ReceptClarityMixture()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Ob��d"			);	
					Doc_PrintLine	( nDocID,  0, ""			);	
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Okazuje si�, �e po podaniu zbyt du�ej dawki zi� uzale�nienie staje si� na tyle silne, �e ofiara popada w ob��d. Nie spos�b wyleczy� go przy u�yciu dotychczas znanych metod. Ofiara zrobi wszystko, �eby otrzyma� kolejn� porcj�. Bez zawahania jest w stanie nawet zabi�...");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Pr�bowa�em znale�� spos�b na odwr�cenie efektu narkotyku. Przygotowa�em przepis na mikstur�, kt�ra znacz�co cofa szkody wyrz�dzone w organizmie.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Mikstura oczyszczenia");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "	Podstawowym sk�adnikiem jest sok z wilczej jagody, kt�ry ma stanowi� 1/8 obj�to�ci mikstury (reszt� to woda). Drugim elementem s� wn�trza li�ci sza�wii. Na trzecim miejscu znajduje si� niezwykle rzadki �wietlisty grzyb (spotka�em tylko dwa w �yciu). Nale�y wyci�� z niego doln� cz�� kapelusza, a reszt� zachowa�, gdy� jest niezwykle cenna. Mikstur� gotowa� nale�y prze 13 minut na wolnym ogniu.");
				
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
					
					if (HeroKnows_AlchemyClarityMixture == false)
					{
					HeroKnows_AlchemyClarityMixture = true; //var global
					Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
					B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia mikstury oczyszczenia.");	
					};
					/*if (staraKartka == false)
					{
					CreateInvItem (hero, ItWr_PrzepisOczyszczenieP2);
					CreateInvItem (hero, ItWr_PrzepisOczyszczenieP3);
					staraKartka = true;
					};
					Note: Dost�pne w Content/Itemsskrypty_smieci.d
					*/
};

/****************************************************
******* WILCZE JAGODY		
******* Opis: Sk�adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii b�d�cej na klifie nad Bractwem.
*****************************************************/
INSTANCE ItFo_Mod_WolfBerrys(C_Item)
{	
	name 					=	"Wilcze jagody";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItFo_Plants_Trollberrys_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   Use_WolfBerrys;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 50;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 100;
};

func void Use_WolfBerrys ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	50);
};

/****************************************************
******* LI�CIE SZA�WII		
******* Opis: Sk�adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii b�d�cej na ziemiach ork�w.
*****************************************************/		
INSTANCE ItFo_Mod_Sage(C_Item)
{	
	name 				=	"Li�cie sza�wii";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	100;

	visual 				=	"ItFo_Plants_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	Use_Sage;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 75;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 75;
};

func void Use_Sage ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	75);
};	

/****************************************************
******* �WIETLISTY GRZYB		
******* Opis: Sk�adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii b�d�cej na syczycie cytadeli.
*****************************************************/
INSTANCE itFo_Mod_LightMushroom(C_Item)
{	
	name 					=	"�wietlisty grzyb";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	500;

	visual 					=	"ItPl_LightMushroom.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	Use_LightMushroom;
	description				=	name;
	TEXT[1]					=	"Niezwykle rzadki magiczny grzyb.";
	TEXT[2]					=	"Dla alchemika cenniejszy ni� z�oto.";
	TEXT[3]					= 	NAME_Bonus_HP;				COUNT[3]	= 100;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void Use_LightMushroom ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	100);
};

/****************************************************
******* KOSTUR BAAL TONDRALA		
******* Opis: Kostur niezb�dny Uturielowi do osadzenia    
******* w nim magicznego kryszta�u. Dostajemy od Tondrala
******* za przys�ug� z Nowicjuszami.
*****************************************************/
INSTANCE ItMi_Mod_TondralStaff (C_Item)
{	
	name 				=	"Pami�tkowy kostur Baal Tondrala";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	150;

	damageTotal			= 	20;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"CA_EMPTY_STAFF.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Z�OTY MEDALION GOR BOBY		
******* Opis: O medalion prosi nas kowal Darrion.    
******* Zdobywamy go zabijaj�c Gor Bob�. 
*****************************************************/
INSTANCE  ItMi_GoldMedallion(C_Item)
{
	name 			=	"Z�oty medalion Gor Boby";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	200;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= name;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

/****************************************************
******* TOBO�EK Z KAJDANAMI �ELAZNEJ GAROTY	
******* Opis: Ten tobo�ek otrzymujemy od wi�nia Jarreda.   
******* Mo�na go wykorzysta� do przywo�ania ducha.
*****************************************************/

INSTANCE ItMi_FattersInPocket (C_Item)
{
	name 				=	"Tobo�ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	//scemeName     		=   "MAPSEALED";	
	//on_state[0]		=	nope;
	
	description			= 	name;
	TEXT[1]				= 	"Jarred ukry� w nim kajdany,";
	TEXT[1]				= 	"kt�rymi by� sp�tany Felgor.";
	//TEXT[4]			= 	NAME_Value;	COUNT[4]	= value;
};

/****************************************************
******* RECEPTURA NA LEK NA ZARAZ�
******* Opis: Ta receptura jest niezb�dna �eby przygotowa�   
******* lekarstwo dla Hansona. 
*****************************************************/
INSTANCE ItMi_RecipeAganistPlague (C_Item)
{	
	name 				=	"Receptura: Lek na zaraz�";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_RecipeAganistPlague;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"Receptura Cor Kaloma";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void Use_RecipeAganistPlague ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Lek na zaraz�"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Sk�adniki:"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Li�� d�bu"					);
					Doc_PrintLine	( nDocID,  0, "Psianka"					);
					Doc_PrintLine	( nDocID,  0, "G�rski mech"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko gotowa� przez 10 minut. Powsta�y wywar ostudzi� i poda� choremu."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					
	if (HeroKnows_AlchemyAganistPlague == false)
	{
	HeroKnows_AlchemyAganistPlague = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiej�tno�� sporz�dzenia lekarstwa na zaraz�.");	
	};
};

/****************************************************
******* LEKARSTWO NA ZARAZ�
******* Opis: Dostajemy je od Joru, albo sami warzymy.
*****************************************************/
INSTANCE ItMis_Drug(C_ITEM)
{
	name 				= "Lekarstwo na zaraz�";

	mainflag 			= ITEM_KAT_POTIONS;
	flags 				= ITEM_MISSION;

	value 				= 100;	


	visual 				= "ITFO_POTION_STRENGTH_01.3DS";
	material 			= MAT_GLAS;
	on_state[0]			= UseDrug;
	scemeName			= "POTION";
	description			= name;

	TEXT[0]				= "Efekt: Nieznany";
};
func void UseDrug ()
{
	if !Npc_IsPlayer (self)
	{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	300);
	};
};