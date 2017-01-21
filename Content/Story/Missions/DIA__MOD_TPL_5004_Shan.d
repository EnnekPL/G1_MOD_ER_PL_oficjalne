//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Shan_EXIT(C_INFO)
{
	npc             = TPL_5004_Shan;
	nr              = 999;
	condition	= DIA_Shan_EXIT_Condition;
	information	= DIA_Shan_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Shan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Shan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Shan_WORK (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_WORK_Condition;
   information  = DIA_Shan_WORK_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Shan_WORK_Condition()
{
	if (kapitel < 3) {
    return TRUE; };
};

FUNC VOID DIA_Shan_WORK_Info()
{
    AI_Output (other, self ,"DIA_Shan_WORK_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Shan_WORK_03_02"); //S³u¿ê Y'Berionowi rad¹, opiekujê siê œwi¹tyni¹, dbam o drobne sprawy.
    AI_Output (other, self ,"DIA_Shan_WORK_15_03"); //Pewnie du¿o z tym zamieszania.
    AI_Output (self, other ,"DIA_Shan_WORK_03_04"); //Nie jest tak Ÿle. Palê ziele, aby uspokoiæ mojego ducha.
};


//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Shan_HELLO (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_HELLO_Condition;
   information  = DIA_Shan_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Shan_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Shan_HELLO_03_01"); //Witaj, przybyszu! Nazywam siê Shan, pokorny s³uga Œni¹cego.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_02"); //Jestem pomocnikiem Y'Beriona. Wydajê tak¿e polecenia.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_03"); //Je¿eli szukasz pracy, zg³oœ siê do mnie.
};

///////////////////////////
// GURU 
//////////////////////////

//========================================
//-----------------> SZEF
//========================================

INSTANCE DIA_Shan_SZEF (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SZEF_Condition;
   information  = DIA_Shan_SZEF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_SZEF_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Shan_SZEF_Info()
{
    AI_Output (self, other ,"DIA_Shan_SZEF_03_01"); //Mistrzu, mamy kilka spraw, którymi natychmiast musisz siê zaj¹æ.
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Shan_QUEST1 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_QUEST1_Condition;
   information  = DIA_Shan_QUEST1_Info;
   permanent	= FALSE;
   description	= "Od czego zaczynamy?";
};

FUNC INT DIA_Shan_QUEST1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Shan_SZEF))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Shan_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_01"); //Od czego zaczynamy?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_02"); //Podczas rytua³u przywo³ania Œni¹cego na palcu jak i w œwi¹tyni by³o niema³e zamieszanie.
	AI_Output (other, self ,"DIA_Shan_QUEST1_15_03"); //Co w zwi¹zku z tym?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_04"); //Wszed³ tu jeden z Nowicjuszy i zabra³ Kostur Œwiat³a nale¿¹cy do Y'Beriona. 
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_05"); //To bardzo wa¿ne, aby go odzyskaæ. Jest nam potrzebny do ceremonii pogrzebu Mistrza.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_06"); //Kostur musi siê znaleŸæ w jego grobie. 
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_07"); //Gdzie mam zacz¹æ poszukiwania?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_08"); //Popytaj ludzi bêd¹cych na placu. Mówi siê, ¿e z³odziej bardzo szybko wybieg³ i wpad³ po drodze na naszych braci.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_09"); //Mo¿e ktoœ coœ wie...
    MIS_StolenStaff = LOG_RUNNING;

    Log_CreateTopic          (CH3_StolenStaff, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StolenStaff, LOG_RUNNING);
    B_LogEntry               (CH3_StolenStaff,"Shan kaza³ mi znaleŸæ z³odzieja, który w³ama³ siê do œwi¹tyni podczas rytua³u przywo³ania i ukrad³ kostur Y'Beriona. Rabuœ wypad³ ze œwi¹tyni jak oszala³y. Z pewnoœci¹ potr¹ci³ kogoœ na placu. Tam powinienem szukaæ wskazówek.");
};
//========================================
//-----------------> QUEST1_WIN
//========================================

INSTANCE DIA_QUEST1_QUEST1_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 3;
   condition    = DIA_QUEST1_QUEST1_WIN_Condition;
   information  = DIA_QUEST1_QUEST1_WIN_Info;
   permanent	= FALSE;
   description	= "Odzyska³em skradziony kostur.";
};

