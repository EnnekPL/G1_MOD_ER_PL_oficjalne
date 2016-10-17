//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra�nik_2005_EXIT(C_INFO)
{
	npc             = GRD_2005_Stra�nik;
	nr              = 999;
	condition	= DIA_Stra�nik_EXIT_2005_Condition;
	information	= DIA_Stra�nik_EXIT_2005_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra�nik_EXIT_2005_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra�nik_EXIT_2005_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTY
//========================================

INSTANCE DIA_Stra�nik_KTOTY (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_KTOTY_Condition;
   information  = DIA_Stra�nik_KTOTY_Info;
   permanent	= FALSE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Stra�nik_KTOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_KTOTY_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_KTOTY_15_03"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Stra�nik_KTOTY_03_04"); //Pilnuj� placu wymian przed takimi nierobami jak ty!
};

//========================================
//-----------------> O_PLACU
//========================================

INSTANCE DIA_Stra�nik_O_PLACU (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 2;
   condition    = DIA_Stra�nik_O_PLACU_Condition;
   information  = DIA_Stra�nik_O_PLACU_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o placu wymian.";
};

FUNC INT DIA_Stra�nik_O_PLACU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_KTOTY))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Stra�nik_O_PLACU_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_O_PLACU_15_01"); //Opowiedz mi o placu wymian.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_02"); //P�niej ju� sobie p�jdziesz?
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_03"); //Prowadzimy tutaj wymian� towar�w za rud� ze �wiatem Zewn�trznym.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_04"); //Co miesi�c �adujemy rud� do skrzyni i wci�gamy j� na g�r�.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_05"); //W zamian za rud� otrzymujemy paczki z �ywno�ci� i inne potrzebne do �ycia przedmioty.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_06"); //Czasem te� kobiety...
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_07"); //Ale to nie dla nas, a szczeg�lnie nie dla takich jak TY!
    AI_Output (other, self ,"DIA_Stra�nik_O_PLACU_15_08"); //A je�li ludzie kr�la nie za�aduj� skrzy�?
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_09"); //Zdarza�o si� i tak.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_10"); //Wtedy w nast�pnym miesi�cu nie przekazywali�my rudy.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_11"); //Ale ch�opcy mieli miny. He he. Nic nie mogli nam zrobi�.
};

//========================================
//-----------------> KLUCZ
//========================================

INSTANCE DIA_Stra�nik_KLUCZ (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 3;
   condition    = DIA_Stra�nik_KLUCZ_Condition;
   information  = DIA_Stra�nik_KLUCZ_Info;
   permanent	= FALSE;
   description	= "Co znajduje si� w tych skrzyniach?";
};

FUNC INT DIA_Stra�nik_KLUCZ_Condition()
{
     if (Npc_KnowsInfo (hero, DIA_Robotnik_JEDZENIE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_KLUCZ_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_KLUCZ_15_01"); //Co znajduje si� w tych skrzyniach?
    AI_Output (other, self ,"DIA_Stra�nik_KLUCZ_15_02"); //A co wa�niejsze: gdzie jest klucz?
    AI_Output (self, other ,"DIA_Stra�nik_KLUCZ_03_03"); //Klucz mam JA i niech nawet ci nie przyjdzie do g�owy mi go zabiera�!
    AI_Output (other, self ,"DIA_Stra�nik_KLUCZ_15_04"); //Nie dasz mi go po dobroci? Mo�e si� dogadamy?
    AI_Output (self, other ,"DIA_Stra�nik_KLUCZ_03_05"); //Wyno� si�, p�ki nie wypru�em ci flak�w!
    B_LogEntry                     (CH1_Jedzenie_zplacu,"Stra�nik nie odda klucza po dobroci. Musz� wymy�li� jaki� plan...");

    B_GiveXP (10);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> UDAWANY_ATAK
//========================================

INSTANCE DIA_Stra�nik_UDAWANY_ATAK (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 4;
   condition    = DIA_Stra�nik_UDAWANY_ATAK_Condition;
   information  = DIA_Stra�nik_UDAWANY_ATAK_Info;
   permanent	= FALSE;
   description	= "Bandyci, Bandyci atakuj�!";
};

FUNC INT DIA_Stra�nik_UDAWANY_ATAK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robotnik_ZDOBYC_KLUCZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_UDAWANY_ATAK_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_UDAWANY_ATAK_15_01"); //Bandyci, Bandyci atakuj�!
    AI_Output (self, other ,"DIA_Stra�nik_UDAWANY_ATAK_03_02"); //Co? Gdzie?
    AI_Output (other, self ,"DIA_Stra�nik_UDAWANY_ATAK_15_03"); //S� przy kopalni!
    AI_Output (other, self ,"DIA_Stra�nik_UDAWANY_ATAK_15_04"); //Nie mam broni! Daj mi klucz do skrzyni!
    AI_Output (self, other ,"DIA_Stra�nik_UDAWANY_ATAK_03_05"); //Masz.
    CreateInvItems (self, ItKeKeyPLAC, 1);
    B_GiveInvItems (self, other, ItKeKeyPLAC, 1);
	B_GiveXP (100);
	AI_StopProcessInfos	(self);
	B_ExchangeRoutine (self,"atak");
	B_ExchangeRoutine (GRD_2003_Stra�nik,"atakn");
};

//========================================
//-----------------> KONIECQ
//========================================

INSTANCE DIA_Stra�nik_KONIECQ (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 5;
   condition    = DIA_Stra�nik_KONIECQ_Condition;
   information  = DIA_Stra�nik_KONIECQ_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra�nik_KONIECQ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robotnik_QUESTOK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_KONIECQ_Info()
{
    AI_Output (self, other ,"DIA_Stra�nik_KONIECQ_03_01"); //Ten robotnik m�wi�, �e to by� tylko zwiad i zosta� ju� zlikwidowany.
    AI_Output (self, other ,"DIA_Stra�nik_KONIECQ_03_02"); //Mo�emy wraca� na stanowiska.
	B_giveXP (100);
	AI_StopProcessInfos	(self);
	B_ExchangeRoutine (self,"start");
	B_ExchangeRoutine (GRD_2003_Stra�nik,"start");
};


//========================================
//-----------------> OBRONA
//========================================

INSTANCE DIA_Stra�nik_OBRONA (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_OBRONA_Condition;
   information  = DIA_Stra�nik_OBRONA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra�nik_OBRONA_Condition()
{
    if (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_OBRONA_Info()
{
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_01"); //Przyby�e� w ostatniej chwili, m�ody. By�oby po nas.
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_02"); //Rozmawia�e� z pozosta�ymi?
    if (Npc_KnowsInfo (hero, DIA_Robotnik_OBRONA_2)) 
    {
        AI_Output (other, self ,"DIA_Stra�nik_OBRONA_15_03"); //Tak.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_04"); //W takim razie wszyscy s� bezpieczni. Mo�esz wraca� do Obozu.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby�em si� Bandyt�w z placu wymian. Mog� wr�ci� do Obozu.");
    }
    else
    {
        AI_Output (other, self ,"DIA_Stra�nik_OBRONA_15_05"); //Jeszcze nie.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_06"); //W takim razie sprawd� czy innym te� uda�o si� odeprze� atak.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_07"); //Potem wr�� do Thorusa.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby�em si� Bandyt�w z placu wymian, jednak wci�� nie rozmawia�em ze Stra�nikami z pozosta�ych posterunk�w. Musz� sprawdzi� czy s� bezpieczni. Dopiero potem b�d� m�g� wr�ci�. ");
		
    };
	B_GiveXP (79);
    AI_StopProcessInfos	(self);
};

