//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RaeuberDoyle_EXIT(C_INFO)
{
	npc             = ORG_867_Raeuber;
	nr              = 999;
	condition		= DIA_RaeuberDoyle_EXIT_Condition;
	information		= DIA_RaeuberDoyle_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_RaeuberDoyle_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RaeuberDoyle_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 1
// Pogaduchy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> STAN
//========================================

INSTANCE DIA_Raeuber_STAN (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_STAN_Condition;
   information  = DIA_Raeuber_STAN_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Raeuber_STAN_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_STAN_Info()
{
	if (Kapitel != 4)
    {
    AI_Output (other, self ,"DIA_Raeuber_STAN_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Raeuber_STAN_03_02"); //Nie�le. Cisza, spok�j. Ostatnio nikt tu nie zagl�da.
    }
	else
	{
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_03"); //Jak leci?
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_04"); //Stra�nicy coraz cz�ciej podchodz� pod Ob�z. Zaczynam si� obawia� potyczki. 
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_05"); //Jednak w Obozie nie czu� tego strachu.
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_06"); //Bandyci nie wiedz� na co si� porywaj�. Ludzi Gomeza jest wi�cej. Maj� lepsze uzbrojenie. To si� mo�e dla nas �le sko�czy�.    
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� -
// Warn
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WYPAD
//========================================

INSTANCE DIA_Raeuber_WYPAD (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_WYPAD_Condition;
   information  = DIA_Raeuber_WYPAD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_WYPAD_Condition()
{
	if (Kapitel < 4)
	&& ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	//&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	&& (
		(!Npc_GetTrueGuild(other) == GIL_NOV)
    || (!Npc_GetTrueGuild(other) == GIL_ORG)
    || (!Npc_GetTrueGuild(other) == GIL_SLD)
    || (!Npc_GetTrueGuild(other) == GIL_TPL)
	|| (!Npc_GetTrueGuild(other) == GIL_GUR)
	|| (!Npc_GetTrueGuild(other) == GIL_KDW)
	|| (!Npc_GetTrueGuild(other) == GIL_SFB)
	)
	{
    return TRUE;
};
};
FUNC VOID DIA_Raeuber_WYPAD_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_01"); //Kim jeste�? Czego tu szukasz?

		if (!Npc_KnowsInfo (hero, DIA_Drax_CAMPGO))
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_02"); //Trafi�em tutaj przypadkiem.
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_03"); //To zje�d�aj!
        wypierdalajBANDITOS = true;
		wkurwienieDoyla = 0;
		hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,"LOCATION_11_02");
		hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
		self.aivar[AIV_PASSGATE]=FALSE;
		}
		else
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_04"); //Witaj. Przyprowadzi� mnie Drax. Do��czy�em do Obozu. Mam si� uda� do Quentina po pancerz!
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_05"); //Cholera, nowy! Ha ha. Dawno nie by�o tu nikogo. Niez�y z ciebie skurczybyk. 
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_06"); //Przyjd� do mnie p�niej, to mo�e znajd� dla ciebie jak�� robot�.
		self.aivar[AIV_PASSGATE]=TRUE;
		//log
        //B_LogEntry                     (CH1_BANDITOS_CAMP,"Doyle wpu�ci� mnie do Obozu. Mog� teraz spokojnie i�� do Quentina. Prosi� mnie te�, abym przyszed� do niego, gdy pogadam z szefem bandy.");
		//exit
        AI_StopProcessInfos	(self);
};
};

//========================================
//-----------------> WYPIERDALAJ
//========================================

INSTANCE DIA_Raeuber_WYPIERDALAJ (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_WYPIERDALAJ_Condition;
   information  = DIA_Raeuber_WYPIERDALAJ_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_WYPIERDALAJ_Condition()
{
    if 	(wypierdalajBANDITOS == TRUE)
	&& 	(hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,"LOCATION_11_02")	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))	
	&& ((Npc_GetTrueGuild(other) != GIL_NOV)
    || (Npc_GetTrueGuild(other) != GIL_ORG)
    || (Npc_GetTrueGuild(other) != GIL_SLD)
    || (Npc_GetTrueGuild(other) != GIL_TPL)
	|| (Npc_GetTrueGuild(other) != GIL_GUR)
	|| (Npc_GetTrueGuild(other) != GIL_KDW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_WYPIERDALAJ_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_WYPIERDALAJ_03_01"); //M�wi�em ci ju�, �eby� si� wynosi�!
    AI_Output (self, other ,"DIA_Raeuber_WYPIERDALAJ_03_02"); //Spadaj, albo porachuj� ci ko�ci!
	wkurwienieDoyla = wkurwienieDoyla +1;
    if (wkurwienieDoyla >= 3)
    {
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_01"); //No teraz to przesadzi�e�!

  	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
	};

};

//========================================
//-----------------> Przejebane
//========================================

INSTANCE DIA_Raeuber_Przejebane (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_Przejebane_Condition;
   information  = DIA_Raeuber_Przejebane_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Przejebane_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_HahahaSpierdalaj))
    && C_NpcBelongsToOldCamp(hero)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Przejebane_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_01"); //Oszuka�e� nas i przy��czy�e� si� do tych drani!
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_02"); //Odejd�, p�ki mam cierpliwo��.
    wypierdalajBANDITOS = true;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloNoGRD
//========================================

INSTANCE DIA_Raeuber_HelloNoGRD (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_HelloNoGRD_Condition;
   information  = DIA_Raeuber_HelloNoGRD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_HelloNoGRD_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_NOV)
    || (Npc_GetTrueGuild(other) == GIL_ORG)
    || (Npc_GetTrueGuild(other) == GIL_SLD)
    || (Npc_GetTrueGuild(other) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_HelloNoGRD_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_01"); //Czego tu?
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_02"); //Uspok�j si�. Mam tu kilka spraw do za�atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_03"); //Tylko jak si� wygadasz jakiemu� Stra�nikowi o naszym obozie, osobi�cie wypruj� ci flaki!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OhGURU
//========================================

INSTANCE DIA_Raeuber_OhGURU (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_OhGURU_Condition;
   information  = DIA_Raeuber_OhGURU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_OhGURU_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_GUR)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_OhGURU_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_01"); //Guru w Obozie Bandyt�w? Tego jeszcze nie by�o. 
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_02"); //Prosz�, wchod�. Zapewne masz jakie� sprawy do za�atwienia z naszym przyw�dc�. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OhKDW
//========================================

