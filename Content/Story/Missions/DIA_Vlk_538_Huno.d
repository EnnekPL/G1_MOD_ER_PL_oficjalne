// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ 1 
// Dialogi podstawowe
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzê, ¿e znasz siê na swoim fachu.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Widzê, ¿e znasz siê na swoim fachu.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Jeszcze nikt nie mia³ powodu do narzekania.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //I lepiej, ¿eby nikt tego nie robi³! Ka¿dy dureñ potrzebuje miecza, i to w³aœnie ode mnie dostaj¹!
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak d³ugo zajmuje wykucie jednego miecza?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak d³ugo zajmuje wykucie jednego miecza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //To zale¿y. Jeœli chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Oczywiœcie pod warunkiem, ¿e jestem odpowiednio zmotywowany... Finansowo.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Oczywiœcie œwiry pokroju Œwistaka musz¹ czekaæ na swoje cacka nieco d³u¿ej.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Dlaczego? Czy¿by Œwistak za ma³o ci zap³aci³?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Nie, wrêcz przeciwnie. Za swój ostatni miecz da³ mi 150 bry³ek rudy.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywiœcie kosztuje!
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hej, ciekawski z ciebie facet, kolego!
	//B_LogEntry (CH1_JoinOC,"Huno wyrabia miecze dla cz³onków Obozu. Podobno Œwistak zamówi³ u niego specjalne ostrze.");
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak stoisz z prac¹, kowalu?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Jak stoisz z prac¹, kowalu?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //A co ciê to obchodzi?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Byæ mo¿e mam dla ciebie zamówienie.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Czy¿by? A có¿ takiego, jeœli wolno spytaæ?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Jeszcze siê zastanowiê.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Wróæ, jak naprawdê bêdziesz czegoœ potrzebowa³. Póki co - nie zawracaj mi g³owy.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chêtnie spróbowa³bym si³ jako kowal.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)// && (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) == 0) && (Npc_HasItems (hero, ItMiNugget)>=150)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chêtnie spróbowa³bym si³ jako kowal.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Tylko nie wyobra¿aj sobie, ¿e tak ³atwo jest wykuæ solidny miecz!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co powinienem zrobiæ?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potem rozbij j¹ na kowadle.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumiem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Oczywiœcie do tego wszystkiego potrzeba odpowiedniego wyposa¿enia. Móg³bym ci je sprzedaæ, jeœli chcesz.
	//Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	//PrintScreen	("Nowa umiejêtnoœæ: Kowalstwo", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	//B_giveXP (150);
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"U Huno kupiê narzêdzia kowalskie. Znajdê go w Zewnêtrznym Pierœcieniu."); 
	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chcia³bym kupiæ narzêdzia kowalskie!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chcia³bym kupiæ narzêdzia kowalskie!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
	if	(Npc_HasItems(self,Gold01			) < 10)		{	CreateInvItems(self,Gold01,				10);};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ 1 
// Ruda dla Togarda
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
//	Magic Ore
// **************************************************
INSTANCE DIA_Huno_FakeMagicOre (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_FakeMagicOre_Condition;
	information		= DIA_Huno_FakeMagicOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebujê czegoœ, co przypomina czarn¹ rudê.";
};

FUNC INT DIA_Huno_FakeMagicOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Snaf_LookingForWorkers) && MIS_ZmianaLorenza == LOG_RUNNING
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_FakeMagicOre_Info()
{
	AI_Output (other,self,"DIA_Huno_FakeMagicOre_15_00"); //Potrzebujê czegoœ, co przypomina czarn¹ rudê.
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_01"); //Po co ci coœ takiego?
	AI_Output (other,self,"DIA_Huno_FakeMagicOre_15_02"); //Powiedzmy, ¿e chcê zrobiæ koledze dowcip. Umiesz coœ takiego zrobiæ?
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_03"); //No dobra, bêdê siê musia³ z tym pobawiæ, ale tylko za CZTERDZEIEŒÆI bry³ek rudy, jasne?
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_04"); //A, i jeszcze jedno! Efekt nie bêdzie trwa³y. Po jakimœ czasie wyjdzie na jaw, ¿e to ¿art. Jeœli ten twój kole¿ka zacznie za bardzo d³ubaæ...
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_05"); //... to mo¿e siê dokopaæ do prawdy. Miej to na uwadze. 
	B_LogEntry               (CH1_ZmianaLorenza,"Zapyta³em Huno, czy móg³by stworzyæ coœ co bêdzie przypominaæ czarn¹ rud¹. Zrobi to za czterdzieœci bry³ek rudy. To pozwoli mi przekonaæ Togarda do przy³¹czania siê do organizowanej zmiany do Kopalni.");	
};

