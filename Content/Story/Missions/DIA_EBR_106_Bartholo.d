//poprawione i sprawdzone - Nocturn

func void changeRtnBartholo ()
{
	AI_StopProcessInfos	(self);
	B_ExchangeRoutine (EBR_106_Bartholo, "START");  
};

func void changeRtnBartholo2 ()
{
	B_ExchangeRoutine (STT_309_Whistler,"lochy");
	B_ExchangeRoutine (EBR_106_Bartholo,"start");
};

// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Nazywam siê Bartholo. Zajmujê siê zaopatrywaniem Magnatów. 
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Dostarczam im wszystkiego - od ziela, przez ¿ywnoœæ, a¿ po kobiety.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Oprócz tego pilnujê tych imbecyli z kuchni.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Te b³azny powinny mi byæ wdziêczne. Gomez nie toleruje partactwa, nawet w kuchni. Poprzednich dwóch kucharzy skarmi³ topielcom w rzece.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Chcê dobiæ z tob¹ targu.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chcê dobiæ z tob¹ targu.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mam sporo ciekawych rzeczy - jeœli masz wystarczaj¹co du¿o rudy.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Mam tu trochê ziela dla Gomeza. Przysy³a je Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == false)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Mam tu trochê ziela dla Gomeza. Przysy³a je Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Poka¿!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm ...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Œwietnie! Gomez zacz¹³ siê ju¿ niecierpliwiæ. Masz szczêœcie, ¿e przynios³eœ je jeszcze dzisiaj!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co z moj¹ zap³at¹?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Spokojnie... Masz tu 500 bry³ek rudy. Taka by³a umowa.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,	"Bartholo da³ mi 500 bry³ek rudy za dostarczenie ziela.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Jak na pos³añca masz przy sobie trochê za ma³o ziela! Mam nadziejê, ¿e nie sprzeda³eœ go komuœ innemu! Wróæ, jak bêdziesz mia³ ca³¹ partiê.
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Podejrzewa³em, ¿e prêdzej czy póŸniej ktoœ spróbuje u¿yæ pentagramu.
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale w odró¿nieniu od tego zdradzieckiego kowala, Stone'a, CIEBIE ju¿ nie potrzebujemy!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Gdzie jest Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za kratkami! Ale ciebie czeka mi³y, przytulny GRÓB!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Braæ go, ch³opcy! Posiekaæ go!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};

var int szukam_dowodow;
var int ruszajBartholo;
//========================================
//-----------------> WTF2
//========================================

