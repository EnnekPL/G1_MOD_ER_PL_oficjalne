//**********************************************************
//***** GOTHIC EDYCJA ROZSZERZONA 1.4
//***** PRZEDMIOTY ZADAÑ - ROZDZIA£ 1
//***** Opis: Ró¿norodne przedmioty zwi¹zane z zadaniami.
//**********************************************************

////////////////////////////////////////////////
// Zaginiona paczuszka Diego
////////////////////////////////////////////////
INSTANCE ItMi_DiegoBag (C_Item)
{
	name 				=	"Przesy³ka Diega";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Diego podobno mia³ otrzymaæ jak¹œ";
	TEXT[3]				= "przesy³kê ze Œwiata Zewnêtrznego.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

////////////////////////////////////////////////
// Pamiêtnik z chaty Œwistaka
////////////////////////////////////////////////
INSTANCE ItWr_PamietnikSwistaka (C_Item)
{	
	name 				=	"Dziennik Œwistaka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;
	value 				=	0;
	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_WhistelrNotes;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]				= 	"Notatki nale¿¹ce do Œwistaka";
	TEXT[2]				= 	"znalezione w jego chacie.";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};

func void Use_WhistelrNotes ()
{  
/* var int raz;
if (raz == false) && (pierscienieEBR == LOG_RUNNING)
{
raz = true;
B_givexp (100);
B_LogEntry (CH1_Problem_ZLY,"Z pamiêtnika Œwistaka dowiedzia³em siê, ¿e jeden z ukradzionych pierœcieni zachowa³ dla siebie, a drugi sprzeda³ szkodnikowi imieniem Cipher.");
};*/
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "15 paŸdziernika "					);//fixxxxx
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Uda³o mi siê nie zwróciæ na siebie uwagi, a kradzie¿ przebieg³a pomyœlnie. Ci têpi Stra¿nicy prêdzej powybijaj¹ siê nawzajem ni¿ odkryj¹, kto ich okrad³."					);
					
					Doc_PrintLine	( nDocID,  0, "16 paŸdziernika"	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Wybra³em siê do Nowego Obozu w celu znalezienia kupca na pierœcieñ. Jedynie niejaki Cipher by³ zainteresowany. Zdecydowa³em siê jednak zachowaæ pierœcieñ dla siebie."					);
					
					Doc_PrintLine	( nDocID,  0, "17 paŸdziernika"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Zacznê sprzedawaæ czêœæ ukradzionych przedmiotów tak, by nie wzbudziæ podejrzeñ. Za zebran¹ rudê wynaj¹³em sobie stra¿nika do pilnowania ³upów. Pod moj¹ chatê œci¹gnê³o wielu chêtnych do ubicie interesu. Fisk jest z³y, ¿e mam lepszy utarg od niego... "					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};
















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
    //Print ("Nie powinieneœ by³ tego robiæ!");
	//PrintScreen_Ext ("Nie powinieneœ by³ tego robiæ!", -1, -1, "FONT_OLD_20_WHITE", 3);
	//Print_Ext(-1, -1, "Nie powinieneœ by³ tego robiæ!","FONT_OLD_20_WHITE.TGA",COL_White, 3);
	//Print_ExtPxl (-1, -1, "Nie powinieneœ by³ tego robiæ!","FONT_OLD_20_WHITE_HI.TGA",COL_White, 3);
	//PrintScreen ("Nie powinieneœ by³ tego robiæ!", -1, -1, "FONT_OLD_20_WHITE", 3);

	//AI_PrintS (hero, "Nie powinieneœ by³ tego robiæ!");
	};
};

//*******************************************************************************
//*********** STARA KOPALNIA
//*******************************************************************************

