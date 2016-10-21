//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Joel_EXIT(C_INFO)
{
	npc             = GRD_7006_Joel;
	nr              = 999;
	condition		= DIA_Joel_EXIT_Condition;
	information		= DIA_Joel_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Joel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Joel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Joel_HELLO1 (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 1;
   condition    = DIA_Joel_HELLO1_Condition;
   information  = DIA_Joel_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Joel_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Joel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Joel_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Joel_HELLO1_03_02"); //Nazywam siê Joel. Jestem Stra¿nikiem. Pilnujê, aby Kopacze nie uciekali z obozu, albo nie podkradali rzeczy Stra¿nikom.
	AI_Output (other, self ,"DIA_Joel_HELLO1_15_03"); //Czyli dbasz tu o porz¹dek?
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_04"); //Dok³adnie. Na szczêœcie nie dzieje siê nic ciekawego, wiêc mogê odpocz¹æ. Poza mn¹ stró¿uje jeszcze Artch, ale to w tamtej czêœci obozu. Przy wejœciu. 
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_05"); //Artegor z kolei decyduje o tym, kto mo¿e wejœæ za palisadê, Spike pilnuje rudy, a Matt to po prostu nasz kucharz. 
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_06"); //Chyba przedstawi³em ci ca³¹ obsadê.
};
/*
//========================================
//-----------------> WEJSCIE
//========================================

INSTANCE DIA_Joel_WEJSCIE (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 2;
   condition    = DIA_Joel_WEJSCIE_Condition;
   information  = DIA_Joel_WEJSCIE_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mi pomóc wejœæ do kopalni?";
};

FUNC INT DIA_Joel_WEJSCIE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_WEJSCIE))
    && (GoToOM == false)
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joel_WEJSCIE_Info()
{
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_01"); //Mo¿esz mi pomóc wejœæ do kopalni?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_02"); //Chcesz byæ Kopaczem? Có¿... Si³y roboczej nigdy za wiele.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_03"); //Bycie Kopaczem to tylko etap przejœciowy. Szybko dostanê siê w szeregi Cieni.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_04"); //Bêdziesz potrzebowa³ naprawdê du¿o sprytu i szczêœcia.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_05"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_06"); //¯eby wypuœcili ciê z kopalni, bêdziesz musia³ siê naprawdê nachodziæ.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_07"); //Ka¿dy Kopacz musi wykopaæ pewn¹ iloœæ rudy.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_08"); //Potem drobnymi przys³ugami bêdziesz musia³ wyrobiæ sobie dobr¹ opiniê wœród Stra¿ników.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_09"); //Gdy ju¿ bêd¹ dostatecznie dobrze "zmiêkczeni", to pozwol¹ ci wróciæ do obozu.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_10"); //Gamal mówi³, ¿e to bêdzie ³atwiejsze...
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_11"); //Pewnie, ¿e jest! Noszenie piwa Stra¿nikom jest chyba ³atwiejsze ni¿ porz¹dkowanie interesów Cieni ze Starego Obozu.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_12"); //Pewnie masz racjê. Wracaj¹c do tematu, co mogê dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_13"); //Daj mi 50 bry³ek rudy i pogadam z Artegorem.
    MIS_RudaJoelowiOM = LOG_RUNNING;

    Log_CreateTopic          (CH1_RudaJoelowiOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RudaJoelowiOM, LOG_RUNNING);
    B_LogEntry               (CH1_RudaJoelowiOM,"Za 50 bry³ek rudy Joel porozmawia o mnie z Artegorem.");
};

//========================================
//-----------------> RUDA
//========================================

INSTANCE DIA_Joel_RUDA (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 3;
   condition    = DIA_Joel_RUDA_Condition;
   information  = DIA_Joel_RUDA_Info;
   permanent	= FALSE;
   description	= "Mam 50 bry³ek.";
};

FUNC INT DIA_Joel_RUDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Joel_WEJSCIE)) && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joel_RUDA_Info()
{
    AI_Output (other, self ,"DIA_Joel_RUDA_15_01"); //Mam 50 bry³ek.
    AI_Output (self, other ,"DIA_Joel_RUDA_03_02"); //Dziêki. Pogadam z Artegorem.
	
    B_LogEntry                     (CH1_RudaJoelowiOM,"Odda³em rudê Joelowi, który zagada do Artegora.");
    Log_SetTopicStatus       (CH1_RudaJoelowiOM, LOG_SUCCESS);
    MIS_RudaJoelowiOM = LOG_SUCCESS;
	OpinionOM = OpinionOM + 1; 
	
	B_GiveInvItems (other, self, ItMiNugget, 50);
    B_GiveXP (30);
	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
	PrintScreen	("Opinia w obozie +1", -1,46,"FONT_OLD_20_WHITE.TGA",2);
	};
};
*/
//========================================
//-----------------> LECI
//========================================

INSTANCE DIA_Joel_LECI (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 4;
   condition    = DIA_Joel_LECI_Condition;
   information  = DIA_Joel_LECI_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Joel_LECI_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Joel_LECI_Info()
{
    AI_Output (other, self ,"DIA_Joel_LECI_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Joel_LECI_15_02"); //NieŸle. Tak jak mówi³em mam ma³o pracy.
};
/*
//========================================
//-----------------> PEOPLE
//========================================

INSTANCE DIA_Joel_PEOPLE (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 5;
   condition    = DIA_Joel_PEOPLE_Condition;
   information  = DIA_Joel_PEOPLE_Info;
   permanent	= false; 
   description	= "Mo¿esz mi coœ opowiedzieæ o ludziach z obozu?";
};

FUNC INT DIA_Joel_PEOPLE_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Joel_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Joel_PEOPLE_Info()
{
    AI_Output (other, self ,"DIA_Joel_PEOPLE_15_01"); //Mo¿esz mi coœ opowiedzieæ o ludziach z obozu?
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_02"); //Co tu du¿o mówiæ. Przede wszystkim nie zadzieraj z Artegorem.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_03"); //To on jest odpowiedzialny za to, kto wchodzi do kopalni.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_04"); //Lepiej mieæ go za przyjaciela.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_05"); //Nasz obozowy kucharz tak¿e ma spore wp³ywy. Mo¿esz siê udaæ do niego po racjê ¿ywnoœciow¹.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_06"); //Reszta to Stra¿nicy lub Kopacze. Je¿eli ostro¿nie wypytasz, to dowiesz siê od nich wielu ciekawych rzeczy.
};
*/
//========================================
//-----------------> Wazne
//========================================

INSTANCE DIA_Joel_Wazne (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 6;
   condition    = DIA_Joel_Wazne_Condition;
   information  = DIA_Joel_Wazne_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Joel_Wazne_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Spike_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joel_Wazne_Info()
{
    AI_Output (self, other ,"DIA_Joel_Wazne_03_01"); //Uwa¿aj na Spike'a. Ostatnio zrobi³ siê dosyæ nerwowy.
    AI_Output (other, self ,"DIA_Joel_Wazne_15_02"); //Dlaczego?
    AI_Output (self, other ,"DIA_Joel_Wazne_03_03"); //Kilku Kopaczy w obozie ci¹gle robi sobie z niego ¿arty.
    AI_Output (self, other ,"DIA_Joel_Wazne_03_04"); //Spike ju¿ dawno pokaza³by im, gdzie raki zimuj¹, ale Artegor surowo zabroni³ biæ Kopaczy.
    AI_Output (self, other ,"DIA_Joel_Wazne_03_05"); //Wiesz... wtedy wolniej pracuj¹.
    AI_Output (other, self ,"DIA_Joel_Wazne_15_06"); //Mo¿e móg³bym mu jakoœ pomóc?
    AI_Output (self, other ,"DIA_Joel_Wazne_03_07"); //Gdyby uda³o ci siê jakoœ wp³yn¹æ na Kopaczy...
    MIS_SpikeLoser = LOG_RUNNING;

    Log_CreateTopic          (CH1_SpikeLoser, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SpikeLoser, LOG_RUNNING);
    B_LogEntry               (CH1_SpikeLoser,"Joel opowiedzia³ mi o problemie Spike'a. Stra¿nik jest obiektem drwin Kopaczy z obozu. Muszê znaleŸæ kogoœ, kto wp³ynie na robotników.");
};

// **************************************************
//						JoshDie
// **************************************************

instance DIA_Joel_JoshDie(C_INFO)
{
	npc				= GRD_7006_Joel;
	nr				= 1;
	condition		= DIA_Joel_JoshDie_Condition;
	information		= DIA_Joel_JoshDie_Info;
	permanent		= 0;
	important	 	= 1;
};                       

FUNC INT DIA_Joel_JoshDie_Condition()
{
	if MIS_OreInOM == LOG_RUNNING && ((Npc_KnowsInfo (hero, DIA_Hysen_Fight)) || (Npc_HasItems (other, itmi_joshpocket) >=1) )
	{
	return 1;
	};
};

func VOID DIA_Joel_JoshDie_Info()
{
	AI_Output (self, other,"DIA_Joel_JoshDie_04_01"); //Hej. Okaza³o siê, ¿e twój kumpel to brudny bandzior. Do tego na tyle bezczelny, ¿e zbiera³ haracze w Kopalni.
	AI_Output (self, other,"DIA_Joel_JoshDie_04_02"); //Na szczêœcie ju¿ siê z nim rozprawiliœmy. Uwa¿a, z kim siê zadajesz. Bywaj.
	
	B_LogEntry               (CH1_OreInOM,"Podczas mojej nieobecnoœci Stra¿nicy zabili Josha. Muszê wróciæ do Draxa. Nie widzê innego wyjœcia.");
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

//========================================
// Zadanie "Skarb dla stra¿nika"
//========================================

INSTANCE DIA_Joel_AskAboutTreasure (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 2;
   condition    = DIA_Joel_AskAboutTreasure_Condition;
   information  = DIA_Joel_AskAboutTreasure_Info;
   permanent	= FALSE;
   description	= "S³ysza³em, ¿e twój wuj przed œmierci¹ zgromadzi³ trochê bogactw...";
};

FUNC INT DIA_Joel_AskAboutTreasure_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Santino_CraigsNephew))
   {
		return TRUE;
   };
};

FUNC VOID DIA_Joel_AskAboutTreasure_Info()
{
   AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_00"); //S³ysza³em, ¿e twój wuj przed œmierci¹ zgromadzi³ trochê bogactw...
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_01"); //W takim razie Ÿle s³ysza³eœ! Kto ci coœ takiego powiedzia³?
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_02"); //Niewa¿ne.
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_03"); //Mów!
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_04"); //Kilka osób... S¹dz¹c po twojej reakcji nie s¹ to puste informacje.
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_05"); //Ten skarb nigdy nie istnia³! A nawet gdyby te bajki nie by³y zmyœlone, to i tak nie powiedzia³bym o nim ani s³owa!
	AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_06"); //Nie pozwolê, aby pozosta³oœci po moich przodkach zosta³y wymienione na gorza³ê przez kilku brudasów!
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_07"); //No dobrze, dobrze. Zapomnijmy o tej rozmowie. 
	
	B_LogEntry(CH2_TreasureOldGuard, "Od Joela niczego siê nie dowiedzia³em konkretnego. Coœ musi byæ na rzeczy. Stra¿nik by³ bardzo nerwowy.");
};

//========================================
//-----------------> GoAwayIdiot
//========================================

INSTANCE DIA_Joel_GoAwayIdiot (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 1;
   condition    = DIA_Joel_GoAwayIdiot_Condition;
   information  = DIA_Joel_GoAwayIdiot_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Joel_GoAwayIdiot_Condition()
{
    if (Npc_GetDistToWP (self, "OW_JOELAWAY") < 500)
    && (MIS_TreasureOldGuard == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joel_GoAwayIdiot_Info()
{
    AI_Output (self, other ,"DIA_Joel_GoAwayIdiot_03_01"); //Czego tu szukasz?! Nie ³aŸ za mn¹!
    AI_Output (self, other ,"DIA_Joel_GoAwayIdiot_03_02"); //Cholera, spadam st¹d!
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

INSTANCE DIA_Joel_LostTreasureMap (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 2;
   condition    = DIA_Joel_LostTreasureMap_Condition;
   information  = DIA_Joel_LostTreasureMap_Info;
   permanent	= FALSE;
	important = TRUE;
};

FUNC INT DIA_Joel_LostTreasureMap_Condition()
{
   if (MIS_TreasureOldGuard == LOG_SUCCESS)
   {
		return TRUE;
   };
};

FUNC VOID DIA_Joel_LostTreasureMap_Info()
{
   AI_Output(self, other, "DIA_Joel_LostTreasureMap_04_00"); //Nie ma jej, nie ma, przecie¿ j¹ ukry³em!
	AI_Output(other, self, "DIA_Joel_LostTreasureMap_15_01"); //O czym ty mówisz?
   AI_Output(self, other, "DIA_Joel_LostTreasureMap_04_02"); //Niewa¿ne. Straci³em honor, w³asny i mojej rodziny!
	AI_Output(other, self, "DIA_Joel_LostTreasureMap_15_03"); //Có¿... Powodzenia stary.
	
	AI_StopProcessInfos (self);
};