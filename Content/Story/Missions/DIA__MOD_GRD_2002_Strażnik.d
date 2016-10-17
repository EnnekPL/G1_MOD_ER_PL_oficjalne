//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra¿nik_2002_EXIT(C_INFO)
{
	npc             = GRD_2002_Stra¿nik;
	nr              = 999;
	condition	= DIA_Stra¿nik_2002_EXIT_Condition;
	information	= DIA_Stra¿nik_2002_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra¿nik_2002_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra¿nik_2002_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2002
//========================================

INSTANCE DIA_Stra¿nik_HELLO2002 (C_INFO)
{
   npc          = GRD_2002_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_HELLO2002_Condition;
   information  = DIA_Stra¿nik_HELLO2002_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Stra¿nik_HELLO2002_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_HELLO2002_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_HELLO2002_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO2002_03_02"); //Pilnujemy kopalni, a przy okazji tak¿e placu wymian przed Bandytami.
    AI_Output (other, self ,"DIA_Stra¿nik_HELLO2002_15_03"); //Ataki Bandytów s¹ czêste?
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO2002_03_04"); //Nie. Zazwyczaj atakuj¹ po wymianie ze Œwiatem Zewnêtrznym.
};

//========================================
//-----------------> ODOLINIE
//========================================

INSTANCE DIA_Stra¿nik_ODOLINIE (C_INFO)
{
   npc          = GRD_2002_Stra¿nik;
   nr           = 2;
   condition    = DIA_Stra¿nik_ODOLINIE_Condition;
   information  = DIA_Stra¿nik_ODOLINIE_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o Kolonii.";
};

FUNC INT DIA_Stra¿nik_ODOLINIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_ODOLINIE_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_ODOLINIE_15_01"); //Opowiedz mi o Kolonii.
    AI_Output (self, other ,"DIA_Stra¿nik_ODOLINIE_03_02"); //Co tu du¿o mówiæ. Wszêdzie pe³no zbirów, dzikich bestii oraz ludzi, którzy chc¹ ciê wykorzystaæ.
    AI_Output (self, other ,"DIA_Stra¿nik_ODOLINIE_03_03"); //Szczególnie niebezpiecznie jest w lasach i na Ziemiach Orków.
    AI_Output (self, other ,"DIA_Stra¿nik_ODOLINIE_03_04"); //Nie idŸ tam bez odpowiedniego ekwipunku.
};

//========================================
//-----------------> EQ_INFORMACJE
//========================================

INSTANCE DIA_Stra¿nik_EQ_INFORMACJE (C_INFO)
{
   npc          = GRD_2002_Stra¿nik;
   nr           = 3;
   condition    = DIA_Stra¿nik_EQ_INFORMACJE_Condition;
   information  = DIA_Stra¿nik_EQ_INFORMACJE_Info;
   permanent	= FALSE;
   description	= "Jaki ekwipunek proponujesz?";
};

FUNC INT DIA_Stra¿nik_EQ_INFORMACJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_ODOLINIE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_EQ_INFORMACJE_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_EQ_INFORMACJE_15_01"); //Jaki ekwipunek proponujesz?
    AI_Output (self, other ,"DIA_Stra¿nik_EQ_INFORMACJE_03_02"); //Przede wszystkim dobra broñ i pancerz.
    AI_Output (self, other ,"DIA_Stra¿nik_EQ_INFORMACJE_03_03"); //Musisz te¿ zadbaæ o trochê jedzenia i wody. Nie zapomnij o banda¿ach i miksturach leczniczych.
    AI_Output (self, other ,"DIA_Stra¿nik_EQ_INFORMACJE_03_04"); //Poza tym wypada³oby mieæ brzytwê i kilka narzêdzi do pracy.
    AI_Output (other, self ,"DIA_Stra¿nik_EQ_INFORMACJE_15_05"); //Dziêki za rady.
    AI_Output (self, other ,"DIA_Stra¿nik_EQ_INFORMACJE_03_06"); //Daj mi odpocz¹æ.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO42002
//========================================

INSTANCE DIA_Stra¿nik_HELLO42002 (C_INFO)
{
   npc          = GRD_2002_Stra¿nik;
   nr           = 4;
   condition    = DIA_Stra¿nik_HELLO42002_Condition;
   information  = DIA_Stra¿nik_HELLO42002_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Stra¿nik_HELLO42002_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_HELLO42002_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_HELLO42002_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO42002_03_02"); //Jakoœ leci.
};

//========================================
//-----------------> OBRONA_1
//========================================

INSTANCE DIA_Stra¿nik_OBRONA_1 (C_INFO)
{
   npc          = GRD_2002_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_OBRONA_1_Condition;
   information  = DIA_Stra¿nik_OBRONA_1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra¿nik_OBRONA_1_Condition()
{
    if (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_OBRONA_1_Info()
{
    AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_1_03_01"); //Zjawi³eœ siê w ostatniej chwili. Dziêki! 
    AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_1_03_02"); //Ale to jeszcze nie koniec. Jest ich wiêcej. Pobiegli na plac wymian.
    AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_1_03_03"); //Ruszaj za nimi! My bêdziemy pilnowaæ, by nie zaskoczyli was od ty³u.
    B_LogEntry                     (CH2_ReplacePointDefense,"Odparliœmy atak przy wejœciu do Opuszczonej Kopalni. Pora iœæ dalej. Bandytów jest wiêcej.");

    B_GiveXP (48);
    AI_StopProcessInfos	(self);
};

