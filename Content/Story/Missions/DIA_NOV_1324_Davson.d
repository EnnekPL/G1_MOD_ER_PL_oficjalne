// ************************ EXIT **************************

instance  Nov_1324_Davson_Exit (C_INFO)
{
	npc			=  NOV_1324_Novize;
	nr			=  999;
	condition	=  Nov_1324_Davson_Exit_Condition;
	information	=  Nov_1324_Davson_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1324_Davson_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1324_Davson_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> Quest123
//========================================

INSTANCE DIA_Novize_Quest123 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_Quest123_Condition;
   information  = DIA_Novize_Quest123_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Novize_Quest123_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    || (Npc_GetTrueGuild (hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Quest123_Info()
{
    AI_Output (self, other ,"DIA_Novize_Quest123_03_01"); //Hej, ty. Wygl¹dasz na kogoœ, kto chcia³by sobie dorobiæ.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_03"); //Pomo¿esz nam.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_04"); //Niby w czym?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_05"); //Trochê eksperymentowaliœmy i uda³o nam siê stworzyæ nowy rodzaj skrêta. Jest bardzo mocny, a wcale nie zu¿ywamy wiêcej bagiennego ziela do jego produkcji.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_06"); //Z pewnoœci¹ sporo mo¿na na tym zarobiæ. Podzielimy siê z tob¹ zyskami, je¿eli za³atwisz nam handlarza.
	AI_Output (other, self ,"DIA_Novize_Quest123_15_07"); //Czy wynik waszego eksperymentu nie powinien czasem trafiæ do Cor Kaloma?
	AI_Output (self, other ,"DIA_Novize_Quest123_03_08"); //Chcesz na nas donieœæ? Mistrz Kalom nie musi o niczym wiedzieæ.
	AI_Output (self, other ,"DIA_Novize_Quest123_03_09"); //Masz tu cztery "próbki". Tylko nie wypal wszystkiego. Zostaw coœ dla naszego przysz³ego wspólnika.
	
	CreateInvItems (self, MegaJoint, 4);
    B_GiveInvItems (self, other, MegaJoint, 4);
	
    MIS_NewWeed = LOG_RUNNING;	
	Log_CreateTopic          (CH1_NewWeed, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NewWeed, LOG_RUNNING);
    B_LogEntry               (CH1_NewWeed,"Nowicjusz Davson opracowa³ nowy rodzaj skrêta. Uwa¿a, ¿e mo¿na na nim sporo zarobiæ. Podzieli siê ze mn¹ zyskami, je¿eli znajdê jakiegoœ kupca na jego towar.");
};

//========================================
//-----------------> Kupcy
//========================================

INSTANCE DIA_Novize_Kupcy (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_Kupcy_Condition;
   information  = DIA_Novize_Kupcy_Info;
   permanent	= FALSE;
   description	= "Gdzie niby mia³bym znaleŸæ kupców?";
};

FUNC INT DIA_Novize_Kupcy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_Quest123))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Kupcy_Info()
{
    AI_Output (other, self ,"DIA_Novize_Kupcy_15_01"); //Gdzie niby mia³bym znaleŸæ kupców?
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_02"); //Hmmm... Najwiêkszy skup jest w Nowym Obozie. Powinieneœ tam zajrzeæ.
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_03"); //Mo¿e dogadasz siê z jakimœ Baalem. Spróbuj mu udowodniæ, ¿e nasz towar warto sprzedaæ.
	AI_Output (self, other ,"DIA_Novize_Kupcy_03_04"); //Mo¿esz te¿ poszukaæ w Starym Obozie.
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_05"); //Tylko pamiêtaj o dyskrecji. 
	
    B_LogEntry                     (CH1_NewWeed,"Davson stwierdzi³, ¿e najlepiej przekonaæ kogoœ w Nowym Obozie. Powinienem pogadaæ z którymœ z tamtych handlarzy.");
};

//========================================
//-----------------> Dealer_Cipher
//========================================

INSTANCE DIA_Novize_Dealer_Cipher (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_Dealer_Cipher_Condition;
   information  = DIA_Novize_Dealer_Cipher_Info;
   permanent	= FALSE;
   description	= "Znalaz³em kupca.";
};

FUNC INT DIA_Novize_Dealer_Cipher_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cipher_NovizeJoints))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Dealer_Cipher_Info()
{
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_01"); //Znalaz³em kupca.
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_03"); //Niejaki Cipher, Szkodnik z Nowego Obozu. Ma spore doœwiadczenie.
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_04"); //Gdzieœ ju¿ s³ysza³em to imiê. Mam wra¿enie, ¿e wspomina³ o nim Balor...
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_05"); //Dobra robota. Wkrótce wyœlê do niego pierwsz¹ dostawê.
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_06"); //W porz¹dku. Szukajcie go w karczmie na jeziorze. 
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_07"); //Bêdê siê z tob¹ dzieli³ zyskami raz w tygodniu.
    B_LogEntry               (CH1_NewWeed,"Przekaza³em mojemu zleceniodawcy informacjê o Szkodniku, imieniem Cipher. Davson dotrzyma³ swojej czêœci umowy i obieca³, ¿e bêdzie mi raz w tygodniu wyp³aca³ czêœæ zysków.");
    Log_SetTopicStatus       (CH1_NewWeed, LOG_SUCCESS);
    MIS_NewWeed = LOG_SUCCESS;

    B_GiveXP (180);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Dealer_Kagan
//========================================

INSTANCE DIA_Novize_Dealer_Kagan (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_Dealer_Kagan_Condition;
   information  = DIA_Novize_Dealer_Kagan_Info;
   permanent	= FALSE;
   description	= "Znalaz³em kupca.";
};

FUNC INT DIA_Novize_Dealer_Kagan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_SkrzynaPelna))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Dealer_Kagan_Info()
{
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_01"); //Znalaz³em kupca.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_03"); //To Baal Kagan, handlarz zielem z Nowego Obozu.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_04"); //Czym go przekupi³eœ? Wiele razy probowaliœmy mu sprzedaæ nasze ziele. Bezskutecznie.
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_05"); //Podmieni³em ziele z jego skrzyni na nasze. Przez przypadek je wypali³ i by³ zachwycony.
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_06"); //Bêdzie nam p³aci³ 35 bry³ek rudy za sztukê.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_07"); //Œwietna robota. Bêdê siê z tob¹ dzieli³ zyskami raz w tygodniu.
    B_LogEntry                     (CH1_NewWeed,"Davson wielce siê uradowa³, gdy us³ysza³, ¿e znalaz³em kupca na jego skrêty. Raz w tygodniu mam siê zg³aszaæ po moj¹ dzia³kê.");
    Log_SetTopicStatus       (CH1_NewWeed, LOG_SUCCESS);
    MIS_NewWeed = LOG_SUCCESS;

    B_GiveXP (190);
    AI_StopProcessInfos	(self);
	day = wld_getday();
};


