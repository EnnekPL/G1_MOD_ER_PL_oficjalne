instance KDF_403_Drago_RUNE (C_INFO)
{
	npc				= KDF_403_Drago;
	condition		= KDF_403_Drago_RUNE_Condition;
	information		= KDF_403_Drago_RUNE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_403_Drago_RUNE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};
func void  KDF_403_Drago_RUNE_Info()
{
	AI_Output (self, other,"KDF_403_Drago_RUNE_Info_13_01"); //Przyjmij tê runê jako znak przychylnoœci Innosa. Oby ciê chroni³a podczas marszu przez tw¹ œcie¿kê ¿ycia.
	CreateInvItem (self,ItArRuneFirebolt);
	B_GiveInvItems (self, other, ItArRuneFirebolt, 1);
	AI_StopProcessInfos	( self );
};
//------------------------------------------------------------------
//					    EXIT
//------------------------------------------------------------------
instance  KDF_403_Drago_Exit (C_INFO)
{
	npc			=  KDF_403_Drago;
	nr			=  999;
	condition	=  KDF_403_Drago_Exit_Condition;
	information	=  KDF_403_Drago_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Drago_HELLO1 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 1;
   condition    = DIA_Drago_HELLO1_Condition;
   information  = DIA_Drago_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Drago_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_02"); //Nazywam siê Drago, Mag z Krêgu Ognia. Jestem tak¿e znawc¹ magii oraz run.
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_03"); //W dawnych czasach sam wyrabia³em runy na stole runicznym, jednak odk¹d ¿yjemy otoczeni magiczn¹ Barier¹, nie muszê tego robiæ.
	AI_Output (self, other ,"DIA_Drago_HELLO1_03_04"); //Magiczne runy dostarczaj¹ nam z Zewnêtrznego Œwiata, z Klasztoru Magów Ognia w Khorinis. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Drago_HELLO2 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 2;
   condition    = DIA_Drago_HELLO2_Condition;
   information  = DIA_Drago_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ? ";
};

FUNC INT DIA_Drago_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO2_15_01"); //Mo¿esz mnie czegoœ nauczyæ? 
    AI_Output (self, other ,"DIA_Drago_HELLO2_03_02"); //Nie, synu. Nie uwa¿am, ¿eby w Kolonii zdolnoœæ wytwarzania run by³a niezbêdna. 
	AI_Output (self, other ,"DIA_Drago_HELLO2_03_03"); //Jeœli chcesz nabyæ runê magiczn¹, porozmawiaj z Torrezem, sprzedaje ich ca³e mnóstwo. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Drago_HELLO3 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 3;
   condition    = DIA_Drago_HELLO3_Condition;
   information  = DIA_Drago_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy mogê ci w czymœ pomóc?";
};

