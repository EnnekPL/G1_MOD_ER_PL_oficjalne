//poprawione i sprawdzone - Nocturn

//******************************************
// SPRAWDZONE - GOTHIC1210
//******************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Trip_EXIT(C_INFO)
{
	npc             = GRD_4060_Trip;
	nr              = 999;
	condition	= DIA_Trip_EXIT_Condition;
	information	= DIA_Trip_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Trip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Trip_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloInfos
//========================================

INSTANCE DIA_Trip_HelloInfos (C_INFO)
{
   npc          = GRD_4060_Trip;
   nr           = 1;
   condition    = DIA_Trip_HelloInfos_Condition;
   information  = DIA_Trip_HelloInfos_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Trip_HelloInfos_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Trip_HelloInfos_Info()
{
    AI_Output (other, self ,"DIA_Trip_HelloInfos_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_02"); //Siedz�, troch� pij�. �y�, nie umiera�.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_03"); //Kilka tygodni temu zosta�em Stra�nikiem.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_04"); //Ukrywam si� tu, �eby nikt mnie nie nakry�.
    AI_Output (other, self ,"DIA_Trip_HelloInfos_15_05"); //Nakry�? Na czym?
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_06"); //Na tym, �e nic nie robi�. He he.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_07"); //Wychodz� z karczmy tylko co jaki� czas.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_08"); //Inni Stra�nicy i tak rzadko tu zagl�daj�.
};

//========================================
//-----------------> GoToWork
//========================================

INSTANCE DIA_Trip_GoToWork (C_INFO)
{
   npc          = GRD_4060_Trip;
   nr           = 2;
   condition    = DIA_Trip_GoToWork_Condition;
   information  = DIA_Trip_GoToWork_Info;
   permanent	= FALSE;
   description	= "Pora wzi�� si� do roboty!";
};

FUNC INT DIA_Trip_GoToWork_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_HelloInfos))
    && (Npc_KnowsInfo (hero, DIA_Fletcher_HelloIHelYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Trip_GoToWork_Info()
{
    AI_Output (other, self ,"DIA_Trip_GoToWork_15_01"); //Pora wzi�� si� do roboty!
    AI_Output (self, other ,"DIA_Trip_GoToWork_03_02"); //Donios�e� na mnie?!

    Info_ClearChoices		(DIA_Trip_GoToWork);
    Info_AddChoice		(DIA_Trip_GoToWork, "Nie ja! Szukaj� ci�, wi�c chc� ci pom�c.", DIA_Trip_GoToWork_SzukajaCie);
    Info_AddChoice		(DIA_Trip_GoToWork, "Dosy� twojego nier�bstwa!", DIA_Trip_GoToWork_Dosyc);
};

FUNC VOID DIA_Trip_GoToWork_SzukajaCie()
{
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_01"); //Nie ja! Szukaj� ci�, wi�c chc� ci pom�c.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_02"); //Jak to mnie szukaj�?
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_03"); //My�l�, �e... uciek�e� do Nowego Obozu.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_04"); //O cholera! I co ja teraz zrobi�?
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_05"); //Nie martw si�. Fletcher odst�pi ci stanowisko przy arenie.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_06"); //Bardzo ci dzi�kuj�, przyjacielu.
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_07"); //To drobiazg.
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_08"); //Ale id� ju�, nim si� zorientuj�, �e ca�y czas tu siedzisz.
    B_LogEntry                     (CH1_NewGRDfromArene,"Trip to nier�b z karczmy. Ju� od kilku tygodni dostaje wyp�at� za picie alkoholu w karczmie. Uzna�em, �e jak troch� popracuje za Fletchera, to nic mu si� nie stanie.");

    B_GiveXP (100);

    Npc_ExchangeRoutine (self,"guard");
    Info_ClearChoices		(DIA_Trip_GoToWork);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Trip_GoToWork_Dosyc()
{
    AI_Output (other, self ,"DIA_Trip_GoToWork_Dosyc_15_01"); //Dosy� twojego nier�bstwa!
    AI_Output (self, other ,"DIA_Trip_GoToWork_Dosyc_03_02"); //Ty pod�y zdrajco!
    AI_Output (other, self ,"DIA_Trip_GoToWork_Dosyc_15_03"); //Ruszaj si�, ruszaj! Arena czeka na patrolowanie.
    AI_Output (self, other ,"DIA_Trip_GoToWork_Dosyc_03_04"); //Zobaczysz. Zemszcz� si�!
    B_LogEntry                     (CH1_NewGRDfromArene,"Trip to nier�b z karczmy. Ju� od kilku tygodni dostaje wyp�at� za picie alkoholu w karczmie. Chyba troch� �le to rozegra�em. Zamiast zyska� sojusznika, zyska�em wroga.");
	Npc_ExchangeRoutine (self,"guard");
    B_GiveXP (35);
    Info_ClearChoices		(DIA_Trip_GoToWork);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AboutSpy
//========================================

INSTANCE DIA_Trip_AboutSpy (C_INFO)
{
   npc          = GRD_4060_Trip;
   nr           = 1;
   condition    = DIA_Trip_AboutSpy_Condition;
   information  = DIA_Trip_AboutSpy_Info;
   permanent	= FALSE;
   description	= "Podobno uda�o ci si� znale�� kryj�wk� Bandyt�w.";
};

FUNC INT DIA_Trip_AboutSpy_Condition()
{
    if (MIS_DraxTest == LOG_RUNNING)
    && (Trip_wykryty == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Trip_AboutSpy_Info()
{
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_01"); //Podobno uda�o ci si� znale�� kryj�wk� Bandyt�w.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_02"); //Tak, prawie mi si� uda�o!
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_03"); //By�em kilka krok�w za nimi...
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_04"); //Bandyci jednak udali si� w stron� Kanionu Trolli. Wola�em si� tam nie zbli�a�.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_05"); //Zastanawia mnie tylko, jak te sukinsyny radz� sobie z potworami. Czy�by mieli druida, kt�ry potrafi je oswoi�? 
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_06"); //A mo�e maj� swoje sekretne �cie�ki w�r�d ska� i skradaj� si� tak, �e nic nie jest w stanie ich dostrzec? To doprawdy zagadka...
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_07"); //Wracaj�c do dyskusji... postanowi�em si� wycofa�, mimo i� by�em tak blisko rozwi�zania tej zagadki.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_08"); //Wr�ci�em wi�c do Obozu i zaszy�em si� w mojej ulubionej karczmie.
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_09"); //Kiedy to mia�o miejsce?
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_10"); //Jaki� czas temu, gdy zosta�em �wie�o przyj�ty na Stra�nika.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_11"); //Dosta�em sporo rudy w nagrod�.
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_12"); //Jakie dzia�ania podj�to w tej sprawie?
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_13"); //Tego ci nie powiem. Tajemnica s�u�bowa.
    B_LogEntry                     (CH1_DraxTest,"To Trip prawie zdemaskowa� Bandyt�w. Nie powiedzia� mi jednak nic sensownego.");

    B_GiveXP (125);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WARN_BANDIT
