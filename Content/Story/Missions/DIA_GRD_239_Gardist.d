//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> Rozkaz
//========================================

INSTANCE DIA_Gardist_Rozkaz (C_INFO)
{
   npc          = GRD_239_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_Rozkaz_Condition;
   information  = DIA_Gardist_Rozkaz_Info;
   permanent	= FALSE;
   description	= "Wypu�� my�liwego! To rozkaz!";
};

FUNC INT DIA_Gardist_Rozkaz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_100OreZaInfo))
    && (MIS_PorwanieAlexa == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_EBR) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_Rozkaz_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Rozkaz_15_01"); //Wypu�� my�liwego! To rozkaz!
    AI_Output (self, other ,"DIA_Gardist_Rozkaz_03_02"); //Jak sobie �yczysz.
    AI_Output (self, other ,"DIA_Gardist_Rozkaz_03_03"); //Oto klucz.
    CreateInvItems (self, DUNGEONKEY, 1);
    B_GiveInvItems (self, other, DUNGEONKEY, 1);
    B_LogEntry                     (CH1_PorwanieAlexa,"Wykorzysta�em wp�ywy, aby uwolni� Alexa.");

    B_GiveXP (300);
};

//========================================
//-----------------> OkupOplacony
//========================================

INSTANCE DIA_Gardist_OkupOplacony (C_INFO)
{
   npc          = GRD_239_Gardist;
   nr           = 2;
   condition    = DIA_Gardist_OkupOplacony_Condition;
   information  = DIA_Gardist_OkupOplacony_Info;
   permanent	= FALSE;
   description	= "Zap�aci�em okup za Alexa. Wypu�� go!";
};

FUNC INT DIA_Gardist_OkupOplacony_Condition()
{
    if (MIS_PorwanieAlexa == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_OkupOplacony_Info()
{
    AI_Output (other, self ,"DIA_Gardist_OkupOplacony_15_01"); //Zap�aci�em okup za Alexa. Wypu�� go!
    AI_Output (self, other ,"DIA_Gardist_OkupOplacony_03_02"); //Podobno Magnaci wyznaczyli spor� sumk�.
    AI_Output (self, other ,"DIA_Gardist_OkupOplacony_03_03"); //Masz zr�czne r�ce, nie?
    AI_Output (other, self ,"DIA_Gardist_OkupOplacony_15_04"); //Po prostu daj mi klucz do celi.
    CreateInvItems (self, DUNGEONKEY, 1);
    B_GiveInvItems (self, other, DUNGEONKEY, 1);
};

//========================================
//-----------------> ProwoISprawiedliwosc
//========================================

INSTANCE DIA_Gardist_ProwoISprawiedliwosc (C_INFO)
{
   npc          = GRD_239_Gardist;
   nr           = 3;
   condition    = DIA_Gardist_ProwoISprawiedliwosc_Condition;
   information  = DIA_Gardist_ProwoISprawiedliwosc_Info;
   permanent	= FALSE;
   description	= "Daj mi klucz do celi! (Prowokacja)";
};

FUNC INT DIA_Gardist_ProwoISprawiedliwosc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_100OreZaInfo))
    && (MIS_PorwanieAlexa == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_ProwoISprawiedliwosc_Info()
{
    AI_Output (other, self ,"DIA_Gardist_ProwoISprawiedliwosc_15_01"); //Daj mi klucz do celi!
    AI_Output (self, other ,"DIA_Gardist_ProwoISprawiedliwosc_03_02"); //Widz�, �e kto� jest spieszny do bitki.
    AI_Output (self, other ,"DIA_Gardist_ProwoISprawiedliwosc_03_03"); //No dawaj!
    CreateInvItems (self, DUNGEONKEY, 1);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};