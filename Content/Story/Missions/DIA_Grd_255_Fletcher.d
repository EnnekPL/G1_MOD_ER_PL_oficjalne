// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hej, ty!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kto? Ja?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Wiesz dobrze, do kogo m�wi�, synku!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Co� ci powiem: to m�j rejon i nie chc� tutaj �adnych k�opot�w!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Ale nowi, tacy jak ty, zawsze sprawiaj� k�opoty. Zw�aszcza, kiedy buszuj� tutaj w nocy.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Lepiej b�dzie, je�li p�jdziesz sobie ju� do domu i nie poka�esz si� tutaj zbyt pr�dko. Przy arenie jest jedna pusta chata, ma daszek nad wej�ciem. Id� spa�!
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Ale je�li z�api� ci� na grzebaniu w cudzych chatach, osobi�cie postaram si�, �eby� ju� nigdy wi�cej tego nie zrobi�!
	b_givexp (150);
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Je�li chcesz si� pozby� swoich pieni�dzy za ochron�, wybra�e� z�y dzie�.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? A dlaczego?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Bo mnie tu nie ma.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Rozumiem." 	,DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"To jakim cudem z tob� rozmawiam?"	,DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Czy�by? A gdzie jeste�?"	,DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Czy�by? A gdzie jeste�?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //W tej chwili siedz� w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //To jakim cudem z tob� rozmawiam?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek gdzie� znikn��. Zwykle to on patroluje ten rejon.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dop�ki nie raczy si� tutaj zjawi�, Thorus kaza� MI mie� oko na wszystko.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Rozumiem.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Wiesz, gdzie si� podziewa Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if (( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) ) && (Sly_LostNek == LOG_RUNNING)) || (MIS_WheresNek == LOG_RUNNING)
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Wiesz, gdzie si� podziewa Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Nie, i raczej si� tego nie dowiem.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Je�li komu� co� o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj� ze Stra�nikami.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //A zw�aszcza ze mn�, bo wiedz�, �e brzydz� si� ich robot�. Za�o�� si�, �e pod�miewaj� si� ze mnie za moimi plecami.
	
	if (Sly_LostNek != LOG_SUCCESS)
	{
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,	"Mo�e Kopacze mieszkaj�cy w pobli�u areny wiedz� gdzie si� podzia� Nek.");
	};
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Ale dlaczego nie zbierasz pieni�dzy za ochron�?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Ale dlaczego nie zbierasz pieni�dzy za ochron�?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek zebra� ju�, co by�o do zebrania. Wi�cej z nich nie wycisn�.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Chodzi o Neka...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Chodzi o Neka.
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Tak?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Chyba go znalaz�em.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Co? Gdzie on jest?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //W innym, lepszym �wiecie...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //O cholera! To znaczy, �e b�d� tutaj tkwi� do ko�ca �ycia. Mia�em nadziej�, �e ten b�cwa� jednak wr�ci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Teraz mam k�opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //�adnych wie�ci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Informuj mnie na bie��co.
	};
};

// ************************************************************
//						Wo Nek 2			
// ************************************************************

instance DIA_Fletcher_WoNek2 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek2_Condition;
	information		= DIA_Fletcher_WoNek2_Info;
	permanent		= 0;
	description		= "Snaf twierdzi, �e Nek �yje.";
};

func int DIA_Fletcher_WoNek2_Condition()
{	
	if  (MIS_WheresNek == LOG_RUNNING) && (fletcher_foundNek == true)
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek2_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_00"); //Snaf twierdzi, �e Nek �yje.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_01"); //O czym ty znowu gadasz? Dopiero co m�wi�e�, �e gryzie piach! 
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_02"); //Pewne okoliczno�ci uleg�y zmianom. By� mo�e trup le��cy w jaskini za Obozem nie jest tym Stra�nikiem, o kt�rego nam chodzi. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_03"); //To co ty tu jeszcze robisz? Szukaj tego imbecyla!
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_04"); //Liczy�em, �e dasz mi jakie� wskaz�wki.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_05"); //Jakie wskaz�wki do cholery? Przecie� wiesz co wszyscy m�wi�. Nek, o ile �yje, jest w Nowym Obozie. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_06"); //Musisz wej�� w to g�wno i zacz�� w nim grzeba� dop�ki go nie znajdziesz. Kapujesz? Na tym to polega. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_07"); //Jak ju� znajdziesz tego dezertera, to urwij mu �eb. Dos�ownie, bez ogr�dek. Taki �mie� na nic si� nam nie przyda. 
	
	B_LogEntry               (CH1_WheresNek,"Fletcher bez zb�dnych op�nie� kaza� mi przeczesa� Nowy Ob�z w poszukiwaniu Neka. Gdy go znajd�, ma zgin��.");	
};

