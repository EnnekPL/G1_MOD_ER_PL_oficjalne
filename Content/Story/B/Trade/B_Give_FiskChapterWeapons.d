func void B_Give_FiskChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Stt_311_Fisk);
	
	//-------- Nahkampfwaffen --------
	CreateInvItems	(self, ItWr_HistoryOfKhorinis,1);
	CreateInvItems	(self, ItWr_KeyToMyrtana,1);
	CreateInvItem (npc,ItMw_1H_Sword_Old_01);
	CreateInvItem (npc,ItMw_1H_Sword_Old_01);// 	
	CreateInvItem (npc,ItMw_1H_Sword_Short_01);//
	CreateInvItem (npc,ItMw_1H_Sword_Short_02);// 	
	CreateInvItem (npc,ItMw_1H_Sword_Short_03);//
	CreateInvItem (npc,ItMw_1H_Sword_Short_04);// 	
	CreateInvItem (npc,ItMw_1H_Sword_Short_05);//
	CreateInvItem (npc,ItMw_1H_Sword_Short_05);
	CreateInvItem (npc,Miecz1H11);//zatwierdzone, zgodne z balansem
	CreateInvItems (npc,ItMiNugget,200);
	
	//2h lekkie er 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	CreateInvItem (npc,ItMw_2H_Sword_Old_02);
	CreateInvItem (npc,ItMw_2H_Axe_Big_03);
	CreateInvItem (npc,ItMw_2H_Sword_New_01);
	
	CreateInvItem (npc,ItMw_Dagger);
	CreateInvItem (npc,ItMw_Dagger2);
	CreateInvItem (npc,ItMw_Dagger3);
	//CreateInvItem (npc,ItMw_Addon_BanditTrader);
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
    
};

func void B_Give_FiskChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Stt_311_Fisk);
	
	//-------- Nahkampfwaffen --------
	CreateInvItems	(self, ItKeLockpick,20);
	CreateInvItem (npc,ItMw_1H_Sword_01);
	CreateInvItem (npc,ItMw_1H_Sword_02);
	CreateInvItem (npc,ItMw_1H_Sword_03);
	CreateInvItem (npc,ItMw_1H_Sword_04);
	CreateInvItem (npc,ItMw_1H_Sword_04);
	CreateInvItems (npc,ItMiNugget,170); 
	
	//2h er lekkie 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_04);
	CreateInvItem (npc,ItMw_2H_Sword_New_02);
	
	
	//-------- Fernkampfwaffen --------
	// quest!!
	CreateInvItem (npc,JakBylPosazekPoAngielskuDoZCholery);
	//-------- Munition --------
  
};

func void B_Give_FiskChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Stt_311_Fisk);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Warhammer_01); 
	CreateInvItem (npc,ItMw_1H_Warhammer_02); 
	CreateInvItem (npc,ItMw_1H_Warhammer_03); 
	
	CreateInvItems	(self, ItKeLockpick,30);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_01);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_02);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	CreateInvItem	(npc,	ItMw_1H_Sword_Broad_01);
	//er 1.4.5 v7 ch3
	CreateInvItem	(npc,	ItMw_2H_Sword_New_02); 
	CreateInvItem	(npc,	ItMw_2H_Sword_New_03);
	CreateInvItem	(npc,	ItMw_2h_Sword_Solid_01);
	
	CreateInvItems (npc,ItMiNugget,300); 
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
  CreateInvItems	(self, ItKeLockpick,30);
};


