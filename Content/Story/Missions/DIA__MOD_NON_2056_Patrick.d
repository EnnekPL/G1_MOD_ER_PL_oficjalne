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
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_02"); //Czekam na wejœcie do kopalni. Artegor nie chce nas wpuœciæ.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_03"); //Ja ju¿ tu kiedyœ by³em, ale tych dwóch jest nowych.
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_04"); //Trudno jest siê dostaæ do kopalni?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_05"); //Nie, trzeba pogadaæ z miejscowymi, ¿eby ciê poparli.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_06"); //Artegor, mimo swojej powierzchownoœci, nie jest zbyt wymagaj¹cy.
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
   description	= "D³ugo ju¿ tu czekasz?";
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
    AI_Output (other, self ,"DIA_Patrick_HELLO2_15_01"); //D³ugo ju¿ tu czekasz?
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
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_02"); //Pilnuje wejœcia do kopalni. To trudny cz³owiek. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_03"); //Nie jednego Kopacza ju¿ powiesi³.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_04"); //Pewnego dnia dwóch robotników postanowi³o wleŸæ na palisadê i szybko pobiec do kopalni.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_05"); //Gdy zeskakiwali, dorwa³ ich i zmia¿d¿y³ im czaszki. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_06"); //To by³ straszny widok. 
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_07"); //Lepiej z nim nie zadzieraæ.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_08"); //Dok³adnie. Choæ teraz jest spokojniejszy.
};

FUNC VOID DIA_Patrick_HELLO3_Matt()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Matt_15_01"); //...Macie.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_02"); //Matt to nasz kucharz.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_03"); //Mo¿na u niego kupiæ coœ ciep³ego.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_04"); //Jest mi³y dla nowych.
};

FUNC VOID DIA_Patrick_HELLO3_Gamal()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Gamal_15_01"); //...Petro.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_02"); //Petro? To pupilek Lorenzo. Wykonuje dla niego ró¿ne œmieciowe zlecenia.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_03"); //Ale jego g³ównym zadaniem jest pilnowanie, aby nowi Kopacze dotarli do Kopalni w jednym kawa³ku. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_04"); //Zarozumia³y typ. Nie przepadam za nim. 
};

