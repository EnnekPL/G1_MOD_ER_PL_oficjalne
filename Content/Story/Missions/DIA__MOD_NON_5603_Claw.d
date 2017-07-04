// *Script was make in Easy Dialog Maker (EDM)
//DIALOGI POPRAWIONE I SPRAWDZONE //g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Claw_EXIT(C_INFO)
{
	npc             = NON_5603_Claw;
	nr              = 999;
	condition	= DIA_Claw_EXIT_Condition;
	information	= DIA_Claw_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Claw_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Claw_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Claw_HELLO1 (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_HELLO1_Condition;
   information  = DIA_Claw_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Claw_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Claw_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Claw_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_02"); //Nazywam siê Claw, obozowy alchemik.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_03"); //Przygotowujê proste mikstury i zupy dla myœliwych.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_04"); //Dawno temu mia³em kontakt z Goñcami Leœnymi na Myrtanie. Wiele siê od nich nauczy³em.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_05"); //Znam alternatywne przepisy na mikstury many i zdrowia.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_06"); //Mogê ci te¿ sporo powiedzieæ o warzeniu mikstur i o leœnych zio³ach.
	AI_Output (other, self ,"DIA_Claw_HELLO1_15_07"); //Jesteœ bardzo uprzejmy.
	AI_Output (self, other ,"DIA_Claw_HELLO1_03_08"); //Po prostu rzadko mam okazjê z kimœ porozmawiaæ. Na ogó³ wszyscy s¹ bardzo zajêci.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); 
	B_LogEntry		(GE_TeacherOW,"Claw to alchemik w obozie myœliwych. Nauczy mnie alternatywnych receptur na miksturê many oraz zdrowia. Mo¿e mi tak¿e opowiedzieæ o sk³adnikach alchemicznych.");
};
//========================================
//-----------------> Cel
//========================================

INSTANCE DIA_Claw_Cel (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_Cel_Condition;
   information  = DIA_Claw_Cel_Info;
   permanent	= FALSE;
   description	= "Za co tutaj trafi³eœ?";
};

FUNC INT DIA_Claw_Cel_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Claw_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Cel_Info()
{
    AI_Output (other, self ,"DIA_Claw_Cel_15_01"); //Za co tutaj trafi³eœ?
    AI_Output (self, other ,"DIA_Claw_Cel_03_02"); //W sumie to za nic wielkiego. Pewnego zimowego wieczoru napadliœmy na karawanê wioz¹c¹ ¿ywnoœæ do Trelis. 
    AI_Output (self, other ,"DIA_Claw_Cel_03_03"); //Zabraliœmy skrzyniê z chlebem i uciekliœmy do lasu. W starych ruinach za³o¿yliœmy obóz. Rankiem, gdy siê obudzi³em, by³em ju¿ skuty. 
    AI_Output (other, self ,"DIA_Claw_Cel_15_04"); //To przykre.
    AI_Output (self, other ,"DIA_Claw_Cel_03_05"); //Czy ja wiem... Pobyt w Kolonii odmieni³ moje ¿ycie. Sporo siê nauczy³em. ¯ycie tutaj niezbyt ró¿ni siê od tego, co robi³em na Myrtanie.
    AI_Output (self, other ,"DIA_Claw_Cel_03_06"); //Tam po prostu mia³em wiêcej przestrzeni.
    AI_Output (other, self ,"DIA_Claw_Cel_15_07"); //Rozumiem.
};
//========================================
//-----------------> AlchemyLearn
//========================================

INSTANCE DIA_Claw_AlchemyLearn (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 888;
   condition    = DIA_Claw_AlchemyLearn_Condition;
   information  = DIA_Claw_AlchemyLearn_Info;
   permanent	= FALSE;
   description	= "Nauka alchemii. (10 punktów nauki, 200 bry³ek rudy)";
};

