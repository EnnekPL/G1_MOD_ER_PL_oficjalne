//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Siepacz2_EXIT(C_INFO)
{
	npc             = GRD_2014_Siepacz;
	nr              = 999;
	condition	= DIA_Siepacz2_EXIT_Condition;
	information	= DIA_Siepacz2_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Siepacz2_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Siepacz2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WYPROWADZ
//========================================

INSTANCE DIA_Siepacz_WYPROWADZ (C_INFO)
{
   npc          = GRD_2014_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_WYPROWADZ_Condition;
   information  = DIA_Siepacz_WYPROWADZ_Info;
   permanent	= FALSE;
   description	= "Mam do ciebie spraw�.";
};

FUNC INT DIA_Siepacz_WYPROWADZ_Condition()
{
	if (MordragProblemOC == LOG_RUNNING)
	&& ((Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED)) ||  (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_WYPROWADZ_Info()
{
    AI_Output (other, self ,"DIA_Siepacz_WYPROWADZ_15_01"); //Mam do ciebie spraw�. Mo�emy porozmawia� za Obozem?
    AI_Output (self, other ,"DIA_Siepacz_WYPROWADZ_03_02"); //Czemu nie?
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);
 
};
//========================================
//-----------------> ATAK
//========================================

INSTANCE DIA_Siepacz_ATAK (C_INFO)
{
   npc          = GRD_2014_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_ATAK_Condition;
   information  = DIA_Siepacz_ATAK_Info;
   permanent	= FALSE;
   description	= "Zginiesz!";
};

FUNC INT DIA_Siepacz_ATAK_Condition()
{
	if (MordragProblemOC == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Siepacz_WYPROWADZ))
	&& ((Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED)) ||  (Npc_KnowsInfo (hero, DIA_Kyle_DOPUKI)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_ATAK_Info()
{
    AI_Output (other, self ,"DIA_Siepacz_ATAK_15_01"); //Zginiesz!
    AI_Output (self, other ,"DIA_Siepacz_ATAK_03_02"); //Chcia�em si� ostatnio troch� rozerwa�.
	AI_StopProcessInfos	(self);
   // Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	Npc_ExchangeRoutine (self,"away");
 
};
//========================================
//-----------------> OFIARA
//========================================

INSTANCE DIA_Siepacz_OFIARA2 (C_INFO)
{
   npc          = GRD_2014_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_OFIARA2_Condition;
   information  = DIA_Siepacz_OFIARA2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Siepacz_OFIARA2_Condition()
{
    if (GRD_2014_Siepacz.aivar[AIV_HASDEFEATEDSC] == TRUE)
    && (Npc_KnowsInfo (hero, DIA_Siepacz_ATAK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_OFIARA2_Info()
{
    AI_Output (self, other ,"DIA_Siepacz_OFIARA2_03_01"); //Co za ofiara! My�la�e�, �e mnie pokonasz. Chyba si� przeliczy�e�, ch�opcze. Zaraz donios� o wszystkim Z�emu i dowiemy si�, co przeciw niemu knujesz.
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> PROBLEMY
//========================================

INSTANCE DIA_Siepacz_PROBLEMY (C_INFO)
{
   npc          = GRD_2014_Siepacz;
   nr           = 1;
   condition    = DIA_Siepacz_PROBLEMY_Condition;
   information  = DIA_Siepacz_PROBLEMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Siepacz_PROBLEMY_Condition()
{
    if (Herek_ProtectionBully == true)
    && (!Npc_KnowsInfo (hero, DIA_Siepacz_KLOPOTY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Siepacz_PROBLEMY_Info()
{
    AI_Output (self, other ,"DIA_Siepacz_PROBLEMY_03_01"); //Pono� jeste� bardzo odwa�ny. Poradzisz sobie bez ochrony?
    AI_Output (self, other ,"DIA_Siepacz_PROBLEMY_03_02"); //Ha ha! Ju� to widz�! Taki �mie�.
    if (Npc_KnowsInfo (hero, DIA_Siepacz_OFIARA2))
    {
        AI_Output (self, other ,"DIA_Siepacz_PROBLEMY_03_03"); //W sumie to lepiej b�dzie jak ci to zobrazuj� mieczem. 
        AI_StopProcessInfos	(self);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
    };
};