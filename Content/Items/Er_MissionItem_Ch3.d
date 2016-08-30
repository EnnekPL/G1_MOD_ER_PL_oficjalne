//*******************************************************************************
//*********** GOTHIC EDYCJA ROZSZERZONA 1.4
//*********** PRZEDMIOTY ZADAу - ROZDZIA�� 3
//*******************************************************************************
//---------------------------------------------------------------------
//	Lista z kopalni dla Diego
//---------------------------------------------------------------------
INSTANCE OldMineList2 (C_Item)
{	
	name 				=	"Lista zam�wie�";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_OMList2;
	scemeName			=	"MAP";
	description			= 	"Lista rzeczy potrzebnych do Starej Kopalni";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Use_OMList2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Tylko macie si� pospieszy�!"					);
					Doc_PrintLine	( nDocID,  0, "- 30 bochenk�w chleba"								);
					Doc_PrintLine	( nDocID,  0, "- 40 butelek piwa"	);
					Doc_PrintLine	( nDocID,  0, "- 20 butelek wina"	);
					Doc_PrintLine	( nDocID,  0, "- 13 kilof�w"	);
					Doc_PrintLine	( nDocID,  0, "- 10 ch�opskich mieczy"	);
					Doc_PrintLine	( nDocID,  0, "- 2 d�bowe skrzynie (stare nam pop�ka�y)"	);
					Doc_PrintLine	( nDocID,  0, "- 3 skrzynie mi�sa "	);
					Doc_PrintLine	( nDocID,  0, "- 5 drewnianych �y�ek i kilka m�otk�w"	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "				Wasz kochany Ian"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/******************************************************************************************/
INSTANCE Hugo_Map(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOrcsMapEr;

	description				= name;
	TEXT[0]					= "Mapa do orkowego skarbu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOrcsMapEr()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_HUGO.tga", 	1	);  //  1 -> DO NOT SCALE 

					Doc_Show		( nDocID 	);
	};
	
//---------------------------------------------------------------------
//	Zadanie od Aidana
//---------------------------------------------------------------------	
/******************************************************************************************/
INSTANCE ItMis_AidanBow (C_Item)
{
	name 				=	"�uk Aidana";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	300;//140;

	damageTotal			=	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Long_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItMis_AidanDagger (C_Item) 
{	
	name 				=	"�elazny sztylet Aidana" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	200;
	
	damageTotal			= 	22;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItMis_AidanKey (C_Item)
{
	name 				=	"Klucz Gortha";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[2]				= "Otwiera skrzyni�";
	TEXT[3]				= "w jaskini z�baczy.";
};