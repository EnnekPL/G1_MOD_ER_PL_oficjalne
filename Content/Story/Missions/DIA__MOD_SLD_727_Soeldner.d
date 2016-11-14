//========================================
//-----------------> WARN_FLINT
//========================================

INSTANCE DIA_Soldier_WARN_FLINT (C_INFO)
{
   npc          = SLD_727_Soeldner;
   nr           = 1;
   condition    = DIA_Soldier_WARN_FLINT_Condition;
   information  = DIA_Soldier_WARN_FLINT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Soldier_WARN_FLINT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Flint_FollowMe))
    && (STT_2046_Flint.aivar[AIV_PARTYMEMBER] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Soldier_WARN_FLINT_Info()
{
    AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_03_01"); //Hej! A co to za goœæ?
    AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_03_02"); //Gdzie go prowadzisz?

    Info_ClearChoices		(DIA_Soldier_WARN_FLINT);
    Info_AddChoice		(DIA_Soldier_WARN_FLINT, "To wyrzucony z kopalni Kret. Ma trafiæ do na pola ry¿owe.", DIA_Soldier_WARN_FLINT_KRET);
    Info_AddChoice		(DIA_Soldier_WARN_FLINT, "To zbieg z pól ry¿owych. Uda³o mi siê go z³apaæ.", DIA_Soldier_WARN_FLINT_ZBIEG);
};

FUNC VOID DIA_Soldier_WARN_FLINT_KRET()
{
    AI_Output (other, self ,"DIA_Soldier_WARN_FLINT_KRET_15_01"); //To wyrzucony z kopalni Kret. Ma trafiæ na pola ry¿owe.
    AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_KRET_03_02"); //Rozumiem, przechodŸcie.

    B_GIVEXP (50);
    Info_ClearChoices		(DIA_Soldier_WARN_FLINT);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Soldier_WARN_FLINT_ZBIEG()
{
    AI_Output (other, self ,"DIA_Soldier_WARN_FLINT_ZBIEG_15_01"); //To zbieg z pól ry¿owych. Uda³o mi siê go z³apaæ.
    AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_ZBIEG_03_02"); //Zbieg? Doprawdy?
    AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_ZBIEG_03_03"); //Stojê tu ca³y, cholerny dzieñ i nikogo nie widzia³em. 
	AI_Output (self, other ,"DIA_Soldier_WARN_FLINT_ZBIEG_03_04"); //Chyba próbujesz mnie oszukaæ! Bardzo tego nie lubiê!
	Info_ClearChoices		(DIA_Soldier_WARN_FLINT);
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, ""); 
};