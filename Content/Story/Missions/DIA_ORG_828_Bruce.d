//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bruce_EXIT(C_INFO)
{
	npc             = ORG_828_Bruce;
	nr              = 999;
	condition	= DIA_Bruce_EXIT_Condition;
	information	= DIA_Bruce_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bruce_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bruce_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ANGRY
//========================================

INSTANCE DIA_Bruce_ANGRY (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 1;
   condition    = DIA_Bruce_ANGRY_Condition;
   information  = DIA_Bruce_ANGRY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bruce_ANGRY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mazin_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bruce_ANGRY_Info()
{
    AI_Output (self, other ,"DIA_Bruce_ANGRY_03_01"); //Sko�czyli�my ju� zabaw� z twoim kole�k�. Pora na ciebie.
    AI_Output (self, other ,"DIA_Bruce_ANGRY_03_02"); //Bra� go, ch�opcy!
    B_LogEntry                     (CH2_MissedSpy,"Gor Na Lin nie �yje. Zabili go Bruce i jego ludzie. Przegrywaj�c walk� z Mazinem, po�o�y�em to zadanie...");
    Log_SetTopicStatus       (CH2_MissedSpy, LOG_FAILED);
    MIS_MissedSpy = LOG_FAILED;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Bruce_HELLO1 (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 1;
   condition    = DIA_Bruce_HELLO1_Condition;
   information  = DIA_Bruce_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Bruce_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bruce_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Bruce_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Bruce_HELLO1_03_02"); //Twoim najgorszym koszmarem, je�li natychmiast nie wyniesiesz si� st�d! ZEJD� MI Z OCZU!
};

//========================================
//-----------------> KARCZMA_1
//========================================

INSTANCE DIA_Bruce_KARCZMA_1 (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 1;
   condition    = DIA_Bruce_KARCZMA_1_Condition;
   information  = DIA_Bruce_KARCZMA_1_Info;
   permanent	= FALSE;
   description	= "Na zdrowie!";
};

FUNC INT DIA_Bruce_KARCZMA_1_Condition()
{
    if (Wld_IsTime     (20,00,02,00)) && (Npc_KnowsInfo (hero, DIA_Bruce_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bruce_KARCZMA_1_Info()
{
    AI_Output (other, self ,"DIA_Bruce_KARCZMA_1_15_01"); //Na zdrowie!
    AI_Output (self, other ,"DIA_Bruce_KARCZMA_1_03_02"); //Czego ty u licha chcesz? Nie gadam z ��todziobami, wi�c zejd� mi z oczu, pokrako!
    AI_Output (other, self ,"DIA_Bruce_KARCZMA_1_15_03"); //Spokojnie, chcia�em tylko chwil� pogada�.
    AI_Output (self, other ,"DIA_Bruce_KARCZMA_1_03_04"); //Nawet o tym nie my�l, do diaska! Nie b�d� gada� z kim� takim jak ty.
    AI_Output (self, other ,"DIA_Bruce_KARCZMA_1_03_05"); //A TERAZ WON, BO PORACHUJ� CI KO�CI!
};

//========================================
//-----------------> BITKA2
//========================================

INSTANCE DIA_Bruce_BITKA2 (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 2;
   condition    = DIA_Bruce_BITKA2_Condition;
   information  = DIA_Bruce_BITKA2_Info;
   permanent	= FALSE;
   description	= "Chcia�em tylko...";
};

FUNC INT DIA_Bruce_BITKA2_Condition()
{
    if (Wld_IsTime     (20,00,02,00))
    && (Npc_KnowsInfo (hero, DIA_Bruce_KARCZMA_1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bruce_BITKA2_Info()
{
    AI_Output (other, self ,"DIA_Bruce_BITKA2_15_01"); //Chcia�em tylko...
    AI_Output (self, other ,"DIA_Bruce_BITKA2_03_02"); //Naprawd� g�wno mnie to obchodzi! Zaraz pogruchotam ci szcz�k�!
    AI_Output (self, other ,"DIA_Bruce_BITKA2_03_03"); //Stawaj do walki, kundlu!
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> WYGRANA_BITKA
//========================================

INSTANCE DIA_Bruce_WYGRANA_BITKA (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 3;
   condition    = DIA_Bruce_WYGRANA_BITKA_Condition;
   information  = DIA_Bruce_WYGRANA_BITKA_Info;
   permanent	= FALSE;
   description	= "To jak, teraz mnie wys�uchasz?";
};

FUNC INT DIA_Bruce_WYGRANA_BITKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bruce_BITKA2))
	&& (ORG_828_Bruce.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bruce_WYGRANA_BITKA_Info()
{
    AI_Output (other, self ,"DIA_Bruce_WYGRANA_BITKA_15_01"); //To jak, teraz mnie wys�uchasz?
    AI_Output (self, other ,"DIA_Bruce_WYGRANA_BITKA_03_02"); //Cios masz niez�y, ale wci�� nie zamierzam gada� z kim� takim jak ty. Id� sobie!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FAIL_BITKA
//========================================

INSTANCE DIA_Bruce_FAIL_BITKA (C_INFO)
{
   npc          = ORG_828_Bruce;
   nr           = 4;
   condition    = DIA_Bruce_FAIL_BITKA_Condition;
   information  = DIA_Bruce_FAIL_BITKA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bruce_FAIL_BITKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bruce_BITKA2)) && (ORG_828_Bruce.aivar[AIV_HASDEFEATEDSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bruce_FAIL_BITKA_Info()
{
    AI_Output (self, other ,"DIA_Bruce_FAIL_BITKA_03_01"); //Ha ha ha! A nie m�wi�em, �e jeste� tylko n�dznym ��todziobem?
    AI_Output (self, other ,"DIA_Bruce_FAIL_BITKA_03_02"); //Ciesz si�, �e uszed�e� z �yciem. A teraz zejd� mi oczu!
    AI_StopProcessInfos	(self);
};