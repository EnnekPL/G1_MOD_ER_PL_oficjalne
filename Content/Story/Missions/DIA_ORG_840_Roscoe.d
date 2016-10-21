// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Roscoe_Exit (C_INFO)
{
	npc			= ORG_840_Roscoe;
	nr			= 999;
	condition	= DIA_Roscoe_Exit_Condition;
	information	= DIA_Roscoe_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Roscoe_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Roscoe_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Habe Liste
// ****************************************

instance DIA_Roscoe_BringList (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 1;
	condition		= DIA_Roscoe_BringList_Condition;
	information		= DIA_Roscoe_BringList_Info;
	permanent		= 0;
	description		= "Mam tu list� z zam�wieniami dla Starej Kopalni.";
};

FUNC int  DIA_Roscoe_BringList_Condition()
{	
	if (Npc_HasItems(other,TheList)>=1)
	{
		return 1;
	};
};

func void  DIA_Roscoe_BringList_Info()
{
	AI_Output (other, self,"DIA_Roscoe_BringList_15_00"); //Mam tu list� z zam�wieniami dla Starej Kopalni.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_01"); //Nie�le! Sk�d j� wytrzasn��e�?
	AI_Output (other, self,"DIA_Roscoe_BringList_15_02"); //Dosta�em j� od Iana.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_03"); //Masz tupet! Wys�ali ci�, �eby podda� ci� pr�bie, tak? Za�o�� si�, �e Thorusa trafia teraz jasny szlag!
	AI_Output (other, self,"DIA_Roscoe_BringList_15_04"); //To Diego zleci� mi to zadanie.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_05"); //Diego wype�nia tylko rozkazy Thorusa. Jak go znam, p�k�by ze �miechu na wie��, �e tu jeste�.
	AI_Output (other, self,"DIA_Roscoe_BringList_15_06"); //To jak - mog� wej��, czy nie?
	AI_Output (self, other,"DIA_Roscoe_BringList_10_07"); //Wchod� �mia�o. Laresowi oczy wyjd� na wierzch! 
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 			Mordrag schickt mich
// ****************************************

instance DIA_Roscoe_Mordrag (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_Mordrag_Condition;
	information		= DIA_Roscoe_Mordrag_Info;
	important		= 0;
	description		= "Przysy�a mnie Mordrag.";
};

FUNC int  DIA_Roscoe_Mordrag_Condition()
{	
	//if (Npc_KnowsInfo (hero, Org_826_Mordrag_AtNewcamp))
	if	(Npc_HasItems(hero, MordragsRing))
	{
		return 1;
	};
};

func void  DIA_Roscoe_Mordrag_Info()
{
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_00"); //Przysy�a mnie Mordrag.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag ju� dawno tu nie zagl�da�. Pewnie przeszed� na stron� Starego Obozu.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_02"); //To on mnie do was przyprowadzi�.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag wr�ci�?! Jakby� go jeszcze spotka�, powiedz mu, �e Lares chce si� z nim widzie�.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag da� mi co� dla Laresa.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_05"); //Co takiego?
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_06"); //Pier�cie�.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_07"); //Za�o�� si�, �e bardzo cenny... Dobra, mo�esz si� zobaczy� z szefem.
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 			Kret - z rozkazu Okyla
//				ver. 1.4.02
// ****************************************

INSTANCE DIA_Roscoe_Okyl (C_INFO)
{
   npc          = Org_840_Roscoe;
   nr           = 1;
   condition    = DIA_Roscoe_Okyl_Condition;
   information  = DIA_Roscoe_Okyl_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Okyl.";
};

FUNC INT DIA_Roscoe_Okyl_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_KillHim))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Roscoe_Okyl_Info()
{
    AI_Output (other, self ,"DIA_Roscoe_Okyl_15_01"); //Przysy�a mnie Okyl. Chcia�bym do��czy� do bandy Laresa. 
    AI_Output (self, other ,"DIA_Roscoe_Okyl_03_02"); //Okyl to jeden z ludzi Lee. Je�li za ciebie r�czy, to mo�esz wej��.
    self.aivar[AIV_PASSGATE] = TRUE;
    AI_StopProcessInfos	(self);
};