INSTANCE DIA_Bartholo_WTF2 (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 5;
   condition    = DIA_Bartholo_WTF2_Condition;
   information  = DIA_Bartholo_WTF2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bartholo_WTF2_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    && (gadaninaBartholo==true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_WTF2_Info()
{
    AI_Output (self, other ,"DIA_Bartholo_WTF2_03_01"); //Gravo mówi³, ¿e czegoœ ode mnie chcesz? Coœ ty za jeden?
	AI_Output (self, other ,"DIA_Bartholo_WTF2_03_01_WARN"); //Ostrzegam, ¿e u góry stoi dwóch najlepszych Garotników jakich mamy. Jeœli spróbujesz mnie zaatakowaæ, gorzko tego po¿a³ujesz. 
    Info_ClearChoices		(DIA_Bartholo_WTF2);
    Info_AddChoice		(DIA_Bartholo_WTF2, "Niewa¿ne.", DIA_Bartholo_WTF2_NIC);
    Info_AddChoice		(DIA_Bartholo_WTF2, "Co wiesz o kradzie¿y dóbr Magnatów?", DIA_Bartholo_WTF2_HELP);
};

FUNC VOID DIA_Bartholo_WTF2_NIC()
{
    AI_Output (other, self ,"DIA_Bartholo_WTF2_NIC_15_01"); //Niewa¿ne.
	AI_Output (self, other ,"DIA_Bartholo_WTF2_NIC_03_02"); //To nie zawracaj mi g³owy, durniu! Nie nale¿ê do osób z poczuciem humoru. Zrób tak jeszcze raz, a nakarmiê tob¹ kretoszczury. 
    Info_ClearChoices		(DIA_Bartholo_WTF2);
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bartholo_WTF2_HELP()
{
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_01"); //Potrzebujê informacji o kradzie¿y dóbr Magnatów. S³ysza³em, ¿e jesteœ odpowiedzialny za ca³y inwentarz...
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_02"); //A w ogóle po co ci ta informacja? Dlaczego dla jakiegoœ brudasa mia³aby byæ u¿yteczna?
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_03"); //Prawdopodobnie jestem na tropie winowajcy. Powiedz mi, co wiesz.
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_04"); //To jakieœ ¿¹danie wobec mnie? Czy¿by do Kolonii trafi³ jakiœ szlachetny paladyn chc¹cy nagle zaprowadziæ sprawiedliwoœæ?
	AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_05"); //Chwyæ lepiej za kilof, m³okosie.
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_06"); //Ponowiê moje pytanie. Czy wœród ³upów by³o coœ szczególnego?
    AI_Output (self, other ,"DIA_Bartholo_WTF2_HELP_03_07"); //Uparty jesteœ... bo tam kilka pucharów, amulet, ruda i pewien cenny pierœcieñ. Zale¿y mi g³ównie na pierœcieniu. 
    AI_Output (other, self ,"DIA_Bartholo_WTF2_HELP_15_08"); //To bardzo wa¿na rzecz. Tyle powinno mi wystarczyæ. No, nie bêdê ci ju¿ zawraca³ g³owy. Do zobaczenia.
	
    B_LogEntry              (CH1_SpysProblems,"Bartholo wyjawi³ mi, ¿e poza rud¹ i kosztownoœciami, ³upem by³y tak¿e niezwykle cenny pierœcieñ i mniej wa¿ny amulet.");
	Info_ClearChoices		(DIA_Bartholo_WTF2);
	szukam_dowodow=true;
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOWODY
//========================================

INSTANCE DIA_Bartholo_DOWODY (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 6;
   condition    = DIA_Bartholo_DOWODY_Condition;
   information  = DIA_Bartholo_DOWODY_Info;
   permanent	= FALSE;
   description	= "Mam dowody obci¹¿aj¹ce Œwistaka.";
};

FUNC INT DIA_Bartholo_DOWODY_Condition()
{
    if (szukam_dowodow == true)
    && (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    && (Npc_HasItems (other, ItWr_PamietnikSwistaka) >=1)  
	{
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_DOWODY_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_DOWODY_15_01"); //Mam dowody obci¹¿aj¹ce Œwistaka. To on ukrad³ lata temu pierœcieñ i amulet.
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_02"); //Co? A jednak nie rzuca³eœ s³ów na wiatr. 
    AI_Output (other, self ,"DIA_Bartholo_DOWODY_15_03"); //Oto jego pamiêtnik, oraz pierœcieñ, który zosta³ skradziony. 
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_04"); //Poka¿ mi go!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_05"); //Co za sukinsyn! Ju¿ ja go dorwê i zrobiê z nim porz¹dek!
    AI_Output (self, other ,"DIA_Bartholo_DOWODY_03_06"); //A teraz dawaj mi ten pierœcieñ. Resztê œmieci mo¿esz sobie zatrzymaæ jako nagrodê. Znaj moj¹ szczodroœæ, m³okosie. 
    B_LogEntry                     (CH1_SpysProblems,"Bartholo wydawa³ siê byæ zadowolony z odzyskania ³upów. Zabra³ mi pierœcieñ i notatki Œwistaka.");
    B_GiveXP (300);
    Npc_ExchangeRoutine (self,"start");
	B_GiveInvItems (hero, EBR_106_Bartholo, EBR_Ring1, 1);
	Npc_RemoveInvItems (EBR_106_Bartholo, EBR_Ring1, 1);
	B_GiveInvItems (hero,EBR_106_Bartholo, ItWr_PamietnikSwistaka, 1);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HANDEL_ZEW
//========================================

INSTANCE DIA_Bartholo_HANDEL_ZEW (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_HANDEL_ZEW_Condition;
   information  = DIA_Bartholo_HANDEL_ZEW_Info;
   permanent	= FALSE;
   description	= "Rzekomo odpowiadasz za handel ze Œwiatem Zewnêtrznym.";
};

FUNC INT DIA_Bartholo_HANDEL_ZEW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_TROFEUM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_HANDEL_ZEW_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_01"); //Rzekomo odpowiadasz za handel ze Œwiatem Zewnêtrznym.
    AI_Output (self, other ,"DIA_Bartholo_HANDEL_ZEW_03_02"); //To prawda, potrzebujesz czegoœ?
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_03"); //Mam pewne pazury topielca, których kupnem móg³by byæ zainteresowany kupiec Lutero z Khorinis...
    AI_Output (self, other ,"DIA_Bartholo_HANDEL_ZEW_03_04"); //Przynieœ mi butelkê jakiegoœ porz¹dnego trunku, wtedy zajmê siê twoj¹ spraw¹. Byle nie tego œwiñstwa z bagien.  
    AI_Output (other, self ,"DIA_Bartholo_HANDEL_ZEW_15_05"); //Postaram siê coœ za³atwiæ. 
    B_LogEntry                     (CH1_SzponyTopielca,"Bartholo przeka¿e informacje kupcowi Lutero, jeœli przyniosê mu jakiœ wyj¹tkowy trunek. WyraŸnie jednak nie chcia³ s³yszeæ o winie produkowanym na bagnach. Lepiej chyba spróbowaæ w Nowym Obozie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GIVE_ALCO
//========================================
//edit by Nocturn
INSTANCE DIA_Bartholo_GIVE_ALCO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_GIVE_ALCO_Condition;
   information  = DIA_Bartholo_GIVE_ALCO_Info;
   permanent	= FALSE;
   description	= "Spróbuj tego.";
};

FUNC INT DIA_Bartholo_GIVE_ALCO_Condition()
{
    if (Npc_HasItems (other, JeremiahMoonshine) >=1)
    && (Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_GIVE_ALCO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_01"); //Spróbuj tego.
    B_GiveInvItems (other, self, JeremiahMoonshine, 1);
	AI_UseItem (self, JeremiahMoonshine);
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_02"); //Ten smak... Nieprawdopodobne, ¿e cz³owiek jest w stanie przyrz¹dziæ coœ tak wykwintnego. Przeka¿ê wiadomoœæ kupcowi. Co to mia³o byæ?
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_03"); //Mam pewne pazury topielca, ale nie takie zwyczajne. Posiadacz tych szponów by³ znacznie wiêkszy i silniejszy od pozosta³ych topielców. Kupiec Lutero z Khorinis poszukuje pazurów wyj¹tkowej bestii.
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_04"); //Rozumiem, przy najbli¿szej wymianie przeka¿ê wiadomoœæ.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ALCO_15_05"); //Kiedy mogê spodziewaæ siê odpowiedzi?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ALCO_03_06"); //Myœlê, ¿e za trzy dni.
    B_LogEntry                     (CH1_SzponyTopielca,"Bartholo przeka¿e wiadomoœæ kupcowi Lutero. Odpowiedzi mogê spodziewaæ siê za trzy dni.");
	dzien_Bartholo_1 = Wld_GetDay();
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ODP_OD_LUTERO
//========================================

INSTANCE DIA_Bartholo_ODP_OD_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 2;
   condition    = DIA_Bartholo_ODP_OD_LUTERO_Condition;
   information  = DIA_Bartholo_ODP_OD_LUTERO_Info;
   permanent	= FALSE;
   description	= "Czy kupiec przys³a³ odpowiedŸ?";
};

FUNC INT DIA_Bartholo_ODP_OD_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ALCO))
	&& (dzien_Bartholo_1 <= Wld_GetDay() -3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_ODP_OD_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_ODP_OD_LUTERO_15_01"); //Czy kupiec przys³a³ odpowiedŸ?
    AI_Output (self, other ,"DIA_Bartholo_ODP_OD_LUTERO_15_02"); //Tak, oto pismo.

    CreateInvItems (self, ItWr_LetterFromLutero, 1);
    B_GiveInvItems (self, other, ItWr_LetterFromLutero, 1);
    B_LogEntry                     (CH1_SzponyTopielca,"Otrzyma³em wiadomoœæ od Lutero. Muszê przeczytaæ list.");
};
var int dzien_Bartholo_Pazury;
//========================================
//-----------------> GIVE_ITEMS_LUTERO
//========================================

INSTANCE DIA_Bartholo_GIVE_ITEMS_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 3;
   condition    = DIA_Bartholo_GIVE_ITEMS_LUTERO_Condition;
   information  = DIA_Bartholo_GIVE_ITEMS_LUTERO_Info;
   permanent	= FALSE;
   description	= "Czy mo¿esz przekazaæ coœ jeszcze?";
};

FUNC INT DIA_Bartholo_GIVE_ITEMS_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_ODP_OD_LUTERO))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	&& (!Npc_KnowsInfo (hero, DIA_Bartholo_NOGIVE_ITEMS_LUTERO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_GIVE_ITEMS_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_15_01"); //Czy mo¿esz przekazaæ coœ jeszcze?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_03_02"); //Jasne, nie ma sprawy.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_ITEMS_LUTERO_15_03"); //Przeka¿ mu te pazury i wiadomoœæ, ¿e przyjmujê jego propozycjê.
    B_GiveInvItems (other, self, ItAt_DamLurker_01, 1);
    B_LogEntry                     (CH1_SzponyTopielca,"Przyj¹³em ofertê Lutero. Powinienem codziennie odwiedzaæ Bartholo i czekaæ na nagrodê.");
	dzien_Bartholo_Pazury = Wld_GetDay();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAGRODA_LUTERO
//========================================
//edit by Nocturn

INSTANCE DIA_Bartholo_NAGRODA_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 4;
   condition    = DIA_Bartholo_NAGRODA_LUTERO_Condition;
   information  = DIA_Bartholo_NAGRODA_LUTERO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bartholo_NAGRODA_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ITEMS_LUTERO))
   && (dzien_Bartholo_Pazury <= Wld_GetDay() -1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_NAGRODA_LUTERO_Info()
{
    AI_Output (self, other ,"DIA_Bartholo_NAGRODA_LUTERO_03_01"); //Zaczekaj, to od tego handlarza. Kaptur kolczy w Kolonii to naprawdê rzadkoœæ.
    AI_Output (other, self ,"DIA_Bartholo_NAGRODA_LUTERO_03_02"); //Dziêki za pomoc.
    B_LogEntry                     (CH1_SzponyTopielca,"Otrzyma³em nagrodê od kupca. Ten kaptur mo¿e okazaæ siê nieocenion¹ ochron¹ w tej przeklêtej Kolonii.");
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_SUCCESS);
    MIS_SzponyTopielca = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, KETPAL, 1);
    B_GiveInvItems (self, other, KETPAL, 1);
};

