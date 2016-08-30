/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* PRZEDMIOTY ZADA� - ROZDZIA� 1
******* Opis: R�norodne przedmioty zwi�zane z zadaniami.
*****************************************************/

INSTANCE dostawa_cyrusa (C_Item)
{
	name 				=	"Dostawa od Cyrusa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName           =   "MAPSEALED";	
	//on_state[0]			=	UseDostawa_Cyrusa;
	
	description			= name;
	TEXT[1]				= "Do karczmy w Nowym Obozie";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseDostawa_Cyrusa()
{
    CreateInvItems (self, ItFoMutton, 30);
    CreateInvItems (self, ItFoMuttonRaw, 30);
    CreateInvItems (self, ItFo_Plants_Berrys_01, 50);
    CreateInvItems (self, ItFo_Potion_Water_01, 10);
	if (Npc_IsPlayer(self))
	{
    //Print ("Nie powiniene� by� tego robi�!");
	//PrintScreen_Ext ("Nie powiniene� by� tego robi�!", -1, -1, "FONT_OLD_20_WHITE", 3);
	//Print_Ext(-1, -1, "Nie powiniene� by� tego robi�!","FONT_OLD_20_WHITE.TGA",COL_White, 3);
	//Print_ExtPxl (-1, -1, "Nie powiniene� by� tego robi�!","FONT_OLD_20_WHITE_HI.TGA",COL_White, 3);
	//PrintScreen ("Nie powiniene� by� tego robi�!", -1, -1, "FONT_OLD_20_WHITE", 3);

	//AI_PrintS (hero, "Nie powiniene� by� tego robi�!");
	};
};

//*******************************************************************************
//*********** STARA KOPALNIA
//*******************************************************************************

/*********************************************
**  KLUCZ DO SKRZYNI Z CZARN� RUD� **
*********************************************/	
INSTANCE KluczUlberta2(C_Item)
{
	name 				=	"Klucz do skrzyni w szopie Ulberta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	
var int raz2;
//pamietnik Josha - notes 
INSTANCE ItWr_JoshNote (C_Item)
{	
	name 				=	"Kartka z notesu Josha";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   JoshNote;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki nale�� do Bandyty Josha.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void JoshNote ()
{   
if (raz2 == false) && (MIS_OreInOM == LOG_RUNNING)
{
raz2 = true;
B_givexp (100);
B_LogEntry                     (CH1_OreInOM,"Z notesu Josha dowiedzia�em si� sporo rzeczy. Okazuje si�, �e kto� doni�s� na niego do Iana. Uda�o mu si� przekaza� rud� zaufanej osobie, kt�ra okaza�a si� zdrajc�. Musz� szybko zidentyfikowa� t� osob�.");
};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "23 listopada "					);
					Doc_PrintLines	( nDocID,  0, "Ostatnio uda�o mi si� zdoby� kilkadziesi�t bry�ek od Kopaczy. To dobry utarg, ale przypuszczam, �e b�d� mia� z tego powodu k�opoty."	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "24 listopada"	);
					Doc_PrintLines	( nDocID,  0, "Ian chyba co� zw�szy�. To kwestia czasu zanim zaczn� mnie podejrzewa�. Musz� szybko pozby� si� rudy, inaczej b�dzie po mnie.");
					Doc_PrintLine	( nDocID,  0, "25 listopada");
					Doc_PrintLines	( nDocID,  0, "Z oporami przekaza�em rud� mojemu kompanowi w czerwonej zbroi. Ostatnio zrobi� si� jaki� dziwny. Mam wra�enie, �e w duszy ze mnie drwi. Staram si� o tym nie my�le�. Najwa�niejsze, �e ruda jest bezpieczna. Je�li co� mi si� stanie, pr�dzej czy p�niej Quentin kogo� przy�le, a ten kto� przeczyta m�j pami�tnik.");
					Doc_PrintLine	( nDocID,  0, "26 listopada");
					Doc_PrintLines	( nDocID,  0, "Okaza�o si�, �e zosta�em zdradzony przez mojego kompana. Tego, kt�remu powierzy�em rud�. Wiedzia�em, �e w ko�cu ten sukinsyn mnie wykiwa. Stra�nicy b�d� chcieli mnie zamordowa�. Nie pozostaje mi nic innego, jak tylko si� broni�.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					
};
INSTANCE BadAmulett(C_Item)
{
	name 			=	"Bezwarto�ciowy amulet";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	25;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_BadAM;
	on_unequip		=	UnEquip_BadAM;

	description		= 	name;
	TEXT[0]			= 	"Kryszta� ju� nie b�yszczy.";
	TEXT[1]			= 	"Amulet widocznie dawno straci� swoj� moc.";
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

	FUNC VOID Equip_BadAM()
	{
	 	//self.protection [PROT_FIRE] += 1;
	};


	FUNC VOID UnEquip_BadAM()
	{
		//self.protection [PROT_FIRE] -= 1;
	};	
	
	/*******************************************************************************************/

INSTANCE ItMwPickaxeGrimes (C_Item)
{
	name 				=	"Kilof Grimesa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;

	value 				=	15;

	damageTotal			= 	14;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"ItMw_2H_Pickaxe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*******************************************************************************************/

INSTANCE ItMi_Worek_Garp (C_Item)
{
	name 				=	"Sakiewka Garpa";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName           =       "MAPSEALED";	
	on_state[0]				=	UseOWorekGarp;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekGarp()
{
    CreateInvItems (self, ItMiNugget, 150);
	CreateInvItems (self, ItMi_Stuff_OldCoin_01, 40);
	if (Npc_IsPlayer(self))
	{
    Print ("Znaleziono kilkana�cie przedmiot�w.");
	};
};
/*******************************************************************************************/
INSTANCE ItMi_Worek_Glen (C_Item)
{
	name 				=	"Sakiewka Glena";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	
	scemeName           =       "MAPSEALED";
	on_state[0]				=	UseOWorekGlen;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekGlen()
{
    CreateInvItems (self, ItMiNugget, 250);
	 CreateInvItems (self, ItKeLockpick, 15);
	CreateInvItems (self, ItMi_Stuff_OldCoin_01, 40);
	if (Npc_IsPlayer(self))
	{
    Print ("Znaleziono kilkana�cie przedmiot�w.");
	};
};
//*******************************************************************************
//*********** STARY OB�Z
//*******************************************************************************
//************* Przepis Snafa *****************

INSTANCE Snaf_Przepis (C_Item)
{	
	name 				=	"Przepis Snafa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseSnafPrzepis;
	scemeName			=	"MAP";
	description			= "Skradziony przepis Snafa";
};
func void UseSnafPrzepis ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, " Mi�so w ry�u "					);
					Doc_PrintLines	( nDocID,  0, "5 kawa�k�w SUROWEGO mi�sa"					);
					Doc_PrintLines	( nDocID,  0, "3 gorzkie chleby"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "1 Butelk� wody"	);
					Doc_PrintLines	( nDocID,  0, "5 butelek ry�u"					);
					Doc_PrintLines	( nDocID,  0, "Wszystko dok�adnie wymiesza� i gotowa� przez 5 minut."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "            Snaf, kucharz");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};  

INSTANCE ItMi_SnafBag (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Sakwa z przyprawami.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_DiegoBag (C_Item)
{
	name 				=	"Przesy�ka Diega";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description		= name;
	TEXT[2]			= "Diego podobno mia� otrzyma� jak��";
	TEXT[3]			= "przesy�k� ze �wiata Zewn�trznego.";
	TEXT[4]			= NAME_Value;					COUNT[4]	= value;
};

var int raz;
/********************************************************************************/
INSTANCE ItWr_PamietnikSwistaka (C_Item)
{	
	name 					=	"Dziennik �wistaka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;
	value 					=	0;
	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;
	on_state[0]			=   PamietnikSwistaka;
	scemeName		=	"MAP";
	description			=   name;
	TEXT[2]				= "Notatki nale��ce do �wistaka.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};

func void PamietnikSwistaka ()
{   
if (raz == false) && (pierscienieEBR == LOG_RUNNING)
{
raz = true;
B_givexp (100);
B_LogEntry                     (CH1_Problem_ZLY,"Z pami�tnika �wistaka dowiedzia�em si�, �e jeden z ukradzionych pier�cieni zachowa� dla siebie, a drugi sprzeda� szkodnikowi imieniem Cipher.");
};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "15 pa�dziernika "					);//fixxxxx
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Uda�o mi si�. Kradzie� przebieg�a pomy�lnie. M�j plan by� �wietny. Ci t�pi Stra�nicy pr�dzej powybijaj� si� nawzajem ni� odkryj� kto ich okrad�."					);
					
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "16 pa�dziernika"	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "By�em w Nowym Obozie. Znalaz�em tam kupca na jeden z pier�cieni. Nazywa� si� Cipher. To by� dobry uk�ad. Nie do��, �e dosta�em rud�, to obdarowa� mnie te� zielem."					);
					Doc_PrintLine	( nDocID,  0, "17 pa�dziernika"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Zaczn� sprzedawa� cz�� ukradzionych przedmiot�w tak, by nie wzbudzi� podejrze�. Za zebran� rud� wynaj��em sobie stra�nika do pilnowania d�br. Kopacze gdy tylko dowiedzieli si� o moich towarach, zbiegli si� wok� mojej chaty. Fisk jest z�y, �e mam lepszy utarg od niego... "					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

INSTANCE ItKeKeyPLAC(C_Item)
{
	name 				=	"Klucz do skrzy� na placu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	

/*********************************************
**   Plan na miecz �wistaka						**
*********************************************/
INSTANCE WhistlerSwordPlan(C_Item)
{	
	name 					=	"Plan: Miecz �wistaka";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	20;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWhistlerSwordPlan;

	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};
//*******************************************************************************
INSTANCE ItKe_DunegonKeyOC(C_Item)
{	
	name 			=	"Klucz do loch�w";

	mainflag		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MISSION;	
	value 			=	0;
	visual 			=	"ItKe_Key_04.3ds";
	material 		=	MAT_METAL;
	description		= 	name;
	TEXT[2]			= 	"Otwiera tylne wej�cie do loch�w";
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
//*******************************************************************************
INSTANCE It_wodaswiecona(C_Item)
{
	name 			=	"Woda �wi�cona";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	30;	

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWaterStPotion;
	scemeName		=	"POTION";

	description		= 	name;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	30;
};

	func VOID UseWaterStPotion()
	{	
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	};
//*******************************************************************************
INSTANCE StoneOfKnowledge (C_Item)
{
	name    	 = "Kamie� Wiedzy";

	mainflag     = ITEM_KAT_NONE;
	flags    	 = ITEM_MULTI;

	value    	 = 500;

	visual   	 = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material     = MAT_STONE;

	description  = name;
	TEXT[4]   	 = NAME_Value;     COUNT[4] = value;
};
/******************************************************************************************/
INSTANCE ZapiskiScattego(C_Item)
{
	name 				=	"Fa�szywy raport";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "To dow�d na oszustwa Scatty'ego.";
};
/******************************************************************************************/
INSTANCE ItMi_EbrTips (C_Item)
{	
	name 				=	"Zapiski Magnata";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseEBRList;
	scemeName			=	"MAP";
	description = name;
	TEXT[2]			= 	"Zapiski nale�� do jakiego� Magnata";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseEBRList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "28 wrzesie�"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Nie s�dzi�em, �e Gomez b�dzie na tyle g�upi, �eby trzyma� pier�cie� w swoim pokoju. W ka�dej chwili kt�ra� z tych przekl�tych lafirynd mo�e go ukra��. O Bandytach nie wspominaj�c. Dobrze, �e chocia� ja mam wi�cej oleju w g�owie. Postanowi�em ukry� sw�j pier�cie� w kuchni. To nietypowe miejsce. Zagl�daj� tam tylko kucharze, kt�rych �atwo przekupi�. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/******************************************************************************************/
INSTANCE ItKe_Miguel(C_Item)
{	
	name 					=	"Klucz od Miguela";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie"; 
	TEXT[1]				= "w dawnej sali treningowej";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
/*********************************************
**   Pier�cienie					**
*********************************************/
	instance EBR_Ring1(C_Item)
{
	name 					=	"Magnacki pier�cie�";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring1;
	on_unequip				=	UnEquip_EBR_Ring1;

	description		= name;
	TEXT[0]			= "Pier�cie� prawdopodobnie";
	TEXT[1]			= "nale�y do Magnat�w. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si�a...";
	TEXT[3]			= NAME_Prot_Fire;
	COUNT[3]		= 10;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_EBR_Ring1()
	{
		self.protection [PROT_FIRE] 		+=  10;
	};

	FUNC VOID UnEquip_EBR_Ring1()
	{
	self.protection [PROT_FIRE] 		-=  10;
	};
//2
		instance EBR_Ring2(C_Item)
{
	name 					=	"Magnacki pier�cie�";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring2;
	on_unequip				=	UnEquip_EBR_Ring2;

	description		=  name;
	TEXT[0]			= "Pier�cie� prawdopodobnie";
	TEXT[1]			= "nale�y do Magnat�w. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si�a...";
	TEXT[3]			= NAME_Prot_Point;
	COUNT[3]		= 5;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_EBR_Ring2()
	{
		self.protection [PROT_POINT] 		+=  5;
	};

	FUNC VOID UnEquip_EBR_Ring2()
	{
	self.protection [PROT_POINT] 		-=  5;
	};
//3
		instance EBR_Ring3(C_Item)
{
	name 					=	"Magnacki pier�cie�";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring3;
	on_unequip				=	UnEquip_EBR_Ring3;

		description		=  name;
	TEXT[0]			= "Pier�cie� prawdopodobnie";
	TEXT[1]			= "nale�y do Magnat�w. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si�a...";
	TEXT[3]			= NAME_Prot_Magic;		COUNT[3]		= 7;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_EBR_Ring3()
	{
		self.protection [PROT_MAGIC] 		+=  7;
	};

	FUNC VOID UnEquip_EBR_Ring3()
	{
	self.protection [PROT_MAGIC] 		-=  7;
	};	
	
//*******************************************************************************
//*********** QUEST OD R�CZKI
//*******************************************************************************
	instance Bergs_Ring(C_Item)
{
	name 					=	"Pier�cie� Berga";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	50;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= name;
	TEXT[0]					= "Pier�cie� nale�y do Berga.";
	TEXT[1]					= "Wygrawerowano na nim jego imi�.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};
//*******************************************************************************
	instance Skarb_ring1(C_Item)
{
	name 					=	"Szczeroz�oty pier�cie�";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	200;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= 	name;
	TEXT[2]					= 	"Pier�cie� znalaz�em w sk�adowisku Magnat�w.";
	TEXT[3]					= 	"Jest sporo warty.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};
//*******************************************************************************
	instance Skarb_ring2(C_Item)
{
	name 					=	"Pier�cie� z diamentem";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	300;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= 	name;
	TEXT[2]					= 	"Pier�cie� znalaz�em w sk�adowisku Magnat�w.";
	TEXT[3]					= 	"Jest sporo warty.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};
//*******************************************************************************
INSTANCE Skarb_cup1 (C_Item)
{
	name 				=	"Z�oty puchar Magnat�w";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	value 				=	150;
	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;
	description			= 	name;
	TEXT[2]				= 	"Puchar znalaz�em w sk�adowisku Magnat�w.";
	TEXT[3]				= 	"Jest sporo warty.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]	= value;
};
//*******************************************************************************
//edit by Nocturn
INSTANCE Skarb_SwordGold (C_Item)
{	
	name 				=	"Srebrny sztylet";
	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	value 				=	300;
	damageTotal			= 	10;
	damagetype 			=	DAM_EDGE;		
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	5;
	visual 				=	"ItMw_1H_Sword_Short_04.3DS";
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMi_SzwaczNote (C_Item)
{	
	name 					=	"Zapiski szwacza";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;  
	on_state[0]			=   UseSzwaczList;
	scemeName		=	"MAP";
	description			= 	name;
	TEXT[2]				= 	"Notatki znalezione w opuszczonej";
	TEXT[3]				= 	"szwalni w �rodku lasu.";
};
func void UseSzwaczList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Pa�dziernik"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Mamy tydzie� na przygotowanie nast�puj�cych ubra�:"	);
					Doc_PrintLines	( nDocID,  0, "- futro ze sk�ry trolla"					);
					Doc_PrintLines	( nDocID,  0, "- pi�� futer z wilka"					);
					Doc_PrintLines	( nDocID,  0, "- dwa sk�rzane pancerze"					);
					Doc_PrintLines	( nDocID,  0, "- wygarbowa� pozosta�e sk�ry"					);
					Doc_PrintLines	( nDocID,  0, "Pracy du�o, czasu ma�o."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   );  
				
					Doc_Show		( nDocID );
		
};
//*******************************************************************************
//*********** NOWY OB�Z
//*******************************************************************************
INSTANCE ItKe_Ncbaal(C_Item)
{	
	name 					=	"Klucz Baala";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[2]				= "Otwiera skrzynie w Nowym Obozie.";
	TEXT[3]				= "Nale�y do Baal Kagana";
	//TEXT[5]				= NAME_Value;
	//COUNT[5]			= value;
};
/********************************************************************************/
INSTANCE ItMi_ListdoCronosa (C_Item)
{	
	name 				=	"List dla Cronosa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseCronosBrief222;
	scemeName			=	"MAP";
	description			= name;
	//TEXT[5]				= NAME_Value;
	//COUNT[5]			= value;
	
};
func void UseCronosBrief222 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Czcigodni Magowie Wody,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Pisz� do was Bracia w imieniu Y'Beriona. Sprawa jest dosy� powa�na. W naszym Obozie dziej� si� niepokoj�ce rzeczy. Znacz�co wzros�a liczba tajemniczych op�ta� w�r�d Nowicjuszy. Prosimy Mag�w Wody o pomoc w tej sprawie oraz zdefiniowaniu jej przyczyny."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niechaj gniew Beliara nigdy was nie si�gnie."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Shawn"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/*******************************************************************************************/
INSTANCE ItMi_OzdobnaKlinga (C_Item)
{
	name 				=	"Ozdobna r�koje��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual 				=	"Er_Klinga.3ds";
	material 			=	MAT_CLAY;
	

	
	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*******************************************************************************
INSTANCE It_HerbatkaNaKaca(C_Item)
{
	name 			=	"Herbatka na kaca";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTea;
	scemeName		=	"POTION";

	description		= name;
	TEXT[5]			= NAME_Value;					COUNT[5]	= 50;
};

	func VOID UseTea()
	{	
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	};
/******************************************************************************************/
INSTANCE JakBylPosazekPoAngielskuDoZCholery (C_Item)
{
	name 				=	"Pos��ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[2]				= "Ten pos��ek przedstawia dziwne b�stwo.";
	//TEXT[1]				= "";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/	
	INSTANCE JeremiahMoonshine(C_Item)
{	
	name 					=	"W�da Jeremiasza";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;

	value 					=	50;

	visual	 				=	"ErG2_Water.3ds";
	material 				=	MAT_GLAS;
	on_state[0]			=	UseJeremiahMoonshine;
	scemeName		=	"POTION";
	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_Mana;			COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;					COUNT[5]	= Value;
};

	FUNC VOID UseJeremiahMoonshine()
	{
		if (Npc_IsPlayer(self)) {
		PrintScreen ("Niesamowity smak!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Npc_ChangeAttribute	(self,	ATR_MANA,  25); };
	};
/******************************************************************************************/
INSTANCE Mis_KrysztalzKotla (C_Item)
{
	name 					=	"Kryszta� z Kot�a";

	mainflag 				=	ITEM_KAT_RUNE;
	flags 					=	ITEM_MISSION;
	spell						= SPL_THUNDERBOLT;

	value 					=	800;

	visual 					=	"ErIt_Crystal.3DS";
	material 				=	MAT_STONE;

	description			= name;
	TEXT[2]				= "Magiczny kryszta� wykopany wiele lat";
	TEXT[3]				= "temu przez Kret�w z Wolnej Kopalni.";
	TEXT[4]				= "Posiada magiczne w�a�ciwo�ci.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};	
/******************************************************************************************/
INSTANCE Mis_PamietnikStarca(C_Item)
{	
	name 					=	"Pami�tnik starca";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseMis_PamietnikStarca;
};

	FUNC VOID UseMis_PamietnikStarca()
	{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "30 czerwiec");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Dzi� 30 czerwca. Dzie� moich urodzin. To nieprawdopodobne, �e mam ju� 78 lat. Tyle czasu min�o. M�j zegar wci�� tyka. Mam wra�enie, �e przyspiesza. Oj, chyba si� starzej�. Cz�owiek, kt�ry us�ysza�by o moich dzisiejszych dokonaniach i nie przeczyta� tego pami�tnika powiedzia�by, �e mam 20 lat. Niestety tak nie jest, ale przyznam, �e dobrze si� trzymam.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Tak, tak. To ja dzisiaj rano uciek�em z Kot�a. Uda�o mi si� zabra� cenny kryszta�, kt�ry Najemnicy wykopali kilka dni temu. Te durnie zostawi�y go na stole w jednej z chat. Kradzie� tej b�yskotki by�a dziecinnie prosta. Tylko co ja teraz z ni� zrobi�? Nie mog� zej�� z g�ry, bo inaczej mnie znajd�. Co ja pisz�?! Nawet jak tu zostan�, to mnie znajd�. Taki stary, a taki g�upi.");
					Doc_Show		( nDocID );
	};
	
//*******************************************************************************
//*********** �OWCY ORK�W
//*******************************************************************************

//*******************************************************************************
INSTANCE foodlowcow (C_Item)
{
	name 				=	"�ywno�� dla �owc�w ork�w";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	400;

	visual 				=	"ItMi_Pocket.3ds";
    material            =    MAT_LEATHER;

	
	scemeName           =    "MAPSEALED";
	on_state[0]		    =	 Usefoodlowocow;
	
	description			= 	"Dostawa �ywno�ci od Wilka";
	TEXT[4]				= 	NAME_Value;	
	COUNT[4]			= value;
};
func void Usefoodlowocow()
{
    CreateInvItems (self, ItFoLoaf, 10);
	CreateInvItems (self, ItFoMutton, 22);
	CreateInvItems (self, ItFoRice, 15);
    if (Npc_IsPlayer(self))
	{
	Print ("Zebra�e� �ywno��"); 
	};
};
//*******************************************************************************

//*******************************************************************************
//*********** BRACTWO
//*******************************************************************************
/*******************************************************************************************/
//edit by Nocturn
INSTANCE MegaJoint(C_Item)
{
	name 				=	"Oddech �ni�cego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3*10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			=	UseMegaJoint;
	description = name;
	TEXT[0]		    	= "Mocne ziele ";
	TEXT[1]             = "wytworzone przez ";
	TEXT[3]             = "Nowicjuszy z Bractwa.";
	TEXT[5]				= NAME_Value;					COUNT[4]	= Value_Joint3*10;
};

func void UseMegaJoint()
{
	if (Fourthjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,3);
		PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
		Fourthjoint = TRUE;
	};
};
	
///////////////////////////////////////////////
///////////BRACTWO
/////////////////////////////////////////////////	
	//ItWr_Stoneplate_01.3DS
	
	INSTANCE BlackPlate01(C_Item)
{	
	name 					=	"Czarna tabliczka";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MULTI;

	value 					=	8;

	visual 					=	"ItWr_Stoneplate_01.3DS";
	material 				=	MAT_METAL;

	scemeName				=	"MAP";	
	on_state[0]				=	UseBlackPlate01;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseBlackPlate01()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAYA_STONEPLATE_02.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
		//ItWr_Stoneplate_01.3DS
	//1.03 - �atka 
	//****************************************************
	//var int HeroUseBlackPlateSTR;
	INSTANCE BlackPlateSTR(C_Item)
{	
	name 					=	"Czarna tabliczka";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Stoneplate_01.3DS";
	material 				=	MAT_METAL;

	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UseBlackPlateSTR;

	description				= name;
	TEXT[1]					= "Tabliczka opisuje";
	TEXT[2]					= "jak u�ywa� si�y";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseBlackPlateSTR()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAYA_STONEPLATE_02.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
					//if (HeroUseBlackPlateSTR == false)
					//{
					B_RaiseAttribute	(ATR_STRENGTH,	3); 
					//HeroUseBlackPlateSTR = true;
					//};
	};
	
	//pierscie� ukradziony przez uciekiniera - Bractwo
	instance powerRing(C_Item)
{
	name 					=	"Pier�cie� op�tania";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	120;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_OPE;
	on_unequip				=	UnEquip_OPE;

	description		= name;
	TEXT[0]			= "Pier�cie� ma pot�n� moc.";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_OPE()
	{
		self.protection [PROT_POINT] 		+=  5;
		print ("Czujesz si� jakby� straci� wol�");
	};

	FUNC VOID UnEquip_OPE()
	{
	self.protection [PROT_POINT] 		-=  5;
	};

	// ukradziony amulet
	INSTANCE  powerAmulett(C_Item)
{
	name 			=	"Amulet op�tania";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	250;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_OPE2;
	on_unequip		=	UnEquip_OPE2;

	description		= 	name;
	 
	TEXT[1]			= "W tym artefakcie";
	TEXT[2]			= "drzemie prastary duch.";
	TEXT[3] 		= 	name_PROT_FIRE;
	COUNT[3]		= 	5;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

	FUNC VOID Equip_OPE2()
	{
	 	self.protection [PROT_FIRE] += 5;
		print ("Czujesz si� s�abiej.");
	};


	FUNC VOID UnEquip_OPE2()
	{
		self.protection [PROT_FIRE] -= 5;
	};	
	//sakwa Talasa ;)
	/******************************************************************************************/
INSTANCE ItMi_SakwaTalasa (C_Item)
{
	name 				=	"Sakiewka Talasa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	
	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UseSakwaTalasa;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseSakwaTalasa()
{
    CreateInvItems (self, ItMiNugget, 40);
	if (Npc_IsPlayer(self))
	{
    Print ("Znaleziono 40 bry�ek rudy");
	};
};

//*******************************************************
// ZAKRWAWIONA SIEKIERA 
// Seria zab�jstw w Bractwie
//*******************************************************
instance ItMw_SiekieraCSI (C_Item) 
{	
	name 				=	"Zakrwawiona siekiera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	5;
	
	damageTotal			=   12;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	5;
	visual 				=	"ItMw_1H_Hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "T� broni� dokonano zab�jstwa";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_OstrzeCSI(C_Item)
{	
	name 				=	"Ma�e ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"It_BladeOld.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[4]				= "U�ywane w tartakach.";
};

//*******************************************************************************
INSTANCE lukor_amulet(C_Item)
{
	name 			=	"Amulet Lukora";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	5;

	visual 			=	"ItMi_Amulet_Psi_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= 	name;
	on_equip		=	Equip_lukoram;
	on_unequip		=	UnEquip_lukoram;
	TEXT[1]			= 	"Przypomina znak Bractwa.";
	TEXT[2]			= 	"Nieznane dzia�anie.";
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;

};
func void Equip_lukoram ()
{
hero_regeneruje_mana = true;
print ("Czuj�, �e moja energia magiczna si� regeneruje");
};
func void UnEquip_lukoram ()
{
hero_regeneruje_mana = false;
};
/********************************************************************************/
INSTANCE ItCH1_ListaDlugowPatrosa (C_Item)
{	
	name 				=	"Lista d�ug�w";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePatrsoMsg;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"D�u�nicy Starkada";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePatrsoMsg ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "D�u�nicy:"					);
					Doc_PrintLine	( nDocID,  0, "- Darrion (50 bry�ek rudy za mi�so)"					);
					Doc_PrintLine	( nDocID,  0, "- Gor Na Idon (150 bry�ek rudy za gorza�k�)"					);
					Doc_PrintLine	( nDocID,  0, "- Joru (50 bry�ek rudy za chleb, 5 kawa�k�w sera i maliny)"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

//*******************************************************************************
//*********** OB�Z MY�LIWYCH
//*******************************************************************************
/******************************************************************************************/
//	KLUCZ DO CELI ALEXA																		//
/******************************************************************************************/
	INSTANCE ItKe_Alex(C_Item)
{	
	name 					=	"Klucz do celi";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[1]				= "Otwiera jedn�";
	TEXT[2]				= "z celi w lochach.";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
/******************************************************************************************/
//	TRUCIZNA DO MIKSTURY																			//
/******************************************************************************************/
INSTANCE ItMi_TruciznaJaszczura (C_Item)
{
	name 				=	"Jad jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[1]				= "Trucizna pochodzi od";
	TEXT[2]				= "zielonego jaszczura.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
//	MIXTURKA DLA CLAWA																			//
/******************************************************************************************/
INSTANCE ItMi_AnitdotumNaJad(C_Item)
{
	name 			=	"Antidotum na jad";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	500;	

	visual 			=	"ItPo_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseAntidotum1;
	scemeName		=	"POTIONFAST";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 500;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 500;
};

	FUNC VOID UseAntidotum1()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion222");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	500);
	};
/******************************************************************************************/
INSTANCE Tokas_Sword (C_Item)
{
	name 				=	"Przekl�te ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	3500;

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	on_equip			=	mam_tokas_sword;
	on_unequip			=	niemam_tokas_sword;
	visual 				=	"Tokas_sword.3DS";

	description			= name;
	TEXT[1]				= "Na ostrze na�o�ono kl�tw�";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

func void mam_tokas_sword ()
{
run_tokas_sword = true;
PrintScreen	("Czujesz moc ostrza!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};
func void niemam_tokas_sword ()
{
run_tokas_sword = false;
};

/******************************************************************************************/
INSTANCE Cleared_Tokas_Sword (C_Item)
{
	name 				=	"Oczyszczone ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	1500;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"Tokas_sword.3DS";

	description			= name;
	TEXT[1]				= "Miecz zosta� oczyszczony!";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
// PIER�CIE� CLAWA
/******************************************************************************************/
	instance ClawsRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	70;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 					=	MAT_METAL;
	on_equip					=	Equip_ClawsRing;
	on_unequip					=	UnEquip_ClawsRing;

	description			= name;	 
	TEXT[1]			= "Pier�cie� nale�y do Clawa.";
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 1;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_ClawsRing()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,1 );
	};

	FUNC VOID UnEquip_ClawsRing()
	{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-1 );
	};
	
/******************************************************************************************/
INSTANCE AlexCup (C_Item)
{
	name 				=	"Puchar Alexa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
INSTANCE ItMi_Worek_Gwozdzie (C_Item)
{
	name 				=	"Lekka sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseOWorekG10;
	
	description			= name;
	TEXT[1]				= "Sakiewka pe�na gwo�dzi.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekG10()
{
    CreateInvItems (self, ItMiGwozdz, 10);
    if (Npc_IsPlayer(self))
	{
	PrintScreen	("Znaleziono 10 gwo�dzi!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};

};
/******************************************************************************************/
// P�ASZCZ DO MISJI Z BLIZN�
/******************************************************************************************/
INSTANCE ItMi_PancerzMil (C_Item)
{
	name 				=	"P�aszcz ze sk�ry wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	180;

	visual 				=	"orgl.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 180;
};
/******************************************************************************************/
// BRO� KOSY - 1hit
/******************************************************************************************/
INSTANCE egzekutor_killer (C_Item)
{
	name 				=	"Egzekutor";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	9999;
	owner = SLD_704_Blade;
	damageTotal			= 	9999;//jednym ciosem
	
	//edit by Nocturn
	damagetype			=	DAM_MAGIC;
	range    			=  	200;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	5;
	//on_equip			=	mam_egzekutora;
	//on_unequip			=	niemam_egzekutora;
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[1]				= "Rozpierdala jednym ciosem.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*******************************************************************************
//*********** KOLONIA
//*******************************************************************************
INSTANCE DarkSect_Sword (C_Item)
{
	name 				=	"Ksi�ycowe ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	2000;

	damageTotal			= 	84;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	200;
	damage[DAM_INDEX_FIRE]	=	 25;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	visual 				=	"ItMw_DragonSwordWoG.3DS";

	description			= name;
	TEXT[0]				= "Wspania�a bro�!";
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	=	damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


	FUNC VOID UseWhistlerSwordPlan()
	{
		var int nDocID;
		nDocID = 	Doc_CreateMap	();					
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Plan.tga", 	1	);  
					Doc_Show		( nDocID 	);
	};
	
/*********************************************
**   Kryszta� Drena					**
*********************************************/
INSTANCE BlueCrystal (C_Item)
{
	name 				=	"Niebieski kryszta�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	300;

	visual 				=	"ErIt_Crystal.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};	
/******************************************************************************************/
//	Mapa KRYJ�WKA  1
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit1(C_Item)
{	
	name 					=	"Mapa do kryj�wki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap1Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na kt�rej";
	TEXT[2]					= "oznaczy�em kryj�wk� w jaskini";
	TEXT[3]					= "na ziemiach ork�w.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseMap1Kryjowka()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_OLD_KRYJOWKA1.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
/******************************************************************************************/
//	Mapa KRYJ�WKA  2
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit2(C_Item)
{	
	name 					=	"Mapa do kryj�wki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap2Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na kt�rej";
	TEXT[2]					= "oznaczy�em kryj�wk� we wie�y";
	TEXT[3]					= "na dolinie za Starym Obozem.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseMap2Kryjowka()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_OLD_KRYJOWKA2.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
/******************************************************************************************/
//	Mapa KRYJ�WKA  3
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit3(C_Item)
{	
	name 					=	"Mapa do kryj�wki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap3Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na kt�rej";
	TEXT[2]					= "oznaczy�em kryj�wk� w jaskini";
	TEXT[3]					= "przy Starym Obozie";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseMap3Kryjowka()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_OLD_KRYJOWKA3.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
		INSTANCE StrangePotion(C_Item)
{
	name 					=	"Dziwna mikstura";

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MISSION;

	value 					=	10;	

	visual 					=	"ItFo_Wine_01.3ds";
	material 				=	MAT_GLAS;
	on_state				=	UseStrangePotion;
	scemeName				=	"POTION";


	description				= 	name;
	TEXT[0]				= 	"Dzia�anie nieznane.";

	TEXT[5]				= 	NAME_Value;
	COUNT[5]				= 	value;

};
	FUNC VOID UseStrangePotion()
	{
		B_FullStop (self);
		AI_PlayAni		(self,	"T_STAND_2_VICTIM_SLE");
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseStrangePotion");
	};
/******************************************************************************************/
	INSTANCE GerardPotion(C_Item)
{
	name 					=	"Lekarstwo dla Gerarda";

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MISSION;

	value 					=	300;	

	visual 					=	"ItPo_Health_01.3ds";
	material 				=	MAT_GLAS;
	on_state				=	UseGerardPotion;
	scemeName				=	"POTION";


	description				= 	name;
	TEXT[0]				= 	"Jest w stanie wyleczy� wszystkie rany.";

	TEXT[5]				= 	NAME_Value;
	COUNT[5]				= 	value;

};
	FUNC VOID UseGerardPotion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseGerardPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 9999);
	};
/******************************************************************************************/
	INSTANCE SpecialWater(C_Item)
{
	name 					=	"Magiczna woda";

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MISSION;

	value 					=	50;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;
	visual 					=	"ItFo_Potion_Mana_01.3ds";
	material 				=	MAT_GLAS;
	on_state				=	UseSpecialWater;
	scemeName				=	"POTIONFAST";


	description				= name;
	TEXT[0]				= "Nap�j pulsuje dziwn� energi�.";
	TEXT[1]				= "Lepiej tego nie pi�!";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;

};
	FUNC VOID UseSpecialWater()
	{
		B_FullStop (self);
		AI_PlayAni		(self,	"T_PSI_VICTIM");
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseSpecialWater");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-9999);
	};
	

/******************************************************************************************/
	INSTANCE ItWr_LetterFromLutero (C_ITEM)
{
	name 					=	"List od Lutero";

	mainflag 					=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[0] 					=	"Odpowied� od kupca Lutero.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseLetterFromLutero;
};

FUNC VOID UseLetterFromLutero()
{
	var int nDocID;
	nDocID = Doc_Create();

	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	Doc_PrintLines	( nDocID,  0, "Witaj,");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Podobno jeste� w posiadaniu nietypowego trofeum, kt�re chcia�bym naby�. Nie mog� zaoferowa� ci rudy, gdy� nasz� walut� jest z�oto. Za trofeum mog� ci da� kaptur kolczy, kt�ry zapewne nie raz uratuje ci �ycie w tak niebezpiecznym miejscu, jakim jest Kolonia. My�l�, �e oferta jest korzystna dla obu stron, tym bardziej �e te szpony s� niemal�e bezwarto�ciowe za barier�. Dobrze przemy�l moj� propozycj�. B�d� oczekiwa� na odpowied�.");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Innos z tob�,");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Lutero");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
const int VALUE_KETPAL		= 450;
/******************************************************************************************/
INSTANCE KETPAL(C_Item)
{
	name 					=	"Kaptur kolczy";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	7;
	protection [PROT_BLUNT] = 	7;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	7;
	protection [PROT_MAGIC] = 	3;

	value 					=	VALUE_KETPAL;

	wear 					=	WEAR_HEAD;
 
	visual 					=	"kapturkolczy.3ds";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_kaptur_kolczy;
	on_unequip				=	UnEquip_kaptur_kolczy;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
var int stan_kaptura;
func void Equip_kaptur_kolczy ()
{
stan_kaptura = true;
};
func void UnEquip_kaptur_kolczy ()
{
stan_kaptura = false;
};

/********************************************************************************/

//edit by Nocturn
INSTANCE GoldenSword (C_Item)
{
	name 				=	"Z�oty miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	
	visual 				=	"IT_GOMEZGOLDSWORDMIS.3DS";

	description			= name;
	TEXT[1]				= "Pi�kny miecz, jednak niezwykle kruchy.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE It_DavorsBow (C_Item)
{
	name 				=	"�uk Davora";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	270;

	damageTotal			=	50;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	20;
	visual 				=	"ItRw_Bow_Small_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
	INSTANCE  JosepSamulet(C_Item)
{
	name 			=	"Amulet Mrocznych Si�";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_02.3DS";

	visual_skin 	=	1;
	material 		=	MAT_METAL;
	on_equip		=	mam_amuletjosepa;
	on_unequip		=	niemam_amuletjosepa;

	description		= name;
	TEXT[1]			= NAME_Bonus_Dex;
	COUNT[1]		= 1;
	TEXT[2]		    =  NAME_Bonus_Mana;
	COUNT[2]		= 1;
	TEXT[3] 		= NAME_Bonus_Str;
	COUNT[3]		= 1;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID mam_amuletjosepa()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,1 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,1 );
		Npc_ChangeAttribute(self,ATR_MANA_MAX,1 );
		Npc_ChangeAttribute(self,ATR_MANA,1 );
	};


	FUNC VOID niemam_amuletjosepa ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-1 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,-1 );
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-1 );
		Npc_ChangeAttribute(self,ATR_MANA,-1 );
	};
	
	
	
	
	
	
	
	
	
	
	
	
	INSTANCE eq_z_napadu1 (C_Item)
{
	name 				=	"Rzeczy do Kopalni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName           =   "MAPSEALED";	
	//on_state[0]			=	Useeqn1;
	
	description			= name;
	TEXT[1]				= "Zawiera �ywno�� do Kopalni";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void Useeqn1()
{
    CreateInvItems (self, ItFoLoaf, 20);
    CreateInvItems (self, ItFoApple, 30);
    CreateInvItems (self, ItFoCheese, 10);
	if (Npc_IsPlayer(self))
	{
    Print ("Nie powiniene� by� tego robi�!");
	};
};

	INSTANCE eq_z_napadu2 (C_Item)
{
	name 				=	"Rzeczy do Kopalni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName           =   "MAPSEALED";	
	//on_state[0]			=	Useeqn2;
	
	description			= name;
	TEXT[1]				= "Zawiera narz�dzia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void Useeqn2()
{
    CreateInvItems (self, ItMiScoop, 1);
    CreateInvItems (self, ItMiBrush, 1);
    CreateInvItems (self, ItMwPickaxe, 5);
    CreateInvItems (self, ItMiHammer, 3);

	if (Npc_IsPlayer(self))
	{
    Print ("Nie powiniene� by� tego robi�!");
	};
};

	INSTANCE eq_z_napadu3 (C_Item)
{
	name 				=	"Rzeczy do Kopalni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName           =   "MAPSEALED";	
	//on_state[0]			=	Useeqn3;
	
	description			= name;
	TEXT[1]				= "Zawiera ziele";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void Useeqn3()
{
    CreateInvItems (self, ItMiJoint_1, 10);
	CreateInvItems (self, ItMiJoint_2, 10);
	CreateInvItems (self, ItMiJoint_3, 10);
	if (Npc_IsPlayer(self))
	{
    Print ("Nie powiniene� by� tego robi�!");
	};
};

/******************************************************************************************/
INSTANCE ItMis_SlepperBreathJoint(C_Item)
{
	name 				=	"Oddech �ni�cego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	description			= name;
	TEXT[3]				= "Cholernie mocne";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMis_PaczkaMagowOgnia (C_Item)
{
	name 				=	"Paczka z rzeczami Mag�w Ognia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
    material            =      MAT_LEATHER;

	
	scemeName           =    "MAPSEALED";
	//on_state[0]		    =	UsePaczkaMagow;
	
	description			= name;
	TEXT[1]				= "Przesy�ka Mag�w";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/****************************************************
**  	ROSCOE: LIST OD LARESA			   **
****************************************************/
INSTANCE ItMis_LetterLaresToFireMages (C_Item)
{	
	name 				=	"List do Mag�w Ognia";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_LetterLaresToFireMages;
	scemeName			=	"MAP";
	description			=   name;
	
};
func void use_LetterLaresToFireMages ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Szanowny Mistrzu Corristo,"					);
					Doc_PrintLines	( nDocID,  0, "Wsp�lnie z genera�em Lee oraz Magami Wody pod dow�dztwem Saturasa, chcemy ci z�o�y� pewn� propozycje. Zbyt d�ugo dawali�cie si� wykorzystywa� Gomezowi i jego s�ugom. Uwa�amy, �e powinni�cie do��czy� do Nowego Obozu i wesprze� Mag�w Wody w ich pracach nad zniszczeniem magicznej Bariery. Chcemy podzieli� si� z Wami naszymi obawami o nieobliczalno�ci Gomeza. Nie chcemy, by tak szanowni s�udzy Innosa jak Wy przyp�acili �yciem za jego szale�stwo. Liczymy na przychylne rozpatrzenie naszej propozycji."	);
					Doc_PrintLine	( nDocID,  0, "Z wyrazami szacunku,");
					Doc_PrintLine	( nDocID,  0, "Lares, przyw�dca Szkodnik�w");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  
				
					Doc_Show		( nDocID );
					
};

/****************************************************
**  	SKAZA: ZA�WIADCZENIE DLA GRAHAMA		   **
****************************************************/
INSTANCE ItMis_Thorus_Safe_conduct (C_Item)
{	
	name 				=	"Za�wiadczenie Thorusa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Safe_Conduct_Thorus;
	scemeName			=	"MAP";
	description			=   name;
	
};
func void Use_Safe_Conduct_Thorus ()
{   
		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "W imieniu Gomeza, g��wnego Magnata Starego Obozu po�wiadczam, �e posiadaczowi tego listu przys�uguje prawo zabrania mapy wskazuj�cej drog� do Obozu Bandyt�w i notatek opisuj�cych kierunki dzia�a� naszego wroga. "	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "Thorus, przyw�dca Stra�nik�w"	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  
					Doc_Show		( nDocID );
					
};
/****************************************************
**  	PLAC WYMIAN: NOTATKI TRIPA	   **
****************************************************/
INSTANCE ItMis_TripNotes (C_Item)
{	
	name 				=	"Notatki zwiadowcze Tripa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_TripNotes;
	scemeName			=	"MAP";
	description			=   name;
	
};
func void Use_TripNotes ()
{   
		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Oko�o po�udnia, podczas powrotu z patrolu dostrzeg�em dw�ch Bandyt�w, wracaj�cych z polowania. Nie uda�o im si� mnie wykry�, wi�c zacz��em ich �ledzi�. Poszli w kierunku Kanionu Trolli. Niestety, gdy doszli na szczyt zorientowali si�, �e ich �ledz�. Nie zd��y�em zobaczy� w kt�r� stron� poszli. Ledwo uszed�em z �yciem, unikaj�c zab�jczej strza�y."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  
					Doc_Show		( nDocID );
					
};
/****************************************************
**  	ROBOTNIK 2004: KLUCZ PLAC	   **
****************************************************/
INSTANCE ItMis_KeyOrryChest(C_Item)
{
	name 				=	"Klucz Orry'ego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Otwiera skrzyni�";
	TEXT[2]				= "na placu wymian";
	TEXT[4]				= NAME_Value;					COUNT[4]	= 0;
};	
/****************************************************
**  	GRAHAM: DROGA DO OB	   **
****************************************************/
INSTANCE ItMis_TripMap(C_Item)
{	
	name 					=	"Mapa do Obozu Bandyt�w";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;
	scemeName				=	"MAP";	
	on_state[0]				=	Use_TripMap;
	description				= name;
	TEXT[1]					= "G��wny cel, czyli po�o�enie";
	TEXT[2]					= "Obozu Bandyt�w nie jest";
	TEXT[3]					= "dok�adnie zaznaczone.";
};

	FUNC VOID Use_TripMap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_QUEST_TRIP.tga", 	1	); 
					Doc_Show		( nDocID 	);
	};
/****************************************************
**  	KALOM: DLA HANSONA	   **
****************************************************/
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
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	300);
};

/****************************************************
**  	MORAKH/BESTIA: DROP	   **
****************************************************/
INSTANCE ItMis_MorakhClaws (C_Item)
{
	name 				=	"Pazury Bestii";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Krallen;
};


var int IronPackExplore;
/****************************************************
**  	SKRZYNIA BANDZIOR�W     **
****************************************************/
INSTANCE ItQt_IronPack (C_Item)
{
	name 				=	"Paczka ze stal� dla Quentina";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	170;

	visual 				=	"NW_CITY_WEAPON_BAG_01.3ds"; 
	material 			=	MAT_CLAY;
	
	scemeName			=	"MAPSEALED";	
	//on_state[0]			=	UseIronPack2;
	
	description			= name;
	TEXT[2]				= "Paczka jest pe�na stalowych pr�t�w";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseIronPack2()
{
    CreateInvItems (self, ItMiSwordraw, 30);
	if (Npc_IsPlayer(self))
	{
    Print ("Znaleziono 30 stalowych pr�t�w.");
	IronPackExplore = true;
	};
};

//////////////////////////////////////////////////////
// ZADANIE: RUDA ZE STAREJ KOPALNI (NOWE)
//////////////////////////////////////////////////////
INSTANCE itmi_joshpocket (C_Item)
{
	name 				=	"Sakiewka Josha";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	450;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	scemeName         =   "MAPSEALED";	
	//on_state[0]			=	DontNeed;
	
	description			= name;
	TEXT[1]				= "Sakiewka z rud� zdobyt� przez Josha";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE itmi_hysenkey(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Zabrany Hysenowi";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	

//////////////////////////////////////////////////////
// ZADANIE: ATAK NA PLAC WYMIAN
//////////////////////////////////////////////////////
INSTANCE itmi_plac_doc1 (C_Item)
{	
	name 				=	"Zalecenia";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_plac_doc1;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione przy Stra�niku";
	TEXT[2]				= 	"pilnuj�cym wej�cia do Opuszczonej Kopalni.";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void use_plac_doc1 ()
{   

		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Zalecenia"					);
					Doc_PrintLines	( nDocID,  0, "Od dnia dzisiejszego obowi�zuje bezwzgl�dny zakaz schodzenia do Opuszczonej Kopalni. Wej�cie z rozkazu Gomeza ma zosta� solidnie zabezpieczone i chronione przez dw�ch wyznaczonych Stra�nik�w. Z ko�owrota mo�e korzysta� jedynie upowa�niona osoba za okazaniem dokumentu z moim podpisem.");
					Doc_PrintLine	( nDocID,  0, "              "					);
					Doc_PrintLine	( nDocID,  0, "                        Thorus"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );				
};

INSTANCE itmi_grd2002_key(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[1]				= 	"Zabrany Stra�nikowi z posterunku";
	TEXT[2]				= 	"przy Opuszczonej Kopalni";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	

INSTANCE itmi_plac_doc2 (C_Item)
{	
	name 				=	"Obronno�� wzg�rza";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_plac_doc2;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione w skrzyni";
	TEXT[2]				= 	"przy wej�ciu do Opuszczonej Kopalni.";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void use_plac_doc2 ()
{   

		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Obronno�� wzg�rza"					);
					Doc_PrintLines	( nDocID,  0, "Zgodnie z zaleceniami Gomeza w ci�gu najbli�szych dw�ch tygodni most ma zosta� obsadzony trzema Stra�nikami uzbrojonymi w �rednie kusze. Ma to zapobiec inwazyjnym atakom Bandyt�w. Ponadto ka�dy ze Stra�nik�w obs�uguj�cych plac wymian ma natychmiast zg�osi� si� do kwatermistrza po kusz� i ui�ci� za ni� ulgow� op�at� w wysoko�ci 30 bry�ek rudy. Robicie to dla ocalenia ty�k�w! Ka�dy robotnik pracuj�cy na placu ma otrzyma� n� bojowy umo�liwiaj�cy mu podstawowe dzia�ania obronne. Z naszej strony informujemy, �e podwajamy ilo�� Stra�y przy skrzyniach z rud� transportowanych na plac.");
					Doc_PrintLine	( nDocID,  0, "              "					);
					Doc_PrintLine	( nDocID,  0, "                        Arto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );				
};

INSTANCE itmi_plac_doc3 (C_Item)
{	
	name 				=	"Brama";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_plac_doc3;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione przy Orrym";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void use_plac_doc3 ()
{   

		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Brama"					);
					Doc_PrintLines	( nDocID,  0, "Brama ma by� zamykana codziennie od zmierzchu, a� do �witu. Zwi�kszy to obronno�� placu wymian. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Thorus");
					Doc_PrintLines	( nDocID,  0, "PS: Nie zasypia� na warcie sukinsyny, bo pewnego dnia mo�ecie si� nie obudzi�!");
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );				
};

INSTANCE itmi_plac_doc4 (C_Item)
{	
	name 				=	"Kwatermistrz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_plac_doc4;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione przy Sparku";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void use_plac_doc4 ()
{   

		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Kwatermistrz - przydzia� obowi�zk�w"					);
					Doc_PrintLines	( nDocID,  0, "Od chwili dostarczenia tego pisma na plac wymian Spark staje si� lokalnym kwatermistrzem. Dowiedzia�em si� przypadkowo, �e ucz�szcza� do prywatnej szko�y dla mieszczan, a na lekcji rachunk�w by� najrzadziej bato�ony. My�l�, �e nadaje si� na to stanowisko. Raporty z ka�dego transportu przekazuj dow�dcy konwoju. Tak b�dzie najbezpieczniej.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Bartholo");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );				
};

//////////////////////////////////////////////////////
// ZADANIE: ZMIANA DO KOPALNI
//////////////////////////////////////////////////////

INSTANCE itmi_Fakeblackore(C_Item)
{
	name 				=	"Imitacja czarnej rudy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	40;
							
	visual 				=	"It_CoalEr.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Wykonana przez kowala Huno";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

INSTANCE itmi_OM_LorenzoRaport (C_Item)
{	
	name 				=	"Raport ze Starej Kopalni";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_raport_OM;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Raport mia� dosta� Bartholo";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void use_raport_OM ()
{   

		var int nDocID;	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Raport na okres jesienny"					);
					Doc_PrintLines	( nDocID,  0, "Wydobycie przebiega wzorowo. Nie ma �adnych nieprawid�owo�ci i wszystko idzie zgodnie z zamierzonym planem. Jednym k�opotem s� wy��cznie pe�zacze, kt�re mno�� si� na pot�g�. Na szcz�cie Stra�nicy �wi�tynni zgodnie z umow� skutecznie broni� newralgicznych punkt�w w kt�rych przebiega wydobycie. W ostatnim raporcie wspomnia�em o nowym minerale znalezionym w Kopalni. Jeden z Kopaczy uparcie twierdzi, �e to niezwykle rzadka czarna ruda. Jednak nie znale�li�my �adnych jej z��. Przypuszczam, �e kto� m�g� j� przemyci� do Kopalni. Na razie zosta�a zabezpieczona w magazynie Ulberta. A klucz zosta� dodatkowo ukryty w innym magazynie. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Ian");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );				
};

//////////////////////////////////////////////////////
// ZADANIE: HANDEL EMANUELA
//////////////////////////////////////////////////////
INSTANCE RudaEmanuela(C_Item)
{	
	name 				=	"Ruda Emanuela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ITMI_POCKET.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"Ruda nale�y do Bandyty Emanuela.";
	
};

//////////////////////////////////////////////////////
// ZADANIE: SKRZYNIA I TALERZ
//////////////////////////////////////////////////////
INSTANCE ItMi_RonosPlate (C_Item)
{
	name 				=	"Sentymentalny talerz Rono";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMi_Stuff_Plate_01.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKRZYNIA I TALERZ
//////////////////////////////////////////////////////
INSTANCE ItMi_JoshSwordElement (C_Item)
{
	name 				=	"Fragment miecza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	2;

	visual 				=	"ItMi_SmithSword_Raw_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA�NIKA
//////////////////////////////////////////////////////
INSTANCE  ItMi_CraigsAmulet(C_Item)
{
	name 			=	"Poz�acany amulet";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	200;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= name;
	TEXT[1]			= "Pami�tka po Stra�niku Craigu";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA�NIKA
//////////////////////////////////////////////////////
INSTANCE  ItMi_CraigsOldAmulet(C_Item)
{
	name 			=	"Zdobiony wisior";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	50;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= name;
	TEXT[1]			= "Pami�tka po Stra�niku Craigu";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA�NIKA
//////////////////////////////////////////////////////
INSTANCE ItMi_CraigsChestKey(C_Item)
{
	name 				=	"Klucz do skarbu Craiga";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	5;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[4]				= 	"Otwiera ukryt� skrzyni�.";
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA�NIKA
//////////////////////////////////////////////////////
INSTANCE ItMi_CraigsMap(C_Item)
{	
	name 					=	"Mapa do skarbu Craiga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_CraigsMap;

	description				= name;
	TEXT[0]					= "W mapie wydarta jest dziura.";
	TEXT[1]					= "W pergaminie jest ";
	TEXT[2]					= "co� zawini�te.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_CraigsMap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	();
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_Craig.tga", 	1	);
					Doc_Show		( nDocID 	);
	
		if (ItemUsed_CraigsMapKeySpawn == false)
		{
		ItemUsed_CraigsMapKeySpawn = true;
		CreateInvItems (self, ItMi_CraigsChestKey,1);
		PrintS_Ext("Znalaz�e� klucz!", COL_White);
		B_LogEntry(CH1_TreasureOldGuard, "Oszo�omiony Joel zaprowadzi� mnie prosto do mapy, kt�r� ukry� w krzakach. Na tej starej kartce papieru wyra�nie kto� wyrwa� dziur� palcem. Prawdopodobnie Craig nie potrafi� pisa�, albo nie mia� pod r�k� pi�ra (ci�ko o takie rzeczy w Kopalni). Nie powinienem mie� wi�kszych problem�w z odszukaniem wydartego miejsca. W pergaminie by� zawini�ty klucz.");
		};
	};
	
//////////////////////////////////////////////////////
// ZADANIE: PARVEZ W TARAPATACH
//////////////////////////////////////////////////////
INSTANCE ItMi_Bloodwyns_Order (C_Item)
{	
	name 				=	"Rozkazy Bloodwyna";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodwynsOrder;
	scemeName			=	"MAP";
	description			= 	"Rozkazy Bloodwyna";
};

func void UseBloodwynsOrder()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Ten sukinsyn Parvez wywl�k� na bagna pi�ciu moich najpunktualniejszych p�atnik�w. "					);
				Doc_PrintLines	( nDocID,  0, "Nie dajcie sobie zrobi� prania m�zgu. Ten �wir ma si� tu ju� nigdy nie pojawi�. Zr�bcie to porz�dnie. Tak, �eby ju� nie mia� my�li tu wraca�. "					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLine	( nDocID,  0, "Bloodwyn");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================

INSTANCE ItMi_FlourBag (C_Item)
{
	name 				=	"Worek m�ki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Worek m�ki.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_FlourBagWithSand (C_Item)
{
	name 				=	"Worek m�ki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Worek m�ki z piaskiem.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//========================================
// Ester Egg Outlandera
//========================================

INSTANCE ItWr_OutlandersMassage (C_Item)
{	
	name 				=	"Dziwna notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]		=  OutlandersMassage;
	scemeName		=	"MAPSEALED";
	description		=  name;
	TEXT[1]				= "Napisana przez Outlandera";
	TEXT[5]			= NAME_Value;
	COUNT[5]		=	value;
	
};
func void OutlandersMassage ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Nareszcie mi si� uda�o. Wspi��em si� na sam szczyt tej ska�y. Te dupki patrz� na mnie z podziwem. Nie mog� si� doczeka�, a� wyskocz� z rudy, o kt�r� si� za�o�yli�my. Szczeg�lnie licz� na sakiewk� Duna. Ten go�� zawsze mnie irytowa�. Tym razem ja si� �mieje ostatni."					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Czytelniku, na odwrocie opisa�em moje sztuczki pozwalaj�ce zwi�kszy� sprawno�� fizyczn�, ale skoro si� tu dosta�e�, to pewnie ich nie potrzebujesz. W takim razie zapami�taj to has�o: pracuj w ciszy, niech efekty zrobi� ha�as. Niech ci przy�wieca przez ca�y czas."	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Spisano w ch�odny, dwudziesty si�dmy wiecz�r listopada");
					Doc_PrintLines	( nDocID,  0, "Outlander");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					
					B_RaiseAttribute	(ATR_DEXTERITY,	5);
};

INSTANCE ItMi_GhostsBagSpecial (C_Item)
{
	name 				=	"Tobo�ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	//scemeName     =   "MAPSEALED";	
	//on_state[0]		=	UseDostawa_Cyrusa;
	
	description		= name;
	TEXT[1]				= "Tobo�ek pewnego stra�nika kr�lewskiego";
	//TEXT[4]			= NAME_Value;					COUNT[4]	= value;
};