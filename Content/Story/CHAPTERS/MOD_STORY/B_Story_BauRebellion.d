

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
	var c_npc rufus; rufus = Hlp_GetNpc (Bau_903_Rufus);
	Npc_ExchangeRoutine (rufus,"rebel");
	
	var c_npc rebeliant916; rebeliant916 = Hlp_GetNpc (BAU_916_Bauer);
	rebeliant916.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant916,"rebel");
	rebeliant916.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant907; rebeliant907 = Hlp_GetNpc (BAU_907_Bauer);
	rebeliant907.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant907,"rebel");
	rebeliant907.aivar[AIV_MISSION3] = TRUE;

	var c_npc rebeliant928; rebeliant928 = Hlp_GetNpc (BAU_928_Bauer);
	rebeliant928.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant928,"rebel");
	rebeliant928.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant904; rebeliant904 = Hlp_GetNpc (BAU_904_Bauer);
	rebeliant904.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant904,"rebel");
	rebeliant904.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant905; rebeliant905 = Hlp_GetNpc (BAU_905_Bauer);
	rebeliant905.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant905,"rebel");
	rebeliant905.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant914; rebeliant914 = Hlp_GetNpc (BAU_914_Bauer);
	rebeliant914.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant914,"rebel");
	rebeliant914.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant915; rebeliant915 = Hlp_GetNpc (BAU_915_Bauer);
	rebeliant915.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant915,"rebel");
	rebeliant915.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant917; rebeliant917 = Hlp_GetNpc (BAU_917_Bauer);
	rebeliant917.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant917,"rebel");
	rebeliant917.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant919; rebeliant919 = Hlp_GetNpc (BAU_919_Bauer);
	rebeliant919.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant919,"rebel");
	rebeliant919.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant929; rebeliant929 = Hlp_GetNpc (BAU_929_Bauer);
	rebeliant929.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant929,"rebel");
	rebeliant929.aivar[AIV_MISSION3] = TRUE;
	
	var c_npc rebeliant930; rebeliant930 = Hlp_GetNpc (BAU_930_Bauer);
	rebeliant930.name = "Buntownik";
	Npc_ExchangeRoutine (rebeliant930,"rebel");
	rebeliant930.aivar[AIV_MISSION3] = TRUE;
	
	// MGLISTY
	var c_npc foggy; foggy = Hlp_GetNpc (BAU_921_Bauer);
	Npc_ExchangeRoutine (foggy,"rebel");
	
	var c_npc bandit01; bandit01 = Hlp_GetNpc (Org_834_Organisator);
	Npc_ExchangeRoutine (bandit01,"rebel");
};



func void B_Story_AfterBauRebellion ()
{
	// GUARDIAN OF STORAGE
	Npc_ExchangeRoutine (Org_846_Schlaeger,"start");
	
	//GUARDIAN OF HOUSE
	Npc_ExchangeRoutine (Org_845_Schlaeger,"start");
	
	//GUARDIANS OF HOUSE - INSIDE
	var c_npc stronnik1; stronnik1 = Hlp_GetNpc (BAU_908_Bauer);
	stronnik1.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik1,"start");
	
	var c_npc stronnik2; stronnik2 = Hlp_GetNpc (BAU_902_Pock);
	//stronnik2.name = "Stronnik Lewusa";
	Npc_ExchangeRoutine (stronnik2,"start");
	
	//GUARDIAST OF STORAGE - ENTRANCE
	var c_npc stronnik3; stronnik3 = Hlp_GetNpc (BAU_920_Bauer);
	stronnik3.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik3,"start");
	
	var c_npc stronnik4; stronnik4 = Hlp_GetNpc (BAU_922_Bauer);
	stronnik4.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik4,"start");
	
	var c_npc stronnik5; stronnik5 = Hlp_GetNpc (BAU_923_Bauer);
	stronnik5.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik5,"start");
	
	var c_npc stronnik6; stronnik6 = Hlp_GetNpc (BAU_924_Bauer);
	stronnik6.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik6,"start");
	
	var c_npc stronnik7; stronnik7 = Hlp_GetNpc (BAU_927_Bauer);
	stronnik7.name = "Zbieracz";
	Npc_ExchangeRoutine (stronnik7,"start");
	
	// REBELIANTS
	var c_npc rufus; rufus = Hlp_GetNpc (Bau_903_Rufus);
	Npc_ExchangeRoutine (rufus,"start");
	
	var c_npc rebeliant916; rebeliant916 = Hlp_GetNpc (BAU_916_Bauer);
	rebeliant916.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant916,"start");
	
	var c_npc rebeliant907; rebeliant907 = Hlp_GetNpc (BAU_907_Bauer);
	rebeliant907.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant907,"start");

	var c_npc rebeliant928; rebeliant928 = Hlp_GetNpc (BAU_928_Bauer);
	rebeliant928.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant928,"start");
	
	var c_npc rebeliant904; rebeliant904 = Hlp_GetNpc (BAU_904_Bauer);
	rebeliant904.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant904,"start");
	
	var c_npc rebeliant905; rebeliant905 = Hlp_GetNpc (BAU_905_Bauer);
	rebeliant905.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant905,"start");
	
	var c_npc rebeliant914; rebeliant914 = Hlp_GetNpc (BAU_914_Bauer);
	rebeliant914.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant914,"start");
	
	var c_npc rebeliant915; rebeliant915 = Hlp_GetNpc (BAU_915_Bauer);
	rebeliant915.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant915,"start");
	
	var c_npc rebeliant917; rebeliant917 = Hlp_GetNpc (BAU_917_Bauer);
	rebeliant917.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant917,"start");
	
	var c_npc rebeliant919; rebeliant919 = Hlp_GetNpc (BAU_919_Bauer);
	rebeliant919.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant919,"start");
	
	var c_npc rebeliant929; rebeliant929 = Hlp_GetNpc (BAU_929_Bauer);
	rebeliant929.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant929,"start");
	
	var c_npc rebeliant930; rebeliant930 = Hlp_GetNpc (BAU_930_Bauer);
	rebeliant930.name = "Zbieracz";
	Npc_ExchangeRoutine (rebeliant930,"start");
};
