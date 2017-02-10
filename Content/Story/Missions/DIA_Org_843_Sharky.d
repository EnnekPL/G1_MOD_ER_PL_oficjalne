// ************************ EXIT **************************

instance  Org_843_Sharky_Exit (C_INFO)
{
	npc			=  Org_843_Sharky;
	nr			=  999;
	condition	=  Org_843_Sharky_Exit_Condition;
	information	=  Org_843_Sharky_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_843_Sharky_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_Fisk (C_INFO)
{
	npc				= Org_843_Sharky;
	nr 				= 2;
	condition		= Org_843_Sharky_Fisk_Condition;
	information		= Org_843_Sharky_Fisk_Info;
	permanent		= 0;
	description		= "Fisk ze Starego Obozu szuka nowego partnera do interes�w."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_Fisk_Condition()
{	
	if (Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_Fisk_Info()
{
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interes�w.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_01"); //A dlaczego m�wisz o tym w�a�nie mi?
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_02"); //Pomy�la�em, �e zainteresuje ci� mo�liwo�� zarobienia paru bry�ek rudy.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_03"); //Czemu nie... Powiedz Fiskowi, �e mo�e na mnie liczy�.
};  


/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_TRADE (C_INFO)
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_TRADE_Condition;
	information		= Org_843_Sharky_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Przyda�oby mi si� kilka drobiazg�w."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero, Org_843_Sharky_GREET))
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_TRADE_Info()
{
	AI_Output (other, self,"Org_843_Sharky_TRADE_Info_15_01"); //Przyda�oby mi si� kilka drobiazg�w.
};  

/*------------------------------------------------------------------------
							TRADE BEGR��UNG 								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_GREET (C_INFO) 
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_GREET_Condition;
	information		= Org_843_Sharky_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cze��, jak leci?"; 
};

FUNC int  Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};


FUNC void  Org_843_Sharky_GREET_Info()
{
	AI_Output		(other, self,"Org_843_Sharky_GREET_Info_15_01"); //Cze��, jak leci?
	AI_Output		(self, other,"Org_843_Sharky_GREET_Info_10_02"); //Chcesz co� kupi�?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Szkodnik Sharky handluje broni� i innymi dobrami. Przebywa zwykle na terenie Nowego Obozu."); 
};

//////////////////////////////////////////////
//	Cronos Theft
//////////////////////////////////////////////

INSTANCE DIA_Sharky_CronosTheft (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 1;
   condition    = DIA_Sharky_CronosTheft_Condition;
   information  = DIA_Sharky_CronosTheft_Info;
   permanent	= FALSE;
   description	= "Podobno kto� okrad� Cronosa.";
};

FUNC INT DIA_Sharky_CronosTheft_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_CronosTheft))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_CronosTheft_Info()
{
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_01"); //Podobno kto� okrad� Cronosa.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_02"); //S�ysza�em. Odwa�ny go��.
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_03"); //Znasz go mo�e?
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_04"); //Nie mam poj�cia kto to, ale go�� pono� nie opu�ci� obozu. Pewnie zaszy� si� w swojej chacie i ani my�li wychodzi�.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_05"); //No chyba, �e zwia� przez g�ry...
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_06"); //Sprawdz� lepiej chaty. 
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_07"); //Hej, chyba nale�y mi si� kilka bry�ek rudy za pomoc.
	AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_08"); //Jasne. Pogadaj z Cronosem.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_09"); //Niewa�ne... 
	
    B_LogEntry               (CH1_MagicySzkodnicy,"Sharky nie zna z�odzieja, ale twierdzi, �e je�li jest w obozie i nie uciek� to pewnie nie wychyla si� z chaty licz�c, �e przeczeka zamieszanie. Powinienem pozagl�da� do chat i poszuka� kogo� podejrzanego.");
};

//========================================
//-----------------> UkradzionyPosag
//========================================

INSTANCE DIA_Sharky_UkradzionyPosag (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 1;
   condition    = DIA_Sharky_UkradzionyPosag_Condition;
   information  = DIA_Sharky_UkradzionyPosag_Info;
   permanent	= FALSE;
   description	= "To ty ukrad�e� pos��ek Klina!";
};

FUNC INT DIA_Sharky_UkradzionyPosag_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Zlodzieje2))
    && (Npc_KnowsInfo (hero, Org_843_Sharky_Fisk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_UkradzionyPosag_Info()
{
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_01"); //To ty ukrad�e� pos��ek Klina!
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_02"); //Co? Czemu niby ja?
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_03"); //Pos��ek kupi�em od Fiska. Z tego co mi wiadomo, to jeste� jego paserem!
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_04"); //Ten idiota m�g� go przed tob� ukry�.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_05"); //Pos�uchaj. Mam dla ciebie propozycj�.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_06"); //Nie dono� na mnie Klinowi.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_07"); //Zap�ac� ci za to 200 bry�ek rudy.
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_08"); //Na kogo niby mia�bym wskaza� win�?
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_09"); //Na Butcha! Nikt za nim nie przepada.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_10"); //Pami�taj! Zap�ac� ci.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"To, �e sprawc� kradzie�y jest Sharky by�o do przewidzenia. Jednak ten przebieg�y Szkodnik zaproponowa� mi ofert� nie do odrzucenia. Da mi 200 bry�ek rudy je�eli powiem, �e to Butch jest sprawc� kradzie�y.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CatchedConfident
//========================================

INSTANCE DIA_Sharky_CatchedConfident (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 1;
   condition    = DIA_Sharky_CatchedConfident_Condition;
   information  = DIA_Sharky_CatchedConfident_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sharky_CatchedConfident_Condition()
{
    if (WedgeKnowsSharky == true)
    && (Npc_KnowsInfo (hero, DIA_Wedge_Judge))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_CatchedConfident_Info()
{
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_01"); //Ty idioto!
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_02"); //Donios�e� na mnie! Id� precz.
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_03"); //B�dziesz mia� k�opoty w Obozie!
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_04"); //Zobaczysz.
    AI_Output (other, self ,"DIA_Sharky_CatchedConfident_15_05"); //Spieprzaj. Nie boj� si� twoich koleg�w!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Cheated
//========================================

INSTANCE DIA_Sharky_Cheated (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 2;
   condition    = DIA_Sharky_Cheated_Condition;
   information  = DIA_Sharky_Cheated_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Sharky_Cheated_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Judge))
    && (WedgeKnowsSharky == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_Cheated_Info()
{
    AI_Output (self, other ,"DIA_Sharky_Cheated_03_01"); //Nie donios�e� na mnie!
    AI_Output (self, other ,"DIA_Sharky_Cheated_03_02"); //�wietnie.
    oszukanieSharkiego = Hlp_Random (2);
    if (oszukanieSharkiego == 1)
    {
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_03"); //Oto twoja zap�ata.
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_04"); //200 bry�ek. Tak jak si� umawiali�my.
        CreateInvItems (self, ItMiNugget, 200);
        B_GiveInvItems (self, other, ItMiNugget, 200);
    }
    else
    {
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_05"); //Naprawd� my�la�e�, �e dam ci tyle rudy.
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_06"); //Jeste� sko�czonym g�upcem!
    };
   // B_KillNpc (Org_850_Wedge);
   
    AI_StopProcessInfos	(self);
	Npc_SetTarget (Org_851_Butch,Org_843_Sharky);
    AI_StartState (Org_851_Butch,ZS_ATTACK,1,"");
};


//========================================
//-----------------> Goods
//========================================

INSTANCE DIA_Sharky_Goods (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 1;
   condition    = DIA_Sharky_Goods_Condition;
   information  = DIA_Sharky_Goods_Info;
   permanent	= FALSE;
   description	= "Sk�d bierzesz swoje towary?";
};

FUNC INT DIA_Sharky_Goods_Condition()
{
    if (Npc_KnowsInfo (hero, Org_843_Sharky_GREET))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_Goods_Info()
{
    AI_Output (other, self ,"DIA_Sharky_Goods_15_01"); //Sk�d bierzesz swoje towary?
    AI_Output (self, other ,"DIA_Sharky_Goods_03_02"); //Jestem paserem. Mam sporo znajomo�ci w ca�ej Kolonii.
    AI_Output (self, other ,"DIA_Sharky_Goods_03_03"); //Cz�sto dogaduj� si� z kupcami z innych oboz�w i zaopatruj� ich w towary.
    AI_Output (self, other ,"DIA_Sharky_Goods_03_04"); //Znam ludzi od kt�rych mog� je wzi��. 
    AI_Output (self, other ,"DIA_Sharky_Goods_03_05"); //Poza tym sprzedaj� cz�� broni, kt�re wykuje Huan. Cz�� te� dostaje po napadach na konwoje ze Starego Obozu.
};

//========================================
//-----------------> Napady
//========================================

INSTANCE DIA_Sharky_Napady (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 2;
   condition    = DIA_Sharky_Napady_Condition;
   information  = DIA_Sharky_Napady_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o napadach?";
};

FUNC INT DIA_Sharky_Napady_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_Goods))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_Napady_Info()
{
    AI_Output (other, self ,"DIA_Sharky_Napady_15_01"); //Co mo�esz mi powiedzie� o napadach?
    AI_Output (self, other ,"DIA_Sharky_Napady_03_02"); //Lares cz�sto wysy�a Szkodnik�w, aby zrabowa� towary przenoszone ze Starego Obozu do Starej Kopalni.
    AI_Output (self, other ,"DIA_Sharky_Napady_03_03"); //Mamy umow� z Quentinem, przyw�dc� Bandyt�w z Kanionu Trolli. Sprawiedliwie dzielimy si� z�upionymi towarami.
    AI_Output (other, self ,"DIA_Sharky_Napady_03_04"); //Wi�c wasze obozy �yj� w przyja�ni?
    AI_Output (self, other ,"DIA_Sharky_Napady_03_05"); //Jak najbardziej. W ko�cu wi�kszo�� Bandyt�w nale�a�a kiedy� do Nowego Obozu. 
    AI_Output (self, other ,"DIA_Sharky_Napady_03_06"); //Pami�tam ich z czas�w, gdy Nowy Ob�z dopiero powstawa�. Razem walczyli�my ze Stra�nikami Gomeza w niejednej bitwie. 
};

//========================================
//-----------------> Quentin
//========================================

INSTANCE DIA_Sharky_Quentin (C_INFO)
{
   npc          = Org_843_Sharky;
   nr           = 3;
   condition    = DIA_Sharky_Quentin_Condition;
   information  = DIA_Sharky_Quentin_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Quentinie?";
};

FUNC INT DIA_Sharky_Quentin_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_Napady))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Sharky_Quentin_Info()
{
    AI_Output (other, self ,"DIA_Sharky_Quentin_15_01"); //Co mo�esz mi powiedzie� o Quentinie?
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_02"); //Zanim trafi� do Kolonii, by� jednym z pirat�w. Razem ze swoj� za�og� z�upili niejeden okr�t.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_03"); //Zamorska gildia Araxos niezwykle ucierpia�a z ich r�ki. Mia�a ona mn�stwo statk�w, kt�re kursowa�y mi�dzy Khorinis, a kontynentem.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_04"); //Ponad po�owa z nich zosta�a zatopiona lub z�upiona przez pirat�w.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_05"); //Quentin zawsze wykazywa� wielkie zdolno�ci przyw�dcze i cz�sto kwestionowa� zdanie Laresa.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_06"); //Dlatego wraz z cz�ci� ch�opak�w opu�cili Nowy Ob�z - aby si� usamodzielni�.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_07"); //Czas pokaza�, �e przyw�dca Bandyt�w jest nie tylko silny, ale i przebieg�y.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_08"); //Gomez nigdy nie dowiedzia� si� gdzie znajduje si� ich Ob�z. 
};

/*------------------------------------------------------------------------
							CATCHED								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_CATCHED (C_INFO) 
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_CATCHED_Condition;
	information		= Org_843_Sharky_CATCHED_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Org_843_Sharky_CATCHED_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Andrew_Wygrana))
	{
		return TRUE;
	};
};


FUNC void  Org_843_Sharky_CATCHED_Info()
{
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_01"); //Co? Co wy tu robicie?
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_02"); //Nie tak �atwo pos�a� nas do piachu, cwaniaczku. 
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_03"); //W przeciwie�stwie do twoich ludzi...
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_04"); //Nie �yj�? Zabili�cie ich?
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_05"); //Pos�uchajcie, to, to... by�o jednorazowe. Andrew, s�yszysz?
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_06"); //Zapomnijmy o twoim ma�ym d�ugu i o zamieszaniu, kt�re si� tutaj odby�o. Dobra?
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_07"); //Niech ci b�dzie. Spadaj, zanim zmienimy zdanie.
	Npc_ExchangeRoutine (Org_843_Sharky,"start");
	AI_StopProcessInfos (self);
};