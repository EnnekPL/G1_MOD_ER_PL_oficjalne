//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Spike_EXIT(C_INFO)
{
	npc             = GRD_7005_Spike;
	nr              = 999;
	condition		= DIA_Spike_EXIT_Condition;
	information		= DIA_Spike_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Spike_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Spike_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Spike_HELLO1 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 1;
   condition    = DIA_Spike_HELLO1_Condition;
   information  = DIA_Spike_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Spike_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Spike_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Spike_HELLO1_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Spike_HELLO1_03_02"); //Nie wida�? Zejd� mi z oczu!
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Spike_HELLO2 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 2;
   condition    = DIA_Spike_HELLO2_Condition;
   information  = DIA_Spike_HELLO2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Spike_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KUCHARZ_OreGiveZaplata))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_HELLO2_Info()
{
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_01"); //To ty za�atwi�e� t� spraw� z Kopaczami.
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_02"); //Wielkie dzi�ki! R�wny z ciebie go��. Nie mog� ci du�o zaoferowa�. Mam tu ca�kiem fajny miecz. Na pocz�tek b�dzie dla ciebie w sam raz.
    AI_Output (other, self ,"DIA_Spike_HELLO2_15_03"); //Dzi�ki. Bro� zawsze si� przyda.
	
    B_LogEntry                     (CH1_SpikeLoser,"Spike by� bardzo zadowolony z moich dzia�a�. Zyska�em kolejnego sojusznika w obozie.");
    Log_SetTopicStatus       (CH1_SpikeLoser, LOG_SUCCESS);
    MIS_SpikeLoser = LOG_SUCCESS;
    B_GiveXP (100);
	CreateInvItems (self,ItMw_1H_Sword_Short_05,1);
	B_GiveInvItems (self,other,ItMw_1H_Sword_Short_05,1);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Spike_HELLO3 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 3;
   condition    = DIA_Spike_HELLO3_Condition;
   information  = DIA_Spike_HELLO3_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Spike_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Spike_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Spike_HELLO3_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Spike_HELLO3_03_02"); //W obozie panuje spok�j, wi�c mam ma�o pracy. Zreszt� poza tob� nikt nie kr�ci si� wok� skrzy�.
};

//========================================
//-----------------> AklWorker
//========================================

INSTANCE DIA_Spike_AklWorker (C_INFO)
{
   npc          		= GRD_7005_Spike;
   nr           		= 1;
   condition    	= DIA_Spike_AklWorker_Condition;
   information  	= DIA_Spike_AklWorker_Info;
   permanent	= FALSE;
   description	= "Pracowa� mo�e dla ciebie ostatnio Akl?";
};

FUNC INT DIA_Spike_AklWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Akl_ore))
    && (hero_knows_hysenfinder == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_AklWorker_Info()
{
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_01"); //Pracowa� mo�e dla ciebie ostatnio Akl?
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_02"); //Hmm? Czego ty chcesz?
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_03"); //Akl powiedzia� mi, �e nosi� ostatnio dla ciebie skrzynie. Pono� zap�aci�e� mu za robot� 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_04"); //CO? Ten robak nic nie zrobi� od kiedy wyszed� z Kopalni. Ci�gle tylko siedzi i my�li nie wiadomo o czym.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_05"); //50 bry�ek rudy za noszenie skrzy�? A to dobre! W �yciu bym nikomu tyle nie zap�aci�. 
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_06"); //Rozumiem, �e mam si� czu� oszukany.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_07"); //Chyba tak. Spadaj ju�. Jestem zaj�ty. 
    B_LogEntry                     (CH1_OreInOM,"Spike wy�mia� mnie, gdy zapyta�em czy Akl faktycznie mu ostatnio pomaga�. Chyba musz� jeszcze raz pogada� z Kopaczem. ");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

