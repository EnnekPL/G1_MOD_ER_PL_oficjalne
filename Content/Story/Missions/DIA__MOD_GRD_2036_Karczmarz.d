//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Karczmarz_EXIT(C_INFO)
{
	npc             = GRD_2036_Karczmarz;
	nr              = 999;
	condition		= DIA_Karczmarz_EXIT_Condition;
	information		= DIA_Karczmarz_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Karczmarz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Karczmarz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
var int karczmarz_angry;
//========================================
//-----------------> BOJKA_TRIP
//========================================

INSTANCE DIA_Karczmarz_BOJKA_TRIP (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 1;
   condition    = DIA_Karczmarz_BOJKA_TRIP_Condition;
   information  = DIA_Karczmarz_BOJKA_TRIP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Karczmarz_BOJKA_TRIP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_WARN_BANDIT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_BOJKA_TRIP_Info()
{
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_01"); //Czego tu jeszcze szukasz? 
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_02"); //Pobi�e� Tripa, kr�cisz si� po Obozie w dziwnym pancerzu, czego jeszcze chcesz?
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_03"); //Mo�e teraz mnie zaatakujesz? A mo�e we�miesz moje zapasy?! 
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_04"); //No, co jeszcze zrobisz, rozb�jniku?!
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_05"); //Nie chc� mie� z tob� nic wsp�lnego!
	
    AI_StopProcessInfos	(GRD_2036_Karczmarz);
	
	karczmarz_angry = true;
	GRD_4060_Trip.guild = GIL_GRD;
	Npc_SetTrueGuild (GRD_4060_Trip,GIL_GRD);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Karczmarz_HELLO (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 1;
   condition    = DIA_Karczmarz_HELLO_Condition;
   information  = DIA_Karczmarz_HELLO_Info;
   permanent	= FALSE;
   description	= "To twoja karczma?";
};

FUNC INT DIA_Karczmarz_HELLO_Condition()
{
if (karczmarz_angry == false) {
    return TRUE; };
};

FUNC VOID DIA_Karczmarz_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_HELLO_15_01"); //To twoja karczma?
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_02"); //Tak. Prowadz� j� za pozwoleniem Thorusa.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_03"); //Wi�kszo�� trunk�w kupuj� Kopacze. Stra�nicy rzadko tu zagl�daj�.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_04"); //Od czasu do czasu zjawia si� tu Bloodwyn lub Siekacz.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Karczmarz_HELLO2 (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 2;
   condition    = DIA_Karczmarz_HELLO2_Condition;
   information  = DIA_Karczmarz_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak uda�o ci si� zjedna� Kopaczy?";
};

FUNC INT DIA_Karczmarz_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_HELLO)) && (karczmarz_angry == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_HELLO2_15_01"); //Jak uda�o ci si� zjedna� Kopaczy?
    AI_Output (other, self ,"DIA_Karczmarz_HELLO2_15_02"); //Przecie� jeste� Stra�nikiem.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_03"); //Wystarczy by� dla nich mi�ym. To ludzie, tak samo jak my.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_04"); //Zrezygnowa�em z wywy�szania si�. I tak zarabiam wi�cej ni� zwykli Stra�nicy.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_05"); //Interes si� kr�ci.
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Karczmarz_TRADE (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 3;
   condition    = DIA_Karczmarz_TRADE_Condition;
   information  = DIA_Karczmarz_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� mi swoje towary.";
};

FUNC INT DIA_Karczmarz_TRADE_Condition()
{
if (karczmarz_angry == false) {
    return TRUE; };
};

FUNC VOID DIA_Karczmarz_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_TRADE_15_01"); //Poka� mi swoje towary.
    AI_Output (self, other ,"DIA_Karczmarz_TRADE_03_02"); //Prosz� bardzo.
};

//========================================
//-----------------> TRUNEK
//========================================

INSTANCE DIA_Karczmarz_TRUNEK (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 4;
   condition    = DIA_Karczmarz_TRUNEK_Condition;
   information  = DIA_Karczmarz_TRUNEK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Karczmarz_TRUNEK_Condition()
{
if (karczmarz_angry == false) {
    return TRUE; };
};

FUNC VOID DIA_Karczmarz_TRUNEK_Info()
{
    AI_Output (self, other ,"DIA_Karczmarz_TRUNEK_03_01"); //Witaj. Ka�dy nowy otrzymuje ode mnie powitalny trunek.
    AI_Output (self, other ,"DIA_Karczmarz_TRUNEK_03_02"); //Mi�ego picia.
    CreateInvItems (self, ItFoBeer, 1);
    B_GiveInvItems (self, other, ItFoBeer, 1);
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"U karczmarza w zawalonej wie�y kupi� alkohol i napoje. "); 
};

