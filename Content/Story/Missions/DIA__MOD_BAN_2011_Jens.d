//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jens_EXIT(C_INFO)
{
	npc             = BAU_2011_Jens;
	nr              = 999;
	condition	= DIA_Jens_EXIT_Condition;
	information	= DIA_Jens_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jens_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jens_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia³ -
// Dialogi ogólne i handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Jens_HELLO1 (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_HELLO1_Condition;
   information  = DIA_Jens_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czeœæ. Czym siê zajmujesz?";
};

FUNC INT DIA_Jens_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jens_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Jens_HELLO1_15_01"); //Czeœæ. Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Jens_HELLO1_03_02"); //Jesteœ tu nowy? Nie widzia³em ciê jeszcze.
	AI_Output (other, self ,"DIA_Jens_HELLO1_15_03"); //Tak, jestem tu od niedawna.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_04"); //Nazywam siê Jens. Oprawiam skóry, czyszczê k³y i sprzedajê. Pomagam tak¿e szyæ pancerze.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_05"); //Tak siê sk³ada, ¿e mam na stanie dobre myœliwskie ubranie. Jesteœ zainteresowany?
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_06"); //To ubranie mo¿e ci ocaliæ ¿ycie!
	AI_Output (other, self ,"DIA_Jens_HELLO1_15_07"); //W jakim sensie?
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_08"); //Przyda ci siê, gdybyœ na przyk³ad chcia³ siê wybraæ do Starego Obozu i pozostaæ w ukryciu. Jeœli w³o¿ysz nasz pancerz, Stra¿nicy natychmiast ciê zdemaskuj¹.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_09"); //W tym mysliwskim stroju bêdziesz mia³ troszeczkê spokoju. 
	//log
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Jens zajmuje siê oprawianiem skór i przygotowywaniem trofeów. Zaproponowa³ mi, ¿e sprzeda mi myœliwskie ubranie.");
};

//========================================
//-----------------> FirstArmorPrice
//========================================

INSTANCE DIA_Jens_FirstArmorPrice (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_FirstArmorPrice_Condition;
   information  = DIA_Jens_FirstArmorPrice_Info;
   permanent	= FALSE;
   description	= "Ile chcesz za ten pancerz?";
};

FUNC INT DIA_Jens_FirstArmorPrice_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_HELLO1)) //&& (kapitel == 10)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_FirstArmorPrice_Info()
{
    AI_Output (other, self ,"DIA_Jens_FirstArmorPrice_15_01"); //Ile chcesz za ten pancerz?
    AI_Output (self, other ,"DIA_Jens_FirstArmorPrice_03_02"); //Tylko 750 bry³ek rudy. To niewiele! Nosi³em to ubranie, gdy pracowa³em jako ³uczarz w Khorinis.
	AI_Output (self, other ,"DIA_Jens_FirstArmorPrice_03_03"); //Jest warte swojej ceny!
};

var int Jens_SellArmor_OneTime;
//========================================
//-----------------> ArmorLeather
//========================================

INSTANCE DIA_Jens_ArmorLeather (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_ArmorLeather_Condition;
   information  = DIA_Jens_ArmorLeather_Info;
   permanent	= TRUE;
   description	= "Dobrze, daj mi tê zbrojê. (ochrona: broñ: 20, strza³y: 10, koszt: 750)";
};

