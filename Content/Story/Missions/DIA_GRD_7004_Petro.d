//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gamal_EXIT(C_INFO)
{
	npc             = GRD_7004_Gamal;
	nr              = 999;
	condition	= DIA_Gamal_EXIT_Condition;
	information	= DIA_Gamal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gamal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gamal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Gamal_WhoYou (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_WhoYou_Condition;
   information  = DIA_Gamal_WhoYou_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Gamal_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Gamal_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_02"); //Odpoczywam od obozowych ha�as�w. Czego chcesz?
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_03"); //Jestem tu nowy.
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_04"); //Jak chcesz znale�� jaka� robot�, to id� do Starego Obozu. Tak, to ta wielka kupa syfu otoczona palisad�, kt�ra znajduje si� za moimi plecami.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_05"); //Lorenzo to wp�ywowy go��, kt�ry za�atwi ci uczciw� prac� w Kopalni. Ja dla niego pracuj� i nie mam czego �a�owa�.
	AI_Output (other, self ,"DIA_Gamal_WhoYou_15_06"); //Nie wygl�dasz mi na g�rnika.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_07"); //Bo nim nie jestem, o�le. Pomagam w innych rzeczach, takich jak chocia�by eskortowanie robotnik�w do Kopalni.
};

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Gamal_GoToMine (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_GoToMine_Condition;
   information  = DIA_Gamal_GoToMine_Info;
   permanent	= FALSE;
   description	= "Mamy i�� do Kopalni.";
};

FUNC INT DIA_Gamal_GoToMine_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_VLK)
	{
    return TRUE;
	};
};


FUNC VOID DIA_Gamal_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Gamal_GoToMine_15_01"); //Mamy i�� do Kopalni.
    AI_Output (self, other ,"DIA_Gamal_GoToMine_03_02"); //Wiem, nie jestem g�uchy. No, za mn�, ofermy! Pora wzi�� si� za machanie kilofem. 
	AI_Output (self, other ,"DIA_Gamal_GoToMine_03_03"); //Jak dojdziemy w jednym kawa�ku to powiem ci co i jak, bo nie wiem czy masz taki g�upi wyraz twarzy od urodzenia czy po prostu nie wiesz, co si� tu dzieje. 
	
    MIS_ToOldMine = LOG_RUNNING; 
    Log_CreateTopic          	(CH1_ToOldMine, LOG_MISSION);
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_RUNNING);
    B_LogEntry               		(CH1_ToOldMine,"Razem z Petro i trzema Kopaczami mam si� uda� do Starej Kopalni. Tam dostan� dalsze instrukcje od Stra�nika.");
	
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyj�cie
    AI_StopProcessInfos	(self);
	
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"tomine");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_517_Buddler,"tomine");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_565_Buddler,"tomine");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
};

//========================================
//-----------------> DOTARLISMY
//========================================

INSTANCE DIA_Gamal_DOTARLISMY (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 3;
   condition    = DIA_Gamal_DOTARLISMY_Condition;
   information  = DIA_Gamal_DOTARLISMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_DOTARLISMY_Condition()
{
    if (MIS_ToOldMine == LOG_RUNNING)
    && (Npc_GetDistToWP (self, "OW_OM_ENTRANCE01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_DOTARLISMY_Info()
{
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_01"); //Jeste�my na miejscu! 
    AI_Output (other, self ,"DIA_Gamal_DOTARLISMY_15_02"); //�wietnie. Co teraz mam zrobi�?
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_03"); //Id� prosto do Kopalni. Mo�esz si� zapozna� z tym obozem jednak nie jest ci to do niczego potrzebne. U Andrewa mo�esz kupi� przydatne graty. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_04"); //Stra�nicy przy wej�ciu nie b�d� ci robi� k�opot�w. Kiedy ju� b�dziesz w Kopalni id� do Iana i z nim si� dalej ugaduj. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_05"); //C�, pozostaje mi �yczy� ci powodzenia. Spr�buj nie zgin�� przy najbli�szej mo�liwej okazji. 
	
    B_LogEntry                     (CH1_ToOldMine,"Petro przyprowadzi� mnie do obozu przed Star� Kopalni�. Pokr�c� si� tu chwil�, a potem schodz� do Kopalni i id� prosto do Iana.");
	MIS_ToOldMine = LOG_SUCCESS; 
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_SUCCESS);
	
    Npc_ExchangeRoutine (self,"camp");
	self.aivar[AIV_PARTYMEMBER] = false;
	self.Npctype = NPCTYPE_MAIN;
	B_SetPermAttitude	(self,	ATT_NEUTRAL);
    B_GiveXP (25);
	 AI_StopProcessInfos	(self);
		
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"camp");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_517_Buddler,"camp");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_565_Buddler,"camp");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = false;
};

