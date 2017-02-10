instance ORG_956_Vincent (Npc_Default)
{
	//-------- primary data --------
	name =					"Vincent";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					12;	
	voice =					6;
	id =					956;
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		50;
	attribute[ATR_MANA] =			50;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 73,  1,ORG_ARMOR_L);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	fight_tactic	=	FAI_HUMAN_MASTER;
	//-------- Talente ----------
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_MAGE,2);
	//------- Inventory ---------
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 40);
	CreateInvItems (self, ItFoRice,2);
	//CreateInvItem (self, ItArRuneIceCube);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	CreateInvItems (self, ItArScrollFirebolt,5);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_956;
};
func void Rtn_start_956 ()
{
TA_PracticeMagic (07,00,18,00,"BOFUR");
Ta_PracticeMagic (18,00,07,00,"BOFUR");
};
