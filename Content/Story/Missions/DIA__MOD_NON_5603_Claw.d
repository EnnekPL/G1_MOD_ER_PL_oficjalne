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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Claw_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Claw_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Claw_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_02"); //Nazywam si� Claw, obozowy alchemik.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_03"); //Przygotowuj� proste mikstury i zupy dla my�liwych.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_04"); //Dawno temu mia�em kontakt z Go�cami Le�nymi na Myrtanie. Wiele si� od nich nauczy�em.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_05"); //Znam alternatywne przepisy na mikstury many i zdrowia.
    AI_Output (self, other ,"DIA_Claw_HELLO1_03_06"); //Mog� ci te� sporo powiedzie� o warzeniu mikstur i o le�nych zio�ach.
	AI_Output (other, self ,"DIA_Claw_HELLO1_15_07"); //Jeste� bardzo uprzejmy.
	AI_Output (self, other ,"DIA_Claw_HELLO1_03_08"); //Po prostu rzadko mam okazj� z kim� porozmawia�. Na og� wszyscy s� bardzo zaj�ci.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); 
	B_LogEntry		(GE_TeacherOW,"Claw to alchemik w obozie my�liwych. Nauczy mnie alternatywnych receptur na mikstur� many oraz zdrowia. Mo�e mi tak�e opowiedzie� o sk�adnikach alchemicznych.");
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
   description	= "Za co tutaj trafi�e�?";
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
    AI_Output (other, self ,"DIA_Claw_Cel_15_01"); //Za co tutaj trafi�e�?
    AI_Output (self, other ,"DIA_Claw_Cel_03_02"); //W sumie to za nic wielkiego. Pewnego zimowego wieczoru napadli�my na karawan� wioz�c� �ywno�� do Trelis. 
    AI_Output (self, other ,"DIA_Claw_Cel_03_03"); //Zabrali�my skrzyni� z chlebem i uciekli�my do lasu. W starych ruinach za�o�yli�my ob�z. Rankiem, gdy si� obudzi�em, by�em ju� skuty. 
    AI_Output (other, self ,"DIA_Claw_Cel_15_04"); //To przykre.
    AI_Output (self, other ,"DIA_Claw_Cel_03_05"); //Czy ja wiem... Pobyt w Kolonii odmieni� moje �ycie. Sporo si� nauczy�em. �ycie tutaj niezbyt r�ni si� od tego, co robi�em na Myrtanie.
    AI_Output (self, other ,"DIA_Claw_Cel_03_06"); //Tam po prostu mia�em wi�cej przestrzeni.
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
   description	= "Nauka alchemii. (10 punkt�w nauki, 200 bry�ek rudy)";
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
    AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_02"); //Podstaw� alchemii jest stosowanie si� do tego, co jest napisane w recepturach i ksi�gach.
    AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_03"); //Pami�taj, �eby by� ostro�nym. Ka�d� czynno�� wykonuj powoli, z opanowaniem.
    Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
	PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.lp = hero.lp - 10;
	DIA_Claw_AlchemyLearn.permanent = false;
	B_GiveInvItems (other, self, ItMiNugget, 200);
	} else {
	AI_Output (self, other ,"DIA_Claw_AlchemyLearn_03_04"); //Nie mog� ci� tego nauczy�!
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
    AI_Output (self, other ,"DIA_Claw_HELLO2_03_02"); //Jak� receptur� konkretnie chcesz pozna�?

    Info_ClearChoices		(DIA_Claw_HELLO2);
    Info_AddChoice		(DIA_Claw_HELLO2, DIALOG_BACK, DIA_Claw_HELLO2_BACK);
	if (Knows_AlternativeHPmix == false)
	{
    Info_AddChoice		(DIA_Claw_HELLO2, "Jak zrobi� mikstur� uzdrowienia?", DIA_Claw_HELLO2_MixHP);
	};
	if (Knows_AlternativeMANAmix == false)
	{
    Info_AddChoice		(DIA_Claw_HELLO2, "Jak zrobi� mikstur� many?", DIA_Claw_HELLO2_MixMana);
	};
};

FUNC VOID DIA_Claw_HELLO2_BACK()
{
    Info_ClearChoices		(DIA_Claw_HELLO2);
};

