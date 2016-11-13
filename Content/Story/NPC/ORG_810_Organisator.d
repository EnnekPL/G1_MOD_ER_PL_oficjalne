instance ORG_810_Organisator (Npc_Default)
// hat den mittleren Organistor-Dress und Bogen3, weil er Attentäter ist
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_Ambient;
	guild =					GIL_ORG;      
	level =					8;

	
	voice =					13;
	id =					810;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		150;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 5, 1,ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);

	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 5);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1h_Mace_War_02);
	//EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_810;
};

FUNC VOID Rtn_start_810 ()
{
	TA_Sleep		(23,30,07,30,"NC_HUT12_IN");
	TA_StandAround	(07,30,23,30,"NC_PATH11");
};
FUNC VOID Rtn_przydupas_810 ()
{
	TA_SitAround		(23,30,07,30,"CHUJ1");
	TA_SitAround		(07,30,23,30,"CHUJ1");
};