//========================================
//-----------------> KasaKasa
//========================================

INSTANCE DIA_Novize_KasaKasa (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_KasaKasa_Condition;
   information  = DIA_Novize_KasaKasa_Info;
   permanent	= true;
   description	= "Przyszed³em po moj¹ dzia³kê.";
};

FUNC INT DIA_Novize_KasaKasa_Condition()
{
    if (MIS_NewWeed == LOG_SUCCESS)
    && (Wld_GetDay () - day >= 7)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_KasaKasa_Info()
{
	var int lucky; lucky = Hlp_Random(150);
    AI_Output (other, self ,"DIA_Novize_KasaKasa_15_01"); //Przyszed³em po moj¹ dzia³kê. Ile uda³o ci siê zarobiæ?
	if (kapitel < 4)
	{
    AI_Output (self, other ,"DIA_Novize_KasaKasa_03_02"); //Oto twoja dola po przeliczeniach. Proszê bardzo! Pamiêtaj, ¿e nie zawsze udaje siê du¿o zarobiæ.
	
    CreateInvItems (self, ItMiNugget, lucky);
    B_GiveInvItems (self, other, ItMiNugget, lucky);
    //CreateInvItems (self, MegaJoint, 2);
    //B_GiveInvItems (self, other, MegaJoint, 2);
    day = wld_getday();
    
	}
	else
	{
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_03"); //Nic ju¿ raczej nie dostaniesz. Wstrzyma³em dzia³alnoœæ. 
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_04"); //To co siê dzieje w kolonii nie sprzyja interesom, sam wiesz. 
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_05"); //Ma³o kto, chce siê wybieraæ w podró¿ na drug¹ czêœæ kolonii, ¿eby dostarczyæ skrêty.
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_06"); //Wszêdzie krêc¹ siê ci mordercy ze Starego Obozu.
	AI_Output (other, self ,"DIA_Novize_KasaKasa_15_07"); //No có¿, mi³o by³o...
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_08"); //Dok³adnie, ale ju¿ po wszystkim.
	};
	
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Novize_HELLO1 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_HELLO1_Condition;
   information  = DIA_Novize_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Novize_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_02"); //Jestem Davson - Nowicjusz pierwszego stopnia.
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_03"); //Czym siê tu zajmujesz?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_04"); //Nie powinno ciê to obchodziæ. W ogóle daj mi spokój, nie po to do³¹czy³em do Bractwa, aby u¿eraæ siê z ¿ó³todziobami.
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_05"); //Gdybym chcia³ siê z nimi mêczyæ, to zosta³bym w Starym Obozie. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Novize_HELLO2 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_HELLO2_Condition;
   information  = DIA_Novize_HELLO2_Info;
   permanent	= FALSE;
   description	= "A wiêc by³eœ Kopaczem?";
};

