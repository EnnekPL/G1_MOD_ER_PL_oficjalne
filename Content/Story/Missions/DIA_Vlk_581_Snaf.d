//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Jak leci?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nie najgorzej! Cz�owiek, kt�ry umie dobrze gotowa�, ma tutaj wielu przyjaci�!
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Chcesz mo�e troch� mojej ry�owej zupy?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Dzi�ki.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//M�g�by� co� dla mnie zrobi�...
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Co takiego?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Co takiego?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Za�o�� si�, �e lubisz sobie dobrze podje��. Opracowa�em w�a�nie nowy przepis: potrawka z chrz�szcza a la Snaf z ry�em i grzybami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Dostaniesz ile tylko zechcesz, ale potrzebuj� jeszcze 3 chrz�szczy i par� piekielnik�w - 5 powinno wystarczy�.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Chcesz �ebym si� porzyga�?"	,DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Brzmi nie�le."			,DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chcesz, �ebym si� porzyga�?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nie musisz tego je��, ale powiniene� przynajmniej spr�bowa�! Zreszt�, zawsze mo�esz to komu� odsprzeda�!
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Wys�a�em ju� kogo� po sk�adniki, ale �lad po nim zagin��. Pewnie uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Brzmi nie�le.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Zatem id�, i przynie� mi potrzebne sk�adniki.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poprzedni cz�owiek, kt�rego wys�a�em nie wr�ci�. Zapewne uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu. W nagrod� mog� liczy� na darmowe porcje.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "Mam przy sobie rzeczy, o kt�re prosi�e�!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mam przy sobie rzeczy, o kt�re prosi�e�!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //�wietnie! Teraz musz� je tylko wrzuci� i za chwil� potrawka b�dzie gotowa. Zaczekaj...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items �bergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe, "Snaf ucieszy� si�, gdy da�em mu sk�adniki, kt�rych szuka�.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe, "Od tej pory b�dzie mi codziennie dawa� darmow� porcj� swojej nowej potrawy.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //I dotrzymam s�owa. Prosz�, we� te 3 porcje.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jasne! Ale nic mi ju� dzisiaj nie zosta�o. Wr�� jutro!
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Gdzie mog� znale�� te chrz�szcze?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Gdzie mog� znale�� te chrz�szcze?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Wsz�dzie, gdzie walaj� si� jakie� odpady. Poszukaj w opuszczonych chatach przy zamkowych murach.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Tylko niech ci� nie odstraszy ich paskudny wygl�d. Po ugotowaniu s� ca�kiem smaczne.
	
    B_LogEntry( CH1_SnafsRecipe, "Chrz�szcze znajd� w opuszczonych chatach, przy zamkowych murach.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Gdzie znajd� te piekielniki?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Gdzie znajd� te piekielniki?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Wyjd� z Obozu przez po�udniow� bram�, to ta pod zawalon� wie��. Znajdziesz si� na ��ce, na kt�rej rosn� grzyby.
	
	B_LogEntry( CH1_SnafsRecipe, "Piekielniki rosn� na ��ce, przy zawalonej wie�y po�udniowej bramy.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) ||  (Snaf_Zutaten==LOG_SUCCESS)) && (Sly_LostNek == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Nazywa� si� Nek. Chyba nie czu� si� tu zbyt dobrze. Podejrzewam, �e uciek� do Nowego Obozu.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Wys�a�em go po grzyby, ale nigdy nie wr�ci�...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,	"Snaf wys�a� Neka na poszukiwanie grzyb�w.");
};

//========================================
//-----------------> LookingForWorkers
//========================================

INSTANCE DIA_Snaf_LookingForWorkers (C_INFO)
{
   npc          = VLK_581_Snaf;
   nr           = 2;
   condition    = DIA_Snaf_LookingForWorkers_Condition;
   information  = DIA_Snaf_LookingForWorkers_Info;
   permanent	= FALSE;
   description	= "Szukam ludzi do pracy w Kopalni.";
};

FUNC INT DIA_Snaf_LookingForWorkers_Condition()
{
    if MIS_ZmianaLorenza == LOG_RUNNING
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_LookingForWorkers_Info()
{
    AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_01"); //Szukam ludzi do pracy w Kopalni. Lorenzo kaza� mi zorganizowa� zmian�. Mo�esz mi doradzi� kto m�g�by p�j��?
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_02"); //Do pracy w Kopalni m�wisz? Hmm... Ci�ko b�dzie ci znale�� kogo�, kto p�jdzie tam po dobroci, jednak nasuwa mi si� pewna my�l.
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_03"); //Niejaki Togard to Kopacz, kt�ry za Barier� by� ekspertem od przer�nych minera��w. Bada� mi�dzy innymi pr�bki czarnej rudy.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_04"); //My�l�, �e gdyby� mu wspomnia�, �e w Starej Kopalni znaleziono co� dziwacznego z pewno�ci� chcia�by si� tam jak najszybciej uda�.
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_05"); //A w tej Kopalni s� w og�le jakie� specjalne minera�y poza magiczn� rud�? Czy mam go po prostu ok�ama�? Skoro jest ekspertem to nie b�dzie to �atwe.
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_06"); //Pos�uchaj, mo�e i co� tam maj�, a mo�e i nie maj�. Co miesi�c do Starego Obozu przekazywane s� raporty z Kopalni. 
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_07"); //Wst�pnie przegl�da je Lorenzo. Potem trafiaj� do Bartholo i Gomeza. Je�li znaleziono co� w Kopalni, raport z pewno�ci� to zawiera.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_08"); //M�g�by� zaryzykowa� i wykra�� ten raport z chaty Lorenzo �eby samemu si� przekona�. O z�odziejstwie to najlepiej pogada� z R�czk�.
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_09"); //To do�� ryzykowne, a i ma�o pewne przy okazji. Mo�e jaka� alternatywna �cie�ka?
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_10"); //Id� do Huno i popro� go o pomoc. Za niewielk� op�at� mo�e doda jakiego� g�wna do odlewu, kt�re zmieni odcie� rudy na inny. Stary Togard powinien si� nabra�.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_11"); //Togard pewnie kr�ci si� gdzie� nieopodal swojej chaty. Idziesz po prostu do Po�udniowej Bramy i przechodzisz przez t� wyrw� co to jest w bramie po lewej stronie. 
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_12"); //Dzi�ki za pomoc.
	
	B_LogEntry               (CH1_ZmianaLorenza,"Snaf zaproponowa� mi Togarda jako nowego cz�owieka do Kopalni. Pono� jest on ekspertem od minera��w i bardzo go one interesuj�. Musz� mu pokaza�, �e w Kopalni jest co� wartego jego uwagi. Togard ma chat� tu� przy po�udniowej bramie Starego Obozu. Do chaty prowadzi wyrwa w �cianie owej bramy. Mog� spr�bowa� oszuka� Togarda prosz�c Huno o pomoc, albo i�� do R�czki i spr�bowa� ukra�� raport z Kopalni od Lorenzo. Mo�e w Kopalni faktycznie jest co� ciekawego?"); 
};