// **************************************************
//	Fuck Ore Go Sex
// **************************************************
INSTANCE DIA_Huno_BuyFakeOre (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BuyFakeOre_Condition;
	information		= DIA_Huno_BuyFakeOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przygotuj dla mnie tê imitacjê czarnej rudy.";
};

FUNC INT DIA_Huno_BuyFakeOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_FakeMagicOre) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (hero,itminugget) >= 40
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BuyFakeOre_Info()
{
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_00"); //Przygotuj dla mnie tê imitacjê czarnej rudy.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_01"); //Masz, tylko pamiêtaj to, o czym ci mówi³em.
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_02"); //Dziêki, interesy z tob¹ to przyjemnoœæ.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_03"); //Nie wierzê, ¿e ktoœ w tym miejscu, gdzie ka¿da bry³ka jest na wagê z³ota wydaje 40 sztuk na g³upi dowcip.
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_04"); //Spokojnie, zwróci mi siê.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_05"); //'Zaufaj mi, wiem co robiê' - znam to. Powodzenia.
	B_LogEntry               (CH1_ZmianaLorenza,"Dosta³em od Huno imitacjê czarnej rudy. Muszê j¹ teraz tylko pokazaæ Togardowi.");
	B_GiveInvItems (other, self, itminugget,40);
	CreateInvItems (self,itmi_Fakeblackore,1);
	B_GiveInvItems (self,hero,itmi_Fakeblackore,1);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ 1 
// Wykucie miecza dla Œwistaka (tymczasowo usuniête) #Kowalstwo
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> OstrzeWhistelra
//========================================

INSTANCE DIA_Huno_OstrzeWhistelra (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_OstrzeWhistelra_Condition;
   information  = DIA_Huno_OstrzeWhistelra_Info;
   permanent	= FALSE;
   description	= "Sprzeda³eœ ju¿ ostrze Œwistakowi?";
};

FUNC INT DIA_Huno_OstrzeWhistelra_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_HowLong))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_OstrzeWhistelra_Info()
{
    AI_Output (other, self ,"DIA_Huno_OstrzeWhistelra_15_01"); //Sprzeda³eœ ju¿ ostrze Œwistakowi?
    AI_Output (self, other ,"DIA_Huno_OstrzeWhistelra_03_02"); //Nie. Ostatnio by³ u mnie Fisk i zaproponowa³, ¿e bêdzie moim poœrednikiem. Odda³em mu miecz za 80 bry³ek rudy.
    AI_Output (self, other ,"DIA_Huno_OstrzeWhistelra_03_03"); //W sumie... dlaczego nie? Mam spokój. Dosta³em rudê i nie muszê siê uganiaæ za klientem.
B_LogEntry (CH1_JoinOC,"Huno sprzeda³ ostrze dla Œwistaka Fiskowi.");
};

//========================================
//-----------------> PlanNaMiecz
//========================================

INSTANCE DIA_Huno_PlanNaMiecz (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 2;
   condition    = DIA_Huno_PlanNaMiecz_Condition;
   information  = DIA_Huno_PlanNaMiecz_Info;
   permanent	= FALSE;
   description	= "Czy móg³byœ sprzedaæ plan tego ostrza?";
};

FUNC INT DIA_Huno_PlanNaMiecz_Condition()
{
    if (Whistler_BuyMySword == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Huno_OstrzeWhistelra))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_PlanNaMiecz_Info()
{
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_01"); //Czy móg³byœ sprzedaæ plan tego ostrza?
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_02"); //W sumie nie powinienem tego robiæ. To s¹ moje tajemnice kowalskie. No, ale dla ciebie zrobiê wyj¹tek. 
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_03"); //Za 100 bry³ek rudy sprzedam ci plan. 
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_04"); //Fiskowi sprzeda³eœ miecz za 80 bry³ek...
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_05"); //Ju¿ ci mówi³em, ¿e to s¹ moje tajemnice kowalskie.
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_06"); //Przemyœlê to...
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_07"); //Za dodatkowe 10 bry³ek rudy sprzedam ci kosztownoœci, które s¹ potrzebne do wykucia tego miecza.
    B_LogEntry                     (CH1_JoinOC,"Huno za 100 bry³ek rudy sprzeda mi plan na miecz dla Œwistaka. Za dodatkowe 10 bry³ek dostanê kosztownoœci, które przydadz¹ siê przy produkcji.");
};