FUNC VOID DIA_Claw_HELLO2_MixHP()
{
    AI_Output (other, self ,"DIA_Claw_HELLO2_MixHP_15_01"); //Jak zrobi� mikstur� uzdrowienia z le�nych zi�?
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_02"); //Potrzebujesz dw�ch serafis�w i bagiennego ziela.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_03"); //To wszystko gotujesz i ostro�nie mieszasz dodaj�c cukier.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixHP_03_04"); //To wszystko. Uwa�aj na siebie. 
    Knows_AlternativeHPmix = true;
};

FUNC VOID DIA_Claw_HELLO2_MixMana()
{
    AI_Output (other, self ,"DIA_Claw_HELLO2_MixMana_15_01"); //Jak zrobi� mikstur� many z le�nych zi�?
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_02"); //Potrzeba cztery jagody i jeden serafis. Przyda si� r�wnie� s�l.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_03"); //Musisz rozdrobni� serafisa nim go dodasz do mikstury.
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_04"); //To wa�ne!
    AI_Output (self, other ,"DIA_Claw_HELLO2_MixMana_03_05"); //Pami�taj o tym.
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
   description	= "Opowiedz mi o ro�linach leczniczych.";
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
    AI_Output (other, self ,"DIA_Claw_HealPlants_15_01"); //Opowiedz mi o ro�linach leczniczych.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_02"); //Ro�liny lecznicze to obszerny temat. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_03"); //Alchemicy dziel� je na r�ne grupy.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_04"); //Pierwsz� z nich s� owoce lecznicze. Najwi�cej takich ro�lin znajdziesz w lasach.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_05"); //S� to rozmaite jagody, serafisy, ogniociernie i niezwykle rzadkie velaisy. My�liwi cz�sto myl� je ze zwyk�ymi le�nymi owocami. Nie wiedz�, �e ka�dy alchemik ch�tnie je kupi. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_06"); //Dobry alchemik potrafi z owoc�w lasu sporz�dzi� mikstur�, kt�ra stale zwi�kszy jego energi� �yciow�.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_07"); //Warto wi�c je trzyma�, a nie zjada� od razu. W nag�ych wypadkach lepiej u�y� mikstury lub innego zio�a. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_08"); //Drug� grup� s� mchy. Znane nam s� ich dwa rodzaje. Mech g�rski i nagrobny.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_09"); //Ma�o o nich wiem. Gdyby� czego� si� dowiedzia�, to daj mi zna�.
    AI_Output (other, self ,"DIA_Claw_HealPlants_15_10"); //Jasne. A inne grupy?
    AI_Output (self,other ,"DIA_Claw_HealPlants_15_11"); //Trzeci� grup� s� zio�a. Najbardziej znane i cenione przez alchemik�w, gdy� mo�na z nich tworzy� ciekawe mikstury nie wp�ywaj�ce tylko na zdrowie, lecz na ca�y organizm.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_12"); //Do tej grupy nale�y mi�dzy innymi: psianka, kocianka, orkowe ziele i zwyczajne zio�a lecznicze.
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_13"); //Zio�a lecznicze �atwo pozna� po ��tych i zielonych li�ciach. Te mocniejsze maj� ich wi�cej. 
    AI_Output (self, other ,"DIA_Claw_HealPlants_03_14"); //Mikstury najlepiej przyrz�dza� w�a�nie ze zwyk�ych zi� leczniczych. Pozosta�e mimo leczniczych w�a�ciwo�ci nie nadaj� si� do tego najlepiej. 
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
   description	= "Opowiedz mi o zio�ach many.";
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
    AI_Output (other, self ,"DIA_Claw_ManaPlants_15_01"); //Opowiedz mi o zio�ach many.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_02"); //Na magiczn� energi� drzemi�c� wp�ywaj� r�norodne zio�a i nasiona.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_03"); //Najbardziej znane to krucze ziele i czarne ziele. To w�a�nie z nich najlepiej wyrabia� mikstury odnawiaj�ce man�.
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_04"); //Warto tak�e wspomnie� o korzeniach. Dragot i twardzie� z pewno�ci� s� ci znane. Pono� te niepozorne ro�liny maj� w sobie du�� moc. Jednak ma�o kto potrafi przygotowywa� z nich mikstury. 
    AI_Output (self, other ,"DIA_Claw_ManaPlants_03_05"); //Nasiona d�bu i buka r�wnie� maj� w�a�ciwo�ci magiczne. Niestety, dok�adniej nie s� mi one znane. 
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
   description	= "Powiedz mi co� wi�cej o innych ro�linach.";
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
    AI_Output (other, self ,"DIA_Claw_AllPlants_15_01"); //Powiedz mi co� wi�cej o innych ro�linach.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_02"); //W Kolonii szczeg�lnie popularne jest bagienne ziele, z kt�rego mo�na wytwarza� skr�ty.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_03"); //Jego hodowla jest bardzo dochodowa i ma�o wymagaj�ca. Jak sama nazwa m�wi bagienne ziele ro�nie na podmok�ym terenie.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_04"); //Jest niezwykle cenne, gdy� jest sk�adnikiem wielu mikstur stale zwi�kszaj�cych atrybuty.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_05"); //Ze znanych mi grzyb�w mog� wymieni� piekielniki i gorzki chleb. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_06"); //S� to zwyczajne grzyby stosowane raczej przez kucharzy ni� alchemik�w. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_07"); //Kr��� te� legendy o �wietlistym grzybie. Nigdy nie widzia�em czego� takiego, jednak s�ysza�em, �e istniej� naprawd�.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_08"); //Z wygl�du przypominaj� zwyk�e grzyby, jednak maj� pomara�czowy i sp�aszczony kapelusz.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_09"); //Gdyby� kiedykolwiek znalaz� takiego grzyba, nie sprzedawaj go byle komu.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_10"); //Jak ju� m�wimy og�lnie o zieleninie, to warto r�wnie� wspomnie� o glonach. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_11"); //Maj� ma�� warto�� dla alchemika. Niekt�rzy my�liwi jednak je skupuj�.
    AI_Output (other, self ,"DIA_Claw_AllPlants_15_12"); //A co ze zwyk�ymi zio�ami?
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_13"); //Ach tak. Zapomnia�em o nich. 
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_14"); //Ich nazwy pochodz� od miejsca wyst�powania.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_15"); //G�rskie ziele lubi wy�yny. Mo�na je wykorzysta� do wytworzenia wywaru many.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_16"); //Polne ziele znajdziesz na r�wninach. Przyda si� przy warzeniu mikstury zr�czno�ci.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_17"); //Le�ne ziele ro�nie w�r�d le�nego runa. Cenione przez wojownik�w, gdy� mo�na z niego sporz�dzi� wywar si�y.
    AI_Output (self, other ,"DIA_Claw_AllPlants_03_18"); //Nadmorskie ziele znajdziesz na wybrze�ach. Ma charakterystyczny wygl�d. Przyda si�, gdy b�dziesz chcia� zwi�kszy� swoj� si�� �yciow�.
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
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_01"); //Ch�opcze, potrzebuj� twojej pomocy!
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_02"); //Co si� dzieje?
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_03"); //Polowa�em ostatnio w okolicach Bractwa i zosta�em zaatakowany przez jaszczura.
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_04"); //Co w zwi�zku z tym?
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_05"); //Ten jaszczur to jaki� inny gatunek. Zosta�em zatruty.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_06"); //Niestety, nie potrafi� sporz�dzi� odtrutki. Nie znam przepisu.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_07"); //A poza tym jestem zbyt s�aby, �eby cokolwiek robi�.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_08"); //Id� do obozu na bagnie i poszukaj dla mnie pomocy.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_09"); //Prosz�. Umieram.
    AI_Output (hero, self ,"DIA_Claw_Kapitel2Mission_15_10"); //Natychmiast ruszam w drog�.
    AI_Output (self, hero ,"DIA_Claw_Kapitel2Mission_03_11"); //Dzi�kuj�. We� te wywary. Przydadz� ci si�.
    CreateInvItems (self, ItFo_Potion_Mana_01, 2);
    B_GiveInvItems (self, hero, ItFo_Potion_Mana_01, 2);
    CreateInvItems (self, ItFo_Potion_Health_01, 2);
    B_GiveInvItems (self, hero, ItFo_Potion_Health_01, 2);
    MIS_SickHunter = LOG_RUNNING;
	Wld_InsertNpc				(WaranJadowity,"WARAN_JADOWITY");
	Npc_ExchangeRoutine (NON_5603_Claw,"chory");
    Log_CreateTopic            (CH2_SickHunter, LOG_MISSION);
    Log_SetTopicStatus       (CH2_SickHunter, LOG_RUNNING);
    B_LogEntry                     (CH2_SickHunter,"My�liwy Claw zosta� zatruty przez podejrzanego jaszczura. Musz� i�� do Bractwa i poszuka� odtrutki dla my�liwego. ");
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
   description	= "Jak wygl�da� ten jaszczur?";
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
    AI_Output (other, self ,"DIA_Claw_SKINJASZ_15_01"); //Jak wygl�da� ten jaszczur?
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_02"); //Dobre pytanie. Jego trucizna mo�e ci si� przyda� do antidotum.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_03"); //Jaszczur r�ni� si� od zwyczajnej bestii. By� zielony, a nie ��tawy.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_04"); //Bardziej powinno ci� interesowa�, gdzie przebywa.
    AI_Output (other, self ,"DIA_Claw_SKINJASZ_15_05"); //A wi�c? Gdzie to jest?
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_06"); //Spotka�em go w jaskini w okolicy obozu na bagnie. B�d� ostro�ny.
    AI_Output (self, other ,"DIA_Claw_SKINJASZ_03_07"); //W okolicy kr�ci si� sporo innych zwierz�t.
    B_LogEntry                     (CH2_SickHunter,"Jaszczura powinienem szuka� w jaskini przy obozie na bagnie. Poznam go po zielonym kolorze sk�ry.");

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
    B_LogEntry                     (CH2_SickHunter,"My�liwy otrzyma� mikstur�. ");
    Log_SetTopicStatus       (CH2_SickHunter, LOG_SUCCESS);
    MIS_SickHunter = LOG_SUCCESS;

    B_GiveXP (450);
    B_GiveInvItems (other, self, ItMi_AnitdotumNaJad, 1);
    AI_UseItem (self, ItMi_AnitdotumNaJad);
    timer_ClawQuest = 0;
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_03"); //Od razu lepiej...
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_04"); //Dzi�kuj� ci, przyjacielu.
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_05"); //We� t� rud�, jako wyraz mojej wdzi�czno�ci.
    AI_Output (self, other ,"DIA_Claw_Antybiotyk_03_06"); //Je�eli chcesz, abym pom�g� ci w polowaniu, wal �mia�o. 
    AI_Output (other, self ,"DIA_Claw_Antybiotyk_15_07"); //Dzi�ki. B�d� pami�ta�. 
    AI_Output (other, self ,"DIA_Claw_Antybiotyk_15_08"); //Trzymaj si�.
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
   description	= "Lepiej si� czujesz?";
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
    AI_Output (other, self ,"DIA_Claw_Samopoczucie_15_01"); //Lepiej si� czujesz?
    AI_Output (self, other ,"DIA_Claw_Samopoczucie_03_02"); //Tak, bardzo mi pomog�e�.
    AI_Output (self, other ,"DIA_Claw_Samopoczucie_03_03"); //Zapami�tam to sobie.
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
   description	= "Alex jest w niewoli. Potrzebujemy rudy, �eby zap�aci� okup.";
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
    AI_Output (other, self ,"DIA_Claw_Okup_15_01"); //Alex jest w niewoli. Potrzebujemy rudy, �eby zap�aci� okup.
    AI_Output (self, other ,"DIA_Claw_Okup_03_02"); //Kto go porwa�?
    AI_Output (other, self ,"DIA_Claw_Okup_15_03"); //Zosta� porwany przez Stra�nik�w na polecenie Kruka. Magnat chce za niego 1000 bry�ek rudy.
    AI_Output (self, other ,"DIA_Claw_Okup_03_04"); //Cholera, dorzuci�bym si�, ale mam tylko 200 bry�ek rudy. Jak ci je oddam, nie b�d� mia� z czego �y�.
    AI_Output (self, other ,"DIA_Claw_Okup_03_05"); //Nie mam ju� ziela, kt�re m�g�bym sprzeda� lub uwarzy� z niego eliksiry.
    AI_Output (self, other ,"DIA_Claw_Okup_03_06"); //Pos�uchaj. Przynie� mi po trzy ziela: nadmorskie, g�rskie, polne i lecznicze. Pami�taj, po trzy sztuki ka�dego.
    AI_Output (other, self ,"DIA_Claw_Okup_15_07"); //Dobra. Spr�buj� to zrobi� jak najszybciej.
    AI_Output (self, other ,"DIA_Claw_Okup_03_08"); //B�d� wdzi�czny.
    MIS_PlantsForClaw = LOG_RUNNING;

    Log_CreateTopic            (CH3_PlantsForClaw, LOG_MISSION);
    Log_SetTopicStatus       (CH3_PlantsForClaw, LOG_RUNNING);
    B_LogEntry                     (CH3_PlantsForClaw,"Claw dorzuci si� na okup za Alexa, je�eli przynios� mu po trzy sztuki ziela: g�rskiego, nadmorskiego, polnego i leczniczego (chodzi o najs�absze ziele).");
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
   description	= "Mam to, o co prosi�e�.";
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
    AI_Output (other, self ,"DIA_Claw_MamZiele_15_01"); //Mam to, o co prosi�e�.
    AI_Output (self, other ,"DIA_Claw_MamZiele_03_02"); //�wietnie. Masz tu moje oszcz�dno�ci.
    AI_Output (other, self ,"DIA_Claw_MamZiele_15_03"); //Dzi�kuj�. Przydadz� si�.
    B_LogEntry                     (CH3_PlantsForClaw,"Odda�em Clawowi ro�liny. Otrzyma�em 200 bry�ek rudy na zap�at� okupu.");
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
   description	= "Mam tw�j pier�cie�.";
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
    AI_Output (other, self ,"DIA_Claw_RinG_15_01"); //Mam tw�j pier�cie�.
    AI_Output (self, other ,"DIA_Claw_RinG_03_02"); //Zosta� mi skradziony. Gdzie go znalaz�e�?
    AI_Output (other, self ,"DIA_Claw_RinG_15_03"); //By� w posiadaniu goblin�w. 
    AI_Output (self, other ,"DIA_Claw_RinG_03_04"); //Dzi�kuj� ci, �e go odzyska�e�.
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
   description	= "Obieca�e� mi pomoc.";
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
    AI_Output (other, self ,"DIA_Claw_Help22_15_01"); //Obieca�e� mi pomoc.
    AI_Output (self, other ,"DIA_Claw_Help22_03_02"); //Je�eli b�d� ci potrzebny, powiedz tylko.
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
   description	= "Za mn�!";
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
    AI_Output (other, self ,"DIA_Claw_ZAMNA_15_01"); //Za mn�!
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
   description	= "(Daj mikstur� uzdrawiaj�c�)";
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
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma�� mikstur�)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj �redni� mikstur�)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du�� mikstur�)", DIA_Claw_GivePotion_D);
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
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma�� mikstur�)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj �redni� mikstur�)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du�� mikstur�)", DIA_Claw_GivePotion_D);
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
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma�� mikstur�)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj �redni� mikstur�)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du�� mikstur�)", DIA_Claw_GivePotion_D);
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
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj ma�� mikstur�)", DIA_Claw_GivePotion_M);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_02) >=1) 
	{
    Info_AddChoice		(DIA_Claw_GivePotion, "(Daj �redni� mikstur�)", DIA_Claw_GivePotion_S);
	};
	IF (Npc_HasItems (other, ItFo_Potion_Health_03) >=1) 
	{
	Info_AddChoice		(DIA_Claw_GivePotion, "(Daj du�� mikstur�)", DIA_Claw_GivePotion_D);
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
   description	= "Olivier kaza� zapyta� ci� o mikstury si�y.";
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
    AI_Output (other, self ,"DIA_Claw_MocPotions_15_01"); //Olivier kaza� zapyta� ci� o tymczasowe mikstury si�y.
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_02"); //Aby je przygotowa�, musisz zna� si� na alchemii. Mog� ci� nauczy�, je�eli chcesz.
    AI_Output (other, self ,"DIA_Claw_MocPotions_15_03"); //A co je�eli nie za dobrze mi wychodzi ta ca�a alchemia?
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_04"); //C�, mog� da� ci najsilniejsz� mikstur� si�y jak� mam, albo ksi��k� z odpowiednimi przepisami. 
    AI_Output (self, other ,"DIA_Claw_MocPotions_03_05"); //Co wybierasz?

    Info_ClearChoices		(DIA_Claw_MocPotions);
    Info_AddChoice		(DIA_Claw_MocPotions, "Chc� dosta� te przepisy.", DIA_Claw_MocPotions_Ksiega);
    Info_AddChoice		(DIA_Claw_MocPotions, "Chc� dosta� mikstur� si�y,", DIA_Claw_MocPotions_Mixtura);
};

