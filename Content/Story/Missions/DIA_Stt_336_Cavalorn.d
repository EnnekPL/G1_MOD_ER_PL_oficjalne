//****************************************
// DIALOGI SPRAWDZONE - GOTHIC1210
//****************************************
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich J�ger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jestem my�liwym. Poluj� g��wnie na �cierwojady.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Mo�esz mnie nauczy� czego� o my�listwie?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn jest my�liwym. Mo�e mnie nauczy� skradania si� i strzelania z �uku. Mieszka w chacie, na drodze pomi�dzy Starym a Nowym Obozem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Mo�esz mnie nauczy� czego� o my�listwie?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To zale�y tylko od tego, co chcia�by� wiedzie�.
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (hero.attribute[ATR_Dexterity] >= 30)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Mo�esz mnie nauczy�, jak sprawniej pos�ugiwa� si� �ukiem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Jako pocz�tkuj�cy powiniene� zawsze pami�ta�, �e skuteczno�� strzelania z �uku zale�y przede wszystkim od przyj�tej postawy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unie� na t� sam� wysoko��, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Je�li uda ci si� trafi� w szczeg�lnie wra�liwe punkty cia�a ofiary, nie b�dzie potrzeby oddawania drugiego strza�u. Oczywi�cie pocz�tkuj�cy strzelcy mog� tylko pomarzy� o trafieniu w czu�y punkt.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Ale je�li zastosujesz si� do moich wskaz�wek, mo�esz liczy� na wi�cej trafie� w cel.
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_cavalorn_NO_ENOUGHT_STR_1"); //Nie jeste� jeszcze wystarczaj�co zr�czny!
	PrintScreen	("Warunek: Zr�czno�� 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chcia�bym porusza� si� bezszelestnie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //I s�usznie. Skradanie pozwoli ci dosta� si� niepostrze�enie do cudzych dom�w, albo po cichu zaj�� od ty�u przeciwnika.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Chodz�c na lekko ugi�tych nogach b�dziesz m�g� uwa�niej obserwowa� grunt, po kt�rym st�pasz, no i �atwiej b�dzie ci balansowa� cia�em.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Oczywi�cie kto� obserwuj�cy ci� z boku natychmiast nabierze podejrze�, wi�c skradaj si� zawsze nie b�d�c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Zapami�taj sobie dobrze co ci powiedzia�em, i przede wszystkim nie daj si� z�apa�!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (hero.attribute[ATR_Dexterity] >= 60)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_cavalorn_NO_ENOUGHT_STR_1"); //Nie jeste� jeszcze wystarczaj�co zr�czny!
	PrintScreen	("Warunek: Zr�czno�� 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mog� zdoby� �uk?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Gdzie mog� zdoby� �uk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tutaj! Sprzedaj� najwspanialsze �uki w ca�ym Starym Obozie.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry (GE_TraderOW,"Cavalorn sprzedaje �uki i strza�y. Znajd� go w jego chacie, na drodze pomi�dzy Starym a Nowym Obozem.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka� mi swoje towary."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Poka� mi swoje towary.
	
};  

////////////////////////////////////////////////////
// TEST NA CIENIA 
///////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_STT_336_cavalorn_HELLO1 (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_STT_336_cavalorn_HELLO1_Condition;
   information  = DIA_STT_336_cavalorn_HELLO1_Info;
   permanent	= FALSE;
   description	= "Chcia�bym, aby� podda� mnie pr�bie.";
};

FUNC INT DIA_STT_336_cavalorn_HELLO1_Condition()
{
    if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4) && Fingers_Wherecavalorn == true
    {
    return TRUE;
    };
};


FUNC VOID DIA_STT_336_cavalorn_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_01"); //Chcia�bym, aby� podda� mnie pr�bie.
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_02"); //A dlaczego ci na tym zale�y?
	AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_03"); //Szukam poparcia wa�nych Cieni. Wiem, �e masz sporo do powiedzenia i jeste� dobrym nauczycielem. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_04"); //No dobrze, je�li chcesz, to przygotuj� dla ciebie test.
    AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_05"); //Mam usi��� w �awce i poczeka�?
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_06"); //To nie taki test, kolego...
};

//========================================
//-----------------> TESTEMACHEN
//========================================

