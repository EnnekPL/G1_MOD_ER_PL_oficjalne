//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Artegor_EXIT(C_INFO)
{
	npc             = GRD_7001_Artegor;
	nr              = 999;
	condition		= DIA_Artegor_EXIT_Condition;
	information		= DIA_Artegor_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Artegor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Artegor_EXIT_Info()
{
	if (GoToOM == false)
	{
	AI_GotoWP (hero, "WYPAD"); 
	};
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Artegor_GoAway (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 2;
   condition    = DIA_Artegor_GoAway_Condition;
   information  = DIA_Artegor_GoAway_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Artegor_GoAway_Condition()
{
	if kapitel == 1
	{
    return TRUE;
	};
};


FUNC VOID DIA_Artegor_GoAway_Info()
{
	AI_Output (self, other ,"DIA_Artegor_GoAway_03_01"); //Czego tu chcesz? 
    AI_Output (other, self ,"DIA_Artegor_GoAway_15_01"); //Muszê wejœæ do kopalni.
    AI_Output (self, other ,"DIA_Artegor_GoAway_03_02"); //A ja muszê spotkaæ siê z Gomezem. Spadaj, jeœli nie nale¿ysz do naszych ludzi.

	Info_ClearChoices		(DIA_Artegor_GoAway);	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Chcê zostaæ Kopaczem.", DIA_Artegor_GoAway_KOPACZ);
	};
	if (Diego_BringList == LOG_RUNNING)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Wykonujê test zaufania. Wpuœæ mnie.", DIA_Artegor_GoAway_MOGE);
	}; 
	if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
	{
    Info_AddChoice		(DIA_Artegor_GoAway, "Przysy³a mnie Petro.", DIA_Artegor_GoAway_PRZYJECIE);
	};
	if (Npc_GetTrueGuild(hero) == GIL_NOV) ||  (Npc_GetTrueGuild(hero) == GIL_TPL)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Jestem cz³onkiem Bractwa. Mogê wejœæ...", DIA_Artegor_GoAway_BRACTWO);
	}; 
};

FUNC VOID DIA_Artegor_GoAway_KOPACZ()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_KOPACZ_15_01"); //Chcê zostaæ Kopaczem.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_KOPACZ_03_02"); //Jeœli naprawdê zale¿y ci ¿eby do nas do³¹czyæ, to idŸ do Starego Obozu i pogadaj z Lorenzo. Tutaj nic po tobie, dopóki nie bêdziesz jednym z nas.
};

FUNC VOID DIA_Artegor_GoAway_MOGE()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_MOGE_15_01"); //Wykonujê test zaufania. Wpuœæ mnie.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_MOGE_03_02"); //Ja te¿ wykonujê swoja robotê! Wynoœ siê. Nie chcê tu k³opotów!
};

FUNC VOID DIA_Artegor_GoAway_PRZYJECIE()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_PRZYJECIE_15_01"); //Przyszed³em z Petro i trzema ludŸmi do Kopalni. Mam tam pracowaæ. 
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_PRZYJECIE_03_02"); //Faktycznie, widzia³em trzy znajome twarze. PrzechodŸ i nie rób k³opotów.
	GoToOM = true;
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Artegor_GoAway_BRACTWO()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_BRACTWO_15_01"); //Jestem z Bractwa. Mam prawo wejœæ.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_BRACTWO_03_02"); //W takim razie wchodŸ.
    GoToOM = true;
	bractwoenter = true;
	AI_StopProcessInfos	(self);
};

