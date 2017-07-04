//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Akl_Exit (C_INFO)
{
	npc			= VLK_7011_Kopacz;
	nr			= 999;
	condition	= DIA_Akl_Exit_Condition;
	information	= DIA_Akl_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Akl_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Akl_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info Hello
// **************************************************
INSTANCE DIA_Akl_Hello (C_INFO)
{
	npc				= VLK_7011_Kopacz;
	nr				= 2;
	condition		= DIA_Akl_Hello_Condition;
	information		= DIA_Akl_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czeœæ. Jak leci?";
};

FUNC INT DIA_Akl_Hello_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Akl_Hello_Info()
{
	AI_Output (other,self,"DIA_Akl_Hello_15_00"); //Czeœæ. Jak leci?
	AI_Output (self,other,"DIA_Akl_Hello_09_01"); //Nie mam ci nic ciekawego do powiedzenia, nowy. Odpoczywam, ale wkrótce znowu bêdê musia³ zejœæ do Kopalni.
	AI_Output (self,other,"DIA_Akl_Hello_09_02"); //Przekupi³em Artegora resztk¹ rudy, któr¹ mia³em, tylko po to ¿eby da³ mi jeszcze kilka dni odpoczynku. 
	AI_Output (self,other,"DIA_Akl_Hello_09_03"); //Ale gdy tylko Lorenzo zorganizuje kolejn¹ zmianê, wrócê do wnêtrza tej cholernej góry.
};


// **************************************************
//	Info beer
// **************************************************
INSTANCE DIA_Akl_beer (C_INFO)
{
	npc				= VLK_7011_Kopacz;
	nr				= 2;
	condition		= DIA_Akl_beer_Condition;
	information		= DIA_Akl_beer_Info;
	permanent		= 0;
	important		= 0;
	description		= "Niby odda³eœ wszystko Artegorowi, ale na piwo ciê staæ.";
};

FUNC INT DIA_Akl_beer_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Akl_Hello)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Akl_beer_Info()
{
	AI_Output (other,self,"DIA_Akl_beer_15_00"); //Niby odda³eœ wszystko Artegorowi, ale na piwo ciê staæ. Jak to jest?
	AI_Output (self,other,"DIA_Akl_beer_09_01"); //Uda³o mi siê dorobiæ na boku kilkadziesi¹t bry³ek. Postawi³em nawet ch³opakom po butelce. 
	AI_Output (self,other,"DIA_Akl_beer_09_02"); //W koñcu raz siê ¿yje, nie?
};

// **************************************************
//	Info ore
// **************************************************
INSTANCE DIA_Akl_ore (C_INFO)
{
	npc				= VLK_7011_Kopacz;
	nr				= 2;
	condition		= DIA_Akl_ore_Condition;
	information		= DIA_Akl_ore_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sk¹d mia³eœ rudê?";
};

FUNC INT DIA_Akl_ore_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Akl_beer) && Npc_KnowsInfo(hero, DIA_Josh_Hallo)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Akl_ore_Info()
{
	AI_Output (other,self,"DIA_Akl_ore_15_00"); //Sk¹d mia³eœ rudê?
	AI_Output (self,other,"DIA_Akl_ore_09_01"); //A co ciê to obchodzi?
	
	
	
	Info_ClearChoices	(DIA_Akl_ore);
    Info_AddChoice		(DIA_Akl_ore, "Mój przyjaciel zosta³ okradziony przez jakiegoœ Kopacza.", DIA_Akl_ore_friend);
    Info_AddChoice		(DIA_Akl_ore, "Te¿ chcia³bym dorobiæ.", DIA_Akl_ore_smartboy);
};

func void DIA_Akl_ore_friend ()
{
	AI_Output (other,self,"DIA_Akl_ore_friend_15_00"); //Mój przyjaciel zosta³ okradziony przez jakiegoœ Kopacza. Chcê mu pomóc odzyskaæ rudê.
	AI_Output (self,other,"DIA_Akl_ore_friend_09_01"); //Kopacza? Niemo¿liwe. Wiêkszoœæ z nas ma 'drewniane' rêce od tego ci¹g³ego machania kilofami. 
	AI_Output (self,other,"DIA_Akl_ore_friend_09_02"); //Zero delikatnoœci, nawet do kobiety, a tym bardziej do takie roboty jak kradzie¿. Zastanów siê. Mo¿e twój kumpel siê pomyli³?
	AI_Output (self,other,"DIA_Akl_ore_friend_09_03"); //Stra¿nicy czêsto okradaj¹ kolesi z innych obozów. 
	AI_Output (other,self,"DIA_Akl_ore_friend_15_04"); //Powiedz, sk¹d masz rudê.
	AI_Output (self,other,"DIA_Akl_ore_friend_09_05"); //Od Spike'a. Da³ mi 50 bry³ek rudy za pomoc z noszeniem tych wielkich skrzyñ za namiotem. 
	
	B_LogEntry(CH1_OreInOM,"Z towarzyskiej rozmowy z Kopaczem Aklem dowiedzia³em siê, ¿e wyda³ ostatnio sporo rudy. Przypuszcza³em, ¿e to on znalaz³ sakiewkê Josha i trwoni rudê. Po dalszym przepytaniu stwierdzi³em jednak, ¿e to nie on jest znalazc¹, ale mo¿e mieæ kontakt z kimœ, kto sakiewkê znalaz³.");
	B_LogEntry(CH1_OreInOM,"Blefowa³em i powiedzia³em mu, ¿e mój przyjaciel zosta³ okradziony. Kopacz natychmiast obali³ moje przypuszczenia, ¿e z³odziejem jest któryœ z jego kolegów. Zasugerowa³ ¿eby sprawdzaæ tak¿e Stra¿ników. Co do Ÿród³a, z którego zdoby³ 50 bry³ek rudy na piwa t³umaczy³ siê, ¿e da³ mu je Spike w zamian za pomoc przy skrzyniach.");
	
	Info_ClearChoices	(DIA_Akl_ore);
};

