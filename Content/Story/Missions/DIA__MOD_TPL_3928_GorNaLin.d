//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorNaLin_EXIT(C_INFO)
{
	npc             = TPL_3928_GorNaLin;
	nr              = 999;
	condition	= DIA_GorNaLin_EXIT_Condition;
	information	= DIA_GorNaLin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorNaLin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorNaLin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaLin_HELLO1 (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 1;
   condition    = DIA_GorNaLin_HELLO1_Condition;
   information  = DIA_GorNaLin_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaLin_HELLO1_Condition()
{
    if (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaLin_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_GorNaLin_HELLO1_03_01"); //(kompletnie pijany) Hej! hyp... Masz mo�e... hip... troszeczk�... w�deczki?
    AI_Output (self, other ,"DIA_GorNaLin_HELLO1_03_02"); //Napi�bym si�... hik... czego� mocniejszego.
    B_LogEntry                     (CH2_MissedSpy,"W karczmie w Nowym Obozie spotka�em Gor Na Lina, a raczej resztki cz�owieka, jakim by�. By�y Stra�nik �wi�tynny najwyra�niej sprzeda� swoj� zbroj�, �eby zarobi� na alkohol. Zastanawia mnie, dlaczego go�� tak si� rozpi�. Musz� popyta� okolicznych pijak�w.");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_GorNaLin_HELLO2 (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 2;
   condition    = DIA_GorNaLin_HELLO2_Condition;
   information  = DIA_GorNaLin_HELLO2_Info;
   permanent	= FALSE;
   description	= "Wstawaj! Wracamy do Bractwa.";
};

FUNC INT DIA_GorNaLin_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaLin_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaLin_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_GorNaLin_HELLO2_15_01"); //Wstawaj! Wracamy do Bractwa.
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_02"); //Co? hyp... jakiego Bractwa? hik... Przecie�... hip... tam nie ma w�deczki...
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_03"); //A przepraszam... hip... pana bardzo. Kim pan w og�le jest? hip...
    AI_Output (other, self ,"DIA_GorNaLin_HELLO2_15_04"); //Pos�uchaj. Musisz si� ogarn��. 
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_05"); //Ja nigdzie nie id�! BUUUUTCH! hik... JAKI� GNOJEK... mhhh... MA DO CIEBIE INTERES!
    AI_Output (other, self ,"DIA_GorNaLin_HELLO2_15_06"); //Dobra. Ju� id�. Tylko si� nie drzyj. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BRACTWO
//========================================

INSTANCE DIA_HELLO2_BRACTWO (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 1;
   condition    = DIA_HELLO2_BRACTWO_Condition;
   information  = DIA_HELLO2_BRACTWO_Info;
   permanent	= FALSE;
   description	= "Pos�uchaj: musimy st�d i��. Musisz wr�ci� do Bractwa.";
};

FUNC INT DIA_HELLO2_BRACTWO_Condition()
{
    if (Npc_HasItems (hero, It_HerbatkaNaKaca) >=1) && ( Hlp_StrCmp(Npc_GetNearestWP(self),"LIN_CAVE") ) && (herbatka_crnonos == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_HELLO2_BRACTWO_Info()
{
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_01"); //Pos�uchaj: musimy st�d i��. Musisz wr�ci� do Bractwa.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_02"); //Co? hik... Kim ty jeste� do cholery?
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_03"); //Kim�, kogo musisz s�ucha�. Baal Lukor si� za tob� st�skni�.
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_04"); //Masz to. Wypij. Polepszy ci si�.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_05"); //Co to za trucizna?! Nie b�d� tego pi�.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_06"); //BUUUUSTER! BUUUSTER! JAAAACKO! POMOCY!
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_07"); //Dobra. Sam tego chcia�e�. Za�atwimy to inaczej.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_08"); //Co... co chcesz zrobi�?
    AI_DrawWeapon (other);
	AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_09"); //Naucz� ci� rozs�dku si��.
    B_LogEntry                     (CH2_MissedSpy,"Szlag mnie trafia, gdy mam rozmawia� z Linem. Ten cz�owiek straci� rozum. Chyba musz� mu go przywr�ci� si��, bo innego wyj�cia nie widz�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POBITY
//========================================

INSTANCE DIA_HELLO2_POBITY (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 2;
   condition    = DIA_HELLO2_POBITY_Condition;
   information  = DIA_HELLO2_POBITY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_HELLO2_POBITY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_BRACTWO))
    && (TPL_3928_GorNaLin.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (Npc_HasItems (other, It_HerbatkaNaKaca) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_HELLO2_POBITY_Info()
{
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_01"); //Co� ty najlepszego narobi�. Rozci��e� mi ca�� r�k�!
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_02"); //To tylko dra�ni�cie.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_03"); //(wyje z b�lu) POMӯ MI! Aaagh...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_04"); //Pij to.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_05"); //Nie! Aaargg...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_06"); //Pij, albo zrobi� ci drug� dziur�. Tym razem w g�owie.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_07"); //Aagg...
    B_GiveInvItems (other, self, It_HerbatkaNaKaca, 1);
    AI_UseItem (self, It_HerbatkaNaKaca);
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_08"); //Ou... Nie dobrze mi...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_09"); //Tylko spr�buj! Ustatkuj sw�j �o��dek, a ja poszukam jakiego� banda�a. Mikstura w tym momencie to nie za dobry pomys�.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_10"); //Umm... Szybko! 
    B_LogEntry                     (CH2_MissedSpy,"Chyba troszk� za mocno potraktowa�em Gor Na Lina. Musz� szybko znale�� jaki� banda�, bo ten krwotok nie wygl�da ciekawie. ");

    B_GiveXP (100);
};

//========================================
//-----------------> RANA
//========================================

INSTANCE DIA_HELLO2_RANA (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 3;
   condition    = DIA_HELLO2_RANA_Condition;
   information  = DIA_HELLO2_RANA_Info;
   permanent	= FALSE;
   description	= "Mam banda�.";
};

FUNC INT DIA_HELLO2_RANA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_POBITY))
    && ( (Npc_HasItems (other, ItMi_Bandaz40) >=1) || (Npc_HasItems (other, ItMi_Bandaz60) >=1) )
    {
    return TRUE;
    };
};


FUNC VOID DIA_HELLO2_RANA_Info()
{
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_01"); //Mam banda�.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_02"); //Szybko. Owi� mi r�k�!
    if (Npc_HasItems (other, ItMi_Bandaz60) >=1)
    {
        B_GiveInvItems (other, self, ItMi_Bandaz60, 1);
    }
    else
    {
        B_GiveInvItems (other, self, ItMi_Bandaz40, 1);
    };
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_03"); //Cholera! Nie wygl�da to zbyt dobrze.
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_04"); //Widz�, �e troch� wytrze�wia�e�.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_05"); //Strasznie boli mnie g�owa. 
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_06"); //Chod� za mn�.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_07"); //Ech... No dobrze. Prowad�.
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH2_MissedSpy,"Zatamowa�em krwotok. Przy okazji Stra�nik �wi�tynny nieco wytrze�wia� i bez problem�w za mn� poszed� do Obozu. Teraz musz� pilnowa�, �eby prze�y�.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POWROT_DONE
//========================================

