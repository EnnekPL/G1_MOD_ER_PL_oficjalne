/*************************************************************************
**	Bloodfly Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Harpie(C_Npc)			
{
	name							=	"Harpia";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_HARPIE;
	level							=	17;
//---------------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	
	attribute	[ATR_HITPOINTS_MAX]	=	230;
	attribute	[ATR_HITPOINTS]		=	230;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------	
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	32;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;
//---------------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------	
	fight_tactic				= FAI_Demon;
//---------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 2500;
	aivar[AIV_MM_DrohRange]		= 2500;
	aivar[AIV_MM_AttackRange]	= 2000;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};
//---------------------------------------------------------------
func void Set_Harpie_Visuals()
{
	Mdl_SetVisual			(self,	"Harpie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Har_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Harpie    														**
*************************************************************************/

INSTANCE Harpie	(Mst_Default_Harpie)
{
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);

};

INSTANCE MadHarpie	(Mst_Default_Harpie)
{
	name							=	"Oszala³a harpia";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_HARPIE;
	level							=	50;
//---------------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	155;
	attribute	[ATR_DEXTERITY]		=	155;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------	
	protection	[PROT_BLUNT]		=	85;
	protection	[PROT_EDGE]			=	85;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	70;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
};