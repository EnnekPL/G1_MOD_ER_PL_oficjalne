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
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_02"); //Pobi³eœ Tripa, krêcisz siê po Obozie w dziwnym pancerzu, czego jeszcze chcesz?
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_03"); //Mo¿e teraz mnie zaatakujesz? A mo¿e weŸmiesz moje zapasy?! 
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_04"); //No, co jeszcze zrobisz, rozbójniku?!
    AI_Output (self, other ,"DIA_Karczmarz_BOJKA_TRIP_03_05"); //Nie chcê mieæ z tob¹ nic wspólnego!
	
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
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_02"); //Tak. Prowadzê j¹ za pozwoleniem Thorusa.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_03"); //Wiêkszoœæ trunków kupuj¹ Kopacze. Stra¿nicy rzadko tu zagl¹daj¹.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO_03_04"); //Od czasu do czasu zjawia siê tu Bloodwyn lub Siekacz.
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
   description	= "Jak uda³o ci siê zjednaæ Kopaczy?";
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
    AI_Output (other, self ,"DIA_Karczmarz_HELLO2_15_01"); //Jak uda³o ci siê zjednaæ Kopaczy?
    AI_Output (other, self ,"DIA_Karczmarz_HELLO2_15_02"); //Przecie¿ jesteœ Stra¿nikiem.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_03"); //Wystarczy byæ dla nich mi³ym. To ludzie, tak samo jak my.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_04"); //Zrezygnowa³em z wywy¿szania siê. I tak zarabiam wiêcej ni¿ zwykli Stra¿nicy.
    AI_Output (self, other ,"DIA_Karczmarz_HELLO2_03_05"); //Interes siê krêci.
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
   description	= "Poka¿ mi swoje towary.";
};

FUNC INT DIA_Karczmarz_TRADE_Condition()
{
if (karczmarz_angry == false) {
    return TRUE; };
};

FUNC VOID DIA_Karczmarz_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Karczmarz_TRADE_15_01"); //Poka¿ mi swoje towary.
    AI_Output (self, other ,"DIA_Karczmarz_TRADE_03_02"); //Proszê bardzo.
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
    AI_Output (self, other ,"DIA_Karczmarz_TRUNEK_03_01"); //Witaj. Ka¿dy nowy otrzymuje ode mnie powitalny trunek.
    AI_Output (self, other ,"DIA_Karczmarz_TRUNEK_03_02"); //Mi³ego picia.
    CreateInvItems (self, ItFoBeer, 1);
    B_GiveInvItems (self, other, ItFoBeer, 1);
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"U karczmarza w zawalonej wie¿y kupiê alkohol i napoje. "); 
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
    AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_01"); //Szukam ludzi do pracy w Kopalni. Lorenzo kaza³ mi zorganizowaæ zmianê. Mo¿esz mi doradziæ kto móg³by pójœæ?
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_02"); //By³oby œwietnie gdybyœ zabra³ ze sob¹ Urbana. Ten goœæ prosi siê o k³opoty i mam go ju¿ serdecznie doœæ.
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_03"); //Odk¹d ten sukinsyn wróci³ ze Starej Kopalni dzieñ w dzieñ przychodzi do mojej karczmy, spija siê jak bela i t³ucze moich klientów.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_04"); //Dlaczego po prostu mu nie przy³o¿ysz albo nie wywalisz z karczmy?
    AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_05"); //To nie takie proste. Prosi³em o pomoc Szakala i kilku jego kumpli, ale nic z tego. Te gnidy zazdroszcz¹ mi prowadzenia karczmy.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_06"); //Maj¹ ¿al, ¿e to w³aœnie mi Thorus nada³ pieczê nad tym interesem. 
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_07"); //Gdybym sam pobi³ Urbana, stanêli by po jego stronie tylko po to, ¿eby zrobiæ mi na z³oœæ.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_08"); //A co gdyby przys³owiowo trafi³a kosa na kamieñ?
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_09"); //Chyba domyœlam siê o co ci chodzi.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_10"); //W takim razie ustalmy szczegó³y.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_11"); //Jeœli Urban podpadnie komuœ wa¿nemu, z pewnoœci¹ za karê zostanie odes³any do Kopalni. Ju¿ dobrych parê lat temu ten sam los spotka³ Alepha.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_12"); //Goœæ robi³ sobie ¿arty ze Stra¿ników, podkrada³ im ró¿ne rzeczy. Cholera, ca³kiem zabawnie wtedy by³o. 
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_13"); //No, ale nie widzia³em go od kilku lat, wiêc pewnie nie ¿yje.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_14"); //Wracaj¹c do tematu, przyjdŸ tu w nocy. Postaw kolejkê Urbanowi, a gdy ju¿ go 'chwyci' to zaprowadŸ go do Szakala.
	AI_Output (self, other ,"DIA_Karczmarz_LookingForWorkers_03_15"); //Przy odrobinie szczêœcia reszta sama siê potoczy.
	AI_Output (other, self ,"DIA_Karczmarz_LookingForWorkers_15_16"); //No dobra. Zobaczymy, co z tego wyjdzie.
	B_LogEntry               (CH1_ZmianaLorenza,"Manheim zaproponowa³ mi Urbana jako robotnika dla Lorenzo. Kopacz przynosi karczmarzowi same problemy. Mam przyjœæ w nocy, upiæ Urbana i zaprowadziæ go do Szakala. Jeœli dobrze pójdzie, dojdzie do bijatyki, któr¹ Urban oczywiœcie przegra, a za karê bêdzie zmuszony udaæ siê do Kopalni.");	
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
   description	= "Urban nie bêdzie ci ju¿ sprawia³ k³opotów.";
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
    AI_Output (other, self ,"DIA_Karczmarz_THANKSALOT_15_01"); //Urban nie bêdzie ci ju¿ sprawia³ k³opotów.
    AI_Output (self, other ,"DIA_Karczmarz_THANKSALOT_03_02"); //Dobra robota. Plan wypali³?
	AI_Output (other, self ,"DIA_Karczmarz_THANKSALOT_15_03"); //Tak, Szakal nieŸle go sklepa³.
    AI_Output (self, other ,"DIA_Karczmarz_THANKSALOT_03_04"); //I dobrze! Nale¿a³o mu siê. WeŸ te kilka bry³ek w nagrodê. Przys³u¿y³eœ mi siê.
	
    CreateInvItems (self,itminugget,30);
	B_GiveInvItems (self,other,itminugget,30);
	B_GiveXP (50);
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
   description	= "Poszukujê kogoœ, kto zna siê na produkcji wina.";
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
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_15_01"); //Poszukujê kogoœ, kto zna siê na produkcji wina.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_03_02"); //Po co? Przecie¿ w Starym Obozie sprowadzamy wino ze Œwiata Zewnêtrznego. 
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_15_03"); //Powiedzmy, ¿e taki ktoœ mo¿e mi w czymœ pomóc. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_03_04"); //A w czym?

    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    Info_AddChoice		(DIA_Karczmarz_Winiarz, "W pewnej sprawie.", DIA_Karczmarz_Winiarz_Nope);
    Info_AddChoice		(DIA_Karczmarz_Winiarz, "Ghoran z Obozu Bractwa szuka wspólnika.", DIA_Karczmarz_Winiarz_Ghoran);
};

