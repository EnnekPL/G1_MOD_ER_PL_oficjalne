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

//========================================
//-----------------> ElixirSellCipher
//========================================

INSTANCE DIA_Cipher_ElixirSellCipher (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_ElixirSellCipher_Condition;
   information  = DIA_Cipher_ElixirSellCipher_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wydzieliny pe³zaczy?";
};

FUNC INT DIA_Cipher_ElixirSellCipher_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_QuestCH3))
    && (CipherSprzedajeEliksir == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_ElixirSellCipher_Info()
{
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_01"); //Sprzedajesz eliksir z wydzieliny pe³zaczy?
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_02"); //Tak, a co ci do tego?
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_03"); //Chcê wiedzieæ, od kogo go kupi³eœ.
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_04"); //A co, jeœli ci nie powiem?
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_05"); //Chyba nie chcesz mieæ k³opotów z moimi braæmi. Mog¹ ci bardzo zaszkodziæ, jeœli mnie zdenerwujesz.
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_06"); //Dobra, dobra. Tak sie tylko droczê. Tylko zostawcie mój interes... Skupujê wszystko od Caine'a.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_07"); //Widzisz? To nie by³o takie trudne.
    B_LogEntry                     (CH3_SellElixer,"Cipher kupi³ eliksiry od Nowicjusza Caine'a.");

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BanditJoints
//========================================

INSTANCE DIA_Cipher_BanditJoints (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_BanditJoints_Condition;
   information  = DIA_Cipher_BanditJoints_Info;
   permanent	= FALSE;
   description	= "Bandyci maj¹ na sprzeda¿ zupe³nie nowy rodzaj ziela.";
};

FUNC INT DIA_Cipher_BanditJoints_Condition()
{
    if (MIS_NoweZiele3BAU == LOG_RUNNING) && ( Cipher_Trade == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_BanditJoints_Info()
{
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_01"); //Bandyci maj¹ na sprzeda¿ zupe³nie nowy rodzaj ziela.
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_03"); //Nie chcia³byœ mo¿e wejœæ w trwa³y uk³ad?
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_04"); //Nie... Nie chcê ¿adnego bandyckiego gówna. Briam to niez³y krêtacz.
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_05"); //Mam wra¿enie, ¿e bardziej chodzi ci o samego Briama ni¿ o ziele.
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_06"); //W rzeczy samej. Nie robie interesów z takimi ludŸmi. Szukaj w Starym Obozie. Mo¿e tam trafisz na jakiegoœ kretyna...
    B_LogEntry                     (CH1_NoweZiele3BAU,"Cipher ma z Briamem na pieñku. Nie jest zainteresowany ofert¹ trwa³ej wspó³pracy.");

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