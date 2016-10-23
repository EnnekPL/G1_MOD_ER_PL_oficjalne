func void B_GiveRiordianChapter1Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,3);
	CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
	CreateInvItems (npc,ItFo_Potion_Health_02 ,2);
	CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,1);
	//------DOCS//////------------------
	CreateInvItems (npc,ItWr_AlchemySprintPotions ,1);
	CreateInvItems (npc,ItWr_AlchemyTimedPotions ,1);
	//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,3);

	
	CreateInvItems  (self,itmiflask,25);
};

func void B_GiveRiordianChapter2Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,3);
   
   CreateInvItems (npc,ItFo_Potion_Health_01 ,3);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,4);
   
   CreateInvItems (npc,ItFo_Potion_Water_01 ,15);
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,3);
   	//CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,1);

		//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,4);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,2);
	//CreateInvItems	(npc, ItFo_Potion_Water_01,10);
	//CreateInvItems	(npc, ItFo_Potion_Health_01,10);
	//CreateInvItems	(npc, ItFo_Potion_Health_02,10);
	CreateInvItems  (self,itmiflask,20);
};

func void B_GiveRiordianChapter3Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,1);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,4);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,2);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,1);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,5);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,1); 
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,2);	
   CreateInvItems (npc,ItFo_Potion_Haste_02 ,4);
   	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,1);
		//------DOCS//////------------------
	CreateInvItems (npc,ItWr_AlchemyPermPotions1 ,1);
	CreateInvItems (npc,ItWr_AlchemyPermPotions2 ,1);
	//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,4);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,7);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,7);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,5);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,3);
	CreateInvItems	(npc, ItFo_Potion_Water_01,22);
	//CreateInvItems	(npc, ItFo_Plants_RavenHerb_01,3);
	CreateInvItems	(npc, ItFo_Plants_mushroom_01,3);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,3);
	CreateInvItems	(npc, ItFo_FieldHerb,1);
	CreateInvItems	(npc, ItFo_MountainHerb,1);
	CreateInvItems	(npc, ItFo_FieldHerb,1);	
	CreateInvItems	(npc, ItFo_SeaHerb,1);	
	//CreateInvItems	(npc, ItFo_Plants_Flameberry_01,1);	
	
	CreateInvItems  (self,itmiflask,30);
};

func void B_GiveRiordianChapter4Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,1);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,3);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,6);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,4);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,6); 
	
    //CreateInvItems (npc,ItFo_Potion_Haste_01 ,20);	
    CreateInvItems (npc,ItFo_Potion_Haste_02 ,1); 
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,1);
	CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,1);
	//------DOCS//////------------------
	
	CreateInvItems (npc,ItWe_PrzepisMoleratSoup ,1);
	//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,5);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,5);
	CreateInvItems	(npc, ItFo_Potion_Water_01,20);
	//CreateInvItems	(npc, ItFo_Plants_RavenHerb_01,2);
	CreateInvItems	(npc, ItFo_Plants_mushroom_01,2);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,5);
	CreateInvItems	(npc, ItFo_FieldHerb,2);
	CreateInvItems	(npc, ItFo_MountainHerb,2);
	CreateInvItems	(npc, ItFo_FieldHerb,2);	
	CreateInvItems	(npc, ItFo_SeaHerb,2);	
	//CreateInvItems	(npc, ItFo_Plants_Flameberry_01,1);	
	
	CreateInvItems  (self,itmiflask,20);
};

func void B_GiveRiordianChapter5Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
   //CreateInvItems (npc,ItFo_Potion_Mana_01 ,1);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,2);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,5);
    
   //CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,5); 
	
    //CreateInvItems (npc,ItFo_Potion_Haste_01 ,25);	
	//CreateInvItems (npc,ItFo_Potion_Haste_02 ,15);
	CreateInvItems (npc,ItFo_Potion_Haste_03 ,5);
		//CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,5);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,1);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,2);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
		//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,8);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,12);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,8);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,5);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,8);
	CreateInvItems	(npc, ItFo_Potion_Water_01,20);
	//CreateInvItems	(npc, ItFo_Plants_RavenHerb_01,10);
	CreateInvItems	(npc, ItFo_Plants_mushroom_01,4);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,4);
	CreateInvItems	(npc, ItFo_FieldHerb,2);
	CreateInvItems	(npc, ItFo_MountainHerb,2);
	CreateInvItems	(npc, ItFo_FieldHerb,2);	
	CreateInvItems	(npc, ItFo_SeaHerb,2);	
	//CreateInvItems	(npc, ItFo_Plants_Flameberry_01,1);	
	//DOCS
	CreateInvItems (npc,ItWr_AlchemyPowerPotions ,1);
	
	CreateInvItems  (self,itmiflask,25);
};

func void B_GiveRiordianChapter6Potions ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDW_605_Riordian);
	
	//-------- POTIONS --------
	/*CreateInvItems (npc,ItFo_Potion_Mana_01 ,36);
    CreateInvItems (npc,ItFo_Potion_Mana_02 ,32);
    CreateInvItems (npc,ItFo_Potion_Mana_03 ,20);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,64);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,40);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,96); 
	
    CreateInvItems (npc,ItFo_Potion_Haste_01 ,96);	
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,48);
	CreateInvItems (npc,ItFo_Potion_Haste_03 ,24);	
		CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
		//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,3);
	CreateInvItems	(npc, ItFo_Potion_Water_01,10);
	//CreateInvItems	(npc, ItFo_Plants_RavenHerb_01,10);
	CreateInvItems	(npc, ItFo_Plants_mushroom_01,10);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,10);
	CreateInvItems	(npc, ItFo_FieldHerb,10);
	CreateInvItems	(npc, ItFo_MountainHerb,10);
	CreateInvItems	(npc, ItFo_FieldHerb,10);	
	CreateInvItems	(npc, ItFo_SeaHerb,10);	
	//CreateInvItems	(npc, ItFo_Plants_Flameberry_01,2);	*/
};

