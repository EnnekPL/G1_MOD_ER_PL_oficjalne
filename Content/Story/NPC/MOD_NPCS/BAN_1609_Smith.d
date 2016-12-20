instance BAN_1609_Smith (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Smith";
	npctype		=	npctype_main;
	guild 		=	GIL_BAU;     
	level =					22;
	
	voice =					6;
	id =					1609;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		200;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 5, 1,BAU_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 13);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	// HANDEL
	CreateInvItem (self, ItRw_Bow_Small_01);
	CreateInvItem (self, ItRw_Bow_Small_03);
	CreateInvItem (self, ItRw_Bow_Small_04);
	CreateInvItem (self, ItRw_Bow_Small_05);
	CreateInvItem (self, ItRw_Bow_Long_02);
	CreateInvItem (self, ItRw_Bow_Long_03);
	CreateInvItem (self, ItRw_Bow_Long_04);
	//CreateInvItem (self, ItRw_Bow_Long_05);
	//CreateInvItem (self, ItRw_Bow_Long_07);
	CreateInvItems (self, ItAmArrow, 1000);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1609;
	//self.aivar[43] = tarcza_strzelecka_01;
};

FUNC VOID Rtn_start_1609 ()
{
    TA_PracticeBow		(08,00,14,00,"BN_TRENING2_WSZYSCY");	
    TA_RepairHut		(14,00,15,20,"BN_NUTA_866");
	TA_PracticeBow		(15,20,20,10,"BN_TRENING2_WSZYSCY");
	TA_Sleep			(20,10,08,00,"BED_SMITH");
};

FUNC VOID Rtn_OMFull_1609 ()
{
	TA_PracticeBow		(13,00,14,00,"LOCATION_11_14");	
    TA_PracticeBow		(14,00,13,00,"LOCATION_11_14");
};

