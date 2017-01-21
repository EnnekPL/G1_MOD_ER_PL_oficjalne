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
    AI_Output (other, self ,"DIA_Artegor_GoAway_15_01"); //Musz� wej�� do kopalni.
    AI_Output (self, other ,"DIA_Artegor_GoAway_03_02"); //A ja musz� spotka� si� z Gomezem. Spadaj, je�li nie nale�ysz do naszych ludzi.

	Info_ClearChoices		(DIA_Artegor_GoAway);	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Chc� zosta� Kopaczem.", DIA_Artegor_GoAway_KOPACZ);
	};
	if (Diego_BringList == LOG_RUNNING)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Wykonuj� test zaufania. Wpu�� mnie.", DIA_Artegor_GoAway_MOGE);
	}; 
	if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
	{
    Info_AddChoice		(DIA_Artegor_GoAway, "Przysy�a mnie Petro.", DIA_Artegor_GoAway_PRZYJECIE);
	};
	if (Npc_GetTrueGuild(hero) == GIL_NOV) ||  (Npc_GetTrueGuild(hero) == GIL_TPL)
	{
	Info_AddChoice		(DIA_Artegor_GoAway, "Jestem cz�onkiem Bractwa. Mog� wej��...", DIA_Artegor_GoAway_BRACTWO);
	}; 
};

FUNC VOID DIA_Artegor_GoAway_KOPACZ()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_KOPACZ_15_01"); //Chc� zosta� Kopaczem.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_KOPACZ_03_02"); //Je�li naprawd� zale�y ci �eby do nas do��czy�, to id� do Starego Obozu i pogadaj z Lorenzo. Tutaj nic po tobie, dop�ki nie b�dziesz jednym z nas.
};

FUNC VOID DIA_Artegor_GoAway_MOGE()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_MOGE_15_01"); //Wykonuj� test zaufania. Wpu�� mnie.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_MOGE_03_02"); //Ja te� wykonuj� swoja robot�! Wyno� si�. Nie chc� tu k�opot�w!
};

FUNC VOID DIA_Artegor_GoAway_PRZYJECIE()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_PRZYJECIE_15_01"); //Przyszed�em z Petro i trzema lud�mi do Kopalni. Mam tam pracowa�. 
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_PRZYJECIE_03_02"); //Faktycznie, widzia�em trzy znajome twarze. Przechod� i nie r�b k�opot�w.
	GoToOM = true;
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Artegor_GoAway_BRACTWO()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_BRACTWO_15_01"); //Jestem z Bractwa. Mam prawo wej��.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_BRACTWO_03_02"); //W takim razie wchod�.
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
   //description	= "Chc� wej�� do kopalni.";
};

FUNC INT DIA_Artegor_WEJSCIE_Condition()
{
    return TRUE;

};


