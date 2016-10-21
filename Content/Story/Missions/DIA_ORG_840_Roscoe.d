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
	description		= "Mam tu listê z zamówieniami dla Starej Kopalni.";
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
	AI_Output (other, self,"DIA_Roscoe_BringList_15_00"); //Mam tu listê z zamówieniami dla Starej Kopalni.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_01"); //NieŸle! Sk¹d j¹ wytrzasn¹³eœ?
	AI_Output (other, self,"DIA_Roscoe_BringList_15_02"); //Dosta³em j¹ od Iana.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_03"); //Masz tupet! Wys³ali ciê, ¿eby poddaæ ciê próbie, tak? Za³o¿ê siê, ¿e Thorusa trafia teraz jasny szlag!
	AI_Output (other, self,"DIA_Roscoe_BringList_15_04"); //To Diego zleci³ mi to zadanie.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_05"); //Diego wype³nia tylko rozkazy Thorusa. Jak go znam, pêk³by ze œmiechu na wieœæ, ¿e tu jesteœ.
	AI_Output (other, self,"DIA_Roscoe_BringList_15_06"); //To jak - mogê wejœæ, czy nie?
	AI_Output (self, other,"DIA_Roscoe_BringList_10_07"); //WchodŸ œmia³o. Laresowi oczy wyjd¹ na wierzch! 
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
	description		= "Przysy³a mnie Mordrag.";
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
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_00"); //Przysy³a mnie Mordrag.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag ju¿ dawno tu nie zagl¹da³. Pewnie przeszed³ na stronê Starego Obozu.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_02"); //To on mnie do was przyprowadzi³.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag wróci³?! Jakbyœ go jeszcze spotka³, powiedz mu, ¿e Lares chce siê z nim widzieæ.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag da³ mi coœ dla Laresa.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_05"); //Co takiego?
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_06"); //Pierœcieñ.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_07"); //Za³o¿ê siê, ¿e bardzo cenny... Dobra, mo¿esz siê zobaczyæ z szefem.
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
   description	= "Przysy³a mnie Okyl.";
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
    AI_Output (other, self ,"DIA_Roscoe_Okyl_15_01"); //Przysy³a mnie Okyl. Chcia³bym do³¹czyæ do bandy Laresa. 
    AI_Output (self, other ,"DIA_Roscoe_Okyl_03_02"); //Okyl to jeden z ludzi Lee. Jeœli za ciebie rêczy, to mo¿esz wejœæ.
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
   description		= "ZejdŸ mi z drogi. Nale¿ê do Nowego Obozu i chcê pogadaæ z Laresem.";
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
    AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_01"); //ZejdŸ mi z drogi. Nale¿ê do Nowego Obozu i chcê pogadaæ z Laresem.
    AI_Output (self, other ,"DIA_Roscoe_IveGuild_03_02"); //Odwa¿ny jesteœ. Nie ka¿dy mo¿e sobie tak tu wchodziæ.
	AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_03"); //Naprawdê ma³o mnie interesuje co sobie myœlisz. Przepuœæ mnie. 
	AI_Output (self, other ,"DIA_Roscoe_IveGuild_03_04"); //W³aŸ, tylko jeœli us³yszê na ciebie choæ jedno z³e s³owo to zmyjê ten hardy uœmieszek z twojej buŸki. Jasne?
	AI_Output (other, self ,"DIA_Roscoe_IveGuild_15_05"); //¯ebyœ siê tylko nie przepracowa³. 
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
	description		= "Chcia³bym do was do³¹czyæ.";
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
	AI_Output (other, self,"DIA_Roscoe_WannaJoin_15_00"); //Chcia³bym do was do³¹czyæ.
	AI_Output (self, other,"DIA_Roscoe_WannaJoin_10_01"); //Nie ty jeden, ale samo "chcenie" nie wystarczy. Musisz udowodniæ, ¿e bêdzie z ciebie jakiœ po¿ytek.	
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
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_01"); //PodejdŸ no bli¿ej, s³ugo Gomeza.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_03"); //Podobno pomagasz Magom Ognia, a ja mam do nich bardzo wa¿ny interes.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_04"); //Mój szef osobiœcie prosi³ mnie, bym siê z tob¹ spotka³.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_05"); //Mam dla ciebie list od Laresa do Magów Ognia.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_06"); //List?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_07"); //Tak, list. Oto on.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_08"); //Nie musisz do mnie wracaæ jak dostarczysz list. Wierz mi, bêdê o tym wiedzia³.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_09"); //Sk¹d? Œledzisz mnie?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_10"); //Mam swoje Ÿród³a.
    AI_Output (other, self ,"DIA_Roscoe_LetterForFireMages_15_11"); //Dlaczego chcia³eœ siê spotkaæ akurat tutaj?
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_12"); //Jako cz³onek Starego Obozu nie masz wstêpu do siedziby Laresa.
    AI_Output (self, other ,"DIA_Roscoe_LetterForFireMages_03_13"); //Stra¿nicy nigdy nie pozwoliliby ci przejœæ.
    CreateInvItems (self, ItMis_LetterLaresToFireMages, 1);
    B_GiveInvItems (self, other, ItMis_LetterLaresToFireMages, 1);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
	
	B_LogEntry                     (CH2_CourierFireMage,"Roscoe przekaza³ mi list do Magów Ognia. Podobno Lares ma do nich jakiœ interes.");
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

	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Dok¹d siê wybierasz?
	AI_Output (hero, self,"Info_Roscoe_FirstWarn_Info_15_01"); //Chcê siê zobaczyæ z Laresem.
	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Szef jest u siebie, ale trzeba mieæ niez³y powód, ¿eby mu przeszkodziæ.

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
	AI_Output (self, hero,"Info_Roscoe_LastWarn_10_00"); //Og³uch³eœ?

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
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
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
   description	= "Jak powinienem siê zachowaæ, kiedy stanê przed Laresem?";
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
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_01"); //Jak powinienem siê zachowaæ, kiedy stanê przed Laresem?
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_02"); //Z pewnoœci¹ nie powinieneœ nic kombinowaæ. Lares ocenia ludzi na podstawie ich dokonañ. 
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_03"); //Im wiêcej zrobisz dla dobra Nowego Obozu, szkodz¹c przy okazji Staremu - tym bardziej zostaniesz doceniony przez szefa.
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_04"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Roscoe_LARES_HELP_03_05"); //Ach... I nawet nie próbuj nic ukraœæ, bo trafisz do piachu. Jasne?
    AI_Output (other, self ,"DIA_Roscoe_LARES_HELP_15_06"); //Jak s³oñce.
};

