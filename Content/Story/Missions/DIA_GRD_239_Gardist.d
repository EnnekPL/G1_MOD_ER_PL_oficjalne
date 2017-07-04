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
    if (MIS_Kidnapping == LOG_RUNNING)
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
    AI_Output (other, self ,"DIA_Gardist_OkupOplacony_15_04"); //Po prostu daj mi przej��.
};

