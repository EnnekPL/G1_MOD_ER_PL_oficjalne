/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4.5
******* PRZEDMIOTY FABULARNE MODYFIKACJI
******* Opis: Znajduj¹ siê tutaj ró¿norodne przedmioty niezbêdne
******* do wykonania zadañ pobocznych i g³ównych. Przedmioty s¹
******* zwi¹zane wy³¹cznie z modyfikacj¹.
******* GOTHIC1210
*****************************************************/

/****************************************************
******* KAMIEÑ Z OPUSZCZONEJ KOPALNI
******* Opis: ten kamieñ przypomina wygl¹dem kolejny kamieñ
******* ogniskuj¹cy. Poszukuje go Corristo. Znajdujemy 
******* go przy ciele nekromanty Isenthora.
*****************************************************/
INSTANCE Focus_Corristo(C_Item)
{	
	name 				=	"Kamieñ z opuszczonej kopalni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Ten kamieñ potrafi zjednoczyæ moc";
	TEXT[2]				=	"pochodz¹c¹ z wielu magicznych Ÿróde³.";
};

/******************************************************************************************/
INSTANCE ItWrWorldmapDrax(C_Item)
{	
	name 					=	"Mapa dzia³añ Bandytów";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapDrax;

	description				= name;
	TEXT[0]					= "To zwyk³a mapa Koloni";
	TEXT[1]					= "na której zaznaczono";
	TEXT[2]					= "miejsca staræ Bandytów.";
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
					Doc_PrintLines	( nDocID,  0, "Nie tak mia³o to wszystko wygl¹daæ. Ten list jest moj¹ spowiedzi¹ przed œmierci¹. Przyznajê siê do zabicia moje przyjaciela Ratforda. Pok³óciliœmy siê o rudê i w z³oœci rani³em go œmiertelnie. Zobaczyli to Stra¿nicy patroluj¹cy okolicê i zaproponowali mi wspó³pracê. Zaoferowali mi rudê w zamian za wyprowadzenie z obozu tego kolesia, którego imienia nawet nie znam. Podwajali nagrodê za wyprowadzenie Quentina wraz z nim. Umówiliœmy siê, ¿e zbior¹ siê w du¿ej grupie na posterunku przy moœcie. "	);
					Doc_PrintLines	( nDocID,  0, "Jednak wszystko siê posypa³o, bo z niewiadomych dla mnie przyczyn nie zd¹¿yli siê zebraæ. Na domiar z³ego poszli z nami Pun i tych dwóch doœwiadczonych ¿o³nierzy z obozu ³owców orków. Wybili moich nowych sojuszników do nogi. Nie mam rudy, nie mam sojuszników, a wiêc nic tu po mnie..."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
					var int heroread_draxletter;
					if (heroread_draxletter == false)     
					{
					B_LogEntry                     (CH4_FindFriends,"Znalaz³em cia³o Draxa w lesie. Le¿a³ przy nim list w którym przyznaje siê do zdrady i zabójstwa Ratforda. Okaza³o siê, ¿e wszystko uknu³ wraz ze Stra¿nikami, jednak ich wspólny plan nie wypali³. Pora przekazaæ te rewelacje Quentinowi. ");
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
	name 				=	"Du¿e ko³o zêbate";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Ko³o z du¿ymi z¹bkami.";
};

//**********************************
// Klucz pirata
//*********************************
INSTANCE PiratKey01(C_Item)
{	
	name 					=	"Klucz do skrzyñ ze skarbem";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description				= 	"Klucz do skrzyñ ze skarbem";
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
	TEXT[2]			= 	"Mikstura oczyszcza umys³ tego,";
	TEXT[3]			= 	"kto j¹ wypije.";
	TEXT[5]			= 	NAME_Value;					COUNT[5]	= 500;
};

	FUNC VOID UseClearMix()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	200);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	200);
		Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
		B_GiveXP (200);
		Print ("Oczyœci³eœ swój umys³!");
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
//	Pamiêtnik Grimesa
//---------------------------------------------------------------------
INSTANCE ItMis_PamietnikGrimesa1(C_Item)
{	
	name 				=	"Karta pamiêtnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa1;
	scemeName			=	"MAP";
	description			= 	"Pamiêtnik Grimesa";
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
					Doc_PrintLines	( nDocID,  0, "S³ysza³em plotki, ¿e ponoæ król Rhobar ma jakieœ nowe plany wzglêdem Górniczej Doliny. Pods³ucha³em rozmowê Stra¿ników i mówili coœ o uniemo¿liwieniu ucieczki wiêŸniom oraz ¿e do Doliny przybêdzie 12 Magów. To nie oznacza nic dobrego... "	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "1 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Stra¿nicy mieli racje. Rzeczywiœcie do Kolonii przybyli Magowie, ich przywódca zwie siê Xardas i pochodzi z Klasztoru Magów Ognia w Khorinis. Zdaje siê, ¿e coœ wa¿nego wydarzy siê w najbli¿szych dniach, wiêŸniowie s¹ zaniepokojeni.");
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa2(C_Item)
{	
	name 				=	"Karta pamiêtnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa2;
	scemeName			=	"MAP";
	description			= 	"Pamiêtnik Grimesa";
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
					Doc_PrintLines	( nDocID,  0, "Niech to szlag. Magowie utworzyli nad Górnicz¹ Dolin¹ Magiczn¹ Barierê, podobno coœ posz³o nie tak i Bariera wymknê³a siê spod kontroli poch³aniaj¹c nawet tereny morskie oraz Terytorium Orków. S³ysza³em, ¿e jeden z wiêŸniów planuje otwarcie sprzeciwiæ siê Stra¿nikom, nazywa siê Gomez i ponoæ to kawa³ drania. Oby nic z³ego siê nie sta³o."	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "4 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Sta³o siê. Gomez przej¹³ w³adzê w zamku, jakiœ cudem przekona³ do tego pomys³u spor¹ iloœæ wiêŸniów z kopalni. Ponoæ wszyscy Stra¿nicy zginêli, Magowie pozostali w zamku, zmuszeni do podporz¹dkowania siê Gomezowi, a on sam planuje zawrzeæ jak¹œ umowê z Rhobarem polegaj¹c¹ na wymianie.");
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa3(C_Item)
{	
	name 				=	"Karta pamiêtnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa3;
	scemeName			=	"MAP";
	description			= 	"Pamiêtnik Grimesa";
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
					Doc_PrintLines	( nDocID,  0, "Umowa rzeczywiœcie zosta³a zawarta, Gomez zawar³ pakt z królem Rhobarem, który wys³a³ swoich ludzi z Vengardu do Khorinis, w celu pertraktacji. Ja siê wolê w te sprawy nie mieszaæ, lepiej siê zaj¹æ kopaniem rudy. "	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "22 sierpnia"	);
					Doc_PrintLines	( nDocID,  0, "Coœ niedobrego dzieje siê w kopalni, w ostatnich dniach podpory zaczê³y strasznie trzeszczeæ, mam nadzieje ¿e kopalnia siê nie zawali, bo inaczej marny los Gomeza i jego pertraktacji z Królem..."	);
					 
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_Show		( nDocID );	
};
/******************************************************************************************/
INSTANCE ItMis_PamietnikGrimesa4(C_Item)
{	
	name 				=	"Karta pamiêtnika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePamietnikGrimesa4;
	scemeName			=	"MAP";
	description			= 	"Pamiêtnik Grimesa";
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
					Doc_PrintLines	( nDocID,  0, "Cholera, podpory trzeszcz¹ coraz bardziej. S³ychaæ te¿ inne dziwne dŸwiêki. Wœród zarz¹dców kopalni równie¿ wyczuwam niepokój. Wys³ali do Starego Obozu po³owê ludzi z kopalni. Ja zosta³em. Przypuszczam, ¿e pozostali zostan¹ oddelegowani do Starej Kopalni. Tutaj nie mamy ju¿ czego szukaæ. Wczoraj wieczorem wœród mroku widzia³em dwa czerwone œlepia. Ten widok ci¹gle tkwi mi w pamiêci. Nie mogê spaæ i mimo i¿ mam tyle lat na karku, okropnie siê bojê. Pora siê zmywaæ."	);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
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
		Doc_PrintLines	( nDocID,  0, "W kopalni zaczynaj¹ siê dziaæ z³e rzeczy. Postanowi³em wiêc sporz¹dziæ rejestr stanu w jakim znajduje siê kopalnia na dzisiejszy dzieñ, czyli 27 lipca. Zakoñczyliœmy wydobycie w g³ównej niszy oraz w korytarzach od niej prowadz¹cych, a¿ do Du¿ej Sali. W tych miejscach z³o¿a zosta³y wyczerpane.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "Iloœæ surowca w Du¿ej Sali szacujê na 250 skrzyñ. Przy utrzymaniu tego tempa pracy wydobêdziemy to w ci¹gu najbli¿szych oœmiu miesiêcy. Korytarz zajêty przez pe³zacze nie jest zbyt zasobny. Myœlê, ¿e 20 skrzyñ to maksimum. Rok, mo¿e pó³tora i bêdziemy musieli siê st¹d wynosiæ. ");

		Doc_Show		( nDocID );
	};
	
	
	
/****************************************************
******* LIST NAPISANY PRZEZ FELGORA ¯ELAZN¥ GAROTÊ		
******* Opis: Dokument wa¿ny dla fabularnego postrzegania    
******* przez gracza Garotników. Opowiada o oszustwie
******* jakiego dokona³ Skelden zdradzaj¹c Felgora.
******* Dokument znajduje siê w ekwipunku Skeldena.
*****************************************************/
INSTANCE ItMi_LastFelgorLetter (C_Item)
{	
	name 				=	"List Felgora ¯elaznej Garoty";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_LastFelgorLetter;
	scemeName			=	"MAP";
	description			= 	name;

	TEXT[2]				= 	"List napisa³ Felgor ¯elazna Garora";
	
	
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
					Doc_PrintLines	( nDocID,  0, "Zaklinam ciê Gomez, nie dawaj wiary s³owom Skeldena. To chciwa ¿mija, która s¹czy jad w twe uszy, kierowana jedynie pragnieniem przechwycenia dowództwa w stra¿y przybocznej. Nie pozwól mu dopi¹æ swego. Skoro ten padalec zdradzi³ mnie, przyjdzie dzieñ, w którym zdradzi i ciebie. Wiem, ¿e mi nie wierzysz. Inaczej bym by³ teraz zupe³nie gdzie indziej. Zaklinam ciê, je¿eli nie na Innosa, to na moje ¿ycie, a je¿eli i to nic nie warte to uczyñ to przez wzgl¹d na moj¹ wieloletni¹ s³u¿bê. Przeszukaj komnatê tej gnidy, tam znajdziesz odpowiedŸ na wszystkie pytania."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Felgor ¯elazna Garota"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/****************************************************
******* BARDZO STARE NOTATKI		
******* Opis: Notatki mo¿na kupiæ u Baal Cadara. Przepis    
******* na miksturê oczyszczenia jest niezbêdny do 
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
	TEXT[1]					= 	"Ta stara ksiêga œmierdzi trupem.";
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
					Doc_PrintLine	( nDocID,  0, "Ob³êd"			);	
					Doc_PrintLine	( nDocID,  0, ""			);	
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Okazuje siê, ¿e po podaniu zbyt du¿ej dawki zió³ uzale¿nienie staje siê na tyle silne, ¿e ofiara popada w ob³êd. Nie sposób wyleczyæ go przy u¿yciu dotychczas znanych metod. Ofiara zrobi wszystko, ¿eby otrzymaæ kolejn¹ porcjê. Bez zawahania jest w stanie nawet zabiæ...");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Próbowa³em znaleŸæ sposób na odwrócenie efektu narkotyku. Przygotowa³em przepis na miksturê, która znacz¹co cofa szkody wyrz¹dzone w organizmie.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Mikstura oczyszczenia");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "	Podstawowym sk³adnikiem jest sok z wilczej jagody, który ma stanowiæ 1/8 objêtoœci mikstury (resztê to woda). Drugim elementem s¹ wnêtrza liœci sza³wii. Na trzecim miejscu znajduje siê niezwykle rzadki œwietlisty grzyb (spotka³em tylko dwa w ¿yciu). Nale¿y wyci¹æ z niego doln¹ czêœæ kapelusza, a resztê zachowaæ, gdy¿ jest niezwykle cenna. Miksturê gotowaæ nale¿y prze 13 minut na wolnym ogniu.");
				
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
					
					if (HeroKnows_AlchemyClarityMixture == false)
					{
					HeroKnows_AlchemyClarityMixture = true; //var global
					Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
					B_LogEntry		(NOTE_AlchemyRecepts,	"Umiejêtnoœæ sporz¹dzenia mikstury oczyszczenia.");	
					};
					/*if (staraKartka == false)
					{
					CreateInvItem (hero, ItWr_PrzepisOczyszczenieP2);
					CreateInvItem (hero, ItWr_PrzepisOczyszczenieP3);
					staraKartka = true;
					};
					Note: Dostêpne w Content/Itemsskrypty_smieci.d
					*/
};

/****************************************************
******* WILCZE JAGODY		
******* Opis: Sk³adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii bêd¹cej na klifie nad Bractwem.
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
******* LIŒCIE SZA£WII		
******* Opis: Sk³adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii bêd¹cej na ziemiach orków.
*****************************************************/		
INSTANCE ItFo_Mod_Sage(C_Item)
{	
	name 				=	"Liœcie sza³wii";

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
******* ŒWIETLISTY GRZYB		
******* Opis: Sk³adnik mikstury oczyszczenia. Do znalezienia     
******* przy ciele Bestii bêd¹cej na syczycie cytadeli.
*****************************************************/
INSTANCE itFo_Mod_LightMushroom(C_Item)
{	
	name 					=	"Œwietlisty grzyb";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	500;

	visual 					=	"ItPl_LightMushroom.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	Use_LightMushroom;
	description				=	name;
	TEXT[1]					=	"Niezwykle rzadki magiczny grzyb.";
	TEXT[2]					=	"Dla alchemika cenniejszy ni¿ z³oto.";
	TEXT[3]					= 	NAME_Bonus_HP;				COUNT[3]	= 100;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void Use_LightMushroom ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	100);
};

/****************************************************
******* KOSTUR BAAL TONDRALA		
******* Opis: Kostur niezbêdny Uturielowi do osadzenia    
******* w nim magicznego kryszta³u. Dostajemy od Tondrala
******* za przys³ugê z Nowicjuszami.
*****************************************************/
INSTANCE ItMi_Mod_TondralStaff (C_Item)
{	
	name 				=	"Pami¹tkowy kostur Baal Tondrala";  

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
******* Z£OTY MEDALION GOR BOBY		
******* Opis: O medalion prosi nas kowal Darrion.    
******* Zdobywamy go zabijaj¹c Gor Bobê. 
*****************************************************/
INSTANCE  ItMi_GoldMedallion(C_Item)
{
	name 			=	"Z³oty medalion Gor Boby";

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
******* TOBO£EK Z KAJDANAMI ¯ELAZNEJ GAROTY	
******* Opis: Ten tobo³ek otrzymujemy od wiêŸnia Jarreda.   
******* Mo¿na go wykorzystaæ do przywo³ania ducha.
*****************************************************/

INSTANCE ItMi_FattersInPocket (C_Item)
{
	name 				=	"Tobo³ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	//scemeName     		=   "MAPSEALED";	
	//on_state[0]		=	nope;
	
	description			= 	name;
	TEXT[1]				= 	"Jarred ukry³ w nim kajdany,";
	TEXT[1]				= 	"którymi by³ spêtany Felgor.";
	//TEXT[4]			= 	NAME_Value;	COUNT[4]	= value;
};

/****************************************************
******* RECEPTURA NA LEK NA ZARAZÊ
******* Opis: Ta receptura jest niezbêdna ¿eby przygotowaæ   
******* lekarstwo dla Hansona. 
*****************************************************/
INSTANCE ItMi_RecipeAganistPlague (C_Item)
{	
	name 				=	"Receptura: Lek na zarazê";

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
					Doc_PrintLine	( nDocID,  0, "Lek na zarazê"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Sk³adniki:"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Liœæ dêbu"					);
					Doc_PrintLine	( nDocID,  0, "Psianka"					);
					Doc_PrintLine	( nDocID,  0, "Górski mech"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko gotowaæ przez 10 minut. Powsta³y wywar ostudziæ i podaæ choremu."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
	if (HeroKnows_AlchemyAganistPlague == false)
	{
	HeroKnows_AlchemyAganistPlague = true;
	Log_CreateTopic	(NOTE_AlchemyRecepts,	LOG_NOTE);
	B_LogEntry		(NOTE_AlchemyRecepts,	"Umiejêtnoœæ sporz¹dzenia lekarstwa na zarazê.");	
	};
};

/****************************************************
******* LEKARSTWO NA ZARAZÊ
******* Opis: Dostajemy je od Joru, albo sami warzymy.
*****************************************************/
INSTANCE ItMis_Drug(C_ITEM)
{
	name 				= "Lekarstwo na zarazê";

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