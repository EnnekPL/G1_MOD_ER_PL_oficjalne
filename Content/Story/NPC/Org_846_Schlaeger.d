instance Org_846_Schlaeger (Npc_Default)
{
	//-------- primary data --------
	
	name =			Name_Schlaeger;
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_ORG;       
	level =			15;
	
	voice =			7;
	id =			846;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	122;
	attribute[ATR_HITPOINTS] =		122;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 0,"Hum_Head_FatBald", 12 , 2, ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_01);
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 9);
	CreateInvItems (self, ItFoRice,9);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItAt_Teeth_01);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_846;

};

FUNC VOID Rtn_start_846 ()
{
	TA_SitCampfire 	(20,15,08,15,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,15,20,15,"NC_PATH53");
};

// REBEL
FUNC VOID Rtn_rebel_846 ()
{
	TA_Boss			(07,00,20,00,"NC_RICELORD");
	TA_Boss			(20,00,07,00,"NC_RICELORD");
};










