//poprawione i sprawdzone - Nocturn

//sprawdzone przez gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Morok_EXIT(C_INFO)
{
	npc             = GRD_7894_Morok;
	nr              = 999;
	condition	= DIA_Morok_EXIT_Condition;
	information	= DIA_Morok_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Morok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morok_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Morok_HELLO1 (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 1;
   condition    = DIA_Morok_HELLO1_Condition;
   information  = DIA_Morok_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Morok_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Morok_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Morok_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Morok_HELLO1_03_02"); //Nazywam si� Morok. Jestem dow�dc� tej wyprawy.
    AI_Output (other, self ,"DIA_Morok_HELLO1_15_03"); //Jakiej wyprawy? Ten ob�z jest tw�j?
    AI_Output (self, other ,"DIA_Morok_HELLO1_03_04"); //Teraz ju� tak. Wcze�niej nale�a� do dw�ch w��cz�g�w, ale pewnego dnia zabrali swoje rzeczy i znikn�li bez �ladu.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Morok_HELLO2 (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 2;
   condition    = DIA_Morok_HELLO2_Condition;
   information  = DIA_Morok_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co tutaj robicie?";
};

FUNC INT DIA_Morok_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Morok_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Morok_HELLO2_15_01"); //Co tutaj robicie?
    if  (Npc_GetTrueGuild(other) == GIL_GRD)
    {
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_02"); //Badamy spraw� starej �wi�tyni znajduj�cej si� nieopodal.
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_03"); //To, co tam si� dzieje, jest podejrzane. Nawet nie pr�buj tam i��!
    }
    else
    {
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_04"); //Nie powinno ci� to obchodzi�.
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_05"); //Nawet nie pr�buj i�� dalej. W tym miejscu czaj� si� orkowie.
    };
};

//========================================
//-----------------> GomezSendMe
//========================================

INSTANCE DIA_Morok_GomezSendMe (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 1;
   condition    = DIA_Morok_GomezSendMe_Condition;
   information  = DIA_Morok_GomezSendMe_Info;
   permanent	= FALSE;
   description	= "Przybywam z polecenia Gomeza.";
};

FUNC INT DIA_Morok_GomezSendMe_Condition()
{
    if (MIS_QuestForHeavyArmor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_GomezSendMe_Info()
{
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_01"); //Przybywam z polecenia Gomeza.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_02"); //Taki chuderlak?
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_03"); //Chcesz si� ze mn� zmierzy�?
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_04"); //Widz�, �e masz troch� odwagi.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_05"); //Mo�e wystarczy. Schowaj to.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_06"); //Jak wygl�da sytuacja?
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_07"); //Przedwczoraj by�em sprawdzi�, co dzieje si� w �wi�tyni, a raczej na ma�ym placu �wi�tynnym.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_08"); //Poszed�em w kierunku jeziorka i nagle przed oczami stan�a mi dziwna posta�.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_09"); //Ten go�� szybko zwia�. Nie wiem, kim dok�adnie by�, ale to na pewno nie ork, ani jaki� stw�r.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_10"); //To pierwsza rzecz, kt�r� musimy si� zaj��.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_11"); //Id� w kierunku �wi�tyni i sprawd�, czy kto� si� tam nie kr�ci.
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_12"); //Sk�d wiesz, �e nie uciek� noc�?
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_13"); //Trzymamy wart� ca�� dob�. Nie ma mo�liwo�ci, aby uciek� �cie�k�.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_14"); //Do �wi�tyni pewnie te� nie poszed�. Chyba, �e jest samob�jc�.
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_15"); //W porz�dku. Spr�buj� odnale�� tajemnicz� posta�.
	AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_16"); //Ani mi si� wa� podchodzi� do �wi�tyni! Orkowie ci� poszatkuj�.
    //MIS_SpyInRuins = LOG_RUNNING;

    //Log_CreateTopic         (CH1_SzpiegoMoroka, LOG_MISSION);
    //Log_SetTopicStatus      (CH1_SzpiegoMoroka, LOG_RUNNING);
    //B_LogEntry              (CH1_SzpiegoMoroka,"Morok nakaza� mi odszukanie nieznanego cz�owieka, kt�ry rzekomo r�wnie� bada �wi�tyni�. Powinienem go szuka� w jej pobli�u.");
    //AI_StopProcessInfos	(self);
	B_LogEntry              (CH3_QuestForHeavyArmor,"Morok nakaza� mi odszukanie nieznanego cz�owieka, kt�ry rzekomo r�wnie� bada �wi�tyni�. Powinienem go szuka� w jej pobli�u.");
};

