// *Script was make in Easy Dialog Maker (EDM)
//edit by Nocturn
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gerard_EXIT(C_INFO)
{
	npc             = NON_3900_Gerard;
	nr              = 999;
	condition	= DIA_Gerard_EXIT_Condition;
	information	= DIA_Gerard_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gerard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gerard_HELLO1 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_HELLO1_Condition;
   information  = DIA_Gerard_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Gerard_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gerard_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO1_15_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gerard_HELLO1_03_03"); //Nazywam siê Gerard. Dawniej walczy³em na arenie, teraz staram siê jakoœ prze¿yæ.
	AI_Output (other, self ,"DIA_Gerard_HELLO1_15_04"); //Jak wiêc tu trafi³eœ?
	AI_Output (self, other ,"DIA_Gerard_HELLO1_03_05"); //Nie powinno ciê to interesowaæ...
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gerard_HELLO2 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_HELLO2_Condition;
   information  = DIA_Gerard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co robisz na tym odludziu?";
};

FUNC INT DIA_Gerard_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gerard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO2_15_01"); //Co robisz na tym odludziu?
    AI_Output (self, other ,"DIA_Gerard_HELLO2_03_02"); //Tymczasowo mieszkam. Mam tu wszystko czego mi potrzeba, wiêc po co mia³bym iœæ do któregokolwiek obozu?
	AI_Output (self, other ,"DIA_Gerard_HELLO2_03_03"); //Poza tym ³adne mam st¹d widoki.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gerard_HELLO3 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 3;
   condition    = DIA_Gerard_HELLO3_Condition;
   information  = DIA_Gerard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz na sobie interesuj¹cy pancerz.";
};

FUNC INT DIA_Gerard_HELLO3_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gerard_HELLO2))
		{
    return TRUE;
};
};
FUNC VOID DIA_Gerard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO3_15_01"); //Masz na sobie interesuj¹cy pancerz. Identyczne mieli na sobie ¿o³nierze Króla, którzy mnie tutaj zrzucili.
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_02"); //W rzeczy samej. Identyczne, mo¿e nawet te same.
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_03"); //Mam jeszcze drugi taki pancerz.
    AI_Output (other, self ,"DIA_Gerard_HELLO3_15_04"); //Jak je zdoby³eœ?
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_05"); //To d³uga historia.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gerard_HELLO4 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 4;
   condition    = DIA_Gerard_HELLO4_Condition;
   information  = DIA_Gerard_HELLO4_Info;
   permanent	= FALSE;
   description	= "Opowiadaj. Nigdzie mi siê nie spieszy.";
};

FUNC INT DIA_Gerard_HELLO4_Condition()
{

    if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO3))
    {
    return TRUE;
};
};
FUNC VOID DIA_Gerard_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO4_15_01"); //Opowiadaj. Nigdzie mi siê nie spieszy.
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_02"); //W porz¹dku. Mój przyjaciel przekupi³ stra¿nika lochów i wrêczy³ mi krótki sztylet.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_03"); //Pewnego dnia zosta³em zaci¹gniêty nad urwisko przez dwóch ¿o³nierzy, gdzie stary Sêdzia z Khorinis wyg³osi³ swoje przemówienie. 
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_04");	//Nie by³em skuty, wiêc korzystaj¹c z ich nieuwagi wyci¹gn¹³em sztylet i zrani³em nim ¿o³nierza w nogê, po czym zacz¹³em uciekaæ w stronê gór.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_05"); //Dwóch ¿o³nierzy wyruszy³o za mn¹ w poœcig, a Sêdzia pobieg³ zawiadomiæ pobliski oddzia³ rycerzy o tym incydencie. Ukry³em siê w grocie i znienacka poder¿n¹³em jednemu gard³o. 
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_06");	//Drugi zauwa¿y³ ka³u¿ê krwi i powoli podszed³ z kusz¹. Tym razem ukry³em siê za ska³¹ i oczekiwa³em na dogodny moment do ataku. 
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_07");	//W pewnym momencie rzuci³em siê na ¿o³nierza i wbi³em mu sztylet w serce, ten jednak odruchowo strzeli³ z kuszy rani¹c mnie w bark.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_08"); //Cia³a zepchn¹³em za Barierê, po czym us³ysza³em alarm wydobywaj¹cy siê z rogu. By³ to wyraŸny znak, ¿e oddzia³ wyruszy³ w poœcig. 
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_09"); //Mog³em uciekaæ, jednak stra¿nicy i tak by mnie znaleŸli.
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_10"); //Moj¹ ostatni¹ nadziej¹ na prze¿ycie by³a Bariera. Rycerze nigdy nie odwa¿yliby siê tu dobrowolnie wkroczyæ...
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_11"); //Tak wyl¹dowa³em tutaj.
};

