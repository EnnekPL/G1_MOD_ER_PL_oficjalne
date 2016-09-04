//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Andrew_EXIT(C_INFO)
{
	npc             = GRD_7008_Tukash;
	nr              = 999;
	condition		= DIA_Andrew_EXIT_Condition;
	information		= DIA_Andrew_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Andrew_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Andrew_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Andrew_HELLO (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HELLO_Condition;
   information  = DIA_Andrew_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Andrew_HELLO_Condition()
{
	if (Kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HELLO_15_01");//Kim jeste�?
    AI_Output (self, other ,"DIA_Andrew_HELLO_15_02");//Nazywam si� Andrew, handlarz. W zamian za rud� mog� ci� porz�dnie wyposa�y�. Kilofy, ubrania robocze, dobre �arcie. Og�lnie m�wi�c mam wszystko, co potrzeba. 
	AI_Output (self, other ,"DIA_Andrew_HELLO_15_03");//W Starej Kopalni jest naprawd� ci�ko dosta� przyzwoite towary. Zach�cam, sprawd� moj� ofert�.
	
	Log_CreateTopic (GE_MineCamp,LOG_NOTE);
    B_LogEntry      (GE_MineCamp,"Tukash handluje r�no�ciami. Znajd� go w obozie przy Starej Kopalni.");
};

//========================================
//-----------------> HANDEL
//========================================

INSTANCE DIA_Andrew_HANDEL (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 99;
   condition    = DIA_Andrew_HANDEL_Condition;
   information  = DIA_Andrew_HANDEL_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy.";
};

FUNC INT DIA_Andrew_HANDEL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_HANDEL_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HANDEL_15_01"); //Pohandlujmy.
    AI_Output (self, other ,"DIA_Andrew_HANDEL_03_02"); //Prosz�, wybierz co�!
};

//========================================
//-----------------> WEJSCIE
//========================================

INSTANCE DIA_Andrew_WEJSCIE (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 3;
   condition    = DIA_Andrew_WEJSCIE_Condition;
   information  = DIA_Andrew_WEJSCIE_Info;
   permanent	= FALSE;
   description	= "Pomo�esz mi wej�� do kopalni?";
};

FUNC INT DIA_Andrew_WEJSCIE_Condition()
{
	if (Kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_WEJSCIE_Info()
{
    AI_Output (other, self ,"DIA_Andrew_WEJSCIE_15_01"); //Pomo�esz mi wej�� do kopalni?
    AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_02"); //Dop�ki nie b�dziesz jednym z nas lub tych �wir�w z Sekty, nie masz najmniejszych szans si� tam dosta�. 
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_03"); //Od niedawna wesz�y nowe zasady, kt�rych Stra�nicy bardzo wiernie pilnuj�. �adna szumowina nie wejdzie ju� do Starej Kopalni. 
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_15_04"); //Wcze�niej ka�dy m�g� swobodnie tam wchodzi�?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_05"); //Raczej nie by�o wi�kszych k�opot�w. Stra�nik�w �atwo mo�na by�o przekupi�, albo zdoby� ich zaufanie. Ale nie teraz...
	Info_ClearChoices	(DIA_Andrew_WEJSCIE);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, DIALOG_BACK, DIA_Andrew_WEJSCIE_BACK);
    Info_AddChoice		(DIA_Andrew_WEJSCIE, "Dlaczego Sekciarze wchodz� swobodnie?", DIA_Andrew_WEJSCIE_PSI);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "Dlaczego wprowadzono nowe zasady?", DIA_Andrew_WEJSCIE_RULES);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "Stra�nik�w na pewno nie da si� przekupi�?", DIA_Andrew_WEJSCIE_PAY);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "To jak najszybciej si� tam dosta�?", DIA_Andrew_WEJSCIE_QUICKLY);	
};

func void DIA_Andrew_WEJSCIE_BACK ()
{
	Info_ClearChoices	(DIA_Andrew_WEJSCIE);
};

func void DIA_Andrew_WEJSCIE_PSI ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_PSI_15_01"); //Dlaczego Sekciarze wchodz� swobodnie?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PSI_03_02"); //Mi�dzy Bractwem, a Starym Obozem istnieje pewna umowa. To ju� wielka polityka, tak�e nie pytaj mnie o to. 
};

