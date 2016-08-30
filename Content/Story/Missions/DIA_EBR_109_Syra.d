// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Syra_EXIT(C_INFO)
{
	npc             = EBR_109_Syra;
	nr              = 999;
	condition	= DIA_Syra_EXIT_Condition;
	information	= DIA_Syra_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Syra_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Syra_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloSira
//========================================

INSTANCE DIA_Syra_HelloSira (C_INFO)
{
   npc          = EBR_109_Syra;
   nr           = 2;
   condition    = DIA_Syra_HelloSira_Condition;
   information  = DIA_Syra_HelloSira_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Syra_HelloSira_Condition()
{
    if (Kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Syra_HelloSira_Info()
{
    AI_Output (other, self ,"DIA_Syra_HelloSira_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Syra_HelloSira_03_02"); //Odejd�! Nie wolno ci ze mn� rozmawia�!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GomezDied
//========================================

INSTANCE DIA_Syra_GomezDied (C_INFO)
{
   npc          = EBR_109_Syra;
   nr           = 1;
   condition    = DIA_Syra_GomezDied_Condition;
   information  = DIA_Syra_GomezDied_Info;
   permanent	= FALSE;
   description	= "Gomez gryzie ziemie.";
};

FUNC INT DIA_Syra_GomezDied_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Syra_GomezDied_Info()
{
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_01"); //Gomez gryzie ziemie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_02"); //I bardzo dobrze. Ten dupek zas�u�y� sobie na to.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_03"); //Nigdy nie zapomn� dnia, gdy zosta�am zrzucona za Barier�.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_04"); //Stawia�am op�r, gdy pochwycili mnie Stra�nicy i ci idioci pobili mnie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_05"); //Ca�e szcz�cie, �e dostali lekcje szacunku.
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_06"); //Tak, te� nie pochwalam takiego traktowania kobiet.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_07"); //Jeste� taki s�odki. Powiedz mi, jak ci na imi�?
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_08"); //Jestem...
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_09"); //A zreszt� niewa�ne. Teraz jeste� tu bohaterem i to tacy ludzie powinni rz�dzi� w Kolonii.
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_10"); //To nie dla mnie. Mam inne sprawy na g�owie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_11"); //Ach... W takim razie powodzenia. Zaczekam tutaj, a� zjawi� si� Najemnicy z Nowego Obozu.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_12"); //Zostan� z nimi.
};

