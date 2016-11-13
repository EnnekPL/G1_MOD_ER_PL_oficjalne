instance ORG_857_Calash (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Calash";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					2;
	id =					857;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		58;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Fighter", 46, 2,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		


	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);	

	//-------- inventory --------
	                                    
	CreateInvItem (self, ItFoRice);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItems(self, ItMiNugget, 5);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItKeLockpick);		
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 30);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_857;
};



FUNC VOID Rtn_prestart_857 () 
{
 	TA_Position	(00,00,12,00,"OM_85");	
	TA_Position	(12,00,24,00,"OM_85");
};

FUNC VOID Rtn_start_857 ()
{
    TA_Position	(00,00,12,00,"OM_85");	
	TA_Position	(12,00,24,00,"OM_85");
};

FUNC VOID Rtn_guide_857 ()
{
	TA_GuidePC	(00,00,12,00,"OM_TROLL2");	
	TA_GuidePC	(12,00,24,00,"OM_TROLL2");
};


FUNC VOID Rtn_karczma_857 ()
{
	TA_Smoke	(00,00,12,00,"ZLU1");	
	TA_PlayTune	(12,00,24,00,"ZLU1");//fp dodany
};

FUNC VOID Rtn_follow_857 ()
{
	TA_FollowPC	(00,00,12,00,"OW_PATH_067");	
	TA_FollowPC	(12,00,24,00,"OW_PATH_067");
};



