instance WD_7040_Trup (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trup";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	2;
	voice 		=	4;
	id 			=	7040;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",78 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,4);
	CreateInvItems (self, ItMi_Stuff_Plate_01,1);
	CreateInvItems (self, itminugget,25);
	CreateInvItems (self, ItFoSoupFish2,1);
	CreateInvItems (self, Gold01,2);
	CreateInvItems (self, Pr_Wegiel,5);
	CreateInvItems (self, ItKeLockpick,4);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7040;
};

FUNC VOID Rtn_start_7040 ()
{
	TA_Stay		(20,40,07,40,"ER_WD_TRUP_01");
	TA_Stay		(07,40,20,40,"ER_WD_TRUP_01");
};

instance WD_7041_Trup (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trup";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	2;
	voice 		=	4;
	id 			=	7041;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 5, 1,VLK_ARMOR_L);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,4);
	CreateInvItems (self, ItMi_Stuff_Barbknife_01,1);
	CreateInvItems (self, ItMi_Stuff_Cup_01,2);
	CreateInvItems (self, Pr_SztabkaMagicznejStali,2);
	CreateInvItems (self, itminugget,5);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7041;
};

FUNC VOID Rtn_start_7041 ()
{
	TA_Stay		(20,40,07,40,"ER_WD_TRUP_02");
	TA_Stay		(07,40,20,40,"ER_WD_TRUP_02");
};

instance WD_7042_Topielec (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Topielec";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	2;
	voice 		=	4;
	id 			=	7042;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110 , 1,SFB_ARMOR_L);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFo_MoleratWS,4);
	CreateInvItems (self, ItFo_Honey,1);
	CreateInvItems (self, itminugget,30);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7042;
};

FUNC VOID Rtn_start_7042 ()
{
	TA_Stay		(20,40,07,40,"ER_WD_TOPIELEC_01");
	TA_Stay		(07,40,20,40,"ER_WD_TOPIELEC_01");
};

instance WD_7043_Topielec (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Topielec";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	2;
	voice 		=	4;
	id 			=	7043;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 5;
	attribute[ATR_DEXTERITY]	= 5;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110 , 1,ORG_ARMOR_L);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, JajoSca1,3);
	CreateInvItems (self, ItFoNalewkaApple,2);
	CreateInvItems (self, itminugget,30);
	CreateInvItems (self, Pr_SztabkaZlota,1);
	CreateInvItems (self, ItMw_1H_Mace_02,1);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7043;
};

FUNC VOID Rtn_start_7043 ()
{
	TA_Stay		(20,40,07,40,"ER_WD_TOPIELEC_02");
	TA_Stay		(07,40,20,40,"ER_WD_TOPIELEC_02");
};

instance WD_7044_Bandit (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schlaeger;
	Npctype =				Npctype_Main;
	guild =						GIL_DMB;      
	level =						15;
	
	voice =						6;
	id =							7044;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		65;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	230;
	attribute[ATR_HITPOINTS] =		230;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, NON_WOLF_ARMOR);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,5);		
	CreateInvItems(self, ItMiNugget, 40);
	CreateInvItems (self, ItFoRice, 7);
	CreateInvItems (self, ItFoBooze, 4);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 25);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7044;
	
	
};

FUNC VOID Rtn_start_7044 ()
{
	TA_SitCampfire		(00,00,08,00,"ER_WD_BANDIT_01");
	TA_SitCampfire		(08,00,00,00,"ER_WD_BANDIT_01");
};
	
instance WD_7045_DeadHunter (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Martwy myœliwy";
	Npctype =				Npctype_Main;
	guild =					GIL_NONE;      
	level =					6;
	
	voice =					6;
	id =					7045;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		22;
	attribute[ATR_DEXTERITY] =		22;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, HUN_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItems (self, ItAt_Claws_01,4);
	CreateInvItems (self, ItAt_Wolf_01,2);
	CreateInvItems (self, ItAt_Dzik_01,1);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 25);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7045;
};

FUNC VOID Rtn_start_7045 ()
{
	TA_Stay		(00,00,08,00,"SPAWN_OW_MOLERATL__PSIWOOD_01");
	TA_Stay		(08,00,00,00,"SPAWN_OW_MOLERATL__PSIWOOD_01");
};

instance WD_7046_GhostKinggardist (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Duch królewskiego stra¿nika";
	Npctype =				Npctype_Main;
	guild =					GIL_MEATBUG;      
	level =					16;
	flags = 2;
	voice =					6;
	id =					7046;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, GRD_ARMOR_I);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,8);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, Pr_SztabkaZlota, 2);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7046;
};

FUNC VOID Rtn_start_7046 ()
{
	TA_Stay		(00,00,08,00,"ER_WD_GHOST_01");
	TA_Stay		(08,00,00,00,"ER_WD_GHOST_01");
};

