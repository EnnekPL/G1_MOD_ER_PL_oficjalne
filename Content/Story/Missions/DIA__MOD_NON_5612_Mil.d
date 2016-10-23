// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Mil_EXIT(C_INFO)
{
	npc             = NON_5612_Mil;
	nr              = 999;
	condition	= DIA_Mil_EXIT_Condition;
	information	= DIA_Mil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Mil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Mil_HELLO1 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_HELLO1_Condition;
   information  = DIA_Mil_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Mil_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mil_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_01"); //Witaj, wêdrowcze. Nazywam siê Mil i jestem handlarzem.
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_02"); //Sprzedajê ró¿ne trofea i narzêdzia. Zapraszam.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
    B_LogEntry      (GE_TraderOW,"Mil w obozie myœliwych sprzedaje trofea zwierzêce i narzêdzia dla myœliwych.");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Mil_HELLO2 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 2;
   condition    = DIA_Mil_HELLO2_Condition;
   information  = DIA_Mil_HELLO2_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Mil_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mil_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Mil_HELLO2_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Mil_HELLO2_03_02"); //Jasne!
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Mil_HELLO3 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 3;
   condition    = DIA_Mil_HELLO3_Condition;
   information  = DIA_Mil_HELLO3_Info;
   permanent	= FALSE;
   description	= "Szukasz czegoœ konkretnego? ";
};

FUNC INT DIA_Mil_HELLO3_Condition()
{
	if (Kapitel < 4) 
	{
    return TRUE;
	};
};
FUNC VOID DIA_Mil_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_01"); //Szukasz czegoœ konkretnego? 
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_02"); //S³ysza³em, ¿e w Kolonii mo¿na spotkaæ bia³e wilki. S¹ niezwykle rzadkie. Gdybyœ przyniós³ mi jedn¹ skórê, to by³bym wdziêczny.
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_03"); //Gdzie znajdê te bia³e wilki?
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_04"); //Szukaj na wy¿ynach.
    MIS_FindWhiteSkin = LOG_RUNNING;

    Log_CreateTopic          (CH1_FindWhiteSkin, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_RUNNING);
    B_LogEntry               (CH1_FindWhiteSkin,"Mam upolowaæ bia³ego wilka i przynieœæ jego skórê Milowi. Zwierz¹t powinienem szukaæ na wy¿ynach.");
};

//========================================
//-----------------> Skin
//========================================

INSTANCE DIA_Mil_Skin (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_Skin_Condition;
   information  = DIA_Mil_Skin_Info;
   permanent	= FALSE;
   description	= "Mam skórê.";
};