FUNC INT DIA_Jens_ArmorLeather_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Jens_FirstArmorPrice)) && (Jens_SellArmor_OneTime == FALSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_ArmorLeather_Info()
{
    AI_Output (other, self ,"DIA_Jens_ArmorLeather_15_01"); //Dobrze, daj mi tê zbrojê.
    if (Npc_HasItems (hero, ItMiNugget)>=750)
    {
		CreateInvItem		(hero, NON_LEATHER_ARMOR_L);
	
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
        AI_Output (self, other ,"DIA_Jens_ArmorLeather_03_02"); //Proszê. Oto ona.
        B_GiveInvItems (other, self, ItMiNugget, 750);
		AI_EquipBestArmor	(hero); 
		Jens_SellArmor_OneTime = TRUE;
    }
    else
    {
        AI_Output (self, other ,"DIA_Jens_ArmorLeather_03_03"); //Nie masz tyle rudy!
    };
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jens_HELLO2 (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 2;
   condition    = DIA_Jens_HELLO2_Condition;
   information  = DIA_Jens_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o swojej pracy.";
};

FUNC INT DIA_Jens_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Jens_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Jens_HELLO2_15_01"); //Opowiedz mi o swojej pracy.
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_02"); //No có¿, zanim zaczniesz pracê ze skór¹, powinieneœ j¹ wygarbowaæ.
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_03"); //Dobry rymarz potrafi rozpoznaæ, czy skóra jest ju¿ odpowiednia.
    AI_Output (other, self ,"DIA_Jens_HELLO2_15_04"); //Co wyrabiasz ze skór?
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_05"); //Zazwyczaj ubrania, pancerze i inne tego typu przedmioty.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia³ -
// Zadanie od Keretha (Œmieræ Rayana)
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> YourSwordPieces
//========================================

INSTANCE DIA_Jens_YourSwordPieces (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_YourSwordPieces_Condition;
   information  = DIA_Jens_YourSwordPieces_Info;
   permanent	= FALSE;
   description	= "Znalaz³em fragmenty twojego miecza.";
};

FUNC INT DIA_Jens_YourSwordPieces_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bandyta_ItsJens)) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_YourSwordPieces_Info()
{
    AI_Output (other, self ,"DIA_Jens_YourSwordPieces_15_01"); //Znalaz³em fragmenty twojego miecza. By³y w pobli¿u grobu brata Keretha. Ktoœ regularnie go rozkopuje. Wiesz co to znaczy?
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_02"); //¯e co?! Niby po co mia³by rozkopywaæ grób? Dobre sobie. Poka¿ mi te kawa³ki.
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_03"); //Faktycznie kupi³em tak¹ broñ u Puna, jednak zosta³a mi skradziona w przededniu œmierci Rayana. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_04"); //Kereth próbuje pos¹dziæ mnie o zabójstwo. Wie, ¿e jeœli nie przedstawiê jakichœ dowodów na swoj¹ obronê to Bandyci mnie zabij¹.
    AI_Output (other, self ,"DIA_Jens_YourSwordPieces_15_05"); //Zabij¹?
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_06"); //Takie tu panuj¹ zasady. Œmieræ za œmieræ. Gdyby mordowanie by³o bezkarne, Quentin nigdy nie zapanowa³by nad t¹ zgraj¹. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_07"); //Musisz mi pomóc. Inaczej zostanê pos¹dzony o coœ czego nie zrobi³em. 
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
    Info_AddChoice		(DIA_Jens_YourSwordPieces, "Nie wierzê ci.", DIA_Jens_YourSwordPieces_Nope);
	Info_AddChoice		(DIA_Jens_YourSwordPieces, "Jak oczyœciæ ciê z zarzutów?", DIA_Jens_YourSwordPieces_Help);
	
	B_LogEntry               (CH1_DestroyedGrave,"Jens twierdzi, ¿e miecz mu skradziono w przededniu œmierci Rayana. Bandyta uwa¿a, ¿e Kereth chce siê go pozbyæ z Obozu. Muszê podj¹æ decyzjê czy warto zaufaæ Jensowi.");
};

