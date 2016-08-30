//DIALOGI POPRAWIONE I SPRAWDZONE J�ZYKOWO //g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Josep_EXIT(C_INFO)
{
	npc             = NON_5614_Josep;
	nr              = 999;
	condition	= DIA_Josep_EXIT_Condition;
	information	= DIA_Josep_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Josep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Josep_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WODA
//========================================

INSTANCE DIA_Josep_WODA (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_WODA_Condition;
   information  = DIA_Josep_WODA_Info;
   permanent	= TRUE;
   description	= "Przynios�em ci wod�.";
};

FUNC INT DIA_Josep_WODA_Condition()
{
    if ((Lefty_Mission==LOG_RUNNING) || (Lefty_Mission==LOG_SUCCESS)) && Npc_HasItems(other, ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& (!Npc_KnowsInfo (hero, DIA_Josep_Free))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_WODA_Info()
{
    AI_Output (other, self ,"DIA_Josep_WODA_15_01"); //Przynios�em ci wod�.
  if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
    {
    AI_Output (self, other ,"DIA_Josep_WODA_03_02"); //O, dzi�ki. Umieram z pragnienia!
B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;  
    }
    else
    {
        AI_Output (self, other ,"DIA_Josep_WODA_03_03"); //Przecie� nie masz wody! Pr�bujesz ze mnie �artowa�?!
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Josep_HELLO1 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_HELLO1_Condition;
   information  = DIA_Josep_HELLO1_Info;
   permanent	= FALSE;
   description	= "Nie wygl�dasz mi na zbieracza.";
};

FUNC INT DIA_Josep_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_NewQuest))
	&& (MIS_BuntZbieraczy != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_01"); //Nie wygl�dasz mi na zbieracza.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_02"); //Bo nim nie jestem. Zosta�em z�apany przez ludzi Lewusa.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_03"); //Alex wspomina� mi o zaginionym my�liwym... Nazywasz si� Josep?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_04"); //Tak, to ja. Szkoda, �e tak p�no zorientowali si�, �e mnie nie ma. Banda sukinsyn�w!
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_05"); //Przecie� przyby�em ci z pomoc�.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_06"); //No i co z tego? Przecie� nie jeste� my�liwym. Ledwo mnie znasz! A czy, kt�ry� z moich rzekomych przyjaci� si� mn� przej��? 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_07"); //Nie! Wys�ali pierwszego lepszego przyb��d� na poszukiwanie zw�ok. Pewnie Alex liczy�, �e znajdziesz przy mnie amulet.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_08"); //O nie! Ten amulet jest m�j!
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_09"); //Uspok�j si�! Chcesz si� st�d wydosta� czy nie?
    AI_PlayAni (self, "T_SEARCH");
    //AI_StartState (self, ZS_SitCampfire, 1, "");
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_10"); //Och. Moja g�owa... strasznie boli.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_11"); //Co z tob�?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_12"); //O czym to my... A, ju� wiem. Wydosta� si� st�d.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_13"); //Jaki� pomys�? Mo�e po prostu zacznijmy biec. Wskoczmy do jeziora i pop�y�my wraz z pr�dem?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_14"); //To by by�o zbyt proste. Pos�uchaj: jestem tu od tygodnia, wiem jak wygl�da �ycie ludzi, kt�rzy s� wyzyskiwani.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_15"); //Musimy im pom�c zanim odejdziemy. To nasz cel. 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_16"); //Jeden ze zbieraczy... nazywa si� Horacy... tak, on, planuje bunt. Krwawe powstanie przeciw siepaczom Lewusa. 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_17"); //Musisz mu pom�c.

    B_LogEntry                     (CH1_JosepZniknal,"Znalaz�em Josepa w Nowym Obozie. Zosta� schwytany przez ludzi Lewusa i zmuszony do pracy na polach ry�owych. Mam porozmawia� z Horacym i wypyta� go o bunt zbieraczy.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Free
//========================================
//edit by Nocturn
INSTANCE DIA_Josep_Free (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Free_Condition;
   information  = DIA_Josep_Free_Info;
   permanent	= FALSE;
   description	= "Jeste� wolny!";
};

FUNC INT DIA_Josep_Free_Condition()
{
    if (MIS_BuntZbieraczy == LOG_SUCCESS)
    && (MIS_JosepZniknal == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Free_Info()
{
    AI_Output (other, self ,"DIA_Josep_Free_15_01"); //Jeste� wolny!
    AI_Output (self, other ,"DIA_Josep_Free_03_02"); //Uda�o nam si�, naprawd� uda�o. Dobra robota. Bez ciebie nie daliby�my rady.

    AI_Output (other, self ,"DIA_Josep_Free_15_03"); //Mo�esz ju� wr�ci� do obozu.
    AI_Output (self, other ,"DIA_Josep_Free_03_04"); //Wr�ci�? Do tych fa�szywych sukinsyn�w! Do tych darmozjad�w?!
    AI_Output (other, self ,"DIA_Josep_Free_15_05"); //Co z tob�?
    AI_PlayAni (self, "T_SEARCH");
    //AI_StartState (self, ZS_SitCampfire, 1, "");
    AI_Output (self, other ,"DIA_Josep_Free_03_06"); //Eh... Nic. To pewnie zm�czenie...
    AI_Output (other, self ,"DIA_Josep_Free_15_07"); //Pewnie tak. Wracaj ju� do obozu i odpocznij.
    Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo
//========================================

INSTANCE DIA_Josep_Sledztwo (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo_Condition;
   information  = DIA_Josep_Sledztwo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Podejrzane))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
	&& (Npc_GetDistToWP (self, "SPAWN_OW_BLOODFLY_12") > 1800)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo_03_01"); //Cholera, przesta� za mn� �azi�! 
    AI_Output (self, other ,"DIA_Josep_Sledztwo_03_02"); //Pomog�e� mi, dzi�kuj�, ale teraz odejd�!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo2
//========================================

INSTANCE DIA_Josep_Sledztwo2 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo2_Condition;
   information  = DIA_Josep_Sledztwo2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Sledztwo))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo2_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo2_03_01"); //To moje ostatnie ostrze�enie!
    AI_Output (self, other ,"DIA_Josep_Sledztwo2_03_02"); //Zje�d�aj, albo po�a�ujesz! 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo3
//========================================

INSTANCE DIA_Josep_Sledztwo3 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo3_Condition;
   information  = DIA_Josep_Sledztwo3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Sledztwo2))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo3_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo3_03_01"); //Cholera, daj mi wreszcie spok�j! Wracam do obozu!

	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
	
	B_LogEntry                     (CH1_DziwnyJosep,"Podczas �ledzenia Josepa da�em si� trzykrotnie przy�apa�, wi�c Josep wr�ci� do obozu. Od teraz b�dzie mnie obserwowa� i nie b�d� mia� ju� okazji go �ledzi�.");
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_FAILED);
    MIS_DziwnyJosep = LOG_FAILED;
};

