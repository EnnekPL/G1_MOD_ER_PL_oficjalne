instance TPL_3928_GorNaLin (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"Gor Na Lin";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	3;
	id 		=	3928;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_1H_Nailmace_01);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItFoLoaf);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3928;
};

FUNC VOID Rtn_start_3928 ()
{
    	TA_SitCampfire	(09,00,21,00,"NC_TAVERN_ROOM03");
    	TA_SitCampfire	(21,00,03,00,"NC_TAVERN_ROOM03");	
};

FUNC VOID Rtn_pijus_3928 ()
{
    	TA_SitCampfire	(04,00,23,00,"NC_TAVERN_ROOM03");
    	TA_SitCampfire	(23,00,04,00,"LIN_CAVE");
};

FUNC VOID Rtn_follow_3928 ()
{
    	TA_FollowPC	(04,00,23,00,"LIN_CAVE");
    	TA_FollowPC	(23,00,04,00,"LIN_CAVE");
};

FUNC VOID Rtn_bractwo_3928 ()
{
    	TA_Smoke	(04,00,23,00,"GORLIN_LUKOR");
    	TA_Sleep	(23,00,04,00,"PSI_34_HUT_IN");
};

FUNC VOID Rtn_gardist_3928 ()
{
    	TA_Boss	(04,00,23,00,"GORLIN_GRD");
    	TA_SitAround(23,00,04,00,"GORLIN_GRD");
};