FUNC INT DIA_QUEST1_QUEST1_WIN_Condition()
{
    if (Npc_HasItems (other, Stab_des_Lichts) >=1) && (MIS_StolenStaff == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_QUEST1_QUEST1_WIN_Info()
{
    AI_Output (other, self ,"DIA_QUEST1_QUEST1_WIN_15_01"); //Odzyska³em skradziony kostur.
    AI_Output (self, other ,"DIA_QUEST1_QUEST1_WIN_03_02"); //Proszê, daj mi go. Zajmê siê jego przechowaniem.
    B_LogEntry           (CH3_StolenStaff,"Odda³em skradziony kostur Shanowi. On dopilnuje, by broñ zosta³a zabezpieczona razem z cia³em Y'Beriona.");
    Log_SetTopicStatus   (CH3_StolenStaff, LOG_SUCCESS);
    MIS_StolenStaff = LOG_SUCCESS;
	
    B_GiveInvItems (other, self, Stab_des_Lichts, 1);

    B_GiveXP (150);
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_Shan_QUEST2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 4;
   condition    = DIA_Shan_QUEST2_Condition;
   information  = DIA_Shan_QUEST2_Info;
   permanent	= FALSE;
   description	= "Co jeszcze jest do zrobienia?";
};

FUNC INT DIA_Shan_QUEST2_Condition()
{
    if (MIS_StolenStaff == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_01"); //Co jeszcze jest do zrobienia?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_02"); //Ca³kiem sporo...
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_03"); //Dowiedzia³em siê, ¿e w Obozie odbywa siê utajniony obrót amuletami i talizmanami. Ktoœ sprzedaje takie artefakty po zawy¿onej cenie.
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_04"); //Nie podoba mi siê to. Tylko Guru maj¹ wy³¹cznoœæ na sprzeda¿ magicznych przedmiotów. Powinieneœ siê tym jak najszybciej zaj¹æ.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_05"); //Dlaczego to takie wa¿ne?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_06"); //Sk¹d to pytanie? Magiczne artefakty maj¹ potê¿na moc. W niepowo³anych rêkach mog¹ wyrz¹dziæ wiele szkód. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_07"); //Tylko Guru maj¹ wystarczaj¹co du¿o doœwiadczenia, by móc oceniæ, czy Nowicjusz ma czyste intencje. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_08"); //Miej te¿ na uwadze, ¿e od kiedy dowiedzieliœmy siê, ¿e Œni¹cy jest demonem, ludzie w Obozie zaczynaj¹ wariowaæ. 
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_09"); //Po prostu znajdŸ tego cz³owieka i naka¿ mu oddaæ wszystkie b³yskotki Baal Cadarowi.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_10"); //Mo¿esz mnie jakoœ naprowadziæ?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_11"); //Twoim punktem zaczepienia powinna byæ rozmowa z Talasem. To on poinformowa³ mnie o tym procederze.
    MIS_StrangeResearcher = LOG_RUNNING;

    Log_CreateTopic          (CH3_StrangeResearcher, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_RUNNING);
    B_LogEntry               (CH3_StrangeResearcher,"Shan kaza³ mi odkryæ kto w Obozie prowadzi badania nad bagnem. Wskazówk¹ jest to, ¿e osoba handluje poszukiwanymi przez Y'Beriona przedmiotami.");
};

//========================================
//-----------------> QUEST2_WIN
//========================================

INSTANCE DIA_Shan_QUEST2_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 5;
   condition    = DIA_Shan_QUEST2_WIN_Condition;
   information  = DIA_Shan_QUEST2_WIN_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em tego handlarza.";
};

FUNC INT DIA_Shan_QUEST2_WIN_Condition()
{
    if (MIS_StrangeResearcher == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Steh_QUEST2_YOU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_WIN_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_01"); //Odnalaz³em tego handlarza. Nie bêdzie ju¿ sprzedawa³ artefaktów.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_02"); //Zgodzi³ siê nawet oddaæ je do œwi¹tyni. Nazywa siê Steh.
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_03"); //Doskonale. Teraz amulety i pierœcienie nie wpadn¹ w niepowo³ane rêce. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_04"); //Mimo to odczuliœmy ju¿ skutki niepos³uszeñstwa Steha.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_05"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_06"); //Porozmawiamy o tym za chwilê. Mistrzu, weŸ tê rudê ze skrzyni Y'Beriona.
    B_LogEntry               (CH3_StrangeResearcher,"Powiedzia³em Shanowi o mojej rozmowie ze Stehem. By³ zadowolony, ale jednoczeœnie zaniepokojony. Widocznie sta³o siê coœ z³ego.");
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_SUCCESS);
    MIS_StrangeResearcher = LOG_SUCCESS;

    B_GiveXP (120);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> QUEST3