func void DIA_Andrew_WEJSCIE_RULES ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_RULES_15_01"); //Dlaczego wprowadzono nowe zasady?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_02"); //Jak to dlaczego? Przez Szkodnik�w i tych cholernych Bandzior�w. Te sukinsyny pojawia�y si� w Kopalni, �eby wyci�ga� informacje o konwojach.
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_03"); //Dzi�ki temu planowali napady i rabowali wszystko co si� da morduj�c naszych ludzi. Niekt�rzy szmuglowali rud�, podjudzali Kopaczy do buntu...
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_04"); //Problem�w by�o co nie miara. Teraz jest w miar� spokojnie. 
};

func void DIA_Andrew_WEJSCIE_PAY ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_PAY_15_01"); //Stra�nik�w na pewno nie da si� przekupi�?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_02"); //Nie ma takiej mo�liwo�ci. Wielu cwaniaczk�w ju� pr�bowa�o. Ich trupy s� teraz zakopane gdzie� przy Kopalni. 
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_03"); //Nasi ludzie s� BARDZO konsekwentni je�li chodzi o nowe zasady. Nie�atwo zdoby� teraz zaufanie. Ka�dy mo�e by� szpiegiem, rabusiem czy inn� gnid�.
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_04"); //Chocia�... M�j ojciec zawsze mawia�, �e ludzie to sukinsyny i nie nale�y im ufa�. By� mo�e gdybym go pos�ucha�, nie siedzia�bym tu teraz.
};

func void DIA_Andrew_WEJSCIE_QUICKLY ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_QUICKLY_15_01"); //To jak najszybciej si� tam dosta�?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_QUICKLY_03_02"); //Diego? Lorenzo? M�wi� ci co� te imiona? Z nimi pogadaj. Nie ma INNEGO sposobu, �eby zosta� jednym z nas. 
};

//========================================
//-----------------> QUEST
//========================================
var int can_andrewhelp;
INSTANCE DIA_Andrew_QUEST (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 4;
   condition    = DIA_Andrew_QUEST_Condition;
   information  = DIA_Andrew_QUEST_Info;
   permanent	= 1;
   description	= "Mog� ci jako� pom�c?";
};

FUNC INT DIA_Andrew_QUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO)) && (Kapitel < 4) && (can_andrewhelp == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_QUEST_Info()
{
    AI_Output (other, self ,"DIA_Andrew_QUEST_15_01"); //Mog� ci jako� pom�c?
	if (Npc_GetTrueGuild(hero) == GIL_STT) ||  (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_02"); //Widz�, �e do nas do��czy�e� i przeszed�e� ju� jakie� przeszkolenie bojowe. Nie jeste� ju� tym samym frajerem, kt�ry zjawi� si� tu tak niedawno.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_03"); //M�drze wybra�e�. To si� bardzo chwali. Stary Ob�z jest miejscem dla ciebie. 
    AI_Output (other, self ,"DIA_Andrew_QUEST_15_04"); //Powiedz mi co mam zrobi�.
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_05"); //P�jdziesz ze mn� na spotkanie z pewnym paserem z Nowego Obozu. Zalegam mu z op�atami i chcia�em troch� przed�u�y� termin sp�aty. 
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_06"); //Jednak spodziewam si� brudnych sztuczek z jego strony. W razie czego pomo�esz mi, je�li dosz�oby do r�koczyn�w.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_07"); //Interesuje ci� taka robota?
	
	DIA_Andrew_QUEST.permanent = 0;
	can_andrewhelp = true;
	Info_ClearChoices	(DIA_Andrew_QUEST);
	Info_AddChoice		(DIA_Andrew_QUEST, "Raczej nie.", DIA_Andrew_QUEST_NOPE);
    Info_AddChoice		(DIA_Andrew_QUEST, "Jasne, powinni�my sobie pomaga�.", DIA_Andrew_QUEST_OFC);
	} 
	else if (Npc_GetTrueGuild(hero) == GIL_VLK) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_08"); //Co? Taki n�dzy brudas na nic mi si� nie przyda. Gdyby� umia� walczy� mo�e mia�bym co� dla ciebie. Cho� te� nie dzisiaj. Sprawa si� musi wyja�ni�.
	}
	else if (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_09"); //Umiesz walczy�? Nie wiem jak w tym waszym Obozie wygl�da przeszkolenie bojowe...
	AI_Output (other, self ,"DIA_Andrew_QUEST_15_10"); //Jasne, m�w czego ci potrzeba.
	
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_05"); //P�jdziesz ze mn� na spotkanie z pewnym paserem z Nowego Obozu. Zalegam mu z op�atami i chcia�em troch� przed�u�y� termin sp�aty. 
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_06"); //Jednak spodziewam si� brudnych sztuczek z jego strony. W razie czego pomo�esz mi, je�li dosz�oby do r�koczyn�w.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_07"); //Interesuje ci� taka robota?
	
	can_andrewhelp = true;
	Info_ClearChoices	(DIA_Andrew_QUEST);
	Info_AddChoice		(DIA_Andrew_QUEST, "Raczej nie.", DIA_Andrew_QUEST_NOPE);
    Info_AddChoice		(DIA_Andrew_QUEST, "Jasne, powinni�my sobie pomaga�.", DIA_Andrew_QUEST_OFC);
	}
	else 
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_15_11"); //Nie potrzebuj� pomocy kogo� takiego jak ty!
	
	DIA_Andrew_QUEST.permanent = 0;
	can_andrewhelp = true;
	};
};

