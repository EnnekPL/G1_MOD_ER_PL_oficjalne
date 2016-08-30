//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Robotnik_EXIT(C_INFO)
{
	npc             = VLK_2004_Robotnik;
	nr              = 999;
	condition	= DIA_Robotnik_EXIT_Condition;
	information	= DIA_Robotnik_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Robotnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Robotnik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> JAKPRACA
//========================================

INSTANCE DIA_Robotnik_JAKPRACA (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 1;
   condition    = DIA_Robotnik_JAKPRACA_Condition;
   information  = DIA_Robotnik_JAKPRACA_Info;
   permanent	= FALSE;
   description	= "Jak praca?";
};

FUNC INT DIA_Robotnik_JAKPRACA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Robotnik_JAKPRACA_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_JAKPRACA_15_01"); //Jak praca?
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_02"); //Nie�le. Lubi�, gdy Stra�nicy ka�� mi naprawia� bram�.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_03"); //A wiesz dlaczego?
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_04"); //Bo wtedy nie musz� ich ogl�da�! Sukinsyny...
    AI_Output (other, self ,"DIA_Robotnik_JAKPRACA_15_05"); //Co ci zrobili?
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_06"); //Wida�, �e jeste� nowy. 
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_07"); //Stra� Gomeza mo�e robi� z nami wszystko! 
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_08"); //Pomiataj� nami, okradaj� nas, ka�� niewolniczo pracowa�.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_09"); //Ostatnio dosta�em troch� jedzenia, a te gnidy wszystko mi zabra�y.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_10"); //Nie chcia�em wiele. Nie jad�em od trzech dni!
};

//========================================
//-----------------> DealWithWorker
//========================================

INSTANCE DIA_Robotnik_DealWithWorker (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 1;
   condition    = DIA_Robotnik_DealWithWorker_Condition;
   information  = DIA_Robotnik_DealWithWorker_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Robotnik_DealWithWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Orry_TripNotes))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_DealWithWorker_Info()
{
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_01"); //Hej, ty!
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_03"); //Us�ysza�em twoj� rozmow� z Orry'm. Podobno szukasz notatek opisuj�cych dzia�ania Bandyt�w.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_04"); //Mog� ci pom�c.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_05"); //Jak?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_06"); //Wiem gdzie znajduj� si� notatki.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_07"); //S� ukryte w skrzyni na placu wymian.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_08"); //B�dziesz jednak potrzebowa� klucza.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_09"); //Sk�d go wezm�?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_10"); //Tak si� sk�ada, �e uda�o mi si� zdoby� ten klucz.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_11"); //Dostaniesz go za 100 bry�ek rudy.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_12"); //Czemu a� tyle?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_13"); //Ruda si� przyda. Mo�e uda mi si� st�d uciec? 
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_14"); //Kilka bry�ek rudy, troch� pomy�lunku i mo�na szybko zosta� Szkodnikiem.
    B_LogEntry                     (CH1_DraxTest,"Robotnik naprawiaj�cy bram� na placu wymian zaoferowa� mi klucz do skrzyni z notatkami Tripa za 100 bry�ek rudy. ");
};

//========================================
//-----------------> Give100OreNugget
//========================================

INSTANCE DIA_Robotnik_Give100OreNugget (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 2;
   condition    = DIA_Robotnik_Give100OreNugget_Condition;
   information  = DIA_Robotnik_Give100OreNugget_Info;
   permanent	= FALSE;
   description	= "Mam sto bry�ek rudy.";
};

