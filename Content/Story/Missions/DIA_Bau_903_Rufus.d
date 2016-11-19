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
	description = "Przysy³a mnie Lewus. Przynoszê ci wodê.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy³a mnie Lewus. Przynoszê ci wodê.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dziêki, stary. W gêbie mi ju¿ zasch³o.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju¿ nie zosta³o. Tylko mi nie mów, ¿e znowu wszyscy zd¹¿yli siê napiæ oprócz mnie!
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
	description	= "Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogoœ innego, dobra? Ja tu tylko uprawiam ry¿. Na innych rzeczach siê nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najchêtniej powiedzia³bym Ry¿owemu Ksiêciuniowi, ¿eby sam odwala³ swoj¹ brudn¹ robotê!
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
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To siê zdarzy³o pierwszego dnia po moim przybyciu. Lewus, jeden z oprychów pracuj¹cych dla Ry¿owego Ksiêcia, podszed³ do mnie i spyta³ czy nie móg³bym im pomóc na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia³em "jasne". W koñcu by³em tu nowy i zale¿a³o mi na znalezieniu sobie przyjació³.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nastêpnego dnia, kiedy ucina³em sobie drzemkê, facet znowu siê zjawi³.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia³: "Chyba nie chcesz, ¿eby twoi koledzy odwalali za ciebie ca³¹ robotê, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia³em mu, ¿e jestem wyczerpany wczorajsz¹ prac¹, i ¿e potrzebujê odpoczynku. Ale on mia³ to gdzieœ.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z³apa³ mnie za ko³nierz i ZACI¥GN¥£ z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka³ na mnie na progu mojej chaty - dopóki nie nauczy³em siê sam wychodziæ w pole. Nie chcia³em, ¿eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderców. Lepiej trzymaj siê od nich z daleka.
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
	description	= "Kim jest Ry¿owy Ksi¹¿ê?";
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
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry¿owy Ksi¹¿ê?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By³ jednym z pierwszych ludzi, którzy tutaj trafili. Pomaga³ w zak³adaniu Obozu i rozpocz¹³ uprawê ry¿u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dziœ jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T³usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rufus
// Rozdzia³ 5
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
    if (Mod_Story_RunRebelInNC == TRUE) && (MIS_BuntZbieraczy != LOG_SUCCESS) && (!Npc_KnowsInfo(hero, DIA_Lefty_AbouRebelion))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Rebel_Info()
{
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_01"); //Dobrze ciê widzieæ! Masz okazjê byæ œwiadkiem wielkich zmian! Rewolucja!
    AI_Output (other, self ,"DIA_Rufus_Rebel_15_02"); //Co tutaj siê dzieje?
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_03"); //Nadszed³ czas wyrównaæ rachunki i ukróciæ ten wyzysk!
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_04"); //Postanowiliœmy postawiæ siê tyranii! Przy³¹cz siê do nas i przechyl szalê zwyciêstwa na nasz¹ korzyœæ.
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_05"); //W jaki sposób mia³bym wam pomóc?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_06"); //Nie jestem jeszcze pewien czy mogê ciê wprowadziæ w szczegó³y. Sk¹d mam wiedzieæ, ¿e nie stoisz po stronie Lewusa?
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_07"); //Za³ó¿my, ¿e nie jestem. Co mia³bym zrobiæ, ¿eby ci to udowodniæ?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_08"); //Poka¿, ¿e masz jaja. PodejdŸ do Lewusa i powiedz mu jakim jest sukinsynem. Poka¿, ¿e siê go nie boisz!
	
	Quest_GiveOffense = LOG_RUNNING;
	
	if (MIS_BuntZbieraczy != LOG_RUNNING) || (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	MIS_BuntZbieraczy = LOG_RUNNING;
	Log_CreateTopic     (CH1_BuntZbieraczy, LOG_MISSION);
    Log_SetTopicStatus  (CH1_BuntZbieraczy, LOG_RUNNING);
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa³ mi, abym przy³¹czy³ siê do rebelii po stronie buntowników. Aby udowodniæ swoj¹ lojalnoœæ mam zwymyœlaæ Lewusa. Wci¹¿ jeszcze mogê wybraæ, po której stronie konfliktu siê opowiem.");
	}
	else if (MIS_BuntZbieraczy == LOG_RUNNING)
	{
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa³ mi, abym przy³¹czy³ siê do rebelii po stronie buntowników. Aby udowodniæ swoj¹ lojalnoœæ mam zwymyœlaæ Lewusa. Wci¹¿ jeszcze mogê wybraæ, po której stronie konfliktu siê opowiem.");
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
   description	= "Wygarn¹³em Lewusowi.";
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
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_01"); //Wygarn¹³em Lewusowi.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_02"); //S³ysza³em! Przez chwilê w ogóle nie wiedzia³ co ci odpowiedzieæ.
	AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_03"); //Raczej nie zostaniecie ju¿ przyjació³mi. Powiem ci wiêc co dalej.
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_03"); //Zamieniam siê w s³uch.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_04"); //Przysz³a kolej na sprawdzenie lojalnoœci naszych ludzi. Tak siê sk³ada, ¿e mam co do jednego z naszych pewne podejrzenia.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_05"); //Wszyscy wo³aj¹ na niego Mglisty. Widzia³em jak chwilê temu rozmawia³ z jednym ze Szkodników przy bramie. 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_06"); //Widzisz? Wci¹¿ tam jest! Pozb¹dŸ siê go. Nie mo¿emy ryzykowaæ.
	AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_07"); //Mam go tak po prostu zabiæ przy jego prawdopodobnych sojusznikach? 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_07"); //Musisz mieæ odpowiedni pretekst. Zanim go zaatakujesz krzyknij, ¿e mia³ ci oddaæ d³ugi lub coœ takiego.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_08"); //Ci mordercy jeszcze zaczn¹ ci klaskaæ za darmow¹ rozrywkê.
	
	Quest_ChceckLoyality = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus podejrzewa jednego ze Zbieraczy o zdradê. Goœæ nazywa siê Mglisty i mam siê go pozbyæ. Rozmawia teraz ze Szkodnikiem stoj¹cym przy bramie do obozu.");

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
   description	= "Zabi³em Mglistego.";
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
    AI_Output (other, self ,"DIA_Rufus_KilledFoggy_15_01"); //Zabi³em Mglistego.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_02"); //Wiem, jego œmieræ by³a zbêdna. Jak mog³em siê tak pomyliæ...
	AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_03"); //Musimy dzia³aæ dalej. Swego czasu umówi³em siê z pewnym Kretem z Wolnej Kopalni, ¿e bêdzie zbiera³ dla nas broñ.
    AI_Output (other, self ,"DIA_Rufus_KilledFoggy_15_03"); //Wolna Kopalnia jest...
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_04"); //Wiem. Broñ mia³a byæ sk³adowana w skrzyni w jednej z chat w Kotle. Do skrzyni dwa klucze. Jeden mam przy sobie.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_05"); //WeŸ go, znajdŸ skrzyniê i przynieœ nam broñ.
	
	Quest_GetWeaponsDelivery = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"W Kotle znajdê skrzyniê z broni¹, któr¹ swego czasu zbiera³ dla buntowników pewien Kret. Mam przynieœæ wszystko, co tam znajdê.");

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
   description	= "Mam broñ i notatkê.";
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
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_01"); //Mam broñ i notatkê.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_02"); //Doskonale. Ju¿ siê ba³em, ¿e nie uda ci siê znaleŸæ skrzyni albo, ¿e ktoœ j¹ spl¹druje.
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_03"); //Nie jestem pewien czy by³o w niej coœ wartego spl¹drowania.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_04"); //Có¿, musimy wzi¹æ to co jest. Po³ó¿ to tutaj. Wkrótce rozdam broñ buntownikom.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_05"); //Podczas twojej nieobecnoœci uknu³em pewn¹ intrygê.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_06"); //Chcia³bym, ¿ebyœ zdoby³ dla nas kilka butelek specjalnego alkoholu od Jeremiasza.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_07"); //Tu¿ przed atakiem 'poczêstujesz' nim Lewusa i jego ch³optasiów.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_08"); //To powinno nam daæ cieñ szans. Gdy ju¿ bêdziesz mia³ alkohol pogadaj ze Szkodnikami.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_09"); //Gdyby o coœ pytali powiedz, ¿e wyrêczasz Homera. To on zazwyczaj przynosi im ry¿ówkê z karczmy.
	
	Quest_GetWeaponsDelivery = LOG_SUCCESS;
	Quest_GetAlcoForBandits = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus wymyœli³ sprytny plan. Chce upiæ bandziorów specjalnym trunkiem od Jeremiasza tu¿ przed samym atakiem. Mam nadziejê, ¿e Jeremiasz zgodzi siê na taki uk³ad.");

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
   description	= "Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.";
};

