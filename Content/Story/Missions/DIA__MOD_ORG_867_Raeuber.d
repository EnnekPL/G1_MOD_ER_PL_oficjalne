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
// Rozdzia³ 1
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
    AI_Output (self, other ,"DIA_Raeuber_STAN_03_02"); //NieŸle. Cisza, spokój. Ostatnio nikt tu nie zagl¹da.
    }
	else
	{
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_03"); //Jak leci?
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_04"); //Stra¿nicy coraz czêœciej podchodz¹ pod Obóz. Zaczynam siê obawiaæ potyczki. 
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_05"); //Jednak w Obozie nie czuæ tego strachu.
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_06"); //Bandyci nie wiedz¹ na co siê porywaj¹. Ludzi Gomeza jest wiêcej. Maj¹ lepsze uzbrojenie. To siê mo¿e dla nas Ÿle skoñczyæ.    
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ -
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
    AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_01"); //Kim jesteœ? Czego tu szukasz?

		if (!Npc_KnowsInfo (hero, DIA_Drax_CAMPGO))
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_02"); //Trafi³em tutaj przypadkiem.
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_03"); //To zje¿d¿aj!
        wypierdalajBANDITOS = true;
		wkurwienieDoyla = 0;
		hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,"LOCATION_11_02");
		hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
		self.aivar[AIV_PASSGATE]=FALSE;
		}
		else
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_04"); //Witaj. Przyprowadzi³ mnie Drax. Do³¹czy³em do Obozu. Mam siê udaæ do Quentina po pancerz!
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_05"); //Cholera, nowy! Ha ha. Dawno nie by³o tu nikogo. Niez³y z ciebie skurczybyk. 
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_06"); //PrzyjdŸ do mnie póŸniej, to mo¿e znajdê dla ciebie jak¹œ robotê.
		self.aivar[AIV_PASSGATE]=TRUE;
		//log
        //B_LogEntry                     (CH1_BANDITOS_CAMP,"Doyle wpuœci³ mnie do Obozu. Mogê teraz spokojnie iœæ do Quentina. Prosi³ mnie te¿, abym przyszed³ do niego, gdy pogadam z szefem bandy.");
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
    AI_Output (self, other ,"DIA_Raeuber_WYPIERDALAJ_03_01"); //Mówi³em ci ju¿, ¿ebyœ siê wynosi³!
    AI_Output (self, other ,"DIA_Raeuber_WYPIERDALAJ_03_02"); //Spadaj, albo porachujê ci koœci!
	wkurwienieDoyla = wkurwienieDoyla +1;
    if (wkurwienieDoyla >= 3)
    {
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_01"); //No teraz to przesadzi³eœ!

  	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
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
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_01"); //Oszuka³eœ nas i przy³¹czy³eœ siê do tych drani!
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_02"); //OdejdŸ, póki mam cierpliwoœæ.
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
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_02"); //Uspokój siê. Mam tu kilka spraw do za³atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_03"); //Tylko jak siê wygadasz jakiemuœ Stra¿nikowi o naszym obozie, osobiœcie wyprujê ci flaki!
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
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_01"); //Guru w Obozie Bandytów? Tego jeszcze nie by³o. 
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_02"); //Proszê, wchodŸ. Zapewne masz jakieœ sprawy do za³atwienia z naszym przywódc¹. 
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
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_01"); //Witaj, Magu! Co ciê tu sprowadza? 
    AI_Output (other, self ,"DIA_Raeuber_OhKDW_15_02"); //Mam tu kilka spraw do za³atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_03"); //Nie licz na dodatkowy szacunek z racji pe³nionej funkcji. Wiêkszoœæ z nas ma bogów tam, gdzie œwiat³o nie dochodzi.
    AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 1
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
   description	= "Jak¹ masz dla mnie pracê?";
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
    AI_Output (other, self ,"DIA_Raeuber_WORK_15_01"); //Wspomina³eœ coœ o jakiejœ robocie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_02"); //A, tak! Potrzebujê ¿ó³todzioba, który naprawi palisadê. Oczywiœcie dostaniesz trochê rudy.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_03"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Raeuber_WORK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Jasne.", DIA_Raeuber_WORK_TAK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Raczej nie.", DIA_Raeuber_WORK_NIE);
};

