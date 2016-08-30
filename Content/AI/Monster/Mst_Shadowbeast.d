/*************************************************************************
**	Shadowbeast Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Shadowbeast(C_Npc)			
{
	name							=	"Cieniostw�r";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHADOWBEAST;
	level							=	Level_Shadowbeast;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	50;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE|DAM_FLY;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_BLUNT]	=	250;
	damage		[DAM_INDEX_EDGE]	=	250;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	35;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Shadowbeast_Visuals()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_Shadowbeast_PbS_Visuals()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Shadowbeast    														**
*************************************************************************/

INSTANCE Shadowbeast	(Mst_Default_Shadowbeast)
{
	Set_Shadowbeast_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
};

/*************************************************************************
**	Shadowbeast    														**
*************************************************************************/

INSTANCE Shadowbeast_poweredbySlepper	(Mst_Default_Shadowbeast)
{
	name							=	"Cieniostw�r �ni�cego";
	Set_Shadowbeast_PbS_Visuals();
	Npc_SetToFistMode(self);
	
	//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	70;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE|DAM_FLY;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_BLUNT]	=	300;
	damage		[DAM_INDEX_EDGE]	=	300;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	45;
	damage		[DAM_INDEX_MAGIC]	=	5;
};