// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Czeœæ! Jestem tu nowy!";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE) && (!Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA)) 
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Czego chcesz?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chcia³bym zostaæ jednym z was - chcê zostaæ cz³onkiem Obozu.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Szukasz ludzi, którzy ciê popr¹, co?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jeœli chcesz, ¿ebym zarekomendowa³ ciê u Diego, musisz coœ dla mnie zrobiæ.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Co mam dla ciebie zrobiæ?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Co mam dla ciebie zrobiæ?
	if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Whistler_FavourRefuse_11_01"); //Najlepiej by by³o jakbyœ sobie st¹d poszed³! Nie chcê mieæ nic wspólnego z ludŸmi Quentina.
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Whistler_FavourRefuse_11_02"); //S³ysza³em, ¿e masz wykonywaæ polecenia Gamala. Nie zawracaj mi wiec g³owy...
	}
	else
	{
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chcê jedn¹ z broni, któr¹ ma na sk³adzie Fisk. To jeden z handlarzy na targowisku.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Ale on nie chce mi jej sprzedaæ. To pewien szczególnie piêknie zdobiony miecz.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Dam ci 100 bry³ek rudy, za które kupisz dla mnie ten miecz. Tylko nie mów mu, ¿e ja ciê przys³a³em.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour, "Dobrze. Daj mi 100 bry³ek, a ja siê wszystkim zajmê."								,DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour, "Przysz³o ci do g³owy, ¿e móg³bym po prostu uciec z twoj¹ rud¹?"	,DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour, "Dlaczego Fisk nie chce ci sprzedaæ tej broni?"									,DIA_Whistler_Favour_WhyNotSell);
	};
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobrze. Daj mi 100 bry³ek, a ja siê wszystkim zajmê.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Masz. Tylko nie marudŸ za d³ugo!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Œwistak pomo¿e mi, jeœli porozmawiam z Fiskiem i kupiê od niego miecz dla Œwistaka. Da³ mi nawet 100 bry³ek rudy.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Przysz³o ci do g³owy, ¿e móg³bym po prostu uciec z twoj¹ rud¹?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nie zapominaj, ¿e to jest niewielka Kolonia. Prêdzej czy póŸniej bym ciê znalaz³!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Dlaczego Fisk nie chce ci sprzedaæ tej broni?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Trochê siê posprzeczaliœmy.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //I?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //I to wszystko, co powinieneœ wiedzieæ!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk ¿¹da teraz 110 bry³ek rudy za ten miecz.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk ¿¹da teraz 110 bry³ek rudy za ten miecz.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //I pewnie mam ci teraz daæ dodatkowe 10 bry³ek...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myœla³em, ¿e zale¿y ci na tym mieczu.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Masz. Tylko siê pospiesz!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Nie mogê zdobyæ tego miecza. Zwracam ci twoj¹ rudê.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nie mogê zdobyæ tego miecza. Zwracam ci twoj¹ rudê.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idioto! Nie potrzebujemy tu takich jak ty! ZejdŸ mi z oczu!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Zawali³em sprawê. Œwistak nigdy ju¿ nie dostanie tego miecza.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ale ja tu nie widzê ¿adnych 100 bry³ek. Radzê ci, ¿eby szybko siê znalaz³y, bo inaczej...
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tu jesteœ! Próbowa³eœ zwiaæ z moj¹ rud¹, co? ChodŸ no tu, ch³opcze!
	
	Whistler_BuyMySword = LOG_FAILED;
	B_LogEntry (CH1_JoinOC,"Zawali³em sprawê. Œwistak nie chce mnie widzieæ na oczy.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Mam dla ciebie miecz...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Mam dla ciebie miecz...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nie by³o zbyt trudne. Tak, czy inaczej - wyœwiadczy³eœ mi przys³ugê, teraz ja wyœwiadczê przys³ugê tobie.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Jeœli Diego zapyta mnie o ciebie, opowiem siê za tob¹. Póki co - trzymaj siê!
	
	B_LogEntry (CH1_JoinOC,"Œwistak ucieszy³ siê, gdy wrêczy³em mu jego miecz. Mogê liczyæ na jego wsparcie u Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Œwistak ucieszy³ siê, gdy wrêczy³em mu jego miecz. Szkoda tylko, ¿e nie mogê ju¿ zostaæ Cieniem.");
	};
	if (Npc_KnowsInfo (hero,DIA_Huno_SellPlan))
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_03"); //Zaczekaj! To ostrze jest jakieœ podejrzane... 
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_04"); //MYŒLISZ, ¯E JESTEM G£UPCEM? ¯E DAM SIÊ OSZUKAÆ?! SK¥D MASZ TÊ BROÑ?!
	AI_Output (other,self,"DIA_Whistler_MySword_Success_11_05"); //Wyku³em j¹ w kuŸni... Plan mia³em od Huno. Zap³aci³em za niego rud¹ od ciebie.
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_06"); //E.. co? Mówisz prawdê? Coœ nie mogê w to uwierzyæ.
	AI_Output (other,self,"DIA_Whistler_MySword_Success_11_07"); //Nie chcesz, to nie wierz. To twoja sprawa.
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_08"); //Jestem pod wra¿eniem...
	B_GIVEXP (100);
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Jak leci...";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS ) && (!Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Jak leci...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Œwietnie! Wyœwiadczy³eœ mi przys³ugê, teraz ja wyœwiadczê przys³ugê tobie. Powiem Diego, ¿e mo¿na na tobie polegaæ.
};

