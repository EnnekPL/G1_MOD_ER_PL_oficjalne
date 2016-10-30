instance BAU_923_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	3;
	voice 		=	2;
	id 			=	923;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 5, 2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_Strong; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    
		
		CreateInvItems (self, ItFoRice,3);
		EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_923;

};

FUNC VOID Rtn_start_923 ()
{
	TA_SitCampfire  (20,05,07,05,"NC_PATH_PEASANT_OUTSIDE20"); //CF1
	TA_WashSelf 	(07,05,07,23,"NC_PATH_PEASANT_OUTSIDE8_WASH");
	TA_PickRice		(07,23,20,05,"NC_PATH83_MOVEMENT");
};

// TRASH
FUNC VOID Rtn_goto_923 ()
{
	TA_PickRice  (20,05,07,05,"NC_PATH83_MOVEMENT"); //CF1
	TA_PickRice 	(07,05,07,23,"NC_PATH83_MOVEMENT");
	TA_PickRice		(07,23,20,05,"NC_PATH83_MOVEMENT");
};

func void rtn_bunt_923 ()
{
TA_Stand (06,00,12,00,"BUNT2");
TA_Stand (12,00,06,00,"BUNT2");
};
func void rtn_liba_923 ()
{
TA_WatchInextremo (06,00,12,00,"LIBA3");
TA_WatchInextremo (12,00,06,00,"LIBA3");
};

// REBEL
FUNC VOID rtn_rebel_923 ()
{
	TA_SitCampfire (06,00,12,00,"NC_PATH86_MOVEMENT");
	TA_SitCampfire (12,00,06,00,"NC_PATH86_MOVEMENT");
};
