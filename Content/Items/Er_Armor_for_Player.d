/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* ZBROJE DLA GRACZA
******* Opis: Wszystkie zbroje znajduj�ce si� w tym pliku
******* gracz mo�e otrzyma�, znale�� lub kupi� podczas 
******* gry bez u�ycia kod�w. Kwestia balansu i dok�adno�ci
******* przy ustalaniu statystyk jest bardzo wa�na.
*****************************************************/

/****************************************************
******* ROZDZIA� 1
******* PARAMETRY MAX DLA ROZDZIA�U
	maksymalna [PROT_EDGE]	=	45;
	maksymalna [PROT_BLUNT] = 	45;
	maksymalna [PROT_POINT] = 	15;
	maksymalna [PROT_FIRE] 	= 	25;
	maksymalna [PROT_MAGIC] = 	5;
******* 
*****************************************************/

/*******************************************************************************************
**	UBRANIA ROBOTNIK�W                                        
**  DLA WSZYSTKICH NPC NIEZALE�NIE OD GILDII
*******************************************************************************************/
instance SFB_ARMOR_M(C_Item)
{
	name 					=	"Spodnie robotnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	4;
	protection [PROT_BLUNT] = 	4;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	1;
	protection [PROT_MAGIC] = 	0;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
instance SFB_ARMOR_DARK(C_Item) 
{
	name 					=	"Ciemne spodnie";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	6;
	protection [PROT_BLUNT] = 	6;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	650;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	4;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	STARY OB�Z                                        
**  CIENIE
*******************************************************************************************/
INSTANCE VLK_ARMOR_H(C_Item)
{
	name 					=	"Spodnie Cienia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] =   2;
	protection [PROT_FIRE] 	= 	2;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"sttm.3ds";
	visual_change 			=	"Hum_VLKM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE NOV2_ARMOR_M(C_Item)
{
	name 					=	"Lekka zbroja Nowicjusza Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	23;
	protection [PROT_BLUNT] = 	23;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	10;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_NOV_ARMOR_M;

 
	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	OB�Z BANDYT�W                                      
**  BANDYTA
*******************************************************************************************/
INSTANCE BAU_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja Bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	13;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_bandyta_l.3ds";
	//visual_change 			=	"Armor_Ranger_Addon.asc";
	visual_change 			=	"Armor_BANDIT_L.asc";
	visual_skin 			=	0;
	//visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	LEKKIE UBRANIA MY�LIWYCH                                        
**  DLA GRACZA, MY�LIWYCH
*******************************************************************************************/
/*******************************************************************************************
**	UBRANIE MY�LIWEGO                                                     **
*******************************************************************************************/
INSTANCE HUN_ARMOR_L(C_Item)
{
	name 					=	"Ubranie my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	6;
	protection [PROT_BLUNT] = 	6;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	2;
	protection [PROT_MAGIC] = 	0;

	value 					=	300;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Armor_Leather_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	SK�RZANY STR�J                                                     **
*******************************************************************************************/
INSTANCE NON_LEATHER_ARMOR_L(C_Item)
{
	name 					=	"Sk�rzany str�j";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	750;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_drwal.3ds";
	visual_change 			=	"Armor_Leather_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	ZBROJA MY�LIWEGO                                                **
*******************************************************************************************/
INSTANCE HUN_ARMOR_M(C_Item)
{
	name 					=	"Zbroja my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	37;
	protection [PROT_BLUNT] = 	37;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	1300;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE NON_SWAMPSHARK_ARMOR(C_Item)
{
	name 					=	"Zbroja ze sk�ry b�otnego w�a";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	43;
	protection [PROT_BLUNT] = 	43;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	1870;

	wear 					=	WEAR_TORSO;

	visual 					=	"PANCERZ_SWAMPSHARK.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	4;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE NON_WOLF_ARMOR(C_Item)
{
	name 					=	"Str�j z futra wilka";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	21;
	protection [PROT_BLUNT] = 	21;
	protection [PROT_POINT] = 	3;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	2;

	value 					=	1450;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_szmaty.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE NON_SHADOWBEAST_ARMOR(C_Item)
{
	name 					=	"Str�j podszyty futrem cieniostwora";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_szmaty.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZNALE�ISKA, STAERE ZBROJE                                      
**  TYLKO DLA BOHATERA
*******************************************************************************************/
INSTANCE OldArmor(C_Item) //jaskinia za SO w g�rach
{
	name 					=	"Stara zbroja";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	8;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_stara_zbroja.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Pami�ta pierwsze wojny myrta�skie"; 
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/****************************************************
******* ROZDZIA� 2
******* PARAMETRY MAX DLA ROZDZIA�U
	maksymalna [PROT_EDGE] 	= 65;
	maksymalna [PROT_BLUNT] = 65;
	maksymalna [PROT_POINT] = 17;
	maksymalna [PROT_FIRE] 	= 30;
	maksymalna [PROT_MAGIC] = 10;
******* 
*****************************************************/
/*******************************************************************************************
**	ZBROJA BANDYTY                                                      **
*******************************************************************************************/
INSTANCE BAU_ARMOR_M(C_Item)
{
	name 					=	"Zbroja Bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_bandyta_l.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	ZBROJE MY�LIWYCH                                   
**  DLA MY�LIWYCH
*******************************************************************************************/
/*
INSTANCE HUN_A(C_Item)
{
	name 					=	"My�liwski pancerz";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	18;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	2200;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_szmaty.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
*/
/*******************************************************************************************
**	PANCERZ MY�LIWEGO                                                **
*******************************************************************************************/
INSTANCE HUN_ARMOR_H(C_Item) //nieu�ywane
{
	name 					=	"Solidny str�j my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	60;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	35;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
	visual 					=	"stth.3ds";
	visual_change 			=	"Armor_PIR_H_er.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/****************************************************
******* ROZDZIA� 3
******* PARAMETRY MAX DLA ROZDZIA�U
	maksymalna [PROT_EDGE]	=	85;
	maksymalna [PROT_BLUNT] = 85;
	maksymalna [PROT_POINT] = 40;
	maksymalna [PROT_FIRE] 	= 40;
	maksymalna [PROT_MAGIC] = 15;
******* 
*****************************************************/



/****************************************************
******* ROZDZIA� 4
******* PARAMETRY MAX DLA ROZDZIA�U
	maksymalna [PROT_EDGE]	=	45;
	maksymalna [PROT_BLUNT] = 	45;
	maksymalna [PROT_POINT] = 	15;
	maksymalna [PROT_FIRE] 	= 	25;
	maksymalna [PROT_MAGIC] = 	5;
******* 
*****************************************************/

/*******************************************************************************************
**	UBRANIA PIRAT�W                                        
**  DLA PIRAT�W I GRACZA
*******************************************************************************************/
INSTANCE PiratArmor(C_Item)
{
	name 					=	"Str�j pirata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	35;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_pirat.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Pirat2Armor(C_Item)
{
	name 					=	"Ci�ki str�j pirata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	5;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_pirat.3ds";
	visual_change 			=	"Armor_PIR_M_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	CIʯKA ZBROJA BANDYTY                                                 			 **
*******************************************************************************************/
INSTANCE BAU_ARMOR_H(C_Item)
{
	name 					=	"Ci�ka zbroja Bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	53;
	protection [PROT_BLUNT] = 	53;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	20;

	value 					=	VALUE_SLD_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_bandyta_h.3DS";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZBROJA �OWC�W ORK�W                                                  **
*******************************************************************************************/
INSTANCE NON_ORCHUNTERARMOR_01(C_Item)
{
	name 					=	"Solidny sk�rzany pancerz";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	54;
	protection [PROT_BLUNT] = 	54;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	25;

	value 					=	3200;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_bandyta_h.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/****CIʯKA SZATA OGNIA 
/******************************************************************************************/
INSTANCE KDF_ARMOR_H2(C_Item)
{
	name 					=	"Ci�ka szata Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	25;
	wear 					=	WEAR_TORSO;

	value 					=	500;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[0]					=	"Jest zniszczona. Nale�a�a do Xardasa.";   COUNT[0]	= protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/****HE�M MY�LIWYCH
/******************************************************************************************/
instance Helmet2(C_Item)
{
        name = "He�m my�liwych";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 8;
        protection[PROT_BLUNT] = 8;
        protection[PROT_POINT] = 8;
        protection[PROT_FIRE] = 0;
        protection[PROT_MAGIC] = 0;
        value = 750;
        wear = WEAR_HEAD;  
        visual = "HELMET_RANGER.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = "Ten he�m nosz� my�liwi i �owcy ork�w"; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};