//========================================
//-----------------> WYPAD
//========================================

INSTANCE DIA_Whistler_WYPAD (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 5;
   condition    = DIA_Whistler_WYPAD_Condition;
   information  = DIA_Whistler_WYPAD_Info;
   permanent	= FALSE;
   description	= "Diego coœ od ciebie chcia³...";
};

FUNC INT DIA_Whistler_WYPAD_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_WYPAD_Info()
{
    AI_Output (other, self ,"DIA_Whistler_WYPAD_15_01"); //Diego coœ od ciebie chcia³...
    AI_Output (self, other ,"DIA_Whistler_WYPAD_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Whistler_WYPAD_15_03"); //Nie wiem. IdŸ, szybko.
	Npc_ExchangeRoutine (self,"diegos");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KURFA
//========================================

INSTANCE DIA_Whistler_KURFA (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 6;
   condition    = DIA_Whistler_KURFA_Condition;
   information  = DIA_Whistler_KURFA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Whistler_KURFA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_WYPAD)) && (Npc_GetDistToWP (hero, "BARTH") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_KURFA_Info()
{
    AI_Output (self, other ,"DIA_Whistler_KURFA_03_01"); //Ej, Diego nic ode mnie nie chcia³!
    AI_Output (self, other ,"DIA_Whistler_KURFA_03_02"); //Czemu to mia³o s³u¿yæ?!
    AI_Output (other, self ,"DIA_Whistler_KURFA_15_03"); //Przepraszam. Nie znam jeszcze wszystkich w Obozie. Pewnie pomyli³em ciê z kimœ innym.
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

///**********************************************
INSTANCE DIA_Whistler_Zdrada (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Zdrada_Condition;
	information	= DIA_Whistler_Zdrada_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Pos³uchaj, Mordrag chce was wkopaæ!";
};                       

FUNC INT DIA_Whistler_Zdrada_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Skaza_RAPORT)) && (!Npc_KnowsInfo (hero, DIA_Bartholo_DOWODY)) && (Kapitel == 10) 
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_Zdrada_Info()
{
	AI_Output (other,self,"DIA_Whistler_Zdrada_15_00"); //Pos³uchaj, Mordrag chce was wkopaæ!
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_01"); //Co?!
	AI_Output (other,self,"DIA_Whistler_Zdrada_15_02"); //Mordrag kaza³ mi znaleŸæ na was dowody! Chce siê was pozbyæ z Obozu!
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_03"); //Niby sk¹d o tym wiesz?
	AI_Output (other,self,"DIA_Whistler_Zdrada_11_04"); //Powiedzia³ mi o tym. Chcia³em zostaæ Bandyt¹.
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_05"); //I teraz nagle nie chcesz?
	AI_Output (other,self,"DIA_Whistler_Zdrada_11_06"); //Wolê zostaæ Cieniem. I jak dogadamy siê?
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_07"); //Podoba mi siê twoje podejœcie. Pomogê ci dostaæ siê do Obozu.
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_08"); //Musisz tylko zrobiæ jeszcze dwie rzeczy.
	AI_Output (other,self,"DIA_Whistler_Zdrada_11_09"); //Co konkretnie?
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_10"); //Najpierw opowiedz mi co dok³adnie wie o mnie Mordrag.
	AI_Output (other,self,"DIA_Whistler_Zdrada_11_11"); //Wie, ¿e okrad³eœ Magnatów. Ponadto powiedzia³, ¿e Z³y zabi³ Neka. By³ œwiadkiem obu waszych operacji.
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_12"); //Cholera! Nie wygl¹da to dobrze. IdŸ do Z³ego i mu o tym opowiedz. Powiedz, ¿e ma za³atwiæ problem z Mordragiem.
	AI_Output (self,other,"DIA_Whistler_Zdrada_11_13"); //Ja przez ten czas zajmê siê twoj¹ opini¹ w Obozie. 
	MIS_KosztemQuentina = LOG_RUNNING;

    Log_CreateTopic            (CH1_KosztemQuentina, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KosztemQuentina, LOG_RUNNING);
    B_LogEntry                     (CH1_KosztemQuentina,"Wyda³em Mordraga w rêce Œwistaka. Kaza³ mi pogadaæ ze Z³ym. Razem mamy siê zaj¹æ Mordragiem podczas, gdy Œwistak zajmie siê moj¹ opini¹ w Obozie.");

    B_GiveXP (100);
	MIS_SpysProblems = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problemy Mordraga! ", 1,-1,"font_new_10_red.tga",2);	
    Log_SetTopicStatus       (CH1_SpysProblems, LOG_FAILED);
    B_LogEntry 	(CH1_SpysProblems,"Wyda³em Mordraga. Zostanê Cieniem.");
	
	MIS_NewsFromSpy = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Raport od Mordraga! ", 1,-1,"font_new_10_red.tga",2);	
	Log_SetTopicStatus       (CH1_NewsFromSpy, LOG_FAILED);
	B_LogEntry      	(CH1_NewsFromSpy,"Porzuci³em Bandytów. Stary Obóz wydaje siê byæ lepszym miejscem dla mnie.");
	
	//BANDITOS_CAMP = LOG_FAILED;
	//PrintScreen	("Anulowano zadanie: Przyjêcie do Obozu Bandytów! ", 1,-1,"font_new_10_red.tga",2);	
	//Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_FAILED);
	//B_LogEntry                     (CH1_BANDITOS_CAMP,"Porzuci³em Bandytów. Stary Obóz wydaje siê byæ lepszym miejscem dla mnie.");
	};
	
	// **************************************************