//========================================
//-----------------> NOGIVE_ITEMS_LUTERO
//========================================

INSTANCE DIA_Bartholo_NOGIVE_ITEMS_LUTERO (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 3;
   condition    = DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Condition;
   information  = DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Info;
   permanent	= FALSE;
   description	= "Postanowi³em zachowaæ trofeum dla siebie.";
};

FUNC INT DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_ODP_OD_LUTERO))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	&& (!Npc_KnowsInfo (hero, DIA_Bartholo_GIVE_ITEMS_LUTERO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bartholo_NOGIVE_ITEMS_LUTERO_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_NOGIVE_ITEMS_LUTERO_15_01"); //Postanowi³em zachowaæ trofeum dla siebie.
       B_LogEntry                     (CH1_SzponyTopielca,"Postanowi³em zachowaæ trofeum dla siebie. Byæ mo¿e kiedyœ bêdê tego ¿a³owa³, ale taki by³ mój wybór.");
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_FAILED);
    MIS_SzponyTopielca = LOG_FAILED;
};

//========================================
//-----------------> GOLDSWORD
//========================================

INSTANCE DIA_Bartholo_GOLDSWORD (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 1;
   condition    = DIA_Bartholo_GOLDSWORD_Condition;
   information  = DIA_Bartholo_GOLDSWORD_Info;
   permanent	= FALSE;
   description	= "Wygl¹dasz na zamyœlonego. Co jest?";
};

