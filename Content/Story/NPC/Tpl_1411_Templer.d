instance TPL_1411_Templer (Npc_Default)
{//średni
	//-------- primary data --------
	name =						Name_Templer;//	"Gor Uno";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							25;
	
	
	voice =							8;
	id =							1411;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	270;
	attribute[ATR_HITPOINTS] =		270;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 66 ,  1, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1411;
};

FUNC VOID Rtn_start_1411 ()
{
    TA_Sleep			(00,00,06,00,"PSI_16_HUT_IN");
    TA_PracticeSword	(06,00,00,00,"PSI_PATH_6_8");	
};

FUNC VOID Rtn_watch_1411 ()
{
    TA_Stay			(00,00,06,00,"SPECTACTOR_3");
    TA_Stay			(06,00,00,00,"SPECTACTOR_3");	
};