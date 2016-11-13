instance Boss_Varrag (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Szaman Varrag-Harosh Potężny";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_UNDEADORC;
	level 		=	Level_Varrag;
	//voice 		=	13;
	id 			=	7777;
	flags		=	0;
	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1200;
	attribute	[ATR_HITPOINTS]		=	1200;

	attribute	[ATR_MANA_MAX] 		=	130;
	attribute	[ATR_MANA] 			=	130;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	80;
	
	//-------- visuals --------
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orc_Shaman.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
	
	fight_tactic 				=	FAI_HUMAN_MAGE;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_Orc_Pray;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	
	//-------- Talente --------  	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem			(self,	ItArRuneFireball);
	EquipItem				(self,	ItRwOrcstaff);		// für Magiemodus

	//-------------Daily Routine-------------
	//daily_routine = Rtn_start_102;
};