INSTANCE DIA_STT_336_cavalorn_TESTEMACHEN (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 2;
   condition    = DIA_STT_336_cavalorn_TESTEMACHEN_Condition;
   information  = DIA_STT_336_cavalorn_TESTEMACHEN_Info;
   permanent	= FALSE;
   description	= "Na czym polega ten test?";
};

FUNC INT DIA_STT_336_cavalorn_TESTEMACHEN_Condition()
{
    if((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4)
    && (Npc_KnowsInfo (hero, DIA_STT_336_cavalorn_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_STT_336_cavalorn_TESTEMACHEN_Info()
{
    AI_Output (other, self ,"DIA_STT_336_cavalorn_TESTEMACHEN_15_01"); //Na czym polega ten test?
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_02"); //Sprawa jest dosy� prosta. Udasz si� do Aidana - to my�liwy. Nast�pnie wypytasz go o wymian� handlow� Nowego Obozu. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_03"); //Im wi�cej informacji wyci�gniesz, tym lepiej ci� oceni�. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_04"); //Interesuje mnie wszystko: ry�, skrzynie z rud�, dostawy, ten ca�y ob�z my�liwych przy Kopalni. Po prostu WSZYSTKO czego uda ci si� dowiedzie�.
    
	B_LogEntry(CH1_JoinOC, "Cavalorn zleci� mi test. Je�li go wykonam, zyskam jego poparcie w Starym Obozie.");
	MIS_TestOC = LOG_RUNNING;
	Log_CreateTopic          (CH1_TestOc, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TestOc, LOG_RUNNING);
	B_LogEntry              (CH1_TestOc,"Cavalorn przygotowa� dla mnie dosy� ciekawy test. Mam porozmawia� z my�liwym Aidanem i wyci�gn�� z niego jak najwi�cej informacji o wymianie handlowej Nowego Obozu.");
    Info_ClearChoices		(DIA_STT_336_cavalorn_TESTEMACHEN);
	szpiegostwoON = true;
	polowanieON = false;
};

var int zdam;

var int powiedzialem_ryz;
var int powiedzialem_skrzynie;
var int powiedzialem_krety;
var int powiedzialem_mysliwi;
var int powiedzialem_aidan;
//========================================
//-----------------> InfosTest
//========================================

INSTANCE DIA_cavalorn_InfosTest (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_cavalorn_InfosTest_Condition;
   information  = DIA_cavalorn_InfosTest_Info;
   permanent	= true;
   description	= "Mam ju� troch� informacji...";
};

FUNC INT DIA_cavalorn_InfosTest_Condition()
{
    if (MIS_TestOc == LOG_RUNNING)
    && (szpiegostwoON == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_InfosTest_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_15_01"); //Mam ju� troch� informacji...
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_03_02"); //S�ucham.
	zdam = true;
    Info_ClearChoices		(DIA_cavalorn_InfosTest);
	if (knowsRice == true) && (powiedzialem_ryz == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Wiem co dzieje si� z ry�em.", DIA_cavalorn_InfosTest_MassageKnowsRice);
	};
	if (knowsOre == true) && (powiedzialem_skrzynie == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "W Nowym Obozie znajduje si� oko�o 50 skrzy� rudy.", DIA_cavalorn_InfosTest_MassageKnowsOre);
	};
	if (knowsOre2 ==true) && (powiedzialem_krety == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Rozmawia�em z Kretami.", DIA_cavalorn_InfosTest_MassageKnowsOre2);
	};
	if (knowsLeather == true) && (powiedzialem_mysliwi == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Wiem tak�e o obozie my�liwych.", DIA_cavalorn_InfosTest_MassageKnowsLeather);
	};
	if (knowsAidan == true) && (powiedzialem_aidan == false)
	{
	Info_AddChoice		(DIA_cavalorn_InfosTest, "My�liwy Aidan pomaga� przy transporcie o�miu skrzy�.", DIA_cavalorn_InfosTest_MassageKnowsAidan);
	};
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Na razie to tyle.", DIA_cavalorn_InfosTest_ComeBack);
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsAidan ()
{
	AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_01"); //My�liwy Aidan pomaga� przy transporcie o�miu skrzy� rudy do Nowego Obozu.
	AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_02"); //Jedna z tych skrzy� przypad�a eskortuj�cym.
	AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_03"); //Interesuj�ce...
	powiedzialem_aidan = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsRice()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_01"); //Wiem co dzieje si� z ry�em.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_02"); //Rozmawia�em z Ry�owym Ksi�ciem o tym. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_03"); //Nadwy�ka surowca jest magazynowana b�d� sprzedawana w niewielkiej ilo�ci.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_04"); //G��wnie do obozu na bagnie.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsRice_03_05"); //�wietnie si� spisa�e�! Masz co� jeszcze?
	powiedzialem_ryz = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsOre()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_01"); //W Nowym Obozie znajduje si� oko�o 50 skrzy� rudy.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_02"); //Dowiedzia�em si� tego od Cronosa. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_03"); //Magowie maj� jakie� plany wobec rudy.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsOre_03_04"); //Dobra robota!
	powiedzialem_skrzynie = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsOre2()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_01"); //Rozmawia�em z Kretami.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_03_02"); //By�e� w Wolnej Kopalni? Jestem pe�en podziwu.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_03"); //Dowiedzia�em si�, �e ostatnio wykopali 30 skrzy� rudy. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_04"); //Transport do Obozu ma odby� si� p�n� noc�.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_05"); //Jednak nie wiem kiedy dok�adnie.
	powiedzialem_krety = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsLeather()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_01"); //Wiem tak�e o obozie my�liwych.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_03_02"); //Jakim obozie?
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_03"); //Niedawno zosta� za�o�ony. Znajduje si� pomi�dzy Obozem, a Woln� Kopalni�.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_04"); //Znajduj� si� w nim g��wnie my�liwi. Poluj� na wilki i �cierwojady.
	powiedzialem_mysliwi = true;
};

