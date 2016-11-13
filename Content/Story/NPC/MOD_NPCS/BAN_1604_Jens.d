instance BAN_1604_Jens (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Jens";
Npctype = Npctype_Main;
guild = GIL_BAU;
level = 20;
voice = 11;
id = 1604;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 90;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 280;
attribute[ATR_HITPOINTS] = 280;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",15, 1,BAU_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
Npc_SetTalentSkill (self, NPC_TALENT_2H,7);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Broad_01);
EquipItem		(self, ItRw_Bow_Long_08);
CreateInvItems  (self,ItFoApple,1);
CreateInvItems  (self,ItFoLoaf,1);
CreateInvItems  (self,Schutzring_Feuer1,1);
CreateInvItems  (self,ItMw_1H_Scythe_01,1);
CreateInvItems  (self,ItAt_Wolf_01,1);
CreateInvItems  (self,ItAt_Claws_01,1);
CreateInvItems  (self,ItFo_wineberrys_01,1);
CreateInvItems  (self,ItAt_Shadow_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_1604;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_1604 ()
{ //przystosowane 1.4 //dupa przerabiam
TA_PickRice (06,00,09,00,"BN_PRACA_JENS");
TA_SitAround (09,00,11,30,"BN_SIAT_JENS");
TA_PickRice (11,30,14,45,"BN_PRACA_JENS");
TA_Boss (14,45,16,20,"BN_BOSS_JENS");
TA_Smalltalk (16,20,18,00,"BN_BOSS_JENS");
TA_PickRice (18,00,20,00,"BN_PRACA_JENS");
TA_Smoke (20,00,23,20,"BN_BOSS_JENS");
TA_Sleep (23,20,06,00,"BN_SEN_JENS");
};
FUNC VOID Rtn_wait_1604 ()
{
TA_Stay (06,00,18,00,"JENS");
TA_Smoke (18,00,21,20,"JENS");
TA_Stand (21,20,23,00,"JENS");
TA_Stand (23,00,06,00,"JENS");
};
FUNC VOID Rtn_atak_1604 ()
{
TA_FollowPC (06,00,18,00,"JENS");
TA_FollowPC (18,00,21,20,"JENS");
TA_FollowPC (21,20,23,00,"JENS");
TA_FollowPC (23,00,06,00,"JENS");
};