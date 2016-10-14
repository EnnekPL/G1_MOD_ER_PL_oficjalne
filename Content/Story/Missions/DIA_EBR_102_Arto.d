//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ARTO_EXIT(C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 999;
	condition	= DIA_ARTO_EXIT_Condition;
	information	= DIA_ARTO_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ARTO_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_ARTO_Hello (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_Hello_Condition;
	information	= DIA_ARTO_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_ARTO_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_Hello_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_ARTO_Hello_13_01"); //Jestem Arto.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_ARTO_What (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_What_Condition;
	information	= DIA_ARTO_What_Info;
	permanent	= 0;
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC INT DIA_ARTO_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_What_Info()
{	
	AI_Output (other, self,"DIA_ARTO_What_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_ARTO_What_13_01"); //Jestem stra¿nikiem Gomeza.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_ARTO_PERM (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_PERM_Condition;
	information	= DIA_ARTO_PERM_Info;
	permanent	= 1;
	description = "Nie lubisz du¿o gadaæ, co?";
};                       

FUNC INT DIA_ARTO_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_What))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_PERM_Info()
{	
	AI_Output (other, self,"DIA_ARTO_PERM_15_00"); //Nie lubisz du¿o gadaæ, co?
	AI_Output (self, other,"DIA_ARTO_PERM_13_01"); //Nie.
};

//========================================
//-----------------> Eskorta1
//========================================