// ************************************************************
//						Hero Kill Nek			
// ************************************************************

instance DIA_Fletcher_KillNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_KillNek_Condition;
	information		= DIA_Fletcher_KillNek_Info;
	permanent		= 0;
	description		= "Zabi�em Neka.";
};

func int DIA_Fletcher_KillNek_Condition()
{	
	if (HeroKillNek == true) && Npc_KnowsInfo(hero,DIA_Nek_Exposed)
	{
		return 1;
	};
};

func void  DIA_Fletcher_KillNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_00"); //Zabi�em Neka.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_01"); //Jedno pytanie, by� w Nowym Obozie?
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_02"); //Tak.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_03"); //Dosta� to na co zas�u�y�, zdradziecki sukinsyn. 
	
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Dostan� co�?", DIA_Fletcher_KillNek_MONEY);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Do zobaczenia.", DIA_Fletcher_KillNek_ENDE);

	B_GiveXP (50);
};

func void DIA_Fletcher_KillNek_MONEY ()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_00"); //Dostan� co�?
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_01"); //Przecie� ci� ju� pochwali�em... Nie mam teraz rudy. M�wi�em ci chyba o moich d�ugach u Scatty'ego.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_02"); //Czyli pozby�em si� go na marne? 
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_03"); //A czy kto� ci m�wi�, �e co� dostaniesz? Zrobi�e� to z czystej idei: �mier� za zdrad�. �wiadomo�� tego niech b�dzie twoj� nagrod�.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_04"); //Niezwykle pocieszaj�ce...
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	AI_StopProcessInfos (self);
};

func void DIA_Fletcher_KillNek_ENDE ()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_ENDE_15_00"); //Do zobaczenia. 
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Hero Found Nek			
// ************************************************************

instance DIA_Fletcher_FoundNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_FoundNek_Condition;
	information		= DIA_Fletcher_FoundNek_Info;
	permanent		= 0;
	description		= "Znalaz�em Neka, ale wci�� �yje.";
};

func int DIA_Fletcher_FoundNek_Condition()
{	
	if (HeroKillNek == false) && Npc_KnowsInfo(hero,DIA_Nek_Exposed) && !Npc_KnowsInfo(hero,DIA_Fletcher_FoundNek_2)
	{
		return 1;
	};
};

func void  DIA_Fletcher_FoundNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_00"); //Znalaz�em Neka, ale wci�� �yje.
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_01"); //Jak to? 
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_02"); //Jest w Nowym Obozie. Zap�aci� mi za to, �ebym zostawi� go w spokoju, ale pomy�la�em, �e zainteresuje ci� jego obecna kryj�wka... 
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_03"); //Ty durniu! Mia�e� go ZABI�, a nie m�wi� mi gdzie jest. Dwulicowa szuja. Spadaj st�d. 
};

// ************************************************************
//						Hero Found Nek2		
// ************************************************************

instance DIA_Fletcher_FoundNek_2 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_FoundNek_2_Condition;
	information		= DIA_Fletcher_FoundNek_2_Info;
	permanent		= 0;
	description		= "Neka zabi�o stado wilk�w.";
};

func int DIA_Fletcher_FoundNek_2_Condition()
{	
	if (HeroKillNek == false) && Npc_KnowsInfo(hero,DIA_Nek_Exposed) && !Npc_KnowsInfo(hero,DIA_Fletcher_FoundNek)
	{
		return 1;
	};
};

func void  DIA_Fletcher_FoundNek_2_Info()
{
	AI_Output (other, self,"DIA_Fletcher_FoundNek_2_15_00"); //Neka zabi�o stado wilk�w.
	AI_Output (self, other,"DIA_Fletcher_FoundNek_2_06_01"); //Ha! I dobrze mu tak. Dwulicowy sukinsyn...
};
// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Jaki problem?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Jaki problem?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jestem winien Scatty'emu nie lada sumk�. Kiedy dowie si�, �e przej��em dzia�k� Neka, b�dzie mnie nachodzi� codziennie...
};	