FUNC VOID Rtn_away_7046 ()
{
	TA_Stay		(00,00,08,00,"");
	TA_Stay		(08,00,00,00,"");
};
//quest character
instance WD_7047_DeadNovize (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Martwy Nowicjusz";
	Npctype =				Npctype_Main;
	guild =					GIL_NONE;      
	level =					6;
	
	voice =					6;
	id =					7047;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		22;
	attribute[ATR_DEXTERITY] =		22;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1 , 1,"Hum_Head_Psionic", 30,  1, NOV_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	CreateInvItem (self, ItMi_BloodyShirt);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7047;
};

FUNC VOID Rtn_start_7047 ()
{
	TA_Stay		(00,00,08,00,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	TA_Stay		(08,00,00,00,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
};

//quest character
instance WD_7048_DeadNovize (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Martwy Nowicjusz";
	Npctype =				Npctype_Main;
	guild =					GIL_NONE;      
	level =					6;
	
	voice =					6;
	id =					7048;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		22;
	attribute[ATR_DEXTERITY] =		22;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_FatBald", 29 ,  2, NOV_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItMw_1H_Hatchet_01, 1);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	CreateInvItem (self, ItFoSoup);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7048;
};

FUNC VOID Rtn_start_7048 ()
{
	TA_Stay		(00,00,08,00,"ER_WD_QUEST_TRUP_02");
	TA_Stay		(08,00,00,00,"ER_WD_QUEST_TRUP_02");
};

instance WD_7049_BanditGhost (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Duch Krwawego Rubena";
	Npctype =				Npctype_Main;
	guild =						GIL_NONE;      
	level =						40;
	
	voice =						6;
	id =							7049;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		135;
	attribute[ATR_DEXTERITY] =		135;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, BLIZNA_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_2H,8);
	

	//-------- inventory --------   
	EquipItem		(self, ItMw_2H_Axe_Old_02);
	
	CreateInvItems (self, Pr_SztabkaZlota, 10);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	CreateInvItem (self, ItMi_GhostsBagSpecial);
	CreateInvItems (self, Pr_SztabkaMagicznejStali,4);
	CreateInvItems (self, Pr_SztabkaCiemnejStali,4);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7049;
};

FUNC VOID Rtn_start_7049 ()
{
	TA_Stay		(00,00,08,00,"GHOST_OLDBANDIT");
	TA_Stay		(08,00,00,00,"GHOST_OLDBANDIT");
};

instance WD_7052_RubensBandit (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Bandzior Rubena";
	Npctype =				Npctype_Main;
	guild =						GIL_NONE;      
	level =						30;
	
	voice =						8;
	id =							7052;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, NON_SHADOWBEAST_ARMOR);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,5);
	

	//-------- inventory --------   
	EquipItem		(self, ItMw_1H_Sword_04);
	CreateInvItems (self, Pr_SztabkaZlota, 3);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7052;
};

FUNC VOID Rtn_start_7052 ()
{
	TA_Stay		(00,00,08,00,"RUBEN_FRIEND1");
	TA_Stay		(08,00,00,00,"RUBEN_FRIEND1");
};

instance WD_7054_RubensBandit (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Bandzior Rubena";
	Npctype =				Npctype_Main;
	guild =						GIL_NONE;      
	level =						30;
	
	voice =						4;
	id =							7054;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 38, 2, NON_SHADOWBEAST_ARMOR);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,5);
	

	//-------- inventory --------   
	EquipItem		(self, ItMw_1H_Sword_04);                                 
	CreateInvItems (self, Pr_SztabkaZlota, 3);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7054;
};

FUNC VOID Rtn_start_7054 ()
{
	TA_Stay		(00,00,08,00,"RUBEN_FRIEND2");
	TA_Stay		(08,00,00,00,"RUBEN_FRIEND2");
};

instance NON_7055_Felgor (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Felgor ¯elazna Garota";
	Npctype =				Npctype_Main;
	guild =						GIL_NONE;      
	level =						30;
	flags =	2;
	voice =						4;
	id =							7055;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 38, 2, GRD_ARMOR_H2);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_2H,9);
	

	//-------- inventory --------   
	EquipItem		(self, Miecz2H1);                                 
	CreateInvItems (self, Pr_SztabkaZlota, 3);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7055;
};

FUNC VOID Rtn_start_7055 ()
{
	TA_Stay		(00,00,08,00,"GHOST_SPAWN_XT");
	TA_Stay		(08,00,00,00,"GHOST_SPAWN_XT");
};

FUNC VOID Rtn_nope_7055 ()
{
	TA_Stay		(00,00,08,00,"");
	TA_Stay		(08,00,00,00,"");
};