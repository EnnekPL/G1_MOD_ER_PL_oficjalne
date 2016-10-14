instance NOV_1374_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Nowicjusz - rabuś";
	Npctype 	=	npctype_main;
	guild 		=	GIL_DMB;
	level 		=	4;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1374;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	22;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	180;
	attribute[ATR_HITPOINTS] 		=	180;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_l);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1374;

};

FUNC VOID Rtn_start_1374 ()
{
	//Npc_SetPermAttitude (NOV_1374_Novize, ATT_HOSTILE);
	TA_SMOKE	(24,00,06,00,"ER_WD_QUEST_BANDIT_01");
  	TA_SMOKE	(06,00,24,00,"ER_WD_QUEST_BANDIT_01");
};