/*
//========================================
//-----------------> WEJSCIE
//========================================

INSTANCE DIA_Artegor_WEJSCIE (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 2;
   condition    = DIA_Artegor_WEJSCIE_Condition;
   information  = DIA_Artegor_WEJSCIE_Info;
   permanent	= FALSE;
   important    = TRUE;
   //description	= "Chcê wejœæ do kopalni.";
};

FUNC INT DIA_Artegor_WEJSCIE_Condition()
{
    return TRUE;

};


FUNC VOID DIA_Artegor_WEJSCIE_Info()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_15_01"); //Chcê wejœæ do kopalni.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_03_02"); //Tak? A masz pozwolenie?
   // if (Diego_BringList == LOG_RUNNING)
   // {
//Info_ClearChoices		(DIA_Artegor_WEJSCIE);
//};
Info_ClearChoices		(DIA_Artegor_WEJSCIE);
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Chcê zostaæ Kopaczem.", DIA_Artegor_WEJSCIE_KOPACZ);
if (Diego_BringList == LOG_RUNNING)
{
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Wykonujê test zaufania. Wpuœæ mnie.", DIA_Artegor_WEJSCIE_MOGE);
}; 
if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
{
    Info_AddChoice		(DIA_Artegor_WEJSCIE, "Przysy³a mnie Gamal.", DIA_Artegor_WEJSCIE_PRZYJECIE);
};
if (Npc_GetTrueGuild(hero) == GIL_NOV) ||  (Npc_GetTrueGuild(hero) == GIL_TPL)
{
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Jestem cz³onkiem Bractwa. Mogê wejœæ...", DIA_Artegor_WEJSCIE_BRACTWO);
}; 
};
*/


/*
//========================================
//-----------------> POZWOLENIE
//========================================

INSTANCE DIA_Artegor_POZWOLENIE (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 3;
   condition    = DIA_Artegor_POZWOLENIE_Condition;
   information  = DIA_Artegor_POZWOLENIE_Info;
   permanent	= FALSE;
   description	= "Chyba jestem wystarczaj¹co lubiany...";
};

FUNC INT DIA_Artegor_POZWOLENIE_Condition()
{
    if (OpinionOM >= 2)
    && (MIS_MineEnter == LOG_RUNNING)
	&& (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_POZWOLENIE_Info()
{
    AI_Output (other, self ,"DIA_Artegor_POZWOLENIE_15_01"); //Chyba jestem wystarczaj¹co lubiany...
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_02"); //Tak, masz poparcie kilku osób. To wystarczy.
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_03"); //Mo¿esz przejœæ.
    B_LogEntry                     (CH1_MineEnter,"Artegor wpuœci³ mnie za palisadê. Muszê jeszcze porozmawiaæ z Artchem.");

    B_GiveXP (100);
    GoToOM = true;
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_04"); //Nie zapomnij pogadaæ z Artchem. On powie ci, co zrobiæ, ¿eby zostaæ Kopaczem.
    AI_Output (other, self ,"DIA_Artegor_POZWOLENIE_15_05"); //Nie omieszkam tego uczyniæ.
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> POZWOLENIE
//========================================

INSTANCE DIA_Artegor_DiegosTest (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 55;
   condition    = DIA_Artegor_DiegosTest_Condition;
   information  = DIA_Artegor_DiegosTest_Info;
   permanent	= FALSE;
   Important    = false;
   description	= "Przysy³a mnie Diego.";
};

FUNC INT DIA_Artegor_DiegosTest_Condition()
{
   if (Diego_BringList == LOG_RUNNING) && (GoToOM == false)
  {
    return TRUE;
   };
};


FUNC VOID DIA_Artegor_DiegosTest_Info()
{
    AI_Output (other, self ,"DIA_Artegor_DiegosTest_15_01"); //Przysy³a mnie Diego. Wykonujê test zaufania.
    AI_Output (self, other ,"DIA_Artegor_DiegosTest_03_02"); //Och, widzê, ¿e daleko zaszed³eœ. 
    AI_Output (self, other ,"DIA_Artegor_DiegosTest_03_03"); //Skoro Diego rêczy za ciebie, to chyba muszê ciê wpuœciæ. 
    B_GiveXP (100);
    GoToOM = true;
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> POZWOLENIE2
//========================================

INSTANCE DIA_Artegor_BoughtEnter (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 56;
   condition    = DIA_Artegor_BoughtEnter_Condition;
   information  = DIA_Artegor_BoughtEnter_Info;
   permanent	= FALSE;
   Important    = false;
   description	= "Chcê wykupiæ dostêp do kopalni.";
};

FUNC INT DIA_Artegor_BoughtEnter_Condition()
{
   if (GoToOM == false)
  {
    return TRUE;
   };
};


FUNC VOID DIA_Artegor_BoughtEnter_Info()
{
    AI_Output (other, self ,"DIA_Artegor_BoughtEnter_15_01"); //Chcê wykupiæ dostêp do kopalni.
    AI_Output (self, other ,"DIA_Artegor_BoughtEnter_03_02"); //Czy¿by ktoœ tu nauczy³ siê kraœæ?
    AI_Output (self, other ,"DIA_Artegor_BoughtEnter_03_03"); //To ciê bêdzie kosztowaæ 200 bry³ek rudy.
	B_LogEntry                     (CH1_MineEnter,"Za 200 bry³ek rudy Artegor przepuœci mnie bez ¿adnych ceregieli.");
};

//========================================
//-----------------> POZWOLENIE3
//========================================

INSTANCE DIA_Artegor_PayEnter (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 56;
   condition    = DIA_Artegor_PayEnter_Condition;
   information  = DIA_Artegor_PayEnter_Info;
   permanent	= FALSE;
   Important    = false;
   description	= "Mam 200 bry³ek rudy.";
};

FUNC INT DIA_Artegor_PayEnter_Condition()
{
   if (GoToOM == false) && (Npc_KnowsInfo (hero, DIA_Artegor_BoughtEnter)) && (Npc_HasItems (hero, ItMiNugget)>=200)
	{
    return TRUE;
   };
};


FUNC VOID DIA_Artegor_PayEnter_Info()
{
    AI_Output (other, self ,"DIA_Artegor_PayEnter_15_01"); //Mam 200 bry³ek rudy.
    AI_Output (self, other ,"DIA_Artegor_PayEnter_03_02"); //Dobra, w³aŸ.
    //AI_Output (self, other ,"DIA_Artegor_PayEnter_03_03"); //To ciê bêdzie kosztowaæ 200 bry³ek rudy.
	B_LogEntry                     (CH1_MineEnter,"Wykupi³em dostêp do kopalni.");
	B_GiveInvItems (hero, self, ItMiNugget, 200);
	GoToOM = true;
};
*/
//========================================
//-----------------> POZWOLENIE4
//========================================

