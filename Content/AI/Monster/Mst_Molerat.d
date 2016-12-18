/*************************************************************************
**	Molerat Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Molerat(C_Npc)			
{
	name							=	"Kretoszczur";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	Level_molerat;

//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	20;//+5
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	50;//+20
	attribute	[ATR_HITPOINTS]		=	50;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	3;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------------
	fight_tactic					= FAI_MOLERAT;
//------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;
//------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};
//------------------------------------------------------------
func void Set_Molerat_Visuals()
{
	Mdl_SetVisual			(self,"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Molerat    															**
*************************************************************************/

INSTANCE Molerat	(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE AngryMolerat	(Mst_Default_Molerat)
{
	name							=	"Wœciek³y kretoszczur";
	level							=	Level_molerat+1;

	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_DEXTERITY]		=	70;

	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	35;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	10;
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

/*************************************************************************
**	junge Molerat   (für Spielstart) 									**
*************************************************************************/

INSTANCE YMolerat	(Mst_Default_Molerat)
{
	name							=	"M³ody kretoszczur";
	level							=	Level_FirtsMonester;

	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;

	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	2;
	protection	[PROT_EDGE]			=	2;

	fight_tactic					= FAI_MONSTER_COWARD;

	Set_Molerat_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);

};