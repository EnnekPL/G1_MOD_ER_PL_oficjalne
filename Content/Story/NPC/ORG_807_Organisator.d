instance ORG_807_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Greaver";
	Npctype =				Npctype_main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					7;
	id =					807;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	180;
	attribute[ATR_HITPOINTS] =		190;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 90
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Fatbald", 134, 1, ORG_ARMOR_M);
	
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	

	//-------- inventory --------
	                                    
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 16);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoBooze, 4);
	CreateInvItems (self, ItLsTorch, 3);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_War_01);
	//EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_807;
};

FUNC VOID Rtn_start_807 ()
{
	TA_Sleep		(00,00,08,00,"NC_HUT14_IN");	
	TA_SitCampfire	(08,00,00,00,"NC_PLACE05");
};
func void rtn_przydupas_807 ()
{
	TA_Stand		(00,00,08,00,"CHUJ2");	
	TA_Stand		(08,00,00,00,"CHUJ2");
};
