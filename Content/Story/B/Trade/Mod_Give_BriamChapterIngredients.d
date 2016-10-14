
func void B_Give_BriamChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1601_Briam);
	CreateInvItems  (self,ItMi_Alchemy_Sulphur_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,3);
	CreateInvItems  (self,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (self,ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems  (self,ItMi_Alchemy_Moleratlubric_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Alcohol_01,4);
	CreateInvItems	(self, Pr_Wegiel, 5);
	CreateInvItems  (self,ItMi_Plants_Swampherb_01,3);
	CreateInvItems  (self,itmiflask,6);//kolby
	CreateInvItems  (self,ItMijoint_1,5);
	CreateInvItems  (self,ItMijoint_2,3);
	CreateInvItems  (self,ItMijoint_3,2);

};

func void B_Give_BriamChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1601_Briam);
	CreateInvItems  (self,itmiflask,10);//kolby
	CreateInvItems  (self,ItMijoint_1,5);
	CreateInvItems  (self,ItMijoint_2,3);
	CreateInvItems  (self,ItMijoint_3,2);
	CreateInvItems	(self, Pr_Wegiel, 2);
};

func void B_Give_BriamChapter3Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1601_Briam);

	CreateInvItems  (self,ItMi_Alchemy_Sulphur_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
	CreateInvItems  (self,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (self,ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems  (self,ItMi_Alchemy_Moleratlubric_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Alcohol_01,7);
	CreateInvItems	(self, Pr_Wegiel, 3);
	CreateInvItems  (self,itmiflask,4);//kolby
};

func void B_Give_BriamChapter4Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1601_Briam);
	CreateInvItems  (self,itmiflask,10);//kolby
	CreateInvItems  (self,ItMiNugget,50);//handel
	CreateInvItems  (self,ItMijoint_1,5);
	CreateInvItems  (self,ItMijoint_2,3);
	CreateInvItems  (self,ItMijoint_3,2);
	CreateInvItems	(self, Pr_Wegiel, 5);
};

func void B_Give_BriamChapter5Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1601_Briam);
	
	CreateInvItems  (self,ItMi_Alchemy_Sulphur_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (self,ItMi_Alchemy_Syrianoil_01,5);
	CreateInvItems  (self,ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems  (self,ItMi_Alchemy_Alcohol_01,9);
	CreateInvItems  (self,itmiflask,10);//kolby
	CreateInvItems	(self, Pr_Wegiel, 8);
};

