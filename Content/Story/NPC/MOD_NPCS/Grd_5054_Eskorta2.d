instance GRD_5054_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Eskorta";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	5054;
	
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  4, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_5054;
};

FUNC VOID Rtn_start_5054 ()
{
	//pali oraz rozmawia z przywódcą
    TA_Smoke		(08,00,20,05,"KON2");
    TA_Smalltalk	(20,05,08,00,"KON2"); 
};
FUNC VOID Rtn_las_5054 ()
{
	//misja u Bandytów, czekają w lesie
	TA_Smalltalk	(06,00,23,00,"ESKORTA3");
	TA_Smalltalk	(23,00,06,00,"ESKORTA3");
};
FUNC VOID Rtn_follow_5054 ()
{
	//misja Strażnika, idzie za nami
    TA_FollowPC	(00,05,20,05,"OW_OM_ENTRANCE01");
    TA_FollowPC	(20,05,00,05,"OW_OM_ENTRANCE01"); 
};