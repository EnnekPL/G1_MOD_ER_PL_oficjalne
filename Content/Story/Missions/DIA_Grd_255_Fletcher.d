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
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Wiesz dobrze, do kogo mówiê, synku!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Coœ ci powiem: to mój rejon i nie chcê tutaj ¿adnych k³opotów!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Ale nowi, tacy jak ty, zawsze sprawiaj¹ k³opoty. Zw³aszcza, kiedy buszuj¹ tutaj w nocy.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Lepiej bêdzie, jeœli pójdziesz sobie ju¿ do domu i nie poka¿esz siê tutaj zbyt prêdko. Przy arenie jest jedna pusta chata, ma daszek nad wejœciem. IdŸ spaæ!
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Ale jeœli z³apiê ciê na grzebaniu w cudzych chatach, osobiœcie postaram siê, ¿ebyœ ju¿ nigdy wiêcej tego nie zrobi³!
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
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Jeœli chcesz siê pozbyæ swoich pieniêdzy za ochronê, wybra³eœ z³y dzieñ.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? A dlaczego?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Bo mnie tu nie ma.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Rozumiem." 	,DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"To jakim cudem z tob¹ rozmawiam?"	,DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Czy¿by? A gdzie jesteœ?"	,DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Czy¿by? A gdzie jesteœ?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //W tej chwili siedzê w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //To jakim cudem z tob¹ rozmawiam?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek gdzieœ znikn¹³. Zwykle to on patroluje ten rejon.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dopóki nie raczy siê tutaj zjawiæ, Thorus kaza³ MI mieæ oko na wszystko.
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
	description		= "Wiesz, gdzie siê podziewa Nek?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Wiesz, gdzie siê podziewa Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Nie, i raczej siê tego nie dowiem.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Jeœli komuœ coœ o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj¹ ze Stra¿nikami.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //A zw³aszcza ze mn¹, bo wiedz¹, ¿e brzydzê siê ich robot¹. Za³o¿ê siê, ¿e podœmiewaj¹ siê ze mnie za moimi plecami.
	
	if (Sly_LostNek != LOG_SUCCESS)
	{
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,	"Mo¿e Kopacze mieszkaj¹cy w pobli¿u areny wiedz¹ gdzie siê podzia³ Nek.");
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
	description		= "Ale dlaczego nie zbierasz pieniêdzy za ochronê?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Ale dlaczego nie zbierasz pieniêdzy za ochronê?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek zebra³ ju¿, co by³o do zebrania. Wiêcej z nich nie wycisnê.
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
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Chyba go znalaz³em.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Co? Gdzie on jest?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //W innym, lepszym œwiecie...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //O cholera! To znaczy, ¿e bêdê tutaj tkwi³ do koñca ¿ycia. Mia³em nadziejê, ¿e ten bêcwa³ jednak wróci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Teraz mam k³opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //¯adnych wieœci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Informuj mnie na bie¿¹co.
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
	description		= "Snaf twierdzi, ¿e Nek ¿yje.";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_00"); //Snaf twierdzi, ¿e Nek ¿yje.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_01"); //O czym ty znowu gadasz? Dopiero co mówi³eœ, ¿e gryzie piach! 
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_02"); //Pewne okolicznoœci uleg³y zmianom. Byæ mo¿e trup le¿¹cy w jaskini za Obozem nie jest tym Stra¿nikiem, o którego nam chodzi. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_03"); //To co ty tu jeszcze robisz? Szukaj tego imbecyla!
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_04"); //Liczy³em, ¿e dasz mi jakieœ wskazówki.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_05"); //Jakie wskazówki do cholery? Przecie¿ wiesz co wszyscy mówi¹. Nek, o ile ¿yje, jest w Nowym Obozie. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_06"); //Musisz wejœæ w to gówno i zacz¹æ w nim grzebaæ dopóki go nie znajdziesz. Kapujesz? Na tym to polega. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_07"); //Jak ju¿ znajdziesz tego dezertera, to urwij mu ³eb. Dos³ownie, bez ogródek. Taki œmieæ na nic siê nam nie przyda. 
	
	B_LogEntry               (CH1_WheresNek,"Fletcher bez zbêdnych opóŸnieñ kaza³ mi przeczesaæ Nowy Obóz w poszukiwaniu Neka. Gdy go znajdê, ma zgin¹æ.");	
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
	description		= "Zabi³em Neka.";
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
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_00"); //Zabi³em Neka.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_01"); //Jedno pytanie, by³ w Nowym Obozie?
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_02"); //Tak.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_03"); //Dosta³ to na co zas³u¿y³, zdradziecki sukinsyn. 
	
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Dostanê coœ?", DIA_Fletcher_KillNek_MONEY);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Do zobaczenia.", DIA_Fletcher_KillNek_ENDE);

	B_GiveXP (50);
};

