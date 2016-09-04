//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Eskorta_HELLO1 (C_INFO)
{
   npc          = GRD_5055_Eskorta;
   nr           = 1;
   condition    = DIA_Eskorta_HELLO1_Condition;
   information  = DIA_Eskorta_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mamy eskortowa� konw�j, czy� nie?";
};

FUNC INT DIA_Eskorta_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_QuestGRD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Eskorta_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Eskorta_HELLO1_15_01"); //Mamy eskortowa� konw�j, czy� nie?
    AI_Output (self, other ,"DIA_Eskorta_HELLO1_03_02"); //Tak. Poprowadzisz nas do kopalni.
    AI_Output (self, other ,"DIA_Eskorta_HELLO1_03_03"); //Tylko musisz uwa�a� na Bandyt�w.
    AI_Output (self, other ,"DIA_Eskorta_HELLO1_03_04"); //Powiedz, gdy b�dziesz gotowy.
    B_LogEntry                     (CH1_EskortaKopaczy,"Mam si� zg�osi�, gdy b�d� gotowy do wyj�cia.");
};

//========================================
//-----------------> Go
//========================================

INSTANCE DIA_Eskorta_Go (C_INFO)
{
   npc          = GRD_5055_Eskorta;
   nr           = 2;
   condition    = DIA_Eskorta_Go_Condition;
   information  = DIA_Eskorta_Go_Info;
   permanent	= FALSE;
   description	= "Chod�my.";
};

FUNC INT DIA_Eskorta_Go_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Eskorta_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Eskorta_Go_Info()
{
    AI_Output (other, self ,"DIA_Eskorta_Go_15_01"); //Chod�my.
    AI_Output (self, other ,"DIA_Eskorta_Go_03_02"); //Pami�taj, �e przed Obozem siedzi dw�ch Kopaczy.
    AI_Output (self, other ,"DIA_Eskorta_Go_03_03"); //Ich te� musimy ze sob� zabra�.
	
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"FOLLOW");
	GRD_5054_Gardist.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (GRD_5054_Gardist,"FOLLOW");
	GRD_5053_Gardist.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (GRD_5053_Gardist,"FOLLOW");
	VLK_5089_Tragaz.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (VLK_5089_Tragaz,"FOLLOW");	
	VLK_5088_Tragaz.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (VLK_5088_Tragaz,"FOLLOW");
	VLK_5090_Tragaz.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (VLK_5090_Tragaz,"FOLLOW");	
	
	//resp bandyt�w
	Wld_InsertNpc				(bandyta8,"ESKORTA2");
	Wld_InsertNpc				(bandyta4,"OW_PATH_252");
	Wld_InsertNpc				(bandyta2,"BANDYTA_RESP1");
	Wld_InsertNpc				(bandyta7,"OW_PATH_256");
	Wld_InsertNpc				(bandyta6,"OW_PATH_258");
	Wld_InsertNpc				(bandyta5,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc				(bandyta3,"OW_PATH_259");
	Wld_InsertNpc				(bandyta2,"OW_PATH_261");
	
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Eskorta_HELLO3 (C_INFO)
{
   npc          = GRD_5055_Eskorta;
   nr           = 3;
   condition    = DIA_Eskorta_HELLO3_Condition;
   information  = DIA_Eskorta_HELLO3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Eskorta_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Eskorta_Go))
    && (Npc_GetDistToWP (self, "OW_OM_ENTRANCE01") < 1700)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Eskorta_HELLO3_Info()
{
    AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_01"); //To tutaj. Zobaczmy, ilu mamy ludzi.
    if (Npc_IsDead(VLK_5090_Tragaz)) || (Npc_IsDead(VLK_5088_Tragaz)) || (Npc_IsDead(VLK_5089_Tragaz))
    {
        AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_02"); //Nie uda�o nam si� doprowadzi� wszystkich Kopaczy do celu.
        AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_03"); //Thorus nie b�dzie zadowolony.
        B_LogEntry                     (CH1_EskortaKopaczy,"Skopali�my spraw�. Nie wszyscy tragarze prze�yli.");
        Log_SetTopicStatus       (CH1_EskortaKopaczy, LOG_FAILED);
        MIS_EskortaKopaczy = LOG_FAILED;
		//PrintScreen	("Anulowano zadanie: Eskorta kopaczy! ", 1,-1,"font_new_10_red.tga",2);	
    }
    else
    {
        AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_04"); //�wietna robota!
        AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_05"); //Wszyscy tragarze dotarli w jednym kawa�ku.
        B_LogEntry                     (CH1_EskortaKopaczy,"Doprowadzili�my bezpiecznie Kopaczy do obozu przed kopalni�. Dobra robota.");
        Log_SetTopicStatus       (CH1_EskortaKopaczy, LOG_SUCCESS);
        MIS_EskortaKopaczy = LOG_SUCCESS;
		
		if (Npc_IsDead(GRD_5054_Gardist)) || (Npc_IsDead(GRD_5053_Gardist)) || (Npc_IsDead(GRD_5055_Eskorta))
		{
		AI_Output (self, other ,"DIA_Eskorta_HELLO3_03_06"); //Niestety, nie obesz�o si� bez strat.
		B_Givexp (300);
		}
		else
		{
		B_Givexp (500);
		};
    };
	//stra�nicy wracaj� do Starego Obozu
	Npc_ExchangeRoutine (GRD_5055_Eskorta,"start");
	GRD_5055_Eskorta.aivar[AIV_PARTYMEMBER] = FALSE;
	if (!Npc_IsDead(GRD_5054_Gardist))
	{
    Npc_ExchangeRoutine (GRD_5054_Gardist,"start");
	GRD_5054_Gardist.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (!Npc_IsDead(GRD_5053_Gardist))
	{
    Npc_ExchangeRoutine (GRD_5053_Gardist,"start");
	GRD_5053_Gardist.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	
	//tragarze
	if (!Npc_IsDead(VLK_5089_Tragaz))
	{
    Npc_ExchangeRoutine (VLK_5089_Tragaz,"camp");	
	VLK_5089_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (!Npc_IsDead(VLK_5088_Tragaz))
	{
	VLK_5088_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (VLK_5088_Tragaz,"camp");
	};
	if (!Npc_IsDead(VLK_5088_Tragaz))
	{
	VLK_5088_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (VLK_5090_Tragaz,"camp");
	};	
    AI_StopProcessInfos	(self);
};