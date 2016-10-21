//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_osko_EXIT(C_INFO)
{
	npc             = NON_2706_osko;
	nr              = 999;
	condition	= DIA_osko_EXIT_Condition;
	information	= DIA_osko_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_osko_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_osko_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoJu
//========================================

INSTANCE DIA_osko_WhoJu (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_osko_WhoJu_Condition;
   information  = DIA_osko_WhoJu_Info;
   permanent	= false;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_osko_WhoJu_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_WhoJu_Info()
{
    AI_Output (other, self ,"DIA_osko_WhoJu_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_osko_WhoJu_03_02"); //Hmm? Jestem Osko. Polujê na orków razem z band¹ Wilsona. Mia³eœ du¿o szczêœcia, ¿e uda³o ci siê tu dotrzeæ w jednym kawa³ku.
	AI_Output (other, self ,"DIA_osko_WhoJu_15_03"); //Wspi¹³em siê tu po œcianie skalnej.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_04"); //To oczywiste. Nie da³byœ rady przejœæ od strony Ziem Orków. Wejœcie do obozu jest zabarykadowane. Poza tym nik³e szanse, ¿e w ogóle byœ do niego dotar³. 
	AI_Output (self, other ,"DIA_osko_WhoJu_03_05"); //Nie zmienia to faktu, ¿e droga przez ska³y te¿ nie jest ³atwa. Jeden fa³szywy ruch i l¹dujesz na ziemi ze skrêconym karkiem.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_06"); //Poni¿ej, w szczelinie skalnej mieszka pewien staruszek. Rozmawia³em z nim kiedyœ. Uciek³ ze Starego Obozu kilka lat temu, a ja obieca³em, ¿e go nie wydam.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_07"); //No bo w sumie po co? Nie nadepn¹³ mi na odcisk, a za Stra¿nikami z Obozu niezbyt przepadam, wiêc niech sobie tu ¿yje. 
	AI_Output (other, self ,"DIA_osko_WhoJu_15_08"); //Do czego zmierzasz?
	AI_Output (self, other ,"DIA_osko_WhoJu_03_09"); //Ten staruszek pomimo lat wci¹¿ potrafi siê nieŸle wspinaæ. Myœlê, ¿e gdybyœ z nim pogada³, móg³by ciê czegoœ nauczyæ.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"£owca orków Osko zdradzi³ mi, ¿e w jaskini w pobli¿u ich obozu mieszka niezwykle zrêczny staruszek. Jeœli go poproszê, mo¿e nauczy mnie akrobatyki.");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_osko_HELLO5 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 5;
   condition    = DIA_osko_HELLO5_Condition;
   information  = DIA_osko_HELLO5_Info;
   permanent	= FALSE;
   description	= "Dlaczego polujecie na orków?";
};

FUNC INT DIA_osko_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO5_15_01"); //Dlaczego polujecie na orków?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_02"); //A dlaczego by nie? Co mamy lepszego do roboty pod Barier¹?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_03"); //WyobraŸ sobie, ¿e kiedyœ uciekniemy z tego okropnego miejsca. Wtedy umiejêtnoœci siê przydadz¹. Zw³aszcza, ¿e na kontynencie trwa wojna.
    AI_Output (self, other ,"DIA_osko_HELLO5_03_04"); //Skoñczy³y siê czasy w których do stra¿y miejskiej przyjmowa³o siê byle kogo. W czasie wojny s³abi pracuj¹ w polu, a silni walcz¹. 
	AI_Output (other, self ,"DIA_osko_HELLO5_15_05"); //Dobrze rozumiem, ¿e jeœli uda³oby ci siê st¹d uciec, to zaci¹gn¹³byœ siê do stra¿y miejskiej, by walczyæ z orkami?
	AI_Output (self, other ,"DIA_osko_HELLO5_03_06"); //Gdybym mia³ okazjê, to owszem. Stra¿nicy dostaj¹ ¿o³d, zni¿ki w burdelach i mieszkañcy ich szanuj¹. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_07"); //Od czasu do czasu musia³bym tylko ubiæ jakiegoœ orka, który niebezpiecznie siê zbli¿y³. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_08"); //Nic nadzwyczajnego. Tutaj robiê to codziennie. 
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_osko_HELLO6 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 6;
   condition    = DIA_osko_HELLO6_Condition;
   information  = DIA_osko_HELLO6_Info;
   permanent	= FALSE;
   description	= "To trudna praca?";
};

FUNC INT DIA_osko_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO6_15_01"); //To trudna praca?
    AI_Output (self, other ,"DIA_osko_HELLO6_03_02"); //Oczywiœcie, ¿e tak. Orkowie to twardzi przeciwnicy.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_03"); //Trzeba atakowaæ szybko i mocno. Nie mo¿na siê wahaæ.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_04"); //Aby dobrze walczyæ z orkami, musisz p³ynnie pos³ugiwaæ siê swoim orê¿em.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_05"); //Nie zawsze liczy siê tylko si³a.
};

