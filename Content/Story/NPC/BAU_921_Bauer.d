instance BAU_921_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Mglisty";
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	2;
	voice 		=	4;
	id 			=	921;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 150;
	attribute[ATR_HITPOINTS] 	= 150;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex4,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",56 ,  1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	CreateInvItems (self, ItFoRice,6);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMw_1H_Scythe_01); 		
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_921;
};

FUNC VOID Rtn_start_921 ()
{
	TA_Sleep		(20,50,07,50,"NC_PATH_PEASANT");
	TA_PickRice		(07,50,20,50,"NC_PATH82");
};

// REBEL
FUNC VOID Rtn_rebel_921 ()
{
	TA_Smalltalk	(20,50,07,50,"OW_PATH_069");
	TA_Smalltalk	(07,50,20,50,"OW_PATH_069"); //PATH_OC_NC_27 
};