//========================================
//-----------------> SellPlan
//========================================

INSTANCE DIA_Huno_SellPlan (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 3;
   condition    = DIA_Huno_SellPlan_Condition;
   information  = DIA_Huno_SellPlan_Info;
   permanent	= FALSE;
   description	= "Sprzedaj mi plan.";
};

FUNC INT DIA_Huno_SellPlan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_PlanNaMiecz))
    && (Whistler_BuyMySword == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_SellPlan_Info()
{
    AI_Output (other, self ,"DIA_Huno_SellPlan_15_01"); //Sprzedaj mi plan.
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
        AI_Output (self, other ,"DIA_Huno_SellPlan_03_02"); //Jasne. Jest twój.
        CreateInvItems (self, WhistlerSwordPlan, 1);
        B_GiveInvItems (self, other, WhistlerSwordPlan, 1);
        B_GiveInvItems (other, self, ItMiNugget, 100);
		DIA_Huno_SellPlan.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Huno_SellPlan_03_03"); //Nie masz rudy.
        DIA_Huno_SellPlan.permanent = true;
    };
};

//========================================
//-----------------> SellGold
//========================================

INSTANCE DIA_Huno_SellGold (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 4;
   condition    = DIA_Huno_SellGold_Condition;
   information  = DIA_Huno_SellGold_Info;
   permanent	= FALSE;
   description	= "Sprzedaj mi kosztownoœci.";
};

FUNC INT DIA_Huno_SellGold_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_PlanNaMiecz))
    && (WhistlerSwordPlan == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_SellGold_Info()
{
    AI_Output (other, self ,"DIA_Huno_SellGold_15_01"); //Sprzedaj mi kosztownoœci.
    if (Npc_HasItems (hero, ItMiNugget)>=10)
    {
        AI_Output (self, other ,"DIA_Huno_SellGold_03_02"); //Masz tu 3 bry³ki z³ota.
        AI_Output (other, self ,"DIA_Huno_SellGold_15_03"); //A to przypadkiem nie mia³y byæ kosztownoœci?
        AI_Output (self, other ,"DIA_Huno_SellGold_03_04"); //Za gotowe ornamenty musia³byœ mi zap³aciæ piêæ razy tyle. Nawet nie wiesz, ile jest roboty z czymœ takim.
        AI_Output (self, other ,"DIA_Huno_SellGold_03_05"); //Nie mówi¹c ju¿ o tym, ¿e zajmuje to cholernie du¿o czasu.
		DIA_Huno_SellGold.permanent = false;
        AI_Output (other, self ,"DIA_Huno_SellGold_15_06"); //Dobra, dobra. Dotar³o.
        B_GiveInvItems (other, self, ItMiNugget, 10);
        CreateInvItems (self, Gold01, 3);
        B_GiveInvItems (self, other, Gold01, 3);
    }
    else
    {
        AI_Output (self, other ,"DIA_Huno_SellGold_03_07"); //Nie masz nawet 10 bry³ek rudy?
		DIA_Huno_SellGold.permanent = true;
    };
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ 1 
// ZADANIE: Nowi palacze
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> JARAJ
//========================================
//edit by Nocturn
INSTANCE DIA_Huno_JARAJ (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_JARAJ_Condition;
   information  = DIA_Huno_JARAJ_Info;
   permanent	= FALSE;
   description	= "Zechcesz zapaliæ?";
};

FUNC INT DIA_Huno_JARAJ_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Npc_HasItems (other, RecruitJoint) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_JARAJ_Info()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_15_01"); //Zechcesz zapaliæ?
    AI_Output (self, other ,"DIA_Huno_JARAJ_03_02"); //Co? Ja... nie. Nie mogê. W przesz³oœci du¿o pali³em. Nie mogê do tego wracaæ.

    Info_ClearChoices		(DIA_Huno_JARAJ);
    Info_AddChoice		(DIA_Huno_JARAJ, "Ca³y dzieñ ciê¿ko pracujesz. Nale¿y ci siê chwila wytchnienia.", DIA_Huno_JARAJ_PRZY_PRACY);
    Info_AddChoice		(DIA_Huno_JARAJ, "Spróbuj, to coœ nowego.", DIA_Huno_JARAJ_Sprobuj);
    Info_AddChoice		(DIA_Huno_JARAJ, "Szkoda. W takim razie dam je komuœ innemu.", DIA_Huno_JARAJ_NIE);
};

FUNC VOID DIA_Huno_JARAJ_PRZY_PRACY()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_01"); //Ca³y dzieñ ciê¿ko pracujesz. Nale¿y ci siê chwila wytchnienia.
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_02"); //Ta przeklêta Kolonia potrafi doprowadziæ cz³owieka do sza³u. 
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_03"); //Lepiej zapal, odstresuj siê... Czym siê przejmowaæ?
    AI_Output (self, other ,"DIA_Huno_JARAJ_PRZY_PRACY_03_04"); //No dobra. Jednego sobie zapalê, ale tylko jednego.
    B_GiveInvItems (other, self, RecruitJoint, 1);
    AI_UseItem (self, RecruitJoint);
    AI_Output (self, other ,"DIA_Huno_JARAJ_PRZY_PRACY_03_05"); //Och... Od razu lepiej.
    B_LogEntry                     (CH1_Druggy,"Da³em Huno zapaliæ jednego skrêta. Wypada³oby teraz daæ mu coœ innego.");
	Npc_ExchangeRoutine			(Vlk_538_Huno,"pali");
	Huno_drugs_level = 1;
    B_GiveXP (100);

    Info_ClearChoices		(DIA_Huno_JARAJ);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huno_JARAJ_Sprobuj()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_Sprobuj_15_01"); //Spróbuj, to coœ nowego.
    AI_Output (self, other ,"DIA_Huno_JARAJ_Sprobuj_03_02"); //Nie. Dziêkujê. 
};