//========================================
//-----------------> HelloIHelYou
//========================================

INSTANCE DIA_Fletcher_HelloIHelYou (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_HelloIHelYou_Condition;
   information  = DIA_Fletcher_HelloIHelYou_Info;
   permanent	= FALSE;
   description	= "Mo�e mog� ci jako� pom�c?";
};

FUNC INT DIA_Fletcher_HelloIHelYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fletcher_Problem))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_HelloIHelYou_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_01"); //Mo�e mog� ci jako� pom�c?
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_02"); //To zale�y.
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_03"); //Dasz rad� znale�� kogo� na moje miejsce?
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_04"); //Popyta� nie zaszkodzi.
	AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_05"); //W sumie to mo�e m�g�bym si� z kim� zamieni� albo co� w tym stylu.
    
	MIS_FletchersReplacement = LOG_RUNNING;

    Log_CreateTopic          (CH1_FletchersReplacement, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FletchersReplacement, LOG_RUNNING);
    B_LogEntry               (CH1_FletchersReplacement,"Fletcher poprosi� mnie, abym poszuka� dla niego zast�pstwa.");
        
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Trip
//========================================

INSTANCE DIA_Fletcher_Trip (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Trip_Condition;
   information  = DIA_Fletcher_Trip_Info;
   permanent	= FALSE;
   description	= "Przyprowadzi�em Tripa.";
};

FUNC INT DIA_Fletcher_Trip_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_GoToWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Trip_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_01"); //Przyprowadzi�em Tripa.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_02"); //Co� nie w humorze ten tw�j kolega, ale niech b�dzie.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_03"); //Przez kilka tygodni przesiadywa� w karczmie i udawa�, �e pracuje.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_04"); //Do tego zbiera� wyp�at�.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_05"); //He he. Sprytny jest. M�j cz�owiek.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_06"); //My�l�, �e sobie tutaj poradzi.
	
    B_LogEntry               (CH1_FletchersReplacement,"Przyprowadzi�em Tripa do Fletchera. Fletcher mo�e ju� spokojnie i�� do zamku.");
    Log_SetTopicStatus       (CH1_FletchersReplacement, LOG_SUCCESS);
    MIS_FletchersReplacement = LOG_SUCCESS;

    B_GiveXP (100);

    Npc_ExchangeRoutine (self,"zamek");
    AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Widz�, �e szybko nauczy�e� si� dba� o swoje interesy. Witamy w stra�y!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*
//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomy�le�, �e uwa�ali�my ci� za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Mag�w Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog� ci nawet znajomo�ci w�r�d Cieni!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //O czym ty do diab�a m�wisz, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz si� z tymi bandziorami z Nowego Obozu! A mo�e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //My�la�e�, �e si� nie domy�limy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada�e� zmys�y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale� sk�d. Za to TY za chwil� stracisz G�OW�, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GI�, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa� si� przy tylnej bramie. Na m�j widok zareagowa� podobnie jak Fletcher. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, kt�ry strze�e teraz g��wnej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No prosz�. To go�� z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To go�� z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jaki� problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mie�, to ja b�d� wasz� ma�� kopalni�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy�by? Chyba �nisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k�opot�w.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by�o o tym pomy�le� zanim tutaj przyszed�e�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch�opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};
*/

//========================================
//-----------------> WhatsUpGuard
//========================================

INSTANCE DIA_Fletcher_WhatsUpGuard (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_WhatsUpGuard_Condition;
   information  = DIA_Fletcher_WhatsUpGuard_Info;
   permanent	= FALSE;
   description	= "Jak leci, Stra�niku?";
};

FUNC INT DIA_Fletcher_WhatsUpGuard_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_WhatsUpGuard_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_01"); //Jak leci, Stra�niku?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_02"); //Ju� nie jestem Stra�nikiem. Teraz nale�� do stra�y Kruka.
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_03"); //Zamierzamy rozpocz�� nowe �ycie z dala od Starego Obozu.
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_04"); //A jak tam tw�j d�ug u Scatty'ego?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_05"); //Uda�o mi si� wynegocjowa� ugod�. Pomog�em Scatty'emu zdoby� kilka cennych b�yskotek, gdy uciekali�my z Obozu.
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_06"); //To by�o ca�kiem op�acalne. Nie mam na razie �adnych zmartwie�. 
    //AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_07"); //Jasne.
};