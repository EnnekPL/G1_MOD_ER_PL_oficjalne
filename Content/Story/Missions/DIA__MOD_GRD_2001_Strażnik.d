//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra�nik_2001_EXIT(C_INFO)
{
	npc             = GRD_2001_Stra�nik;
	nr              = 999;
	condition	= DIA_Stra�nik_2001_EXIT_Condition;
	information	= DIA_Stra�nik_2001_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra�nik_2001_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra�nik_2001_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kim_jestes
//========================================

INSTANCE DIA_Stra�nik_Kim_jestes (C_INFO)
{
   npc          = GRD_2001_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_Kim_jestes_Condition;
   information  = DIA_Stra�nik_Kim_jestes_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Stra�nik_Kim_jestes_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_Kim_jestes_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_Kim_jestes_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_02"); //Pilnuj� kopalni.
    AI_Output (other, self ,"DIA_Stra�nik_Kim_jestes_15_03"); //Czy ta kopalnia wci�� dzia�a?
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_04"); //No w�a�nie nie. Nie dzia�a ju� od wielu lat.
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_05"); //Pewnego dnia nie wytrzyma�y podpory i wszystko si� zawali�o.
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_06"); //Podobno zniszczenia odkry�y podziemn� grot� pe�n� plugawych istot.
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_07"); //Od tamtej pory kopalnia nie funkcjonuje.
    AI_Output (other, self ,"DIA_Stra�nik_Kim_jestes_15_08"); //Wierzysz w to?
    AI_Output (self, other ,"DIA_Stra�nik_Kim_jestes_03_09"); //Jak mam nie wierzy�? W nocy z g��bi kopalni s�ycha� straszliwe d�wi�ki.
};

//========================================
//-----------------> ODBUDOWA
//========================================

INSTANCE DIA_Stra�nik_ODBUDOWA (C_INFO)
{
   npc          = GRD_2001_Stra�nik;
   nr           = 2;
   condition    = DIA_Stra�nik_ODBUDOWA_Condition;
   information  = DIA_Stra�nik_ODBUDOWA_Info;
   permanent	= FALSE;
   description	= "Nie pr�bowali�cie odbudowa� kopalni?";
};

FUNC INT DIA_Stra�nik_ODBUDOWA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_Kim_jestes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_ODBUDOWA_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_ODBUDOWA_15_01"); //Nie pr�bowali�cie odbudowa� kopalni?
    AI_Output (self, other ,"DIA_Stra�nik_ODBUDOWA_03_02"); //Oczywi�cie, �e pr�bowali�my. Pami�tam to.
    AI_Output (self, other ,"DIA_Stra�nik_ODBUDOWA_03_03"); //By�em wtedy Cieniem. Gomez wys�a� oddzia� Stra�nik�w, kt�ry mia� wyp�dzi� te istoty.
    AI_Output (self, other ,"DIA_Stra�nik_ODBUDOWA_03_04"); //Wszyscy zgin�li. Z�o�a by�y i tak na wyczerpaniu. Wi�cej pr�b nie podj�to.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Stra�nik_HELLO3 (C_INFO)
{
   npc          = GRD_2001_Stra�nik;
   nr           = 3;
   condition    = DIA_Stra�nik_HELLO3_Condition;
   information  = DIA_Stra�nik_HELLO3_Info;
   permanent	= FALSE;
   description	= "Co mi powiesz o Gomezie?";
};

FUNC INT DIA_Stra�nik_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_ODBUDOWA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_HELLO3_15_01"); //Co mi powiesz o Gomezie?
    AI_Output (self, other ,"DIA_Stra�nik_HELLO3_03_02"); //To najpot�niejszy z Magnat�w. Ma wszystko, czego chce.
    AI_Output (self, other ,"DIA_Stra�nik_HELLO3_03_03"); //Wykorzystuje Stra�nik�w do za�atwiania brudnej roboty.
    AI_Output (self, other ,"DIA_Stra�nik_HELLO3_03_04"); //Ma oczywi�cie swoich pomocnik�w.
    AI_Output (other, self ,"DIA_Stra�nik_HELLO3_15_05"); //Warto si� go ba�?
    AI_Output (self, other ,"DIA_Stra�nik_HELLO3_03_06"); //Oczywi�cie. Jest pot�nym wojownikiem, ale rzadko walczy.
    AI_Output (self, other ,"DIA_Stra�nik_HELLO3_03_07"); //Woli kaza� Stra�nikom rozszarpa� kogo� na kawa�eczki.
};

//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Stra�nik_SYTUACJA (C_INFO)
{
   npc          = GRD_2001_Stra�nik;
   nr           = 4;
   condition    = DIA_Stra�nik_SYTUACJA_Condition;
   information  = DIA_Stra�nik_SYTUACJA_Info;
   permanent	= TRUE;
   description	= "Jak sytuacja w kopalni?";
};

FUNC INT DIA_Stra�nik_SYTUACJA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_Kim_jestes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_SYTUACJA_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_SYTUACJA_15_01"); //Jak sytuacja w kopalni?
    AI_Output (self, other ,"DIA_Stra�nik_SYTUACJA_15_02"); //Na razie nie jest �le. Chocia� d�wi�ki nasilaj� si� z ka�dym dniem.
};