FUNC VOID DIA_Jens_YourSwordPieces_Help ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Help_15_01"); //Jak oczyœciæ ciê z zarzutów?
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_02"); //Musisz zbadaæ okolicznoœci œmierci Rayana. Z tego co mi wiadomo znaleziono go przed Obozem. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_03"); //Mniej wiêcej w tym miejscu, w którym wykopano mu grób. Zapytaj Doyle'a czy czegoœ nie widzia³.
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_04"); //Mo¿e dostaniesz jak¹œ wskazówkê. Najlepiej nie mów nic Kerethowi, bo ta pod³a gnida pewnie zacznie utrudniaæ œledztwo. 
	
	B_LogEntry               (CH1_DestroyedGrave,"Postanowi³em sprawdziæ co na temat oskar¿eñ ma do powiedzenia Jens. Za³o¿y³em, ¿e mo¿e byæ niewinny. Dowiedzia³em siê, ¿e do zabójstwa Rayana dosz³o przed Obozem w okolicy miejsca w którym Bandyci wykopali grób. Coœ wiêcej mo¿e wiedzieæ stra¿nik bramy zwany Doyle. Powinienem z nim pogadaæ.");
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
	
	JensIsVictimOfKereth = false;
};

FUNC VOID DIA_Jens_YourSwordPieces_Nope ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Nope_15_01"); //Nie wierzê ci.
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Nope_03_02"); //S³uchaj, nie daj sob¹ manipulowaæ. Jestem niewinny! Mogê to udowodniæ. Musisz mi tylko w tym pomóc. 
	
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
    Info_AddChoice		(DIA_Jens_YourSwordPieces, "Nic z tego.", DIA_Jens_YourSwordPieces_Nope2);
	Info_AddChoice		(DIA_Jens_YourSwordPieces, "Jak oczyœciæ ciê z zarzutów?", DIA_Jens_YourSwordPieces_Help);	
};

FUNC VOID DIA_Jens_YourSwordPieces_Nope2 ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Nope2_15_01"); //Nic z tego.
	
	B_LogEntry               (CH1_DestroyedGrave,"Jens uparcie twierdzi³, ¿e jest niewinny. Stwierdzi³em, ¿e to paplanina, gdy¿ dowody s¹ wiarygodne.");
	JensIsVictimOfKereth = true;
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> DoyleAboutJens
//========================================

INSTANCE DIA_Jens_DoyleAboutJens (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_DoyleAboutJens_Condition;
   information  = DIA_Jens_DoyleAboutJens_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Doylem. ";
};

