instance NON_7046_Skazaniec (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Skazaniec";
	npctype =						npctype_main;
	guild =							GIL_NONE;      
	level =							2;
	
	
	voice =							3;
	id =							7046;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 71,  1,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, Itfo_Potion_Water_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7064;
};



FUNC VOID Rtn_start_7064 ()
{
	TA_Stay		(23,00,06,45,"WP_INTRO_SHORE");
	TA_Stand 	(06,45,12,00,"WP_INTRO_SHORE");
	TA_Stay		(12,00,17,00,"WP_INTRO_SHORE");
	TA_Stay 	(17,00,23,00,"WP_INTRO_SHORE");
};
func void rtn_camp_7064 ()
{
	TA_Stand (06,00,18,45,"SKAZANIEC_NOWY");
	TA_Smoke (18,45,06,00,"SKAZANIEC_NOWY");
};

func void rtn_bractwo_7064 ()
{
	TA_Stand (06,00,18,45,"SKAZANIEC_NOWY");
	TA_Smoke (18,45,06,00,"SKAZANIEC_NOWY");
};