FUNC VOID DIA_Huno_JARAJ_NIE()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_NIE_15_01"); //Szkoda. W takim razie dam je komuœ innemu.
    AI_Output (self, other ,"DIA_Huno_JARAJ_NIE_03_02"); //Tak bêdzie najlepiej.
    B_LogEntry                     (CH1_Druggy,"Nie mog³em tego zrobiæ. Ten cz³owiek wyszed³ z na³ogu i zacz¹³ w Kolonii nowe ¿ycie. Nie mogê mu go zniszczyæ.");
    Info_ClearChoices		(DIA_Huno_JARAJ);
	Huno_drugs_level = 0;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Huno_HELLO2 (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 2;
   condition    = DIA_Huno_HELLO2_Condition;
   information  = DIA_Huno_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jeszcze jednego?";
};

FUNC INT DIA_Huno_HELLO2_Condition()
{
    if (Huno_drugs_level == 1)
    && (Npc_HasItems (other, ItMiJoint_1) >=1)
	 && (!Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Huno_HELLO2_15_01"); //Jeszcze jednego?
    AI_Output (self, other ,"DIA_Huno_HELLO2_03_02"); //A, tak. Chêtnie.
    B_GiveInvItems (other, self, ItMiJoint_1, 1);
    B_LogEntry                     (CH1_Druggy,"Huno z chêci¹ zapali³ drugiego skrêta. ");
    AI_UseItem (self, itmijoint_1);
    AI_StopProcessInfos	(self);
    Huno_drugs_level = 2;
	Huno_drugs_day = wld_getday ();
};

//========================================
//-----------------> DAWAJ_SKRETA
//========================================

INSTANCE DIA_Huno_DAWAJ_SKRETA (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 3;
   condition    = DIA_Huno_DAWAJ_SKRETA_Condition;
   information  = DIA_Huno_DAWAJ_SKRETA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huno_DAWAJ_SKRETA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_HELLO2))
    && (Huno_drugs_day != wld_getday ())
    && (MIS_Druggy == LOG_RUNNING)
    && (!Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA)) && (Huno_drugs_level == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_DAWAJ_SKRETA_Info()
{
    AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_01"); //Daj mi jeszcze jednego Zielonego Nowicjusza. Szybko.
    if (Npc_HasItems (other, ItMiJoint_1) >=1)
    {
        AI_Output (other, self ,"DIA_Huno_DAWAJ_SKRETA_15_02"); //Trzymaj.
        AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_03"); //Dziêki.
        B_GiveInvItems (other, self, ItMiJoint_1, 1);
        AI_UseItem (self, itmijoint_1);
    }
    else
    {
        AI_Output (other, self ,"DIA_Huno_DAWAJ_SKRETA_15_04"); //Ju¿ nic nie mam.
        AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_05"); //Cholera, muszê iœæ do Baal Tarana.
    };
    B_LogEntry                     (CH1_Druggy,"NieŸle. Skrêty Baal Tarana szybko podzia³a³y na Huno. Wróci³ do swoich na³ogów. Coœ czujê, ¿e Ÿle zrobi³em.");
	Huno_drugs_level = 3;
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAGRODA_ZA_UCZCIWOSC
//========================================
//edit by Nocturn

INSTANCE DIA_Huno_NAGRODA_ZA_UCZCIWOSC (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Condition;
   information  = DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_POKABLOWAC_DOBRA_RZECZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Info()
{
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_01"); //Hej! S³ysza³em ju¿ o Baal Taranie i o twojej postawie. Jestem ci bardzo wdziêczny.
    AI_Output (other, self ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_15_02"); //Nie ma sprawy. Zrobi³em to, co by³o s³uszne.
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_03"); //Doceniam to. WeŸ w nagrodê to ostrze. 
    CreateInvItems (self, Miecz1H5, 1);
    B_GiveInvItems (self, other, Miecz1H5, 1);
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_04"); //To miecz horyzontów - wyj¹tkowe ostrze jednorêczne. Jeœli bêdziesz chcia³ siê poduczyæ walki mieczem, to pogadaj ze Scatty'm. 
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_05"); //Tylko pamiêtaj, ¿e on uczy wy³¹cznie cz³onków Starego Obozu. Ta broñ ma naprawdê olbrzymi potencja³. Mo¿esz to wykorzystaæ. 
    AI_Output (other, self ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_15_06"); //Dziêkujê.
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ 4 
// Obóz Kruka
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhatsUpSmith
//========================================

INSTANCE DIA_Huno_WhatsUpSmith (C_INFO)
{
   npc          = VLK_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_WhatsUpSmith_Condition;
   information  = DIA_Huno_WhatsUpSmith_Info;
   permanent	= FALSE;
   description	= "Co s³ychaæ, kowalu?";
};

FUNC INT DIA_Huno_WhatsUpSmith_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_WhatsUpSmith_Info()
{
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_01"); //Co s³ychaæ, kowalu?
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_02"); //Ca³kiem dobrze. Odpoczywam.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_03"); //Nie ma dla mnie nic do roboty odk¹d opuœci³em Stary Obóz.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_04"); //Nie mamy tutaj kuŸni, wiêc na razie zbijam b¹ki.
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_05"); //Dlaczego opuœci³eœ Stary Obóz?
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_06"); //Sam nie wiem. Kruk, gdy odchodzi³ doœæ d³ugo mnie do tego przekonywa³.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_07"); //Mówi³, ¿e po œmierci Magów Ognia Gomez bêdzie wy³adowywa³ z³oœæ na Kopaczach i ¿e w Obozie niepotrzebny jest drugi kowal.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_08"); //Ostatecznie siê zgodzi³em i teraz zastanawiam siê, czy dobrze zrobi³em.
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_09"); //Mo¿e jednak przyjd¹ lepsze czasy.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_10"); //Mam nadzieje.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia³ - 
// Wykuwanie broni
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Huno_CanYouForgeWeapon (C_INFO)
{
   npc          = VLK_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_CanYouForgeWeapon_Condition;
   information  = DIA_Huno_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "Móg³byœ coœ dla mnie wykuæ?";
};

FUNC INT DIA_Huno_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_YouKnowYourJob))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Huno_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Huno_CanYouForgeWeapon_03_02"); //Ja? Nie jestem a¿ tak dobrym kowalem. Mogê wykuæ jakieœ proste bronie. 

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Huno mo¿e wukuæ dla mnie bronie z podstawowych planów kowalskich. Potrzebne bêd¹ sk³adniki i ruda.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Huno_ForgeWeapon (C_INFO)
{
   npc          = VLK_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_ForgeWeapon_Condition;
   information  = DIA_Huno_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie broñ.";
};

FUNC INT DIA_Huno_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_CanYouForgeWeapon))
	&& (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Huno_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Huno_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};

