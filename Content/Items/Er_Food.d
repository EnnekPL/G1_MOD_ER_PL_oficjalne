/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* ¯YWNOŒÆ 
*****************************************************/

/*******************************************************************************************
**	ZUPY RYBNE                                       
**  DU¯Y BONUS
*******************************************************************************************/
INSTANCE ItFoSoupFish1(C_Item)
{	
	name 				=	"Zupa z pstr¹ga têczowego";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual 				=	"ItFo_Soup_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoupF1;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 40;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 200;
};

	FUNC VOID UseSoupF1()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	40);
		B_RaiseAttribute	(ATR_MANA_MAX,	5);
	};	
/******************************************************************************************/	
	INSTANCE ItFoSoupFish2(C_Item)
{	
	name 				=	"Zupa z pstr¹ga";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	35;

	visual 				=	"ItFo_Soup_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoupF2;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 48;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 35;
};

	FUNC VOID UseSoupF2()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	48);
		
	};	
/******************************************************************************************/	
	INSTANCE ItFoSoupFish3(C_Item)
{	
	name 				=	"Zupa z sandacza";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"DB_ItFo_Feuersuppe.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoupF3;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 55;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 50;
};

	FUNC VOID UseSoupF3()
	{
	var int ilosc_zupF3;
	var int nigdy_wiecej_f3;
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	55);
		ilosc_zupF3 = ilosc_zupF3 + 1;
		if (ilosc_zupF3 >=3)
		{
		ilosc_zupF3 = ilosc_zupF3 - 10;
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	2);
		//Print ("Punkty ¿ycia + 2");
		};
	};		
/******************************************************************************************/	
	INSTANCE ItFoSoupFish4(C_Item)
{	
	name 				=	"Zupa z karasi";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"DB_ItFo_Blutfliegensuppe.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoupF4;

	description			= name;
	TEXT[1]				= NAME_Bonus_MANA;				COUNT[1]	= 40;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 30;
};

	FUNC VOID UseSoupF4()
	{
	Npc_ChangeAttribute	(self,	ATR_MANA,	40);
	};	
	
//----------------------------------------
// Zupa serowa 
//----------------------------------------					
INSTANCE ItFoChesseSoup(C_Item)
{	
	name 				=	"Zupa serowa";
	
	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItFo_Meatbugragout_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	UseSerowa;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Ragout;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 15;
};

	FUNC VOID UseSerowa()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	45);
	};	
/******************************************************************************************/
INSTANCE ItFoMoleratSoup(C_Item)
{	
	name 				=	"Zupa z kretoszczura";
	
	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	12;

	visual 				=	"ItFo_Meatbugragout_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	Usekretsupt;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 42;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 12;
};

	FUNC VOID Usekretsupt()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	42);
	};
/******************************************************************************************/
INSTANCE ItFoScaSoup(C_Item)                                          
{	                                                                
	name 				=	"Zupa ze œcierwojada";
	                                                            
	mainflag 			=	ITEM_KAT_FOOD;  
	flags 				=	ITEM_MULTI;
                                                                    
	value 				=	30;              
                                                                    
	visual 				=	"DB_ItFo_Blutfliegensuppe.3ds";    
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseCrawlersoup2;   
	scemeName			=	"RICE";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 45;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 30;                                                    
};

	FUNC VOID UseCrawlersoup2()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	45);
	};	
/*******************************************************************************************
**	PODROBY                                      
**  ++++++++++++++
*******************************************************************************************/
INSTANCE ItFo_MoleratW(C_Item)
{	
	name 				=	"W¹troba kretoszczura";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	10;

	visual 				=	"ItAt_MeatbugFlesh.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseWatroba;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 10;
};
		func void UseWatroba ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
		}; 		
/******************************************************************************************/
INSTANCE ItFo_MoleratWS(C_Item)
{	
	name 				=	"Sma¿ona w¹troba kretoszczura";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	12;

	visual 				=	"ItAt_MeatbugFlesh.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseWatroba2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 12;
};
		func void UseWatroba2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	30);
		}; 	
/******************************************************************************************/		
	INSTANCE ItFo_Sausage(C_Item)
{	
	name 					=	"Kie³basa";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	15;

	visual 					=	"ITFO_SAUSAGE.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatSausage;
	description				=	name;
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 17;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatSausage ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	17);
};
/******************************************************************************************/
INSTANCE ItFo_muttonLurker (C_Item)
{	
	name 				=	"Miêso topielca";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	17;

	visual 				=	"ItFo_Bacon.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseMutton3;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 17;

};

	FUNC VOID UseMutton3()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	30);
	};	

