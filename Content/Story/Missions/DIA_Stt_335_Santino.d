//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  STT_335_Santino_Exit (C_INFO)
{
	npc			=  STT_335_Santino;
	nr			=  999;
	condition	=  STT_335_Santino_Exit_Condition;
	information	=  STT_335_Santino_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_335_Santino_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


//========================================
//-----------------> HANDEL
//========================================

INSTANCE DIA_Santino_HANDEL (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 1;
   condition    = DIA_Santino_HANDEL_Condition;
   information  = DIA_Santino_HANDEL_Info;
   permanent	= FALSE;
   description	= "Co sprzedajesz?";
};

FUNC INT DIA_Santino_HANDEL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Santino_HANDEL_Info()
{
    AI_Output (other, self ,"DIA_Santino_HANDEL_15_01"); //Co sprzedajesz?
    AI_Output (self, other ,"DIA_Santino_HANDEL_03_02"); //Kupisz u mnie rzeczy, które przydadz¹ ci siê w kopalni. Jedzenie, pochodnie, ekwipunek i co tylko bêdziesz tutaj potrzebowa³. 
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Santino handluje rzeczami przydatnymi w kopalni. Jego stoisko znajduje siê na samej górze kopalni. "); 
};



// ***************** Infos *****************************

instance  STT_335_Santino_BUY (C_INFO)
{
	npc				= STT_335_Santino;
	condition		= STT_335_Santino_BUY_Condition;
	information		= STT_335_Santino_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_335_Santino_BUY_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Santino_HANDEL)) {
	return 1; };
};


FUNC void  STT_335_Santino_BUY_Info()
{
	AI_Output (other, self,"STT_335_Santino_BUY_Info_15_01"); //Mogê coœ od ciebie kupiæ?
	AI_Output (self, other,"STT_335_Santino_BUY_Info_07_02"); //Mam tu wszystko, czego móg³byœ zapragn¹æ. To czego NIE MAM, i tak by ci siê nie przyda³o.
	
};

//========================================
//-----------------> SMALLTALK
//========================================

INSTANCE DIA_Santino_SMALLTALK (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 1;
   condition    = DIA_Santino_SMALLTALK_Condition;
   information  = DIA_Santino_SMALLTALK_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmowa³eœ zanim trafi³eœ do Kolonii?";
};

FUNC INT DIA_Santino_SMALLTALK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Santino_SMALLTALK_Info()
{
   AI_Output (other, self ,"DIA_Santino_SMALLTALK_15_01"); //Czym siê zajmowa³eœ zanim trafi³eœ do kolonii?
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_02"); //Ach... By³em kupcem mieszkaj¹cym w Mora Sul. To jedno z najwiêkszych i najstarszych miast pustyni. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_03"); //Zapewne s³ysza³eœ ju¿ o bitwie o Varrant, w której to wojska Króla rozgromi³y najlepszych genera³ów pustyni.
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_04"); //Wielu z Varantczyków wówczas stracono, lub uwiêziono. Mia³em takie szczêœcie, ¿e zamiast gniæ w lochu wyl¹dowa³em tutaj.
   AI_Output (other, self ,"DIA_Santino_SMALLTALK_15_05"); //Dlaczego w³aœciwie Rhobar najecha³ Varrant?
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_06"); //Przez ¿¹dzê w³adzy i ambicjê, a tak¿e przekonany o misji od samego Innosa... Królowie Myrtany uwa¿aj¹ siê za jego wybrañców i dlatego prowadz¹ kolejne wojny w jego imieniu. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_07"); //Varant zaœ by³ od wieków krain¹ Adanosa. Od czasów gdy po wielkim potopie zes³anym na Pradawnych moi przodkowie, Koczownicy zeszli z gór i ruszyli szlakiem Wiecznego Wêdrowca. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_08"); //W miêdzyczasie osiedli i zbudowali bogate miasta na szlaku wêdrówek, a wiadomo, ¿e bogactwo przyci¹ga szakale... 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_09"); //Najœmieszniejszy jednak jest fakt, ¿e temu szakalowi na nic siê to nie zda³o i choæ po³o¿y³ swe ³apska na bogactwach mego ludu to przegra wojnê. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_10"); //Szala zwyciêstwa w wojnie z orkami jest przechylona na niekorzyœæ Rhobara. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_11"); //Moi bracia z pustyni, jak tylko wyczuj¹ s³aboœæ korony, chwyc¹ za broñ. Zarówno ci którzy pod¹¿aj¹ za Adanosem, jak i ci którzy wybrali Beliara.
};

//========================================
//-----------------> AreYouShadow
//========================================

INSTANCE DIA_Santino_AreYouShadow (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 1;
   condition    = DIA_Santino_AreYouShadow_Condition;
   information  = DIA_Santino_AreYouShadow_Info;
   permanent	= FALSE;
   description	= "Jesteœ Cieniem?";
};

FUNC INT DIA_Santino_AreYouShadow_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Santino_AreYouShadow_Info()
{
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_01"); //Jesteœ Cieniem?
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_02"); //Zgadza siê. Mia³em jednak doœæ Starego Obozu, wiêc postanowi³em trochê zmieniæ otoczenie.
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_03"); //Handel w kopalni jest równie op³acalny. Ludzie tutaj te¿ potrzebuj¹ jedzenia i narzêdzi.
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_04"); //Dlaczego nie chcia³eœ zostaæ w Starym Obozie?
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_05"); //Wiesz, to d³uga historia. Przynieœ mi piwo, a z chêci¹ ci j¹ opowiem.
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_06"); //Zaczekaj chwilê.
};