// ****************************************
// 			Gildia - awans lub inne 
//				ver. 1.4.5
// ****************************************

INSTANCE DIA_Roscoe_IveGuild (C_INFO)
{
   npc          	= Org_840_Roscoe;
   nr           	= 1;
   condition    	= DIA_Roscoe_IveGuild_Condition;
   information  	= DIA_Roscoe_IveGuild_Info;
   permanent		= FALSE;
   description		= "Zejd� mi z drogi. Nale�� do Nowego Obozu i chc� pogada� z Laresem.";
};

FUNC INT DIA_Roscoe_IveGuild_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_KDW) && self.aivar[AIV_PASSGATE] == FALSE
    {
    return TRUE;
    };
};


FUNC VOID DIA_Roscoe_IveGuild_Info()
{
    AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_01"); //Zejd� mi z drogi. Nale�� do Nowego Obozu i chc� pogada� z Laresem.
    AI_Output (self, other ,"DIA_Roscoe_IveGuild_03_02"); //Odwa�ny jeste�. Nie ka�dy mo�e sobie tak tu wchodzi�.
	AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_03"); //Naprawd� ma�o mnie interesuje co sobie my�lisz. Przepu�� mnie. 
	AI_Output (self, other ,"DIA_Roscoe_IveGuild_03_04"); //W�a�, tylko je�li us�ysz� na ciebie cho� jedno z�e s�owo to zmyj� ten hardy u�mieszek z twojej bu�ki. Jasne?
	AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_05"); //�eby� si� tylko nie przepracowa�. 
    self.aivar[AIV_PASSGATE] = TRUE;
    AI_StopProcessInfos	(self);
};

// ****************************************
// 				Wanna Join
// ****************************************

instance DIA_Roscoe_WannaJoin (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_WannaJoin_Condition;
	information		= DIA_Roscoe_WannaJoin_Info;
	permanent		= 0;
	description		= "Chcia�bym do was do��czy�.";
};

FUNC int  DIA_Roscoe_WannaJoin_Condition()
{	
	if	!Npc_KnowsInfo(hero,DIA_Roscoe_Mordrag)
	&&	!Npc_KnowsInfo(hero,DIA_Roscoe_BringList)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

func void  DIA_Roscoe_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Roscoe_WannaJoin_15_00"); //Chcia�bym do was do��czy�.
	AI_Output (self, other,"DIA_Roscoe_WannaJoin_10_01"); //Nie ty jeden, ale samo "chcenie" nie wystarczy. Musisz udowodni�, �e b�dzie z ciebie jaki� po�ytek.	
};

// ****************************************
// 				Nochmal da
// ****************************************

instance DIA_Roscoe_ComeAgain (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_ComeAgain_Condition;
	information		= DIA_Roscoe_ComeAgain_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Roscoe_ComeAgain_Condition()
{	
	
	if 	(
		( (Npc_HasItems(other,TheList)>=1) && Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) )
	|| 	( Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && Npc_KnowsInfo(hero,ORG_801_Lares_BringList) )
		)
	{
		return 1;
	};
};

func void  DIA_Roscoe_ComeAgain_Info()
{
	AI_Output (self, other,"DIA_Roscoe_ComeAgain_10_00"); //Znowu ty.
};

//========================================
//-----------------> LetterForFireMages
//========================================

