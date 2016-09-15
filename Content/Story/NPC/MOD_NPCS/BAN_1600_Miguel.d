instance BAN_1600_Miguel (Npc_Default)
{
	//-------- primary data --------
	
	name 	=				"Miguel";
	Npctype =				Npctype_Main;
	guild 	=				GIL_BAU;      
	level 	=				11;
	flags 	=  				npc_flag_immortal;
	voice 	=				2;
	id 		=				1600;

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
	//	body mesh,					head mesh,	hairmesh,face-tex,hair-tex,			skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 0,"Hum_Head_Pony", 0,  0, GRD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		


	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	

	//-------- inventory --------
	                                    
	CreateInvItem (self, ItFoRice);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItems(self, ItMiNugget, 5);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItKeLockpick);		
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 200);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1600;
};



FUNC VOID Rtn_prestart_1600 () 
{
 	TA_Position	(00,00,12,00,"MIGUEL");	
	TA_Position	(12,00,24,00,"MIGUEL");
};

FUNC VOID Rtn_start_1600 ()
{
    TA_SitAround	(00,00,12,00,"MIGUEL");	
	TA_SitAround	(12,00,24,00,"MIGUEL");
};

FUNC VOID Rtn_OMFull_1600 ()
{
	TA_SitCampfire	(00,00,12,00,"MIGUEL2");	
	TA_SitCampfire	(12,00,24,00,"MIGUEL2");
};
FUNC VOID Rtn_nockruka_1600 ()
{
	TA_SitCampfire	(00,00,12,00,"MIGUEL_NK");	
	TA_SitCampfire	(12,00,24,00,"MIGUEL_NK");
};