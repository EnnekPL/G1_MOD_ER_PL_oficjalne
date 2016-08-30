//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie� tutaj musi by� gniazdo pe�zaczy."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Gdzie� tutaj musi by� gniazdo pe�zaczy.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Ca�a ta przekl�ta g�ra jest jednym wielkim gniazdem pe�zaczy!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Dlaczego zamkni�to ten szyb?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Niewa�ne ile pe�zaczy zabijali�my, kolejne zast�py wyrasta�y jak spod ziemi.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Wygl�da na to, �e gdzie� w pobli�u jest ich gniazdo. Pozw�l mi otworzy� drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Nie! To przej�cie mo�na otworzy� tylko za pozwoleniem Iana! Bez tego nie ma o czym m�wi�! 
	
	B_LogEntry		(CH2_MCEggs,	"Asghan, przyw�dca Stra�nik�w z kopalni nie chce otworzy� dla mnie bramy bez upowa�nienia Iana.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hej, Asghan! Mo�esz ju� otworzy� te drzwi!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghan! Mo�esz ju� otworzy� te drzwi!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //M�wi�em ci ju�: tylko je�li Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Wszystko b�dzie w porz�dku... Pozdrowienia od Iana.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //C�, je�li Ian bierze na siebie odpowiedzialno��... Ale tylko pod jednym warunkiem!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakim warunkiem?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Sprowad� mi tu najpierw dw�ch albo trzech Stra�nik�w �wi�tynnych. Nie chc� tu siedzie� sam, gdy ca�y szyb zaroi si� od pe�zaczy!
	
	B_LogEntry		(CH2_MCEggs,	"Mimo wszystko, Asghan nie otworzy bramy dop�ki nie sprowadz� mu kilku Stra�nik�w �wi�tynnych do pomocy.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przygotowania sko�czone. Mo�na ju� otworzy� drzwi!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Przygotowania sko�czone. Mo�na ju� otworzy� drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Dobra, otwieramy szyb. B�dzie niez�y bal!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,	"Uda�o mi si� znale�� wystarczaj�c� liczb� Stra�nik�w �wi�tynnych. Ciekawe, co mnie czeka po drugiej stronie bramy?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pe�zacze nie b�d� wam ju� zagra�a�y!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Pe�zacze nie b�d� wam ju� zagra�a�y!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //To wspania�a wiadomo��! Wy�l� go�ca do Thorusa z dobrymi nowinami!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz l�uft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Jak leci?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Ujdzie... Tak d�ugo jak nikt nie b�dzie pr�bowa� otworzy� tych drzwi, nie b�d� musia� wdawa� si� w b�jki.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //A co jest takiego szczeg�lnego za tymi drzwiami?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Pe�zacze. Wielkie, paskudne pe�zacze. Ca�e mn�stwo wielkich, paskudnych pe�zaczy!
};  



var int AsUpity;
//========================================
//-----------------> PIJACZEK
//========================================

INSTANCE DIA_Asghan_PIJACZEK (C_INFO)
{
   npc          = Grd_263_Asghan;
   nr           = 1;
   condition    = DIA_Asghan_PIJACZEK_Condition;
   information  = DIA_Asghan_PIJACZEK_Info;
   permanent	= true;
   description	= "(Zagadaj o stra�nikach)";
};

FUNC INT DIA_Asghan_PIJACZEK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaBar_SZPIEG))
	&& (AsUpity == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Asghan_PIJACZEK_Info()
{
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_15_01"); //Ej, jak to jest z t� pomoc� Bractwu?
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_03_02"); //Co? Nie wiem, o co ci chodzi.

    Info_ClearChoices		(DIA_Asghan_PIJACZEK);
    Info_AddChoice		(DIA_Asghan_PIJACZEK, DIALOG_BACK, DIA_Asghan_PIJACZEK_BACK);
    Info_AddChoice		(DIA_Asghan_PIJACZEK, "Napi�by� si� mo�e piwa?", DIA_Asghan_PIJACZEK_PIWO);
};

FUNC VOID DIA_Asghan_PIJACZEK_BACK()
{
    Info_ClearChoices	(DIA_Asghan_PIJACZEK);
};

FUNC VOID DIA_Asghan_PIJACZEK_PIWO()
{
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_PIWO_15_01"); //Napi�by� si� mo�e piwa?
    if (Npc_HasItems (other, ItFoBeer) >=1)
    {
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_02"); //O tak! Ch�tnie.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFoBeer);
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_PIWO_15_03"); //I jak to jest z t� pomoc�?
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_04"); //A co tu du�o m�wi�. Stra�nicy od teraz maj� pomaga� ludziom z Bractwa.
    B_LogEntry                     (CH1_PSIcampWORK,"Po piwie Asghan sta� si� bardziej rozmowny. Dowiedzia�em si� od niego, �e Stra�nicy maj� w czym� pomaga� ludziom z Bractwa.");
	AsUpity=true;
    B_GiveXP (50);
    }
    else
    {
        AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_05"); //Nie widz� tu �adnego piwa!
    };
};



//========================================
//-----------------> SZPIEG2
//========================================

INSTANCE DIA_Asghan_SZPIEG2 (C_INFO)
{
   npc          = Grd_263_Asghan;
   nr           = 3;
   condition    = DIA_Asghan_SZPIEG2_Condition;
   information  = DIA_Asghan_SZPIEG2_Info;
   permanent	= FALSE;
   description	= "Co dostajecie za pomoc?";
};

FUNC INT DIA_Asghan_SZPIEG2_Condition()
{
    if (AsUpity == true)
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Asghan_SZPIEG2_Info()
{
    AI_Output (other, self ,"DIA_Asghan_SZPIEG2_15_01"); //Co dostajecie za pomoc?
    AI_Output (other, self ,"DIA_Asghan_SZPIEG2_03_02"); //Prosz�, napij si� piwa.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_03"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_04"); //Za pomoc w pozyskiwaniu wydzieliny pe�zaczy Bractwo p�aci nam zielem.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_05"); //Je�eli zabijemy pe�zacze, to wyrywamy im nogi jako dow�d i tyle. W nagrod� dostajemy rud� lub ziele.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_06"); //Wi�kszo�� ziela otrzymuje Gomez, a my zazwyczaj dostajemy rud�.
    B_LogEntry                     (CH1_PSIcampWORK,"Ju� wiem wszystko o wsp�pracy Stra�nik�w z Bractwem. Ci pierwsi maj� pomaga� Stra�nikom �wi�tynnym pozyskiwa� wydzielin� pe�zaczy. Bractwo w zamian p�aci im zielem. My�l�, �e mam ju� wystarczaj�co informacji dla Quentina.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OldTownsman
//========================================

INSTANCE DIA_Asghan_OldTownsman (C_INFO)
{
   npc          = Grd_263_Asghan;
   nr           = 1;
   condition    = DIA_Asghan_OldTownsman_Condition;
   information  = DIA_Asghan_OldTownsman_Info;
   permanent	= FALSE;
   description	= "Szukam informacji o pewnym skaza�cu...";
};

FUNC INT DIA_Asghan_OldTownsman_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_FingersStayAlive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Asghan_OldTownsman_Info()
{
    AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_01"); //Szukam informacji o pewnym skaza�cu...
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_02"); //Czemu przechodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_03"); //Naprowadzi� mnie Cie� R�czka. Kojarzysz go? 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_04"); //Ta, znam R�czk�. Ju� wiem o kogo ci chodzi. O Hrabiego Robena. 
	AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_05"); //Jak to si� sta�o, �e hrabia trafi� do G�rniczej Doliny? 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_06"); //Do reszty zdurnia�e�? Hrabia to nie jego tytu�. Po prostu tak go sobie nazwali�my, bo go�� by� naprawd� udany. 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_07"); //Buntownik z niego. My�la�, �e powali wszystkich na kolana. Liczy�, �e uratuje go z�oto, kt�re KIEDY� MIA�. A teraz ju� go nie ma, he he. 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_08"); //Pr�bowa� kilka razy ucieka�. Bi� si� ze wszystkimi, ci�gle szuka� zaczepki, a teraz jest tylko cieniem cz�owieka. 
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_09"); //Z tego co mi wiadomo to ca�a ta jego fortuna to by� jaki� przekr�t zwi�zany ze skarbcem jakiej� Gildii Kupieckiej. 
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_10"); //Ani fortuna, ani gildia ju� nie istniej�. A wracaj�c do naszego 'Hrabiego' to od kilku dni go nie widzia�em.
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_11"); //Pewnie si� gdzie� zaszy� i zdech� z g�odu. Nie szkoda mi go jako�. Ju� si� ob�awia� w luksusy dostatecznie d�ugo. 
};

//========================================
// Zadanie "Skarb dla stra�nika"
//========================================

INSTANCE DIA_Asghan_AskAboutCraig (C_INFO)
{
   npc          = Grd_263_Asghan;
   nr           = 2;
   condition    = DIA_Asghan_AskAboutCraig_Condition;
   information  = DIA_Asghan_AskAboutCraig_Info;
   permanent	= FALSE;
   description	= "Poszukuje informacji o niejakim Craigu.";
};

FUNC INT DIA_Asghan_AskAboutCraig_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_KUCHARZ_AskAboutCraig))
   {
		return TRUE;
   };
};

