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
	description = "Co s�ycha�?";
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
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Nasypali�my troch� piasku w machin� Gomeza.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Trzech zabitych Stra�nik�w i mn�stwo towaru na sprzeda�. Trzeba to opi�!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Jeste� jednym z ludzi, kt�rzy bez przerwy napadaj� Stary Ob�z?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Nie. Napadamy go tylko wtedy, kiedy si� to op�aca.
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
	description = "Fisk ze Starego Obozu szuka nowego partnera do interes�w.";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interes�w.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale powiniene� porozmawia� z Sharkym. Mo�e on na to p�jdzie.
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
	description = "Mam dla ciebie przesy�k�.";
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
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_00"); //Mam dla ciebie przesy�k�.
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_01"); //Co? Od kogo to? 
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_02"); //Od Dextera ze Starego Obozu.
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_03"); //Co tak �mierdzi? Narobi�e� w portki? 
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_04"); //Dexter m�wi, �e je�li jeszcze raz przy�lesz kogo�, kto podbiera mu klient�w, to si� z tob� policzy. 
	AI_Output (self, other,"DIA_Cipher_Gunwo_12_05"); //CO?! Czyli ten cwaniak b�dzie jeszcze stawia� op�r? Zobaczymy jak d�ugo...
	AI_Output (other, self,"DIA_Cipher_Gunwo_15_06"); //Pami�taj, �e ja jestem tylko pos�a�cem. Mi�ego dnia.
	
	B_GiveInvItems (hero,self, ItMi_FakeJoints,1);
	Npc_RemoveInvItems (self,ItMi_FakeJoints,1);
	B_GiveXP (80);
    AI_StopProcessInfos	(self);
	
	B_LogEntry(CH2_MessengerRecall, "Dostarczy�em �mierdz�c� przesy�k� Cipherowi... By� nie�le wkurzony, ale nie zaatakowa� mnie. Mia�em szcz�cie. To chyba najdurniejsza robota jak� mia�em. Musz� wr�ci� do Dextera.");
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
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Nie, nie! Pytanie brzmi: co TY masz do zaoferowania! Interesuj� mnie wy��cznie powa�ne dostawy.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor powiedzia� mi, �e interesuje ci� bagienne ziele.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhm. Masz co� na sprzeda�?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Niestety nie.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Wi�c wr�� do mnie, jak b�dziesz mia� co� co mnie zainteresuje.
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
   description	= "Sprzedajesz eliksir z wydzieliny pe�zaczy?";
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
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_01"); //Sprzedajesz eliksir z wydzieliny pe�zaczy?
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_02"); //Tak, a co ci do tego?
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_03"); //Chc� wiedzie�, od kogo go kupi�e�.
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_04"); //A co, je�li ci nie powiem?
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_05"); //Chyba nie chcesz mie� k�opot�w z moimi bra�mi. Mog� ci bardzo zaszkodzi�, je�li mnie zdenerwujesz.
    AI_Output (self, other ,"DIA_Cipher_ElixirSellCipher_03_06"); //Dobra, dobra. Tak sie tylko drocz�. Tylko zostawcie m�j interes... Skupuj� wszystko od Caine'a.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Cipher_ElixirSellCipher_15_07"); //Widzisz? To nie by�o takie trudne.
    B_LogEntry                     (CH1_SellElixer,"Cipher kupi� eliksiry od Nowicjusza Caine'a.");

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
   description	= "Bandyci maj� na sprzeda� zupe�nie nowy rodzaj ziela.";
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
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_01"); //Bandyci maj� na sprzeda� zupe�nie nowy rodzaj ziela.
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_03"); //Nie chcia�by� mo�e wej�� w trwa�y uk�ad?
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_04"); //Nie... Nie chc� �adnego bandyckiego g�wna. Briam to niez�y kr�tacz.
    AI_Output (other, self ,"DIA_Cipher_BanditJoints_15_05"); //Mam wra�enie, �e bardziej chodzi ci o samego Briama ni� o ziele.
    AI_Output (self, other ,"DIA_Cipher_BanditJoints_03_06"); //W rzeczy samej. Nie robie interes�w z takimi lud�mi. Szukaj w Starym Obozie. Mo�e tam trafisz na jakiego� kretyna...
    B_LogEntry                     (CH1_NoweZiele3BAU,"Cipher ma z Briamem na pie�ku. Nie jest zainteresowany ofert� trwa�ej wsp�pracy.");

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
   description	= "Jeste� pi�ciarzem?";
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
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_01"); //Jeste� pi�ciarzem?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_02"); //Co? Sk�d wiesz? Zreszt� niewa�ne.
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_03"); //W przesz�o�ci troch� walczy�em. Czego chcesz? Nie mam czasu nikogo uczy�.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_04"); //Nie chc� si� uczy�. Wracaj�c do tematu... by�e� dobry?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_05"); //Jasne. Kiedy� walczy�em nawet na arenie w Starym Obozie. P�niej znalaz�em sobie inne, bardziej dochodowe zaj�cie.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_06"); //Jakie?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_07"); //G�wno ci� to obchodzi. 
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_08"); //Chcesz walczy�?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_09"); //Ty? Ze mn�? Ha ha ha. Nie wiesz w co si� pakujesz.
    AI_Output (other, self ,"DIA_Cipher_YOU_WANNA_FIGHT_15_10"); //Boisz si�, �e oberwiesz? A� tak si� postarza�e�?
    AI_Output (self, other ,"DIA_Cipher_YOU_WANNA_FIGHT_03_11"); //Jak chcesz, mog� ci obi� t� pyskat� mord�. To nie problem. 
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
   description	= "Poka� na co ci� sta�!";
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
    AI_Output (other, self ,"DIA_Cipher_FIGHT_15_01"); //Poka� na co ci� sta�!
    AI_Output (self, other ,"DIA_Cipher_FIGHT_03_02"); //Zaraz porachuj� ci ko�ci.
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
    AI_Output (self, other ,"DIA_Cipher_WARN_FIGHT_03_02"); //Mieli�my walczy� na pi�ci! Nie masz honoru. Id� precz.
    Npc_SetPermAttitude (self, ATT_NEUTRAL);

    B_LogEntry                     (CH1_Italian_Job,"Chcia�em oszuka� Ciphera i walczy� z nim przy u�yciu broni. To nie by�o zbyt m�dre. Nie da mi drugiej szansy, by z nim walczy�. ");
    AI_StopProcessInfos	(self);
};

*/