FUNC INT DIA_Drago_HELLO3_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_KDF) && (Kapitel < 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_01"); //Czy mogê ci w czymœ pomóc?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_02"); //W rzeczy samej. Teraz, gdy wiemy, ¿e s³u¿ysz Inosowi mo¿emy ciê wtajemniczyæ w nasze sprawy.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_03"); //Jak wiesz tu, w Górniczej Dolinie znajduje siê obóz na bagnie. Rezyduj¹ tam wyznawcy Œni¹cego, boga którego natury nie mo¿emy zg³êbiæ.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_04"); //Istnieje tylko trzech bogów: Innos - Pan Ognia i Sprawiedliwoœci, Adanos - Pan Wód i Równowagi oraz Beliar - W³adca Mroku i Z³a. W œwiêtej trójce nie ma miejsca dla czwartego boga.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_05"); //Nie rozumiem dlaczego, ale Guru dysponuj¹ magi¹ nadan¹ im przez Œni¹cego, tak jakby rzeczywiœcie by³ bogiem. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_06"); //Wczeœniej nie zawracaliœmy sobie g³owy wymys³ami Sekty, lecz ostatnio w Starym Obozie pojawi³o siê znacznie wiêcej ich wys³anników.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_07"); //Poleci³em jednemu z naszych Cieni, aby spróbowa³ siê od nich dowiedzieæ, co planuj¹ Guru. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_08"); //Zdaje siê, ¿e przygotowuj¹ siê do wielkiego przyzwania, w czasie którego Œni¹cy ma im pokazaæ sposób na zniszczenie Bariery.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_09"); //Do tego wszystkiego dochodzi list od mistrza Pyrokara, który nam dostarczy³eœ. Uwa¿a on, ¿e Bractwo niesie ze sob¹ ogromne zagro¿enie dla losów ca³ej Myrtany. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_10"); //Ten fakt bardzo zaniepokoi³ mistrza Corristo i zleci³ mi bardzo wa¿n¹ misjê.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_11"); //Mam dowiedzieæ siê wszystkiego o boskiej mocy, która napêdza runy Bractwa. Tu w³aœnie mam dla ciebie wa¿kie zlecenie.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_12"); //Pójdziesz do obozu na bagnie i przyniesiesz mi trzy runy z zaklêciami Œni¹cego. Zaklêcia nazywaj¹ siê: uderzenie wiatru, pirokineza i sen. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_13"); //Spiesz siê, musimy zdobyæ te runy zanim odbêdzie siê przywo³anie Œni¹cego.
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_14"); //Czy jak spróbuje je wykraœæ, nie bêdzie to czyn hañbi¹cy imiê Innosa?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_15"); //Nie, mój synu. Robisz to ku chwale Innosa i w imiê dobra, wiêc Pan Ognia przymknie oko na pochodzenie run. 
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_16"); //Zatem ruszam w drogê. 
    MIS_NEW_GOD = LOG_RUNNING;

    Log_CreateTopic          (CH2_New_God, LOG_MISSION);
    Log_SetTopicStatus       (CH2_New_God, LOG_RUNNING);
    B_LogEntry               (CH2_New_God,"Drago, Mag Ognia ze Starego Obozu musi zbadaæ, kim naprawdê jest Œni¹cy i sk¹d Guru bior¹ swoj¹ moc. Aby pomóc mu w badaniach, muszê przynieœæ trzy runy: Uderzenie Wiatru, Sen i Pirokineza.");
    AI_StopProcessInfos	(self);
};
var int herocan_askaboutresarch_drago;
//========================================
//-----------------> RUNES_ALL_HEVE
//========================================

INSTANCE DIA_Drago_RUNES_ALL_HEVE (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 1;
   condition    = DIA_Drago_RUNES_ALL_HEVE_Condition;
   information  = DIA_Drago_RUNES_ALL_HEVE_Info;
   permanent	= FALSE;
   description	= "Zdoby³em runy magii Œni¹cego, oto one.";
};

