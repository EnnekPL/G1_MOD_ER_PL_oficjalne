// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (!Wld_IsTime	(02,00,03,00))
	&& (Kapitel < 4)
	&& (MIS_FingersSeeking != LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Sprzedajê bagienne ziele i ró¿ne wywary z obozu na bagnach. Mo¿e czegoœ potrzebujesz?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Co to jest 'bagienne ziele'?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	if (Kapitel < 4)
	&& (Npc_KnowsInfo (hero,DIA_Dexter_First))
	&& (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	{
	return 1; 
	};
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co to jest "bagienne ziele"?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jesteœ tu nowy, co? Bagienne ziele mo¿na paliæ. To bardzo odprê¿aj¹ce.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Poka¿ mi swoje towary.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	if (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	&& (Kapitel < 4)
	{
	return 1;
	};
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Poka¿ mi swoje towary.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mam tu tylko towar najwy¿szej jakoœci...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC, "Cieñ o imieniu Dexter handluje bagiennym zielem i napojami z Obozu Bractwa.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Chcia³bym do³¹czyæ do Obozu. Chcê zostaæ Cieniem.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK))  && (Kapitel < 4) 
	//&& ((MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chcia³bym do³¹czyæ do Obozu. Chcê zostaæ Cieniem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //O, i szukasz pewnie okazji, ¿eby pokazaæ, na co ciê staæ, tak?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobra - mo¿esz wyœwiadczyæ mi pewn¹ przys³ugê. Jeœli dobrze siê spiszesz, wstawiê siê za tob¹ u Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //O co chodzi?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //W obozie Sekty mieszka mê¿czyzna imieniem Kalom. To wielka szycha - jeden z Guru ca³ej tej pomylonej zgrai.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom jest alchemikiem. Posiada przepis na niezwykle skuteczny napój uzdrawiaj¹cy.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chcia³bym go od niego odkupiæ, wtedy sam móg³bym zacz¹æ produkcjê tego napoju.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ale do Kaloma trudno siê zbli¿yæ, zw³aszcza ludziom z zewn¹trz.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A czego oczekujesz ode mnie?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Te œwiry z Sekty bez przerwy szukaj¹ nowych ludzi. Jesteœ tu nowy, nikt ciê nie zna. Udawaj, ¿e chcesz do nich do³¹czyæ.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom jest jednym z Guru, wiêc to on sprawdza nowych kandydatów. Jeœli uda ci siê z nim spotkaæ, spróbuj zdobyæ dla mnie tê recepturê.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Czy za ni¹ zap³acisz, czy nie - to ju¿ nie moja sprawa.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Dobrze, zobaczê co siê da zrobiæ."						,DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "To nie bêdzie ³atwe. Co bêdê z tego mia³?"	,DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobrze, zobaczê co siê da zrobiæ.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cieñ z targowiska, kaza³ mi odwiedziæ Guru Kaloma w obozie sekty i zdobyæ pewn¹ recepturê.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi³ mi, ¿ebym udawa³ sympatyka Sekty Œni¹cego.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //To nie bêdzie ³atwe. Co bêdê z tego mia³?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Prêdzej czy póŸniej Diego zapyta mnie co o tobie s¹dzê. Zgadnij od czego bêdzie zale¿a³a moja odpowiedŸ.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Mo¿e bêdê mu musia³ zap³aciæ za tê recepturê. Potrzebujê 50 bry³ek rudy."	,DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Mo¿e bêdê mu musia³ zap³aciæ za tê recepturê. Potrzebujê 50 bry³ek rudy jako zaliczkê.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Nie ma mowy.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie ma rudy - nie ma receptury!"	,DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Nie ma rudy - nie ma receptury!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //No dobra, ale o rudzie porozmawiamy jak bêdziesz mia³ recepturê w rêku.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie! Albo zap³acisz mi z góry, albo sam sobie idŸ na bagno."	,DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nie! Albo zap³acisz mi z góry, albo sam sobie idŸ do obozu na bagnie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Jest tu wielu ¿ó³todziobów. Chyba jednak zlecê to zadanie komuœ innemu...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Œwietnie! Zapomnijmy o ca³ej sprawie."	,DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Œwietnie! Zapomnijmy o ca³ej sprawie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Zaraz, powoli! Chcia³em tylko zobaczyæ, jak daleko siê posuniesz... 50 bry³ek to trochê du¿o jak na ¿ó³todzioba, nie s¹dzisz?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To ju¿ lepiej...
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //A niech ciê szlag! Masz tu swoje 50 bry³ek! Tylko nie próbuj mnie wykiwaæ, ma³y!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cieñ z targowiska, kaza³ mi odwiedziæ Guru Kaloma w obozie Sekty i zdobyæ pewn¹ recepturê.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi³ mi, ¿ebym udawa³ sympatyka Sekty Œni¹cego.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 0;
	description	= "Gdzie jest ten ca³y obóz na bagnie?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Gdzie jest ten ca³y obóz na bagnie?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //WyjdŸ z Zewnêtrznego Pierœcienia przez po³udniow¹ bramê, potem skieruj siê na wschód. Najlepiej bêdzie, jak weŸmiesz mapê...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mam tu jedn¹. Kosztuje 50 bry³ek...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Po³udniowa brama to ta przy zawalonej wie¿y, tak?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Dok³adnie.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Obóz Sekty le¿y na wschód od Starego Obozu.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Mam dla ciebie recepturê, o któr¹ prosi³eœ!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mam dla ciebie recepturê, o któr¹ prosi³eœ!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //To œwietnie! Poka¿ j¹!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Znakomicie! Teraz sam bêdê móg³ wytwarzaæ napój uzdrawiaj¹cy.
	if ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Równy z ciebie ch³op! Wspomnê o tobie Diego.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //WeŸ to. To w nagrodê...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by³ pod wra¿eniem. Na pewno wspomni Diego o moich dokonaniach.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by³ pod wra¿eniem, ale co z tego? I tak nie mogê ju¿ zostaæ Cieniem.");
	};
	B_GiveXP (XP_DexterKalom);
	
	}
	else
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //WeŸ to jako swoj¹ nagrodê...
	
	CreateInvItems (other,itminugget,50);
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	};
};