INSTANCE DIA_Santino_TakeBeer (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 1;
   condition    = DIA_Santino_TakeBeer_Condition;
   information  = DIA_Santino_TakeBeer_Info;
   permanent	= FALSE;
   description	= "Proszê, wypij moje zdrowie.";
};

FUNC INT DIA_Santino_TakeBeer_Condition()
{
	if (Npc_HasItems(other, ItFoBeer) >= 1) 
	&& (Npc_KnowsInfo (hero, DIA_Santino_AreYouShadow)) {
		return TRUE;
	};
};

FUNC VOID DIA_Santino_TakeBeer_Info()
{
    AI_Output (other, self ,"DIA_Santino_TakeBeer_15_01"); //Proszê, wypij moje zdrowie.
	B_GiveInvItems(other, self, ItFoBeer, 1);
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_02"); //Dziêki.
	AI_UseItem(self,ItFoBeer);
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_03"); //Od razu lepiej. A co do opuszczenia przeze mnie Obozu...
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_04"); //Handlowa³em niegdyœ na targowisku. Mia³em œwietny utarg, bo obni¿a³em ceny do granicy op³acalnoœci.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_05"); //Ponadto moje towary by³y lepszej jakoœci. Mia³em dobre relacje ze Stra¿nikami, którzy przynosili towary ze Œwiata Zewnêtrznego do Obozu.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_06"); //Gdy trafi³o siê coœ lepszego, zostawiali to dla mnie i nie ¿¹dali nie wiadomo ile rudy.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_07"); //Interes szed³ œwietnie dopóki nie pojawi³ siê Fisk. Zazdroœci³ mi powodzenia i postanowi³ mnie wygryŸæ.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_08"); //Zaszanta¿owa³ Stra¿ników. Powiedzia³, ¿e powie Gomezowi, ¿e podbieraj¹ jego rzeczy.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_09"); //Przera¿eni Stra¿nicy natychmiast przestali ze mn¹ rozmawiaæ, a Fisk zacz¹³ mi groziæ.
	AI_Output (self, other ,"DIA_Santino_TakeBeer_03_10"); //Powiedzia³em mu, ¿e kiedyœ siê zemszczê. Od tamtego czasu chaty Fiska ca³y dzieñ pilnuje jakiœ Stra¿nik.
	AI_Output (self, other ,"DIA_Santino_TakeBeer_03_11"); //Z chêci¹ puœci³bym te jego budê z dymem. Kiedyœ w koñcu to zrobiê, ale na razie zostanê tutaj...
};

//========================================
// Zadanie "Skarb dla Stra¿nik"
//========================================

INSTANCE DIA_Santino_AskAboutCraig (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 2;
   condition    = DIA_Santino_AskAboutCraig_Condition;
   information  = DIA_Santino_AskAboutCraig_Info;
   permanent	= FALSE;
   description	= "Szukam informacji o Stra¿niku imieniem Craig.";
};

FUNC INT DIA_Santino_AskAboutCraig_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Asghan_AskAboutCraig))
   {
		return TRUE;
   };
};

FUNC VOID DIA_Santino_AskAboutCraig_Info()
{
   AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_00"); //Szukam informacji o Stra¿niku imieniem Craig.
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_01"); //Dziwne. Facet ju¿ dawno nie ¿yje i ma³o kto o nim jeszcze pamiêta. Ale na pewno jest to jego bratanek.
	AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_02"); //Bratanek? Kto nim jest?
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_03"); //Zaraz... Kto to móg³ byæ... (Wskazuje na sakiewkê)
	AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_04"); //Mhm... Nie ma to jak szukaæ informacji u handlarzy. Ile to mnie bêdzie kosztowaæ?
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_05"); //75 bry³³ek.
	
	B_LogEntry(CH2_TreasureOldGuard, "Santino za informacje ¿¹da 75 bry³ek.");
};

INSTANCE DIA_Santino_CraigsNephew (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 2;
   condition    = DIA_Santino_CraigsNephew_Condition;
   information  = DIA_Santino_CraigsNephew_Info;
   permanent	= FALSE;
   description	= "Niech bêdzie. WeŸ tê rudê i powiedz, kto jest bratankiem Craiga.";
};

FUNC INT DIA_Santino_CraigsNephew_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Santino_AskAboutCraig)) && (Npc_HasItems (hero, ItMiNugget)>=75)
   {
		return TRUE;
   };
};

FUNC VOID DIA_Santino_CraigsNephew_Info()
{
   AI_Output(other, self, "DIA_Santino_CraigsNephew_15_00"); //Niech bêdzie. WeŸ tê rudê i powiedz, kto jest bratankiem Craiga.
   AI_Output(self, other, "DIA_Santino_CraigsNephew_03_01"); //No proszê, jesteœ zdeterminowany. Teraz jestem pewien, ¿e szukasz informacji o skarbie, który mia³ pozostawiæ Craig.
	AI_Output(self, other, "DIA_Santino_CraigsNephew_15_02"); //Zgodnie z nasz¹ umow¹ powiem ci, kto jest jego bratankiem. Chodzi o Joela, to Stra¿nik w obozie przed kopalni¹.
	AI_Output(other, self, "DIA_Santino_CraigsNephew_15_03"); //Dziêki.
	AI_Output(self, other, "DIA_Santino_CraigsNephew_15_04"); //To ja dziêkujê.
	
	B_GiveInvItems (other, self, itminugget, 75);
	B_GiveXP (50);
	
	B_LogEntry(CH2_TreasureOldGuard, "Bratankiem Craiga jest Stra¿nik Joel. Muszê z nim pogadaæ. To mój jedyny trop w sprawie skarbu.");
};