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
    AI_Output (other, self ,"DIA_BaalKagan_SkupZiela_15_03"); //M�g�bym si� dowiedzie� od kt�rych Nowicjuszy?
    AI_Output (self, other ,"DIA_BaalKagan_SkupZiela_03_04"); //Co? Nie.
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH2_KalomsNewWeed,"Baal Kagan nie chcia� mi wyjawi� jak nazywaj� si� Nowicjusze posiadaj�cy przepis na ziele.");

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
   description	= "Czy teraz wyjawisz mi jak nazywaj� si� ci Nowicjusze?";
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
    AI_Output (other, self ,"DIA_BaalKagan_NamesNovize_15_01"); //Czy teraz wyjawisz mi jak nazywaj� si� ci Nowicjusze?
    AI_Output (self, other ,"DIA_BaalKagan_NamesNovize_03_02"); //No dobrze.
    AI_Output (self, other ,"DIA_BaalKagan_NamesNovize_03_03"); //Jeden z nich nazywa� si� Davson. Wiem tylko tyle.
    B_LogEntry                     (CH2_KalomsNewWeed,"Nowicjusz posiadaj�cy przepis to Davson. Musz� go poszuka� w Bractwie.");

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
   description	= "Podobno macie jaki� przepis...";
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
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_01"); //Podobno macie jaki� przepis...
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_02"); //Nast�pny dure�, kt�ry my�li, �e dostanie co� za darmo.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_03"); //He he he. Przepis mog� ci da� za 3000 bry�ek rudy.
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_05"); //Zaraz nie b�dzie ci tak do �miechu.
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_06"); //Sam sobie wezm� ten przepis.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_07"); //Nie, nie. Bicie mnie nic ci nie da.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_08"); //Nie mam go przy sobie.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_09"); //Jest dobrze ukryty. He he.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_10"); //Niech ci nawet nie przejdzie przez my�l myszkowa� w naszej chacie.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_11"); //G�upcy.
    B_LogEntry                     (CH2_KalomsNewWeed,"Nie uda�o mi si� uzyska� przepisu od Davsona. Przypuszczam, �e jest w jego chacie. Je�eli wejd� tam od razu, zostan� zaatakowany przez Stra�nik�w �wi�tynnych. Musz� jako� pozby� si� Nowicjuszy.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//do usuni�cia
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
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_02"); //Jednak wykrad�e� receptur� Nowicjuszom.
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_03"); //Wiedzia�em, �e tak b�dzie.
    AI_Output (self, other ,"DIA_BaalKagan_KupiszKurwo_03_04"); //Nie chc� mie� z tob� nic wsp�lnego.
    B_LogEntry                     (CH1_NewWeed3BAU,"Baal Kagan jest w�ciek�y za to co zrobi�em. No c�. Znajd� innego kupca.");
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
   description	= "Kiedy mam si� zg�asza� po swoj� dzia�k�?";
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
    AI_Output (other, self ,"DIA_Bandyta_Pensja_15_01"); //Kiedy mam si� zg�asza� po swoj� dzia�k�?
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_02"); //Chwila, chwila. Najpierw musisz znale�� kupca na ziele. Dopiero wtedy b�dziemy mogli my�le� o zyskach.
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_03"); //To musi by� kto�, kto ma du�y utarg. Popytaj handlarzy, a mo�e kto� ci wpadnie w r�ce. 
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_04"); //Daruj sobie wycieczk� do Sekty. To z g�ry skazane na pora�k�.
    MIS_NewWeed3BAU = LOG_RUNNING;

    Log_CreateTopic          (CH1_NewWeed3BAU, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NewWeed3BAU, LOG_RUNNING);
    B_LogEntry               (CH1_NewWeed3BAU,"Okazuje si�, �e receptura, kt�r� przynios�em nie wystarczy do osi�gni�cia zysk�w. Aby zarabia� na zielu, musimy mie� je komu sprzeda�. Mam znale�� jakiego� kupca na nasz towar. Briam od razu odradzi� mi udanie si� do obozu Bractwa �ni�cego. Powinienem zapyta� w Nowym lub Starym Obozie. ");
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
   description	= "Za�atwi�em kupca.";
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
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_01"); //Za�atwi�em kupca. To handlarz Dexter ze Starego Obozu.
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_02"); //Du�o handluje z Nowicjuszami. Zna si� na zielu.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_03"); //Dobra robota. Zabieram si� za produkcj�.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_04"); //Kwestie wyp�aty reguluj z Jensem. To nie moja sprawa.
    B_LogEntry                     (CH1_NewWeed3BAU,"Zg�osi�em Braimowi, �e b�dziemy teraz wsp�pracowa� z Dexterem. Po wyp�at� mog� zg�asza� si� do Jensa.");
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
   description	= "Bandyci maj� na sprzeda� zupe�nie nowy rodzaj ziela.";
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
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_01"); //Bandyci maj� na sprzeda� zupe�nie nowy rodzaj ziela.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_02"); //Hmm? Mam sta�ych dostawc�w w Bractwie. Skupuj� wszystko od Nowicjuszy.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_03"); //Ci Nowicjusze chyba nie s� zbyt uczciwi w stosunku do ciebie.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_04"); //Opracowali przepis na �wietnego skr�ta, jednak wszystko sprzedaj� do Nowego Obozu za twoimi plecami.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_05"); //Nic o tym nie s�ysza�em.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_06"); //Wykrad�em przepis i przekaza�em go naszemu alchemikowi. Teraz zostali z niczym.
    //AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_07"); //Sprzedamy ci ziele o 5 bry�ek taniej ni� Nowicjusze.
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_08"); //Mo�emy wej�� w uk�ad. Dostaniesz monopol na handlem nowym rodzajem joint�w. Co ty na to?
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_09"); //Wchodz� w to! Tylko ile dok�adnie mam p�aci�?
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_10"); //30 bry�ek rudy za sztuk�.
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_11"); //Czego wy tam do cholery napchali�cie? Z�ota?!
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_12"); //Jeste� pewien, �e mi si� zwr�ci?
    AI_Output (other, self ,"DIA_Dexter_MocneZiele2_15_13"); //Oczywi�cie. Zawsze mo�esz podnie�� cen�. 
    AI_Output (self, other ,"DIA_Dexter_MocneZiele2_03_14"); //W takim razie czekam na dostawy, ale je�li co� kr�cisz, to ci� za�atwi�!
    B_LogEntry                     (CH1_NewWeed3BAU,"Negocjacje z Dexterem to czysta przyjemno��. Od razu przysta� na moj� propozycj�.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};