func void DIA_Akl_ore_smartboy ()
{
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_00"); //Te¿ chcia³bym dorobiæ.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_01"); //Wiem o czym mówisz, kolego. Wiêkszoœæ z tutejszych ludzi nic nie posiada i chwyta siê ka¿dej pracy. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_02"); //Tak naprawdê nie zarobi³em tej rudy. Dosta³em j¹ od Hysena. Po prostu widzia³em coœ, czego wiedzieæ nie powinienem.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_03"); //Hysen da³ mi 50 bry³ek rudy, ¿ebym nic nie mówi³ Stra¿nikom.
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_04"); //A co takiego widzia³eœ?
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_05"); //Chyba mogê ci powiedzieæ... Akurat pracowa³em wtedy przy rozdrabniaczu, gdy nagle zauwa¿y³em tego podejrzanego typka. Wybiega³ z Kopalni jakby go sam Beliar goni³.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_06"); //Po drodze upuœci³ jednak doœæ ciê¿k¹ sakiewkê. Pomyœla³em, ¿e zawiera zrabowane narzêdzia, dlatego wola³em jej nie podnosiæ. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_07"); //Te rzeczy pewnie mo¿na by jakoœ sprzedaæ, ale nie wiedzia³bym nawet komu, a kupcy ze Starego Obozu mogliby zorientowaæ siê, ¿e ukrad³em coœ z wnêtrza góry. Nie mia³bym wtedy ³atwego ¿ycia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_08"); //W ka¿dym razie Hysen odwa¿y³ siê i zabra³ sakwê. Zajrza³ do œrodka, chwilê pomyœla³, kiwn¹³ g³ow¹ i powiedzia³, ¿e to narzêdzia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_09"); //Da³ mi 50 bry³ek rudy, ¿ebym milcza³. Ostrzega³em go, ¿e jeœli Stra¿nicy siê zorientuj¹, zabij¹ go. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_10"); //Nie przej¹³ siê tym. Myœlê, ¿e ma jakiegoœ znajomego kupca. Nie obchodzi³o mnie to. Dla mnie jego ³up by³ bezu¿yteczny. 'Niech sobie dorobi' - pomyœla³em. W koñcu i tak zarobi³em.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_11"); //Powiem ci, ¿e szczwana bestia z niego. Ukry³ narzêdzia w lasku przed obozem. Zamkn¹³ je w jakiejœ skrzyni. Skurczybyk, he he.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_12"); //Tylko nie mów nikomu!
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_13"); //Spokojna g³owa. Zale¿y mi na waszym szacunku. 
	
	hero_knows_hysenfinder = true;
	B_GiveXP (50);
	B_LogEntry(CH1_OreInOM,"Od Akla dowiedzia³em siê, ¿e rudê znalaz³ Kopacz Hysen, jednak nie przyzna³ siê swojemu koledze. Akl jest pewny, ¿e w sakwie znajdowa³y siê narzêdzia ukradzione z Kopalni. Mo¿e kiedyœ go uœwiadomiê... W ka¿dym razie skrzynia z rud¹ jest gdzieœ wokó³ obozu. Muszê pogadaæ z Joshem.");
	
	Info_ClearChoices	(DIA_Akl_ore);
};

//========================================
//-----------------> AngryBezio
//========================================

INSTANCE DIA_Kopacz_AngryBezio (C_INFO)
{
   npc          = VLK_7011_Kopacz;
   nr           = 1;
   condition    = DIA_Kopacz_AngryBezio_Condition;
   information  = DIA_Kopacz_AngryBezio_Info;
   permanent	= FALSE;
   description	= "Musimy pogadaæ.";
};

