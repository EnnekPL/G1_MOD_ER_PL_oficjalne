instance GRD_203_Bullit (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bullit";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	6;
	id 			=	203;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55; 
	attribute[ATR_DEXTERITY] 	= 55; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 230;
	attribute[ATR_HITPOINTS] 	= 230;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 57,  2, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Long_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 25);
	CreateInvItem	(self, ItLsTorch);

	
	//------------- ai -------------
	daily_routine	=	Rtn_start_203;
  	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_203 ()
{
	TA_SitAround	(00,00,21,00,"OCC_MERCS_RIGHT_ROOM_BACK");
	TA_SitAround	(21,00,24,00,"OCC_MERCS_RIGHT_ROOM_BACK");
};
func void rtn_meka_203 ()
{
	TA_Stand (00,00,21,00,"WP_INTRO_WI06");
	TA_Stand (21,00,24,00,"WP_INTRO_WI06");
};
func VOID Rtn_OT_203 ()
{
	TA_Guard	(07,00,20,00,"OCC_MERCS_DOWNSTAIRS_2");
	TA_Guard	(20,00,07,00,"OCC_MERCS_DOWNSTAIRS_2");
};