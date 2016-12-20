/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4.5
******* ¯ELAZNA GAROTA - PRZYBOCZNA STRA¯ GOMEZA
*****************************************************/
instance GRD_8800_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Garotnik";
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	6;
	id 			=	8800;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 110;
	attribute[ATR_MANA] 		= 110;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Thief", 3,  1, GRD_ARMOR_H2);        
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_04);
	EquipItem	(self, ItRw_Crossbow_03_Z);
	CreateInvItems	(self, ItAmBolt, 50);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 250);
	CreateInvItem	(self, ItLsTorch);
     
	
	//-------------Daily Routine-------------
	//edit by Nocturn
	
	daily_routine = Rtn_start_8800;
};

FUNC VOID Rtn_start_8800 ()
{
	TA_SitAround 	(00,00,12,00,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
	TA_SitAround	(12,00,00,00,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};
FUNC VOID Rtn_atak_8800()
{
	TA_Stand 	(00,20,07,20,"MASZA2");
	TA_Stand	(07,20,21,20,"MASZA2");
	TA_Stand	(21,20,00,20,"MASZA2");
};
instance GRD_8801_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Garotnik";
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	6;
	id 			=	8801;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 110;
	attribute[ATR_MANA] 		= 110;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 14,  2, GRD_ARMOR_H2);      
    B_Scale (self);
    Mdl_SetModelFatness(self,0);	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_05);
	EquipItem	(self, ItRw_Crossbow_02_Z);
	CreateInvItems	(self, ItAmBolt, 50);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 250);
	CreateInvItem	(self, ItLsTorch);
     
	
	//-------------Daily Routine-------------
	//edit by Nocturn
	
	daily_routine = Rtn_start_8801;
};

FUNC VOID Rtn_start_8801 ()
{
	TA_Boss		(00,00,12,00,"OCC_BARONS_GREATHALL_CENTER_BACK");
	TA_Boss		(00,20,12,00,"OCC_BARONS_GREATHALL_CENTER_BACK");
};
FUNC VOID Rtn_atak_8801 ()
{
	TA_Stand 	(00,20,07,20,"MASZA3");
	TA_Stand	(07,20,21,20,"MASZA3");
	TA_Stand	(21,20,00,20,"MASZA3");
};