FUNC VOID DIA_cavalorn_InfosTest_ComeBack()
{
    Info_ClearChoices	(DIA_cavalorn_InfosTest);
};


//========================================
//-----------------> SuccessTest
//========================================

INSTANCE DIA_cavalorn_SuccessTest (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_cavalorn_SuccessTest_Condition;
   information  = DIA_cavalorn_SuccessTest_Info;
   permanent	= true;
   description	= "Zda�em test?";
};

FUNC INT DIA_cavalorn_SuccessTest_Condition()
{
    if (zdam == true) && (MIS_TestOC != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_SuccessTest_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_SuccessTest_15_01"); //Zda�em test?
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_02"); //Zobaczmy...
    if (powiedzialem_ryz == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_03"); //Dowiedzia�e� si� o sprzeda�y ry�u do Bractwa.
	ocenaTest = ocenaTest+1;
    };
	if (powiedzialem_aidan == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_20Aidan"); //Wspomnia�e� o niedawnym transporcie o�miu skrzy�.
	ocenaTest = ocenaTest+1;
    };
    if (powiedzialem_skrzynie == true)
    {
     AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_04"); //Wiesz o 50 skrzyniach rudy.
	ocenaTest = ocenaTest+1;
    };
    if (powiedzialem_krety == true)
    {
        AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_05"); //Wiesz te� o ostatniej dostawie rudy.
	ocenaTest = ocenaTest+2;
    };
    if (powiedzialem_mysliwi == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_06"); //Dowiedzia�e� si� r�wnie� o obozie my�liwych.
	ocenaTest = ocenaTest+1;
    };
    if (ocenaTest == 5)
    {
	AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_09"); //Rewelacyjnie poradzi�e� sobie z tym zadaniem.
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_10"); //Nale�� ci si� moje gratulacje. Jestem pewien, �e dostaniesz si� do Cieni.
	
    B_LogEntry               (CH1_TestOC,"Zaliczy�em test. Cavalorn by� bardzo zadowolony. Mog� liczy� na jego poparcie.");
    Log_SetTopicStatus       (CH1_TestOC, LOG_SUCCESS);
    MIS_TestOC = LOG_SUCCESS;
	DIA_cavalorn_InfosTest.permanent = false;
    B_GiveXP (XP_TestSzpiegowski5);
	zdam = false;
	B_LogEntry(CH1_JoinOC, "Uda�o mi si� wykona� test od Cavalorna czym zaskarbi�em sobie jego sympati�.");
    }
    else if (ocenaTest >= 2)
    {
	AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_07"); //Uda�o ci si� zaliczy� test! �wietna robota. 
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_08"); //Mo�esz i�� i porozmawia� z Diego.
	
    B_LogEntry               (CH1_TestOC,"Zaliczy�em test. Cavalorn by� bardzo zadowolony. Mog� liczy� na jego poparcie.");
    Log_SetTopicStatus       (CH1_TestOC, LOG_SUCCESS);
    MIS_TestOC = LOG_SUCCESS;
	DIA_cavalorn_InfosTest.permanent = false;
	zdam = false;
    B_GiveXP (XP_TestSzpiegowski2);       
	B_LogEntry(CH1_JoinOC, "Uda�o mi si� wykona� test od Cavalorna czym zaskarbi�em sobie jego sympati�.");
	}
	else
	{
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_11"); //To co zrobi�e� to zbyt ma�o.
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_12"); //Spr�buj jeszcze raz.
	DIA_cavalorn_SuccessTest.permanent = true;
    };

};

//////////////////////////////////////////////////
// ROZDZIA� 4 
//////////////////////////////////////////////////

// **************************************************
// 					Sytuacja
// **************************************************

INSTANCE DIA_cavalorn_Sytuacja (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Sytuacja_Condition;
	information		= DIA_cavalorn_Sytuacja_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_cavalorn_Sytuacja_Condition()
{	
	if (kapitel >= 4)
	{
	return 1;	
	};
};

FUNC VOID DIA_cavalorn_Sytuacja_Info()
{
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_00"); //Hej, dobrze ci� widzie� w jednym kawa�ku!
	AI_Output (other, self,"DIA_cavalorn_Sytuacja_15_01"); //Cze��, Cavalorn. Czy wszystko w porz�dku?
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_02"); //Nic nie jest w porz�dku. Co� z�ego sta�o si� w Starym Obozie.
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_03"); //Niedawno przyby� tu Skorpion i bardzo m�tnie opowiedzia� mi o ostatnich wydarzeniach.
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_04"); //Najlepiej porozmawiaj od razu z nim. Ja nie mam teraz czasu na rozmowy. 
	AI_Output (other, self,"DIA_cavalorn_Sytuacja_15_05"); //Dlaczego?
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_06"); //Gdzie� znikn�� Vart. Boj� si�, �e wpakowa� si� w k�opoty.	
};

//========================================
//-----------------> WhereIsVart
//========================================

INSTANCE DIA_Cavalorn_WhereIsVart (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 2;
   condition    = DIA_Cavalorn_WhereIsVart_Condition;
   information  = DIA_Cavalorn_WhereIsVart_Info;
   permanent	= FALSE;
   description	= "Postaram si� za nim rozejrze�.";
};

FUNC INT DIA_Cavalorn_WhereIsVart_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_cavalorn_Sytuacja
	))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_WhereIsVart_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_WhereIsVart_15_01"); //Postaram si� za nim rozejrze�.
    AI_Output (self, other ,"DIA_Cavalorn_WhereIsVart_03_02"); //Nie mam poj�cia, gdzie mo�e by�. W��czy� si� w okolicy po czym znikn��.
    AI_Output (self, other ,"DIA_Cavalorn_WhereIsVart_03_03"); //Nie mog� ci da� �adnych wskaz�wek.
	
    MIS_Wherevart = LOG_RUNNING;

    Log_CreateTopic          (CH1_Wherevart, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Wherevart, LOG_RUNNING);
    B_LogEntry               (CH1_Wherevart,"Cavalorn nie ma poj�cia, gdzie znajduje si� Vart. Mo�liwe, �e uciek� b�d� zgubi� si� w lesie.");
};