FUNC VOID DIA_Asghan_AskAboutCraig_Info()
{
   AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_00"); //Poszukuje informacji o niejakim Craigu. Zna�e� go?
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_01"); //Kojarz�. Ma�o przyjemny typ. Ma�o rozrywkowy. Dusigrosz i nudziarz. Ci�gle narzeka� na innych, �e ma�o pracuj�, a dobrze si� bawi�.  
	AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_02"); //Wspomina�e� o tym, �e by�o oszcz�dny...
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_03"); //Chyba chytry! Niech zgadn�, chodzi ci o ten niby skarb, kt�ry mia� po sobie zostawi�? Moim zdaniem to bujda.
	AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_04"); //Poza tym w�tpi�, by ten frajer nawet zza grobu m�g� kogo� uszcz�liwi�.
	AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_05"); //Widze, �e nie znasz i nie chcesz zna� szczeg��w w tej sprawie. Jest kto� kto m�g�by mi powiedzie� co� jeszcze?
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_06"); //Naiwniak z ciebie. Dla formalno�ci mo�esz popyta� handlarza Santino, on wie sporo o ludziach z kopalni. Potem strzel sobie kilka piw i zapomnij o tym skarbie!
	
	B_LogEntry(CH1_TreasureOldGuard, "Asghan te� nie by� zbyt rozmowny na temat Craiga. Odes�a� mnie do Santino.");
};