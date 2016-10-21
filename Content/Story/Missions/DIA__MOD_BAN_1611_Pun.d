//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RaeuberKowal_EXIT(C_INFO)
{
	npc             = BAN_1611_Pun;
	nr              = 999;
	condition	= DIA_RaeuberKowal_EXIT_Condition;
	information	= DIA_Raeuberkowal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_RaeuberKowal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RaeuberKowal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia³ -
// Dialogi ogólne, fabularne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Raeuber_HELLO1 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_HELLO1_Condition;
   information  = DIA_Raeuber_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jesteœ tu kowalem?";
};

FUNC INT DIA_Raeuber_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Raeuber_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO1_15_01"); //Jesteœ tu kowalem?
    AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_02"); //Nazywam siê Pun i kujê orê¿ dla Bandytów. Nic szczególnego: proste miecze i maczugi.
	AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_03"); //Kiedyœ robi³em wspania³e bronie, ale teraz nie mam sk³adników, ani porz¹dnego sprzêtu. Poza tym ludzie w Kolonii maj¹ inne priorytety dotycz¹ce broni.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Raeuber_HELLO2 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_HELLO2_Condition;
   information  = DIA_Raeuber_HELLO2_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e znasz siê na tej robocie.";
};

FUNC INT DIA_Raeuber_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO1))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_01"); //Widzê, ¿e znasz siê na tej robocie.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_02"); //Kucie prostych mieczy wcale nie jest takie trudne. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_03"); //Nawet ty z pewnoœci¹ byœ sobie poradzi³. Gorszych obiboków niegdyœ uczy³em.
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_04"); //Gdzie wczeœniej pracowa³eœ?
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_05"); //Mia³em ma³¹ kuŸnie w jaskini niedaleko Khornis. Niestety, pewnego dnia nakryli mnie stra¿nicy. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_06"); //Trafi³em na miesi¹c do lochu, a póŸniej tutaj. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_07"); //Od kiedy kucie broni jest nielegalne?
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_08"); //To by³y ciê¿kie czasy. Stra¿ miejska potrzebowa³a broni. Ka¿dy kowal musia³ pracowaæ dzieñ i noc za ma³e pieni¹dze.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_09"); //Bardziej op³aca³o mi siê potajemnie sprzedawaæ broñ bandytom. G³ównie dlatego tutaj trafi³em. Gdybym dogada³ siê z kupcami, mo¿e moje ¿ycie potoczy³oby siê inaczej.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Raeuber_HELLO3 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 3;
   condition    = DIA_Raeuber_HELLO3_Condition;
   information  = DIA_Raeuber_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz doœwiadczenie w budowaniu kuŸni.";
};

FUNC INT DIA_Raeuber_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_01"); //Masz doœwiadczenie w budowaniu kuŸni. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_02"); //Sk¹d w ogóle macie kowad³o w Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_03"); //He he. Wiedzia³em, ¿e ktoœ w koñcu o to zapyta. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_04"); //O ile sprawa w Khorinis by³a prostsza, to tutaj musieliœmy ju¿ siê nag³owiæ, jak zdobyæ kowad³o.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_05"); //Najpierw opowiem ci o kowadle w jaskini. Gdy by³em na wolnoœci i mia³em zamiar kuæ potajemnie broñ dla bandytów dowiedzia³em siê, ¿e do miasta ma przyp³yn¹æ nowa dostawa z kontynentu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_06"); //Na statku mia³y siê znajdowaæ trzy nowiutkie kowad³a. Postanowi³em, ¿e wykorzystam okazjê.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_07"); //Kiedy stra¿nicy wy³adowali kowad³a i poszli napiæ siê piwa, szybko wepchn¹³em jedno z nich na ma³¹, przygotowan¹ wczeœniej ³ódŸ.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_08"); //Chyba sam Innos nade mn¹ czuwa³, bo kowad³o nie zrobi³o dziury w dnie ³odzi.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_09"); //Szybko odp³yn¹³em dalej od miasta i z trudem wyj¹³em kowad³o na brzeg. PóŸniej czeka³o mnie tylko przetransportowanie mojej zdobyczy do jaskini.
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_10"); //To ci dopiero historia. A jak to by³o z kowad³em w tym Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_11"); //Tutaj te¿ mieliœmy olbrzymie szczêœcie. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_12"); //Otó¿ parê lat wstecz Gomez zaplanowa³ budowê kuŸni w Starej Kopalni. Staliœmy siê na tyle uci¹¿liwi, ¿e konwoje z kopalni do obozu nie by³y ju¿ bezpieczne.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_13"); //Kopaczy nios¹cych ciê¿kie skrzynie rudy napaœæ by³o znacznie ³atwiej. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_14"); //Gomez chyba planowa³ kuæ broñ bezpoœrednio w kopalni i dopiero wtedy dostarczaæ l¿ejszy ³adunek do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_15"); //Gdy tylko dowiedzieliœmy siê kiedy kowad³o bêdzie transportowane do kopalni, przyst¹piliœmy do dzia³ania. 
	AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_16"); //WyobraŸ sobie piêtnastu Bandytów pchaj¹cych noc¹ kowad³o przez las. Magnaci najwyraŸniej nie spodziewali siê, ¿e coœ takiego przyjdzie nam do g³owy.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_17"); //Jako obstawê wys³ali zaledwie piêciu Stra¿ników. Pokonanie ich to pestka. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_18"); //Szczerze to dziwiê siê, ¿e Gomez jeszcze nas nie zaatakowa³. Nawet nie próbowa³ siê zemœciæ. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_19"); //Mo¿e czeka na odpowiedni moment?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_20"); //Mo¿e, ale dzisiaj... wolê o tym nie myœleæ.
};

