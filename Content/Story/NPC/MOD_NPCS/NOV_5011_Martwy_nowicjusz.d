instance NOV_5011_Martwy_nowicjusz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Martwy Nowicjusz";
Npctype = Npctype_Main;
guild = GIL_NOV;
level = 5;
voice = 3;
id = 5011;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 5;
attribute[ATR_DEXTERITY] = 5;
attribute[ATR_MANA_MAX] = 5;
attribute[ATR_MANA] = 5;
attribute[ATR_HITPOINTS_MAX] = 5;
attribute[ATR_HITPOINTS] = 5;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",18, 0,NOV_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
Npc_SetTalentSkill (self, NPC_TALENT_2H,4);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Short_03);
EquipItem		(self, ItRw_Bow_Small_01);
CreateInvItems  (self,ItFoApple,1);
CreateInvItems  (self,ItFosoup,1);
CreateInvItems  (self,ItMw_SiekieraCSI,1);
CreateInvItems  (self,ITMI_OSTRZECSI,7);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Coward;
daily_routine = Rtn_start_5011;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_5011 ()
{
TA_Stay (06,00,18,00,"DED3");
TA_Stay (18,00,06,00,"DED3");
};