//========================================
//-----------------> LookingForWorkers
//========================================

INSTANCE DIA_Karczmarz_LookingForWorkers (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 2;
   condition    = DIA_Karczmarz_LookingForWorkers_Condition;
   information  = DIA_Karczmarz_LookingForWorkers_Info;
   permanent	= FALSE;
   description	= "Szukam ludzi do pracy w Kopalni.";
};

FUNC INT DIA_Karczmarz_LookingForWorkers_Condition()
{
    if MIS_ZmianaLorenza == LOG_RUNNING
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_LookingForWorkers_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_01"); //Szukam ludzi do pracy w Kopalni. Lorenzo kaza� mi zorganizowa� zmian�. Mo�esz mi doradzi� kto m�g�by p�j��?
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_02"); //By�oby �wietnie gdyby� zabra� ze sob� Urbana. Ten go�� prosi si� o k�opoty i mam go ju� serdecznie do��.
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_03"); //Odk�d ten sukinsyn wr�ci� ze Starej Kopalni dzie� w dzie� przychodzi do mojej karczmy, spija si� jak bela i t�ucze moich klient�w.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_04"); //Dlaczego po prostu mu nie przy�o�ysz albo nie wywalisz z karczmy?
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_05"); //To nie takie proste. Prosi�em o pomoc Szakala i kilku jego kumpli, ale nic z tego. Te gnidy zazdroszcz� mi prowadzenia karczmy.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_06"); //Maj� �al, �e to w�a�nie mi Thorus nada� piecz� nad tym interesem. 
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_07"); //Gdybym sam pobi� Urbana, stan�li by po jego stronie tylko po to, �eby zrobi� mi na z�o��.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_08"); //A co gdyby przys�owiowo trafi�a kosa na kamie�?
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_09"); //Chyba domy�lam si� o co ci chodzi.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_10"); //W takim razie ustalmy szczeg�y.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_11"); //Je�li Urban podpadnie komu� wa�nemu, z pewno�ci� za kar� zostanie odes�any do Kopalni. Ju� dobrych par� lat temu ten sam los spotka� Alepha.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_12"); //Go�� robi� sobie �arty ze Stra�nik�w, podkrada� im r�ne rzeczy. Cholera, ca�kiem zabawnie wtedy by�o. 
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_13"); //No, ale nie widzia�em go od kilku lat, wi�c pewnie nie �yje.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_14"); //Wracaj�c do tematu, przyjd� tu w nocy. Postaw kolejk� Urbanowi, a gdy ju� go 'chwyci' to zaprowad� go do Szakala.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_15"); //Przy odrobinie szcz�cia reszta sama si� potoczy.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_16"); //No dobra. Zobaczymy, co z tego wyjdzie.
	B_LogEntry               (CH1_ZmianaLorenza,"Manheim zaproponowa� mi Urbana jako robotnika dla Lorenzo. Kopacz przynosi karczmarzowi same problemy. Mam przyj�� w nocy, upi� Urbana i zaprowadzi� go do Szakala. Je�li dobrze p�jdzie, dojdzie do bijatyki, kt�r� Urban oczywi�cie przegra, a za kar� b�dzie zmuszony uda� si� do Kopalni.");	
};

//========================================
//-----------------> THANKSALOT
//========================================

INSTANCE DIA_Karczmarz_THANKSALOT (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 2;
   condition    = DIA_Karczmarz_THANKSALOT_Condition;
   information  = DIA_Karczmarz_THANKSALOT_Info;
   permanent	= FALSE;
   description	= "Urban nie b�dzie ci ju� sprawia� k�opot�w.";
};

FUNC INT DIA_Karczmarz_THANKSALOT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jackal_ANGRYMAN)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_THANKSALOT_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_THANKSALOT_15_01"); //Urban nie b�dzie ci ju� sprawia� k�opot�w.
    AI_Output (self, other ,"DIA_Karczmarz_THANKSALOT_03_02"); //Dobra robota. Plan wypali�?
	AI_Output (other, self ,"DIA_Karczmarz_THANKSALOT_15_03"); //Tak, Szakal nie�le go sklepa�.
    AI_Output (self, other ,"DIA_Karczmarz_THANKSALOT_03_04"); //I dobrze! Nale�a�o mu si�. We� te kilka bry�ek w nagrod�. Przys�u�y�e� mi si�.
	
    CreateInvItems (self,itminugget,30);
	B_GiveInvItems (self,other,itminugget,30);
	B_GiveXP (50);
};