INSTANCE DIA_Raeuber_OhKDW (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 3;
   condition    = DIA_Raeuber_OhKDW_Condition;
   information  = DIA_Raeuber_OhKDW_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_OhKDW_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_OhKDW_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_01"); //Witaj, Magu! Co ci� tu sprowadza? 
    AI_Output (other, self ,"DIA_Raeuber_OhKDW_15_02"); //Mam tu kilka spraw do za�atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_03"); //Nie licz na dodatkowy szacunek z racji pe�nionej funkcji. Wi�kszo�� z nas ma bog�w tam, gdzie �wiat�o nie dochodzi.
    AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

var int robotaPALISADA;
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Raeuber_WORK (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 3;
   condition    = DIA_Raeuber_WORK_Condition;
   information  = DIA_Raeuber_WORK_Info;
   permanent	= FALSE;
   description	= "Jak� masz dla mnie prac�?";
};

FUNC INT DIA_Raeuber_WORK_Condition()
{
    if ((Npc_GetTrueGuild(other) == GIL_BAU) || (lopek == true)) && (wypierdalajBANDITOS == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_WORK_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_15_01"); //Wspomina�e� co� o jakiej� robocie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_02"); //A, tak! Potrzebuj� ��todzioba, kt�ry naprawi palisad�. Oczywi�cie dostaniesz troch� rudy.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_03"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Raeuber_WORK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Jasne.", DIA_Raeuber_WORK_TAK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Raczej nie.", DIA_Raeuber_WORK_NIE);
};

FUNC VOID DIA_Raeuber_WORK_TAK()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_02"); //To �wietnie. B�d� ci bardzo wdzi�czny. 
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_03"); //Tylko uwa�aj na zwierzaki z lasu.
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_04"); //Dobra.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_05"); //We� ten m�otek.
    robotaPALISADA = true;
    CreateInvItems (self, ItMiHammer, 1);
    B_GiveInvItems (self, other, ItMiHammer, 1);
    Palisada = LOG_RUNNING;
    Log_CreateTopic            		(CH1_Palisada, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_Palisada, LOG_RUNNING);
    B_LogEntry                    	(CH1_Palisada,"Doyle kaza� mi naprawi� palisad� przy wej�ciu do Obozu Bandyt�w.");
	//B_ExchangeRoutine (self,"FAJRANT");
	Npc_ExchangeRoutine (self,"FAJRANT");
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_WORK_NIE()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_NIE_15_01"); //Raczej nie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_NIE_03_02"); //Na twoim miejscu bardziej stara�bym si� o opini� w Obozie.
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);	
};

//========================================
//-----------------> END_WORK
//========================================

INSTANCE DIA_Raeuber_END_WORK (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 4;
   condition    = DIA_Raeuber_END_WORK_Condition;
   information  = DIA_Raeuber_END_WORK_Info;
   permanent	= FALSE;
   description	= "Sko�czy�em robot�.";
};

FUNC INT DIA_Raeuber_END_WORK_Condition()
{
    if// (Npc_KnowsInfo (hero, DIA_PC_Hero_REPAIR6))
	(Palisada == LOG_RUNNING)
	&& naprawiono_P1 == true
	&& naprawiono_P2 == true
	&& naprawiono_P3 == true
	&& naprawiono_P4 == true
	&& naprawiono_P5 == true
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_END_WORK_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_END_WORK_15_01"); //Sko�czy�em robot�.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_02"); //To �wietnie. Dobrze si� spisa�e�.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_03"); //Masz tu wynagrodzenie.
    B_LogEntry                     (CH1_Palisada,"Naprawi�em palisad�. Doyle wydawa� si� by� zadowolony.");
    Log_SetTopicStatus       (CH1_Palisada, LOG_SUCCESS);
    Palisada = LOG_SUCCESS;

    B_GiveXP (XP_NaprawaPaliasady);
    CreateInvItems (self, ItAmArrow, 25);
    B_GiveInvItems (self, other, ItAmArrow, 25);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

var int payforteleport_to_banditcamp;
//========================================
//-----------------> TELEPORT
//========================================

INSTANCE DIA_Raeuber_TELEPORT (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_TELEPORT_Condition;
   information  = DIA_Raeuber_TELEPORT_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o budowli znajduj�cej si� niedaleko za twoimi plecami?";
};

FUNC INT DIA_Raeuber_TELEPORT_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_TELEPORT_Info()
{

    AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_01"); //Wiesz co� o budowli znajduj�cej si� niedaleko za twoimi plecami?
    AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_02"); //M�wisz o naszej chacie? 
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_03"); //Pewnie, �e nie! Ju� wiem o co ci chodzi.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_04"); //Jedyne co wiem o tej rzeczy to to, �e jest bardzo stara. Gdy si� tu osiedlali�my znalaz�em t� run�.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_05"); //To mo�e by� teleport.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_06"); //Nawet je�li, to w�tpi� �eby jeszcze dzia�a�. Wszystko jest nie�le rozwalone.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_07"); //Mo�esz mi da� ten teleport?
	if (Palisada == LOG_SUCCESS)
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_08"); //W sumie... Bierz go. Na nic mi si� nie przyda, a ty pomog�e� mi wtedy przy palisadzie.
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_09"); //Nie pomog�e� mi, gdy ci� prosi�em, wi�c nie jestem ci nic winien. Chc� za niego 100 bry�ek rudy.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_10"); //Przecie� nawet nie wiesz czy dzia�a.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_11"); //Nie chcesz, nie kupuj. Moja cena to 100 bry�ek rudy.
	payforteleport_to_banditcamp = true;
	};
};

//========================================
//-----------------> BUYTELEPORT
//========================================

INSTANCE DIA_Raeuber_BUYTELEPORT (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_BUYTELEPORT_Condition;
   information  = DIA_Raeuber_BUYTELEPORT_Info;
   permanent	= TRUE;
   description	= "Dawaj ju� ten teleport. (100 bry�ek rudy)";
};

FUNC INT DIA_Raeuber_BUYTELEPORT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_TELEPORT)) && (payforteleport_to_banditcamp == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_BUYTELEPORT_Info()
{

    AI_Output (other, self ,"DIA_Raeuber_BUYTELEPORT_15_01"); //Dawaj ju� ten teleport.
	if (Npc_HasItems(other,itminugget)>=100)
	{
    AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_02"); //Jest tw�j!
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	
	B_GiveInvItems (other, self, itminugget,100);
	
	payforteleport_to_banditcamp = false;
	DIA_Raeuber_BUYTELEPORT.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_02"); //No a gdzie jest ruda?!
	};
};
//========================================
//-----------------> NAPASC
//========================================

INSTANCE DIA_Raeuber_NAPASC (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 5;
   condition    = DIA_Raeuber_NAPASC_Condition;
   information  = DIA_Raeuber_NAPASC_Info;
   permanent	= true;
   description	= "Szykuje si� robota.";
};

FUNC INT DIA_Raeuber_NAPASC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_QUEST4)) && (backDoyle1 == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_NAPASC_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_01"); //Szykuje si� robota. Mamy napa�� na plac wymian.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_02"); //A, tak. S�ysza�em. Quentin m�wi� ci o dokumentach? 
	AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_03"); //Co� tam wspomina�...
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_04"); //Trzeba zwraca� na nie uwag� i przeszukiwa� skrzynie. Pomagaj� nam organizowa� kolejne napady. Ostatnim razem znalaz�em tylko dwa, ale teraz powinno by� wi�cej.
	AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_05"); //Wyruszymy po godzinie dwudziestej. 
	

    Info_ClearChoices		(DIA_Raeuber_NAPASC);
	if (Wld_IsTime(05,00,20,00))
	{
	Info_AddChoice		(DIA_Raeuber_NAPASC, "Wr�c� p�niej.", DIA_Raeuber_NAPASC_WAIT);
	}
	else //if (Wld_IsTime(20,01,05,00))
	{
    Info_AddChoice		(DIA_Raeuber_NAPASC, "Ju� pora. Chod�my.", DIA_Raeuber_NAPASC_GO);
	};
    
};