FUNC VOID DIA_Claw_MocPotions_Ksiega()
{
    AI_Output (other, self ,"DIA_Claw_MocPotions_Ksiega_15_01"); //Chc� dosta� te przepisy.
    AI_Output (self, other ,"DIA_Claw_MocPotions_Ksiega_03_02"); //M�dry wyb�r. We� t� ksi��k�.
    CreateInvItems (self, ItWr_AlchemyTimedPotions, 1);
    B_GiveInvItems (self, other, ItWr_AlchemyTimedPotions, 1);
    Info_ClearChoices		(DIA_Claw_MocPotions);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Claw_MocPotions_Mixtura()
{
    AI_Output (other, self ,"DIA_Claw_MocPotions_Mixtura_15_01"); //Chc� dosta� mikstur� si�y.
    AI_Output (self, other ,"DIA_Claw_MocPotions_Mixtura_03_02"); //Prosz� bardzo.
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
   description	= "Mo�esz przyrz�dzi� mikstur� ca�kowitego uzdrowienia?";
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
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_01"); //Mo�esz przyrz�dzi� mikstur� ca�kowitego uzdrowienia?
    AI_Output (self, other ,"DIA_Claw_MIX_MAX_HEAL_03_02"); //Nie. Przyrz�dzenie takiej mikstury wymaga profesjonalnej pracowni, wielkiej wprawy i niekiedy magii.
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_03"); //Wiesz gdzie mog� zdoby� taki eliksir? Pewien cz�owiek jest ranny, a na pomoc mag�w nie mam co liczy�.
    AI_Output (self, other ,"DIA_Claw_MIX_MAX_HEAL_03_04"); //Mia�em kiedy� podobny nap�j, jednak zgubi�em go podczas polowania nieopodal Starej Kopalni. Wystarczy�oby doda� jeden sk�adnik i mikstura mia�aby w�a�ciwo�ci lecznicze.
    AI_Output (other, self ,"DIA_Claw_MIX_MAX_HEAL_15_05"); //�wietnie, postaram si� odnale�� ten eliksir.
    B_LogEntry                     (CH1_RannyWojownik,"Claw mo�e sporz�dzi� lekarstwo, jednak potrzebuje mikstury, kt�r� zgubi� niedaleko Starej Kopalni. Musz� j� odnale��.");

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
   description	= "Znalaz�em ten nap�j.";
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
    AI_Output (other, self ,"DIA_Claw_FIND_POTION_15_01"); //Znalaz�em ten nap�j.
    AI_Output (self, other ,"DIA_Claw_FIND_POTION_03_02"); //W porz�dku, zaraz sporz�dz� mikstur� uzdrawiaj�c�.
    AI_Output (self, other ,"DIA_Claw_FIND_POTION_03_03"); //Gotowe. Oto mikstura.
    AI_Output (other, self ,"DIA_Claw_FIND_POTION_15_04"); //Dzi�ki.
    B_LogEntry                     (CH1_RannyWojownik,"Claw sporz�dzi� lekarstwo. Powinienem jak najszybciej uda� si� do Gerarda.");
	B_GiveInvItems (other, self, StrangePotion, 1);
		CreateInvItems (self, GerardPotion, 1);
        B_GiveInvItems (self, other, GerardPotion, 1);
    B_GiveXP (400);
    AI_StopProcessInfos	(self);
};

