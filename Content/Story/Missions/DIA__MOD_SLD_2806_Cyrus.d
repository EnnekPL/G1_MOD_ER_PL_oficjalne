// *Script was make in Easy Dialog Maker (EDM)
//sprawdzone gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Cyrus_EXIT(C_INFO)
{
	npc             = SLD_2806_Cyrus;
	nr              = 999;
	condition	= DIA_Cyrus_EXIT_Condition;
	information	= DIA_Cyrus_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Cyrus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cyrus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Cyrus_HELLO1 (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 1;
   condition    = DIA_Cyrus_HELLO1_Condition;
   information  = DIA_Cyrus_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Cyrus_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Cyrus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Cyrus_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Cyrus_HELLO1_03_02"); //Nazywam si� Cyrus. Podobnie jak ci Najemnicy, jestem my�liwym. 
    AI_Output (other, self ,"DIA_Cyrus_HELLO1_15_03"); //Co tutaj robicie?
    AI_Output (self, other ,"DIA_Cyrus_HELLO1_03_04"); //Polujemy na zwierzyn�, a potem zanosimy wszystko do Obozu.
    AI_Output (self, other ,"DIA_Cyrus_HELLO1_03_05"); //Przygotowujemy si� na ci�kie czasy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Cyrus_HELLO2 (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 2;
   condition    = DIA_Cyrus_HELLO2_Condition;
   information  = DIA_Cyrus_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jakie ci�kie czasy?";
};

FUNC INT DIA_Cyrus_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Cyrus_HELLO2_15_01"); //Jakie ci�kie czasy?
    AI_Output (self, other ,"DIA_Cyrus_HELLO2_03_02"); //Robi si� coraz ch�odniej. Nied�ugo mo�emy si� spodziewa� zimy.
    AI_Output (self, other ,"DIA_Cyrus_HELLO2_03_03"); //Poza tym orkowie zapuszczaj� si� coraz dalej. Wkr�tce zajm� nasze tereny �owieckie.
    AI_Output (self, other ,"DIA_Cyrus_HELLO2_03_04"); //To wszystko musi pr�dzej czy p�niej upa��.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Cyrus_HELLO3 (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 3;
   condition    = DIA_Cyrus_HELLO3_Condition;
   information  = DIA_Cyrus_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mog� wam jako� pom�c?";
};

FUNC INT DIA_Cyrus_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Cyrus_HELLO3_15_01"); //Mog� wam jako� pom�c?
    AI_Output (self, other ,"DIA_Cyrus_HELLO3_03_02"); //Je�eli szukasz sta�ej pracy, to tak.
    AI_Output (other, self ,"DIA_Cyrus_HELLO3_15_03"); //Co dok�adniej mia�bym robi�?
    AI_Output (self, other ,"DIA_Cyrus_HELLO3_03_04"); //Zg�aszaj si� tutaj codziennie po dostawy do Nowego Obozu.
    AI_Output (other, self ,"DIA_Cyrus_HELLO3_15_05"); //Gdzie dok�adniej mia�bym je zanie��?
    AI_Output (self, other ,"DIA_Cyrus_HELLO3_03_06"); //Do karczmy na jeziorze. To tam zbieramy jedzenie.
    AI_Output (self, other ,"DIA_Cyrus_HELLO3_03_07"); //Je�eli masz ch�� to czekam do 16.
	Log_CreateTopic (CH1_AllWorks,LOG_NOTE);
    B_LogEntry                     (CH1_AllWorks,"Mog� pracowa� jako tragarz dla Cyrusa. Mam zjawia� si� o godzinie 16. ");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Cyrus_HELLO4 (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 4;
   condition    = DIA_Cyrus_HELLO4_Condition;
   information  = DIA_Cyrus_HELLO4_Info;
   permanent	= TRUE;
   description	= "Przyszed�em po dostaw�.";
};

FUNC INT DIA_Cyrus_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_HELLO3))
    && (Wld_IsTime     (16,00,17,00))
    && (dzien != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Cyrus_HELLO4_15_01"); //Przyszed�em po dostaw�.
    AI_Output (self, other ,"DIA_Cyrus_HELLO4_03_02"); //Prosz� bardzo.
    CreateInvItems (self, dostawa_cyrusa, 1);
    B_GiveInvItems (self, other, dostawa_cyrusa, 1);
	dzien =	wld_getday();
};

//========================================
//-----------------> DOSTAWY
//========================================

INSTANCE DIA_Cyrus_DOSTAWY (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 1;
   condition    = DIA_Cyrus_DOSTAWY_Condition;
   information  = DIA_Cyrus_DOSTAWY_Info;
   permanent	= FALSE;
   description	= "Dlaczego op�niasz dostawy?";
};

FUNC INT DIA_Cyrus_DOSTAWY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_WORK_FIND))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_DOSTAWY_Info()
{
    AI_Output (other, self ,"DIA_Cyrus_DOSTAWY_15_01"); //Dlaczego op�niasz dostawy?
    AI_Output (self, other ,"DIA_Cyrus_DOSTAWY_03_02"); //Co? Jakie dostawy?!
    AI_Output (other, self ,"DIA_Cyrus_DOSTAWY_15_03"); //Chodzi mi o dostawy do obozu w Kotle. Okyl m�wi, �e strasznie si� sp�niasz.
    AI_Output (self, other ,"DIA_Cyrus_DOSTAWY_03_04"); //Co ten idiota sobie my�li!
    AI_Output (other, self ,"DIA_Cyrus_DOSTAWY_15_05"); //No wi�c... co z tymi dostawami?
    AI_Output (self, other ,"DIA_Cyrus_DOSTAWY_03_06"); //Nic! 
    B_LogEntry                     (CH1_PodejrzanyCyrus,"Cyrus nie jest zbyt rozmowny. My�l�, �e co� ukrywa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WYZWISKA
//========================================
//edit by Nocturn
INSTANCE DIA_Cyrus_WYZWISKA (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 1;
   condition    = DIA_Cyrus_WYZWISKA_Condition;
   information  = DIA_Cyrus_WYZWISKA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cyrus_WYZWISKA_Condition()
{
    if (MIS_PodejrzanyCyrus == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_WYZWISKA_Info()
{
    AI_Output (self, other ,"DIA_Cyrus_WYZWISKA_15_01"); //Ty sukinsynu! Wyno� si� st�d, albo dostaniesz.

	AI_GotoWP (hero, "SLD_HTS_WYPAD"); //waypoint do zmiany
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PO_TOBIE
//========================================

INSTANCE DIA_Cyrus_PO_TOBIE (C_INFO)
{
   npc          = SLD_2806_Cyrus;
   nr           = 2;
   condition    = DIA_Cyrus_PO_TOBIE_Condition;
   information  = DIA_Cyrus_PO_TOBIE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cyrus_PO_TOBIE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_WYZWISKA))
    && (Npc_GetDistToNpc(self, other) <= 800)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cyrus_PO_TOBIE_Info()
{
    AI_Output (self, other ,"DIA_Cyrus_PO_TOBIE_03_01"); //No to teraz po�a�ujesz! Mia�e� zej�� mi z oczu!
    AI_StopProcessInfos	(self);
	B_ChangeGuild    (SLD_2806_Cyrus,GIL_NONE); 
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

