instance GRD_2601_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 22;
voice = 1;
id = 2601;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 105;
	attribute[ATR_DEXTERITY] 	= 105;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",103, 1,GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_03_Z);
CreateInvItems  (self,itminugget,150);
CreateInvItems  (self,ItAmBolt,50);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2601;
};
FUNC VOID Rtn_start_2601 ()
{
	TA_Smoke	(01,00,13,00,	"FMC_HUT11_OUT");
	TA_Smoke	(13,00,01,00,	"FMC_HUT11_OUT");
};

instance GRD_2602_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 22;
voice = 1;
id = 2602;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 105;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 42,1,GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,200);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------jsnn jsasas
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2602;
};
FUNC VOID Rtn_start_2602 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_HUT07_OUT");
	TA_GuardPalisade	(13,00,01,00, "FMC_HUT07_OUT");
};

instance GRD_2603_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 35;
voice = 1;
id = 2603;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 42,  1,GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,200);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2603;
};
FUNC VOID Rtn_start_2603 ()
{
	TA_Smoke	(01,00,13,00,	"FMC_HUT04_OUT");
	TA_Smoke	(01,00,13,00,	"FMC_HUT04_OUT");	
};

instance GRD_2604_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2604;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,250);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2604;
};
FUNC VOID Rtn_start_2604 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_PATH07");
	TA_GuardPalisade	(13,00,01,00, "FMC_PATH07");
};

instance GRD_2605_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2605;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,100);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2605;
};
FUNC VOID Rtn_start_2605 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_ENTRANCE");
	TA_GuardPalisade	(13,00,01,00, "FMC_ENTRANCE");
};

instance GRD_2606_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2606;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,100);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2606;
};
FUNC VOID Rtn_start_2606 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_PATH02");
	TA_GuardPalisade	(13,00,01,00, "FMC_PATH02");
};


instance GRD_2607_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2607;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,100);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2607;
};
FUNC VOID Rtn_start_2607 ()
{
	TA_SitAround	(01,00,13,00, "FMC_HUT08_IN");
	TA_SitAround	(13,00,01,00, "FMC_HUT08_IN");
};


instance GRD_2608_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2608;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,100);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2608;
};
FUNC VOID Rtn_start_2608 ()
{
	TA_SitAround	(01,00,13,00, "FMC_HUT05_OUT");
	TA_SitAround	(13,00,01,00, "FMC_HUT05_OUT");
};

instance GRD_2609_Gardist (Npc_Default)
{
//----------Info ogolne----------
name = name_Gardist;
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 1;
id = 2609;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,itminugget,100);
CreateInvItems  (self,ItAmBolt,200);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2609;
};
FUNC VOID Rtn_start_2609 ()
{
	TA_SitAround	(01,00,13,00, "FMC_PATH13");
	TA_SitAround	(13,00,01,00, "FMC_PATH13");
};

instance Stt_2610_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=	NPCTYPE_AMBIENT	;
	guild 		=		GIL_STT;
	level 		=		10;

	
	voice 		=		12;
	id 			=		2610;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic",94 ,  1, STT_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);	
		
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_01);
	CreateInvItems	(self, ItAmArrow, 20);
	CreateInvItem	(self, ItKeLockpick);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2610;
};

FUNC VOID Rtn_start_2610 ()	//kocioł
{
	TA_PickOre	 (0,00,18,00,  "FMC_ORE_04");
	TA_SitAround (18,00,00,00, "FMC_HUT01_IN");
};

instance Stt_2611_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=	NPCTYPE_AMBIENT	;
	guild 		=		GIL_STT;
	level 		=		10;

	
	voice 		=		12;
	id 			=		2611;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic",95 ,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);	
		
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_01);
	CreateInvItems	(self, ItAmArrow, 20);
	CreateInvItem	(self, ItKeLockpick);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2611;
};

FUNC VOID Rtn_start_2611 ()	//kocioł
{
	TA_PickOre	 (0,00,18,00,  "FMC_HUT03_OUT");
	TA_SitAround (18,00,00,00, "FMC_HUT03_IN");
};