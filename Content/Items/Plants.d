/*
Platns.d
Roœliny
Gothic: Edycja rozszerzona
v.0.87 
27 lipiec 2012
*/

/*
Lista instancji
ItFo_Plants_Speed01 //zêbate ziele
ItFo_Plants_mushroom_03 //truj¹cy grzyb
ItFo_Plants_utarteJagody_01
ItFo_Plants_PapkaZziela
*/

/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* ROŒLINY 
******* update 1.4.5 
*****************************************************/

//DODATKI ALCHEMICZNE
const int	Value_Seraphis		=	3;		const int	HP_Seraphis			=	14;
const int	Value_Nachtschatten	=	7;		const int	HP_Nachtschatten	=	22;
const int	Value_Mondschatten	=	13;		const int	HP_Mondschatten		=	24;

//MIKSTURY TRWA£E - SK£ADNIKI BAZOWE 
const int	Value_Flammendorn	=	100;	const int	HP_Flammendorn		=	0; //sk³adnik mikstury si³y
const int	Value_Eichenblatt	=	100;	const int	HP_Eichenblatt		=	0; //sk³adnik mikstury zrêcznoœci
const int	Value_Rabenkraut	=	100;	const int	Mana_Rabenkraut		=	0; //sk³adnik mikstury ¿ycia
const int	Value_Drachenwurzel	=	100;	const int	Mana_Drachenwurzel	=	0; //sk³adnik mikstury many

const int	Value_Orkblatt		=	10;		const int	HP_Orkblatt			=	26;

//POSPOLITE SK£ADNIKI
const int	Value_Dunkelkraut	=	15;		const int	Mana_Dunkelkraut	=	20;
const int	Value_Steimwurzel	=	20;		const int	Mana_Steinwurzel	=	30;
const int	Value_Bergmoos		=	25;		const int	HP_Bergmoos			=	40;

const int	Value_Heilkräuter1	=	10;		const int	HP_Heilkräuter1		=	25;
const int	Value_Heilkräuter2	=	15;		const int	HP_Heilkräuter2		=	35;
const int	Value_Heilkräuter3	=	20;		const int	HP_Heilkräuter3		=	45;

/**********************************************************/
/**********************************************************/
/***** MIKSTURY SZYBKOŒÆI SK£ADNIKI ***********************/
/**********************************************************/
/**********************************************************/

//********************************************************************
// Zêbate ziele
//********************************************************************	
INSTANCE ItFo_Plants_Speed01(C_Item)
{	
	name 				=	"Zêbate ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	15;

	visual 				=	"ItPl_Speed_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Usequick;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= "Pozwala szybciej biegaæ przez krótki czas!";
	TEXT[2]				= "Sk³adnik alchemiczny œredniej wartoœci.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	func void Usequick ()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 30000);
	}; 
	
//********************************************************************
// Ciemny grzyb
//********************************************************************
INSTANCE ItFo_GreenMushroom(C_Item)
{	
	name 					=	"Ciemny grzyb";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	20;

	visual 					=	"ItFo_Plants_mushroom_01.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	GreenMush;
	description				= 	name;
	TEXT[1]					= 	"Pozwala szybciej biegaæ przez krótki czas!";
	TEXT[2]					= 	"Sk³adnik alchemiczny œredniej wartoœci.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
	func void GreenMush ()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 45000);
	};

//********************************************************************
// Orkowe ziele
//********************************************************************
INSTANCE ItFo_Plants_OrcHerb_01(C_Item)
{	
	name 				=	"Orkowe ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Orkblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Useorc;
	scemeName			=	"FOOD";

	description				= 	name;
	TEXT[1]					= 	"Pozwala szybciej biegaæ przez krótki czas!";
	TEXT[2]					= 	"Sk³adnik alchemiczny œredniej wartoœci.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

	func void Useorc ()
	{	
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Orkblatt);
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 60000);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse orkblatt");
	};

