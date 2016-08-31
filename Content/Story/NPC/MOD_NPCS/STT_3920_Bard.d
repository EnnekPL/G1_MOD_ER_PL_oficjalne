instance STT_3920_Bard (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Bard";
Npctype = Npctype_Main;
guild = GIL_STT;
level = 10;
voice = 9;
id = 3920;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 40;
attribute[ATR_DEXTERITY] = 40;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 100;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",18, 1,STT_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,4);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_01);
CreateInvItems  (self,ItFo_wineberrys_01,3);
CreateInvItems  (self,ItFoMutton,1);
CreateInvItems  (self,ItFoBeer,2);
CreateInvItems  (self,ItFo_Potion_Health_01,1);
CreateInvItems  (self,ItMiLute,1);
CreateInvItems  (self,ItMiNugget,10);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3920;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_3920 ()
{
TA_PlayTune (00,00,19,00,"OCR_OUTSIDE_HUT_76");
TA_SitAround (19,00,20,00,"OCR_OUTSIDE_HUT_76");
TA_PlayTune (20,00,23,00,"OCR_ARENA_BARONS_HUT_STAIRS_UP");
TA_StandAround (23,00,00,00,"OCR_ARENA_BARONS_HUT_STAIRS_UP");
};