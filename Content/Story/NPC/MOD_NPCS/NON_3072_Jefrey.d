instance NON_3072_Jefrey (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Jefrey";
Npctype = Npctype_Main;
guild = GIL_SLD;
level = 120;
voice = 3;
id = 3072;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 250;
attribute[ATR_DEXTERITY] = 250;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 790;
attribute[ATR_HITPOINTS] = 790;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",4, 0,CRW_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_2H_Axe_Heavy_02);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,ItMiNugget,570);
CreateInvItems  (self,ItMi_Stuff_Pipe_01,2);
CreateInvItems  (self,ItMi_Stuff_Amphore_01,2);
CreateInvItems  (self,ItMi_Alchemy_Salt_01,1);
CreateInvItems  (self,ItMi_Alchemy_Alcohol_01,5);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3072;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3072 ()
{
TA_Stay (06,00,18,00,"PSI_PATH_101_LADDEREND");
TA_Stay (18,00,06,00,"PSI_PATH_101_LADDEREND");
};
FUNC VOID Rtn_postart_3072 ()
{
TA_Stay (04,00,00,00,"PSI_PATH_101_LADDEREND");
TA_Stay (00,00,04,00,"LOWCAX1");
};
FUNC VOID Rtn_castle_3072 ()
{
TA_FollowPC (04,00,00,00,"BM_JEFREY");
TA_FollowPC (00,00,04,00,"BM_JEFREY");
};
FUNC VOID Rtn_defAv_3072 ()
{
TA_Def (04,00,00,00,"BM_JEFREY");
TA_Def (00,00,04,00,"BM_JEFREY");
};