//========================================
//-----------------> Iglica
//========================================

INSTANCE DIA_Dexter_Iglica (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Iglica_Condition;
   information  = DIA_Dexter_Iglica_Info;
   permanent	= FALSE;
   description	= "Potrzebujê roœliny zwanej iglic¹.";
};

FUNC INT DIA_Dexter_Iglica_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_MessengerIngredients))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Iglica_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Iglica_15_01"); //Potrzebujê roœliny zwanej iglic¹.
    AI_Output (self, other ,"DIA_Dexter_Iglica_03_02"); //To dobrze. 
    AI_Output (other, self ,"DIA_Dexter_Iglica_15_03"); //Jestem gotów sporo zap³aciæ. 
    AI_Output (self, other ,"DIA_Dexter_Iglica_03_04"); //Nie w¹tpiê. Spotkaæ t¹ roœlinê u kogokolwiek teraz jest równe z cudem. Musisz poczekaæ kilka miesiêcy.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_05"); //Zatem do zobaczenia.
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_06"); //Tak siê jednak sk³ada, ¿e mam ostatni zasuszony okaz. Bêdzie on kosztowa³ 250 bry³ek rudy i wizytê w Nowym Obozie.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_07"); //Po co?
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_08"); //Dasz moj¹ przesy³kê pewnemu Szkodnikowi z Nowego Obozu imieniem Cipher. 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_09"); //Powiedz mu, ¿e jeœli jeszcze raz przyœle tu kogoœ, kto bêdzie podbiera³ mi klientów to gorzko tego po¿a³uje.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_10"); //Daj tê paczkê. 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_11"); //Trzymaj. Pospiesz siê.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_12"); //Co tak cuchnie?
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_13"); //Gówno. Dos³ownie. 
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_14"); //Ciekawe... Z zewn¹trz wygl¹da jak dostawa skrêtów. Dlaczego sam mu tego nie dostarczysz? 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_15"); //Jeœli chcesz ¿ebyœmy dobili targu, to mu to przeka¿esz. W razie czego zwiewaj szybko. 
	
	B_LogEntry(CH2_MessengerRecall, "To ju¿ robi siê naprawdê durne. Dexter chce, aby dostarczy³ Cipherowi z Nowego Obozu pewn¹ œmierdz¹c¹ przesy³kê. Dopiero wtedy sprzeda mi zio³o za 250 bry³ek rudy.");
	
	CreateInvItems (self, ItMi_FakeJoints, 1);
	B_GiveInvItems (self,other, ItMi_FakeJoints,1);
};

