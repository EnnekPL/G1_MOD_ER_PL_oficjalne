instance STT_2077_Jim (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Jim";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		10;
	
	
	voice 		=		12;
	id 			=		2077;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		60;
	attribute[ATR_MANA] 			=		60;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MAGE; 
        
    	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		3);	
	//-------- inventory --------
	EquipItem		(self, Miecz1H14);
	//B_GiveJimItemsCH1 (); w kapitelweszel
	//CreateInvItem(self,ItArRuneFireball);
	//CreateInvItems	(self, ItAmArrow, 12);
	//CreateInvItem	(self, ItFo_Potion_Water_01);
	//CreateInvItem	(self, ItFoApple);
	//CreateInvItem	(self, ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2077;
};

FUNC VOID Rtn_start_2077 ()
{
	TA_ReadBook		(23,00,07,30,"OCC_CHAPEL_LEFT_STAIRCASE_BOTTOM");
	TA_SitAround	(07,30,11,00,"NOV_OC");
	TA_Stand		(11,00,17,00,"NOV_OC");
	TA_PracticeMagic	(17,00,23,00,"NOV_OC");	
};

FUNC VOID Rtn_away_2077 ()
{
	TA_PlayTune			(23,00,07,30,"OW_HUN_TOM_JIM_CH4");
	TA_Smoke			(07,30,11,00,"OW_HUN_TOM_JIM_CH4");
	TA_Stand			(11,00,17,00,"OW_HUN_TOM_JIM_CH4");
	TA_PracticeMagic	(17,00,23,00,"OW_HUN_TOM_JIM_CH4");	
};