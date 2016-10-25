/*************************************************************************
**	Skeleton Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	name							=	"Szkielet";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	Level_Skeleton;//25
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	115;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_SKELETON;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Skeleton_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonScout_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonMage_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	01,			DEFAULT,	"",			01,  		DEFAULT,	-1);
};


/*************************************************************************
**	Skeleton    														**
*************************************************************************/

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};

/*************************************************************************
**	SkeletonSH - für die Gruft unter den Stonehenge (SH) 														**
*************************************************************************/

INSTANCE SkeletonSH			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!

	protection	[PROT_FIRE]		= 40;

	senses_range				= 1000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1000;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 1000;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;

};


/*************************************************************************
**	Skeleton   Scout													**
*************************************************************************/

INSTANCE SkeletonScout		(Mst_Default_Skeleton)
{
	name							=	"Szkielet zwiadowca";
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONSCOUT;
	Set_SkeletonScout_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton  Warrior													**
*************************************************************************/

INSTANCE SkeletonWarrior	(Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonWarrior_Visuals();
	level							=	Level_SkeletonWarrior;
	attribute	[ATR_STRENGTH]		=	120;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton   Mage 													**
*************************************************************************/

INSTANCE SkeletonMage		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet mag";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	Level_SkeletonMage;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);

};


/*************************************************************************
**	Skeleton   Mage 	im Nebelturm									**
*************************************************************************/

INSTANCE SkeletonMage_fogtower		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet maga z Wie¿y Mgie³";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	Level_SkeletonMage_FogTower;
	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		

	attribute	[ATR_HITPOINTS_MAX]	=	355;
	attribute	[ATR_HITPOINTS]		=	355;
	
	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	7);
	CreateInvItem			(self,	theriddle1);
};

/*************************************************************************
**	Szkielet Mag z Opuszczonej Kopalni								**
*************************************************************************/

INSTANCE SkeletonMage_abandonemine		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet maga z Opuszczonej Kopalni";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	55;		

	attribute	[ATR_HITPOINTS_MAX]	=	420;
	attribute	[ATR_HITPOINTS]		=	420;

	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneFireball);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
};

/*************************************************************************
**	Szkielet £ucznik							**
*************************************************************************/

INSTANCE Skeleton_bow (Mst_Default_Skeleton)
{
aivar[AIV_MM_REAL_ID] = ID_SKELETON;
Set_SkeletonWarrior_Visuals();
name = "Szkielet ³ucznik";
guild = GIL_NONE; // "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
level = 25;
Npctype = Npctype_ROGUE;
attribute [ATR_STRENGTH] = 100;
attribute [ATR_DEXTERITY] = 250;
fight_tactic = FAI_HUMAN_STRONG;//FAI_HUMAN_RANGED;
Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
EquipItem (self, itrw_bow_long_01);
EquipItem (self, itmw_1h_sword_long_01);
CreateInvItems(self,ItAmArrow,50);
//EquipItem (self, itmw_1h_sword_long_01);
daily_routine = Rtn_Start_200;
};

/*************************************************************************
**	Summoned Skeleton    												**
*************************************************************************/

INSTANCE SummonedByPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();

//-----------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	senses						= SENSE_HEAR | SENSE_SEE;
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//-----------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};


/*************************************************************************
**	Summoned Skeleton Warrior											**
*************************************************************************/

INSTANCE SummonedByPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	senses						= SENSE_HEAR | SENSE_SEE;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();

//------------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//------------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};

func void Set_OrcSkeleton_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_ske_body_01",DEFAULT,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
};

INSTANCE OrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Ork-szkielet";
	level							=	Level_OrcSkeleton;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	115;
	attribute	[ATR_HITPOINTS_MAX]	=	320;
	attribute	[ATR_HITPOINTS]		=	320;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	55;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};

INSTANCE Orcskeleton_Varr	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Stary szkielet orka";
	level							=	14;
	guild							=	GIL_ORCWARRIOR;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	55;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};


INSTANCE SummonOrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Przyzwany Ork-szkielet";
	level							=	14;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();
	start_aistate	=	ZS_MM_Summoned;
	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};

INSTANCE SummonbyPCOrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Przyzwany Ork-szkielet";
	level							=	0;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();
	start_aistate	=	ZS_MM_SummonedByPC;
	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};