func void DIA_Andrew_QUEST_NOPE ()
{
	AI_Output (other, self ,"DIA_Andrew_QUEST_NOPE_15_01"); //Raczej nie.
	AI_Output (self, other ,"DIA_Andrew_QUEST_NOPE_03_02"); //�le ci� oceni�em... 
	AI_StopProcessInfos (self);
	Info_ClearChoices (DIA_Andrew_QUEST);
};

func void DIA_Andrew_QUEST_OFC ()
{
	AI_Output (other, self ,"DIA_Andrew_QUEST_OFC_15_01"); //Jasne, powinni�my sobie pomaga�.
	AI_Output (self, other ,"DIA_Andrew_QUEST_OFC_03_02"); //I takiej odpowiedzi oczekiwa�em! Powiedz, gdy b�dziesz got�w.
	
	MIS_OchroniarzOM = LOG_RUNNING;

    Log_CreateTopic            	(CH1_OchroniarzOM, LOG_MISSION);
    Log_SetTopicStatus       	(CH1_OchroniarzOM, LOG_RUNNING);
    B_LogEntry                  (CH1_OchroniarzOM,"Andrew ma niema�e k�opoty z paserem z Nowego Obozu. Handlarz z obozu przed kopalni� jest winny Szkodnikowi 250 bry�ek rudy. Mam i�� z nim i chroni� go, podczas gdyby jego kontrahent nie by� zbyt skory do negocjacji.");
	Info_ClearChoices 	(DIA_Andrew_QUEST);
};
    
//========================================
//-----------------> LETSGONNAHATE
//========================================

INSTANCE DIA_Andrew_LETSGONNAHATE (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 6;
   condition    = DIA_Andrew_LETSGONNAHATE_Condition;
   information  = DIA_Andrew_LETSGONNAHATE_Info;
   permanent	= FALSE;
   description	= "Chod�my na tych zbir�w!";
};

FUNC INT DIA_Andrew_LETSGONNAHATE_Condition()
{
    if  (MIS_OchroniarzOM == LOG_RUNNING) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_LETSGONNAHATE_Info()
{
    AI_Output (other, self ,"DIA_Andrew_LETSGONNAHATE_15_01"); //Chod�my na tych zbir�w!
    AI_Output (self, other ,"DIA_Andrew_LETSGONNAHATE_03_02"); //Dobra, ruszajmy.
    AI_Output (self, other ,"DIA_Andrew_LETSGONNAHATE_03_03"); //Zaprowadz� ci�.
	if (!Npc_KnowsInfo (hero, DIA_Berg_GIVE_RING)) || (!Npc_KnowsInfo (hero, DIA_Berg_WARN))
	{
	Npc_ExchangeRoutine (GRD_3934_Berg,"quest_aidan");
	};
   	GRD_7008_Tukash.aivar[AIV_PARTYMEMBER] = TRUE;
   	Npc_ExchangeRoutine (GRD_7008_Tukash,"atak");
	
	Npc_ExchangeRoutine (ORG_810_Organisator,"przydupas");
	Npc_ExchangeRoutine (ORG_807_Organisator,"przydupas");
	Npc_ExchangeRoutine (SLD_5575_Alvaro,"przydupas");

	B_ChangeGuild    (ORG_810_Organisator,GIL_DMB);
	B_ChangeGuild    (ORG_807_Organisator,GIL_DMB);
	B_ChangeGuild    (SLD_5575_Alvaro,GIL_DMB);
	
	Npc_ExchangeRoutine (ORG_843_Sharky,"catch");
	
	B_SetPermAttitude	(GRD_7008_Tukash,	ATT_FRIENDLY);
	GRD_7008_Tukash.flags = 2;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Andrew_HELLO7 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 7;
   condition    = DIA_Andrew_HELLO7_Condition;
   information  = DIA_Andrew_HELLO7_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_HELLO7_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_LETSGONNAHATE))
    && (Npc_GetDistToWP (self, "OW_PATH_058") < 1000)
    {
    return TRUE;
    };
};
 

