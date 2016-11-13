instance ORG_828_Bruce (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bruce";
	Npctype =						NPCTYPE_MAIN;
	guild =							GIL_ORG;      
	level =							20;
	
	voice =							6;
	id =							828;


	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 35,  2, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);	
	
	//-------- inventory --------
	                                    
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 10);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 4);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItAt_Teeth_01);
 	EquipItem (self, ItMw_1H_Mace_War_01);		
	//EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_828;
};

FUNC VOID Rtn_start_828 ()
{
	
	TA_Sleep		(07,30,20,00,"NC_HUT27_IN");
	TA_Smalltalk	(20,00,23,30,"BRUCE_KARCZMA");
	TA_StandDrunk	(23,30,02,00,"BRUCE_KARCZMA");
	TA_SitCampfire	(02,00,07,30,"NC_PLACE07");
};
//!!!!!tego trzeba się pozbyć i zastąpić npc org_800 ///!!!!! ZROBIONE !!!
FUNC VOID Rtn_handel_828 ()
{
	TA_Stand		(07,30,01,00,"OW_PATH_056");
	TA_Stand		(01,00,07,30,"OW_PATH_056");
};
func void rtn_karczma_828 () //chuj wie co to ;D
{
TA_Stand		(07,30,01,00,"BRUCE_KARCZMA");
TA_Stand		(07,30,01,00,"BRUCE_KARCZMA");
};