FUNC VOID DIA_Raeuber_NAPASC_GO()
{
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_GO_15_01"); //Ju� pora. Chod�my.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_GO_03_02"); //Dobra, pod��aj za mn�. 
	DIA_Raeuber_NAPASC.permanent = false;
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak1");
	Npc_ExchangeRoutine (GRD_2001_Stra�nik,"bijacz");
	Npc_ExchangeRoutine (GRD_2002_Stra�nik,"bijacz");
	/*
	B_SetPermAttitude	(GRD_2005_Stra�nik,	ATT_HOSTILE);
	B_SetPermAttitude	(VLK_2004_Robotnik,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_2001_Stra�nik,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_2002_Stra�nik,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_2003_Stra�nik,	ATT_HOSTILE);	
	GRD_2002_Stra�nik.guild = GIL_MOLERAT;
	GRD_2001_Stra�nik.guild = GIL_MOLERAT;
	GRD_2003_Stra�nik.guild = GIL_MOLERAT;
	GRD_2005_Stra�nik.guild = GIL_MOLERAT;
	VLK_2004_Robotnik.guild = GIL_MOLERAT;
	GRD_254_Orry.guild = GIL_MOLERAT;
	GRD_281_Gardist.guild = GIL_MOLERAT;
	*/
	B_ChangeGuild    (GRD_2002_Stra�nik,GIL_DMB);  
	CreateInvItem   (GRD_2002_Stra�nik,itmi_grd2002_key);
	B_ChangeGuild    (GRD_2001_Stra�nik,GIL_DMB);  
	CreateInvItem   (GRD_2001_Stra�nik,itmi_plac_doc1);
	B_ChangeGuild    (GRD_2003_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2005_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (VLK_2004_Robotnik,GIL_DMB);  
	B_ChangeGuild    (GRD_254_Orry,GIL_DMB);  
	CreateInvItem   (GRD_254_Orry,itmi_plac_doc3);
	B_ChangeGuild    (GRD_281_Gardist,GIL_DMB);  
	B_ChangeGuild    (GRD_5099_Kwatermistrz,GIL_DMB);  
	CreateInvItem   (GRD_5099_Kwatermistrz,itmi_plac_doc4);
	
	Npc_ExchangeRoutine (GRD_254_Orry,"OMFull");
	Npc_ExchangeRoutine (GRD_281_Gardist,"start2");
    Info_ClearChoices		(DIA_Raeuber_NAPASC);
    AI_StopProcessInfos	(self);
	
	backDoyle1 = false;
};

