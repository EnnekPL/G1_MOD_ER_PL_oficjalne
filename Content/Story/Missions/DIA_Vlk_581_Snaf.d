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
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nie najgorzej! Cz³owiek, który umie dobrze gotowaæ, ma tutaj wielu przyjació³!
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Chcesz mo¿e trochê mojej ry¿owej zupy?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Dziêki.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Móg³byœ coœ dla mnie zrobiæ...
	
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
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Za³o¿ê siê, ¿e lubisz sobie dobrze podjeœæ. Opracowa³em w³aœnie nowy przepis: potrawka z chrz¹szcza a la Snaf z ry¿em i grzybami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Dostaniesz ile tylko zechcesz, ale potrzebujê jeszcze 3 chrz¹szczy i parê piekielników - 5 powinno wystarczyæ.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Chcesz ¿ebym siê porzyga³?"	,DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Brzmi nieŸle."			,DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chcesz, ¿ebym siê porzyga³?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nie musisz tego jeœæ, ale powinieneœ przynajmniej spróbowaæ! Zreszt¹, zawsze mo¿esz to komuœ odsprzedaæ!
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Wys³a³em ju¿ kogoœ po sk³adniki, ale œlad po nim zagin¹³. Pewnie uciek³ do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj¹cy w Zewnêtrznym Pierœcieniu, wys³a³ mnie po 3 chrz¹szcze i 5 grzybów zwanych piekielnikami, których potrzebuje do swojego nowego przepisu.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Brzmi nieŸle.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Zatem idŸ, i przynieœ mi potrzebne sk³adniki.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poprzedni cz³owiek, którego wys³a³em nie wróci³. Zapewne uciek³ do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Snaf, kucharz mieszkaj¹cy w Zewnêtrznym Pierœcieniu, wys³a³ mnie po 3 chrz¹szcze i 5 grzybów zwanych piekielnikami, których potrzebuje do swojego nowego przepisu. W nagrodê mogê liczyæ na darmowe porcje.");		
			
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
	description		= "Mam przy sobie rzeczy, o które prosi³eœ!";
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
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mam przy sobie rzeczy, o które prosi³eœ!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Œwietnie! Teraz muszê je tylko wrzuciæ i za chwilê potrawka bêdzie gotowa. Zaczekaj...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe, "Snaf ucieszy³ siê, gdy da³em mu sk³adniki, których szuka³.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe, "Od tej pory bêdzie mi codziennie dawa³ darmow¹ porcjê swojej nowej potrawy.");
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
	description		= "Powiedzia³eœ, ¿e mogê dostaæ tyle potrawki ile tylko zapragnê...";
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
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Powiedzia³eœ, ¿e mogê dostaæ tyle potrawki ile tylko zapragnê...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //I dotrzymam s³owa. Proszê, weŸ te 3 porcje.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jasne! Ale nic mi ju¿ dzisiaj nie zosta³o. Wróæ jutro!
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
	description		= "Gdzie mogê znaleŸæ te chrz¹szcze?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Gdzie mogê znaleŸæ te chrz¹szcze?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Wszêdzie, gdzie walaj¹ siê jakieœ odpady. Poszukaj w opuszczonych chatach przy zamkowych murach.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Tylko niech ciê nie odstraszy ich paskudny wygl¹d. Po ugotowaniu s¹ ca³kiem smaczne.
	
    B_LogEntry( CH1_SnafsRecipe, "Chrz¹szcze znajdê w opuszczonych chatach, przy zamkowych murach.");			
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
	description		= "Gdzie znajdê te piekielniki?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Gdzie znajdê te piekielniki?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //WyjdŸ z Obozu przez po³udniow¹ bramê, to ta pod zawalon¹ wie¿¹. Znajdziesz siê na ³¹ce, na której rosn¹ grzyby.
	
	B_LogEntry( CH1_SnafsRecipe, "Piekielniki rosn¹ na ³¹ce, przy zawalonej wie¿y po³udniowej bramy.");			
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
	description		= "Kim by³ cz³owiek, którego wys³a³eœ na poszukiwania przede mn¹?";
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
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kim by³ cz³owiek, którego wys³a³eœ na poszukiwania przede mn¹?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Nazywa³ siê Nek. Chyba nie czu³ siê tu zbyt dobrze. Podejrzewam, ¿e uciek³ do Nowego Obozu.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Wys³a³em go po grzyby, ale nigdy nie wróci³...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,	"Snaf wys³a³ Neka na poszukiwanie grzybów.");
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
    AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_01"); //Szukam ludzi do pracy w Kopalni. Lorenzo kaza³ mi zorganizowaæ zmianê. Mo¿esz mi doradziæ kto móg³by pójœæ?
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_02"); //Do pracy w Kopalni mówisz? Hmm... Ciê¿ko bêdzie ci znaleŸæ kogoœ, kto pójdzie tam po dobroci, jednak nasuwa mi siê pewna myœl.
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_03"); //Niejaki Togard to Kopacz, który za Barier¹ by³ ekspertem od przeró¿nych minera³ów. Bada³ miêdzy innymi próbki czarnej rudy.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_04"); //Myœlê, ¿e gdybyœ mu wspomnia³, ¿e w Starej Kopalni znaleziono coœ dziwacznego z pewnoœci¹ chcia³by siê tam jak najszybciej udaæ.
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_05"); //A w tej Kopalni s¹ w ogóle jakieœ specjalne minera³y poza magiczn¹ rud¹? Czy mam go po prostu ok³amaæ? Skoro jest ekspertem to nie bêdzie to ³atwe.
    AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_06"); //Pos³uchaj, mo¿e i coœ tam maj¹, a mo¿e i nie maj¹. Co miesi¹c do Starego Obozu przekazywane s¹ raporty z Kopalni. 
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_07"); //Wstêpnie przegl¹da je Lorenzo. Potem trafiaj¹ do Bartholo i Gomeza. Jeœli znaleziono coœ w Kopalni, raport z pewnoœci¹ to zawiera.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_08"); //Móg³byœ zaryzykowaæ i wykraœæ ten raport z chaty Lorenzo ¿eby samemu siê przekonaæ. O z³odziejstwie to najlepiej pogadaæ z R¹czk¹.
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_09"); //To doœæ ryzykowne, a i ma³o pewne przy okazji. Mo¿e jakaœ alternatywna œcie¿ka?
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_10"); //IdŸ do Huno i poproœ go o pomoc. Za niewielk¹ op³at¹ mo¿e doda jakiegoœ gówna do odlewu, które zmieni odcieñ rudy na inny. Stary Togard powinien siê nabraæ.
	AI_Output (self, other ,"DIA_Snaf_LookingForWorkers_03_11"); //Togard pewnie krêci siê gdzieœ nieopodal swojej chaty. Idziesz po prostu do Po³udniowej Bramy i przechodzisz przez tê wyrwê co to jest w bramie po lewej stronie. 
	AI_Output (other, self ,"DIA_Snaf_LookingForWorkers_15_12"); //Dziêki za pomoc.
	
	B_LogEntry               (CH1_ZmianaLorenza,"Snaf zaproponowa³ mi Togarda jako nowego cz³owieka do Kopalni. Ponoæ jest on ekspertem od minera³ów i bardzo go one interesuj¹. Muszê mu pokazaæ, ¿e w Kopalni jest coœ wartego jego uwagi. Togard ma chatê tu¿ przy po³udniowej bramie Starego Obozu. Do chaty prowadzi wyrwa w œcianie owej bramy. Mogê spróbowaæ oszukaæ Togarda prosz¹c Huno o pomoc, albo iœæ do R¹czki i spróbowaæ ukraœæ raport z Kopalni od Lorenzo. Mo¿e w Kopalni faktycznie jest coœ ciekawego?"); 
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
   description	= "Gdzie mogê zdobyæ jakieœ informacje?";
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
    AI_Output (other, self ,"DIA_Snaf_INFOS_15_01"); //Gdzie mogê zdobyæ jakieœ informacje?
    AI_Output (self, other ,"DIA_Snaf_INFOS_03_02"); //Hmm... Jeœli chcesz coœ wiedzieæ o znanych osobach w Obozie, to porozmawiaj z Gravo.
    AI_Output (self, other ,"DIA_Snaf_INFOS_03_03"); //Sporo wiedz¹ tak¿e Scatty i R¹czka, ale oni raczej nie pomagaj¹ Kopaczom. 
		Log_CreateTopic	(GE_InfosOC,	LOG_NOTE);
		B_LogEntry		(GE_InfosOC,	"Znanymi informatorami w Starym Obozie s¹: Gravo, Snaf, R¹czka i Scatty.");
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
   description	= "Masz jakieœ œwie¿e informacje?";
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
    AI_Output (other, self ,"DIA_Snaf_SellInfos_15_01"); //Masz jakieœ œwie¿e informacje?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_03_02"); //Mam, ale nie za darmo...
    AI_Output (self, other ,"DIA_Snaf_SellInfos_03_03"); //Ka¿da informacja kosztuje 10 bry³ek rudy. 


    Info_ClearChoices		(DIA_Snaf_SellInfos);
	
    Info_AddChoice		(DIA_Snaf_SellInfos, DIALOG_BACK, DIA_Snaf_SellInfos_BACK);
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_sly == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o Z³ym. ", DIA_Snaf_SellInfos_Sly);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (heroknow_fingers == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Opowiedz mi o R¹czce.", DIA_Snaf_SellInfos_Arms);
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
    Info_AddChoice		(DIA_Snaf_SellInfos, "Masz coœ ciekawego?", DIA_Snaf_SellInfos_Ciekawostki);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (Npc_KnowsInfo (hero, DIA_Corristo_MageCourier_Quest)) && (heroknow_Emil == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "S³ysza³eœ coœ mo¿e o Cieniu imieniem Emil?", DIA_Snaf_SellInfos_Emil);
	};
	if (Npc_HasItems (hero, ItMiNugget)>=10) && (MIS_DraxTest == LOG_RUNNING) && (heroknow_Trip == false)
	{
    Info_AddChoice		(DIA_Snaf_SellInfos, "Czy wiesz coœ o Stra¿niku, który prawie zdemaskowa³ Bandytów?", DIA_Snaf_SellInfos_Trip);
	};
};

