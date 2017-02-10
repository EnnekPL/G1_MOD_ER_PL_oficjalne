instance ORG_816_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Dranor";
	Npctype =				Npctype_main;
	guild =					GIL_ORG;      
	level =					8;

	
	voice =					13;
	id =					816;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 80
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 137,  4, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 16);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	CreateInvItem (self, BlueCrystal);
	CreateInvItems (self, ItArScrollFirebolt, 3);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_816;
	};

FUNC VOID Rtn_start_816 ()
{
	TA_Sleep		(00,05,08,05,"NC_HUT28_IN");
	TA_Smalltalk	(08,05,00,05,"NC_HUT28_OUT");
};

FUNC VOID Rtn_magic_816 ()
{
	TA_Sleep		(00,05,08,05,"NC_HUT28_IN");
	TA_Sleep		(08,05,00,05,"NC_HUT28_IN");
};

FUNC VOID Rtn_die_816 ()
{
	TA_Die		(00,05,08,05,"NC_HUT28_IN");
	TA_Die		(08,05,00,05,"NC_HUT28_IN");
};


