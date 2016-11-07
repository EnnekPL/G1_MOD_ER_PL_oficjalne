//*******************************************************************************
//*********** GOTHIC EDYCJA ROZSZERZONA 1.4
//*********** PRZEDMIOTY ZADA� - ROZDZIA� 5
//*******************************************************************************

////////////////////////////////////////////////////////
// KLUCZ DO SKRYZNI Z BRONI� DLA BUNTOWNIK�W
// KLUCZ OTRZYMUJEMY OD RUFUSA
////////////////////////////////////////////////////////

INSTANCE ItMi_KeyFromRufus (C_Item)
{
	name 				=	"Klucz od Rufusa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;	
	TEXT[1]				= 	"Otwiera skrzyni� w chacie w Kotle.";
};

INSTANCE ItMi_NoteFromSenyan (C_Item)
{	
	name 				=	"Notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_NoteFromSenyan;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione w skrzyni  ";
	TEXT[2]				= 	"z broni� dla buntownik�w.";
};

func void Use_NoteFromSenyan ()
{   

		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Dogada�em si� z Okylem i pozwoli� mi sk�adowa� stare kilofy i miecze. Powiedzia�em mu, �e chc� je p�niej wys�a� do kowala w celu naprawy. To naprawd� dobra przykrywka. Nic lepszego nie mog�em dla was zdoby�. Gdybym podkrada� rynsztunek Najemnikom, natychmiast by mnie zabili.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Senyan");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					
};

INSTANCE ItMi_SpecialBooze(C_Item)
{	
	name 				=	"Specjalna ry��wka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItFo_Booze_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	Use_SpecialBooze;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 20;
};

	FUNC VOID Use_SpecialBooze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	5);
	};
	
INSTANCE ItMi_KeyToChestInStorage (C_Item)
{
	name 				=	"Klucz bandzior�w";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;	
	TEXT[1]				= 	"Otwiera skrzyni� w magazynie ry�u.";
};

instance ItMi_RicelordRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_RicelordRing;
	on_unequip				=	UnEquip_RicelordRing;

	description		= " Pier�cie� Ry�owego Ksi�cia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_RicelordRing()
	{
		self.protection [PROT_FIRE] 		+=  8;
	};

	FUNC VOID UnEquip_RicelordRing()
	{
	self.protection [PROT_FIRE] 		-=  8;
	};