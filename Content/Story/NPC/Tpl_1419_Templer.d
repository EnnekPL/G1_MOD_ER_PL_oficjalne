instance TPL_1419_Templer (Npc_Default)
{ 	//najsłabszy 
	//-------- primary data --------
	name =						Name_Templer;//	"Gor Karesh";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							12;
	
	
	voice =							8;
	id =							1419;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	190;
	attribute[ATR_HITPOINTS] =		190;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 66,  1, TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1419;
};

FUNC VOID Rtn_start_1419 ()
{
	TA_Sleep			(23,00,06,10,"PSI_34_HUT_IN");
	TA_PracticeSword	(06,10,23,00,"PSI_TRAINING_8");
};
FUNC VOID Rtn_watch_1419 ()
{
	TA_Stay			(23,00,06,10,"SPECTACTOR_1");
	TA_Stay			(06,10,23,00,"SPECTACTOR_1");
};