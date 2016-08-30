//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SZEFU_EXIT(C_INFO)
{
	npc             = NON_2702_SZEFU;
	nr              = 999;
	condition		= DIA_SZEFU_EXIT_Condition;
	information		= DIA_SZEFU_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_SZEFU_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SZEFU_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_SZEFU_HELLO (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_HELLO_Condition;
   information  = DIA_SZEFU_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO_Info()
{
    if (Kapitel < 4)
    {
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_02"); //Co tutaj robisz?
    AI_Output (other, self ,"DIA_SZEFU_HELLO_15_03"); //Przypadkiem dosta�em si� do waszego obozu.
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_04"); //Jakim cudem tu zaszed�e�? Nasz ob�z otaczaj� orkowie.
	B_GiveXP (125);
	};
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_SZEFU_HELLO2 (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_HELLO2_Condition;
   information  = DIA_SZEFU_HELLO2_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_SZEFU_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_02"); //Nazywam si� Wilson. Dowodz� t� przekl�t� zgraj�. 
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_03"); //Wygl�daj� raczej na do�wiadczonych i powa�nych wojownik�w.
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_04"); //S� zbyt porywczy. Kiedy� �ci�gn� na nas oddzia� ork�w.
};

//========================================
//-----------------> LEARN
//========================================

INSTANCE DIA_SZEFU_LEARN (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 4;
   condition    = DIA_SZEFU_LEARN_Condition;
   information  = DIA_SZEFU_LEARN_Info;
   permanent	= TRUE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_SZEFU_LEARN_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_LEARN_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_LEARN_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_SZEFU_LEARN_03_02"); //Poka�� ci, jak zwi�kszy� krzep�.
	if (firstinfo_wilson_teach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TeacherOW,"�owca ork�w Wilson pomo�e mi zwi�kszy� si��.");
	firstinfo_wilson_teach = true;
	};
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_BACK()
{
	AI_Output(self,hero,"DIA_SZEFU_LEARN_BACK_BACK_11_02"); //Mam nadziej�, �e jeszcze si� pojawisz na treningu. Wci�� masz nad czym pracowa�!
	Info_ClearChoices	(DIA_SZEFU_LEARN);
};

func void DIA_SZEFU_LEARN_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

//========================================
//-----------------> Quest12
//========================================

INSTANCE DIA_SZEFU_Quest12 (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_Quest12_Condition;
   information  = DIA_SZEFU_Quest12_Info;
   permanent	= FALSE;
   description	= "Znasz mo�e Quentina?";
};

FUNC INT DIA_SZEFU_Quest12_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Idea))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_Quest12_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_01"); //Znasz mo�e Quentina?
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_02"); //Tak, znam. A co?
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_03"); //Potrzebujemy wsparcia kilku twoich ludzi. 
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_04"); //Gomez zwariowa� i atakuje wszystko, co si� rusza. Stra�nicy od dawna maj� zatargi z Bandytami, a obecna sytuacja to tylko pretekst do ataku.
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_05"); //Przyda�aby nam si� pomoc w pozbyciu si� Stra�nik�w patroluj�cych okolic�.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_06"); //S�ysza�em o wydarzeniach w Starej Kopalni, ale nie s�dzi�em, �e b�d� mia�y tak olbrzymie skutki. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju� bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wy�l� wam moich dw�ch najlepszych ludzi. Tyle musi wam wystarczy�.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //P�jd� Rakus i Osko. 
    B_LogEntry                     (CH1_SupportFromOrcHunters,"Rozmawia�em z Wilsonem. �owca ork�w dobrze pami�ta Quetnina. Zgodzi� si� wys�a� dw�ch swoich ludzi do naszego Obozu.");

    B_GiveXP (200);
   // B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi�za�em problem Cavalorna z �owcami ork�w.");
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (self,"wait");
	Npc_ExchangeRoutine (NON_2706_Osko,"wait");
	Npc_ExchangeRoutine (NON_2705_Rakus,"wait");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"wait"); 
};


//========================================
//-----------------> SectTeam
//========================================

INSTANCE DIA_SZEFU_SectTeam (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_SectTeam_Condition;
   information  = DIA_SZEFU_SectTeam_Info;
   permanent	= FALSE;
   description	= "Widzia�e� gdzie� mo�e jakiego� �wira z Sekty?";
};