//========================================
//-----------------> Gunwo
//========================================

INSTANCE DIA_Dexter_Gunwo (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Gunwo_Condition;
   information  = DIA_Dexter_Gunwo_Info;
   permanent	= FALSE;
   description	= "Dostarczy³em przesy³kê.";
};

FUNC INT DIA_Dexter_Gunwo_Condition()
{
    if (Npc_KnowsInfo (hero, Org_873_Cipher_Gunwo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Gunwo_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Gunwo_15_01"); //Dostarczy³em przesy³kê.
    AI_Output (self, other ,"DIA_Dexter_Gunwo_03_02"); //Jak ci siê podoba³o zlecenie?
    AI_Output (other, self ,"DIA_Dexter_Gunwo_15_03"); //Gówniane... 
    AI_Output (self, other ,"DIA_Dexter_Gunwo_03_04"); //Ha ha ha... Dobrze powiedziane. 
	AI_Output (other, self ,"DIA_Dexter_Gunwo_15_05"); //Sprzedasz mi wreszcie ten cholerny liœæ?
	AI_Output (self, other ,"DIA_Dexter_Gunwo_03_06"); //Tak, tak. Nawet obni¿ê cenê. 200 bry³ek rudy i jest twoja. 
	
	B_LogEntry(CH2_MessengerRecall, "Dextera tak rozbawi³a moja satyra, ¿e z ³aski swojej obni¿y³ cenê za iglicê o 50 bry³ek rudy. ");
};

//========================================
//-----------------> GivePlant
//========================================

INSTANCE DIA_Dexter_GivePlant (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_GivePlant_Condition;
   information  = DIA_Dexter_GivePlant_Info;
   permanent	= FALSE;
   description	= "Dawaj tê roœlinê.";
};

FUNC INT DIA_Dexter_GivePlant_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_Gunwo)) && (Npc_HasItems ( hero, itminugget ) >= 200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_GivePlant_Info()
{
    AI_Output (other, self ,"DIA_Dexter_GivePlant_15_01"); //Dawaj tê roœlinê.
    AI_Output (self, other ,"DIA_Dexter_GivePlant_03_02"); //Oto ona. 
    AI_Output (other, self ,"DIA_Dexter_GivePlant_15_03"); //Dziêki. 
   
	CreateInvItems (self, ItFo_Plants_Iglica, 1);
	B_GiveInvItems (self,other, ItFo_Plants_Iglica,1);
	
	B_GiveInvItems (hero,self, itminugget,200);
	
	B_LogEntry(CH2_MessengerRecall, "Kupi³em roœlinê. Mogê wracaæ do Bractwa. ");
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> SellElixer
//========================================

INSTANCE DIA_Dexter_SellElixer (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_SellElixer_Condition;
   information  = DIA_Dexter_SellElixer_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wnêtrznoœci pe³zaczy?";
};

FUNC INT DIA_Dexter_SellElixer_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_SellElixer_Info()
{
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_01"); //Sprzedajesz eliksir z wnêtrznoœci pe³zaczy?
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_02"); //Jasne! To nowy towar. Widzê, ¿e jesteœ zainteresowany.
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_03"); //Bardziej mnie interesuje, kto ci go sprzeda³?  
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_04"); //To nie twoja sprawa.
	AI_DrawWeapon (hero);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_05"); //Jak zrobisz jak¹œ burdê, to natychmiast wezwê Stra¿ników i zrobi¹ ci z dupy Nowy Obóz.
    AI_RemoveWeapon (other);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_06"); //Po prostu st¹d spadaj. Chyba, ¿e coœ bierzesz...
	
    B_LogEntry                     (CH3_SellElixer,"Okazuje siê, ¿e Dexter tak¿e ma w swojej ofercie nasz eliksir. Jednak nie uda³o mi siê ustaliæ, od kogo go skupuje.");
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Dexter_Angry (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Angry_Condition;
   information  = DIA_Dexter_Angry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dexter_Angry_Condition()
{
    if (CaineFriend == false)
    && (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Angry_Info()
{
    AI_Output (self, other ,"DIA_Dexter_Angry_03_01"); //Gdzie moja dostawa eliksirów?
    AI_Output (other, self ,"DIA_Dexter_Angry_15_02"); //Ju¿ nigdy jej nie zobaczysz. Mo¿na powiedzieæ, ¿e Caine wstrzyma³ dzia³alnoœæ.
    AI_Output (other, self ,"DIA_Dexter_Angry_15_03"); //Ty sukinsynu! Kiedyœ mi za to zap³acisz.
    AI_Output (self, other ,"DIA_Dexter_Angry_03_04"); //IdŸ precz!
    AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////////
//  CSI: KRYMINALNE ZAGADKI STAREGO OBOZU
/////////////////////////////////////////////////////

//========================================
//-----------------> CSI_SO
//========================================

INSTANCE DIA_Dexter_CSI_SO (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_CSI_SO_Condition;
   information  = DIA_Dexter_CSI_SO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dexter_CSI_SO_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_CSI_SO_Info()
{
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_03_01"); //Dobrze, ¿e ciê widzê! Mamy razem prowadziæ œledztwo zwi¹zane z zaginiêciem R¹czki.
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_15_02"); //Ju¿ rozmawia³em na ten temat z Diego. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_03_03"); //To œwietnie. Od czego zaczynamy? 

    Info_ClearChoices		(DIA_Dexter_CSI_SO);
    Info_AddChoice		(DIA_Dexter_CSI_SO, "Znalaz³eœ coœ w chacie? Jakieœ poszlaki? ", DIA_Dexter_CSI_SO_HUT);
    Info_AddChoice		(DIA_Dexter_CSI_SO, "Kto mo¿e za tym staæ? Czy R¹czka mia³ jakiœ wrogów? ", DIA_Dexter_CSI_SO_MOTYW);
};
var int hero_choice_dexter;
FUNC VOID DIA_Dexter_CSI_SO_HUT()
{
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_HUT_15_01"); //Znalaz³eœ coœ w chacie? Jakieœ poszlaki? 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_02"); //Przyjrza³em siê trochê gratom wewn¹trz. Nic nadzwyczajnego, masa œmieci i trochê kosztownoœci. Jest jednak coœ, co przyku³o moj¹ uwagê. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_03"); //To ma³a, solidnie zabezpieczona skrzynka. Próbowa³em j¹ otworzyæ, ale bez klucza nic nie wskóramy. 
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_HUT_15_04"); //Sk¹d wiesz, ¿e w œrodku nie znajdziemy kolejnych gratów?
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_05"); //Nie przekonamy siê dopóki jej nie otworzymy. 

    B_LogEntry                     (CH2_FingersSeeking,"Dexter znalaz³ w chacie R¹czki ma³¹ solidnie zamkniêt¹ skrzynkê. Muszê spróbowaæ poszukaæ do niej klucza.");
	
	Wld_InsertItem (ItMis_KeyFingers,"OC_MIS_SPAWNKEYFINGERS");
	if hero_choice_dexter == false
	{
	hero_choice_dexter = true;
	}
	else
	{
	Info_ClearChoices		(DIA_Dexter_CSI_SO);
	AI_StopProcessInfos	(self);
	};
};

FUNC VOID DIA_Dexter_CSI_SO_MOTYW()
{
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_MOTYW_15_01"); //Kto mo¿e za tym staæ? Czy R¹czka mia³ jakichœ wrogów? 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_MOTYW_03_02"); //Nie wiem, byæ mo¿e. R¹czka by³ w koñcu z³odziejem. Móg³ komuœ podpaœæ. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_MOTYW_03_03"); //Musia³byœ zapytaæ o to Diego. Dobrze siê znali. 
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_MOTYW_15_04"); //W takim razie pójdê z nim pogadaæ.
	
    B_LogEntry                     (CH2_FingersSeeking,"Nie wiemy, czy R¹czka mia³ jakiœ wrogów. Muszê spytaæ o to Diego, który go dobrze zna.");

	if hero_choice_dexter == false
	{
	hero_choice_dexter = true;
	}
	else
	{
	Info_ClearChoices		(DIA_Dexter_CSI_SO);
	AI_StopProcessInfos	(self);
	};
};

//========================================
//-----------------> FindKey
//========================================

INSTANCE DIA_Dexter_FindKey (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_FindKey_Condition;
   information  = DIA_Dexter_FindKey_Info;
   permanent	= FALSE;
   description	= "Znalaz³em w chacie ten klucz.";
};

FUNC INT DIA_Dexter_FindKey_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING) && (Npc_HasItems(other,ItMis_KeyFingers) >= 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_FindKey_Info()
{
    AI_Output (other, self ,"DIA_Dexter_FindKey_15_01"); //Znalaz³em w chacie ten klucz.
    AI_Output (self, other ,"DIA_Dexter_FindKey_03_02"); //Daj mi go. Powinien pasowaæ. 
	B_GiveInvItems (other,self,itmis_keyfingers,1);
	Npc_removeinvitems (self, itmis_keyfingers,1);
	B_GiveXP (20);
	//#ToDO Dodaæ efekt œciemnienia ekranu  
	
	AI_Output (self, other ,"DIA_Dexter_FindKey_03_03"); //Hmmm... To jakiœ notatnik. Przejrzyj go. Mo¿e znajdziemy tu jakieœ wskazówki. 
	B_GiveInvItems (self,other,ItMis_FingersSecretBook,1);
	
	B_LogEntry                     (CH2_FingersSeeking,"Znalaz³em w chacie znalaz³em klucz, który powinien pasowaæ do skrzynki. Wewn¹trz niej by³ pamiêtnik R¹czki. Muszê go przeczytaæ. Byæ mo¿e znajdê tam coœ, co mnie naprowadzi.");
};

//========================================
//-----------------> ReadBook
//========================================

INSTANCE DIA_Dexter_ReadBook (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_ReadBook_Condition;
   information  = DIA_Dexter_ReadBook_Info;
   permanent	= FALSE;
   description	= "Przeczyta³em notatnik R¹czki.";
};

FUNC INT DIA_Dexter_ReadBook_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING) && (ItemUsed_FingersSecretBook == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_ReadBook_Info()
{
    AI_Output (other, self ,"DIA_Dexter_ReadBook_15_01"); //Przeczyta³em notatnik R¹czki.
    AI_Output (self, other ,"DIA_Dexter_ReadBook_03_02"); //Dowiedzia³eœ siê czegoœ?
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_03"); //R¹czka najprawdopodobniej wybra³ siê do Nowego Obozu okraœæ karczmê Silasa. Tam powinniœmy go szukaæ.
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_04"); //Chcia³ okraœæ karczmê pe³n¹ Szkodników? W takim razie na pewno ju¿ nie ¿yje.
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_05"); //Tego jeszcze nie wiemy. Udam siê do Nowego Obozu i poszukam o nim informacji.
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_06"); //Powodzenia. Ja nie mogê z tob¹ pójœæ. Szkodnicy urwali by mi ³eb. W Nowym Obozie nas nienawidz¹. 
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_07"); //Móg³byœ mi powiedzieæ coœ, czego jeszcze nie wiem? Takie ogólniki niewiele mi pomog¹. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_08"); //S³uchaj, jeœli chcesz znaæ moje zdanie to ta gra jest nie warta œwieczki. Ten kretyn pewnie ju¿ nie ¿yje. Nie ma sensu nadstawiaæ za niego karku. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_09"); //Sam zgotowa³ sobie taki los. Wiedzia³ na co siê porywa.
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_10"); //Diego chce, abym go odnalaz³. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_11"); //Widzê, ¿e ciê nie przekonam. Masz tu 50 bry³ek rudy. Jeœli ktoœ bêdzie chcia³ ciê obiæ, lepiej zap³aæ. Tylko tak mogê ci pomóc.
	
	CreateInvItems (self,itminugget,50);
	B_GiveInvItems (self,other,itminugget,50);
	
	B_LogEntry                     (CH2_FingersSeeking,"Pomoc Dextera w tym momencie siê koñczy. Mój dotychczasowy pomocnik uwa¿a, ¿e R¹czka na pewno nie ¿yje, a pójœcie do Nowego Obozu to samobójstwo. By³em ju¿ kilka razy w Nowym Obozie, wiêc to dla mnie nie pierwszyzna. Wypytam o naszego zaginionego Cienia i wrócê do Diego.");
	
	Npc_ExchangeRoutine (self,"start");
};

//////////////////////////////////////////////
//	Zadanie: Nowe ziele
//////////////////////////////////////////////

//========================================
//-----------------> NovizeJoints
//========================================

INSTANCE DIA_Dexter_NovizeJoints (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_NovizeJoints_Condition;
   information  = DIA_Dexter_NovizeJoints_Info;
   permanent	= FALSE;
   description	= "Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.";
};

FUNC INT DIA_Dexter_NovizeJoints_Condition()
{
    if (MIS_NewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_NovizeJoints_Info()
{
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_02"); //Doprawdy? Nowicjusze? Czy Guru wiedz¹ o tym zielu.
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_03"); //Có¿...
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_04"); //Tak myœla³em. Wspó³pracujê z wysoko po³o¿onymi i szanowanymi cz³onkami Bractwa. Baal Parvez i Baal Taran ci¹gle patrz¹ mi na rêce. 
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_05"); //Nie mam zamiaru ryzykowaæ moich dobrych kontaktów...

    B_LogEntry                     (CH1_NewWeed,"Dexter nie jest zainteresowany naszym towarem. Œciœle wspó³pracuje z innymi Nowicjuszami.");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kapitel4_dialog
//========================================

INSTANCE DIA_Dexter_Kapitel4_dialog (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Kapitel4_dialog_Condition;
   information  = DIA_Dexter_Kapitel4_dialog_Info;
   permanent	= FALSE;
   description	= "Wci¹¿ sprzedajesz bagienne ziele?";
};

FUNC INT DIA_Dexter_Kapitel4_dialog_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Kapitel4_dialog_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_01"); //Wci¹¿ sprzedajesz bagienne ziele?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_02"); //Ju¿ nie. Po tym jak zostali zamordowani Magowie Ognia, urwa³ mi siê kontakt z Bractwem.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_03"); //Straci³em dostawców. Nie mia³em wyboru i musia³em zwin¹æ interes.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_04"); //Teraz jestem zwiadowc¹ Kruka i jego lew¹ rêk¹.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_05"); //Ktoœ jeszcze siê liczy?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_06"); //Bloodwyn, ale jego na razie tu nie ma. Za³atwia porachunki w Obozie.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_07"); //Czym sobie zas³u¿y³eœ na ten zaszczyt?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_08"); //Dobrze siê sprawowa³em. To dziêki moim poradom Kruk zabra³ ze sob¹ Toma. Taki cz³owiek bardzo nam siê przyda.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_09"); //Ponadto szef darzy mnie wielkim zaufaniem.
};

