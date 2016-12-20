instance GRD_7015_PalissadeGuard (Npc_Default)
{
//----------Info ogolne----------

name = NAME_Gardist;
Npctype = Npctype_ambient;
guild = GIL_GRD;
level = 16;
voice = 6;
id = 7015;

//----------Statystyki----------

attribute[ATR_STRENGTH] 		= 50;
attribute[ATR_DEXTERITY] 		= 70;
attribute[ATR_MANA_MAX] 	= 0;
attribute[ATR_MANA] 			= 0;
attribute[ATR_HITPOINTS_MAX]  = 300;
attribute[ATR_HITPOINTS] 			= 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald", 39, 4,GRD_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,1);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItFoApple,5);
CreateInvItems  (self,ItFocheese,3);
CreateInvItems  (self,ItFoMutton,3);
CreateInvItems  (self,ItFoBeer,2);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMiNugget,15);
CreateInvItems  (self,ItAmBolt,50);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_7015;

};

FUNC VOID Rtn_start_7015 ()
{
	TA_Guard	(06,00,07,00,"OMC_PALISSADE_B");
	TA_Guard	(07,00,08,00,"OMC_PALISSADE_A");
	TA_Guard	(08,00,09,00,"OMC_PALISSADE_B");
	TA_Guard	(09,00,10,00,"OMC_PALISSADE_A");
	
	TA_Guard	(10,00,11,00,"OMC_PALISSADE_B");
	TA_Guard	(11,00,12,00,"OMC_PALISSADE_A");
	TA_Guard	(12,00,13,00,"OMC_PALISSADE_B");
	TA_Guard	(13,00,14,00,"OMC_PALISSADE_A");
	
	TA_Guard	(14,00,15,00,"OMC_PALISSADE_B");
	TA_Guard	(15,00,16,00,"OMC_PALISSADE_A");
	TA_Guard	(16,00,17,00,"OMC_PALISSADE_B");
	TA_Guard	(17,00,18,00,"OMC_PALISSADE_A");
	
	TA_Guard	(18,00,19,00,"OMC_PALISSADE_B");
	TA_Guard	(19,00,20,00,"OMC_PALISSADE_A");
	TA_Guard	(20,00,21,00,"OMC_PALISSADE_B");
	TA_Guard	(21,00,22,00,"OMC_PALISSADE_A");
	
	TA_Guard	(22,00,23,00,"OMC_PALISSADE_B");
	TA_Guard	(23,00,00,00,"OMC_PALISSADE_A");
	TA_Guard	(00,00,01,00,"OMC_PALISSADE_B");
	TA_Guard	(01,00,02,00,"OMC_PALISSADE_A");
	
	TA_Guard	(02,00,03,00,"OMC_PALISSADE_B");
	TA_Guard	(03,00,04,00,"OMC_PALISSADE_A");
	TA_Guard	(04,00,05,00,"OMC_PALISSADE_B");
	TA_Guard	(05,00,06,00,"OMC_PALISSADE_A");
};
