//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hunter_EXIT(C_INFO)
{
	npc             = NON_5606_Hunter;
	nr              = 999;
	condition	= DIA_Hunter_EXIT_Condition;
	information	= DIA_Hunter_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hunter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hunter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================
//edit by Nocturn
INSTANCE DIA_Hunter_HELLO1 (C_INFO)
{
   npc          = NON_5606_Hunter;
   nr           = 1;
   condition    = DIA_Hunter_HELLO1_Condition;
   information  = DIA_Hunter_HELLO1_Info;
   permanent	= FALSE;
   description	= "Podobno nie chce ci si� pracowa�!";
};

FUNC INT DIA_Hunter_HELLO1_Condition()
{
    if (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hunter_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hunter_HELLO1_15_01"); //Podobno nie chce ci si� pracowa�!
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_02"); //I co z tego? Mam harowa� jak jaki� w� za darmo?!
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_03"); //Kim ja jestem? Niewolnikiem?
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_04"); //Chc� z�ota za swoj� prac�! Inaczej b�d� si� obija�.
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_05"); //Wszyscy m�wi� o z�o�ach z�ota w Kolonii! Wszyscy!
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_06"); //Bandyci, Stra�nicy, Najemnicy! A my co?
    AI_Output (self, other ,"DIA_Hunter_HELLO1_03_07"); //Mam szacunek do Alexa, ale jego bierne podej�cie do r�nych spraw mnie irytuje. 
    B_LogEntry                     (CH1_Nieroby,"Marudny my�liwy zacz�� na mnie krzycze� i ��da� zap�aty za swoj� prac�. Ponadto zarzuca Alexowi z�e zarz�dzanie obozem.");

    B_GiveXP (50);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Hunter_HELLO2 (C_INFO)
{
   npc          = NON_5606_Hunter;
   nr           = 2;
   condition    = DIA_Hunter_HELLO2_Condition;
   information  = DIA_Hunter_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chyba musz� nauczy� ci� kultury.";
};

FUNC INT DIA_Hunter_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO1))
	&& (Mis_Nieroby == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Olivier_HELLO3))
	&& (!Npc_KnowsInfo (hero, DIA_Hunter_Odejdz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hunter_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Hunter_HELLO2_15_01"); //Chyba musz� nauczy� ci� kultury.
    AI_Output (self, other ,"DIA_Hunter_HELLO2_03_02"); //No! Dawaj!

    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Hunter_HELLO3 (C_INFO)
{
   npc          = NON_5606_Hunter;
   nr           = 3;
   condition    = DIA_Hunter_HELLO3_Condition;
   information  = DIA_Hunter_HELLO3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hunter_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO2))
    &&  (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hunter_HELLO3_Info()
{
    AI_Output (self, other ,"DIA_Hunter_HELLO3_03_01"); //Cholera. Moja g�owa.
    AI_Output (other, self ,"DIA_Hunter_HELLO3_15_02"); //We�miesz si� do roboty czy nie?
    AI_Output (self, other ,"DIA_Hunter_HELLO3_03_03"); //Ech, dobra. Zejd� mi z oczu.
    B_LogEntry                     (CH1_Nieroby,"U�y�em twardych argument�w, �eby przekona� marudnego my�liwego do pracy.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Odejdz
//========================================

INSTANCE DIA_Hunter_Odejdz (C_INFO)
{
   npc          = NON_5606_Hunter;
   nr           = 1;
   condition    = DIA_Hunter_Odejdz_Condition;
   information  = DIA_Hunter_Odejdz_Info;
   permanent	= FALSE;
   description	= "Wyno� si� z obozu!";
};

FUNC INT DIA_Hunter_Odejdz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Narzekanie))
    && (!Npc_KnowsInfo (hero, DIA_Hunter_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hunter_Odejdz_Info()
{
    AI_Output (other, self ,"DIA_Hunter_Odejdz_15_01"); //Wyno� si� z obozu!
    AI_Output (other, self ,"DIA_Hunter_Odejdz_15_02"); //Nikt ci� tu nie potrzebuje.
    AI_Output (self, other ,"DIA_Hunter_Odejdz_03_03"); //Sami tego chcieli�cie.
    B_LogEntry                     (CH1_Nieroby,"Marudny my�liwy zosta� wyrzucony z obozu. ");
    Npc_ExchangeRoutine (self, "wypad");
    AI_StopProcessInfos	(self);
};