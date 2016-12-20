var c_item choosen_munition;
 


//KURZBOGEN//


INSTANCE ItRw_Bow_Small_01 (C_Item)
{
	name 				=	"Krótki ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	40;//20;

	damageTotal			=	15;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
   // on_equip            =   EquipRangedWeapon;
	//on_unequip          =   UnEquipRangedWeapon;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	7;
	visual 				=	"ItRw_Bow_Small_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_02 (C_Item)
{
	name 				=	"£uk kawaleryjski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	80;//40;

	damageTotal			=	20;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	12;
	visual 				=	"ItRw_Bow_Small_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_03 (C_Item)
{
	name 				=	"£uk polowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	120;//60;

	damageTotal			=	25;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	17;
	visual 				=	"ItRw_Bow_Small_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_04 (C_Item)
{
	name 				=	"£uk myœliwski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	160;//80;

	damageTotal			=	30;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Small_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_05 (C_Item)
{
	name 				=	"Koœciany ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	200;//100;

	damageTotal			=	35;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	22;
	visual 				=	"ItRw_Bow_Small_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//LANGBOGEN//
/******************************************************************************************/
// Org & SLD
INSTANCE ItRw_Bow_Long_01 (C_Item)
{
	name 				=	"D³ugi ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	300;//120;

	damageTotal			=	40;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	28;
	visual 				=	"ItRw_Bow_Long_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_02 (C_Item)
{
	name 				=	"£uk kolczasty";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	370;//140;

	damageTotal			=	44;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	visual 				=	"ItRw_Bow_Long_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_03 (C_Item)
{
	name 				=	"£uk wierzbowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	650;//160;

	damageTotal			=	48;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;
	visual 				=	"ItRw_Bow_Long_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_04 (C_Item)
{
	name 				=	"£uk dêbowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	800;//180;

	damageTotal			=	52;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	40;
	visual 				=	"ItRw_Bow_Long_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_05 (C_Item)
{
	name 				=	"Wilcze k³y";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1150;//220;

	damageTotal			=	56;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	44;
	visual 				=	"ItRw_Bow_Long_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_Long_05_Z (C_Item)
{
	name 				=	"Zu¿yte wilcze k³y";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//220;

	damageTotal			=	56;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	44;
	visual 				=	"ItRw_Bow_Long_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItRw_Bow_Long_06 (C_Item)
{
	name 				=	"Podmuch wiatru";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1450;//240;

	damageTotal			=	60;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	50;
	visual 				=	"ItRw_Bow_Long_06.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItRw_Bow_Long_07 (C_Item)
{
	name 				=	"£uk ¿o³nierski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1896;//260;

	damageTotal			=	64;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	52;
	visual 				=	"ItRw_Bow_Long_07.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_08 (C_Item)
{
	name 				=	"£uk z poro¿a";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	2250;//280;

	damageTotal			=	68;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	56;
	visual 				=	"ItRw_Bow_Long_08.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_09 (C_Item)
{
	name 				=	"£uk Nimroda";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	2999;//300;

	damageTotal			=	72;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	visual 				=	"ItRw_Bow_Long_08.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//KRIEGSBOGEN//
/******************************************************************************************/
INSTANCE ItRw_Bow_War_01 (C_Item)
{
	name 				=	"£uk wojenny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	3500;//320;

	damageTotal			=	76;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	62;
	visual 				=	"ItRw_Bow_War_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_02 (C_Item)
{
	name 				=	"Pogromca orków";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	3980;//340;

	damageTotal			=	79;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	63;
	visual 				=	"ItRw_Bow_War_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_02_Z (C_Item)
{
	name 				=	"Zu¿yty pogromca orków";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//340;

	damageTotal			=	79;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	63;
	visual 				=	"ItRw_Bow_War_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_03 (C_Item)
{
	name 				=	"Gromow³adny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	4200;//360;

	damageTotal			=	82;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	70;
	visual 				=	"ItRw_Bow_War_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_04 (C_Item)
{
	name 				=	"Piekielny ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	4500;//380;

	damageTotal			=	85;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	75;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_05 (C_Item)
{
	name 				=	"£uk œmierci";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	5000;//500;

	damageTotal			=	88;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	80;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//ARMBRUST//
/******************************************************************************************/
//edit by Nocturn

INSTANCE ItRw_Crossbow_01(C_Item)
{
	name 				=	"Lekka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	600;

	damageTotal			= 	50;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	25;
	
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};

	INSTANCE ItRw_Crossbow_01_Old(C_Item)
{
	name 				=	"Zu¿yta lekka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1;

	damageTotal			= 	50;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	30;
	
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};
	
/******************************************************************************************/
//edit by Nocturn

INSTANCE ItRw_Crossbow_02(C_Item)
{
	name 				=	"Kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	3400;//390;

	damageTotal			= 	75;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	50;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Crossbow_02_Z(C_Item)
{
	name 				=	"Zu¿yta kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	10;//390;

	damageTotal			= 	75;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	50;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
//edit by Nocturn

INSTANCE ItRw_Crossbow_03(C_Item)
{
	name 				=	"Ciê¿ka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	4000;//500;

	damageTotal			= 	85;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	70;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItRw_Crossbow_03_Z(C_Item)
{
	name 				=	"Zu¿yta ciê¿ka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//500;

	damageTotal			= 	85;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	70;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
//edit by Nocturn

INSTANCE ItRw_Crossbow_04(C_Item)
{
	name 				=	"Kusza wojenna";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	6000;//650;

	damageTotal			= 	100;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	90;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	80;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


var c_item bron;
/******************************************************************************************/
//MUNITION//
/******************************************************************************************/
INSTANCE ItAmArrow(C_Item)
{
	name 				=	"Strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;
    //on_state[0]         =   UseMunition;
	visual 				=	"ItAm_Arrow_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
	//self.name = "ALAMUSYDUPACICHO";
};

/******************************************************************************************/
INSTANCE ItAmBolt(C_Item)
{
	name 				=	"Be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Bolt_01.3ds";
	material 			=	MAT_WOOD;
   // on_state[0]         =   UseMunition;
	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//******************************************************************************
//************** EDYCJA ROZSZERZONA 1.24 EDIT
//******************************************************************************
INSTANCE BowFire1 (C_Item)
{
	name 				=	"£uk ognisty";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	2000;

	damageTotal			=	50;
	damage[DAM_INDEX_FIRE]	=	 5;
	damagetype			=	DAM_POINT|DAM_FIRE;
	munition			=	ItAmArrow;
	
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	55;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	15;
	
	
	visual 				=	"ItRw_Bow_Long_08.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE BowFire2 (C_Item)
{
	name 				=	"Wiêkszy ³uk ognisty";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	2500;

	damageTotal			=	60;
	damagetype			=	DAM_POINT|DAM_FIRE;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	65;
	
	damage[DAM_INDEX_FIRE]	=	 10;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	20;
	
	visual 				=	"ItRw_Bow_Long_07.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE BowFire3 (C_Item)
{
	name 				=	"Oddech demona";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	3000;

	damageTotal			=	80;
	damagetype			=	DAM_POINT|DAM_FIRE;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	85;
	damage[DAM_INDEX_FIRE]	=	 15;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	25;
	
	visual 				=	"ItRw_Bow_Long_06.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE BowMagic1 (C_Item)
{
	name 				=	"£uk magiczny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	3000;

	damageTotal			=	65;
	damagetype			=	DAM_POINT|DAM_MAGIC;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	70;
	damage[DAM_INDEX_MAGIC]	=	 5;
	visual 				=	"ItRw_Bow_Long_04.mms";
	spell				= 	SPL_THUNDERBALL;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	20;

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[1];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE BowBlunt1 (C_Item)
{
	name 				=	"Og³uszacz";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			=	30;
	damagetype			=	DAM_BLUNT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Small_02.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= "Nie dobija przeciwnika, lecz go obala";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*func void SetMunition (var c_item munition) //nie wywo³ywaæ samemu
{
if (!munition)
 {
// ResetMunition (); 
 //}; //taki bugfix
 if (munition.flags&ITEM_CROSSBOW) { munition = ItAmBolt; } else { munition = ItAmArrow; };
choosen_munition = munition;
munition.flags = munition.flags | 1<<30;
var c_item weapon; weapon = Npc_GetEquippedRangedWeapon(self);
weapon.munition = munition;
weapon.TEXT[6] = ConcatStrins(munition.name, " - dodatkowe obra¿enia:");
weapon.COUNT[6] = munition.damageTotal;
weapon.damageTotal += munition.damageTotal;
};

func void ResetMunition (var c_item munition) //nie wywo³ywaæ samemu
{
if (choosen_munition) 
{ 
munition = ItAmBolt;
choosen_munition.flags = choosen_munition.flags &~ 1<<30; }; //zgadywane, nie pamiêtam tych operatorów, mo¿e byæ Ÿle (ma œci¹gaæ flagê)
var c_item weapon; weapon = Npc_GetEquippedRangedWeapon(self);
if (munition.flags&ITEM_CROSSBOW) 
{ 
SetMunition (ItAmBolt); 
} else 
{ 
SetMunition (ItAmArrow); 
};
weapon.TEXT[6] = "";
weapon.COUNT[6] = 0; //mo¿e byæ Ÿle, nie pamiêtam jak resetowaæ
weapon.damageTotal = weapon.TEXT[2];
choosen_munition = none; //mo¿e byæ Ÿle, nie pamiêtam jak resetowaæ
};

func void EquipRangedWeapon () //wywo³ywaæ przez on_equip broni dystansowych
{
SetMunition (choosen_munition);
};
func void UnEquipRangedWeapon ()//wywo³ywaæ przez on_unequip broni dystansowych
{
var c_item tmp; tmp = choosen_munition; //wiem ¿e na oko³o, ale dziêki temu jedna funkcja mniej :D
ResetMunition ();
choosen_munition = tmp;
};
func void UseMunition () //wywo³ywaæ przez on_state[0] amunicji
{
ResetMunition ();
SetMunition (item);
};
*/ 

//******************************************************************************
//************************ EDYCJA ROZSZERZONA 1.3 EDIT**************************
//******************************************************************************
//edit by Nocturn

INSTANCE ItRw_Fury(C_Item)
{
	name 				=	"Furia";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	5000;//1250;

	damageTotal			= 	150;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]			 	= "Niezwykle potê¿na broñ.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L01(C_Item)
{
	name 				=	"Kusza myœliwska";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	400;

	damageTotal			= 	60;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L02(C_Item)
{
	name 				=	"Wilcza kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	750;

	damageTotal			= 	70;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	40;
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L03(C_Item)
{
	name 				=	"Kusza bitewna";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	900;

	damageTotal			= 	80;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	
INSTANCE ItRw_Er_Crossbow_H01(C_Item)
{
	name 				=	"Zmodyfikowana kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal			= 	85;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_H02(C_Item)
{
	name 				=	"Dêbowa kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1200;//1250;

	damageTotal			= 	87;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_H03(C_Item)
{
	name 				=	"Elitarna kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1750;//1250;

	damageTotal			= 	95;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};