// **************************************************
//						 EXIT 
// **************************************************

instance DIA_319_Hernin_Exit (C_INFO)
{
	npc				= STT_319_Schatten;
	nr				= 999;
	condition		= DIA_319_Hernin_Exit_Condition;
	information		= DIA_319_Hernin_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_319_Hernin_Exit_Condition()
{
	return 1;
};

func VOID DIA_319_Hernin_Exit_Info()
{
	AI_StopProcessInfos(self);
};

 //OCR_OUTSIDE_HUT_47_SMALT1 PARVEZ_ENEMY1
instance DIA_319_Schatten_Caught(C_INFO)
{
	npc				= STT_319_Schatten;
	nr				= 1;
	condition		= DIA_319_Schatten_Caught_Condition;
	information		= DIA_319_Schatten_Caught_Info;
	important 		= TRUE;
	permanent		= 0;
};                       

FUNC INT DIA_319_Schatten_Caught_Condition()
{
	if Npc_KnowsInfo (hero, DIA_BaalParvez_RumorAnnounced) && (MIS_ParvezInTroubles == LOG_RUNNING)  && (Npc_GetDistToWP (self, "PARVEZ_ENEMY1") < 500)  && (Wld_IsTime     (23,30,03,30))
	{
	return 1;
	};
};

func VOID DIA_319_Schatten_Caught_Info()
{
	AI_Output(self, other, "DIA_319_Schatten_Caught_04_00"); //Patrzcie, kolejny nawiedzony sekciarz. Je�li nie chcesz, by�my obili te twoj� o�wiecon� g��wk�, to odsu� si�!
	AI_Output(other, self, "DIA_319_Schatten_Caught_15_01"); //�apy precz od tego kufra!
	AI_Output(self, other, "DIA_319_Schatten_Caught_04_02"); //A wi�c chcesz oberwa�?! O�wiecony prosi to o�wiecony dostanie. Bra� go!
	CreateInvItems (self, ItMi_Bloodwyns_Order, 1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");
	
	Npc_SetTarget(VLK_576_Buddler, other);
	AI_StartState(VLK_576_Buddler, ZS_Attack, 1, "");
	
	Npc_SetTarget(VLK_510_Buddler, other);
	AI_StartState(VLK_510_Buddler, ZS_Attack, 1, "");
};

instance DIA_319_Schatten_WasDefeatByHero(C_INFO)
{
	npc			= STT_319_Schatten;
	nr			= 3;
	condition	= DIA_319_Schatten_WasDefeatByHero_Condition;
	information	= DIA_319_Schatten_WasDefeatByHero_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_319_Schatten_WasDefeatByHero_Condition()
{
	VAR C_NPC shadow;
	shadow = Hlp_GetNpc(STT_319_Schatten);
	
	if ((shadow.aivar[AIV_WASDEFEATEDBYSC] >= 1) && Npc_HasItems(other, ItMi_Bloodwyns_Order))
	{
		return 1;
	};
};

FUNC VOID DIA_319_Schatten_WasDefeatByHero_Info()
{
	AI_Output(other, self, "DIA_319_Schatten_WasDefeatByHero_15_00"); //A teraz precz st�d!
	AI_Output(self, other, "DIA_319_Schatten_WasDefeatByHero_04_01"); //Aaa... My tylko wykonywali�my rozkazy.
	AI_Output(other, self, "DIA_319_Schatten_WasDefeatByHero_15_02"); //Dzi�ki twojej karteczce dowiem si� wszystkiego, czego chcia�em.
	
	AI_StopProcessInfos(self);
	
	B_LogEntry(CH1_ParvezInTroubles, "Pokona�em z�odziejaszk�w i znalaz�em kartk� z rozkazami od jakiego� Stra�nika.");
	
	Npc_ExchangeRoutine (STT_319_Schatten,"start");
	Npc_ExchangeRoutine (VLK_576_Buddler,"start");
	Npc_ExchangeRoutine (VLK_510_Buddler,"start");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_319_Hernin_HELLO1 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 1;
   condition    = DIA_319_Hernin_HELLO1_Condition;
   information  = DIA_319_Hernin_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co� ty za jeden?";
};

FUNC INT DIA_319_Hernin_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_319_Hernin_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO1_15_01"); //Co� ty za jeden?
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_02"); //Jestem Hernin. Zanim tu trafi�em, by�em �o�nierzem, a raczej dezerterem. Mi i moim kumplom niezbyt u�miecha�o walczy� w �niegu z zielonosk�rymi, wi�c opu�cili�my oddzia�. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_03"); //Jako zbiegowie z armii nie mogli�my powr�ci� do dom�w. Przez kilka miesi�cy w��czyli�my si� po lasach, korzystaj�c z hojno�ci kupc�w, kt�rzy posk�pili na porz�dn� eskort�. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_04"); //W ko�cu jednak stra� nas namierzy�a. Pewnie i tak pr�dzej, czy p�niej trafi�bym do Kolonii, bo nasz wspania�y kr�l na potrzeby wojny postanowi� zape�ni� tutejsze kopalnie zes�anymi za b�ahostki skaza�cami. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_05"); //Dzi�ki przygodom z kupcami, nabra�em nieco do�wiadczenia. Gdyby nie to, w Kolonii by�bym pewnie Kopaczem, czy innym �achmyt�. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_319_Hernin_HELLO2 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 2;
   condition    = DIA_319_Hernin_HELLO2_Condition;
   information  = DIA_319_Hernin_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chc� zosta� Cieniem.";
};

FUNC INT DIA_319_Hernin_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO1))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO2_15_01"); //Chc� zosta� Cieniem.
    AI_Output (self, other ,"DIA_319_Hernin_HELLO2_03_02"); //I pewnie b�dziesz chcia� �ebym ci� popar�? Ka�dy Cie� powinien zna� si� na pewnych rzeczach - to kwestia honoru Cienia. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_319_Hernin_HELLO3 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 3;
   condition    = DIA_319_Hernin_HELLO3_Condition;
   information  = DIA_319_Hernin_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�? ";
};