/*********************************************
**  KLUCZ DO SKRZYNI Z CZARN¥ RUD¥ **
*********************************************/	
INSTANCE KluczUlberta2(C_Item)
{
	name 				=	"Klucz do skrzyni w szopie Ulberta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
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
	TEXT[1]				= 	"Notatki nale¿¹ do Bandyty Josha.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void JoshNote ()
{   
if (raz2 == false) && (MIS_OreInOM == LOG_RUNNING)
{
raz2 = true;
B_givexp (100);
B_LogEntry                     (CH1_OreInOM,"Z notesu Josha dowiedzia³em siê sporo rzeczy. Okazuje siê, ¿e ktoœ doniós³ na niego do Iana. Uda³o mu siê przekazaæ rudê zaufanej osobie, która okaza³a siê zdrajc¹. Muszê szybko zidentyfikowaæ tê osobê.");
};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "23 listopada "					);
					Doc_PrintLines	( nDocID,  0, "Ostatnio uda³o mi siê zdobyæ kilkadziesi¹t bry³ek od Kopaczy. To dobry utarg, ale przypuszczam, ¿e bêdê mia³ z tego powodu k³opoty."	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "24 listopada"	);
					Doc_PrintLines	( nDocID,  0, "Ian chyba coœ zwêszy³. To kwestia czasu zanim zaczn¹ mnie podejrzewaæ. Muszê szybko pozbyæ siê rudy, inaczej bêdzie po mnie.");
					Doc_PrintLine	( nDocID,  0, "25 listopada");
					Doc_PrintLines	( nDocID,  0, "Z oporami przekaza³em rudê mojemu kompanowi w czerwonej zbroi. Ostatnio zrobi³ siê jakiœ dziwny. Mam wra¿enie, ¿e w duszy ze mnie drwi. Staram siê o tym nie myœleæ. Najwa¿niejsze, ¿e ruda jest bezpieczna. Jeœli coœ mi siê stanie, prêdzej czy póŸniej Quentin kogoœ przyœle, a ten ktoœ przeczyta mój pamiêtnik.");
					Doc_PrintLine	( nDocID,  0, "26 listopada");
					Doc_PrintLines	( nDocID,  0, "Okaza³o siê, ¿e zosta³em zdradzony przez mojego kompana. Tego, któremu powierzy³em rudê. Wiedzia³em, ¿e w koñcu ten sukinsyn mnie wykiwa. Stra¿nicy bêd¹ chcieli mnie zamordowaæ. Nie pozostaje mi nic innego, jak tylko siê broniæ.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
};
INSTANCE BadAmulett(C_Item)
{
	name 			=	"Bezwartoœciowy amulet";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	25;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_BadAM;
	on_unequip		=	UnEquip_BadAM;

	description		= 	name;
	TEXT[0]			= 	"Kryszta³ ju¿ nie b³yszczy.";
	TEXT[1]			= 	"Amulet widocznie dawno straci³ swoj¹ moc.";
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
    Print ("Znaleziono kilkanaœcie przedmiotów.");
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
    Print ("Znaleziono kilkanaœcie przedmiotów.");
	};
};
//*******************************************************************************
//*********** STARY OBÓZ
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
					Doc_PrintLines	( nDocID,  0, " Miêso w ry¿u "					);
					Doc_PrintLines	( nDocID,  0, "5 kawa³ków SUROWEGO miêsa"					);
					Doc_PrintLines	( nDocID,  0, "3 gorzkie chleby"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "1 Butelkê wody"	);
					Doc_PrintLines	( nDocID,  0, "5 butelek ry¿u"					);
					Doc_PrintLines	( nDocID,  0, "Wszystko dok³adnie wymieszaæ i gotowaæ przez 5 minut."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "            Snaf, kucharz");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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




/********************************************************************************/


