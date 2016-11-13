instance NON_4001_MadNovize (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name 	= "Zdrajca";
Npctype = Npctype_Main;
guild 	= GIL_NONE;
level 	= 12;
voice 	= 7;
id 		= 4001;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 30;
attribute[ATR_MANA_MAX] = 50;
attribute[ATR_MANA] = 50;
attribute[ATR_HITPOINTS_MAX] = 180;
attribute[ATR_HITPOINTS] = 180;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 0,"Hum_Head_Psionic",15, 0,NOV_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_2H,7);

//----------Ekwipunek----------
EquipItem		(self, ItMw_2H_Staff_01);
CreateInvItems  (self,ItMijoint_1,1);
CreateInvItems  (self,ItMi_Amulet_Psi_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_4001;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_4001 ()
{
TA_Pray (06,00,18,00,"OP1");
TA_Pray (18,00,06,00,"OP1");
};

FUNC VOID Rtn_camp_4001 ()
{
TA_Pray (06,00,18,00,"");
TA_Pray (18,00,06,00,"");
};