FUNC VOID DIA_Andrew_HELLO7_Info()
{
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_01"); //Sp�jrz, s� po drugiej stronie mostu. Wydaje mi si�, �e nie s� przyja�nie nastawieni. 
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_02"); //Widzisz tego Najemnika? To Alvaro, wielki si�acz. Zaatakujmy z zaskoczenia. To da nam przewag�.
	AI_Output (self, other ,"DIA_Andrew_HELLO7_03_03"); //Jest tam gdzie� Sharky? Nie widz� go. Czy�by nas oszuka�?
    AI_Output (other, self ,"DIA_Andrew_HELLO7_15_04"); //A co z negocjacjami?
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_05"); //Sharky nawet si� nie zjawi�, a ci durnie raczej nie s� sk�onni do negocjacji.
    B_LogEntry                     (CH1_OchroniarzOM,"Sharky nie pojawi� si� na mo�cie. Zamiast niego sta�o tam trzech osi�k�w. Andrew postanowi�, �e od razu zaatakujemy przeciwnik�w. Musz� uwa�a� na Alvaro. Pono� to silny Najemnik z Nowego Obozu.");
	Npc_ExchangeRoutine (GRD_7008_Tukash,"atak2");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Wygrana
//========================================

INSTANCE DIA_Andrew_Wygrana (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_Wygrana_Condition;
   information  = DIA_Andrew_Wygrana_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_Wygrana_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO7))
    && (Npc_IsDead(ORG_810_Organisator))
    && (Npc_IsDead(ORG_807_Organisator))
    && (Npc_IsDead(SLD_5575_Alvaro))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_Wygrana_Info()
{
    AI_Output (self, other ,"DIA_Andrew_Wygrana_03_01"); //Dobra robota. Te gnidy nie �yj�!
    AI_Output (other, self ,"DIA_Andrew_Wygrana_15_02"); //Co robimy dalej?
    AI_Output (self, other ,"DIA_Andrew_Wygrana_03_03"); //Musimy poszuka� Sharky'ego. Prowad�.
    B_LogEntry                     (CH1_OchroniarzOM,"Pokonali�my zbir�w, teraz musimy odnale�� Sharky'ego, kt�ry wed�ug Andrewa na pewno zaczai� si� w okolicy.");
	Npc_ExchangeRoutine (GRD_7008_Tukash,"follow");
    AI_StopProcessInfos	(GRD_7008_Tukash);
}; 

//========================================
//-----------------> FindSharky
//========================================

