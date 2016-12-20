instance BAN_1613_Doyle (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Doyle";
	Npctype			= NPCTYPE_FRIEND;
	guild 		=	GIL_BAU;        
	level =					25;

	
	voice =					13;
	id =					1613;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		140;
	attribute[ATR_DEXTERITY] =		140;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	450;
	attribute[ATR_HITPOINTS] =		450;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//						body mesh,					head mesh,hairmesh,	face-tex,	hair-tex,	skin	
	//Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald",38 ,  4, BAU_ARMOR_H);
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",118 ,  4, BAU_ARMOR_H);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 35);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, Miecz1H4);
	EquipItem (self, ItRw_Bow_War_02_Z);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1613;
	};

FUNC VOID Rtn_start_1613 () //zanim zagada do bohatera
{
    TA_Guard		(13,00,14,00,"LOCATION_11_02");	
    TA_Guard		(14,00,13,00,"LOCATION_11_02");
};
FUNC VOID Rtn_afterstart_1613 () //jak już zagada
{
    TA_Guard		(06,00,19,00,"LOCATION_11_02");	
    TA_RepairHut		(19,00,19,30,"BN_NAPRAWA_CH1");
	TA_Smalltalk		(19,30,21,00,"LOCATION_11_07");
	TA_Sleep		(21,00,06,00,"BN_SEN_DOYLE");
};
FUNC VOID Rtn_lasek_1613 ()
{
	TA_GuidePC		(13,00,14,00,"SPAWN_OW_SNAPPER_WOOD05_05");	
    TA_GuidePC		(14,00,13,00,"SPAWN_OW_SNAPPER_WOOD05_05");
};
FUNC VOID Rtn_OMFull_1613 ()
{
	TA_Guard		(13,00,14,00,"LOCATION_11_02");	
    TA_Guard		(14,00,13,00,"LOCATION_11_02");
};
FUNC VOID Rtn_FAJRANT_1613 ()
{
	TA_Stand		(06,00,12,00,"LOCATION_11_06");	
    TA_Stand		(12,00,06,00,"LOCATION_11_06");
};
FUNC VOID Rtn_atak1_1613 ()
{
	TA_GuidePC		(13,00,14,00,"PLAC3");	
    TA_GuidePC		(14,00,13,00,"PLAC3");
};
FUNC VOID Rtn_zwial_1613 ()
{
    TA_Smalltalk		(13,00,14,00,"TALK1");	
    TA_Smalltalk		(14,00,13,00,"TALK2");
};
FUNC VOID Rtn_wojna_1613 ()
{
    TA_Guard		(13,00,14,00,"OW_PATH_53");	
    TA_Guard		(14,00,13,00,"OW_PATH_53");
};
FUNC VOID Rtn_pomoc_1613 ()
{
    TA_FollowPC		(13,00,14,00,"OW_PATH_53");	
    TA_FollowPC		(14,00,13,00,"OW_PATH_53");
};
FUNC VOID Rtn_kopalnia_1613 ()
{
    TA_Stand_Ignorance		(13,00,14,00,"CAMP02");	
    TA_Stand_Ignorance		(14,00,13,00,"CAMP02");
};