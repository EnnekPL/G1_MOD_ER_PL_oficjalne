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
	description		= "Cze��. Jak leci?";
};

FUNC INT DIA_Akl_Hello_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Akl_Hello_Info()
{
	AI_Output (other,self,"DIA_Akl_Hello_15_00"); //Cze��. Jak leci?
	AI_Output (self,other,"DIA_Akl_Hello_09_01"); //Nie mam ci nic ciekawego do powiedzenia, nowy. Odpoczywam, ale wkr�tce znowu b�d� musia� zej�� do Kopalni.
	AI_Output (self,other,"DIA_Akl_Hello_09_02"); //Przekupi�em Artegora resztk� rudy, kt�r� mia�em, tylko po to �eby da� mi jeszcze kilka dni odpoczynku. 
	AI_Output (self,other,"DIA_Akl_Hello_09_03"); //Ale gdy tylko Lorenzo zorganizuje kolejn� zmian�, wr�c� do wn�trza tej cholernej g�ry.
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
	description		= "Niby odda�e� wszystko Artegorowi, ale na piwo ci� sta�.";
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
	AI_Output (other,self,"DIA_Akl_beer_15_00"); //Niby odda�e� wszystko Artegorowi, ale na piwo ci� sta�. Jak to jest?
	AI_Output (self,other,"DIA_Akl_beer_09_01"); //Uda�o mi si� dorobi� na boku kilkadziesi�t bry�ek. Postawi�em nawet ch�opakom po butelce. 
	AI_Output (self,other,"DIA_Akl_beer_09_02"); //W ko�cu raz si� �yje, nie?
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
	description		= "Sk�d mia�e� rud�?";
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
	AI_Output (other,self,"DIA_Akl_ore_15_00"); //Sk�d mia�e� rud�?
	AI_Output (self,other,"DIA_Akl_ore_09_01"); //A co ci� to obchodzi?
	
	
	
	Info_ClearChoices	(DIA_Akl_ore);
    Info_AddChoice		(DIA_Akl_ore, "M�j przyjaciel zosta� okradziony przez jakiego� Kopacza.", DIA_Akl_ore_friend);
    Info_AddChoice		(DIA_Akl_ore, "Te� chcia�bym dorobi�.", DIA_Akl_ore_smartboy);
};

func void DIA_Akl_ore_friend ()
{
	AI_Output (other,self,"DIA_Akl_ore_friend_15_00"); //M�j przyjaciel zosta� okradziony przez jakiego� Kopacza. Chc� mu pom�c odzyska� rud�.
	AI_Output (self,other,"DIA_Akl_ore_friend_09_01"); //Kopacza? Niemo�liwe. Wi�kszo�� z nas ma 'drewniane' r�ce od tego ci�g�ego machania kilofami. 
	AI_Output (self,other,"DIA_Akl_ore_friend_09_02"); //Zero delikatno�ci, nawet do kobiety, a tym bardziej do takie roboty jak kradzie�. Zastan�w si�. Mo�e tw�j kumpel si� pomyli�?
	AI_Output (self,other,"DIA_Akl_ore_friend_09_03"); //Stra�nicy cz�sto okradaj� kolesi z innych oboz�w. 
	AI_Output (other,self,"DIA_Akl_ore_friend_15_04"); //Powiedz, sk�d masz rud�.
	AI_Output (self,other,"DIA_Akl_ore_friend_09_05"); //Od Spike'a. Da� mi 50 bry�ek rudy za pomoc z noszeniem tych wielkich skrzy� za namiotem. 
	
	B_LogEntry(CH1_OreInOM,"Z towarzyskiej rozmowy z Kopaczem Aklem dowiedzia�em si�, �e wyda� ostatnio sporo rudy. Przypuszcza�em, �e to on znalaz� sakiewk� Josha i trwoni rud�. Po dalszym przepytaniu stwierdzi�em jednak, �e to nie on jest znalazc�, ale mo�e mie� kontakt z kim�, kto sakiewk� znalaz�.");
	B_LogEntry(CH1_OreInOM,"Blefowa�em i powiedzia�em mu, �e m�j przyjaciel zosta� okradziony. Kopacz natychmiast obali� moje przypuszczenia, �e z�odziejem jest kt�ry� z jego koleg�w. Zasugerowa� �eby sprawdza� tak�e Stra�nik�w. Co do �r�d�a, z kt�rego zdoby� 50 bry�ek rudy na piwa t�umaczy� si�, �e da� mu je Spike w zamian za pomoc przy skrzyniach.");
	
	Info_ClearChoices	(DIA_Akl_ore);
};