//========================================
//-----------------> PROWOKACJA_DO_QUESTA
//========================================

INSTANCE DIA_osko_PROWOKACJA_DO_QUESTA (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_PROWOKACJA_DO_QUESTA_Condition;
   information  = DIA_osko_PROWOKACJA_DO_QUESTA_Info;
   permanent	= FALSE;
   description	= "Jak tam sytuacja w obozie?";
};

FUNC INT DIA_osko_PROWOKACJA_DO_QUESTA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_PROWOKACJA_DO_QUESTA_Info()
{
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_01"); //Jak tam sytuacja w obozie?
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_02"); //Jak na razie wszystko pod kontrol¹, orkowie trzymaj¹ siê od nas z dala. A jak któryœ z nich zapuœci siê zbyt blisko naszego obozu, szybko tego ¿a³uje.
	AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_03"); //Ostatnio jednak zdarzy³o siê coœ dziwnego, jak masz chwilkê mogê ci opowiedzieæ.
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_04"); //Mam czas, opowiadaj.
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_05"); //Najpierw przynieœ mi piwo, bo trochê zasch³o mi w ustach.
};

//========================================
//-----------------> QUEST_HUGO_START
//========================================

INSTANCE DIA_osko_QUEST_HUGO_START (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 2;
   condition    = DIA_osko_QUEST_HUGO_START_Condition;
   information  = DIA_osko_QUEST_HUGO_START_Info;
   permanent	= FALSE;
   description	= "Proszê bardzo. Wypij moje zdrowie.";
};

FUNC INT DIA_osko_QUEST_HUGO_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_PROWOKACJA_DO_QUESTA))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_QUEST_HUGO_START_Info()
{
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_01"); //Proszê bardzo. Wypij moje zdrowie.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_StandUp (self);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_02"); //Dziêki. No wiêc tak... W naszym obozie jeszcze kilka dni temu by³ jeszcze jeden ³owca. Nazywa³ siê Hugo i trochê za bardzo interesowa³ siê orkow¹ kultur¹. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_03"); //Wiesz, zanim wsadzi³ jakiemuœ orkowi topór w dupê, wpierw trochê go torturowa³, pytaj¹c o ró¿ne rzeczy.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_04"); //W ka¿dym razie jakiœ tydzieñ temu walczyliœmy z grupk¹ orków w ruinach starej Cytadeli, na najwy¿szej górze Kolonii. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_05"); //Hugo po walce znalaz³ przy zw³okach orkowego przywódcy jak¹œ mapê. Po tym jak wróciliœmy do obozu, studiowa³ j¹ przez dwa dni, po czym znikn¹³ bez œladu nikomu nic nie mówi¹c.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_06"); //Ja i reszta ch³opaków jesteœmy trochê tym faktem zmartwieni. Hugo to œwietny wojownik i wie jak traktowaæ orków. Szkoda by³oby straciæ kogoœ takiego. Jeœli gdzieœ go spotkasz, daj mi znaæ. 
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_07"); //W porz¹dku. Jeœli go gdzieœ spotkam, to siê o tym dowiesz.
    MIS_HunterHugo = LOG_RUNNING;

    Log_CreateTopic          (CH1_HunterHugo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_RUNNING);
    B_LogEntry               (CH1_HunterHugo,"Osko zdradzi³ mi, ¿e w obozie ³owców orków by³ jeszcze jeden myœliwy imieniem Hugo. Ponoæ bardzo interesowa³a go kultura orków. By³ dosyæ osobliwym cz³owiekiem, ale potrafi³ sobie poradziæ w niebezpieczeñstwie. Muszê go poszukaæ. Z pewnoœci¹ jest gdzieœ w pobli¿u obozu. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ODKRYLEM
//========================================

INSTANCE DIA_osko_ODKRYLEM (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_ODKRYLEM_Condition;
   information  = DIA_osko_ODKRYLEM_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.";
};

FUNC INT DIA_osko_ODKRYLEM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_ODKRYLEM_Info()
{
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_01"); //Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.
    AI_Output (self, other ,"DIA_osko_ODKRYLEM_03_02"); //Dobra robota, cieszê siê, ¿e taki kawa³ wojownika jak on nie da³ siê tak ³atwo zabiæ. Oto 100 bry³ek rudy za informacje.
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_03"); //Dziêki. 
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry     (CH1_HunterHugo,"Powiedzia³em Osko o tym, ¿e znalaz³em Hugo i pomog³em mu rozwi¹zaæ jego problemy.");
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_SUCCESS);
    MIS_HunterHugo = LOG_SUCCESS;

    B_GiveXP (200);
};