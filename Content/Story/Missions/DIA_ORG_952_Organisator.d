// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rivator_EXIT(C_INFO)
{
	npc             = ORG_952_Organisator;
	nr              = 999;
	condition	= DIA_Rivator_EXIT_Condition;
	information	= DIA_Rivator_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rivator_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rivator_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ImportanQuest
//========================================

INSTANCE DIA_Organisator_ImportanQuest (C_INFO)
{
   npc          = ORG_952_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_ImportanQuest_Condition;
   information  = DIA_Organisator_ImportanQuest_Info;
   permanent	= FALSE;
   important	= true;
};

FUNC INT DIA_Organisator_ImportanQuest_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_ImportanQuest_Info()
{
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_01"); //No, wreszcie kto�, kto si� mo�e przyda�!
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_02"); //Czego ode mnie chcesz?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_03"); //Pomo�esz mi i moim ludziom dosta� si� do chaty rybackiej przy jeziorze.
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_04"); //Dla kogo pracujesz?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_05"); //Dla Ry�owego Ksi�cia.
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_06"); //Co jest trudnego w przej�ciu przez ��k�?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_07"); //Z ��k� nie powinno by� wi�kszych problem�w. Bardziej mnie martwi� topielce, kt�re rozpanoszy�y si� na wybrze�u.
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_09"); //To jak? Pomo�esz nam?
    MIS_TopielcewChacie = LOG_RUNNING;

    Log_CreateTopic            (CH1_TopielcewChacie, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TopielcewChacie, LOG_RUNNING);
    B_LogEntry                     (CH1_TopielcewChacie,"Szkodnik Riv pracuj�cy dla Ry�owego Ksi�cia chce, abym pom�g� mu i jego ludziom dosta� si� do chaty rybackiej przy jeziorze.");
};
//========================================
//-----------------> GO
//========================================

INSTANCE DIA_Organisator_GO (C_INFO)
{
   npc          = ORG_952_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_GO_Condition;
   information  = DIA_Organisator_GO_Info;
   permanent	= FALSE;
   description	= "Chod�my nad to jezioro!";
};

FUNC INT DIA_Organisator_GO_Condition()
{
    if (MIS_TopielcewChacie == LOG_RUNNING) && (!Npc_KnowsInfo (hero, DIA_Organisator_SPADAJ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_GO_Info()
{
    AI_Output (other, self ,"DIA_Organisator_GO_15_01"); //Chod�my nad to jezioro!
    AI_Output (self, other ,"DIA_Organisator_GO_03_02"); //Dobra. Chod� za mn�!
    AI_Output (self, other ,"DIA_Organisator_GO_03_03"); //Moi ludzie p�jd� za tob�.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "guide");
	 ORG_951_Organisator.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (ORG_951_Organisator, "follow");
	ORG_950_Organisator.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (ORG_950_Organisator, "follow");
	Wld_InsertNpc				(lurker,"RESP_RIV_QUEST");
	Wld_InsertNpc				(lurker,"RESP_RIV_QUEST");
	Wld_InsertNpc				(lurker,"RESP_RIV_QUEST"); //fixed g1210
    AI_StopProcessInfos	(self);
	
//dopisa� resp zwierz�t i doda� rytuny 
};

//========================================
//-----------------> SPADAJ
//========================================

INSTANCE DIA_Organisator_SPADAJ (C_INFO)
{
   npc          = ORG_952_Organisator;
   nr           = 2;
   condition    = DIA_Organisator_SPADAJ_Condition;
   information  = DIA_Organisator_SPADAJ_Info;
   permanent	= FALSE;
   description	= "Nie mam czasu.";
};

FUNC INT DIA_Organisator_SPADAJ_Condition()
{
    if (MIS_TopielcewChacie == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Organisator_GO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_SPADAJ_Info()
{
    AI_Output (other, self ,"DIA_Organisator_SPADAJ_15_01"); //Nie mam czasu.
    AI_Output (self, other ,"DIA_Organisator_SPADAJ_03_02"); //Trudno. Musimy spr�bowa� sami.
    Log_SetTopicStatus       (CH1_TopielcewChacie, LOG_FAILED);
    MIS_TopielcewChacie = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Rybacka chata! ", 1,-1,"font_new_10_red.tga",2);	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NaMiejscu
//========================================

INSTANCE DIA_Organisator_NaMiejscu (C_INFO)
{
   npc          = ORG_952_Organisator;
   nr           = 3;
   condition    = DIA_Organisator_NaMiejscu_Condition;
   information  = DIA_Organisator_NaMiejscu_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_NaMiejscu_Condition()
{
    if (MIS_TopielcewChacie == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Organisator_GO))
    && (Npc_GetDistToWP (self, "LOCATION_23_02") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_NaMiejscu_Info()
{
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_01"); //Dotarli�my na miejsce.
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_02"); //Wielkie dzi�ki. Zaraz zabieramy si� do pracy.
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_03"); //Wkr�tce b�dziesz m�g� u nas kupi� �wie�e ryby.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"U Riva wkr�tce b�d� m�g� zakupi� troch� ryb.");   
	B_LogEntry      (CH1_TopielcewChacie,"Zaprowadzi�em Riva i jego ludzi na miejsce.");
    Log_SetTopicStatus       (CH1_TopielcewChacie, LOG_SUCCESS);
    MIS_TopielcewChacie = LOG_SUCCESS;
	self.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "camp");
    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
	ORG_951_Organisator.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (ORG_951_Organisator, "camp");
	ORG_950_Organisator.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (ORG_950_Organisator, "camp");
    AI_StopProcessInfos	(self);
	CreateInvItems (self, ItFo_Fish, 15);
	CreateInvItems (self, JajoSca2, 30);
	CreateInvItems (self, ItFo_MoleratW, 30);
	
	CreateInvItems (self, itmi_bait_01, 30);
	CreateInvItems (self, itmi_bait_02, 7);
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Organisator_TRADE (C_INFO)
{
   npc          = ORG_952_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_TRADE_Condition;
   information  = DIA_Organisator_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy!";
};

FUNC INT DIA_Organisator_TRADE_Condition()
{
    if (MIS_TopielcewChacie == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Organisator_TRADE_15_01"); //Pohandlujmy!
    AI_Output (self, other ,"DIA_Organisator_TRADE_03_02"); //Jasne! Mam �wie�e ryby.
};


