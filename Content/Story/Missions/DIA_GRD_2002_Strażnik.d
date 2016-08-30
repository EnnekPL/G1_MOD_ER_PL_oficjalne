//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra�nik_2002_EXIT(C_INFO)
{
	npc             = GRD_2002_Stra�nik;
	nr              = 999;
	condition	= DIA_Stra�nik_2002_EXIT_Condition;
	information	= DIA_Stra�nik_2002_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra�nik_2002_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra�nik_2002_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2002
//========================================

INSTANCE DIA_Stra�nik_HELLO2002 (C_INFO)
{
   npc          = GRD_2002_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_HELLO2002_Condition;
   information  = DIA_Stra�nik_HELLO2002_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Stra�nik_HELLO2002_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_HELLO2002_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_HELLO2002_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Stra�nik_HELLO2002_03_02"); //Pilnujemy kopalni, a przy okazji tak�e placu wymian przed Bandytami.
    AI_Output (other, self ,"DIA_Stra�nik_HELLO2002_15_03"); //Ataki Bandyt�w s� cz�ste?
    AI_Output (self, other ,"DIA_Stra�nik_HELLO2002_03_04"); //Nie. Zazwyczaj atakuj� po wymianie ze �wiatem Zewn�trznym.
};

//========================================
//-----------------> ODOLINIE
//========================================

INSTANCE DIA_Stra�nik_ODOLINIE (C_INFO)
{
   npc          = GRD_2002_Stra�nik;
   nr           = 2;
   condition    = DIA_Stra�nik_ODOLINIE_Condition;
   information  = DIA_Stra�nik_ODOLINIE_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o Kolonii.";
};

FUNC INT DIA_Stra�nik_ODOLINIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_ODOLINIE_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_ODOLINIE_15_01"); //Opowiedz mi o Kolonii.
    AI_Output (self, other ,"DIA_Stra�nik_ODOLINIE_03_02"); //Co tu du�o m�wi�. Wsz�dzie pe�no zbir�w, dzikich bestii oraz ludzi, kt�rzy chc� ci� wykorzysta�.
    AI_Output (self, other ,"DIA_Stra�nik_ODOLINIE_03_03"); //Szczeg�lnie niebezpiecznie jest w lasach i na Ziemiach Ork�w.
    AI_Output (self, other ,"DIA_Stra�nik_ODOLINIE_03_04"); //Nie id� tam bez odpowiedniego ekwipunku.
};

//========================================
//-----------------> EQ_INFORMACJE
//========================================

INSTANCE DIA_Stra�nik_EQ_INFORMACJE (C_INFO)
{
   npc          = GRD_2002_Stra�nik;
   nr           = 3;
   condition    = DIA_Stra�nik_EQ_INFORMACJE_Condition;
   information  = DIA_Stra�nik_EQ_INFORMACJE_Info;
   permanent	= FALSE;
   description	= "Jaki ekwipunek proponujesz?";
};

FUNC INT DIA_Stra�nik_EQ_INFORMACJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_ODOLINIE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_EQ_INFORMACJE_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_EQ_INFORMACJE_15_01"); //Jaki ekwipunek proponujesz?
    AI_Output (self, other ,"DIA_Stra�nik_EQ_INFORMACJE_03_02"); //Przede wszystkim dobra bro� i pancerz.
    AI_Output (self, other ,"DIA_Stra�nik_EQ_INFORMACJE_03_03"); //Musisz te� zadba� o troch� jedzenia i wody. Nie zapomnij o banda�ach i miksturach leczniczych.
    AI_Output (self, other ,"DIA_Stra�nik_EQ_INFORMACJE_03_04"); //Poza tym wypada�oby mie� brzytw� i kilka narz�dzi do pracy.
    AI_Output (other, self ,"DIA_Stra�nik_EQ_INFORMACJE_15_05"); //Dzi�ki za rady.
    AI_Output (self, other ,"DIA_Stra�nik_EQ_INFORMACJE_03_06"); //Daj mi odpocz��.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO42002
//========================================

INSTANCE DIA_Stra�nik_HELLO42002 (C_INFO)
{
   npc          = GRD_2002_Stra�nik;
   nr           = 4;
   condition    = DIA_Stra�nik_HELLO42002_Condition;
   information  = DIA_Stra�nik_HELLO42002_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Stra�nik_HELLO42002_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_HELLO42002_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_HELLO42002_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Stra�nik_HELLO42002_03_02"); //Jako� leci.
};

//========================================
//-----------------> OBRONA_1
//========================================

INSTANCE DIA_Stra�nik_OBRONA_1 (C_INFO)
{
   npc          = GRD_2002_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_OBRONA_1_Condition;
   information  = DIA_Stra�nik_OBRONA_1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra�nik_OBRONA_1_Condition()
{
    if (MIS_Obrona_Placu == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_OBRONA_1_Info()
{
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_1_03_01"); //Zjawi�e� si� w ostatniej chwili. Dzi�ki! 
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_1_03_02"); //Ale to jeszcze nie koniec. Jest ich wi�cej. Pobiegli na plac wymian.
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_1_03_03"); //Ruszaj za nimi! My b�dziemy pilnowa�, by nie zaskoczyli was od ty�u.
    B_LogEntry                     (CH1_Obrona_Placu,"Odparli�my atak przy wej�ciu do Opuszczonej Kopalni. Pora i�� dalej. Bandyt�w jest wi�cej.");

    B_GiveXP (48);
    AI_StopProcessInfos	(self);
};