FUNC VOID DIA_Huno_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Huno_ForgeWeapon_Plan1b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 40)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, ItMw_1H_Sword_04);
B_GiveInvItems (self,other,ItMw_1H_Sword_04,1);
//pay
B_GiveInvItems (other,self,itminugget,40);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
		Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
//MIECZ KOWALA
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1h6 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Wolf_01) >= 1) 
 &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, ItAt_Wolf_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H6);
B_GiveInvItems (self,other,Miecz1H6,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1h11 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, Miecz1H11);
B_GiveInvItems (self,other,Miecz1H11,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
//B£YSK NOCY
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1h15 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, Miecz1H15);
B_GiveInvItems (self,other,Miecz1H15,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
//SZEROKI MIECZ
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1h7 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
//D£UGI MIECZ
FUNC VOID DIA_Huno_ForgeWeapon_Plan1c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	/*if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};*/
};
/*
//SZTYLET ZABÓJCY
FUNC VOID DIA_Huno_ForgeWeapon_DaggerOfMurder ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 1) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, ItMw_DaggerOfMurder);
B_GiveInvItems (self,other,ItMw_DaggerOfMurder,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Huno_ForgeWeapon_Rapier ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 2) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,ItAt_Lurker_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItAt_Lurker_01,1);
//give sword
CreateInvItem (self, ItMw_Rapier);
B_GiveInvItems (self,other,ItMw_Rapier,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//PA£ASZ
FUNC VOID DIA_Huno_ForgeWeapon_BanditTrader ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Pr_Wegiel) >= 1) &&(Npc_HasItems (hero,ItAt_Dzik_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,1);
Npc_RemoveInvItems (hero, ItAt_Dzik_01,1);
//give sword
CreateInvItem (self, ItMw_Addon_BanditTrader);
B_GiveInvItems (self,other,ItMw_Addon_BanditTrader,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1H9 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 4) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 3) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2)   &&(Npc_HasItems (hero,Gold01) >= 2) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 4) &&(Npc_HasItems (hero,ItAt_Claws_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,4);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,3);
Npc_RemoveInvItems (hero, Gold01,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,4);
Npc_RemoveInvItems (hero, ItAt_Claws_02,1);
//give sword
CreateInvItem (self, Miecz1H9);
B_GiveInvItems (self,other,Miecz1H9,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
FUNC VOID DIA_Huno_ForgeWeapon_Plan3b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 150)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 6) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 1)   
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,6);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,150);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//ŒWIÊTY MŒCICIEL
FUNC VOID DIA_Huno_ForgeWeapon_Miecz1h8 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 200)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 3) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 1)   
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)  &&(Npc_HasItems (hero,Gold01) >= 1)  &&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,1);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,200);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
FUNC VOID DIA_Huno_ForgeWeapon_Plan3 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 7) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 4) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,7);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,4);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_04);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_04,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
FUNC VOID DIA_Huno_ForgeWeapon_Plan5c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 2)  
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 10)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,10);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_light_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Huno_ForgeWeapon_Plan4b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 2)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Troll_02,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_02);
B_GiveInvItems (self,other,ItMw_2H_Sword_02,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
FUNC VOID DIA_Huno_ForgeWeapon_Plan7b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 8) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 4)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 3)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Swampshark_02) >= 2)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,8);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,3);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Swampshark_02,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_Heavy_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_Heavy_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
FUNC VOID DIA_Huno_ForgeWeapon_Miecz2H5 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3) 
&&(Npc_HasItems (hero,Pr_SztabkaStali) >= 5)   
&&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueHuno) >= 2)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 5)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaStali,5);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueHuno,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,5);
//give sword
CreateInvItem (self, Miecz2H5);
B_GiveInvItems (self,other,Miecz2H5,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"VLK_538_Huno_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huno_ForgeWeapon);
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,DIALOG_BACK,DIA_Huno_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huno_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huno_ForgeWeapon_Miecz2H5);
	};
};*/