FUNC INT DIA_Bartholo_GOLDSWORD_Condition()
{
	if (kapitel >= 2)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bartholo_GOLDSWORD_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_01"); //Wygl¹dasz na zamyœlonego. Co jest?
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_02"); //Mo¿e nabra³byœ wreszcie trochê szacunku i og³ady?! Zreszt¹ niewa¿ne. Zastanawiam siê nad pewn¹ rzecz¹.
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_03"); //Powiesz mi coœ wiêcej?
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_04"); //Kiedyœ w Obozie by³ pewien wojownik, który posiada³ wspania³y miecz w po³owie wykonany ze z³ota. Nie by³o to jakieœ potê¿ne ostrze.
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_05"); //Wiadomo, ¿e z³oto jest kruche. To raczej broñ reprezentacyjna. 
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_06"); //Ten g³upiec myœla³ jednak inaczej. Pewnego dnia znikn¹³ razem ze swoj¹ broni¹. Wczeœniej przechwala³ siê w karczmie, ¿e zabije tym ostrzem stado zêbaczy. Co za g³upiec...
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_07"); //Oferowa³em mu za ten miecz 500 bry³ek rudy i cz³onkostwo wœród Cieni, jednak nie by³ zainteresowany. Chcia³bym odnaleŸæ ten miecz.
    AI_Output (other, self ,"DIA_Bartholo_GOLDSWORD_15_08"); //Rozejrzê siê po okolicy w poszukiwaniu zêbaczy. Zbieraj rudê, bo jeœli odnajdê orê¿, to za darmo ci go nie oddam. 
    AI_Output (self, other ,"DIA_Bartholo_GOLDSWORD_03_09"); //Ha ha! Trzymam ciê za s³owo.
    MIS_GoldSword_Bartholo = LOG_RUNNING;

    Log_CreateTopic            (CH2_GoldSword_Bartholo, LOG_MISSION);
    Log_SetTopicStatus       (CH2_GoldSword_Bartholo, LOG_RUNNING);
    B_LogEntry                     (CH2_GoldSword_Bartholo,"Bartholo opowiedzia³ mi o wojowniku, który posiada³ z³oty miecz. Podobno w³aœciciel przez swoj¹ bezmyœlnoœæ zosta³ zabity przez zêbacze. Muszê poszukaæ tych bestii w okolicy Starego Obozu. Mo¿e miecz wci¹¿ gdzieœ le¿y.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GIVE_GOLD_SWORD
//========================================

INSTANCE DIA_Bartholo_GIVE_GOLD_SWORD (C_INFO)
{
   npc          = EBR_106_Bartholo;
   nr           = 2;
   condition    = DIA_Bartholo_GIVE_GOLD_SWORD_Condition;
   information  = DIA_Bartholo_GIVE_GOLD_SWORD_Info;
   permanent	= FALSE;
   description	= "Mam tu pewien miecz.";
};

FUNC INT DIA_Bartholo_GIVE_GOLD_SWORD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_GOLDSWORD))
	&& (Npc_HasItems(other, GoldenSword) >= 1)
	
    {
    return TRUE;
    };
};

