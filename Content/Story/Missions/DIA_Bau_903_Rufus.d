//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynosz� ci wod�.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy�a mnie Lewus. Przynosz� ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dzi�ki, stary. W g�bie mi ju� zasch�o.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju� nie zosta�o. Tylko mi nie m�w, �e znowu wszyscy zd��yli si� napi� opr�cz mnie!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogo� innego, dobra? Ja tu tylko uprawiam ry�. Na innych rzeczach si� nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najch�tniej powiedzia�bym Ry�owemu Ksi�ciuniowi, �eby sam odwala� swoj� brudn� robot�!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz? ";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To si� zdarzy�o pierwszego dnia po moim przybyciu. Lewus, jeden z oprych�w pracuj�cych dla Ry�owego Ksi�cia, podszed� do mnie i spyta� czy nie m�g�bym im pom�c na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia�em "jasne". W ko�cu by�em tu nowy i zale�a�o mi na znalezieniu sobie przyjaci�.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nast�pnego dnia, kiedy ucina�em sobie drzemk�, facet znowu si� zjawi�.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia�: "Chyba nie chcesz, �eby twoi koledzy odwalali za ciebie ca�� robot�, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia�em mu, �e jestem wyczerpany wczorajsz� prac�, i �e potrzebuj� odpoczynku. Ale on mia� to gdzie�.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z�apa� mnie za ko�nierz i ZACI�GN�� z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka� na mnie na progu mojej chaty - dop�ki nie nauczy�em si� sam wychodzi� w pole. Nie chcia�em, �eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderc�w. Lepiej trzymaj si� od nich z daleka.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 0;
	description	= "Kim jest Ry�owy Ksi���?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello)) && (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry�owy Ksi���?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By� jednym z pierwszych ludzi, kt�rzy tutaj trafili. Pomaga� w zak�adaniu Obozu i rozpocz�� upraw� ry�u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dzi� jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T�usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rufus
// Rozdzia� 5
// Bunt zbieraczy
///////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
//		Rebel Started
//////////////////////////////////////////

INSTANCE DIA_Rufus_Rebel (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Rebel_Condition;
   information  = DIA_Rufus_Rebel_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_Rebel_Condition()
{
    if (Mod_Story_RunRebelInNC == TRUE) && (MIS_BuntZbieraczy != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Rebel_Info()
{
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_01"); //Dobrze ci� widzie�! Masz okazj� by� �wiadkiem wielkich zmian! Rewolucja!
    AI_Output (other, self ,"DIA_Rufus_Rebel_15_02"); //Co tutaj si� dzieje?
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_03"); //Nadszed� czas wyr�wna� rachunki i ukr�ci� ten wyzysk!
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_04"); //Postanowili�my postawi� si� tyranii! Przy��cz si� do nas i przechyl szal� zwyci�stwa na nasz� korzy��.
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_05"); //W jaki spos�b mia�bym wam pom�c?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_06"); //Nie jestem jeszcze pewien czy mog� ci� wprowadzi� w szczeg�y. Sk�d mam wiedzie�, �e nie stoisz po stronie Lewusa?
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_07"); //Za��my, �e nie jestem. Co mia�bym zrobi�, �eby ci to udowodni�?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_08"); //Poka�, �e masz jaja. Podejd� do Lewusa i powiedz mu jakim jest sukinsynem. Poka�, �e si� go nie boisz!
	
	Quest_GiveOffense = LOG_RUNNING;
	
	if (MIS_BuntZbieraczy != LOG_RUNNING) || (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	MIS_BuntZbieraczy = LOG_RUNNING;
	Log_CreateTopic     (CH1_BuntZbieraczy, LOG_MISSION);
    Log_SetTopicStatus  (CH1_BuntZbieraczy, LOG_RUNNING);
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa� mi, abym przy��czy� si� do rebelii po stronie buntownik�w. Aby udowodni� swoj� lojalno�� mam zwymy�la� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	}
	else if (MIS_BuntZbieraczy == LOG_RUNNING)
	{
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa� mi, abym przy��czy� si� do rebelii po stronie buntownik�w. Aby udowodni� swoj� lojalno�� mam zwymy�la� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	};
   
};

/////////////////////////////////////////////////
//		Got offence to Lefty
////////////////////////////////////////////////

INSTANCE DIA_Rufus_GotOffenceToLefty (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_GotOffenceToLefty_Condition;
   information  = DIA_Rufus_GotOffenceToLefty_Info;
   permanent	= FALSE;
   description	= "Wygarn��em Leuwsowi.";
};

FUNC INT DIA_Rufus_GotOffenceToLefty_Condition()
{
    if (Quest_GiveOffense == LOG_SUCCESS) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_GotOffenceToLefty_Info()
{
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_01"); //Wygarn��em Leuwsowi.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_02"); //S�ysza�em! Przez chwil� w og�le nie wiedzia� co ci odpowiedzie�.
	AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_03"); //Raczej nie zostaniecie ju� przyjaci�mi. Powiem ci wi�c co dalej.
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_03"); //Zamieniam si� w s�uch.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_04"); //Przysz�a kolej na sprawdzenie lojalno�ci naszych ludzi. Tak si� sk�ada, �e mam co do jednego z naszych pewne podejrzenia.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_05"); //Wszyscy wo�aj� na niego Mglisty. Widzia�em jak chwil� temu rozmawia� z jednym ze Szkodnik�w przy bramie. 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_06"); //Widzisz? Wci�� tam jest! Pozb�d� si� go. Nie mo�emy ryzykowa�.
	AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_07"); //Mam go tak po prostu zabi� przy jego prawdopodobnych sojusznikach? 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_07"); //Musisz mie� odpowiedni pretekst. Zanim go zaatakujesz krzyknij, �e mia� ci odda� d�ugi lub co� takiego.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_08"); //Ci mordercy jeszcze zaczn� ci klaska� za darmow� rozrywk�.
	
	Quest_ChceckLoyality = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus podejrzewa jednego ze Zbieraczy o zdrad�. Go�� nazywa si� Mglisty i mam si� go pozby�. Rozmawia teraz ze Szkodnikiem stoj�cym przy bramie do obozu.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////
