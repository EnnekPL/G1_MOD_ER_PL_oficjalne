// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bandyta3_EXIT(C_INFO)
{
	npc             = NON_3035_Bandyta;
	nr              = 999;
	condition	= DIA_Bandyta35_EXIT_Condition;
	information	= DIA_Bandyta35_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bandyta35_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bandyta35_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Bandyta35_HELLO1 (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta35_HELLO1_Condition;
   information  = DIA_Bandyta35_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta35_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_MineIsClean))
      {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta35_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_01"); //Widz�, �e wr�ci�e� do kopalni. 
    if  (MIS_MineChlopy == LOG_RUNNING)
    {
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_02"); //Wci��, �e nie mamy nikogo, kto zaprowadzi�by tutaj porz�dek. Teoretycznie dowodz� t� grup�, ale nie znam si� na kopalniach.
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_03"); //Nie wiem jak to zorganizowa�.
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_04"); //Pospiesz si� z tym szukaniem pomocy. To musi by� kto� do�wiadczony. Jaki� stary Kopacz.
    }
    else if (MIS_MineChlopy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_05"); //Dobrze, �e sprowadzi�e� tutaj Guya. Ten go�� ma jaja i wie co robi�. 
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_06"); //Ja niezbyt znam si� na kopalniach.
		AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_07"); //Aha, mam dla ciebie ma�� rob�tk�. Tu, w kopalni. 
		AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_08"); //Jak b�dziesz mia� chwil�, to daj zna�. 
    };
    
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_09"); //Jeszcze jedno... Uwa�aj na jednego Bandyt�. Wo�aj� na niego Bicz. 
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_10"); //Jest na ciebie nie�le wkurzony. Nie pasuje mu praca w kopalni. 
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_11"); //Podobno go�� ma ci�k� r�k�.
};

//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Bandyta_WORK (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_WORK_Condition;
   information  = DIA_Bandyta_WORK_Info;
   permanent	= FALSE;
   description	= "Jaka robota?";
};

FUNC INT DIA_Bandyta_WORK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BANDYTA35_HELLO1)) && (MIS_MineChlopy == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_WORK_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WORK_15_01"); //Jaka robota?
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_02"); //W jednej z chat znajduje si� nie�le zabezpieczona skrzynia. My�l�, �e nale�y do przyw�dcy kopalni.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_03"); //Pr�bowa�em, j� otworzy�, ale z�ama�em pi�� wytrych�w. 
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_04"); //Dam ci kilka wytrych�w i powiem jak zacz�� otwieranie, a ty spr�bujesz z�ama� szyfr.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_05"); //Co ty na to?
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_06"); //Znaleziskami podzielimy si� po po�owie.
    AI_Output (other, self ,"DIA_Bandyta_WORK_15_07"); //Dobra. Pomog� ci.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_08"); //Chod� za mn�. Zaprowadz� ci�.
    Npc_ExchangeRoutine (self, "guide");
    MIS_SzyfrWKopalni = LOG_RUNNING;

    Log_CreateTopic            (CH1_SzyfrWKopalni, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SzyfrWKopalni, LOG_RUNNING);
    B_LogEntry                     (CH1_SzyfrWKopalni,"Luis chce, �ebym pom�g� mu z�ama� szyfr w jednej ze skrzy� w Opuszczonej Kopalni. Otrzymam wytrychy i pocz�tek szyfru.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAMIEJSCU
//========================================

INSTANCE DIA_Bandyta_NAMIEJSCU (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_NAMIEJSCU_Condition;
   information  = DIA_Bandyta_NAMIEJSCU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_NAMIEJSCU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WORK))
    && (Npc_GetDistToWP (self, "SKRZYNIA_SZEFA_KOPALNI") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_NAMIEJSCU_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_NAMIEJSCU_03_01"); //Dobra. To tutaj. Teraz tak... masz te wytrychy.
    AI_Output (self, other ,"DIA_Bandyta_NAMIEJSCU_03_02"); //Szyfr zaczyna si� tak: lewo, lewo, prawo, lewo... dalej pr�buj sam.
    CreateInvItems (self, ItKeLockpick, 10);
    B_GiveInvItems (self, other, ItKeLockpick, 10);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> ZAKONCZONE
//========================================

INSTANCE DIA_Bandyta_ZAKONCZONE (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_ZAKONCZONE_Condition;
   information  = DIA_Bandyta_ZAKONCZONE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_ZAKONCZONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_NAMIEJSCU))
    && (Npc_GetDistToWP (self, "SKRZYNIA_SZEFA_KOPALNI") < 1000)
    && (Npc_HasItems (other, ItWr_RejestrWydobycia) >=1)
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa4) >=1)
    && (Npc_HasItems (other, ItMw_2H_Sword_Light_02) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_ZAKONCZONE_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_01"); //Dobra robota!
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_02"); //Co my tu mamy? Hmm. Widz� jaki� pami�tnik i notatki. 
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_03"); //Zanie� je do Guya. Mog� mu si� przyda�. Mi daj ten miecz. Wygl�da fajnie, przypomina bro� Stra�nik�w ze Starego Obozu. 
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_04"); //Reszt� mo�esz zachowa�.
    B_LogEntry                     (CH1_SzyfrWKopalni,"Otworzy�em zamek. W skrzyni znalaz�em stare notatki, miecz nadzorcy i troch� rudy. Luis zabra� miecz, pami�tniki mam przekaza� Guyowi, a dla mnie zostaje ruda.");
    Log_SetTopicStatus       (CH1_SzyfrWKopalni, LOG_SUCCESS);
    MIS_SzyfrWKopalni = LOG_SUCCESS;

    B_GiveXP (500);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};