// 					 Ich bin neu hier 2
// **************************************************

INSTANCE DIA_Whistler_Zdrada2 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Zdrada2_Condition;
	information	= DIA_Whistler_Zdrada2_Info;
	permanent	= 0;
	description = "Pozbyliœmy siê Mordraga!";
};                       

FUNC INT DIA_Whistler_Zdrada2_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE) && (Npc_KnowsInfo (hero, DIA_STT_315_Sly_Sukces))
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_Zdrada2_Info()
{
	AI_Output (other,self,"DIA_Whistler_Zdrada2_15_00"); //Pozbyliœmy siê Mordraga!
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_01"); //Dobra robota. Zaj¹³em siê twoj¹ opini¹ w Obozie. 
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_03"); //Równie¿ Thorus z pewnoœci¹ ciê poprze. 
	AI_Output (other,self,"DIA_Whistler_Zdrada2_11_04"); //Wielkie dziêki.
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_05"); //Nie ma sprawy, ch³opcze. Potrzebujemy takich ludzi. 
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_07"); //IdŸ ju¿. Powodzenia.
	talk_aboutOpinion_OC = true;
    B_LogEntry                     (CH1_KosztemQuentina,"Œwistak za³atwi³ mi dobr¹ opiniê w Obozie. Pora iœæ do Diego i Thorusa.");
    B_GiveXP (150);
	};
	
//========================================
//-----------------> WYNOCHA
//========================================

