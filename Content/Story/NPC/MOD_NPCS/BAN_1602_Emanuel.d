instance BAN_1602_Emanuel (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Emanuel";
Npctype = Npctype_Main;
guild = GIL_BAU;
level = 17;
voice = 10;
id = 2006;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, BAU_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Small_04);
CreateInvItems  (self,ItFoApple,10);
CreateInvItems  (self,ItFoBooze,10);
CreateInvItems  (self,ItForice,10);
CreateInvItems  (self,ItFoBeer,10);
CreateInvItems  (self,ItFoWine,10);
CreateInvItems  (self,ItFo_Sausage,10);
CreateInvItems  (self,ItFo_Konfitura,10);
CreateInvItems  (self,ItFo_Honey,4);
CreateInvItems  (self,ItFo_Milk,10);
CreateInvItems  (self,JajoSca2,10);
CreateInvItems  (self,ItKeLockpick,17);
CreateInvItems  (self,ItMiScoop,1);
CreateInvItems  (self,ItMiSwordraw,1);
CreateInvItems  (self,ItMijoint_3,3);
CreateInvItems  (self,ItLsTorch,1);
CreateInvItems  (self,ItMiNugget,50);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2006;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2006 ()
{
TA_Cook (06,00,10,00,"B_COOK");
TA_PickRice (10,00,12,00,"B_COOK");
TA_Cook (12,00,14,00,"B_COOK");
TA_RoastScavenger (14,00,15,20,"STAND_MAG");
TA_CookForMe (15,20,17,00,"B_COOK4ME");
TA_Cook (17,00,18,00,"B_COOK");
TA_Stand (18,00,19,30,"BN_PALENIE_EMANUEL");
TA_Smoke (19,30,20,00,"BN_PALENIE_EMANUEL");
TA_PlayTune (20,00,22,00,"BN_PALENIE_EMANUEL"); //fp dodany
TA_Sleep (22,00,06,00,"BED_EMANUEL");
};
