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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Joel_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Joel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Joel_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Joel_HELLO1_03_02"); //Nazywam si� Joel. Jestem Stra�nikiem. Pilnuj�, aby Kopacze nie uciekali z obozu, albo nie podkradali rzeczy Stra�nikom.
	AI_Output (other, self ,"DIA_Joel_HELLO1_15_03"); //Czyli dbasz tu o porz�dek?
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_04"); //Dok�adnie. Na szcz�cie nie dzieje si� nic ciekawego, wi�c mog� odpocz��. Poza mn� str�uje jeszcze Artch, ale to w tamtej cz�ci obozu. Przy wej�ciu. 
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_05"); //Artegor z kolei decyduje o tym, kto mo�e wej�� za palisad�, Spike pilnuje rudy, a Matt to po prostu nasz kucharz. 
	AI_Output (self, other ,"DIA_Joel_HELLO1_03_06"); //Chyba przedstawi�em ci ca�� obsad�.
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
   description	= "Mo�esz mi pom�c wej�� do kopalni?";
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
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_01"); //Mo�esz mi pom�c wej�� do kopalni?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_02"); //Chcesz by� Kopaczem? C�... Si�y roboczej nigdy za wiele.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_03"); //Bycie Kopaczem to tylko etap przej�ciowy. Szybko dostan� si� w szeregi Cieni.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_04"); //B�dziesz potrzebowa� naprawd� du�o sprytu i szcz�cia.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_05"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_06"); //�eby wypu�cili ci� z kopalni, b�dziesz musia� si� naprawd� nachodzi�.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_07"); //Ka�dy Kopacz musi wykopa� pewn� ilo�� rudy.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_08"); //Potem drobnymi przys�ugami b�dziesz musia� wyrobi� sobie dobr� opini� w�r�d Stra�nik�w.
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_09"); //Gdy ju� b�d� dostatecznie dobrze "zmi�kczeni", to pozwol� ci wr�ci� do obozu.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_10"); //Gamal m�wi�, �e to b�dzie �atwiejsze...
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_11"); //Pewnie, �e jest! Noszenie piwa Stra�nikom jest chyba �atwiejsze ni� porz�dkowanie interes�w Cieni ze Starego Obozu.
    AI_Output (other, self ,"DIA_Joel_WEJSCIE_15_12"); //Pewnie masz racj�. Wracaj�c do tematu, co mog� dla ciebie zrobi�?
    AI_Output (self, other ,"DIA_Joel_WEJSCIE_03_13"); //Daj mi 50 bry�ek rudy i pogadam z Artegorem.
    MIS_RudaJoelowiOM = LOG_RUNNING;

    Log_CreateTopic          (CH1_RudaJoelowiOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RudaJoelowiOM, LOG_RUNNING);
    B_LogEntry               (CH1_RudaJoelowiOM,"Za 50 bry�ek rudy Joel porozmawia o mnie z Artegorem.");
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
   description	= "Mam 50 bry�ek.";
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
    AI_Output (other, self ,"DIA_Joel_RUDA_15_01"); //Mam 50 bry�ek.
    AI_Output (self, other ,"DIA_Joel_RUDA_03_02"); //Dzi�ki. Pogadam z Artegorem.
	
    B_LogEntry                     (CH1_RudaJoelowiOM,"Odda�em rud� Joelowi, kt�ry zagada do Artegora.");
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
    AI_Output (self, other ,"DIA_Joel_LECI_15_02"); //Nie�le. Tak jak m�wi�em mam ma�o pracy.
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
   description	= "Mo�esz mi co� opowiedzie� o ludziach z obozu?";
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
    AI_Output (other, self ,"DIA_Joel_PEOPLE_15_01"); //Mo�esz mi co� opowiedzie� o ludziach z obozu?
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_02"); //Co tu du�o m�wi�. Przede wszystkim nie zadzieraj z Artegorem.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_03"); //To on jest odpowiedzialny za to, kto wchodzi do kopalni.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_04"); //Lepiej mie� go za przyjaciela.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_05"); //Nasz obozowy kucharz tak�e ma spore wp�ywy. Mo�esz si� uda� do niego po racj� �ywno�ciow�.
    AI_Output (self, other ,"DIA_Joel_PEOPLE_03_06"); //Reszta to Stra�nicy lub Kopacze. Je�eli ostro�nie wypytasz, to dowiesz si� od nich wielu ciekawych rzeczy.
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
    AI_Output (self, other ,"DIA_Joel_Wazne_03_01"); //Uwa�aj na Spike'a. Ostatnio zrobi� si� dosy� nerwowy.
    AI_Output (other, self ,"DIA_Joel_Wazne_15_02"); //Dlaczego?
    AI_Output (self, other ,"DIA_Joel_Wazne_03_03"); //Kilku Kopaczy w obozie ci�gle robi sobie z niego �arty.
    AI_Output (self, other ,"DIA_Joel_Wazne_03_04"); //Spike ju� dawno pokaza�by im, gdzie raki zimuj�, ale Artegor surowo zabroni� bi� Kopaczy.
    AI_Output (self, other ,"DIA_Joel_Wazne_03_05"); //Wiesz... wtedy wolniej pracuj�.
    AI_Output (other, self ,"DIA_Joel_Wazne_15_06"); //Mo�e m�g�bym mu jako� pom�c?
    AI_Output (self, other ,"DIA_Joel_Wazne_03_07"); //Gdyby uda�o ci si� jako� wp�yn�� na Kopaczy...
    MIS_SpikeLoser = LOG_RUNNING;

    Log_CreateTopic          (CH1_SpikeLoser, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SpikeLoser, LOG_RUNNING);
    B_LogEntry               (CH1_SpikeLoser,"Joel opowiedzia� mi o problemie Spike'a. Stra�nik jest obiektem drwin Kopaczy z obozu. Musz� znale�� kogo�, kto wp�ynie na robotnik�w.");
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
	AI_Output (self, other,"DIA_Joel_JoshDie_04_01"); //Hej. Okaza�o si�, �e tw�j kumpel to brudny bandzior. Do tego na tyle bezczelny, �e zbiera� haracze w Kopalni.
	AI_Output (self, other,"DIA_Joel_JoshDie_04_02"); //Na szcz�cie ju� si� z nim rozprawili�my. Uwa�a, z kim si� zadajesz. Bywaj.
	
	B_LogEntry               (CH1_OreInOM,"Podczas mojej nieobecno�ci Stra�nicy zabili Josha. Musz� wr�ci� do Draxa. Nie widz� innego wyj�cia.");
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

