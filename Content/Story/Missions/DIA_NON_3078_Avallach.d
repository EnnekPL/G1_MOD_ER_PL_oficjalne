// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Avallach_EXIT(C_INFO)
{
	npc             = NON_3078_Avallach;
	nr              = 999;
	condition	= DIA_Avallach_EXIT_Condition;
	information	= DIA_Avallach_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Avallach_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Avallach_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Igetinfos
//========================================

INSTANCE DIA_Avallach_Igetinfos (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_Igetinfos_Condition;
   information  = DIA_Avallach_Igetinfos_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie informacje.";
};

FUNC INT DIA_Avallach_Igetinfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_Spotkanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Igetinfos_Info()
{
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_01"); //Mam dla ciebie informacje.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_02"); //Co konkretnie?
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_03"); //Za pojawieniem si� Poszukiwaczy w Kolonii stoi niejaki Czarny Mag.
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_04"); //Jest wys�annikiem Beliara. Ca�a ta afera ma na celu przygotowanie tego �wiata na przyj�cie s�ugi Beliara.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_05"); //Jakiego s�ugi Beliara?
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_06"); //Tego nie wiem.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_07"); //Przypuszczam, �e to jaki� demon.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_08"); //W ka�dym razie wielkie dzi�ki.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Avallach by� zadowolony z informacji, kt�re mu przynios�em. Nie jest wprawdzie tego zbyt wiele, ale zawsze jeste�my o krok bli�ej celu.");

    B_GiveXP (500);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Avallach_HELLO2 (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 2;
   condition    = DIA_Avallach_HELLO2_Condition;
   information  = DIA_Avallach_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi co� powiedzie� o walce?";
};

