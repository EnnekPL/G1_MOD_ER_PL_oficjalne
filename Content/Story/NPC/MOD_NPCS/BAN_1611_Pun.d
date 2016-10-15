instance BAN_1611_Pun (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Pun";
	npctype		=			npctype_main;
	guild 		=			GIL_BAU;       
	level =					35;
	
	voice =					7;
	id =					1611;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	350;
	attribute[ATR_HITPOINTS] =		350;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Fighter", 9, 3, BAU_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 11);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Sledgehammer_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1611;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_start_1611 ()
{
  TA_Stand		(22,00,23,00,"STAND_MAG");
  TA_Sleep		(23,00,08,00,"BED_KOWAL");
	
	TA_Smith_Fire	(08,00,08,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(08,10,08,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(08,20,08,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(08,30,08,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(08,40,08,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(08,50,09,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(09,00,09,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(09,10,09,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(09,20,09,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(09,30,09,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(09,40,09,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(09,50,10,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(10,00,10,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(10,10,10,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(10,20,10,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(10,30,10,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(10,40,10,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(10,50,11,00,"BANDYCI_KUZNIA");    
          
	TA_Smith_Fire	(11,00,11,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(11,10,11,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(11,20,11,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(11,30,11,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(11,40,11,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(11,50,12,00,"BANDYCI_KUZNIA");


	TA_Smith_Fire	(12,00,12,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(12,10,12,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(12,20,12,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(12,30,12,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(12,40,12,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(12,50,13,00,"BANDYCI_KUZNIA");
          
	TA_Smith_Fire	(13,00,13,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(13,10,13,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(13,20,13,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(13,30,13,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(13,40,13,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(13,50,14,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(14,00,14,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(14,10,14,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(14,20,14,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(14,30,14,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(14,40,14,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(14,50,15,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(15,00,15,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(15,10,15,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(15,20,15,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(15,30,15,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(15,40,15,50,"BANDYCI_KUZNIA");
 	TA_Smith_Anvil	(15,50,16,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(16,00,16,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(16,10,16,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(16,20,16,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(16,30,16,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(16,40,16,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(16,50,17,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(17,00,17,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(17,10,17,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(17,20,17,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(17,30,17,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(17,40,17,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(17,50,18,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(18,00,18,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(18,10,18,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(18,20,18,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(18,30,18,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(18,40,18,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(18,50,19,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(19,00,19,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(19,10,19,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(19,20,19,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(19,30,19,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(19,40,19,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(19,50,20,00,"BANDYCI_KUZNIA");

	TA_Smith_Fire	(20,00,20,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(20,10,20,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(20,20,20,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(20,30,20,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(20,40,20,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(20,50,21,00,"BANDYCI_KUZNIA");
	
	TA_Smith_Fire	(21,00,21,10,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(21,10,21,20,"BANDYCI_KUZNIA");
	TA_Smith_Fire	(21,20,21,30,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(21,30,21,40,"BANDYCI_KUZNIA");
	TA_Smith_Cool	(21,40,21,50,"BANDYCI_KUZNIA");
	TA_Smith_Anvil	(21,50,22,00,"BANDYCI_KUZNIA");
};
//ważna postać! pozostałe rutyny trzeba sprawdzić !!!
FUNC VOID Rtn_pupil_1611 ()
{
	TA_SitAround		(13,00,14,00,"BIJACZ1");	
    TA_SitAround		(14,00,13,00,"BIJACZ1");
};

FUNC VOID Rtn_help_1611 () 
{
	TA_FollowPC		(13,00,14,00,"LOCATION_11_12");	
    TA_FollowPC		(14,00,13,00,"LOCATION_11_12");
};

FUNC VOID Rtn_OrcAssault_1611 () 
{
	TA_SitAround		(13,00,14,00,"LOCATION_11_12");	
    TA_SitAround		(14,00,13,00,"LOCATION_11_12");
};