FUNC INT DIA_Claw_AlchemyLearn_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) &&  (Npc_KnowsInfo (hero, DIA_Claw_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_AlchemyLearn_Info()
{
	AI_Output (other, self ,"DIA_Claw_AlchemyLearn_15_01"); //Naucz mnie alchemii.
    if (Npc_HasItems (hero, ItMiNugget)>=200)
    && (hero.lp >= 10)
    { 
    AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_02"); //Podstaw¹ alchemii jest stosowanie siê do tego, co jest napisane w recepturach i ksiêgach.
    AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_03"); //Pamiêtaj, ¿eby byæ ostro¿nym. Ka¿d¹ czynnoœæ wykonuj powoli, z opanowaniem.
    Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
	PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.lp = hero.lp - 10;
	DIA_Claw_AlchemyLearn.permanent = false;
	B_GiveInvItems (other, self, ItMiNugget, 200);
	} else {
	AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_04"); //Nie mogê ciê tego nauczyæ!
	DIA_Claw_AlchemyLearn.permanent = true;
	};
};//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Claw_HELLO2 (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 777;
   condition    = DIA_Claw_HELLO2_Condition;
   information  = DIA_Claw_HELLO2_Info;
   permanent	= true;
   description	= "Opowiedz mi o alternatywnych przepisach na mikstury.";
};

FUNC INT DIA_Claw_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Claw_HELLO1)) 
	&& ((Knows_AlternativeHPmix == false)
    || (Knows_AlternativeMANAmix == false))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Claw_HELLO2_15_01"); //Opowiedz mi o alternatywnych przepisach na mikstury.
    AI_Output (self, other ,"DIA_Claw_HELLO2_03_02"); //Jak¹ recepturê konkretnie chcesz poznaæ?

    Info_ClearChoices		(DIA_Claw_HELLO2);
    Info_AddChoice		(DIA_Claw_HELLO2, DIALOG_BACK, DIA_Claw_HELLO2_BACK);
	if (Knows_AlternativeHPmix == false)
	{
    Info_AddChoice		(DIA_Claw_HELLO2, "Jak zrobiæ miksturê uzdrowienia?", DIA_Claw_HELLO2_MixHP);
	};
	if (Knows_AlternativeMANAmix == false)
	{
    Info_AddChoice		(DIA_Claw_HELLO2, "Jak zrobiæ miksturê many?", DIA_Claw_HELLO2_MixMana);
	};
};

FUNC VOID DIA_Claw_HELLO2_BACK()
{
    Info_ClearChoices		(DIA_Claw_HELLO2);
};

FUNC VOID DIA_Claw_HELLO2_MixHP()
{
    AI_Output (other, self ,"DIA_Claw_HELLO2_MixHP_15_01"); //Jak zrobiæ miksturê uzdrowienia z leœnych zió³?
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_02"); //Potrzebujesz dwóch serafisów i bagiennego ziela.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_03"); //To wszystko gotujesz i ostro¿nie mieszasz dodaj¹c cukier.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_04"); //To wszystko. Uwa¿aj na siebie. 
    Knows_AlternativeHPmix = true;
};

FUNC VOID DIA_Claw_HELLO2_MixMana()
{
    AI_Output (other, self ,"DIA_Claw_HELLO2_MixMana_15_01"); //Jak zrobiæ miksturê many z leœnych zió³?
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_02"); //Potrzeba cztery jagody i jeden serafis. Przyda siê równie¿ sól.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_03"); //Musisz rozdrobniæ serafisa nim go dodasz do mikstury.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_04"); //To wa¿ne!
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_05"); //Pamiêtaj o tym.
    Knows_AlternativeMANAmix = true;
};

//========================================
//-----------------> HealPlants
//========================================

INSTANCE DIA_Claw_HealPlants (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 666;
   condition    = DIA_Claw_HealPlants_Condition;
   information  = DIA_Claw_HealPlants_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o roœlinach leczniczych.";
};

FUNC INT DIA_Claw_HealPlants_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Claw_HELLO1)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Claw_HealPlants_Info()
{
    AI_Output (other, self ,"DIA_Claw_HealPlants_15_01"); //Opowiedz mi o roœlinach leczniczych.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_02"); //Roœliny lecznicze to obszerny temat. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_03"); //Alchemicy dziel¹ je na ró¿ne grupy.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_04"); //Pierwsz¹ z nich s¹ owoce lecznicze. Najwiêcej takich roœlin znajdziesz w lasach.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_05"); //S¹ to rozmaite jagody, serafisy, ogniociernie i niezwykle rzadkie velaisy. Myœliwi czêsto myl¹ je ze zwyk³ymi leœnymi owocami. Nie wiedz¹, ¿e ka¿dy alchemik chêtnie je kupi. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_06"); //Dobry alchemik potrafi z owoców lasu sporz¹dziæ miksturê, która stale zwiêkszy jego energiê ¿yciow¹.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_07"); //Warto wiêc je trzymaæ, a nie zjadaæ od razu. W nag³ych wypadkach lepiej u¿yæ mikstury lub innego zio³a. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_08"); //Drug¹ grup¹ s¹ mchy. Znane nam s¹ ich dwa rodzaje. Mech górski i nagrobny.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_09"); //Ma³o o nich wiem. Gdybyœ czegoœ siê dowiedzia³, to daj mi znaæ.
    AI_Output (other, self ,"DIA_Claw_HealPlants_15_10"); //Jasne. A inne grupy?
    AI_Output (self,other ,"DIA_Claw_HealPlants_15_11"); //Trzeci¹ grup¹ s¹ zio³a. Najbardziej znane i cenione przez alchemików, gdy¿ mo¿na z nich tworzyæ ciekawe mikstury nie wp³ywaj¹ce tylko na zdrowie, lecz na ca³y organizm.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_12"); //Do tej grupy nale¿y miêdzy innymi: psianka, kocianka, orkowe ziele i zwyczajne zio³a lecznicze.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_13"); //Zio³a lecznicze ³atwo poznaæ po ¿ó³tych i zielonych liœciach. Te mocniejsze maj¹ ich wiêcej. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_14"); //Mikstury najlepiej przyrz¹dzaæ w³aœnie ze zwyk³ych zió³ leczniczych. Pozosta³e mimo leczniczych w³aœciwoœci nie nadaj¹ siê do tego najlepiej. 
    B_givexp (50);
};