FUNC INT DIA_Kopacz_AngryBezio_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Spike_AklWorker))
    && (hero_knows_hysenfinder == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kopacz_AngryBezio_Info()
{
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_01"); //Musimy pogadaæ.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_03"); //Oszuka³eœ mnie. Spike powiedzia³, ¿e nic nie robisz od kiedy wyszed³eœ z Kopalni.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_04"); //I co z tego?
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_05"); //Pozwól, ¿e grzecznie zapytam: sk¹d mia³eœ rudê? Tylko bez wykrêtów, bo pogadamy inaczej.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_06"); //Cholera, nie chcê k³opotów! Hysen urwie mi ³eb! Niech to szlag!
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_07"); //Hysen? Sk¹d ma rudê? Od niego j¹ masz?
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_08"); //Nie wiem sk¹d ma rudê. Da³ mi 50 bry³ek rudy za milczenie. Myœla³em, ¿e j¹ wykopa³, przysiêgam!
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_09"); //Mów dok³adnie co wiesz. Jak to by³o?
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_10"); //Akurat pracowa³em wtedy przy rozdrabniaczu, gdy nagle zauwa¿y³em tego podejrzanego typka. Wybiega³ z Kopalni jakby go sam Beliar goni³.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_06"); //Po drodze upuœci³ jednak doœæ ciê¿k¹ sakiewkê. Pomyœla³em, ¿e zawiera zrabowane narzêdzia, dlatego wola³em jej nie podnosiæ. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_07"); //Te rzeczy pewnie mo¿na by jakoœ sprzedaæ, ale nie wiedzia³bym nawet komu, a kupcy ze Starego Obozu mogliby zorientowaæ siê, ¿e ukrad³em coœ z wnêtrza góry. Nie mia³bym wtedy ³atwego ¿ycia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_08"); //W ka¿dym razie Hysen odwa¿y³ siê i zabra³ sakwê. Zajrza³ do œrodka, chwilê pomyœla³, kiwn¹³ g³ow¹ i powiedzia³, ¿e to narzêdzia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_09"); //Da³ mi 50 bry³ek rudy ¿ebym milcza³. Ostrzega³em go, ¿e jeœli Stra¿nicy siê zorientuj¹, zabij¹ go. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_10"); //Nie przej¹³ siê tym. Myœlê, ¿e ma jakiegoœ znajomego kupca. Nie obchodzi³o mnie to. Dla mnie jego ³up by³ bezu¿yteczny. 'Niech sobie dorobi' - pomyœla³em. W koñcu i tak zarobi³em.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_11"); //Powiem ci, ¿e szczwana bestia z niego. Ukry³ narzêdzia w lasku przed obozem. Zamkn¹³ je w jakiejœ skrzyni. Skurczybyk, he he.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_11"); //Naprawdê nie wiedzia³em, ¿e jest tam ruda. Myœla³em, ¿e narzêdzia.
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_12"); //Bardzo mi pomog³eœ. 
	hero_knows_hysenfinder = true;
	B_GiveXP (50);
	B_LogEntry(CH1_OreInOM,"W koñcu wydoby³em od Akla informacjê, ¿e to Hysen ma rudê i ukry³ j¹ w skrzyni w lasku nieopodal obozu. Muszê o tym pogadaæ z Joshem.");    
	AI_StopProcessInfos	(self);
};

// **************************************************
//	Watch out
// **************************************************
INSTANCE DIA_Akl_WatchOut (C_INFO)
{
	npc				= VLK_7011_Kopacz;
	nr				= 2;
	condition		= DIA_Akl_WatchOut_Condition;
	information		= DIA_Akl_WatchOut_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Akl_WatchOut_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Claw_MIX_MAX_HEAL) && (Npc_GetDistToWP (hero, "OW_PATH_265") < 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Akl_WatchOut_Info()
{
	
	AI_Output (self,other,"DIA_Akl_WatchOut_09_01"); //Ej ty, uwa¿aj!
};

// **************************************************
//	What are u doing
// **************************************************
INSTANCE DIA_Akl_WhatsWrong (C_INFO)
{
	npc				= VLK_7011_Kopacz;
	nr				= 2;
	condition		= DIA_Akl_WhatsWrong_Condition;
	information		= DIA_Akl_WhatsWrong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Szukasz czegoœ?";
};

FUNC INT DIA_Akl_WhatsWrong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Akl_WatchOut)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Akl_WhatsWrong_Info()
{
	AI_Output (other,self,"DIA_Akl_WhatsWrong_15_00"); //Szukasz czegoœ?
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_01"); //Szukam skarbów.
	AI_Output (other,self,"DIA_Akl_WhatsWrong_15_02"); //Jakich skarbów?
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_03"); //Nie wiem no... Zale¿y co wpadnie w rêce. 
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_04"); //Ostatnio znalaz³em w trawie dziwny napój. Matt odkupi³ go ode mnie za 30 bry³ek rudy.
	
	B_LogEntry                     (CH1_RannyWojownik,"Kopacz Akl znalaz³ niepodal lasu tajemniczy napój i sprzeda³ go Mattowi. To mo¿e byæ mikstura, o której mówi³ mi Claw.");

    B_GiveXP (50);
	
	Npc_ExchangeRoutine (VLK_7011_kopacz,"start");
	
	AI_StopProcessInfos	(self);
};
