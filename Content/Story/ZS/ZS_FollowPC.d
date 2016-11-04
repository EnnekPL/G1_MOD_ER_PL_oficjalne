//////////////////////////////////////////////////////////////////////////
//	ZS_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_FollowPC()
{
 var string msg;
    var c_npc slf;
    slf = Hlp_GetNpc(self);

    msg = ConcatStrings(slf.name, " do³¹cza do grupy!");
    PrintScreen(msg,1,1,"font_old_10_white.tga",2);
	//print ("LLLLALALALA");
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowPC_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);	

	//zs_follow_gorn look there
	//Npc_PercDisable    	(self,	PERC_ASSESSENEMY);
	//Npc_PercDisable   	(self,	PERC_ASSESSMURDER);
 	//Npc_PercDisable   	(self,  PERC_ASSESSFIGHTSOUND);
                                                                                
 	//Npc_PercDisable   	(self, 	PERC_DRAWWEAPON);
                                                                                
 	//Npc_PercDisable   	(self,  PERC_ASSESSTALK   	,	B_AssessTalk      	 	);
 	//Npc_PercDisable   	(self, 	PERC_ASSESSDAMAGE);
 	//Npc_PercDisable   	(self, 	PERC_CATCHTHIEF);	
};

func int ZS_FollowPC_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_FollowPC_Loop");
	PrintGlobals(PD_MST_DETAIL);
	if(C_BodyStateContains(hero,BS_WALK))
	{
		AI_SetWalkMode(self,NPC_WALK);
	}
	else if(!C_BodyStateContains(self,BS_SWIM))
	{
		AI_SetWalkMode(self,NPC_RUN);
	};
	if(Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		AI_GotoNpc(self,hero);
	}
	else
	{
		B_SmartTurnToNpc(self,hero);
	};
	return LOOP_CONTINUE;
/*
	PrintDebugNpc		(PD_TA_LOOP,	"ZS_FollowPC_Loop");
	PrintGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
	*/
};

func void ZS_FollowPC_End()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC_End");

	self.senses =		hero.senses;

};


func void B_FollowPC_AssessSC()
{
	PrintDebugNpc		(PD_TA_FRAME,	"B_FollowPC_AssessSC");
	
	if (Npc_GetDistToNpc(self,hero) < HAI_DIST_FOLLOWPC)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...SC-Meister jetzt nahe genug!");
		B_FullStop		(self);
	};

	if (Npc_CheckInfo(self,1))
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...wichtige Info zu vergeben!");
		hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
		B_FullStop		(other);
		B_FullStop		(self);
		AI_StartState	(self,	ZS_Talk, 0, "");
		return;
	};
};
