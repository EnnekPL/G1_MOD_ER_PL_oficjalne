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
	AI_Output (self, other,"KDF_403_Drago_RUNE_Info_13_01"); //Przyjmij t� run� jako znak przychylno�ci Innosa. Oby ci� chroni�a podczas marszu przez tw� �cie�k� �ycia.
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Drago_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_02"); //Nazywam si� Drago, Mag z Kr�gu Ognia. Jestem tak�e znawc� magii oraz run.
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_03"); //W dawnych czasach sam wyrabia�em runy na stole runicznym, jednak odk�d �yjemy otoczeni magiczn� Barier�, nie musz� tego robi�.
	AI_Output (self, other ,"DIA_Drago_HELLO1_03_04"); //Magiczne runy dostarczaj� nam z Zewn�trznego �wiata, z Klasztoru Mag�w Ognia w Khorinis. 
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
   description	= "Mo�esz mnie czego� nauczy�? ";
};

FUNC INT DIA_Drago_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO2_15_01"); //Mo�esz mnie czego� nauczy�? 
    AI_Output (self, other ,"DIA_Drago_HELLO2_03_02"); //Nie, synu. Nie uwa�am, �eby w Kolonii zdolno�� wytwarzania run by�a niezb�dna. 
	AI_Output (self, other ,"DIA_Drago_HELLO2_03_03"); //Je�li chcesz naby� run� magiczn�, porozmawiaj z Torrezem, sprzedaje ich ca�e mn�stwo. 
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
   description	= "Czy mog� ci w czym� pom�c?";
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
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_01"); //Czy mog� ci w czym� pom�c?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_02"); //W rzeczy samej. Teraz, gdy wiemy, �e s�u�ysz Inosowi mo�emy ci� wtajemniczy� w nasze sprawy.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_03"); //Jak wiesz tu, w G�rniczej Dolinie znajduje si� ob�z na bagnie. Rezyduj� tam wyznawcy �ni�cego, boga kt�rego natury nie mo�emy zg��bi�.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_04"); //Istnieje tylko trzech bog�w: Innos - Pan Ognia i Sprawiedliwo�ci, Adanos - Pan W�d i R�wnowagi oraz Beliar - W�adca Mroku i Z�a. W �wi�tej tr�jce nie ma miejsca dla czwartego boga.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_05"); //Nie rozumiem dlaczego, ale Guru dysponuj� magi� nadan� im przez �ni�cego, tak jakby rzeczywi�cie by� bogiem. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_06"); //Wcze�niej nie zawracali�my sobie g�owy wymys�ami Sekty, lecz ostatnio w Starym Obozie pojawi�o si� znacznie wi�cej ich wys�annik�w.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_07"); //Poleci�em jednemu z naszych Cieni, aby spr�bowa� si� od nich dowiedzie�, co planuj� Guru. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_08"); //Zdaje si�, �e przygotowuj� si� do wielkiego przyzwania, w czasie kt�rego �ni�cy ma im pokaza� spos�b na zniszczenie Bariery.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_09"); //Do tego wszystkiego dochodzi list od mistrza Pyrokara, kt�ry nam dostarczy�e�. Uwa�a on, �e Bractwo niesie ze sob� ogromne zagro�enie dla los�w ca�ej Myrtany. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_10"); //Ten fakt bardzo zaniepokoi� mistrza Corristo i zleci� mi bardzo wa�n� misj�.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_11"); //Mam dowiedzie� si� wszystkiego o boskiej mocy, kt�ra nap�dza runy Bractwa. Tu w�a�nie mam dla ciebie wa�kie zlecenie.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_12"); //P�jdziesz do obozu na bagnie i przyniesiesz mi trzy runy z zakl�ciami �ni�cego. Zakl�cia nazywaj� si�: uderzenie wiatru, pirokineza i sen. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_13"); //Spiesz si�, musimy zdoby� te runy zanim odb�dzie si� przywo�anie �ni�cego.
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_14"); //Czy jak spr�buje je wykra��, nie b�dzie to czyn ha�bi�cy imi� Innosa?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_15"); //Nie, m�j synu. Robisz to ku chwale Innosa i w imi� dobra, wi�c Pan Ognia przymknie oko na pochodzenie run. 
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_16"); //Zatem ruszam w drog�. 
    MIS_NEW_GOD = LOG_RUNNING;

    Log_CreateTopic            (CH1_NEW_GOD, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NEW_GOD, LOG_RUNNING);
    B_LogEntry                     (CH1_NEW_GOD,"Drago, Mag Ognia ze Starego Obozu musi zbada�, kim naprawd� jest �ni�cy i sk�d Guru bior� swoj� moc. Aby pom�c mu w badaniach, musz� przynie�� trzy runy: Uderzenie Wiatru, Sen i Pirokineza.");
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
   description	= "Zdoby�em runy magii �ni�cego, oto one.";
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
    AI_Output (other, self ,"DIA_Drago_RUNES_ALL_HEVE_15_01"); //Zdoby�em runy magii �ni�cego, oto one.
    B_GiveInvItems (other, self, ItArRuneSleep, 1);
    B_GiveInvItems (other, self, ItArRuneWindfist, 1);
    B_GiveInvItems (other, self, ItArRunePyrokinesis, 1);
    AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_02"); //Nareszcie zbadamy czym naprawd� jest �ni�cy. Natychmiast przyst�pi� do bada�. We� t� mikstur�, przygotowa� j� nasz alchemik - Damarok. 
	AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_03"); //Niech zwi�kszy ona twoje duchowe zdolno�ci. Wr�� do mnie za jaki� czas, gdy sko�cz� moje badania.
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
    B_LogEntry                     (CH1_NEW_GOD,"Odda�em wszystkie trzy runy magowi Drago. W zamian otrzyma�em pot�na mikstur�, oraz �wiadomo��, �e pomog�em Magom Ognia. Teraz musz� tylko czeka� na wyniki bada�.");
    
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
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_02"); //Wr�� p�niej. Wci�� pr�buj� dowiedzie� si� jaka si�a je nap�dza. Niech Innos obdaruje si� cierpliwo�ci� bracie.
    }
    else if (kapitel == 3)
    {
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_03"); //Uda�o mi si� zg��bi� natur� run magii �ni�cego! Mistrz Pyrokar ma racj�, Sekta jest powa�nym zagro�eniem dla naszego �wiata.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_04"); //�ni�cy okaza� si� by� demonem z piek�a rodem. Omami� on ludzi z Bractwa przedstawiaj�c si� jako wspania�y i mi�osierny b�g, jednak w rzeczywisto�ci jest wcieleniem samego Beliara.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_05"); //Manipulowa� on Guru, kt�rzy pozostali pod wp�ywem palonego przez nich bagiennego ziela. Chcia� zosta� uwolniony i przynie�� na nas zag�ad�.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_06"); //Wiem o tym. Wielkie przywo�anie okaza�o si� kompletn� klap�, doprowadzi�o do �mierci Y"Beriona, duchowego przyw�dcy Bractwa. 
		AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_07"); //Przed �mierci� wielki mistrz zbudzi� si� i obwie�ci� �e �ni�cy nie jest tym, za co go uwa�aj�.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_08"); //Tym samym wiara w �ni�cego zosta�a porzucona przez Sekt�, a nowym przyw�dc� zosta� Cor Angar.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_09"); //Jeste� pewny, �e wszyscy porzucili wiar� w �ni�cego?
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_10"); //Nie. Cor Kalom, zebra� oddzia� fanatycznych Stra�nik�w �wi�tynnych i opu�ci� ob�z. Nie chcia� uwierzy� w prawdziw� natur� �ni�cego i postanowi� odszuka� go na w�asn� r�k�. 
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_11"); //O Innosie, powstrzymaj tego szale�ca. Pom�w natychmiast z Corristo, musimy podj�� odpowiednie kroki.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_12"); //W porz�dku.
		DIA_Drago_RUNES_RESEARCH_PROGRESS.permanent = false;
		B_LogEntry                     (CH1_NEW_GOD,"Drago powiedzia� mi dok�adnie to samo, co ju� wiedzia�em. �ni�cy to demon, kt�ry oszuka� cz�onk�w Bractwa. Musz� szybko porozmawia� z Corristo. To, co dzieje si� na bagnach mo�e wp�yn�� na �ycie wszystkich ludzi pod Barier�.");
		must_talk_corristo = true;
		B_GiveXP (100);
    };
    AI_StopProcessInfos	(self);
};