//========================================
//-----------------> INFOS
//========================================

INSTANCE DIA_Snaf_INFOS (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 6;
   condition    = DIA_Snaf_INFOS_Condition;
   information  = DIA_Snaf_INFOS_Info;
   permanent	= FALSE;
   description	= "Gdzie mog� zdoby� jakie� informacje?";
};

FUNC INT DIA_Snaf_INFOS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_Hello))
    {
    return TRUE;
    };
	};

FUNC VOID DIA_Snaf_INFOS_Info()
{
    AI_Output (other, self ,"DIA_Snaf_INFOS_15_01"); //Gdzie mog� zdoby� jakie� informacje?
    AI_Output (self, other ,"DIA_Snaf_INFOS_03_02"); //Hmm... Je�li chcesz co� wiedzie� o znanych osobach w Obozie, to porozmawiaj z Gravo.
    AI_Output (self, other ,"DIA_Snaf_INFOS_03_03"); //Sporo wiedz� tak�e Scatty i R�czka, ale oni raczej nie pomagaj� Kopaczom. 
		Log_CreateTopic	(GE_InfosOC,	LOG_NOTE);
		B_LogEntry		(GE_InfosOC,	"Znanymi informatorami w Starym Obozie s�: Gravo, Snaf, R�czka i Scatty.");
};

	var int heroknow_sly;
	var int heroknow_fingers;
	var int heroknow_scatty;
	var int heroknow_fletcher;
	var int heroknow_other;
	var int heroknow_Emil;
	var int HeroKnow_Trip;
//========================================
//-----------------> SellInfos
//========================================

INSTANCE DIA_Snaf_SellInfos (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 888;
   condition    = DIA_Snaf_SellInfos_Condition;
   information  = DIA_Snaf_SellInfos_Info;
   permanent	= TRUE;
   description	= "Masz jakie� �wie�e informacje?";
};

FUNC INT DIA_Snaf_SellInfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_INFOS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_SellInfos_Info()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_15_01"); //Masz jakie� �wie�e informacje?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_03_02"); //Mam, ale nie za darmo...
    AI_Output (self, other ,"DIA_Snaf_SellInfos_03_03"); //Ka�da informacja kosztuje 10 bry�ek rudy. 


    Info_ClearChoices		(DIA_Snaf_SellInfos);
	
    Info_AddChoice		(DIA_Snaf_SellInfos, DIALOG_BACK, DIA_Snaf_SellInfos_BACK);
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_sly == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o Z�ym. ", DIA_Snaf_SellInfos_Sly);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_fingers == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o R�czce.", DIA_Snaf_SellInfos_Arms);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_scatty == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o Scatty'm. ", DIA_Snaf_SellInfos_ScattyN);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_fletcher == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o Fletcherze.", DIA_Snaf_SellInfos_Flet);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_other == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Masz co� ciekawego?", DIA_Snaf_SellInfos_Ciekawostki);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (Npc_KnowsInfo (hero, DIA_Corristo_MageCourier_Quest)) && (heroknow_Emil == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "S�ysza�e� co� mo�e o Cieniu imieniem Emil?", DIA_Snaf_SellInfos_Emil);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (MIS_DraxTest == LOG_RUNNING) && (heroknow_Trip == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Czy wiesz co� o Stra�niku, kt�ry prawie zdemaskowa� Bandyt�w?", DIA_Snaf_SellInfos_Trip);
	};
};

FUNC VOID DIA_Snaf_SellInfos_BACK()
{
    Info_ClearChoices		(DIA_Snaf_SellInfos);
};

