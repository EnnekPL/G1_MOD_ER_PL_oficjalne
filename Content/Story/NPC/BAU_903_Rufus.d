instance BAU_903_Rufus (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rufus";
	npctype		=	npctype_main;
	guild 		=	GIL_SFB;      
	level 		=	10;
	flags 		= 	2;
	voice 		=	2;
	id 			=	903;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		150;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald", 2, 1, -1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_Strong; 
	                            	
	//-------- Talente -------- 	                                  
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Scythe_01);
	CreateInvItems (self, ItFoRice,3);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_903;
};



FUNC VOID Rtn_start_903 ()
{
	TA_PickRice		(07,10,20,10,"NC_PATH83_MOVEMENT"); 
	TA_SitCampfire	(20,10,07,10,"NC_PATH_PEASANT_OUTSIDE5");
};

FUNC VOID Rtn_goto_903 ()
{
	TA_PickRice		(07,10,20,10,"NC_PATH83_MOVEMENT"); 
	TA_PickRice		(20,10,07,10,"NC_PATH83_MOVEMENT");
};

// REBEL
FUNC VOID Rtn_rebel_903 ()
{
	TA_Boss (06,00,12,00,"NC_PATH83");
	TA_Boss (12,00,06,00,"NC_PATH83");
};

FUNC VOID Rtn_boss_903 ()
{
	TA_SitCampfire 	(19,00,08,00,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");
};

func void rtn_bunt_903 ()
{
TA_Stand (06,00,18,00,"RUFUS");
TA_Stand (18,00,06,00,"RUFUS");
};