FUNC INT DIA_319_Hernin_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO3_15_01"); //Mo�esz mnie czego� nauczy�? 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_02"); //Dlaczego nie? M�g�bym ci� nauczy� umiej�tno�ci z�odziejskich.
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_03"); //Wbrew pozorom okradanie innych nie jest wcale takie skomplikowane. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_04"); //Je�eli chcesz kogo� okra��, to uderzasz go w �eb, a potem okradasz. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_05"); //Nad��asz? 
    AI_Output (other, self ,"DIA_319_Hernin_HELLO3_15_06"); //Tak, ale no nie wiem. My�la�em, �e nauczysz mnie bardziej finezyjnych sztuczek. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_07"); //Ciesz si�, bo to by�a ostatnia rzecz jak� dosta�e� w Kolonii G�rniczej za darmo. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_08"); //Tutaj wszystko ma swoj� cen�. 
};

//========================================
//-----------------> Diego
//========================================

INSTANCE DIA_319_Hernin_Diego (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 1;
   condition    = DIA_319_Hernin_Diego_Condition;
   information  = DIA_319_Hernin_Diego_Info;
   permanent	= FALSE;
   description	= "Czy mog� liczy� na twoje poparcie u Diega?";
};

FUNC INT DIA_319_Hernin_Diego_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO2))
    && (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_Diego_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_Diego_15_01"); //Czy mog� liczy� na twoje poparcie u Diega?
    AI_Output (self, other ,"DIA_319_Hernin_Diego_03_02"); //Czy naprawd� niczego si� nie nauczy�e�?
    AI_Output (self, other ,"DIA_319_Hernin_Diego_03_03"); //Wida� �le ci� oceni�em...
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_319_Hernin_HowAreYou (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 2;
   condition    = DIA_319_Hernin_HowAreYou_Condition;
   information  = DIA_319_Hernin_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_319_Hernin_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_319_Hernin_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HowAreYou_15_01"); //Co s�ycha�?
	
    if (Npc_KnowsInfo (hero, DIA_319_Schatten_WasDefeatByHero))
	{
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_02"); //Mam nadziej�, �e zapomnia�e� ju� o naszej ma�ej sprzeczce. 
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_03"); //Bloodwyn nie�le si� wtedy w�ciek�. Nie chc� k�opot�w.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_BAU) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD)
    {
     AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_04"); //My�lisz, �e nie wiem kim jeste�? Wracaj do swoich kole�k�w. 
    }
    else if (Npc_GetTrueGuild(hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_05"); //Widz�, �e jednak czego� si� tu nauczy�e�. To dobrze, potrzebujemy ludzi, kt�rzy maj� g�ow� na w�a�ciwym miejscu. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_06"); //Witaj w�r�d nas, przyjacielu!
    }
    else if (Npc_GetTrueGuild(hero) == GIL_GRD)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_07"); //S�u�ba w�r�d Cieni to dobra szko�a �ycia. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_08"); //Ale teraz zosta�e� Stra�nikiem, lecz mam nadziej�, �e nie zapomnisz kim by�e� wcze�niej. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_09"); //Powodzenia, kolego. 
    }
    else if (Npc_GetTrueGuild(hero) == GIL_KDF)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_10"); //Zosta�e� Magiem Ognia? (�miech) 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_11"); //Wygl�da na to, �e kap�ani Innosa nawet w�r�d skaza�c�w potrafi� znale�� �wi�toszk�w.
    }
	else 
	{
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_12"); //To zale�y gdzie przy�o�y� ucho. Na razie panuje wzgl�dny spok�j.
	};
};