FUNC VOID DIA_Raeuber_WORK_TAK()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_02"); //To œwietnie. Bêdê ci bardzo wdziêczny. 
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_03"); //Tylko uwa¿aj na zwierzaki z lasu.
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_04"); //Dobra.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_05"); //WeŸ ten m³otek.
    robotaPALISADA = true;
    CreateInvItems (self, ItMiHammer, 1);
    B_GiveInvItems (self, other, ItMiHammer, 1);
    Palisada = LOG_RUNNING;
    Log_CreateTopic            		(CH1_Palisada, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_Palisada, LOG_RUNNING);
    B_LogEntry                    	(CH1_Palisada,"Doyle kaza³ mi naprawiæ palisadê przy wejœciu do Obozu Bandytów.");
	//B_ExchangeRoutine (self,"FAJRANT");
	Npc_ExchangeRoutine (self,"FAJRANT");
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_WORK_NIE()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_NIE_15_01"); //Raczej nie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_NIE_03_02"); //Na twoim miejscu bardziej stara³bym siê o opiniê w Obozie.
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
   description	= "Skoñczy³em robotê.";
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
    AI_Output (other, self ,"DIA_Raeuber_END_WORK_15_01"); //Skoñczy³em robotê.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_02"); //To œwietnie. Dobrze siê spisa³eœ.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_03"); //Masz tu wynagrodzenie.
    B_LogEntry                     (CH1_Palisada,"Naprawi³em palisadê. Doyle wydawa³ siê byæ zadowolony.");
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
   description	= "Wiesz coœ o budowli znajduj¹cej siê niedaleko za twoimi plecami?";
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

    AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_01"); //Wiesz coœ o budowli znajduj¹cej siê niedaleko za twoimi plecami?
    AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_02"); //Mówisz o naszej chacie? 
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_03"); //Pewnie, ¿e nie! Ju¿ wiem o co ci chodzi.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_04"); //Jedyne co wiem o tej rzeczy to to, ¿e jest bardzo stara. Gdy siê tu osiedlaliœmy znalaz³em tê runê.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_05"); //To mo¿e byæ teleport.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_06"); //Nawet jeœli, to w¹tpiê ¿eby jeszcze dzia³a³. Wszystko jest nieŸle rozwalone.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_07"); //Mo¿esz mi daæ ten teleport?
	if (Palisada == LOG_SUCCESS)
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_08"); //W sumie... Bierz go. Na nic mi siê nie przyda, a ty pomog³eœ mi wtedy przy palisadzie.
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_09"); //Nie pomog³eœ mi, gdy ciê prosi³em, wiêc nie jestem ci nic winien. Chcê za niego 100 bry³ek rudy.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_10"); //Przecie¿ nawet nie wiesz czy dzia³a.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_11"); //Nie chcesz, nie kupuj. Moja cena to 100 bry³ek rudy.
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
   description	= "Dawaj ju¿ ten teleport. (100 bry³ek rudy)";
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

    AI_Output (other, self ,"DIA_Raeuber_BUYTELEPORT_15_01"); //Dawaj ju¿ ten teleport.
	if (Npc_HasItems(other,itminugget)>=100)
	{
    AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_02"); //Jest twój!
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
   description	= "Szykuje siê robota.";
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
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_01"); //Szykuje siê robota. Mamy napaœæ na plac wymian.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_02"); //A, tak. S³ysza³em. Quentin mówi³ ci o dokumentach? 
	AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_03"); //Coœ tam wspomina³...
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_04"); //Trzeba zwracaæ na nie uwagê i przeszukiwaæ skrzynie. Pomagaj¹ nam organizowaæ kolejne napady. Ostatnim razem znalaz³em tylko dwa, ale teraz powinno byæ wiêcej.
	AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_05"); //Wyruszymy po godzinie dwudziestej. 
	

    Info_ClearChoices		(DIA_Raeuber_NAPASC);
	if (Wld_IsTime(05,00,20,00))
	{
	Info_AddChoice		(DIA_Raeuber_NAPASC, "Wrócê póŸniej.", DIA_Raeuber_NAPASC_WAIT);
	}
	else //if (Wld_IsTime(20,01,05,00))
	{
    Info_AddChoice		(DIA_Raeuber_NAPASC, "Ju¿ pora. ChodŸmy.", DIA_Raeuber_NAPASC_GO);
	};
    
};

