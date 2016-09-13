//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Shawn_EXIT(C_INFO)
{
	npc             = TPL_5004_Shawn;
	nr              = 999;
	condition	= DIA_Shawn_EXIT_Condition;
	information	= DIA_Shawn_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Shawn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Shawn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Shawn_WORK (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_WORK_Condition;
   information  = DIA_Shawn_WORK_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Shawn_WORK_Condition()
{
	if (kapitel < 3) {
    return TRUE; };
};

FUNC VOID DIA_Shawn_WORK_Info()
{
    AI_Output (other, self ,"DIA_Shawn_WORK_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Shawn_WORK_03_02"); //S³u¿ê Y'Berionowi rad¹, opiekujê siê œwi¹tyni¹, dbam o drobne sprawy.
    AI_Output (other, self ,"DIA_Shawn_WORK_15_03"); //Pewnie du¿o z tym zamieszania.
    AI_Output (self, other ,"DIA_Shawn_WORK_03_04"); //Nie jest tak Ÿle. Palê ziele, aby uspokoiæ mojego ducha.
};


//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Shawn_HELLO (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_HELLO_Condition;
   information  = DIA_Shawn_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shawn_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Shawn_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Shawn_HELLO_03_01"); //Witaj, przybyszu! Nazywam siê Shawn, pokorny s³uga Œni¹cego.
    AI_Output (self, other ,"DIA_Shawn_HELLO_03_02"); //Jestem pomocnikiem Y'Beriona. Wydajê tak¿e polecenia.
    AI_Output (self, other ,"DIA_Shawn_HELLO_03_03"); //Je¿eli szukasz pracy, zg³oœ siê do mnie.
};

///////////////////////////
// GURU 
//////////////////////////

//========================================
//-----------------> SZEF
//========================================

INSTANCE DIA_Shawn_SZEF (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_SZEF_Condition;
   information  = DIA_Shawn_SZEF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shawn_SZEF_Condition()
{
	if ((Npc_GetTrueGuild (hero) == GIL_GUR)) {
    return TRUE; };
};

FUNC VOID DIA_Shawn_SZEF_Info()
{
    AI_Output (self, other ,"DIA_Shawn_SZEF_03_01"); //Mistrzu, mamy kilka spraw, którymi natychmiast musisz siê zaj¹æ.
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Shawn_QUEST1 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 2;
   condition    = DIA_Shawn_QUEST1_Condition;
   information  = DIA_Shawn_QUEST1_Info;
   permanent	= FALSE;
   description	= "Od czego zaczynamy?";
};

FUNC INT DIA_Shawn_QUEST1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Shawn_SZEF))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Shawn_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QUEST1_15_01"); //Od czego zaczynamy?
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_02"); //Podczas rytua³u przywo³ania Œni¹cego na palcu jak i w œwi¹tyni by³o niema³e zamieszanie.
	AI_Output (other, self ,"DIA_Shawn_QUEST1_15_03"); //Co w zwi¹zku z tym?
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_04"); //Wszed³ tu jeden z Nowicjuszy i zabra³ Kostur Œwiat³a nale¿¹cy do Y'Beriona. 
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_05"); //To bardzo wa¿ne, aby go odzyskaæ. Jest nam potrzebny do ceremonii pogrzebu Mistrza.
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_06"); //Kostur musi siê znaleŸæ w jego grobie. 
    AI_Output (other, self ,"DIA_Shawn_QUEST1_15_07"); //Gdzie mam zacz¹æ poszukiwania?
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_08"); //Popytaj ludzi bêd¹cych na placu. Mówi siê, ¿e z³odziej bardzo szybko wybieg³ i wpad³ po drodze na naszych braci.
    AI_Output (self, other ,"DIA_Shawn_QUEST1_03_09"); //Mo¿e ktoœ coœ wie...
    MIS_UciekinierPC = LOG_RUNNING;

    Log_CreateTopic          (CH1_UciekinierPC, LOG_MISSION);
    Log_SetTopicStatus       (CH1_UciekinierPC, LOG_RUNNING);
    B_LogEntry               (CH1_UciekinierPC,"Shawn kaza³ mi znaleŸæ z³odzieja, który w³ama³ siê do œwi¹tyni podczas rytua³u przywo³ania i ukrad³ kostur Y'Beriona. Rabuœ wypad³ ze œwi¹tyni jak oszala³y. Z pewnoœci¹ potr¹ci³ kogoœ na placu. Tam powinienem szukaæ wskazówek.");
};
//========================================
//-----------------> QUEST1_WIN
//========================================

INSTANCE DIA_QUEST1_QUEST1_WIN (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 3;
   condition    = DIA_QUEST1_QUEST1_WIN_Condition;
   information  = DIA_QUEST1_QUEST1_WIN_Info;
   permanent	= FALSE;
   description	= "Odzyska³em skradziony kostur.";
};

