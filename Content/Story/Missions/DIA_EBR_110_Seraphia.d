// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Seraphia_EXIT(C_INFO)
{
	npc             = EBR_110_Seraphia;
	nr              = 999;
	condition	= DIA_Seraphia_EXIT_Condition;
	information	= DIA_Seraphia_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Seraphia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Seraphia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloSeraphia
//========================================

INSTANCE DIA_Seraphia_HelloSeraphia (C_INFO)
{
   npc          = EBR_110_Seraphia;
   nr           = 2;
   condition    = DIA_Seraphia_HelloSeraphia_Condition;
   information  = DIA_Seraphia_HelloSeraphia_Info;
   permanent	= TRUE;
   description	= "Witaj, nieznajoma!";
};

FUNC INT DIA_Seraphia_HelloSeraphia_Condition()
{
    if (Kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Seraphia_HelloSeraphia_Info()
{
    AI_Output (other, self ,"DIA_Seraphia_HelloSeraphia_15_01"); //Witaj, nieznajoma!
    AI_Output (self, other ,"DIA_Seraphia_HelloSeraphia_03_02"); //Wybacz, ale nie mog� z tob� rozmawia�. Magnaci nie pozwalaj� nam na kontakt z innymi skaza�cami.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GomezDied
//========================================

INSTANCE DIA_Seraphia_GomezDied (C_INFO)
{
   npc          = EBR_110_Seraphia;
   nr           = 1;
   condition    = DIA_Seraphia_GomezDied_Condition;
   information  = DIA_Seraphia_GomezDied_Info;
   permanent	= FALSE;
   description	= "Magnaci gryz� ziemie, a ty jeste� wolna.";
};

FUNC INT DIA_Seraphia_GomezDied_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Seraphia_GomezDied_Info()
{
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_01"); //Magnaci gryz� ziemie, a ty jeste� wolna.
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_02"); //Naprawd�? Jeste� niesamowity!
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_03"); //Nie spodziewa�am si�, �e kiedykolwiek si� uwolni� od ich tyra�skich rz�d�w.
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_04"); //Stokrotne dzi�ki.
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_05"); //Co zamierzasz teraz robi�?
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_06"); //Podobno ludzie z Nowego Obozu maj� wkr�tce zaj�� zamek. Raczej zostan� tutaj.
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_07"); //Jasne.
};