INSTANCE DIA_Arto_Eskorta1 (C_INFO)
{
   npc          = Ebr_102_Arto;
   nr           = 1;
   condition    = DIA_Arto_Eskorta1_Condition;
   information  = DIA_Arto_Eskorta1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arto_Eskorta1_Condition()
{
    if (Npc_GetTrueGuild (hero ) == GIL_GRD) && (Kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arto_Eskorta1_Info()
{
    AI_Output (self, other ,"DIA_Arto_Eskorta1_03_01"); //Hej, Stra¿niku!
    AI_Output (self, other ,"DIA_Arto_Eskorta1_03_02"); //Mam dla ciebie zadanie.
    AI_Output (other, self ,"DIA_Arto_Eskorta1_15_03"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Arto_Eskorta1_03_04"); //Bêdziesz mnie eskortowaæ do Starej Kopalni.
    AI_Output (self, other ,"DIA_Arto_Eskorta1_03_05"); //Mam sprawdziæ sytuacjê w obozie.
	AI_Output (self, other ,"DIA_Arto_Eskorta1_03_06"); //Powiedz, gdy bêdziesz gotów.
	
    MIS_ArtosSafeGuard = LOG_RUNNING;

    Log_CreateTopic            (CH3_ArtosSafeGuard, LOG_MISSION);
    Log_SetTopicStatus       (CH3_ArtosSafeGuard, LOG_RUNNING);
    B_LogEntry                     (CH3_ArtosSafeGuard,"Muszê eskortowaæ Arto do obozu przed Star¹ Kopalni¹. No có¿... Magnat ka¿e, Stra¿nik robi.");
};

//========================================
//-----------------> LetsGo
//========================================

INSTANCE DIA_Arto_LetsGo (C_INFO)
{
   npc          = Ebr_102_Arto;
   nr           = 2;
   condition    = DIA_Arto_LetsGo_Condition;
   information  = DIA_Arto_LetsGo_Info;
   permanent	= FALSE;
   description	= "Jestem gotowy!";
};

FUNC INT DIA_Arto_LetsGo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Arto_Eskorta1))
    && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arto_LetsGo_Info()
{
    AI_Output (other, self ,"DIA_Arto_LetsGo_15_01"); //Jestem gotowy!
    AI_Output (self, other ,"DIA_Arto_LetsGo_03_02"); //ChodŸ za mn¹!
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"eskorta");
    AI_StopProcessInfos	(self);
	
	Wld_InsertNpc				(bandyta5,"OW_PATH_248");
	Wld_InsertNpc				(bandyta14,"MOVMENT_MOLERATS_OCWOOD");
	Wld_InsertNpc				(bandyta6,"PTH4");
	Wld_InsertNpc				(bandyta7,"OW_PATH_264");
	Wld_InsertNpc				(bandyta15,"OW_PATH_262");
	Wld_InsertNpc				(bandyta11,"OW_PATH_260");
	Wld_InsertNpc				(bandyta13,"OW_PATH_258");
	Wld_InsertNpc				(bandyta2,"OW_PATH_255");
};

//========================================
//-----------------> Doszlem
//========================================

INSTANCE DIA_Arto_Doszlem (C_INFO)
{
   npc          = Ebr_102_Arto;
   nr           = 3;
   condition    = DIA_Arto_Doszlem_Condition;
   information  = DIA_Arto_Doszlem_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arto_Doszlem_Condition()
{
    if (Npc_GetDistToWP (self, "OW_OM_ENTRANCE01") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Arto_LetsGo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arto_Doszlem_Info()
{
    AI_Output (self, other ,"DIA_Arto_Doszlem_03_01"); //Jesteœmy!
    AI_Output (self, other ,"DIA_Arto_Doszlem_03_02"); //Dobra robota, Stra¿niku!
    B_LogEntry                     (CH3_ArtosSafeGuard,"Odprowadzi³em Arto do obozu. Uda³ siê w kierunku swojego namiotu.");
    Log_SetTopicStatus       (CH3_ArtosSafeGuard, LOG_SUCCESS);
    MIS_ArtosSafeGuard = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"kox");
    B_GiveXP (150); //1.25 zrównowa¿one
    AI_Output (self, other ,"DIA_Arto_Doszlem_03_03"); //Je¿eli bêdziesz czegoœ potrzebowaæ, to jestem w swoim namiocie.
    CreateInvItems (self, ItMiNugget, 100); //1.25
    B_GiveInvItems (self, other, ItMiNugget, 100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Succes_Ian_Arto_Quest
//========================================

INSTANCE DIA_Arto_Succes_Ian_Arto_Quest (C_INFO)
{
   npc          = EBR_102_Arto;
   nr           = 1;
   condition    = DIA_Arto_Succes_Ian_Arto_Quest_Condition;
   information  = DIA_Arto_Succes_Ian_Arto_Quest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arto_Succes_Ian_Arto_Quest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_QuestIan_Succes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arto_Succes_Ian_Arto_Quest_Info()
{
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_01"); //Hej ty! To ty bada³eœ sprawê dostaw ¿ywnoœci do kopalni?
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_02"); //Tak, to ja.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_03"); //Rozmawia³em ze Snafem. Twierdzi, ¿e dostawy by³y niezgodne z zamówieniami.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_04"); //Osobiœcie pokaza³ mi swoje notatki, które by³y jak najbardziej prawid³owe.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_05"); //Uzna³em, ¿e stoi za tym ktoœ z tego obozu i zdecydowa³em siê przybyæ tu jak najszybciej.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_06"); //Dowiedzia³eœ siê czegoœ istotnego?
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_07"); //Tak, stoi za tym Mirzo.
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_08"); //Wymyka³ siê potajemnie noc¹ i ubija³ interesy z kilkoma Szkodnikami.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_09"); //Ach tak, Mirzo... Kojarzê go.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_10"); //W takim razie spotka go zas³u¿ona kara.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_11"); //Moi ludzie od razu zaprowadz¹ go do zamku w Starym Obozie, ¿eby odpowiedzia³ przed Gomezem.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_12"); //Œwietnie siê spisa³eœ, ch³opcze. 
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_13"); //Porozmawiaj z Ianem, z pewnoœci¹ ciê wynagrodzi.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_14"); //Ja tymczasem wracam do zamku. Mo¿e kiedyœ siê tam spotkamy.
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_15"); //Oczywiœcie.
    B_LogEntry                     (CH1_FoodForOldMine,"Pozna³em Arto - przywódcê obozu przed kopalni¹, który na co dzieñ zamieszkuje zamek Starego Obozu. Powiedzia³, ¿e zaprowadzi Mirzo przed oblicze Gomeza. Ja tymczasem powinienem wracaæ do Iana. ");

    B_GiveXP (100);
    Npc_ExchangeRoutine (self, "START");
Npc_ExchangeRoutine (GRD_7007_Mirzo, "lochy");
    AI_StopProcessInfos	(self);
};

