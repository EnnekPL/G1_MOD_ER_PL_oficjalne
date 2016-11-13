instance ArmorMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"ARMOR MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7890;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//kopacze, robotnicy
	CreateInvItem	(self, SFB_ARMOR_M);    
	CreateInvItem	(self, HEREK_ARMOR);  
	CreateInvItem	(self, GRAVO_ARMOR);  
	CreateInvItem	(self, SFB_ARMOR_DARK);  
	CreateInvItem	(self, VLK_ARMOR_H);  
	//nowicjusze ognia 
	CreateInvItem	(self, NOV2_ARMOR_L); 
	CreateInvItem	(self, NOV2_ARMOR_M); 
	//myœliwi
	CreateInvItem	(self, NON_HunterArmor_01); 
	CreateInvItem	(self, NON_HunterArmor_02); 
	CreateInvItem	(self, GRD_ARMOR_M); 
	CreateInvItem	(self, GRD_ARMOR_M); 
	CreateInvItem	(self, NON_SHADOWBEAST_ARMOR); 
	CreateInvItem	(self, GRD_ARMOR_M); 
	//³owcy orków i rozporków
	CreateInvItem	(self, NON_ORCHUNTERARMOR_01); 
	
	CreateInvItem	(self, GRD_ARMOR_H); 
	CreateInvItem	(self, EBR_ARMOR_L); 
	
	CreateInvItem	(self, OldArmor); 
	CreateInvItem	(self, DarkArmor_v1); 
	CreateInvItem	(self, DarkArmor_v2); 
	CreateInvItem	(self, DarkArmor_v2); 
	//piraci
	CreateInvItem	(self, GORDON_ARMOR); 
	CreateInvItem	(self, Pirat2Armor); 
	CreateInvItem	(self, PiratArmor); 
	//bandyci
	CreateInvItem	(self, BAU_ARMOR_M);
	CreateInvItem	(self, BAU_ARMOR_L);
	CreateInvItem	(self, BAU_ARMOR_H);
	CreateInvItem	(self, QUENTIN_ARMOR_H);
	
	CreateInvItem	(self, Helmet2);
	
	CreateInvItem	(self, NON_LEATHER_ARMOR_L);
	
};

instance PotionMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"POTION MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7891;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//tymczasowe
	CreateInvItems	(self, ItFo_PotionTime_Strength_01,99);    
	CreateInvItems	(self, ItFo_PotionTime_Dex_01,99);  
	CreateInvItems	(self, ItFo_PotionTime_Mana_01,99);  
	CreateInvItems	(self, ItFo_PotionTime_Master_01,99);   
	CreateInvItems	(self, ItFo_Potion_HealthTime_01,99);   
	
	CreateInvItems	(self, ItFo_Potion_Mana_04,99); 
	CreateInvItems	(self, ItFo_Potion_Health_04,99);  
};

instance FoodMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"FOOD MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7892;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//tymczasowe
	CreateInvItems	(self, ItFoCiosSztyletu,99);    
	CreateInvItems	(self, ItFoAbsynt,99);  
	CreateInvItems	(self, ItFoBimber,99);  
	CreateInvItems	(self, ItFoHoneyBeer,99);  
	CreateInvItems	(self, ItFoHoneyAlco,99);  
	CreateInvItems	(self, ItFoNalewkaPlants,99);  
	CreateInvItems	(self, ItFoNalewkaBerrys,99);  
	CreateInvItems	(self, ItFoCiosSztyletu,99);    
	CreateInvItems	(self, ItFoNalewkaApple,99);  
	CreateInvItems	(self, JajoSca2,99);  
	CreateInvItems	(self, JajoSca1,99);  
	CreateInvItems	(self, ItAt_CookCrawlerqueen,99);  
	CreateInvItems	(self, ItFo_Konfitura,99);  
	CreateInvItems	(self, ItFo_Honey,99);  
	CreateInvItems	(self, ItFo_Milk,99);  
	CreateInvItems	(self, ItFo_muttonLurker,99);  
	CreateInvItems	(self, ItFo_Sausage,99);  
	CreateInvItems	(self, ItFo_MoleratWS,99);  
	CreateInvItems	(self, ItFo_MoleratW,99);  	
	CreateInvItems	(self, ItFoChesseSoup,99);  
	CreateInvItems	(self, ItFoSoupFish4,99);  
	CreateInvItems	(self, ItFoSoupFish3,99);  
	CreateInvItems	(self, ItFoSoupFish2,99);  	
	CreateInvItems	(self, ItFoSoupFish1,99);  
	CreateInvItems	(self, ItFoMoleratSoup,99);  
	CreateInvItems	(self, ItFoScaSoup,99);  
};