//========================================
//-----------------> HelpSzpieg
//========================================

INSTANCE DIA_Morok_HelpSzpieg (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 1;
   condition    = DIA_Morok_HelpSzpieg_Condition;
   information  = DIA_Morok_HelpSzpieg_Info;
   permanent	= FALSE;
   description	= "Wasz szpieg to zwyk�y my�liwy.";
};

FUNC INT DIA_Morok_HelpSzpieg_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_HELLO2))
    && (MIS_ArmorForSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_HelpSzpieg_Info()
{
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_01"); //Wasz szpieg to zwyk�y my�liwy.
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_02"); //Niewiele wiedzia� o starych ruinach. Zaw�drowa� tam podczas polowania na topielce.
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_03"); //Podobno �wi�tynia roi si� od ork�w.
    AI_Output (self, other ,"DIA_Morok_HelpSzpieg_03_04"); //Tyle to i ja wiem, ch�opcze. Dobrze, �e to nie by� �aden szpieg z Bractwa.
    B_LogEntry                     (CH3_QuestForHeavyArmor,"Pu�ci�em Stra�nika �wi�tynnego wolno. Morok niczego nie podejrzewa�. Teraz mamy wa�niejsze sprawy na g�owie, ni� zemsta na ludziach z Bractwa.");
    //Log_SetTopicStatus       (CH1_SzpiegoMoroka, LOG_SUCCESS);
    MIS_SpyInRuins = LOG_SUCCESS;

    B_GiveXP (100);
	
	
    B_LogEntry               (CH3_ArmorForSpy,"Powiedzia�em Morokowi, �e Stra�nik �wi�tynny to zwyczajny my�liwy. Nikt niczego nie podejrzewa, a ja unikn��em niepotrzebnego rozlewu krwi.");
    Log_SetTopicStatus       (CH3_ArmorForSpy, LOG_SUCCESS);
    MIS_ArmorForSpy = LOG_SUCCESS;
    Npc_ExchangeRoutine (TPL_7899_Templer, "camp");
};

//========================================
//-----------------> ZabitySzpieg
//========================================

INSTANCE DIA_Morok_ZabitySzpieg (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 2;
   condition    = DIA_Morok_ZabitySzpieg_Condition;
   information  = DIA_Morok_ZabitySzpieg_Info;
   permanent	= FALSE;
   description	= "Szpieg z bagna zosta� zabity.";
};

FUNC INT DIA_Morok_ZabitySzpieg_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(TPL_7899_Templer);
    if (MIS_ArmorForSpy == LOG_FAILED)
    && (Npc_IsDead(whodie0))
    && (Npc_KnowsInfo (hero,DIA_Templer_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_ZabitySzpieg_Info()
{
    AI_Output (other, self ,"DIA_Morok_ZabitySzpieg_15_01"); //Szpieg z bagna zosta� zabity.
    AI_Output (self, other ,"DIA_Morok_ZabitySzpieg_03_02"); //A wi�c to jednak jeden z tych �mierdz�cych �wir�w.
    AI_Output (self, other ,"DIA_Morok_ZabitySzpieg_03_03"); //�wietna robota. Bierzmy si� zatem do pracy.
	B_LogEntry                     (CH3_QuestForHeavyArmor,"Zabi�em �wi�tynnego, kt�ry kr�ci� si� wok� ruin. Morok stwierdzi�, �e mo�emy dzia�a� dalej.");

    B_GiveXP (125);
	
	MIS_SpyInRuins = LOG_SUCCESS;
};

//========================================
//-----------------> NextWorkRTemple 
//========================================

INSTANCE DIA_Morok_NextWorkRTemple  (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 10;
   condition    = DIA_Morok_NextWorkRTemple_Condition;
   information  = DIA_Morok_NextWorkRTemple_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Morok_NextWorkRTemple_Condition()
{
    if (MIS_SpyInRuins == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_NextWorkRTemple_Info()
{
    AI_Output (other, self ,"DIA_Morok_NextWorkRTemple_15_01"); //Co dalej?
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_02"); //Teraz musimy si� zaj�� sam� �wi�tyni�.
    AI_Output (other, self ,"DIA_Morok_NextWorkRTemple_15_03"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_04"); //Gdy ty w��czy�e� si� za tym podejrzanym typkiem, ja wys�a�em jednego z naszych na zwiady.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_05"); //W �wi�tyni znajduj� si� orkowi wojownicy i kilku szaman�w.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_06"); //Podobno ta ca�a zgraja odprawia jakie� plugawe obrz�dy.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_07"); //Nie mam poj�cia, co z tym teraz zrobi�. Wybi� wszytko do nogi, czy mo�e czeka� na jakie� decyzje naszych w�odarzy?
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_08"); //Udaj si� do Mag�w Ognia i zapytaj ich, co mamy z tym zrobi�.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_09"); //A i po�piesz si�! Orkowie nied�ugo mog� nas wyw�szy�.
    MIS_FireMage_Help = LOG_RUNNING;

    B_LogEntry                     (CH3_QuestForHeavyArmor,"Morok wys�a� na zwiady jednego ze swoich ludzi. W ruinach kr�c� si� orkowie i szamani. Przyw�dca wyprawy przyzna� mi, �e nie chce podejmowa� samodzielnie decyzji, jak dalej post�pi�. Wygl�da na to, �e zn�w musz� robi� za ch�opca na posy�ki i wr�ci� do Mag�w Ognia.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ITalk
//========================================

INSTANCE DIA_Morok_ITalk (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 1;
   condition    = DIA_Morok_ITalk_Condition;
   information  = DIA_Morok_ITalk_Info;
   permanent	= FALSE;
   description	= "By�em u Rodrigueza.";
};

FUNC INT DIA_Morok_ITalk_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rodriguez_ImportantQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_ITalk_Info()
{
    AI_Output (other, self ,"DIA_Morok_ITalk_15_01"); //By�em u Rodrigueza.
    AI_Output (self, other ,"DIA_Morok_ITalk_03_02"); //I co powiedzia�?
    AI_Output (other, self ,"DIA_Morok_ITalk_15_03"); //Mamy wybi� wszystko do nogi.
    AI_Output (other, self ,"DIA_Morok_ITalk_15_04"); //Dosta�em od niego dosy� du�� ilo�� magicznych zwoj�w.
    AI_Output (self, other ,"DIA_Morok_ITalk_03_05"); //No dobra. Zachowaj je. Pewnie zrobisz z nich wi�kszy u�ytek ni� my.
    AI_Output (other, self ,"DIA_Morok_ITalk_15_06"); //Jaki jest plan?
    AI_Output (self, other ,"DIA_Morok_ITalk_03_07"); //Nie ma planu. Ruszamy zwartym szeregiem, gdy tylko b�dziesz got�w.
	
  //  GRD_7894_Morok.flags = 2;
 //   GRD_7895_Patter.flags = 2;
 
    B_LogEntry      (CH3_QuestForHeavyArmor,"Przekaza�em instrukcje od Rodrigueza Morokowi. Gdy b�d� gotowy, mam da� znak do ataku.");
    //Log_SetTopicStatus       (CH1_FireMage_Help, LOG_SUCCESS);
    MIS_FireMage_Help = LOG_SUCCESS;

    //B_GiveXP (150);
    MIS_BattleInTemple = LOG_RUNNING;

    //Log_CreateTopic            (CH1_RzopierdolInTemple, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_RzopierdolInTemple, LOG_RUNNING);
    //B_LogEntry                     (CH1_RzopierdolInTemple,"Razem z Morokiem i jego lud�mi musimy oczy�ci� �wi�tyni�.");
};

//========================================
//-----------------> Attack
//========================================

INSTANCE DIA_Morok_Attack (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 2;
   condition    = DIA_Morok_Attack_Condition;
   information  = DIA_Morok_Attack_Info;
   permanent	= FALSE;
   description	= "Do ataku!";
};

FUNC INT DIA_Morok_Attack_Condition()
{
    if (MIS_BattleInTemple == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_Attack_Info()
{
    AI_Output (other, self ,"DIA_Morok_Attack_15_01"); //Do ataku!
    AI_Output (self, other ,"DIA_Morok_Attack_03_02"); //Chod�my! Za mn�.
    AI_StopProcessInfos	(self);
	B_SetPermAttitude	(GRD_7898_Gardist,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7897_Gardist,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7896_Gardist,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7895_Patter,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7894_Morok,	ATT_FRIENDLY);
	GRD_7898_Gardist.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (GRD_7898_Gardist,"atak");
	GRD_7897_Gardist.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (GRD_7897_Gardist,"atak");
	GRD_7896_Gardist.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (GRD_7896_Gardist,"atak");
	GRD_7895_Patter.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (GRD_7895_Patter,"atak");
	GRD_7894_Morok.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (GRD_7894_Morok,"atak");
};

//========================================
//-----------------> DedAllQuestOK
//========================================

INSTANCE DIA_Morok_DedAllQuestOK (C_INFO)
{
   npc          = GRD_7894_Morok;
   nr           = 1;
   condition    = DIA_Morok_DedAllQuestOK_Condition;
   information  = DIA_Morok_DedAllQuestOK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Morok_DedAllQuestOK_Condition()
{
    if (MIS_BattleInTemple == LOG_RUNNING)
    && (!Wld_DetectNpc(self,OrcShaman,ZS_MM_Rtn_Wusel,-1))
	&& Hlp_StrCmp(Npc_GetNearestWP(self),"TPL_ALCHEMY")
    {
    return TRUE;
    };
};


FUNC VOID DIA_Morok_DedAllQuestOK_Info()
{
    AI_Output (self, other ,"DIA_Morok_DedAllQuestOK_03_01"); //Pozbyli�my si� tego �wi�stwa! Jeste� ca�y?
    AI_Output (other, self ,"DIA_Morok_DedAllQuestOK_15_02"); //Chyba tak.
    AI_Output (self, other ,"DIA_Morok_DedAllQuestOK_03_03"); //To dobrze. Id� do Gomeza i zamelduj mu wykonanie zadania. My zostaniemy na posterunku jaki� czas.
	
    B_LogEntry      (CH3_QuestForHeavyArmor,"Pozbyli�my si� wszystkich ork�w z okolicy. Najwy�szy czas zda� raport Gomezowi.");
    //Log_SetTopicStatus       (CH1_RzopierdolInTemple, LOG_SUCCESS);
    MIS_BattleInTemple = LOG_SUCCESS;
	GRD_7898_Gardist.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (GRD_7898_Gardist,"start");
	GRD_7897_Gardist.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (GRD_7897_Gardist,"start");
	GRD_7896_Gardist.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (GRD_7896_Gardist,"start");
	GRD_7895_Patter.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (GRD_7895_Patter,"start");
	GRD_7894_Morok.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (GRD_7894_Morok,"start");
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};