//========================================

INSTANCE DIA_Shan_QUEST3 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 6;
   condition    = DIA_Shan_QUEST3_Condition;
   information  = DIA_Shan_QUEST3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_QUEST3_Condition()
{
    if (MIS_StrangeResearcher == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST3_Info()
{
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_01"); //Wróæmy do tego o czym wspomina³em...
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_02"); //Podczas twojej pracy na rzecz Bractwa sta³o siê coœ okropnego.
	AI_Output (self, other ,"DIA_Shan_QUEST3_03_03"); //W Obozie dokonano trzech zabójstw. Jedno po drugim. Ka¿de kilka godzin po poprzednim.
    AI_Output (other, self ,"DIA_Shan_QUEST3_15_04"); //Masz jakichœ podejrzanych?
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_05"); //Nie. Musisz popytaæ wœród ludzi, którzy krêcili siê ko³o miejsc zbrodni. Obejrzyj te¿ trupy.
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_06"); //Jeden le¿y za wielkim drzewem, na którym stoi chata Kaloma.
    AI_Output (self, other ,"DIA_Shan_QUEST3_15_07"); //Drugi przy palisadzie - niedaleko Steha.
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_08"); //A trzeci na bagnie w pobli¿u chaty drwala.
    AI_Output (other, self ,"DIA_Shan_QUEST3_15_09"); //W porz¹dku. Biorê siê do roboty.
    MIS_PsionicCSI = LOG_RUNNING;
	
	Wld_InsertNpc				(NOV_5011_Martwy_Nowicjusz,"PSI_START");
	B_KillNPC	(NOV_5011_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5010_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5010_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5009_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5009_Martwy_nowicjusz);
    Log_CreateTopic            (CH3_PsionicCSI, LOG_MISSION);
    Log_SetTopicStatus       (CH3_PsionicCSI, LOG_RUNNING);
	
    B_LogEntry                     (CH3_PsionicCSI,"Ktoœ zabi³ trzech Nowicjuszy z Obozu Bractwa. Mam ustaliæ kim jest zabójca. Cia³a le¿¹ na miejscach zbrodni: za drzewem na którym stoi laboratorium, przy palisadzie (okolice Steha) i na bagnach w pobli¿u chaty drwala.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KILLTOOL
//========================================

INSTANCE DIA_Shan_KILLTOOL (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 6;
   condition    = DIA_Shan_KILLTOOL_Condition;
   information  = DIA_Shan_KILLTOOL_Info;
   permanent	= FALSE;
   description	= "Znalaz³em narzêdzia zbrodni.";
};

FUNC INT DIA_Shan_KILLTOOL_Condition()
{
    if (MIS_StrangeResearcher == LOG_SUCCESS) && (Npc_HasItems (other, ItMw_SiekieraCSI) >=1) && (Npc_HasItems (other, ItMi_OstrzeCSI) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_KILLTOOL_Info()
{
	AI_Output (other, self ,"DIA_Shan_KILLTOOL_15_01"); //Znalaz³em narzêdzia zbrodni.
    AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_02"); //Poka¿ mi je.
	AI_Output (other, self ,"DIA_Shan_KILLTOOL_15_03"); //To jakieœ ostrza i siekiery.
    AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_04"); //Siekiery nosi wielu Nowicjuszy. Wykorzystywali je do budowy chat.
	AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_05"); //Ale te ostrza s¹ jakieœ dziwne. Wygl¹daj¹ jak z tartaku. Rozmawia³eœ z Hansonem? Mo¿e to on jest zabójc¹?
    B_LogEntry                     (CH3_PsionicCSI,"Pokaza³em narzêdzia zbrodni Shanowi. Powiedzia³ mi, ¿ebym sprawdzi³ Hansona, poniewa¿ tylko on pracuje w tartaku.");
};


//========================================
//-----------------> QUEST3_OK
//========================================

INSTANCE DIA_Shan_QUEST3_OK (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 7;
   condition    = DIA_Shan_QUEST3_OK_Condition;
   information  = DIA_Shan_QUEST3_OK_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z zabójc¹.";
};

FUNC INT DIA_Shan_QUEST3_OK_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Hanson_QUEST2_D))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST3_OK_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_01"); //Rozmawia³em z zabójc¹.
    AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_02"); //Czy stanowi on jeszcze zagro¿enie?
	AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_03"); //Nie, ju¿ nie.
    AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_04"); //Kim on jest?
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_05"); //To Hanson - miejscowy drwal. Powodem morderstw by³a zemsta za d³ugi.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_06"); //Ju¿ siê ba³em, ¿e to przez wp³yw Œni¹cego ludzie zaczynaj¹ zachowywaæ siê dziwnie.
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_07"); //Bo faktycznie zaczynaj¹. Trac¹ wiarê i to sk³ania ich do ³amania zasad. Steh, Hanson... Ta lista wkrótce mo¿e siê wyd³u¿yæ.
	AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_08"); //Bractwo zaczyna siê rozpadaæ.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_09"); //Spróbujê za³agodziæ sytuacjê. Porozmawiam z pozosta³ymi Guru. Powiem im, ¿eby dostosowali S³owo do nowych warunków.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_10"); //Mistrzu, twoja praca na razie jest zakoñczona. Muszê siê teraz zaj¹æ t¹ spraw¹. 
    B_LogEntry               (CH3_PsionicCSI,"Opowiedzia³em Shanowi o Hansonie. Okazuje siê, ¿e sytuacja w Obozie robi siê coraz mniej ciekawa. Aby zapobiec kolejnym incydentom Shan porozmawia z pozosta³ymi Guru.");
    Log_SetTopicStatus       (CH3_PsionicCSI, LOG_SUCCESS);
    MIS_PsionicCSI = LOG_SUCCESS;

    B_GiveXP (300);
};

//========================================
//-----------------> QuestsBractwo2
//========================================

INSTANCE DIA_Shan_QuestsBractwo2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_QuestsBractwo2_Condition;
   information  = DIA_Shan_QuestsBractwo2_Info;
   permanent	= FALSE;
   description	= "Czy Bractwo ma dla mnie jakieœ zlecenia?";
};

