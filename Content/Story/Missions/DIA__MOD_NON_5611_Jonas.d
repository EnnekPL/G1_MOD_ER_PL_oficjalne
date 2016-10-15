// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jonas_EXIT(C_INFO)
{
	npc             = NON_5611_Jonas;
	nr              = 999;
	condition	= DIA_Jonas_EXIT_Condition;
	information	= DIA_Jonas_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jonas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jonas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Jonas_HELLO1 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 1;
   condition    = DIA_Jonas_HELLO1_Condition;
   information  = DIA_Jonas_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak praca?";
};

FUNC INT DIA_Jonas_HELLO1_Condition()
{
    if (Wld_IsTime     (06,00,12,30))
    || (Wld_IsTime     (13,40,18,300))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Jonas_HELLO1_15_01"); //Jak praca?
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_02"); //Nie�le. Wyci�li�my ostatnio wielki d�b, kt�ry tu r�s�.
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_03"); //Mam teraz du�o pracy. Drewno d�bowe jest bardzo twarde, ale za to wytrzyma�e.
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_04"); //Przywyk�em do tego drzewa. Ros�o tu od lat. 
    AI_Output (other, self ,"DIA_Jonas_HELLO1_15_05"); //D�ugo jeste� ju� w obozie?
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_06"); //Cztery lata. Pomaga�em w budowie palisady. Sp�jrz jak si� zniszczy�a.
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_07"); //Martwe przedmioty tak szybko si� zu�ywaj�.
    AI_Output (other, self ,"DIA_Jonas_HELLO1_15_08"); //Ludzi te� to dotyczy.
    AI_Output (self, other ,"DIA_Jonas_HELLO1_03_09"); //Racja, ch�opcze.

};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jonas_HELLO2 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 2;
   condition    = DIA_Jonas_HELLO2_Condition;
   information  = DIA_Jonas_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mog� ci pom�c w pracy?";
};

FUNC INT DIA_Jonas_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jonas_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Jonas_HELLO2_15_01"); //Mog� ci pom�c w pracy?
    AI_Output (self, other ,"DIA_Jonas_HELLO2_03_02"); //Jasne. Przychod� do mnie codziennie. Przygotuj� ci troch� drewna, kt�re b�dziesz musia� mi poci��.
    AI_Output (self, other ,"DIA_Jonas_HELLO2_03_03"); //Oczywi�cie zap�ac� ci za pomoc.
	Log_CreateTopic (CH1_AllWorks,LOG_NOTE);
    B_LogEntry                     (CH1_AllWorks,"Mam codziennie przychodzi� do Jonasa i pomaga� mu przy ci�ciu drewna. ");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Jonas_HELLO3 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 3;
   condition    = DIA_Jonas_HELLO3_Condition;
   information  = DIA_Jonas_HELLO3_Info;
   permanent	= FALSE;
   description	= "Inni my�liwi ci nie pomagaj�?";
};

FUNC INT DIA_Jonas_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Jonas_HELLO3_15_01"); //Inni my�liwi ci nie pomagaj�?
    AI_Output (self, other ,"DIA_Jonas_HELLO3_03_02"); //Pomagaj�, ale to straszne nieroby. Pracuj� tak powoli, �e wol� sam wzi�� si� za robot�.
    AI_Output (other, self ,"DIA_Jonas_HELLO3_15_03"); //Mo�e trzeba ich troch� pogoni�?
    AI_Output (self, other ,"DIA_Jonas_HELLO3_03_04"); //Jak chcesz, to mo�esz i�� do Alexa i poprosi� go o pomoc. Jestem pewien, �e nic nie wsk�rasz. 
    MIS_Nieroby = LOG_RUNNING;

    Log_CreateTopic            (CH1_Nieroby, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Nieroby, LOG_RUNNING);
    B_LogEntry                     (CH1_Nieroby,"Pomocnicy Jonasa strasznie si� oci�gaj�. Musz� pogada� o tym z Alexem.");
};

