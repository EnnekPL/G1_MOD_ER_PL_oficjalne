instance NOV_1373_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Nowicjusz - rabuś";
	Npctype 	=	npctype_main;
	guild 		=	GIL_DMB;
	level 		=	7;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1373;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	230;
	attribute[ATR_HITPOINTS] 		=	230;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	Npc_SetTalentSkill (self, NPC_TALENT_2H,5);
		
	//-------- inventory --------

	EquipItem (self, ItMw_2H_Staff_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, RudaEmanuela);       
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1373;

};

FUNC VOID Rtn_start_1373 ()
{
	//Npc_SetPermAttitude (NOV_1374_Novize, ATT_HOSTILE);
	TA_SMOKE	(24,00,06,00,"OC_ROUND_26");
  	TA_SMOKE	(06,00,24,00,"OC_ROUND_26");
};