FUNC INT DIA_Shan_QuestsBractwo2_Condition()
{
    if (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QuestsBractwo2_Info()
{
    AI_Output (other, self ,"DIA_Shan_QuestsBractwo2_15_01"); //Czy Bractwo ma dla mnie jakieœ zlecenia?
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_02"); //Na pewno coœ siê znajdzie. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_03"); //Ostatnio zgin¹³ nasz badacz. Dosyæ stary, brodaty mê¿czyzna. Wykonywa³ pewne zlecenie dla Y'Beriona.
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_04"); //By³ te¿ naszym drugim alchemikiem. Kilka dni temu wyruszy³ na bagna, jednak do tej pory nie wróci³. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_05"); //Nosi³ pancerz Stra¿nika Œwi¹tynnego.  To powinno ci pomóc go odnaleŸæ. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_06"); //B¹dŸ ostro¿ny i unikaj b³otnych wê¿y. 
    MIS_OldAlchemist = LOG_RUNNING;
	
    Log_CreateTopic          (CH2_OldAlchemist, LOG_MISSION);
    Log_SetTopicStatus       (CH2_OldAlchemist, LOG_RUNNING);
    B_LogEntry               (CH2_OldAlchemist,"Shan kaza³ mi odnaleŸæ starego alchemika, który przeprowadza³ dla Bractwa badania nad bagnem. Mê¿czyzna by³ brodaty i nosi³ pancerz Stra¿nika Œwi¹tynnego.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Shan_HELLO2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_HELLO2_Condition;
   information  = DIA_Shan_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czyta³em notatki alchemika.";
};

FUNC INT DIA_Shan_HELLO2_Condition()
{
    if (MIS_OldAlchemist == LOG_RUNNING)
    && (czytane_NotatkiAlchemika == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Shan_HELLO2_15_01"); //Czyta³em notatki alchemika. Wynika z nich, ¿e uda³ siê w kierunku Cmentarzyska Orków. 
    AI_Output (self, other ,"DIA_Shan_HELLO2_03_02"); //Nawet nie myœl o tym, ¿eby tam pójœæ. To zbyt niebezpieczne. Nasz badacz w koñcu wróci.
    AI_Output (self, other ,"DIA_Shan_HELLO2_03_03"); //Masz przy sobie jego notatki?
    if (Npc_HasItems (other, NotatkiAlchemika) >=1)
    {
        AI_Output (other, self ,"DIA_Shan_HELLO2_15_04"); //Tak. WeŸ je.
        AI_Output (self, other ,"DIA_Shan_HELLO2_03_05"); //Dziêkujê.
        CreateInvItems (self, ItMiNugget, 50);
        B_GiveInvItems (self, other, ItMiNugget, 50);
        B_GiveInvItems (other, self, NotatkiAlchemika, 1);
        B_LogEntry                     (CH2_OldAlchemist,"Odda³em Shanowi notatki, które znalaz³em na bagnie. Najpewniej nale¿a³y do alchemika.");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_HELLO2_15_06"); //Nie.
        AI_Output (self, other ,"DIA_Shan_HELLO2_03_07"); //Mo¿esz ju¿ iœæ.
    };
    B_LogEntry                     (CH2_OldAlchemist,"Rozmawia³em z Shanem o moim znalezisku z bagna. Notatki alchemika wykaza³y, ¿e uda³ siê on na Cmentarzysko Orków. Nie mam zamiaru tam iœæ w najbli¿szym czasie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TalkAboutStones
//========================================

INSTANCE DIA_Shan_TalkAboutStones (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_TalkAboutStones_Condition;
   information  = DIA_Shan_TalkAboutStones_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z alchemikiem.";
};

FUNC INT DIA_Shan_TalkAboutStones_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO1))
	&& (MIS_OldAlchemist == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_TalkAboutStones_Info()
{
    AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_01"); //Rozmawia³em z alchemikiem.
    AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_02"); //I co? Gdzie on jest?
    AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_03"); //Nie ¿yje. Znalaz³em go umieraj¹cego na Cmentarzysku Orków.
    AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_04"); //Wielka to bêdzie strata. Uda³o ci siê poznaæ wyniki jego badañ?
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO4))
    {
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_05"); //Tak. Cmentarzysko Orków nie ma nic wspólnego z obiektami na bagnie. 
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_06"); //Te swoiste kaplice to czary ¿ycia i energii.
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_07"); //Przebywaj¹c wokó³ nich mo¿na zregenerowaæ swoj¹ energiê i nie tylko.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_08"); //Gdybyœmy mogli panowaæ nad ich moc¹, moglibyœmy zrobiæ wiele dobrego.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_09"); //Dziêkujê ci za tw¹ odwagê i poœwiêcenie.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_10"); //WeŸ to jako zap³atê.
        B_LogEntry               (CH2_OldAlchemist,"Shan by³ zadowolony, gdy pozna³ wyniki badañ alchemika. Szkoda, ¿e on sam nie móg³ mu o nich opowiedzieæ.");
        Log_SetTopicStatus       (CH2_OldAlchemist, LOG_SUCCESS);
        MIS_OldAlchemist = LOG_SUCCESS;

        B_GiveXP (400);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_11"); //Niestety nie.
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_12"); //Zmar³ przedwczeœnie.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_13"); //Trudno...
        B_LogEntry                     (CH2_OldAlchemist,"Niestety nie uzyska³em kluczowych informacji od alchemika.");
        Log_SetTopicStatus       (CH2_OldAlchemist, LOG_FAILED);
        MIS_OldAlchemist = LOG_FAILED;
		//PrintScreen	("Anulowano zadanie: Poszukiwania alchemika! ", 1,-1,"font_new_10_red.tga",2);	

        B_GiveXP (200);
    };
    CreateInvItems (self, ItMiNugget, 75);
    B_GiveInvItems (self, other, ItMiNugget, 75);
    AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> QuestCH3