/**********************************************************/
/**********************************************************/
/***** MIKSTURY TRWA£E ***********************/
/**********************************************************/
/**********************************************************/

//********************************************************************
// Ogniocierñ - mikstura si³y
//********************************************************************
INSTANCE ItFo_Plants_Flameberry_01(C_Item)
{	
	name 				=	"Ogniocierñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Flammendorn;

	visual 				=	"ItFo_Plants_Flameberry_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Useflame;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= 1;
	TEXT[2]				= "Cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy mikstury si³y.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Flammendorn;
};

		func void Useflame ()
		{
			B_RaiseAttribute	(ATR_STRENGTH,	1);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Flammendorn");
		};

//********************************************************************
// Liœæ dêbu - mikstura zrêcznoœci
//********************************************************************
INSTANCE ItFo_Plants_OrcHerb_02(C_Item)
{	
	name 				=	"Liœæ dêbu";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Eichenblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	Useorc2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= 1;
	TEXT[2]				= "Cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy mikstury zrêcznoœci.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eichenblatt;
};

		func void Useorc2 ()
		{
			B_RaiseAttribute	(ATR_DEXTERITY,	1);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Eichenblatt");
		};

//********************************************************************
// Dragot - mikstura many
//********************************************************************
INSTANCE ItFo_Plants_Stoneroot_02(C_Item)
{	
	name 				=	"Dragot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Drachenwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_ManaMax;				COUNT[1]	= 1;
	TEXT[2]				= "Cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy mikstury many.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Drachenwurzel;
};

		func void Useroot2 ()
		{
			B_RaiseAttribute 	(ATR_MANA_MAX,	1);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Drachenwurzel");
		}; 
		
//********************************************************************
// Krucze ziele - mikstura ¿ycia
//********************************************************************
INSTANCE ItFo_Plants_RavenHerb_01(C_Item)
{	
	name 				=	"Krucze ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Rabenkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Useraven;
	scemeName			=	"FOOD";

	description			= name;
	
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 25;
	TEXT[2]				= "Cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy mikstury ¿ycia.";	
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Rabenkraut;
};

		func void Useraven ()
		{
			B_RaiseAttribute	(ATR_HITPOINTS,	25);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Rabenkraut");
		}; 	

//********************************************************************
// Roztarte nasiona ogniociernia  - napój potêgi
//********************************************************************			
INSTANCE ItFo_Plants_utarteJagody_01(C_Item)
{	
	name 					=	"Roztarte nasiona ogniociernia";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	200;

	visual 					=	"ItFo_Plants_mountainmoos_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   UseTrollberrys2;
	scemeName				=	"FOOD";

	TEXT[1]					= NAME_Bonus_Hp;				COUNT[1]	= 50;
	TEXT[2]					= "Cenny sk³adnik alchemiczny.";
	TEXT[3]					= "Sk³adnik bazowy napoju potêgi.";
	TEXT[5]					= NAME_Value;					COUNT[5]	= 200;
};

		func void UseTrollberrys2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	50);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Zjad³eœ roztarte nasiona ogniociernia");
		};	

//********************************************************************
// Roztarte bagienne ziele  - napój w³adzy
//********************************************************************			
INSTANCE ItFo_Plants_PapkaZziela(C_Item)
{	
	name 				=	"Roztarte bagienne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	200;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos3;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 50;
	TEXT[2]				= "Cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy napoju w³adzy.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 200;
};

		func void Usemoos3 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	50);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Zjad³eœ papkê z ziela");
		};	

//********************************************************************
// Kwiat Nemora
//********************************************************************
INSTANCE ItFo_Plants_NemorsFlower(C_Item)
{	
	name 				=	"Kwiat Nemora";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	250;

	visual 				=	"Napalms_Plant.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseNemorsFlower;	
	scemeName			=	"FOOD";

	description			= name;
	//TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 50;
	TEXT[2]				= "Bardzo cenny sk³adnik alchemiczny.";
	TEXT[3]				= "Sk³adnik bazowy napoju w³adzy i potêgi.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 250;
};

		func void UseNemorsFlower ()
		{			
			//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Seraphis);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "UseNemorsFlower");
		};
		