instance QuestMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"QUEST MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7893;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//ch1
	CreateInvItem	(self, WhistlerSwordPlan);    
	CreateInvItem	(self, ItKe_DunegonKeyOC);
	CreateInvItem	(self, It_wodaswiecona);    
	CreateInvItem	(self, StoneOfKnowledge);
	CreateInvItem	(self, ZapiskiScattego);    
	CreateInvItem	(self, ItMi_EbrTips);
	CreateInvItem	(self, ItKe_Miguel);    
	CreateInvItem	(self, EBR_Ring1);	
	CreateInvItem	(self, EBR_Ring2);
	CreateInvItem	(self, EBR_Ring3);    
	CreateInvItem	(self, Bergs_Ring);
	CreateInvItem	(self, Skarb_ring1);    
	CreateInvItem	(self, Skarb_ring2);	
	CreateInvItem	(self, Skarb_cup1);    
	CreateInvItem	(self, Skarb_SwordGold);	
	CreateInvItem	(self, ItMi_SzwaczNote);
	CreateInvItem	(self, It_herbatkanakaca);    
	CreateInvItem	(self, JakBylPosazekPoAngielskuDoZCholery);
	CreateInvItem	(self, JeremiahMoonshine);    
	CreateInvItem	(self, Mis_KrysztalzKotla);
	CreateInvItem	(self, ItMi_Worek_Gwozdzie);    
	CreateInvItem	(self, Mis_PamietnikStarca);
	CreateInvItem	(self, foodlowcow);    
	CreateInvItem	(self, lukor_amulet);	
	CreateInvItem	(self, ItKe_Alex);    
	CreateInvItem	(self, ItCH1_ListaDlugowPatrosa);	
	CreateInvItem	(self, ItMi_TruciznaJaszczura);
	CreateInvItem	(self, ItMi_AnitdotumNaJad);    
	CreateInvItem	(self, Tokas_Sword);
	CreateInvItem	(self, ClawsRing);    
	CreateInvItem	(self, AlexCup);
	CreateInvItem	(self, ItMi_PancerzMil);	
	CreateInvItem	(self, egzekutor_killer);
	CreateInvItem	(self, DarkSect_Sword);    
	CreateInvItem	(self, BlueCrystal);
	CreateInvItem	(self, ClawsRing);    
	CreateInvItem	(self, ItWrWorldmap_Edit1);
	CreateInvItem	(self, ItWrWorldmap_Edit2);
	CreateInvItem	(self, ItWrWorldmap_Edit3);
	CreateInvItem	(self, StrangePotion);
	CreateInvItem	(self, SpecialWater);	
	CreateInvItem	(self, ItWr_LetterFromLutero);
	CreateInvItem	(self, KETPAL);    
	CreateInvItem	(self, It_DavorsBow);
	CreateInvItem	(self, GoldenSword);    
	CreateInvItem	(self, JosepSamulet);
	//ch2
	CreateInvItem	(self, ItMi_Alchemy_Alcohol_02);
	CreateInvItem	(self, ItMis_FingersSecretBook);    
	CreateInvItem	(self, ItMis_RecipeSlepperBreath);
	CreateInvItem	(self, NotatkiAlchemika);    
	CreateInvItem	(self, It_OdtrutkaNaKaca);
	//ch3
	CreateInvItem	(self, OldMineList2);
	//ch4
	CreateInvItem	(self, Focus_Corristo);    
	CreateInvItem	(self, ItWrWorldmapDrax);	
	CreateInvItem	(self, ItMa_RuneBandit);
	CreateInvItem	(self, draxAmulet);    
	CreateInvItem	(self, ItMi_Listdraxa);
	CreateInvItem	(self, vartSword);
	CreateInvItem	(self, BigGear);	
	CreateInvItem	(self, Receptura_LekAva);
	CreateInvItem	(self, PiratKey01);    
	CreateInvItem	(self, ItFo_Potion_Clear);
	CreateInvItem	(self, WorldMap2Pirat);    
	CreateInvItem	(self, ItMis_PamietnikGrimesa1);
	CreateInvItem	(self, ItMis_PamietnikGrimesa2);
	CreateInvItem	(self, ItMis_PamietnikGrimesa3);
	CreateInvItem	(self, ItMis_PamietnikGrimesa4);
	CreateInvItem	(self, ItWr_RejestrWydobycia);	

};

