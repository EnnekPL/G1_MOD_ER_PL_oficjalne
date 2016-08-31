instance VLK_7013_kopacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = Name_Buddler;
Npctype = Npctype_Ambient;
guild = GIL_VLK;
level = 2;
voice = 4;
id = 7013;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 12;
attribute[ATR_DEXTERITY] = 10;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 50;
attribute[ATR_HITPOINTS] = 50;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",101, 1,VLK_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sickle_01);
CreateInvItems  (self,ItForice,3);
CreateInvItems  (self,ItMiNugget,5);
CreateInvItems  (self,ItFoMuttonRaw,1);
CreateInvItems  (self,ItFo_Potion_Health_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Coward;
daily_routine = Rtn_start_7013;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_7013 ()
{
TA_RepairHut (06,00,12,23,"ROB4");
TA_PickOre (12,24,18,33,"KOP6");
TA_Stand (18,33,20,15,"KOP6");
TA_Sleep (20,15,06,00,"OMC_BED_SPIKE");
};