FUNC VOID DIA_Snaf_SellInfos_BACK()
{
    Info_ClearChoices		(DIA_Snaf_SellInfos);
};

FUNC VOID DIA_Snaf_SellInfos_Trip ()
{
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_01"); //Czy wiesz coœ o Stra¿niku, który prawie zdemaskowa³ Bandytów?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Trip_03_02"); //Coœ tam s³ysza³em. Goœæ nazywa siê Trip. 
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_03"); //Wiesz gdzie go znajdê?
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Trip_03_04"); //Pije sobie piwo w karczmie pod zawalon¹ wie¿¹ i zajada siê zupkami Samuela. Nie wiem czemu woli jego potrawy, skoro moje s¹ o wiele lepsze...
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Trip_15_05"); //Tak, tak. Dziêki za informacje. 
	
	B_LogEntry                     (CH1_DraxTest,"Snaf zdradzi³ mi imiê Stra¿nika - to Trip. Znajdê go w karczmie pod zawalon¹ wie¿¹.");
	Trip_wykryty = true; //globalna 
	heroknow_Trip = true;// Snafa
	B_GiveInvItems (other, self, ItMiNugget, 10);
	B_GiveXP (75);
};

FUNC VOID DIA_Snaf_SellInfos_Emil()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_01"); //S³ysza³eœ coœ mo¿e o Cieniu imieniem Emil?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_02"); //Tak, by³ tutaj taki goœæ. Ca³kiem niedawno przyjêto go w poczet Cieni.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_03"); //Podobno sam Corristo siê z nim spotka³ i zleci³ mu zaniesienie przesy³ki do Magów Wody.
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_04"); //Zgadza siê.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_05"); //Obawiam siê, ¿e nie skoñczy³ zbyt dobrze. W Kolonii powinno siê trzymaæ jêzyk za zêbami, je¿eli mowa o dobrze p³atnych robotach. Komuœ z pewnoœci¹ zale¿a³o na tym liœcie.
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_06"); //Wiesz mo¿e gdzie siê uda³?
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_07"); //Opuœci³ Obóz przez po³udniow¹ bramê. Byæ mo¿e uda³ siê w stronê Ziem Orków. Najlepiej zapytaj Pacho, Stra¿nika, który ma wyznaczony patrol w tamtej okolicy. 
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Emil_15_08"); //W porz¹dku. Dziêki za informacje.
	AI_Output (self, other ,"DIA_Snaf_SellInfos_Emil_03_09"); //Dopóki p³acisz, nie musisz mi dziêkowaæ.
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_Emil = true;
	B_LogEntry                     (CH2_CourierFireMage,"Rozmawia³em ze Snafem, ten gruby kucharzyna twierdzi, ¿e Emila móg³ pójœæ w stronê Terytorium Orków. Powinienem porozmawiaæ z Pacho, jednym ze Stra¿ników, który patroluje tamt¹ okolicê.");
	B_GiveXP (100);
};