FUNC VOID DIA_Artegor_WEJSCIE_Info()
{
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_15_01"); //Chc� wej�� do kopalni.
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_03_02"); //Tak? A masz pozwolenie?
   // if (Diego_BringList == LOG_RUNNING)
   // {
//Info_ClearChoices		(DIA_Artegor_WEJSCIE);
//};
Info_ClearChoices		(DIA_Artegor_WEJSCIE);
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Chc� zosta� Kopaczem.", DIA_Artegor_WEJSCIE_KOPACZ);
if (Diego_BringList == LOG_RUNNING)
{
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Wykonuj� test zaufania. Wpu�� mnie.", DIA_Artegor_WEJSCIE_MOGE);
}; 
if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
{
    Info_AddChoice		(DIA_Artegor_WEJSCIE, "Przysy�a mnie Gamal.", DIA_Artegor_WEJSCIE_PRZYJECIE);
};
if (Npc_GetTrueGuild(hero) == GIL_NOV) ||  (Npc_GetTrueGuild(hero) == GIL_TPL)
{
Info_AddChoice		(DIA_Artegor_WEJSCIE, "Jestem cz�onkiem Bractwa. Mog� wej��...", DIA_Artegor_WEJSCIE_BRACTWO);
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
   description	= "Chyba jestem wystarczaj�co lubiany...";
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
    AI_Output (other, self ,"DIA_Artegor_POZWOLENIE_15_01"); //Chyba jestem wystarczaj�co lubiany...
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_02"); //Tak, masz poparcie kilku os�b. To wystarczy.
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_03"); //Mo�esz przej��.
    B_LogEntry                     (CH1_MineEnter,"Artegor wpu�ci� mnie za palisad�. Musz� jeszcze porozmawia� z Artchem.");

    B_GiveXP (100);
    GoToOM = true;
    AI_Output (self, other ,"DIA_Artegor_POZWOLENIE_03_04"); //Nie zapomnij pogada� z Artchem. On powie ci, co zrobi�, �eby zosta� Kopaczem.
    AI_Output (other, self ,"DIA_Artegor_POZWOLENIE_15_05"); //Nie omieszkam tego uczyni�.
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
   description	= "Przysy�a mnie Diego.";
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
    AI_Output (other, self ,"DIA_Artegor_DiegosTest_15_01"); //Przysy�a mnie Diego. Wykonuj� test zaufania.
    AI_Output (self, other ,"DIA_Artegor_DiegosTest_03_02"); //Och, widz�, �e daleko zaszed�e�. 
    AI_Output (self, other ,"DIA_Artegor_DiegosTest_03_03"); //Skoro Diego r�czy za ciebie, to chyba musz� ci� wpu�ci�. 
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
   description	= "Chc� wykupi� dost�p do kopalni.";
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
    AI_Output (other, self ,"DIA_Artegor_BoughtEnter_15_01"); //Chc� wykupi� dost�p do kopalni.
    AI_Output (self, other ,"DIA_Artegor_BoughtEnter_03_02"); //Czy�by kto� tu nauczy� si� kra��?
    AI_Output (self, other ,"DIA_Artegor_BoughtEnter_03_03"); //To ci� b�dzie kosztowa� 200 bry�ek rudy.
	B_LogEntry                     (CH1_MineEnter,"Za 200 bry�ek rudy Artegor przepu�ci mnie bez �adnych ceregieli.");
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
   description	= "Mam 200 bry�ek rudy.";
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
    AI_Output (other, self ,"DIA_Artegor_PayEnter_15_01"); //Mam 200 bry�ek rudy.
    AI_Output (self, other ,"DIA_Artegor_PayEnter_03_02"); //Dobra, w�a�.
    //AI_Output (self, other ,"DIA_Artegor_PayEnter_03_03"); //To ci� b�dzie kosztowa� 200 bry�ek rudy.
	B_LogEntry                     (CH1_MineEnter,"Wykupi�em dost�p do kopalni.");
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
   description	= "Przysy�a mnie Petro.";
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
    AI_Output (other, self ,"DIA_Artegor_WEJSCIE_PRZYJECIE_15_01"); //Przyszed�em z Petro i trzema lud�mi do Kopalni. Mam tam pracowa�. 
    AI_Output (self, other ,"DIA_Artegor_WEJSCIE_PRZYJECIE_03_02"); //Faktycznie, widzia�em trzy znajome twarze. Przechod� i nie r�b k�opot�w.
	GoToOM = true;
	AI_StopProcessInfos	(self);
	
	/*
	//OpinionOM = 0;
	MIS_MineEnter = LOG_RUNNING;

    Log_CreateTopic            (CH1_MineEnter, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MineEnter, LOG_RUNNING);
    B_LogEntry                     (CH1_MineEnter,"Artegor powiedzia�, �e musz� zdoby� zaufanie jeszcze dw�ch os�b, aby wej�� do kopalni.");
    GoToOM = false;
    B_LogEntry                     (CH1_EasyJoinOC,"Musz� dosta� si� do Starej Kopalni i pogada� z Ianem, �eby zosta� Kopaczem.");
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
    AI_Output (self, other ,"DIA_Artegor_SHADOW_03_01"); //No prosz�! Widz�, �e kto� tu do��czy� do jedynego s�usznego Obozu.
    AI_Output (self, other ,"DIA_Artegor_SHADOW_03_02"); //Dobra robota, ch�opcze. Wchod� �mia�o do kopalni.
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
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_03"); //Znudzi�y wam si� napady na konwoje? Teraz Lares przysy�a szpieg�w?
    AI_Output (other, self ,"DIA_Artegor_SZKODNIK_15_04"); //To nie tak. Mam wa�ne interesy do za�atwienia w kopalni. Jestem nastawiony pokojowo.
    AI_Output (self, other ,"DIA_Artegor_SZKODNIK_03_05"); //Niech ci b�dzie, ale mam ci� na oku. Jeden fa�szywy ruch i wypruj� ci flaki!
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
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_01"); //ST�J, szujo!
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_02"); //Czego tu chcesz? �ycie ci nie mi�e?
    AI_Output (other, self ,"DIA_Artegor_BANDYTA_15_03"); //Mam spraw� do za�atwienia w kopalni. Pozw�l mi przej��. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_04"); //Je�li tylko zaczniesz sprawia� k�opoty, brudny Bandyto, po�a�ujesz. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_05"); //Nie mog� si� doczeka�, a� znajdziemy ten wasz zapchlony Ob�z. 
    AI_Output (self, other ,"DIA_Artegor_BANDYTA_03_06"); //W�a�!
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
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_01"); //ST�J! Czego tutaj szukasz?
    AI_Output (other, self ,"DIA_Artegor_NOVIZE_15_02"); //Mam spraw� do za�atwienia w kopalni.
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_03"); //Ach, pewnie Guru wys�ali ci� jako wsparcie dla �wi�tynnych Stra�nik�w.
    AI_Output (self, other ,"DIA_Artegor_NOVIZE_03_04"); //Oczywi�cie mo�esz przej��.
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
    AI_Output (self, other ,"DIA_Artegor_GO_OUT_03_01"); //Ej, ty! Nie mo�esz wej�� do kopalni. Spadaj!
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
   description	= "Mirzo potajemnie sprzedawa� jedzenie z dostaw.";
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
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_01"); //Mirzo potajemnie sprzedawa� jedzenie z dostaw.
    AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_02"); //Czy�by? Jak si� tego dowiedzia�e�?
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_03"); //�ledzi�em go i widzia�em jak targowa� si� z kilkoma Szkodnikami przy wej�ciu do Nowego Obozu.
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_04"); //Kopacz Patrick twierdzi, �e widzia� Mirzo wymykaj�cego si� noc� z obozu.
    AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_05"); //Wszystko uk�ada si� w ca�o��. 
	if (Npc_IsDead(GRD_7007_Mirzo))
	{
	AI_Output (other, self ,"DIA_Artegor_QuestIan_Succes_15_07"); //Mirzo nie �yje. Rzuci� si� na mnie, a ja nie mia�em zamiaru zostawia� go przy �yciu.
	AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_08"); //Nast�pnym razem nie zgrywaj twardziela. Zabijanie naszych ludzi nie jest mile widziane. Przeka� Ianowi, �e przy nast�pnej dostawie wszystko b�dzie w porz�dku.
	}
	else
	{
	AI_Output (self, other ,"DIA_Artegor_QuestIan_Succes_03_06"); //W porz�dku. Zajmiemy si� nim. Przeka� Ianowi, �e przy nast�pnej dostawie wszystko b�dzie w porz�dku.
	};
    
    B_LogEntry                     (CH1_FoodForOldMine,"Artegor powiedzia�, �e jego ludzi zajm� si� Mirzo. Mi pozosta�o zameldowa� Ianowi o wykonaniu zadania.");
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
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_01"); //To wy mieli�cie przyprowadzi� konw�j?
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_02"); //Tak. Niestety, jeden z naszych poleg�.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_03"); //A tragarze prze�yli?
if (Npc_IsDead(VLK_5090_Tragaz)) || (Npc_IsDead(VLK_5088_Tragaz)) || (Npc_IsDead(VLK_5089_Tragaz))
{
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_04"); //Niestety, nie wszyscy.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_05"); //Mieli dotrze� wszyscy!
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_06"); //Jak zwykle nawali�e�!
    B_LogEntry                     (CH2_BuddlersEscort,"Stra�nik konwoju nie prze�y�. Artegor odebra� dostaw�, jednak nie by� zbyt zadowolony z braku tragarzy.");
    Log_SetTopicStatus       (CH2_BuddlersEscort, LOG_FAILED);
    MIS_BuddlersEscort = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Eskorta Kopaczy! ", 1,-1,"font_new_10_red.tga",2);	
}
else
{
    AI_Output (other, self ,"DIA_Artegor_Konwoj_15_07"); //Wszyscy tragarze prze�yli.
    AI_Output (self, other ,"DIA_Artegor_Konwoj_03_08"); //I dobrze, reszta mnie nie obchodzi.
    B_LogEntry                     (CH2_BuddlersEscort,"Tragarze dotarli w jednym kawa�ku. Niestety, nie prze�y� g��wny stra�nik konwoju. Zamiast niego odprawi� mnie Artegor.");
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
   description	= "Jeste� pilnie potrzebny w Kopalni!";
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
    AI_Output (other, self ,"DIA_Artegor_Cheat_15_01"); //Jeste� pilnie potrzebny w Kopalni!
    AI_Output (self, other ,"DIA_Artegor_Cheat_03_02"); //A niby co jest wa�niejszego od pilnowania g��wnego wej�cia?
	
	Info_ClearChoices		(DIA_Artegor_Cheat);	
	Info_AddChoice			(DIA_Artegor_Cheat, "Kopalni� zala�a podziemna rzeka!", DIA_Artegor_Cheat_Water);
	Info_AddChoice			(DIA_Artegor_Cheat, "Kopacze organizuj� zryw!", DIA_Artegor_Cheat_Buddlers);
	Info_AddChoice			(DIA_Artegor_Cheat, "Nie mam poj�cia. Dowiesz si� w �rodku.", DIA_Artegor_Cheat_Inside);
};

FUNC VOID DIA_Artegor_Cheat_Water ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Water_15_01"); //Kopalni� zala�a podziemna rzeka!
    AI_Output (self, other ,"DIA_Artegor_Cheat_Water_03_02"); //Co ty za durnoty mi wciskasz?! Mamy najlepszych in�ynier�w w ca�ej cholernej Kolonii. Nie ma najmniejszych szans, �eby co� takiego si� sta�o.
	AI_Output (self, other ,"DIA_Artegor_Cheat_Water_03_03"); //Nie wiem co kombinujesz, ale b�d� ci� od teraz mia� na oku.
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to do�� trudny do wykiwania go��. Musz� wszcz�� b�jk� z K�ykaczem. Innego wyboru nie mam.");
};

FUNC VOID DIA_Artegor_Cheat_Buddlers ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Buddlers_15_01"); //Kopacze organizuj� zryw!
	if (Npc_GetTrueGuild(hero) == GIL_STT) ||  (Npc_GetTrueGuild(hero) == GIL_GRD) ||  (Npc_GetTrueGuild(hero) == GIL_KDF) ||  (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
    AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_02"); //Jasna cholera, i dopiero teraz mi o tym m�wisz?! Z drogi. Zosta� tu i nie wpuszczaj �adnych m�t�w do Kopalni.
	AI_Output (other, self ,"DIA_Artegor_Cheat_Buddlers_15_03"); //C� za zaszczyt.
	AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_04"); //A �eby� kurwa wiedzia�, �e zaszczyt. 
	Info_ClearChoices		(DIA_Artegor_Cheat);
	Npc_ExchangeRoutine 	(self,"distracted");
	AI_StopProcessInfos		(self);
	B_LogEntry				(CH1_GhoransVine, "Szcz�liwie uda�o mi si� odci�gn�� te� Artegora. My�l�, �e niema�e znaczenie mia�o to, �e jestem cz�onkiem Starego Obozu. Mam nadziej�, �e Abel zd��y� prysn��.");
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
	AI_Output (self, other ,"DIA_Artegor_Cheat_Buddlers_03_05"); //Nie wiem co kombinujesz, ale nie nabior� si� na twoje dowcipy. Spadaj st�d!
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to do�� trudny do wykiwania go��. Musz� wszcz�� b�jk� z K�ykaczem. Innego wyboru nie mam.");
	};
};

FUNC VOID DIA_Artegor_Cheat_Inside ()
{
	AI_Output (other, self ,"DIA_Artegor_Cheat_Inside_15_01"); //Nie mam poj�cia. Dowiesz si� w �rodku.
    AI_Output (self, other ,"DIA_Artegor_Cheat_Inside_03_02"); //Nie mam zamiaru si� niczego dowiadywa�. Zejd� mi z oczu!
	Info_ClearChoices		(DIA_Artegor_Cheat);
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_GhoransVine, "Artegor to do�� trudny do wykiwania go��. Musz� wszcz�� b�jk� z K�ykaczem. Innego wyboru nie mam.");
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
    AI_Output (self, other ,"DIA_Artegor_FIGHTWITHKLYKACZ_03_01"); //Co tutaj si� do cholery dzieje?
    AI_Output (self, other ,"DIA_Artegor_FIGHTWITHKLYKACZ_03_02"); //Uspokoi� si�, natychmiast! 
    AI_Output (other, self ,"DIA_Artegor_FIGHTWITHKLYKACZ_15_03"); //Spokojnie. Ju� po wszystkim. 
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
    AI_Output (other, self ,"DIA_Artegor_EveryoneDie_15_02"); //Co tu si� do cholery sta�o? Jeste� ca�y we krwi.
    AI_Output (self, other ,"DIA_Artegor_EveryoneDie_03_03"); //Pytasz co si� sta�o? Przecie� doskonale wiesz. Ja te� wiem, �e macza�e� w tym palce... Od kiedy tylko pojawi�e� si� w Kolonii psujesz tylko wszystkim krew.
	Info_ClearChoices		(DIA_Artegor_EveryoneDie);	
	Info_AddChoice			(DIA_Artegor_EveryoneDie, "We� te mikstur� lecznicz�.", DIA_Artegor_EveryoneDie_Help);
	Info_AddChoice			(DIA_Artegor_EveryoneDie, "Zas�u�y�e� na taki los.", DIA_Artegor_EveryoneDie_DieMdfk);
	
	if (MIS_BackToOldMine == LOG_RUNNING)
	{
    B_LogEntry                     (CH4_BackToOldMine,"Wszystko u�o�y�o si� zgodnie z planem Quentina. Gomez wys�a� du�y oddzia� Stra�nik�w w kierunku kopalni. Walka by�a wyr�wnana. Ostatnim, kt�ry prze�y�, by� Artegor.");
	};
    B_GiveXP (300);
};

FUNC VOID DIA_Artegor_EveryoneDie_Help ()
{
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_Help_15_01"); //We� te mikstur� lecznicz�.
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_Help_03_02"); //(pluje) Pfu! Wypchaj si� ni�.
	Info_ClearChoices		(DIA_Artegor_EveryoneDie);
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"die");
};

FUNC VOID DIA_Artegor_EveryoneDie_DieMdfk ()
{
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_DieMdfk_15_01"); //Zas�u�y�e� na taki los. Teraz b�dziesz zdycha� w�r�d tych trup�w. Co ty sobie w og�le my�la�e�? Chcia�e� z grup� Stra�nik�w stawi� czo�a Gomezowi?
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_DieMdfk_03_02"); //Khe... Khe... Mo�e nie tyle stawi� czo�a co wreszcie si�... oderwa�. 
	AI_Output (other, self ,"DIA_Artegor_EveryoneDie_DieMdfk_15_03"); //To nie mia�o szansy powodzenia.
	AI_Output (self, other ,"DIA_Artegor_EveryoneDie_DieMdfk_03_04"); //Wyno� si� st�d, sukinsynu. Daj mi umrze� w spokoju.
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
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_01"); //Zaczekaj. W g��bi obozu jest kilku je�c�w z Bractwa.
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_02"); //Pewnie czekaj� na ratunek.
    AI_Output (self, other ,"DIA_Artegor_Zaczekaj_03_03"); //Mo�esz im powiedzie�, �e s� wolni.
    
    
        B_LogEntry                     (CH1_HelpBrothersBra ,"Artegor pozwoli� mi uwolni� moich braci z Obozu na bagnie.");

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
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_01"); //No prosz�, ch�opcze, za�atwi�e� nasze problemy z pe�zaczami.
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_02"); //Asghan naprawd� ci� zachwala�. Dobra robota!
    AI_Output (self, other ,"DIA_Artegor_PELZACZE_03_03"); //Przyda�by si� nam kto� taki jak ty do pomocy w kopalni.
    AI_StopProcessInfos	(self);
};