//========================================
//-----------------> SwordElement
//========================================

INSTANCE DIA_Raeuber_SwordElement (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_SwordElement_Condition;
   information  = DIA_Raeuber_SwordElement_Info;
   permanent	= FALSE;
   description	= "Pamiêtasz mo¿e taki miecz?";
};

FUNC INT DIA_Raeuber_SwordElement_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_FindSwordElement)) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Raeuber_SwordElement_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_01"); //Pamiêtasz mo¿e taki miecz?
    AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_02"); //Pamiêtam. Sk¹d to masz?
	AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_03"); //Znalaz³em. Interesuje mnie w³aœciciel tego miecza.
	AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_03"); //Robi³em miecz o takim ostrzu dla Jensa. Nie wierzê, ¿e go zniszczy³. Zawsze szanowa³ moj¹ pracê...
	
	B_LogEntry               (CH1_DestroyedGrave,"Pokaza³em Punowi fragment miecza. Powiedzia³, ¿e sprzeda³ takie ostrze Jensowi. Ciekawe co na to Kereth...");
};

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Raeuber_RAYAN (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_RAYAN_Condition;
   information  = DIA_Raeuber_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ na temat œmierci Rayana?";
};

FUNC INT DIA_Raeuber_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_01"); //Wiesz coœ na temat œmierci Rayana?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_02"); //Ostatnio dowiedzia³em siê, ¿e ktoœ niszczy³ jego grób przy u¿yciu miecza, który zrobi³em dla Jensa. 
	AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_03"); //Faktycznie tak by³o. Coœ wiêcej?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_03"); //Nic, a nic. Jestem zajêty prac¹. Ostatnio nie zwraca³em uwagi na to co siê dzieje w Obozie.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia³ 4
// Wa¿ne dialogi dla w¹tków fabularnych innych obozów
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> VERY_IMPORTATN
//========================================
//**** PRAWDOPODOBNIE NIEAKTUALNE***
INSTANCE DIA_Raeuber_VERY_IMPORTATN (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_VERY_IMPORTATN_Condition;
   information  = DIA_Raeuber_VERY_IMPORTATN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_VERY_IMPORTATN_Condition()
{
    if (inicjacja_HeroMustHelpBandit == true)
    && (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_VERY_IMPORTATN_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_01"); //Zaczekaj. Drax chce zaatakowaæ patrole Gomeza. 
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_15_02"); //Wiem. Ju¿ z nim rozmawia³em. Co z tym zrobimy?
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_03"); //Musisz nam za³atwiæ wsparcie. Sami nie damy rady.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_04"); //IdŸ do obozu ³owców orków i pogadaj z ich przywódc¹. To stary znajomy Quentina.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_05"); //Poproœ go o pomoc. Zap³acê ci z góry, tylko siê spiesz.
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_15_06"); //A ile mi zap³acisz?
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_07"); //Cholera, 100 bry³ek rudy,
    MIS_HuntersSupport = LOG_RUNNING;

    Log_CreateTopic          (CH4_HuntersSupport, LOG_MISSION);
    Log_SetTopicStatus       (CH4_HuntersSupport, LOG_RUNNING);
    B_LogEntry               (CH4_HuntersSupport,"Mam jak najszybciej odnaleŸæ ³owców orków i poprosiæ ich przywódcê o pomoc Bandytom.");

    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "Dobra. Wyruszê najszybciej jak siê da.", DIA_Raeuber_VERY_IMPORTATN_DEAL);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "Chcê 200 bry³ek rudy.", DIA_Raeuber_VERY_IMPORTATN_CHCE_200);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "300 bry³ek rudy, albo sobie pójdê.", DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_DEAL()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_DEAL_15_01"); //Dobra. Wyruszê najszybciej jak siê da.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_DEAL_03_02"); //Œwietnie. Oto bry³ki.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_CHCE_200()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_CHCE_200_15_01"); //Chcê 200 bry³ek rudy.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_CHCE_200_03_02"); //Szlag by to! Masz. Tylko szybko.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_15_01"); //300 bry³ek rudy, albo sobie pójdê.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_03_02"); //Innos ciê opuœci³, czy co?! 
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_03_03"); //Masz, ale ruszaj siê.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_15_04"); //Tak jest.
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia³ -
// Wykuwanie broni
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Pun_CanYouForgeWeapon (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_CanYouForgeWeapon_Condition;
   information  = DIA_Pun_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "Móg³byœ coœ dla mnie wykuæ?";
};

