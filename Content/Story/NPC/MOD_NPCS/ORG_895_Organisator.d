instance ORG_895_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =						"Zakapior";
	Npctype =					Npctype_MAIN;
	guild =						GIL_ORG;      
	level =						8;

	
	voice =						7;
	id =						895;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	

	//-------- inventory --------                                    
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItem (self, ItFoMutton);
	EquipItem (self, ItMw_1H_Mace_03);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_895;
};

FUNC VOID Rtn_start_895 ()
{
	TA_Stand	(01,00,13,00,	"NC_ZICKFRIEND_01");
	TA_Stand	(13,00,01,00,	"NC_ZICKFRIEND_01");
};