FUNC VOID DIA_Karczmarz_Winiarz_Nope()
{
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Nope_15_01"); //W pewnej sprawie.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Nope_03_02"); //W porz¹dku - jak nie chcesz to nie mów. Tak czy inaczej nie znam nikogo takiego. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Nope_03_03"); //Musisz zapytaæ gdzieœ indziej.
    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Manheim nie zna nikogo, kto wie coœ o produkcji wina. Muszê spytaæ kogoœ innego.");
};

FUNC VOID DIA_Karczmarz_Winiarz_Ghoran()
{
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Ghoran_15_01"); //Ghoran z Obozu Bractwa szuka wspólnika.
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_02"); //Ghoran, Ghoran... gdzieœ ju¿ s³ysza³em to imiê... 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_03"); //No tak! Z rok temu jeszcze jako Cieñ mia³em dostarczyæ przesy³kê na bagna. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_04"); //Gdy tam by³em, to spróbowa³em tego ichniego "marguniosa". Tego nie da siê wprost piæ. Doprawdy nie wiem, jak ci Nowicjusze mog¹ coœ takiego ¿³opaæ. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_05"); //Ka¿dy kto ma rudê, woli kupiæ importowane wino od nas. 
    AI_Output (other, self ,"DIA_Karczmarz_Winiarz_Ghoran_15_06"); //Wiêc mi nie pomo¿esz?
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_07"); //Jak pomyœlê o tych be³tach, którymi Ghoran raczy swoich klientów, to sam chêtnie poszed³bym mu szukaæ kogoœ znaj¹cego siê na produkcji wina. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_08"); //Niestety nie znam nikogo takiego, bo i tak nie muszê, a pójœæ, nie pójdê bo karczma sama siê nie poprowadzi. Na twoim miejscu porozmawia³bym ze Snafem. 
    AI_Output (self, other ,"DIA_Karczmarz_Winiarz_Ghoran_03_09"); //A i jeszcze jedno. Jak bêdziesz na bagnach to pozdrów ode mnie Balora. 
    Info_ClearChoices		(DIA_Karczmarz_Winiarz);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Manheim nie zna nikogo, kto wie coœ o produkcji wina, jednak poleci³ mi pogadaæ ze Snafem.");
};