//SPAWN_OW_SNAPPER_OCWOOD1_05_02
FUNC VOID DIA_Bartholo_GIVE_GOLD_SWORD_Info()
{
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_01"); //Mam tu pewien miecz.
    AI_Output (self, other ,"DIA_Bartholo_GIVE_GOLD_SWORD_03_02"); //Co?! Naprawdê ci siê uda³o?
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_03"); //Jak widaæ. Mam tutaj miecz w ca³ej okaza³oœci. Nie znam siê na kowalstwie, ale ostrze chyba nie jest zbyt zniszczone.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_04"); //Jak¹ cenê proponujesz?
    AI_Output (self, other ,"DIA_Bartholo_GIVE_GOLD_SWORD_03_05"); //Dam ci 500 bry³ek rudy i kilka mikstur.
    AI_Output (other, self ,"DIA_Bartholo_GIVE_GOLD_SWORD_15_06"); //Umowa stoi!
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    CreateInvItems (self, ItFo_Potion_Mana_01, 3);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_01, 3);
    CreateInvItems (self, ItFo_Potion_Health_02, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 2);
	B_GiveInvItems (other, self, GoldenSword, 1);
    B_LogEntry                     (CH2_GoldSword_Bartholo,"Znalaz³em miecz i odda³em go Bartholo. Po co mi coœ takiego w ekwipunku...");
    Log_SetTopicStatus       (CH2_GoldSword_Bartholo, LOG_SUCCESS);
    MIS_GoldSword_Bartholo = LOG_SUCCESS;

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