FUNC VOID DIA_Raeuber_NAPASC_GO()
{
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_GO_15_01"); //Ju¿ pora. ChodŸmy.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_GO_03_02"); //Dobra, pod¹¿aj za mn¹. 
	DIA_Raeuber_NAPASC.permanent = false;
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak1");
	Npc_ExchangeRoutine (GRD_2001_Stra¿nik,"bijacz");
	Npc_ExchangeRoutine (GRD_2002_Stra¿nik,"bijacz");
	/*
	B_SetPermAttitude	(GRD_2005_Stra¿nik,	ATT_HOSTILE);
	B_SetPermAttitude	(VLK_2004_Robotnik,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_2001_Stra¿nik,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_2002_Stra¿nik,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_2003_Stra¿nik,	ATT_HOSTILE);	
	GRD_2002_Stra¿nik.guild = GIL_MOLERAT;
	GRD_2001_Stra¿nik.guild = GIL_MOLERAT;
	GRD_2003_Stra¿nik.guild = GIL_MOLERAT;
	GRD_2005_Stra¿nik.guild = GIL_MOLERAT;
	VLK_2004_Robotnik.guild = GIL_MOLERAT;
	GRD_254_Orry.guild = GIL_MOLERAT;
	GRD_281_Gardist.guild = GIL_MOLERAT;
	*/
	B_ChangeGuild    (GRD_2002_Stra¿nik,GIL_DMB);  
	CreateInvItem   (GRD_2002_Stra¿nik,itmi_grd2002_key);
	B_ChangeGuild    (GRD_2001_Stra¿nik,GIL_DMB);  
	CreateInvItem   (GRD_2001_Stra¿nik,itmi_plac_doc1);
	B_ChangeGuild    (GRD_2003_Stra¿nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2005_Stra¿nik,GIL_DMB);  
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
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_WAIT_15_01"); //Wrócê póŸniej.
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
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_01"); //Uwa¿aj na kuszników. I przygotuj broñ.
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
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_01"); //Dobrze, czêœæ tych sukinsynów gryzie piach. Przeszukaj ich cia³a. Pamiêtaj, ¿eby zwracaæ uwagê na dokumenty! Potem ruszymy dalej. 
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_02"); //Chwila! Zamknêli bramê! Musisz jakoœ wspi¹æ siê po skale i j¹ otworzyæ. 
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
    AI_Output (self, other ,"DIA_Raeuber_DRUGI_POSTERUNEK_03_01"); //Hej, dobra robota z t¹ bram¹. To by³o niebezpieczne! IdŸmy dalej. Reszta zabarykadowa³a siê pewnie na placu. 
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
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_01"); //Po zabawie. Wracamy, zanim ktoœ siê tu zjawi.
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_02"); //Zabieraj co mo¿esz i chodŸ.
	AI_GotoNpc			(self,hero);
    B_LogEntry               (CH1_Rozpierdol1,"Mam zabraæ wszystkie ³upy i dokumenty po czym wróciæ do Obozu i donieœæ o wszystkim Quentinowi.");
    //Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
    //MIS_Rozpierdol1 = LOG_SUCCESS;
    //Npc_SetPermAttitude (self, ATT_HOSTILE);
	//Npc_SetTarget (self,GRD_2001_Stra¿nik);
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
   description	= "Chcia³bym zapytaæ o œmieræ Rayana.";
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
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_01"); //Chcia³bym zapytaæ o œmieræ Rayana.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_02"); //Nic o tym nie wiem. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_03"); //A mo¿e jednak coœ widzia³eœ? Kereth oskar¿a o to zabójstwo Jensa. Widzia³eœ go mo¿e tego dnia?
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_04"); //Hmm... O ile dobrze pamiêtam to nie. Jens nie wychodzi³ wtedy z Obozu. Nawet w wychodku nie by³! 
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_05"); //Za Rayanem wychodzili tylko Ratford i Drax, ale oni s¹ czyœci. Rêczê za nich. Mo¿liwe, ¿e by³a z nimi jeszcze trzecia osoba.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_06"); //Nie zwróci³em wtedy na to uwagi. No, ale co do Jensa to jest czysty. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_07"); //Dziêki.
    B_LogEntry                     (CH1_DestroyedGrave,"Doyle poœwiadczy³, ¿e w dniu zabójstwa Rayana Jens na pewno nie opuszcza³ Obozu. ");
    AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 3
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
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_01"); //Hej. Idziesz ze mn¹ na polowanie?
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_15_02"); //Na co chcesz zapolowaæ?
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_03"); //Na zêbacze. Ostatnio trochê ich tu za du¿o.

    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Idziemy!", DIA_Raeuber_PolowanieNaZebacze_Go);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Nie mam czasu.", DIA_Raeuber_PolowanieNaZebacze_NotTime);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Go()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_Go_15_01"); //Idziemy!
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_Go_03_02"); //Dobra. Zg³oœ siê jak bêdziesz gotów.
    MIS_PolowanieZDoylem = LOG_RUNNING;

    Log_CreateTopic            (CH1_PolowanieZDoylem, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PolowanieZDoylem, LOG_RUNNING);
    B_LogEntry                     (CH1_PolowanieZDoylem,"Doyle zaproponowa³ mi wspólne polowanie na zêbacze.");
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
   description	= "Dobra. ChodŸmy.";
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
    AI_Output (other, self ,"DIA_Raeuber_Letsgo256_15_01"); //Dobra. ChodŸmy.
    AI_Output (self, other ,"DIA_Raeuber_Letsgo256_03_02"); //IdŸ za mn¹. Pójdziemy do jaskini przy lesie.

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
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_01"); //Wreszcie pozbyliœmy siê tych cholernych zêbaczy,
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_02"); //W jaskini poza trupami wêdrowców chyba nic nie ma.
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_03"); //Ja wracam do Obozu. B¹dŸ ostro¿ny.
    B_LogEntry                     (CH1_PolowanieZDoylem,"Wybiliœmy zêbacze z jaskini. Mogê wracaæ do Obozu.");
    Log_SetTopicStatus       (CH1_PolowanieZDoylem, LOG_SUCCESS);
    MIS_PolowanieZDoylem = LOG_SUCCESS;

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 4
// W¹tek g³ówny 
///////////////////////////////////////////////////////////////////////////////////////////

