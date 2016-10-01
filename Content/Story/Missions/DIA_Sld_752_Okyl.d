
//-------------------- Intro ---------------------------

instance DIA_SLD_752_OKYL_INTRO (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INTRO_CONDITION;
	information		= DIA_SLD_752_OKYL_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_752_OKYL_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 250)
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Nie jesteœ jednym z moich ludzi! Czego tu szukasz?!
};

//-------------------- Exit -----------------------------

instance DIA_SLD_752_OKYL_EXIT (C_INFO)
{
	nr				= 999;
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_EXIT_CONDITION;
	information		= DIA_SLD_752_OKYL_EXIT_INFO;
	important		= 0;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Muszê ju¿ iœæ.
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02"); //To nie zawracaj mi g³owy!
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_752_OKYL_UMSEHEN (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_UMSEHEN_CONDITION;
	information		= DIA_SLD_752_OKYL_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Tylko siê tu trochê rozejrzê.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Tylko siê tu trochê rozejrzê.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Tylko nie próbuj rozrabiaæ w Kotle, bo trafisz do piachu szybciej ni¿ myœlisz.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jesteœ?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kim jesteœ?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jestem Okyl. To ja rozkazujê w Kotle.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³em rzuciæ okiem na kopalniê.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chcia³em rzuciæ okiem na kopalniê.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Och, chcia³eœ sobie zrobiæ ma³y spacer po kopalni, co?
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Widzê, ¿e nie masz pojêcia co siê tutaj dzieje. Nikt nie mo¿e wejœæ do kopalni bez mojego pozwolenia.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//I zapamiêtaj sobie: ktokolwiek wejdzie do stró¿ówki bez mojej zgody, bêdzie martwym cz³owiekiem.
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Udzielisz mi pozwolenia?";
};

FUNC int DIA_SLD_752_OKYL_PERMIT_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_PERMIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Udzielisz mi pozwolenia?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Nawet ciê nie znam. Dlaczego mia³bym ciê wpuœciæ do kopalni?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//A teraz spadaj st¹d, mam du¿o roboty.
	AI_StopProcessInfos (self);
};


//----------------------- Trader -------------------------
var int Log_OkylTrade;
instance DIA_SLD_752_OKYL_TRADE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_TRADE_CONDITION;
	information		= DIA_SLD_752_OKYL_TRADE_INFO;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description 	= "Chcê pohandlowaæ!";
};

FUNC int DIA_SLD_752_OKYL_TRADE_CONDITION()
{
	if (Npc_KnowsInfo(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_TRADE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_TRADE_INFO_15_01");//Chcê pohandlowaæ!
	AI_Output (self, other,"DIA_SLD_752_OKYL_TRADE_INFO_11_02");//Mam tu trochê rzeczy z ostatniej dostawy.
	if (Log_OkylTrade == false)
	{
	Log_OkylTrade = true;
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Okyl handluje ró¿noœciami. Znajdê go w Kotle.");
	};

};

// ************************************************************
// 							Okyl = Lehrer
// ************************************************************
	var int Okyl_Merke_STR;
	var int Okyl_Merke_DEX;
	var int log_Okyltrain;
// ************************************************************

INSTANCE Info_Okyl_Teach(C_INFO)
{
	npc			= SLD_752_OKYL;
	nr			= 100;
	condition	= Info_Okyl_Teach_Condition;
	information	= Info_Okyl_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Info_Okyl_Teach_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_SFB)
	{
		return 1;
	};
};

FUNC VOID Info_Okyl_Teach_Info()
{	
	if	(log_Okyltrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,	"Okyl mo¿e mi pomóc w zwiêkszeniu mojej si³y.");
		log_Okyltrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Okyl_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,hero,"Info_Okyl_Teach_11_01"); //Mogê ci pokazaæ, jak mocniej uderzaæ.
	
	Okyl_Merke_STR = hero.attribute[ATR_STRENGTH];
	Okyl_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
	
	
};

func void Info_Okyl_Teach_BACK()
{
	if (Okyl_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_00"); //Jesteœ teraz o wiele silniejszy.
	};
	if (Okyl_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos³ugiwaæ siê ³ukiem i kusz¹.
	};
	AI_Output(self,hero,"Info_Okyl_Teach_BACK_11_02"); //Wróæ nied³ugo. Musisz siê jeszcze wiele nauczyæ.
	Info_ClearChoices	(Info_Okyl_Teach);
};

