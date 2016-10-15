instance BAN_1614_Drax (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Drax";
	Npctype =				Npctype_Main;
	guild =							GIL_BAU;      
	level =							35;
	
	voice =							6;
	id =							1614;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		120;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	680;
	attribute[ATR_HITPOINTS] =		680;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 39, 2, BAU_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,2);		
	CreateInvItems(self, ItMiNugget, 14);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 3);
	CreateInvItems (self, ItFo_Potion_Health_01, 25);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_1614;

};

FUNC VOID Rtn_Start_1614 ()
{
	TA_Smalltalk (00,00,23,00,"OW_PATH_1_5_B");
	TA_Smalltalk (23,00,00,00,"OW_PATH_1_5_B");
};
FUNC VOID Rtn_camp_1614 ()
{
	TA_GuidePC (06,00,14,00,"OW_PATH_188");
	TA_GuidePC (14,00,06,00,"OW_PATH_188");
};
FUNC VOID Rtn_atak1_1614 ()
{
	TA_GuidePC (06,00,14,00,"SPAWN_GRD3");
	TA_GuidePC (14,00,06,00,"SPAWN_GRD3");
};
FUNC VOID Rtn_atak2_1614 ()
{
	TA_GuidePC (06,00,14,00,"SPAWN_GRD999");
	TA_GuidePC (14,00,06,00,"SPAWN_GRD999");
};
FUNC VOID Rtn_atak3_1614 ()
{
	TA_GuidePC (06,00,14,00,"MAM_WAS_KURDE");
	TA_GuidePC (14,00,06,00,"MAM_WAS_KURDE");
};
 FUNC VOID Rtn_ded_1614 ()
{
	TA_Smalltalk (00,00,23,00,"OW_PATH_250");
	TA_Smalltalk (23,00,00,00,"OW_PATH_250");
};