//========================================

INSTANCE DIA_Shan_QuestCH3 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_QuestCH3_Condition;
   information  = DIA_Shan_QuestCH3_Info;
   permanent	= FALSE;
   description	= "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_Shan_QuestCH3_Condition()
{
    if (Kapitel >= 3)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QuestCH3_Info()
{
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_01"); //Mogê coœ dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_02"); //Jest pewna sprawa, któr¹ móg³byœ siê zaj¹æ.
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_04"); //Ktoœ z naszych sprzedaje eliksir z wnêtrznoœci pe³zaczy do pozosta³ych obozów.
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_05"); //Dowiedz siê, kto to jest i natychmiast mi o tym powiedz. Nie wiem od czego mia³byœ zacz¹æ. Spróbuj pogadaæ z handlarzami.
    MIS_SellElixer = LOG_RUNNING;

    Log_CreateTopic          (CH3_SellElixer, LOG_MISSION);
    Log_SetTopicStatus       (CH3_SellElixer, LOG_RUNNING);
    B_LogEntry               (CH3_SellElixer,"Shan kaza³ mi odkryæ, kto nielegalnie sprzedaje eliksir z wnêtrznoœci pe³zaczy. Towar trafia do pozosta³ych obozów. Powinienem popytaæ wœród handlarzy.");
    AI_StopProcessInfos	(self);
	
	var c_npc dexter;
	dexter = Hlp_GetNpc(STT_329_Dexter);
	CreateInvItems (dexter, ItFo_Potion_Elixier_Egg, 3);
};

