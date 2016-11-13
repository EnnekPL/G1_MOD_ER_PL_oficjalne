instance GRD_211_Skip (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Skip";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	12;
	id 			=	211;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//----------Handlarz_aivar------
	self.aivar[AIV_NPCISTRADER] = true;
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_02);
	
	CreateInvItems	(self, ItMiNugget, 400);
	//CreateInvItems	(self, Plan4, 1);
	//CreateInvItems	(self, Plan2, 1);
	//CreateInvItems	(self, Plan5, 1);
	//CreateInvItems	(self, Plan7, 1);
	CreateInvItems	(self, Pr_Wegiel, 10);
	
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_211;
};

FUNC VOID Rtn_start_211 ()
{
	TA_Sleep		(00,00,07,00,"OCC_MERCS_UPPER_LEFT_ROOM_BED4");
	TA_Stand		(07,00,23,00,"OCC_STABLE_BACK");
	TA_StandAround	(23,00,01,00,"OCC_WELL_RIGHT_MOVEMENT");
};

FUNC VOID Rtn_OT_211 ()
{
	TA_Position	(07,00,20,00,"SPAWN_GRD5");		
	TA_Position	(20,00,07,00,"SPAWN_GRD5");	
};