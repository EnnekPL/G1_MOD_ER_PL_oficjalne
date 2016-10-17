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
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_02"); //Siedzê, trochê pijê. ¯yæ, nie umieraæ.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_03"); //Kilka tygodni temu zosta³em Stra¿nikiem.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_04"); //Ukrywam siê tu, ¿eby nikt mnie nie nakry³.
    AI_Output (other, self ,"DIA_Trip_HelloInfos_15_05"); //Nakry³? Na czym?
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_06"); //Na tym, ¿e nic nie robiê. He he.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_07"); //Wychodzê z karczmy tylko co jakiœ czas.
    AI_Output (self, other ,"DIA_Trip_HelloInfos_03_08"); //Inni Stra¿nicy i tak rzadko tu zagl¹daj¹.
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
   description	= "Pora wzi¹æ siê do roboty!";
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
    AI_Output (other, self ,"DIA_Trip_GoToWork_15_01"); //Pora wzi¹æ siê do roboty!
    AI_Output (self, other ,"DIA_Trip_GoToWork_03_02"); //Donios³eœ na mnie?!

    Info_ClearChoices		(DIA_Trip_GoToWork);
    Info_AddChoice		(DIA_Trip_GoToWork, "Nie ja! Szukaj¹ ciê, wiêc chcê ci pomóc.", DIA_Trip_GoToWork_SzukajaCie);
    Info_AddChoice		(DIA_Trip_GoToWork, "Dosyæ twojego nieróbstwa!", DIA_Trip_GoToWork_Dosyc);
};

FUNC VOID DIA_Trip_GoToWork_SzukajaCie()
{
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_01"); //Nie ja! Szukaj¹ ciê, wiêc chcê ci pomóc.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_02"); //Jak to mnie szukaj¹?
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_03"); //Myœl¹, ¿e... uciek³eœ do Nowego Obozu.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_04"); //O cholera! I co ja teraz zrobiê?
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_05"); //Nie martw siê. Fletcher odst¹pi ci stanowisko przy arenie.
    AI_Output (self, other ,"DIA_Trip_GoToWork_SzukajaCie_03_06"); //Bardzo ci dziêkujê, przyjacielu.
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_07"); //To drobiazg.
    AI_Output (other, self ,"DIA_Trip_GoToWork_SzukajaCie_15_08"); //Ale idŸ ju¿, nim siê zorientuj¹, ¿e ca³y czas tu siedzisz.
    B_LogEntry                     (CH1_FletchersReplacement,"Trip to nierób z karczmy. Ju¿ od kilku tygodni dostaje wyp³atê za picie alkoholu w karczmie. Uzna³em, ¿e jak trochê popracuje za Fletchera, to nic mu siê nie stanie.");

    B_GiveXP (100);

    Npc_ExchangeRoutine (self,"guard");
    Info_ClearChoices		(DIA_Trip_GoToWork);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Trip_GoToWork_Dosyc()
{
    AI_Output (other, self ,"DIA_Trip_GoToWork_Dosyc_15_01"); //Dosyæ twojego nieróbstwa!
    AI_Output (self, other ,"DIA_Trip_GoToWork_Dosyc_03_02"); //Ty pod³y zdrajco!
    AI_Output (other, self ,"DIA_Trip_GoToWork_Dosyc_15_03"); //Ruszaj siê, ruszaj! Arena czeka na patrolowanie.
    AI_Output (self, other ,"DIA_Trip_GoToWork_Dosyc_03_04"); //Zobaczysz. Zemszczê siê!
    B_LogEntry                     (CH1_FletchersReplacement,"Trip to nierób z karczmy. Ju¿ od kilku tygodni dostaje wyp³atê za picie alkoholu w karczmie. Chyba trochê Ÿle to rozegra³em. Zamiast zyskaæ sojusznika, zyska³em wroga.");
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
   description	= "Podobno uda³o ci siê znaleŸæ kryjówkê Bandytów.";
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
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_01"); //Podobno uda³o ci siê znaleŸæ kryjówkê Bandytów.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_02"); //Tak, prawie mi siê uda³o!
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_03"); //By³em kilka kroków za nimi...
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_04"); //Bandyci jednak udali siê w stronê Kanionu Trolli. Wola³em siê tam nie zbli¿aæ.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_05"); //Zastanawia mnie tylko, jak te sukinsyny radz¹ sobie z potworami. Czy¿by mieli druida, który potrafi je oswoiæ? 
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_06"); //A mo¿e maj¹ swoje sekretne œcie¿ki wœród ska³ i skradaj¹ siê tak, ¿e nic nie jest w stanie ich dostrzec? To doprawdy zagadka...
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_07"); //Wracaj¹c do dyskusji... postanowi³em siê wycofaæ, mimo i¿ by³em tak blisko rozwi¹zania tej zagadki.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_08"); //Wróci³em wiêc do Obozu i zaszy³em siê w mojej ulubionej karczmie.
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_09"); //Kiedy to mia³o miejsce?
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_10"); //Jakiœ czas temu, gdy zosta³em œwie¿o przyjêty na Stra¿nika.
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_11"); //Dosta³em sporo rudy w nagrodê.
    AI_Output (other, self ,"DIA_Trip_AboutSpy_15_12"); //Jakie dzia³ania podjêto w tej sprawie?
    AI_Output (self, other ,"DIA_Trip_AboutSpy_03_13"); //Tego ci nie powiem. Tajemnica s³u¿bowa.
    B_LogEntry                     (CH1_DraxTest,"To Trip prawie zdemaskowa³ Bandytów. Nie powiedzia³ mi jednak nic sensownego.");

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
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_01"); //A wiêc to tak! 
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_02"); //Pracujesz dla Bandytów!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_03_03"); //To ty ukrad³eœ notatki i mapê! Zap³acisz mi za to!
	GRD_4060_Trip.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_4060_Trip,GIL_NONE);
    Info_ClearChoices	(DIA_Trip_WARN_BANDIT);
    Info_AddChoice		(DIA_Trip_WARN_BANDIT, "I tak nic z tym nie zrobisz.", DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE);
    Info_AddChoice		(DIA_Trip_WARN_BANDIT, "Pos³uchaj, nie jestem Bandyt¹. ", DIA_Trip_WARN_BANDIT_WYMOWKI);
};

FUNC VOID DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE()
{
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_15_01"); //I tak nic z tym nie zrobisz.
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_03_02"); //Jak to nic?!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_PRZYZNAJ_SIE_03_03"); //Poœlê ciê do piachu, sukinsynie!
    Info_ClearChoices		(DIA_Trip_WARN_BANDIT);
    AI_StopProcessInfos	(self);
	
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Trip_WARN_BANDIT_WYMOWKI()
{
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_WYMOWKI_15_01"); //Pos³uchaj, nie jestem Bandyt¹. 
    AI_Output (other, self ,"DIA_Trip_WARN_BANDIT_WYMOWKI_15_02"); //Pancerz zdj¹³em z jednego z tych zbirów. Nie do³¹czy³em do ¿adnego z obozów!
    AI_Output (self, other ,"DIA_Trip_WARN_BANDIT_WYMOWKI_03_03"); //I co jeszcze?!
    Info_ClearChoices		(DIA_Trip_WARN_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

