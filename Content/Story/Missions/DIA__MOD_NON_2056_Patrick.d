//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patrick_EXIT(C_INFO)
{
	npc             = NON_2056_Patrick;
	nr              = 999;
	condition	= DIA_Patrick_EXIT_Condition;
	information	= DIA_Patrick_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patrick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patrick_HELLO1 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_HELLO1_Condition;
   information  = DIA_Patrick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Patrick_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_02"); //Czekam na wejście do kopalni. Artegor nie chce nas wpuścić.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_03"); //Ja już tu kiedyś byłem, ale tych dwóch jest nowych.
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_04"); //Trudno jest się dostać do kopalni?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_05"); //Nie, trzeba pogadać z miejscowymi, żeby cię poparli.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_06"); //Artegor, mimo swojej powierzchowności, nie jest zbyt wymagający.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patrick_HELLO2 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 2;
   condition    = DIA_Patrick_HELLO2_Condition;
   information  = DIA_Patrick_HELLO2_Info;
   permanent	= FALSE;
   description	= "Długo już tu czekasz?";
};

FUNC INT DIA_Patrick_HELLO2_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO2_15_01"); //Długo już tu czekasz?
    AI_Output (self, other ,"DIA_Patrick_HELLO2_03_02"); //Kilka dni. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Patrick_HELLO3 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 3;
   condition    = DIA_Patrick_HELLO3_Condition;
   information  = DIA_Patrick_HELLO3_Info;
   permanent	= TRUE;
   description	= "Opowiedz mi o...";
};

FUNC INT DIA_Patrick_HELLO3_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_15_01"); //Opowiedz mi o...

    Info_ClearChoices		(DIA_Patrick_HELLO3);
	Info_Addchoice 		(DIA_Patrick_HELLO3, DIALOG_BACK, DIA_Patrick_HELLO3_back);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Artegorze", DIA_Patrick_HELLO3_Artegor);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Macie", DIA_Patrick_HELLO3_Matt);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Petro", DIA_Patrick_HELLO3_Gamal);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Spike", DIA_Patrick_HELLO3_Spike);
};

FUNC VOID DIA_Patrick_HELLO3_Artegor()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_01"); //...Artegorze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_02"); //Pilnuje wejścia do kopalni. To trudny człowiek. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_03"); //Nie jednego Kopacza już powiesił.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_04"); //Pewnego dnia dwóch robotników postanowiło wleźć na palisadę i szybko pobiec do kopalni.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_05"); //Gdy zeskakiwali, dorwał ich i zmiażdżył im czaszki. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_06"); //To był straszny widok. 
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_07"); //Lepiej z nim nie zadzierać.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_08"); //Dokładnie. Choć teraz jest spokojniejszy.
};

FUNC VOID DIA_Patrick_HELLO3_Matt()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Matt_15_01"); //...Macie.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_02"); //Matt to nasz kucharz.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_03"); //Można u niego kupić coś ciepłego.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_04"); //Jest miły dla nowych.
};

FUNC VOID DIA_Patrick_HELLO3_Gamal()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Gamal_15_01"); //...Petro.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_02"); //Petro? To pupilek Lorenzo. Wykonuje dla niego różne śmieciowe zlecenia.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_03"); //Ale jego głównym zadaniem jest pilnowanie, aby nowi Kopacze dotarli do Kopalni w jednym kawałku. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_04"); //Zarozumiały typ. Nie przepadam za nim. 
};

FUNC VOID DIA_Patrick_HELLO3_Spike()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Spike_15_01"); //...Spike'u.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_02"); //Nie znam go za dobrze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_03"); //Wiem tylko, że czegoś tam pilnuje.
};
FUNC VOID DIA_Patrick_HELLO3_back()
{
Info_ClearChoices		(DIA_Patrick_HELLO3);
};

//========================================
//-----------------> IanQuest
//========================================