INSTANCE DIA_Andrew_FindSharky (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_FindSharky_Condition;
   information  = DIA_Andrew_FindSharky_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_FindSharky_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_Wygrana))
	&& (Npc_KnowsInfo (hero, Org_843_Sharky_CATCHED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_FindSharky_Info()
{
    AI_Output (self, other ,"DIA_Andrew_FindSharky_03_01"); //No nie�le, gdyby nie ty ich zasadzka pewnie by si� uda�a.
	AI_Output (self, other ,"DIA_Andrew_FindSharky_03_02"); //Jestem ci bardzo wdzi�czny. We� w nagrod� te spodnie.
    AI_Output (other, self ,"DIA_Andrew_FindSharky_15_03"); //Nast�pnym razem r�b interesy z kim� ze Starego Obozu.
    AI_Output (self, other ,"DIA_Andrew_FindSharky_03_04"); //B�d� pami�ta�, jeszcze raz dzi�ki.
    B_LogEntry                     (CH1_OchroniarzOM,"Sharky darowa� Andrewowi wszystkie d�ugi, bo ba� si�, �e zrobimy z nim to, co on chcia� zrobi� z nami. Wszystko wr�ci�o do normy, a moje zlecenie sko�czone.");
    Log_SetTopicStatus       (CH1_OchroniarzOM, LOG_SUCCESS);
    MIS_OchroniarzOM = LOG_SUCCESS;
    B_GiveXP (200);
	CreateInvItem (self,VLK_ARMOR_M);
	B_GiveInvItems (self, other, VLK_ARMOR_M, 1);
	GRD_7008_Tukash.aivar[AIV_PARTYMEMBER] = false;
    B_SetPermAttitude	(GRD_7008_Tukash,ATT_NEUTRAL);
    Npc_ExchangeRoutine (GRD_7008_Tukash,"start");
    AI_StopProcessInfos	(GRD_7008_Tukash);
	
	if (!Npc_KnowsInfo (hero, DIA_Berg_GIVE_RING)) || (!Npc_KnowsInfo (hero, DIA_Berg_WARN))
	{
	Npc_ExchangeRoutine (GRD_3934_Berg,"quest");
	};
}; 

/*
//========================================
//-----------------> BOUGHT
//========================================

INSTANCE DIA_Andrew_BOUGHT (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 9;
   condition    = DIA_Andrew_BOUGHT_Condition;
   information  = DIA_Andrew_BOUGHT_Info;
   permanent	= FALSE;
   description	= "Chc� kupi� ekwipunek dla Kopacza. (120 bry�ek)";
};

FUNC INT DIA_Andrew_BOUGHT_Condition()
{
	if  (Npc_HasItems (hero, ItMiNugget)>=120) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_BOUGHT_Info()
{
    AI_Output (other, self ,"DIA_Andrew_BOUGHT_15_01"); //Chc� kupi� ekwipunek dla Kopacza.
    AI_Output (self, other ,"DIA_Andrew_BOUGHT_03_02"); //Masz rud�?
    AI_Output (other, self ,"DIA_Andrew_BOUGHT_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Andrew_BOUGHT_03_04"); //W porz�dku. To twoje rzeczy.
    B_GiveInvItems (other, self, ItMiNugget, 120);
    CreateInvItems (self, VLK_ARMOR_L, 1);
    B_GiveInvItems (self, other, VLK_ARMOR_L, 1);
    CreateInvItems (self, ItMwPickaxe, 1);
    B_GiveInvItems (self, other, ItMwPickaxe, 1);
    CreateInvItems (self, ItFoMutton, 3);
    B_GiveInvItems (self, other, ItFoMutton, 3);
    B_LogEntry                     (CH1_MineEnter,"Kupi�em ekwipunek od Tukasha.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
*/

/////////////////////////////////////////////////////
// Andrew
// Rozdzia� 4
// Ob�z Bandyt�w
/////////////////////////////////////////////////////

//========================================
//-----------------> HEY1
//========================================

INSTANCE DIA_Andrew_HEY1 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HEY1_Condition;
   information  = DIA_Andrew_HEY1_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?!";
};

FUNC INT DIA_Andrew_HEY1_Condition()
{
	if (Kapitel >= 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HEY1_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HEY1_15_01"); //Co ty tu robisz?!
    AI_Output (self, other ,"DIA_Andrew_HEY1_03_02"); //Od dawna chcia�em uciec z obozu przy kopalni. Ostatnie wydarzenia podgrza�y atmosfer� do tego stopnia, �e przyspieszy�em moj� decyzj�.
	AI_Output (other, self ,"DIA_Andrew_HEY1_15_03"); //Quentin tak po prostu ci� tu wpu�ci�?!
	AI_Output (self, other ,"DIA_Andrew_HEY1_03_04"); //W zamian otrzyma� wiele bardzo przydatnych informacji.

};
//========================================
//-----------------> HEY2
//========================================

INSTANCE DIA_Andrew_HEY2 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HEY2_Condition;
   information  = DIA_Andrew_HEY2_Info;
   permanent	= FALSE;
   description	= "Wiesz, co dzieje si� w Kopalni?";
};

FUNC INT DIA_Andrew_HEY2_Condition()
{
	if (Kapitel >= 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HEY2_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HEY2_15_01"); //Wiesz, co dzieje si� w Kopalni?
    AI_Output (self, other ,"DIA_Andrew_HEY2_03_02"); //Wszystko zala�a podziemna rzeka. Zgin�o wielu ludzi. Ze znanych mi os�b prze�y� tylko Kopacz Grimes i kilku Kopaczy. 
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_03"); //Kilku na moich oczach wymkn�o si� z obozu i poszli w kierunku Starego Obozu. Bardzo mnie to zdziwi�o, ale my�l�, �e jednak go omin�li.
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_04"); //A Stra�nicy chyba zacz�li si� buntowa�. S�ysza�em o planowanym zamachu na Arto, kt�ry sprawuje teraz opiek� nad obozem.
	AI_Output (other, self ,"DIA_Andrew_HEY2_15_05"); //Dzi�ki za wiadomo�ci.
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_06"); //Nie ma sprawy. Nie ma ju� �adnych zale�no�ci mi�dzy mn�, a tymi lud�mi. Musz� sobie znale�� nowe ubranie, bo w ko�cu kto� mnie kropnie.
	B_GiveXP (100);
};