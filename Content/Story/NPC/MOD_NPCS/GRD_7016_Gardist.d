instance GRD_7016_Gardist (Npc_Default)
{
//----------Info ogolne----------

name = NAME_Gardist;
Npctype = npctype_mine_ambient;
guild = GIL_GRD;
level = 16;
voice = 6;
id = 7016;

//----------Statystyki----------

attribute[ATR_STRENGTH] 		= 55;
attribute[ATR_DEXTERITY] 		= 40;
attribute[ATR_MANA_MAX] 	= 0;
attribute[ATR_MANA] 			= 0;
attribute[ATR_HITPOINTS_MAX]  = 300;
attribute[ATR_HITPOINTS] 			= 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald", 39, 4,GRD_ARMOR_H);
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
fight_tactic	=	FAI_HUMAN_master;
daily_routine = Rtn_start_7016;

};

FUNC VOID Rtn_start_7016 ()
{
	TA_Guard	(06,00,00,00,"OM_NEW_GARDIST1");
	TA_Guard	(00,00,06,00,"OM_NEW_GARDIST1");
};