FUNC VOID DIA_Snaf_SellInfos_Trip ()
{
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_01"); //Czy wiesz co� o Stra�niku, kt�ry prawie zdemaskowa� Bandyt�w?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Trip_03_02"); //Co� tam s�ysza�em. Go�� nazywa si� Trip. 
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_03"); //Wiesz gdzie go znajd�?
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Trip_03_04"); //Pije sobie piwo w karczmie pod zawalon� wie�� i zajada si� zupkami Samuela. Nie wiem czemu woli jego potrawy, skoro moje s� o wiele lepsze...
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_05"); //Tak, tak. Dzi�ki za informacje. 
	
	B_LogEntry                     (CH1_DraxTest,"Snaf zdradzi� mi imi� Stra�nika - to Trip. Znajd� go w karczmie pod zawalon� wie��.");
	Trip_wykryty = true; //globalna 
	heroknow_Trip = true;// Snafa
	B_GiveInvItems (other, self, ItMiNugget, 10);
	B_GiveXP (75);
};

FUNC VOID DIA_Snaf_SellInfos_Emil()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_01"); //S�ysza�e� co� mo�e o Cieniu imieniem Emil?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_02"); //Tak, by� tutaj taki go��. Ca�kiem niedawno przyj�to go w poczet Cieni.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_03"); //Podobno sam Corristo si� z nim spotka� i zleci� mu zaniesienie przesy�ki do Mag�w Wody.
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_04"); //Zgadza si�.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_05"); //Obawiam si�, �e nie sko�czy� zbyt dobrze. W Kolonii powinno si� trzyma� j�zyk za z�bami, je�eli mowa o dobrze p�atnych robotach. Komu� z pewno�ci� zale�a�o na tym li�cie.
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_06"); //Wiesz mo�e gdzie si� uda�?
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_07"); //Opu�ci� Ob�z przez po�udniow� bram�. By� mo�e uda� si� w stron� Ziem Ork�w. Najlepiej zapytaj Pacho, Stra�nika, kt�ry ma wyznaczony patrol w tamtej okolicy. 
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_08"); //W porz�dku. Dzi�ki za informacje.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_09"); //Dop�ki p�acisz, nie musisz mi dzi�kowa�.
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_Emil = true;
	B_LogEntry                     (CH2_CourierFireMage,"Rozmawia�em ze Snafem, ten gruby kucharzyna twierdzi, �e Emila m�g� p�j�� w stron� Terytorium Ork�w. Powinienem porozmawia� z Pacho, jednym ze Stra�nik�w, kt�ry patroluje tamt� okolic�.");
	B_GiveXP (100);
};

FUNC VOID DIA_Snaf_SellInfos_Sly()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Sly_15_01"); //Opowiedz mi o Z�ym. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Sly_03_02"); //Podobno Z�y wie co� o Neku. A co� o Z�ym wiedz� Kopacze z tamtej cz�ci Obozu. To dosy� popl�tane. 
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_sly = true;
};

FUNC VOID DIA_Snaf_SellInfos_Arms()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Arms_15_01"); //Opowiedz mi o R�czce.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Arms_03_02"); //Chyba zn�w wr�ci� do okradania ludzi. Widzia�em go w nocy, gdy opuszcza� Ob�z. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Arms_03_03"); //Mo�e ma jakie� interesy? Dok�adnie tego nie wiem. 
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_fingers = true;
};

FUNC VOID DIA_Snaf_SellInfos_ScattyN()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_01"); //Opowiedz mi o Scatty'm. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_02"); //O nim mam nieco wi�cej informacji.
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_03"); //Oby by�y warte swojej ceny.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_04"); //Mo�liwe, �e nie wiesz, ale Scatty zajmuje si� zaopatrzeniem obozu przy kopalni w bro�.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_05"); //Przygotowuje dostawy od Stone'a, Dok�adnie je przelicza, po czym wysy�a konw�j.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_06"); //Nie robi tego za darmo. Ob�z przed kopalni� p�aci nam rud�. Nie s� to jakie� olbrzymie ilo�ci, w ko�cu Stara Kopalnia nale�y do nas. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_07"); //Tak czy inaczej, wi�kszo�� rudy mo�e zatrzyma�.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_08"); //Z pewnych �r�de� wiem, �e raporty, kt�re wysy�a do Gomeza s� sfa�szowane. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_09"); //Tylko cz�� broni trafia do kopalni. Pozosta�a jest sprzedawana przez Scatty'ego do innych oboz�w.
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_10"); //Po co mia�by co� takiego robi�?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_11"); //Jeszcze nie rozumiesz? Inne obozy zap�ac� mu trzy razy tyle. To oznacza dla niego wi�kszy zysk. 
	HeroKnowsScattyThief = true;
	heroknow_scatty = true;
    B_GiveInvItems (other, self, ItMiNugget, 10);
};

FUNC VOID DIA_Snaf_SellInfos_Flet()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Flet_15_01"); //Opowiedz mi o Fletcherze.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Flet_03_02"); //Ludzie m�wi�, �e ma spore d�ugi u Scatty'ego. Brakuje mu rudy na sp�at�.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Flet_03_03"); //Podobno szuka kogo�, kto zajmie si� patrolami w jego rejonie.
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_fletcher = true;
};

