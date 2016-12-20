instance NON_3929_Davor (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Davor";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 25;
voice = 9;
id = 3929;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 80;
attribute[ATR_DEXTERITY] = 80;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 38,  1, NON_LEATHER_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Broad_02);
EquipItem		(self, ItRw_Bow_War_02_Z);
CreateInvItems  (self, ItAmArrow, 50);
CreateInvItems  (self, ItKeLockpick,1);		
CreateInvItems  (self, ItMiNugget, 30);
CreateInvItems  (self, ItFoRice,8);
CreateInvItems  (self, ItFoBooze, 3);
CreateInvItems  (self, ItLsTorch, 2);
CreateInvItems  (self, ItFo_Potion_Health_01, 10);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3929;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3929 ()
{
TA_SitCampfire (21,00,17,00,"OW_DAVORS_CAMP");
TA_Boss (17,00,19,00,"OW_DAVOR_BOSS");
TA_Smoke (19,00,21,00,"OW_DAVORS_CAMP");
};

FUNC VOID Rtn_lowcy_3929 ()
{
TA_SitCampfire (06,00,15,00,"HUNTERS_CAMP2");
TA_workmob (15,00,17,22,"HUNTERS_WORK1");
TA_boss (17,22,19,00,"HUNTERS_VIEWPOINT");
TA_SitCampfire (19,00,06,00,"HUNTERS_CAMP2");
};

FUNC VOID Rtn_cavalorn_3929 ()
{
TA_PracticeBow (06,00,11,00,"OLDSAWHUT_PRACTICE_BOW");
TA_workmob (11,00,13,15,"OW_SAWHUT_MOLERAT_MOVEMENT5");
TA_HerbAlchemy (13,15,17,30,"OLDSAWHUT_WORK2");
TA_SitAround (17,30,06,00,"OW_SAWHUT_BENCH2");
};