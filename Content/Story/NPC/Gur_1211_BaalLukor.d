instance GUR_1211_BaalLukor (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Lukor";
	Npctype 	=		NPCTYPE_FRIEND;
	flags		=		NPC_FLAG_IMMORTAL;
	guild 		=		GIL_GUR;
	level 		=		50;
	
	voice 		=		13;
	id 			=		1211;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH]	 		=	50;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Mage.mds");
	//							body mesh,			bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0",	1,		1,		"Hum_Head_Psionic",	20,			1,			GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness	(self,	-1);

	//-------- Talente -------
	Npc_SetTalentSkill	(self,	NPC_TALENT_MAGE,		6);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);		
	//-------- inventory --------
	EquipItem			(self,	ItMw_1H_Mace_War_04);
	
	//------------- AI -------------
	daily_routine	=	Rtn_start_1211;
	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_Start_1211 ()
{
    TA_Guard	(23,00,16,00,"GRYD_025");
	TA_Guard	(16,00,23,00,"GRYD_025");
};

FUNC VOID Rtn_Follow_1211 ()
{
    TA_FollowPC	(23,00,16,00,"GRYD_025");
	TA_FollowPC	(16,00,23,00,"GRYD_025");
};

FUNC VOID Rtn_WaitInSideTunnelOne_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_040");
	TA_Stay		(16,00,23,00,"GRYD_040");
};

FUNC VOID Rtn_WaitInSideTunnelTwo_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_047");
	TA_Stay		(16,00,23,00,"GRYD_047");
};

FUNC VOID Rtn_Door_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_060");
	TA_Stay		(16,00,23,00,"GRYD_060");
};

FUNC VOID Rtn_Teleport_1211 ()
{
    TA_FollowPC	(23,00,16,00,"GRYD_060");
	TA_FollowPC	(16,00,23,00,"GRYD_060");
};

FUNC VOID Rtn_Meditate_1211 ()
{
    TA_Meditate	(23,00,16,00,"GRYD_082");
	TA_Meditate	(16,00,23,00,"GRYD_082");
};

instance GUR_1213_BaalLukor_world (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Lukor";
	Npctype 	=		NPCTYPE_MAIN;
	flags		=		NPC_FLAG_IMMORTAL;
	guild 		=		GIL_GUR;
	level 		=		15;
	
	voice 		=		13;
	id 			=		1213;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH]	 		=	50;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Mage.mds");
	//							body mesh,			bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0",	1,		1,		"Hum_Head_Psionic",	20,			1,			GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness	(self,	-1);

	//-------- Talente -------
	Npc_SetTalentSkill	(self,	NPC_TALENT_MAGE,		6);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);		

	//-------- inventory --------
	EquipItem			(self,	ItMw_1H_Mace_War_04);
	
	//------------- AI -------------
	daily_routine	=	Rtn_start_1213;
	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_Start_1213 ()
{
    TA_Stand		(05,44,12,15,"PSI_VIEWPOINT");
	TA_PracticeMagic	(12,15,14,35,"PSI_VIEWPOINT");
	TA_Stand	(14,35,17,00,"PSI_VIEWPOINT"); // tutaj można dodać czytanie książki 
	TA_HerbAlchemy	(17,00,21,30,"PSI_PATH_12_8");
	TA_Smoke	(21,00,23,30,"PSI_KALOMS_HUT_PIPE");
	TA_Sleep	(23,30,05,44,"PSI_20_HUT_EX");
};

FUNC VOID Rtn_guide_1213 ()
{
    TA_GuidePC	(23,00,16,00,"SPAWN_WOLF_LUKOR_QUEST");
	TA_GuidePC	(16,00,23,00,"SPAWN_WOLF_LUKOR_QUEST");
};

FUNC VOID Rtn_guide2_1213 ()
{
    TA_GuidePC	(23,00,16,00,"CAVE_BANDIT_2");
	TA_GuidePC	(16,00,23,00,"CAVE_BANDIT_2");
};
FUNC VOID Rtn_delte_1213 ()
{
    TA_Stay	(23,00,16,00,"");
	TA_Stay	(16,00,23,00,"");
};