FUNC VOID DIA_Snaf_SellInfos_Ciekawostki()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Ciekawostki_15_01"); //Masz co� ciekawego?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Ciekawostki_03_02"); //W karczmie w zawalonej wie�y siedzi Stra�nik, kt�ry nic nie robi. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Ciekawostki_03_03"); //Dziwi mnie, �e Thorus jeszcze go nie dorwa�. 
	if (Npc_KnowsInfo (hero,DIA_Trip_GoToWork))
	{
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Ciekawostki_15_04"); //Ju� o tym wiem. Stra�nik wr�ci� do pracy.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Ciekawostki_03_05"); //To chyba dobrze.
	};
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_other = true;
};


var int BackReturn;
//========================================
//-----------------> FindNek
//========================================

INSTANCE DIA_Snaf_FindNek (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 1;
   condition    = DIA_Snaf_FindNek_Condition;
   information  = DIA_Snaf_FindNek_Info;
   permanent	= false;
   description	= "Znalaz�em Neka.";
};

FUNC INT DIA_Snaf_FindNek_Condition()
{
    if (Sly_LostNek == LOG_SUCCESS)
    && (DIA_FindNekSnaf_OFF ==false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_FindNek_Info()
{
    AI_Output (other, self ,"DIA_Snaf_FindNek_15_01"); //Znalaz�em Neka.
    AI_Output (self, other ,"DIA_Snaf_FindNek_03_02"); //Tak? I gdzie by�?
    AI_Output (other, self ,"DIA_Snaf_FindNek_15_03"); //W jaskini za Obozem. Ros�o tam sporo grzyb�w.
    AI_Output (self, other ,"DIA_Snaf_FindNek_03_04"); //I co? Grzyby go zabi�y?

    Info_ClearChoices		(DIA_Snaf_FindNek);
    Info_AddChoice		(DIA_Snaf_FindNek, "W jaskini by�o te� kilka kretoszczur�w.", DIA_Snaf_FindNek_Molerats);
    if (HeroKnowsSlyKillNek = true)
{
    Info_AddChoice		(DIA_Snaf_FindNek, "Zabi� go Z�y.", DIA_Snaf_FindNek_Sly);
};
    Info_AddChoice		(DIA_Snaf_FindNek, DIALOG_BACK, DIA_Snaf_FindNek_BACK);
};
//jj
FUNC VOID DIA_Snaf_FindNek_Molerats()
{
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_01"); //W jaskini by�o te� kilka kretoszczur�w.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_02"); //Uwa�asz, �e Stra�nik da� si� zabi� kilku kretoszczurom? W�tpi�. Jak wygl�da� enat?
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_03"); //Mia� jasn� sk�r� i ciemne w�osy. Nosi� lekk� zbroj� Stra�nika.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_04"); //Nek te� nosi� lekk�, ale mia� jasne w�osy. Widzisz, jak ma�o jednak wiesz? To musia� by� kto� inny.
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_05"); //Ale mia� przy sobie amulet!
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_06"); //To tylko przedmiot. Jak wiesz, rzeczy przechodz� z r�k do r�k. S�dz�, �e sam Nek m�g� mu go da�.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_07"); //Zabi� kogo� i podrzuci� mu sw�j amulet, �eby upozorowa� w�asn� �mier� i zwia� do Nowego Obozu. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_08"); //Mo�e wsp�pracowali ze Z�ym? Przecie� to on kaza� mi szuka� amuletu.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_09"); //Nie mam poj�cia. Kr�cisz si� to tu to tam. Miej oczy szeroko otwarte a mo�e czego� si� dowiesz. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_10"); //Popytaj o Neka w Obozie. Fletcher mo�e mie� jakie� informacje. 
    MIS_WheresNek = LOG_RUNNING;
    
    Log_CreateTopic          (CH1_WheresNek, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WheresNek, LOG_RUNNING);
    B_LogEntry               (CH1_WheresNek,"Snaf uwa�a, �e trup z jaskini to nie Nek tylko kto� inny. Stra�nik chcia� upozorowa� swoj� �mier�, by m�c uciec do Nowego Obozu i nie by� �ciganym. By� mo�e Fletcher da mi jakie� wskaz�wki, gdzie szuka� Neka.");
	
	DIA_FindNekSnaf_OFF = false;
};

