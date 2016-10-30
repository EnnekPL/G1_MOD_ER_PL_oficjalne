

func void B_Story_BauRebellion ()
{
	// VAR
	Mod_Story_RunRebelInNC = TRUE;
	
	// LEFTY / RICELORD
	Npc_ExchangeRoutine (BAU_900_Ricelord,"rebel");
	Npc_ExchangeRoutine (ORG_844_Lefty,"rebel");
	
	// GUARDIAN OF STORAGE
	Npc_ExchangeRoutine (Org_846_Schlaeger,"rebel");
	
	//GUARDIAN OF HOUSE
	Npc_ExchangeRoutine (Org_845_Schlaeger,"rebel");
	
	//GUARDIANS OF HOUSE - INSIDE
	var c_npc stronnik1; stronnik1 = Hlp_GetNpc (BAU_908_Bauer);
	stronnik1.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik1,"rebel");
	
	var c_npc stronnik2; stronnik2 = Hlp_GetNpc (BAU_902_Pock);
	//stronnik2.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik2,"rebel");
	
	//GUARDIAST OF STORAGE - ENTRANCE
	var c_npc stronnik3; stronnik3 = Hlp_GetNpc (BAU_920_Bauer);
	stronnik3.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik3,"rebel");
	
	var c_npc stronnik4; stronnik4 = Hlp_GetNpc (BAU_922_Bauer);
	stronnik4.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik4,"rebel");
	
	var c_npc stronnik5; stronnik5 = Hlp_GetNpc (BAU_923_Bauer);
	stronnik5.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik5,"rebel");
	
	var c_npc stronnik6; stronnik6 = Hlp_GetNpc (BAU_924_Bauer);
	stronnik6.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik6,"rebel");
	
	var c_npc stronnik7; stronnik7 = Hlp_GetNpc (BAU_927_Bauer);
	stronnik7.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik7,"rebel");
	
	// REBELIANTS
	var c_npc rebeliant916; rebeliant916 = Hlp_GetNpc (BAU_916_Bauer);
	rebeliant916.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant916,"rebel");
	
	var c_npc rebeliant907; rebeliant907 = Hlp_GetNpc (BAU_907_Bauer);
	rebeliant907.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant907,"rebel");

	var c_npc rebeliant928; rebeliant928 = Hlp_GetNpc (BAU_928_Bauer);
	rebeliant928.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant928,"rebel");
	
	var c_npc rebeliant904; rebeliant904 = Hlp_GetNpc (BAU_904_Bauer);
	rebeliant904.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant904,"rebel");
	
	var c_npc rebeliant905; rebeliant905 = Hlp_GetNpc (BAU_905_Bauer);
	rebeliant905.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant905,"rebel");
	
	var c_npc rebeliant914; rebeliant914 = Hlp_GetNpc (BAU_914_Bauer);
	rebeliant914.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant914,"rebel");
	
	var c_npc rebeliant915; rebeliant915 = Hlp_GetNpc (BAU_915_Bauer);
	rebeliant915.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant915,"rebel");
	
	var c_npc rebeliant917; rebeliant917 = Hlp_GetNpc (BAU_917_Bauer);
	rebeliant917.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant917,"rebel");
	
	var c_npc rebeliant919; rebeliant919 = Hlp_GetNpc (BAU_919_Bauer);
	rebeliant919.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant919,"rebel");
	
	var c_npc rebeliant929; rebeliant929 = Hlp_GetNpc (BAU_929_Bauer);
	rebeliant929.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant929,"rebel");
	
	var c_npc rebeliant930; rebeliant930 = Hlp_GetNpc (BAU_930_Bauer);
	rebeliant930.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant930,"rebel");
	
	// MGLISTY
	var c_npc foggy; foggy = Hlp_GetNpc (BAU_921_Bauer);
	Npc_ExchangeRoutine (foggy,"rebel");
	
	var c_npc bandit01; bandit01 = Hlp_GetNpc (Org_834_Organisator);
	Npc_ExchangeRoutine (bandit01,"rebel");
};
