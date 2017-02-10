//szkodniki! 
instance ORG_953_OrganisatorMage (Npc_Default)
{
	//-------- primary data --------
	name =					"Szkodnik-magik";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					16;	
	voice =					6;
	id =					953;
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		30;
	attribute[ATR_MANA] =			30;
	attribute[ATR_HITPOINTS_MAX] =	170;
	attribute[ATR_HITPOINTS] =		170;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Fighter", 48, 4,ORG_ARMOR_H);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	fight_tactic	=	FAI_HUMAN_MAGE;
	//-------- Talente ----------
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_MAGE,2);
	//------- Inventory ---------
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 30);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 1);
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
	daily_routine = Rtn_start_953;
};
func void Rtn_start_953 ()
{
TA_PracticeMagic (07,00,18,00,"BANDYTA_MAGIK");
Ta_PracticeMagic (18,00,07,00,"BANDYTA_MAGIK");
};
instance ORG_954_Kil (Npc_Default)
{
	//-------- primary data --------
	name =					"Kil";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;	
	voice =					6;
	id =					954;
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		33;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		30;
	attribute[ATR_MANA] =			30;
	attribute[ATR_HITPOINTS_MAX] =	170;
	attribute[ATR_HITPOINTS] =		170;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 48, 4,ORG_ARMOR_M);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	fight_tactic	=	FAI_HUMAN_MAGE;
	//-------- Talente ----------
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	//Npc_SetTalentSkill (self, NPC_TALENT_MAGE,2);
	//------- Inventory ---------
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 30);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItem (self, Schutzamulett_Geschosse);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_2H_Axe_Big_04);
	CreateInvItems (self, ItArScrollFirebolt,5);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_954;
};
func void Rtn_start_954 ()
{
TA_SitCampfire (07,00,18,00,"KIL");
Ta_PracticeMagic (22,00,07,00,"KIL");
};
instance ORG_955_Fil (Npc_Default)
{
	//-------- primary data --------
	name =					"Fil";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					18;	
	voice =					6;
	id =					955;
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		30;
	attribute[ATR_MANA] =			30;
	attribute[ATR_HITPOINTS_MAX] =	170;
	attribute[ATR_HITPOINTS] =		170;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 73,  1,ORG_ARMOR_M);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	fight_tactic	=	FAI_HUMAN_MASTER;
	//-------- Talente ----------
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	//Npc_SetTalentSkill (self, NPC_TALENT_MAGE,1);
	//------- Inventory ---------
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 40);
	CreateInvItems (self, ItFoRice,2);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	CreateInvItems (self, ItArScrollFirebolt,5);
	CreateInvItem (self, Schutzamulett_Feuer);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_955;
};
func void Rtn_start_955 ()
{
TA_PracticeMagic (07,00,18,00,"FIL");
Ta_PracticeMagic (18,00,07,00,"FIL");
};