FUNC VOID DIA_Snaf_FindNek_Sly()
{
    AI_Output (other, self ,"DIA_Snaf_FindNek_Sly_15_01"); //Nie, my�l�, �e to by� Z�y. Mordrag i kilku Kopaczy by�o �wiadkiem zab�jstwa. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Sly_03_02"); //Po co Z�y mia�by zabija� Neka? To bez sensu. Opisz mi tego denata z jaskini. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_03"); //Mia� jasn� sk�r� i ciemne w�osy. Nosi� lekk� zbroj� Stra�nika.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_04"); //Nek te� nosi� lekk�, ale mia� jasne w�osy. Widzisz, jak ma�o jednak wiesz? To musia� by� kto� inny.
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_05"); //Ale mia� przy sobie amulet!
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_06"); //To tylko przedmiot. Jak wiesz, rzeczy przechodz� z r�k do r�k. S�dz�, �e sam Nek m�g� mu go da�.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_07"); //Zabi� kogo� i podrzuci� mu sw�j amulet, �eby upozorowa� w�asn� �mier� i zwia� do Nowego Obozu. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_08"); //Mo�e wsp�pracowali ze Z�ym? Przecie� to on kaza� mi szuka� amuletu.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_09"); //Nie mam poj�cia. Kr�cisz si� to tu to tam. Miej oczy szeroko otwarte, a mo�e czego� si� dowiesz. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_10"); //Popytaj o Neka w Obozie. Fletcher mo�e mie� jakie� informacje. 
    MIS_WheresNek = LOG_RUNNING;
    
    Log_CreateTopic          (CH1_WheresNek, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WheresNek, LOG_RUNNING);
    B_LogEntry               (CH1_WheresNek,"Snaf uwa�a, �e trup z jaskini to nie Nek tylko kto� inny. Stra�nik chcia� upozorowa� swoj� �mier�, by m�c uciec do Nowego Obozu i nie by� �ciganym. By� mo�e Fletcher da mi jakie� wskaz�wki, gdzie szuka� Neka.");
	
	DIA_FindNekSnaf_OFF = false; 
};

FUNC VOID DIA_Snaf_FindNek_BACK()
{
    Info_ClearChoices	(DIA_Snaf_FindNek);
};

//========================================
//-----------------> NEKZYJE
//========================================

INSTANCE DIA_Snaf_NEKZYJE (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 1;
   condition    = DIA_Snaf_NEKZYJE_Condition;
   information  = DIA_Snaf_NEKZYJE_Info;
   permanent	= FALSE;
   description	= "Znalaz�em Neka. Ponownie...";
};

FUNC INT DIA_Snaf_NEKZYJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Nek_Exposed))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_NEKZYJE_Info()
{
    AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_01"); //Znalaz�em Neka. Ponownie...
    AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_02"); //Mam nadziej�, �e tym razem zrobi�e� to porz�dnie. Gdzie by�? I czy wr�ci� do Obozu?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_03"); //Wr�ci� nie wr�ci�, bo...
   
    Info_ClearChoices	(DIA_Snaf_NEKZYJE);
	if HeroKillNek 
	{
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...go zabi�em.", DIA_Snaf_NEKZYJE_NOPE);
	};
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...przesiaduje w Nowym Obozie.", DIA_Snaf_NEKZYJE_NC);
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...pad� ofiar� wilk�w.", DIA_Snaf_NEKZYJE_WOLFS);  
};

func void DIA_Snaf_NEKZYJE_NOPE ()
{
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_04"); //...go zabi�em.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_05"); //Do�� radykalne podej�cie. Mo�e trzeba by�o da� mu drug� szans�?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_06"); //Fletcher powiedzia�, �e je�li go znajd� to ma zgin��.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_07"); //W sumie, gdyby wr�ci� do Obozu to Fletcher nie mia�by problem�w z d�ugami. No, ale inni Stra�nicy na pewno szybko dowiedzieli by si�, �e Nek jest dezerterem. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_08"); //Nie wiem co dla niego gorsze. Teraz to ju� nie ma znaczenia. Masz tu co� za fatyg�. Przynajmniej teraz wiem co si� sta�o.
	
	B_LogEntry               (CH1_WheresNek,"Powiedzia�em Snafowi o tym, �e zabi�em Neka. Odni�s� si� do tego faktu z nut� oboj�tno�ci. Mimo wszystko zap�aci� mi za jego odszukanie.");
    Log_SetTopicStatus       (CH1_WheresNek, LOG_SUCCESS);
    MIS_WheresNek = LOG_SUCCESS;

    B_GiveXP (200);
	CreateInvItems (self,itminugget,75);
	B_GiveInvItems (self,other,itminugget,75);
	Info_ClearChoices	(DIA_Snaf_NEKZYJE);
};

func void DIA_Snaf_NEKZYJE_NC ()
{
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_09"); //...przesiaduje w Nowym Obozie.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_10"); //Czyli tak jak si� spodziewa�em. Rozmawia�e� z nim? Czemu nie ma zamiaru wraca�?
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_11"); //Zreszt�, nie odpowiadaj. Przecie� to oczywiste, �e uciek� po to �eby by� jak najdalej od Starego Obozu. Powr�t tutaj by�by dla niego samob�jstwem. 
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_12"); //Fletcher chcia� �ebym go zabi�.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_13"); //Ale chyba tego nie zrobi�e�? 
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_14"); //Nie, wzi��em rud� w zamian za pozostawienie go w spokoju. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_15"); //To najrozs�dniejsza decyzja. Jak daj� to bierz, jak masz szans� zwia� to wiej, oszukuj kiedy tylko si� da, nie zgrywaj bohatera, a mo�e po�yjesz troch� d�u�ej w tym przekl�tym miejscu. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_16"); //A i nie radz� m�wi� o Neku Fletcherowi. Wiem, �e przesz�o ci to przez g�ow�, ale co za du�o to niezdrowo. Fletcher na pewno nie zap�aci ci za g�ow� Neka. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_17"); //Chyba wiesz, �e ten go�� popad� w niez�e d�ugi... Pr�ba bycia lojalnym wobec niego nic ci nie da. Ani s�awy, ani rudy. Fletcher nie jest nikim wa�nym. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_18"); //Odnalaz�e� Neka, wi�c nale�y ci si� jaka� nagroda za po�wi�cony czas.
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_19"); //Dzi�ki za rud� jak i za rady.
	
	B_LogEntry               (CH1_WheresNek,"Powiedzia�em Snafowi o tym, �e znalaz�em Neka w Nowym Obozie. Nie by� zdziwiony. Poprosi� mnie, aby nie m�wi� nic Fletcherowi. Mo�e ma racje i Nek faktycznie ma tam szans� na lepsze �ycie...");
    Log_SetTopicStatus       (CH1_WheresNek, LOG_SUCCESS);
    MIS_WheresNek = LOG_SUCCESS;

    B_GiveXP (255);
	CreateInvItems (self,itminugget,100);
	B_GiveInvItems (self,other,itminugget,100);
	Info_ClearChoices	(DIA_Snaf_NEKZYJE);
};

