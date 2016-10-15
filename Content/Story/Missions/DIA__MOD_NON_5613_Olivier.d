// *Script was make in Easy Dialog Maker (EDM)
//poprawione g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Olivier_EXIT(C_INFO)
{
	npc             = NON_5613_Olivier;
	nr              = 999;
	condition	= DIA_Olivier_EXIT_Condition;
	information	= DIA_Olivier_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Olivier_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Olivier_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Olivier_HELLO1 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 1;
   condition    = DIA_Olivier_HELLO1_Condition;
   information  = DIA_Olivier_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Olivier_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Olivier_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Olivier_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Olivier_HELLO1_03_02"); //Jestem Olivier. A teraz daj mi spokój. Jestem zajêty.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Olivier_HELLO2 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 2;
   condition    = DIA_Olivier_HELLO2_Condition;
   information  = DIA_Olivier_HELLO2_Info;
   permanent	= FALSE;
   description	= "Podobno polujesz na jakiegoœ potwora.";
};

FUNC INT DIA_Olivier_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HunterTired_HELLO1))
    && (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Olivier_HELLO2_15_01"); //Podobno polujesz na jakiegoœ potwora.
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_02"); //Sk¹d wiesz?
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_03"); //Zreszt¹, nie wa¿ne. Tego potwora nazywam po prostu Besti¹. Grasuje gdzieœ w okolicy. 
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_04"); //Próbowa³em zwabiæ go rogiem i zabiæ przy u¿yciu ³uku, ale skurczybyk widaæ mnie zwietrzy³.
    AI_Output (other, self ,"DIA_Olivier_HELLO2_15_05"); //Myœliwi nie mog¹ przez ciebie spaæ.
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_06"); //Ciekawe jak im siê bêdzie spaæ, gdy Bestia dobierze im siê do garde³. Przecie¿ chcê im pomóc!

};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Olivier_HELLO3 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 3;
   condition    = DIA_Olivier_HELLO3_Condition;
   information  = DIA_Olivier_HELLO3_Info;
   permanent	= FALSE;
   description	= "No to chyba muszê ci pomóc pozbyæ siê tej Bestii.";
};

FUNC INT DIA_Olivier_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_01"); //No to chyba muszê ci pomóc pozbyæ siê tej ca³ej Bestii.
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_02"); //Je¿eli chcesz, aby te nocne zawodzenia usta³y to chyba rzeczywiœcie bêdziesz musia³ mi pomóc.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_03"); //No dobra. Jakiœ plan?
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_04"); //Bestia z pewnoœci¹ ukrywa siê w okolicy. Wie, ¿e na ni¹ polujê. Myœlê, ¿e ukry³a siê w jakiejœ jaskini.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_05"); //Mo¿e na wybrze¿u?
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_06"); //Nie. Z tego co mi mówi³ Claw, to te stworzenia raczej nie lubi¹ wody. Myœlê, ¿e udamy siê do doliny. Bêdziemy szukaæ w pobli¿u chaty Cavalorna.
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_07"); //Przygotuj siê dobrze przed walk¹. Ten zwierzak to ze 400 kilogramów miêsa. 
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_08"); //Pogadaj z Clawem. Przydadz¹ siê mikstury czasowo zwiêkszaj¹ce si³ê.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_09"); //Wrócê, gdy bêdê gotowy.
    MIS_MorakhHunting = LOG_RUNNING;


    Log_CreateTopic            (CH1_MorakhHunting, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MorakhHunting, LOG_RUNNING);
    B_LogEntry                     (CH1_MorakhHunting,"Muszê pomóc Olivierowi zapolowaæ na Bestiê. Powinienem siê uprzednio dobrze przygotowaæ do walki. Pomóc mi w tym mo¿e Claw.");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Olivier_HELLO4 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 4;
   condition    = DIA_Olivier_HELLO4_Condition;
   information  = DIA_Olivier_HELLO4_Info;
   permanent	= FALSE;
   description	= "Jestem gotowy.";
};