//		Killed Foggy
////////////////////////////////////////////////

INSTANCE DIA_Rufus_KilledFoggy (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_KilledFoggy_Condition;
   information  = DIA_Rufus_KilledFoggy_Info;
   permanent	= FALSE;
   description	= "Zabi�em Mglistego.";
};

FUNC INT DIA_Rufus_KilledFoggy_Condition()
{
    if (Quest_ChceckLoyality == LOG_SUCCESS) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_KilledFoggy_Info()
{
    AI_Output (other, self ,"DIA_Rufus_KilledFoggy_15_01"); //Zabi�em Mglistego.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_02"); //Wiem, jego �mier� by�a zb�dna. Jak mog�em si� tak pomyli�...
	AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_03"); //Musimy dzia�a� dalej. Swego czasu um�wi�em si� z pewnym Kretem z Wolnej Kopalni, �e b�dzie zbiera� dla nas bro�.
    AI_Output (other, self ,"DIA_Rufus_KilledFoggy_15_03"); //Wolna Kopalnia jest...
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_04"); //Wiem. Bro� mia�a by� sk�adowana w skrzyni w jednej z chat w Kotle. Do skrzyni dwa klucze. Jeden mam przy sobie.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_05"); //We� go, znajd� skrzyni� i przynie� nam bro�.
	
	Quest_GetWeaponsDelivery = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"W Kotle znajd� skrzyni� z broni�, kt�r� swego czasu zbiera� dla buntownik�w pewien Kret. Mam przynie�� wszystko, co tam znajd�.");

    B_GiveXP (150);
    CreateInvItems (self,ItMi_KeyFromRufus,1);
	B_GiveInvItems (self,hero, ItMi_KeyFromRufus,1);
};

/////////////////////////////////////////////////
//		Old Sword
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_OldSwords (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_OldSwords_Condition;
   information  = DIA_Rufus_OldSwords_Info;
   permanent	= FALSE;
   description	= "Mam bro� i notatk�.";
};

FUNC INT DIA_Rufus_OldSwords_Condition()
{
    if (Quest_GetWeaponsDelivery == LOG_RUNNING) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus) && (Npc_HasItems (hero,ItMi_NoteFromSenyan) == 1) && (Npc_HasItems (hero,ItMw_1H_Sword_Old_01) >= 8)  && (Npc_HasItems (hero,ItMwPickaxe) >= 5) && (Npc_HasItems (hero,ItMw_1H_Sledgehammer_01) >= 2) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_OldSwords_Info()
{
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_01"); //Mam bro� i notatk�.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_02"); //Doskonale. Ju� si� ba�em, �e nie uda ci si� znale�� skrzyni albo, �e kto� j� spl�druje.
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_03"); //Nie jestem pewien czy by�o w niej co� wartego spl�drowania.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_04"); //C�, musimy wzi�� to co jest. Po�� to tutaj. Wkr�tce rozdam bro� buntownikom.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_05"); //Podczas twojej nieobecno�ci uknu�em pewn� intryg�.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_06"); //Chcia�bym, �eby� zdoby� dla nas kilka butelek specjalnego alkoholu od Jeremiasza.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_07"); //Tu� przed atakiem 'pocz�stujesz' nim Lewusa i jego ch�optasi�w.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_08"); //To powinno nam da� cie� szans. Gdy ju� b�dziesz mia� alkohol pogadaj ze Szkodnikami.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_09"); //Gdyby o co� pytali powiedz, �e wyr�czasz Homera. To on zazwyczaj przynosi im ry��wk� z karczmy.
	
	Quest_GetWeaponsDelivery = LOG_SUCCESS;
	Quest_GetAlcoForBandits = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus wymy�li� sprytny plan. Chce upi� bandzior�w specjalnym trunkiem od Jeremiasza tu� przed samym atakiem. Mam nadziej�, �e Jeremiasz zgodzi si� na taki uk�ad.");

    B_GiveXP (200);
};

/////////////////////////////////////////////////
// 	Alco delivery
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_AlcoDelivery (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_AlcoDelivery_Condition;
   information  = DIA_Rufus_AlcoDelivery_Info;
   permanent	= FALSE;
   description	= "Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.";
};

FUNC INT DIA_Rufus_AlcoDelivery_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) 
	&& (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) 
	&& (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_AlcoDelivery_Info()
{
    AI_Output (other, self ,"DIA_Rufus_AlcoDelivery_15_01"); //Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_02"); //Doskonale! Czas wtajemniczy� ci� w dalsz� cz�� planu.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_03"); //Teraz zosta�o nam tylko obserwowa� bandzior�w i czeka� na odpowiedni moment. Wkr�tce wszystko si� zacznie.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_04"); //To ty powiniene� zrobi� pierwszy krok. Zaatakuj Lewusa. My p�jdziemy za tob�.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Podarowanie alkoholu bandziorom to pestka. Jeste�my ju� prawie gotowi. Wkr�tce Rufus da mi kolejne instrukcje. ");
	AI_StopProcessInfos (self);
	
	Quest_GetAlcoForBandits = LOG_SUCCESS;
	
	Quest_KillLefty = LOG_RUNNING;
};