FUNC INT DIA_Mil_Skin_Condition()
{
    if (MIS_FindWhiteSkin == LOG_RUNNING)
    && (Npc_HasItems (hero, ItAt_WolfWhite_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_Skin_Info()
{
    AI_Output (other, self ,"DIA_Mil_Skin_15_01"); //Mam skórê.
    AI_Output (self, other ,"DIA_Mil_Skin_03_02"); //Dobra robota, Zabierz j¹ teraz do Stanleya i powiedz, ¿eby wykona³ p³aszcz, który mi obieca³. 
    AI_Output (other, self ,"DIA_Mil_Skin_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Mil_Skin_03_04"); //Masz tu coœ za fatygê. Tylko wróæ do mnie z p³aszczem.
    B_LogEntry                     (CH1_FindWhiteSkin,"Skóra ma trafiæ do Stanleya. Myœliwy ma przygotowaæ z niej p³aszcz. ");
    B_GiveXP (150);
};
//========================================
//-----------------> PlaszczOK
//========================================

INSTANCE DIA_Mil_PlaszczOK (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_PlaszczOK_Condition;
   information  = DIA_Mil_PlaszczOK_Info;
   permanent	= FALSE;
   description	= "P³aszcz gotowy.";
};

FUNC INT DIA_Mil_PlaszczOK_Condition()
{
    if (MIS_FindWhiteSkin == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_PlaszczOK_Info()
{
    AI_Output (other, self ,"DIA_Mil_PlaszczOK_15_01"); //P³aszcz gotowy.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_02"); //Dobra robota. 
	Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_SUCCESS);
    MIS_FindWhiteSkin = LOG_SUCCESS;
	if (Kapitel < 4) && ((Npc_GetTrueGuild(other) != GIL_STT) || (Npc_GetTrueGuild(other) != GIL_GRD))
	{
	AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_03"); //Mam dla ciebie jeszcze jedno zlecenie.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_04"); //IdŸ do Starego Obozu i znajdŸ mi pasera, który dopilnuje, ¿eby ten p³aszcz trafi³ w rêce Magnata Blizny.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_05"); //Zrób to szybko. Gdy p³aszcz bêdzie jego, wróæ do mnie.  
    MIS_ScarMurder = LOG_RUNNING;
    Log_CreateTopic          (CH3_ScarMurder, LOG_MISSION);
    Log_SetTopicStatus       (CH3_ScarMurder, LOG_RUNNING);
    B_LogEntry               (CH3_ScarMurder,"Mam znaleŸæ kogoœ, kto sprzeda p³aszcz ze skóry wilka Magnatowi imieniem Blizna. Muszê szukaæ wœród handlarzy ze Starego Obozu.");
	}
	else
	{
	B_GiveInvItems (hero, self, ItMi_PancerzMil, 1);
	};
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BliznaDed
//========================================

INSTANCE DIA_Mil_BliznaDed (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_BliznaDed_Condition;
   information  = DIA_Mil_BliznaDed_Info;
   permanent	= FALSE;
   description	= "P³aszcz trafi w rêce Blizny.";
};

FUNC INT DIA_Mil_BliznaDed_Condition()
{
    if (MIS_ScarMurder == LOG_RUNNING) 
	&& ((oferta_fiska == true)
    || (Npc_KnowsInfo (hero, DIA_Whistler_SellPlaszcz))
   || (Npc_KnowsInfo (hero, DIA_Gravo_GiveItemPlaszcz)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_BliznaDed_Info()
{
    AI_Output (other, self ,"DIA_Mil_BliznaDed_15_01"); //P³aszcz trafi w rêce Blizny.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_02"); //Dobra robota. Je¿eli uda³o ci siê coœ przy tym zarobiæ, to mo¿esz zachowaæ to dla siebie.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_03"); //Ja otrzyma³em ju¿ swoj¹ czêœæ dzia³ki wczeœniej.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_04"); //Je¿eli masz chêæ na wiêcej, to idŸ do Nowego Obozu i znajdŸ Kosê.
    AI_Output (other, self ,"DIA_Mil_BliznaDed_15_05"); //Kosê? Czy on jest w to wszystko wmieszany? Dlaczego p³aszcz mia³ trafiæ do Blizny?
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_06"); //Pytania póŸniej. Powtórzê, jeœli chcesz dorobiæ, to idŸ do Kosy. 
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_07"); //No, ju¿. Nie zawracaj mi g³owy.
    B_LogEntry                     (CH3_ScarMurder,"Dziwne... Mil zachowywa³ siê podejrzanie. Powiedzia³, ¿e je¿eli chcê dorobiæ muszê pogadaæ z Kos¹. Mo¿e od niego dowiem siê, dlaczego p³aszcz mia³ trafiæ do Blizny.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
	
	var c_npc blizna; blizna = Hlp_GetNpc (EBR_101_Scar);
	Npc_RemoveInvItems (blizna, EBR_ARMOR_H2, 1);
	CreateInvItems 	(blizna, BLIZNA_ARMOR_H,1);
	AI_EquipBestArmor (blizna);
	Mdl_SetVisualBody (blizna,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 79,  1, BLIZNA_ARMOR_H);
};