/**********************************************************/
/**********************************************************/
/***** DODATKI ALCHEMICZNE ***********************/
/**********************************************************/
/**********************************************************/

//********************************************************************
// Serafis
//********************************************************************
INSTANCE ItFo_Plants_Seraphis_01(C_Item)
{	
	name 				=	"Serafis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Seraphis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Useseraphis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Seraphis;
	TEXT[2]				= "Dodatek alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Seraphis;
};

		func void Useseraphis ()
		{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Seraphis);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Seraphis");
		};

//********************************************************************
// Psianka
//********************************************************************		
INSTANCE ItFo_Plants_Nightshadow_01(C_Item)
{	
	name 				=	"Psianka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Nachtschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usenight;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Nachtschatten;
	TEXT[2]				= "Dodatek alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Nachtschatten;
};

		func void Usenight ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Nachtschatten);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Nachtschatten");
		};	

//********************************************************************
// Kocianka
//********************************************************************			
INSTANCE ItFo_Plants_Nightshadow_02(C_Item)
{	
	name 				=	"Kocianka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mondschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = 	Usemoon;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;				COUNT[1]	= HP_Mondschatten;
	TEXT[2]				= 	"Cenny dodatek alchemiczny.";
	TEXT[5]				= 	NAME_Value;					COUNT[5]	= Value_Mondschatten;
};

		func void Usemoon ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mondschatten);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Mondschatten");
		};	
	
	
	
/**********************************************************/
/**********************************************************/
/***** ZWYK£E MIKSTURY MANY***********************/
/**********************************************************/
/**********************************************************/	

//********************************************************************
// Czarne ziele
//********************************************************************
INSTANCE ItFo_Plants_RavenHerb_02(C_Item) 
{	
	name 				=	"Czarne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Dunkelkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useraven2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Dunkelkraut;
	TEXT[2]				= "Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Dunkelkraut;
};

		func void Useraven2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Dunkelkraut);
			
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Dunkelkraut");
		}; 

//********************************************************************
// Twardzieñ
//********************************************************************
INSTANCE ItFo_Plants_Stoneroot_01(C_Item)
{	
	name 				=	"Twardzieñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Steimwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_Mana;			COUNT[1]	= Mana_Steinwurzel;
	TEXT[2]				= 	"Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= 	NAME_Value;					COUNT[5]	= Value_Steimwurzel;
};

		func void Useroot ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Steinwurzel);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Steinwurzel");
		}; 
		
//********************************************************************
// Górski mech
//********************************************************************		
INSTANCE ItFo_Plants_mountainmoos_01(C_Item)
{	
	name 				=	"Górski mech";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Bergmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;				COUNT[1]	= HP_Bergmoos;
	TEXT[2]				= 	"Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= 	NAME_Value;					COUNT[5]	= Value_Bergmoos;
};

		func void Usemoos ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	HP_Bergmoos);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Moos");
		};
		
/**********************************************************/
/**********************************************************/
/***** ZWYK£E MIKSTURY ¯YCIA***********************/
/**********************************************************/
/**********************************************************/	

/*****************************************************************************************/
//								HEILKRÄUTER
/*****************************************************************************************/
INSTANCE ItFo_Plants_Herb_01(C_Item)
{	
	name 				=	"Zio³a uzdrawiaj¹ce";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter1;

	visual 				=	"ItFo_Plants_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants1;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter1;
	TEXT[2]				= 	"Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter1;
};

	func void UsePlants1 ()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter1);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilkräuter");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_02(C_Item)
{	
	name 				=	"Zio³a uzdrawiaj¹ce";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter2;

	visual 				=	"ItFo_Plants_Herb_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter2;
	TEXT[2]				= 	"Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter2;
};

		func void UsePlants2 ()
		{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter2);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_03(C_Item)
{	
	name 				=	"Zio³a uzdrawiaj¹ce";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter3;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants3;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter3;
	TEXT[2]				= 	"Pospolity sk³adnik alchemiczny.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter3;
};

	func void UsePlants3 ()
	{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter3);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};

	