FUNC INT DIA_Drago_RUNES_ALL_HEVE_Condition()
{
    if (MIS_NEW_GOD == LOG_RUNNING)
    && (Npc_HasItems (other, ItArRuneSleep) >=1)
    && (Npc_HasItems (other, ItArRunePyrokinesis) >=1)
    && (Npc_HasItems (other, ItArRuneWindfist) >=1)
    && (kapitel < 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_RUNES_ALL_HEVE_Info()
{
    AI_Output (other, self ,"DIA_Drago_RUNES_ALL_HEVE_15_01"); //Zdoby³em runy magii Œni¹cego, oto one.
    B_GiveInvItems (other, self, ItArRuneSleep, 1);
    B_GiveInvItems (other, self, ItArRuneWindfist, 1);
    B_GiveInvItems (other, self, ItArRunePyrokinesis, 1);
    AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_02"); //Nareszcie zbadamy czym naprawdê jest Œni¹cy. Natychmiast przyst¹piê do badañ. WeŸ t¹ miksturê, przygotowa³ j¹ nasz alchemik - Damarok. 
	AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_03"); //Niech zwiêkszy ona twoje duchowe zdolnoœci. Wróæ do mnie za jakiœ czas, gdy skoñczê moje badania.
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
    B_LogEntry                     (CH2_New_God,"Odda³em wszystkie trzy runy magowi Drago. W zamian otrzyma³em potê¿na miksturê, oraz œwiadomoœæ, ¿e pomog³em Magom Ognia. Teraz muszê tylko czekaæ na wyniki badañ.");
    
	herocan_askaboutresarch_drago = true;
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RUNES_RESEARCH_PROGRESS
//========================================

INSTANCE DIA_Drago_RUNES_RESEARCH_PROGRESS (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 2;
   condition    = DIA_Drago_RUNES_RESEARCH_PROGRESS_Condition;
   information  = DIA_Drago_RUNES_RESEARCH_PROGRESS_Info;
   permanent	= true;
   description	= "I jak tam badania nad runami?";
};

FUNC INT DIA_Drago_RUNES_RESEARCH_PROGRESS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drago_RUNES_ALL_HEVE)) && (must_talk_corristo == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_RUNES_RESEARCH_PROGRESS_Info()
{
    AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_01"); //I jak tam badania nad runami?
    if (kapitel < 3)
    {
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_02"); //Wróæ póŸniej. Wci¹¿ próbujê dowiedzieæ siê jaka si³a je napêdza. Niech Innos obdaruje siê cierpliwoœci¹ bracie.
    }
    else if (kapitel == 3)
    {
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_03"); //Uda³o mi siê zg³êbiæ naturê run magii Œni¹cego! Mistrz Pyrokar ma racjê, Sekta jest powa¿nym zagro¿eniem dla naszego œwiata.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_04"); //Œni¹cy okaza³ siê byæ demonem z piek³a rodem. Omami³ on ludzi z Bractwa przedstawiaj¹c siê jako wspania³y i mi³osierny bóg, jednak w rzeczywistoœci jest wcieleniem samego Beliara.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_05"); //Manipulowa³ on Guru, którzy pozostali pod wp³ywem palonego przez nich bagiennego ziela. Chcia³ zostaæ uwolniony i przynieœæ na nas zag³adê.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_06"); //Wiem o tym. Wielkie przywo³anie okaza³o siê kompletn¹ klap¹, doprowadzi³o do œmierci Y"Beriona, duchowego przywódcy Bractwa. 
		AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_07"); //Przed œmierci¹ wielki mistrz zbudzi³ siê i obwieœci³ ¿e Œni¹cy nie jest tym, za co go uwa¿aj¹.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_08"); //Tym samym wiara w Œni¹cego zosta³a porzucona przez Sektê, a nowym przywódc¹ zosta³ Cor Angar.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_09"); //Jesteœ pewny, ¿e wszyscy porzucili wiarê w Œni¹cego?
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_10"); //Nie. Cor Kalom, zebra³ oddzia³ fanatycznych Stra¿ników Œwi¹tynnych i opuœci³ obóz. Nie chcia³ uwierzyæ w prawdziw¹ naturê Œni¹cego i postanowi³ odszukaæ go na w³asn¹ rêkê. 
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_11"); //O Innosie, powstrzymaj tego szaleñca. Pomów natychmiast z Corristo, musimy podj¹æ odpowiednie kroki.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_12"); //W porz¹dku.
		DIA_Drago_RUNES_RESEARCH_PROGRESS.permanent = false;
		B_LogEntry                     (CH2_New_God,"Drago powiedzia³ mi dok³adnie to samo, co ju¿ wiedzia³em. Œni¹cy to demon, który oszuka³ cz³onków Bractwa. Muszê szybko porozmawiaæ z Corristo. To, co dzieje siê na bagnach mo¿e wp³yn¹æ na ¿ycie wszystkich ludzi pod Barier¹.");
		must_talk_corristo = true;
		B_GiveXP (100);
    };
    AI_StopProcessInfos	(self);
};
