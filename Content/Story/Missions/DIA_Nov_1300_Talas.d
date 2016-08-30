
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Talas_HowAreYou (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 1;
   condition    = DIA_Talas_HowAreYou_Condition;
   information  = DIA_Talas_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Co u ciebie s�ycha�?";
};

FUNC INT DIA_Talas_HowAreYou_Condition()
{
    if (!Npc_KnowsInfo (hero, Nov_1300_Talas_HELP))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_01"); //Co u ciebie s�ycha�?
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_02"); //Ca�kiem dobrze. Niedawno zosta�em Nowicjuszem i mam czas, aby nawi�za� nowe przyja�nie.
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_03"); //Cor Kalom powiedzia�, �e b�dzie mia� dla mnie w przysz�o�ci specjalne misje.
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_04"); //Brzmi ciekawie.
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_05"); //Prawda? Nie wiem jednak, czego si� spodziewa�. 
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_06"); //Martwisz si�?
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_07"); //Nie, nie. Ze wszystkim sobie poradz�!
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_08"); //Oczywi�cie...
};

//========================================
//-----------------> AboutCamp
//========================================

INSTANCE DIA_Talas_AboutCamp (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 2;
   condition    = DIA_Talas_AboutCamp_Condition;
   information  = DIA_Talas_AboutCamp_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o tym Obozie?";
};

FUNC INT DIA_Talas_AboutCamp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Talas_AboutCamp_Info()
{
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_01"); //Co mo�esz mi powiedzie� o tym Obozie?
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_02"); //Najwa�niejsi s� tu Guru. Oni g�osz� s�owo �ni�cego i opiekuj� si� Nowicjuszami.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_03"); //Stra�nicy �wi�tynni broni� Obozu. Ich przyw�dc� jest Cor Angar - najlepszy wojownik jakiego widzia�em w Kolonii.
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_04"); //A co mo�esz mi powiedzie� o innych Nowicjuszach, czy warto im ufa�?
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_05"); //Nie wszystkim. Uwa�aj na Nyrasa i Harloka.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_06"); //Nyras to cwany dra�, kt�ry uwa�a si� za wybra�ca i knuje przeciwko braciom.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_07"); //Z kolei Harlok to obibok i le�. S�ysza�em, �e wci�� miga si� od pracy u Baal Oruna. 
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_08"); //Mo�esz moim zdaniem zaufa� Lesterowi i Fortuno - s� naprawd� w porz�dku.
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_09"); //Dzi�ki za rady.
};



// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jeste� Talas, ten kt�rego obrabowano!"; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jeste� Talas, ten kt�rego obrabowano!
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Zostaw mnie w spokoju! Nie chc� o tym wi�cej m�wi�!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mog� ci pom�c w odzyskaniu tej ksi�gi."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Mog� ci pom�c w odzyskaniu tej ksi�gi.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Naprawd�? Zosta�em obrabowany przez gobliny! A teraz mam je odnale�� i odzyska� ksi�g�! 
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mam pomys�: ja ci poka��, gdzie jest almanach, a ty go odzyskasz!

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Zgoda.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"To ci� b�dzie kosztowa�o 30 bry�ek rudy.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Wejd� w to... za 50 bry�ek rudy.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Zgoda.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //�wietnie. Wyruszymy, gdy tylko b�dziesz got�w.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //To ci� b�dzie kosztowa�o 30 bry�ek rudy.

	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //W porz�dku. Mo�emy wyruszy�, gdy tylko b�dziesz gotowy.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Wejd� w to... za 50 bry�ek rudy.
	
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co? To� to rozb�j! A zreszt�. Daj mi zna�, gdy b�dziesz gotowy do drogi. 
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};


// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem gotowy, mo�emy rusza� w drog�."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jestem gotowy, mo�emy rusza� w drog�.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobrze. Chod� za mn�.
	
	B_LogEntry		(CH2_Book,	"Zaoferowa�em Talasowi pomoc w odzyskaniu manuskryptu. Ma mnie teraz zaprowadzi� do miejsca, w kt�rym go straci�."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BR�CKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Te przekl�te bestyjki mieszkaj� w jaskini, za tym mostem. Uwa�aj na siebie!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Nie p�jdziesz ze mn�?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Zostan� tutaj i b�d�... ubezpiecza� ty�y.

	B_LogEntry		(CH2_Book,	"Stoimy przed wej�ciem do jaskini goblin�w. Tch�rzliwy Nowicjusz nalega, �ebym wszed� tam sam.");
};

// ***************************** ZUR�CK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Odzyska�e� almanach! Dobra robota! Wracajmy czym pr�dzej do Obozu!

	B_LogEntry		(CH2_Book,	"Odzyska�em almanach! Teraz razem z Talasem odniesiemy go do Obozu Bractwa.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zur�ck im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //No to jeste�my. Najlepiej zanie� od razu ten almanach Cor Kalomowi.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Tylko uwa�aj, �eby� nie umar� z przepracowania.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Spokojna g�owa. Nic mi nie b�dzie. Nie musisz si� o mnie martwi�. 

	B_LogEntry		(CH2_Book,	"Wr�cili�my na bagna. Talas to najwi�kszy tch�rz, jakiego spotka�em. Sam zanios� ksi�g� Cor Kalomowi!");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przysy�a mnie Cor Angar."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Przysy�a mnie Cor Angar. Masz mnie zabra� na Cmentarzysko Ork�w, gdzie przebywa Baal Lukor i jego Stra�nicy.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //A wi�c zn�w mam robi� za przewodnika. Niech to szlag! Bodajbym nigdy nie ujrza� tej ksi�gi na oczy!
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //No dobrze, chod� za mn�.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Nie p�jd� z tob� na drug� stron� tego mostu. Nie jestem samob�jc�.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Oszala�e�, �e chcesz tam wchodzi�?! Nawet Baal Lukor stamt�d nie wr�ci�, a on mia� ze sob� �wi�tynnych Stra�nik�w!
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Co ma by� to b�dzie. Wracaj do obozu. Ja si� tu troch� rozejrz�.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

//========================================
//-----------------> PermDia
//========================================

INSTANCE DIA_Talas_PermDia (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 3;
   condition    = DIA_Talas_PermDia_Condition;
   information  = DIA_Talas_PermDia_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Talas_PermDia_Condition()
{
if (kapitel < 4)
{
    return TRUE; };
};

FUNC VOID DIA_Talas_PermDia_Info()
{
    AI_Output (other, self ,"DIA_Talas_PermDia_15_01"); //Jak leci?
    if (Npc_KnowsInfo (hero, Nov_1300_Talas_BACK))
    {
        AI_Output (self, other ,"DIA_Talas_PermDia_03_02"); //Uda�o mi si� odnale�� almanach! Guru jeszcze nigdy nie byli ze mnie tak zadowoleni.
        AI_Output (other, self ,"DIA_Talas_PermDia_15_03"); //Tobie?!
        AI_Output (self, other ,"DIA_Talas_PermDia_03_04"); //Przecie� powiedzia�em, �e nam. Uda�o si� nam! Tak, tak.
        AI_Output (self, other ,"DIA_Talas_PermDia_03_05"); //A teraz daj mi odpocz��.
        AI_Output (other, self ,"DIA_Talas_PermDia_15_06"); //Jasne. Przecie� pokona�e� grup� gro�nych goblin�w...
    }
    else
    {
        AI_Output (self, other ,"DIA_Talas_PermDia_03_07"); //Odpoczywam, daj mi spok�j.
    };
};



/*************************** NOC KRUKA **************************/
//========================================
//-----------------> FORTUNO_NK
//========================================

INSTANCE DIA_Talas_FORTUNO_NK (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 1;
   condition    = DIA_Talas_FORTUNO_NK_Condition;
   information  = DIA_Talas_FORTUNO_NK_Info;
   permanent	= FALSE;
   description	= "Co tu robisz? Gdzie jest Fortuno?";
};

FUNC INT DIA_Talas_FORTUNO_NK_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_FORTUNO_NK_Info()
{
    AI_Output (other, self ,"DIA_Talas_FORTUNO_NK_15_01"); //Co tu robisz? Gdzie jest Fortuno?
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_02"); //Fortuno zagin�� kilka nocy temu. Nikt nie jest w stanie wyja�ni� co si� z nim sta�o. Po prostu rozp�yn�� si� w powietrzu.
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_03"); //Obj��em jego funkcje. Baal Orun poprosi� mnie osobi�cie, bym rozpocz�� handel wytwarzanym przez Nowicjuszy zielem.
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_04"); //Je�eli chcesz co� kupi�, to wal do mnie �mia�o. Ch�tnie te� skupi� zio�a i owoce.
Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,"Talas przej�� stragan Fortuno i mog� u niego kupi� ziele. ");
};

//========================================
//-----------------> WHERE_FORTUNO
//========================================

INSTANCE DIA_Talas_WHERE_FORTUNO (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 2;
   condition    = DIA_Talas_WHERE_FORTUNO_Condition;
   information  = DIA_Talas_WHERE_FORTUNO_Info;
   permanent	= FALSE;
   description	= "Jakim cudem Fortuno znikn��? Nie pr�bowali�cie go szuka�?";
};

FUNC INT DIA_Talas_WHERE_FORTUNO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Talas_FORTUNO_NK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_WHERE_FORTUNO_Info()
{
    AI_Output (other, self ,"DIA_Talas_WHERE_FORTUNO_15_01"); //Jakim cudem Fortuno znikn��? Nie pr�bowali�cie go szuka�?
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_02"); //Pr�bowali�my. Cor Angar poprosi� Gor Na Draka, aby poszuka� go w okolicy. 
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_03"); //Niestety poszukiwania zako�czy�y si� fiaskiem. 
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_04"); //Obawiam si�, �e jego zagini�cie mia�o co� wsp�lnego z ostatnimi wydarzeniami w Kolonii. Zagin�� noc po tym, jak Gomez zamordowa� Mag�w Ognia.
    AI_Output (other, self ,"DIA_Talas_WHERE_FORTUNO_15_05"); //Rozumiem. 
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Talas_TRADE (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 3;
   condition    = DIA_Talas_TRADE_Condition;
   information  = DIA_Talas_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� mi swoje towary.";
};

FUNC INT DIA_Talas_TRADE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Talas_FORTUNO_NK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Talas_TRADE_15_01"); //Poka� mi swoje towary.
    AI_Output (self, other ,"DIA_Talas_TRADE_03_02"); //Zapraszam!
};

/////////////////////////////////////////////////
// QUESTY GURU - ZAPYTANIA
/////////////////////////////////////////////////

//========================================
//-----------------> ABOUT_STEH
//========================================

INSTANCE DIA_Talas_ABOUT_STEH (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 1;
   condition    = DIA_Talas_ABOUT_STEH_Condition;
   information  = DIA_Talas_ABOUT_STEH_Info;
   permanent	= FALSE;
   description	= "Wiesz co� na temat tego podejrzanego handlarza?";
};

FUNC INT DIA_Talas_ABOUT_STEH_Condition()
{
    if (MIS_HandlarzSteh == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_ABOUT_STEH_Info()
{
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_01"); //Wiesz co� na temat tego podejrzanego handlarza?
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_02"); //Mistrzu, czy chodzi ci o tajemniczego cz�owieka handluj�cego amuletami?
	AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_03"); //Tak, zdrad� mi gdzie mog� go znale��.
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_04"); //Tak w�a�ciwie to nie mam poj�cia. Jest nieuchwytny. 
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_05"); //W takim razie w jaki spos�b handluje?!
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_06"); //S�ysza�em, �e nawet nie spotyka si� z kupcami. 
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_07"); //Ka�dy, kto chce kupi� jak�� b�yskotk� pojawia si� w okolicy ma�ego kamiennego podestu nieopodal chaty Nyrasa i m�wi czego potrzebuje.
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_08"); //Nast�pnego dnia towar znajduje si� w tym samym miejscu.
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_09"); //A zap�ata?
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_10"); //Ludzie po prostu zostawiaj� rud�, najcz�ciej w sakiewkach, a on j� p�niej zabiera. Przypuszczam, �e czai si�, gdzie� w okolicy i gdy Nowicjusz odejdzie, zabiera rud�.
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_11"); //Do�� sprytne. Zada� sobie sporo trudu. Mam jeszcze pytanie... Czy nikt nie pr�bowa� go wykiwa�?
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_12"); //Ale� sk�d! Ludzie si� go boj�. W ko�cu posiada magiczne amulety! To wszystko jest cholernie zagmatwane. 
	AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_13"); //C�, b�d� musia� co� u niego kupi�...
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_14"); //Nie! Nie uda ci si�. Zapewne ju� wie, �e si� na niego czaisz. Kilka dni temu zaprzesta� handlowa� i nie odpowiada na pro�by Nowicjuszy. 
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_15"); //Albo mu si� sko�czy�y b�yskotki, albo nas zwietrzy�. Mam nadziej�, �e nie trafi na moj� osob�.
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_16"); //Jestem bardzo wa�ny w Obozie...
	B_LogEntry               (CH1_HandlarzSteh,"Talas opowiedzia� mi o tym jak przebiega tajemniczy proceder sprzeda�y artefakt�w. Wszystko odbywa si� bez kontaktu z podejrzanym handlarzem. Wiem tylko, �e zostawia on swoje towary na pode�cie za chat� Nyrasa i odbiera stamt�d nale�no�ci. Pogadam z okolicznymi mieszka�cami i mo�e uda mi si� co� z nich wyci�gn��.");
};

//========================================
//-----------------> ABOUT_KILLER
//========================================

INSTANCE DIA_Talas_ABOUT_KILLER (C_INFO)
{
   npc          = Nov_1300_Talas;
   nr           = 1;
   condition    = DIA_Talas_ABOUT_KILLER_Condition;
   information  = DIA_Talas_ABOUT_KILLER_Info;
   permanent	= FALSE;
   description	= "Masz jakie� informacje o zab�jstwie jakiego dokonano w okolicy?";
};

FUNC INT DIA_Talas_ABOUT_KILLER_Condition()
{
    if (MIS_SeryjneZabojstwa == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_ABOUT_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Talas_ABOUT_KILLER_15_01"); //Masz jakie� informacje o zab�jstwie jakiego dokonano w okolicy?
    AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_02"); //Nie, dopiero co si� dowiedzia�em. Naprawd� makabryczna sprawa. 
	AI_Output (other, self ,"DIA_Talas_ABOUT_KILLER_15_03"); //Znasz jakiego� zabijak� z okolicy?
	AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_04"); //Rozmawia�am chwil� z Basirem. Je�li mia�bym wytypowa� podejrzanego to powiedzia�bym, �e to Harlok. Ma blisko chat� i pono� trafi� do Koloni za morderstwo.
	AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_05"); //Mo�e przypomnia�y mu si� stare czasy i poczu� ch�� przelania krwi? Lepiej sprawd� jego chat�. By� mo�e znajdziesz tam dow�d i b�dziesz m�g� go oskar�y�.
	B_LogEntry               (CH1_SeryjneZabojstwa,"Talas nie wie nic o zab�jstwie, ale podejrzewa Harloka. Dowiedzia�em si�, �e rozmawia� ostatnio na ten temat z Basirem.");
};