FUNC VOID DIA_Snaf_SellInfos_Sly()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Sly_15_01"); //Opowiedz mi o Z³ym. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Sly_03_02"); //Podobno Z³y wie coœ o Neku. A coœ o Z³ym wiedz¹ Kopacze z tamtej czêœci Obozu. To dosyæ popl¹tane. 
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_sly = true;
};

FUNC VOID DIA_Snaf_SellInfos_Arms()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Arms_15_01"); //Opowiedz mi o R¹czce.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Arms_03_02"); //Chyba znów wróci³ do okradania ludzi. Widzia³em go w nocy, gdy opuszcza³ Obóz. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Arms_03_03"); //Mo¿e ma jakieœ interesy? Dok³adnie tego nie wiem. 
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_fingers = true;
};

FUNC VOID DIA_Snaf_SellInfos_ScattyN()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_01"); //Opowiedz mi o Scatty'm. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_02"); //O nim mam nieco wiêcej informacji.
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_03"); //Oby by³y warte swojej ceny.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_04"); //Mo¿liwe, ¿e nie wiesz, ale Scatty zajmuje siê zaopatrzeniem obozu przy kopalni w broñ.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_05"); //Przygotowuje dostawy od Stone'a, Dok³adnie je przelicza, po czym wysy³a konwój.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_06"); //Nie robi tego za darmo. Obóz przed kopalni¹ p³aci nam rud¹. Nie s¹ to jakieœ olbrzymie iloœci, w koñcu Stara Kopalnia nale¿y do nas. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_07"); //Tak czy inaczej, wiêkszoœæ rudy mo¿e zatrzymaæ.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_08"); //Z pewnych Ÿróde³ wiem, ¿e raporty, które wysy³a do Gomeza s¹ sfa³szowane. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_09"); //Tylko czêœæ broni trafia do kopalni. Pozosta³a jest sprzedawana przez Scatty'ego do innych obozów.
    AI_Output (other, self ,"DIA_Snaf_SellInfos_ScattyN_15_10"); //Po co mia³by coœ takiego robiæ?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_ScattyN_03_11"); //Jeszcze nie rozumiesz? Inne obozy zap³ac¹ mu trzy razy tyle. To oznacza dla niego wiêkszy zysk. 
	HeroKnowsScattyThief = true;
	heroknow_scatty = true;
    B_GiveInvItems (other, self, ItMiNugget, 10);
};