//========================================
//-----------------> IFoundVart
//========================================

INSTANCE DIA_Cavalorn_IFoundVart (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_IFoundVart_Condition;
   information  = DIA_Cavalorn_IFoundVart_Info;
   permanent	= FALSE;
   description	= "Znalaz�em Varta.";
};

FUNC INT DIA_Cavalorn_IFoundVart_Condition()
{
    if (Npc_HasItems (other, VartSword) >=1)
    && (MIS_Wherevart == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_IFoundVart_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_01"); //Znalaz�em Varta. Niestety nie �yje. Mam tu jego miecz.
    AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_02"); //Co? Jak to si� sta�o?
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_03"); //Nie wiem. Jego cia�o le�a�o w pobli�u jakiej� starej krypty. Kr�ci�o si� wok� niego kilku ludzi podobnych do Nowicjuszy z Bractwa.
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_04"); //By� mo�e chcieli z niego z�o�y� ofiar� na przeb�aganie �ni�cego. 
    AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_05"); //S�ysza�em wiele rzeczy o obozie na bagnie, ale nie to, �e sk�adaj� ludzi w ofierze swemu bogu.
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_06"); //Nie bogu. �ni�cy to demon. Dzi�ki mojej skromnej pomocy Guru z Bractwa zdo�ali si� o tym zorientowa�.
	AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_07"); //Cz�� z Nowicjuszy nie mog�a si� z tym pogodzi�. Ka�dy ma nieco inne podej�cie. Wielu opu�ci�o Ob�z.
	AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_08"); //Cholera, nie do��, �e mamy na g�owie Stra�nik�w to jeszcze jakie� �wiry kr�c� si� po Kolonii.
	AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_09"); //Chcia�bym ci podzi�kowa� za pomoc. We� t� skromn� ilo�� rudy. Wi�cej nie mog� ci zaoferowa�. Z wiadomych przyczyn nikt tu ostatnio nie zagl�da.
	
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	
    B_LogEntry               (CH1_Wherevart,"Znalaz�em cia�o Varta. Niestety nie �yje. Cavalorn nie mo�e si� pogodzi� ze �mierci� towarzysza.");
    Log_SetTopicStatus       (CH1_Wherevart, LOG_SUCCESS);
    MIS_Wherevart = LOG_SUCCESS;

    B_GiveXP (300);
};

//========================================
//-----------------> LifeIsBrutal
//========================================

INSTANCE DIA_Cavalorn_LifeIsBrutal (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 2;
   condition    = DIA_Cavalorn_LifeIsBrutal_Condition;
   information  = DIA_Cavalorn_LifeIsBrutal_Info;
   permanent	= FALSE;
   description	= "Nie przywr�cisz mu �ycia.";
};

FUNC INT DIA_Cavalorn_LifeIsBrutal_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cavalorn_IFoundVart)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_LifeIsBrutal_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_LifeIsBrutal_15_01"); //Nie przywr�cisz mu �ycia.
    AI_Output (self, other ,"DIA_Cavalorn_LifeIsBrutal_03_02"); //Masz racj�, ale...
    AI_Output (self, other ,"DIA_Cavalorn_LifeIsBrutal_03_03"); //Co dzieje si� z tym miejscem?! Czy bogowie chc� nas ukara� za nasze wyst�pki?!
   /* MIS_Wherevart2 = LOG_RUNNING;

    Log_CreateTopic            (CH1_Wherevart2, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Wherevart2, LOG_RUNNING);
    B_LogEntry                     (CH1_Wherevart2,"Cavalorn chce abym ustali� o co chodzi z tymi Poszukiwaczami.");*/
};



