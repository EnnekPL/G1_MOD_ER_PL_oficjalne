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
    AI_Output (self, other ,"DIA_Santino_HANDEL_03_02"); //Kupisz u mnie rzeczy, kt�re przydadz� ci si� w kopalni. Jedzenie, pochodnie, ekwipunek i co tylko b�dziesz tutaj potrzebowa�. 
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Santino handluje rzeczami przydatnymi w kopalni. Jego stoisko znajduje si� na samej g�rze kopalni. "); 
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
	AI_Output (other, self,"STT_335_Santino_BUY_Info_15_01"); //Mog� co� od ciebie kupi�?
	AI_Output (self, other,"STT_335_Santino_BUY_Info_07_02"); //Mam tu wszystko, czego m�g�by� zapragn��. To czego NIE MAM, i tak by ci si� nie przyda�o.
	
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
   description	= "Czym si� zajmowa�e� zanim trafi�e� do Kolonii?";
};

FUNC INT DIA_Santino_SMALLTALK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Santino_SMALLTALK_Info()
{
   AI_Output (other, self ,"DIA_Santino_SMALLTALK_15_01"); //Czym si� zajmowa�e� zanim trafi�e� do kolonii?
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_02"); //Ach... By�em kupcem mieszkaj�cym w Mora Sul. To jedno z najwi�kszych i najstarszych miast pustyni. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_03"); //Zapewne s�ysza�e� ju� o bitwie o Varrant, w kt�rej to wojska Kr�la rozgromi�y najlepszych genera��w pustyni.
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_04"); //Wielu z Varantczyk�w w�wczas stracono, lub uwi�ziono. Mia�em takie szcz�cie, �e zamiast gni� w lochu wyl�dowa�em tutaj.
   AI_Output (other, self ,"DIA_Santino_SMALLTALK_15_05"); //Dlaczego w�a�ciwie Rhobar najecha� Varrant?
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_06"); //Przez ��dz� w�adzy i ambicj�, a tak�e przekonany o misji od samego Innosa... Kr�lowie Myrtany uwa�aj� si� za jego wybra�c�w i dlatego prowadz� kolejne wojny w jego imieniu. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_07"); //Varant za� by� od wiek�w krain� Adanosa. Od czas�w gdy po wielkim potopie zes�anym na Pradawnych moi przodkowie, Koczownicy zeszli z g�r i ruszyli szlakiem Wiecznego W�drowca. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_08"); //W mi�dzyczasie osiedli i zbudowali bogate miasta na szlaku w�dr�wek, a wiadomo, �e bogactwo przyci�ga szakale... 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_09"); //Naj�mieszniejszy jednak jest fakt, �e temu szakalowi na nic si� to nie zda�o i cho� po�o�y� swe �apska na bogactwach mego ludu to przegra wojn�. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_10"); //Szala zwyci�stwa w wojnie z orkami jest przechylona na niekorzy�� Rhobara. 
   AI_Output (self, other ,"DIA_Santino_SMALLTALK_03_11"); //Moi bracia z pustyni, jak tylko wyczuj� s�abo�� korony, chwyc� za bro�. Zar�wno ci kt�rzy pod��aj� za Adanosem, jak i ci kt�rzy wybrali Beliara.
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
   description	= "Jeste� Cieniem?";
};

FUNC INT DIA_Santino_AreYouShadow_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Santino_AreYouShadow_Info()
{
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_01"); //Jeste� Cieniem?
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_02"); //Zgadza si�. Mia�em jednak do�� Starego Obozu, wi�c postanowi�em troch� zmieni� otoczenie.
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_03"); //Handel w kopalni jest r�wnie op�acalny. Ludzie tutaj te� potrzebuj� jedzenia i narz�dzi.
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_04"); //Dlaczego nie chcia�e� zosta� w Starym Obozie?
    AI_Output (self, other ,"DIA_Santino_AreYouShadow_03_05"); //Wiesz, to d�uga historia. Przynie� mi piwo, a z ch�ci� ci j� opowiem.
    AI_Output (other, self ,"DIA_Santino_AreYouShadow_15_06"); //Zaczekaj chwil�.
};

