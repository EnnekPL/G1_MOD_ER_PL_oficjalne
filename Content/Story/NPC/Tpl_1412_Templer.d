instance TPL_1412_Templer (Npc_Default)
{
	//-------- primary data --------
	name =						"Gor Na Idon";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							35;
	
	
	voice =							13;
	id =							1412;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		95;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	300;
	attribute[ATR_HITPOINTS] =		300;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 62 , 2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_03);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1412;
};

FUNC VOID Rtn_start_1412 ()
{

    TA_Sleep			(00,05,06,05,"PSI_15_HUT_IN");
    TA_PracticeSword	(16,05,00,05,"PSI_TRAINING_1");	
};
FUNC VOID Rtn_watch_1412 ()
{

    TA_Stay	(00,05,06,05,"PSI_TRAINING_2");
    TA_Stay	(16,05,00,05,"PSI_TRAINING_2");	
};
FUNC VOID Rtn_mine_1412 ()
{
    TA_Stay				(00,05,06,05,"OW_PATH_1_16");
    TA_Stay				(16,05,00,05,"OW_PATH_1_16");	
};