func void Info_Okyl_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};

func void Info_Okyl_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Okyl_Teach);
	Info_AddChoice		(Info_Okyl_Teach,DIALOG_BACK									,Info_Okyl_Teach_BACK);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_5);
	Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Okyl_Teach_STR_1);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_5);
	//Info_AddChoice		(Info_Okyl_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Okyl_Teach_DEX_1);
};


//========================================
//-----------------> KRET
//========================================

INSTANCE DIA_OKYL_KRET (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_KRET_Condition;
   information  = DIA_OKYL_KRET_Info;
   permanent	= FALSE;
   description	= "Jestem Kretem!";
};

FUNC INT DIA_OKYL_KRET_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SFB)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_KRET_Info()
{
    AI_Output (other, self ,"DIA_OKYL_KRET_15_01"); //Jestem Kretem!
    AI_Output (self, other ,"DIA_OKYL_KRET_03_02"); //To bierz kilof i ruszaj siê!
};

//========================================
//-----------------> SZKODA
//========================================

INSTANCE DIA_OKYL_SZKODA (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 2;
   condition    = DIA_OKYL_SZKODA_Condition;
   information  = DIA_OKYL_SZKODA_Info;
   permanent	= FALSE;
   description	= "A co je¿eli chcia³bym byæ Szkodnikiem?";
};

FUNC INT DIA_OKYL_SZKODA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_KRET))
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_SZKODA_Info()
{
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_01"); //A co je¿eli chcia³bym byæ Szkodnikiem?
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_02"); //D³ugo jeszcze bêdziesz zawraca³ mi dupê?
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_03"); //Dopóki nie zlecisz mi jakiegoœ zadania, które wykonam i bêdê móg³ byæ Szkodnikiem.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_04"); //Wrzucili ciê tu, bo w³asna matka ciê nie chcia³a?
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_05"); //Dlaczego mia³aby mnie nie chcieæ?
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_06"); //Bo jesteœ wkurzaj¹cy.
    AI_Output (other, self ,"DIA_OKYL_SZKODA_15_07"); //Dobra. PrzejdŸ do rzeczy.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_08"); //Chcesz byæ Szkodnikiem, tak? 
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_09"); //Ostatnio doniesiono mi, ¿e w górach krêci³ siê jakiœ Cieñ.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_10"); //Mo¿liwe, ¿e Stary Obóz odkry³ tajn¹ œcie¿kê do Kopalni.
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_11"); //Nie podoba mi siê to!
    AI_Output (self, other ,"DIA_OKYL_SZKODA_03_12"); //ZnajdŸ tego Cienia i ucisz raz na zawsze.
	//wpis do questa 
    MIS_OkylQuest = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_2046_Flint,"start");
    Log_CreateTopic          (CH1_OkylQuest, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OkylQuest, LOG_RUNNING);
    B_LogEntry               (CH1_OkylQuest,"Okyl zleci³ mi odnalezienie i pozbycie siê pewnego Cienia. Uwa¿a, ¿e wolnoœæ Kopalni mo¿e byæ zagro¿ona, gdy Stra¿nicy odkryj¹ tajn¹ œcie¿kê. Ciena mam szukaæ w górach, w okolicy Kot³a.");
	//wpis globalny
  	B_LogEntry               (CH1_AwansJakoKret,"Okyl zleci³ mi pozbycie siê Cienia, który wêszy w górach.");
};

//========================================
//-----------------> KillHim
//========================================

INSTANCE DIA_OKYL_KillHim (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_KillHim_Condition;
   information  = DIA_OKYL_KillHim_Info;
   permanent	= FALSE;
   description	= "Zabi³em tego Cienia.";
};