FUNC INT DIA_Rufus_AlcoDelivery_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) 
	&& (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) 
	&& (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT))
	&& (Rebel_Consequences == LeftyAndLordDeath)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_AlcoDelivery_Info()
{
    AI_Output (other, self ,"DIA_Rufus_AlcoDelivery_15_01"); //Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_02"); //Doskonale! Czas wtajemniczyæ ciê w dalsz¹ czêœæ planu.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_03"); //Teraz zosta³o nam tylko obserwowaæ bandziorów i czekaæ na odpowiedni moment. Wkrótce wszystko siê zacznie.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_04"); //To ty powinieneœ zrobiæ pierwszy krok. Zaatakuj Lewusa. My pójdziemy za tob¹.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Podarowanie alkoholu bandziorom to pestka. Jesteœmy ju¿ prawie gotowi. To ja powinienem zaatakowaæ Lewusa.");
	AI_StopProcessInfos (self);
	
	Quest_GetAlcoForBandits = LOG_SUCCESS;
	
	Quest_KillLefty = LOG_RUNNING;
};

/////////////////////////////////////////////////
// 	Alco delivery 2 
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_AlcoDelivery2 (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_AlcoDelivery2_Condition;
   information  = DIA_Rufus_AlcoDelivery2_Info;
   permanent	= FALSE;
   description	= "Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.";
};