FUNC VOID DIA_Patrick_HELLO3_Spike()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Spike_15_01"); //...Spike'u.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_02"); //Nie znam go za dobrze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_03"); //Wiem tylko, ¿e czegoœ tam pilnuje.
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
   description	= "Co mo¿esz mi powiedzieæ o Artchu i Mirzo?";
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
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_01"); //Co mo¿esz mi powiedzieæ o Artchu i Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_02"); //Co nieco mogê ci o nich powiedzieæ.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_03"); //Artch bardzo dok³adnie wykonuje swoj¹ pracê. Myœlê, ¿e obawia siê Magnatów.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_04"); //Jego poprzednik nie skoñczy³ zbyt dobrze.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_05"); //Myœlê, ¿e jest lojalny wzglêdem Starego Obozu.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_06"); //A Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_07"); //Hmm... Ten cz³owiek na milê œmierdzi brudnymi sprawkami.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_08"); //Kilka nocy temu nie mog³em zasn¹æ. Postanowi³em wiêc przejœæ siê po obozie.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_09"); //Widzia³em jak Mirzo obudzi³ siê, rozejrza³ nerwowo i cichaczem opuœci³ obóz.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_10"); //Wiesz, dok¹d móg³ siê udaæ?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_11"); //Nie, ale jak chcesz siê tego dowiedzieæ, to lepiej poczekaj a¿ zapadnie zmrok.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_12"); //Zaczaj siê gdzieœ i jak zobaczysz, ¿e Mirzo opuszcza obóz, idŸ za nim.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_13"); //Dziêki za radê.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_14"); //Nie ma sprawy.
    B_LogEntry                     (CH1_FoodForOldMine,"W koñcu jakieœ konkrety. Patrick twierdzi, ¿e widzia³ jak Mirzo opuszcza³ obóz po zmroku. Lepiej poczekam, a¿ siê œciemni.");
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
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_01"); //Nie idŸ tam.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_02"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_03"); //Stra¿nicy atakuj¹ kogo popadnie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_04"); //Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê.
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_05"); //Znam ju¿ tê historiê. Powiedz mi lepiej, co dzieje siê w obozie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_06"); //Tu te¿ nie jest najlepiej. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_07"); //Wszystko zaczê³o siê od tego, ¿e po zawaleniu siê Starej Kopalni Gomez wys³a³ Arto do obozu.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_08"); //Mia³ obj¹æ tam w³adzê i ogarn¹æ ca³¹ tê sytuacjê.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_09"); //Wtedy Artegor zebra³ grupê lojalnych Stra¿ników i zabi³ Arto.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_10"); //Chcia³ stworzyæ w³asny, niezale¿ny obóz.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_11"); //Kiedy to siê sta³o?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_12"); //Niedawno. Po tym ca³ym buncie postanowi³em uciec.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_13"); //Zrobi³o siê tam zbyt niebezpiecznie.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_14"); //Gomez ju¿ wie, ¿e straci³ w³adzê w obozie przy kopalni?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_15"); //Na szczêœcie nie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_16"); //Gdy siê o tym dowie, rozpêta siê tu piek³o!
    }
    else
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_17"); //Nie s³ysza³em o tym! Mów dalej.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_18"); //Jeden z Kopaczy, któremu uda³o siê uratowaæ, powiedzia³, ¿e kopi¹c na najni¿szym poziomie, trafili na podziemn¹ rzekê.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_19"); //Kiedy woda wdar³a siê do szybów, popêka³y podpory i runê³a ca³a górna czêœæ.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_20"); //Tylko garstce ludzi uda³o siê wydostaæ na powierzchniê.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_21"); //A co dzieje siê w Starym Obozie?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_22"); //Tego nie wiem. Nie by³em tam. Nie mamy ¿adnych wieœci.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_23"); //Co z obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_24"); //Wszystko zaczê³o siê od tego, ¿e po zawaleniu siê Starej Kopalni Gomez wys³a³ Arto do obozu.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_25"); //Mia³ obj¹æ tam w³adzê i ogarn¹æ ca³¹ tê sytuacjê.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_26"); //Wtedy Artegor zebra³ grupê lojalnych Stra¿ników i zabi³ Arto.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_27"); //Chcia³ stworzyæ w³asny, niezale¿ny obóz.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_28"); //Kiedy to siê sta³o?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_29"); //Niedawno. Po tym ca³ym buncie postanowi³em uciec.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_30"); //Gomez ju¿ wie, ¿e straci³ w³adzê w obozie przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_31"); //Na szczêœcie nie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_32"); //Gdy siê o tym dowie, rozpêta siê tu piek³o!
    };

    if (MIS_SytucajaWOM == LOG_RUNNING)
    {
        B_LogEntry                     (CH1_SytucajaWOM,"Od Patricka dowiedzia³em siê, ¿e Gomez wys³a³ Arto do obozu przy kopalni. Magnat mia³ tam przez jakiœ czas sprawowaæ w³adzê i uspokoiæ ca³¹ tê sytuacjê, jednak podstêpny szef Stra¿ników, Artegor, postanowi³ go zabiæ i sam obj¹æ w³adzê w obozie. Gdy Gomez dowie siê, ¿e utraci³ wp³ywy tak¿e w obozie przed Star¹ kopalni¹, wœcieknie siê.");

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
   description	= "Wiesz coœ o Stra¿nikach z Bractwa?";
};

FUNC INT DIA_Patrick_Brothers_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_Questdadasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Brothers_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_01"); //Wiesz coœ o Stra¿nikach z Bractwa?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_02"); //Chodzi ci o tych podobnych tobie?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_03"); //Zostali uwiêzieni za bram¹ do kopalni.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_04"); //Widzia³em tylko trzech.   
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_06"); //Masz zamiar ich odbiæ?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_07"); //Zapomnij o tym! Stra¿nicy od razu ciê poszatkuj¹.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_08"); //Co wiêc mam zrobiæ?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_09"); //Podobno Bandyci chc¹ poinformowaæ Gomeza o tym, co siê tutaj sta³o.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_10"); //Je¿eli Magnat dowie siê, ¿e do reszty straci³ kontrolê nad tym miejscem, zaatakuje buntowników.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_11"); //Przy odrobinie szczêœcia powybijaj¹ siê nawzajem.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_12"); //Gdzie znajdê tych Bandytów?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_13"); //Jeden z nich stoi przy jaskini i bada sytuacjê. 
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_14"); //Spróbuj zaoferowaæ mu swoj¹ pomoc.
    B_LogEntry                     (CH1_HelpBrothersBra,"Kopacz Patrick zdradzi³ mi, ¿e moi Bracia z obozu na bagnie ¿yj¹, jednak s¹ uwiêzieni przez ludzi Artegora. Jedynym sposobem na dostanie siê do Stra¿ników Œwi¹tynnych jest pozbycie siê Artegora i ca³ej tej jego bandy. Podobno Bandyci maj¹ na to jakiœ sposób.");

    B_GiveXP (50);

};