func void DIA_Akl_ore_smartboy ()
{
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_00"); //Te� chcia�bym dorobi�.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_01"); //Wiem o czym m�wisz, kolego. Wi�kszo�� z tutejszych ludzi nic nie posiada i chwyta si� ka�dej pracy. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_02"); //Tak naprawd� nie zarobi�em tej rudy. Dosta�em j� od Hysena. Po prostu widzia�em co�, czego wiedzie� nie powinienem.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_03"); //Hysen da� mi 50 bry�ek rudy, �ebym nic nie m�wi� Stra�nikom.
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_04"); //A co takiego widzia�e�?
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_05"); //Chyba mog� ci powiedzie�... Akurat pracowa�em wtedy przy rozdrabniaczu, gdy nagle zauwa�y�em tego podejrzanego typka. Wybiega� z Kopalni jakby go sam Beliar goni�.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_06"); //Po drodze upu�ci� jednak do�� ci�k� sakiewk�. Pomy�la�em, �e zawiera zrabowane narz�dzia, dlatego wola�em jej nie podnosi�. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_07"); //Te rzeczy pewnie mo�na by jako� sprzeda�, ale nie wiedzia�bym nawet komu, a kupcy ze Starego Obozu mogliby zorientowa� si�, �e ukrad�em co� z wn�trza g�ry. Nie mia�bym wtedy �atwego �ycia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_08"); //W ka�dym razie Hysen odwa�y� si� i zabra� sakw�. Zajrza� do �rodka, chwil� pomy�la�, kiwn�� g�ow� i powiedzia�, �e to narz�dzia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_09"); //Da� mi 50 bry�ek rudy, �ebym milcza�. Ostrzega�em go, �e je�li Stra�nicy si� zorientuj�, zabij� go. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_10"); //Nie przej�� si� tym. My�l�, �e ma jakiego� znajomego kupca. Nie obchodzi�o mnie to. Dla mnie jego �up by� bezu�yteczny. 'Niech sobie dorobi' - pomy�la�em. W ko�cu i tak zarobi�em.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_11"); //Powiem ci, �e szczwana bestia z niego. Ukry� narz�dzia w lasku przed obozem. Zamkn�� je w jakiej� skrzyni. Skurczybyk, he he.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_12"); //Tylko nie m�w nikomu!
	AI_Output (other,self,"DIA_Akl_ore_smartboy_15_13"); //Spokojna g�owa. Zale�y mi na waszym szacunku. 
	
	hero_knows_hysenfinder = true;
	B_GiveXP (50);
	B_LogEntry(CH1_OreInOM,"Od Akla dowiedzia�em si�, �e rud� znalaz� Kopacz Hysen, jednak nie przyzna� si� swojemu koledze. Akl jest pewny, �e w sakwie znajdowa�y si� narz�dzia ukradzione z Kopalni. Mo�e kiedy� go u�wiadomi�... W ka�dym razie skrzynia z rud� jest gdzie� wok� obozu. Musz� pogada� z Joshem.");
	
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
   description	= "Musimy pogada�.";
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
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_01"); //Musimy pogada�.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_03"); //Oszuka�e� mnie. Spike powiedzia�, �e nic nie robisz od kiedy wyszed�e� z Kopalni.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_04"); //I co z tego?
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_05"); //Pozw�l, �e grzecznie zapytam: sk�d mia�e� rud�? Tylko bez wykr�t�w, bo pogadamy inaczej.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_06"); //Cholera, nie chc� k�opot�w! Hysen urwie mi �eb! Niech to szlag!
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_07"); //Hysen? Sk�d ma rud�? Od niego j� masz?
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_08"); //Nie wiem sk�d ma rud�. Da� mi 50 bry�ek rudy za milczenie. My�la�em, �e j� wykopa�, przysi�gam!
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_09"); //M�w dok�adnie co wiesz. Jak to by�o?
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_10"); //Akurat pracowa�em wtedy przy rozdrabniaczu, gdy nagle zauwa�y�em tego podejrzanego typka. Wybiega� z Kopalni jakby go sam Beliar goni�.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_06"); //Po drodze upu�ci� jednak do�� ci�k� sakiewk�. Pomy�la�em, �e zawiera zrabowane narz�dzia, dlatego wola�em jej nie podnosi�. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_07"); //Te rzeczy pewnie mo�na by jako� sprzeda�, ale nie wiedzia�bym nawet komu, a kupcy ze Starego Obozu mogliby zorientowa� si�, �e ukrad�em co� z wn�trza g�ry. Nie mia�bym wtedy �atwego �ycia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_08"); //W ka�dym razie Hysen odwa�y� si� i zabra� sakw�. Zajrza� do �rodka, chwil� pomy�la�, kiwn�� g�ow� i powiedzia�, �e to narz�dzia. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_09"); //Da� mi 50 bry�ek rudy �ebym milcza�. Ostrzega�em go, �e je�li Stra�nicy si� zorientuj�, zabij� go. 
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_10"); //Nie przej�� si� tym. My�l�, �e ma jakiego� znajomego kupca. Nie obchodzi�o mnie to. Dla mnie jego �up by� bezu�yteczny. 'Niech sobie dorobi' - pomy�la�em. W ko�cu i tak zarobi�em.
	AI_Output (self,other,"DIA_Akl_ore_smartboy_09_11"); //Powiem ci, �e szczwana bestia z niego. Ukry� narz�dzia w lasku przed obozem. Zamkn�� je w jakiej� skrzyni. Skurczybyk, he he.
    AI_Output (self, other ,"DIA_Kopacz_AngryBezio_03_11"); //Naprawd� nie wiedzia�em, �e jest tam ruda. My�la�em, �e narz�dzia.
    AI_Output (other, self ,"DIA_Kopacz_AngryBezio_15_12"); //Bardzo mi pomog�e�. 
	hero_knows_hysenfinder = true;
	B_GiveXP (50);
	B_LogEntry(CH1_OreInOM,"W ko�cu wydoby�em od Akla informacj�, �e to Hysen ma rud� i ukry� j� w skrzyni w lasku nieopodal obozu. Musz� o tym pogada� z Joshem.");    
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
	
	AI_Output (self,other,"DIA_Akl_WatchOut_09_01"); //Ej ty, uwa�aj!
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
	description		= "Szukasz czego�?";
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
	AI_Output (other,self,"DIA_Akl_WhatsWrong_15_00"); //Szukasz czego�?
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_01"); //Szukam skarb�w.
	AI_Output (other,self,"DIA_Akl_WhatsWrong_15_02"); //Jakich skarb�w?
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_03"); //Nie wiem no... Zale�y co wpadnie w r�ce. 
	AI_Output (self,other,"DIA_Akl_WhatsWrong_09_04"); //Ostatnio znalaz�em w trawie dziwny nap�j. Matt odkupi� go ode mnie za 30 bry�ek rudy.
	
	B_LogEntry                     (CH1_RannyWojownik,"Kopacz Akl znalaz� niepodal lasu tajemniczy nap�j i sprzeda� go Mattowi. To mo�e by� mikstura, o kt�rej m�wi� mi Claw.");

    B_GiveXP (50);
	
	Npc_ExchangeRoutine (VLK_7011_kopacz,"start");
	
	AI_StopProcessInfos	(self);
};
