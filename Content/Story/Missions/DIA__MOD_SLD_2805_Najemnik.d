//========================================
//-----------------> INTERESY
//========================================

INSTANCE DIA_Najemnik_INTERESY (C_INFO)
{
   npc          = SLD_2805_Najemnik;
   nr           = 1;
   condition    = DIA_Najemnik_INTERESY_Condition;
   information  = DIA_Najemnik_INTERESY_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o interesach Cyrusa?";
};

FUNC INT DIA_Najemnik_INTERESY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_WORK_FIND))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Najemnik_INTERESY_Info()
{
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_01"); //Wiesz co� o interesach Cyrusa?
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_02"); //Powiem ci tyle, �e widzia�em, jak rozmawia� z jakim� kupcem. 
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_03"); //Wiesz kto to by� albo jak wygl�da�?
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_04"); //By�o ciemno, ale dostrzeg�em, �e mia� do�� ciekawy kolor ubioru. Jasny, nieco podniszczony.
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_05"); //To mi za wiele nie pomog�o.
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_06"); //O! Jeszcze jedno. Mia� jeden metalowy naramiennik.
    B_LogEntry                     (CH1_PodejrzanyCyrus,"Jeden z my�liwych-najemnik�w wygada� mi, �e Cyrus spotyka si� z jakim� kupcem. Kupiec by� odziany w jasny str�j i posiada� jeden naramiennik. Mieszka�cy kt�rego obozu nosz� jasny ubi�r i naramienniki?");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};