//========================================
//-----------------> SellElixirCaine
//========================================

INSTANCE DIA_Shan_SellElixirCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SellElixirCaine_Condition;
   information  = DIA_Shan_SellElixirCaine_Info;
   permanent	= FALSE;
   description	= "Uda³o mi siê odnaleŸæ sprzedawcê eliksiru.";
};

FUNC INT DIA_Shan_SellElixirCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_SellElixirCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_01"); //Uda³o mi siê odnaleŸæ sprzedawcê eliksiru. To Nowicjusz Caine.
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_02"); //Próbowa³ mnie przekupiæ, ale nie przyj¹³em jego propozycji.
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_03"); //Caine? Nieprawdopodobne. Nie spodziewa³em siê tego po nim. Jest zaufanym cz³owiekiem Cor Kaloma.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_04"); //Ju¿ chyba nim nie bêdzie...
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_05"); //Oczywiœcie, spotka go kara, jednak w¹tpiê, ¿e zniknie z Obozu. Jego doœwiadczenie jest dla nas bardzo wa¿ne.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_06"); //Jaki problem przyuczyæ kogoœ nowego do pomocy?
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Wiesz, to wymaga czasu. Mamy teraz wa¿niejsze sprawy na g³owie. Jednak porozmawiam o tym z mistrzem Kalomem.
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Tak czy inaczej, dobrze siê spisa³eœ. Oto twoja nagroda. 
	
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
	
    B_LogEntry               (CH3_SellElixer,"Powiedzia³em o wszystkim Shanowi. Caina chyba jednak nie spotka tak bolesna kara, jak s¹dzi³em. Niemniej jednak zachowa³em siê uczciwie, za co Shan mnie wynagrodzi³.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_SUCCESS);
    MIS_SellElixer = LOG_SUCCESS;

    B_GiveXP (XP_SellElixer);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LieAboutCaine
//========================================

INSTANCE DIA_Shan_LieAboutCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_LieAboutCaine_Condition;
   information  = DIA_Shan_LieAboutCaine_Info;
   permanent	= FALSE;
   description	= "Nie uda³o mi siê znaleŸæ sprzedawcy eliksiru.";
};