INSTANCE DIA_Patrick_IanQuest (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_IanQuest_Condition;
   information  = DIA_Patrick_IanQuest_Info;
   permanent	= FALSE;
   description	= "Co możesz mi powiedzieć o Artchu i Mirzo?";
};

FUNC INT DIA_Patrick_IanQuest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_QuestIan)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_IanQuest_Info()
{
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_01"); //Co możesz mi powiedziea o Artchu i Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_02"); //Co nieco moge ci o nich powiedzieć.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_03"); //Artch bardzo dokładnie wykonuje swoją pracę. Myślę, że obawia sie Magnatów.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_04"); //Jego poprzednik nie skonczył zbyt dobrze.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_05"); //Myślę, że jest lojalny względem Starego Obozu.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_06"); //A Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_07"); //Hmm... Ten człowiek na mile śmierdzi brudnymi sprawkami.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_08"); //Kilka nocy temu nie mogłem zasnąć. Postanowiłem więc przejść się po obozie.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_09"); //Widziałem jak Mirzo obudził się, rozejrzał nerwowo i cichaczem opuocił obóz.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_10"); //Wiesz, dokąd mógł się udać?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_11"); //Nie, ale jak chcesz sie tego dowiedzieć, to lepiej poczekaj aż zapadnie zmrok.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_12"); //Zaczaj sie gdzieś i jak zobaczysz, że Mirzo opuszcza obóz, idź za nim.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_13"); //Dzięki za radę.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_14"); //Nie ma sprawy.
    B_LogEntry                     (CH1_FoodForOldMine,"W końcu jakieś konkrety. Patrick twierdzi, że widział jak Mirzo opuszczał obóz po zmroku. Lepiej poczekam, aż się ściemni.");
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek");
};



//========================================
//-----------------> Nieidz
//========================================