FUNC VOID DIA_Raeuber_NAPASC_WAIT()
{
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_WAIT_15_01"); //Wr�c� p�niej.
	backDoyle1 = true;
	DIA_Raeuber_NAPASC.permanent = true;
    Info_ClearChoices		(DIA_Raeuber_NAPASC);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> UWAGA
//========================================

INSTANCE DIA_Raeuber_UWAGA (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 6;
   condition    = DIA_Raeuber_UWAGA_Condition;
   information  = DIA_Raeuber_UWAGA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_UWAGA_Condition()
{
    if (Npc_GetDistToWP (hero, "OW_PATH_1_13") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_NAPASC))
	&& (MIS_Rozpierdol1 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_UWAGA_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_01"); //Uwa�aj na kusznik�w. I przygotuj bro�.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_02"); //Zaskoczymy ich.
};

//========================================
//-----------------> PIERWSZY_POSTERUNEK
//========================================

INSTANCE DIA_Raeuber_PIERWSZY_POSTERUNEK (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 6;
   condition    = DIA_Raeuber_PIERWSZY_POSTERUNEK_Condition;
   information  = DIA_Raeuber_PIERWSZY_POSTERUNEK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PIERWSZY_POSTERUNEK_Condition()
{
    if (Npc_GetDistToWP (hero, "XXX") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_UWAGA))
	&& (MIS_Rozpierdol1 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PIERWSZY_POSTERUNEK_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_01"); //Dobrze, cz�� tych sukinsyn�w gryzie piach. Przeszukaj ich cia�a. Pami�taj, �eby zwraca� uwag� na dokumenty! Potem ruszymy dalej. 
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_02"); //Chwila! Zamkn�li bram�! Musisz jako� wspi�� si� po skale i j� otworzy�. 
};

//========================================
//-----------------> DRUGI_POSTERUNEK
//========================================

INSTANCE DIA_Raeuber_DRUGI_POSTERUNEK (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 6;
   condition    = DIA_Raeuber_DRUGI_POSTERUNEK_Condition;
   information  = DIA_Raeuber_DRUGI_POSTERUNEK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_DRUGI_POSTERUNEK_Condition()
{
    if (Npc_GetDistToWP (hero, "OW_PATH_1_16_5") < 700)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_PIERWSZY_POSTERUNEK))
	&& (MIS_Rozpierdol1 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_DRUGI_POSTERUNEK_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_DRUGI_POSTERUNEK_03_01"); //Hej, dobra robota z t� bram�. To by�o niebezpieczne! Id�my dalej. Reszta zabarykadowa�a si� pewnie na placu. 
};


//========================================
//-----------------> SPADAMY
//========================================

INSTANCE DIA_Raeuber_SPADAMY (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 7;
   condition    = DIA_Raeuber_SPADAMY_Condition;
   information  = DIA_Raeuber_SPADAMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_SPADAMY_Condition()
{
    if  (Npc_GetDistToWP (self, "PLAC3") < 1000)
	&& (MIS_Rozpierdol1 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_SPADAMY_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_01"); //Po zabawie. Wracamy, zanim kto� si� tu zjawi.
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_02"); //Zabieraj co mo�esz i chod�.
	AI_GotoNpc			(self,hero);
    B_LogEntry               (CH1_Rozpierdol1,"Mam zabra� wszystkie �upy i dokumenty po czym wr�ci� do Obozu i donie�� o wszystkim Quentinowi.");
    //Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
    //MIS_Rozpierdol1 = LOG_SUCCESS;
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
	//Npc_SetTarget (self,GRD_2001_Stra�nik);
    //AI_StartState (self,ZS_ATTACK,1,"");

    B_GiveXP (XP_AtakNaplacWymian);
	
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RayansDie
//========================================

INSTANCE DIA_Raeuber_RayansDie (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_RayansDie_Condition;
   information  = DIA_Raeuber_RayansDie_Info;
   permanent	= FALSE;
   description	= "Chcia�bym zapyta� o �mier� Rayana.";
};

FUNC INT DIA_Raeuber_RayansDie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_YourSwordPieces))
    && (JensIsVictimOfKereth == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_RayansDie_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_01"); //Chcia�bym zapyta� o �mier� Rayana.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_02"); //Nic o tym nie wiem. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_03"); //A mo�e jednak co� widzia�e�? Kereth oskar�a o to zab�jstwo Jensa. Widzia�e� go mo�e tego dnia?
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_04"); //Hmm... O ile dobrze pami�tam to nie. Jens nie wychodzi� wtedy z Obozu. Nawet w wychodku nie by�! 
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_05"); //Za Rayanem wychodzili tylko Ratford i Drax, ale oni s� czy�ci. R�cz� za nich. Mo�liwe, �e by�a z nimi jeszcze trzecia osoba.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_06"); //Nie zwr�ci�em wtedy na to uwagi. No, ale co do Jensa to jest czysty. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_07"); //Dzi�ki.
    B_LogEntry                     (CH1_DestroyedGrave,"Doyle po�wiadczy�, �e w dniu zab�jstwa Rayana Jens na pewno nie opuszcza� Obozu. ");
    AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 3
// Polowanie
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> PolowanieNaZebacze
//========================================

INSTANCE DIA_Raeuber_PolowanieNaZebacze (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_PolowanieNaZebacze_Condition;
   information  = DIA_Raeuber_PolowanieNaZebacze_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PolowanieNaZebacze_Condition()
{
    if (Kapitel == 3)
    && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_01"); //Hej. Idziesz ze mn� na polowanie?
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_15_02"); //Na co chcesz zapolowa�?
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_03"); //Na z�bacze. Ostatnio troch� ich tu za du�o.

    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Idziemy!", DIA_Raeuber_PolowanieNaZebacze_Go);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Nie mam czasu.", DIA_Raeuber_PolowanieNaZebacze_NotTime);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Go()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_Go_15_01"); //Idziemy!
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_Go_03_02"); //Dobra. Zg�o� si� jak b�dziesz got�w.
    MIS_PolowanieZDoylem = LOG_RUNNING;

    Log_CreateTopic            (CH1_PolowanieZDoylem, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PolowanieZDoylem, LOG_RUNNING);
    B_LogEntry                     (CH1_PolowanieZDoylem,"Doyle zaproponowa� mi wsp�lne polowanie na z�bacze.");
    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_NotTime()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_NotTime_15_01"); //Nie mam czasu.
    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Letsgo256
//========================================

INSTANCE DIA_Raeuber_Letsgo256 (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_Letsgo256_Condition;
   information  = DIA_Raeuber_Letsgo256_Info;
   permanent	= FALSE;
   description	= "Dobra. Chod�my.";
};

FUNC INT DIA_Raeuber_Letsgo256_Condition()
{
    if (MIS_PolowanieZDoylem == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Letsgo256_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Letsgo256_15_01"); //Dobra. Chod�my.
    AI_Output (self, other ,"DIA_Raeuber_Letsgo256_03_02"); //Id� za mn�. P�jdziemy do jaskini przy lesie.

    AI_StopProcessInfos	(self);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"lasek");
};

//========================================
//-----------------> Bezpiecznie
//========================================

INSTANCE DIA_Raeuber_Bezpiecznie (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 3;
   condition    = DIA_Raeuber_Bezpiecznie_Condition;
   information  = DIA_Raeuber_Bezpiecznie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Bezpiecznie_Condition()
{
    if (Npc_GetDistToWP (self, "SPAWN_OW_SNAPPER_WOOD05_05") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_Letsgo256))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Bezpiecznie_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_01"); //Wreszcie pozbyli�my si� tych cholernych z�baczy,
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_02"); //W jaskini poza trupami w�drowc�w chyba nic nie ma.
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_03"); //Ja wracam do Obozu. B�d� ostro�ny.
    B_LogEntry                     (CH1_PolowanieZDoylem,"Wybili�my z�bacze z jaskini. Mog� wraca� do Obozu.");
    Log_SetTopicStatus       (CH1_PolowanieZDoylem, LOG_SUCCESS);
    MIS_PolowanieZDoylem = LOG_SUCCESS;

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 4
// W�tek g��wny 
///////////////////////////////////////////////////////////////////////////////////////////

/*
KAPITEL 4
DOYLE - BNADYTA
GOTHIC EDYCJA ROZSZERZONA
31 LIPIEC 2012
by gothic1210
zmodyfikowane stycze� 2015
*/
/*
//========================================
//-----------------> OSTRZEGAM
//========================================

INSTANCE DIA_Raeuber_OSTRZEGAM (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_OSTRZEGAM_Condition;
   information  = DIA_Raeuber_OSTRZEGAM_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_OSTRZEGAM_Condition()
{
    if (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_OSTRZEGAM_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_01"); //Dobrze ci� widzie�. Przynajmniej wiem, �e jeste� w jednym kawa�ku.
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_02"); //Ratford nie �yje. Stra�nicy go zabili, gdy polowa� przy Obozie.
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_03"); //Drax cholernie to prze�ywa. To by� jego przyjaciel. 
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_04"); //Mo�e id� do niego. Planuje atak na Stary Ob�z. Nie wiem czy to dobra decyzja.
    MIS_AtakNaOC = LOG_RUNNING;

    Log_CreateTopic            (CH1_AtakNaOC, LOG_MISSION);
    Log_SetTopicStatus       (CH1_AtakNaOC, LOG_RUNNING);
    B_LogEntry                     (CH1_AtakNaOC,"Doyle zdradzi� mi, �e Drax planuje atak na Stary Ob�z. Musz� z nim pogada�.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
*/ /*
//========================================
//-----------------> czegoTuKapitel4
//========================================

INSTANCE DIA_Raeuber_czegoTuKapitel4 (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_czegoTuKapitel4_Condition;
   information  = DIA_Raeuber_czegoTuKapitel4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_czegoTuKapitel4_Condition()
{
    if (Kapitel >= 4)
    && (!Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU))
	&& 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_czegoTuKapitel4_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_czegoTuKapitel4_03_01"); //Czego tu szukasz?
    AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Raeuber_czegoTuKapitel4_03_01"); //Czego tu szukasz?
        AI_StopProcessInfos	(self);
};

*/

//========================================
//-----------------> Corobisz
//========================================

INSTANCE DIA_Raeuber_Corobisz (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_Corobisz_Condition;
   information  = DIA_Raeuber_Corobisz_Info;
   permanent	= FALSE;
   description	= "Co tu do cholery robisz?";
};

FUNC INT DIA_Raeuber_Corobisz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_AkcjaUkonczona))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Corobisz_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_01"); //Co tu do cholery robisz?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_02"); //Nawet nie wiesz jak si� ciesz�, �e ci� widz�!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_03"); //Postanowi�em wybra� si� do Nowego Obozu i pom�c Najemnikom.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_04"); //Sk�d taki pomys�?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_05"); //Przyby� do mnie pewien Szkodnik i powiedzia�, �e Torlof mnie potrzebuje.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_06"); //Stwierdzi�em, �e Rocky poradzi sobie z ogarni�ciem Obozu i wyruszy�em.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_07"); //Niewa�ne... Podczas twojej nieobecno�ci wiele si� dzia�o.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_08"); //Wr�cili�my po ataku do Obozu i okaza�o si�, �e zosta� zaj�ty przez Stra�nik�w.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_09"); //Co?!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_10"); //Naprawd� du�o mnie omin�o.
	
	B_GiveXP (200);
};