func void DIA_Fletcher_KillNek_MONEY ()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_00"); //Dostanê coœ?
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_01"); //Przecie¿ ciê ju¿ pochwali³em... Nie mam teraz rudy. Mówi³em ci chyba o moich d³ugach u Scatty'ego.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_02"); //Czyli pozby³em siê go na marne? 
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_03"); //A czy ktoœ ci mówi³, ¿e coœ dostaniesz? Zrobi³eœ to z czystej idei: œmieræ za zdradê. Œwiadomoœæ tego niech bêdzie twoj¹ nagrod¹.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_04"); //Niezwykle pocieszaj¹ce...
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
	description		= "Znalaz³em Neka, ale wci¹¿ ¿yje.";
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
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_00"); //Znalaz³em Neka, ale wci¹¿ ¿yje.
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_01"); //Jak to? 
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_02"); //Jest w Nowym Obozie. Zap³aci³ mi za to, ¿ebym zostawi³ go w spokoju, ale pomyœla³em, ¿e zainteresuje ciê jego obecna kryjówka... 
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_03"); //Ty durniu! Mia³eœ go ZABIÆ, a nie mówiæ mi gdzie jest. Dwulicowa szuja. Spadaj st¹d. 
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
	description		= "Neka zabi³o stado wilków.";
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
	AI_Output (other, self,"DIA_Fletcher_FoundNek_2_15_00"); //Neka zabi³o stado wilków.
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
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jestem winien Scatty'emu nie lada sumkê. Kiedy dowie siê, ¿e przej¹³em dzia³kê Neka, bêdzie mnie nachodzi³ codziennie...
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
   description	= "Mo¿e mogê ci jakoœ pomóc?";
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
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_01"); //Mo¿e mogê ci jakoœ pomóc?
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_02"); //To zale¿y.
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_03"); //Dasz radê znaleŸæ kogoœ na moje miejsce?
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_04"); //Popytaæ nie zaszkodzi.
	AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_05"); //W sumie to mo¿e móg³bym siê z kimœ zamieniæ albo coœ w tym stylu.
    
	MIS_FletchersReplacement = LOG_RUNNING;

    Log_CreateTopic          (CH1_FletchersReplacement, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FletchersReplacement, LOG_RUNNING);
    B_LogEntry               (CH1_FletchersReplacement,"Fletcher poprosi³ mnie, abym poszuka³ dla niego zastêpstwa.");
        
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
   description	= "Przyprowadzi³em Tripa.";
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
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_01"); //Przyprowadzi³em Tripa.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_02"); //Coœ nie w humorze ten twój kolega, ale niech bêdzie.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_03"); //Przez kilka tygodni przesiadywa³ w karczmie i udawa³, ¿e pracuje.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_04"); //Do tego zbiera³ wyp³atê.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_05"); //He he. Sprytny jest. Mój cz³owiek.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_06"); //Myœlê, ¿e sobie tutaj poradzi.
	
    B_LogEntry               (CH1_FletchersReplacement,"Przyprowadzi³em Tripa do Fletchera. Fletcher mo¿e ju¿ spokojnie iœæ do zamku.");
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Widzê, ¿e szybko nauczy³eœ siê dbaæ o swoje interesy. Witamy w stra¿y!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomyœleæ, ¿e uwa¿aliœmy ciê za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog¹ ci nawet znajomoœci wœród Cieni!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //O czym ty do diab³a mówisz, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz siê z tymi bandziorami z Nowego Obozu! A mo¿e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myœla³eœ, ¿e siê nie domyœlimy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada³eœ zmys³y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale¿ sk¹d. Za to TY za chwilê stracisz G£OWÊ, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GIÑ, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa³ siê przy tylnej bramie. Na mój widok zareagowa³ podobnie jak Fletcher. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, który strze¿e teraz g³ównej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No proszê. To goœæ z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To goœæ z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jakiœ problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mieæ, to ja bêdê wasz¹ ma³¹ kopalniê!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy¿by? Chyba œnisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k³opotów.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by³o o tym pomyœleæ zanim tutaj przyszed³eœ!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch³opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e Obozu.");
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
   description	= "Jak leci, Stra¿niku?";
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
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_01"); //Jak leci, Stra¿niku?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_02"); //Ju¿ nie jestem Stra¿nikiem. Teraz nale¿ê do stra¿y Kruka.
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_03"); //Zamierzamy rozpocz¹æ nowe ¿ycie z dala od Starego Obozu.
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_04"); //A jak tam twój d³ug u Scatty'ego?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_05"); //Uda³o mi siê wynegocjowaæ ugodê. Pomog³em Scatty'emu zdobyæ kilka cennych b³yskotek, gdy uciekaliœmy z Obozu.
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_06"); //To by³o ca³kiem op³acalne. Nie mam na razie ¿adnych zmartwieñ. 
    //AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_07"); //Jasne.
};