func void DIA_Snaf_NEKZYJE_WOLFS ()
{
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_20"); //...pad� ofiar� wilk�w.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_21"); //Jeste� pewien, �e to by� on?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_22"); //Tak, wilk�w by�o do�� sporo. W pojedynk� nie mia� najmniejszych szans.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_23"); //Szkoda, �e tak sko�czy�. Odnalaz�e� go, wi�c nale�y ci si� jaka� nagroda za po�wi�cony czas.
	
	B_LogEntry               (CH1_WheresNek,"Postanowi�em trzyma� j�zyk za z�bami i nie powiedzia�em prawdy o Neku Snafowi. Nek zap�aci� mi za swoj� wolno��, wi�c dotrzyma�em s�owa przy okazji dorabiaj�c sobie na boku.");
    Log_SetTopicStatus       (CH1_WheresNek, LOG_SUCCESS);
    MIS_WheresNek = LOG_SUCCESS;

    B_GiveXP (255);
	CreateInvItems (self,itminugget,100);
	B_GiveInvItems (self,other,itminugget,100);
	Info_ClearChoices	(DIA_Snaf_NEKZYJE);
};

//========================================
//-----------------> IanQuest
//========================================

INSTANCE DIA_Snaf_IanQuest (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 1;
   condition    = DIA_Snaf_IanQuest_Condition;
   information  = DIA_Snaf_IanQuest_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Ian.";
};

FUNC INT DIA_Snaf_IanQuest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_IAN_NextToAwansCienQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_IanQuest_Info()
{
    AI_Output (other, self ,"DIA_Snaf_IanQuest_15_01"); //Przysy�a mnie Ian.
    AI_Output (other, self ,"DIA_Snaf_IanQuest_03_02"); //Podobno dostawy �ywno�ci, kt�re wysy�asz s� niezgodne z zam�wieniami.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_03"); //�e co? To niemo�liwe! 
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_04"); //Zaraz spojrz� na swoj� list� i por�wnam j� z zam�wieniami.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_05"); //Przy ka�dej dostawi� sporz�dzam dok�adn� list�.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_06"); //Tak, wszystko si� zgadza.
    AI_Output (other, self ,"DIA_Snaf_IanQuest_03_07"); //W takim razie dlaczego do kopalni s� dostarczane mniejsze racje?
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_08"); //Nie mam poj�cia. Konwoje s� dostarczane do obozu przed kopalni�.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_09"); //Tam s� rozdzielane racje �ywno�ciowe.
    B_LogEntry                     (CH1_FoodForOldMine,"Snaf zdradzi� mi, �e konwoje s� dostarczane do obozu przed kopalni�. Powinienem si� tam rozejrze�.");

    B_GiveXP (50);
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_Snaf_FakeRumor (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_FakeRumor_Condition;
	information	= DIA_Snaf_FakeRumor_Info;
	permanent	= 0;
	description = "Witaj, s�ysza�e� ostanie wie�ci o Baalu Parvezie?";
};                       

FUNC int DIA_Snaf_FakeRumor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_WhatsTroubles))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_FakeRumor_Info()
{
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_00"); //Witaj, s�ysza�e� ostanie wie�ci o Baalu Parvezie?
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_01"); //Wiem, �e kto� usilnie stara si� go st�d wykurzy�.
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_02"); //Zgadza si�, jednak chodzi mi o cenne artefakty, kt�re pono� przys�ano mu z Bractwa. M�g�by� przekaza� te informacje mieszka�com Obozu.
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_03"); //Pewnie szukasz jakiego� wsp�lnika do obrobienia skrzyni, co? Sprytnie. Za 50 bry�ek rudy pogadam z paroma lud�mi i powiem im, �eby zg�osili si� do ciebie. 
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_04"); //Ale niczego nie gwarantuj�. Kto� mo�e spr�bowa� okra�� Parveza na w�asn� r�k�.
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_05"); //Jestem got�w zaryzykowa�.
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_06"); //A wi�c tak jak m�wi�em, 50 bry�ek rudy.
	
	B_LogEntry(CH1_ParvezInTroubles, "Snaf rozpu�ci informacje o kufrze z artefaktami za 50 bry�ek rudy. Cena do�� sensowna jak na jego standardy.");
};

instance DIA_Snaf_FakeRumorGiveOre (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_FakeRumorGiveOre_Condition;
	information	= DIA_Snaf_FakeRumorGiveOre_Info;
	permanent	= 0;
	description = "Mam rud�. (daj 50 bry�ek rudy)";
};                       