FUNC INT DIA_Robotnik_Give100OreNugget_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robotnik_DealWithWorker))
    && (MIS_DraxTest == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_Give100OreNugget_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_Give100OreNugget_15_01"); //Mam sto bry�ek rudy.
    AI_Output (self, other ,"DIA_Robotnik_Give100OreNugget_03_02"); //�wietnie. Oto klucz. 
    CreateInvItems (self, ItMis_KeyOrryChest, 1);
    B_GiveInvItems (self, other, ItMis_KeyOrryChest, 1);
    B_GiveInvItems (other, self, ItMiNugget, 100);
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> JEDZENIE
//========================================

INSTANCE DIA_Robotnik_JEDZENIE (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 2;
   condition    = DIA_Robotnik_JEDZENIE_Condition;
   information  = DIA_Robotnik_JEDZENIE_Info;
   permanent	= FALSE;
   description	= "Gdzie jest teraz to jedzenie?";
};

FUNC INT DIA_Robotnik_JEDZENIE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robotnik_JAKPRACA)) && (Kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_JEDZENIE_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_JEDZENIE_15_01"); //Gdzie jest teraz to jedzenie?
    AI_Output (self, other ,"DIA_Robotnik_JEDZENIE_03_02"); //Schowali je do skrzyni. Kawa�ek szynki, 3 sztuki mi�sa i 2 bochenki chleba.
    AI_Output (other, self ,"DIA_Robotnik_JEDZENIE_15_03"); //Wiesz gdzie mo�e by� klucz?
    AI_Output (self, other ,"DIA_Robotnik_JEDZENIE_03_04"); //Ma go ten Stra�nik przy palisadzie. 
    AI_Output (other, self ,"DIA_Robotnik_JEDZENIE_15_05"); //Mo�e uda mi si� co� z tym zrobi�.
	
    Jedzenie_zplacu= LOG_RUNNING;

    Log_CreateTopic            (CH1_Jedzenie_zplacu, LOG_MISSION);
    Log_SetTopicStatus         (CH1_Jedzenie_zplacu, LOG_RUNNING);
    B_LogEntry                 (CH1_Jedzenie_zplacu,"Dwaj Stra�nicy z placu wymian ukradli robotnikowi jedzenie. Ukryli je w skrzyni na placu wymian. Klucz ma jeden ze Stra�nik�w. Musz� go zdoby� i odda� jedzenie robotnikowi.");
};

//========================================
//-----------------> QUESTOK
//========================================

INSTANCE DIA_Robotnik_QUESTOK (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 3;
   condition    = DIA_Robotnik_QUESTOK_Condition;
   information  = DIA_Robotnik_QUESTOK_Info;
   permanent	= FALSE;
   description	= "Mam jedzenie!";
};