INSTANCE DIA_Artegor_Lizusek (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 56;
   condition    = DIA_Artegor_Lizusek_Condition;
   information  = DIA_Artegor_Lizusek_Info;
   permanent	= FALSE;
   Important    = false;
   description	= "Przysy³a mnie Petro.";
};

FUNC INT DIA_Artegor_Lizusek_Condition()
{
   if Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY)
   && (GoToOM == false)
   {
   return TRUE;
   };
};


FUNC VOID DIA_Artegor_Lizusek_Info()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_PRZYJECIE_15_01"); //Przyszed³em z Petro i trzema ludŸmi do Kopalni. Mam tam pracowaæ. 
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_PRZYJECIE_03_02"); //Faktycznie, widzia³em trzy znajome twarze. PrzechodŸ i nie rób k³opotów.
	GoToOM = true;
	AI_StopProcessInfos	(self);
	
	/*
	//OpinionOM = 0;
	MIS_MineEnter = LOG_RUNNING;

    Log_CreateTopic            (CH1_MineEnter, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MineEnter, LOG_RUNNING);
    B_LogEntry                     (CH1_MineEnter,"Artegor powiedzia³, ¿e muszê zdobyæ zaufanie jeszcze dwóch osób, aby wejœæ do kopalni.");
    GoToOM = false;
    B_LogEntry                     (CH1_EasyJoinOC,"Muszê dostaæ siê do Starej Kopalni i pogadaæ z Ianem, ¿eby zostaæ Kopaczem.");
	AI_StopProcessInfos	(self);*/
};