//========================================
//-----------------> FindFriend2
//========================================

INSTANCE DIA_Raeuber_FindFriend2 (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_FindFriend2_Condition;
   information  = DIA_Raeuber_FindFriend2_Info;
   permanent	= FALSE;
   description	= "W ka�dym razie Quentin ci� szuka.";
};

FUNC INT DIA_Raeuber_FindFriend2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_Corobisz))
    && (Npc_KnowsInfo (hero, DIA_Quentin_findFriends))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_FindFriend2_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_01"); //W ka�dym razie Quentin ci� szuka.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_02"); //Uda�o nam si� odbi� Ob�z bez wi�kszych strat. Jeste� nam potrzebny.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_03"); //Dobrze, dobrze, ale mam tu jeszcze jedn� spraw� do za�atwienia. Zobowi�za�em si� pom�c.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_04"); //Nowy Ob�z prowadzi za�arty i otwarty konflikt z Gomezem. Ta grupka Najemnik�w chce pozby� si� Stra�nik�w z doliny obok. 
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_05"); //Przy��cz si� do nich i pom� nam. Potem wr�cimy do Obozu.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_06"); //Nie ma problemu.
	
	//log jest u Torlofa
    //MIS_helpSld1 = LOG_RUNNING;

    //Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    //B_LogEntry               (CH1_helpSld1,"Doyle prosi� mnie bym pom�g� Najemnikom odbi� dolin� pomi�dzy Starym, a Nowym Obozem. Dow�dcz� wyprawy jest Torlof.");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> backtoCamp
//========================================

INSTANCE DIA_Raeuber_backtoCamp (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_backtoCamp_Condition;
   information  = DIA_Raeuber_backtoCamp_Info;
   permanent	= FALSE;
   description	= "Mo�emy ju� wraca�?";
};