INSTANCE DIA_Patrick_Nieidz (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Nieidz_Condition;
   information  = DIA_Patrick_Nieidz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patrick_Nieidz_Condition()
{
    if (kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Nieidz_Info()
{
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_01"); //Nie idź tam.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_02"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_03"); //Strażnicy atakują kogo popadnie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_04"); //Stara Kopalnia została zalana przez podziemną rzekę.
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_05"); //Znam już tę historię. Powiedz mi lepiej, co dzieje się w obozie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_06"); //Co tu dużo mówić, to wszystko to jakiś obłęd. W ogóle od jakiegoś czasu w obozie przed kopalnią nie działo się najlepiej. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_07"); //Gdy wyszło na jaw, że dostawy nie dochodzą w całości Gomez przysłał tu Arto by przejął zarząd nad obozem i by wszystkiego dopilnował.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_08"); //Nasi nie byli zachwyceni, że przydzielono im kogoś kto miał ich nadzorować. Tym bardziej, że był z zewnątrz, a oni dotąd rządzili się liczyć sami. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_09"); //Wszystko jednak jakoś się trzymało i pewnie trzymałoby się nadal gdyby nie zawaliła się kopalnia. Potem już wszystko potoczyło się lawinowo.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_10"); //Artegor korzystając z zamieszania zebrał lojalnych mu strażników i zabił Arto, samemu przejmując władzę. Chyba dąży do stworzenia własnego obozu. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_11"); //Gomez już wie, że stracił władzę nad obozem przy kopalni?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_12"); //Na szczęście nie. Gdy się o tym dowie, rozpęta się tu piekło!
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_13"); //Po tym całym buncie zrobiło się tu cholernie niebezpiecznie, a ja nie zamierzam ginąć ani za Artegora ani tym bardziej za Gomeza. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_14"); //Co więc teraz zrobisz? 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_15"); //Nie wiem. Na razie pokręcę się tu i tam, a potem zobaczymy. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_16"); //Na pewno nie wrócę jednak tam, gdzie można stracić życie. 
    }
    else
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_17"); //Nie słyszałem o tym! Mów dalej.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_18"); //Jeden z Kopaczy, któremu udało się uratować, powiedział, że kopiąc na najniższym poziomie, trafili na podziemną rzekę.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_19"); //Kiedy woda wdarła sie do szybów, popekały podpory i runęła cała górna część.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_20"); //Tylko garstce ludzi udało sie wydostać na powierzchnię.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_21"); //A co dzieje sie w Starym Obozie?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_22"); //Tego nie wiem. Nie byłem tam. Nie mamy żadnych wieści.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_23"); //Co z obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_24"); //Co tu dużo mówić, to wszystko to jakiś obłęd. W ogóle od jakiegoś czasu w obozie przed kopalnią nie działo się najlepiej. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_25"); //Gdy wyszło na jaw, że dostawy nie dochodzą w całości Gomez przysłał tu Arto by przejął zarząd nad obozem i by wszystkiego dopilnował.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_26"); //Nasi nie byli zachwyceni, że przydzielono im kogoś kto miał ich nadzorować. Tym bardziej, że był z zewnątrz, a oni dotąd rządzili się liczyć sami. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_27"); //Wszystko jednak jakoś się trzymało i pewnie trzymałoby się nadal gdyby nie zawaliła się kopalnia. Potem już wszystko potoczyło się lawinowo.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_28"); //Co się dokładnie stało?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_29"); //Artegor korzystając z zamieszania zebrał lojalnych mu strażników i zabił Arto, samemu przejmując władzę. Chyba dąży do stworzenia własnego obozu. 
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_30"); //Gomez już wie, że stracił władzę nad obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_31"); //Na szczęście nie. Gdy się o tym dowie, rozpęta się tu piekło! Zresztą i bez tego po całym tym buncie zrobiło się tam cholernie niebezpiecznie. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_32"); //A ja nie zamierzam ginąć ani za Artegora ani tym bardziej za Gomeza. 
    };

    if (MIS_BackToOldMine == LOG_RUNNING)
    {
        B_LogEntry                     (CH4_BackToOldMine,"Od Patricka dowiedziałem się, że Gomez wysłał Arto do obozu przy kopalni. Magnat miał tam osobiście sprawować władzę i nadzorować sytuacje, jednak podstępny szef Strażników, Artegor, postanowił go zabić i sam objął władzę w obozie. Gdy Gomez dowie się, że utracił wpływy także w obozie przed Starą kopalnią, wścieknie się.");

        B_GiveXP (150);
    };
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_Patrick_Brothers (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Brothers_Condition;
   information  = DIA_Patrick_Brothers_Info;
   permanent	= FALSE;
   description	= "Wiesz coś o Strażnikach z Bractwa?";
};

FUNC INT DIA_Patrick_Brothers_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shan_Questdadasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Brothers_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_01"); //Wiesz coś o Strażnikach z Bractwa?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_02"); //Chodzi ci o tych podobnych tobie?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_03"); //Zostali uwięzieni za bramą do kopalni.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_04"); //Widziałem tylko trzech.   
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_06"); //Masz zamiar ich odbić?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_07"); //Zapomnij o tym! Strażnicy od razu cię poszatkują.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_08"); //Co więc mam zrobić?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_09"); //Podobno Bandyci chcą poinformować Gomeza o tym, co się tutaj stało.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_10"); //Jeżeli Magnat dowie się, że do reszty stracił kontrolę nad tym miejscem, zaatakuje buntowników.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_11"); //Przy odrobinie szczęścia powybijają sie nawzajem.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_12"); //Gdzie znajdę tych Bandytów?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_13"); //Jeden z nich stoi przy jaskini i bada sytuację. 
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_14"); //Spróbuj zaoferować mu swoją pomoc.
    B_LogEntry                     (CH1_HelpBrothersBra,"Kopacz Patrick zdradził mi, że moi Bracia z obozu na bagnie żyją, jednak są uwięzieni przez ludzi Artegora. Jedynym sposobem na dostanie się do Strażników Świątynnych jest pozbycie się Artegora i całej tej jego bandy. Podobno Bandyci mają na to jakiś sposób.");

    B_GiveXP (50);

};