FUNC INT DIA_Shan_LieAboutCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_LieAboutCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_01"); //Nie uda³o mi siê znaleŸæ sprzedawcy eliksiru.
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_02"); //Sprawdzi³em wszystkie poszlaki, jednak trop siê urwa³.
    AI_Output (self, other ,"DIA_Shan_LieAboutCaine_03_03"); //Nie cieszy mnie ta wiadomoœæ. Oznacza to, ¿e zdrajca jest wci¹¿ na wolnoœci. 
	AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_04"); //Có¿, bêdê musia³ poleciæ pozosta³ym Œwi¹tynnym by mieli tê sprawê na uwadze. 
    
    B_LogEntry               (CH3_SellElixer,"Powiedzia³em Shanowi, ¿e trop w sprawie siê urwa³. Wprawdzie zawali³em zadanie, jednak sporo zarobi³em.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_FAILED);
    MIS_SellElixer = LOG_FAILED;
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Questdadasd
//========================================

INSTANCE DIA_Shan_Questdadasd (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_Questdadasd_Condition;
   information  = DIA_Shan_Questdadasd_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakieœ zadanie?";
};

FUNC INT DIA_Shan_Questdadasd_Condition()
{
    if (Kapitel == 10)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_Questdadasd_Info()
{
    AI_Output (other, self ,"DIA_Shan_Questdadasd_15_01"); //Masz dla mnie jakieœ zadanie?
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_02"); //Akurat mia³em ciê prosiæ o pomoc.
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_03"); //Podobno zawali³a siê Stara Kopalnia. 
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_04"); //Wiesz co siê sta³o z naszymi braæmi z tego miejsca?
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_05"); //Polowali na pe³zacze i nie wiem czy zdo³ali uciec.
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_06"); //Spróbuj ich odszukaæ.
    MIS_HelpBrothersBra = LOG_RUNNING;
	B_ExchangeRoutine			(BAN_1603_Martin, "patrol");
    Log_CreateTopic            (CH1_HelpBrothersBra, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_RUNNING);
    B_LogEntry                     (CH1_HelpBrothersBra,"Shan kaza³ mi sprawdziæ co sta³o siê z naszymi braæmi ze Starej Kopalni.");
};

//========================================
//-----------------> Uwolnieni
//========================================

INSTANCE DIA_Shan_Uwolnieni (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_Uwolnieni_Condition;
   information  = DIA_Shan_Uwolnieni_Info;
   permanent	= FALSE;
   description	= "Uwolni³em braci!";
};

FUNC INT DIA_Shan_Uwolnieni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaKosh_Ocaleni))
    && (MIS_HelpBrothersBra == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_Uwolnieni_Info()
{
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_01"); //Uwolni³em braci!
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_02"); //Zostali uwiêzieni za wielk¹ krat¹ s³u¿¹c¹ jako brama do Starej Kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_03"); //Dobra robota, Stra¿niku.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_04"); //Masz ze sob¹ jakieœ wieœci z tamtej czêœci Kolonii?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_05"); //Sytuacja nie wygl¹da najlepiej.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_06"); //Artegor siê zbuntowa³ i utworzy³ w³asny obóz przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_07"); //Obóz ten nie podlega³ Gomezowi.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_08"); //Jednak, gdy Magnat dowiedzia³ siê o buncie, wys³a³ olbrzymi oddzia³ swoich ludzi w kierunku kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_09"); //Co siê sta³o potem?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_10"); //Wszyscy zginêli! Pozosta³ tylko Artegor, który pozwoli³ mi uwolniæ Gor Na Kosha i innych.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_11"); //Wykaza³eœ siê nie lada odwag¹.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_12"); //Jestem pe³en podziwu.
    B_LogEntry                     (CH1_HelpBrothersBra,"Przekaza³em Shanowi informacje o wydarzeniach z Kolonii. Przy okazji zosta³em wynagrodzony za uwolnienie braci z kopalni.");
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_SUCCESS);
    MIS_HelpBrothersBra = LOG_SUCCESS;

    B_GiveXP (550);
    //CreateInvItems (self, ItMiNugget, 200);
    //B_GiveInvItems (self, other, ItMiNugget, 200);
    CreateInvItems (self, ItMw_2H_Sword_Heavy_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Sword_Heavy_01, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BAN_THREAD
//========================================

INSTANCE DIA_Shan_BAN_THREAD (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_BAN_THREAD_Condition;
   information  = DIA_Shan_BAN_THREAD_Info;
   permanent	= FALSE;
   description	= "Co siê sta³o?";
};

FUNC INT DIA_Shan_BAN_THREAD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ezehiel_VERY_IMPORTANT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_BAN_THREAD_Info()
{
    AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_01"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_02"); //Dosz³y do nas wieœci o tym, co wyprawia Gomez.
    if FMTaken
    {
        AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_03"); //Tak, te¿ o tym s³ysza³em. Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê. Gomez oszala³.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_04"); //Dobrze, ¿e jesteœ poinformowany.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_05"); //S³ysza³em te¿ o planach Bandytów. Chcê, abyœ siê tym zaj¹³ i zda³ mi raport. 
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_06"); //Pogadaj z cz³owiekiem imieniem Drax. Ponoæ planuje on jak¹œ rewolucjê.
        if (Npc_KnowsInfo (hero, DIA_Drax_Ded)) && (MIS_HuntersSupport == LOG_SUCCESS)
        {
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_07"); //Ju¿ rozmawia³em z Draxem. Bandyci chc¹ pozbyæ siê patrolów Stra¿ników w okolicach Obozu.
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_08"); //Pomog³em im zdobyæ wsparcie ³owców orków. Mam nadziejê, ¿e jakoœ sobie poradz¹.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_09"); //To wszystko?
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_10"); //Tak. Nic wiêcej siê nie wydarzy³o.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_11"); //Có¿... Pozosta³o czekaæ nam na rozwój wydarzeñ.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_12"); //Proponujê ci, abyœ uda³ siê w okolice Nowego Obozu. Grupa Najemników prowadzi tam walki ze Stra¿nikami.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_13"); //Powinieneœ im pomóc.
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_14"); //Dlaczego?
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_15"); //Stra¿nicy staj¹ siê coraz wiêkszym zagro¿eniem równie¿ dla naszego Obozu. 
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_16"); //Dlatego musisz wesprzeæ naszych braci z Nowego Obozu.
			second_d_Shan = false;
			go_help_torlof = true;
			B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Od Shana nie dowiedzia³em siê nic nowego. Sytuacja w Kolonii jest kiepska. Moim zadaniem by³o wsparcie Bandytów w ich dzia³aniach. Uprzedzi³em polecenie Shana i ju¿ to zrobi³em. Teraz muszê iœæ do Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami.");
        }
        else
        {
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_17"); //No dobrze. Pójdê z nim pogadaæ.
			second_d_Shan = true;
			B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Shan martwi siê sytuacj¹ w Kolonii. Muszê pogadaæ z Bandyt¹ Draxem, który ponoæ planuje jakiœ atak na patrole Gomeza.");
   go_help_torlof = false;
        };
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_18"); //Dosta³em siê tutaj najszybciej jak siê da. Mo¿esz mi krótko streœciæ co siê dzieje?
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_19"); //Otó¿ Stara Kopalnia uleg³a zalaniu przez podziemn¹ rzekê. Gomez oszala³ i kaza³ swoim Stra¿nikom atakowaæ kogo popadnie.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_20"); //Ponoæ Bandyci planuj¹ to ukróciæ. Musisz porozmawiaæ z niejakim Draxem. Goœæ ponoæ zajmuje siê t¹ wypraw¹.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_21"); //Gdy to zrobisz, wróæ zdaæ mi raport.
		B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Shan martwi siê sytuacj¹ w Kolonii. Muszê pogadaæ z Bandyt¹ Draxem, który ponoæ planuje jakiœ atak na patrole Gomeza.");
   second_d_Shan = true;
   go_help_torlof = false;
    };
};	
	//========================================
