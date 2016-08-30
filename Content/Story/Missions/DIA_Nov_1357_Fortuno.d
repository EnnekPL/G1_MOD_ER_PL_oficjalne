//poprawione i sprawdzone - Nocturn

// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_Fortuno_EXIT (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 999;
	condition	= DIA_Fortuno_EXIT_Condition;
	information	= DIA_Fortuno_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_Fortuno_Greet (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_Greet_Condition;
	information	= DIA_Fortuno_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_Greet_Info()
{
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //Chod� bli�ej! Ka�dy nowoprzyby�y otrzymuje od Bractwa powitalny prezent!
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance  DIA_Fortuno_GetGeschenk (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_GetGeschenk_Condition;
	information	= DIA_Fortuno_GetGeschenk_Info;
	permanent	= 0;
	description = "Co to za prezent?";
};                       

FUNC int  DIA_Fortuno_GetGeschenk_Condition()
{
if (Kapitel < 4) && (Npc_KnowsInfo(hero,DIA_Fortuno_Greet))
{
	return 1; };
};

FUNC VOID  DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output (other, self,"DIA_Fortuno_GetGeschenk_15_00"); //Co to za prezent?
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //To Mrok P�nocy - dobry towar!
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Mo�esz do mnie przychodzi� codziennie po now� porcj�, ale gdyby� chcia� dosta� wi�cej ni� przewiduje dzienna racja, b�dziesz musia� zap�aci�.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Gdyby� znalaz� jakie� zio�a lub owoce mo�esz je przynie�� do mnie. Ch�tnie je od ciebie odkupi�.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Fortuno handluje bagiennym zielem. Znajd� go pod laboratorium alchemicznym.");
};

// **************************************************
//				T�gliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "Przyszed�em po moj� codzienn� porcj� ziela.";
};                       

FUNC int  DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_DailyRation_Info()
{
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //Przyszed�em po moj� codzienn� porcj� ziela.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Prosz� bardzo. Trzy sztuki Mroku P�nocy. Tylko nie wypal wszystkiego na raz!
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //Dosta�e� ju� dzi� swoj� porcj�. Je�li chcesz wi�cej, b�dziesz musia� zap�aci�. Najlepiej przyjd� jutro.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Fortuno_BuyJoints (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 4;
	condition	= DIA_Fortuno_BuyJoints_Condition;
	information	= DIA_Fortuno_BuyJoints_Info;
	permanent	= 1;
	description = "Chc� co� kupi�.";
	Trade		= 1;
};                       

FUNC int  DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_BuyJoints_Info()
{
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Chc� co� kupi�.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Czego szukasz? A mo�e chcesz co� sprzeda�?
};

//========================================
//-----------------> JointyBandytow
//========================================

INSTANCE DIA_Fortuno_JointyBandytow (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_JointyBandytow_Condition;
   information  = DIA_Fortuno_JointyBandytow_Info;
   permanent	= FALSE;
   description	= "Sprzedawa�e� co� ostatnio do Obozu Bandyt�w?";
};

FUNC INT DIA_Fortuno_JointyBandytow_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AboutRatford))
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_JointyBandytow_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_01"); //Sprzedawa�e� co� ostatnio do Obozu Bandyt�w?
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_02"); //Te� pytanie. Ci�gle co� tam sprzedaj�. Spotykam si� z Ratfordem i Draxem. Oni odbieraj� ziele dla ca�ego Obozu, a ja zgarniam rud�.
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_03"); //Pono� sprzeda�e� im ostatnio co� wyj�tkowego. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_04"); //O, tak, tak. To Oddech �ni�cego. Ma niez�ego kopa. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_05"); //Jak chcesz to sprzedam ci lufk� za 100 bry�ek rudy. 
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_06"); //Co tak drogo? 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_07"); //Satysfakcja gwarantowana. Poza tym... te� musz� z czego� �y�.
};

//========================================
//-----------------> GiveBreathSlepper
//========================================

INSTANCE DIA_Fortuno_GiveBreathSlepper (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 2;
   condition    = DIA_Fortuno_GiveBreathSlepper_Condition;
   information  = DIA_Fortuno_GiveBreathSlepper_Info;
   permanent	= TRUE;
   description	= "Dawaj ten Oddech �ni�cego. ";
};

FUNC INT DIA_Fortuno_GiveBreathSlepper_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fortuno_JointyBandytow))
    && (MIS_CourierFireMage == LOG_RUNNING) 
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_GiveBreathSlepper_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_GiveBreathSlepper_15_01"); //Dawaj ten Oddech �ni�cego. 
    AI_Output (self, other ,"DIA_Fortuno_GiveBreathSlepper_03_02"); //Prosz� bardzo. 
    CreateInvItems (self, ItMis_SlepperBreathJoint, 1);
    B_GiveInvItems (self, other, ItMis_SlepperBreathJoint, 1);
    B_GiveInvItems (other, self, ItMiNugget, 100);
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> CoTamZToba
//========================================

INSTANCE DIA_Fortuno_CoTamZToba (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_CoTamZToba_Condition;
   information  = DIA_Fortuno_CoTamZToba_Info;
   permanent	= FALSE;
   description	= "Fortuno! To ty?";
};

FUNC INT DIA_Fortuno_CoTamZToba_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_CoTamZToba_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_01"); //Fortuno! To ty?
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_02"); //Czarne cienie nad nami wkr�tce pogr��� ten �wiat.
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_03"); //Och nie! Zostaw mnie! Ja nie chc�! Ja nie chc�!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_04"); //AAAAA! �wi�tynia w dalekiej krainie? Ale jak?! Ja nie potrafi�!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_05"); //Adanosie zmi�uj si� nade mn�!
    AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_06"); //Czy wszystko w porz�dku?
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_07"); //Jarkendar? Nigdy nie s�ysza�em o tym miejscu.
	AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_08"); //Nie zmusisz mnie do tego! Zostaw mnie!
	AI_TurnAway (hero,self);
	AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_09"); //Najlepiej zostawi� go w spokoju, wida� �e nie najlepiej zni�s� upadek �ni�cego. 
	
};

