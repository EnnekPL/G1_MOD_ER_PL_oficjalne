
instance NON_5614_Josep (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Josep";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	5;
	voice 		=	9;
	id 			=	5614;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY]	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 250;
	attribute[ATR_HITPOINTS] 	= 250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Fighter", 0,  1, HUN_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	                            	
	//-------- Talente -------- 	                                  
	
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Scythe_01);
	CreateInvItems (self, ItFoRice,5);
	EquipItem (self, JosepSamulet);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_5614;
};

FUNC VOID Rtn_start_5614 ()
{
	TA_Sleep		(20,35,07,35,"NC_PATH_PEASANT4");
	TA_PickRice		(07,35,20,35,"NC_PATH81");
};

FUNC VOID Rtn_guide_5614 ()
{
	TA_GuidePC		(20,35,07,35,"OW_PATH_066");
	TA_GuidePC		(07,35,20,35,"OW_PATH_066");
};

FUNC VOID Rtn_guide2_5614 ()
{
	TA_GuidePC		(20,35,07,35,"PACZ2");
	TA_GuidePC		(07,35,20,35,"PACZ2");
};

FUNC VOID Rtn_camp_5614 ()
{
	TA_smoke		(20,35,07,35,"WYKOAPLISKA2_MS1");
	TA_smoke		(07,35,20,35,"SPAWN_OW_BLOODFLY_12");
};

FUNC VOID Rtn_beliar_5614 ()
{
	TA_smoke		(20,35,07,35,"JOSEP2");
	TA_smoke		(07,35,20,35,"JOSEP2");
};


FUNC VOID Rtn_camp2_5614 ()
{
	TA_Stand		(20,35,07,00,"SPAWN_OW_BLOODFLY_12");
	TA_CookForMe	(07,00,07,35,"CAMP_SHRAT");
	TA_PickRice		(07,35,20,35,"WYKOAPLISKA2_MS1");
};
