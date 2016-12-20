instance GRD_7001_Artegor (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Artegor";
	Npctype			= NPCTYPE_FRIEND;
guild = GIL_GRD;
level = 60;
voice = 8;
id = 7001;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 120;
attribute[ATR_DEXTERITY] = 120;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 450;
attribute[ATR_HITPOINTS] = 450;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 103,  2, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,10);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Long_04);
EquipItem		(self, ItRw_Crossbow_03_Z);
CreateInvItems  (self,ItAt_Wolf_01,1);
CreateInvItems  (self,VLK_ARMOR_M,1);
CreateInvItems  (self,ItFoApple,5);
CreateInvItems  (self,ItFoMutton,5);
CreateInvItems  (self,ItForice,2);
CreateInvItems  (self,ItFoWine,8);
CreateInvItems  (self,ItFo_Potion_Health_01,10);
CreateInvItems  (self,Schutzring_Feuer1,1);
CreateInvItems  (self,ItKeLockpick,5);
CreateInvItems  (self,ItMiHammer,1);
CreateInvItems  (self,ItMiLute,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_7001;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_7001 ()
{
TA_Guard (06,00,12,00,"ENTER1");
TA_Guard (12,00,06,00,"ENTER1");
};

FUNC VOID Rtn_distracted_7001 ()
{
TA_Stand (06,00,12,00,"BRO1");
TA_Stand (12,00,06,00,"BRO1");
};

FUNC VOID Rtn_distracted2_7001 ()
{
TA_Stand (06,00,12,00,"KOLEJKA1");
TA_Stand (12,00,06,00,"KOLEJKA1");
};

FUNC VOID Rtn_boss_7001 ()
{
TA_SitAround (06,00,12,00,"BARON2");
TA_SitAround (12,00,06,00,"BARON2");
};
FUNC VOID Rtn_stay_7001 ()
{
TA_Stay (06,00,12,00,"ENTER_CAMP");
TA_Stay (12,00,06,00,"ENTER_CAMP");
};