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
	description		= "Fisk ze Starego Obozu szuka nowego partnera do interesów."; 
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
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interesów.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_01"); //A dlaczego mówisz o tym w³aœnie mi?
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_02"); //Pomyœla³em, ¿e zainteresuje ciê mo¿liwoœæ zarobienia paru bry³ek rudy.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_03"); //Czemu nie... Powiedz Fiskowi, ¿e mo¿e na mnie liczyæ.
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
	description		= "Przyda³oby mi siê kilka drobiazgów."; 
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
	AI_Output (other, self,"Org_843_Sharky_TRADE_Info_15_01"); //Przyda³oby mi siê kilka drobiazgów.
};  

/*------------------------------------------------------------------------
							TRADE BEGRÜßUNG 								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_GREET (C_INFO) 
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_GREET_Condition;
	information		= Org_843_Sharky_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czeœæ, jak leci?"; 
};

FUNC int  Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};


FUNC void  Org_843_Sharky_GREET_Info()
{
	AI_Output		(other, self,"Org_843_Sharky_GREET_Info_15_01"); //Czeœæ, jak leci?
	AI_Output		(self, other,"Org_843_Sharky_GREET_Info_10_02"); //Chcesz coœ kupiæ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Szkodnik Sharky handluje broni¹ i innymi dobrami. Przebywa zwykle na terenie Nowego Obozu."); 
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
   description	= "Podobno ktoœ okrad³ Cronosa.";
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
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_01"); //Podobno ktoœ okrad³ Cronosa.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_02"); //S³ysza³em. Odwa¿ny goœæ.
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_03"); //Znasz go mo¿e?
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_04"); //Nie mam pojêcia kto to, ale goœæ ponoæ nie opuœci³ obozu. Pewnie zaszy³ siê w swojej chacie i ani myœli wychodziæ.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_05"); //No chyba, ¿e zwia³ przez góry...
    AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_06"); //Sprawdzê lepiej chaty. 
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_07"); //Hej, chyba nale¿y mi siê kilka bry³ek rudy za pomoc.
	AI_Output (other, self ,"DIA_Sharky_CronosTheft_15_08"); //Jasne. Pogadaj z Cronosem.
    AI_Output (self, other ,"DIA_Sharky_CronosTheft_03_09"); //Niewa¿ne... 
	
    B_LogEntry               (CH1_MagicySzkodnicy,"Sharky nie zna z³odzieja, ale twierdzi, ¿e jeœli jest w obozie i nie uciek³ to pewnie nie wychyla siê z chaty licz¹c, ¿e przeczeka zamieszanie. Powinienem pozagl¹daæ do chat i poszukaæ kogoœ podejrzanego.");
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
   description	= "To ty ukrad³eœ pos¹¿ek Klina!";
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
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_01"); //To ty ukrad³eœ pos¹¿ek Klina!
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_02"); //Co? Czemu niby ja?
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_03"); //Pos¹¿ek kupi³em od Fiska. Z tego co mi wiadomo, to jesteœ jego paserem!
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_04"); //Ten idiota móg³ go przed tob¹ ukryæ.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_05"); //Pos³uchaj. Mam dla ciebie propozycjê.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_06"); //Nie donoœ na mnie Klinowi.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_07"); //Zap³acê ci za to 200 bry³ek rudy.
    AI_Output (other, self ,"DIA_Sharky_UkradzionyPosag_15_08"); //Na kogo niby mia³bym wskazaæ winê?
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_09"); //Na Butcha! Nikt za nim nie przepada.
    AI_Output (self, other ,"DIA_Sharky_UkradzionyPosag_03_10"); //Pamiêtaj! Zap³acê ci.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"To, ¿e sprawc¹ kradzie¿y jest Sharky by³o do przewidzenia. Jednak ten przebieg³y Szkodnik zaproponowa³ mi ofertê nie do odrzucenia. Da mi 200 bry³ek rudy je¿eli powiem, ¿e to Butch jest sprawc¹ kradzie¿y.");

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
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_02"); //Donios³eœ na mnie! IdŸ precz.
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_03"); //Bêdziesz mia³ k³opoty w Obozie!
    AI_Output (self, other ,"DIA_Sharky_CatchedConfident_03_04"); //Zobaczysz.
    AI_Output (other, self ,"DIA_Sharky_CatchedConfident_15_05"); //Spieprzaj. Nie bojê siê twoich kolegów!
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
    AI_Output (self, other ,"DIA_Sharky_Cheated_03_01"); //Nie donios³eœ na mnie!
    AI_Output (self, other ,"DIA_Sharky_Cheated_03_02"); //Œwietnie.
    oszukanieSharkiego = Hlp_Random (2);
    if (oszukanieSharkiego == 1)
    {
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_03"); //Oto twoja zap³ata.
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_04"); //200 bry³ek. Tak jak siê umawialiœmy.
        CreateInvItems (self, ItMiNugget, 200);
        B_GiveInvItems (self, other, ItMiNugget, 200);
    }
    else
    {
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_05"); //Naprawdê myœla³eœ, ¿e dam ci tyle rudy.
        AI_Output (self, other ,"DIA_Sharky_Cheated_03_06"); //Jesteœ skoñczonym g³upcem!
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
   description	= "Sk¹d bierzesz swoje towary?";
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
    AI_Output (other, self ,"DIA_Sharky_Goods_15_01"); //Sk¹d bierzesz swoje towary?
    AI_Output (self, other ,"DIA_Sharky_Goods_03_02"); //Jestem paserem. Mam sporo znajomoœci w ca³ej Kolonii.
    AI_Output (self, other ,"DIA_Sharky_Goods_03_03"); //Czêsto dogadujê siê z kupcami z innych obozów i zaopatrujê ich w towary.
    AI_Output (self, other ,"DIA_Sharky_Goods_03_04"); //Znam ludzi od których mog¹ je wzi¹æ. 
    AI_Output (self, other ,"DIA_Sharky_Goods_03_05"); //Poza tym sprzedajê czêœæ broni, które wykuje Huan. Czêœæ te¿ dostaje po napadach na konwoje ze Starego Obozu.
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
   description	= "Co mo¿esz mi powiedzieæ o napadach?";
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
    AI_Output (other, self ,"DIA_Sharky_Napady_15_01"); //Co mo¿esz mi powiedzieæ o napadach?
    AI_Output (self, other ,"DIA_Sharky_Napady_03_02"); //Lares czêsto wysy³a Szkodników, aby zrabowaæ towary przenoszone ze Starego Obozu do Starej Kopalni.
    AI_Output (self, other ,"DIA_Sharky_Napady_03_03"); //Mamy umowê z Quentinem, przywódc¹ Bandytów z Kanionu Trolli. Sprawiedliwie dzielimy siê z³upionymi towarami.
    AI_Output (other, self ,"DIA_Sharky_Napady_03_04"); //Wiêc wasze obozy ¿yj¹ w przyjaŸni?
    AI_Output (self, other ,"DIA_Sharky_Napady_03_05"); //Jak najbardziej. W koñcu wiêkszoœæ Bandytów nale¿a³a kiedyœ do Nowego Obozu. 
    AI_Output (self, other ,"DIA_Sharky_Napady_03_06"); //Pamiêtam ich z czasów, gdy Nowy Obóz dopiero powstawa³. Razem walczyliœmy ze Stra¿nikami Gomeza w niejednej bitwie. 
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
   description	= "Co mo¿esz mi powiedzieæ o Quentinie?";
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
    AI_Output (other, self ,"DIA_Sharky_Quentin_15_01"); //Co mo¿esz mi powiedzieæ o Quentinie?
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_02"); //Zanim trafi³ do Kolonii, by³ jednym z piratów. Razem ze swoj¹ za³og¹ z³upili niejeden okrêt.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_03"); //Zamorska gildia Araxos niezwykle ucierpia³a z ich rêki. Mia³a ona mnóstwo statków, które kursowa³y miêdzy Khorinis, a kontynentem.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_04"); //Ponad po³owa z nich zosta³a zatopiona lub z³upiona przez piratów.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_05"); //Quentin zawsze wykazywa³ wielkie zdolnoœci przywódcze i czêsto kwestionowa³ zdanie Laresa.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_06"); //Dlatego wraz z czêœci¹ ch³opaków opuœcili Nowy Obóz - aby siê usamodzielniæ.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_07"); //Czas pokaza³, ¿e przywódca Bandytów jest nie tylko silny, ale i przebieg³y.
    AI_Output (self, other ,"DIA_Sharky_Quentin_03_08"); //Gomez nigdy nie dowiedzia³ siê gdzie znajduje siê ich Obóz. 
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
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_02"); //Nie tak ³atwo pos³aæ nas do piachu, cwaniaczku. 
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_03"); //W przeciwieñstwie do twoich ludzi...
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_04"); //Nie ¿yj¹? Zabiliœcie ich?
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_05"); //Pos³uchajcie, to, to... by³o jednorazowe. Andrew, s³yszysz?
	AI_Output		(self, other,"Org_843_Sharky_CATCHED_Info_10_06"); //Zapomnijmy o twoim ma³ym d³ugu i o zamieszaniu, które siê tutaj odby³o. Dobra?
	AI_Output		(other, self,"Org_843_Sharky_CATCHED_Info_15_07"); //Niech ci bêdzie. Spadaj, zanim zmienimy zdanie.
	Npc_ExchangeRoutine (Org_843_Sharky,"start");
	AI_StopProcessInfos (self);
};