FUNC INT DIA_Robotnik_QUESTOK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robotnik_JEDZENIE))
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=3)
    && (Npc_HasItems (other, ItFoLoaf) >=2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_QUESTOK_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_QUESTOK_15_01"); //Mam jedzenie!
    AI_Output (self, other ,"DIA_Robotnik_QUESTOK_03_02"); //Naprawd� ci si� uda�o?
    AI_Output (self, other ,"DIA_Robotnik_QUESTOK_03_03"); //Nie chc� wszystkiego. Wezm� tylko mi�so i bochenek chleba.
    B_GiveInvItems (other, self, ItFoLoaf, 1);
    B_GiveInvItems (other, self, ItFoMuttonRaw, 3);
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Uda�o mi si� zdoby� jedzenie.");
    Log_SetTopicStatus       (CH1_Jedzenie_zplacu, LOG_SUCCESS);
    Jedzenie_zplacu = LOG_SUCCESS;

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CIOTA
//========================================

INSTANCE DIA_Robotnik_CIOTA (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 4;
   condition    = DIA_Robotnik_CIOTA_Condition;
   information  = DIA_Robotnik_CIOTA_Info;
   permanent	= FALSE;
   description	= "Nie dam rady tego zrobi�.";
};

FUNC INT DIA_Robotnik_CIOTA_Condition()
{
    if (Jedzenie_zplacu == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_CIOTA_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_CIOTA_15_01"); //Nie dam rady tego zrobi�.
    AI_Output (self, other ,"DIA_Robotnik_CIOTA_03_02"); //Jeste� nowy. Rozumiem.
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Nie potrafi� zabra� jedzenia ze skrzyni. No c�...");
    Log_SetTopicStatus       (CH1_Jedzenie_zplacu, LOG_FAILED);
    Jedzenie_zplacu = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Ukradzione jedzenie! ", 1,-1,"font_new_10_red.tga",2);	
};

//========================================
//-----------------> INFOOKOPALNI
//========================================

INSTANCE DIA_Robotnik_INFOOKOPALNI (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 5;
   condition    = DIA_Robotnik_INFOOKOPALNI_Condition;
   information  = DIA_Robotnik_INFOOKOPALNI_Info;
   permanent	= FALSE;
   description	= "Powiesz mi teraz co� ciekawego?";
};

FUNC INT DIA_Robotnik_INFOOKOPALNI_Condition()
{
    if (Jedzenie_zplacu == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_INFOOKOPALNI_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_INFOOKOPALNI_15_01"); //Powiesz mi teraz co� ciekawego?
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_02"); //Hmm... Jeste� godny mojego zaufania.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_03"); //Dam ci rad�. Nie wspinaj si� na p�askowy�! Kopalnia jest przekl�ta.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_04"); //My�lisz, �e, dlaczego Stra�nicy tam stoj�? Gomez nic nie chce powiedzie�.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_05"); //W nocy wydobywaj� si� stamt�d straszne d�wi�ki, a na niebie wida� �uny �wiat�a.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_06"); //Poza tym kr�ci si� tam wiele gro�nych zwierz�t. M�j przyjaciel tam zgin��.
    AI_Output (other, self ,"DIA_Robotnik_INFOOKOPALNI_15_07"); //Dzi�kuj� za informacj�.
    B_GiveXP (50);
};

//========================================
//-----------------> ZDOBYC_KLUCZ
//========================================

INSTANCE DIA_Robotnik_ZDOBYC_KLUCZ (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 6;
   condition    = DIA_Robotnik_ZDOBYC_KLUCZ_Condition;
   information  = DIA_Robotnik_ZDOBYC_KLUCZ_Info;
   permanent	= FALSE;
   description	= "Nie wiem, jak zabra� klucz Stra�nikowi.";
};

FUNC INT DIA_Robotnik_ZDOBYC_KLUCZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_KLUCZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_ZDOBYC_KLUCZ_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_ZDOBYC_KLUCZ_15_01"); //Nie wiem, jak zabra� klucz Stra�nikowi.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_02"); //Musimy opracowa� jaki� podst�p.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_03"); //Wiesz co potrafi zjednoczy� nawet Stra�nika z Kopaczem?
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_04"); //Bandyci. Tak, atak Bandyt�w to co�, czego nam potrzeba.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_05"); //Id� jeszcze raz do tych imbecyli i powiedz, �e Orry potrzebuje pomocy w odparciu ataku Bandyt�w!
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_06"); //Potem poprosisz o klucz do skrzy�, �eby wzi�� bro� dla siebie.
    AI_Output (other, self ,"DIA_Robotnik_ZDOBYC_KLUCZ_15_07"); //Dobry plan.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_08"); //Id� ju�.
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Mam ostrzec Stra�nik�w przed atakiem Bandyt�w i poprosi� o klucz do skrzyni.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OBRONA_2
//========================================

INSTANCE DIA_Robotnik_OBRONA_2 (C_INFO)
{
   npc          = VLK_2004_Robotnik;
   nr           = 1;
   condition    = DIA_Robotnik_OBRONA_2_Condition;
   information  = DIA_Robotnik_OBRONA_2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Robotnik_OBRONA_2_Condition()
{
if (MIS_Obrona_Placu == LOG_RUNNING) {
    return TRUE; };
};

FUNC VOID DIA_Robotnik_OBRONA_2_Info()
{
    AI_Output (self, other ,"DIA_Robotnik_OBRONA_2_03_01"); //Przyby�e� w ostatniej chwili. By�oby po nas. Jednak kilku Bandyt�w przedar�o si� przez bram�. S� na placu wymian.

    B_GiveXP (57);
    AI_StopProcessInfos	(self);
};