//========================================
//-----------------> HELLO5
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_HELLO5 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 5;
   condition    = DIA_Gerard_HELLO5_Condition;
   information  = DIA_Gerard_HELLO5_Info;
   permanent	= FALSE;
   description	= "Jesteœ ranny?";
};

FUNC INT DIA_Gerard_HELLO5_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO1)) {
    return TRUE; };
};
FUNC VOID DIA_Gerard_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO5_15_01"); //Jesteœ ranny?
    AI_Output (self, other ,"DIA_Gerard_HELLO5_15_02"); //Tak. Uda³o mi siê opatrzyæ ranê miejscowymi zio³ami, jednak czasami ból powraca.
};

//========================================
//-----------------> HELP
//========================================

INSTANCE DIA_Gerard_HELP (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_HELP_Condition;
   information  = DIA_Gerard_HELP_Info;
   permanent	= FALSE;
   description	= "Mogê ci jakoœ pomóc?";
};

FUNC INT DIA_Gerard_HELP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_HELP_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELP_15_01"); //Mogê ci jakoœ pomóc?
    AI_Output (self, other ,"DIA_Gerard_HELP_03_02"); //Przynieœ mi lekarstwo, które ca³kowicie wyleczy moje rany, a otrzymasz zbrojê ¿o³nierza królewskiego.
    AI_Output (other, self ,"DIA_Gerard_HELP_15_03"); //Zobaczê, co da siê zrobiæ.
    AI_Output (self, other ,"DIA_Gerard_HELP_03_04"); //Doceniam twój zapa³, ale znalezienie takiego lekarstwa nie bêdzie ³atwe. 
    AI_Output (other, self ,"DIA_Gerard_HELP_15_05"); //Wiem o tym. Postaraj siê wytrzymaæ. Bêdê siê stara³ przynieœæ je jak najszybciej.
    MIS_RannyWojownik = LOG_RUNNING;

    Log_CreateTopic            (CH1_RannyWojownik, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RannyWojownik, LOG_RUNNING);
    B_LogEntry                     (CH1_RannyWojownik,"Gerard zosta³ postrzelony z kuszy i potrzebuje lekarstwa, które ca³kowicie wyleczy rany. W zamian za przyniesienie leku otrzymam zbrojê ¿o³nierza królewskiego.");
};

//========================================
//-----------------> FIND_POTION
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_FIND_POTION (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_FIND_POTION_Condition;
   information  = DIA_Gerard_FIND_POTION_Info;
   permanent	= FALSE;
   description	= "Przynios³em lekarstwo, które ca³kowicie wyleczy twoje rany.";
};

FUNC INT DIA_Gerard_FIND_POTION_Condition()
{
    if (MIS_RannyWojownik == LOG_RUNNING)
    && (Npc_HasItems (other, GerardPotion) >=1)
    {
    return TRUE;
    };
};
FUNC VOID DIA_Gerard_FIND_POTION_Info()
{
    AI_Output (other, self ,"DIA_Gerard_FIND_POTION_15_01"); //Przynios³em lekarstwo, które ca³kowicie wyleczy twoje rany.
    B_GiveInvItems (other, self, GerardPotion, 1);
	AI_Output (self, other ,"DIA_Gerard_FIND_POTION_03_02"); //Wielkie dziêki.
    AI_UseItem (self, GerardPotion);
    AI_Output (self, other ,"DIA_Gerard_FIND_POTION_03_03"); //Oto obiecana nagroda. Niech ten pancerz chroni ciê przed wrogami.
	
    
    
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItems (hero, GRD_ARMOR_I, 1);
    B_LogEntry                     (CH1_RannyWojownik,"Zanios³em Gerardowi lekarstwo. W nagrodê otrzyma³em ciekawy pancerz.");
    Log_SetTopicStatus       (CH1_RannyWojownik, LOG_SUCCESS);
    MIS_RannyWojownik = LOG_SUCCESS;

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TROFEUM
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_TROFEUM (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_TROFEUM_Condition;
   information  = DIA_Gerard_TROFEUM_Info;
   permanent	= FALSE;
   Important    = TRUE;
};
FUNC INT DIA_Gerard_TROFEUM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_FIND_POTION))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_TROFEUM_Info()
{
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_01"); //Masz przy sobie interesuj¹ce trofeum... Widaæ, ¿e bestia by³a znacznie wiêksza i silniejsza od swoich braci.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_02"); //Mówisz o tych pazurach topielca?
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_03"); //Tak. Pewien kupiec z Khorinis poszukuje pazurów wyj¹tkowej bestii. Nazywa siê Lutero. Myœlê, ¿e mog³oby go to zainteresowaæ.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_04"); //Jak mam siê z nim skontaktowaæ?
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_05"); //Któryœ obóz prowadzi handel ze Œwiatem Zewnêtrznym, wiêc tam powinieneœ poszukaæ pomocy.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_06"); //Rozumiem, dziêki za informacje.
    MIS_SzponyTopielca = LOG_RUNNING;

    Log_CreateTopic          (CH1_SzponyTopielca, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_RUNNING);
    B_LogEntry               (CH1_SzponyTopielca,"Gerard wspomnia³ o kupcu z Khorinis, który móg³by byæ zainteresowany pazurami topielca z Nowego Obozu. Chyba powinienem porozmawiaæ z Magnatami.");
};