//========================================
//-----------------> ManaPlants
//========================================

INSTANCE DIA_Claw_ManaPlants (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 666;
   condition    = DIA_Claw_ManaPlants_Condition;
   information  = DIA_Claw_ManaPlants_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o zio³ach many.";
};

FUNC INT DIA_Claw_ManaPlants_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Claw_HELLO1)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Claw_ManaPlants_Info()
{
    AI_Output (other, self ,"DIA_Claw_ManaPlants_15_01"); //Opowiedz mi o zio³ach many.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_02"); //Na magiczn¹ energiê drzemi¹c¹ wp³ywaj¹ ró¿norodne zio³a i nasiona.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_03"); //Najbardziej znane to krucze ziele i czarne ziele. To w³aœnie z nich najlepiej wyrabiaæ mikstury odnawiaj¹ce manê.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_04"); //Warto tak¿e wspomnieæ o korzeniach. Dragot i twardzieñ z pewnoœci¹ s¹ ci znane. Ponoæ te niepozorne roœliny maj¹ w sobie du¿¹ moc. Jednak ma³o kto potrafi przygotowywaæ z nich mikstury. 
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_05"); //Nasiona dêbu i buka równie¿ maj¹ w³aœciwoœci magiczne. Niestety, dok³adniej nie s¹ mi one znane. 
	B_givexp (50);
};

//========================================
//-----------------> AllPlants
//========================================

INSTANCE DIA_Claw_AllPlants (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 666;
   condition    = DIA_Claw_AllPlants_Condition;
   information  = DIA_Claw_AllPlants_Info;
   permanent	= FALSE;
   description	= "Powiedz mi coœ wiêcej o innych roœlinach.";
};

FUNC INT DIA_Claw_AllPlants_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Claw_HELLO1)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Claw_AllPlants_Info()
{
    AI_Output (other, self ,"DIA_Claw_AllPlants_15_01"); //Powiedz mi coœ wiêcej o innych roœlinach.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_02"); //W Kolonii szczególnie popularne jest bagienne ziele, z którego mo¿na wytwarzaæ skrêty.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_03"); //Jego hodowla jest bardzo dochodowa i ma³o wymagaj¹ca. Jak sama nazwa mówi bagienne ziele roœnie na podmok³ym terenie.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_04"); //Jest niezwykle cenne, gdy¿ jest sk³adnikiem wielu mikstur stale zwiêkszaj¹cych atrybuty.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_05"); //Ze znanych mi grzybów mogê wymieniæ piekielniki i gorzki chleb. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_06"); //S¹ to zwyczajne grzyby stosowane raczej przez kucharzy ni¿ alchemików. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_07"); //Kr¹¿¹ te¿ legendy o œwietlistym grzybie. Nigdy nie widzia³em czegoœ takiego, jednak s³ysza³em, ¿e istniej¹ naprawdê.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_08"); //Z wygl¹du przypominaj¹ zwyk³e grzyby, jednak maj¹ pomarañczowy i sp³aszczony kapelusz.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_09"); //Gdybyœ kiedykolwiek znalaz³ takiego grzyba, nie sprzedawaj go byle komu.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_10"); //Jak ju¿ mówimy ogólnie o zieleninie, to warto równie¿ wspomnieæ o glonach. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_11"); //Maj¹ ma³¹ wartoœæ dla alchemika. Niektórzy myœliwi jednak je skupuj¹.
    AI_Output (other, self ,"DIA_Claw_AllPlants_15_12"); //A co ze zwyk³ymi zio³ami?
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_13"); //Ach tak. Zapomnia³em o nich. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_14"); //Ich nazwy pochodz¹ od miejsca wystêpowania.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_15"); //Górskie ziele lubi wy¿yny. Mo¿na je wykorzystaæ do wytworzenia wywaru many.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_16"); //Polne ziele znajdziesz na równinach. Przyda siê przy warzeniu mikstury zrêcznoœci.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_17"); //Leœne ziele roœnie wœród leœnego runa. Cenione przez wojowników, gdy¿ mo¿na z niego sporz¹dziæ wywar si³y.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_18"); //Nadmorskie ziele znajdziesz na wybrze¿ach. Ma charakterystyczny wygl¹d. Przyda siê, gdy bêdziesz chcia³ zwiêkszyæ swoj¹ si³ê ¿yciow¹.
    B_giveXP (50);
};