//========================================
//-----------------> HELLO4
//========================================
//edit by Nocturn
INSTANCE DIA_Jonas_HELLO4 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 4;
   condition    = DIA_Jonas_HELLO4_Condition;
   information  = DIA_Jonas_HELLO4_Info;
   permanent	= FALSE;
   description	= "Masz mo�e co� ciekawego na sprzeda�?";
};

FUNC INT DIA_Jonas_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Jonas_HELLO4_15_01"); //Masz mo�e co� ciekawego na sprzeda�?
    AI_Output (self, other ,"DIA_Jonas_HELLO4_03_02"); //Zajmuj� si� g��wnie wycink� drzew. Mog� ci sprzeda� troch� drewna lub nasiona drzew. 
Log_CreateTopic (GE_TraderOW,LOG_NOTE);
    B_LogEntry                     (GE_TraderOW,"Jonas sprzedaje nasiona i drewno.");

};
//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Jonas_HELLO5 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 5;
   condition    = DIA_Jonas_HELLO5_Condition;
   information  = DIA_Jonas_HELLO5_Info;
   permanent	= true;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Jonas_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Jonas_HELLO5_15_01"); //Chc� co� kupi�.
};
//========================================
//-----------------> Wood
//========================================

INSTANCE DIA_Jonas_Wood (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 1;
   condition    = DIA_Jonas_Wood_Condition;
   information  = DIA_Jonas_Wood_Info;
   permanent	= true;
   description	= "Daj mi drewno do ci�cia.";
};