//========================================
//-----------------> KOLCZY
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_KOLCZY (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_KOLCZY_Condition;
   information  = DIA_Gerard_KOLCZY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};
FUNC INT DIA_Gerard_KOLCZY_Condition()
{ //FUNC C_Item Npc_GetEquippedArmor 		(VAR C_NPC n0 ) { };
    if (Npc_HasItems (hero, ketpal) >=1)
	&& (stan_kaptura == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_KOLCZY_Info()
{
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_01"); //Zabijê ciê, rycerzyku!
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_02"); //Uspokój siê, to ja...
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_03"); //Wybacz, nie rozpozna³em ciê. Myœla³em, ¿e to jakaœ nêdzna namiastka rycerza.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_04"); //Raczej ¿aden skazaniec nie lubi ¿o³nierzy króla.
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_05"); //Jedyna zbrodnia jak¹ pope³ni³em, to zabicie tych ¿o³nierzy, którzy próbowali mnie tu zrzuciæ.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_06"); //Jak to?
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_07"); //Ciê¿ko trenowa³em i pewnego dnia zdoby³em tytu³ mistrza areny.
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_08"); //Mój poprzednik by³ synem wp³ywowego kupca, któremu nie uœmiecha³a siê utrata tytu³u przez syna. 
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_09"); //Przekupi³ wiêc dowódcê oddzia³u paladynów i nastêpnego dnia zosta³em wyzwany na pojedynek.
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_10"); //Walka nie by³a ³atwa, jednak po krótkiej wymianie ciosów zyska³em znaczn¹ przewagê. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_11"); //Po pewnym czasie zorientowa³em siê, ¿e mój miecz pulsuje dziwn¹ aur¹ z rêkojeœci. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_12");	//Ignorowa³em to, w koñcu by³em zajêty walk¹. W pewnym momencie rycerz zacz¹³ p³on¹æ.	
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_13"); //Zarzucono mi nielegalne praktykowanie magii, oszustwo podczas walki, a przede wszystkim zabójstwo rycerza. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_14");	//Jedynie cud uratowa³ mnie przed œmierci¹. Orkowie najechali na miasto i wybuch³o wielkie zamieszanie. Dziêki temu ¿yjê.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_15"); //Wrobili ciê...
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_16"); //Dlatego przed do³¹czeniem do ³owców orków stroni³em od innych Obozów.
};
var int gerard_proba;
//========================================
//-----------------> LOWCA_ORKOW
//========================================

INSTANCE DIA_Gerard_LOWCA_ORKOW (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_LOWCA_ORKOW_Condition;
   information  = DIA_Gerard_LOWCA_ORKOW_Info;
   permanent	= FALSE;
   description	= "Widzisz siebie jako ³owcê orków?";
};

FUNC INT DIA_Gerard_LOWCA_ORKOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_ROBOTA))
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero, DIA_Gerard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_LOWCA_ORKOW_Info()
{
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_01"); //Widzisz siebie jako ³owcê orków?
    AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_02"); //Ja? £owc¹ orków?
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_03"); //Tak. Myœlê, ¿e siê nadajesz. Nie bez powodu wspina³em siê na sam¹ górê.
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_04"); //Pomyœl, co ciê tu trzyma?
    AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_05"); //W sumie masz racjê.
    if (MIS_RannyWojownik == LOG_RUNNING)
    {
        AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_06"); //Ale nie przynios³eœ mi jeszcze lekarstwa. Nie mogê st¹d iœæ w takim stanie.
        AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_07"); //Muszê szybko znaleŸæ jakiœ skuteczny lek.
		gerard_proba = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_08"); //No dobra. To gdzie jest ten obóz?
        AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_09"); //Przy przejœciu na ziemie orków. We wnêce skalnej. 
		AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_10"); //Wkrótce siê tam zjawiê. Muszê siê przygotowaæ, zebraæ moje rzeczy z obozowiska...
	B_LogEntry                     (CH3_NewBloodForOrcHunters,"Gerard to dobra osoba do obozu ³owców orków. To twardy cz³owiek. D³ugo wytrzyma³ bez lekarstwa. Z pewnoœci¹ da sobie radê z orkami. ");
	gerard_proba = false;
    B_GiveXP (200);
    Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);
	gerard_lowca = true;
    };

};

