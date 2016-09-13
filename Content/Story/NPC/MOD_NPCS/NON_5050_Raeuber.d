instance NON_5050_Raeuber (Npc_Default)
{
	//-------- primary data --------
	//edit by Nocturn
	
	name =					NAME_Schlaeger;
	npctype		=			npctype_main;
	guild 		=			GIL_NONE;      
	level =					10;
	voice =					13;
	id =					5050;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		62;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief", 35, 2, ORG_ARMOR_L);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoRice,5);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
 	EquipItem (self, ItMw_1H_Mace_03);		
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_5050;
};

FUNC VOID Rtn_start_5050 ()
{
    TA_StandAround		(13,00,14,00,"BANDYTA1");	
    TA_StandAround		(14,00,13,00,"BANDYTA1");
};
FUNC VOID Rtn_go_5050 ()
{
    TA_GuidePC		(13,00,14,00,"BANDITOS01");	
    TA_GuidePC		(14,00,13,00,"BANDITOS01");
};













