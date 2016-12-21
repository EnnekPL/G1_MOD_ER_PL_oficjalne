func void B_Give_DarrionChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Club_01);
	CreateInvItem (npc,ItMw_1H_Sledgehammer_01);
	CreateInvItem (npc,ItMw_1H_Mace_Light_01);
	CreateInvItem (npc,ItMw_1H_Hatchet_01);
	CreateInvItem (npc,ItMw_1H_Nailmace_01);
	//1h lekkie
	CreateInvItems (npc,Miecz1H6,1);
	
	//2h lekkie er 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	CreateInvItem (npc,ItMw_2H_Sword_Old_02);
	CreateInvItem (npc,ItMw_2H_Axe_Big_03);
	CreateInvItem (npc,ItMw_2H_Sword_New_01);
	
	//CreateInvItem (npc,ItMw_Addon_BanditTrader);
	CreateInvItem (npc,ItMw_Dagger);
	CreateInvItem (npc,ItMw_Dagger2);
	//CreateInvItem (npc,ItMw_Dagger3);
	//-------- Fernkampfwaffen --------


	//-------- Munition --------
  	CreateInvItems (npc,ItAmArrow,100);
	CreateInvItems (npc,ItAmBolt,100);
	CreateInvItems (npc,ItMiNugget,150);
};

func void B_Give_DarrionChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
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
	CreateInvItems (npc,ItAmArrow,200);
	CreateInvItems (npc,ItAmBolt,200);
	CreateInvItems (npc,ItMiNugget,200);
	//-------- Plany kowalaskie --------
	CreateInvItem (npc,Plan1b); 
//	
//	CreateInvItem (npc,Plan2b); 

};

func void B_Give_DarrionChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Warhammer_01); 
	CreateInvItem (npc,ItMw_1H_Warhammer_02); 
	CreateInvItem (npc,ItMw_1H_Warhammer_03); 
	//er 1.4.5 v7 ch3
	CreateInvItem	(npc,	ItMw_2H_Sword_New_02); 
	CreateInvItem	(npc,	ItMw_2H_Sword_New_03);
	CreateInvItem	(npc,	ItMw_2h_Sword_Solid_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_New_05);
	//-------- Fernkampfwaffen --------

 
	//-------- Munition --------
	CreateInvItems (npc,ItAmArrow,400);
	CreateInvItems (npc,ItAmBolt,400);
	CreateInvItems (npc,ItMiNugget,250);
	//-------- Plany kowalaskie --------
	CreateInvItem (npc,Plan_Rapier); 
	
//	CreateInvItem (npc,Plan1c);
//	CreateInvItem (npc,Plan3b); 
//	CreateInvItem (npc,Plan4b); 
  
};

func void B_Give_DarrionChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_2H_Sword_Old_01); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_01);
	CreateInvItem (npc,ItMw_2H_Sword_Light_02); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_03); 
	CreateInvItems (npc,ItAmArrow,800);
	CreateInvItems (npc,ItAmBolt,800);
	CreateInvItems (npc,ItMiNugget,345);
	//-------- Fernkampfwaffen --------
	CreateInvItem 	(npc,	Miecz1H_P_1); 
 
	//-------- Munition --------
  
	//plany kowalskie 
	CreateInvItem (npc,Plan3b); 
};

func void B_Give_DarrionChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_2H_Sword_Light_04); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_05); 
	CreateInvItem (npc,ItMw_2H_Sword_01); 
	CreateInvItem (npc,ItMw_2H_Sword_02); 
	CreateInvItem (npc,ItMw_2H_Sword_03); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_01); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_02); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_03); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_04); 

	CreateInvItems (npc,ItMiNugget,1000);
	CreateInvItems (npc,ItAmArrow,800);
	CreateInvItems (npc,ItAmBolt,400);
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
//	CreateInvItem (npc,Plan5b); 
//	CreateInvItem (npc,Plan5);
//	CreateInvItem (npc,Plan5c); 
//	CreateInvItem (npc,Plan7b); 
//	CreateInvItem (npc,Plan8); 
	
	CreateInvItem 	(npc,	Miecz1H_P_2); 
	CreateInvItem 	(npc,	Axe1H_P_1);
	CreateInvItem 	(npc,	Miecz1H_P_3);	
  
};

func void B_Give_DarrionChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	
	CreateInvItems (npc,ItMiNugget,550);
	//-------- Fernkampfwaffen --------
	

	//-------- Munition --------
  
  CreateInvItem (npc,Plan7b); 
};