//========================================
//-----------------> GOTO_ORCS
//========================================

INSTANCE DIA_Gerard_GOTO_ORCS (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_GOTO_ORCS_Condition;
   information  = DIA_Gerard_GOTO_ORCS_Info;
   permanent	= FALSE;
   description	= "Teraz ju¿ mo¿esz iœæ.";
};

FUNC INT DIA_Gerard_GOTO_ORCS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_LOWCA_ORKOW))
    && (MIS_RannyWojownik == LOG_SUCCESS)
    && (gerard_proba == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_GOTO_ORCS_Info()
{
    AI_Output (other, self ,"DIA_Gerard_GOTO_ORCS_15_01"); //Teraz ju¿ mo¿esz iœæ.
    AI_Output (self, other ,"DIA_Gerard_GOTO_ORCS_03_02"); //Naprawdê siê cieszê. Tu na górze powietrze jest ciê¿kie. 
	AI_Output (self, other ,"DIA_Gerard_GOTO_ORCS_03_03"); //Nied³ugo wyruszê. Wkrótce pojawiê siê w obozie. 
    Npc_ExchangeRoutine (NON_3900_Gerard, "camp");//fix
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Gerard to dobra osoba do obozu ³owców orków. To twardy cz³owiek. D³ugo wytrzyma³ bez lekarstwa. Z pewnoœci¹ da sobie radê z orkami. ");
	gerard_lowca = true;
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NEED_HELP
//========================================

INSTANCE DIA_Gerard_NEED_HELP (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_NEED_HELP_Condition;
   information  = DIA_Gerard_NEED_HELP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gerard_NEED_HELP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Straznik_SYTUACJA_GERARDA)) && (kapitel ==10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_NEED_HELP_Info()
{
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_01"); //Dziêki! Zjawi³eœ siê w ostatniej chwili.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_02"); //Orkowie wziêli mnie z zaskoczenia! Na szczêœcie to tylko s³abo uzbrojeni zwiadowcy.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_03"); //Dobrze, ¿e siê zjawi³eœ.
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_04"); //Odbi³o ci? Dlaczego nie poszed³eœ z Wilsonem?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_05"); //Nie mam zamiaru w³óczyæ siê po Kolonii. Wszêdzie krêc¹ siê Stra¿nicy. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_06"); //Do tego zêbacze maj¹ teraz okres godowy i schodz¹ z górskich zboczy niebezpiecznie zbli¿aj¹c siê do ludzkich osad. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_07"); //Szukaj¹ jedzenia i partnerów do godów. 
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_08"); //A co bêdzie, gdy orkowie znajd¹ twoj¹ kryjówkê?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_09"); //Nie znajd¹. Zabi³em ich zwiadowców. 
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_10"); //A co jeœli zaczn¹ ich szukaæ?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_11"); //Teraz bêdê gotowy. Nie dam siê zaskoczyæ.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_12"); //Bêdê czêœciej patrolowa³ teren, rozpala³ mniejsze ognisko... Wystarczy trochê pomyœleæ.
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_13"); //Orkowe psy w ka¿dej chwili mog¹ poczuæ zapach pieczonego miêsa...
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_14"); //Z tym te¿ sobie poradzê. Nie próbuj mnie przekonywaæ, bo nic ci to nie da!
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_15"); //Dobra, ju¿ skoñczy³em. Po prostu uwa¿aj na siebie. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_16"); //Dziêki. Ty równie¿.
    B_LogEntry                     (CH1_Stan_gerarda,"Gdy wchodzi³em do obozu Gerard walczy³ z grup¹ orkowych zwiadowców. Na szczêœcie zd¹¿y³em na czas i uda³o mi siê mu pomóc. Pomimo zagro¿enia nadal upiera siê nad wy¿szoœci¹ tej kryjówki nad innymi. ");
    Log_SetTopicStatus       (CH1_Stan_gerarda, LOG_SUCCESS);
    MIS_Stan_gerarda = LOG_SUCCESS;
	Log_CreateTopic            (OtherInfos, LOG_NOTE);  
	B_LogEntry    (OtherInfos,"Gerard zdradzi³ mi, ¿e w³aœnie zacz¹³ siê okres godowy zêbaczy. Zwierzêta wychodz¹ ze swoich górskich kryjówek w poszukiwaniu partnerów i jedzenia. Musze uwa¿aæ.");
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};