FUNC VOID DIA_Snaf_SellInfos_Flet()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Flet_15_01"); //Opowiedz mi o Fletcherze.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Flet_03_02"); //Ludzie mówi¹, ¿e ma spore d³ugi u Scatty'ego. Brakuje mu rudy na sp³atê.
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Flet_03_03"); //Podobno szuka kogoœ, kto zajmie siê patrolami w jego rejonie.
	B_GiveInvItems (other, self, ItMiNugget, 10);
	heroknow_fletcher = true;
};

FUNC VOID DIA_Snaf_SellInfos_Ciekawostki()
{
    AI_Output (other, self ,"DIA_Snaf_SellInfos_Ciekawostki_15_01"); //Masz coœ ciekawego?
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Ciekawostki_03_02"); //W karczmie w zawalonej wie¿y siedzi Stra¿nik, który nic nie robi. 
    AI_Output (self, other ,"DIA_Snaf_SellInfos_Ciekawostki_03_03"); //Dziwi mnie, ¿e Thorus jeszcze go nie dorwa³. 
	if (Npc_KnowsInfo (hero,DIA_Trip_GoToWork))
	{
	AI_Output (other, self ,"DIA_Snaf_SellInfos_Ciekawostki_15_04"); //Ju¿ o tym wiem. Stra¿nik wróci³ do pracy.
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
   description	= "Znalaz³em Neka.";
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
    AI_Output (other, self ,"DIA_Snaf_FindNek_15_01"); //Znalaz³em Neka.
    AI_Output (self, other ,"DIA_Snaf_FindNek_03_02"); //Tak? I gdzie by³?
    AI_Output (other, self ,"DIA_Snaf_FindNek_15_03"); //W jaskini za Obozem. Ros³o tam sporo grzybów.
    AI_Output (self, other ,"DIA_Snaf_FindNek_03_04"); //I co? Grzyby go zabi³y?

    Info_ClearChoices		(DIA_Snaf_FindNek);
    Info_AddChoice		(DIA_Snaf_FindNek, "W jaskini by³o te¿ kilka kretoszczurów.", DIA_Snaf_FindNek_Molerats);
    if (HeroKnowsSlyKillNek = true)
{
    Info_AddChoice		(DIA_Snaf_FindNek, "Zabi³ go Z³y.", DIA_Snaf_FindNek_Sly);
};
    Info_AddChoice		(DIA_Snaf_FindNek, DIALOG_BACK, DIA_Snaf_FindNek_BACK);
};
//jj
FUNC VOID DIA_Snaf_FindNek_Molerats()
{
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_01"); //W jaskini by³o te¿ kilka kretoszczurów.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_02"); //Uwa¿asz, ¿e Stra¿nik da³ siê zabiæ kilku kretoszczurom? W¹tpiê. Jak wygl¹da³ enat?
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_03"); //Mia³ jasn¹ skórê i ciemne w³osy. Nosi³ lekk¹ zbrojê Stra¿nika.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_04"); //Nek te¿ nosi³ lekk¹, ale mia³ jasne w³osy. Widzisz, jak ma³o jednak wiesz? To musia³ byæ ktoœ inny.
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_05"); //Ale mia³ przy sobie amulet!
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_06"); //To tylko przedmiot. Jak wiesz, rzeczy przechodz¹ z r¹k do r¹k. S¹dzê, ¿e sam Nek móg³ mu go daæ.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_07"); //Zabi³ kogoœ i podrzuci³ mu swój amulet, ¿eby upozorowaæ w³asn¹ œmieræ i zwiaæ do Nowego Obozu. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_08"); //Mo¿e wspó³pracowali ze Z³ym? Przecie¿ to on kaza³ mi szukaæ amuletu.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_09"); //Nie mam pojêcia. Krêcisz siê to tu to tam. Miej oczy szeroko otwarte a mo¿e czegoœ siê dowiesz. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_10"); //Popytaj o Neka w Obozie. Fletcher mo¿e mieæ jakieœ informacje. 
    MIS_WheresNek = LOG_RUNNING;
    
    Log_CreateTopic          (CH1_WheresNek, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WheresNek, LOG_RUNNING);
    B_LogEntry               (CH1_WheresNek,"Snaf uwa¿a, ¿e trup z jaskini to nie Nek tylko ktoœ inny. Stra¿nik chcia³ upozorowaæ swoj¹ œmieræ, by móc uciec do Nowego Obozu i nie byæ œciganym. Byæ mo¿e Fletcher da mi jakieœ wskazówki, gdzie szukaæ Neka.");
	
	DIA_FindNekSnaf_OFF = false;
};