FUNC int DIA_Snaf_FakeRumorGiveOre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Snaf_FakeRumor) && (Npc_HasItems(other, ItMiNugget) >= 50))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_FakeRumorGiveOre_Info()
{
	AI_Output(other, self, "DIA_Snaf_FakeRumorGiveOre_15_00"); //Mam rud�. Trzymaj.

	B_GiveInvItems(other, self, ItMiNugget, 50);
	Npc_RemoveInvItems(self, ItMiNugget, 50);
	
	AI_Output(self, other, "DIA_Snaf_FakeRumorGiveOre_03_01"); //Dzi�ki. A tak przy okazji nie masz ochoty na m�j najnowszy przepis kulinarny? Gotowany chrz�szcz z jagodami!
	AI_Output(other, self, "DIA_Snaf_FakeRumorGiveOre_15_02"); //Chyba kto� mnie wo�a�... Do zobaczenia...
		
	B_LogEntry(CH1_ParvezInTroubles, "Snaf zosta� op�acony. Dw�ch informator�w do rozpuszczenia plotki powinno wystarczy�.");
};

//========================================
//-----------------> Margunios
//========================================

INSTANCE DIA_Snaf_Margunios (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 1;
   condition    = DIA_Snaf_Margunios_Condition;
   information  = DIA_Snaf_Margunios_Info;
   permanent	= FALSE;
   description	= "Znasz kogo�, kto ma poj�cie o produkcji wina?";
};

FUNC INT DIA_Snaf_Margunios_Condition()
{
    if (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_Margunios_Info()
{
    AI_Output (other, self ,"DIA_Snaf_Margunios_15_01"); //Znasz kogo�, kto ma poj�cie o produkcji wina?
    AI_Output (self, other ,"DIA_Snaf_Margunios_03_02"); //Tak, znam jednego takiego. Nazywa si� Dion.
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_03"); //Nie wiesz gdzie go znajd�?
	AI_Output (self, other ,"DIA_Snaf_Margunios_03_04"); //W Cape Dun.
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_05"); //Jak niby mam si� tam dosta�?
	AI_Output (self, other ,"DIA_Snaf_Margunios_03_06"); //A bo ja wiem?
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_07"); //Niewa�ne.
	
	B_LogEntry			(CH1_GhoransVine, "Snaf niezbyt mi pom�g� w poszukiwaniach winiarza. Musz� pr�bowa� dalej.");
};

//========================================
// Zadanie "Sakiewka Snafa"
//========================================

instance DIA_Snaf_Bag (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_Bag_Condition;
	information	= DIA_Snaf_Bag_Info;
	permanent	= 0;
	description = "Wygl�dasz na strapionego.";
};                       

FUNC int DIA_Snaf_Bag_Condition()
{
	if (C_IsChapter(4))
	{
		return 1;
	};
};

func void DIA_Snaf_Bag_Info()
{
	AI_Output(other, self, "DIA_Snaf_Bag_15_00"); //Hej, Snaf, wygl�dasz na strapionego.
	AI_Output(self, other, "DIA_Snaf_Bag_03_01"); //Tak w�a�nie wygl�da cz�owiek, kt�ry nie do��, �e musia� ucieka�, to jeszcze czuje si� l�ejszy o par� �adnych bry�ek rudy.
	AI_Output(other, self, "DIA_Snaf_Bag_15_02"); //To rzeczywi�cie kiepsko.
	AI_Output(self, other, "DIA_Snaf_Bag_03_03"); //A jak! Wszystko przez te przyprawy, co to je mia� za�atwi� Baal Taran. Niby mia�em wyj�� na swoje, bo cena by�a korzystna, a tu taka strata.
	AI_Output(self, other, "DIA_Snaf_Bag_03_04"); //Niech mnie Beliar, je�eli Taran nie sko�owa� ich od jakich� przemytnik�w.
	AI_Output(self, other, "DIA_Snaf_Bag_03_05"); //Zreszt� niewa�ne... Da�em mu spor� zaliczk�, a on mia� w najbli�szym czasie przynie�� mi sakiewk� z po�udniowymi przyprawami.
	AI_Output(self, other, "DIA_Snaf_Bag_03_06"); //Potem wydarzenia potoczy�y si� ju� szybko. Najpierw oskar�ono mnie o otrucie, potem zawalenie si� Kopalni, wymordowanie Mag�w Ognia i rze� wszystkich, kt�rych nie uznawa�o si� za swoich.
	AI_Output(self, other, "DIA_Snaf_Bag_03_07"); //Sam ledwo si� wyrwa�em z tego piek�a. W�tpi� by Taran mia� tyle szcz�cia. My�l� jednak, �e zd��y� sprowadzi� te przyprawy.
};

instance DIA_Snaf_OfferGetBackBag (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_OfferGetBackBag_Condition;
	information	= DIA_Snaf_OfferGetBackBag_Info;
	permanent	= 0;
	description = "M�g�bym spr�bowa� odzyska� tw�j towar.";
};                       

FUNC int DIA_Snaf_OfferGetBackBag_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Snaf_Bag))
	{
		return 1;
	};
};