//========================================
//-----------------> SHADOW
//========================================

INSTANCE DIA_Artegor_SHADOW (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_SHADOW_Condition;
   information  = DIA_Artegor_SHADOW_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_SHADOW_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_STT) && (GoToOM == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_SHADOW_Info()
{
    AI_Output (self, other ,"DIA_Artegor_SHADOW_03_01"); //No proszê! Widzê, ¿e ktoœ tu do³¹czy³ do jedynego s³usznego Obozu.
    AI_Output (self, other ,"DIA_Artegor_SHADOW_03_02"); //Dobra robota, ch³opcze. WchodŸ œmia³o do kopalni.
    AI_StopProcessInfos	(self);
	GoToOM = true;
};

//========================================
//-----------------> SZKODNIK
//========================================

INSTANCE DIA_Artegor_SZKODNIK (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 2;
   condition    = DIA_Artegor_SZKODNIK_Condition;
   information  = DIA_Artegor_SZKODNIK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_SZKODNIK_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_ORG) && (GoToOM == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_SZKODNIK_Info()
{
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_01"); //Czekaj!
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_02"); //Czego tu szukasz, szubrawco?
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_03"); //Znudzi³y wam siê napady na konwoje? Teraz Lares przysy³a szpiegów?
    AI_Output (other, self ,"DIA_Artegor_SZKODNIK_15_04"); //To nie tak. Mam wa¿ne interesy do za³atwienia w kopalni. Jestem nastawiony pokojowo.
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_05"); //Niech ci bêdzie, ale mam ciê na oku. Jeden fa³szywy ruch i wyprujê ci flaki!
    AI_StopProcessInfos	(self);
	GoToOM = true;
};

//========================================
//-----------------> BANDYTA
//========================================

INSTANCE DIA_Artegor_BANDYTA (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 3;
   condition    = DIA_Artegor_BANDYTA_Condition;
   information  = DIA_Artegor_BANDYTA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_BANDYTA_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU) && (GoToOM == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_BANDYTA_Info()
{
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_01"); //STÓJ, szujo!
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_02"); //Czego tu chcesz? ¯ycie ci nie mi³e?
    AI_Output (other, self ,"DIA_Artegor_BANDYTA_15_03"); //Mam sprawê do za³atwienia w kopalni. Pozwól mi przejœæ. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_04"); //Jeœli tylko zaczniesz sprawiaæ k³opoty, brudny Bandyto, po¿a³ujesz. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_05"); //Nie mogê siê doczekaæ, a¿ znajdziemy ten wasz zapchlony Obóz. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_06"); //W³aŸ!
    AI_StopProcessInfos	(self);
	GoToOM = true;
};

//========================================
//-----------------> NOVIZE
//========================================

INSTANCE DIA_Artegor_NOVIZE (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 4;
   condition    = DIA_Artegor_NOVIZE_Condition;
   information  = DIA_Artegor_NOVIZE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_NOVIZE_Condition()
{
    if ((Npc_GetTrueGuild(hero) == GIL_NOV) ||  (Npc_GetTrueGuild(hero) == GIL_TPL))
	&& (GoToOM == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_NOVIZE_Info()
{
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_01"); //STÓJ! Czego tutaj szukasz?
    AI_Output (other, self ,"DIA_Artegor_NOVIZE_15_02"); //Mam sprawê do za³atwienia w kopalni.
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_03"); //Ach, pewnie Guru wys³ali ciê jako wsparcie dla Œwi¹tynnych Stra¿ników.
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_04"); //Oczywiœcie mo¿esz przejœæ.
    AI_StopProcessInfos	(self);
	GoToOM = true;
	bractwoenter = true;
};


//========================================
//-----------------> GO_OUT
//========================================

INSTANCE DIA_Artegor_GO_OUT (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_GO_OUT_Condition;
   information  = DIA_Artegor_GO_OUT_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_GO_OUT_Condition()
{
    if (GoToOM == false) && (Npc_GetDistToWP (hero, "ENTER1") < 1000) && (Npc_KnowsInfo (hero, DIA_Artegor_GoAway))  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_GO_OUT_Info()
{
    AI_Output (self, other ,"DIA_Artegor_GO_OUT_03_01"); //Ej, ty! Nie mo¿esz wejœæ do kopalni. Spadaj!
};

//========================================
//-----------------> QuestIan_Succes
//========================================

INSTANCE DIA_Artegor_QuestIan_Succes (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_QuestIan_Succes_Condition;
   information  = DIA_Artegor_QuestIan_Succes_Info;
   permanent	= FALSE;
   description	= "Mirzo potajemnie sprzedawa³ jedzenie z dostaw.";
};

FUNC INT DIA_Artegor_QuestIan_Succes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_Caught))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_QuestIan_Succes_Info()
{
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_01"); //Mirzo potajemnie sprzedawa³ jedzenie z dostaw.
    AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_02"); //Czy¿by? Jak siê tego dowiedzia³eœ?
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_03"); //Œledzi³em go i widzia³em jak targowa³ siê z kilkoma Szkodnikami przy wejœciu do Nowego Obozu.
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_04"); //Kopacz Patrick twierdzi, ¿e widzia³ Mirzo wymykaj¹cego siê noc¹ z obozu.
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_05"); //Wszystko uk³ada siê w ca³oœæ. 
	if (Npc_IsDead(GRD_7007_Mirzo))
	{
	AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_07"); //Mirzo nie ¿yje. Rzuci³ siê na mnie, a ja nie mia³em zamiaru zostawiaæ go przy ¿yciu.
	AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_08"); //Nastêpnym razem nie zgrywaj twardziela. Zabijanie naszych ludzi nie jest mile widziane. Przeka¿ Ianowi, ¿e przy nastêpnej dostawie wszystko bêdzie w porz¹dku.
	}
	else
	{
	AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_06"); //W porz¹dku. Zajmiemy siê nim. Przeka¿ Ianowi, ¿e przy nastêpnej dostawie wszystko bêdzie w porz¹dku.
	};
    
    B_LogEntry                     (CH1_FoodForOldMine,"Artegor powiedzia³, ¿e jego ludzi zajm¹ siê Mirzo. Mi pozosta³o zameldowaæ Ianowi o wykonaniu zadania.");
	//Npc_ExchangeRoutine (EBR_102_Arto, "kox");
    //B_GiveXP (200);
	GRD_7007_Mirzo.flags = 0;
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "paka");
	GRD_7007_Mirzo.guild = GIL_NONE;
	AI_UnequipWeapons (GRD_7007_Mirzo);
	AI_UnequipArmor (GRD_7007_Mirzo);
};


//========================================
//-----------------> Konwoj
//========================================

INSTANCE DIA_Artegor_Konwoj (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_Konwoj_Condition;
   information  = DIA_Artegor_Konwoj_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_Konwoj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Eskorta_Go))
    && (Npc_IsDead(GRD_5055_Eskorta))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_Konwoj_Info()
{
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_01"); //To wy mieliœcie przyprowadziæ konwój?
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_02"); //Tak. Niestety, jeden z naszych poleg³.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_03"); //A tragarze prze¿yli?
if (Npc_IsDead(VLK_5090_Tragaz)) || (Npc_IsDead(VLK_5088_Tragaz)) || (Npc_IsDead(VLK_5089_Tragaz))
{
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_04"); //Niestety, nie wszyscy.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_05"); //Mieli dotrzeæ wszyscy!
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_06"); //Jak zwykle nawali³eœ!
    B_LogEntry                     (CH2_BuddlersEscort,"Stra¿nik konwoju nie prze¿y³. Artegor odebra³ dostawê, jednak nie by³ zbyt zadowolony z braku tragarzy.");
    Log_SetTopicStatus       (CH2_BuddlersEscort, LOG_FAILED);
    MIS_BuddlersEscort = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Eskorta Kopaczy! ", 1,-1,"font_new_10_red.tga",2);	
}
else
{
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_07"); //Wszyscy tragarze prze¿yli.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_08"); //I dobrze, reszta mnie nie obchodzi.
    B_LogEntry                     (CH2_BuddlersEscort,"Tragarze dotarli w jednym kawa³ku. Niestety, nie prze¿y³ g³ówny stra¿nik konwoju. Zamiast niego odprawi³ mnie Artegor.");
    Log_SetTopicStatus       (CH2_BuddlersEscort, LOG_SUCCESS);
    MIS_BuddlersEscort = LOG_SUCCESS;

    B_GiveXP (300);
};   
	if (!Npc_IsDead(GRD_5054_Gardist))
	{
	GRD_5054_Gardist.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (GRD_5054_Gardist,"start");
	};
	if (!Npc_IsDead(GRD_5053_Gardist))
	{
	GRD_5053_Gardist.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (GRD_5053_Gardist,"start");
	};
	if (!Npc_IsDead(VLK_5089_Tragaz))
	{
	VLK_5089_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (VLK_5089_Tragaz,"camp");	
	};
	if (!Npc_IsDead(VLK_5088_Tragaz))
	{
	VLK_5088_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (VLK_5088_Tragaz,"camp");
	};
	if (!Npc_IsDead(VLK_5088_Tragaz))
	{
	VLK_5090_Tragaz.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (VLK_5090_Tragaz,"camp");
	};	
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Cheat
//========================================

INSTANCE DIA_Artegor_Cheat (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 3;
   condition    = DIA_Artegor_Cheat_Condition;
   information  = DIA_Artegor_Cheat_Info;
   permanent	= FALSE;
   description	= "Jesteœ pilnie potrzebny w Kopalni!";
};

FUNC INT DIA_Artegor_Cheat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Peratur_GoDown)) && (ArtegorIsDistracted == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_Cheat_Info()
{
    AI_Output (other, self ,"DIA_Artegor_Cheat_15_01"); //Jesteœ pilnie potrzebny w Kopalni!
    AI_Output (self, other ,"DIA_Artegor_Cheat_03_02"); //A niby co jest wa¿niejszego od pilnowania g³ównego wejœcia?
	
	Info_ClearChoices		(DIA_Artegor_Cheat);	
	Info_AddChoice			(DIA_Artegor_Cheat, "Kopalniê zala³a podziemna rzeka!", DIA_Artegor_Cheat_Water);
	Info_AddChoice			(DIA_Artegor_Cheat, "Kopacze organizuj¹ zryw!", DIA_Artegor_Cheat_Buddlers);
	Info_AddChoice			(DIA_Artegor_Cheat, "Nie mam pojêcia. Dowiesz siê w œrodku.", DIA_Artegor_Cheat_Inside);
};

FUNC VOID DIA_Artegor_Cheat_Water ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Water_15_01"); //Kopalniê zala³a podziemna rzeka!
    AI_Output (self, other ,"DIA_Artegor_Cheat_Water_03_02"); //Co ty za durnoty mi wciskasz?! Mamy najlepszych in¿ynierów w ca³ej cholernej Kolonii. Nie ma najmniejszych szans, ¿eby coœ takiego siê sta³o.
	AI_Output (self, other ,"DIA_Artegor_Cheat_Water_03_03"); //Nie wiem co kombinujesz, ale bêdê ciê od teraz mia³ na oku.
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to doœæ trudny do wykiwania goœæ. Muszê wszcz¹æ bójkê z K³ykaczem. Innego wyboru nie mam.");
};

