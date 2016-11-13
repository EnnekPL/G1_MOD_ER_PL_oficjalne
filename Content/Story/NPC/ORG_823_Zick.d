instance ORG_823_Zick (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Zick";
	Npctype =				Npctype_Main;
	guild =						GIL_ORG;      
	level =						3;

	
	voice =						7;
	id =						823;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	80;
	attribute[ATR_HITPOINTS] =		80;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 39 
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 127, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,9);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,2);		
	CreateInvItems(self, ItMiNugget, 12);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_823;
};

FUNC VOID Rtn_start_823 ()
{
	TA_Sleep		(00,00,07,30,"NC_HUT21_IN");
	TA_SitAround	(07,30,10,00,"NC_HUT21_OUT");
	TA_Cook			(10,00,10,00,"NC_HUT21_OUT");
	TA_SitAround	(20,00,00,00,"NC_HUT21_OUT");
};

FUNC VOID Rtn_follow_823 ()
{
	TA_FollowPC		(00,00,12,30,"NC_HUT21_OUT");
	TA_FollowPC		(12,30,00,00,"NC_HUT21_OUT");
};

FUNC VOID Rtn_loser_823 ()
{
	TA_SitCampfire	(00,00,12,30,"OW_PATH_075_GUARD");
	TA_SitCampfire	(12,30,00,00,"OW_PATH_075_GUARD");
};

FUNC VOID Rtn_party_823 ()
{
	TA_Boss	(00,00,12,30,"OW_PATH_066");
	TA_Boss	(12,30,00,00,"OW_PATH_066");
};