FUNC INT DIA_QUEST1_QUEST1_WIN_Condition()
{
    if (Npc_HasItems (other, Stab_des_Lichts) >=1) && (MIS_UciekinierPC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_QUEST1_QUEST1_WIN_Info()
{
    AI_Output (other, self ,"DIA_QUEST1_QUEST1_WIN_15_01"); //Odzyska³em skradziony kostur.
    AI_Output (self, other ,"DIA_QUEST1_QUEST1_WIN_03_02"); //Proszê, daj mi go. Zajmê siê jego przechowaniem.
    B_LogEntry           (CH1_UciekinierPC,"Odda³em skradziony kostur Shawnowi. On dopilnuje, by broñ zosta³a zabezpieczona razem z cia³em Y'Beriona.");
    Log_SetTopicStatus   (CH1_UciekinierPC, LOG_SUCCESS);
    MIS_UciekinierPC = LOG_SUCCESS;
	
    B_GiveInvItems (other, self, Stab_des_Lichts, 1);

    B_GiveXP (150);
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_Shawn_QUEST2 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 4;
   condition    = DIA_Shawn_QUEST2_Condition;
   information  = DIA_Shawn_QUEST2_Info;
   permanent	= FALSE;
   description	= "Co jeszcze jest do zrobienia?";
};

FUNC INT DIA_Shawn_QUEST2_Condition()
{
    if (MIS_UciekinierPC == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QUEST2_15_01"); //Co jeszcze jest do zrobienia?
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_02"); //Ca³kiem sporo...
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_03"); //Dowiedzia³em siê, ¿e w Obozie odbywa siê utajniony obrót amuletami i talizmanami. Ktoœ sprzedaje takie artefakty po zawy¿onej cenie.
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_04"); //Nie podoba mi siê to. Tylko Guru maj¹ wy³¹cznoœæ na sprzeda¿ magicznych przedmiotów. Powinieneœ siê tym jak najszybciej zaj¹æ.
    AI_Output (other, self ,"DIA_Shawn_QUEST2_15_05"); //Dlaczego to takie wa¿ne?
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_06"); //Sk¹d to pytanie? Magiczne artefakty maj¹ potê¿na moc. W niepowo³anych rêkach mog¹ wyrz¹dziæ wiele szkód. 
	AI_Output (self, other ,"DIA_Shawn_QUEST2_03_07"); //Tylko Guru maj¹ wystarczaj¹co du¿o doœwiadczenia, by móc oceniæ, czy Nowicjusz ma czyste intencje. 
	AI_Output (self, other ,"DIA_Shawn_QUEST2_03_08"); //Miej te¿ na uwadze, ¿e od kiedy dowiedzieliœmy siê, ¿e Œni¹cy jest demonem, ludzie w Obozie zaczynaj¹ wariowaæ. 
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_09"); //Po prostu znajdŸ tego cz³owieka i naka¿ mu oddaæ wszystkie b³yskotki Baal Cadarowi.
    AI_Output (other, self ,"DIA_Shawn_QUEST2_15_10"); //Mo¿esz mnie jakoœ naprowadziæ?
    AI_Output (self, other ,"DIA_Shawn_QUEST2_03_11"); //Twoim punktem zaczepienia powinna byæ rozmowa z Talasem. To on poinformowa³ mnie o tym procederze.
    MIS_HandlarzSteh = LOG_RUNNING;

    Log_CreateTopic          (CH1_HandlarzSteh, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HandlarzSteh, LOG_RUNNING);
    B_LogEntry               (CH1_HandlarzSteh,"Shawn kaza³ mi odkryæ kto w Obozie prowadzi badania nad bagnem. Wskazówk¹ jest to, ¿e osoba handluje poszukiwanymi przez Y'Beriona przedmiotami.");
};

//========================================
//-----------------> QUEST2_WIN
//========================================

INSTANCE DIA_Shawn_QUEST2_WIN (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 5;
   condition    = DIA_Shawn_QUEST2_WIN_Condition;
   information  = DIA_Shawn_QUEST2_WIN_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em tego handlarza.";
};

FUNC INT DIA_Shawn_QUEST2_WIN_Condition()
{
    if (MIS_HandlarzSteh == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Steh_QUEST2_YOU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QUEST2_WIN_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QUEST2_WIN_15_01"); //Odnalaz³em tego handlarza. Nie bêdzie ju¿ sprzedawa³ artefaktów.
	AI_Output (other, self ,"DIA_Shawn_QUEST2_WIN_15_02"); //Zgodzi³ siê nawet oddaæ je do œwi¹tyni. Nazywa siê Steh.
    AI_Output (self, other ,"DIA_Shawn_QUEST2_WIN_03_03"); //Doskonale. Teraz amulety i pierœcienie nie wpadn¹ w niepowo³ane rêce. 
	AI_Output (self, other ,"DIA_Shawn_QUEST2_WIN_03_04"); //Mimo to odczuliœmy ju¿ skutki niepos³uszeñstwa Steha.
	AI_Output (other, self ,"DIA_Shawn_QUEST2_WIN_15_05"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Shawn_QUEST2_WIN_03_06"); //Porozmawiamy o tym za chwilê. Mistrzu, weŸ tê rudê ze skrzyni Y'Beriona.
    B_LogEntry               (CH1_HandlarzSteh,"Powiedzia³em Shawnowi o mojej rozmowie ze Stehem. By³ zadowolony, ale jednoczeœnie zaniepokojony. Widocznie sta³o siê coœ z³ego.");
    Log_SetTopicStatus       (CH1_HandlarzSteh, LOG_SUCCESS);
    MIS_HandlarzSteh = LOG_SUCCESS;

    B_GiveXP (120);
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> QUEST3
//========================================

INSTANCE DIA_Shawn_QUEST3 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 6;
   condition    = DIA_Shawn_QUEST3_Condition;
   information  = DIA_Shawn_QUEST3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shawn_QUEST3_Condition()
{
    if (MIS_HandlarzSteh == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QUEST3_Info()
{
    AI_Output (self, other ,"DIA_Shawn_QUEST3_03_01"); //Wróæmy do tego o czym wspomina³em...
    AI_Output (self, other ,"DIA_Shawn_QUEST3_03_02"); //Podczas twojej pracy na rzecz Bractwa sta³o siê coœ okropnego.
	AI_Output (self, other ,"DIA_Shawn_QUEST3_03_03"); //W Obozie dokonano trzech zabójstw. Jedno po drugim. Ka¿de kilka godzin po poprzednim.
    AI_Output (other, self ,"DIA_Shawn_QUEST3_15_04"); //Masz jakichœ podejrzanych?
    AI_Output (self, other ,"DIA_Shawn_QUEST3_03_05"); //Nie. Musisz popytaæ wœród ludzi, którzy krêcili siê ko³o miejsc zbrodni. Obejrzyj te¿ trupy.
    AI_Output (self, other ,"DIA_Shawn_QUEST3_03_06"); //Jeden le¿y za wielkim drzewem, na którym stoi chata Kaloma.
    AI_Output (self, other ,"DIA_Shawn_QUEST3_15_07"); //Drugi przy palisadzie - niedaleko Steha.
    AI_Output (self, other ,"DIA_Shawn_QUEST3_03_08"); //A trzeci na bagnie w pobli¿u chaty drwala.
    AI_Output (other, self ,"DIA_Shawn_QUEST3_15_09"); //W porz¹dku. Biorê siê do roboty.
    MIS_SeryjneZabojstwa = LOG_RUNNING;
	
	Wld_InsertNpc				(NOV_5011_Martwy_Nowicjusz,"PSI_START");
	B_KillNPC	(NOV_5011_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5010_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5010_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5009_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5009_Martwy_nowicjusz);
    Log_CreateTopic            (CH1_SeryjneZabojstwa, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SeryjneZabojstwa, LOG_RUNNING);
	
    B_LogEntry                     (CH1_SeryjneZabojstwa,"Ktoœ zabi³ trzech Nowicjuszy z Obozu Bractwa. Mam ustaliæ kim jest zabójca. Cia³a le¿¹ na miejscach zbrodni: za drzewem na którym stoi laboratorium, przy palisadzie (okolice Steha) i na bagnach w pobli¿u chaty drwala.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KILLTOOL
//========================================

INSTANCE DIA_Shawn_KILLTOOL (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 6;
   condition    = DIA_Shawn_KILLTOOL_Condition;
   information  = DIA_Shawn_KILLTOOL_Info;
   permanent	= FALSE;
   description	= "Znalaz³em narzêdzia zbrodni.";
};

FUNC INT DIA_Shawn_KILLTOOL_Condition()
{
    if (MIS_HandlarzSteh == LOG_SUCCESS) && (Npc_HasItems (other, ItMw_SiekieraCSI) >=1) && (Npc_HasItems (other, ItMi_OstrzeCSI) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_KILLTOOL_Info()
{
	AI_Output (other, self ,"DIA_Shawn_KILLTOOL_15_01"); //Znalaz³em narzêdzia zbrodni.
    AI_Output (self, other ,"DIA_Shawn_KILLTOOL_03_02"); //Poka¿ mi je.
	AI_Output (other, self ,"DIA_Shawn_KILLTOOL_15_03"); //To jakieœ ostrza i siekiery.
    AI_Output (self, other ,"DIA_Shawn_KILLTOOL_03_04"); //Siekiery nosi wielu Nowicjuszy. Wykorzystywali je do budowy chat.
	AI_Output (self, other ,"DIA_Shawn_KILLTOOL_03_05"); //Ale te ostrza s¹ jakieœ dziwne. Wygl¹daj¹ jak z tartaku. Rozmawia³eœ z Hansonem? Mo¿e to on jest zabójc¹?
    B_LogEntry                     (CH1_SeryjneZabojstwa,"Pokaza³em narzêdzia zbrodni Shawnowi. Powiedzia³ mi, ¿ebym sprawdzi³ Hansona, poniewa¿ tylko on pracuje w tartaku.");
};


//========================================
//-----------------> QUEST3_OK
//========================================

INSTANCE DIA_Shawn_QUEST3_OK (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 7;
   condition    = DIA_Shawn_QUEST3_OK_Condition;
   information  = DIA_Shawn_QUEST3_OK_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z zabójc¹.";
};

FUNC INT DIA_Shawn_QUEST3_OK_Condition()
{
    if (MIS_SeryjneZabojstwa == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Hanson_QUEST2_D))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QUEST3_OK_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QUEST3_OK_15_01"); //Rozmawia³em z zabójc¹.
    AI_Output (self, other ,"DIA_Shawn_QUEST3_OK_03_02"); //Czy stanowi on jeszcze zagro¿enie?
	AI_Output (other, self ,"DIA_Shawn_QUEST3_OK_15_03"); //Nie, ju¿ nie.
    AI_Output (self, other ,"DIA_Shawn_QUEST3_OK_03_04"); //Kim on jest?
    AI_Output (other, self ,"DIA_Shawn_QUEST3_OK_15_05"); //To Hanson - miejscowy drwal. Powodem morderstw by³a zemsta za d³ugi.
	AI_Output (self, other ,"DIA_Shawn_QUEST3_OK_03_06"); //Ju¿ siê ba³em, ¿e to przez wp³yw Œni¹cego ludzie zaczynaj¹ zachowywaæ siê dziwnie.
    AI_Output (other, self ,"DIA_Shawn_QUEST3_OK_15_07"); //Bo faktycznie zaczynaj¹. Trac¹ wiarê i to sk³ania ich do ³amania zasad. Steh, Hanson... Ta lista wkrótce mo¿e siê wyd³u¿yæ.
	AI_Output (other, self ,"DIA_Shawn_QUEST3_OK_15_08"); //Bractwo zaczyna siê rozpadaæ.
	AI_Output (self, other ,"DIA_Shawn_QUEST3_OK_03_09"); //Spróbujê za³agodziæ sytuacjê. Porozmawiam z pozosta³ymi Guru. Powiem im, ¿eby dostosowali S³owo do nowych warunków.
	AI_Output (self, other ,"DIA_Shawn_QUEST3_OK_03_10"); //Mistrzu, twoja praca na razie jest zakoñczona. Muszê siê teraz zaj¹æ t¹ spraw¹. 
    B_LogEntry               (CH1_SeryjneZabojstwa,"Opowiedzia³em Shawnowi o Hansonie. Okazuje siê, ¿e sytuacja w Obozie robi siê coraz mniej ciekawa. Aby zapobiec kolejnym incydentom Shawn porozmawia z pozosta³ymi Guru.");
    Log_SetTopicStatus       (CH1_SeryjneZabojstwa, LOG_SUCCESS);
    MIS_SeryjneZabojstwa = LOG_SUCCESS;

    B_GiveXP (300);
};

////////////////////////////////////////////
// Czarny Mag - w¹tek nieaktywny
////////////////////////////////////////////

//========================================
//-----------------> POSZUKIWACZE
//========================================

INSTANCE DIA_Shawn_POSZUKIWACZE (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 8;
   condition    = DIA_Shawn_POSZUKIWACZE_Condition;
   information  = DIA_Shawn_POSZUKIWACZE_Info;
   permanent	= FALSE;
   description	= "Co z Hansonem?";
};

FUNC INT DIA_Shawn_POSZUKIWACZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_QUEST3_OK)) && (Npc_KnowsInfo (hero, DIA_Hanson_QUEST2_E)) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_POSZUKIWACZE_Info()
{
    AI_Output (other, self ,"DIA_Shawn_POSZUKIWACZE_15_01"); //Co z Hansonem?
    AI_Output (self, other ,"DIA_Shawn_POSZUKIWACZE_03_02"); //Musimy go przes³uchaæ. 
    AI_Output (self, other ,"DIA_Shawn_POSZUKIWACZE_03_03"); //Nurtuje mnie sk¹d wzi¹³ siê g³os, który kaza³ mu zabiæ Nowicjuszy. 
    AI_Output (other, self ,"DIA_Shawn_POSZUKIWACZE_15_04"); //Mo¿e Hanson próbuje udawaæ psychopatê, aby nie zostaæ ukaranym?
    AI_Output (self, other ,"DIA_Shawn_POSZUKIWACZE_03_05"); //To równie¿ ma sens... Ale co je¿eli mówi prawdê? Ktoœ wp³ywowy i niebezpieczny krêci siê w Kolonii.
    AI_Output (self, other ,"DIA_Shawn_POSZUKIWACZE_03_06"); //Muszê napisaæ list do Cronosa w tej sprawie. 
	MIS_MroczneBractwo = LOG_RUNNING;

    Log_CreateTopic            (CH1_MroczneBractwo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MroczneBractwo, LOG_RUNNING);
    B_LogEntry                     (CH1_MroczneBractwo,"Shawn obawia siê tego, który rzekomo zleci³ Hansonowi zabójstwo. To coœ mo¿e byæ dla nas zagro¿eniem.");

   // B_GiveXP (150);

};

//========================================
//-----------------> QUEST4
//========================================

INSTANCE DIA_Shawn_QUEST4 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 9;
   condition    = DIA_Shawn_QUEST4_Condition;
   information  = DIA_Shawn_QUEST4_Info;
   permanent	= FALSE;
   description	= "Móg³bym zanieœæ twój list.";
};

FUNC INT DIA_Shawn_QUEST4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_POSZUKIWACZE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QUEST4_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QUEST4_15_01"); //Móg³bym zanieœæ twój list. W koñcu nie takie rzeczy siê robi³o.
    AI_Output (self, other ,"DIA_Shawn_QUEST4_03_02"); //Bardzo ci dziêkujê. Œwietny pomys³. Zaczekaj zaraz ci go dam.
    B_UseFakeScroll ();
    CreateInvItems (self, ItMi_ListdoCronosa, 1);
    B_GiveInvItems (self, other, ItMi_ListdoCronosa, 1);
    MIS_ListDoCronosa = LOG_RUNNING;

    Log_CreateTopic            (CH1_ListDoCronosa, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ListDoCronosa, LOG_RUNNING);
    B_LogEntry                     (CH1_ListDoCronosa,"Shawn da³ mi list, który muszê wrêczyæ Cronosowi w Nowym Obozie.");
};
//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Shawn_HELLO2 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 2;
   condition    = DIA_Shawn_HELLO2_Condition;
   information  = DIA_Shawn_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czyta³em notatki alchemika.";
};

FUNC INT DIA_Shawn_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_QuestsBractwo2))
    && (czytane_NotatkiAlchemika == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Shawn_HELLO2_15_01"); //Czyta³em notatki alchemika.
    AI_Output (other, self ,"DIA_Shawn_HELLO2_15_02"); //Uda³ siê w kierunku Cmentarzyska Orków. 
    AI_Output (self, other ,"DIA_Shawn_HELLO2_03_03"); //Nawet nie myœl o tym, ¿eby tam pójœæ.
    AI_Output (self, other ,"DIA_Shawn_HELLO2_03_04"); //To zbyt niebezpieczne.
    AI_Output (self, other ,"DIA_Shawn_HELLO2_03_05"); //Nasz badacz w koñcu wróci.
    AI_Output (self, other ,"DIA_Shawn_HELLO2_03_06"); //Masz przy sobie jego notatki?
    if (Npc_HasItems (other, NotatkiAlchemika) >=1)
    {
        AI_Output (other, self ,"DIA_Shawn_HELLO2_15_07"); //Tak. WeŸ je.
        AI_Output (self, other ,"DIA_Shawn_HELLO2_03_08"); //Dziêkujê.
        CreateInvItems (self, ItMiNugget, 50);
        B_GiveInvItems (self, other, ItMiNugget, 50);
        B_GiveInvItems (other, self, NotatkiAlchemika, 1);
        B_LogEntry                     (CH1_PoszukiwanaAlchemika,"Odda³em Shawnowi notatki, które znalaz³em na bagnie. Najpewniej nale¿a³y do alchemika.");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shawn_HELLO2_15_09"); //Nie.
        AI_Output (self, other ,"DIA_Shawn_HELLO2_03_10"); //Mo¿esz ju¿ iœæ.
    };
    B_LogEntry                     (CH1_PoszukiwanaAlchemika,"Rzomawia³em z Shawnem o moim znalezisku z bagna. Notaki alchemika wykaza³y, ¿e uda³ siê on na Cmentarzysko Orków. Nie mam zamiaru tam iœæ w najbli¿yszm czasie.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> QuestsBractwo2
//========================================

INSTANCE DIA_Shawn_QuestsBractwo2 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_QuestsBractwo2_Condition;
   information  = DIA_Shawn_QuestsBractwo2_Info;
   permanent	= FALSE;
   description	= "Czy Bractwo ma dla mnie jakieœ zlecenia?";
};

FUNC INT DIA_Shawn_QuestsBractwo2_Condition()
{
    if (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QuestsBractwo2_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QuestsBractwo2_15_01"); //Czy Bractwo ma dla mnie jakieœ zlecenia?
    AI_Output (self, other ,"DIA_Shawn_QuestsBractwo2_03_02"); //Oczywiœcie, ¿e tak!
    AI_Output (self, other ,"DIA_Shawn_QuestsBractwo2_03_03"); //Zgin¹³ nasz badacz. Dosyæ stary, brodaty mê¿czyzna.
    AI_Output (self, other ,"DIA_Shawn_QuestsBractwo2_03_04"); //By³ alchemikiem. Kilka dni temu Y'Berion zleci³ mu zbadanie dziwnych miejsc na bagnie.
    AI_Output (self, other ,"DIA_Shawn_QuestsBractwo2_03_05"); //Jednak do tej pory nie wróci³.
    AI_Output (self, other ,"DIA_Shawn_QuestsBractwo2_03_06"); //Spróbuj go odnaleŸæ.
    MIS_PoszukiwanaAlchemika = LOG_RUNNING;
	
    Log_CreateTopic            (CH1_PoszukiwanaAlchemika, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PoszukiwanaAlchemika, LOG_RUNNING);
    B_LogEntry                     (CH1_PoszukiwanaAlchemika,"Shawn kaza³ mi odnaleŸæ starego alchemika, który przeprowadza³ dla Bractwa badania nad bagnem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TalkAboutStones
//========================================

INSTANCE DIA_Shawn_TalkAboutStones (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_TalkAboutStones_Condition;
   information  = DIA_Shawn_TalkAboutStones_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z alchemikiem.";
};

FUNC INT DIA_Shawn_TalkAboutStones_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_TalkAboutStones_Info()
{
    AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_01"); //Rozmawia³em z alchemikiem.
    AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_02"); //I co? Gdzie on jest?
    AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_03"); //Nie ¿yje. Znalaz³em go umieraj¹cego na Cmentarzysku Orków.
    AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_04"); //Wielka to bêdzie strata. Uda³o ci siê poznaæ wyniki jego badañ?
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO4))
    {
        AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_05"); //Tak. Cmentarzysko Orków nie ma nic wspólnego z obiektami na bagnie. 
        AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_06"); //Te swoiste kaplice to czary ¿ycia i energii.
        AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_07"); //Przebywaj¹c wokó³ nich mo¿na zregenerowaæ swoj¹ energiê i nie tylko.
        AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_08"); //Gdybyœmy mogli panowaæ nad ich moc¹, moglibyœmy zrobiæ wiele dobrego.
        AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_09"); //Dziêkujê ci za tw¹ odwagê i poœwiêcenie.
        AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_10"); //WeŸ to jako zap³atê.
        B_LogEntry                     (CH1_PoszukiwanaAlchemika,"Shawn by³ zadowolony, gdy pozna³ wyniki badañ alchemika. Szkoda, ¿e on sam nie móg³ o nich opowiedzieæ.");
        Log_SetTopicStatus       (CH1_PoszukiwanaAlchemika, LOG_SUCCESS);
        MIS_PoszukiwanaAlchemika = LOG_SUCCESS;

        B_GiveXP (450);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_11"); //Niestety nie.
        AI_Output (other, self ,"DIA_Shawn_TalkAboutStones_15_12"); //Zmar³ przed wczeœnie.
        AI_Output (self, other ,"DIA_Shawn_TalkAboutStones_03_13"); //Trudno.
        B_LogEntry                     (CH1_PoszukiwanaAlchemika,"Niestety nie uzyska³em kluczowych informacji od alchemika.");
        Log_SetTopicStatus       (CH1_PoszukiwanaAlchemika, LOG_FAILED);
        MIS_PoszukiwanaAlchemika = LOG_FAILED;
		PrintScreen	("Anulowano zadanie: Poszukiwania alchemika! ", 1,-1,"font_new_10_red.tga",2);	

        B_GiveXP (200);
    };
    CreateInvItems (self, ItMiNugget, 260);
    B_GiveInvItems (self, other, ItMiNugget, 260);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> QuestCH3
//========================================

INSTANCE DIA_Shawn_QuestCH3 (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_QuestCH3_Condition;
   information  = DIA_Shawn_QuestCH3_Info;
   permanent	= FALSE;
   description	= "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_Shawn_QuestCH3_Condition()
{
    if (Kapitel >= 3)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_QuestCH3_Info()
{
    AI_Output (other, self ,"DIA_Shawn_QuestCH3_15_01"); //Mogê coœ dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Shawn_QuestCH3_03_02"); //Jest pewna sprawa, któr¹ móg³byœ siê zaj¹æ.
    AI_Output (other, self ,"DIA_Shawn_QuestCH3_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Shawn_QuestCH3_03_04"); //Ktoœ z naszych sprzedaje eliksir z wnêtrznoœci pe³zaczy do Nowego Obozu.
    AI_Output (self, other ,"DIA_Shawn_QuestCH3_03_05"); //Dowiedz siê kto to jest i natychmiast mi o tym powiedz.
    MIS_SellElixer = LOG_RUNNING;

    Log_CreateTopic            (CH1_SellElixer, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SellElixer, LOG_RUNNING);
    B_LogEntry                     (CH1_SellElixer,"Shawn kaza³ mi odkryæ kto nielegalnie sprzedaje eliksir z wnêtrznoœci pe³zaczy. Prawdopodobnie towar w ca³oœci idzie do Nowego Obozu.");
    AI_StopProcessInfos	(self);
	
	var c_npc dexter;
	dexter = Hlp_GetNpc(STT_329_Dexter);
	CreateInvItems (dexter, ItFo_Potion_Elixier_Egg, 3);
};

//========================================
//-----------------> SellElixirCaine
//========================================

INSTANCE DIA_Shawn_SellElixirCaine (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_SellElixirCaine_Condition;
   information  = DIA_Shawn_SellElixirCaine_Info;
   permanent	= FALSE;
   description	= "Wiem, kto sprzedaje eliksir!";
};

FUNC INT DIA_Shawn_SellElixirCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Machujki))
    && (CaineFriend == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_SellElixirCaine_Info()
{
    AI_Output (other, self ,"DIA_Shawn_SellElixirCaine_15_01"); //Wiem, kto sprzedaje eliksir! To Caine!
    AI_Output (other, self ,"DIA_Shawn_SellElixirCaine_15_02"); //Ponadto oferowa³ mi bym przysta³ do niego i pomaga³ mu w rozprowadzaniu tego specyfiku.
    AI_Output (self, other ,"DIA_Shawn_SellElixirCaine_03_03"); //Nie spodziewa³em siê tego po nim.
    AI_Output (self, other ,"DIA_Shawn_SellElixirCaine_03_04"); //Spotka go kara, a ciebie nagroda.
    CreateInvItems (self, ItMiNugget, 400);
    B_GiveInvItems (self, other, ItMiNugget, 400);
    B_LogEntry                     (CH1_SellElixer,"Wyda³em Caine'a Shawnowi. Nie ma litoœci dla takiego postêpowania!");
    Log_SetTopicStatus       (CH1_SellElixer, LOG_SUCCESS);
    MIS_SellElixer = LOG_SUCCESS;

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Questdadasd
//========================================

INSTANCE DIA_Shawn_Questdadasd (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_Questdadasd_Condition;
   information  = DIA_Shawn_Questdadasd_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakieœ zadanie?";
};

FUNC INT DIA_Shawn_Questdadasd_Condition()
{
    if (Kapitel == 10)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_Questdadasd_Info()
{
    AI_Output (other, self ,"DIA_Shawn_Questdadasd_15_01"); //Masz dla mnie jakieœ zadanie?
    AI_Output (self, other ,"DIA_Shawn_Questdadasd_03_02"); //Akurat mia³em ciê prosiæ o pomoc.
    AI_Output (self, other ,"DIA_Shawn_Questdadasd_03_03"); //Podobno zawali³a siê Stara Kopalnia. 
    AI_Output (self, other ,"DIA_Shawn_Questdadasd_03_04"); //Wiesz co siê sta³o z naszymi braæmi z tego miejsca?
    AI_Output (self, other ,"DIA_Shawn_Questdadasd_03_05"); //Polowali na pe³zacze i nie wiem czy zdo³ali uciec.
    AI_Output (self, other ,"DIA_Shawn_Questdadasd_03_06"); //Spróbuj ich odszukaæ.
    MIS_HelpBrothersBra = LOG_RUNNING;
	B_ExchangeRoutine			(BAU_2009_Martin, "patrol");
    Log_CreateTopic            (CH1_HelpBrothersBra, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_RUNNING);
    B_LogEntry                     (CH1_HelpBrothersBra,"Shawn kaza³ mi sprawdziæ co sta³o siê z naszymi braæmi ze Starej Kopalni.");
};

//========================================
//-----------------> Uwolnieni
//========================================

INSTANCE DIA_Shawn_Uwolnieni (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_Uwolnieni_Condition;
   information  = DIA_Shawn_Uwolnieni_Info;
   permanent	= FALSE;
   description	= "Uwolni³em braci!";
};

FUNC INT DIA_Shawn_Uwolnieni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaKosh_Ocaleni))
    && (MIS_HelpBrothersBra == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_Uwolnieni_Info()
{
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_01"); //Uwolni³em braci!
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_02"); //Zostali uwiêzieni za wielk¹ krat¹ s³u¿¹c¹ jako brama do Starej Kopalni.
    AI_Output (self, other ,"DIA_Shawn_Uwolnieni_03_03"); //Dobra robota, Stra¿niku.
    AI_Output (self, other ,"DIA_Shawn_Uwolnieni_03_04"); //Masz ze sob¹ jakieœ wieœci z tamtej czêœci Kolonii?
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_05"); //Sytuacja nie wygl¹da najlepiej.
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_06"); //Artegor siê zbuntowa³ i utworzy³ w³asny obóz przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_07"); //Obóz ten nie podlega³ Gomezowi.
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_08"); //Jednak, gdy Magnat dowiedzia³ siê o buncie, wys³a³ olbrzymi oddzia³ swoich ludzi w kierunku kopalni.
    AI_Output (self, other ,"DIA_Shawn_Uwolnieni_03_09"); //Co siê sta³o potem?
    AI_Output (other, self ,"DIA_Shawn_Uwolnieni_15_10"); //Wszyscy zginêli! Pozosta³ tylko Artegor, który pozwoli³ mi uwolniæ Gor Na Kosha i innych.
    AI_Output (self, other ,"DIA_Shawn_Uwolnieni_03_11"); //Wykaza³eœ siê nie lada odwag¹.
    AI_Output (self, other ,"DIA_Shawn_Uwolnieni_03_12"); //Jestem pe³en podziwu.
    B_LogEntry                     (CH1_HelpBrothersBra,"Przekaza³em Shawnowi informacje o wydarzeniach z Kolonii. Przy okazji zosta³em wynagrodzony za uwolnienie braci z kopalni.");
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_SUCCESS);
    MIS_HelpBrothersBra = LOG_SUCCESS;

    B_GiveXP (550);
    CreateInvItems (self, ItMiNugget, 380);
    B_GiveInvItems (self, other, ItMiNugget, 380);
    CreateInvItems (self, ItMw_2H_Sword_Heavy_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Sword_Heavy_01, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BAN_THREAD
//========================================

INSTANCE DIA_Shawn_BAN_THREAD (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_BAN_THREAD_Condition;
   information  = DIA_Shawn_BAN_THREAD_Info;
   permanent	= FALSE;
   description	= "Co siê sta³o?";
};

FUNC INT DIA_Shawn_BAN_THREAD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ezehiel_VERY_IMPORTANT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_BAN_THREAD_Info()
{
    AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_01"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_02"); //Dosz³y do nas wieœci o tym, co wyprawia Gomez.
    if FMTaken
    {
        AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_03"); //Tak, te¿ o tym s³ysza³em. Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê. Gomez oszala³.
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_04"); //Dobrze, ¿e jesteœ poinformowany.
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_05"); //S³ysza³em te¿ o planach Bandytów. Chcê, abyœ siê tym zaj¹³ i zda³ mi raport. 
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_06"); //Pogadaj z cz³owiekiem imieniem Drax. Ponoæ planuje on jak¹œ rewolucjê.
        if (Npc_KnowsInfo (hero, DIA_Drax_Ded)) && (MIS_Do_lowcow == LOG_SUCCESS)
        {
            AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_07"); //Ju¿ rozmawia³em z Draxem. Bandyci chc¹ pozbyæ siê patrolów Stra¿ników w okolicach Obozu.
            AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_08"); //Pomog³em im zdobyæ wsparcie ³owców orków. Mam nadziejê, ¿e jakoœ sobie poradz¹.
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_09"); //To wszystko?
            AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_10"); //Tak. Nic wiêcej siê nie wydarzy³o.
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_11"); //Có¿... Pozosta³o czekaæ nam na rozwój wydarzeñ.
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_12"); //Proponujê ci, abyœ uda³ siê w okolice Nowego Obozu. Grupa Najemników prowadzi tam walki ze Stra¿nikami.
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_13"); //Powinieneœ im pomóc.
            AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_14"); //Dlaczego?
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_15"); //Stra¿nicy staj¹ siê coraz wiêkszym zagro¿eniem równie¿ dla naszego Obozu. 
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_16"); //Dlatego musisz wesprzeæ naszych braci z Nowego Obozu.
			second_d_shawn = false;
			go_help_torlof = true;
			B_LogEntry                     (CH1_Watek_Bandytow_BRACTWO,"Od Shawna nie dowiedzia³em siê nic nowego. Sytuacja w Kolonii jest kiepska. Moim zadaniem by³o wsparcie Bandytów w ich dzia³aniach. Uprzedzi³em polecenie Shawna i ju¿ to zrobi³em. Teraz muszê iœæ do Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami.");
        }
        else
        {
            AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_17"); //No dobrze. Pójdê z nim pogadaæ.
			second_d_shawn = true;
			B_LogEntry                     (CH1_Watek_Bandytow_BRACTWO,"Shawn martwi siê sytuacj¹ w Kolonii. Muszê pogadaæ z Bandyt¹ Draxem, który ponoæ planuje jakiœ atak na patrole Gomeza.");
   go_help_torlof = false;
        };
    }
    else
    {
        AI_Output (other, self ,"DIA_Shawn_BAN_THREAD_15_18"); //Przeteleportowa³em siê tutaj najszybciej jak siê da. Mo¿esz mi krótko streœciæ co siê dzieje?
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_19"); //Otó¿ Stara Kopalnia uleg³a zalaniu przez podziemn¹ rzekê. Gomez oszala³ i kaza³ swoim Stra¿nikom atakowaæ kogo popadnie.
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_20"); //Ponoæ Bandyci planuj¹ to ukróciæ. Musisz porozmawiaæ z niejakim Draxem. Goœæ ponoæ zajmuje siê t¹ wypraw¹.
        AI_Output (self, other ,"DIA_Shawn_BAN_THREAD_03_21"); //Gdy to zrobisz, wróæ zdaæ mi raport.
		B_LogEntry                     (CH1_Watek_Bandytow_BRACTWO,"Shawn martwi siê sytuacj¹ w Kolonii. Muszê pogadaæ z Bandyt¹ Draxem, który ponoæ planuje jakiœ atak na patrole Gomeza.");
   second_d_shawn = true;
   go_help_torlof = false;
    };
};	
	//========================================
//-----------------> DRAX_IMPORTANT
//========================================

INSTANCE DIA_Shawn_DRAX_IMPORTANT (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 1;
   condition    = DIA_Shawn_DRAX_IMPORTANT_Condition;
   information  = DIA_Shawn_DRAX_IMPORTANT_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Draxem.";
};

FUNC INT DIA_Shawn_DRAX_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded))
    && (MIS_Do_lowcow == LOG_SUCCESS)
    && (second_d_shawn == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_DRAX_IMPORTANT_Info()
{
    AI_Output (other, self ,"DIA_Shawn_DRAX_IMPORTANT_15_01"); //Rozmawia³em z Draxem.
    AI_Output (self, other ,"DIA_Shawn_DRAX_IMPORTANT_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Shawn_DRAX_IMPORTANT_15_03"); //Pomog³em Bandytom zorganizowaæ atak na patrole Gomeza. Œci¹gn¹³em im do pomocy ³owców orków.
    AI_Output (other, self ,"DIA_Shawn_DRAX_IMPORTANT_15_04"); //Mam nadziejê, ¿e sobie poradz¹.
    AI_Output (self, other ,"DIA_Shawn_DRAX_IMPORTANT_03_05"); //No dobrze. Proponujê ci, abyœ uda³ siê w okolice Nowego Obozu. Grupa Najemników prowadzi tam walki ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Shawn_DRAX_IMPORTANT_03_06"); //Powinieneœ im pomóc.
    AI_Output (other, self ,"DIA_Shawn_DRAX_IMPORTANT_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Shawn_DRAX_IMPORTANT_03_08"); //Stra¿nicy staj¹ siê coraz wiêkszym zagro¿eniem równie¿ dla naszego Obozu. 
    AI_Output (self, other ,"DIA_Shawn_DRAX_IMPORTANT_03_09"); //Dlatego musisz wesprzeæ naszych braci z Nowego Obozu.
    B_LogEntry                     (CH1_Watek_Bandytow_BRACTWO,"Muszê udaæ siê w kierunku Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami. ");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELP_TORLOF
//========================================

INSTANCE DIA_Shawn_HELP_TORLOF (C_INFO)
{
   npc          = TPL_5004_Shawn;
   nr           = 2;
   condition    = DIA_Shawn_HELP_TORLOF_Condition;
   information  = DIA_Shawn_HELP_TORLOF_Info;
   permanent	= FALSE;
   description	= "Pomog³em Torlofowi. ";
};

FUNC INT DIA_Shawn_HELP_TORLOF_Condition()
{
    if (MIS_PomocTorlofowi == LOG_SUCCESS)
    && (go_help_torlof == true) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shawn_HELP_TORLOF_Info()
{
    AI_Output (other, self ,"DIA_Shawn_HELP_TORLOF_15_01"); //Pomog³em Torlofowi. 
    AI_Output (self, other ,"DIA_Shawn_HELP_TORLOF_03_02"); //Œwietnie. Mo¿e to da Gomezowi do myœlenia. Ostatnio Stra¿nicy zabili Nowicjusza zbieraj¹cego zio³a. 
    AI_Output (self, other ,"DIA_Shawn_HELP_TORLOF_03_03"); //Nie podoba mi siê to. Je¿eli takie zdarzenia bêd¹ siê powtarzaæ, bêdziemy musieli przy³¹czyæ siê do tej wojny. 
    AI_Output (self, other ,"DIA_Shawn_HELP_TORLOF_03_04"); //Na razie mo¿esz ju¿ iœæ.
    Log_SetTopicStatus       (CH1_Watek_Bandytow_BRACTWO, LOG_SUCCESS);
    MIS_Watek_Bandytow_BRACTWO = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
};