FUNC INT DIA_Rufus_AlcoDelivery2_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) 
	&& (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) 
	&& (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT))
	&& (Rebel_Consequences == LeftyDeath)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_AlcoDelivery2_Info()
{
    AI_Output (other, self ,"DIA_Rufus_AlcoDelivery2_15_01"); //Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_02"); //Doskonale! Myœlê, ¿e wkrótce dojdzie do ostatecznej konfrontacji.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_03"); //Zanim jednak to siê stanie, Horacy chce z tob¹ porozmawiaæ. 
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_04"); //Powiedzia³, ¿e to pilne i ¿ebyœ nie robi³ nic zanim z nim nie pogadasz.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rozda³em alkohol bandziorom. Rufus powiedzia³ mi, ¿e Horacy chce pilnie ze mn¹ porozmawiaæ. Ciekawe o co mu chodzi.");
	AI_StopProcessInfos (self);
	
	Quest_GetAlcoForBandits = LOG_SUCCESS;
	
	Quest_TalkWithHoratio = LOG_RUNNING;
	
	Quest_KillLefty = LOG_FAILED;
};

/////////////////////////////////////////////////
// 	Hoartio Do Everything
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_HoratioDoEverything (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_HoratioDoEverything_Condition;
   information  = DIA_Rufus_HoratioDoEverything_Info;
   permanent	= FALSE;
   description	= "Horacy wszystkim siê zajmie.";
};

FUNC INT DIA_Rufus_HoratioDoEverything_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Horatio_KillBoth))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HoratioDoEverything_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HoratioDoEverything_15_01"); //Horacy wszystkim siê zajmie.
    AI_Output (self, other ,"DIA_Rufus_HoratioDoEverything_03_02"); //Spójrz! Coœ zaczyna siê dziaæ!
	//AI_Output (other, self ,"DIA_Rufus_HoratioDoEverything_15_03"); //Mamy pewien plan. Jeœli dobrze pójdzie, bandziory pozbêd¹ siê Lewusa i Ksiêcia za nas.
	//AI_Output (self, other ,"DIA_Rufus_HoratioDoEverything_03_04"); //
	
	AI_StopProcessInfos (self);
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Gdy rozmawia³em z Rufusem, zaczê³o siê coœ dziaæ...");
	
	Npc_SetTarget (Org_846_Schlaeger, Bau_900_Ricelord);
    AI_StartState (Org_846_Schlaeger, ZS_ATTACK, 1, "");
	
	Npc_SetTarget (Org_845_Schlaeger, Org_844_Lefty);
    AI_StartState (Org_845_Schlaeger, ZS_ATTACK, 1, "");
	
	B_ChangeGuild (BAU_900_Ricelord, GIL_DMB);
	B_ChangeGuild (Org_844_Lefty, GIL_DMB);
};

