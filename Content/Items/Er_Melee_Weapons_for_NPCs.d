/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* BRONIE DLA NPC
******* Opis: Wszystkie bronie znajduj¹ce siê w tym pliku
******* nie s¹ przeznaczone dla gracza, lecz dla wa¿nych NPC.
*****************************************************/
INSTANCE Miecz1H1 (C_Item) //Tukash
{	
	name 				=	"Miecz Andrewa" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	270;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	owner 				= 	GRD_7008_Tukash;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	38;
	visual 				=	"DB_Itmw_1H_Sword_Bastard_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H2 (C_Item) //Alex
{	
	name 				=	"Miecz Alexa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;
	
	damageTotal			= 	46;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	owner	=				NON_5600_Alex;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	46;
	visual 				=	"DB_Itmw_1H_Sword_Bastard_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H3 (C_Item) //Quentin
{	
	name 				=	"Miecz Quentina";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;
	
	damageTotal			= 	66;
	damagetype			=	DAM_EDGE;
	range    			=  	110;		
	owner 				= 	BAN_1610_Quentin;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H4 (C_Item) //Doyle
{	
	name 				=	"Miecz Doyle'a";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	110;		
	owner 				= 	BAN_1613_Doyle;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H10 (C_Item) //kaplica Beliara
{	
	name 				=	"Wiêkszy Miecz Rozpaczy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2400;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 18;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	50;
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Magic;				COUNT[2]	= damage[DAM_INDEX_Magic];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* DROP Z PRZECIWNIKÓW
******* Opis: Te bronie zostawiaj¹ po sobie przeciwnicy gracza.
******* Gracz otrzymuje je po ich pokonaniu. 
*****************************************************/
INSTANCE Miecz1H12 (C_Item) //Thompson
{	
	name 				=	"Miecz Thompsona";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;
	owner 				=	NON_5636_Thompson;
	damageTotal			= 	55;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	100;		
	damage[DAM_INDEX_FIRE]	= 1;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	30;
	visual 				=	"DB_ItMw_1h_Sword_Rep_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H17 (C_Item) //Grimes
{	
	name 				=	"Miecz magicznego deszczu";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 5;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	60;
	visual 				=	"DB_ItMw_1H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H18 (C_Item) //kaplica innosa
{	
	name 				=	"Wiêkszy miecz magicznego deszczu";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2000;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 8;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	85;
	visual 				=	"DB_ItMw_1H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz2H4 (C_Item) //Grim - 4 rozdz. 
{	
	//edit by Nocturn
	name 				=	"Claymore";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1820;
	
	damageTotal			= 	64;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz2H6 (C_Item) //Hector -- Skelden
{	
	//edit by Nocturn
	name 				=	"Ramiê dowódcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3500;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;
	owner 				= 	GRD_3935_Hector;
	visual 				=	"DB_ItMw_2H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};