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
	description		= "Gdzieœ tutaj musi byæ gniazdo pe³zaczy."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Gdzieœ tutaj musi byæ gniazdo pe³zaczy.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Ca³a ta przeklêta góra jest jednym wielkim gniazdem pe³zaczy!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Dlaczego zamkniêto ten szyb?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Niewa¿ne ile pe³zaczy zabijaliœmy, kolejne zastêpy wyrasta³y jak spod ziemi.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Wygl¹da na to, ¿e gdzieœ w pobli¿u jest ich gniazdo. Pozwól mi otworzyæ drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Nie! To przejœcie mo¿na otworzyæ tylko za pozwoleniem Iana! Bez tego nie ma o czym mówiæ! 
	
	B_LogEntry		(CH2_MCEggs,	"Asghan, przywódca Stra¿ników z kopalni nie chce otworzyæ dla mnie bramy bez upowa¿nienia Iana.");

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
	description		= "Hej, Asghan! Mo¿esz ju¿ otworzyæ te drzwi!"; 
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
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghan! Mo¿esz ju¿ otworzyæ te drzwi!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Mówi³em ci ju¿: tylko jeœli Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Wszystko bêdzie w porz¹dku... Pozdrowienia od Iana.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Có¿, jeœli Ian bierze na siebie odpowiedzialnoœæ... Ale tylko pod jednym warunkiem!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakim warunkiem?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //SprowadŸ mi tu najpierw dwóch albo trzech Stra¿ników Œwi¹tynnych. Nie chcê tu siedzieæ sam, gdy ca³y szyb zaroi siê od pe³zaczy!
	
	B_LogEntry		(CH2_MCEggs,	"Mimo wszystko, Asghan nie otworzy bramy dopóki nie sprowadzê mu kilku Stra¿ników Œwi¹tynnych do pomocy.");

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
	description		= "Przygotowania skoñczone. Mo¿na ju¿ otworzyæ drzwi!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Przygotowania skoñczone. Mo¿na ju¿ otworzyæ drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Dobra, otwieramy szyb. Bêdzie niez³y bal!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,	"Uda³o mi siê znaleŸæ wystarczaj¹c¹ liczbê Stra¿ników Œwi¹tynnych. Ciekawe, co mnie czeka po drugiej stronie bramy?");
		
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
	description		= "Pe³zacze nie bêd¹ wam ju¿ zagra¿a³y!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Pe³zacze nie bêd¹ wam ju¿ zagra¿a³y!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //To wspania³a wiadomoœæ! Wyœlê goñca do Thorusa z dobrymi nowinami!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
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
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Ujdzie... Tak d³ugo jak nikt nie bêdzie próbowa³ otworzyæ tych drzwi, nie bêdê musia³ wdawaæ siê w bójki.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //A co jest takiego szczególnego za tymi drzwiami?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Pe³zacze. Wielkie, paskudne pe³zacze. Ca³e mnóstwo wielkich, paskudnych pe³zaczy!
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
   description	= "(Zagadaj o stra¿nikach)";
};

