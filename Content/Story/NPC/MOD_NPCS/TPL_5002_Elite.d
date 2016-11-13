instance TPL_5002_Elite (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_EliteTPL;
Npctype = NPCTYPE_ambient;
guild = GIL_TPL;
level = 50;
voice = 8;
id = 5002;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 450;
attribute[ATR_HITPOINTS] = 450;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Psionic",22, 1,TPL_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
//edit by Nocturn
Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);
Npc_SetTalentSkill (self, NPC_TALENT_MAGE,3);

//----------Ekwipunek----------
//edit by Nocturn
EquipItem		(self, ItMw_2H_Sword_02);
EquipItem		(self, ItRw_Crossbow_02);
CreateInvItems  (self,ItAt_Wolf_01,1);
CreateInvItems  (self,ItAt_Shadow_02,1);
CreateInvItems  (self,ItArRuneLight,1);
CreateInvItems  (self,ItArRuneFireball,1);
CreateInvItems  (self,ItMiNugget,50);
CreateInvItems  (self,ItAmBolt,50);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_5002;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_5002 ()
{
TA_Guard (06,00,18,00,"TEMP3");
TA_Guard (18,00,06,00,"TEMP3");
};
