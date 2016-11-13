instance TPL_1414_Templer (Npc_Default)
{
	//-------- primary data --------
	name =						Name_Templer;	//"Gor Van";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							17;
	
	
	voice =							13;
	id =							1414;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 0,"Hum_Head_Bald", 15,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1414;
};

FUNC VOID Rtn_start_1414 ()
{
	TA_Sleep			(23,55,05,55,"PSI_18_HUT_IN");
	TA_PracticeSword	(05,55,23,55,"PSI_TRAINING_3"); 
};
FUNC VOID Rtn_watch_1414 ()
{
	TA_Stay			(23,55,05,55,"SPECTACTOR_2");
	TA_Stay			(05,55,23,55,"SPECTACTOR_2"); 
};