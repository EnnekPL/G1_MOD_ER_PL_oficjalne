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
    AI_Output (self, other ,"DIA_GorNaLin_HELLO1_03_01"); //(kompletnie pijany) Hej! hyp... Masz mo¿e... hip... troszeczkê... wódeczki?
    AI_Output (self, other ,"DIA_GorNaLin_HELLO1_03_02"); //Napi³bym siê... hik... czegoœ mocniejszego.
    B_LogEntry                     (CH2_MissedSpy,"W karczmie w Nowym Obozie spotka³em Gor Na Lina, a raczej resztki cz³owieka, jakim by³. By³y Stra¿nik Œwi¹tynny najwyraŸniej sprzeda³ swoj¹ zbrojê, ¿eby zarobiæ na alkohol. Zastanawia mnie, dlaczego goœæ tak siê rozpi³. Muszê popytaæ okolicznych pijaków.");
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
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_02"); //Co? hyp... jakiego Bractwa? hik... Przecie¿... hip... tam nie ma wódeczki...
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_03"); //A przepraszam... hip... pana bardzo. Kim pan w ogóle jest? hip...
    AI_Output (other, self ,"DIA_GorNaLin_HELLO2_15_04"); //Pos³uchaj. Musisz siê ogarn¹æ. 
    AI_Output (self, other ,"DIA_GorNaLin_HELLO2_03_05"); //Ja nigdzie nie idê! BUUUUTCH! hik... JAKIŒ GNOJEK... mhhh... MA DO CIEBIE INTERES!
    AI_Output (other, self ,"DIA_GorNaLin_HELLO2_15_06"); //Dobra. Ju¿ idê. Tylko siê nie drzyj. 
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
   description	= "Pos³uchaj: musimy st¹d iœæ. Musisz wróciæ do Bractwa.";
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
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_01"); //Pos³uchaj: musimy st¹d iœæ. Musisz wróciæ do Bractwa.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_02"); //Co? hik... Kim ty jesteœ do cholery?
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_03"); //Kimœ, kogo musisz s³uchaæ. Baal Lukor siê za tob¹ stêskni³.
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_04"); //Masz to. Wypij. Polepszy ci siê.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_05"); //Co to za trucizna?! Nie bêdê tego pi³.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_06"); //BUUUUSTER! BUUUSTER! JAAAACKO! POMOCY!
    AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_07"); //Dobra. Sam tego chcia³eœ. Za³atwimy to inaczej.
    AI_Output (self, other ,"DIA_HELLO2_BRACTWO_03_08"); //Co... co chcesz zrobiæ?
    AI_DrawWeapon (other);
	AI_Output (other, self ,"DIA_HELLO2_BRACTWO_15_09"); //Nauczê ciê rozs¹dku si³¹.
    B_LogEntry                     (CH2_MissedSpy,"Szlag mnie trafia, gdy mam rozmawiaæ z Linem. Ten cz³owiek straci³ rozum. Chyba muszê mu go przywróciæ si³¹, bo innego wyjœcia nie widzê.");
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
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_01"); //Coœ ty najlepszego narobi³. Rozci¹³eœ mi ca³¹ rêkê!
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_02"); //To tylko draœniêcie.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_03"); //(wyje z bólu) POMÓ¯ MI! Aaagh...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_04"); //Pij to.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_05"); //Nie! Aaargg...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_06"); //Pij, albo zrobiê ci drug¹ dziurê. Tym razem w g³owie.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_07"); //Aagg...
    B_GiveInvItems (other, self, It_HerbatkaNaKaca, 1);
    AI_UseItem (self, It_HerbatkaNaKaca);
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_08"); //Ou... Nie dobrze mi...
    AI_Output (other, self ,"DIA_HELLO2_POBITY_15_09"); //Tylko spróbuj! Ustatkuj swój ¿o³¹dek, a ja poszukam jakiegoœ banda¿a. Mikstura w tym momencie to nie za dobry pomys³.
    AI_Output (self, other ,"DIA_HELLO2_POBITY_03_10"); //Umm... Szybko! 
    B_LogEntry                     (CH2_MissedSpy,"Chyba troszkê za mocno potraktowa³em Gor Na Lina. Muszê szybko znaleŸæ jakiœ banda¿, bo ten krwotok nie wygl¹da ciekawie. ");

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
   description	= "Mam banda¿.";
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
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_01"); //Mam banda¿.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_02"); //Szybko. Owiñ mi rêkê!
    if (Npc_HasItems (other, ItMi_Bandaz60) >=1)
    {
        B_GiveInvItems (other, self, ItMi_Bandaz60, 1);
    }
    else
    {
        B_GiveInvItems (other, self, ItMi_Bandaz40, 1);
    };
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_03"); //Cholera! Nie wygl¹da to zbyt dobrze.
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_04"); //Widzê, ¿e trochê wytrzeŸwia³eœ.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_05"); //Strasznie boli mnie g³owa. 
    AI_Output (other, self ,"DIA_HELLO2_RANA_15_06"); //ChodŸ za mn¹.
    AI_Output (self, other ,"DIA_HELLO2_RANA_03_07"); //Ech... No dobrze. ProwadŸ.
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH2_MissedSpy,"Zatamowa³em krwotok. Przy okazji Stra¿nik Œwi¹tynny nieco wytrzeŸwia³ i bez problemów za mn¹ poszed³ do Obozu. Teraz muszê pilnowaæ, ¿eby prze¿y³.");

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
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_01"); //Gdzie my jesteœmy? Pamiêtam to miejsce... z dzieciñstwa.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_02"); //To moje miasto rodzinne. To Ardea!
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_03"); //Jest z tob¹ gorzej ni¿ myœla³em.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_04"); //Twierdzisz, ¿e jestem w b³êdzie?
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_05"); //Twoje dzieciñstwo nie mia³o miejsca trzy tygodnie temu. I nie, to nie jest Ardea, tylko œmierdz¹cy obóz Bractwa.
    AI_Output (self, other ,"DIA_HELLO2_POWROT_DONE_03_06"); //K³amiesz. Idê szukaæ mojego ojca! Na pewno gdzieœ tu jest.
    AI_Output (other, self ,"DIA_HELLO2_POWROT_DONE_15_07"); //Tak... Nazywa siê Lukor. IdŸ do niego...
    B_LogEntry                     (CH2_MissedSpy,"Doprowadzi³em Gor Na Lina do Bractwa. Ca³kiem mu odbi³o. Musze pogadaæ z Baal Lukorem.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "bractwo");
};