/**********************************************************/
/**********************************************************/
/***** PE£NIE***********************/
/**********************************************************/
/**********************************************************/	

//********************************************************************
// Velais
//********************************************************************
INSTANCE ItFo_Plants_Velayis_01(C_Item) //sk³adnik pe³ni ¿ycia
{	
	name 				=	"Velais";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Velayis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseVelayis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Velayis;
	TEXT[2]				= "Sk³adnik alchemiczny œredniej wartoœci.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Velayis;	
};

		func void UseVelayis ()
		{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Velayis);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Velayis");
		};

//********************************************************************
// Nasiona czerwonego buka
//********************************************************************
instance ItFo_Plants_Bloodwood_01 (C_ITEM) //sk³adnik pe³ni many
{	
	name 					=	"Nasiona czerwonego buka";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Blutbuche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  	Useblood;
	scemeName				=	"FOOD";

	description				= 	name;
	TEXT[1]					= 	NAME_Bonus_Mana;				COUNT[1]	= Mana_Blutbuche;
	TEXT[2]					= 	"Sk³adnik alchemiczny œredniej wartoœci.";
	TEXT[5]					= 	NAME_Value;					COUNT[5]	= Value_Blutbuche;                          	
};
                                       
		func void Useblood ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Blutbuche);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Blutbuchensamen");
		};  	
//----------------------------------------			
// Truj¹cy grzyb 
//----------------------------------------			
INSTANCE ItFo_Plants_mushroom_03(C_Item)
{	
	name 				=	"Truj¹cy grzyb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Sklavenbrot;

	visual 				=	"ItFo_Plants_mushroom_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Usemush3;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= "Utrata P¯ - 15";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Sklavenbrot;
};

		func void Usemush3 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-5);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Truj¹cy grzyb");
		};				
			
//********************************************************************
// Magiczne ziele
//********************************************************************
INSTANCE ItFo_Plants_MagicHerb_01(C_Item)
{	
	name 				=	"Magiczne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	300;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseMagicHerb1;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 100;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 300;
};

		func void UseMagicHerb1 ()
		{	
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	100);
		};		
			
//********************************************************************
// Ususzona iglica - quest item
//********************************************************************	
INSTANCE ItFo_Plants_Iglica(C_Item)
{	
	name 				=	"Ususzona iglica";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	200;

	visual 				=	"ItPl_Speed_Herb_01.3ds";
	material 			=	MAT_WOOD;
	//on_state[0]			=   Use_Plant_Iglica;
	//scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= "Pozwala wejœæ w stan g³êbokiego snu.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	func void Use_Plant_Iglica ()
	{
		B_GiveXP (100);
	}; 


//********************************************************************
// Roœliny do alchemii - zio³a
//********************************************************************
/******************************************************************************************/
//edit by Nocturn
INSTANCE ItFo_ForestHerb(C_Item)
{	
	name 				=	"Leœne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	5;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseFH;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;
};
		func void UseFH ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	2);
		}; 
/******************************************************************************************/
//edit by Nocturn
INSTANCE ItFo_FieldHerb(C_Item)
{	
	name 				=	"Polne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	5;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseFDH;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 3;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;
};
		func void UseFDH ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	3);
		}; 		
/******************************************************************************************/
//edit by Nocturn
INSTANCE ItFo_MountainHerb(C_Item)
{	
	name 				=	"Górskie ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	5;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseMH;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 3;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;
};
		func void UseMH ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);
		}; 		
/******************************************************************************************/
//edit by Nocturn
INSTANCE ItFo_SeaHerb(C_Item)
{	
	name 				=	"Nadmorskie ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	5;

	visual 				=	"Er_Herb01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseSH;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 3;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;
};
		func void UseSH ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	5);
		}; 		