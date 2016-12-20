instance GRD_3902_Zwiadowca (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn
//----------Info ogolne----------

name = "Zwiadowca";
Npctype = Npctype_ambient;
guild = GIL_GRD;
level = 14;
voice = 7;
id = 3902;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 10;
attribute[ATR_MANA] = 10;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",68, 1,STT_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
EquipItem		(self, ItRw_Bow_Long_05_Z);
CreateInvItems  (self,ItFocheese,3);
CreateInvItems  (self,ItForice,2);
CreateInvItems  (self,ItFoMutton,3);
CreateInvItems  (self,ItFoApple,3);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMiNugget,20);
CreateInvItems  (self,ItMiJoint_1,3);
//----------Pozostale---------- 
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3902;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3902 () //edit by Nocturn
{
TA_Stand (05,00,06,00,"OCR_PALISADES_PLATFORM_05");
TA_Guard (06,00,17,00,"OCR_PALISADES_PLATFORM_GUARD_LEFT");
TA_Stand (17,00,18,00,"OCR_PALISADES_PLATFORM_GUARD_RIGHT");
TA_Guard (18,00,05,00,"OCR_PALISADES_PLATFORM_GUARD_RIGHT");

};