FUNC VOID DIA_Snaf_FindNek_Sly()
{
    AI_Output (other, self ,"DIA_Snaf_FindNek_Sly_15_01"); //Nie, myœlê, ¿e to by³ Z³y. Mordrag i kilku Kopaczy by³o œwiadkiem zabójstwa. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Sly_03_02"); //Po co Z³y mia³by zabijaæ Neka? To bez sensu. Opisz mi tego denata z jaskini. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_03"); //Mia³ jasn¹ skórê i ciemne w³osy. Nosi³ lekk¹ zbrojê Stra¿nika.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_04"); //Nek te¿ nosi³ lekk¹, ale mia³ jasne w³osy. Widzisz, jak ma³o jednak wiesz? To musia³ byæ ktoœ inny.
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_05"); //Ale mia³ przy sobie amulet!
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_06"); //To tylko przedmiot. Jak wiesz, rzeczy przechodz¹ z r¹k do r¹k. S¹dzê, ¿e sam Nek móg³ mu go daæ.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_07"); //Zabi³ kogoœ i podrzuci³ mu swój amulet, ¿eby upozorowaæ w³asn¹ œmieræ i zwiaæ do Nowego Obozu. 
    AI_Output (other, self ,"DIA_Snaf_FindNek_Molerats_15_08"); //Mo¿e wspó³pracowali ze Z³ym? Przecie¿ to on kaza³ mi szukaæ amuletu.
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_09"); //Nie mam pojêcia. Krêcisz siê to tu to tam. Miej oczy szeroko otwarte, a mo¿e czegoœ siê dowiesz. 
    AI_Output (self, other ,"DIA_Snaf_FindNek_Molerats_03_10"); //Popytaj o Neka w Obozie. Fletcher mo¿e mieæ jakieœ informacje. 
    MIS_WheresNek = LOG_RUNNING;
    
    Log_CreateTopic          (CH1_WheresNek, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WheresNek, LOG_RUNNING);
    B_LogEntry               (CH1_WheresNek,"Snaf uwa¿a, ¿e trup z jaskini to nie Nek tylko ktoœ inny. Stra¿nik chcia³ upozorowaæ swoj¹ œmieræ, by móc uciec do Nowego Obozu i nie byæ œciganym. Byæ mo¿e Fletcher da mi jakieœ wskazówki, gdzie szukaæ Neka.");
	
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
   description	= "Znalaz³em Neka. Ponownie...";
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
    AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_01"); //Znalaz³em Neka. Ponownie...
    AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_02"); //Mam nadziejê, ¿e tym razem zrobi³eœ to porz¹dnie. Gdzie by³? I czy wróci³ do Obozu?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_03"); //Wróciæ nie wróci³, bo...
   
    Info_ClearChoices	(DIA_Snaf_NEKZYJE);
	if HeroKillNek 
	{
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...go zabi³em.", DIA_Snaf_NEKZYJE_NOPE);
	};
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...przesiaduje w Nowym Obozie.", DIA_Snaf_NEKZYJE_NC);
	Info_AddChoice		(DIA_Snaf_NEKZYJE, "...pad³ ofiar¹ wilków.", DIA_Snaf_NEKZYJE_WOLFS);  
};