////////////////////////////////////////////////
// USUNI�TE 
// W�TEK CZARNEGO MAGA
////////////////////////////////////////////////

//========================================
// DIALOG USUNI�TY =======================
//========================================

INSTANCE DIA_Cavalorn_helpMe21423 (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_helpMe21423_Condition;
   information  = DIA_Cavalorn_helpMe21423_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cavalorn_helpMe21423_Condition()
{
    if (Kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_helpMe21423_Info()
{
    AI_Output (self, other ,"DIA_Cavalorn_helpMe21423_03_01"); //Prosz� ci�, pom� mi!
    AI_Output (self, other ,"DIA_Cavalorn_helpMe21423_03_02"); //Ci przekl�ci �owcy ork�w mnie tu uwi�zili i zaj�li moj� chat�.
    AI_Output (self, other ,"DIA_Cavalorn_helpMe21423_03_03"); //Wyp�d� ich jako�.
    AI_Output (other, self ,"DIA_Cavalorn_helpMe21423_15_04"); //Zobacz� co da si� zrobi�.
    MIS_CavalornFuck = LOG_RUNNING;

    Log_CreateTopic            (CH1_CavalornFuck, LOG_MISSION);
    Log_SetTopicStatus       (CH1_CavalornFuck, LOG_RUNNING);
    B_LogEntry                     (CH1_CavalornFuck,"Cavalorn ma problem z �owcami ork�w, kt�rzy zaj�li jego chat�. Mam si� ich pozby�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Odeszli
//========================================

INSTANCE DIA_Cavalorn_Odeszli (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_Odeszli_Condition;
   information  = DIA_Cavalorn_Odeszli_Info;
   permanent	= FALSE;
   description	= "�owcy ork�w odeszli.";
};

FUNC INT DIA_Cavalorn_Odeszli_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12))
    && (MIS_cavalornfuck == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_Odeszli_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_Odeszli_15_01"); //�owcy ork�w odeszli.
    AI_Output (self, other ,"DIA_Cavalorn_Odeszli_03_02"); //Nie wiem jak to zrobi�e�, ale jestem ci cholernie wdzi�czny.
    B_LogEntry                     (CH1_cavalornfuck,"Cavalorn mo�e wr�ci� do codziennych zaj��.");
    Log_SetTopicStatus       (CH1_cavalornfuck, LOG_SUCCESS);
    MIS_cavalornfuck = LOG_SUCCESS;

    B_GiveXP (200);
    Npc_ExchangeRoutine (self,"start");
};
//========================================
//-----------------> SFSasf
//========================================
//NIEAKTYWNY!! 1.4
INSTANCE DIA_Cavalorn_SFSasf (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_SFSasf_Condition;
   information  = DIA_Cavalorn_SFSasf_Info;
   permanent	= FALSE;
   description	= "Poszukiwacze to s�udzy Czarnego Maga.";
};

FUNC INT DIA_Cavalorn_SFSasf_Condition()
{
    if (heroKnowsPoszukiwacze == true)
   // && (Npc_KnowsInfo (hero, DIA_Cavalorn_LifeIsBrutal))
   && (MIS_Wherevart2 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_SFSasf_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_01"); //Poszukiwacze to s�udzy Czarnego Maga.
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_02"); //Ich celem jest przeci�ganie ludzi na jego stron�.
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_03"); //Je�eli odm�wi� s� zabijani, a ich dusze s� do czego� wykorzystywane przez Poszukiwaczy.
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_04"); //Niestety nie mam poj�cia do czego.
    AI_Output (self, other ,"DIA_Cavalorn_SFSasf_03_05"); //Kim jest ten Czarny Mag?
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_06"); //To pot�ny wys�annik Beliara. 
    AI_Output (other, self ,"DIA_Cavalorn_SFSasf_15_07"); //Mroczne si�y szykuj� si� do czego� wielkiego.
    B_LogEntry                     (CH1_Wherevart2,"To co dowiedzia�em si� od Nidasa przekaza�em Cavalornowi. Wygl�da� na przestraszonego.");
    Log_SetTopicStatus       (CH1_Wherevart2, LOG_SUCCESS);
    MIS_Wherevart2 = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Help455675
//========================================

INSTANCE DIA_Cavalorn_Help455675 (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 2;
   condition    = DIA_Cavalorn_Help455675_Condition;
   information  = DIA_Cavalorn_Help455675_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cavalorn_Help455675_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cavalorn_SFSasf))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_Help455675_Info()
{
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_01"); //Zaczekaj!
    AI_Output (other, self ,"DIA_Cavalorn_Help455675_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_03"); //Przyznam, �e nastraszy�e� mnie t� opowie�ci�.
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_04"); //My�la�em, �e jedyne czego mamy si� obawia� to orkowie.
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_05"); //Jak wida� teraz nawet drugi cz�owiek mo�e by� zagro�eniem.
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_06"); //Ty w��czysz si� po okolicy, znasz du�o os�b...
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_07"); //Sprowad� mi tu jakiego� nowego towarzysza. 
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_08"); //Co je�eli ci sekciarze przyjd� tak�e po mnie?
    AI_Output (self, other ,"DIA_Cavalorn_Help455675_03_09"); //Sam nie dam sobie rady.
    AI_Output (other, self ,"DIA_Cavalorn_Help455675_15_10"); //Poszukam kogo� odpowiedniego.
    MIS_NowyVart = LOG_RUNNING;

    Log_CreateTopic            (CH1_NowyVart, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NowyVart, LOG_RUNNING);
    B_LogEntry                     (CH1_NowyVart,"Cavalorn prosi� mnie, abym znalaz� mu nowego czeladnika, gdy� boi si� samotno�ci.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> KoloZebate
//========================================

INSTANCE DIA_cavalorn_KoloZebate (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_cavalorn_KoloZebate_Condition;
   information  = DIA_cavalorn_KoloZebate_Info;
   permanent	= FALSE;
   description	= "M�g�by� dla mnie zrobi� ko�o z�bate?";
};

FUNC INT DIA_cavalorn_KoloZebate_Condition()
{
    if (MIS_NoweKola == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_KoloZebate_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_KoloZebate_15_01"); //M�g�by� dla mnie zrobi� ko�o z�bate?
    AI_Output (self, other ,"DIA_cavalorn_KoloZebate_03_02"); //Oczywi�cie. 
    AI_Output (self, other ,"DIA_cavalorn_KoloZebate_03_03"); //Za ka�de ko�o chc� 10 bry�ek rudy.
    B_LogEntry                     (CH1_NoweKola,"Cavalorn ma w�asny warsztat i mo�e mi wyrobi� r�ne przedmioty.");
};

//========================================
//-----------------> CreateItem
//========================================

INSTANCE DIA_cavalorn_CreateItem (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 2;
   condition    = DIA_cavalorn_CreateItem_Condition;
   information  = DIA_cavalorn_CreateItem_Info;
   permanent	= TRUE;
   description	= "Wytw�rz dla mnie...";
};

FUNC INT DIA_cavalorn_CreateItem_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_cavalorn_KoloZebate))
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_CreateItem_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_CreateItem_15_01"); //Wytw�rz dla mnie...

    Info_ClearChoices		(DIA_cavalorn_CreateItem);
    Info_AddChoice		(DIA_cavalorn_CreateItem, "Du�e ko�o z�bate (15 bry�ek rudy)", DIA_cavalorn_CreateItem_Gear1);
    Info_AddChoice		(DIA_cavalorn_CreateItem, DIALOG_BACK, DIA_cavalorn_CreateItem_BACK);
};

FUNC VOID DIA_cavalorn_CreateItem_Gear1()
{
    AI_Output (other, self ,"DIA_cavalorn_CreateItem_Gear1_15_01"); //Du�e ko�o z�bate.
    if (Npc_HasItems (hero, ItMiNugget)>=15)
    {
    CreateInvItems (self, BigGear, 1);
    B_GiveInvItems (self, other, BigGear, 1);
    B_GiveInvItems (other, self, ItMiNugget, 15);
    AI_Output (self, other ,"DIA_cavalorn_CreateItem_Gear1_03_02"); //Ju� si� robi.
    }
    else
    {
     AI_Output (self, other ,"DIA_cavalorn_CreateItem_Gear1_03_03"); //Nie masz tyle rudy!
    };
};

FUNC VOID DIA_cavalorn_CreateItem_BACK()
{
    Info_ClearChoices	(DIA_cavalorn_CreateItem);
};



//========================================
//-----------------> iPszypasfasf
//========================================

INSTANCE DIA_Cavalorn_iPszypasfasf (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_iPszypasfasf_Condition;
   information  = DIA_Cavalorn_iPszypasfasf_Info;
   permanent	= FALSE;
   description	= "Przyprowadzi�em Jessego.";
};

FUNC INT DIA_Cavalorn_iPszypasfasf_Condition()
{
    if (MIS_NowyVart == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Jesse_gotocav))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_iPszypasfasf_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_iPszypasfasf_15_01"); //Przyprowadzi�em Jessego.
    AI_Output (self, other ,"DIA_Cavalorn_iPszypasfasf_03_02"); //Ju� z nim rozmawia�em. 
    AI_Output (self, other ,"DIA_Cavalorn_iPszypasfasf_03_03"); //Dobra robota.
    AI_Output (self, other ,"DIA_Cavalorn_iPszypasfasf_03_04"); //Jednak b�d� go musia� wiele nauczy�.
    AI_Output (other, self ,"DIA_Cavalorn_iPszypasfasf_15_05"); //Masz nowe zaj�cie.
    AI_Output (self, other ,"DIA_Cavalorn_iPszypasfasf_03_06"); //Oto twoja zap�ata.
    B_LogEntry                     (CH1_NowyVart,"Przyprowadzi�em Jessego do Cavalorna. My�l�, �e si� dogadaj�.");
    Log_SetTopicStatus       (CH1_NowyVart, LOG_SUCCESS);
    MIS_NowyVart = LOG_SUCCESS;

    B_GiveXP (150);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);//nagroda zwi�kszona o 10 1.4
    AI_StopProcessInfos	(self);
};