FUNC INT DIA_Olivier_HELLO4_Condition()
{
    if (MIS_MorakhHunting == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO4_Info()
{//fix 1210
    AI_Output (hero, self ,"DIA_Olivier_HELLO4_15_01"); //Jestem gotowy.
    AI_Output (self, hero ,"DIA_Olivier_HELLO4_03_02"); //Ruszajmy. ChodŸ za mn¹.
	NON_5613_Olivier.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NON_5613_Olivier, "guide1");
    AI_StopProcessInfos	(self);
	Wld_InsertNpc				(Morakh,"HELPPOINT10");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Olivier_HELLO5 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 5;
   condition    = DIA_Olivier_HELLO5_Condition;
   information  = DIA_Olivier_HELLO5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Olivier_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_HELLO4))
    && (Npc_GetDistToWP (self, "OW_PATH_OC_NC6") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO5_Info()
{
    AI_Output (self, other ,"DIA_Olivier_HELLO5_03_01"); //Nie ma jej w okolicy.
    AI_Output (other, self ,"DIA_Olivier_HELLO5_15_02"); //Musimy iœæ dalej. 
    AI_Output (self, other ,"DIA_Olivier_HELLO5_03_03"); //Za mn¹. B¹dŸ gotowy.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "guide2");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Olivier_HELLO6 (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 6;
   condition    = DIA_Olivier_HELLO6_Condition;
   information  = DIA_Olivier_HELLO6_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Olivier_HELLO6_Condition()
{
    if (Npc_GetDistToWP (NON_5613_Olivier, "HELPPOINT10") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Olivier_HELLO5))
	//&& ( Wld_DetectNpc(self,morakh,ZS_MM_Rtn_Wusel,-1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO6_Info()
{
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_01"); //O cholera! To dopiero by³a walka.
    AI_Output (other, self ,"DIA_Olivier_HELLO6_15_02"); //Nie ukrywam, ¿e ten potwór jest obrzydliwy.
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_03"); //Najwa¿niejsze, ¿e to œcierwo ju¿ nigdy nam nie zagrozi.
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_04"); //Zabierz jego pazury. Pewnie s¹ sporo warte.
    B_LogEntry                     (CH1_MorakhHunting,"Olivier nie zmyœla³. W okolicy naprawdê grasowa³ paskudny stwór. Na szczêœcie uda³o nam siê go wspólnie pokonaæ.");
    Log_SetTopicStatus       (CH1_MorakhHunting, LOG_SUCCESS);
    MIS_MorakhHunting = LOG_SUCCESS;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
    B_GiveXP (300);
    Npc_ExchangeRoutine (self, "work");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pobicie
//========================================

INSTANCE DIA_Olivier_Pobicie (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 1;
   condition    = DIA_Olivier_Pobicie_Condition;
   information  = DIA_Olivier_Pobicie_Info;
   permanent	= FALSE;
   description	= "Chyba muszê nauczyæ ciê szacunku dla cudzej pracy.";
};

FUNC INT DIA_Olivier_Pobicie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_HELLO2))
    && (MIS_Nieroby == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Olivier_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_Pobicie_Info()
{
    AI_Output (other, self ,"DIA_Olivier_Pobicie_15_01"); //Chyba muszê nauczyæ ciê szacunku dla cudzej pracy.
    AI_Output (self, other ,"DIA_Olivier_Pobicie_03_02"); //Ej, stary. Nie chcê siê z tob¹ biæ.
    AI_Output (other, self ,"DIA_Olivier_Pobicie_15_03"); //Przestaniesz wiêc mêczyæ myœliwych swoimi urojeniami dotycz¹cymi tego potwora?
    AI_Output (self, other ,"DIA_Olivier_Pobicie_03_04"); //Ta bestia jest zagro¿eniem. Zobaczysz... pewnej nocy zaatakuje.
	
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> Marnie
//========================================

INSTANCE DIA_Olivier_Marnie (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 2;
   condition    = DIA_Olivier_Marnie_Condition;
   information  = DIA_Olivier_Marnie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Olivier_Marnie_Condition()
{
    if (NON_5613_Olivier.aivar[AIV_HASDEFEATEDSC] == TRUE)
    && (Npc_KnowsInfo (hero, DIA_Olivier_Pobicie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_Marnie_Info()
{
    AI_Output (self, other ,"DIA_Olivier_Marnie_03_01"); //I co? Strasznie marnie walczysz. 
    AI_Output (self, other ,"DIA_Olivier_Marnie_03_02"); //Pokona³em ciê. OdejdŸ i nie przeszkadzaj mi w pracy, póki mam dla ciebie litoœæ.
    B_LogEntry                     (CH1_Nieroby,"Chcia³em pobiæ Oliviera. Nie uda³o siê. Wszystko spieprzy³em.");
    Log_SetTopicStatus       (CH1_Nieroby, LOG_FAILED);
    MIS_Nieroby = LOG_FAILED;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Wygrales
//========================================
//edit by Nocturn
INSTANCE DIA_Olivier_Wygrales (C_INFO)
{
   npc          = NON_5613_Olivier;
   nr           = 3;
   condition    = DIA_Olivier_Wygrales_Condition;
   information  = DIA_Olivier_Wygrales_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Olivier_Wygrales_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_Pobicie))
    && (NON_5613_Olivier.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_Wygrales_Info()
{
    AI_Output (self, other ,"DIA_Olivier_Wygrales_03_01"); //Ehh... moja g³owa. Jeszcze po¿a³ujesz! Wszyscy po¿a³ujecie! Ty i ci barbarzyñcy.
    AI_Output (self, other ,"DIA_Olivier_Wygrales_03_02"); //Gdy Bestia podejdzie noc¹ pod obóz i zaatakuje... wtedy zawo³acie: Gdzie Olivier?!
    AI_Output (other, self ,"DIA_Olivier_Wygrales_15_03"); //Skoñcz pieprzyæ i zajmij siê robot¹. Najlepiej ciêciem drewna.
    B_LogEntry                     (CH1_Nieroby,"Olivier dosta³ solidn¹ nauczkê. Myœliwi mog¹ ju¿ spaæ spokojnie.");
    Log_SetTopicStatus       (CH1_Nieroby, LOG_SUCCESS);
    MIS_Nieroby = LOG_SUCCESS;
	Npc_ExchangeRoutine	(NON_5613_Olivier, "work");
	Npc_ExchangeRoutine	(NON_5611_Jonas, "start2");
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

