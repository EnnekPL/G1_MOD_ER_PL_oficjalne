func void ZS_Dead ()
{	
	PrintDebugNpc	(PD_ZS_FRAME, "ZS_Dead" );		
	PrintGlobals	(PD_ZS_CHECK);

	C_ZSInit();

	self.aivar[AIV_PLUNDERED] = FALSE;
	

	
	//-------- Erfahrungspunkte für den Spieler ? --------
	//SN: VORSICHT, auch in B_MagicHurtNpc() vorhanden!
	if	Npc_IsPlayer   (other)
	||	(C_NpcIsHuman  (other) && other.aivar[AIV_PARTYMEMBER])
	||	(C_NpcIsMonster(other) && other.aivar[AIV_MM_PARTYMEMBER])
	{
		B_DeathXP();	// vergibt XP an SC
		
		//first blood bonus
		if (self.guild != GIL_MEATBUG) && (Bonus_FirtsBlood == FALSE)
		{
		Bonus_FirtsBlood = TRUE;
		B_GiveXP (100);
		PrintS_Ext("Pierwsza krew! Bonus doœwiadczenia.", COL_Red);
		};
	};
	
	if	C_NpcIsMonster(self)
	{
		B_GiveDeathInv (); 	// für Monster
	};
	B_CheckDeadMissionNPCs ();
	B_Respawn (self); 	
};