FUNC INT DIA_Jonas_Wood_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO2))
    && (robota1 != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_Wood_Info()
{
    AI_Output (other, self ,"DIA_Jonas_Wood_15_01"); //Daj mi drewno do ci�cia.
    AI_Output (self, other ,"DIA_Jonas_Wood_03_02"); //W porz�dku. Bierz si� do roboty.
    CreateInvItems (self, ItMi_Wood_01, 15);
    B_GiveInvItems (self, other, ItMi_Wood_01, 15);
	robota1 = wld_getday();
};

//========================================
//-----------------> Drewno2
//========================================

INSTANCE DIA_Jonas_Drewno2 (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 2;
   condition    = DIA_Jonas_Drewno2_Condition;
   information  = DIA_Jonas_Drewno2_Info;
   permanent	= true;
   description	= "Poci��em drewno.";
};

FUNC INT DIA_Jonas_Drewno2_Condition()
{
    if (robota1_oddawanie != wld_getday())
    && (Npc_HasItems (other, ItMi_Wood_02) >=15)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_Drewno2_Info()
{
    AI_Output (other, self ,"DIA_Jonas_Drewno2_15_01"); //Poci��em drewno.
    AI_Output (self, other ,"DIA_Jonas_Drewno2_03_02"); //Dobra robota.
    B_GiveInvItems (other, self, ItMi_Wood_02, 15);
	Npc_RemoveInvItems (self, ItMi_Wood_02, 15);
    CreateInvItems (self, ItMiNugget, 45);
    B_GiveInvItems (self, other, ItMiNugget, 45);
    B_GIVEXP (70);
	robota1_oddawanie = wld_getday();
};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Jonas_Halasy (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 1;
   condition    = DIA_Jonas_Halasy_Condition;
   information  = DIA_Jonas_Halasy_Info;
   permanent	= FALSE;
   description	= "Olivier nie b�dzie ju� ha�asowa�.";
};

FUNC INT DIA_Jonas_Halasy_Condition()
{
    if (MIS_MorakhHunting == LOG_SUCCESS)
    && (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Jonas_Halasy_15_01"); //Olivier nie b�dzie ju� ha�asowa�.
    AI_Output (self, other ,"DIA_Jonas_Halasy_03_02"); //S�ysza�em co� o jakiej� bestii. Czy�by�cie wybrali si� na polowanie?
    AI_Output (other, self ,"DIA_Jonas_Halasy_15_03"); //Tak. Bestia zosta�a ubita.
    AI_Output (self, other ,"DIA_Jonas_Halasy_03_04"); //Co, do cholery? Zreszt� nie wa�ne. Dobra robota. 
    AI_Output (self, other ,"DIA_Jonas_Halasy_03_05"); //My�l�, �e moi my�liwi wr�c� do wydajnej pracy. 
    B_LogEntry                     (CH1_Nieroby,"Olivier nie musi ju� polowa� na Besti�, wi�c nie korzysta w nocy z rogu. Noc� w obozie my�liwych zapanuje cisza. ");

    Log_SetTopicStatus       (CH1_Nieroby, LOG_SUCCESS);
    MIS_Nieroby = LOG_SUCCESS;

    B_GiveXP (250);
};
//========================================
//-----------------> PobityOlivier
//========================================

INSTANCE DIA_Jonas_PobityOlivier (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 1;
   condition    = DIA_Jonas_PobityOlivier_Condition;
   information  = DIA_Jonas_PobityOlivier_Info;
   permanent	= FALSE;
   description	= "Olivier nie b�dzie ju� ha�asowa�.";
};

FUNC INT DIA_Jonas_PobityOlivier_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_Wygrales))
    && (MIS_Nieroby == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_PobityOlivier_Info()
{
    AI_Output (other, self ,"DIA_Jonas_PobityOlivier_15_01"); //Olivier nie b�dzie ju� ha�asowa�.
    AI_Output (self, other ,"DIA_Jonas_PobityOlivier_03_02"); //S�ysza�em, �e spu�ci�e� mu niez�e lanie.
    AI_Output (self, other ,"DIA_Jonas_PobityOlivier_03_03"); //Dobra robota. B�dzie troch� spokoju.
    CreateInvItems (self, ItMiNugget, 70);
    B_GiveInvItems (self, other, ItMiNugget, 70);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> WyrzuconyMaruda
//========================================

INSTANCE DIA_Jonas_WyrzuconyMaruda (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 2;
   condition    = DIA_Jonas_WyrzuconyMaruda_Condition;
   information  = DIA_Jonas_WyrzuconyMaruda_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jonas_WyrzuconyMaruda_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_Odejdz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_WyrzuconyMaruda_Info()
{
    AI_Output (self, other ,"DIA_Jonas_WyrzuconyMaruda_03_01"); //Co ty do jasnej cholery zrobi�e�?!
    AI_Output (self, other ,"DIA_Jonas_WyrzuconyMaruda_03_02"); //Odwal si� od moich ludzi! Dosy�, �e pracuj� nie wydajnie to zmniejszasz ich liczb�.
    AI_Output (other, self ,"DIA_Jonas_WyrzuconyMaruda_15_03"); //Ale Alex kaza�...
    AI_Output (self, other ,"DIA_Jonas_WyrzuconyMaruda_03_04"); //W dupie mam to co kaza� Alex. Ja tutaj odpowiadam za rozdzia� obowi�zk�w w�r�d moich ludzi.
    AI_Output (self, other ,"DIA_Jonas_WyrzuconyMaruda_03_05"); //Zrozumia�e�?!
    AI_Output (other, self ,"DIA_Jonas_WyrzuconyMaruda_15_06"); //Tak.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PobityMysliwy
//========================================

INSTANCE DIA_Jonas_PobityMysliwy (C_INFO)
{
   npc          = NON_5611_Jonas;
   nr           = 3;
   condition    = DIA_Jonas_PobityMysliwy_Condition;
   information  = DIA_Jonas_PobityMysliwy_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jonas_PobityMysliwy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jonas_PobityMysliwy_Info()
{
    AI_Output (self, other ,"DIA_Jonas_PobityMysliwy_03_01"); //Pobi�e� mojego pracownika?
    AI_Output (other, self ,"DIA_Jonas_PobityMysliwy_15_02"); //Troszk�...
    AI_Output (self, other ,"DIA_Jonas_PobityMysliwy_03_03"); //Temu marudzie od dawna si� to nale�a�o. Dobra robota. Pozosta�ych nie bij, bo w og�le przestan� pracowa�.
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