INSTANCE DIA_Whistler_WYNOCHA (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_WYNOCHA_Condition;
   information  = DIA_Whistler_WYNOCHA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Whistler_WYNOCHA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_ZDRADA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_WYNOCHA_Info()
{
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_01"); //Ty pod³y sukinsynu!
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_02"); //Przez ciebie ca³y Obóz ju¿ mnie zwietrzy³.
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_03"); //Ca³e szczêœcie, ¿e moje wp³ywy mnie ocali³y.
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_04"); //Mo¿esz zapomnieæ o jakimkolwiek handlowaniu ze mn¹! Jeszcze ciê urz¹dzê! 
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_05"); //A teraz zejdŸ mi z oczu.
};
	//========================================
//-----------------> FrinSprawa
//========================================

INSTANCE DIA_Whistler_FrinSprawa (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_FrinSprawa_Condition;
   information  = DIA_Whistler_FrinSprawa_Info;
   permanent	= FALSE;
   description	= "Firn pyta co u ciebie.";
};

FUNC INT DIA_Whistler_FrinSprawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_HELLO6))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_FrinSprawa_Info()
{
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_01"); //Firn pyta co u ciebie.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_02"); //Co? Kto? Ehh... To niedobrze.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_03"); //Co siê dzieje?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_04"); //Od dwóch tygodni nie mia³em wieœci od moich szwaczy.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_05"); //Nie wiem czy potrzebuj¹ nowych futer.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_06"); //Masz nielegaln¹ szwalnie?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_07"); //Sk¹d wiesz, ¿e nielegaln¹?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_08"); //A zreszt¹ niewa¿ne. 
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_09"); //IdŸ do nich i sprawdŸ jak robota.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_10"); //No dobra, a gdzie jest ta ca³a szwalnia?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_11"); //W jaskini w œrodku lasu. Co kilka dni przechodz¹ obok niej konwoje z rud¹ z kopalni.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_12"); //Sprawdzê co siê tam dzieje.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_13"); //Powodzenia.
    B_LogEntry                     (CH1_SprawaFirna,"Czeka mnie wizyta w prowizorycznej szwalni. Ponoæ znajduje siê w jaskini w œrodku lasu.");
	Wld_InsertNpc				(VLK_5607_Szwacz,"OC1");	
	B_killnpc (VLK_5607_Szwacz);
	Wld_InsertNpc				(VLK_5604_Szwacz,"OC1");	
	B_killnpc (VLK_5604_Szwacz); //1.25
};
//========================================
//-----------------> GoToSzwalnia
//========================================

INSTANCE DIA_Whistler_GoToSzwalnia (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_GoToSzwalnia_Condition;
   information  = DIA_Whistler_GoToSzwalnia_Info;
   permanent	= FALSE;
   description	= "By³em w szwalni.";
};

