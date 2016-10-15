//poprawione i sprawdzone - Nocturn

/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Co s³ychaæ?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	//if (Balor_TellsNCDealer == TRUE)
	//{
		return 1;
	//};
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Nasypaliœmy trochê piasku w machinê Gomeza.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Trzech zabitych Stra¿ników i mnóstwo towaru na sprzeda¿. Trzeba to opiæ!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Jesteœ jednym z ludzi, którzy bez przerwy napadaj¹ Stary Obóz?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Nie. Napadamy go tylko wtedy, kiedy siê to op³aca.
};

// ******************************
// 			Fisk
// ******************************

instance  Org_873_Cipher_Fisk (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Fisk_Condition;
	information	=  Org_873_Cipher_Fisk_Info;
	permanent	=  1;
	description = "Fisk ze Starego Obozu szuka nowego partnera do interesów.";
};                       

FUNC int  Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Fisk_Info()
{
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interesów.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale powinieneœ porozmawiaæ z Sharkym. Mo¿e on na to pójdzie.
};

// ******************************
// 			Gunwo
// ******************************

instance  Org_873_Cipher_Gunwo (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Gunwo_Condition;
	information	=  Org_873_Cipher_Gunwo_Info;
	permanent	=  0;
	description = "Mam dla ciebie przesy³kê.";
};                       

FUNC int  Org_873_Cipher_Gunwo_Condition()
{
	if ( Npc_HasItems ( hero, ItMi_FakeJoints )) && Npc_KnowsInfo (hero, DIA_Dexter_Iglica)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Gunwo_Info()
{
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_00"); //Mam dla ciebie przesy³kê.
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_01"); //Co? Od kogo to? 
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_02"); //Od Dextera ze Starego Obozu.
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_03"); //Co tak œmierdzi? Narobi³eœ w portki? 
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_04"); //Dexter mówi, ¿e jeœli jeszcze raz przyœlesz kogoœ, kto podbiera mu klientów, to siê z tob¹ policzy. 
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_05"); //CO?! Czyli ten cwaniak bêdzie jeszcze stawia³ opór? Zobaczymy jak d³ugo...
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_06"); //Pamiêtaj, ¿e ja jestem tylko pos³añcem. Mi³ego dnia.
	
	B_GiveInvItems (hero,self, ItMi_FakeJoints,1);
	Npc_RemoveInvItems (self,ItMi_FakeJoints,1);
	B_GiveXP (80);
    AI_StopProcessInfos	(self);
	
	B_LogEntry(CH2_MessengerRecall, "Dostarczy³em œmierdz¹c¹ przesy³kê Cipherowi... By³ nieŸle wkurzony, ale nie zaatakowa³ mnie. Mia³em szczêœcie. To chyba najdurniejsza robota jak¹ mia³em. Muszê wróciæ do Dextera.");
};
// ******************************
// 			Balor sent Me
// ******************************
	var int Cipher_Trade;
// ******************************

instance  Org_873_Cipher_FromBalor (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_FromBalor_Condition;
	information	=  Org_873_Cipher_FromBalor_Info;
	permanent	=  1;
	description = "Co masz do zaoferowania?";
};                       

FUNC int  Org_873_Cipher_FromBalor_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_FromBalor_Info()
{
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Co masz do zaoferowania?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Nie, nie! Pytanie brzmi: co TY masz do zaoferowania! Interesuj¹ mnie wy³¹cznie powa¿ne dostawy.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor powiedzia³ mi, ¿e interesuje ciê bagienne ziele.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhm. Masz coœ na sprzeda¿?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Niestety nie.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Wiêc wróæ do mnie, jak bêdziesz mia³ coœ co mnie zainteresuje.
	};
};

// ******************************
// 			TRADE
// ******************************

instance  Org_873_Cipher_TRADE (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_TRADE_Condition;
	information	=  Org_873_Cipher_TRADE_Info;
	permanent	=  1;
	description = "Dobijmy targu.";
	trade		= 1;
};                       

