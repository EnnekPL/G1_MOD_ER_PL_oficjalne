//edit by Nocturn
func void B_SetRoguesToHostile ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(BAN_1610_Quentin); Npc_SetTempAttitude(Quentin,ATT_HOSTILE); Npc_SetAttitude(Quentin,ATT_HOSTILE);
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); Npc_SetTempAttitude(Rog863, ATT_HOSTILE); Npc_SetAttitude(Rog863, ATT_HOSTILE);
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Raeuber); Npc_SetTempAttitude(Rog864, ATT_HOSTILE); Npc_SetAttitude(Rog864, ATT_HOSTILE);
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); Npc_SetTempAttitude(Rog865, ATT_HOSTILE); Npc_SetAttitude(Rog865, ATT_HOSTILE);
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(BAN_1609_Pun); Npc_SetTempAttitude(Rog866, ATT_HOSTILE); Npc_SetAttitude(Rog866, ATT_HOSTILE);
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber); Npc_SetTempAttitude(Rog867, ATT_HOSTILE); Npc_SetAttitude(Rog867, ATT_HOSTILE);
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); Npc_SetTempAttitude(Rog868, ATT_HOSTILE); Npc_SetAttitude(Rog868, ATT_HOSTILE);
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); Npc_SetTempAttitude(Rog869, ATT_HOSTILE); Npc_SetAttitude(Rog869, ATT_HOSTILE);
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); Npc_SetTempAttitude(Rog870, ATT_HOSTILE); Npc_SetAttitude(Rog870, ATT_HOSTILE);
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); Npc_SetTempAttitude(Rog871, ATT_HOSTILE); Npc_SetAttitude(Rog871, ATT_HOSTILE);
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); Npc_SetTempAttitude(Rog874, ATT_HOSTILE); Npc_SetAttitude(Rog874, ATT_HOSTILE);
	var C_NPC Rog5051;	Rog5051	= Hlp_GetNpc(Non_5051_Raeuber); Npc_SetTempAttitude(Rog5051, ATT_HOSTILE); Npc_SetAttitude(Rog5051, ATT_HOSTILE);
	var C_NPC Rog5052;	Rog5052	= Hlp_GetNpc(Non_5052_Raeuber); Npc_SetTempAttitude(Rog5052, ATT_HOSTILE); Npc_SetAttitude(Rog5052, ATT_HOSTILE);
	var C_NPC SKE_BOW;	SKE_BOW	= Hlp_GetNpc(Skeleton_bow); Npc_SetTempAttitude(SKE_BOW, ATT_HOSTILE); Npc_SetAttitude(SKE_BOW, ATT_HOSTILE);

	if (Stooges_fled == TRUE)
	{
		var C_NPC Renyu;	Renyu 	= Hlp_GetNpc(Org_860_Renyu	); if (Hlp_IsValidNpc(Renyu)) 	{	Npc_SetTempAttitude(Renyu,  ATT_HOSTILE); Npc_SetAttitude(Renyu,  ATT_HOSTILE);	};
		var C_NPC Killian;	Killian = Hlp_GetNpc(Org_861_Killian); if (Hlp_IsValidNpc(Killian))	{	Npc_SetTempAttitude(Killian,ATT_HOSTILE); Npc_SetAttitude(Killian,ATT_HOSTILE);	};
		var C_NPC Jacko;	Jacko 	= Hlp_GetNpc(Org_862_Jacko	); if (Hlp_IsValidNpc(Jacko))	{	Npc_SetTempAttitude(Jacko,  ATT_HOSTILE); Npc_SetAttitude(Jacko,  ATT_HOSTILE);	};
	};
};
func void B_SetRoguesToFriend ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(BAN_1610_Quentin); Npc_SetTempAttitude(Quentin,ATT_FRIENDLY); Npc_SetAttitude(Quentin,ATT_FRIENDLY);
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); Npc_SetTempAttitude(Rog863, ATT_FRIENDLY); Npc_SetAttitude(Rog863, ATT_FRIENDLY);
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Raeuber); Npc_SetTempAttitude(Rog864, ATT_FRIENDLY); Npc_SetAttitude(Rog864, ATT_FRIENDLY);
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); Npc_SetTempAttitude(Rog865, ATT_FRIENDLY); Npc_SetAttitude(Rog865, ATT_FRIENDLY);
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(BAN_1609_Pun); Npc_SetTempAttitude(Rog866, ATT_FRIENDLY); Npc_SetAttitude(Rog866, ATT_FRIENDLY);
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber);   Npc_SetTempAttitude(Rog867, ATT_FRIENDLY); Npc_SetAttitude(Rog867, ATT_FRIENDLY);
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); Npc_SetTempAttitude(Rog868, ATT_FRIENDLY); Npc_SetAttitude(Rog868, ATT_FRIENDLY);
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); Npc_SetTempAttitude(Rog869, ATT_FRIENDLY); Npc_SetAttitude(Rog869, ATT_FRIENDLY);
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); Npc_SetTempAttitude(Rog870, ATT_FRIENDLY); Npc_SetAttitude(Rog870, ATT_FRIENDLY);
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); Npc_SetTempAttitude(Rog871, ATT_FRIENDLY); Npc_SetAttitude(Rog871, ATT_FRIENDLY);
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); Npc_SetTempAttitude(Rog874, ATT_FRIENDLY); Npc_SetAttitude(Rog874, ATT_FRIENDLY);
};

func void B_SetRoguesToNeutral ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(BAN_1610_Quentin); Npc_SetTempAttitude(Quentin,ATT_NEUTRAL); Npc_SetAttitude(Quentin,ATT_NEUTRAL);
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); Npc_SetTempAttitude(Rog863, ATT_NEUTRAL); Npc_SetAttitude(Rog863, ATT_NEUTRAL);
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Raeuber); Npc_SetTempAttitude(Rog864, ATT_NEUTRAL); Npc_SetAttitude(Rog864, ATT_NEUTRAL);
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); Npc_SetTempAttitude(Rog865, ATT_NEUTRAL); Npc_SetAttitude(Rog865, ATT_NEUTRAL);
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(BAN_1609_Pun); Npc_SetTempAttitude(Rog866, ATT_NEUTRAL); Npc_SetAttitude(Rog866, ATT_NEUTRAL);
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber);   Npc_SetTempAttitude(Rog867, ATT_NEUTRAL); Npc_SetAttitude(Rog867, ATT_NEUTRAL);
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); Npc_SetTempAttitude(Rog868, ATT_NEUTRAL); Npc_SetAttitude(Rog868, ATT_NEUTRAL);
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); Npc_SetTempAttitude(Rog869, ATT_NEUTRAL); Npc_SetAttitude(Rog869, ATT_NEUTRAL);
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); Npc_SetTempAttitude(Rog870, ATT_NEUTRAL); Npc_SetAttitude(Rog870, ATT_NEUTRAL);
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); Npc_SetTempAttitude(Rog871, ATT_NEUTRAL); Npc_SetAttitude(Rog871, ATT_NEUTRAL);
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); Npc_SetTempAttitude(Rog874, ATT_NEUTRAL); Npc_SetAttitude(Rog874, ATT_NEUTRAL);
};