//********************************************************************
// Mleko
//********************************************************************
INSTANCE ItFo_Milk(C_Item)
{	
	name 					=	"Mleko";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	15;

	visual 					=	"ITFO_MILK.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"POTION";
	on_state[0]				=	EatMilk;
	description				=	name;
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 15;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatMilk ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	15);
};
//********************************************************************
// Miód
//********************************************************************
INSTANCE ItFo_Honey(C_Item)
{	
	name 					=	"Miód";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	30;

	visual 					=	"ITFO_HONEY.3ds"; 
	material 				=	MAT_CLAY;
	scemeName				=	"POTION";
	on_state[0]				=	EatHoney;
	description				=	name;
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 15;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatHoney ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	15);
};
//********************************************************************
// Konfitura
//********************************************************************
INSTANCE ItFo_Konfitura(C_Item)
{	
	name 					=	"Konfitura";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	30;

	visual 					=	"ITFO_HONEY.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"POTION";
	on_state[0]				=	EatKonfitura;
	description				=	name;
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 25;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatKonfitura ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
};
/*******************************************************************************************
**	JAJA JAKICH MA£O                                       
**  !!!!!!!!!!!!!
*******************************************************************************************/
//edit by Nocturn
INSTANCE ItAt_CookCrawlerqueen(C_Item)
{	
	name 					=	"Ugotowane jajo pe³zacza";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	30;

	visual 					=	"ItAt_ScaEgg.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	UseCookCrwEgg;
	description				=	name;
	TEXT[0]					=	"Te jaja zosta³y z³o¿one przez";
	TEXT[1]					=	"królow¹ pe³zaczy.";
	TEXT[2]					=	"Zosta³y ugotowane, wiêc";
	TEXT[3]					=	"nadaj¹ siê do zjedzenia";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

func void UseCookCrwEgg ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	22);
};
/******************************************************************************************/
//edit by Nocturn
INSTANCE JajoSca1(C_Item)
{	
	name 					=	"Jajo œcierwojada";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	15;

	visual 					=	"ItAt_ScaEgg.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"RICE";
	on_state[0]				=	UseCookScaEgg;
	description				=	name;
	TEXT[0]					=	"Te jaja zosta³y z³o¿one przez";
	TEXT[1]					=	"œcierwojady.";
	TEXT[2]					=	"";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void UseCookScaEgg ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	7);
};
/******************************************************************************************/
INSTANCE JajoSca2(C_Item)
{	
	name 					=	"Ugotowane jajo œcierwojada";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	15;

	visual 					=	"ItAt_ScaEgg.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	UseCookScaEgg2;
	description				=	name;
	TEXT[0]					=	"Te jaja zosta³y z³o¿one przez";
	TEXT[1]					=	"œcierwojady.";
	TEXT[2]					=	"Zosta³y ugotowane";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void UseCookScaEgg2 ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	20);
};

//trunki edycja rozszerzona 1.4 5 paŸdziernik 2013
/*
Nalewka jab³kowa
2x czysty alkohol
5x jab³ko

Nalewka jagodowa
2x czysty alkohol
10x jagody

Miód pitny
1x czysty alkohol
3x miód

Piwo miodowe
2x piwo
2x miód

Bimber
5x czysty alkohol
Powali najtwardszego pijaka.

Absynt
ró¿ne zio³a

Nalewka zio³owa
x czysty alkohol
x miód
x zio³o1
x zio³o2

Cios sztyletu
trolest
bagienne ziele*/
var int hero_upija_sie;
/******************************************************************************************/
INSTANCE ItFoNalewkaApple(C_Item)
{	
	name 				=	"Nalewka jab³kowa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	18;

	visual	 			=	"ITFO_MILK.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseNalewka1;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseNalewka1()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	5);
		hero_upija_sie = hero_upija_sie +1;
		if (hero_upija_sie >=6)
		{
		hero_upija_sie = 0;
		bohater_upity = 30;
		upojenie_alkoholowe ();
		};
				if (bohater_upity)
		{
		bohater_upity = bohater_upity +15;
		};
	};
/******************************************************************************************/	
	INSTANCE ItFoNalewkaBerrys(C_Item)
{	
	name 				=	"Nalewka jagodowa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	18;

	visual	 			=	"ITFO_MILK.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseNalewka2;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseNalewka2()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	7);
		hero_upija_sie = hero_upija_sie +1;
		if (hero_upija_sie >=8)
		{
		hero_upija_sie = 0;
		bohater_upity = 30;
		upojenie_alkoholowe ();
		};
		if (bohater_upity)
		{
		bohater_upity = bohater_upity +10;
		};
	};
