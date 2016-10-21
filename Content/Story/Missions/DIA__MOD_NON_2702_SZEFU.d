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
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_02"); //Co tutaj robisz?
    AI_Output (other, self ,"DIA_SZEFU_HELLO_15_03"); //Przypadkiem dosta³em siê do waszego obozu.
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_04"); //Jakim cudem tu zaszed³eœ? Nasz obóz otaczaj¹ orkowie.
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_SZEFU_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_02"); //Nazywam siê Wilson. Dowodzê t¹ przeklêt¹ zgraj¹. 
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_03"); //Wygl¹daj¹ raczej na doœwiadczonych i powa¿nych wojowników.
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_04"); //S¹ zbyt porywczy. Kiedyœ œci¹gn¹ na nas oddzia³ orków.
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_SZEFU_LEARN_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_LEARN_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_LEARN_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_SZEFU_LEARN_03_02"); //Poka¿ê ci, jak zwiêkszyæ krzepê.
	if (firstinfo_wilson_teach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TeacherOW,"£owca orków Wilson pomo¿e mi zwiêkszyæ si³ê.");
	firstinfo_wilson_teach = true;
	};
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_BACK()
{
	AI_Output(self,hero,"DIA_SZEFU_LEARN_BACK_BACK_11_02"); //Mam nadziejê, ¿e jeszcze siê pojawisz na treningu. Wci¹¿ masz nad czym pracowaæ!
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
   description	= "Znasz mo¿e Quentina?";
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
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_01"); //Znasz mo¿e Quentina?
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_02"); //Tak, znam. A co?
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_03"); //Potrzebujemy wsparcia kilku twoich ludzi. 
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_04"); //Gomez zwariowa³ i atakuje wszystko, co siê rusza. Stra¿nicy od dawna maj¹ zatargi z Bandytami, a obecna sytuacja to tylko pretekst do ataku.
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_05"); //Przyda³aby nam siê pomoc w pozbyciu siê Stra¿ników patroluj¹cych okolicê.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_06"); //S³ysza³em o wydarzeniach w Starej Kopalni, ale nie s¹dzi³em, ¿e bêd¹ mia³y tak olbrzymie skutki. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju¿ bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wyœlê wam moich dwóch najlepszych ludzi. Tyle musi wam wystarczyæ.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //Pójd¹ Rakus i Osko. 
    B_LogEntry                     (CH4_SupportFromOrcHunters,"Rozmawia³em z Wilsonem. £owca orków dobrze pamiêta Quetnina. Zgodzi³ siê wys³aæ dwóch swoich ludzi do naszego Obozu.");

    B_GiveXP (200);
   // B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi¹za³em problem Cavalorna z ³owcami orków.");
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
   description	= "Widzia³eœ gdzieœ mo¿e jakiegoœ œwira z Sekty?";
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
    AI_Output (other, self ,"DIA_SZEFU_SectTeam_15_01"); //Widzia³eœ gdzieœ mo¿e jakiegoœ œwira z Sekty?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_02"); //Chodzi ci o tych goœci z tatua¿ami?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_03"); //Widzia³em jakiegoœ ³ysola otoczonego grupk¹ Stra¿ników. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_04"); //Szli w kierunku orkowego miasta.
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_05"); //Zatrzymali siê na kilka dni przy bagnie i rozbili tam ma³y obóz. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_06"); //Jednak pewnej nocy wszystko zniknê³o.
    B_LogEntry                     (CH3_SearchKalom,"Wilson widzia³ kilku Stra¿ników Œwi¹tynnych id¹cych w kierunku orkowego miasta. Ma³o prawdopodobne, ¿ebym ich znalaz³. ");
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
   description	= "Bandyci potrzebuj¹ twojej pomocy!";
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
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_01"); //Bandyci potrzebuj¹ twojej pomocy!
    AI_Output (self, other ,"DIA_SZEFU_BANDYCI_POMOC_03_02"); //Co siê dzieje?
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_03"); //Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê. Gomez straci³ ca³y autorytet. Po Kolonii krêc¹ siê patrole, które zabijaj¹ ka¿dego, kto nie jest z nimi.
    AI_Output (other, self ,"DIA_SZEFU_BANDYCI_POMOC_15_04"); //Bandyci chc¹ zorganizowaæ atak na czêœæ posterunków Stra¿ników.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju¿ bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wyœlê wam moich dwóch najlepszych ludzi. Tyle musi wam wystarczyæ.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //Pójd¹ Rakus i Osko. 
	
	B_LogEntry                     (CH4_HuntersSupport,"Przekaza³em Wilsonowi proœbê o pomoc. Postanowi³ wys³aæ dwóch swoich najlepszych ludzi do pomocy.");
	
    //B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi¹za³em problem Cavalorna z ³owcami orków.");
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
    && (kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_ROBOTA_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_01"); //Widzê ciê ju¿ tu któryœ raz. Œmiem za³o¿yæ, ¿e jeszcze trochê po¿yjesz. Mam wiêc dla ciebie zadanie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_02"); //Jakie?
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_03"); //£azisz to tu, to tam. Rozejrzyj siê za jakimiœ dodatkowymi ludŸmi. Ostatnio jeden z naszych skoñczy³ z orkowym toporem w dupie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_04"); //Rozumiem. Popytam.
    MIS_NewBloodForOrcHunters = LOG_RUNNING;

    Log_CreateTopic         (CH3_NewBloodForOrcHunters, LOG_MISSION);
    Log_SetTopicStatus      (CH3_NewBloodForOrcHunters, LOG_RUNNING);
    B_LogEntry              (CH3_NewBloodForOrcHunters,"Wilson poleci³ mi znaleŸæ jakichœ rekrutów do ich obozu. Có¿, muszê rozmawiaæ z ludŸmi.");
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
   description	= "Zwerbowa³em Gestatha.";
};