FUNC INT DIA_Pun_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pun_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Pun_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Pun_CanYouForgeWeapon_03_02"); //A masz jakieœ plany kowalskie i sk³adniki? Móg³bym coœ stworzyæ, ale nic zaawansowanego.
	AI_Output (self, other ,"DIA_Pun_CanYouForgeWeapon_03_03"); //Nie mam tu zbyt porz¹dnej kuŸni, wiêc tylko jakieœ proste ostrza. Lepsz¹ kuŸnie znajdziesz w Bractwie, albo u Huana w Nowym Obozie. 

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Pun mo¿e wykuæ podstawowe i nieco lepsze bronie. Jeœli bêdê potrzebowa³ bardzo z³o¿onych ostrzy musze poszukaæ kogoœ innego.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Pun_ForgeWeapon (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_ForgeWeapon_Condition;
   information  = DIA_Pun_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie broñ.";
};

FUNC INT DIA_Pun_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pun_CanYouForgeWeapon))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pun_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Pun_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Pun_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};

FUNC VOID DIA_Pun_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Pun_ForgeWeapon_Plan1b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 40)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, ItMw_1H_Sword_04);
B_GiveInvItems (self,other,ItMw_1H_Sword_04,1);
//pay
B_GiveInvItems (other,self,itminugget,40);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//MIECZ KOWALA
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h6 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Wolf_01) >= 1) 
 &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, ItAt_Wolf_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H6);
B_GiveInvItems (self,other,Miecz1H6,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h11 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, Miecz1H11);
B_GiveInvItems (self,other,Miecz1H11,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//B£YSK NOCY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h15 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, Miecz1H15);
B_GiveInvItems (self,other,Miecz1H15,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//SZEROKI MIECZ
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h7 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//D£UGI MIECZ
FUNC VOID DIA_Pun_ForgeWeapon_Plan1c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//SZTYLET ZABÓJCY
FUNC VOID DIA_Pun_ForgeWeapon_DaggerOfMurder ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 1) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, ItMw_DaggerOfMurder);
B_GiveInvItems (self,other,ItMw_DaggerOfMurder,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//RAPIER
FUNC VOID DIA_Pun_ForgeWeapon_Rapier ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 2) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,ItAt_Lurker_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItAt_Lurker_01,1);
//give sword
CreateInvItem (self, ItMw_Rapier);
B_GiveInvItems (self,other,ItMw_Rapier,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//PA£ASZ
FUNC VOID DIA_Pun_ForgeWeapon_BanditTrader ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Pr_Wegiel) >= 1) &&(Npc_HasItems (hero,ItAt_Dzik_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,1);
Npc_RemoveInvItems (hero, ItAt_Dzik_01,1);
//give sword
CreateInvItem (self, ItMw_Addon_BanditTrader);
B_GiveInvItems (self,other,ItMw_Addon_BanditTrader,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//MIECZ ROZPACZY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1H9 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 4) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 3) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2)   &&(Npc_HasItems (hero,Gold01) >= 2) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 4) &&(Npc_HasItems (hero,ItAt_Claws_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,4);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,3);
Npc_RemoveInvItems (hero, Gold01,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,4);
Npc_RemoveInvItems (hero, ItAt_Claws_02,1);
//give sword
CreateInvItem (self, Miecz1H9);
B_GiveInvItems (self,other,Miecz1H9,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};

/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
FUNC VOID DIA_Pun_ForgeWeapon_Plan3b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 150)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 6) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 1)   
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,6);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,150);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//ŒWIÊTY MŒCICIEL
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h8 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 200)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 3) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 1)   
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)  &&(Npc_HasItems (hero,Gold01) >= 1)  &&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,1);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,200);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
/*
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
FUNC VOID DIA_Pun_ForgeWeapon_Plan3 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 7) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 4) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,7);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,4);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_04);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_04,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
FUNC VOID DIA_Pun_ForgeWeapon_Plan5c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 10)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,10);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_light_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Pun_ForgeWeapon_Plan4b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 2)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Troll_02,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_02);
B_GiveInvItems (self,other,ItMw_2H_Sword_02,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
FUNC VOID DIA_Pun_ForgeWeapon_Plan7b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 8) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 4)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 3)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Swampshark_02) >= 2)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,8);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,3);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Swampshark_02,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_Heavy_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_Heavy_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
FUNC VOID DIA_Pun_ForgeWeapon_Miecz2H5 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3) 
&&(Npc_HasItems (hero,Pr_SztabkaStali) >= 5)   
&&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 5)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaStali,5);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,5);
//give sword
CreateInvItem (self, Miecz2H5);
B_GiveInvItems (self,other,Miecz2H5,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};*/