//========================================

INSTANCE DIA_Trip_WARN_BANDIT (C_INFO)
{
   npc          = GRD_4060_Trip;
   nr           = 1;
   condition    = DIA_Trip_WARN_BANDIT_Condition;
   information  = DIA_Trip_WARN_BANDIT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Trip_WARN_BANDIT_Condition()
{
 var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)     {
    return TRUE;
    };
};


FUNC VOID DIA_Trip_WARN_BANDIT_Info()
{
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_01"); //A wi�c to tak! 
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_02"); //Pracujesz dla Bandyt�w!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_03"); //To ty ukrad�e� notatki i map�! Zap�acisz mi za to!
	GRD_4060_Trip.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_4060_Trip,GIL_NONE);
    Info_ClearChoices	(DIA_Trip_WARN_BANDIT);
    Info_AddChoice		(DIA_Trip_WARN_BANDIT, "I tak nic z tym nie zrobisz.", DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE);
    Info_AddChoice		(DIA_Trip_WARN_BANDIT, "Pos�uchaj, nie jestem Bandyt�. ", DIA_Trip_WARN_BANDIT_WYMOWKI);
};

FUNC VOID DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE()
{
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_15_01"); //I tak nic z tym nie zrobisz.
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_03_02"); //Jak to nic?!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_03_03"); //Po�l� ci� do piachu, sukinsynie!
    Info_ClearChoices		(DIA_Trip_WARN_BANDIT);
    AI_StopProcessInfos	(self);
	
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Trip_WARN_BANDIT_WYMOWKI()
{
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_WYMOWKI_15_01"); //Pos�uchaj, nie jestem Bandyt�. 
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_WYMOWKI_15_02"); //Pancerz zdj��em z jednego z tych zbir�w. Nie do��czy�em do �adnego z oboz�w!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_WYMOWKI_03_03"); //I co jeszcze?!
    Info_ClearChoices		(DIA_Trip_WARN_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