FUNC INT DIA_SZEFU_SectTeam_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_SectTeam_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_SectTeam_15_01"); //Widzia�e� gdzie� mo�e jakiego� �wira z Sekty?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_02"); //Chodzi ci o tych go�ci z tatua�ami?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_03"); //Widzia�em jakiego� �ysola otoczonego grupk� Stra�nik�w. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_04"); //Szli w kierunku orkowego miasta.
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_05"); //Zatrzymali si� na kilka dni przy bagnie i rozbili tam ma�y ob�z. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_06"); //Jednak pewnej nocy wszystko znikn�o.
    B_LogEntry                     (CH1_LowcyOrkow,"Wilson widzia� kilku Stra�nik�w �wi�tynnych id�cych w kierunku orkowego miasta. Ma�o prawdopodobne, �ebym ich znalaz�. ");
    B_GiveXP (150);
};

//========================================
//-----------------> BANDYCI_POMOC
//========================================
//****** NIEAKTUALNE ********
INSTANCE DIA_SZEFU_BANDYCI_POMOC (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_BANDYCI_POMOC_Condition;
   information  = DIA_SZEFU_BANDYCI_POMOC_Info;
   permanent	= FALSE;
   description	= "Bandyci potrzebuj� twojej pomocy!";
};

FUNC INT DIA_SZEFU_BANDYCI_POMOC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_VERY_IMPORTATN))
    {
    return FALSE;
    };
};


FUNC VOID DIA_SZEFU_BANDYCI_POMOC_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_01"); //Bandyci potrzebuj� twojej pomocy!
    AI_Output (self, other ,"DIA_SZEFU_BANDYCI_POMOC_03_02"); //Co si� dzieje?
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_03"); //Stara Kopalnia zosta�a zalana przez podziemn� rzek�. Gomez straci� ca�y autorytet. Po Kolonii kr�c� si� patrole, kt�re zabijaj� ka�dego, kto nie jest z nimi.
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_04"); //Bandyci chc� zorganizowa� atak na cz�� posterunk�w Stra�nik�w.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju� bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wy�l� wam moich dw�ch najlepszych ludzi. Tyle musi wam wystarczy�.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //P�jd� Rakus i Osko. 
	
	B_LogEntry                     (CH1_Do_lowcow,"Przekaza�em Wilsonowi pro�b� o pomoc. Postanowi� wys�a� dw�ch swoich najlepszych ludzi do pomocy.");
	
    //B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi�za�em problem Cavalorna z �owcami ork�w.");
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (self,"wait");
	Npc_ExchangeRoutine (NON_2706_Osko,"wait");
	Npc_ExchangeRoutine (NON_2705_Rakus,"wait");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"wait");
};


//========================================
//-----------------> ROBOTA
//========================================

INSTANCE DIA_SZEFU_ROBOTA (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_ROBOTA_Condition;
   information  = DIA_SZEFU_ROBOTA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_ROBOTA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_HELLO))
    && (kapitel <= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_ROBOTA_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_01"); //Jak ju� tu jeste�, to mam dla ciebie ma�e zadanie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_02"); //Jakie?
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_03"); //�azisz to tu, to tam. Rozejrzyj si� za jakimi� dodatkowymi lud�mi. Ostatnio jeden z naszych sko�czy� z orkowym toporem w dupie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_04"); //Rozumiem. Popytam.
    MIS_RekruciLowcow = LOG_RUNNING;

    Log_CreateTopic         (CH1_RekruciLowcow, LOG_MISSION);
    Log_SetTopicStatus      (CH1_RekruciLowcow, LOG_RUNNING);
    B_LogEntry              (CH1_RekruciLowcow,"Wilson poleci� mi znale�� jakich� rekrut�w do ich obozu. C�, musz� rozmawia� z lud�mi.");
    AI_StopProcessInfos	(self);
};
/*
* Gestah
* Davor
* Gerard
*/ 
//========================================
//-----------------> WERB_GESTAH
//========================================

INSTANCE DIA_SZEFU_WERB_GESTAH (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_WERB_GESTAH_Condition;
   information  = DIA_SZEFU_WERB_GESTAH_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Gestatha.";
};