INSTANCE DIA_Santino_TakeBeer (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 1;
   condition    = DIA_Santino_TakeBeer_Condition;
   information  = DIA_Santino_TakeBeer_Info;
   permanent	= FALSE;
   description	= "Prosz�, wypij moje zdrowie.";
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
    AI_Output (other, self ,"DIA_Santino_TakeBeer_15_01"); //Prosz�, wypij moje zdrowie.
	B_GiveInvItems(other, self, ItFoBeer, 1);
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_02"); //Dzi�ki.
	AI_UseItem(self,ItFoBeer);
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_03"); //Od razu lepiej. A co do opuszczenia przeze mnie Obozu...
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_04"); //Handlowa�em niegdy� na targowisku. Mia�em �wietny utarg, bo obni�a�em ceny do granicy op�acalno�ci.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_05"); //Ponadto moje towary by�y lepszej jako�ci. Mia�em dobre relacje ze Stra�nikami, kt�rzy przynosili towary ze �wiata Zewn�trznego do Obozu.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_06"); //Gdy trafi�o si� co� lepszego, zostawiali to dla mnie i nie ��dali nie wiadomo ile rudy.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_07"); //Interes szed� �wietnie dop�ki nie pojawi� si� Fisk. Zazdro�ci� mi powodzenia i postanowi� mnie wygry��.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_08"); //Zaszanta�owa� Stra�nik�w. Powiedzia�, �e powie Gomezowi, �e podbieraj� jego rzeczy.
    AI_Output (self, other ,"DIA_Santino_TakeBeer_03_09"); //Przera�eni Stra�nicy natychmiast przestali ze mn� rozmawia�, a Fisk zacz�� mi grozi�.
	AI_Output (self, other ,"DIA_Santino_TakeBeer_03_10"); //Powiedzia�em mu, �e kiedy� si� zemszcz�. Od tamtego czasu chaty Fiska ca�y dzie� pilnuje jaki� Stra�nik.
	AI_Output (self, other ,"DIA_Santino_TakeBeer_03_11"); //Z ch�ci� pu�ci�bym te jego bud� z dymem. Kiedy� w ko�cu to zrobi�, ale na razie zostan� tutaj...
};

//========================================
// Zadanie "Skarb dla Stra�nik"
//========================================

INSTANCE DIA_Santino_AskAboutCraig (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 2;
   condition    = DIA_Santino_AskAboutCraig_Condition;
   information  = DIA_Santino_AskAboutCraig_Info;
   permanent	= FALSE;
   description	= "Szukam informacji o Stra�niku imieniem Craig.";
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
   AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_00"); //Szukam informacji o Stra�niku imieniem Craig.
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_01"); //Dziwne. Facet ju� dawno nie �yje i ma�o kto o nim jeszcze pami�ta. Ale na pewno jest to jego bratanek.
	AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_02"); //Bratanek? Kto nim jest?
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_03"); //Zaraz... Kto to m�g� by�... (Wskazuje na sakiewk�)
	AI_Output(other, self, "DIA_Santino_AskAboutCraig_15_04"); //Mhm... Nie ma to jak szuka� informacji u handlarzy. Ile to mnie b�dzie kosztowa�?
   AI_Output(self, other, "DIA_Santino_AskAboutCraig_03_05"); //75 bry��ek.
	
	B_LogEntry(CH1_TreasureOldGuard, "Santino za informacje ��da 75 bry�ek.");
};

INSTANCE DIA_Santino_CraigsNephew (C_INFO)
{
   npc          = STT_335_Santino;
   nr           = 2;
   condition    = DIA_Santino_CraigsNephew_Condition;
   information  = DIA_Santino_CraigsNephew_Info;
   permanent	= FALSE;
   description	= "Niech b�dzie. We� t� rud� i powiedz, kto jest bratankiem Craiga.";
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
   AI_Output(other, self, "DIA_Santino_CraigsNephew_15_00"); //Niech b�dzie. We� t� rud� i powiedz, kto jest bratankiem Craiga.
   AI_Output(self, other, "DIA_Santino_CraigsNephew_03_01"); //No prosz�, jeste� zdeterminowany. Teraz jestem pewien, �e szukasz informacji o skarbie, kt�ry mia� pozostawi� Craig.
	AI_Output(self, other, "DIA_Santino_CraigsNephew_15_02"); //Zgodnie z nasz� umow� powiem ci, kto jest jego bratankiem. Chodzi o Joela, to Stra�nik w obozie przed kopalni�.
	AI_Output(other, self, "DIA_Santino_CraigsNephew_15_03"); //Dzi�ki.
	AI_Output(self, other, "DIA_Santino_CraigsNephew_15_04"); //To ja dzi�kuj�.
	
	B_GiveInvItems (other, self, itminugget, 75);
	B_GiveXP (50);
	
	B_LogEntry(CH1_TreasureOldGuard, "Bratankiem Craiga jest Stra�nik Joel. Musz� z nim pogada�. To m�j jedyny trop w sprawie skarbu.");
};