// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator816_EXIT(C_INFO)
{
	npc             = ORG_816_Organisator;
	nr              = 999;
	condition	= DIA_Organisator816_EXIT_Condition;
	information	= DIA_Organisator816_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator816_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator816_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Organisator_Fight (C_INFO)
{
   npc          = ORG_816_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_Fight_Condition;
   information  = DIA_Organisator_Fight_Info;
   permanent	= FALSE;
   description	= "Zachcia³o ci siê bawiæ w magika? Co?";
};

FUNC INT DIA_Organisator_Fight_Condition()
{
    if (MIS_CronosArtifacts == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_Fight_Info()
{
    AI_Output (other, self ,"DIA_Organisator_Fight_15_01"); //Zachcia³o ci siê bawiæ w magika? Co?
    AI_Output (self, other ,"DIA_Organisator_Fight_03_02"); //Co ciê to do cholery obchodzi? 
    AI_Output (self, other ,"DIA_Organisator_Fight_03_03"); //Zaraz poznasz mój gniew!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