INSTANCE ItKeKeyPLAC(C_Item)
{
	name 				=	"Klucz do skrzyñ na placu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};	

/*********************************************
**   Plan na miecz Œwistaka						**
*********************************************/
INSTANCE WhistlerSwordPlan(C_Item)
{	
	name 					=	"Plan: Miecz Œwistaka";
	
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
	name 			=	"Klucz do lochów";

	mainflag		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MISSION;	
	value 			=	0;
	visual 			=	"ItKe_Key_04.3ds";
	material 		=	MAT_METAL;
	description		= 	name;
	TEXT[2]			= 	"Otwiera tylne wejœcie do lochów";
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
//*******************************************************************************
INSTANCE It_wodaswiecona(C_Item)
{
	name 			=	"Woda œwiêcona";

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
	name    	 = "Kamieñ Wiedzy";

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
	name 				=	"Fa³szywy raport";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[2]				= 	"Znaleziony w chacie Scatty'ego.";
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
	TEXT[2]			= 	"Zapiski nale¿¹ do jakiegoœ Magnata";
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
					Doc_PrintLine	( nDocID,  0, "28 wrzesieñ"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Nie s¹dzi³em, ¿e Gomez bêdzie na tyle g³upi, ¿eby trzymaæ pierœcieñ w swoim pokoju. W ka¿dej chwili któraœ z tych przeklêtych lafirynd mo¿e go ukraœæ. O Bandytach nie wspominaj¹c. Dobrze, ¿e chocia¿ ja mam wiêcej oleju w g³owie. Postanowi³em ukryæ swój pierœcieñ w kuchni. To nietypowe miejsce. Zagl¹daj¹ tam tylko kucharze, których ³atwo przekupiæ. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
**   Pierœcienie					**
*********************************************/
	instance EBR_Ring1(C_Item)
{
	name 					=	"Magnacki pierœcieñ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring1;
	on_unequip				=	UnEquip_EBR_Ring1;

	description		= name;
	TEXT[0]			= "Pierœcieñ prawdopodobnie";
	TEXT[1]			= "nale¿y do Magnatów. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si³a...";
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
	name 					=	"Magnacki pierœcieñ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring2;
	on_unequip				=	UnEquip_EBR_Ring2;

	description		=  name;
	TEXT[0]			= "Pierœcieñ prawdopodobnie";
	TEXT[1]			= "nale¿y do Magnatów. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si³a...";
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
	name 					=	"Magnacki pierœcieñ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_EBR_Ring3;
	on_unequip				=	UnEquip_EBR_Ring3;

		description		=  name;
	TEXT[0]			= "Pierœcieñ prawdopodobnie";
	TEXT[1]			= "nale¿y do Magnatów. Wygrawerowano";
	TEXT[2]			= "na nim napis: W trzech jest si³a...";
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
//*********** QUEST OD R¥CZKI
//*******************************************************************************
	instance Bergs_Ring(C_Item)
{
	name 					=	"Pierœcieñ Berga";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	50;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= name;
	TEXT[0]					= "Pierœcieñ nale¿y do Berga.";
	TEXT[1]					= "Wygrawerowano na nim jego imiê.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};
//*******************************************************************************
	instance Skarb_ring1(C_Item)
{
	name 					=	"Szczeroz³oty pierœcieñ";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	200;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= 	name;
	TEXT[2]					= 	"Pierœcieñ znalaz³em w sk³adowisku Magnatów.";
	TEXT[3]					= 	"Jest sporo warty.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};
//*******************************************************************************
	instance Skarb_ring2(C_Item)
{
	name 					=	"Pierœcieñ z diamentem";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;
	value 					=	300;
	visual 					=	"ItMi_Ring_01.3ds";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	description				= 	name;
	TEXT[2]					= 	"Pierœcieñ znalaz³em w sk³adowisku Magnatów.";
	TEXT[3]					= 	"Jest sporo warty.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};
//*******************************************************************************
INSTANCE Skarb_cup1 (C_Item)
{
	name 				=	"Z³oty puchar Magnatów";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	value 				=	150;
	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;
	description			= 	name;
	TEXT[2]				= 	"Puchar znalaz³em w sk³adowisku Magnatów.";
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
	TEXT[3]				= 	"szwalni w œrodku lasu.";
};
func void UseSzwaczList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "PaŸdziernik"					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Mamy tydzieñ na przygotowanie nastêpuj¹cych ubrañ:"	);
					Doc_PrintLines	( nDocID,  0, "- futro ze skóry trolla"					);
					Doc_PrintLines	( nDocID,  0, "- piêæ futer z wilka"					);
					Doc_PrintLines	( nDocID,  0, "- dwa skórzane pancerze"					);
					Doc_PrintLines	( nDocID,  0, "- wygarbowaæ pozosta³e skóry"					);
					Doc_PrintLines	( nDocID,  0, "Pracy du¿o, czasu ma³o."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   );  
				
					Doc_Show		( nDocID );
		
};
//*******************************************************************************
//*********** NOWY OBÓZ
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
	TEXT[3]				= "Nale¿y do Baal Kagana";
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
					Doc_PrintLines	( nDocID,  0, "Piszê do was Bracia w imieniu Y'Beriona. Sprawa jest dosyæ powa¿na. W naszym Obozie dziej¹ siê niepokoj¹ce rzeczy. Znacz¹co wzros³a liczba tajemniczych opêtañ wœród Nowicjuszy. Prosimy Magów Wody o pomoc w tej sprawie oraz zdefiniowaniu jej przyczyny."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niechaj gniew Beliara nigdy was nie siêgnie."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Shan"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};
/*******************************************************************************************/
INSTANCE ItMi_OzdobnaKlinga (C_Item)
{
	name 				=	"Ozdobna rêkojeœæ";

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
	name 				=	"Pos¹¿ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[2]				= "Ten pos¹¿ek przedstawia dziwne bóstwo.";
	//TEXT[1]				= "";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/	
	INSTANCE JeremiahMoonshine(C_Item)
{	
	name 					=	"Wóda Jeremiasza";

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
	name 					=	"Kryszta³ z Kot³a";

	mainflag 				=	ITEM_KAT_RUNE;
	flags 					=	ITEM_MISSION;
	spell						= SPL_THUNDERBOLT;

	value 					=	800;

	visual 					=	"ErIt_Crystal.3DS";
	material 				=	MAT_STONE;

	description			= name;
	TEXT[2]				= "Magiczny kryszta³ wykopany wiele lat";
	TEXT[3]				= "temu przez Kretów z Wolnej Kopalni.";
	TEXT[4]				= "Posiada magiczne w³aœciwoœci.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};	
/******************************************************************************************/
INSTANCE Mis_PamietnikStarca(C_Item)
{	
	name 					=	"Pamiêtnik starca";
	
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
					Doc_PrintLines	( nDocID,  0, "Dziœ 30 czerwca. Dzieñ moich urodzin. To nieprawdopodobne, ¿e mam ju¿ 78 lat. Tyle czasu minê³o. Mój zegar wci¹¿ tyka. Mam wra¿enie, ¿e przyspiesza. Oj, chyba siê starzejê. Cz³owiek, który us³ysza³by o moich dzisiejszych dokonaniach i nie przeczyta³ tego pamiêtnika powiedzia³by, ¿e mam 20 lat. Niestety tak nie jest, ale przyznam, ¿e dobrze siê trzymam.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Tak, tak. To ja dzisiaj rano uciek³em z Kot³a. Uda³o mi siê zabraæ cenny kryszta³, który Najemnicy wykopali kilka dni temu. Te durnie zostawi³y go na stole w jednej z chat. Kradzie¿ tej b³yskotki by³a dziecinnie prosta. Tylko co ja teraz z ni¹ zrobiê? Nie mogê zejœæ z góry, bo inaczej mnie znajd¹. Co ja piszê?! Nawet jak tu zostanê, to mnie znajd¹. Taki stary, a taki g³upi.");
					Doc_Show		( nDocID );
	};
	
//*******************************************************************************
//*********** £OWCY ORKÓW
//*******************************************************************************

//*******************************************************************************
INSTANCE foodlowcow (C_Item)
{
	name 				=	"¯ywnoœæ dla ³owców orków";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	400;

	visual 				=	"ItMi_Pocket.3ds";
    material            =    MAT_LEATHER;

	
	scemeName           =    "MAPSEALED";
	on_state[0]		    =	 Usefoodlowocow;
	
	description			= 	"Dostawa ¿ywnoœci od Wilka";
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
	Print ("Zebra³eœ ¿ywnoœæ"); 
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
	name 				=	"Oddech Œni¹cego";

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
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAYA_STONEPLATE_02.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
		//ItWr_Stoneplate_01.3DS
	//1.03 - ³atka 
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
	TEXT[2]					= "jak u¿ywaæ si³y";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseBlackPlateSTR()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAYA_STONEPLATE_02.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
					//if (HeroUseBlackPlateSTR == false)
					//{
					B_RaiseAttribute	(ATR_STRENGTH,	3); 
					//HeroUseBlackPlateSTR = true;
					//};
	};
	
	//pierscieñ ukradziony przez uciekiniera - Bractwo
	instance powerRing(C_Item)
{
	name 					=	"Pierœcieñ opêtania";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	120;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_OPE;
	on_unequip				=	UnEquip_OPE;

	description		= name;
	TEXT[0]			= "Pierœcieñ ma potê¿n¹ moc.";
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
		print ("Czujesz siê jakbyœ straci³ wolê");
	};

	FUNC VOID UnEquip_OPE()
	{
	self.protection [PROT_POINT] 		-=  5;
	};

	// ukradziony amulet
	INSTANCE  powerAmulett(C_Item)
{
	name 			=	"Amulet opêtania";

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
		print ("Czujesz siê s³abiej.");
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
    Print ("Znaleziono 40 bry³ek rudy");
	};
};

//*******************************************************
// ZAKRWAWIONA SIEKIERA 
// Seria zabójstw w Bractwie
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
	TEXT[4] 			= "T¹ broni¹ dokonano zabójstwa";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_OstrzeCSI(C_Item)
{	
	name 				=	"Ma³e ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"It_BladeOld.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[4]				= "U¿ywane w tartakach.";
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
	TEXT[2]			= 	"Nieznane dzia³anie.";
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;

};
func void Equip_lukoram ()
{
hero_regeneruje_mana = true;
//print ("Czujê, ¿e moja energia magiczna siê regeneruje");
};
func void UnEquip_lukoram ()
{
hero_regeneruje_mana = false;
};
/********************************************************************************/
INSTANCE ItCH1_ListaDlugowPatrosa (C_Item)
{	
	name 				=	"Lista d³ugów";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePatrsoMsg;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"D³u¿nicy Starkada";
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
					Doc_PrintLine	( nDocID,  0, "D³u¿nicy:"					);
					Doc_PrintLine	( nDocID,  0, "- Darrion (50 bry³ek rudy za miêso)"					);
					Doc_PrintLine	( nDocID,  0, "- Gor Na Idon (150 bry³ek rudy za gorza³kê)"					);
					Doc_PrintLine	( nDocID,  0, "- Joru (50 bry³ek rudy za chleb, 5 kawa³ków sera i maliny)"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

//*******************************************************************************
//*********** OBÓZ MYŒLIWYCH
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
	TEXT[1]				= "Otwiera jedn¹";
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
	name 				=	"Przeklête ostrze";

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
	TEXT[1]				= "Na ostrze na³o¿ono kl¹twê";
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
	TEXT[1]				= "Miecz zosta³ oczyszczony!";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
// PIERŒCIEÑ CLAWA
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
	TEXT[1]			= "Pierœcieñ nale¿y do Clawa.";
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
	TEXT[1]				= "Sakiewka pe³na gwoŸdzi.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekG10()
{
    CreateInvItems (self, ItMiGwozdz, 10);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 10 gwoŸdzi",COL_WHITE);
	};

};
/******************************************************************************************/
// P£ASZCZ DO MISJI Z BLIZN¥
/******************************************************************************************/
INSTANCE ItMi_PancerzMil (C_Item)
{
	name 				=	"P³aszcz ze skóry wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	180;

	visual 				=	"orgl.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 180;
};
/******************************************************************************************/
// BROÑ KOSY - 1hit
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
	name 				=	"Ksiê¿ycowe ostrze";

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
	TEXT[0]				= "Wspania³a broñ!";
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
**   Kryszta³ Drena					**
*********************************************/
INSTANCE BlueCrystal (C_Item)
{
	name 				=	"Niebieski kryszta³";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	300;

	visual 				=	"ErIt_Crystal.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};	
/******************************************************************************************/
//	Mapa KRYJÓWKA  1
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit1(C_Item)
{	
	name 					=	"Mapa do kryjówki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap1Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na której";
	TEXT[2]					= "oznaczy³em kryjówkê w jaskini";
	TEXT[3]					= "na ziemiach orków.";
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
//	Mapa KRYJÓWKA  2
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit2(C_Item)
{	
	name 					=	"Mapa do kryjówki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap2Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na której";
	TEXT[2]					= "oznaczy³em kryjówkê we wie¿y";
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
//	Mapa KRYJÓWKA  3
/******************************************************************************************/
INSTANCE ItWrWorldmap_Edit3(C_Item)
{	
	name 					=	"Mapa do kryjówki";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMap3Kryjowka;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na której";
	TEXT[2]					= "oznaczy³em kryjówkê w jaskini";
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
	TEXT[0]				= 	"Dzia³anie nieznane.";

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
	TEXT[0]				= 	"Jest w stanie wyleczyæ wszystkie rany.";

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
	TEXT[0]				= "Napój pulsuje dziwn¹ energi¹.";
	TEXT[1]				= "Lepiej tego nie piæ!";

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

	TEXT[0] 					=	"OdpowiedŸ od kupca Lutero.";
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
	Doc_PrintLines	( nDocID,  0, "Podobno jesteœ w posiadaniu nietypowego trofeum, które chcia³bym nabyæ. Nie mogê zaoferowaæ ci rudy, gdy¿ nasz¹ walut¹ jest z³oto. Za trofeum mogê ci daæ kaptur kolczy, który zapewne nie raz uratuje ci ¿ycie w tak niebezpiecznym miejscu, jakim jest Kolonia. Myœlê, ¿e oferta jest korzystna dla obu stron, tym bardziej ¿e te szpony s¹ niemal¿e bezwartoœciowe za barier¹. Dobrze przemyœl moj¹ propozycjê. Bêdê oczekiwa³ na odpowiedŸ.");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Innos z tob¹,");
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
	name 				=	"Z³oty miecz";

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
	TEXT[1]				= "Piêkny miecz, jednak niezwykle kruchy.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE It_DavorsBow (C_Item)
{
	name 				=	"£uk Davora";

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
	name 			=	"Amulet Mrocznych Si³";

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
	TEXT[1]				= "Zawiera ¿ywnoœæ do Kopalni";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void Useeqn1()
{
    CreateInvItems (self, ItFoLoaf, 20);
    CreateInvItems (self, ItFoApple, 30);
    CreateInvItems (self, ItFoCheese, 10);
	if (Npc_IsPlayer(self))
	{
    Print ("Nie powinieneœ by³ tego robiæ!");
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
	TEXT[1]				= "Zawiera narzêdzia";
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
    Print ("Nie powinieneœ by³ tego robiæ!");
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
    Print ("Nie powinieneœ by³ tego robiæ!");
	};
};

/******************************************************************************************/
INSTANCE ItMis_SlepperBreathJoint(C_Item)
{
	name 				=	"Oddech Œni¹cego";

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
	name 				=	"Paczka z rzeczami Magów Ognia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
    material            =      MAT_LEATHER;

	
	scemeName           =    "MAPSEALED";
	//on_state[0]		    =	UsePaczkaMagow;
	
	description			= name;
	TEXT[1]				= "Przesy³ka Magów";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/****************************************************
**  	ROSCOE: LIST OD LARESA			   **
****************************************************/
INSTANCE ItMis_LetterLaresToFireMages (C_Item)
{	
	name 				=	"List do Magów Ognia";

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
					Doc_PrintLines	( nDocID,  0, "Wspólnie z genera³em Lee oraz Magami Wody pod dowództwem Saturasa, chcemy ci z³o¿yæ pewn¹ propozycje. Zbyt d³ugo dawaliœcie siê wykorzystywaæ Gomezowi i jego s³ugom. Uwa¿amy, ¿e powinniœcie do³¹czyæ do Nowego Obozu i wesprzeæ Magów Wody w ich pracach nad zniszczeniem magicznej Bariery. Chcemy podzieliæ siê z Wami naszymi obawami o nieobliczalnoœci Gomeza. Nie chcemy, by tak szanowni s³udzy Innosa jak Wy przyp³acili ¿yciem za jego szaleñstwo. Liczymy na przychylne rozpatrzenie naszej propozycji."	);
					Doc_PrintLine	( nDocID,  0, "Z wyrazami szacunku,");
					Doc_PrintLine	( nDocID,  0, "Lares, przywódca Szkodników");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  
				
					Doc_Show		( nDocID );
					
};

/****************************************************
**  	SKAZA: ZAŒWIADCZENIE DLA GRAHAMA		   **
****************************************************/
INSTANCE ItMis_Thorus_Safe_conduct (C_Item)
{	
	name 				=	"Zaœwiadczenie Thorusa";

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
					Doc_PrintLines	( nDocID,  0, "W imieniu Gomeza, g³ównego Magnata Starego Obozu poœwiadczam, ¿e posiadaczowi tego listu przys³uguje prawo zabrania mapy wskazuj¹cej drogê do Obozu Bandytów i notatek opisuj¹cych kierunki dzia³añ naszego wroga. "	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "Thorus, przywódca Stra¿ników"	);
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
					Doc_PrintLines	( nDocID,  0, "Oko³o po³udnia, podczas powrotu z patrolu dostrzeg³em dwóch Bandytów, wracaj¹cych z polowania. Nie uda³o im siê mnie wykryæ, wiêc zacz¹³em ich œledziæ. Poszli w kierunku Kanionu Trolli. Niestety, gdy doszli na szczyt zorientowali siê, ¿e ich œledzê. Nie zd¹¿y³em zobaczyæ w któr¹ stronê poszli. Ledwo uszed³em z ¿yciem, unikaj¹c zabójczej strza³y."	);
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
	TEXT[1]				= "Otwiera skrzyniê";
	TEXT[2]				= "na placu wymian";
	TEXT[4]				= NAME_Value;					COUNT[4]	= 0;
};	
/****************************************************
**  	GRAHAM: DROGA DO OB	   **
****************************************************/
INSTANCE ItMis_TripMap(C_Item)
{	
	name 					=	"Mapa do Obozu Bandytów";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;
	scemeName				=	"MAP";	
	on_state[0]				=	Use_TripMap;
	description				= name;
	TEXT[1]					= "G³ówny cel, czyli po³o¿enie";
	TEXT[2]					= "Obozu Bandytów nie jest";
	TEXT[3]					= "dok³adnie zaznaczone.";
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
**  	SKRZYNIA BANDZIORÓW     **
****************************************************/
INSTANCE ItQt_IronPack (C_Item)
{
	name 				=	"Paczka ze stal¹ dla Quentina";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	170;

	visual 				=	"NW_CITY_WEAPON_BAG_01.3ds"; 
	material 			=	MAT_CLAY;
	
	scemeName			=	"MAPSEALED";	
	//on_state[0]			=	UseIronPack2;
	
	description			= name;
	TEXT[2]				= "Paczka jest pe³na stalowych prêtów";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseIronPack2()
{
    CreateInvItems (self, ItMiSwordraw, 30);
	if (Npc_IsPlayer(self))
	{
    Print ("Znaleziono 30 stalowych prêtów.");
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
	TEXT[1]				= "Sakiewka z rud¹ zdobyt¹ przez Josha";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE itmi_hysenkey(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Zabrany Hysenowi";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
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
	TEXT[1]				= 	"Notatki znalezione przy Stra¿niku";
	TEXT[2]				= 	"pilnuj¹cym wejœcia do Opuszczonej Kopalni.";
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
					Doc_PrintLines	( nDocID,  0, "Od dnia dzisiejszego obowi¹zuje bezwzglêdny zakaz schodzenia do Opuszczonej Kopalni. Wejœcie z rozkazu Gomeza ma zostaæ solidnie zabezpieczone i chronione przez dwóch wyznaczonych Stra¿ników. Z ko³owrota mo¿e korzystaæ jedynie upowa¿niona osoba za okazaniem dokumentu z moim podpisem.");
					Doc_PrintLine	( nDocID,  0, "              "					);
					Doc_PrintLine	( nDocID,  0, "                        Thorus"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );				
};

INSTANCE itmi_grd2002_key(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[1]				= 	"Zabrany Stra¿nikowi z posterunku";
	TEXT[2]				= 	"przy Opuszczonej Kopalni";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= Value_Schlüssel;
};	

INSTANCE itmi_plac_doc2 (C_Item)
{	
	name 				=	"Obronnoœæ wzgórza";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   use_plac_doc2;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione w skrzyni";
	TEXT[2]				= 	"przy wejœciu do Opuszczonej Kopalni.";
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
					
					Doc_PrintLine	( nDocID,  0, "Obronnoœæ wzgórza"					);
					Doc_PrintLines	( nDocID,  0, "Zgodnie z zaleceniami Gomeza w ci¹gu najbli¿szych dwóch tygodni most ma zostaæ obsadzony trzema Stra¿nikami uzbrojonymi w œrednie kusze. Ma to zapobiec inwazyjnym atakom Bandytów. Ponadto ka¿dy ze Stra¿ników obs³uguj¹cych plac wymian ma natychmiast zg³osiæ siê do kwatermistrza po kuszê i uiœciæ za ni¹ ulgow¹ op³atê w wysokoœci 30 bry³ek rudy. Robicie to dla ocalenia ty³ków! Ka¿dy robotnik pracuj¹cy na placu ma otrzymaæ nó¿ bojowy umo¿liwiaj¹cy mu podstawowe dzia³ania obronne. Z naszej strony informujemy, ¿e podwajamy iloœæ Stra¿y przy skrzyniach z rud¹ transportowanych na plac.");
					Doc_PrintLine	( nDocID,  0, "              "					);
					Doc_PrintLine	( nDocID,  0, "                        Arto"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Brama ma byæ zamykana codziennie od zmierzchu, a¿ do œwitu. Zwiêkszy to obronnoœæ placu wymian. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Thorus");
					Doc_PrintLines	( nDocID,  0, "PS: Nie zasypiaæ na warcie sukinsyny, bo pewnego dnia mo¿ecie siê nie obudziæ!");
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					
					Doc_PrintLine	( nDocID,  0, "Kwatermistrz - przydzia³ obowi¹zków"					);
					Doc_PrintLines	( nDocID,  0, "Od chwili dostarczenia tego pisma na plac wymian Spark staje siê lokalnym kwatermistrzem. Dowiedzia³em siê przypadkowo, ¿e uczêszcza³ do prywatnej szko³y dla mieszczan, a na lekcji rachunków by³ najrzadziej bato¿ony. Myœlê, ¿e nadaje siê na to stanowisko. Raporty z ka¿dego transportu przekazuj dowódcy konwoju. Tak bêdzie najbezpieczniej.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Bartholo");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
	TEXT[1]				= 	"Raport mia³ dostaæ Bartholo";
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
					Doc_PrintLines	( nDocID,  0, "Wydobycie przebiega wzorowo. Nie ma ¿adnych nieprawid³owoœci i wszystko idzie zgodnie z zamierzonym planem. Jednym k³opotem s¹ wy³¹cznie pe³zacze, które mno¿¹ siê na potêgê. Na szczêœcie Stra¿nicy Œwi¹tynni zgodnie z umow¹ skutecznie broni¹ newralgicznych punktów w których przebiega wydobycie. W ostatnim raporcie wspomnia³em o nowym minerale znalezionym w Kopalni. Jeden z Kopaczy uparcie twierdzi, ¿e to niezwykle rzadka czarna ruda. Jednak nie znaleŸliœmy ¿adnych jej z³ó¿. Przypuszczam, ¿e ktoœ móg³ j¹ przemyciæ do Kopalni. Na razie zosta³a zabezpieczona w magazynie Ulberta. A klucz zosta³ dodatkowo ukryty w innym magazynie. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                        Ian");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
	TEXT[1]				= 	"Ruda nale¿y do Bandyty Emanuela.";
	
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
// ZADANIE: SKARB STAREGO STRA¯NIKA
//////////////////////////////////////////////////////
INSTANCE  ItMi_CraigsAmulet(C_Item)
{
	name 			=	"Poz³acany amulet";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	200;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= name;
	TEXT[1]			= "Pami¹tka po Stra¿niku Craigu";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA¯NIKA
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
	TEXT[1]			= "Pami¹tka po Stra¿niku Craigu";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA¯NIKA
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
	TEXT[4]				= 	"Otwiera ukryt¹ skrzyniê.";
};

//////////////////////////////////////////////////////
// ZADANIE: SKARB STAREGO STRA¯NIKA
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
	TEXT[2]					= "coœ zawiniête.";
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
		PrintS_Ext("Znalaz³eœ klucz!", COL_White);
		B_LogEntry(CH2_TreasureOldGuard, "Oszo³omiony Joel zaprowadzi³ mnie prosto do mapy, któr¹ ukry³ w krzakach. Na tej starej kartce papieru wyraŸnie ktoœ wyrwa³ dziurê palcem. Prawdopodobnie Craig nie potrafi³ pisaæ, albo nie mia³ pod rêk¹ pióra (ciê¿ko o takie rzeczy w Kopalni). Nie powinienem mieæ wiêkszych problemów z odszukaniem wydartego miejsca. W pergaminie by³ zawiniêty klucz.");
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
				Doc_PrintLines	( nDocID,  0, "Ten sukinsyn Parvez wywlók³ na bagna piêciu moich najpunktualniejszych p³atników. "					);
				Doc_PrintLines	( nDocID,  0, "Nie dajcie sobie zrobiæ prania mózgu. Ten œwir ma siê tu ju¿ nigdy nie pojawiæ. Zróbcie to porz¹dnie. Tak, ¿eby ju¿ nie mia³ myœli tu wracaæ. "					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLine	( nDocID,  0, "Bloodwyn");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================

INSTANCE ItMi_FlourBag (C_Item)
{
	name 				=	"Worek m¹ki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Worek m¹ki.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_FlourBagWithSand (C_Item)
{
	name 				=	"Worek m¹ki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Worek m¹ki z piaskiem.";
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
					Doc_PrintLines	( nDocID,  0, "Nareszcie mi siê uda³o. Wspi¹³em siê na sam szczyt tej ska³y. Te dupki patrz¹ na mnie z podziwem. Nie mogê siê doczekaæ, a¿ wyskocz¹ z rudy, o któr¹ siê za³o¿yliœmy. Szczególnie liczê na sakiewkê Matta. Ten goœæ zawsze mnie irytowa³. Tym razem ja siê œmieje ostatni."					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Czytelniku, na odwrocie opisa³em moje sztuczki pozwalaj¹ce zwiêkszyæ sprawnoœæ fizyczn¹, ale skoro siê tu dosta³eœ, to pewnie ich nie potrzebujesz. Trening czyni mistrza."	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Spisano w ch³odny, dwudziesty siódmy wieczór listopada");
					Doc_PrintLines	( nDocID,  0, "Kopacz Skirnir");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
					B_RaiseAttribute	(ATR_DEXTERITY,	5);
};

INSTANCE ItMi_GhostsBagSpecial (C_Item)
{
	name 				=	"Tobo³ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	//scemeName     =   "MAPSEALED";	
	//on_state[0]		=	UseDostawa_Cyrusa;
	
	description		= name;
	TEXT[1]				= "Tobo³ek pewnego stra¿nika królewskiego";
	//TEXT[4]			= NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////////
// ZADANIE: TOPÓR TORLOFA
// Przedmioty otrzymywane od NPC
// Sztabka w œwiecie przy uszkodzonym wozie
//////////////////////////////////////////////////////////

INSTANCE Torlofs_Axt2 (C_Item)
{
	name 				=	"Uszkodzony topór Torlofa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	//owner 				= 	SLD_737_TORLOF;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItMi_OreStabOldMetode (C_Item)
{
	name 				=	"Stara sztabka stali ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	value 				=	50;

	visual 				=	"Er_OreStab.3ds";
    material            =    MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Sztabka wytopiona z rudy";
	TEXT[3]				= 	"wed³ug starej metody odlewu.";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

INSTANCE Torlofs_Axt2_Fixed (C_Item)
{
	name 				=	"Naprawiony topór Torlofa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	99;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	//owner 				= 	SLD_737_TORLOF;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};