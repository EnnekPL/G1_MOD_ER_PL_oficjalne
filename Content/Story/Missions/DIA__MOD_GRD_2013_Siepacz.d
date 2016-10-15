//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Siepacz_EXIT(C_INFO)
{
	npc             = GRD_2013_Siepacz;
	nr              = 999;
	condition	= DIA_Siepacz_EXIT_Condition;
	information	= DIA_Siepacz_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Siepacz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Siepacz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> EXITZOBOZU
//========================================

INSTANCE DIA_Siepacz_EXITZOBOZU (C_INFO)
{
   npc          = GRD_2013_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_EXITZOBOZU_Condition;
   information  = DIA_Siepacz_EXITZOBOZU_Info;
   permanent	= FALSE;
   description	= "Mo¿emy porozmawiaæ za Obozem?";
};

FUNC INT DIA_Siepacz_EXITZOBOZU_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    || (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_EXITZOBOZU_Info()
{
    AI_Output (other, self ,"DIA_Siepacz_EXITZOBOZU_15_01"); //Mo¿emy porozmawiaæ za Obozem?
    AI_Output (self, other ,"DIA_Siepacz_EXITZOBOZU_03_02"); //O co konkretnie chodzi?
    AI_Output (other, self ,"DIA_Siepacz_EXITZOBOZU_15_03"); //Mam do ciebie interes.
    AI_Output (self, other ,"DIA_Siepacz_EXITZOBOZU_03_04"); //W takim razie prowadŸ.
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WALKA
//========================================

INSTANCE DIA_Siepacz_WALKA (C_INFO)
{
   npc          = GRD_2013_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_WALKA_Condition;
   information  = DIA_Siepacz_WALKA_Info;
   permanent	= FALSE;
   description	= "Szykuj siê na œmieræ!";
};

FUNC INT DIA_Siepacz_WALKA_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Siepacz_EXITZOBOZU))
    && ((Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    || (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_WALKA_Info()
{
    AI_Output (other, self ,"DIA_Siepacz_WALKA_15_01"); //Szykuj siê na œmieræ!
    AI_Output (self, other ,"DIA_Siepacz_WALKA_03_02"); //Czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_Siepacz_WALKA_15_03"); //¯ebyœ zap³aci³ za wszystko, co zrobi³eœ w imieniu Z³ego!
    AI_Output (self, other ,"DIA_Siepacz_WALKA_03_04"); //Tylko spróbuj mnie zaatakowaæ!
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	Npc_ExchangeRoutine (self,"away");
};
//========================================
//-----------------> OFIARA
//========================================

INSTANCE DIA_Siepacz_OFIARA (C_INFO)
{
   npc          = GRD_2013_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_OFIARA_Condition;
   information  = DIA_Siepacz_OFIARA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Siepacz_OFIARA_Condition()
{
    if (GRD_2013_Siepacz.aivar[AIV_HASDEFEATEDSC] == TRUE)
    && (Npc_KnowsInfo (hero, DIA_Siepacz_WALKA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_OFIARA_Info()
{
    AI_Output (self, other ,"DIA_Siepacz_OFIARA_03_01"); //Chcia³eœ mnie pobiæ? Takie ³achudry jak ty nie maj¹ czego szukaæ w Starym Obozie. 
    AI_Output (self, other ,"DIA_Siepacz_OFIARA_03_02"); //Zobaczysz! Gdy tylko Z³y siê o tym dowie...
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KLOPOTY
//========================================

INSTANCE DIA_Siepacz_KLOPOTY (C_INFO)
{
   npc          = GRD_2013_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_KLOPOTY_Condition;
   information  = DIA_Siepacz_KLOPOTY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Siepacz_KLOPOTY_Condition()
{
    if (Herek_ProtectionBully == TRUE) && (!Npc_KnowsInfo (hero, DIA_Siepacz_PROBLEMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_KLOPOTY_Info()
{
    AI_Output (self, other ,"DIA_Siepacz_KLOPOTY_03_01"); //A wiêc znowu szukasz k³opotów, tak?
    AI_Output (other, self ,"DIA_Siepacz_KLOPOTY_15_02"); //Co? O co ci chodzi?
    AI_Output (self, other ,"DIA_Siepacz_KLOPOTY_03_03"); //Wkurzasz Bloodwyna i przy okazji mnie! B¹dŸ ostro¿ny. Mo¿e lepiej zap³aciæ mu za ochronê? 
    if (Npc_KnowsInfo (hero, DIA_Siepacz_OFIARA))
    {
        AI_Output (self, other ,"DIA_Siepacz_KLOPOTY_03_04"); //Ach, zapomnia³em! To ty jesteœ tym cwaniaczkiem, który chcia³ mnie pobiæ. Takim to lepiej wyt³umaczyæ wszystko piêœci¹.
        AI_StopProcessInfos	(self);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
    };
};