FUNC INT DIA_OKYL_KillHim_Condition()
{
    if (MIS_OkylQuest == LOG_RUNNING)
    && (Npc_IsDead(STT_2046_Flint))
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_KillHim_Info()
{
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_01"); //Zabi³em tego Cienia.
    AI_Output (self, other ,"DIA_OKYL_KillHim_03_02"); //To nie by³o zbyt trudne? Co?
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_03"); //Masz racjê. Koñczy³o mu siê jedzenie.
    AI_Output (other, self ,"DIA_OKYL_KillHim_15_04"); //Czy teraz mogê zostaæ Szkodnikiem?
    AI_Output (self, other ,"DIA_OKYL_KillHim_03_05"); //Trochê zrobi³eœ, ale pewnie bêdziesz musia³ jeszcze trochê popracowaæ dla Laresa.
    B_LogEntry                     (CH1_OkylQuest,"Zabi³em Cienia, który zgubi³ siê w górach. Je¿eli nadal interesuje mnie bycie Szkodnikiem, to muszê pogadaæ z Laresem.");
    Log_SetTopicStatus       (CH1_OkylQuest, LOG_SUCCESS);
    MIS_OkylQuest = LOG_SUCCESS;
    B_GiveXP (XP_KillFlint);
	B_LogEntry               (CH1_AwansJakoKret,"Wykona³em zlecenie od Okyla. Skoro jestem ju¿ Kretem, mieszkañcy innych Obozów bêd¹ patrzeæ na mnie niechêtnie. Mogê siê jeszcze trochê pokrêciæ w okolicy, ale prêdzej czy póŸniej bêdê musia³ iœæ do Laresa.");
};

//========================================
//-----------------> Lie
//========================================

INSTANCE DIA_OKYL_Lie (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_Lie_Condition;
   information  = DIA_OKYL_Lie_Info;
   permanent	= FALSE;
   description	= "Flint nie ¿yje!";
};

FUNC INT DIA_OKYL_Lie_Condition()
{
    if (MIS_SayOkylFlintDead == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_Lie_Info()
{
    AI_Output (other, self ,"DIA_OKYL_Lie_15_01"); //Flint nie ¿yje!
    AI_Output (self, other ,"DIA_OKYL_Lie_03_02"); //Co? Jaki Flint? To jakiœ pirat?
    AI_Output (other, self ,"DIA_OKYL_Lie_15_03"); //Nie. To cz³owiek z gór, którego kaza³eœ mi zabiæ.
    AI_Output (other, self ,"DIA_OKYL_Lie_15_04"); //Wykona³em zadanie.
    if  (Npc_GetTrueGuild (hero) == GIL_GRD) ||  (Npc_GetTrueGuild (hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_OKYL_Lie_03_05"); //Przecie¿ jesteœ cz³onkiem Starego Obozu.
        AI_Output (self, other ,"DIA_OKYL_Lie_03_06"); //Chcesz mnie oszukaæ?
        AI_Output (self, other ,"DIA_OKYL_Lie_03_07"); //Nie tak ³atwo kolego. 
        AI_Output (self, other ,"DIA_OKYL_Lie_03_08"); //Je¿eli myœlisz, ¿e zaniesiesz informacjê o skrócie do Starego Obozu, to siê grubo mylisz. 
        B_LogEntry                     (CH1_SayOkylFlintDead,"Mog³em przyjœæ do Okyla wczeœniej. Zorientowa³ siê, ¿e chce go oszukaæ. Muszê szybko uciekaæ... ");
        Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_FAILED);
        MIS_SayOkylFlintDead = LOG_FAILED;
		PrintScreen	("Anulowano zadanie: Powiedz Okylowi, ¿e Flint nie ¿yje! ", 1,-1,"font_new_10_red.tga",2);	
        AI_StopProcessInfos	(self);
        Npc_SetPermAttitude (self, ATT_HOSTILE);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
PrintScreen	("Anulowano zadanie: Powiedz Okylowi, ¿e Flint nie ¿yje! ", 1,-1,"font_new_10_red.tga",2);	
    }
    else
    {
        AI_Output (self, other ,"DIA_OKYL_Lie_03_09"); //Œwietna robota! Gdyby Stra¿nicy wpadli na ten skrót, by³oby po nas.
        B_LogEntry                     (CH1_SayOkylFlintDead,"Powiedzia³em Okylowi, ¿e Flint nie ¿yje. G³upi Najemnik niczego nie podejrzewa³.");
        Log_SetTopicStatus       (CH1_SayOkylFlintDead, LOG_SUCCESS);
        MIS_SayOkylFlintDead = LOG_SUCCESS;
//PrintScreen	("Wykonano zadanie: Powiedz  Okylowi, ¿e Flint nie ¿yje! ", 1,-1,"FONT_OLD_20_WHITE.TGA",2);
        B_GiveXP (200);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        AI_StopProcessInfos	(self);
    };
};

//========================================
//-----------------> WORK_FIND
//========================================

INSTANCE DIA_OKYL_WORK_FIND (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_WORK_FIND_Condition;
   information  = DIA_OKYL_WORK_FIND_Info;
   permanent	= TRUE;
   description	= "Szukam roboty.";
};

FUNC INT DIA_OKYL_WORK_FIND_Condition()
{
	if (QuestFromOkyl == FALSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_OKYL_WORK_FIND_Info()
{
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_01"); //Szukam roboty.
	if (Npc_GetTrueGuild(hero) != GIL_SLD) || (Npc_GetTrueGuild(hero) != GIL_ORG)
	{
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_02"); //Mam coœ, jednak nie zaufam byle komu w tak wa¿nej sprawie. 
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_03"); //Wróæ, gdy ju¿ zostaniesz jednym z ludzi Laresa lub Lee. Ha ha ha ha...
	AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_04"); //Co ciê tak bawi?
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_05"); //To raczej niemo¿liwe.
	}
	else
	{
	AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_06"); //Jest jedna rzecz...
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_07"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_08"); //IdŸ do obozu myœliwych i powêsz tam trochê. 
    AI_Output (other, self ,"DIA_OKYL_WORK_FIND_15_09"); //Na co konkretnie mam zwróciæ uwagê?
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_10"); //Na dostawy, które maj¹ trafiaæ do naszego obozu. Cyrus ZAWSZE siê spóŸnia o kilka dni. Tyle razy mu powtarza³em, ¿e szybko kurcz¹ nam siê zasoby.
    AI_Output (self, other ,"DIA_OKYL_WORK_FIND_03_11"); //Myœlê, ¿e on coœ kombinuje. SprawdŸ to. 
	
	QuestFromOkyl = TRUE;
	
    MIS_Scams = LOG_RUNNING;

    Log_CreateTopic          (CH1_Scams, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Scams, LOG_RUNNING);
    B_LogEntry               (CH1_Scams,"Dostawy zasobów z obozu myœliwych do Kot³a zawsze siê opóŸniaj¹. Mam ustaliæ dlaczego Cyrus, mimo próœb Okyla przysy³a dostawy póŸniej.");
	
	};
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_OKYL_HELLO1 (C_INFO)
{
   npc          = SLD_752_OKYL;
   nr           = 1;
   condition    = DIA_OKYL_HELLO1_Condition;
   information  = DIA_OKYL_HELLO1_Info;
   permanent	= FALSE;
   description	= "Rozpracowa³em Cyrusa.";
};

FUNC INT DIA_OKYL_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalIsidro_INTERESY))
    && (MIS_Scams == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OKYL_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_01"); //Rozpracowa³em Cyrusa.
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_02"); //I co uda³o ci siê ustaliæ?
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_03"); //Cyrus sprzedaje do Bractwa czêœæ towarów, które obiecuje wam. Myœlê, ¿e sprzedan¹ czêœæ odrabia w kilka dni i dostarcza wam.
    AI_Output (other, self ,"DIA_OKYL_HELLO1_15_04"); //Sprawdza³eœ paczki? Mo¿e dostajecie mniej ni¿ powinniœcie?
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_05"); //Cholera. Nikomu nigdy nie kaza³em sprawdzaæ paczek. Ufa³em temu sukinsynowi.
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_06"); //Ju¿ ja siê zemszczê.
    B_LogEntry                     (CH1_Scams,"Cyrus od miesiêcy oszukiwa³ Okyla dorabiaj¹c sobie na boku. Za przekrêty spotka go kara z rêki Okyla.");
    Log_SetTopicStatus       (CH1_Scams, LOG_SUCCESS);
    MIS_Scams = LOG_SUCCESS;

    B_GiveXP (300);
    AI_Output (self, other ,"DIA_OKYL_HELLO1_03_07"); //Masz tu coœ za pomoc. To niez³a broñ. Zarekwirowa³em jednemu z Kretów.
    AI_StopProcessInfos	(self);
        CreateInvItems (self, Miecz1H11, 1);
    B_GiveInvItems (self, other, Miecz1H11, 1);

};



