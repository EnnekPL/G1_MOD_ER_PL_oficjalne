//========================================
//-----------------> SkupZiela
//========================================

INSTANCE DIA_BaalKagan_SkupZiela (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 1;
   condition    = DIA_BaalKagan_SkupZiela_Condition;
   information  = DIA_BaalKagan_SkupZiela_Info;
   permanent	= FALSE;
   description	= "Podobno skupujesz ziele od Nowicjuszy.";
};

FUNC INT DIA_BaalKagan_SkupZiela_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_NewWeedRun)) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_SkupZiela_Info()
{
    AI_Output (other, self ,"DIA_BaalKagan_SkupZiela_15_01"); //Podobno skupujesz ziele od Nowicjuszy.
    AI_Output (self, other ,"DIA_BaalKagan_SkupZiela_03_02"); //Tak. A co ci do tego?
    AI_Output (other, self ,"DIA_BaalKagan_SkupZiela_15_03"); //Móg³bym siê dowiedzieæ od których Nowicjuszy?
    AI_Output (self, other ,"DIA_BaalKagan_SkupZiela_03_04"); //Co? Nie.
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH2_KalomsNewWeed,"Baal Kagan nie chcia³ mi wyjawiæ jak nazywaj¹ siê Nowicjusze posiadaj¹cy przepis na ziele.");

    B_GiveXP (59);
};

//========================================
//-----------------> NamesNovize
//========================================

INSTANCE DIA_BaalKagan_NamesNovize (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 2;
   condition    = DIA_BaalKagan_NamesNovize_Condition;
   information  = DIA_BaalKagan_NamesNovize_Info;
   permanent	= FALSE;
   description	= "Czy teraz wyjawisz mi jak nazywaj¹ siê ci Nowicjusze?";
};

FUNC INT DIA_BaalKagan_NamesNovize_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_SkupZiela))
    && (Npc_KnowsInfo (hero, DIA_BaalKagan_KeyGive))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_NamesNovize_Info()
{
    AI_Output (other, self ,"DIA_BaalKagan_NamesNovize_15_01"); //Czy teraz wyjawisz mi jak nazywaj¹ siê ci Nowicjusze?
    AI_Output (self, other ,"DIA_BaalKagan_NamesNovize_03_02"); //No dobrze.
    AI_Output (self, other ,"DIA_BaalKagan_NamesNovize_03_03"); //Jeden z nich nazywa³ siê Davson. Wiem tylko tyle.
    B_LogEntry                     (CH2_KalomsNewWeed,"Nowicjusz posiadaj¹cy przepis to Davson. Muszê go poszukaæ w Bractwie.");

    B_GiveXP (70);
    AI_StopProcessInfos	(self);
};

///////////////////////////
// DAVSON
///////////////////////////
//========================================
//-----------------> DawacPrzepis
//========================================

INSTANCE DIA_Novize_DawacPrzepis (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_DawacPrzepis_Condition;
   information  = DIA_Novize_DawacPrzepis_Info;
   permanent	= FALSE;
   description	= "Podobno macie jakiœ przepis...";
};