//========================================
//-----------------> Kapitel2Mission
//========================================

INSTANCE DIA_Claw_Kapitel2Mission (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_Kapitel2Mission_Condition;
   information  = DIA_Claw_Kapitel2Mission_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Claw_Kapitel2Mission_Condition()
{
    if (Kapitel >= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Kapitel2Mission_Info()
{
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_01"); //Ch³opcze, potrzebujê twojej pomocy!
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_02"); //Co siê dzieje?
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_03"); //Polowa³em ostatnio w okolicach Bractwa i zosta³em zaatakowany przez jaszczura.
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_04"); //Co w zwi¹zku z tym?
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_05"); //Ten jaszczur to jakiœ inny gatunek. Zosta³em zatruty.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_06"); //Niestety, nie potrafiê sporz¹dziæ odtrutki. Nie znam przepisu.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_07"); //A poza tym jestem zbyt s³aby, ¿eby cokolwiek robiæ.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_08"); //IdŸ do obozu na bagnie i poszukaj dla mnie pomocy.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_09"); //Proszê. Umieram.
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_10"); //Natychmiast ruszam w drogê.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_11"); //Dziêkujê. WeŸ te wywary. Przydadz¹ ci siê.
    CreateInvItems (self, ItFo_Potion_Mana_01, 2);
    B_GiveInvItems (self, hero, ItFo_Potion_Mana_01, 2);
    CreateInvItems (self, ItFo_Potion_Health_01, 2);
    B_GiveInvItems (self, hero, ItFo_Potion_Health_01, 2);
    MIS_SickHunter = LOG_RUNNING;
	Wld_InsertNpc				(WaranJadowity,"WARAN_JADOWITY");
	Npc_ExchangeRoutine (NON_5603_Claw,"chory");
    Log_CreateTopic            (CH2_SickHunter, LOG_MISSION);
    Log_SetTopicStatus       (CH2_SickHunter, LOG_RUNNING);
    B_LogEntry                     (CH2_SickHunter,"Myœliwy Claw zosta³ zatruty przez podejrzanego jaszczura. Muszê iœæ do Bractwa i poszukaæ odtrutki dla myœliwego. ");
};

//========================================
//-----------------> SKINJASZ
//========================================

INSTANCE DIA_Claw_SKINJASZ (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 2;
   condition    = DIA_Claw_SKINJASZ_Condition;
   information  = DIA_Claw_SKINJASZ_Info;
   permanent	= FALSE;
   description	= "Jak wygl¹da³ ten jaszczur?";
};

FUNC INT DIA_Claw_SKINJASZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Claw_Kapitel2Mission))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_SKINJASZ_Info()
{
    AI_Output (other, self ,"DIA_Claw_SKINJASZ_15_01"); //Jak wygl¹da³ ten jaszczur?
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_02"); //Dobre pytanie. Jego trucizna mo¿e ci siê przydaæ do antidotum.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_03"); //Jaszczur ró¿ni³ siê od zwyczajnej bestii. By³ zielony, a nie ¿ó³tawy.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_04"); //Bardziej powinno ciê interesowaæ, gdzie przebywa.
    AI_Output (other, self ,"DIA_Claw_SKINJASZ_15_05"); //A wiêc? Gdzie to jest?
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_06"); //Spotka³em go w jaskini w okolicy obozu na bagnie. B¹dŸ ostro¿ny.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_07"); //W okolicy krêci siê sporo innych zwierz¹t.
    B_LogEntry                     (CH2_SickHunter,"Jaszczura powinienem szukaæ w jaskini przy obozie na bagnie. Poznam go po zielonym kolorze skóry.");

    B_GiveXP (50);
};
//========================================
//-----------------> Antybiotyk
//========================================

INSTANCE DIA_Claw_Antybiotyk (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_Antybiotyk_Condition;
   information  = DIA_Claw_Antybiotyk_Info;
   permanent	= FALSE;
   description	= "Mam antidotum!";
};