FUNC INT DIA_Raeuber_backtoCamp_Condition()
{
    if (MIS_helpSld1 == LOG_SUCCESS) && (Npc_KnowsInfo (hero, DIA_Raeuber_FindFriend2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_backtoCamp_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_backtoCamp_15_01"); //Mo�emy ju� wraca�?
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_02"); //Pewnie. Jak chcesz, to mo�esz i�� sam.
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_03"); //Jako� sobie poradz�.
    Npc_ExchangeRoutine (self,"start");
    B_givexp (100);   
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZNANY_NAJEMNIK
//========================================

INSTANCE DIA_Raeuber_ZNANY_NAJEMNIK (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_ZNANY_NAJEMNIK_Condition;
   information  = DIA_Raeuber_ZNANY_NAJEMNIK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_ZNANY_NAJEMNIK_Condition()
{
    if (MIS_PomocTorlofowi == LOG_RUNNING) || (MIS_PomocTorlofowi == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_ZNANY_NAJEMNIK_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_01"); //Ty! Tak, to o tobie wszyscy gadaj�!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_03"); //Nazywam si� Doyle, jestem Bandyt� z Obozu Quentina. 
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_04"); //Pos�uchaj, potrzebuj� twojej pomocy!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_05"); //O co chodzi?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_06"); //Kilku naszych ludzi uda�o si� w okolice Starego Obozu. Chcieli pozby� si� kr�c�cych si� tam patroli Stra�nik�w.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_07"); //I?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_08"); //To przez Draxa. Bardzo si� przej�� �mierci� Ratforda i opracowa� ca�y ten plan.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_09"); //Wiem o tym.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_10"); //Ja, razem z Rockym mia�em pilnowa� obozu, jednak przyszed�em tutaj. Torlof mnie potrzebowa�.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_11"); //Chcia�bym dowiedzie� si�, co si� tam dzieje i czy moi towarzysze ju� wr�cili.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_12"); //By�bym ci bardzo wdzi�czny, gdyby� sprawdzi� co i jak, a w razie czego powiedzia�, �e wkr�tce wr�c�.
    //AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_13"); //Nie mog� w to uwierzy�! Jeste� pewien, �e nie �yj�?
    //AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_14"); //Nie mam wprawdzie �adnych dowod�w, ale co innego mog�o ich spotka�?
    MIS_BandyciNiwiadomo = LOG_RUNNING;
    Npc_ExchangeRoutine (ORG_819_Drax, "ded");
	CreateInvItems (ORG_819_Drax, ItMi_Listdraxa,1);
	B_KillNpc (ORG_819_Drax);
	
    Log_CreateTopic          (CH1_BandyciNiwiadomo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BandyciNiwiadomo, LOG_RUNNING);
    B_LogEntry               (CH1_BandyciNiwiadomo,"Bandyta Doyle poprosi� mnie, abym sprawdzi�, co dzieje si� w jego Obozie, poniewa� on zobowi�za� sie pom�c ludziom Torlofa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BANDYCI_ZYJA
//========================================

INSTANCE DIA_Raeuber_BANDYCI_ZYJA (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_BANDYCI_ZYJA_Condition;
   information  = DIA_Raeuber_BANDYCI_ZYJA_Info;
   permanent	= FALSE;
   description	= "Mam dobre wie�ci.";
};

FUNC INT DIA_Raeuber_BANDYCI_ZYJA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_CO_TY_TU_NAJMENIKU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_BANDYCI_ZYJA_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_01"); //Mam dobre wie�ci. Wszyscy wr�cili, jednak Stra�nicy odnale�li i zaj�li wasz Ob�z.
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_02"); //Na szcz�cie Quentinowi uda�o si� odzyska� Ob�z. By� jednak na ciebie nie lada w�ciek�y.
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_03"); //Cholera... Niewa�ne. Najwa�niejsze, �e nic z�ego si� nie sta�o.
    if (MIS_helpSld1 == LOG_SUCCESS)
    {
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_04"); //Mog� ju� wraca� do Obozu. Dzi�kuj� za wszystko, przyjacielu. Jakby� potrzebowa� kiedy� pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry                     (CH1_BandyciNiwiadomo,"Wr�ci�em z poleceniem Quentina do Doyle'a. Natychmiast ruszy� w drog�.");
    Log_SetTopicStatus       (CH1_BandyciNiwiadomo, LOG_SUCCESS);
    MIS_BandyciNiwiadomo = LOG_SUCCESS;
    }
    else
    {
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_05"); //M�g�bym ju� wr�ci� do Obozu, ale obieca�em Torlofowi, �e mu pomog�. 
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_06"); //Do��czysz do nas? Potrzebna nam pomoc.
        AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_07"); //Jasne.
		B_LogEntry                     (CH1_BandyciNiwiadomo,"Wr�ci�em z poleceniem Quentina do Doyle'a. Zanim jednak wr�ci do Obozu b�d� musia� pom�c jemu i Torlofowi pozby� si� Stra�nik�w z doliny.");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MOGE_WRACAC
//========================================

INSTANCE DIA_Raeuber_MOGE_WRACAC (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_MOGE_WRACAC_Condition;
   information  = DIA_Raeuber_MOGE_WRACAC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_MOGE_WRACAC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_BANDYCI_ZYJA))
    && (MIS_BandyciNiwiadomo == LOG_RUNNING)
    && (MIS_helpSld1 == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_MOGE_WRACAC_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_01"); //�wietnie. Mog� wraca� do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_02"); //Dzi�kuj� za wszystko, przyjacielu. Jakby� potrzebowa� kiedy� pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry               (CH1_BandyciNiwiadomo,"Po rozwi�zaniu sprawy ze Stra�nikami Doyle wr�ci� do Obozu.");
    Log_SetTopicStatus       (CH1_BandyciNiwiadomo, LOG_SUCCESS);
    MIS_BandyciNiwiadomo = LOG_SUCCESS; 
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 4
// W�tek g��wny  -kopalnia
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> GoL
//========================================

INSTANCE DIA_Raeuber_GoL (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_GoL_Condition;
   information  = DIA_Raeuber_GoL_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn� do Opuszczonej Kopalni?";
};

FUNC INT DIA_Raeuber_GoL_Condition()
{
    if (MIS_OdbijanieOpKop == LOG_RUNNING)
    //&& (Npc_KnowsInfo (hero, DIA_Raeuber_backtoCamp)) niepotrzebne
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_GoL_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_GoL_15_01"); //Idziesz ze mn� do Opuszczonej Kopalni?
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_02"); //No pewnie, przyjacielu. 
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_03"); //Chod�my wi�c. Musimy uwa�a� na Stra�nik�w. 
	AI_Output (self, other ,"DIA_Raeuber_GoL_03_04"); //Poczekaj. We�my ze sob� jeszcze kogo�. Id� po Chrisa i Rockiego. Chyba nie maj� nic do roboty. 
	//  self.aivar[AIV_PARTYMEMBER] = TRUE;
	// Npc_ExchangeRoutine (self,"pomoc");
	RockyRobiZaDoyle  = false;
    B_LogEntry                     (CH1_OdbijanieOpKop,"Doyle doradzi� mi, �ebym poszed� jeszcze po Chrisa i Rockiego. Mog� nam si� przyda�. ");
    AI_StopProcessInfos	(self);
};

//1.4
//========================================
//-----------------> Ready
//========================================

INSTANCE DIA_Raeuber_Ready (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_Ready_Condition;
   information  = DIA_Raeuber_Ready_Info;
   permanent	= FALSE;
   description	= "Jeste�my gotowi!";
};

FUNC INT DIA_Raeuber_Ready_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chris_GoToAbMine))
    && (Npc_KnowsInfo (hero, DIA_Rocky_Follow))
    && (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Ready_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Ready_15_01"); //Jeste�my gotowi! 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_02"); //�wietnie. Trzech ludzi powinno wystarczy�. 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_03"); //Mo�esz prowadzi�. P�jdziemy za tob�. Tylko b�d� ostro�ny!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"pomoc");
    AI_StopProcessInfos	(self);
	Wld_InsertNpc				(GRD_2650_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2651_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2652_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2653_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2654_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2655_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2656_Gardist,"OC1");	
	//bandyci na �cie�ce 1.4
	Wld_InsertNpc				(DEMON,"SPAWN_MOLERAT02_SPAWN01");	
	Wld_InsertNpc				(ZOMBIE,"ZMYLKA1");	
	Wld_InsertNpc				(ZOMBIE,"ZMYLKA1");	
	Wld_InsertNpc				(ZOMBIE,"ZMYLKA2");	
	Wld_InsertNpc				(ZOMBIE,"ZMYLKA2");	
};

/*
//========================================
//-----------------> BackToHome
//========================================

INSTANCE DIA_Raeuber_BackToHome (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_BackToHome_Condition;
   information  = DIA_Raeuber_BackToHome_Info;
   permanent	= FALSE;
   description	= "Mo�esz wraca�.";
};

FUNC INT DIA_Raeuber_BackToHome_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_BackToHome_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_BackToHome_15_01"); //Mo�esz wraca�.
    AI_Output (self, other ,"DIA_Raeuber_BackToHome_03_02"); //Dobra. Widzimy si� w Obozie.
   
    Npc_ExchangeRoutine (self,"start");
    DIA_Raeuber_GoL.permanent = true;
    AI_StopProcessInfos	(self);
};
*/

//========================================
//-----------------> Spiepszam
//========================================

INSTANCE DIA_Raeuber_Spiepszam (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_Spiepszam_Condition;
   information  = DIA_Raeuber_Spiepszam_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Spiepszam_Condition()
{
    if (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 1000)
	&& (Npc_KnowsInfo (hero, DIA_Raeuber_Ready))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Spiepszam_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_01"); //O nie! Ja dalej nie wchodz�. To miejsce jest przekl�te!
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_02"); //Jak sobie chcesz. Pewnie b�d� si� tam dobrze bawi�.
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_03"); //No to �ycz� powodzenia. B�d� pilnowa� wej�cia.
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_05"); //W porz�dku.
    B_LogEntry          (CH1_OdbijanieOpKop,"Dotarli�my na miejsce. Wok� wej�cia do kopalni roi�o si� od Stra�nik�w i nieumar�ych. Pod ziemi� b�d� musia� zej�� sam. Doyle, ani pozostali Bandyci nie s� sk�onni mi pom�c.");
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"kopalnia");
	Npc_ExchangeRoutine (NON_4050_Chris,"kopalnia");
	Npc_ExchangeRoutine (BAU_2012_rocky,"mine");
};

//========================================
//-----------------> NoNareszcie
//========================================

INSTANCE DIA_Raeuber_NoNareszcie (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_NoNareszcie_Condition;
   information  = DIA_Raeuber_NoNareszcie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_NoNareszcie_Condition()
{
    if (Npc_HasItems (hero, Focus_Corristo) >=1)
	&& (Npc_KnowsInfo (hero, DIA_Raeuber_Spiepszam)) 
	//&& (!Npc_KnowsInfo (hero, DIA_Rocky_NoNareszcie)) 
	//&& (RockyRobiZaDoyle == false) 
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
	//&& (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 2000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_NoNareszcie_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_01"); //No nareszcie jeste�. Ju� my�leli�my, �e te potwory rozerwa�y ci� na strz�py.
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_02"); //Spokojnie. Nie tak �atwo mnie zabi�.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_03"); //Co widzia�e� w kopalni?
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_04"); //Nic konkretnego. Grupa Stra�nik�w zosta�a zaskoczona przez o�ywie�c�w. W okolicy kr�ci�o si� te� kilka innych utrapie�, ale jako� sobie poradzi�em.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_05"); //Dobra nasza! Czyli mo�emy zaj�� kopalni�?
 
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_06"); //W sumie to tak. Mam ze sob� kamie�, kt�ry powodowa� to ca�e zamieszanie ze z�ymi si�ami.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_07"); //To �wietnie. Przeka� Quentinowi dobre informacje. Pewnie ma dla ciebie wynagrodzenie.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_08"); //My tutaj zostaniemy i b�dziemy pilnowa� wej�cia.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_09"); //A, i zabierz ten kamie� ze sob�. Nie chc� mie� z nim nic wsp�lnego.
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_10"); //My�la�em, �e podaruj� ci go w prezencie. No, ale c�...
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_11"); //Nie denerwuj mnie!
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_12"); //Dobra, ju� dobra. Uwa�aj, bo go wyjm�!
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_13"); //Id� ju�.
    B_LogEntry                     (CH1_OdbijanieOpKop,"Pokaza�em Doyle'owi artefakt odebrany nekromancie. Kaza� mi uda� si� z dobrymi wie�ciami do Quentina. Wraz z Rockym i Chrisem postanowi� pozosta� tymczasowo na stra�y.");
	HeroMaArtefakt = false;
    B_GiveXP (2000);
	/*
	   if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    }
    else
    {
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_14"); //Jeszcze nie. Nie mam przy sobie kamienia, kt�ry znajduje si� gdzie� w kopalni.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_15"); //Jakiego kamienia?
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_16"); //Podobno jaki� tajemniczy artefakt jest przyczyn� pojawiania si� o�ywie�c�w.
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_17"); //Musz� si� go jako� pozby�.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_18"); //No to id� po niego. Poczekamy tu i postaramy si� odpiera� fale o�ywnie�c�w.
		HeroMaArtefakt = true;
    };
	*/
    AI_StopProcessInfos	(self);
};

