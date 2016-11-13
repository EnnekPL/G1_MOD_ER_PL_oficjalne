instance TPL_1490_GorNaTokas (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Tokas";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							20;
	
	
	voice =							11;
	id =							1490;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	292;
	attribute[ATR_HITPOINTS] =		292;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_Psionic", 86 ,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	//-------- inventory --------					
	EquipItem (self, Tokas_Sword);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1490;
};

FUNC VOID Rtn_start_1490 ()
{
    TA_PracticeSword	(11,00,17,30,"TOKAS_PRACTICE");
	TA_Stand	(17,30,20,15,"TOKAS_PRACTICE");
    TA_Boss		(20,15,23,40,"TOKAS_GUARD"); //PSI_33_HUT_IN
	TA_Sleep		(23,40,07,25,"PSI_33_HUT_IN");
	TA_Boss		(07,25,11,00,"TOKAS_GUARD");
};

FUNC VOID Rtn_flee_1490 ()
{
	TA_Stay 	(00,00,12,00,"");
	TA_Stay 	(12,00,24,00,"");
};

instance TPL_1491_GorNaTokasOT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Tokas";
	npctype =						npctype_Main;
	guild =							GIL_NONE;
	level =							45;
	
	
	voice =							11;
	id =							1491;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		130;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 117,  2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_1H,9);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	//-------- inventory --------					
	EquipItem (self, Tokas_Sword);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_startOT_1490;
};

FUNC VOID Rtn_startOT_1490 ()
{
    TA_Stay	(00,00,12,00,"TPL_317");
	TA_Stay	(12,00,00,00,"TPL_317");
};