INSTANCE DIA_HELLO2_POWROT_DONE (C_INFO)
{
   npc          = TPL_3928_GorNaLin;
   nr           = 4;
   condition    = DIA_HELLO2_POWROT_DONE_Condition;
   information  = DIA_HELLO2_POWROT_DONE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_HELLO2_POWROT_DONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_RANA))
    && ( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_HELLO2_POWROT_DONE_Info()
{

	AI_GotoNpc(self,hero);
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_01"); //Gdzie my jeste�my? Pami�tam to miejsce... z dzieci�stwa.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_02"); //To moje miasto rodzinne. To Ardea!
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_03"); //Jest z tob� gorzej ni� my�la�em.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_04"); //Twierdzisz, �e jestem w b��dzie?
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_05"); //Twoje dzieci�stwo nie mia�o miejsca trzy tygodnie temu. I nie, to nie jest Ardea, tylko �mierdz�cy ob�z Bractwa.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_06"); //K�amiesz. Id� szuka� mojego ojca! Na pewno gdzie� tu jest.
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_07"); //Tak... Nazywa si� Lukor. Id� do niego...
    B_LogEntry                     (CH2_MissedSpy,"Doprowadzi�em Gor Na Lina do Bractwa. Ca�kiem mu odbi�o. Musze pogada� z Baal Lukorem.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "bractwo");
};



