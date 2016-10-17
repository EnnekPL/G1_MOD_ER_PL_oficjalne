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
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_02"); //NieŸle. Lubiê, gdy Stra¿nicy ka¿¹ mi naprawiaæ bramê.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_03"); //A wiesz dlaczego?
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_04"); //Bo wtedy nie muszê ich ogl¹daæ! Sukinsyny...
    AI_Output (other, self ,"DIA_Robotnik_JAKPRACA_15_05"); //Co ci zrobili?
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_06"); //Widaæ, ¿e jesteœ nowy. 
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_07"); //Stra¿ Gomeza mo¿e robiæ z nami wszystko! 
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_08"); //Pomiataj¹ nami, okradaj¹ nas, ka¿¹ niewolniczo pracowaæ.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_09"); //Ostatnio dosta³em trochê jedzenia, a te gnidy wszystko mi zabra³y.
    AI_Output (self, other ,"DIA_Robotnik_JAKPRACA_03_10"); //Nie chcia³em wiele. Nie jad³em od trzech dni!
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
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_03"); //Us³ysza³em twoj¹ rozmowê z Orry'm. Podobno szukasz notatek opisuj¹cych dzia³ania Bandytów.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_04"); //Mogê ci pomóc.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_05"); //Jak?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_06"); //Wiem gdzie znajduj¹ siê notatki.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_07"); //S¹ ukryte w skrzyni na placu wymian.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_08"); //Bêdziesz jednak potrzebowa³ klucza.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_09"); //Sk¹d go wezmê?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_10"); //Tak siê sk³ada, ¿e uda³o mi siê zdobyæ ten klucz.
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_11"); //Dostaniesz go za 100 bry³ek rudy.
    AI_Output (other, self ,"DIA_Robotnik_DealWithWorker_15_12"); //Czemu a¿ tyle?
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_13"); //Ruda siê przyda. Mo¿e uda mi siê st¹d uciec? 
    AI_Output (self, other ,"DIA_Robotnik_DealWithWorker_03_14"); //Kilka bry³ek rudy, trochê pomyœlunku i mo¿na szybko zostaæ Szkodnikiem.
    B_LogEntry                     (CH1_DraxTest,"Robotnik naprawiaj¹cy bramê na placu wymian zaoferowa³ mi klucz do skrzyni z notatkami Tripa za 100 bry³ek rudy. ");
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
   description	= "Mam sto bry³ek rudy.";
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
    AI_Output (other, self ,"DIA_Robotnik_Give100OreNugget_15_01"); //Mam sto bry³ek rudy.
    AI_Output (self, other ,"DIA_Robotnik_Give100OreNugget_03_02"); //Œwietnie. Oto klucz. 
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
    AI_Output (self, other ,"DIA_Robotnik_JEDZENIE_03_02"); //Schowali je do skrzyni. Kawa³ek szynki, 3 sztuki miêsa i 2 bochenki chleba.
    AI_Output (other, self ,"DIA_Robotnik_JEDZENIE_15_03"); //Wiesz gdzie mo¿e byæ klucz?
    AI_Output (self, other ,"DIA_Robotnik_JEDZENIE_03_04"); //Ma go ten Stra¿nik przy palisadzie. 
    AI_Output (other, self ,"DIA_Robotnik_JEDZENIE_15_05"); //Mo¿e uda mi siê coœ z tym zrobiæ.
	
    Jedzenie_zplacu= LOG_RUNNING;

    Log_CreateTopic            (CH1_Jedzenie_zplacu, LOG_MISSION);
    Log_SetTopicStatus         (CH1_Jedzenie_zplacu, LOG_RUNNING);
    B_LogEntry                 (CH1_Jedzenie_zplacu,"Dwaj Stra¿nicy z placu wymian ukradli robotnikowi jedzenie. Ukryli je w skrzyni na placu wymian. Klucz ma jeden ze Stra¿ników. Muszê go zdobyæ i oddaæ jedzenie robotnikowi.");
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
    AI_Output (self, other ,"DIA_Robotnik_QUESTOK_03_02"); //Naprawdê ci siê uda³o?
    AI_Output (self, other ,"DIA_Robotnik_QUESTOK_03_03"); //Nie chcê wszystkiego. Wezmê tylko miêso i bochenek chleba.
    B_GiveInvItems (other, self, ItFoLoaf, 1);
    B_GiveInvItems (other, self, ItFoMuttonRaw, 3);
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Uda³o mi siê zdobyæ jedzenie.");
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
   description	= "Nie dam rady tego zrobiæ.";
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
    AI_Output (other, self ,"DIA_Robotnik_CIOTA_15_01"); //Nie dam rady tego zrobiæ.
    AI_Output (self, other ,"DIA_Robotnik_CIOTA_03_02"); //Jesteœ nowy. Rozumiem.
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Nie potrafiê zabraæ jedzenia ze skrzyni. No có¿...");
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
   description	= "Powiesz mi teraz coœ ciekawego?";
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
    AI_Output (other, self ,"DIA_Robotnik_INFOOKOPALNI_15_01"); //Powiesz mi teraz coœ ciekawego?
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_02"); //Hmm... Jesteœ godny mojego zaufania.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_03"); //Dam ci radê. Nie wspinaj siê na p³askowy¿! Kopalnia jest przeklêta.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_04"); //Myœlisz, ¿e, dlaczego Stra¿nicy tam stoj¹? Gomez nic nie chce powiedzieæ.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_05"); //W nocy wydobywaj¹ siê stamt¹d straszne dŸwiêki, a na niebie widaæ ³uny œwiat³a.
    AI_Output (self, other ,"DIA_Robotnik_INFOOKOPALNI_03_06"); //Poza tym krêci siê tam wiele groŸnych zwierz¹t. Mój przyjaciel tam zgin¹³.
    AI_Output (other, self ,"DIA_Robotnik_INFOOKOPALNI_15_07"); //Dziêkujê za informacjê.
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
   description	= "Nie wiem, jak zabraæ klucz Stra¿nikowi.";
};