FUNC INT DIA_Avallach_HELLO2_Condition()
{
    if (Wld_IsTime     (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Avallach_HELLO2_15_01"); //Mo�esz mi co� powiedzie� o walce?
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_02"); //Niestety nie mam czasu.
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_03"); //Ca�y czas analizuj� mapy Kolonii. W ko�cu ustal� gdzie znajduje si� Czarny Mag.
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_04"); //Pami�taj, �e mamy coraz mniej czasu.
};

//========================================
//-----------------> LikeIt
//========================================

INSTANCE DIA_Avallach_LikeIt (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 3;
   condition    = DIA_Avallach_LikeIt_Condition;
   information  = DIA_Avallach_LikeIt_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_LikeIt_Condition()
{
    if (Wld_IsTime     (04,00,00,00)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_LikeIt_Info()
{
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_01"); //�wietnie, �e ci� widz�.
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_02"); //Jestem prawie pewien, �e Czarny Mag zaja� t� twierdz�.
    AI_Output (other, self ,"DIA_Avallach_LikeIt_15_03"); //W takim razie chod�my tam.
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_04"); //To nie bedzie �atwa walka. Lepiej si� przygotuj.
    B_LogEntry                     (CH1_WlakaZczarym,"Avallach jest pewien, �e Czarny Mag znajduje si� w G�rskiej Fortecy. Musz� przygotowa� si� do walki. �owca Poszukiwaczy z pewno�ci� b�dzie mi towarzyszy�.");

    B_GiveXP (150);
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> LetsgonnahatexD
//========================================

INSTANCE DIA_Avallach_LetsgonnahatexD (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_LetsgonnahatexD_Condition;
   information  = DIA_Avallach_LetsgonnahatexD_Info;
   permanent	= FALSE;
   description	= "Jestem gotowy!";
};

FUNC INT DIA_Avallach_LetsgonnahatexD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_LikeIt))
    && (Wld_IsTime     (04,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_LetsgonnahatexD_Info()
{
    AI_Output (other, self ,"DIA_Avallach_LetsgonnahatexD_15_01"); //Jestem gotowy!
    AI_Output (self, other ,"DIA_Avallach_LetsgonnahatexD_03_02"); //Zatem chod�my.
    

    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"castle");
    B_LogEntry                     (CH1_WlakaZczarym,"Wyruszyli�my. Z oddali widz�, �e z tym miejscem jest co� nie tak...");
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> INFOS_LESTER
//========================================

INSTANCE DIA_Avallach_INFOS_LESTER (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_INFOS_LESTER_Condition;
   information  = DIA_Avallach_INFOS_LESTER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_INFOS_LESTER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Psionic_BLACK_MAGE_START))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_INFOS_LESTER_Info()
{
    AI_Output (self, other ,"DIA_Avallach_INFOS_LESTER_03_01"); //Dobrze, �e spotka�e� swego przyjaciela. Mo�e nie wygl�da masywnie, ale z pewno�ci� oka�e si� pomocny.
    AI_Output (self, other ,"DIA_Avallach_INFOS_LESTER_03_02"); //Ruszajmy dalej.
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Zabity
//========================================

INSTANCE DIA_Avallach_Zabity (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 2;
   condition    = DIA_Avallach_Zabity_Condition;
   information  = DIA_Avallach_Zabity_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_Zabity_Condition()
{
    if (Npc_GetDistToWP (self, "LOCATION_19_03_PATH_RUIN7") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Avallach_LetsgonnahatexD)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Zabity_Info()
{
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_01"); //Aagh!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_02"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_03"); //Dosta�em!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_04"); //Co? Gdzie? 
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_05"); //Te potwory widocznie s� w stanie zatruwa� przeciwnik�w.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_07"); //Nie prze�yj� bez lekarstwa!
  //  AI_Output (self, other ,"DIA_Avallach_Zabity_03_08"); //Pom� mi!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_09"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_10"); //Nic. Zanim odnajdziesz lekarstwo minie sporo czasu.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_11"); //A przecie� Czarny Mag wie, �e tu jeste�my.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_12"); //Z pewmo�ci� przyspieszy swoje plugawe obrz�dy.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_13"); //Id�! Pokonaj go. Mn� si� nie przejmuj.
    MIS_lekiDlaAva = LOG_RUNNING;
	uplyw_czasu = 10 * 60; // 8 min //10 -1.3 wer
    Log_CreateTopic            (CH1_lekiDlaAva, LOG_MISSION);
    Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_RUNNING);
    B_LogEntry                     (CH1_lekiDlaAva,"Stan��em przed bardzo trudn� decyzj�. Avallach zosta� postrzelony przez Poszukiwacza truj�cym be�tem. D�ugo nie po�yje bez lekarstwa. Musz� uda� si� do jakiego� maga lub alchemika, kt�ry przygotuje mikstur�. Z drugiej jednak strony Czarny Mag w�a�nie odprawia swe obrz�dy. Strach pomysle� co si� stanie, gdy dobiegn� ko�ca.");
   // czasoumilacz ();
   Npc_ExchangeRoutine (self, "castle2");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Lekikurwa
//========================================

INSTANCE DIA_Avallach_Lekikurwa (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_Lekikurwa_Condition;
   information  = DIA_Avallach_Lekikurwa_Info;
   permanent	= FALSE;
   description	= "Mam lek!";
};

FUNC INT DIA_Avallach_Lekikurwa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_Zabity))
    && (Npc_HasItems (other, LekAva) >=1) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Lekikurwa_Info()
{
    AI_Output (other, self ,"DIA_Avallach_Lekikurwa_15_01"); //Mam lek!
    AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_02"); //Wielkie dzi�ki, ch�opcze!
    if (Npc_IsDead(NON_3073_Czarny_Mag))
    {
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_03"); //Naprawd� zabi�e� Czarnego Maga?
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_04"); //Do tego zd��y�e� przynie�� mi lek?
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_05"); //Jestem pe�en podziwu dla twych umiej�tno�ci.
        B_LogEntry                     (CH1_lekiDlaAva,"Zd��y�em pokona� Czarnego Maga oraz przynie�� leki dla Avallacha.");
        Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
        MIS_lekiDlaAva = LOG_SUCCESS;

        B_GiveXP (1500);
        CreateInvItems (self, ItMiNugget, 350);
        B_GiveInvItems (self, other, ItMiNugget, 350);
        CreateInvItems (self, ItFo_Potion_Strength_01, 1);
        B_GiveInvItems (self, other, ItFo_Potion_Strength_01, 1);
    }
    else
    {
		AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_06"); //Przynios�e� mi lek, ale Czarny Mag wci�� �yje. Nie wiem, czy zd��ysz na czas.
   
		B_LogEntry                     (CH1_lekiDlaAva,"Przynios�em lek Avallachowi. Z Czarnym Magiem jako� sobi� poradz�.");
		/*Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
		MIS_lekiDlaAva = LOG_SUCCESS;
		CreateInvItems (self, ItFo_Potion_Dex_01, 1);
		B_GiveInvItems (self, other, ItFo_Potion_Dex_01, 1);

		B_GiveXP (800);
 };   */
 /*
        Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
        MIS_lekiDlaAva = LOG_SUCCESS;
		uplyw_czasu = 0;
        B_GiveXP (1500);
        CreateInvItems (self, ItMiNugget, 350);
        B_GiveInvItems (self, other, ItMiNugget, 350);
        CreateInvItems (self, ItFo_Potion_Strength_01, 1);
        B_GiveInvItems (self, other, ItFo_Potion_Strength_01, 1);
 };
};

//========================================
//-----------------> SUKCES
//========================================

INSTANCE DIA_Avallach_SUKCES (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_SUKCES_Condition;
   information  = DIA_Avallach_SUKCES_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_SUKCES_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_IsDead(NON_3073_Czarny_Mag)) && (Er_StoryBM_Run == true)
    && (MIS_lekiDlaAva == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_SUKCES_Info()
{
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_01"); //A wi�c wracasz ca�y. Uda�o ci si� pokona� Czarnego Maga. 
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_02"); //Gdyby nie ty, pewnie nigdy bym nie pomy�la� �eby wr�ci� do starej G�rskiej Fortecy.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_03"); //Chcesz powiedzie�, �e ju� tu wcze�niej by�e�?
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_04"); //Tak. Razem z Lesterem szukali�my kamienia ogniskuj�cego.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_05"); //Kamienia ogniskuj�cego powiadasz... My�l�, �e Czarny Mag chcia� go wykorzysta� do swojego rytua�u.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_06"); //Chcia� zogniskowa� moc b�d�c� w duszach, kt�re zbierali Poszukiwacze.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_07"); //Przypuszczam, �e Poszukiwacze nie mogli znale�� kamienia, Mag planowa� co dlaej zrobi�. 
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_08"); //Zaskoczyli�my go.
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_09"); //Co teraz z sob� zrobisz?
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_10"); //Razem z pozosta�ymi �owcami powinnismy znale�� sobie jakie� bezpieczne miejsce. Sytuacja w Kolonii jest dosy� nieciekawa.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_11"); //Mo�esz mi co� zaproponowa�?
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_12"); //W dolinie za Starym Obozem jest chata samotnego mysliwego. Poza tym jest jeszcze Nowy Ob�z.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_13"); //Dzi�ki. Co� sobi� wybior�.
    Npc_ExchangeRoutine (self, "karczma");
    B_givexp (250);
};


*/