// Novize nur für Kap. 6 Orktempel benutzen

instance NOV_1362_Novize (Npc_Default)
{
	//-------- primary data --------
	name 	=	NAME_MadNovice;
	Npctype 		=		npctype_main;
	guild 		=		GIL_GUR;
	level 		=		30;
	flags 		=		0;
	
	voice 		=		3;
	id 			=		1362;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	115;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	290;
	attribute[ATR_HITPOINTS] 		=	290;

	//------ Protection -------
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	50;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, DarkNovize_Armor_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);	
		
	//-------- inventory --------

	CreateInvItem (self, ItMw_2H_Staff_02);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_OT_1362;

};

FUNC VOID Rtn_start_1362 ()
{
	TA_Meditate	(24,00,06,00,"TPL_408");
  	TA_Meditate	(06,00,24,00,"TPL_408");	 
};

FUNC VOID Rtn_OT_1362 ()
{
	TA_OTMeditate	(24,00,06,00,"TPL_390");
  	TA_OTMeditate	(06,00,24,00,"TPL_390");	 
};