/******************************************************************************************/	
	INSTANCE ItFoNalewkaPlants(C_Item)
{	
	name 				=	"Nalewka zio³owa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	24;

	visual	 			=	"ErG2_Wine.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseNalewka3;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseNalewka3()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	9);
		hero_upija_sie = hero_upija_sie +1;
		if (hero_upija_sie >=5)
		{
		hero_upija_sie = 0;
		bohater_upity = 30;
		upojenie_alkoholowe ();
		};
		if (bohater_upity)
		{
		bohater_upity = bohater_upity +15;
		};
	};
/******************************************************************************************/	
	INSTANCE ItFoHoneyAlco(C_Item)
{	
	name 				=	"Miód pitny";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	22;

	visual	 			=	"ErG2_Water.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseNalewka2;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
	INSTANCE ItFoHoneyBeer(C_Item)
{	
	name 				=	"Piwo miodowe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual	 			=	"ItFo_Beer_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseNalewka2;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
//edit by Nocturn

	INSTANCE ItFoBimber(C_Item)
{	
	name 				=	"Bimber";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual	 			=	"ItMi_Rum_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseBimber;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= "Powali najtwardszego pijaka.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	FUNC VOID UseBimber()
	{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-10);
	bohater_upity = 60;
	upojenie_alkoholowe ();
	};
/******************************************************************************************/	
//edit by Nocturn

	INSTANCE ItFoAbsynt(C_Item)
{	
	name 				=	"Absynt";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual	 			=	"ErG2_Wine.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseAbsynt;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= "Mocny trunek z zió³.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	FUNC VOID UseAbsynt()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA,	30);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-30);
	bohater_upity = 60;
	upojenie_alkoholowe ();
	};
/******************************************************************************************/
//edit by Nocturn
	
	INSTANCE ItFoCiosSztyletu(C_Item)
{	
	name 				=	"Cios sztyletu";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	40;

	visual	 			=	"ErG2_Wine.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseCiosSztyletu;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= "Cholernie mocne.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	FUNC VOID UseCiosSztyletu()
	{
	if Npc_IsPlayer (self)
	{ 
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-200);
	bohater_upity = 80;
	upojenie_alkoholowe ();
	};
	};
	
//********************************************************************/*****
//************   RYBY
//********************************************************************/*****
INSTANCE ItFo_Plants_Glon(C_Item)
{	
	name 				=	"Glon";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	12;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   UseGLON;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 12;
};

func void UseGLON ()
{
Npc_ChangeAttribute	(self,	ATR_MANA,	5);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish(C_Item)
{	
	name 					=	"Ryba";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	18;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish;
	description				=	name;
	TEXT[0]					=	"Morska ryba";
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 20;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	20);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish2(C_Item)
{	
	name 					=	"Pstr¹g";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	35;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish2;
	description				=	name;
	//TEXT[0]					=	"Pstr¹g";
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 25;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish2 ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish3(C_Item)
{	
	name 					=	"Sandacz";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	40;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish3;
	description				=	name;
	//TEXT[0]					=	"Sandacz";
	TEXT[1]					= 	"Pozwala szybciej biegaæ przez krótki czas!";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish3 ()
{
Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 30000);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish4(C_Item)
{	
	name 					=	"Karaœ";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	40;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish4;
	description				=	name;
	//TEXT[0]					=	"Karaœ";
	TEXT[1]					= 	NAME_Bonus_MANA;				COUNT[1]	= 30;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish4 ()
{
Npc_ChangeAttribute	(self,	ATR_MANA,	30);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish5(C_Item)
{	
	name 					=	"Pstr¹g têczowy";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish5;
	description				=	name;
	TEXT[0]					=	"Bardzo cenna ryba!";
	TEXT[1]					= 	NAME_Bonus_ManaMax;				COUNT[1]	= 1;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish5 ()
{
B_RaiseAttribute	(ATR_MANA_MAX,	1);
};
/******************************************************************************************/ 
INSTANCE ItFo_Fish6(C_Item)
{	
	name 					=	"P³otka";
	
	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	7;

	visual 					=	"ITFO_FISH.3ds"; 
	material 				=	MAT_LEATHER;
	scemeName				=	"FOOD";
	on_state[0]				=	EatFish6;
	description				=	name;
	TEXT[1]					= 	NAME_Bonus_HP;				COUNT[1]	= 10;
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};
func void EatFish6 ()
{
Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
};