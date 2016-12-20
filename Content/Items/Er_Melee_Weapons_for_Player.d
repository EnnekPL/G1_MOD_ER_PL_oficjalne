/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* BRONIE DLA GRACZA
******* Opis: Wszystkie bronie znajduj¹ce siê w tym pliku
******* gracz mo¿e kupiæ, dostaæ lub znaleŸæ. Wa¿ny jest
******* balans, oraz cena. Ponadto do czêœci broni 
******* do³¹czany jest plan, który mo¿na wykorzystaæ
******* u kowala. 
*****************************************************/

/****************************************************
******* ROZDZIA£ 1
******* PARAMETRY MAX DLA ROZDZIA£U
******* maksymalna [DAM_EDGE]	=	32;
******* maksymalna [DAM_FIRE] = 	0;
******* maksymalna [DAM_MAGIC] = 	0;
*****************************************************/
	
/****************************************************
******* MIECZ HORYZONTÓW
******* Opis: jest to nagroda od Huno, jeœli nie wpêdzimy
******* go ponownie w na³óg. 
*****************************************************/
INSTANCE Miecz1H5 (C_Item) //nagroda od Huno
{	
	name 				=	"Miecz horyzontów";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	22;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	35;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[1]				= "Cechuje go daleki zasiêg";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Dex_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ KOWALA
******* Opis: miecz mo¿na wykuæ po zdobyciu planu, 
******* który sprzedaje Darrion.  
*****************************************************/
INSTANCE Miecz1H6 (C_Item) //do wykucia
{	
	name 				=	"Miecz kowala";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	750;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H6(C_Item)
{	
	name 					=	"Plan: Miecz kowala";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H6;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H6()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz kowala"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 30"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x sztabka magicznej stali"					);
					Doc_PrintLine	( nDocID,  0, "1x skóra wilka"					);
					Doc_PrintLine	( nDocID,  0, "1x pociête drewno"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* ŒWIÊTY MŒCICIEL
******* Opis: miecz stosowany w czasie wojny przez  
******* paladynów i dzier¿ony przez niektórych niektórych
******* magów, poniewa¿ stanowi³ swoisty symbol oddania 
******* Innosowi. Plan na niego mo¿na znaleŸæ na Ziemi
******* Orków przy starym szkielecie (nale¿¹cym do kowala).
*****************************************************/
INSTANCE Miecz1H8 (C_Item) //Mœciciel
{	
	name 				=	"Œwiêty Mœciciel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1450;
	

	damageType				= DAM_EDGE;
	range    			=  	110;		
	damageTotal			= 	65;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	30;
	visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H8(C_Item)
{	
	name 					=	"Plan: Œwiêty Mœciciel";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	400;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H8;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H8()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Œwiêty Mœciciel"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 65"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 45"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana mana: 30"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "3x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "2x sztabka magicznej stali"					);
					Doc_PrintLine	( nDocID,  0, "1x sztabka ciemnej stali"					);
					Doc_PrintLine	( nDocID,  0, "2x kie³"					);
					Doc_PrintLine	( nDocID,  0, "1x pociête drewno"		);
					Doc_PrintLine	( nDocID,  0, "1x bry³ka z³ota"		);
					Doc_PrintLine	( nDocID,  0, "1x niebieski kryszta³"		);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* PORZ¥DNY MIECZ JEDNORÊCZNY
******* Opis: zwyk³y miecz wykuty wed³ug projektu pewnego  
******* Myrtañskiego kowala. Mo¿na go kupiæ u Fiska lub kupiæ
******* plan u Huno. 
*****************************************************/
INSTANCE Miecz1H11 (C_Item) //handel Fisk
{	
	name 				=	"Porz¹dny miecz jednorêczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;
	
	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	22;
	
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	5;
	visual 				=	"DB_ItMw_1h_Sword_Rep_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H11(C_Item) //handel Huno
{	
	name 					=	"Plan: Porz¹dny miecz jednorêczny";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H11;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H11()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Porz¹dny miecz jednorêczny"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 30"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 22"					);
					Doc_PrintLine	( nDocID,  0, ""	);				
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x pociête drewno"		);
					Doc_PrintLine	( nDocID,  0, "2x bry³ka wêgla"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* MA£Y MIECZ OGNIA
******* Opis: tê broñ otrzymujemy jako nagrodê za zabicie  
******* morakha. 
*****************************************************/
INSTANCE Miecz1H13 (C_Item) //nagroda za zabicie morakha
{	
	name 				=	"Ma³y miecz ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1200;
	
	damageTotal			= 	35;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	90;		
	damage[DAM_INDEX_FIRE]	= 3;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	50;
	visual 				=	"DB_ItMw_1H_Sword_Short_Rep_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* SZTYLET INNOSA
******* Opis: tak¹ broñ nosz¹ nowicjusze ognia, oraz mo¿na  
******* j¹ kupiæ u Torreza.
*****************************************************/
INSTANCE Miecz1H14 (C_Item)  //Nowicjusze Ognia
{	
	name 				=	"Sztylet Innosa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;
	
	damageTotal			= 	24;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	80;		
	damage[DAM_INDEX_FIRE]	= 2;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	22;
	visual 				=	"DB_ItMw_1H_Sword_Short_Rep_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/****************************************************
******* B£YSK NOCY
******* Opis: plan kowalski na tê broñ mo¿na znaleŸæ   
******* w chacie Z³ego lub kupic u Huana. 
*****************************************************/
INSTANCE Miecz1H15 (C_Item)
{	
	name 				=	"B³ysk nocy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;
	
	damageTotal			= 	26;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	18;
	visual 				=	"DB_ItMw_1H_Sword_Short_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H15(C_Item) //handel Huan
{	
	name 					=	"Plan: B³ysk nocy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	40;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H15;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H15()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "B³ysk nocy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 26"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 18"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x pociête drewno"		);
					Doc_PrintLines	( nDocID,  0, "1x sztabka magicznej stali"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* PROMIEÑ ŒWIAT£A	
******* Opis: miecz by³ noszony przez wybitnie zas³u¿onych   
******* paladynów w czasie I wojny z orkami. Do znalezienia
******* w œwi¹tyni Œni¹cego przy ciele umêczonego paladyna.
*****************************************************/
INSTANCE Miecz2H1 (C_Item) //Œwi¹tynia Œni¹cego
{	
	name 				=	"Promieñ Œwiat³a";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3500;
	
	damageTotal			= 	78;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	80;		
	damage[DAM_INDEX_MAGIC]	=	 10;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_MAGIC;				COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* KIE£ CIENOSTWORA	
******* Opis: tê broñ znajdujemy przy ciele pustelnika z    
******* Bractwa, który umiera na Cmentarzysku Orków.
*****************************************************/
INSTANCE Miecz2H2 (C_Item) //pustelnik z bractwa (rozdzia³ 3)
{	
	name 				=	"Kie³ cieniostwora";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;
	
	damageTotal			= 	53;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ MAGNATA		
******* Opis: zapasowy miecz Gomeza. Mo¿na go znaleŸæ    
******* w jego skrzyni. 
*****************************************************/
INSTANCE Miecz2H3 (C_Item) //skrzynia Gomeza
{	
	name 				=	"Miecz Magnata";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	2200;
	
	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	
	//cond_atr[1]   		= 	ATR_DEXTERITY;
	//cond_value[1]  		= 	70;
	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* POGROMCA ORKÓW		
******* Opis: orê¿ stosowany przez ³owców orków. Plan na   
******* niego mo¿na kupiæ lub znaleŸæ przy ciele Ur Grana.
*****************************************************/
INSTANCE Miecz2H5 (C_Item) // £owcy orków
{	
	name 				=	"Pogromca orków";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	2350;
	
	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"DB_ItMw_2H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz2H5(C_Item) 
{	
	name 					=	"Plan: Pogromca orków";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	500;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz2H5;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz2H5()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pogromca orków"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 85"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 70"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "5x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "4x sztabka magicznej stali"		);
					Doc_PrintLine	( nDocID,  0, "3x sztabka ciemnej stali"		);
					Doc_PrintLines	( nDocID,  0, "2x niebieski kryszta³"					);
					Doc_PrintLines	( nDocID,  0, "1x kie³ trolla"					);
					Doc_PrintLines	( nDocID,  0, "2x skóra orkowego psa"					);
					Doc_PrintLines	( nDocID,  0, "5x ¿¹d³o krwiopijcy"					);
					Doc_Show		( nDocID 	);
	};

/****************************************************
******* SZTYLET ZABÓJCY	
******* Opis: Nagroda za pomoc od Snake'a. Dostajemy od   
******* niego plan.
*****************************************************/
INSTANCE ItMw_DaggerOfMurder(C_Item) 
{	
	name 				=	"Sztylet zabójcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	visual 				=	"steel_dagger.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_DaggerOfMurder(C_Item) //otrzymujemy od Snake'a
{	
	name 					=	"Plan: Sztylet zabójcy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_DaggerOfMurder;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_DaggerOfMurder()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Sztylet zabójcy"					);
										Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 30"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "1x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x sztabka magicznej stali"		);
					Doc_PrintLines	( nDocID,  0, "1x ¿¹d³o krwiopijcy"					);
					Doc_Show		( nDocID 	);
	};

/****************************************************
******* SZTYLETY	
******* Opis: Pospolite bronie, które mo¿na kupiæ u   
******* handlarzy lub znaleŸæ w œwiecie.
*****************************************************/	
INSTANCE ItMw_Dagger (C_Item) 
{	
	name 				=	"Sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	20;
	
	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	7;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Dagger2 (C_Item) 
{	
	name 				=	"Zdobiony sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	35;
	
	damageTotal			= 	12;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	11;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Dagger3 (C_Item) 
{	
	name 				=	"Sztylet wojownika" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	350;
	
	damageTotal			= 	22;
	damagetype			=	DAM_EDGE;
	range    			=  	85;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* RAPIER		
******* Opis: Lekki, ale niezwykle ostry miecz jednorêczny   
******* wymagaj¹cy wyskiego wspó³czynnika zrêcznoœci. 
******* Plan do kupienia u Darriona w trzecim rozdziale. 
*****************************************************/

INSTANCE ItMw_Rapier (C_Item) 
{	
	name 				=	"Rapier" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1400;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_050_1H_Sword_Rapier_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Rapier(C_Item) //do kupienia u Darriona
{	
	name 					=	"Plan: Rapier";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Rapier;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Rapier()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Rapier"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 60"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana zrêcznoœæ: 45"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "2x sztabka magicznej stali"		);
					Doc_PrintLines	( nDocID,  0, "1x ¿¹d³o krwiopijcy"					);
					Doc_PrintLines	( nDocID,  0, "1x pazury topielca"					);
					Doc_PrintLines	( nDocID,  0, "1x bry³ka z³ota"					);
					Doc_Show		( nDocID 	);
	};

/****************************************************
******* MIECZ MISTRZOWSKI		
******* Opis: Wyj¹tkowa, niezwykle lekka i ostra broñ.   
******* Otrzymujemy j¹ jako prezent od Diego. 
*****************************************************/
//Meisterdegen - NEUE INSTANZ
const int Damage_Meisterdegen		= 95; //+10%
const int Condition_Meisterdegen	= 90; //DEX
const int Range_Meisterdegen		= 100;
const int Value_Meisterdegen		= 2200;
//----------------------------10----------------------------------
FUNC VOID Equip_1H_10()
{
	if Npc_IsPlayer (self)
	{ 
		//B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_10);
		Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+5);
	};
};
FUNC VOID UnEquip_1H_10()
{
	if Npc_IsPlayer (self)
	{ 
		//B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_10);
		Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)-5);
	};
};
const string NAME_ADDON_BONUS_1H = "Premia do trafieñ krytycznych";
/******************************************************************************************/
INSTANCE ItMw_Meisterdegen (C_Item)
{	
	name 				=	"Miecz mistrzowski";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Meisterdegen;

	damageTotal  		= 	Damage_Meisterdegen;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Meisterdegen;
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_Meisterdegen;
	
	cond_atr[1]   		=	ATR_STRENGTH;
	cond_value[1]  		=	Condition_Meisterdegen;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};	


/****************************************************
******* PA£ASZ		
******* Opis: Plan na tê lekk¹ broñ mo¿na kupiæ u Huana.   
*****************************************************/
//Degen 	- ItMw_1h_Vlk_Sword
const int Damage_VLKSchwert 			= 40; //+5%
const int Condition_VLKSchwert			= 38; //DEX
const int Range_VLKSchwert				= 70;
const int Value_VLKSchwert				= 700; 
/******************************************************************************************/
INSTANCE ItMw_Addon_BanditTrader (C_Item)
{	
	name 				=	"Pa³asz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKSchwert;

	damageTotal  		= 	Damage_VLKSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_VLKSchwert;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Lekka i porêczna broñ";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_BanditTrader(C_Item) //do kupienia u Huana
{	
	name 					=	"Plan: Pa³asz";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_BanditTrader;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_BanditTrader()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Rapier"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana zrêcznoœæ: 38"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x sztabka magicznej stali"		);
					Doc_PrintLines	( nDocID,  0, "1x ¿¹d³o krwiopijcy"					);
					Doc_PrintLines	( nDocID,  0, "1x skóra dzika"					);
					Doc_PrintLines	( nDocID,  0, "1x bry³ka wêgla"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* WSPANIA£Y PA£ASZ		
******* Opis: Broñ mo¿na znaleŸæ w górnej sali Cmentarzyska    
******* Orków.
*****************************************************/
INSTANCE ItMw_DarkTrader (C_Item) //Cmentarzysko Orków - górna sala
{	
	name 				=	"Wspania³y Pa³asz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKSchwert+377;

	damageTotal  		= 	Damage_VLKSchwert+10;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert+20;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_VLKSchwert+5;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Lekka i porêczna broñ";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* TOPÓR £ASKI		
******* Opis: Jednorêczny topór, który otrzymujemy od    
******* Gorna na spotkaniu. 
*****************************************************/
INSTANCE Gottfrieds_Axt (C_Item)
{
	name 				=	"Topór £aski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;
	
	value 				=	4100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	20;

	//owner 				= 	PC_Hero;
	visual 				=	"ItMw_1H_Axe_Gottfried.3DS";

	description			= name;
	TEXT[1]				= "Wspaniale zdobiona broñ.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Dex_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ SZEROKI		
******* Opis: Jednorêczny, szeroki miecz o delikatnie     
******* zdobionym ostrzu. Plan na niego mo¿na kupiæ 
******* u Mila w rozdziale 2.
*****************************************************/
INSTANCE Miecz1H7 (C_Item) 
{	
	name 				=	"Miecz szeroki";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	47;
	damagetype			=	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	37;
	
	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Edge;				COUNT[2]	= damage[DAM_EDGE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H7(C_Item) //do kupienia u Mila
{	
	name 					=	"Plan: Szeroki miecz";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	60;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H7;

	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID Use_Plan_Miecz1H7()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Szeroki miecz"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 47"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 37"					);
					Doc_PrintLine	( nDocID,  0, ""		);				
					Doc_PrintLine	( nDocID,  0, "2x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "1x sztabka magicznej stali"		);
					Doc_PrintLines	( nDocID,  0, "1x skóra topielca"					);
					Doc_PrintLines	( nDocID,  0, "1x bry³ka z³ota"					);
					Doc_PrintLines	( nDocID,  0, "2x bry³ka wêgla"					);
					Doc_PrintLines	( nDocID,  0, "1x k³y"					);
					Doc_PrintLines	( nDocID,  0, "1x pociête drewno"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* MIECZ ROZPACZY		
******* Opis: Plan na miecz mo¿na znaleŸæ w skrzyni      
******* o szyfrze LPPPLLLPPPPPPL na Wie¿y Mgie³. Zostawi³ 
******* go pewien kowal, który wyku³ wspania³y miecz, 
******* aby pope³niæ przy jego u¿yciu samobójstwo,
******* poniewa¿ zes³anie do kolonii rozdzieli³o go
******* z ukochan¹.
*****************************************************/
INSTANCE Miecz1H9 (C_Item)
{	
	name 				=	"Miecz Rozpaczy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1360;
	range    			=  	100;
	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Magic;				COUNT[2]	= damage[DAM_INDEX_Magic];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Plan_Miecz1H9(C_Item) //do znalezienia w skrzyni w Wie¿y Mgie³
{	
	name 					=	"Plan: Miecz Rozpaczy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	136;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H9;

	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID Use_Plan_Miecz1H9()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz Rozpaczy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 65"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 50"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "4x sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "3x sztabka magicznej stali"		);
					Doc_PrintLines	( nDocID,  0, "2x skóra orkowego psa"					);
					Doc_PrintLines	( nDocID,  0, "2x bry³ka z³ota"					);
					Doc_PrintLines	( nDocID,  0, "5x bry³ka wêgla"					);
					Doc_PrintLines	( nDocID,  0, "4x k³y"					);
					Doc_PrintLines	( nDocID,  0, "1x pazury trolla ziemnego"					);
					Doc_Show		( nDocID 	);
	};
	
/****************************************************
******* Ostrze myrtañskiego ¿o³nierza		
******* Opis: U handlarzy na rozdzia³ 5.
*****************************************************/
INSTANCE Miecz1H_P_1 (C_Item) 
{	
	name 				=	"Ostrze myrtañskiego ¿o³nierza";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2200;
	
	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	
	visual 				=	"new_stl_mastersword.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Prastary paladyn		
******* Opis: U handlarzy na rozdzia³ 5.
*****************************************************/
INSTANCE Miecz1H_P_2 (C_Item) 
{	
	name 				=	"Prastary paladyn";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	3500;
	
	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	89;
	
	visual 				=	"new_stl_claymore.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Miecz krwawego barbarzyñcy		
******* Opis: U handlarzy na rozdzia³ 6.
*****************************************************/
INSTANCE Miecz1H_P_3 (C_Item) 
{	
	name 				=	"Miecz krwawego barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	4880;
	
	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	98;
	
	visual 				=	"new_stl_greatsword.3DS"; 

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Topór krwawego barbarzyñcy		
******* Opis: U handlarzy na rozdzia³ 6.
*****************************************************/
INSTANCE Axe1H_P_1 (C_Item) 
{	
	name 				=	"Topór krwawego barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	5000;
	
	damageTotal			= 	102;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	
	visual 				=	"new_stl_waraxe.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/****************************************************
******* JEDNORÊCZNY URIZIEL		
******* Opis: s¹ to ró¿ne wersje jednorêcznego URIZIELA    
******* które przekuwa dla nas kowal Nordmarczyk. 
*****************************************************/
INSTANCE URIZIEL_Touch (C_Item) //przekute przez Nordmarczyka
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	
	//edit by Nocturn
	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute";
	TEXT[1]				= 	"na broñ jednorêczn¹.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

INSTANCE URIZIEL_Touch_Full (C_Item) //nape³nione u Miltena
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
		value 				=	10000;

//	damageType				=	DAM_EDGE|DAM_FIRE|DAM_MAGIC;//Templer sollten sofort tot sein
	damageType				=	DAM_FIRE|DAM_MAGIC;
//	damageType				=	DAM_MAGIC;
//	damage[DAM_INDEX_EDGE]	=	  1;						//Templer sollten sofort tot sein
	damage[DAM_INDEX_FIRE]	=	 30;
	damage[DAM_INDEX_MAGIC]	=	120;
	//damage[DAM_INDEX_MAGIC]	=	150;

	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	//edit by Nocturn
	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_02.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute";
	TEXT[1]				= 	"na broñ jednorêczn¹ i magicznie na³adowane.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

INSTANCE URIZIEL_Touch_Worst (C_Item) //bez runy
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	
	//edit by Nocturn
	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute";
	TEXT[1]				= 	"na broñ jednorêczn¹. Pozbawione klejnotu.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

