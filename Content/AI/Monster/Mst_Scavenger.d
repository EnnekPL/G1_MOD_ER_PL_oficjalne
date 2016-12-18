/*************************************************************************
**	Scavenger Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Scavenger(C_Npc)			
{
	name							=	"Œcierwojad";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCAVENGER;
	level							=	Level_Scavenger;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
};
//---------------------------------------------------------	
func void Set_Scavenger_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Scavenger    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE Scavenger	(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	//CreateInvItems (self, JajoSca1, 1);
};

INSTANCE AngryScavenger	(Mst_Default_Scavenger)
{
	name 		= "Wœciek³y œcierwojad";
	level							=	Level_Scavenger+1;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	155;
	attribute	[ATR_HITPOINTS]		=	155;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	45;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, JajoSca1, 1);
};


/*************************************************************************
**	junger Scavenger (für Spielstart)  									**
*************************************************************************/

INSTANCE YScavenger	(Mst_Default_Scavenger)
{
	name							=	"M³ody œcierwojad";
	level							=	Level_FirtsMonester;

	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;

	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	2;
	protection	[PROT_EDGE]			=	2;


	fight_tactic					=	FAI_MONSTER_COWARD;

	Set_Scavenger_Visuals();
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);
};

