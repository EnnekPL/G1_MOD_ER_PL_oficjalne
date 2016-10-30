func void zs_Rebel ()
{
	PrintDebugNpc	(PD_ZS_FRAME,"zs_Rebel");
	B_SetPerception (self);  
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP 	(self);	

	AI_PlayAni 		(self, "T_STAND_2_CLAPHANDS");
};

func int zs_Rebel_Loop ()
{
	PrintDebugNpc				(PD_ZS_LOOP,	"zs_Rebel_Loop");
    //AI_Wait (self, 1);	
	Snd_Play ("Murmur");
};

func void zs_Rebel_End ()
{	
	PrintDebugNpc			(PD_ZS_FRAME, "zs_Rebel_End" );
	AI_PlayAni 				(self, "T_CLAPHANDS_2_STAND");
	AI_ContinueRoutine 		(self);
};