/*
//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Gamal_HELLO (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 1;
   condition    = DIA_Gamal_HELLO_Condition;
   information  = DIA_Gamal_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_HELLO_Condition()
{
	if (MIS_DraxTest != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gamal_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_01"); //Hej, ch�opcze!
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_02"); //Dok�d zmierzasz? Do Starego Obozu?
    AI_Output (other, self ,"DIA_Gamal_HELLO_15_03"); //Mo�e...
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_04"); //Widz� b�ysk w twoich oczach.
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_05"); //Chcesz zosta� cz�onkiem Obozu? Mog� ci pom�c.

    Info_ClearChoices		(DIA_Gamal_HELLO);
    Info_AddChoice		(DIA_Gamal_HELLO, "Nie, dzi�ki. Dam sobie rad� sam.", DIA_Gamal_HELLO_NIE);
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    Info_AddChoice		(DIA_Gamal_HELLO, "M�w dalej...", DIA_Gamal_HELLO_OK);
	};
};

FUNC VOID DIA_Gamal_HELLO_NIE()
{
    AI_Output (other, self ,"DIA_Gamal_HELLO_NIE_15_01"); //Nie, dzi�ki. Dam sobie rad� sam.
    AI_Output (self, other ,"DIA_Gamal_HELLO_NIE_03_02"); //Stary Ob�z to najpot�niejszy w�r�d oboz�w.
    AI_Output (self, other ,"DIA_Gamal_HELLO_NIE_03_03"); //Kiedy� zrozumiesz, jaki b��d pope�niasz.
    Info_ClearChoices		(DIA_Gamal_HELLO);
	pogadajgamal = false;
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gamal_HELLO_OK()
{
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_01"); //M�w dalej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_02"); //Ot� mog� ci pom�c dosta� si� do Obozu bez przechodzenia g�upich test�w.
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_03"); //Ech... Nie rozumiem.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_04"); //Zapomnia�em, �e nie zosta�e� wtajemniczony.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_05"); //Zaraz ci wszystko wyja�ni�...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_06"); //Ka�dy, kto chce przy��czy� si� do Starego Obozu, musi wykona� kilka zada�.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_07"); //Zdobycie zaufania w Obozie, specjalny test i tak dalej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_08"); //Ja oferuj� ci zostanie Kopaczem. B�dziesz powoli wspina� si� po drabinie spo�ecznej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_09"); //...a� kt�rego� dnia zostaniesz Cieniem.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_10"); //Co ty na to?
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_11"); //Musi tu by� jaki� haczyk.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_12"); //Jest jedna ma�a rzecz...
	AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_13"); //Jaka?
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_14"); //W�z, albo przew�z. JE�LI ZDECYDUJESZ SI� P�J�� ZE MN�, ZOSTAN� TWOIM OPIEKUNEM, A DIEGO JU� CI NIE POMO�E ZOSTA� CIENIEM.
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_15"); //R�wnie� Cienie nie b�d� ci tak ch�tnie zleca� zada�. Po prostu nie przepadaj� za robotnikami...
	AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_16"); //Czyli mam tyra� pod ziemi� dzie� i noc nie maj�c nic w zamian? Czy jakakolwiek droga awansu b�dzie zablokowana?!
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_17"); //Oczywi�cie, �e NIE! Po prostu jak ju� uda ci si� wyj�� z Kopalni b�dziesz musia� sobie inaczej poradzi�. 
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_18"); //S�ysza�em, �e raz jaki� Kopacz chcia� zosta� Cieniem. Za�atwi� sobie przepustk� do Obozu, porozmawia� z Diego, a ten wys�a� go do Cavalorna. 
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_19"); //Nie wiem, co u niego robi�, ale kilka dni p�niej mia� ju� na sobie str�j Cienia. Tak�e my�l�, �e warto spr�bowa�.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_20"); //Powiedz mi: czy nie lepiej jest pous�ugiwa� troch� Stra�nikom i wykopa� nieco rudy ni� chodzi� nie wiadomo gdzie i obrabia� dup� starym wygom?
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_21"); //Zadania, kt�re zlec� ci Cienie mog� by� �miertelnie niebezpieczne. Przemy�l to!	
    Info_ClearChoices		(DIA_Gamal_HELLO);
	//GoToOM = true;
	pogadajgamal = true; //do dialogu
};

//========================================
//-----------------> WENT
//========================================

INSTANCE DIA_Gamal_WENT (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 2;
   condition    = DIA_Gamal_WENT_Condition;
   information  = DIA_Gamal_WENT_Info;
   permanent	= FALSE;
   description	= "Zaprowad� mnie do Starej Kopalni. (PAMI�TAJ O KONSEKWENCJACH!)";
};

FUNC INT DIA_Gamal_WENT_Condition()
{
    if (pogadajgamal == true)
    && (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_WENT_Info()
{
    AI_Output (other, self ,"DIA_Gamal_WENT_15_01"); //Zaprowad� mnie do Starej Kopalni.
    AI_Output (self, other ,"DIA_Gamal_WENT_03_02"); //Chod� za mn�, tylko uwa�aj na dzikie zwierz�ta!
    AI_Output (self, other ,"DIA_Gamal_WENT_03_03"); //Reszt� wyja�ni� ci na miejscu.
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyj�cie
    AI_StopProcessInfos	(self);
	//logi
    MIS_EasyJoinOC = LOG_RUNNING; //uwaga, ta zmienna blokuje wiele dialog�w
	//wpisy
    Log_CreateTopic          (CH1_EasyJoinOC, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EasyJoinOC, LOG_RUNNING);
    B_LogEntry               (CH1_EasyJoinOC,"Gamal zaproponowa� mi, �e zaprowadzi mnie do Starej Kopalni. Tam dowiem si� jak zosta� Kopaczem i do��czy� do Starego Obozu. Zobacz�, co mnie tam czeka.");
};

// ************************************************************
// 							Gamal = Lehrer
// ************************************************************
	var int Gamal_Merke_STR;
	var int Gamal_Merke_DEX;
	var int log_Gamaltrain;
// ************************************************************

INSTANCE Info_Gamal_Teach(C_INFO)
{
	npc			= GRD_7004_Gamal;
	nr			= 100;
	condition	= Info_Gamal_Teach_Condition;
	information	= Info_Gamal_Teach_Info;
	permanent	= 1;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC INT Info_Gamal_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Gamal_DOTARLISMY) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Gamal_Teach_Info()
{	
	if	(log_Gamaltrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,	"Gamal mo�e mi pom�c w zwi�kszeniu mojej zwinno�ci i si�y.");
		log_Gamaltrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Gamal_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,hero,"Info_Gamal_Teach_11_01"); //Tak. Mog� ci pokaza�, jak zwi�kszy� swoj� si�� lub zr�czno��.
	
	Gamal_Merke_STR = hero.attribute[ATR_STRENGTH];
	Gamal_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
	
	
};

func void Info_Gamal_Teach_BACK()
{
	if (Gamal_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_00"); //Jeste� teraz o wiele silniejszy.
	};
	if (Gamal_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos�ugiwa� si� �ukiem i kusz�.
	};
	AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_02"); //Wr�� nied�ugo. Musisz si� jeszcze wiele nauczy�.
	Info_ClearChoices	(Info_Gamal_Teach);
};

func void Info_Gamal_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};


//========================================
//-----------------> KOPALNIA
//========================================

INSTANCE DIA_Gamal_KOPALNIA (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_KOPALNIA_Condition;
   information  = DIA_Gamal_KOPALNIA_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o Starej Kopalni";
};

FUNC INT DIA_Gamal_KOPALNIA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_KOPALNIA_Info()
{
    AI_Output (other, self ,"DIA_Gamal_KOPALNIA_15_01"); //Opowiedz mi o Starej Kopalni.
    AI_Output (self, other ,"DIA_Gamal_KOPALNIA_03_02"); //To tutaj wydobywana jest magiczna ruda. Pod w�adz� Gomeza znajduj� si� najwi�ksze jej z�o�a w Kolonii.
    AI_Output (other, self ,"DIA_Gamal_KOPALNIA_15_03"); //S� jakie� inne?
    AI_Output (self, other ,"DIA_Gamal_KOPALNIA_03_04"); //Tak. Wolna Kopalnia nale��ca do Mag�w Wody. Rezyduj� w Nowym Obozie.
};

//========================================
//-----------------> PAPU
//========================================

INSTANCE DIA_Gamal_PAPU (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 5;
   condition    = DIA_Gamal_PAPU_Condition;
   information  = DIA_Gamal_PAPU_Info;
   permanent	= FALSE;
   description	= "Gdzie dostan� co� do jedzenia?";
};

FUNC INT DIA_Gamal_PAPU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_PAPU_Info()
{
    AI_Output (other, self ,"DIA_Gamal_PAPU_15_01"); //Gdzie dostan� co� do jedzenia?
    AI_Output (self, other ,"DIA_Gamal_PAPU_03_02"); //Porozmawiaj z naszym obozowym kucharzem.
    AI_Output (self, other ,"DIA_Gamal_PAPU_03_03"); //Stoi tam, przy kotle.
};


*/