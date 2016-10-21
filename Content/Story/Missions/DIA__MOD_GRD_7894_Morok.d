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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Morok_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Morok_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Morok_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Morok_HELLO1_03_02"); //Nazywam siê Morok. Jestem dowódc¹ tej wyprawy.
    AI_Output (other, self ,"DIA_Morok_HELLO1_15_03"); //Jakiej wyprawy? Ten obóz jest twój?
    AI_Output (self, other ,"DIA_Morok_HELLO1_03_04"); //Teraz ju¿ tak. Wczeœniej nale¿a³ do dwóch w³óczêgów, ale pewnego dnia zabrali swoje rzeczy i zniknêli bez œladu.
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
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_02"); //Badamy sprawê starej œwi¹tyni znajduj¹cej siê nieopodal.
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_03"); //To, co tam siê dzieje, jest podejrzane. Nawet nie próbuj tam iœæ!
    }
    else
    {
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_04"); //Nie powinno ciê to obchodziæ.
        AI_Output (self, other ,"DIA_Morok_HELLO2_03_05"); //Nawet nie próbuj iœæ dalej. W tym miejscu czaj¹ siê orkowie.
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
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_03"); //Chcesz siê ze mn¹ zmierzyæ?
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_04"); //Widzê, ¿e masz trochê odwagi.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_05"); //Mo¿e wystarczy. Schowaj to.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_06"); //Jak wygl¹da sytuacja?
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_07"); //Przedwczoraj by³em sprawdziæ, co dzieje siê w œwi¹tyni, a raczej na ma³ym placu œwi¹tynnym.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_08"); //Poszed³em w kierunku jeziorka i nagle przed oczami stanê³a mi dziwna postaæ.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_09"); //Ten goœæ szybko zwia³. Nie wiem, kim dok³adnie by³, ale to na pewno nie ork, ani jakiœ stwór.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_10"); //To pierwsza rzecz, któr¹ musimy siê zaj¹æ.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_11"); //IdŸ w kierunku œwi¹tyni i sprawdŸ, czy ktoœ siê tam nie krêci.
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_12"); //Sk¹d wiesz, ¿e nie uciek³ noc¹?
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_13"); //Trzymamy wartê ca³¹ dobê. Nie ma mo¿liwoœci, aby uciek³ œcie¿k¹.
    AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_14"); //Do œwi¹tyni pewnie te¿ nie poszed³. Chyba, ¿e jest samobójc¹.
    AI_Output (other, self ,"DIA_Morok_GomezSendMe_15_15"); //W porz¹dku. Spróbujê odnaleŸæ tajemnicz¹ postaæ.
	AI_Output (self, other ,"DIA_Morok_GomezSendMe_03_16"); //Ani mi siê wa¿ podchodziæ do œwi¹tyni! Orkowie ciê poszatkuj¹.
    //MIS_SpyInRuins = LOG_RUNNING;

    //Log_CreateTopic         (CH1_SzpiegoMoroka, LOG_MISSION);
    //Log_SetTopicStatus      (CH1_SzpiegoMoroka, LOG_RUNNING);
    //B_LogEntry              (CH1_SzpiegoMoroka,"Morok nakaza³ mi odszukanie nieznanego cz³owieka, który rzekomo równie¿ bada œwi¹tyniê. Powinienem go szukaæ w jej pobli¿u.");
    //AI_StopProcessInfos	(self);
	B_LogEntry              (CH3_QuestForHeavyArmor,"Morok nakaza³ mi odszukanie nieznanego cz³owieka, który rzekomo równie¿ bada œwi¹tyniê. Powinienem go szukaæ w jej pobli¿u.");
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
   description	= "Wasz szpieg to zwyk³y myœliwy.";
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
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_01"); //Wasz szpieg to zwyk³y myœliwy.
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_02"); //Niewiele wiedzia³ o starych ruinach. Zawêdrowa³ tam podczas polowania na topielce.
    AI_Output (other, self ,"DIA_Morok_HelpSzpieg_15_03"); //Podobno œwi¹tynia roi siê od orków.
    AI_Output (self, other ,"DIA_Morok_HelpSzpieg_03_04"); //Tyle to i ja wiem, ch³opcze. Dobrze, ¿e to nie by³ ¿aden szpieg z Bractwa.
    B_LogEntry                     (CH3_QuestForHeavyArmor,"Puœci³em Stra¿nika Œwi¹tynnego wolno. Morok niczego nie podejrzewa³. Teraz mamy wa¿niejsze sprawy na g³owie, ni¿ zemsta na ludziach z Bractwa.");
    //Log_SetTopicStatus       (CH1_SzpiegoMoroka, LOG_SUCCESS);
    MIS_SpyInRuins = LOG_SUCCESS;

    B_GiveXP (100);
	
	
    B_LogEntry               (CH3_ArmorForSpy,"Powiedzia³em Morokowi, ¿e Stra¿nik Œwi¹tynny to zwyczajny myœliwy. Nikt niczego nie podejrzewa, a ja unikn¹³em niepotrzebnego rozlewu krwi.");
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
   description	= "Szpieg z bagna zosta³ zabity.";
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
    AI_Output (other, self ,"DIA_Morok_ZabitySzpieg_15_01"); //Szpieg z bagna zosta³ zabity.
    AI_Output (self, other ,"DIA_Morok_ZabitySzpieg_03_02"); //A wiêc to jednak jeden z tych œmierdz¹cych œwirów.
    AI_Output (self, other ,"DIA_Morok_ZabitySzpieg_03_03"); //Œwietna robota. Bierzmy siê zatem do pracy.
	B_LogEntry                     (CH3_QuestForHeavyArmor,"Zabi³em Œwi¹tynnego, który krêci³ siê wokó³ ruin. Morok stwierdzi³, ¿e mo¿emy dzia³aæ dalej.");

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
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_02"); //Teraz musimy siê zaj¹æ sam¹ œwi¹tyni¹.
    AI_Output (other, self ,"DIA_Morok_NextWorkRTemple_15_03"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_04"); //Gdy ty w³óczy³eœ siê za tym podejrzanym typkiem, ja wys³a³em jednego z naszych na zwiady.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_05"); //W œwi¹tyni znajduj¹ siê orkowi wojownicy i kilku szamanów.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_06"); //Podobno ta ca³a zgraja odprawia jakieœ plugawe obrzêdy.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_07"); //Nie mam pojêcia, co z tym teraz zrobiæ. Wybiæ wszytko do nogi, czy mo¿e czekaæ na jakieœ decyzje naszych w³odarzy?
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_08"); //Udaj siê do Magów Ognia i zapytaj ich, co mamy z tym zrobiæ.
    AI_Output (self, other ,"DIA_Morok_NextWorkRTemple_03_09"); //A i poœpiesz siê! Orkowie nied³ugo mog¹ nas wywêszyæ.
    MIS_FireMage_Help = LOG_RUNNING;

    B_LogEntry                     (CH3_QuestForHeavyArmor,"Morok wys³a³ na zwiady jednego ze swoich ludzi. W ruinach krêc¹ siê orkowie i szamani. Przywódca wyprawy przyzna³ mi, ¿e nie chce podejmowaæ samodzielnie decyzji, jak dalej post¹piæ. Wygl¹da na to, ¿e znów muszê robiæ za ch³opca na posy³ki i wróciæ do Magów Ognia.");
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
   description	= "By³em u Rodrigueza.";
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
    AI_Output (other, self ,"DIA_Morok_ITalk_15_01"); //By³em u Rodrigueza.
    AI_Output (self, other ,"DIA_Morok_ITalk_03_02"); //I co powiedzia³?
    AI_Output (other, self ,"DIA_Morok_ITalk_15_03"); //Mamy wybiæ wszystko do nogi.
    AI_Output (other, self ,"DIA_Morok_ITalk_15_04"); //Dosta³em od niego dosyæ du¿¹ iloœæ magicznych zwojów.
    AI_Output (self, other ,"DIA_Morok_ITalk_03_05"); //No dobra. Zachowaj je. Pewnie zrobisz z nich wiêkszy u¿ytek ni¿ my.
    AI_Output (other, self ,"DIA_Morok_ITalk_15_06"); //Jaki jest plan?
    AI_Output (self, other ,"DIA_Morok_ITalk_03_07"); //Nie ma planu. Ruszamy zwartym szeregiem, gdy tylko bêdziesz gotów.
	
  //  GRD_7894_Morok.flags = 2;
 //   GRD_7895_Patter.flags = 2;
 
    B_LogEntry      (CH3_QuestForHeavyArmor,"Przekaza³em instrukcje od Rodrigueza Morokowi. Gdy bêdê gotowy, mam daæ znak do ataku.");
    //Log_SetTopicStatus       (CH1_FireMage_Help, LOG_SUCCESS);
    MIS_FireMage_Help = LOG_SUCCESS;

    //B_GiveXP (150);
    MIS_BattleInTemple = LOG_RUNNING;

    //Log_CreateTopic            (CH1_RzopierdolInTemple, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_RzopierdolInTemple, LOG_RUNNING);
    //B_LogEntry                     (CH1_RzopierdolInTemple,"Razem z Morokiem i jego ludŸmi musimy oczyœciæ œwi¹tyniê.");
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
    AI_Output (self, other ,"DIA_Morok_Attack_03_02"); //ChodŸmy! Za mn¹.
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
    AI_Output (self, other ,"DIA_Morok_DedAllQuestOK_03_01"); //Pozbyliœmy siê tego œwiñstwa! Jesteœ ca³y?
    AI_Output (other, self ,"DIA_Morok_DedAllQuestOK_15_02"); //Chyba tak.
    AI_Output (self, other ,"DIA_Morok_DedAllQuestOK_03_03"); //To dobrze. IdŸ do Gomeza i zamelduj mu wykonanie zadania. My zostaniemy na posterunku jakiœ czas.
	
    B_LogEntry      (CH3_QuestForHeavyArmor,"Pozbyliœmy siê wszystkich orków z okolicy. Najwy¿szy czas zdaæ raport Gomezowi.");
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