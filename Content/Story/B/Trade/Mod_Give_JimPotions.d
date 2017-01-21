func void B_GiveJimItemsCH1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
		//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,8);
	CreateInvItems (npc,ItArScrollThunderbolt,3);
	CreateInvItems (npc,ItArScrollIcecube,1);
	//--------- Boooks -------------
	CreateInvItem (npc,ItWr_Book_Circle_01);
	CreateInvItem (npc,ItWr_Book_Circle_02);
	CreateInvItem (npc,ItWr_Book_Circle_03);
	
	CreateInvItem (npc,Ring_der_Magie);
	
	//-------- POTIONS --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,6);
	CreateInvItems (npc,ItFo_Potion_Health_01 ,4);
	CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	CreateInvItems (npc,ItFo_Potion_Haste_01 ,10);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,2);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,1);
	//CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
		CreateInvItems (self,ItMi_Bandaz40,10);
		
		CreateInvItems  (self,itmiflask,12);
		CreateInvItems  (self,itminugget,150);
};

func void B_GiveJimItemsCH2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,7);
	CreateInvItems (npc,ItArScrollFirebolt,4);
	CreateInvItems (npc,ItArScrollThunderbolt,3);
	CreateInvItems (npc,ItArScrollIcecube,1);
	
	CreateInvItems (npc,ItArScrollChainLightning,2);
	CreateInvItems (npc,ItArScrollThunderball,4);
	CreateInvItems (npc,ItArScrollTrfWolf,2);
	CreateInvItems (npc,ItArScrollTrfLurker,3);
	CreateInvItems (npc,ItArScrollTrfScavenger,2);
	CreateInvItems (npc,ItArScrollTrfMolerat,2);
	CreateInvItems (npc,ItArScrollTrfCrawler,1);
		
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,4);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,4);
   
   CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,3);
   
   CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	
   CreateInvItems (npc,ItFo_Potion_Haste_02 ,5);
   	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,3);
	//CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,3);
	//CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,3);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,2);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
		CreateInvItems (self,ItMi_Bandaz40,20);
};

func void B_GiveJimItemsCH3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,12);
	CreateInvItems (npc,ItArScrollThunderbolt,2);
	CreateInvItems (npc,ItArScrollIcecube,2);
	CreateInvItems (npc,ItArScrollIceWave,1);
	//CreateInvItems (npc,ItArScrollTrfMeatbug,2);
	CreateInvItems (npc,ItArScrollTrfWaran,2);
	CreateInvItems (npc,ItArScrollTrfBloodfly,3);
	
		//-------- Ringe und Amulette --------
  	CreateInvItem (npc,Machtring);
	CreateInvItem (npc,Ring_der_Erleuchtung);
	CreateInvItem (npc,Gewandtheitsamulett);
	CreateInvItem (npc,Staerkeamulett);
	CreateInvItem (npc,Lebensamulett);
	CreateInvItem (npc,Amulett_der_Magie);
		//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,3);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,1);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,3);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,2);
   //CreateInvItems (npc,ItFo_Potion_Health_03 ,12); 
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,4);	
   CreateInvItems (npc,ItFo_Potion_Haste_02 ,6);
   	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,2);
	//CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,5);
	//CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,5);
	//CreateInvItems (npc,ItFo_PotionTime_Master_01 ,2);
	//CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,5);
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
	CreateInvItems	(npc, ItFo_FieldHerb,1);
	CreateInvItems	(npc, ItFo_MountainHerb,1);
	CreateInvItems	(npc, ItFo_FieldHerb,1);	
	CreateInvItems	(npc, ItFo_SeaHerb,1);	
	CreateInvItems	(npc, ItFo_Plants_Flameberry_01,1);	
		CreateInvItems (self,ItMi_Bandaz40,20);
};

func void B_GiveJimItemsCH4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
	//-------- Scrolls --------
	/*CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,8);
	CreateInvItems (npc,ItArScrollThunderbolt,10);
	CreateInvItems (npc,ItArScrollThunderball,10);
	CreateInvItems (npc,ItArScrollIcecube,4);
	CreateInvItems (npc,ItArScrollIceWave,4);

	CreateInvItems (npc,ItArScrollTrfMeatbug,2);
	CreateInvItems (npc,ItArScrollTrfWaran,3);
	CreateInvItems (npc,ItArScrollTrfSnapper,3);
	CreateInvItems (npc,ItArScrollTrfOrcdog,4);
	CreateInvItems (npc,ItArScrollTrfBloodfly,2);
	
	CreateInvItems (npc,ItArScrollFirebolt,10);
	CreateInvItems (npc,ItArScrollFireball,10);
		//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,48);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,32);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,20);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,64);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,40);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,24); 
	
    CreateInvItems (npc,ItFo_Potion_Haste_01 ,24);	
    CreateInvItems (npc,ItFo_Potion_Haste_02 ,12); 
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,6);
		CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,7);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,7);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,7);
	CreateInvItems (npc,ItFo_PotionTime_Master_01 ,71);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,7);
		CreateInvItems (self,ItMi_Bandaz40,20);*/
};

func void B_GiveJimItemsCH5 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
		//-------- Scrolls --------
	/*CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,10);

	CreateInvItems (npc,ItArScrollThunderbolt,10);
	CreateInvItems (npc,ItArScrollIcecube,10);
	CreateInvItems (npc,ItArScrollIceWave,8);

	CreateInvItems (npc,ItArScrollTrfMeatbug,2);
	CreateInvItems (npc,ItArScrollTrfSnapper,2);
	CreateInvItems (npc,ItArScrollTrfOrcdog,3);
	CreateInvItems (npc,ItArScrollTrfBloodfly,2);
	
	CreateInvItems (npc,ItArScrollDestroyUndead,35);
	CreateInvItems (npc,ItArScrollTrfShadowbeast,2);
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,18);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,16);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,10);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,32);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,20);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,48); 
	
    CreateInvItems (npc,ItFo_Potion_Haste_01 ,48);	
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,24);
	CreateInvItems (npc,ItFo_Potion_Haste_03 ,12);
		CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,10);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,10);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,12);
	CreateInvItems (npc,ItFo_PotionTime_Master_01 ,11);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,12);
		CreateInvItems (self,ItMi_Bandaz40,20);*/
};


