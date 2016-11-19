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
    AI_Output (other, self ,"DIA_Wegelagerer1_Hunter_15_01"); //Co tu robisz? Nie wygl¹dasz na myœliwego.
    AI_Output (self, other ,"DIA_Wegelagerer1_Hunter_03_02"); //Bo nim nie jestem. Korzystam po prostu z dobroci Alexa. Jestem uciekinierem z Nowego Obozu.
    AI_Output (other, self ,"DIA_Wegelagerer1_Hunter_15_03"); //Dlaczego uciek³eœ?
    AI_Output (self, other ,"DIA_Wegelagerer1_Hunter_03_04"); //Denerwowa³o mnie tam zbyt du¿o têpych osi³ków. Chocia¿by Lewus i jego kumple. Tfu, plujê na tych sukinsynów!
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
   description	= "Nie chcia³byœ mo¿e pracowaæ w szwalni?";
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
    AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_01"); //Nie chcia³byœ mo¿e pracowaæ w szwalni?
    AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_02"); //Jasne. Ka¿da bry³ka mi siê teraz przyda. Gdzie mam siê udaæ?
	AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_03"); //Do jaskini we wnêtrzu lasu. Bêdziesz tam szy³ ubrania na zlecenie pewnego Cienia ze Starego Obozu.
	AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_04"); //Cholera, w œrodku lasu? Nie da³o siê w jakiejœ ciep³ej chatce? A zreszt¹... Co mi tam! 
    AI_Output (other, self ,"DIA_Wegelagerer_WorkInProgres_15_05"); //Jaskinia znajduje siê w lesie po drugiej stronie rzeki. 
	AI_Output (self, other ,"DIA_Wegelagerer_WorkInProgres_03_06"); //Ju¿ wiem o jakim miejscu mówisz. Nazywamy je Wilczym Do³em. Trafiê tam, nie ma obawy. Jeœli szukasz jeszcze kogoœ, to myœlê, ¿e mój kompan mo¿e byæ zainteresowany. 
    RobotnicyWhistlera = RobotnicyWhistlera + 1;
	Npc_ExchangeRoutine (self, "szwalnia");
	
	B_LogEntry     (CH1_SprawaFirna,"Jeden z w³óczêgów z obozu myœliwych zgodzi³ siê pracowaæ w szwalni. Poradzi³ mi te¿, abym pogada³ z jego kompanem.");
};