FUNC int  Org_873_Cipher_TRADE_Condition()
{
	if ( Cipher_Trade == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_TRADE_Info()
{
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Dobijmy targu.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Czego chcesz?
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> WhoSellElixier
//========================================

INSTANCE DIA_Cipher_WhoSellElixier (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_WhoSellElixier_Condition;
   information  = DIA_Cipher_WhoSellElixier_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wydzieliny pe³zaczy?";
};

FUNC INT DIA_Cipher_WhoSellElixier_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    && (HeroKnowCipherSellElixier == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_WhoSellElixier_Info()
{
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_01"); //Sprzedajesz eliksir z wydzieliny pe³zaczy?
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_02"); //Tak, a co ci do tego?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_03"); //Chcê wiedzieæ, od kogo go kupi³eœ.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_04"); //Od kogoœ od was. To chyba jasne!
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_05"); //Nie mam czasu na twoje gierki. Gadaj z kim wspó³pracujesz.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_06"); //Ty naprawdê nie wiesz?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_07"); //Czemu ciê to tak dziwi?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_08"); //Powinieneœ wiedzieæ, co siê dzieje w obozie do którego nale¿ysz. Nie s¹dzisz? 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_09"); //Pos³uchaj mnie, cz³owiek, który robi z tob¹ interesy robi to wbrew woli Guru. Chyba nie chcia³byœ ich rozgniewaæ?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_10"); //A co mnie obchodz¹ jacyœ Guru? S¹ daleko st¹d. Chyba sam Cor Kalom nie pofatyguje siê tutaj, ¿eby skopaæ mi ty³ek?
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_11"); //Nie, ale mo¿e przys³aæ na przyk³ad mnie.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_12"); //Myœlisz, ¿e siê ciebie bojê? Rusz mnie tylko, a nie masz ¿ycia w tym Obozie.
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_13"); //Jeœli wyprowadzisz mnie z równowagi postawiê ca³e bagna na g³owie, ¿eby tylko znaleŸæ twoich dostawców i pozbyæ siê ich.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_14"); //Poczekaj, zostaw mój interes w spokoju. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_15"); //W takim razie powiedz mi, co wiesz.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_16"); //Nasza wymiana odbywa siê bez zbêdnych s³ów. Jest pewna skrzynia... Zostawiam w niej na noc rudê, a nastêpnego dnia znajdujê tam eliksiry.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_17"); //Wiem, jest to doœæ ryzykowne, ale ufam moim tajemniczym wspólnikom. Jeszcze mnie nie oszukali, wiêc chyba tego nie planuj¹. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_18"); //Gdzie jest ta skrzynia? 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_19"); //W ma³ym w¹wozie, pod starym mostem. T¹ drog¹ mo¿na siê dostaæ do obozu Aidana. Zazwyczaj stoj¹ tam jakieœ zbiry. 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_20"); //Zjaw siê tam w nocy, a mo¿e spotkasz mojego wspólnika. Ja siê z nim nie widujê. Tylko tyle mogê ci powiedzieæ. 
	
    B_LogEntry                     (CH3_SellElixer,"Cipher wreszcie da³ mi jak¹œ wskazówkê. Nie zna on to¿samoœci swojego wspólnika, jednak zdradzi³ mi, ¿e dochodzi miêdzy nimi do wymiany pod starym mostem dziêki, któremu mo¿na siê ³atwo dostaæ do obozowiska Aidana. Znam to miejsce. Widzia³em tam niegdyœ dwóch rabusiów. Pod owym mostem mam szukaæ starej skrzyni. To w niej Cipher zostawia rudê, a jego wspólnik eliksiry. Muszê siê tam udaæ póŸn¹ noc¹ i spróbowaæ przy³apaæ handlarza.");

    AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////
//	Zadanie: Nowe ziele
//////////////////////////////////////////////

//========================================
//-----------------> NovizeJoints
//========================================

INSTANCE DIA_Cipher_NovizeJoints (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_NovizeJoints_Condition;
   information  = DIA_Cipher_NovizeJoints_Info;
   permanent	= FALSE;
   description	= "Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.";
};

FUNC INT DIA_Cipher_NovizeJoints_Condition()
{
    if (MIS_NoweZiele == LOG_RUNNING) && ( Cipher_Trade == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_NovizeJoints_Info()
{
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_03"); //Nie chcia³byœ mo¿e wejœæ w trwa³y uk³ad? 
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_04"); //Masz jakieœ próbki tego ziela? Domyœlam siê, ¿e Guru o niczym nie wiedz¹.
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_05"); //W rzeczy samej. Oto próbka.
	B_GiveInvItems (hero,self, MegaJoint,1);
	AI_UseItem (self, MegaJoint);
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_06"); //O cholera, ma niez³ego kopa... Przeka¿ temu, kto ciê przys³a³, ¿e dobijemy targu.
    B_LogEntry                     (CH1_NoweZiele,"Cipher po spróbowaniu jednego skrêta od razu przysta³ na uk³ad. ");

    AI_StopProcessInfos	(self);
};

/*
//========================================
//-----------------> YOU_WANNA_FIGHT
//========================================

INSTANCE DIA_Cipher_YOU_WANNA_FIGHT (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_YOU_WANNA_FIGHT_Condition;
   information  = DIA_Cipher_YOU_WANNA_FIGHT_Info;
   permanent	= FALSE;
   description	= "Jesteœ piêœciarzem?";
};

FUNC INT DIA_Cipher_YOU_WANNA_FIGHT_Condition()
{
    if (MIS_Italian_Job == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_YOU_WANNA_FIGHT_Info()
{
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_01"); //Jesteœ piêœciarzem?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_02"); //Co? Sk¹d wiesz? Zreszt¹ niewa¿ne.
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_03"); //W przesz³oœci trochê walczy³em. Czego chcesz? Nie mam czasu nikogo uczyæ.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_04"); //Nie chcê siê uczyæ. Wracaj¹c do tematu... by³eœ dobry?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_05"); //Jasne. Kiedyœ walczy³em nawet na arenie w Starym Obozie. PóŸniej znalaz³em sobie inne, bardziej dochodowe zajêcie.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_06"); //Jakie?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_07"); //Gówno ciê to obchodzi. 
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_08"); //Chcesz walczyæ?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_09"); //Ty? Ze mn¹? Ha ha ha. Nie wiesz w co siê pakujesz.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_10"); //Boisz siê, ¿e oberwiesz? A¿ tak siê postarza³eœ?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_11"); //Jak chcesz, mogê ci obiæ tê pyskat¹ mordê. To nie problem. 
};

//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Cipher_FIGHT (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_FIGHT_Condition;
   information  = DIA_Cipher_FIGHT_Info;
   permanent	= FALSE;
   description	= "Poka¿ na co ciê staæ!";
};

FUNC INT DIA_Cipher_FIGHT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cipher_YOU_WANNA_FIGHT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_FIGHT_Info()
{
    AI_Output (other, self ,"DIA_Cipher_FIGHT_15_01"); //Poka¿ na co ciê staæ!
    AI_Output (self, other ,"DIA_Cipher_FIGHT_03_02"); //Zaraz porachujê ci koœci.
    AI_UnequipWeapons (self);
    AI_UnequipWeapons (hero);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> WARN_FIGHT
//========================================

INSTANCE DIA_Cipher_WARN_FIGHT (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 2;
   condition    = DIA_Cipher_WARN_FIGHT_Condition;
   information  = DIA_Cipher_WARN_FIGHT_Info;
   permanent	= FALSE;
   description	= "";
};

FUNC INT DIA_Cipher_WARN_FIGHT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cipher_FIGHT))
    && (Npc_GetEquippedMeleeWeapon (hero))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_WARN_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Cipher_WARN_FIGHT_03_01"); //No kurwa, co ty robisz?!
    AI_Output (self, other ,"DIA_Cipher_WARN_FIGHT_03_02"); //Mieliœmy walczyæ na piêœci! Nie masz honoru. IdŸ precz.
    Npc_SetPermAttitude (self, ATT_NEUTRAL);

    B_LogEntry                     (CH1_Italian_Job,"Chcia³em oszukaæ Ciphera i walczyæ z nim przy u¿yciu broni. To nie by³o zbyt m¹dre. Nie da mi drugiej szansy, by z nim walczyæ. ");
    AI_StopProcessInfos	(self);
};

*/