INSTANCE DIA_Roscoe_LetterForFireMages (C_INFO)
{
   npc          = ORG_840_Roscoe;
   nr           = 1;
   condition    = DIA_Roscoe_LetterForFireMages_Condition;
   information  = DIA_Roscoe_LetterForFireMages_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Roscoe_LetterForFireMages_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_CourierFireMage_QuestCont))
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Roscoe_LetterForFireMages_Info()
{
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_01"); //Podejd� no bli�ej, s�ugo Gomeza.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_03"); //Podobno pomagasz Magom Ognia, a ja mam do nich bardzo wa�ny interes.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_04"); //M�j szef osobi�cie prosi� mnie, bym si� z tob� spotka�.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_05"); //Mam dla ciebie list od Laresa do Mag�w Ognia.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_06"); //List?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_07"); //Tak, list. Oto on.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_08"); //Nie musisz do mnie wraca� jak dostarczysz list. Wierz mi, b�d� o tym wiedzia�.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_09"); //Sk�d? �ledzisz mnie?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_10"); //Mam swoje �r�d�a.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_11"); //Dlaczego chcia�e� si� spotka� akurat tutaj?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_12"); //Jako cz�onek Starego Obozu nie masz wst�pu do siedziby Laresa.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_13"); //Stra�nicy nigdy nie pozwoliliby ci przej��.
    CreateInvItems (self, ItMis_LetterLaresToFireMages, 1);
    B_GiveInvItems (self, other, ItMis_LetterLaresToFireMages, 1);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
	
	B_LogEntry                     (CH2_CourierFireMage,"Roscoe przekaza� mi list do Mag�w Ognia. Podobno Lares ma do nich jaki� interes.");
};



//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Roscoe_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";
// **********************************************

instance Info_Roscoe_FirstWarn (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 2;
	condition	= Info_Roscoe_FirstWarn_Condition;
	information	= Info_Roscoe_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	((Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) ||(Npc_GetTrueGuild(hero) == GIL_SFB) )
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	&& ((Npc_GetTrueGuild(hero) != GIL_SLD) || (Npc_GetTrueGuild(hero) != GIL_KDW) || (Npc_GetTrueGuild(hero) != GIL_ORG))
	{
		return TRUE;
	};
};

func void Info_Roscoe_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Dok�d si� wybierasz?
	AI_Output (hero, self,"Info_Roscoe_FirstWarn_Info_15_01"); //Chc� si� zobaczy� z Laresem.
	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Szef jest u siebie, ale trzeba mie� niez�y pow�d, �eby mu przeszkodzi�.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Roscoe_LastWarn (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 1;
	condition	= Info_Roscoe_LastWarn_Condition;
	information	= Info_Roscoe_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		)
	&&  (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Roscoe_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Roscoe_LastWarn_10_00"); //Og�uch�e�?

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Roscoe_Attack (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 1;
	condition	= Info_Roscoe_Attack_Condition;
	information	= Info_Roscoe_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Roscoe_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

//========================================
//-----------------> LARES_HELP
//========================================

INSTANCE DIA_Roscoe_LARES_HELP (C_INFO)
{
   npc          = ORG_840_Roscoe;
   nr           = 1;
   condition    = DIA_Roscoe_LARES_HELP_Condition;
   information  = DIA_Roscoe_LARES_HELP_Info;
   permanent	= FALSE;
   description	= "Jak powinienem si� zachowa�, kiedy stan� przed Laresem?";
};

FUNC INT DIA_Roscoe_LARES_HELP_Condition()
{
    if self.aivar[AIV_PASSGATE] == TRUE
    {
    return TRUE;
    };
};


FUNC VOID DIA_Roscoe_LARES_HELP_Info()
{
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_01"); //Jak powinienem si� zachowa�, kiedy stan� przed Laresem?
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_02"); //Z pewno�ci� nie powiniene� nic kombinowa�. Lares ocenia ludzi na podstawie ich dokona�. 
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_03"); //Im wi�cej zrobisz dla dobra Nowego Obozu, szkodz�c przy okazji Staremu - tym bardziej zostaniesz doceniony przez szefa.
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_04"); //W porz�dku.
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_05"); //Ach... I nawet nie pr�buj nic ukra��, bo trafisz do piachu. Jasne?
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_06"); //Jak s�o�ce.
};

// ****************************************
// Start zadania "Skarb starego stra�nika"
// ****************************************

instance DIA_Roscoe_TreasureOldGuard (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 1;
	condition		= DIA_Roscoe_TreasureOldGuard_Condition;
	information		= DIA_Roscoe_TreasureOldGuard_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Roscoe_TreasureOldGuard_Condition()
{	
	if self.aivar[AIV_PASSGATE] == TRUE && (kapitel == 2) && ( (Npc_GetTrueGuild (hero) == GIL_ORG) || (Npc_GetTrueGuild (hero) == GIL_SLD) )
	{
	return 1;
	};
};

func void  DIA_Roscoe_TreasureOldGuard_Info()
{
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_00"); //Zaczekaj, masz chwile?
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_01"); //Mo�liwe...
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_02"); //To dobrze. Wiesz, jako bliski wsp�pracownik Laresa mam dost�p do ciekawych informacji. 
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_03"); //Ta, kt�r� teraz posiadam mo�e nie wp�ynie specjalnie na los Nowego Obozu, ale mo�e sprawi�, �e paru ludzi nie�le si� wzbogaci.
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_04"); //Brzmi interesuj�co. Jakie� konkrety?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_05"); //Pono� w obozie pod Star� Kopalni� s�yszy si� ostatnio o pewnym dawno ukrytym skarbie.
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_06"); //Z tego co mi wiadomo ukry� go stary Stra�nik wiele lat temu. Mia� na imi� Craig.
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_07"); //No dobra. Chyba nie na darmo m�wisz mi o tym skarbie. Je�li dowiem si� gdzie jest, to jak go podzielimy?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_08"); //Tak si� sk�ada, �e wiem nawet co wchodzi w jego sk�ad. Sporo rudy oraz wisior z pere� i amulet. Ja wezm� b�yskotki, a ty rud�. Zgoda?
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_09"); //Niech b�dzie. Masz jaki� pomys� co do miejsca poszukiwa�?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_10"); //C�, popytaj o tego Craiga pod Kopalni�. Powiedzia�em ci ju� wszystko, co wiem.
	
	MIS_TreasureOldGuard = LOG_RUNNING;

	Log_CreateTopic			(CH2_TreasureOldGuard, LOG_MISSION);
	Log_SetTopicStatus		(CH2_TreasureOldGuard, LOG_RUNNING);
	B_LogEntry				(CH2_TreasureOldGuard,"Szkodnik pilnuj�cy wej�cia do chaty Laresa powiedzia� mi, �e pewien Stra�nik pe�ni�cy s�u�b� w Starej Kopalni przed wieloma laty ukry� do�� spory skarb. Je�li uda mi si� go odnale��, to Lares podzieli si� ze mn� zyskiem. Powinienem popyta� w obozie przed Kopalni� o stra�nika Craiga.");
};

