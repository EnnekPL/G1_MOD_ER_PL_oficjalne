instance TPL_3927_GorBoba (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"Gor Boba";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	3927;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	CreateInvItem (self, ItFo_Potion_Health_02 );
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3927;
};

FUNC VOID Rtn_start_3927 ()
{
TA_Stand	(09,00,14,25,"PSI_PATROS_CLIENT1");
TA_Stand	(14,25,17,30,"PSI_FORTUNO_CLIENT1");
TA_SitCampfire	(17,30,09,00,"PSI_UNDER_ROOFT1");	
TA_Sleep	(17,30,09,00,"PSI_34_HUT_IN");	
TA_SitAround	(17,30,09,00,"PSI_34_HUT_IN");	
};

FUNC VOID Rtn_flee_3927 ()
{
TA_STAY (11,00,18,00,"");
TA_STAY (18,00,11,00,"");
};