FUNC INT DIA_SZEFU_WERB_GESTAH_Condition()
{
    if (gestah_lowca == true)
    && (MIS_RekruciLowcow == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_WERB_GESTAH_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_01"); //Zwerbowa�em Gestatha.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_02"); //To do�wiadczony my�liwy. Przyda nam si� kto� taki.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GESTAH_03_03"); //Dobra robota. P�ac� 100 bry�ek za ka�dego nowego cz�owieka.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    b_givexp (200);
};

//========================================
//-----------------> WERB_GERARD
//========================================

INSTANCE DIA_SZEFU_WERB_GERARD (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_WERB_GERARD_Condition;
   information  = DIA_SZEFU_WERB_GERARD_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Gerarda.";
};

FUNC INT DIA_SZEFU_WERB_GERARD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_LOWCA_ORKOW))
    && (gerard_lowca == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_WERB_GERARD_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_01"); //Zwerbowa�em Gerarda.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_02"); //Go�� zabi� dw�ch stra�nik�w kr�lewskich i prze�y� sam kilka dni na szczycie g�ry. 
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_03"); //Zna si� na przetrwaniu jak ma�o kto.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_04"); //Dobra robota. Tacy jak on na pewno potrafi� da� w ko�� orkom!
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_05"); //P�ac� 100 bry�ek rudy za ka�dego dobrego cz�owieka.
	CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    b_givexp (200);
};

//========================================
//-----------------> DAVOR
//========================================

INSTANCE DIA_SZEFU_DAVOR (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 3;
   condition    = DIA_SZEFU_DAVOR_Condition;
   information  = DIA_SZEFU_DAVOR_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Davora.";
};

FUNC INT DIA_SZEFU_DAVOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_FIND_BOW))
    && (MIS_RekruciLowcow == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_DAVOR_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_01"); //Zwerbowa�em Davora.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_02"); //Bardzo dobrze. Od kilku dni mia�em go na oku. 
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_03"); //Go�� umie nie�le strzela� z �uku i kuszy.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_04"); //P�ac� 100 bry�ek rudy za dobrego cz�owieka.
    b_givexp (200);
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
};

//========================================
//-----------------> SUCCESS_QUEST_REKRUT
//========================================

INSTANCE DIA_SZEFU_SUCCESS_QUEST_REKRUT (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 4;
   condition    = DIA_SZEFU_SUCCESS_QUEST_REKRUT_Condition;
   information  = DIA_SZEFU_SUCCESS_QUEST_REKRUT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_SUCCESS_QUEST_REKRUT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_DAVOR))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GERARD))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GESTAH))
    && (MIS_RekruciLowcow == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_SUCCESS_QUEST_REKRUT_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_01"); //Ostatnio przyprowadzi�e� tu trzech dobrych ludzi. My�l�, �e wystarczy.
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_02"); //Spisa�e� si� rewelacyjnie. B�d� z ciebie ludzie.
    //CreateInvItems (self, ItMiNugget, 100);
    //B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry                     (CH1_RekruciLowcow,"Zrekrutowa�em do obozu trzech �wietnych ludzi. Wilson jest mi bardzo wdzi�czny. ");
    Log_SetTopicStatus       (CH1_RekruciLowcow, LOG_SUCCESS);
    MIS_RekruciLowcow = LOG_SUCCESS;

    B_GiveXP (400);
};

//========================================
//-----------------> HUGO_BACK
//========================================

INSTANCE DIA_SZEFU_HUGO_BACK (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_HUGO_BACK_Condition;
   information  = DIA_SZEFU_HUGO_BACK_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.";
};

FUNC INT DIA_SZEFU_HUGO_BACK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_HUGO_BACK_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_01"); //Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.
    AI_Output (self, other ,"DIA_SZEFU_HUGO_BACK_03_02"); //Dobra robota. Hugo to porz�dny go��. We� to w nagrod�. 
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_03"); //Dzi�ki.
	CreateInvItems (self, ItMiNugget, 130);
    B_GiveInvItems (self, other, ItMiNugget, 130);
    B_LogEntry                     (CH1_gdzie_hugo,"Wilson by� bardzo zadowolony, gdy wspomnia�em o powrocie Hugo. Wynagrodzi� mnie rud�.");
    //Log_SetTopicStatus       (CH1_gdzie_hugo, LOG_SUCCESS);
    //MIS_gdzie_hugo = LOG_SUCCESS;
    //B_GiveXP (50);
};