instance DIA_Roscoe_TreasureFound (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 1;
	condition		= DIA_Roscoe_TreasureFound_Condition;
	information		= DIA_Roscoe_TreasureFound_Info;
	permanent		= 0;
	description		= "Odnalaz�em skarb.";
};

FUNC int DIA_Roscoe_TreasureFound_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_KUCHARZ_AskAboutTreasure)) && (Npc_HasItems (other, ItMi_CraigsOldAmulet) >=1) && (Npc_HasItems (other, ItMi_CraigsAmulet) >=1)
   {
		return TRUE;
   };
};

func void  DIA_Roscoe_TreasureFound_Info()
{
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_00"); //Odnalaz�em skarb.
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_01"); //No prosz�! Zdolny jeste�!
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_02"); //To nie by�o wcale proste, ale uda�o si�. Dalej jeste� zainteresowany wisiorem z pere� i amuletem?
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_03"); //Pewnie, �e tak! Powiedzia�em ci o skarbie wi�c mi si� nale��. 
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_04"); //Zgoda. Masz tu wisior i amulet.
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_05"); //Doskonale. Znam kogo� kto odkupi to za porz�dn� cen�. Dobra robota, m�ody. 
	
	B_GiveInvItems (other,self,ItMi_CraigsOldAmulet,1);
	B_GiveInvItems (other,self,ItMi_CraigsAmulet,1);
	
	MIS_TreasureOldGuard = LOG_SUCCESS;

	B_GiveXP (275);
	Log_SetTopicStatus(CH2_TreasureOldGuard, LOG_SUCCESS);
	B_LogEntry(CH2_TreasureOldGuard,"Odda�em Roscoe wisior i amulet, kt�re mu obieca�em. Ruda ze skarbu jest moja.");
};