FUNC VOID DIA_Artegor_Cheat_Buddlers ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Buddlers_15_01"); //Kopacze organizuj¹ zryw!
	if (Npc_GetTrueGuild(hero) == GIL_STT) ||  (Npc_GetTrueGuild(hero) == GIL_GRD) ||  (Npc_GetTrueGuild(hero) == GIL_KDF) ||  (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
    AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_02"); //Jasna cholera, i dopiero teraz mi o tym mówisz?! Z drogi. Zostañ tu i nie wpuszczaj ¿adnych mêtów do Kopalni.
	AI_Output (other, self ,"DIA_Artegor_Cheat_Buddlers_15_03"); //Có¿ za zaszczyt.
	AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_04"); //A ¿ebyœ kurwa wiedzia³, ¿e zaszczyt. 
	Info_ClearChoices		(DIA_Artegor_Cheat);
	Npc_ExchangeRoutine 	(self,"distracted");
	AI_StopProcessInfos		(self);
	B_LogEntry				(CH1_GhoransVine, "Szczêœliwie uda³o mi siê odci¹gn¹æ te¿ Artegora. Myœlê, ¿e niema³e znaczenie mia³o to, ¿e jestem cz³onkiem Starego Obozu. Mam nadziejê, ¿e Abel zd¹¿y³ prysn¹æ.");
	ArtegorIsDistracted = true;
	B_GiveXP (100);
	var c_npc abel;
	abel = Hlp_GetNpc(VLK_7003_Abel);
	AI_STANDUP (abel);
	
	CreateInvItem (Abel, ItFo_Potion_Haste_01);
	AI_USEITEM (Abel, ItFo_Potion_Haste_01);
	Npc_ExchangeRoutine (Abel,"run"); 
	AI_SetWalkmode(Abel, NPC_RUN);
	AI_GotoWP (ABel, "OW_PATH_266");
	}
	else
	{
	AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_05"); //Nie wiem co kombinujesz, ale nie nabiorê siê na twoje dowcipy. Spadaj st¹d!
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to doœæ trudny do wykiwania goœæ. Muszê wszcz¹æ bójkê z K³ykaczem. Innego wyboru nie mam.");
	};
};

