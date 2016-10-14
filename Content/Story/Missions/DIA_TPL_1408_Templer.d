//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_TemplerCitadel_EXIT(C_INFO)
{
	npc             = TPL_1408_Templer;
	nr              = 999;
	condition		= DIA_TemplerCitadel_EXIT_Condition;
	information		= DIA_TemplerCitadel_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_TemplerCitadel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TemplerCitadel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Citadel
//========================================

INSTANCE DIA_Templer_Citadel (C_INFO)
{
   npc          = TPL_1408_Templer;
   nr           = 1;
   condition    = DIA_Templer_Citadel_Condition;
   information  = DIA_Templer_Citadel_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_Citadel_Condition()
{
    if (MeetTemplerInCitadel == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_Citadel_Info()
{
    AI_Output (self, other ,"DIA_Templer_Citadel_03_01"); //A wiêc mistrz Baal Cadar mia³ racjê. Przyszed³eœ. Mówi³, ¿e masz wierne serce. Nieskoñczona jest m¹droœæ Guru.
    AI_Output (other, self ,"DIA_Templer_Citadel_15_02"); //Witaj. Wiesz po co tu jestem? Uda³o ci siê coœ znaleŸæ?
    AI_Output (self, other ,"DIA_Templer_Citadel_03_03"); //Myœlê, ¿e odpowiedzi¹ na nasze pytanie jest bestia. 
    AI_Output (other, self ,"DIA_Templer_Citadel_15_04"); //Faktycznie. To monstrum nie wygl¹da na typow¹ faunê tego miejsca. 
    AI_Output (self, other ,"DIA_Templer_Citadel_03_05"); //Zapewne zosta³o tu przyzwane przez magiczne moce. 
    AI_Output (other, self ,"DIA_Templer_Citadel_15_06"); //Wszystkiego dowiemy siê, gdy ta bestia przestanie dychaæ.
    AI_Output (self, other ,"DIA_Templer_Citadel_03_07"); //A wiêc bêdê kroczy³ tu¿ za tob¹.
    B_LogEntry                     (CH3_TestGuru,"Na szczycie Cytadeli spotka³em Stra¿nika Œwi¹tynnego. W tutejszej okolicy grasuje nieznana mi bestia. Stra¿nik uwa¿a, ¿e zosta³a przyzwana magiczne. Byæ mo¿e jej zabicie da nam jakieœ wskazówki. I tak nie moglibyœmy zacz¹æ poszukiwañ dopóki to coœ siê tu czai. ");
    Npc_ExchangeRoutine (self, "FOLLOW");
    AI_StopProcessInfos	(self);
};

