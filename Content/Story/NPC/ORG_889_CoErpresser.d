instance ORG_889_CoErpresser (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wsp�lnik szanta�ysty";
	Npctype =				Npctype_main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					7;
	id =					889;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		


	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	

	//-------- inventory --------
	                                    
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 12);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoBooze, 5);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	//edit by Nocturn
	
	start_aistate = ZS_Erpresser;
	daily_routine = Rtn_start_889;
};

FUNC VOID Rtn_start_889 ()
{
	TA_StandAround	(03,00,11,00,"OW_PATH_084");
	TA_StandAround	(11,00,03,00,"OW_PATH_084");	
};