func void DIA_Snaf_NEKZYJE_NOPE ()
{
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_04"); //...go zabi³em.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_05"); //Doœæ radykalne podejœcie. Mo¿e trzeba by³o daæ mu drug¹ szansê?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_06"); //Fletcher powiedzia³, ¿e jeœli go znajdê to ma zgin¹æ.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_07"); //W sumie, gdyby wróci³ do Obozu to Fletcher nie mia³by problemów z d³ugami. No, ale inni Stra¿nicy na pewno szybko dowiedzieli by siê, ¿e Nek jest dezerterem. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_08"); //Nie wiem co dla niego gorsze. Teraz to ju¿ nie ma znaczenia. Masz tu coœ za fatygê. Przynajmniej teraz wiem co siê sta³o.
	
	B_LogEntry               (CH1_WheresNek,"Powiedzia³em Snafowi o tym, ¿e zabi³em Neka. Odniós³ siê do tego faktu z nut¹ obojêtnoœci. Mimo wszystko zap³aci³ mi za jego odszukanie.");
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
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_10"); //Czyli tak jak siê spodziewa³em. Rozmawia³eœ z nim? Czemu nie ma zamiaru wracaæ?
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_11"); //Zreszt¹, nie odpowiadaj. Przecie¿ to oczywiste, ¿e uciek³ po to ¿eby byæ jak najdalej od Starego Obozu. Powrót tutaj by³by dla niego samobójstwem. 
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_12"); //Fletcher chcia³ ¿ebym go zabi³.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_13"); //Ale chyba tego nie zrobi³eœ? 
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_14"); //Nie, wzi¹³em rudê w zamian za pozostawienie go w spokoju. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_15"); //To najrozs¹dniejsza decyzja. Jak daj¹ to bierz, jak masz szansê zwiaæ to wiej, oszukuj kiedy tylko siê da, nie zgrywaj bohatera, a mo¿e po¿yjesz trochê d³u¿ej w tym przeklêtym miejscu. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_16"); //A i nie radzê mówiæ o Neku Fletcherowi. Wiem, ¿e przesz³o ci to przez g³owê, ale co za du¿o to niezdrowo. Fletcher na pewno nie zap³aci ci za g³owê Neka. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_17"); //Chyba wiesz, ¿e ten goœæ popad³ w niez³e d³ugi... Próba bycia lojalnym wobec niego nic ci nie da. Ani s³awy, ani rudy. Fletcher nie jest nikim wa¿nym. 
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_18"); //Odnalaz³eœ Neka, wiêc nale¿y ci siê jakaœ nagroda za poœwiêcony czas.
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_19"); //Dziêki za rudê jak i za rady.
	
	B_LogEntry               (CH1_WheresNek,"Powiedzia³em Snafowi o tym, ¿e znalaz³em Neka w Nowym Obozie. Nie by³ zdziwiony. Poprosi³ mnie, aby nie mówiæ nic Fletcherowi. Mo¿e ma racje i Nek faktycznie ma tam szansê na lepsze ¿ycie...");
    Log_SetTopicStatus       (CH1_WheresNek, LOG_SUCCESS);
    MIS_WheresNek = LOG_SUCCESS;

    B_GiveXP (255);
	CreateInvItems (self,itminugget,100);
	B_GiveInvItems (self,other,itminugget,100);
	Info_ClearChoices	(DIA_Snaf_NEKZYJE);
};

func void DIA_Snaf_NEKZYJE_WOLFS ()
{
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_20"); //...pad³ ofiar¹ wilków.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_21"); //Jesteœ pewien, ¿e to by³ on?
	AI_Output (other, self ,"DIA_Snaf_NEKZYJE_15_22"); //Tak, wilków by³o doœæ sporo. W pojedynkê nie mia³ najmniejszych szans.
	AI_Output (self, other ,"DIA_Snaf_NEKZYJE_03_23"); //Szkoda, ¿e tak skoñczy³. Odnalaz³eœ go, wiêc nale¿y ci siê jakaœ nagroda za poœwiêcony czas.
	
	B_LogEntry               (CH1_WheresNek,"Postanowi³em trzymaæ jêzyk za zêbami i nie powiedzia³em prawdy o Neku Snafowi. Nek zap³aci³ mi za swoj¹ wolnoœæ, wiêc dotrzyma³em s³owa przy okazji dorabiaj¹c sobie na boku.");
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
   description	= "Przysy³a mnie Ian.";
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
    AI_Output (other, self ,"DIA_Snaf_IanQuest_15_01"); //Przysy³a mnie Ian.
    AI_Output (other, self ,"DIA_Snaf_IanQuest_03_02"); //Podobno dostawy ¿ywnoœci, które wysy³asz s¹ niezgodne z zamówieniami.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_03"); //¯e co? To niemo¿liwe! 
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_04"); //Zaraz spojrzê na swoj¹ listê i porównam j¹ z zamówieniami.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_05"); //Przy ka¿dej dostawiê sporz¹dzam dok³adn¹ listê.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_06"); //Tak, wszystko siê zgadza.
    AI_Output (other, self ,"DIA_Snaf_IanQuest_03_07"); //W takim razie dlaczego do kopalni s¹ dostarczane mniejsze racje?
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_08"); //Nie mam pojêcia. Konwoje s¹ dostarczane do obozu przed kopalni¹.
    AI_Output (self, other ,"DIA_Snaf_IanQuest_03_09"); //Tam s¹ rozdzielane racje ¿ywnoœciowe.
    B_LogEntry                     (CH1_FoodForOldMine,"Snaf zdradzi³ mi, ¿e konwoje s¹ dostarczane do obozu przed kopalni¹. Powinienem siê tam rozejrzeæ.");

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
	description = "Witaj, s³ysza³eœ ostanie wieœci o Baalu Parvezie?";
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
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_00"); //Witaj, s³ysza³eœ ostanie wieœci o Baalu Parvezie?
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_01"); //Wiem, ¿e ktoœ usilnie stara siê go st¹d wykurzyæ.
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_02"); //Zgadza siê, jednak chodzi mi o cenne artefakty, które ponoæ przys³ano mu z Bractwa. Móg³byœ przekazaæ te informacje mieszkañcom Obozu.
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_03"); //Pewnie szukasz jakiegoœ wspólnika do obrobienia skrzyni, co? Sprytnie. Za 50 bry³ek rudy pogadam z paroma ludŸmi i powiem im, ¿eby zg³osili siê do ciebie. 
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_04"); //Ale niczego nie gwarantujê. Ktoœ mo¿e spróbowaæ okraœæ Parveza na w³asn¹ rêkê.
	AI_Output(other, self, "DIA_Snaf_FakeRumor_15_05"); //Jestem gotów zaryzykowaæ.
	AI_Output(self, other, "DIA_Snaf_FakeRumor_03_06"); //A wiêc tak jak mówi³em, 50 bry³ek rudy.
	
	B_LogEntry(CH1_ParvezInTroubles, "Snaf rozpuœci informacje o kufrze z artefaktami za 50 bry³ek rudy. Cena doœæ sensowna jak na jego standardy.");
};