/*
//========================================
//-----------------> MamKamien
//========================================

INSTANCE DIA_Raeuber_MamKamien (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_MamKamien_Condition;
   information  = DIA_Raeuber_MamKamien_Info;
   permanent	= FALSE;
   description	= "Mam ju� ten kamie�.";
};

FUNC INT DIA_Raeuber_MamKamien_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    && (HeroMaArtefakt == true)
    && (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_MamKamien_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_MamKamien_15_01"); //Mam ju� ten kamie�.
    AI_Output (self, other ,"DIA_Raeuber_MamKamien_03_02"); //To �wietnie. Zabierz go jak najszybciej ode mnie i id� do Quentina po dalsze rozkazy.
    AI_Output (self, other ,"DIA_Raeuber_MamKamien_03_03"); //My popilnujemy wej�cia do kopalni.
B_LogEntry                     (CH1_OdbijanieOpKop,"Zabra�em z kopalni artefakt, kt�ry doprowadza� do pojawiania si� o�ywie�c�w. Kopalnia jest oczyszczona. Mog� i�� do Quentina.");
B_GiveXP (500);    
AI_StopProcessInfos	(self);
HeroMaArtefakt = false;
};
*/
//========================================
//-----------------> PowrotzKopalni
//========================================

INSTANCE DIA_Raeuber_PowrotzKopalni (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_PowrotzKopalni_Condition;
   information  = DIA_Raeuber_PowrotzKopalni_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PowrotzKopalni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_MineIsClean))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PowrotzKopalni_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PowrotzKopalni_03_01"); //Quentin wys�a� do kopalni nowych ludzi. Postanowili�my wi�c wr�ci�.
    AI_Output (other, self ,"DIA_Raeuber_PowrotzKopalni_15_02"); //Nie ma sprawy. Jeszcze raz dzi�ki za pomoc. 
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> PiratArmorDoyle
//========================================

