instance NONE_13Mage (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Trzynasty mag";
	npctype =						npctype_main;
	guild =							GIL_Meatbug;      
	level =							250;
	
	
	voice =							1;
	id =							7850;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	600;
	attribute[ATR_HITPOINTS] =		600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_mage; 

	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);
	//-------- inventory --------                                    

	EquipItem (self, ItArRuneThunderbolt);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7850;
};

FUNC VOID Rtn_start_7850 ()
{
    TA_StandAround	    (08,00,18,00,"MAGICTOWER_01");  
	TA_StandAround     (18,00,08,00,"MAGICTOWER_01");
};