FUNC VOID DIA_Artegor_Cheat_Inside ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Inside_15_01"); //Nie mam pojêcia. Dowiesz siê w œrodku.
    AI_Output (self, other ,"DIA_Artegor_Cheat_Inside_03_02"); //Nie mam zamiaru siê niczego dowiadywaæ. ZejdŸ mi z oczu!
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to doœæ trudny do wykiwania goœæ. Muszê wszcz¹æ bójkê z K³ykaczem. Innego wyboru nie mam.");
};

//========================================
//-----------------> FIGHTWITHKLYKACZ
//========================================

INSTANCE DIA_Artegor_FIGHTWITHKLYKACZ (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_FIGHTWITHKLYKACZ_Condition;
   information  = DIA_Artegor_FIGHTWITHKLYKACZ_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_FIGHTWITHKLYKACZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Oczekujacy_Attack))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_FIGHTWITHKLYKACZ_Info()
{
    AI_Output (self, other ,"DIA_Artegor_FIGHTWITHKLYKACZ_03_01"); //Co tutaj siê do cholery dzieje?
    AI_Output (self, other ,"DIA_Artegor_FIGHTWITHKLYKACZ_03_02"); //Uspokoiæ siê, natychmiast! 
    AI_Output (other, self ,"DIA_Artegor_FIGHTWITHKLYKACZ_15_03"); //Spokojnie. Ju¿ po wszystkim. 
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EveryoneDie
//========================================

INSTANCE DIA_Artegor_EveryoneDie (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 1;
   condition    = DIA_Artegor_EveryoneDie_Condition;
   information  = DIA_Artegor_EveryoneDie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_EveryoneDie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_ZlatwioneXDXD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_EveryoneDie_Info()
{
    AI_Output (self, other ,"DIA_Artegor_EveryoneDie_03_01"); //Tyyy! (zipie) Czego tu szukasz? Khe... khe...
    AI_Output (other, self ,"DIA_Artegor_EveryoneDie_15_02"); //Co tu siê do cholery sta³o? Jesteœ ca³y we krwi.
    AI_Output (self, other ,"DIA_Artegor_EveryoneDie_03_03"); //Pytasz co siê sta³o? Przecie¿ doskonale wiesz. Ja te¿ wiem, ¿e macza³eœ w tym palce... Od kiedy tylko pojawi³eœ siê w Kolonii psujesz tylko wszystkim krew.
	Info_ClearChoices		(DIA_Artegor_EveryoneDie);	
	Info_AddChoice			(DIA_Artegor_EveryoneDie, "WeŸ te miksturê lecznicz¹.", DIA_Artegor_EveryoneDie_Help);
	Info_AddChoice			(DIA_Artegor_EveryoneDie, "Zas³u¿y³eœ na taki los.", DIA_Artegor_EveryoneDie_DieMdfk);
	
	if (MIS_BackToOldMine == LOG_RUNNING)
	{
    B_LogEntry                     (CH4_BackToOldMine,"Wszystko u³o¿y³o siê zgodnie z planem Quentina. Gomez wys³a³ du¿y oddzia³ Stra¿ników w kierunku kopalni. Walka by³a wyrównana. Ostatnim, który prze¿y³, by³ Artegor.");
	};
    B_GiveXP (300);
};

FUNC VOID DIA_Artegor_EveryoneDie_Help ()
{
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_Help_15_01"); //WeŸ te miksturê lecznicz¹.
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_Help_03_02"); //(pluje) Pfu! Wypchaj siê ni¹.
	Info_ClearChoices		(DIA_Artegor_EveryoneDie);
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"die");
};

FUNC VOID DIA_Artegor_EveryoneDie_DieMdfk ()
{
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_DieMdfk_15_01"); //Zas³u¿y³eœ na taki los. Teraz bêdziesz zdycha³ wœród tych trupów. Co ty sobie w ogóle myœla³eœ? Chcia³eœ z grup¹ Stra¿ników stawiæ czo³a Gomezowi?
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_DieMdfk_03_02"); //Khe... Khe... Mo¿e nie tyle stawiæ czo³a co wreszcie siê... oderwaæ. 
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_DieMdfk_15_03"); //To nie mia³o szansy powodzenia.
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_DieMdfk_03_04"); //Wynoœ siê st¹d, sukinsynu. Daj mi umrzeæ w spokoju.
	Info_ClearChoices		(DIA_Artegor_EveryoneDie);
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"die");
};