instance DIA_Snaf_FakeRumorGiveOre (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_FakeRumorGiveOre_Condition;
	information	= DIA_Snaf_FakeRumorGiveOre_Info;
	permanent	= 0;
	description = "Mam rudê. (daj 50 bry³ek rudy)";
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
	AI_Output(other, self, "DIA_Snaf_FakeRumorGiveOre_15_00"); //Mam rudê. Trzymaj.

	B_GiveInvItems(other, self, ItMiNugget, 50);
	Npc_RemoveInvItems(self, ItMiNugget, 50);
	
	AI_Output(self, other, "DIA_Snaf_FakeRumorGiveOre_03_01"); //Dziêki. A tak przy okazji nie masz ochoty na mój najnowszy przepis kulinarny? Gotowany chrz¹szcz z jagodami!
	AI_Output(other, self, "DIA_Snaf_FakeRumorGiveOre_15_02"); //Chyba ktoœ mnie wo³a³... Do zobaczenia...
		
	B_LogEntry(CH1_ParvezInTroubles, "Snaf zosta³ op³acony. Dwóch informatorów do rozpuszczenia plotki powinno wystarczyæ.");
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
   description	= "Znasz kogoœ, kto ma pojêcie o produkcji wina?";
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
    AI_Output (other, self ,"DIA_Snaf_Margunios_15_01"); //Znasz kogoœ, kto ma pojêcie o produkcji wina?
    AI_Output (self, other ,"DIA_Snaf_Margunios_03_02"); //Tak, znam jednego takiego. Nazywa siê Dion.
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_03"); //Nie wiesz gdzie go znajdê?
	AI_Output (self, other ,"DIA_Snaf_Margunios_03_04"); //W Cape Dun.
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_05"); //Jak niby mam siê tam dostaæ?
	AI_Output (self, other ,"DIA_Snaf_Margunios_03_06"); //A bo ja wiem?
	AI_Output (other, self ,"DIA_Snaf_Margunios_15_07"); //Niewa¿ne.
	
	B_LogEntry			(CH1_GhoransVine, "Snaf niezbyt mi pomóg³ w poszukiwaniach winiarza. Muszê próbowaæ dalej.");
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
	description = "Wygl¹dasz na strapionego.";
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
	AI_Output(other, self, "DIA_Snaf_Bag_15_00"); //Hej, Snaf, wygl¹dasz na strapionego.
	AI_Output(self, other, "DIA_Snaf_Bag_03_01"); //Tak w³aœnie wygl¹da cz³owiek, który nie doœæ, ¿e musia³ uciekaæ, to jeszcze czuje siê l¿ejszy o parê ³adnych bry³ek rudy.
	AI_Output(other, self, "DIA_Snaf_Bag_15_02"); //To rzeczywiœcie kiepsko.
	AI_Output(self, other, "DIA_Snaf_Bag_03_03"); //A jak! Wszystko przez te przyprawy, co to je mia³ za³atwiæ Baal Taran. Niby mia³em wyjœæ na swoje, bo cena by³a korzystna, a tu taka strata.
	AI_Output(self, other, "DIA_Snaf_Bag_03_04"); //Niech mnie Beliar, je¿eli Taran nie sko³owa³ ich od jakichœ przemytników.
	AI_Output(self, other, "DIA_Snaf_Bag_03_05"); //Zreszt¹ niewa¿ne... Da³em mu spor¹ zaliczkê, a on mia³ w najbli¿szym czasie przynieœæ mi sakiewkê z po³udniowymi przyprawami.
	AI_Output(self, other, "DIA_Snaf_Bag_03_06"); //Potem wydarzenia potoczy³y siê ju¿ szybko. Najpierw oskar¿ono mnie o otrucie, potem zawalenie siê Kopalni, wymordowanie Magów Ognia i rzeŸ wszystkich, których nie uznawa³o siê za swoich.
	AI_Output(self, other, "DIA_Snaf_Bag_03_07"); //Sam ledwo siê wyrwa³em z tego piek³a. W¹tpiê by Taran mia³ tyle szczêœcia. Myœlê jednak, ¿e zd¹¿y³ sprowadziæ te przyprawy.
};

