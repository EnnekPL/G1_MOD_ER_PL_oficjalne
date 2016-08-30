//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Wegelagerer1_EXIT(C_INFO)
{
	npc             	= Non_1501_Wegelagerer;
	nr              	= 999;
	condition		= DIA_Wegelagerer1_EXIT_Condition;
	information	= DIA_Wegelagerer1_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Wegelagerer1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wegelagerer1_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Hunter
//========================================

INSTANCE DIA_Wegelagerer1_Hunter (C_INFO)
{
   npc          = Non_1501_Wegelagerer;
   nr           = 2;
   condition    = DIA_Wegelagerer1_Hunter_Condition;
   information  = DIA_Wegelagerer1_Hunter_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Wegelagerer1_Hunter_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Wegelagerer1_Hunter_Info()
{
    AI_Output (other, self ,"DIA_Wegelagerer1_Hunter_15_01"); //Co tu robisz? Nie wygl�dasz na my�liwego.
    AI_Output (self, other ,"DIA_Wegelagerer1_Hunter_03_02"); //Bo nim nie jestem. Korzystam po prostu z dobroci Alexa. Jestem uciekinierem z Nowego Obozu.
    AI_Output (other, self ,"DIA_Wegelagerer1_Hunter_15_03"); //Dlaczego uciek�e�?
    AI_Output (self, other ,"DIA_Wegelagerer1_Hunter_03_04"); //Denerwowa�o mnie tam zbyt du�o t�pych osi�k�w. Chocia�by Lewus i jego kumple. Tfu, pluj� na tych sukinsyn�w!
};


//========================================
//-----------------> WorkInProgres
//========================================

INSTANCE DIA_Wegelagerer_WorkInProgres (C_INFO)
{
   npc          = Non_1501_Wegelagerer;
   nr           = 1;
   condition    = DIA_Wegelagerer_WorkInProgres_Condition;
   information  = DIA_Wegelagerer_WorkInProgres_Info;
   permanent	= FALSE;
   description	= "Nie chcia�by� mo�e pracowa� w szwalni?";
};

FUNC INT DIA_Wegelagerer_WorkInProgres_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_GoToSzwalnia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wegelagerer_WorkInProgres_Info()
{
    AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_01"); //Nie chcia�by� mo�e pracowa� w szwalni?
    AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_02"); //Jasne. Ka�da bry�ka mi si� teraz przyda. Gdzie mam si� uda�?
	AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_03"); //Do jaskini we wn�trzu lasu. B�dziesz tam szy� ubrania na zlecenie pewnego Cienia ze Starego Obozu.
	AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_04"); //Cholera, w �rodku lasu? Nie da�o si� w jakiej� ciep�ej chatce? A zreszt�... Co mi tam! 
    AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_05"); //Jaskinia znajduje si� w lesie po drugiej stronie rzeki. 
	AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_06"); //Ju� wiem o jakim miejscu m�wisz. Nazywamy je Wilczym Do�em. Trafi� tam, nie ma obawy. Je�li szukasz jeszcze kogo�, to my�l�, �e m�j kompan mo�e by� zainteresowany. 
    RobotnicyWhistlera = RobotnicyWhistlera + 1;
	Npc_ExchangeRoutine (self, "szwalnia");
};

