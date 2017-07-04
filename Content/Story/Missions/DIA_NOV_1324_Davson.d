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
    AI_Output (self, other ,"DIA_Novize_Quest123_03_01"); //Hej, ty. Wygl�dasz na kogo�, kto chcia�by sobie dorobi�.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_03"); //Pomo�esz nam.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_04"); //Niby w czym?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_05"); //Troch� eksperymentowali�my i uda�o nam si� stworzy� nowy rodzaj skr�ta. Jest bardzo mocny, a wcale nie zu�ywamy wi�cej bagiennego ziela do jego produkcji.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_06"); //Z pewno�ci� sporo mo�na na tym zarobi�. Podzielimy si� z tob� zyskami, je�eli za�atwisz nam handlarza.
	AI_Output (other, self ,"DIA_Novize_Quest123_15_07"); //Czy wynik waszego eksperymentu nie powinien czasem trafi� do Cor Kaloma?
	AI_Output (self, other ,"DIA_Novize_Quest123_03_08"); //Chcesz na nas donie��? Mistrz Kalom nie musi o niczym wiedzie�.
	AI_Output (self, other ,"DIA_Novize_Quest123_03_09"); //Masz tu cztery "pr�bki". Tylko nie wypal wszystkiego. Zostaw co� dla naszego przysz�ego wsp�lnika.
	
	CreateInvItems (self, MegaJoint, 4);
    B_GiveInvItems (self, other, MegaJoint, 4);
	
    MIS_NewWeed = LOG_RUNNING;	
	Log_CreateTopic          (CH1_NewWeed, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NewWeed, LOG_RUNNING);
    B_LogEntry               (CH1_NewWeed,"Nowicjusz Davson opracowa� nowy rodzaj skr�ta. Uwa�a, �e mo�na na nim sporo zarobi�. Podzieli si� ze mn� zyskami, je�eli znajd� jakiego� kupca na jego towar.");
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
   description	= "Gdzie niby mia�bym znale�� kupc�w?";
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
    AI_Output (other, self ,"DIA_Novize_Kupcy_15_01"); //Gdzie niby mia�bym znale�� kupc�w?
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_02"); //Hmmm... Najwi�kszy skup jest w Nowym Obozie. Powiniene� tam zajrze�.
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_03"); //Mo�e dogadasz si� z jakim� Baalem. Spr�buj mu udowodni�, �e nasz towar warto sprzeda�.
	AI_Output (self, other ,"DIA_Novize_Kupcy_03_04"); //Mo�esz te� poszuka� w Starym Obozie.
    AI_Output (self, other ,"DIA_Novize_Kupcy_03_05"); //Tylko pami�taj o dyskrecji. 
	
    B_LogEntry                     (CH1_NewWeed,"Davson stwierdzi�, �e najlepiej przekona� kogo� w Nowym Obozie. Powinienem pogada� z kt�rym� z tamtych handlarzy.");
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
   description	= "Znalaz�em kupca.";
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
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_01"); //Znalaz�em kupca.
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_03"); //Niejaki Cipher, Szkodnik z Nowego Obozu. Ma spore do�wiadczenie.
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_04"); //Gdzie� ju� s�ysza�em to imi�. Mam wra�enie, �e wspomina� o nim Balor...
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_05"); //Dobra robota. Wkr�tce wy�l� do niego pierwsz� dostaw�.
    AI_Output (other, self ,"DIA_Novize_Dealer_Cipher_15_06"); //W porz�dku. Szukajcie go w karczmie na jeziorze. 
    AI_Output (self, other ,"DIA_Novize_Dealer_Cipher_03_07"); //B�d� si� z tob� dzieli� zyskami raz w tygodniu.
    B_LogEntry               (CH1_NewWeed,"Przekaza�em mojemu zleceniodawcy informacj� o Szkodniku, imieniem Cipher. Davson dotrzyma� swojej cz�ci umowy i obieca�, �e b�dzie mi raz w tygodniu wyp�aca� cz�� zysk�w.");
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
   description	= "Znalaz�em kupca.";
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
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_01"); //Znalaz�em kupca.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_03"); //To Baal Kagan, handlarz zielem z Nowego Obozu.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_04"); //Czym go przekupi�e�? Wiele razy probowali�my mu sprzeda� nasze ziele. Bezskutecznie.
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_05"); //Podmieni�em ziele z jego skrzyni na nasze. Przez przypadek je wypali� i by� zachwycony.
    AI_Output (other, self ,"DIA_Novize_Dealer_Kagan_15_06"); //B�dzie nam p�aci� 35 bry�ek rudy za sztuk�.
    AI_Output (self, other ,"DIA_Novize_Dealer_Kagan_03_07"); //�wietna robota. B�d� si� z tob� dzieli� zyskami raz w tygodniu.
    B_LogEntry                     (CH1_NewWeed,"Davson wielce si� uradowa�, gdy us�ysza�, �e znalaz�em kupca na jego skr�ty. Raz w tygodniu mam si� zg�asza� po moj� dzia�k�.");
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
   description	= "Przyszed�em po moj� dzia�k�.";
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
    AI_Output (other, self ,"DIA_Novize_KasaKasa_15_01"); //Przyszed�em po moj� dzia�k�. Ile uda�o ci si� zarobi�?
	if (kapitel < 4)
	{
    AI_Output (self, other ,"DIA_Novize_KasaKasa_03_02"); //Oto twoja dola po przeliczeniach. Prosz� bardzo! Pami�taj, �e nie zawsze udaje si� du�o zarobi�.
	
    CreateInvItems (self, ItMiNugget, lucky);
    B_GiveInvItems (self, other, ItMiNugget, lucky);
    //CreateInvItems (self, MegaJoint, 2);
    //B_GiveInvItems (self, other, MegaJoint, 2);
    day = wld_getday();
    
	}
	else
	{
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_03"); //Nic ju� raczej nie dostaniesz. Wstrzyma�em dzia�alno��. 
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_04"); //To co si� dzieje w kolonii nie sprzyja interesom, sam wiesz. 
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_05"); //Ma�o kto, chce si� wybiera� w podr� na drug� cz�� kolonii, �eby dostarczy� skr�ty.
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_06"); //Wsz�dzie kr�c� si� ci mordercy ze Starego Obozu.
	AI_Output (other, self ,"DIA_Novize_KasaKasa_15_07"); //No c�, mi�o by�o...
	AI_Output (self, other ,"DIA_Novize_KasaKasa_03_08"); //Dok�adnie, ale ju� po wszystkim.
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Novize_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_02"); //Jestem Davson - Nowicjusz pierwszego stopnia.
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_03"); //Czym si� tu zajmujesz?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_04"); //Nie powinno ci� to obchodzi�. W og�le daj mi spok�j, nie po to do��czy�em do Bractwa, aby u�era� si� z ��todziobami.
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_05"); //Gdybym chcia� si� z nimi m�czy�, to zosta�bym w Starym Obozie. 
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
   description	= "A wi�c by�e� Kopaczem?";
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
    AI_Output (other, self ,"DIA_Novize_HELLO2_15_01"); //A wi�c by�e� Kopaczem?
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_02"); //Taa... Ale nie mia�em tam lekkiego �ycia.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_03"); //Stra�nicy, z Bloodwynem na czele, ca�y czas okradali mnie z rudy i usi�owali si� nade mn� zn�ca�.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_04"); //Nie m�wi�c ju� o tych cwaniaczkach Cieniach. Uczciwo�ci� to oni nie grzesz�.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_05"); //Ca�e szcz�cie, �e pozna�em Baal Parveza, kt�ry wtajemniczy� mnie w sprawy Bractwa.
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
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_01"); //Ty pieprzony sukinsynie! Wyda�e� nas!
    AI_Output (other, self ,"DIA_Novize_ImportantAngry_15_02"); //Spokojnie. Popracujecie troch� w winnicy. Nic wam si� nie stanie.
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_03"); //Id� precz! Zjed� mi z oczu! 
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
   description	= "Nowicjusze sprzedaj� przerobione ziele.";
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
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_01"); //Nowicjusze sprzedaj� przerobione ziele.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_02"); //Jacy Nowicjusze?
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_03"); //Ci mieszkaj�cy nieopodal twojej chaty.
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_04"); //W swoich domach maj� laboratoria, w kt�rych wyrabiaj� nowe odmiany ziela.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_05"); //Ceni� sobie dobrych kapusi�w.
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	Npc_ExchangeRoutine (NOV_1324_Novize,"wino");
	Npc_ExchangeRoutine (NOV_1323_Novize,"work");

    B_LogEntry                     (CH1_NewWeed,"Poinformowa�em Cor Kaloma o nielegalnej produkcji ziela przez Davsona. Takie dzia�ania nie powinny mie� racji bytu.");
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
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_02"); //Nie wkurzaj mnie, kole�!
    }
    else
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_03"); //By�o dobrze, dop�ki nie przyszed�e�...
    };
    AI_StopProcessInfos	(self);
};

