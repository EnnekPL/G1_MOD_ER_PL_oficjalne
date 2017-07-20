instance NOV_1356_Shrat (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Shrat";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		3;
	 	
	voice 		=		2;
	id 			=		1356;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	7;
	attribute[ATR_MANA] 			=	7;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1356;
};

FUNC VOID Rtn_start_1356 ()
{
   TA_SitCampfire	(08,00,20,00,"PATH_SWAMP_HUT");
   TA_SitCampfire	(20,00,08,00,"PATH_SWAMP_HUT");
};

func void Rtn_Follow_1356 ()
{
	TA_FollowPC	(23,00,16,00,"PATH_SWAMP_HUT");
	TA_FollowPC	(16,00,23,00,"PATH_SWAMP_HUT");
};

FUNC VOID Rtn_karczma_1356 ()
{
   TA_RepairHut	(06,00,10,00,"REPAIR_KARCZMA");
   TA_Cook	(10,00,12,30,"KARCZMARZ3");
   TA_Boss	(12,30,17,00,"NC_TAVERN_TOP06");
   TA_Smoke	(17,00,06,00,"NC_TAVERN_TOP03");
};

func void Rtn_mine_1356 ()
{
	TA_PickOre	(23,00,16,00,"GOLDMINE_SHRAT");
	TA_PickOre	(16,00,23,00,"GOLDMINE_SHRAT");
};

FUNC VOID Rtn_hunters_1356 ()
{
   TA_RepairHut	(06,00,10,00,"PALISADA_RUN");
   TA_PracticeSword	(10,00,12,30,"CAMP_SHRAT");
   TA_CookForMe	(12,30,17,00,"CAMP_SHRAT");
   TA_Smoke	(17,00,06,00,"CAMP_SHRAT");
};