FUNC INT DIA_SZEFU_WERB_GESTAH_Condition()
{
    if (gestah_lowca == true)
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_WERB_GESTAH_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_01"); //Zwerbowa³em Gestatha.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_02"); //To doœwiadczony myœliwy. Przyda nam siê ktoœ taki.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GESTAH_03_03"); //Dobra robota. P³acê 100 bry³ek za ka¿dego nowego cz³owieka.
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
   description	= "Zwerbowa³em Gerarda.";
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
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_01"); //Zwerbowa³em Gerarda.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_02"); //Goœæ zabi³ dwóch stra¿ników królewskich i prze¿y³ sam kilka dni na szczycie góry. 
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_03"); //Zna siê na przetrwaniu jak ma³o kto.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_04"); //Dobra robota. Tacy jak on na pewno potrafi¹ daæ w koœæ orkom!
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_05"); //P³acê 100 bry³ek rudy za ka¿dego dobrego cz³owieka.
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
   description	= "Zwerbowa³em Davora.";
};

FUNC INT DIA_SZEFU_DAVOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_FIND_BOW))
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_DAVOR_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_01"); //Zwerbowa³em Davora.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_02"); //Bardzo dobrze. Od kilku dni mia³em go na oku. 
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_03"); //Goœæ umie nieŸle strzelaæ z ³uku i kuszy.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_04"); //P³acê 100 bry³ek rudy za dobrego cz³owieka.
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
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_SUCCESS_QUEST_REKRUT_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_01"); //Ostatnio przyprowadzi³eœ tu trzech dobrych ludzi. Myœlê, ¿e wystarczy.
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_02"); //Spisa³eœ siê rewelacyjnie. Bêd¹ z ciebie ludzie.
    //CreateInvItems (self, ItMiNugget, 100);
    //B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Zrekrutowa³em do obozu trzech œwietnych ludzi. Wilson jest mi bardzo wdziêczny. ");
    Log_SetTopicStatus       (CH3_NewBloodForOrcHunters, LOG_SUCCESS);
    MIS_NewBloodForOrcHunters = LOG_SUCCESS;

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
   description	= "Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.";
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
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_01"); //Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.
    AI_Output (self, other ,"DIA_SZEFU_HUGO_BACK_03_02"); //Dobra robota. Hugo to porz¹dny goœæ. WeŸ to w nagrodê. 
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_03"); //Dziêki.
	CreateInvItems (self, ItMiNugget, 130);
    B_GiveInvItems (self, other, ItMiNugget, 130);
    B_LogEntry                     (CH1_HunterHugo,"Wilson by³ bardzo zadowolony, gdy wspomnia³em o powrocie Hugo. Wynagrodzi³ mnie rud¹.");
    //Log_SetTopicStatus       (CH1_HunterHugo, LOG_SUCCESS);
    //MIS_HunterHugo = LOG_SUCCESS;
    //B_GiveXP (50);
};
