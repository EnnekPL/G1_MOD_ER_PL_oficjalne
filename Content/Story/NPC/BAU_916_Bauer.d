instance BAU_916_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	3;
	voice 		=	2;
	id 			=	916;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 3,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_Strong;
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		
		CreateInvItems (self, ItFoRice,3);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
		CreateInvItem (self, ItFoBooze);
		EquipItem (self, ItMw_1H_Scythe_01); 		
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_916;
};

FUNC VOID Rtn_start_916 ()
{
	TA_Sleep		(20,30,07,30,"NC_PATH_PEASANT2");
	TA_PickRice		(07,30,20,30,"NC_PATH81");
};
FUNC VOID Rtn_goto_916 ()
{
	TA_PickRice		(20,30,07,30,"NC_PATH81");
	TA_PickRice		(07,30,20,30,"NC_PATH81");
};

func void rtn_bunt_916 ()
{
TA_Stand (06,00,12,00,"BUNT3");
TA_Stand (12,00,06,00,"BUNT3");
};

// REBEL
FUNC VOID rtn_rebel_916 ()
{
	TA_Smalltalk (06,00,12,00,"NC_PATH098");//with 907
	TA_Smalltalk (12,00,06,00,"NC_PATH098");
};