FUNC INT DIA_Novize_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO2_15_01"); //A wiêc by³eœ Kopaczem?
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_02"); //Taa... Ale nie mia³em tam lekkiego ¿ycia.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_03"); //Stra¿nicy, z Bloodwynem na czele, ca³y czas okradali mnie z rudy i usi³owali siê nade mn¹ znêcaæ.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_04"); //Nie mówi¹c ju¿ o tych cwaniaczkach Cieniach. Uczciwoœci¹ to oni nie grzesz¹.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_05"); //Ca³e szczêœcie, ¿e pozna³em Baal Parveza, który wtajemniczy³ mnie w sprawy Bractwa.
};
//========================================
//-----------------> ImportantAngry
//========================================

INSTANCE DIA_Novize_ImportantAngry (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_ImportantAngry_Condition;
   information  = DIA_Novize_ImportantAngry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Novize_ImportantAngry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_Kapus1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_ImportantAngry_Info()
{
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_01"); //Ty pieprzony sukinsynie! Wyda³eœ nas!
    AI_Output (other, self ,"DIA_Novize_ImportantAngry_15_02"); //Spokojnie. Popracujecie trochê w winnicy. Nic wam siê nie stanie.
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_03"); //IdŸ precz! ZjedŸ mi z oczu! 
    AI_StopProcessInfos	(self);
};

// *Script was make in Easy Dialog Maker (EDM)

///////////////////////////
// KALOM
//////////////////////////

//========================================
//-----------------> Kapus1
//========================================

INSTANCE DIA_CorKalom_Kapus1 (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_Kapus1_Condition;
   information  = DIA_CorKalom_Kapus1_Info;
   permanent	= FALSE;
   description	= "Nowicjusze sprzedaj¹ przerobione ziele.";
};

FUNC INT DIA_CorKalom_Kapus1_Condition()
{
    if (MIS_NewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_Kapus1_Info()
{
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_01"); //Nowicjusze sprzedaj¹ przerobione ziele.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_02"); //Jacy Nowicjusze?
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_03"); //Ci mieszkaj¹cy nieopodal twojej chaty.
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_04"); //W swoich domach maj¹ laboratoria, w których wyrabiaj¹ nowe odmiany ziela.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_05"); //Ceniê sobie dobrych kapusiów.
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	Npc_ExchangeRoutine (NOV_1324_Novize,"wino");
	Npc_ExchangeRoutine (NOV_1323_Novize,"work");

    B_LogEntry                     (CH1_NewWeed,"Poinformowa³em Cor Kaloma o nielegalnej produkcji ziela przez Davsona. Takie dzia³ania nie powinny mieæ racji bytu.");
    Log_SetTopicStatus       (CH1_NewWeed, LOG_FAILED);
    MIS_NewWeed = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Nowe, mocne ziele! ", 1,-1,"font_new_10_red.tga",2);	
	
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Novize_HowAreYou (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 3;
   condition    = DIA_Novize_HowAreYou_Condition;
   information  = DIA_Novize_HowAreYou_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_Novize_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Novize_HowAreYou_15_01"); //Jak leci?
    if (Npc_KnowsInfo (hero, DIA_Novize_ImportantAngry))
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_02"); //Nie wkurzaj mnie, koleœ!
    }
    else
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_03"); //By³o dobrze, dopóki nie przyszed³eœ...
    };
    AI_StopProcessInfos	(self);
};

