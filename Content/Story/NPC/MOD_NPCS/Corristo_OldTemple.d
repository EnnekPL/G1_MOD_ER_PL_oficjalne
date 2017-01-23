instance KDF_8084_CorristoOT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Corristo";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	1350;
	voice 		=	14;
	id 			=	8084;
	flags       =   0;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 4000;
	attribute[ATR_MANA] 		= 4000;
	attribute[ATR_HITPOINTS_MAX]= 2000;
	attribute[ATR_HITPOINTS] 	= 2000;

		//------ Protection -------
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	150;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	60;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony", 84, 1, DMB_ARMOR_M);

	B_Scale (self);		
	Mdl_SetModelFatness (self, 0);
    	
	fight_tactic	=	FAI_HUMAN_MAGE;
		
	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,6);


	//-------- Spells--------                                    
	CreateInvItem(self,ItArRuneBreathOfDeath);
		
	//-------- inventory --------                                    
	CreateInvItems(self, ItFo_Potion_Health_02, 2);
	CreateInvItems(self, ItFo_Potion_Mana_02, 2);
	CreateInvItems(self, ItFoWine, 2);
	EquipItem (self, Schutzring_Magie2_Fire2);
 	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
   

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_8084;
};

FUNC VOID Rtn_start_8084 ()
{
	TA_PracticeMagic	(19,05,06,55,"TPL_334");
	TA_PracticeMagic	(06,55,19,05,"TPL_334");
};