FUNC INT DIA_Asghan_PIJACZEK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaBar_SZPIEG))
	&& (AsUpity == false)
	&& (CorKalom_BringMCQBalls == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Asghan_PIJACZEK_Info()
{
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_15_01"); //Ej, jak to jest z t¹ pomoc¹ Bractwu?
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_03_02"); //Co? Nie wiem, o co ci chodzi.

    Info_ClearChoices		(DIA_Asghan_PIJACZEK);
    Info_AddChoice		(DIA_Asghan_PIJACZEK, DIALOG_BACK, DIA_Asghan_PIJACZEK_BACK);
    Info_AddChoice		(DIA_Asghan_PIJACZEK, "Napi³byœ siê mo¿e piwa?", DIA_Asghan_PIJACZEK_PIWO);
};

FUNC VOID DIA_Asghan_PIJACZEK_BACK()
{
    Info_ClearChoices	(DIA_Asghan_PIJACZEK);
};

FUNC VOID DIA_Asghan_PIJACZEK_PIWO()
{
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_PIWO_15_01"); //Napi³byœ siê mo¿e piwa?
    if (Npc_HasItems (other, ItFoBeer) >=1)
    {
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_02"); //O tak! Chêtnie.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFoBeer);
    AI_Output (other, self ,"DIA_Asghan_PIJACZEK_PIWO_15_03"); //I jak to jest z t¹ pomoc¹?
    AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_04"); //A co tu du¿o mówiæ. Stra¿nicy od teraz maj¹ pomagaæ ludziom z Bractwa.
    B_LogEntry                     (CH1_PSIcampWORK,"Po piwie Asghan sta³ siê bardziej rozmowny. Dowiedzia³em siê od niego, ¿e Stra¿nicy maj¹ w czymœ pomagaæ ludziom z Bractwa.");
	AsUpity=true;
    B_GiveXP (50);
    }
    else
    {
        AI_Output (self, other ,"DIA_Asghan_PIJACZEK_PIWO_03_05"); //Nie widzê tu ¿adnego piwa!
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
	&& (CorKalom_BringMCQBalls == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Asghan_SZPIEG2_Info()
{
    AI_Output (other, self ,"DIA_Asghan_SZPIEG2_15_01"); //Co dostajecie za pomoc?
    AI_Output (other, self ,"DIA_Asghan_SZPIEG2_03_02"); //Proszê, napij siê piwa.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_03"); //Dziêki.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_04"); //Za pomoc w pozyskiwaniu wydzieliny pe³zaczy Bractwo p³aci nam zielem.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_05"); //Je¿eli zabijemy pe³zacze, to wyrywamy im nogi jako dowód i tyle. W nagrodê dostajemy rudê lub ziele.
    AI_Output (self, other ,"DIA_Asghan_SZPIEG2_03_06"); //Wiêkszoœæ ziela otrzymuje Gomez, a my zazwyczaj dostajemy rudê.
    B_LogEntry                     (CH1_PSIcampWORK,"Ju¿ wiem wszystko o wspó³pracy Stra¿ników z Bractwem. Ci pierwsi maj¹ pomagaæ Stra¿nikom Œwi¹tynnym pozyskiwaæ wydzielinê pe³zaczy. Bractwo w zamian p³aci im zielem. Myœlê, ¿e mam ju¿ wystarczaj¹co informacji dla Quentina.");

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
   description	= "Szukam informacji o pewnym skazañcu...";
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
    AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_01"); //Szukam informacji o pewnym skazañcu...
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_02"); //Czemu przechodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_03"); //Naprowadzi³ mnie Cieñ R¹czka. Kojarzysz go? 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_04"); //Ta, znam R¹czkê. Ju¿ wiem o kogo ci chodzi. O Hrabiego Robena. 
	AI_Output (other, self ,"DIA_Asghan_OldTownsman_15_05"); //Jak to siê sta³o, ¿e hrabia trafi³ do Górniczej Doliny? 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_06"); //Do reszty zdurnia³eœ? Hrabia to nie jego tytu³. Po prostu tak go sobie nazwaliœmy, bo goœæ by³ naprawdê udany. 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_07"); //Buntownik z niego. Myœla³, ¿e powali wszystkich na kolana. Liczy³, ¿e uratuje go z³oto, które KIEDYŒ MIA³. A teraz ju¿ go nie ma, he he. 
    AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_08"); //Próbowa³ kilka razy uciekaæ. Bi³ siê ze wszystkimi, ci¹gle szuka³ zaczepki, a teraz jest tylko cieniem cz³owieka. 
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_09"); //Z tego co mi wiadomo to ca³a ta jego fortuna to by³ jakiœ przekrêt zwi¹zany ze skarbcem jakiejœ Gildii Kupieckiej. 
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_10"); //Ani fortuna, ani gildia ju¿ nie istniej¹. A wracaj¹c do naszego 'Hrabiego' to od kilku dni go nie widzia³em.
	AI_Output (self, other ,"DIA_Asghan_OldTownsman_03_11"); //Pewnie siê gdzieœ zaszy³ i zdech³ z g³odu. Nie szkoda mi go jakoœ. Ju¿ siê ob³awia³ w luksusy dostatecznie d³ugo. 
};

//========================================
// Zadanie "Skarb dla stra¿nika"
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
   AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_00"); //Poszukuje informacji o niejakim Craigu. Zna³eœ go?
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_01"); //Kojarzê. Ma³o przyjemny typ. Ma³o rozrywkowy. Dusigrosz i nudziarz. Ci¹gle narzeka³ na innych, ¿e ma³o pracuj¹, a dobrze siê bawi¹.  
	AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_02"); //Wspomina³eœ o tym, ¿e by³o oszczêdny...
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_03"); //Chyba chytry! Niech zgadnê, chodzi ci o ten niby skarb, który mia³ po sobie zostawiæ? Moim zdaniem to bujda.
	AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_04"); //Poza tym w¹tpiê, by ten frajer nawet zza grobu móg³ kogoœ uszczêœliwiæ.
	AI_Output(other, self, "DIA_Asghan_AskAboutCraig_15_05"); //Widze, ¿e nie znasz i nie chcesz znaæ szczegó³ów w tej sprawie. Jest ktoœ kto móg³by mi powiedzieæ coœ jeszcze?
   AI_Output(self, other, "DIA_Asghan_AskAboutCraig_03_06"); //Naiwniak z ciebie. Dla formalnoœci mo¿esz popytaæ handlarza Santino, on wie sporo o ludziach z kopalni. Potem strzel sobie kilka piw i zapomnij o tym skarbie!
	
	B_LogEntry(CH2_TreasureOldGuard, "Asghan te¿ nie by³ zbyt rozmowny na temat Craiga. Odes³a³ mnie do Santino.");
};