/*
KAPITEL 4
DOYLE - BNADYTA
GOTHIC EDYCJA ROZSZERZONA
31 LIPIEC 2012
by gothic1210
zmodyfikowane styczeñ 2015
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
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_01"); //Dobrze ciê widzieæ. Przynajmniej wiem, ¿e jesteœ w jednym kawa³ku.
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_02"); //Ratford nie ¿yje. Stra¿nicy go zabili, gdy polowa³ przy Obozie.
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_03"); //Drax cholernie to prze¿ywa. To by³ jego przyjaciel. 
    AI_Output (self, other ,"DIA_Raeuber_OSTRZEGAM_03_04"); //Mo¿e idŸ do niego. Planuje atak na Stary Obóz. Nie wiem czy to dobra decyzja.
    MIS_AtakNaOC = LOG_RUNNING;

    Log_CreateTopic            (CH1_AtakNaOC, LOG_MISSION);
    Log_SetTopicStatus       (CH1_AtakNaOC, LOG_RUNNING);
    B_LogEntry                     (CH1_AtakNaOC,"Doyle zdradzi³ mi, ¿e Drax planuje atak na Stary Obóz. Muszê z nim pogadaæ.");

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
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_02"); //Nawet nie wiesz jak siê cieszê, ¿e ciê widzê!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_03"); //Postanowi³em wybraæ siê do Nowego Obozu i pomóc Najemnikom.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_04"); //Sk¹d taki pomys³?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_05"); //Przyby³ do mnie pewien Szkodnik i powiedzia³, ¿e Torlof mnie potrzebuje.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_06"); //Stwierdzi³em, ¿e Rocky poradzi sobie z ogarniêciem Obozu i wyruszy³em.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_07"); //Niewa¿ne... Podczas twojej nieobecnoœci wiele siê dzia³o.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_08"); //Wróciliœmy po ataku do Obozu i okaza³o siê, ¿e zosta³ zajêty przez Stra¿ników.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_09"); //Co?!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_10"); //Naprawdê du¿o mnie ominê³o.
	
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
   description	= "W ka¿dym razie Quentin ciê szuka.";
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
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_01"); //W ka¿dym razie Quentin ciê szuka.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_02"); //Uda³o nam siê odbiæ Obóz bez wiêkszych strat. Jesteœ nam potrzebny.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_03"); //Dobrze, dobrze, ale mam tu jeszcze jedn¹ sprawê do za³atwienia. Zobowi¹za³em siê pomóc.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_04"); //Nowy Obóz prowadzi za¿arty i otwarty konflikt z Gomezem. Ta grupka Najemników chce pozbyæ siê Stra¿ników z doliny obok. 
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_05"); //Przy³¹cz siê do nich i pomó¿ nam. Potem wrócimy do Obozu.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_06"); //Nie ma problemu.
	
	//log jest u Torlofa
    //MIS_helpSld1 = LOG_RUNNING;

    //Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    //B_LogEntry               (CH1_helpSld1,"Doyle prosi³ mnie bym pomóg³ Najemnikom odbiæ dolinê pomiêdzy Starym, a Nowym Obozem. Dowódcz¹ wyprawy jest Torlof.");

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
   description	= "Mo¿emy ju¿ wracaæ?";
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
    AI_Output (other, self ,"DIA_Raeuber_backtoCamp_15_01"); //Mo¿emy ju¿ wracaæ?
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_02"); //Pewnie. Jak chcesz, to mo¿esz iœæ sam.
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_03"); //Jakoœ sobie poradzê.
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
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_01"); //Ty! Tak, to o tobie wszyscy gadaj¹!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_03"); //Nazywam siê Doyle, jestem Bandyt¹ z Obozu Quentina. 
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_04"); //Pos³uchaj, potrzebujê twojej pomocy!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_05"); //O co chodzi?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_06"); //Kilku naszych ludzi uda³o siê w okolice Starego Obozu. Chcieli pozbyæ siê krêc¹cych siê tam patroli Stra¿ników.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_07"); //I?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_08"); //To przez Draxa. Bardzo siê przej¹³ œmierci¹ Ratforda i opracowa³ ca³y ten plan.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_09"); //Wiem o tym.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_10"); //Ja, razem z Rockym mia³em pilnowaæ obozu, jednak przyszed³em tutaj. Torlof mnie potrzebowa³.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_11"); //Chcia³bym dowiedzieæ siê, co siê tam dzieje i czy moi towarzysze ju¿ wrócili.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_12"); //By³bym ci bardzo wdziêczny, gdybyœ sprawdzi³ co i jak, a w razie czego powiedzia³, ¿e wkrótce wrócê.
    //AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_13"); //Nie mogê w to uwierzyæ! Jesteœ pewien, ¿e nie ¿yj¹?
    //AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_14"); //Nie mam wprawdzie ¿adnych dowodów, ale co innego mog³o ich spotkaæ?
    MIS_BanditsInTroubles = LOG_RUNNING;
    Npc_ExchangeRoutine (ORG_819_Drax, "ded");
	CreateInvItems (ORG_819_Drax, ItMi_Listdraxa,1);
	B_KillNpc (ORG_819_Drax);
	
    Log_CreateTopic          (CH4_BanditsInTroubles, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_RUNNING);
    B_LogEntry               (CH4_BanditsInTroubles,"Bandyta Doyle poprosi³ mnie, abym sprawdzi³, co dzieje siê w jego Obozie, poniewa¿ on zobowi¹za³ sie pomóc ludziom Torlofa.");
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
   description	= "Mam dobre wieœci.";
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
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_01"); //Mam dobre wieœci. Wszyscy wrócili, jednak Stra¿nicy odnaleŸli i zajêli wasz Obóz.
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_02"); //Na szczêœcie Quentinowi uda³o siê odzyskaæ Obóz. By³ jednak na ciebie nie lada wœciek³y.
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_03"); //Cholera... Niewa¿ne. Najwa¿niejsze, ¿e nic z³ego siê nie sta³o.
    if (MIS_helpSld1 == LOG_SUCCESS)
    {
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_04"); //Mogê ju¿ wracaæ do Obozu. Dziêkujê za wszystko, przyjacielu. Jakbyœ potrzebowa³ kiedyœ pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry                     (CH4_BanditsInTroubles,"Wróci³em z poleceniem Quentina do Doyle'a. Natychmiast ruszy³ w drogê.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS;
    }
    else
    {
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_05"); //Móg³bym ju¿ wróciæ do Obozu, ale obieca³em Torlofowi, ¿e mu pomogê. 
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_06"); //Do³¹czysz do nas? Potrzebna nam pomoc.
        AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_07"); //Jasne.
		B_LogEntry                     (CH4_BanditsInTroubles,"Wróci³em z poleceniem Quentina do Doyle'a. Zanim jednak wróci do Obozu bêdê musia³ pomóc jemu i Torlofowi pozbyæ siê Stra¿ników z doliny.");
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
    && (MIS_BanditsInTroubles == LOG_RUNNING)
    && (MIS_helpSld1 == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_MOGE_WRACAC_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_01"); //Œwietnie. Mogê wracaæ do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_02"); //Dziêkujê za wszystko, przyjacielu. Jakbyœ potrzebowa³ kiedyœ pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry               (CH4_BanditsInTroubles,"Po rozwi¹zaniu sprawy ze Stra¿nikami Doyle wróci³ do Obozu.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS; 
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 4
// W¹tek g³ówny  -kopalnia
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
   description	= "Idziesz ze mn¹ do Opuszczonej Kopalni?";
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
    AI_Output (other, self ,"DIA_Raeuber_GoL_15_01"); //Idziesz ze mn¹ do Opuszczonej Kopalni?
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_02"); //No pewnie, przyjacielu. 
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_03"); //ChodŸmy wiêc. Musimy uwa¿aæ na Stra¿ników. 
	AI_Output (self, other ,"DIA_Raeuber_GoL_03_04"); //Poczekaj. WeŸmy ze sob¹ jeszcze kogoœ. IdŸ po Chrisa i Rockiego. Chyba nie maj¹ nic do roboty. 
	//  self.aivar[AIV_PARTYMEMBER] = TRUE;
	// Npc_ExchangeRoutine (self,"pomoc");
	RockyRobiZaDoyle  = false;
    B_LogEntry                     (CH1_OdbijanieOpKop,"Doyle doradzi³ mi, ¿ebym poszed³ jeszcze po Chrisa i Rockiego. Mog¹ nam siê przydaæ. ");
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
   description	= "Jesteœmy gotowi!";
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
    AI_Output (other, self ,"DIA_Raeuber_Ready_15_01"); //Jesteœmy gotowi! 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_02"); //Œwietnie. Trzech ludzi powinno wystarczyæ. 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_03"); //Mo¿esz prowadziæ. Pójdziemy za tob¹. Tylko b¹dŸ ostro¿ny!
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
	//bandyci na œcie¿ce 1.4
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
   description	= "Mo¿esz wracaæ.";
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
    AI_Output (other, self ,"DIA_Raeuber_BackToHome_15_01"); //Mo¿esz wracaæ.
    AI_Output (self, other ,"DIA_Raeuber_BackToHome_03_02"); //Dobra. Widzimy siê w Obozie.
   
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
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_01"); //O nie! Ja dalej nie wchodzê. To miejsce jest przeklête!
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_02"); //Jak sobie chcesz. Pewnie bêdê siê tam dobrze bawi³.
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_03"); //No to ¿yczê powodzenia. Bêdê pilnowa³ wejœcia.
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_05"); //W porz¹dku.
    B_LogEntry          (CH1_OdbijanieOpKop,"Dotarliœmy na miejsce. Wokó³ wejœcia do kopalni roi³o siê od Stra¿ników i nieumar³ych. Pod ziemiê bêdê musia³ zejœæ sam. Doyle, ani pozostali Bandyci nie s¹ sk³onni mi pomóc.");
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"kopalnia");
	Npc_ExchangeRoutine (BAN_1607_Chris,"kopalnia");
	Npc_ExchangeRoutine (BAN_1605_Rocky,"mine");
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
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_01"); //No nareszcie jesteœ. Ju¿ myœleliœmy, ¿e te potwory rozerwa³y ciê na strzêpy.
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_02"); //Spokojnie. Nie tak ³atwo mnie zabiæ.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_03"); //Co widzia³eœ w kopalni?
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_04"); //Nic konkretnego. Grupa Stra¿ników zosta³a zaskoczona przez o¿ywieñców. W okolicy krêci³o siê te¿ kilka innych utrapieñ, ale jakoœ sobie poradzi³em.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_05"); //Dobra nasza! Czyli mo¿emy zaj¹æ kopalniê?
 
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_06"); //W sumie to tak. Mam ze sob¹ kamieñ, który powodowa³ to ca³e zamieszanie ze z³ymi si³ami.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_07"); //To œwietnie. Przeka¿ Quentinowi dobre informacje. Pewnie ma dla ciebie wynagrodzenie.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_08"); //My tutaj zostaniemy i bêdziemy pilnowaæ wejœcia.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_09"); //A, i zabierz ten kamieñ ze sob¹. Nie chcê mieæ z nim nic wspólnego.
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_10"); //Myœla³em, ¿e podarujê ci go w prezencie. No, ale có¿...
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_11"); //Nie denerwuj mnie!
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_12"); //Dobra, ju¿ dobra. Uwa¿aj, bo go wyjmê!
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_13"); //IdŸ ju¿.
    B_LogEntry                     (CH1_OdbijanieOpKop,"Pokaza³em Doyle'owi artefakt odebrany nekromancie. Kaza³ mi udaæ siê z dobrymi wieœciami do Quentina. Wraz z Rockym i Chrisem postanowi³ pozostaæ tymczasowo na stra¿y.");
	HeroMaArtefakt = false;
    B_GiveXP (2000);
	/*
	   if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    }
    else
    {
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_14"); //Jeszcze nie. Nie mam przy sobie kamienia, który znajduje siê gdzieœ w kopalni.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_15"); //Jakiego kamienia?
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_16"); //Podobno jakiœ tajemniczy artefakt jest przyczyn¹ pojawiania siê o¿ywieñców.
        AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_17"); //Muszê siê go jakoœ pozbyæ.
        AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_18"); //No to idŸ po niego. Poczekamy tu i postaramy siê odpieraæ fale o¿ywnieñców.
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
   description	= "Mam ju¿ ten kamieñ.";
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
    AI_Output (other, self ,"DIA_Raeuber_MamKamien_15_01"); //Mam ju¿ ten kamieñ.
    AI_Output (self, other ,"DIA_Raeuber_MamKamien_03_02"); //To œwietnie. Zabierz go jak najszybciej ode mnie i idŸ do Quentina po dalsze rozkazy.
    AI_Output (self, other ,"DIA_Raeuber_MamKamien_03_03"); //My popilnujemy wejœcia do kopalni.
B_LogEntry                     (CH1_OdbijanieOpKop,"Zabra³em z kopalni artefakt, który doprowadza³ do pojawiania siê o¿ywieñców. Kopalnia jest oczyszczona. Mogê iœæ do Quentina.");
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
    AI_Output (self, other ,"DIA_Raeuber_PowrotzKopalni_03_01"); //Quentin wys³a³ do kopalni nowych ludzi. Postanowiliœmy wiêc wróciæ.
    AI_Output (other, self ,"DIA_Raeuber_PowrotzKopalni_15_02"); //Nie ma sprawy. Jeszcze raz dziêki za pomoc. 
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
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_02"); //Czy to strój pirata?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_03"); //Zgada³eœ siê z jakimiœ?
    AI_Output (other, self ,"DIA_Raeuber_PiratArmorDoyle_15_04"); //Mo¿na tak powiedzieæ.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_05"); //Ca³kiem niez³y taki strój.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_06"); //Podobno Quentin mia³ kiedyœ kontakt z piratami. 
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_07"); //Powinieneœ z nim pogadaæ.
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
   description	= "Wiesz coœ o Poszukiwaczach?";
};

FUNC INT DIA_Raeuber_POSZ_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_POSZUKIWACZE)) {
    return TRUE;
};
};

FUNC VOID DIA_Raeuber_POSZ_Info()
{

		AI_Output (other, self ,"DIA_Raeuber_POSZ_15_01"); //Wiesz coœ o Poszukiwaczach?
		AI_Output (self, other ,"DIA_Raeuber_POSZ_03_02"); //Powiem ci, ¿e coœ kr¹¿y w nocy po lesie. Jakieœ mroczne cienie.
		AI_Output (other, self ,"DIA_Raeuber_POSZ_15_03"); //Uwa¿aj na nich. To s³udzy Beliara.
        AI_Output (self, other ,"DIA_Raeuber_POSZ_03_04"); //Jak bêdê wiedzia³ coœ wiêcej, to dam ci znak. 
		 B_LogEntry                     (CH1_Poszukiwacze,"Doyle widzia³ Poszukiwaczy w pobli¿u lasu. Muszê czekaæ na dalszy rozwój wydarzeñ.");
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
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)// to trzeba usun¹æ
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
		B_LogEntry			(GE_TeacherBAN,"Doyle mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko poznam tajniki walki broni¹ jednorêczn¹.");
		log_Doylefight = TRUE;
	};
	AI_Output (other, self,"BAU_867_Doyle_ZWEIHAND1_Info_15_01"); //Chcia³bym nauczyæ siê pos³ugiwaæ dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 80)
	{
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy siê podstawami.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		BAU_867_Doyle_ZWEIHAND1.permanent = 0;
	};
	}
	else
	{
	AI_Output			(self,other,"BAU_867_Doyle_NO_ENOUGHT_STR_1"); //Cholera... Ch³opcze, poæwicz jeszcze trochê!
	PrintScreen	("Warunek: Si³a 80", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output (other, self,"BAU_867_Doyle_ZWEIHAND2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o walce dwurêcznym mieczem.
	if (hero.attribute[ATR_STRENGTH] >= 120)
	{
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"BAU_867_Doyle_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		BAU_867_Doyle_ZWEIHAND2.permanent = 0 ;
	};
		}
	else
	{
	AI_Output			(self,other,"BAU_867_Doyle_NO_ENOUGHT_STR_1"); //Cholera... Ch³opcze, poæwicz jeszcze trochê!
	PrintScreen	("Warunek: Si³a 120", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};  */