//-----------------> DRAX_IMPORTANT
//========================================

INSTANCE DIA_Shan_DRAX_IMPORTANT (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_DRAX_IMPORTANT_Condition;
   information  = DIA_Shan_DRAX_IMPORTANT_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Draxem.";
};

FUNC INT DIA_Shan_DRAX_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded))
    && (MIS_HuntersSupport == LOG_SUCCESS)
    && (second_d_Shan == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_DRAX_IMPORTANT_Info()
{
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_01"); //Rozmawia³em z Draxem.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_03"); //Pomog³em Bandytom zorganizowaæ atak na patrole Gomeza. Œci¹gn¹³em im do pomocy ³owców orków.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_04"); //Mam nadziejê, ¿e sobie poradz¹.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_05"); //No dobrze. Proponujê ci, abyœ uda³ siê w okolice Nowego Obozu. Grupa Najemników prowadzi tam walki ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_06"); //Powinieneœ im pomóc.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_08"); //Stra¿nicy staj¹ siê coraz wiêkszym zagro¿eniem równie¿ dla naszego Obozu. 
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_09"); //Dlatego musisz wesprzeæ naszych braci z Nowego Obozu.
    B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Muszê udaæ siê w kierunku Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami. ");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELP_TORLOF
//========================================

INSTANCE DIA_Shan_HELP_TORLOF (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_HELP_TORLOF_Condition;
   information  = DIA_Shan_HELP_TORLOF_Info;
   permanent	= FALSE;
   description	= "Pomog³em Torlofowi. ";
};

FUNC INT DIA_Shan_HELP_TORLOF_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_SUCCESS)
    && (go_help_torlof == true) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_HELP_TORLOF_Info()
{
    AI_Output (other, self ,"DIA_Shan_HELP_TORLOF_15_01"); //Pomog³em Torlofowi. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_02"); //Œwietnie. Mo¿e to da Gomezowi do myœlenia. Ostatnio Stra¿nicy zabili Nowicjusza zbieraj¹cego zio³a. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_03"); //Nie podoba mi siê to. Je¿eli takie zdarzenia bêd¹ siê powtarzaæ, bêdziemy musieli przy³¹czyæ siê do tej wojny. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_04"); //Na razie mo¿esz ju¿ iœæ.
    Log_SetTopicStatus       (CH4_BanditNeedPsionicHelp, LOG_SUCCESS);
    MIS_BanditNeedPsionicHelp = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
};