// ****************************************
// Start zadania "Skarb starego stra¿nika"
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
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_01"); //Mo¿liwe...
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_02"); //To dobrze. Wiesz, jako bliski wspó³pracownik Laresa mam dostêp do ciekawych informacji. 
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_03"); //Ta, któr¹ teraz posiadam mo¿e nie wp³ynie specjalnie na los Nowego Obozu, ale mo¿e sprawiæ, ¿e paru ludzi nieŸle siê wzbogaci.
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_04"); //Brzmi interesuj¹co. Jakieœ konkrety?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_05"); //Ponoæ w obozie pod Star¹ Kopalni¹ s³yszy siê ostatnio o pewnym dawno ukrytym skarbie.
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_06"); //Z tego co mi wiadomo ukry³ go stary Stra¿nik wiele lat temu. Mia³ na imiê Craig.
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_07"); //No dobra. Chyba nie na darmo mówisz mi o tym skarbie. Jeœli dowiem siê gdzie jest, to jak go podzielimy?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_08"); //Tak siê sk³ada, ¿e wiem nawet co wchodzi w jego sk³ad. Sporo rudy oraz wisior z pere³ i amulet. Ja wezmê b³yskotki, a ty rudê. Zgoda?
	AI_Output (other, self, "DIA_Roscoe_TreasureOldGuard_15_09"); //Niech bêdzie. Masz jakiœ pomys³ co do miejsca poszukiwañ?
	AI_Output (self, other, "DIA_Roscoe_TreasureOldGuard_10_10"); //Có¿, popytaj o tego Craiga pod Kopalni¹. Powiedzia³em ci ju¿ wszystko, co wiem.
	
	MIS_TreasureOldGuard = LOG_RUNNING;

	Log_CreateTopic			(CH2_TreasureOldGuard, LOG_MISSION);
	Log_SetTopicStatus		(CH2_TreasureOldGuard, LOG_RUNNING);
	B_LogEntry				(CH2_TreasureOldGuard,"Szkodnik pilnuj¹cy wejœcia do chaty Laresa powiedzia³ mi, ¿e pewien Stra¿nik pe³ni¹cy s³u¿bê w Starej Kopalni przed wieloma laty ukry³ doœæ spory skarb. Jeœli uda mi siê go odnaleŸæ, to Lares podzieli siê ze mn¹ zyskiem. Powinienem popytaæ w obozie przed Kopalni¹ o stra¿nika Craiga.");
};

instance DIA_Roscoe_TreasureFound (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 1;
	condition		= DIA_Roscoe_TreasureFound_Condition;
	information		= DIA_Roscoe_TreasureFound_Info;
	permanent		= 0;
	description		= "Odnalaz³em skarb.";
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
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_00"); //Odnalaz³em skarb.
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_01"); //No proszê! Zdolny jesteœ!
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_02"); //To nie by³o wcale proste, ale uda³o siê. Dalej jesteœ zainteresowany wisiorem z pere³ i amuletem?
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_03"); //Pewnie, ¿e tak! Powiedzia³em ci o skarbie wiêc mi siê nale¿¹. 
	AI_Output (other, self, "DIA_Roscoe_TreasureFound_15_04"); //Zgoda. Masz tu wisior i amulet.
	AI_Output (self, other, "DIA_Roscoe_TreasureFound_10_05"); //Doskonale. Znam kogoœ kto odkupi to za porz¹dn¹ cenê. Dobra robota, m³ody. 
	
	B_GiveInvItems (other,self,ItMi_CraigsOldAmulet,1);
	B_GiveInvItems (other,self,ItMi_CraigsAmulet,1);
	
	MIS_TreasureOldGuard = LOG_SUCCESS;

	B_GiveXP (275);
	Log_SetTopicStatus(CH2_TreasureOldGuard, LOG_SUCCESS);
	B_LogEntry(CH2_TreasureOldGuard,"Odda³em Roscoe wisior i amulet, które mu obieca³em. Ruda ze skarbu jest moja.");
};