//========================================
//-----------------> NieDales
//========================================

INSTANCE DIA_Josep_NieDales (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 2;
   condition    = DIA_Josep_NieDales_Condition;
   information  = DIA_Josep_NieDales_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_NieDales_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Podejrzane))
	 && (Npc_GetDistToWP (self, "JOSEP2") < 600)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_NieDales_Info()
{
    AI_Output (self, other ,"DIA_Josep_NieDales_03_01"); //Nie mog�e� si� powstrzyma�... Musia�e� za mn� i��. Jeste� bardzo dociekliwym cz�owiekiem.
    AI_Output (self, other ,"DIA_Josep_NieDales_03_02"); //Pewnie nie raz nie�le na tym wyszed�e�, ale teraz... teraz sprowadzi�e� na siebie zgub�!
    AI_Output (self, other ,"DIA_Josep_NieDales_03_03"); //Pewnie wiesz ju� o amulecie, kt�ry znalaz�em. Czy� nie?
    AI_Output (other, self ,"DIA_Josep_NieDales_15_04"); //Masz racj�. Alex mi powiedzia�.
    AI_Output (self, other ,"DIA_Josep_NieDales_03_05"); //Ten amulet pozwoli� mi posi��� moc samego Beliara. Dysponuj� teraz mocami, kt�re s� obce nawet niekt�rym magom!
    AI_Output (other, self ,"DIA_Josep_NieDales_15_06"); //Nie jeste� sob�! Musisz mi odda� ten amulet. To nie jest rzecz dla ciebie. 
    AI_Output (self, other ,"DIA_Josep_NieDales_03_07"); //NIGDY!

	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> Normalny
//========================================

INSTANCE DIA_Josep_Normalny (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Normalny_Condition;
   information  = DIA_Josep_Normalny_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Normalny_Condition()
{
    if (!Npc_HasItems (self, JosepSamulet) >=1)
    && (Npc_KnowsInfo (hero, DIA_Josep_NieDales))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Normalny_Info()
{
	AI_Output (self, other ,"DIA_Josep_Normalny_03_01"); //Och, moja g�owa! Czuj� si� dziwnie... Jakby� si� czego� ze mnie pozby�...
    AI_Output (other, self ,"DIA_Josep_Normalny_15_02"); //To moja specjalno��.
    AI_Output (self, other ,"DIA_Josep_Normalny_03_03"); //Pami�tam... tak ju� pami�tam co wydarzy�o si� w ruinach. S�ysza�em g�os, g�os przypominaj�cy modlitwy ludzi z Bractwa...
    AI_Output (self, other ,"DIA_Josep_Normalny_03_04"); //Hipnotyzuj�cy g�os...
    AI_Output (other, self ,"DIA_Josep_Normalny_15_05"); //Spokojnie. Nie ma go tu.
    AI_Output (self, other ,"DIA_Josep_Normalny_03_06"); //Wreszcie czuj� ulg�. We� te rud�. To wszystko co mam. Nie chc� ju� widzie� tego amuletu na oczy! Wyrzu� go!
	AI_Output (other, self ,"DIA_Josep_Normalny_15_07"); //Nast�pnym razem poluj w bezpieczniejszych miejscach. Stare ruiny nie s� najlepszym miejscem na spacerek. 

    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
    B_LogEntry                     (CH1_DziwnyJosep,"Zabieraj�c amulet Josepa oczy�ci�em jego umys� spod w�adzy z�ych mocy. Musz� teraz co� zrobi� z tym amuletem. ");
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_SUCCESS);
    MIS_DziwnyJosep = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "camp2");
};