//========================================
//-----------------> SellAlcoBan
//========================================

INSTANCE DIA_Karczmarz_SellAlcoBan (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 1;
   condition    = DIA_Karczmarz_SellAlcoBan_Condition;
   information  = DIA_Karczmarz_SellAlcoBan_Info;
   permanent	= FALSE;
   description	= "Chcesz kupi� alkohol w niez�ej cenie?";
};

FUNC INT DIA_Karczmarz_SellAlcoBan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Sprawa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_SellAlcoBan_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_SellAlcoBan_15_01"); //Chcesz kupi� alkohol w niez�ej cenie?
    AI_Output (self, other ,"DIA_Karczmarz_SellAlcoBan_03_02"); //Co? Od was?!
    AI_Output (self, other ,"DIA_Karczmarz_SellAlcoBan_03_03"); //Nigdy! 
    AI_Output (self, other ,"DIA_Karczmarz_SellAlcoBan_03_04"); //Mamy solidne dostawy z Nowego Obozu. Tylko troch� drogie.
    AI_Output (other, self ,"DIA_Karczmarz_SellAlcoBan_15_05"); //Mog� ci zaoferowa� ta�szy, a tej samej jako�ci. Na pewno si� nie zdecydujesz?
    AI_Output (self, other ,"DIA_Karczmarz_SellAlcoBan_03_06"); //Powiedzia�em, �e nie! Odejd�, zbirze!
    B_LogEntry                     (CH1_SellAlco,"Karczmarz ze Starego Obozu mimo op�acalno�ci mojej oferty by� bardzo opryskliwy. Chyba musz� nauczy� go dobrych manier.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RyjKmiocie
//========================================

INSTANCE DIA_Karczmarz_RyjKmiocie (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 2;
   condition    = DIA_Karczmarz_RyjKmiocie_Condition;
   information  = DIA_Karczmarz_RyjKmiocie_Info;
   permanent	= FALSE;
   description	= "Ty chyba chcesz dosta� w mord�.";
};

FUNC INT DIA_Karczmarz_RyjKmiocie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_SellAlcoBan))
    && (MIS_SellAlco == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_RyjKmiocie_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_RyjKmiocie_15_01"); //Ty chyba chcesz dosta� w mord�.
    AI_Output (self, other ,"DIA_Karczmarz_RyjKmiocie_03_02"); //No dawaj!
	//CreateInvItems (self, ItFo_Potion_Health_03, 5);
	/*Npc_RemoveInvItems (self, ItMiNugget,300);
	Npc_RemoveInvItems  (self,ItMiNugget,300);
	Npc_RemoveInvItems  (self,ItLsTorch,10);
	Npc_RemoveInvItems  (self,ItMi_Stuff_Pipe_01,10);
	Npc_RemoveInvItems  (self,ItMi_Stuff_Cup_01,10);
	Npc_RemoveInvItems  (self,ItMi_Alchemy_Salt_01,3);
	Npc_RemoveInvItems  (self,ItFoApple,15);
	Npc_RemoveInvItems  (self,ItFoLoaf,15);
	Npc_RemoveInvItems  (self,ItFoMutton,15);
	Npc_RemoveInvItems  (self,ItForice,15);
	Npc_RemoveInvItems  (self,ItFo_Potion_Water_01,15);
	Npc_RemoveInvItems  (self,ItFoBeer,15);
	Npc_RemoveInvItems  (self,ItFoWine,15);
	Npc_RemoveInvItems  (self,ItFoBooze,15);*/
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
};

//========================================
//-----------------> Wpierdol
//========================================

INSTANCE DIA_Karczmarz_Wpierdol (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 3;
   condition    = DIA_Karczmarz_Wpierdol_Condition;
   information  = DIA_Karczmarz_Wpierdol_Info;
   permanent	= FALSE;
   description	= "G�owa boli?";
};

FUNC INT DIA_Karczmarz_Wpierdol_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_RyjKmiocie))
    && (GRD_2036_Karczmarz.aivar[AIV_WASDEFEATEDBYSC])
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_Wpierdol_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_Wpierdol_15_01"); //G�owa boli?
    AI_Output (self, other ,"DIA_Karczmarz_Wpierdol_03_02"); //Bardzo.
    AI_Output (other, self ,"DIA_Karczmarz_Wpierdol_15_03"); //Kupisz alkohol taniej?
    AI_Output (self, other ,"DIA_Karczmarz_Wpierdol_03_04"); //Dobra, ju� dobra. Kupi�, tylko jak Thorus si� dowie...
    AI_Output (self, other ,"DIA_Karczmarz_Wpierdol_03_05"); //Masz dopilnowa�, �eby si� nie dowiedzia�.
    B_LogEntry                     (CH1_SellAlco,"Uda�o mi si� przekona� karczmarza z zawalonej wie�y do kupowania alkoholu od Bandyt�w.");
	CreateInvItems (self, ItFo_Potion_Health_03, 5); 
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DostwaOC
//========================================