instance DIA_Snaf_OfferGetBackBag (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 4;
	condition	= DIA_Snaf_OfferGetBackBag_Condition;
	information	= DIA_Snaf_OfferGetBackBag_Info;
	permanent	= 0;
	description = "Móg³bym spróbowaæ odzyskaæ twój towar.";
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
	AI_Output(other, self, "DIA_Snaf_OfferGetBackBag_15_00"); //Móg³bym spróbowaæ odzyskaæ te przyprawy, ale...
	AI_Output(self, other, "DIA_Snaf_OfferGetBackBag_03_01"); //Tak, zap³acê za nie pe³n¹ kwotê. Sto piêædziesi¹t... 
	AI_Output(other, self, "DIA_Snaf_OfferGetBackBag_15_02"); //Ekhem...
	AI_Output(self, other, "DIA_Snaf_OfferGetBackBag_03_03"); //Dobra, dwieœcie bry³ek rudy! Niech dwa razy zap³acê t¹ cholern¹ zaliczkê.
	
	MIS_SnafBag = LOG_RUNNING;

	Log_CreateTopic		(CH4_SnafBag, LOG_MISSION);
	Log_SetTopicStatus	(CH4_SnafBag, LOG_RUNNING);
	B_LogEntry					(CH4_SnafBag, "Snaf pragnie abym odzyska³ woreczek z przyprawami, które przed masakr¹ w Starym Obozie mia³ sprowadziæ dla niego Taran. Kucharz w¹tpi, ¿e jego dostawca jeszcze ¿yje. Bêdê musia³ poszukaæ jego cia³a. ");
	
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
	AI_Output(other, self, "DIA_Snaf_GetBackBag_15_00"); //Mam twoje przyprawy. Nastêpnym razem sam bêdziesz szed³ do tego gniazda szerszeni.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_01"); //Có¿, jeœli akurat bêdzie mi po drodze... Jestem przecie¿ kucharzem, nie jakimœ straceñcem.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_02"); //Jak siê umawialiœmy, sto piêædziesi¹t bry³ek rudy.
	AI_Output(other, self, "DIA_Snaf_GetBackBag_15_03"); //Dwieœcie.
	AI_Output(self, other, "DIA_Snaf_GetBackBag_03_04"); //Ty przechero, ale racja, dwieœcie.
	
	CreateInvItems(self, ItMiNugget, 200);
	B_GiveInvItems(self, other, ItMiNugget, 200);
	
	B_GiveInvItems(other, self, ItMi_SnafBag, 1);
	B_GiveXP (200);
	
	MIS_SnafBag = LOG_SUCCESS;

	Log_SetTopicStatus(CH4_SnafBag, LOG_SUCCESS);
	B_LogEntry(CH4_SnafBag, "Odda³em Snafowi znalezion¹ sakiewkê z przyprawami. Stary kucharz chcia³ siê targowaæ, ale nie da³em siê oszukaæ!");
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
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_02"); //Przygotowujê potrawkê z chrz¹szcza. Chcesz trochê?
    AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_03_03"); //Dlaczego nie pe³nisz ju¿ roli kucharza w Zewnêtrznym Pierœcieniu?
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_04"); //Przez pewien incydent, który mia³ miejsce kilka dni temu.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_05"); //Gotowa³em mój s³ynny gulasz z j¹der kretoszczura, kiedy nagle do mojej chaty wpad³ Herek.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_06"); //To jeden z najgroŸniejszych Kopaczy mieszkaj¹cych w Starym Obozie.
    if (Npc_KnowsInfo (hero, DIA_Herek_Bully))
    {
        AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_07"); //Tak, mia³em przyjemnoœæ go poznaæ.
        AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_15_08"); //Wiêc wiesz, co to za sukinsyn. 
    };
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_09"); //W ka¿dym razie Herek oskar¿y³ mnie, ¿e chcia³em go otruæ. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_10"); //Wraz z kilkoma ch³opakami skopa³ mnie i na drugi dzieñ rozgada³ w ca³ym Obozie, ¿e moje potrawki to trucizna.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_11"); //Straci³em zaufanie. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_12"); //Postanowi³em uciec. Na moje szczêœcie dowiedzia³em siê, ¿e Kruk postanowi³ opuœciæ Obóz i bierze ze sob¹ zaufanych ludzi.
    AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_13"); //Jedno pytanie: czy rzeczywiœcie chcia³eœ otruæ Hereka?
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_14"); //Nie, po prostu dzieñ wczeœniej mia³a miejsce pewna sytuacja. Mój s¹siad, Wrzód przechodz¹c potkn¹³ siê i wpad³ do mojego garnka.
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_15"); //Od razu go wy³owi³em, ale zdaje siê, ¿e ta brudna kanalia mia³a jakieœ wszy, które przedosta³y siê do zupy. 
    AI_Output (self, other ,"DIA_Snaf_Kapitel4_Dialog_03_16"); //Nie mia³em jednak o tym wczeœniej pojêcia.
   // AI_Output (other, self ,"DIA_Snaf_Kapitel4_Dialog_15_17"); //To ci dopiero historia. 
};

