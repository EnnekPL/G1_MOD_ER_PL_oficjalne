instance NON_2234_Medrzec (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dren";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	46;
	voice 		=	9;
	id 			=	2234;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY]	= 80;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;

	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 4,  1, DREN_ARMOR);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, Gold01);
	CreateInvItems (self, ItMi_runa0,4);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2234;
};

FUNC VOID Rtn_start_2234 ()
{
	TA_Stand	(20,25,	07,25,"MEDRZEC");
	TA_Stay		(7,25,	20,25,"MEDRZEC");
};