FUNC INT DIA_Whistler_GoToSzwalnia_Condition()
{
    if (Npc_HasItems (other, ItMi_SzwaczNote) >=1)
    && (MIS_SprawaFirna == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_GoToSzwalnia_Info()
{
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_01"); //By³em w szwalni.
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_02"); //Twoi robotnicy zostali zabici przez wilki. 
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_03"); //Raczej nici z pancerzy i ubrañ.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_04"); //Cholera. Zawsze musi siê coœ spieprzyæ.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_05"); //No dobra. Potrzebujê dwóch nowych robotników.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_06"); //Postaraj siê coœ skombinowaæ.
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_07"); //A niby dlaczego ja?
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_08"); //Dobra. WeŸ te kilka bry³ek za fatygê.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_09"); //Reszta jak bêdê mia³ ludzi.
    B_LogEntry                     (CH1_SprawaFirna,"Mam znaleŸæ dwóch nowych robotników do szwalni. ");

    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RobotnicyNowi
//========================================

INSTANCE DIA_Whistler_RobotnicyNowi (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_RobotnicyNowi_Condition;
   information  = DIA_Whistler_RobotnicyNowi_Info;
   permanent	= FALSE;
   description	= "Mam dwóch nowych pracowników!";
};

FUNC INT DIA_Whistler_RobotnicyNowi_Condition()
{
    if (RobotnicyWhistlera >= 2)
    && (Npc_KnowsInfo (hero, DIA_Whistler_GoToSzwalnia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_RobotnicyNowi_Info()
{
    AI_Output (other, self ,"DIA_Whistler_RobotnicyNowi_15_01"); //Mam dwóch nowych pracowników!
    AI_Output (self, other ,"DIA_Whistler_RobotnicyNowi_03_02"); //Œwietnie. IdŸ do tego swojego myœliwego i powiedz, ¿e spotykamy siê w umówionym miejscu.
    AI_Output (other, self ,"DIA_Whistler_RobotnicyNowi_15_03"); //Dobra. Zrobiê to, ale obieca³eœ mi jak¹œ rudê.
    AI_Output (self, other ,"DIA_Whistler_RobotnicyNowi_03_04"); //Ach tak. Trzymaj.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry                     (CH1_SprawaFirna,"Pora powiadomiæ Firna o spotkaniu. ");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OfertaMila
//========================================

INSTANCE DIA_Whistler_OfertaMila (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_OfertaMila_Condition;
   information  = DIA_Whistler_OfertaMila_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie ofertê.";
};

FUNC INT DIA_Whistler_OfertaMila_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mil_PlaszczOK))
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
	&& (!Npc_KnowsInfo (hero, DIA_Gravo_GiveItemPlaszcz)) 
	&& (oferta_fiska == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_OfertaMila_Info()
{
    AI_Output (other, self ,"DIA_Whistler_OfertaMila_15_01"); //Mam dla ciebie ofertê.
    AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_02"); //Co chcesz mi zaproponowaæ?
    AI_Output (other, self ,"DIA_Whistler_OfertaMila_15_03"); //Mam tutaj cenny p³aszcz ze skóry bia³ego wilka. Ten p³aszcz musi trafiæ w rêce Blizny.
    AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_04"); //Magnaci chêtnie kupuj¹ takie rzeczy, ale wyczuwam tu jakiœ przekrêt.
    if (Npc_KnowsInfo (hero, DIA_Whistler_WYNOCHA))
    {
        AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_05"); //Dziwiê siê, ¿e masz czelnoœæ prosiæ mnie o coœ takiego po tym co zrobi³eœ.
        AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_06"); //Nie rób takiej zdziwionej miny. Wci¹¿ pamiêtam jak zniszczy³eœ mój interes.
        AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_07"); //Wynoœ siê st¹d z tym swoim zapchlonym futrem!
        AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_08"); //A co mi tam! Zaryzykujê. 
        if (Npc_KnowsInfo (hero, DIA_Whistler_RobotnicyNowi))
        {
            AI_Output (self, hero ,"DIA_Whistler_OfertaMila_03_09"); //Pomog³eœ mi wznowiæ pracê w mojej szwalni. Mogê ci zaoferowaæ 350 bry³ek rudy za ten p³aszcz. Dodatkowo gwarancja, ¿e dostanie go Blizna.
            AI_Output (other, self ,"DIA_Whistler_OfertaMila_15_10"); //To œwietna oferta. 
        }
        else
        {
            AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_11"); //Jak dla ciebie 450 bry³ek rudy. Do tego gwarancja, ¿e p³aszcz dostanie Blizna.
        };
        AI_Output (other, self ,"DIA_Whistler_OfertaMila_15_12"); //Dam ci znaæ, gdy bêdê chcia³ ci sprzedaæ p³aszcz.
        AI_Output (self, other ,"DIA_Whistler_OfertaMila_03_13"); //Wiesz, gdzie mnie znaleŸæ.
    };
};

//========================================
//-----------------> SellPlaszcz
//========================================

INSTANCE DIA_Whistler_SellPlaszcz (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 2;
   condition    = DIA_Whistler_SellPlaszcz_Condition;
   information  = DIA_Whistler_SellPlaszcz_Info;
   permanent	= FALSE;
   description	= "Dobra. Bierz ten p³aszcz!";
};

FUNC INT DIA_Whistler_SellPlaszcz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_OfertaMila)) && (!Npc_KnowsInfo (hero, DIA_Whistler_WYNOCHA))
    && (Npc_KnowsInfo (hero, DIA_Mil_PlaszczOK))
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_SellPlaszcz_Info()
{
    AI_Output (other, self ,"DIA_Whistler_SellPlaszcz_15_01"); //Dobra. Bierz ten p³aszcz!
    AI_Output (self, other ,"DIA_Whistler_SellPlaszcz_03_02"); //Mi³o siê robi z tob¹ interesy.
    if (Npc_KnowsInfo (hero, DIA_Whistler_RobotnicyNowi))
    {
        AI_Output (self, other ,"DIA_Whistler_SellPlaszcz_03_03"); //Zgodnie z umow¹ 350 bry³ek rudy.
        CreateInvItems (self, ItMiNugget, 350);
        B_GiveInvItems (self, other, ItMiNugget, 350);
        B_GiveInvItems (other, self, ItMi_PancerzMil, 1);
        B_GIVEXP (300);
    }
    else
    {
        AI_Output (self, other ,"DIA_Whistler_SellPlaszcz_03_04"); //Zgodnie z umow¹ 450 bry³ek rudy.
        CreateInvItems (self, ItMiNugget, 450);
        B_GiveInvItems (self, other, ItMiNugget, 450);
        B_GiveInvItems (other, self, ItMi_PancerzMil, 1);
B_GIVEXP (200); 
   };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> SELL
//========================================

INSTANCE DIA_Whistler_SELL (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_SELL_Condition;
   information  = DIA_Whistler_SELL_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz coœ?";
};

FUNC INT DIA_Whistler_SELL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Whistler_SELL_Info()
{
    AI_Output (other, self ,"DIA_Whistler_SELL_15_01"); //Sprzedajesz coœ?
    AI_Output (self, other ,"DIA_Whistler_SELL_03_02"); //Tak. Mo¿esz u mnie kupiæ solidne spodnie. Moje spodnie s¹ lepsze ni¿ u Fiska. Mam wiêkszy wybór.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Œwistak handluje spodniami. Jego chata jest przy drodze na plac targowy."); 
	
};

//========================================
//-----------------> GACIE
//========================================

instance  Stt_309_Whistler_ARMOR (C_INFO)
{
	npc				= Stt_309_Whistler;
	nr         		= 2;
	condition		= Stt_309_Whistler_ARMOR_Condition;
	information		= Stt_309_Whistler_ARMOR_Info;
	permanent		= true;
	description		= "Chcê kupiæ spodnie."; 
};

FUNC int  Stt_309_Whistler_ARMOR_Condition()
{	
    if (Npc_KnowsInfo (hero, DIA_Whistler_SELL))
    
	{
		return TRUE;
	};

};
FUNC void  Stt_309_Whistler_ARMOR_Info()
{
	AI_Output (other, self,"Stt_309_Whistler_ARMOR_Info_15_01"); //Chcê kupiæ spodnie.
	if  (!Npc_KnowsInfo (hero, DIA_Whistler_WYNOCHA))
    && (!Npc_KnowsInfo (hero, DIA_Whistler_MySword_TooLate))
	{
	AI_Output (self, other,"Stt_309_Whistler_ARMOR_Info_12_02"); //Jasne.
	Info_ClearChoices (Stt_309_Whistler_ARMOR);
	Info_Addchoice (Stt_309_Whistler_ARMOR,DIALOG_BACK,Stt_309_Whistler_ARMOR_BACK);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Spodnie robotnika",500),Stt_309_Whistler_SFB_ARMOR_M);
	//Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Zielone spodnie",VALUE_SFB_ARMOR_L + 120),Stt_309_Whistler_HEREK_ARMOR);
	//Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Niebieskie spodnie",VALUE_SFB_ARMOR_L + 150),Stt_309_Whistler_GRAVO_ARMOR);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Ciemne spodnie",650),Stt_309_Whistler_SFB_ARMOR_DARK);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Spodnie Cienia",1000),Stt_309_Whistler_VLK_ARMOR_H);
	} 
	else
	{
    AI_Output (self, other ,"Stt_309_Whistler_ARMOR_Info_15_03"); //Chyba sobie kpisz. Po tym wszystkim masz czelnoœæ tu przychodziæ?!
    AI_Output (self, other ,"Stt_309_Whistler_ARMOR_Info_15_04"); //WYNOŒ SIÊ!
	Stt_309_Whistler_ARMOR.permanent = false;
	AI_StopProcessInfos	(self);
	B_LogEntry		(GE_TraderOC,"Œwistak najwyraŸniej siê na mnie obrazi³. Nie mogê u niego ju¿ nic kupiæ."); 
	};
};  

func void Stt_309_Whistler_ARMOR_BACK()
{
	Info_ClearChoices (Stt_309_Whistler_ARMOR);
};

func void Stt_309_Whistler_SFB_ARMOR_M()
{
	AI_Output (other, self,"Stt_309_Whistler_SFB_ARMOR_M_Info_15_01"); //Wezmê spodnie robotnika.
	
	if (Npc_HasItems (hero, ItMinugget) >= 500)
	{
		AI_Output		(self,	other,	"Stt_309_Whistler_SFB_ARMOR_M_Info_12_03"); //S¹ twoje!
		B_GiveInvItems	(hero,	self,	ItMinugget, 500);
		CreateInvItem	(self,			SFB_ARMOR_M);
		B_GiveInvItems	(self,	hero,	SFB_ARMOR_M, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,500);
	}
	else
	{
		AI_Output (self, other,"Stt_309_Whistler_SFB_ARMOR_M_Info_12_02"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	};
};

func void Stt_309_Whistler_HEREK_ARMOR()
{
	AI_Output (other, self,"Stt_309_Whistler_HEREK_ARMOR_Info_15_04"); //Wezmê zielone spodnie.
	if (Npc_HasItems (hero, ItMiNugget)>= VALUE_SFB_ARMOR_L + 120)
	{
	AI_Output		(self, other,"Stt_309_Whistler_HEREK_ARMOR_Info_12_06"); //S¹ twoje!
	B_GiveInvItems	(hero, self, ItMinugget, VALUE_SFB_ARMOR_L+120);
	CreateInvItem	(self, HEREK_ARMOR);
	B_GiveInvItems	(self,hero, HEREK_ARMOR, 1);
	
	Npc_RemoveInvItems (self,ItMinugget,VALUE_SFB_ARMOR_L+120);
	}
	else
	{
	AI_Output (self, other,"Stt_309_Whistler_HEREK_ARMOR_Info_12_05"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.		
	};
};

func void Stt_309_Whistler_GRAVO_ARMOR()
{
	AI_Output (other, self,"Stt_309_Whistler_GRAVO_ARMOR_Info_15_07"); //Wezmê niebieskie spodnie.
	if (Npc_HasItems (hero, ItMinugget) >= VALUE_SFB_ARMOR_L + 150)
	{
	AI_Output		(self, other,"Stt_309_Whistler_GRAVO_ARMOR_Info_12_09"); //S¹ twoje!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_SFB_ARMOR_L+150);
		CreateInvItem	(self, GRAVO_ARMOR);
		B_GiveInvItems	(self,hero, GRAVO_ARMOR, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,VALUE_SFB_ARMOR_L+150);
			}
	else
	{
	AI_Output (self, other,"Stt_309_Whistler_GRAVO_ARMOR_Info_12_08"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.	
	};
};

func void Stt_309_Whistler_SFB_ARMOR_DARK()
{
	AI_Output (other, self,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_15_10"); //Wezmê ciemne spodnie.
	if (Npc_HasItems (hero, ItMiNugget)>= 650)
	{
	AI_Output		(self, other,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_12_12"); //S¹ twoje!
		B_GiveInvItems	(hero, self, ItMinugget, 650);
		CreateInvItem	(self, SFB_ARMOR_DARK);
		B_GiveInvItems	(self,hero, SFB_ARMOR_DARK, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,650);
	}
	else
	{
			AI_Output (self, other,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_12_11"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.		
	};
};

func void Stt_309_Whistler_VLK_ARMOR_H()
{
	AI_Output (other, self,"Stt_309_Whistler_VLK_ARMOR_H_Info_15_13"); //Wezmê spodnie Cienia.
	if (Npc_HasItems (hero, ItMiNugget)>= 1000)
	{
		AI_Output		(self, other,"Stt_309_Whistler_VLK_ARMOR_H_Info_12_15"); //S¹ twoje!
		B_GiveInvItems	(hero, self, ItMinugget, 1000);
		CreateInvItem	(self, VLK_ARMOR_H);
		B_GiveInvItems	(self,hero, VLK_ARMOR_H, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,1000);
	}
	else
	{
			AI_Output (self, other,"Stt_309_Whistler_VLK_ARMOR_H_Info_12_14"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	};
};
/*
//========================================
//-----------------> GACIE_FAIL
//========================================

INSTANCE DIA_Whistler_GACIE_FAIL (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 3;
   condition    = DIA_Whistler_GACIE_FAIL_Condition;
   information  = DIA_Whistler_GACIE_FAIL_Info;
   permanent	= FALSE;
   description	= "Chcê kupiæ spodnie.";
};

FUNC INT DIA_Whistler_GACIE_FAIL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_SELL))
    && ((Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA ))
    || (Npc_KnowsInfo (hero, DIA_Whistler_MySword_TooLate)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_GACIE_FAIL_Info()
{
    AI_Output (other, self ,"DIA_Whistler_GACIE_FAIL_15_01"); //Chcê kupiæ spodnie.
    AI_Output (self, other ,"DIA_Whistler_GACIE_FAIL_03_02"); //Chyba sobie kpisz. Po tym wszystkim masz czelnoœæ tu przychodziæ?!
    AI_Output (self, other ,"DIA_Whistler_GACIE_FAIL_03_03"); //WYNOŒ SIÊ!
    
};
*/