INSTANCE DIA_Karczmarz_DostwaOC (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 1;
   condition    = DIA_Karczmarz_DostwaOC_Condition;
   information  = DIA_Karczmarz_DostwaOC_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie pierwsz� dostaw�.";
};

FUNC INT DIA_Karczmarz_DostwaOC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Dostwy))
    && (Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_DostwaOC_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_DostwaOC_15_01"); //Mam dla ciebie pierwsz� dostaw�.
    AI_Output (self, other ,"DIA_Karczmarz_DostwaOC_03_02"); //My�la�em, �e nie wr�cisz no, ale c�. Daj mi to! I pami�taj: Thorus o niczym nie wie.
    B_LogEntry                     (CH1_Dostawy,"Stary Ob�z - towar dostarczony.");


    B_GiveXP (50);

    B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01, 10);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Winiarz
//========================================

INSTANCE DIA_Karczmarz_Winiarz (C_INFO)
{
   npc          = GRD_2036_Karczmarz;
   nr           = 2;
   condition    = DIA_Karczmarz_Winiarz_Condition;
   information  = DIA_Karczmarz_Winiarz_Info;
   permanent	= FALSE;
   description	= "Poszukuj� kogo�, kto zna si� na produkcji wina.";
};

FUNC INT DIA_Karczmarz_Winiarz_Condition()
{
    if (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Karczmarz_Winiarz_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_15_01"); //Poszukuj� kogo�, kto zna si� na produkcji wina.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_03_02"); //Po co? Przecie� w Starym Obozie sprowadzamy wino ze �wiata Zewn�trznego. 
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_15_03"); //Powiedzmy, �e taki kto� mo�e mi w czym� pom�c. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_03_04"); //A w czym?

    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    Info_AddChoice		(DIA_Karczmarz_Winiarz, "W pewnej sprawie.", DIA_Karczmarz_Winiarz_Nope);
    Info_AddChoice		(DIA_Karczmarz_Winiarz, "Ghoran z Obozu Bractwa szuka wsp�lnika.", DIA_Karczmarz_Winiarz_Ghoran);
};

FUNC VOID DIA_Karczmarz_Winiarz_Nope()
{
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Nope_15_01"); //W pewnej sprawie.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Nope_03_02"); //W porz�dku - jak nie chcesz to nie m�w. Tak czy inaczej nie znam nikogo takiego. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Nope_03_03"); //Musisz zapyta� gdzie� indziej.
    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Manheim nie zna nikogo, kto wie co� o produkcji wina. Musz� spyta� kogo� innego.");
};

FUNC VOID DIA_Karczmarz_Winiarz_Ghoran()
{
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Ghoran_15_01"); //Ghoran z Obozu Bractwa szuka wsp�lnika.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_02"); //Ghoran, Ghoran... gdzie� ju� s�ysza�em to imi�... 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_03"); //No tak! Z rok temu jeszcze jako Cie� mia�em dostarczy� przesy�k� na bagna. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_04"); //Gdy tam by�em, to spr�bowa�em tego ichniego "marguniosa". Tego nie da si� wprost pi�. Doprawdy nie wiem, jak ci Nowicjusze mog� co� takiego ��opa�. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_05"); //Ka�dy kto ma rud�, woli kupi� importowane wino od nas. 
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Ghoran_15_06"); //Wi�c mi nie pomo�esz?
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_07"); //Jak pomy�l� o tych be�tach, kt�rymi Ghoran raczy swoich klient�w, to sam ch�tnie poszed�bym mu szuka� kogo� znaj�cego si� na produkcji wina. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_08"); //Niestety nie znam nikogo takiego, bo i tak nie musz�, a p�j��, nie p�jd� bo karczma sama si� nie poprowadzi. Na twoim miejscu porozmawia�bym ze Snafem. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_09"); //A i jeszcze jedno. Jak b�dziesz na bagnach to pozdr�w ode mnie Balora. 
    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Manheim nie zna nikogo, kto wie co� o produkcji wina, jednak poleci� mi pogada� ze Snafem.");
};