FUNC INT DIA_Jens_DoyleAboutJens_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_RayansDie))
    && (JensIsVictimOfKereth == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_DoyleAboutJens_Info()
{
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_01"); //Rozmawia³em z Doylem. 
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_02"); //I co ci powiedzia³?
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_03"); //Faktycznie poœwiadczy³, ¿e nie wychodzi³eœ tego dnia z Obozu. 
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_04"); //Mia³em wtedy du¿o pracy nad pewnym skórzanym pancerzem. Poza tym Briam chcia³, ¿ebym mu na szybko uszy³ nowy fartuch, bo poplami³ zbrojê.
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_05"); //Czy ten dowód wystarczy?
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_06"); //Chcia³bym ¿ebyœ porozmawia³ jeszcze ze Smithem. Gdy skradziono mi miecz, by³em u niego i prosi³em go o pomoc w poszukiwaniach.
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_07"); //Jego zeznanie bêdzie œwiadczy³o w mojej obronie.
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_08"); //Zaraz z nim pogadam. 
    B_LogEntry                     (CH1_DestroyedGrave,"Jens chce, abym pogada³ ze Smithem, którego zeznania mog¹ okazaæ siê pomocne. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TalkWithSmith
//========================================

INSTANCE DIA_Jens_TalkWithSmith (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_TalkWithSmith_Condition;
   information  = DIA_Jens_TalkWithSmith_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jens_TalkWithSmith_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_FindSwordAlibi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_TalkWithSmith_Info()
{
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_01"); //I co powiedzia³ Smith?
    AI_Output (other, self ,"DIA_Jens_TalkWithSmith_15_02"); //¯e w razie czego powie jak by³o. Nie przepada za Kerethem. 
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_03"); //Ca³e szczêœcie. Obawia³em siê, ¿e tamten drañ ju¿ go przekupi³. 
    AI_Output (other, self ,"DIA_Jens_TalkWithSmith_15_04"); //Z kimœ jeszcze mam porozmawiaæ? 
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_05"); //Potrzebujemy jeszcze jakiegoœ dowodu przeciwko Kerethowi. Coœ co zdemaskuje jego intrygê. Mo¿e ktoœ coœ wie?
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_06"); //Pogadaj z ludŸmi w Obozie. 
    B_LogEntry                     (CH1_DestroyedGrave,"Jens szuka jeszcze jakiegoœ dowodu przeciwko Kerethowi. Nie da³ mi jednak dok³adanych wskazówek. Najlepiej bêdzie po prostu ci¹gn¹æ wszystkich za jêzyk. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BriamsEvidence
//========================================

INSTANCE DIA_Jens_BriamsEvidence (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_BriamsEvidence_Condition;
   information  = DIA_Jens_BriamsEvidence_Info;
   permanent	= FALSE;
   description	= "Briam powiedzia³ mi coœ ciekawego.";
};

FUNC INT DIA_Jens_BriamsEvidence_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_RAYAN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_BriamsEvidence_Info()
{
    AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_01"); //Briam powiedzia³ mi coœ ciekawego.
    AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_02"); //Mianowicie?
    AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_03"); //Widzia³ jak Kereth wraca sk¹dœ póŸn¹ noc¹, a póŸniej chowa twój miecz do swojej skrzyni. 
    AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_04"); //Dobra robota. Wykorzystam to przeciwko Kerethowi. Quentin powinien mi ju¿ uwierzyæ. 
	AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_05"); //Czyli moja robota skoñczona? Poradzisz sobie dalej sam?
	
	if (Jens_SellArmor_OneTime == FALSE)
	{
	AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_06"); //Tak, naprawdê bardzo mi pomog³eœ. Jestem twoim d³u¿nikiem. WeŸ w nagrodê ten pancerz. Mo¿esz go sprzedaæ, jeœli ci siê nie przyda. 
	CreateInvItem		(self, NON_LEATHER_ARMOR_L);
	B_GiveInvItems      (self, hero, NON_LEATHER_ARMOR_L, 1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_07"); //Tak, jestem twoim d³u¿nikiem. WeŸ te skóry w nagrodê.
	CreateInvItems		(self, ItAt_Wolf_02,5);
	B_GiveInvItems      (self, hero, ItAt_Wolf_02, 5);
	};
	
    B_LogEntry             		(CH1_DestroyedGrave,"Zeznania Briama oka¿¹ siê kluczowe dla rozwi¹zania ca³ej sprawy. Jens by³ mi bardzo wdziêczny za pomoc. Szkoda tylko, ¿e dalej nie mam pewnoœci co do tego jak zgin¹³ Rayan.");
	Log_SetTopicStatus    	 (CH1_DestroyedGrave, LOG_SUCCESS);
    MIS_DestroyedGrave = LOG_SUCCESS;
	
	B_GiveXP (275);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia³ 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia³ 4
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Idziesz
//========================================

INSTANCE DIA_Jens_Idziesz (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_Idziesz_Condition;
   information  = DIA_Jens_Idziesz_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn¹ do kopalni?";
};

FUNC INT DIA_Jens_Idziesz_Condition()
{
    if (MIS_OdbijanieOpKop == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_Idziesz_Info()
{
    AI_Output (other, self ,"DIA_Jens_Idziesz_15_01"); //Idziesz ze mn¹ do kopalni?
    AI_Output (self, other ,"DIA_Jens_Idziesz_03_02"); //Niestety, mam du¿o pracy.
    if (Npc_IsDead(BAN_1602_Emanuel))
    {
        AI_Output (self, other ,"DIA_Jens_Idziesz_03_03"); //Muszê gotowaæ za Emanuela i zaj¹æ siê naszym ekwipunkiem.
        AI_Output (other, self ,"DIA_Jens_Idziesz_15_04"); //Rozumiem.
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Okregi
//========================================

INSTANCE DIA_Jens_Okregi (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_Okregi_Condition;
   information  = DIA_Jens_Okregi_Info;
   permanent	= FALSE;
   description	= "Potrzebujê kó³ zêbatych.";
};

FUNC INT DIA_Jens_Okregi_Condition()
{
    if (MIS_NoweKola == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_Okregi_Info()
{
    AI_Output (other, self ,"DIA_Jens_Okregi_15_01"); //Potrzebujê kó³ zêbatych.
    AI_Output (other, self ,"DIA_Jens_Okregi_15_02"); //Najlepiej takich z z¹bkiem na dwa palce.
    AI_Output (self, other ,"DIA_Jens_Okregi_03_03"); //Akurat mia³em jedno na stanie.
    AI_Output (other, self ,"DIA_Jens_Okregi_15_04"); //Potrzebne mi s¹ dwa.
    AI_Output (self, other ,"DIA_Jens_Okregi_03_05"); //Niestety, musisz pogadaæ z kimœ innym.
    B_LogEntry                     (CH1_NoweKola,"Jens da³ mi tylko jedno ko³o zêbate. Reszty muszê szukaæ gdzieœ indziej.");

    B_GiveXP (60);
    CreateInvItems (self, BigGear, 1);
    B_GiveInvItems (self, other, BigGear, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HeavyArmor
//========================================

INSTANCE DIA_Jens_HeavyArmor (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_HeavyArmor_Condition;
   information  = DIA_Jens_HeavyArmor_Info;
   permanent	= FALSE;
   description	= "Mam od ciebie dostaæ ciê¿ki pancerz.";
};

FUNC INT DIA_Jens_HeavyArmor_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_HeavyArmor_Info()
{
    AI_Output (other, self ,"DIA_Jens_HeavyArmor_15_01"); //Mam od ciebie dostaæ ciê¿ki pancerz.
    AI_Output (self, other ,"DIA_Jens_HeavyArmor_03_02"); //Nie mogê ci go oddaæ za darmo. W³o¿y³em w niego du¿o pracy.
	AI_Output (other, self ,"DIA_Jens_HeavyArmor_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Jens_HeavyArmor_03_04"); //Trzy tysi¹ce bry³ek rudy.
	B_LogEntry     (CH1_RozwalaUBnadytow,"Pancerz od Jesna bêdzie mnie kosztowa³ 3000 bry³ek rudy.");
};

//========================================
//-----------------> BuyHeavyArmor
//========================================

INSTANCE DIA_Jens_BuyHeavyArmor (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_BuyHeavyArmor_Condition;
   information  = DIA_Jens_BuyHeavyArmor_Info;
   permanent	= 1;
   description	= "Daj mi ten pancerz. (3000 bry³ek rudy)";
};

FUNC INT DIA_Jens_BuyHeavyArmor_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_HeavyArmor))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_BuyHeavyArmor_Info()
{
    AI_Output (other, self ,"DIA_Jens_BuyHeavyArmor_15_01"); //Daj mi ten pancerz.
	if (Npc_HasItems (hero,itminugget)>= 3000)
	{
    AI_Output (self, other ,"DIA_Jens_BuyHeavyArmor_03_02"); //Niech ci s³u¿y.
	//log
	B_LogEntry     (CH1_RozwalaUBnadytow,"Kupi³em od Jensa ciê¿k¹ zbrojê Bandyty.");
	//pay
	B_GiveInvItems (hero,self,itminugget,3000);
	//armor
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,BAU_ARMOR_H);
	AI_EquipBestArmor	(other); 
	//dialog
	DIA_Jens_BuyHeavyArmor.permanent = 0;
	}
	else
	{
    AI_Output (self, other ,"DIA_Jens_BuyHeavyArmor_03_03"); //Przygotuj wiêcej rudy!
	//dialog
	DIA_Jens_BuyHeavyArmor.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia³ -
// Dialog ogólny - ambient
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Jens_SYTUACJA (C_INFO)
{
   npc          = BAU_2011_Jens;
   nr           = 1;
   condition    = DIA_Jens_SYTUACJA_Condition;
   information  = DIA_Jens_SYTUACJA_Info;
   permanent	= true;
   description	= "Jak tam?";
};

FUNC INT DIA_Jens_SYTUACJA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jens_SYTUACJA_Info()
{
AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_01"); //Jak tam?
  if (hero.guild == GIL_BAU)
    {
    
    if (kapitel == 1)
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_02"); //Nie jest Ÿle. Mam tu wprawdzie trochê roboty ze skórami, ale nie narzekam.
    }
    else if (kapitel == 3)
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_03"); //Rytua³ przywo³ania ju¿ siê odby³? To doprawdy imponuj¹ce. Nigdy nie wierzy³em zbytnio w magiê i te zabobony.
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_04"); //Mam gdzieœ bogów! Gdyby naprawdê pragnêli szczêœcia ludzi, ¿y³oby nam siê inaczej. 
        AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_05"); //Ca³kowicie odrzucasz ich istnienie?
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_06"); //Nie, ale ignorujê ich. Nie wierzê w przeznaczenie. Œwiêta wojna! Te¿ mi coœ. A wszystkiemu winni s¹ magowie.
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_07"); //Posiadaj¹ potê¿n¹ moc. Mogliby obróciæ j¹ przeciw bogom. Wygnaæ ich z tego œwiata. Pozbyæ siê raz na zawsze albo uwiêziæ. 
        AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_08"); //Chyba przesadzasz. 
    }
    else if (Npc_KnowsInfo (hero, DIA_Jens_DobraRobota))
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_09"); //Dobrze. Cieszê siê z naszego wspólnego interesu. Przynosi nam coraz wiêksze korzyœci.
    }
    else if (Npc_KnowsInfo (hero, DIA_Quentin_DraxInfos))
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_10"); //No nieŸle siê porobi³o. Drax chce sam zaatakowaæ Obóz? Nie podoba mi siê to.
    }
    else if (Npc_KnowsInfo (hero, DIA_Quentin_DAEADALL))
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_11"); //Cholera, wiedzia³em, ¿e to siê tak skoñczy. Co za dureñ z tego Draxa. Zero trzeŸwego myœlenia.
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_12"); //Ty jesteœ m³ody. Uwa¿aj, ¿eby te¿ nie zostaæ taki narwañcem. Mamy nieŸle przechlapane. 
}
else if (Npc_KnowsInfo (hero, DIA_Quentin_findFriends))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_13"); //Nasze ostatnie przygody napêdzi³y mi niez³ego stracha. 
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_14"); //Najpierw prowadzimy ma³¹ grup¹ akcje bojowe przeciw potêdze Gomeza, potem zajmuj¹ nasz Obóz.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_15"); //Musimy byæ bardziej ostro¿ni. Najgorsze jest to, ¿e wyda³a siê pozycja naszego Obozu. 
}
else if (Npc_KnowsInfo (hero, DIA_Quentin_FoundDrax))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_16"); //Dowiedzia³em siê, ¿e Drax nie ¿yje. To naprawdê okropne. Nie doœæ, ¿e mogliœmy straciæ wielu ludzi, to jeszcze samobójcza œmieræ.
}
else if (Npc_KnowsInfo (hero, DIA_Quentin_Successasd))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_17"); //Opuszczona Kopalnia w naszych rêkach. Kto by pomyœla³. Bandyci maj¹ w³asn¹ kopalniê. Ha! Staliœmy siê potêg¹.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_18"); //Czekaj tylko, a¿ Bariera upadnie. Zbierzemy wszystko, sprzedamy w Khorinis i wejdziemy na pok³ad pierwszej lepszej ³odzi.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_19"); //Myœlê, ¿e Nordmar by³by dla mnie idealnym miejscem. Cisza gór... To musi byæ wspania³e miejsce. 
};
}
else 
{
		AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_20"); //Nie gadam z takimi jak ty! Zje¿d¿aj.
};
};