FUNC INT DIA_Claw_Antybiotyk_Condition()
{
    if (Npc_HasItems (other, ItMi_AnitdotumNaJad) >=1)
    && (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Antybiotyk_Info()
{
    AI_Output (other, self ,"DIA_Claw_Antybiotyk_15_01"); //Mam antidotum!
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_02"); //Daj mi je! Szybko!
    B_LogEntry                     (CH2_SickHunter,"Myœliwy otrzyma³ miksturê. ");
    Log_SetTopicStatus       (CH2_SickHunter, LOG_SUCCESS);
    MIS_SickHunter = LOG_SUCCESS;

    B_GiveXP (450);
    B_GiveInvItems (other, self, ItMi_AnitdotumNaJad, 1);
    AI_UseItem (self, ItMi_AnitdotumNaJad);
    timer_ClawQuest = 0;
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_03"); //Od razu lepiej...
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_04"); //Dziêkujê ci, przyjacielu.
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_05"); //WeŸ tê rudê, jako wyraz mojej wdziêcznoœci.
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_06"); //Je¿eli chcesz, abym pomóg³ ci w polowaniu, wal œmia³o. 
    AI_Output (other, self ,"DIA_Claw_Antybiotyk_15_07"); //Dziêki. Bêdê pamiêta³. 
    AI_Output (other, self ,"DIA_Claw_Antybiotyk_15_08"); //Trzymaj siê.
    CreateInvItems (self, ItMiNugget, 129);
    B_GiveInvItems (self, other, ItMiNugget, 129);
};


//========================================
//-----------------> Samopoczucie
//========================================

INSTANCE DIA_Claw_Samopoczucie (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_Samopoczucie_Condition;
   information  = DIA_Claw_Samopoczucie_Info;
   permanent	= FALSE;
   description	= "Lepiej siê czujesz?";
};

FUNC INT DIA_Claw_Samopoczucie_Condition()
{
    if (MIS_SickHunter == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Samopoczucie_Info()
{
    AI_Output (other, self ,"DIA_Claw_Samopoczucie_15_01"); //Lepiej siê czujesz?
    AI_Output (self, other ,"DIA_Claw_Samopoczucie_03_02"); //Tak, bardzo mi pomog³eœ.
    AI_Output (self, other ,"DIA_Claw_Samopoczucie_03_03"); //Zapamiêtam to sobie.
};


//========================================
//-----------------> Okup
//========================================

INSTANCE DIA_Claw_Okup (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 2;
   condition    = DIA_Claw_Okup_Condition;
   information  = DIA_Claw_Okup_Info;
   permanent	= FALSE;
   description	= "Alex jest w niewoli. Potrzebujemy rudy, ¿eby zap³aciæ okup.";
};

FUNC INT DIA_Claw_Okup_Condition()
{
    if (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (!Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Okup_Info()
{
    AI_Output (other, self ,"DIA_Claw_Okup_15_01"); //Alex jest w niewoli. Potrzebujemy rudy, ¿eby zap³aciæ okup.
    AI_Output (self, other ,"DIA_Claw_Okup_03_02"); //Kto go porwa³?
    AI_Output (other, self ,"DIA_Claw_Okup_15_03"); //Zosta³ porwany przez Stra¿ników na polecenie Kruka. Magnat chce za niego 1000 bry³ek rudy.
    AI_Output (self, other ,"DIA_Claw_Okup_03_04"); //Cholera, dorzuci³bym siê, ale mam tylko 200 bry³ek rudy. Jak ci je oddam, nie bêdê mia³ z czego ¿yæ.
    AI_Output (self, other ,"DIA_Claw_Okup_03_05"); //Nie mam ju¿ ziela, które móg³bym sprzedaæ lub uwarzyæ z niego eliksiry.
    AI_Output (self, other ,"DIA_Claw_Okup_03_06"); //Pos³uchaj. Przynieœ mi po trzy ziela: nadmorskie, górskie, polne i lecznicze. Pamiêtaj, po trzy sztuki ka¿dego.
    AI_Output (other, self ,"DIA_Claw_Okup_15_07"); //Dobra. Spróbujê to zrobiæ jak najszybciej.
    AI_Output (self, other ,"DIA_Claw_Okup_03_08"); //Bêdê wdziêczny.
    MIS_PlantsForClaw = LOG_RUNNING;

    Log_CreateTopic            (CH3_PlantsForClaw, LOG_MISSION);
    Log_SetTopicStatus       (CH3_PlantsForClaw, LOG_RUNNING);
    B_LogEntry                     (CH3_PlantsForClaw,"Claw dorzuci siê na okup za Alexa, je¿eli przyniosê mu po trzy sztuki ziela: górskiego, nadmorskiego, polnego i leczniczego (chodzi o najs³absze ziele).");
};

//========================================
//-----------------> MamZiele
//========================================

INSTANCE DIA_Claw_MamZiele (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 3;
   condition    = DIA_Claw_MamZiele_Condition;
   information  = DIA_Claw_MamZiele_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi³eœ.";
};

FUNC INT DIA_Claw_MamZiele_Condition()
{
    if (MIS_PlantsForClaw == LOG_RUNNING)
    && (Npc_HasItems (other, ItFo_Plants_Herb_01) >=3)
    && (Npc_HasItems (other, ItFo_FieldHerb) >=3)
    && (Npc_HasItems (other, ItFo_MountainHerb) >=3)
    && (Npc_HasItems (other, ItFo_SeaHerb) >=3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_MamZiele_Info()
{
    AI_Output (other, self ,"DIA_Claw_MamZiele_15_01"); //Mam to, o co prosi³eœ.
    AI_Output (self, other ,"DIA_Claw_MamZiele_03_02"); //Œwietnie. Masz tu moje oszczêdnoœci.
    AI_Output (other, self ,"DIA_Claw_MamZiele_15_03"); //Dziêkujê. Przydadz¹ siê.
    B_LogEntry                     (CH3_PlantsForClaw,"Odda³em Clawowi roœliny. Otrzyma³em 200 bry³ek rudy na zap³atê okupu.");
    Log_SetTopicStatus       (CH3_PlantsForClaw, LOG_SUCCESS);
    MIS_PlantsForClaw = LOG_SUCCESS;

    B_GiveXP (250);
    B_GiveInvItems (other, self, ItFo_Plants_Herb_01, 3);
    B_GiveInvItems (other, self, ItFo_SeaHerb, 3);
    B_GiveInvItems (other, self, ItFo_MountainHerb, 3);
    B_GiveInvItems (other, self, ItFo_FieldHerb, 3);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RinG
//========================================

INSTANCE DIA_Claw_RinG (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_RinG_Condition;
   information  = DIA_Claw_RinG_Info;
   permanent	= FALSE;
   description	= "Mam twój pierœcieñ.";
};

FUNC INT DIA_Claw_RinG_Condition()
{
    if (Npc_HasItems (other, ClawsRing) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_RinG_Info()
{
    AI_Output (other, self ,"DIA_Claw_RinG_15_01"); //Mam twój pierœcieñ.
    AI_Output (self, other ,"DIA_Claw_RinG_03_02"); //Zosta³ mi skradziony. Gdzie go znalaz³eœ?
    AI_Output (other, self ,"DIA_Claw_RinG_15_03"); //By³ w posiadaniu goblinów. 
    AI_Output (self, other ,"DIA_Claw_RinG_03_04"); //Dziêkujê ci, ¿e go odzyska³eœ.
    B_GiveInvItems (other, self, ClawsRing, 1);
    b_givexp (200);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Help22
//========================================
var int polujclaw;
INSTANCE DIA_Claw_Help22 (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_Help22_Condition;
   information  = DIA_Claw_Help22_Info;
   permanent	= false;
   description	= "Obieca³eœ mi pomoc.";
};

FUNC INT DIA_Claw_Help22_Condition()
{
    if (MIS_SickHunter == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_Help22_Info()
{
	polujclaw = false;
    AI_Output (other, self ,"DIA_Claw_Help22_15_01"); //Obieca³eœ mi pomoc.
    AI_Output (self, other ,"DIA_Claw_Help22_03_02"); //Je¿eli bêdê ci potrzebny, powiedz tylko.
};

//========================================
//-----------------> ZAMNA
//========================================

INSTANCE DIA_Claw_ZAMNA (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 888;
   condition    = DIA_Claw_ZAMNA_Condition;
   information  = DIA_Claw_ZAMNA_Info;
   permanent	= true;
   description	= "Za mn¹!";
};

FUNC INT DIA_Claw_ZAMNA_Condition()
{
    if (polujClaw == false)
	&& (Npc_KnowsInfo (hero, DIA_Claw_Help22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_ZAMNA_Info()
{
    AI_Output (other, self ,"DIA_Claw_ZAMNA_15_01"); //Za mn¹!
    Npc_ExchangeRoutine (self, "follow");
    polujClaw = true;
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> COmeBack
//========================================

INSTANCE DIA_Claw_COmeBack (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 889;
   condition    = DIA_Claw_COmeBack_Condition;
   information  = DIA_Claw_COmeBack_Info;
   permanent	= true;
   description	= "Wracaj do obozu!";
};

FUNC INT DIA_Claw_COmeBack_Condition()
{
    if (polujClaw == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_COmeBack_Info()
{
    AI_Output (other, self ,"DIA_Claw_COmeBack_15_01"); //Wracaj do obozu!
    Npc_ExchangeRoutine (self, "start");
    self.aivar[AIV_PARTYMEMBER] = false;
    polujClaw = false;
};

//========================================
//-----------------> GivePotion
//========================================

INSTANCE DIA_Claw_GivePotion (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 990;
   condition    = DIA_Claw_GivePotion_Condition;
   information  = DIA_Claw_GivePotion_Info;
   permanent	= true;
   description	= "(Daj miksturê uzdrawiaj¹c¹)";
};

FUNC INT DIA_Claw_GivePotion_Condition()
{
    if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_GivePotion_Info()
{
    Info_ClearChoices	(DIA_Claw_GivePotion);
	Info_AddChoice		(DIA_Claw_GivePotion, DIALOG_BACK, DIA_Claw_GivePotion_B);
	IF (Npc_HasItems (other, ItFo_Potion_Health_01) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma³¹ miksturê)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj œredni¹ miksturê)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du¿¹ miksturê)", DIA_Claw_GivePotion_D);
	};
};

FUNC VOID DIA_Claw_GivePotion_B ()
{
	Info_ClearChoices	(DIA_Claw_GivePotion);
};

FUNC VOID DIA_Claw_GivePotion_M ()
{
	B_GiveInvItems (hero, self, ItFo_Potion_Health_01, 1);
	AI_USEITEM (self, ItFo_Potion_Health_01);

	Info_ClearChoices	(DIA_Claw_GivePotion);
	Info_AddChoice		(DIA_Claw_GivePotion, DIALOG_BACK, DIA_Claw_GivePotion_B);
	IF (Npc_HasItems (other, ItFo_Potion_Health_01) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma³¹ miksturê)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj œredni¹ miksturê)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du¿¹ miksturê)", DIA_Claw_GivePotion_D);
	};
};

FUNC VOID DIA_Claw_GivePotion_S ()
{
	B_GiveInvItems (hero, self, ItFo_Potion_Health_02, 1);
	AI_USEITEM (self, ItFo_Potion_Health_02);

	Info_ClearChoices	(DIA_Claw_GivePotion);
	Info_AddChoice		(DIA_Claw_GivePotion, DIALOG_BACK, DIA_Claw_GivePotion_B);
	IF (Npc_HasItems (other, ItFo_Potion_Health_01) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma³¹ miksturê)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj œredni¹ miksturê)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du¿¹ miksturê)", DIA_Claw_GivePotion_D);
	};
};

FUNC VOID DIA_Claw_GivePotion_D ()
{
	B_GiveInvItems (hero, self, ItFo_Potion_Health_03, 1);
	AI_USEITEM (self, ItFo_Potion_Health_03);

	Info_ClearChoices	(DIA_Claw_GivePotion);
	Info_AddChoice		(DIA_Claw_GivePotion, DIALOG_BACK, DIA_Claw_GivePotion_B);
	IF (Npc_HasItems (other, ItFo_Potion_Health_01) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma³¹ miksturê)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj œredni¹ miksturê)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du¿¹ miksturê)", DIA_Claw_GivePotion_D);
	};
};

//========================================
//-----------------> MocPotions
//========================================

INSTANCE DIA_Claw_MocPotions (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 890;
   condition    = DIA_Claw_MocPotions_Condition;
   information  = DIA_Claw_MocPotions_Info;
   permanent	= FALSE;
   description	= "Olivier kaza³ zapytaæ ciê o mikstury si³y.";
};

FUNC INT DIA_Claw_MocPotions_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Olivier_HELLO3))
    && (MIS_MorakhHunting == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_MocPotions_Info()
{
    AI_Output (other, self ,"DIA_Claw_MocPotions_15_01"); //Olivier kaza³ zapytaæ ciê o tymczasowe mikstury si³y.
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_02"); //Aby je przygotowaæ, musisz znaæ siê na alchemii. Mogê ciê nauczyæ, je¿eli chcesz.
    AI_Output (other, self ,"DIA_Claw_MocPotions_15_03"); //A co je¿eli nie za dobrze mi wychodzi ta ca³a alchemia?
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_04"); //Có¿, mogê daæ ci najsilniejsz¹ miksturê si³y jak¹ mam, albo ksi¹¿kê z odpowiednimi przepisami. 
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_05"); //Co wybierasz?

    Info_ClearChoices		(DIA_Claw_MocPotions);
    Info_AddChoice		(DIA_Claw_MocPotions, "Chcê dostaæ te przepisy.", DIA_Claw_MocPotions_Ksiega);
    Info_AddChoice		(DIA_Claw_MocPotions, "Chcê dostaæ miksturê si³y,", DIA_Claw_MocPotions_Mixtura);
};

FUNC VOID DIA_Claw_MocPotions_Ksiega()
{
    AI_Output (other, self ,"DIA_Claw_MocPotions_Ksiega_15_01"); //Chcê dostaæ te przepisy.
    AI_Output (self, other ,"DIA_Claw_MocPotions_Ksiega_03_02"); //M¹dry wybór. WeŸ tê ksi¹¿kê.
    CreateInvItems (self, ItWr_AlchemyTimedPotions, 1);
    B_GiveInvItems (self, other, ItWr_AlchemyTimedPotions, 1);
    Info_ClearChoices		(DIA_Claw_MocPotions);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Claw_MocPotions_Mixtura()
{
    AI_Output (other, self ,"DIA_Claw_MocPotions_Mixtura_15_01"); //Chcê dostaæ miksturê si³y.
    AI_Output (self, other ,"DIA_Claw_MocPotions_Mixtura_03_02"); //Proszê bardzo.
    CreateInvItems (self, ItFo_PotionTime_Strength_01, 1);
    B_GiveInvItems (self, other, ItFo_PotionTime_Strength_01, 1);
    Info_ClearChoices		(DIA_Claw_MocPotions);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> MIX_MAX_HEAL
//========================================

INSTANCE DIA_Claw_MIX_MAX_HEAL (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 1;
   condition    = DIA_Claw_MIX_MAX_HEAL_Condition;
   information  = DIA_Claw_MIX_MAX_HEAL_Info;
   permanent	= FALSE;
   description	= "Mo¿esz przyrz¹dziæ miksturê ca³kowitego uzdrowienia?";
};

FUNC INT DIA_Claw_MIX_MAX_HEAL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_HELP))
    && (Jim_odrzucilem == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_MIX_MAX_HEAL_Info()
{
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_01"); //Mo¿esz przyrz¹dziæ miksturê ca³kowitego uzdrowienia?
    AI_Output (self, other ,"DIA_Claw_MIX_MAX_HEAL_03_02"); //Nie. Przyrz¹dzenie takiej mikstury wymaga profesjonalnej pracowni, wielkiej wprawy i niekiedy magii.
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_03"); //Wiesz gdzie mogê zdobyæ taki eliksir? Pewien cz³owiek jest ranny, a na pomoc magów nie mam co liczyæ.
    AI_Output (self, other ,"DIA_Claw_MIX_MAX_HEAL_03_04"); //Mia³em kiedyœ podobny napój, jednak zgubi³em go podczas polowania nieopodal Starej Kopalni. Wystarczy³oby dodaæ jeden sk³adnik i mikstura mia³aby w³aœciwoœci lecznicze.
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_05"); //Œwietnie, postaram siê odnaleŸæ ten eliksir.
    B_LogEntry                     (CH1_RannyWojownik,"Claw mo¿e sporz¹dziæ lekarstwo, jednak potrzebuje mikstury, któr¹ zgubi³ niedaleko Starej Kopalni. Muszê j¹ odnaleŸæ.");

    B_GiveXP (50);
	
	Npc_ExchangeRoutine (VLK_7011_kopacz,"searching");
};

//========================================
//-----------------> FIND_POTION
//========================================

INSTANCE DIA_Claw_FIND_POTION (C_INFO)
{
   npc          = NON_5603_Claw;
   nr           = 2;
   condition    = DIA_Claw_FIND_POTION_Condition;
   information  = DIA_Claw_FIND_POTION_Info;
   permanent	= FALSE;
   description	= "Znalaz³em ten napój.";
};

FUNC INT DIA_Claw_FIND_POTION_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Claw_MIX_MAX_HEAL))
    && (Npc_HasItems (other, StrangePotion) >=1)
    && (MIS_RannyWojownik == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Claw_FIND_POTION_Info()
{
    AI_Output (other, self ,"DIA_Claw_FIND_POTION_15_01"); //Znalaz³em ten napój.
    AI_Output (self, other ,"DIA_Claw_FIND_POTION_03_02"); //W porz¹dku, zaraz sporz¹dzê miksturê uzdrawiaj¹c¹.
    AI_Output (self, other ,"DIA_Claw_FIND_POTION_03_03"); //Gotowe. Oto mikstura.
    AI_Output (other, self ,"DIA_Claw_FIND_POTION_15_04"); //Dziêki.
    B_LogEntry                     (CH1_RannyWojownik,"Claw sporz¹dzi³ lekarstwo. Powinienem jak najszybciej udaæ siê do Gerarda.");
	B_GiveInvItems (other, self, StrangePotion, 1);
		CreateInvItems (self, GerardPotion, 1);
        B_GiveInvItems (self, other, GerardPotion, 1);
    B_GiveXP (400);
    AI_StopProcessInfos	(self);
};

