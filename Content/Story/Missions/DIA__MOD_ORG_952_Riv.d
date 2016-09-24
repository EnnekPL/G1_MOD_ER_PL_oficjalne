//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Riv_EXIT(C_INFO)
{
	npc             = ORG_952_Riv;
	nr              = 999;
	condition		= DIA_Riv_EXIT_Condition;
	information		= DIA_Riv_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Riv_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Riv_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ImportanQuest
//========================================

INSTANCE DIA_Organisator_ImportanQuest (C_INFO)
{
   npc          = ORG_952_Riv;
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
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_01"); //No, wreszcie ktoœ, kto siê mo¿e przydaæ!
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_02"); //Czego ode mnie chcesz?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_03"); //Pomo¿esz mi i moim ludziom dostaæ siê do chaty rybackiej przy jeziorze.
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_04"); //Dla kogo pracujesz?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_05"); //Dla Ry¿owego Ksiêcia.
    AI_Output (other, self ,"DIA_Organisator_ImportanQuest_15_06"); //Co jest trudnego w przejœciu przez ³¹kê?
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_07"); //Z ³¹k¹ nie powinno byæ wiêkszych problemów. Bardziej mnie martwi¹ topielce, które rozpanoszy³y siê na wybrze¿u.
    AI_Output (self, other ,"DIA_Organisator_ImportanQuest_03_09"); //To jak? Pomo¿esz nam?
    MIS_LurkersInHut = LOG_RUNNING;

    Log_CreateTopic          (CH1_LurkersInHut, LOG_MISSION);
    Log_SetTopicStatus       (CH1_LurkersInHut, LOG_RUNNING);
    B_LogEntry               (CH1_LurkersInHut,"Szkodnik Riv pracuj¹cy dla Ry¿owego Ksiêcia chce, abym pomóg³ mu i jego ludziom dostaæ siê do chaty rybackiej przy jeziorze.");
};
//========================================
//-----------------> GO
//========================================

INSTANCE DIA_Organisator_GO (C_INFO)
{
   npc          = ORG_952_Riv;
   nr           = 1;
   condition    = DIA_Organisator_GO_Condition;
   information  = DIA_Organisator_GO_Info;
   permanent	= FALSE;
   description	= "ChodŸmy nad to jezioro!";
};

FUNC INT DIA_Organisator_GO_Condition()
{
    if (MIS_LurkersInHut == LOG_RUNNING) && (!Npc_KnowsInfo (hero, DIA_Organisator_SPADAJ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_GO_Info()
{
    AI_Output (other, self ,"DIA_Organisator_GO_15_01"); //ChodŸmy nad to jezioro!
    AI_Output (self, other ,"DIA_Organisator_GO_03_02"); //Dobra. ChodŸ za mn¹!
    AI_Output (self, other ,"DIA_Organisator_GO_03_03"); //Moi ludzie pójd¹ za tob¹.
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
};

//========================================
//-----------------> SPADAJ
//========================================

INSTANCE DIA_Organisator_SPADAJ (C_INFO)
{
   npc          = ORG_952_Riv;
   nr           = 2;
   condition    = DIA_Organisator_SPADAJ_Condition;
   information  = DIA_Organisator_SPADAJ_Info;
   permanent	= FALSE;
   description	= "Nie mam czasu.";
};

FUNC INT DIA_Organisator_SPADAJ_Condition()
{
    if (MIS_LurkersInHut == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Organisator_GO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_SPADAJ_Info()
{
    AI_Output (other, self ,"DIA_Organisator_SPADAJ_15_01"); //Nie mam czasu.
    AI_Output (self, other ,"DIA_Organisator_SPADAJ_03_02"); //Trudno. Musimy spróbowaæ sami.
    Log_SetTopicStatus       (CH1_LurkersInHut, LOG_FAILED);
    MIS_LurkersInHut = LOG_FAILED;
	//PrintScreen	("Anulowano zadanie: Rybacka chata! ", 1,-1,"font_new_10_red.tga",2);	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NaMiejscu
//========================================

INSTANCE DIA_Organisator_NaMiejscu (C_INFO)
{
   npc          = ORG_952_Riv;
   nr           = 3;
   condition    = DIA_Organisator_NaMiejscu_Condition;
   information  = DIA_Organisator_NaMiejscu_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_NaMiejscu_Condition()
{
    if (MIS_LurkersInHut == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Organisator_GO))
    && (Npc_GetDistToWP (self, "LOCATION_23_02") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_NaMiejscu_Info()
{
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_01"); //Dotarliœmy na miejsce.
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_02"); //Wielkie dziêki. Zaraz zabieramy siê do pracy.
    AI_Output (self, other ,"DIA_Organisator_NaMiejscu_03_03"); //Wkrótce bêdziesz móg³ u nas kupiæ œwie¿e ryby. WeŸ tê ksi¹¿kê kucharsk¹ w nagrodê.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"U Riva wkrótce bêdê móg³ zakupiæ trochê ryb.");   
	B_LogEntry      (CH1_LurkersInHut,"Zaprowadzi³em Riva i jego ludzi na miejsce.");
    Log_SetTopicStatus       (CH1_LurkersInHut, LOG_SUCCESS);
    MIS_LurkersInHut = LOG_SUCCESS;
	self.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (self, "camp");
	CreateInvItems (self, ItFo_Fish, 15);
	CreateInvItems (self, JajoSca2, 30);
	CreateInvItems (self, ItFo_MoleratW, 30);
	
	CreateInvItems (self, itmi_bait_01, 30);
	CreateInvItems (self, itmi_bait_02, 7);
    B_GiveXP (XP_LurkersInHut);
	AI_StopProcessInfos	(self);
    CreateInvItems (self, RezepturenFish, 1);
    B_GiveInvItems (self, other, RezepturenFish, 1);
	ORG_951_Organisator.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (ORG_951_Organisator, "camp");
	ORG_950_Organisator.aivar[AIV_PARTYMEMBER] = false;
    Npc_ExchangeRoutine (ORG_950_Organisator, "camp");
    

};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Organisator_TRADE (C_INFO)
{
   npc          = ORG_952_Riv;
   nr           = 1;
   condition    = DIA_Organisator_TRADE_Condition;
   information  = DIA_Organisator_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy!";
};

FUNC INT DIA_Organisator_TRADE_Condition()
{
    if (MIS_LurkersInHut == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Organisator_TRADE_15_01"); //Pohandlujmy!
    AI_Output (self, other ,"DIA_Organisator_TRADE_03_02"); //Jasne! Mam œwie¿e ryby.
};