func void DIA_Snaf_OfferGetBackBag_Info()
{
	AI_Output(other, self, "DIA_Snaf_OfferGetBackBag_15_00"); //M�g�bym spr�bowa� odzyska� te przyprawy, ale...
	AI_Output(self, other, "DIA_Snaf_OfferGetBackBag_03_01"); //Tak, zap�ac� za nie pe�n� kwot�. Sto pi��dziesi�t... 
	AI_Output(other, self, "DIA_Snaf_OfferGetBackBag_15_02"); //Ekhem...
	AI_Output(self, other, "DIA_Snaf_OfferGetBackBag_03_03"); //Dobra, dwie�cie bry�ek rudy! Niech dwa razy zap�ac� t� cholern� zaliczk�.
	
	MIS_SnafBag = LOG_RUNNING;

	Log_CreateTopic		(CH4_SnafBag, LOG_MISSION);
	Log_SetTopicStatus	(CH4_SnafBag, LOG_RUNNING);
	B_LogEntry					(CH4_SnafBag, "Snaf pragnie abym odzyska� woreczek z przyprawami, kt�re przed masakr� w Starym Obozie mia� sprowadzi� dla niego Taran. Kucharz w�tpi, �e jego dostawca jeszcze �yje. B�d� musia� poszuka� jego cia�a. ");
	
};

instance DIA_Snaf_GetBackBag (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_GetBackBag_Condition;
	information	= DIA_Snaf_GetBackBag_Info;
	permanent	= 0;
	description = "Mam twoje przyprawy.";
};                       

FUNC int DIA_Snaf_GetBackBag_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Snaf_OfferGetBackBag) && Npc_HasItems(other, ItMi_SnafBag))
	{
		return 1;
	};
};

func void DIA_Snaf_GetBackBag_Info()
{
	AI_Output(other, self, "DIA_Snaf_GetBackBag_15_00"); //Mam twoje przyprawy. Nast�pnym razem sam b�dziesz szed� do tego gniazda szerszeni.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_01"); //C�, je�li akurat b�dzie mi po drodze... Jestem przecie� kucharzem, nie jakim� strace�cem.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_02"); //Jak si� umawiali�my, sto pi��dziesi�t bry�ek rudy.
	AI_Output(other, self, "DIA_Snaf_GetBackBag_15_03"); //Dwie�cie.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_04"); //Ty przechero, ale racja, dwie�cie.
	
	CreateInvItems(self, ItMiNugget, 200);
	B_GiveInvItems(self, other, ItMiNugget, 200);
	
	B_GiveInvItems(other, self, ItMi_SnafBag, 1);
	B_GiveXP (200);
	
	MIS_SnafBag = LOG_SUCCESS;

	Log_SetTopicStatus(CH4_SnafBag, LOG_SUCCESS);
	B_LogEntry(CH4_SnafBag, "Odda�em Snafowi znalezion� sakiewk� z przyprawami. Stary kucharz chcia� si� targowa�, ale nie da�em si� oszuka�!");
};

//========================================
//-----------------> Kapitel4_Dialog
//========================================

INSTANCE DIA_Snaf_Kapitel4_Dialog (C_INFO)
{
   npc          = Vlk_581_Snaf;
   nr           = 1;
   condition    = DIA_Snaf_Kapitel4_Dialog_Condition;
   information  = DIA_Snaf_Kapitel4_Dialog_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Snaf_Kapitel4_Dialog_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snaf_Kapitel4_Dialog_Info()
{
    AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_02"); //Przygotowuj� potrawk� z chrz�szcza. Chcesz troch�?
    AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_03_03"); //Dlaczego nie pe�nisz ju� roli kucharza w Zewn�trznym Pier�cieniu?
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_04"); //Przez pewien incydent, kt�ry mia� miejsce kilka dni temu.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_05"); //Gotowa�em m�j s�ynny gulasz z j�der kretoszczura, kiedy nagle do mojej chaty wpad� Herek.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_06"); //To jeden z najgro�niejszych Kopaczy mieszkaj�cych w Starym Obozie.
    if (Npc_KnowsInfo (hero, DIA_Herek_Bully))
    {
        AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_07"); //Tak, mia�em przyjemno�� go pozna�.
        AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_15_08"); //Wi�c wiesz, co to za sukinsyn. 
    };
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_09"); //W ka�dym razie Herek oskar�y� mnie, �e chcia�em go otru�. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_10"); //Wraz z kilkoma ch�opakami skopa� mnie i na drugi dzie� rozgada� w ca�ym Obozie, �e moje potrawki to trucizna.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_11"); //Straci�em zaufanie. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_12"); //Postanowi�em uciec. Na moje szcz�cie dowiedzia�em si�, �e Kruk postanowi� opu�ci� Ob�z i bierze ze sob� zaufanych ludzi.
    AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_13"); //Jedno pytanie: czy rzeczywi�cie chcia�e� otru� Hereka?
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_14"); //Nie, po prostu dzie� wcze�niej mia�a miejsce pewna sytuacja. M�j s�siad, Wrz�d przechodz�c potkn�� si� i wpad� do mojego garnka.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_15"); //Od razu go wy�owi�em, ale zdaje si�, �e ta brudna kanalia mia�a jakie� wszy, kt�re przedosta�y si� do zupy. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_16"); //Nie mia�em jednak o tym wcze�niej poj�cia.
   // AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_17"); //To ci dopiero historia. 
};

