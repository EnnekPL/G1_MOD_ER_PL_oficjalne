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
   description	= "Wiesz coœ o interesach Cyrusa?";
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
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_01"); //Wiesz coœ o interesach Cyrusa?
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_02"); //Powiem ci tyle, ¿e widzia³em, jak rozmawia³ z jakimœ kupcem. 
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_03"); //Wiesz kto to by³ albo jak wygl¹da³?
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_04"); //By³o ciemno, ale dostrzeg³em, ¿e mia³ doœæ ciekawy kolor ubioru. Jasny, nieco podniszczony.
    AI_Output (other, self ,"DIA_Najemnik_INTERESY_15_05"); //To mi za wiele nie pomog³o.
    AI_Output (self, other ,"DIA_Najemnik_INTERESY_03_06"); //O! Jeszcze jedno. Mia³ jeden metalowy naramiennik.
    B_LogEntry                     (CH1_Scams,"Jeden z myœliwych-najemników wygada³ mi, ¿e Cyrus spotyka siê z jakimœ kupcem. Kupiec by³ odziany w jasny strój i posiada³ jeden naramiennik. Mieszkañcy którego obozu nosz¹ jasny ubiór i naramienniki?");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};