//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H (C_INFO)
{
	npc				= ORG_867_Raeuber;
	condition		= ORG_867_Doyle_TEACH_2H_Condition;
	information		= ORG_867_Doyle_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ broni¹ dwurêczn¹?"; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  ORG_867_Doyle_TEACH_2H_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ broni¹ dwurêczn¹?
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_Info_09_02"); //Szkolê tylko i wy³¹cznie ludzi Quentina. Do tego nie za darmo. 

	if (log_Doylefight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Doyle mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko zostanê cz³onkiem Bandy Quentina.");
		log_Doylefight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
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
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

func void ORG_867_Doyle_TEACH_2H_STARTBACK ()
{
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
};

FUNC VOID Doyle_teach_2h1 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_00"); //Chcia³bym nauczyæ siê walki dwurêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 1, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_01"); //Bronie dwurêczne wymagaj¹ sporo si³y. S¹ ciê¿kie, a przez to tak¿e wolniejsze.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_02"); //Zmieni siê to jednak w trakcie czynienia przez ciebie postêpów w nauce.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_03"); //Za powolnoœæ bronie dwurêczne odwdziêcz¹ ci siê potê¿nymi obra¿eniami.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_04"); //Ka¿d¹ broñ musisz odpowiednio wyczuæ. Topory s¹ inaczej zbalansowane ni¿ miecze. Pamiêtaj o tym.
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h2 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 2, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_06"); //Musisz pracowaæ nad swoj¹ si³¹. Pozwoli ci ona wykonywaæ szybsze ruchy i podnosiæ coraz ciê¿sze bronie. 
		//AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_07"); //PóŸniej bêdziesz musia³ poznaæ odpowiedni¹ technikê walki i ³¹cznia ciosów. 
		//AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_08"); //Na razie nie jesteœ wstanie zadaæ pe³nych obra¿eñ na jakie pozwala ci dana broñ. Spokojnie, zajmiemy siê tym.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h3 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 3, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_10"); //Wiesz jaka jest jeszcze zaleta dwurêcznych broni?
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_11"); //S¹ d³ugie... Im d³u¿sze tym dalej od siebie mo¿esz trzymaæ przeciwnika. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_12"); //Gdy kupujesz broñ zwracaj uwagê na jej górn¹ czêœæ. Jeœli jest wystarczaj¹co ostra to nawet draœniêcie oponenta z daleka zada mu obra¿enia lub zniszczy jego pancerz. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_14"); //Nie, nie, nie. Omówimy to na nastêpnej lekcji. 
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h4 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 4, 10))
		{
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h5 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 5, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_15"); //Na poprzedniej lekcji nauczy³em ciê jak porz¹dnie trzymaæ broñ i jak wykorzystaæ si³ê bezw³adnoœci ostrza.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_16"); //Pamiêtaj, ¿e im lepiej wyczujesz balans broni tym ³atwiej bêdzie ci ³¹czyæ kolejne ciosy.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_17"); //Musisz wiedzieæ, w którym momencie ponownie siê zamachn¹æ, tak by wykorzystaæ przy tym impet pierwszego uderzenia. Pozwoli ci to oszczêdziæ si³y.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h6 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 6, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_18"); //Stosuj ró¿ne strategie walki. Uderzaj raz z przodu, raz z boku. A póŸniej jeszcze z drugiej strony. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_19"); //Uniki z dwurêcznym mieczem w rêku faktycznie mog¹ byæ trudne, dlatego musisz parowaæ ciosy. Æwicz si³ê miêœni r¹k, pleców i klatki piersiowej. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_20"); //To pozwoli ci skutecznie blokowaæ, bez ryzyka po³amania sobie czegoœ. 
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h7 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 7, 10))
		{
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"ORG_867_Doyle_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h8 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 8, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h9 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 9, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};

FUNC VOID Doyle_teach_2h10 ()
{
	AI_Output (other,self,"DIA_Doyle_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê dwurêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_2h, 10, 10))
		{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_26"); //To ju¿ nasza ostatnia lekcja. Poka¿ê ci sztuczki, które pozwol¹ ci jeszcze lepiej wyczuæ broñ.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_27"); //Musisz nauczyæ siê rozpoznawaæ s³abe punkty przeciwników i skupiaæ siê na nich.
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_npc_28"); //Z czasem dojdziesz do wprawy. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Doyle_TRAIN_2h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,DIALOG_BACK,ORG_867_Doyle_TEACH_2H_STARTBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 0) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 1, 100 bry³ek rudy, 10 PN",Doyle_teach_2h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 1) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 2, 200 bry³ek rudy, 10 PN",Doyle_teach_2h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 2) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 3, 300 bry³ek rudy, 10 PN",Doyle_teach_2h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 3) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 4, 400 bry³ek rudy, 10 PN",Doyle_teach_2h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 4) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 5, 500 bry³ek rudy, 10 PN",Doyle_teach_2h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 5) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 6, 600 bry³ek rudy, 10 PN",Doyle_teach_2h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 6) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Doyle_teach_2h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 7) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Doyle_teach_2h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 8) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Doyle_teach_2h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_2h) == 9) 
	{
	Info_AddChoice		(ORG_867_Doyle_TEACH_2H_START,"Broñ dwurêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Doyle_teach_2h10);
	};
};