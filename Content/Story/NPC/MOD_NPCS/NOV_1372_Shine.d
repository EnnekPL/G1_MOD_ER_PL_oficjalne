instance NOV_1372_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Shine";
	Npctype 	=	npctype_main;
	guild 		=	GIL_NOV;
	level 		=	5;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1372;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	12;
	attribute[ATR_DEXTERITY] 		=	8;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	60;
	attribute[ATR_HITPOINTS] 		=	1;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
		
	//-------- inventory --------

	CreateInvItem (self, ItMw_2H_Staff_01);
	CreateInvItem (self, ItFoSoup);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1372;

};

FUNC VOID Rtn_start_1372 ()
{
	TA_Stay	(24,00,06,00,"ER_WD_QUEST_TRUP_01");
  	TA_Stay	(06,00,24,00,"ER_WD_QUEST_TRUP_01");	 //SPAWN_OW_MOLERAT_06_CAVE_GUARD3 die enemy 
};
