func void B_Give_HuanChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	//zużywalne
	CreateInvItems (npc,ItMiNugget,50);
	CreateInvItems	(npc, ItKeLockpick,7);
	//bronie (tylko najsłabsze)
	CreateInvItems 	(self, ItMw_1H_Mace_War_02,2);
	//2h lekkie er 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	//u sharkiego reszta
	//CreateInvItem (npc,ItMw_2H_Sword_Old_02);
	//CreateInvItem (npc,ItMw_2H_Axe_Big_03);
	//CreateInvItem (npc,ItMw_2H_Sword_New_01);
	//składniki
	CreateInvItems	(self,	ItMiSwordRaw,		10);
	CreateInvItems	(self,	ItMiSwordRawHot,	10);
	CreateInvItems	(self,	ItMiSwordBladeHot,	10);
	CreateInvItems	(self,	ItMiSwordBlade,		10);
	CreateInvItems	(self,	Gold01,		4);
	CreateInvItems	(self,	Pr_Wegiel,				 9);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,2);
	//plany
	CreateInvItems	(self,	Plan_Miecz1H15,		1);
};

func void B_Give_HuanChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems (npc,ItMiNugget,40);
	CreateInvItems	(npc, ItKeLockpick,3);
	
	CreateInvItems	(self,	Gold01,		4);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,2);
	
	CreateInvItems	(self,	Plan_BanditTrader,1);
	
	CreateInvItems	(self,	ItMw_2H_Axe_Big_05,1);
};

func void B_Give_HuanChapter3Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems (npc,ItMiNugget,55);
	CreateInvItems	(npc, ItKeLockpick,3);
	
	CreateInvItems	(self,	Gold01,		6);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 4);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,4);
  
};

func void B_Give_HuanChapter4Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItem (npc,ItMw_2H_Axe_Old_02);
	CreateInvItems (npc,ItMiNugget,50);
	CreateInvItems	(self,	Gold01,		13);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		10);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,5);
	CreateInvItems	(npc, 	ItMi_Alchemy_Syrianoil_01,2);
};

func void B_Give_HuanChapter5Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems  (npc,ItMiNugget,50);
	CreateInvItems	(self,	Gold01,		5);
	CreateInvItems	(self,	Pr_Wegiel,				 8);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		10);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,5);
  
};

func void B_Give_HuanChapter6Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems  (npc,ItMiNugget,60);
	CreateInvItems	(self,	Gold01,		7);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 5);
	CreateInvItems	(self,	Pr_SztabkaStali,		5);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,6); 
};