INSTANCE DIA_Raeuber_PiratArmorDoyle (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_PiratArmorDoyle_Condition;
   information  = DIA_Raeuber_PiratArmorDoyle_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PiratArmorDoyle_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_iFindDoyle)) && (Npc_HasItems (other, PiratArmor) >=1)  || (Npc_HasItems (other, Pirat2Armor) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PiratArmorDoyle_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_01"); //Co tam masz przy sobie?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_02"); //Czy to str�j pirata?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_03"); //Zgada�e� si� z jakimi�?
    AI_Output (other, self ,"DIA_Raeuber_PiratArmorDoyle_15_04"); //Mo�na tak powiedzie�.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_05"); //Ca�kiem niez�y taki str�j.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_06"); //Podobno Quentin mia� kiedy� kontakt z piratami. 
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_07"); //Powiniene� z nim pogada�.
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> POSZ
//========================================
/*
INSTANCE DIA_Raeuber_POSZ (C_INFO)
{
   npc          = ORG_867_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_POSZ_Condition;
   information  = DIA_Raeuber_POSZ_Info;
   permanent	= false;
   description	= "Wiesz co� o Poszukiwaczach?";
};

FUNC INT DIA_Raeuber_POSZ_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_POSZUKIWACZE)) {
    return TRUE;
};
};

FUNC VOID DIA_Raeuber_POSZ_Info()
{

		AI_Output (other, self ,"DIA_Raeuber_POSZ_15_01"); //Wiesz co� o Poszukiwaczach?
		AI_Output (self, other ,"DIA_Raeuber_POSZ_03_02"); //Powiem ci, �e co� kr��y w nocy po lesie. Jakie� mroczne cienie.
		AI_Output (other, self ,"DIA_Raeuber_POSZ_15_03"); //Uwa�aj na nich. To s�udzy Beliara.
        AI_Output (self, other ,"DIA_Raeuber_POSZ_03_04"); //Jak b�d� wiedzia� co� wi�cej, to dam ci znak. 
		 B_LogEntry                     (CH1_Poszukiwacze,"Doyle widzia� Poszukiwaczy w pobli�u lasu. Musz� czeka� na dalszy rozw�j wydarze�.");
};*/
//********************************************
// 
// NAUKA
//*********************************************
var int log_Doylefight;/*
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  BAU_867_Doyle_ZWEIHAND1 (C_INFO)
{
	npc				= ORG_867_Raeuber;
	condition		= BAU_867_Doyle_ZWEIHAND1_Condition;
	information		= BAU_867_Doyle_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  BAU_867_Doyle_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)// to trzeba usun��
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_BAU)
	{
		return TRUE;
	};

};
FUNC void  BAU_867_Doyle_ZWEIHAND1_Info()
{	
	if (log_Doylefight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Doyle mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko poznam tajniki walki broni� jednor�czn�.");
		log_Doylefight = TRUE;
	};
	AI_Output (other, self,"BAU_867_Doyle_ZWEIHAND1_Info_15_01"); //Chcia�bym nauczy� si� pos�ugiwa� dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy si� podstawami.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		BAU_867_Doyle_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"BAU_867_Doyle_NO_ENOUGHT_STR_1"); //Cholera... Ch�opcze, po�wicz jeszcze troch�!
	PrintScreen	("Warunek: Si�a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  BAU_867_Doyle_ZWEIHAND2 (C_INFO)
{
	npc				= ORG_867_Raeuber;
	condition		= BAU_867_Doyle_ZWEIHAND2_Condition;
	information		= BAU_867_Doyle_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  BAU_867_Doyle_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_BAU)
	{
		return TRUE;
	};

};
FUNC void  BAU_867_Doyle_ZWEIHAND2_Info()
{
	AI_Output (other, self,"BAU_867_Doyle_ZWEIHAND2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o walce dwur�cznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		BAU_867_Doyle_ZWEIHAND2.permanent = 0 ;
	};
		}
	else
	{
	AI_Output			(self,other,"BAU_867_Doyle_NO_ENOUGHT_STR_1"); //Cholera... Ch�opcze, po�wicz jeszcze troch�!
	PrintScreen	("Warunek: Si�a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  */
//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H (C_INFO)
{
	npc				= ORG_867_Raeuber;
	condition		= ORG_867_Doyle_TEACH_2H_Condition;
	information		= ORG_867_Doyle_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy� broni� dwur�czn�?"; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  ORG_867_Doyle_TEACH_2H_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy� broni� dwur�czn�?
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_Info_09_02"); //Szkol� tylko i wy��cznie ludzi Quentina. Do tego nie za darmo. 

	if (log_Doylefight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Doyle mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko zostan� cz�onkiem Bandy Quentina.");
		log_Doylefight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H_START (C_INFO)
{
	npc				= ORG_867_Raeuber;
	condition		= ORG_867_Doyle_TEACH_2H_START_Condition;
	information		= ORG_867_Doyle_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_START_Condition()
{	
	if (Npc_KnowsInfo (hero, ORG_867_Doyle_TEACH_2H))
	&& ((Npc_GetTrueGuild    (hero) == GIL_BAU))
	{
	return TRUE;
	};
};

FUNC void  ORG_867_Doyle_TEACH_2H_START_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_START_Info_09_02"); //No dobra.

Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

func void ORG_867_Doyle_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
};

FUNC VOID Doyle_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_00"); //Chcia�bym nauczy� si� walki dwur�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_01"); //Bronie dwur�czne wymagaj� sporo si�y. S� ci�kie, a przez to tak�e wolniejsze.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_02"); //Zmieni si� to jednak w trakcie czynienia przez ciebie post�p�w w nauce.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_03"); //Za powolno�� bronie dwur�czne odwdzi�cz� ci si� pot�nymi obra�eniami.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_04"); //Ka�d� bro� musisz odpowiednio wyczu�. Topory s� inaczej zbalansowane ni� miecze. Pami�taj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_06"); //Musisz pracowa� nad swoj� si��. Pozwoli ci ona wykonywa� szybsze ruchy i podnosi� coraz ci�sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_07"); //P�niej b�dziesz musia� pozna� odpowiedni� technik� walki i ��cznia cios�w. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_08"); //Na razie nie jeste� wstanie zada� pe�nych obra�e� na jakie pozwala ci dana bro�. Spokojnie, zajmiemy si� tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwur�cznych broni?
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_11"); //S� d�ugie... Im d�u�sze tym dalej od siebie mo�esz trzyma� przeciwnika. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_12"); //Gdy kupujesz bro� zwracaj uwag� na jej g�rn� cz��. Je�li jest wystarczaj�co ostra to nawet dra�ni�cie oponenta z daleka zada mu obra�enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_14"); //Nie, nie, nie. Om�wimy to na nast�pnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy�em ci� jak porz�dnie trzyma� bro� i jak wykorzysta� si�� bezw�adno�ci ostrza.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_16"); //Pami�taj, �e im lepiej wyczujesz balans broni tym �atwiej b�dzie ci ��czy� kolejne ciosy.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_17"); //Musisz wiedzie�, w kt�rym momencie ponownie si� zamachn��, tak by wykorzysta� przy tym impet pierwszego uderzenia. Pozwoli ci to oszcz�dzi� si�y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_18"); //Stosuj r�ne strategie walki. Uderzaj raz z przodu, raz z boku. A p�niej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_19"); //Uniki z dwur�cznym mieczem w r�ku faktycznie mog� by� trudne, dlatego musisz parowa� ciosy. �wicz si�� mi�ni r�k, plec�w i klatki piersiowej. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowa�, bez ryzyka po�amania sobie czego�. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� dwur�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_26"); //To ju� nasza ostatnia lekcja. Poka�� ci sztuczki, kt�re pozwol� ci jeszcze lepiej wyczu� bro�.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_27"); //Musisz nauczy� si� rozpoznawa� s�abe punkty przeciwnik�w i skupia� si� na nich.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 1, 100 bry�ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 2, 200 bry�ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 3, 300 bry�ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 4, 400 bry�ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 5, 500 bry�ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 6, 600 bry�ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Bro� dwur�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Doyle_teach_2h10);
	};
};