//========================================
// Zadanie "Skarb dla stra�nika"
//========================================

INSTANCE DIA_Joel_AskAboutTreasure (C_INFO)
{
   npc          = GRD_7006_Joel;
   nr           = 2;
   condition    = DIA_Joel_AskAboutTreasure_Condition;
   information  = DIA_Joel_AskAboutTreasure_Info;
   permanent	= FALSE;
   description	= "S�ysza�em, �e tw�j wuj przed �mierci� zgromadzi� troch� bogactw...";
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
   AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_00"); //S�ysza�em, �e tw�j wuj przed �mierci� zgromadzi� troch� bogactw...
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_01"); //W takim razie �le s�ysza�e�! Kto ci co� takiego powiedzia�?
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_02"); //Niewa�ne.
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_03"); //M�w!
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_04"); //Kilka os�b... S�dz�c po twojej reakcji nie s� to puste informacje.
   AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_05"); //Ten skarb nigdy nie istnia�! A nawet gdyby te bajki nie by�y zmy�lone, to i tak nie powiedzia�bym o nim ani s�owa!
	AI_Output(self, other, "DIA_Joel_AskAboutTreasure_04_06"); //Nie pozwol�, aby pozosta�o�ci po moich przodkach zosta�y wymienione na gorza�� przez kilku brudas�w!
	AI_Output(other, self, "DIA_Joel_AskAboutTreasure_15_07"); //No dobrze, dobrze. Zapomnijmy o tej rozmowie. 
	
	B_LogEntry(CH2_TreasureOldGuard, "Od Joela niczego si� nie dowiedzia�em konkretnego. Co� musi by� na rzeczy. Stra�nik by� bardzo nerwowy.");
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
    AI_Output (self, other ,"DIA_Joel_GoAwayIdiot_03_01"); //Czego tu szukasz?! Nie �a� za mn�!
    AI_Output (self, other ,"DIA_Joel_GoAwayIdiot_03_02"); //Cholera, spadam st�d!
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
   AI_Output(self, other, "DIA_Joel_LostTreasureMap_04_00"); //Nie ma jej, nie ma, przecie� j� ukry�em!
	AI_Output(other, self, "DIA_Joel_LostTreasureMap_15_01"); //O czym ty m�wisz?
   AI_Output(self, other, "DIA_Joel_LostTreasureMap_04_02"); //Niewa�ne. Straci�em honor, w�asny i mojej rodziny!
	AI_Output(other, self, "DIA_Joel_LostTreasureMap_15_03"); //C�... Powodzenia stary.
	
	AI_StopProcessInfos (self);
};