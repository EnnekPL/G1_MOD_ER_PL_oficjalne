
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
   description	= "Co u ciebie s³ychaæ?";
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
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_01"); //Co u ciebie s³ychaæ?
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_02"); //Ca³kiem dobrze. Niedawno zosta³em Nowicjuszem i mam czas, aby nawi¹zaæ nowe przyjaŸnie.
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_03"); //Cor Kalom powiedzia³, ¿e bêdzie mia³ dla mnie w przysz³oœci specjalne misje.
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_04"); //Brzmi ciekawie.
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_05"); //Prawda? Nie wiem jednak, czego siê spodziewaæ. 
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_06"); //Martwisz siê?
    AI_Output (self, other ,"DIA_Talas_HowAreYou_03_07"); //Nie, nie. Ze wszystkim sobie poradzê!
    AI_Output (other, self ,"DIA_Talas_HowAreYou_15_08"); //Oczywiœcie...
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
   description	= "Co mo¿esz mi powiedzieæ o tym Obozie?";
};

FUNC INT DIA_Talas_AboutCamp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Talas_AboutCamp_Info()
{
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_01"); //Co mo¿esz mi powiedzieæ o tym Obozie?
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_02"); //Najwa¿niejsi s¹ tu Guru. Oni g³osz¹ s³owo Œni¹cego i opiekuj¹ siê Nowicjuszami.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_03"); //Stra¿nicy Œwi¹tynni broni¹ Obozu. Ich przywódc¹ jest Cor Angar - najlepszy wojownik jakiego widzia³em w Kolonii.
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_04"); //A co mo¿esz mi powiedzieæ o innych Nowicjuszach, czy warto im ufaæ?
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_05"); //Nie wszystkim. Uwa¿aj na Nyrasa i Harloka.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_06"); //Nyras to cwany drañ, który uwa¿a siê za wybrañca i knuje przeciwko braciom.
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_07"); //Z kolei Harlok to obibok i leñ. S³ysza³em, ¿e wci¹¿ miga siê od pracy u Baal Oruna. 
    AI_Output (self, other ,"DIA_Talas_AboutCamp_03_08"); //Mo¿esz moim zdaniem zaufaæ Lesterowi i Fortuno - s¹ naprawdê w porz¹dku.
    AI_Output (other, self ,"DIA_Talas_AboutCamp_15_09"); //Dziêki za rady.
};



// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jesteœ Talas, ten którego obrabowano!"; 
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
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jesteœ Talas, ten którego obrabowano!
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Zostaw mnie w spokoju! Nie chcê o tym wiêcej mówiæ!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mogê ci pomóc w odzyskaniu tej ksiêgi."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Mogê ci pomóc w odzyskaniu tej ksiêgi.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Naprawdê? Zosta³em obrabowany przez gobliny! A teraz mam je odnaleŸæ i odzyskaæ ksiêgê! 
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mam pomys³: ja ci poka¿ê, gdzie jest almanach, a ty go odzyskasz!

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Zgoda.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"To ciê bêdzie kosztowa³o 30 bry³ek rudy.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Wejdê w to... za 50 bry³ek rudy.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Zgoda.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Œwietnie. Wyruszymy, gdy tylko bêdziesz gotów.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //To ciê bêdzie kosztowa³o 30 bry³ek rudy.

	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //W porz¹dku. Mo¿emy wyruszyæ, gdy tylko bêdziesz gotowy.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Wejdê w to... za 50 bry³ek rudy.
	
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co? To¿ to rozbój! A zreszt¹. Daj mi znaæ, gdy bêdziesz gotowy do drogi. 
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
	description		= "Jestem gotowy, mo¿emy ruszaæ w drogê."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jestem gotowy, mo¿emy ruszaæ w drogê.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobrze. ChodŸ za mn¹.
	
	B_LogEntry		(CH2_Book,	"Zaoferowa³em Talasowi pomoc w odzyskaniu manuskryptu. Ma mnie teraz zaprowadziæ do miejsca, w którym go straci³."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Te przeklête bestyjki mieszkaj¹ w jaskini, za tym mostem. Uwa¿aj na siebie!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Nie pójdziesz ze mn¹?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Zostanê tutaj i bêdê... ubezpiecza³ ty³y.

	B_LogEntry		(CH2_Book,	"Stoimy przed wejœciem do jaskini goblinów. Tchórzliwy Nowicjusz nalega, ¿ebym wszed³ tam sam.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Odzyska³eœ almanach! Dobra robota! Wracajmy czym prêdzej do Obozu!

	B_LogEntry		(CH2_Book,	"Odzyska³em almanach! Teraz razem z Talasem odniesiemy go do Obozu Bractwa.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
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
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //No to jesteœmy. Najlepiej zanieœ od razu ten almanach Cor Kalomowi.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Tylko uwa¿aj, ¿ebyœ nie umar³ z przepracowania.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Spokojna g³owa. Nic mi nie bêdzie. Nie musisz siê o mnie martwiæ. 

	B_LogEntry		(CH2_Book,	"Wróciliœmy na bagna. Talas to najwiêkszy tchórz, jakiego spotka³em. Sam zaniosê ksiêgê Cor Kalomowi!");

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
	description		= "Przysy³a mnie Cor Angar."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Przysy³a mnie Cor Angar. Masz mnie zabraæ na Cmentarzysko Orków, gdzie przebywa Baal Lukor i jego Stra¿nicy.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //A wiêc znów mam robiæ za przewodnika. Niech to szlag! Bodajbym nigdy nie ujrza³ tej ksiêgi na oczy!
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //No dobrze, chodŸ za mn¹.
	
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
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Nie pójdê z tob¹ na drug¹ stronê tego mostu. Nie jestem samobójc¹.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Oszala³eœ, ¿e chcesz tam wchodziæ?! Nawet Baal Lukor stamt¹d nie wróci³, a on mia³ ze sob¹ Œwi¹tynnych Stra¿ników!
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Co ma byæ to bêdzie. Wracaj do obozu. Ja siê tu trochê rozejrzê.

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
        AI_Output (self, other ,"DIA_Talas_PermDia_03_02"); //Uda³o mi siê odnaleŸæ almanach! Guru jeszcze nigdy nie byli ze mnie tak zadowoleni.
        AI_Output (other, self ,"DIA_Talas_PermDia_15_03"); //Tobie?!
        AI_Output (self, other ,"DIA_Talas_PermDia_03_04"); //Przecie¿ powiedzia³em, ¿e nam. Uda³o siê nam! Tak, tak.
        AI_Output (self, other ,"DIA_Talas_PermDia_03_05"); //A teraz daj mi odpocz¹æ.
        AI_Output (other, self ,"DIA_Talas_PermDia_15_06"); //Jasne. Przecie¿ pokona³eœ grupê groŸnych goblinów...
    }
    else
    {
        AI_Output (self, other ,"DIA_Talas_PermDia_03_07"); //Odpoczywam, daj mi spokój.
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
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_02"); //Fortuno zagin¹³ kilka nocy temu. Nikt nie jest w stanie wyjaœniæ co siê z nim sta³o. Po prostu rozp³yn¹³ siê w powietrzu.
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_03"); //Obj¹³em jego funkcje. Baal Orun poprosi³ mnie osobiœcie, bym rozpocz¹³ handel wytwarzanym przez Nowicjuszy zielem.
    AI_Output (self, other ,"DIA_Talas_FORTUNO_NK_03_04"); //Je¿eli chcesz coœ kupiæ, to wal do mnie œmia³o. Chêtnie te¿ skupiê zio³a i owoce.
Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,"Talas przej¹³ stragan Fortuno i mogê u niego kupiæ ziele. ");
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
   description	= "Jakim cudem Fortuno znikn¹³? Nie próbowaliœcie go szukaæ?";
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
    AI_Output (other, self ,"DIA_Talas_WHERE_FORTUNO_15_01"); //Jakim cudem Fortuno znikn¹³? Nie próbowaliœcie go szukaæ?
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_02"); //Próbowaliœmy. Cor Angar poprosi³ Gor Na Draka, aby poszuka³ go w okolicy. 
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_03"); //Niestety poszukiwania zakoñczy³y siê fiaskiem. 
    AI_Output (self, other ,"DIA_Talas_WHERE_FORTUNO_03_04"); //Obawiam siê, ¿e jego zaginiêcie mia³o coœ wspólnego z ostatnimi wydarzeniami w Kolonii. Zagin¹³ noc po tym, jak Gomez zamordowa³ Magów Ognia.
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
   description	= "Poka¿ mi swoje towary.";
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
    AI_Output (other, self ,"DIA_Talas_TRADE_15_01"); //Poka¿ mi swoje towary.
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
   description	= "Wiesz coœ na temat tego podejrzanego handlarza?";
};

FUNC INT DIA_Talas_ABOUT_STEH_Condition()
{
    if (MIS_StrangeResearcher == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_ABOUT_STEH_Info()
{
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_01"); //Wiesz coœ na temat tego podejrzanego handlarza?
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_02"); //Mistrzu, czy chodzi ci o tajemniczego cz³owieka handluj¹cego amuletami?
	AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_03"); //Tak, zdradŸ mi gdzie mogê go znaleŸæ.
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_04"); //Tak w³aœciwie to nie mam pojêcia. Jest nieuchwytny. 
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_05"); //W takim razie w jaki sposób handluje?!
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_06"); //S³ysza³em, ¿e nawet nie spotyka siê z kupcami. 
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_07"); //Ka¿dy, kto chce kupiæ jak¹œ b³yskotkê pojawia siê w okolicy ma³ego kamiennego podestu nieopodal chaty Nyrasa i mówi czego potrzebuje.
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_08"); //Nastêpnego dnia towar znajduje siê w tym samym miejscu.
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_09"); //A zap³ata?
    AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_10"); //Ludzie po prostu zostawiaj¹ rudê, najczêœciej w sakiewkach, a on j¹ póŸniej zabiera. Przypuszczam, ¿e czai siê, gdzieœ w okolicy i gdy Nowicjusz odejdzie, zabiera rudê.
    AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_11"); //Doœæ sprytne. Zada³ sobie sporo trudu. Mam jeszcze pytanie... Czy nikt nie próbowa³ go wykiwaæ?
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_12"); //Ale¿ sk¹d! Ludzie siê go boj¹. W koñcu posiada magiczne amulety! To wszystko jest cholernie zagmatwane. 
	AI_Output (other, self ,"DIA_Talas_ABOUT_STEH_15_13"); //Có¿, bêdê musia³ coœ u niego kupiæ...
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_14"); //Nie! Nie uda ci siê. Zapewne ju¿ wie, ¿e siê na niego czaisz. Kilka dni temu zaprzesta³ handlowaæ i nie odpowiada na proœby Nowicjuszy. 
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_15"); //Albo mu siê skoñczy³y b³yskotki, albo nas zwietrzy³. Mam nadziejê, ¿e nie trafi na moj¹ osobê.
	AI_Output (self, other ,"DIA_Talas_ABOUT_STEH_03_16"); //Jestem bardzo wa¿ny w Obozie...
	B_LogEntry               (CH3_StrangeResearcher,"Talas opowiedzia³ mi o tym jak przebiega tajemniczy proceder sprzeda¿y artefaktów. Wszystko odbywa siê bez kontaktu z podejrzanym handlarzem. Wiem tylko, ¿e zostawia on swoje towary na podeœcie za chat¹ Nyrasa i odbiera stamt¹d nale¿noœci. Pogadam z okolicznymi mieszkañcami i mo¿e uda mi siê coœ z nich wyci¹gn¹æ.");
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
   description	= "Masz jakieœ informacje o zabójstwie jakiego dokonano w okolicy?";
};

FUNC INT DIA_Talas_ABOUT_KILLER_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Talas_ABOUT_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Talas_ABOUT_KILLER_15_01"); //Masz jakieœ informacje o zabójstwie jakiego dokonano w okolicy?
    AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_02"); //Nie, dopiero co siê dowiedzia³em. Naprawdê makabryczna sprawa. 
	AI_Output (other, self ,"DIA_Talas_ABOUT_KILLER_15_03"); //Znasz jakiegoœ zabijakê z okolicy?
	AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_04"); //Rozmawia³am chwilê z Hakanem. Jeœli mia³bym wytypowaæ podejrzanego to powiedzia³bym, ¿e to Harlok. Ma blisko chatê i ponoæ trafi³ do Koloni za morderstwo.
	AI_Output (self, other ,"DIA_Talas_ABOUT_KILLER_03_05"); //Mo¿e przypomnia³y mu siê stare czasy i poczu³ chêæ przelania krwi? Lepiej sprawdŸ jego chatê. Byæ mo¿e znajdziesz tam dowód i bêdziesz móg³ go oskar¿yæ.
	B_LogEntry               (CH3_PsionicCSI,"Talas nie wie nic o zabójstwie, ale podejrzewa Harloka. Dowiedzia³em siê, ¿e rozmawia³ ostatnio na ten temat z Hakanem.");
};