/////////////////////////////////////////////////
// 	Lefty Die
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LeftyDie (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LeftyDie_Condition;
   information  = DIA_Rufus_LeftyDie_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LeftyDie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HoratioDoEverything)) && (Npc_IsDead (Org_844_Lefty)) && (Npc_IsDead (BAU_900_Ricelord))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LeftyDie_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_01"); //Nie ¿yj¹...
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_02"); //Plan Horacego siê powiód³. 
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_03"); //A wiêc to koniec tyranii.
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_04"); //Najwidoczniej tak.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_05"); //Kto teraz bêdzie zarz¹dza³ tym wszystkim?
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_06"); //Chyba pora na ciebie.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_07"); //Horacy... On powinien siê tym wszystkim zaj¹æ. Tak bêdzie najlepiej.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_08"); //Nie wiem jak ci dziêkowaæ. Od teraz wszystko bêdzie inaczej!
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_09"); //Wszystko bêdzie w porz¹dku...
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_10"); //Dok³adnie! Porozmawiamy póŸniej.
	
	AI_StopProcessInfos (self);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Ry¿owy Ksi¹¿ê i Lewus nie ¿yj¹. Zostali zamordowani przez w³asnych siepaczy. Plan Horacego siê powiód³. To on zostanie nowym naczelnikiem magazynu. Rufus zrezygnowa³ z przywództwa. Chyba chce znów wróciæ do spokojnej pracy.");

	B_Story_AfterBauRebellion ();
	
	Npc_ExchangeRoutine (BAU_901_Horatio, "boss");
};

/////////////////////////////////////////////////
// 	Lefty Die, Ricelord stay alive
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LeftyDieRicelordAlive (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LeftyDieRicelordAlive_Condition;
   information  = DIA_Rufus_LeftyDieRicelordAlive_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LeftyDieRicelordAlive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ricelord_Peace))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LeftyDieRicelordAlive_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_01"); //Lewus nie ¿yje.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_02"); //Ale Ry¿owy Ksi¹¿ê tak. I przysta³ na wasze warunki.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_03"); //A wiêc to koniec tyranii?
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_04"); //Myœlê, ¿e tak. Przynajmniej na jakiœ czas.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_05"); //Pozosta³o nam wracaæ do pracy i liczyæ na lepsze jutro.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_06"); //Ry¿owy Ksi¹¿ê te¿ chyba wyci¹gn¹³ z tego wszystkiego jak¹œ nauczkê.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_07"); //Niech tak bêdzie. Zaraz ka¿ê wszystkim wróciæ na pola. 
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_08"); //Myœlisz, ¿e by³bym w stanie zast¹piæ Lewusa.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_09"); //Myœlê, ¿e tak. Wszystko bêdzie w porz¹dku.
	
	AI_StopProcessInfos (self);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Lewus nie ¿yje. Ry¿owy Ksi¹¿ê wróci³ do pracy w magazynie, a Zbieraczami zajmie siê Rufus. Wszystko chyba potoczy³o siê dobrze.");

	B_Story_AfterBauRebellion ();
	
	B_GiveXP (1000);
	
	var c_npc rufus; rufus = Hlp_GetNpc (Bau_903_Rufus);
	Npc_ExchangeRoutine (rufus,"boss");
};

/////////////////////////////////////////////////
// 	Wanna Talk
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_WannaTalk (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_WannaTalk_Condition;
   information  = DIA_Rufus_WannaTalk_Info;
   permanent	= FALSE;
   description	= "Lewus chce pertraktowaæ.";
};

FUNC INT DIA_Rufus_WannaTalk_Condition()
{
    if (Quest_TalkWithRufus == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_WannaTalk_Info()
{
    AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_01"); //Lewus chce pertraktowaæ.
    AI_Output (self, other ,"DIA_Rufus_WannaTalk_03_02"); //Hmm? Przystanie na warunki?
	AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_03"); //Proponuje ugodê. Dostaniecie dodatkow¹ porcjê miêsa tygodniowo i nie wyci¹gniemy ¿adnych konsekwencji od buntowników.
	AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_04"); //Wszystko wróci do normy.
	AI_Output (self, other ,"DIA_Rufus_WannaTalk_03_04"); //Tfu. Nigdy!
	
	AI_StopProcessInfos (self);
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rufus odrzuci³ propozycjê pokojow¹ Lewusa. To nie brzmi za dobrze.");
	
	Quest_TalkWithRufus = LOG_SUCCESS;
	
	Rebel_HerosBoss = Boss_Lefty;
};

/////////////////////////////////////////////////
// 	Last Fight
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LastFight (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LastFight_Condition;
   information  = DIA_Rufus_LastFight_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LastFight_Condition()
{
    if (Quest_KillRufus == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LastFight_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LastFight_03_01"); //To ty zniszczy³eœ wszystko, co budowa³em! Ty pogr¹¿y³eœ wszystkich Zbieraczy!
	AI_Output (self, other ,"DIA_Rufus_LastFight_03_02"); //Ju¿ po tobie!
	
	self.flags = 0;
	AI_StopProcessInfos (self);
	B_ChangeGuild    (self,GIL_NONE);  
	self.guild = GIL_NONE;
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rufus mnie zaatakowa³. Có¿, muszê wykonaæ polecenie Lewusa. To jedyne wyjœcie.");
};