FUNC INT DIA_Robotnik_ZDOBYC_KLUCZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_KLUCZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robotnik_ZDOBYC_KLUCZ_Info()
{
    AI_Output (other, self ,"DIA_Robotnik_ZDOBYC_KLUCZ_15_01"); //Nie wiem, jak zabraæ klucz Stra¿nikowi.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_02"); //Musimy opracowaæ jakiœ podstêp.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_03"); //Wiesz co potrafi zjednoczyæ nawet Stra¿nika z Kopaczem?
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_04"); //Bandyci. Tak, atak Bandytów to coœ, czego nam potrzeba.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_05"); //IdŸ jeszcze raz do tych imbecyli i powiedz, ¿e Orry potrzebuje pomocy w odparciu ataku Bandytów!
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_06"); //Potem poprosisz o klucz do skrzyñ, ¿eby wzi¹æ broñ dla siebie.
    AI_Output (other, self ,"DIA_Robotnik_ZDOBYC_KLUCZ_15_07"); //Dobry plan.
    AI_Output (self, other ,"DIA_Robotnik_ZDOBYC_KLUCZ_03_08"); //IdŸ ju¿.
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Mam ostrzec Stra¿ników przed atakiem Bandytów i poprosiæ o klucz do skrzyni.");
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
if (MIS_ReplacePointDefense == LOG_RUNNING) {
    return TRUE; };
};

FUNC VOID DIA_Robotnik_OBRONA_2_Info()
{
    AI_Output (self, other ,"DIA_Robotnik_OBRONA_2_03_01"); //Przyby³eœ w ostatniej chwili. By³oby po nas. Jednak kilku Bandytów przedar³o siê przez bramê. S¹ na placu wymian.

    B_GiveXP (57);
    AI_StopProcessInfos	(self);
};