FUNC INT DIA_Novize_DawacPrzepis_Condition()
{
    if (MIS_KalomsNewWeed == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_BaalKagan_NamesNovize))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_DawacPrzepis_Info()
{
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_01"); //Podobno macie jakiœ przepis...
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_02"); //Nastêpny dureñ, który myœli, ¿e dostanie coœ za darmo.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_03"); //He he he. Przepis mogê ci daæ za 3000 bry³ek rudy.
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_05"); //Zaraz nie bêdzie ci tak do œmiechu.
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_06"); //Sam sobie wezmê ten przepis.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_07"); //Nie, nie. Bicie mnie nic ci nie da.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_08"); //Nie mam go przy sobie.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_09"); //Jest dobrze ukryty. He he.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_10"); //Niech ci nawet nie przejdzie przez myœl myszkowaæ w naszej chacie.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_11"); //G³upcy.
    B_LogEntry                     (CH2_KalomsNewWeed,"Nie uda³o mi siê uzyskaæ przepisu od Davsona. Przypuszczam, ¿e jest w jego chacie. Je¿eli wejdê tam od razu, zostanê zaatakowany przez Stra¿ników Œwi¹tynnych. Muszê jakoœ pozbyæ siê Nowicjuszy.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//do usuniêcia
//========================================
//-----------------> KupiszKurwo
//========================================

INSTANCE DIA_BaalKagan_KupiszKurwo (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 1;
   condition    = DIA_BaalKagan_KupiszKurwo_Condition;
   information  = DIA_BaalKagan_KupiszKurwo_Info;
   permanent	= FALSE;
   description	= "Kupisz od nas ziele?";
};

FUNC INT DIA_BaalKagan_KupiszKurwo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Pensja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_KupiszKurwo_Info()
{
    AI_Output (other, self ,"DIA_BaalKagan_KupiszKurwo_15_01"); //Kupisz od nas ziele?
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_02"); //Jednak wykrad³eœ recepturê Nowicjuszom.
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_03"); //Wiedzia³em, ¿e tak bêdzie.
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_04"); //Nie chcê mieæ z tob¹ nic wspólnego.
    B_LogEntry                     (CH1_NewWeed3BAU,"Baal Kagan jest wœciek³y za to co zrobi³em. No có¿. Znajdê innego kupca.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Pensja
//========================================

INSTANCE DIA_Bandyta_Pensja (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 2;
   condition    = DIA_Bandyta_Pensja_Condition;
   information  = DIA_Bandyta_Pensja_Info;
   permanent	= FALSE;
   description	= "Kiedy mam siê zg³aszaæ po swoj¹ dzia³kê?";
};

FUNC INT DIA_Bandyta_Pensja_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Przepisek))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Pensja_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Pensja_15_01"); //Kiedy mam siê zg³aszaæ po swoj¹ dzia³kê?
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_02"); //Chwila, chwila. Najpierw musisz znaleŸæ kupca na ziele. Dopiero wtedy bêdziemy mogli myœleæ o zyskach.
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_03"); //To musi byæ ktoœ, kto ma du¿y utarg. Popytaj handlarzy, a mo¿e ktoœ ci wpadnie w rêce. 
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_04"); //Daruj sobie wycieczkê do Sekty. To z góry skazane na pora¿kê.
    MIS_NewWeed3BAU = LOG_RUNNING;

    Log_CreateTopic          (CH1_NewWeed3BAU, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NewWeed3BAU, LOG_RUNNING);
    B_LogEntry               (CH1_NewWeed3BAU,"Okazuje siê, ¿e receptura, któr¹ przynios³em nie wystarczy do osi¹gniêcia zysków. Aby zarabiaæ na zielu, musimy mieæ je komu sprzedaæ. Mam znaleŸæ jakiegoœ kupca na nasz towar. Briam od razu odradzi³ mi udanie siê do obozu Bractwa Œni¹cego. Powinienem zapytaæ w Nowym lub Starym Obozie. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KupiecSS
//========================================

INSTANCE DIA_Bandyta_KupiecSS (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Bandyta_KupiecSS_Condition;
   information  = DIA_Bandyta_KupiecSS_Info;
   permanent	= FALSE;
   description	= "Za³atwi³em kupca.";
};

FUNC INT DIA_Bandyta_KupiecSS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_MocneZiele2))
    && (MIS_NewWeed3BAU == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KupiecSS_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_01"); //Za³atwi³em kupca. To handlarz Dexter ze Starego Obozu.
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_02"); //Du¿o handluje z Nowicjuszami. Zna siê na zielu.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_03"); //Dobra robota. Zabieram siê za produkcjê.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_04"); //Kwestie wyp³aty reguluj z Jensem. To nie moja sprawa.
    B_LogEntry                     (CH1_NewWeed3BAU,"Zg³osi³em Braimowi, ¿e bêdziemy teraz wspó³pracowaæ z Dexterem. Po wyp³atê mogê zg³aszaæ siê do Jensa.");
    Log_SetTopicStatus       (CH1_NewWeed3BAU, LOG_SUCCESS);
    MIS_NewWeed3BAU = LOG_SUCCESS;
	//experience
    B_GiveXP (200);
};

//========================================
//-----------------> MocneZiele2
//========================================

INSTANCE DIA_Dexter_MocneZiele2 (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_MocneZiele2_Condition;
   information  = DIA_Dexter_MocneZiele2_Info;
   permanent	= FALSE;
   description	= "Bandyci maj¹ na sprzeda¿ zupe³nie nowy rodzaj ziela.";
};

FUNC INT DIA_Dexter_MocneZiele2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Pensja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_MocneZiele2_Info()
{
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_01"); //Bandyci maj¹ na sprzeda¿ zupe³nie nowy rodzaj ziela.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_02"); //Hmm? Mam sta³ych dostawców w Bractwie. Skupujê wszystko od Nowicjuszy.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_03"); //Ci Nowicjusze chyba nie s¹ zbyt uczciwi w stosunku do ciebie.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_04"); //Opracowali przepis na œwietnego skrêta, jednak wszystko sprzedaj¹ do Nowego Obozu za twoimi plecami.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_05"); //Nic o tym nie s³ysza³em.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_06"); //Wykrad³em przepis i przekaza³em go naszemu alchemikowi. Teraz zostali z niczym.
    //AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_07"); //Sprzedamy ci ziele o 5 bry³ek taniej ni¿ Nowicjusze.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_08"); //Mo¿emy wejœæ w uk³ad. Dostaniesz monopol na handlem nowym rodzajem jointów. Co ty na to?
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_09"); //Wchodzê w to! Tylko ile dok³adnie mam p³aciæ?
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_10"); //30 bry³ek rudy za sztukê.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_11"); //Czego wy tam do cholery napchaliœcie? Z³ota?!
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_12"); //Jesteœ pewien, ¿e mi siê zwróci?
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_13"); //Oczywiœcie. Zawsze mo¿esz podnieœæ cenê. 
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_14"); //W takim razie czekam na dostawy, ale jeœli coœ krêcisz, to ciê za³atwiê!
    B_LogEntry                     (CH1_NewWeed3BAU,"Negocjacje z Dexterem to czysta przyjemnoœæ. Od razu przysta³ na moj¹ propozycjê.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};