//========================================
//-----------------> Zaczekaj
//========================================

INSTANCE DIA_Artegor_Zaczekaj (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 2;
   condition    = DIA_Artegor_Zaczekaj_Condition;
   information  = DIA_Artegor_Zaczekaj_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_Zaczekaj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_EveryoneDie)) && (MIS_HelpBrothersBra == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_Zaczekaj_Info()
{
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_01"); //Zaczekaj. W g³êbi obozu jest kilku jeñców z Bractwa.
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_02"); //Pewnie czekaj¹ na ratunek.
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_03"); //Mo¿esz im powiedzieæ, ¿e s¹ wolni.
    
    
        B_LogEntry                     (CH1_HelpBrothersBra ,"Artegor pozwoli³ mi uwolniæ moich braci z Obozu na bagnie.");

        B_GiveXP (200);
    
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> PELZACZE
//========================================

INSTANCE DIA_Artegor_PELZACZE (C_INFO)
{
   npc          = GRD_7001_Artegor;
   nr           = 5;
   condition    = DIA_Artegor_PELZACZE_Condition;
   information  = DIA_Artegor_PELZACZE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Artegor_PELZACZE_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_AFTERALL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Artegor_PELZACZE_Info()
{
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_01"); //No proszê, ch³opcze, za³atwi³eœ nasze problemy z pe³zaczami.
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_02"); //Asghan naprawdê ciê zachwala³. Dobra robota!
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_03"); //Przyda³by siê nam ktoœ taki jak ty do pomocy w kopalni.
    AI_StopProcessInfos	(self);
};

