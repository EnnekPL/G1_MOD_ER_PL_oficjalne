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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Olivier_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Olivier_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Olivier_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Olivier_HELLO1_03_02"); //Jestem Olivier. A teraz daj mi spok�j. Jestem zaj�ty.
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
   description	= "Podobno polujesz na jakiego� potwora.";
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
    AI_Output (other, self ,"DIA_Olivier_HELLO2_15_01"); //Podobno polujesz na jakiego� potwora.
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_02"); //Sk�d wiesz?
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_03"); //Zreszt�, nie wa�ne. Tego potwora nazywam po prostu Besti�. Grasuje gdzie� w okolicy. 
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_04"); //Pr�bowa�em zwabi� go rogiem i zabi� przy u�yciu �uku, ale skurczybyk wida� mnie zwietrzy�.
    AI_Output (other, self ,"DIA_Olivier_HELLO2_15_05"); //My�liwi nie mog� przez ciebie spa�.
    AI_Output (self, other ,"DIA_Olivier_HELLO2_03_06"); //Ciekawe jak im si� b�dzie spa�, gdy Bestia dobierze im si� do garde�. Przecie� chc� im pom�c!

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
   description	= "No to chyba musz� ci pom�c pozby� si� tej Bestii.";
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
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_01"); //No to chyba musz� ci pom�c pozby� si� tej ca�ej Bestii.
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_02"); //Je�eli chcesz, aby te nocne zawodzenia usta�y to chyba rzeczywi�cie b�dziesz musia� mi pom�c.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_03"); //No dobra. Jaki� plan?
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_04"); //Bestia z pewno�ci� ukrywa si� w okolicy. Wie, �e na ni� poluj�. My�l�, �e ukry�a si� w jakiej� jaskini.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_05"); //Mo�e na wybrze�u?
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_06"); //Nie. Z tego co mi m�wi� Claw, to te stworzenia raczej nie lubi� wody. My�l�, �e udamy si� do doliny. B�dziemy szuka� w pobli�u chaty Cavalorna.
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_07"); //Przygotuj si� dobrze przed walk�. Ten zwierzak to ze 400 kilogram�w mi�sa. 
    AI_Output (self, other ,"DIA_Olivier_HELLO3_03_08"); //Pogadaj z Clawem. Przydadz� si� mikstury czasowo zwi�kszaj�ce si��.
    AI_Output (other, self ,"DIA_Olivier_HELLO3_15_09"); //Wr�c�, gdy b�d� gotowy.
    MIS_PolowanieNaMorakha = LOG_RUNNING;


    Log_CreateTopic            (CH1_PolowanieNaMorakha, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PolowanieNaMorakha, LOG_RUNNING);
    B_LogEntry                     (CH1_PolowanieNaMorakha,"Musz� pom�c Olivierowi zapolowa� na Besti�. Powinienem si� uprzednio dobrze przygotowa� do walki. Pom�c mi w tym mo�e Claw.");
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
    if (MIS_PolowanieNaMorakha == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Olivier_HELLO4_Info()
{//fix 1210
    AI_Output (hero, self ,"DIA_Olivier_HELLO4_15_01"); //Jestem gotowy.
    AI_Output (self, hero ,"DIA_Olivier_HELLO4_03_02"); //Ruszajmy. Chod� za mn�.
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
    AI_Output (other, self ,"DIA_Olivier_HELLO5_15_02"); //Musimy i�� dalej. 
    AI_Output (self, other ,"DIA_Olivier_HELLO5_03_03"); //Za mn�. B�d� gotowy.
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
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_01"); //O cholera! To dopiero by�a walka.
    AI_Output (other, self ,"DIA_Olivier_HELLO6_15_02"); //Nie ukrywam, �e ten potw�r jest obrzydliwy.
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_03"); //Najwa�niejsze, �e to �cierwo ju� nigdy nam nie zagrozi.
    AI_Output (self, other ,"DIA_Olivier_HELLO6_03_04"); //Zabierz jego pazury. Pewnie s� sporo warte.
    B_LogEntry                     (CH1_PolowanieNaMorakha,"Olivier nie zmy�la�. W okolicy naprawd� grasowa� paskudny stw�r. Na szcz�cie uda�o nam si� go wsp�lnie pokona�.");
    Log_SetTopicStatus       (CH1_PolowanieNaMorakha, LOG_SUCCESS);
    MIS_PolowanieNaMorakha = LOG_SUCCESS;
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
   description	= "Chyba musz� nauczy� ci� szacunku dla cudzej pracy.";
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
    AI_Output (other, self ,"DIA_Olivier_Pobicie_15_01"); //Chyba musz� nauczy� ci� szacunku dla cudzej pracy.
    AI_Output (self, other ,"DIA_Olivier_Pobicie_03_02"); //Ej, stary. Nie chc� si� z tob� bi�.
    AI_Output (other, self ,"DIA_Olivier_Pobicie_15_03"); //Przestaniesz wi�c m�czy� my�liwych swoimi urojeniami dotycz�cymi tego potwora?
    AI_Output (self, other ,"DIA_Olivier_Pobicie_03_04"); //Ta bestia jest zagro�eniem. Zobaczysz... pewnej nocy zaatakuje.
	
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
    AI_Output (self, other ,"DIA_Olivier_Marnie_03_02"); //Pokona�em ci�. Odejd� i nie przeszkadzaj mi w pracy, p�ki mam dla ciebie lito��.
    B_LogEntry                     (CH1_Nieroby,"Chcia�em pobi� Oliviera. Nie uda�o si�. Wszystko spieprzy�em.");
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
    AI_Output (self, other ,"DIA_Olivier_Wygrales_03_01"); //Ehh... moja g�owa. Jeszcze po�a�ujesz! Wszyscy po�a�ujecie! Ty i ci barbarzy�cy.
    AI_Output (self, other ,"DIA_Olivier_Wygrales_03_02"); //Gdy Bestia podejdzie noc� pod ob�z i zaatakuje... wtedy zawo�acie: Gdzie Olivier?!
    AI_Output (other, self ,"DIA_Olivier_Wygrales_15_03"); //Sko�cz pieprzy� i zajmij si� robot�. Najlepiej ci�ciem drewna.
    B_LogEntry                     (CH1_Nieroby,"Olivier dosta� solidn� nauczk�. My�liwi mog� ju� spa� spokojnie.");
    Log_SetTopicStatus       (CH1_Nieroby, LOG_SUCCESS);
    MIS_Nieroby = LOG_SUCCESS;
	Npc_ExchangeRoutine	(NON_5613_Olivier, "work");
	Npc_ExchangeRoutine	(NON_5611_Jonas, "start2");
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

