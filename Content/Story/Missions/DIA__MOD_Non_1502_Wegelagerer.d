//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Wegelagerer2_EXIT(C_INFO)
{
	npc             	= Non_1502_Wegelagerer;
	nr              	= 999;
	condition		= DIA_Wegelagerer2_EXIT_Condition;
	information	= DIA_Wegelagerer2_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Wegelagerer2_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wegelagerer2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Work
//========================================
//edit by Nocturn
INSTANCE DIA_Wegelagerer_Work (C_INFO)
{
   npc          = Non_1502_Wegelagerer;
   nr           = 1;
   condition    = DIA_Wegelagerer_Work_Condition;
   information  = DIA_Wegelagerer_Work_Info;
   permanent	= FALSE;
   description	= "Szukasz mo�e pracy?";
};

FUNC INT DIA_Wegelagerer_Work_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_GoToSzwalnia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wegelagerer_Work_Info()
{
    AI_Output (other, self ,"DIA_Wegelagerer_Work_15_01"); //Szukasz mo�e pracy?
    AI_Output (self, other ,"DIA_Wegelagerer_Work_03_02"); //Jasne. Co mia�bym robi�?
    AI_Output (self, other ,"DIA_Wegelagerer_Work_03_03"); //Uprzedzam, �e wojownik ze mnie kiepski.
    AI_Output (other, self ,"DIA_Wegelagerer_Work_15_04"); //B�dziesz szy� ubrania w starej szwalni w �rodku lasu.
    AI_Output (self, other ,"DIA_Wegelagerer_Work_03_05"); //Hmm. Ten �rodek lasu nie brzmi zbyt zach�caj�co, ale c�.
    AI_Output (self, other ,"DIA_Wegelagerer_Work_03_06"); //Lepsze to ni� tu siedzie� bezczynnie.
    RobotnicyWhistlera = RobotnicyWhistlera +1;
	 Npc_ExchangeRoutine (self, "szwalnia");
};