instance BookMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"BOOK MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7894;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//ch1
	CreateInvItem	(self, ItWr_AlchemyPermPotions1);    
	CreateInvItem	(self, AlchemiaTrwaleWzomcnienia);
	CreateInvItem	(self, ItWr_AlchemyPermPotions2);    
	CreateInvItem	(self, ItWr_AlchemySprintPotions);
	CreateInvItem	(self, ItWr_AlchemyPowerPotions);    
	CreateInvItem	(self, ItWr_AlchemyTimedPotions);
	CreateInvItem	(self, ItWr_Seite3temple);    
	CreateInvItem	(self, RezepturenFish);	
	CreateInvItem	(self, ItWe_PrzepisMoleratSoup);
	CreateInvItem	(self, ItWe_PrzepisSnafSoup);    
	CreateInvItem	(self, przepis_zupaserowa);
	CreateInvItem	(self, ItWe_PrzepisCrawelSoup);    
	CreateInvItem	(self, ItWe_PrzepisScaSoup);	
	CreateInvItem	(self, ItWr_Mod_ReceptClarityMixture);    
	CreateInvItem	(self, ItWr_PrzepisOczyszczenieP2);	
	CreateInvItem	(self, ItWr_PrzepisOczyszczenieP3);
	CreateInvItem	(self, ItWr_SpiritsRecipte1);    
	CreateInvItem	(self, ItWr_SpiritsRecipte2);
	CreateInvItem	(self, ItWr_SpiritsRecipte3);    
	CreateInvItem	(self, ItWr_NiczymCiosSztyletu);
	CreateInvItem	(self, ItWr_FullRegeneratePotions);    
	/*CreateInvItem	(self, Plan8);
	CreateInvItem	(self, Plan7b);    
	CreateInvItem	(self, Plan7);	
	CreateInvItem	(self, Plan6);    
	CreateInvItem	(self, Plan5c);	
	CreateInvItem	(self, Plan5b);
	CreateInvItem	(self, Plan5);    
	CreateInvItem	(self, Plan4b);
	CreateInvItem	(self, Plan4);    
	CreateInvItem	(self, Plan3b);
	CreateInvItem	(self, Plan3);	
	CreateInvItem	(self, Plan2b);
	CreateInvItem	(self, Plan2);    
	CreateInvItem	(self, Plan1c);
	CreateInvItem	(self, Plan1b);    
	CreateInvItem	(self, Plan1);*/
	CreateInvItem	(self, ZdolnosciLowieckie);
	CreateInvItem	(self, ItWr_MenaceToDoyle);
	CreateInvItem	(self, ItWr_HallowedAvengerRepice);
};

instance MiscMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"ITEMS MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7895;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	
	//-------- inventory --------
	//ch1
	CreateInvItem	(self, Pr_Wegiel);    
	CreateInvItem	(self, Gold01);
	CreateInvItem	(self, Pr_SztabkaZlota);    
	CreateInvItem	(self, Pr_SztabkaMagicznejStali);
	CreateInvItem	(self, ItMi_bait_01);    
	CreateInvItem	(self, ItMi_bait_02);
	CreateInvItem	(self, LightEssence);    
	CreateInvItem	(self, ItAm_Quiver);	
	CreateInvItem	(self, ItMiHorn_01);
	CreateInvItem	(self, ItMi_Wood_02);    
	CreateInvItem	(self, ItMi_Wood_01);
	CreateInvItem	(self, ItMi_Saw);    
	CreateInvItem	(self, ItMiGwozdz);	
	CreateInvItem	(self, ItMiJoint_Plant);    
	CreateInvItem	(self, ItMiJoint_Mush);	
	CreateInvItem	(self, ItMiJoint_Honey);
	CreateInvItem	(self, ItMiJoint_Apple);    
	CreateInvItem	(self, ItMi_Tuton_4);
	CreateInvItem	(self, ItMi_Tuton_3);    
	CreateInvItem	(self, ItMi_Tuton_2);
	CreateInvItem	(self, ItMi_Tuton_1);    
	CreateInvItem	(self, ItMi_Tuton);
	CreateInvItem	(self, ItMi_runa0);    
	CreateInvItem	(self, ItMi_PaczkaMiecze1);	
	CreateInvItem	(self, ItMi_Alchemy_trucizna_03);    
	CreateInvItem	(self, ItMi_Alchemy_trucizna_02);	
	CreateInvItem	(self, ItMi_Alchemy_trucizna_01);
	CreateInvItem	(self, ItKe_BROKE_Lockpick);    
	CreateInvItem	(self, ItMi_IglaiNIC);
	CreateInvItem	(self, ItMi_MaterialSlice);    
	CreateInvItem	(self, ItMi_Bandaz60);
	CreateInvItem	(self, ItMi_Bandaz40);	
	CreateInvItem	(self, ItMi_Worek_Plants);
	CreateInvItem	(self, ItMi_Worek_Itemy);    
	CreateInvItem	(self, ItMi_Worek_Wytrychy);
	CreateInvItem	(self, ItMi_Worek_100);    
	CreateInvItem	(self, ItMi_Worek_30);
	CreateInvItem	(self, ItMi_Worek_10);
};
//tarcze strzeleckie 
prototype tarcza_strzelecka (C_NPC)
{
name = "Tarcza";
//attribute[0] = 1; attribute[1] = 1;
flags = NPC_FLAG_IMMORTAL;

	attribute[ATR_STRENGTH] =		1;
	attribute[ATR_DEXTERITY] =		1;
	attribute[ATR_MANA_MAX] =		1;
	attribute[ATR_MANA] =			1;
	attribute[ATR_HITPOINTS_MAX] =	3;
	attribute[ATR_HITPOINTS] =		3;
	//visual				=	"ItAr_Rune_42.3ds";
};

instance tarcza_strzelecka_01 (tarcza_strzelecka){};
instance tarcza_strzelecka_02 (tarcza_strzelecka){};
instance tarcza_strzelecka_03 (tarcza_strzelecka){};
instance tarcza_strzelecka_04 (tarcza_strzelecka){};
instance tarcza_strzelecka_05 (tarcza_strzelecka){};
