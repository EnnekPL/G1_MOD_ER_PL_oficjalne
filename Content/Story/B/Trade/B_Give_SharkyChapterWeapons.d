func void B_Give_SharkyChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Club_01);
	CreateInvItem (npc,ItMw_1H_Poker_01);
	CreateInvItem (npc,ItMw_1H_Sickle_01);
	CreateInvItem (npc,ItMw_1H_Sledgehammer_01);
	CreateInvItem (npc,ItMw_1H_Mace_Light_01);
	CreateInvItem (npc,ItMw_1H_Hatchet_01);
	CreateInvItem (npc,ItMw_1H_Nailmace_01);
	CreateInvItem (npc,ItMw_1H_Scythe_01);
	CreateInvItem (npc,ItMw_1H_Axe_Old_01);
	//	CreateInvItem (npc,ItMw_Dagger);
	//	CreateInvItem (npc,ItMw_Dagger2);
	CreateInvItem (npc,ItMw_Dagger3);
	//CreateInvItem (npc,ItMw_Addon_BanditTrader);
	
	//2h lekkie er 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	CreateInvItem (npc,ItMw_2H_Sword_Old_02);
	CreateInvItem (npc,ItMw_2H_Axe_Big_03);
	CreateInvItem (npc,ItMw_2H_Sword_New_01);
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
  	CreateInvItems (npc,ItMiNugget,130);
	CreateInvItems	(npc, ItKeLockpick,10);
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,3);
	CreateInvItems  (self,itmiflask,100);
};

func void B_Give_SharkyChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	
	CreateInvItem (npc,ItMw_1H_Axe_01);
	CreateInvItem (npc,ItMw_1H_Mace_01);
	CreateInvItem (npc,ItMw_1H_Mace_02);
	CreateInvItem (npc,ItMw_1H_Mace_03);
	CreateInvItem (npc,ItMw_1H_Mace_04);
	CreateInvItem (npc,ItMw_1H_Mace_War_01);
	CreateInvItem (npc,ItMw_1H_Mace_War_02);
	CreateInvItem (npc,ItMw_1H_Mace_War_03);
	//2h er lekkie 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_04);
	CreateInvItem (npc,ItMw_2H_Sword_New_02);
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,3);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
	CreateInvItems (npc,ItFo_SeaHerb ,2);
	CreateInvItems (npc,ItFo_ForestHerb ,2);
	CreateInvItems (npc,ItFo_Konfitura ,2);
	CreateInvItems  (self,itmiflask,30);
	CreateInvItems	(npc, ItKeLockpick,20);
	CreateInvItems (npc,ItMiNugget,150);
};

func void B_Give_SharkyChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Warhammer_01);
	CreateInvItem (npc,ItMw_1H_Warhammer_02);
	CreateInvItem (npc,ItMw_1H_Warhammer_03);
	CreateInvItem (npc,ItMw_1H_Axe_02);
	//er 1.4.5 v7 ch3
	CreateInvItem	(npc,	ItMw_2H_Sword_New_02); 
	CreateInvItem	(npc,	ItMw_2H_Sword_New_03);
	CreateInvItem	(npc,	ItMw_2h_Sword_Solid_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_New_05);
	//-------- Fernkampfwaffen --------
	
 	//-------- Munition --------
  	CreateInvItems (npc,ItMiNugget,300);
	CreateInvItems	(npc, ItKeLockpick,30);
	CreateInvItems  (self,itmiflask,30);
};

func void B_Give_SharkyChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_2H_Axe_Old_02);
	CreateInvItem (npc,ItMw_2H_Axe_Old_01);
	CreateInvItem (npc,ItMw_2H_Axe_light_01); // Kapitel 5 und 6 zusammengefasst
	CreateInvItem (npc,ItMw_2H_Axe_light_02);
	CreateInvItems (npc,ItMiNugget,250);
	CreateInvItems	(npc, ItKeLockpick,20);
	//-------- Fernkampfwaffen --------
	CreateInvItems  (self,itmiflask,30);
	//-------- Munition --------
  CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
};

func void B_Give_SharkyChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_2H_Axe_light_01); // Kapitel 5 und 6 zusammengefasst
	CreateInvItem (npc,ItMw_2H_Axe_light_02);
	CreateInvItem (npc,ItMw_2H_Axe_light_03);
	CreateInvItem (npc,ItMw_2H_Axe_Heavy_01);
	CreateInvItem (npc,ItMw_2H_Axe_Heavy_02);
	CreateInvItem (npc,ItMw_2H_Axe_Heavy_03);
	CreateInvItem (npc,ItMw_2H_Axe_Heavy_04);
	CreateInvItems (npc,ItMiNugget,400);
	CreateInvItems	(npc, ItKeLockpick,10);
	CreateInvItem 	(npc,	Miecz1H_P_1); 
	CreateInvItem 	(npc,	Miecz1H_P_2); 
	//-------- Fernkampfwaffen --------
	CreateInvItems  (self,itmiflask,30);
	//-------- Munition --------
  
};

func void B_Give_SharkyChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------

	CreateInvItems (npc,ItMiNugget,270);
	CreateInvItems  (self,itmiflask,30);
	//-------- Fernkampfwaffen --------
	

	CreateInvItem 	(npc,	Axe1H_P_1);
	CreateInvItem 	(npc,	Miecz1H_P_3);	
	//-------- Munition --------
  CreateInvItem (npc,Plan7b); 
};

