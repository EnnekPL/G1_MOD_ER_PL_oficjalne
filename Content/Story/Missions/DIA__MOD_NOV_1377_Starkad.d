//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patros_EXIT(C_INFO)
{
	npc         = NOV_1377_Starkad;
	nr          = 999;
	condition	= DIA_Patros_EXIT_Condition;
	information	= DIA_Patros_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Patros_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patros_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Patros_HELLO (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 1;
   condition    = DIA_Patros_HELLO_Condition;
   information  = DIA_Patros_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patros_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Patros_HELLO_03_01"); //Ej, nowy! Jestem Starkad. Handlujê ¿ywnoœci¹. U mnie wszystko po niskich cenach.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"Starkad z Obozu Bractwa handluje ¿ywnoœci¹. Znajdê go pod chat¹ Kaloma.");
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Patros_TRADE (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 2;
   condition    = DIA_Patros_TRADE_Condition;
   information  = DIA_Patros_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy.";
};

FUNC INT DIA_Patros_TRADE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patros_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patros_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Patros_TRADE_15_01"); //Pohandlujmy.
    AI_Output (self, other ,"DIA_Patros_TRADE_03_02"); //Zobacz tylko.
  //  B_GiveTradeInv (self);
};

var int prize_Starkad_loans;
//========================================
//-----------------> QUEST1_POMOC
//========================================

INSTANCE DIA_Patros_QUEST1_POMOC (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 3;
   condition    = DIA_Patros_QUEST1_POMOC_Condition;
   information  = DIA_Patros_QUEST1_POMOC_Info;
   permanent	= FALSE;
   description	= "Szukam pracy. Handlarze czêsto czegoœ potrzebuj¹.";
};

FUNC INT DIA_Patros_QUEST1_POMOC_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_QUEST1_POMOC_Info()
{
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_01"); //Szukam pracy. Handlarze czêsto czegoœ potrzebuj¹.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_02"); //Mam pewne zlecenie dla kogoœ takiego jak ty. Podejmiesz siê?
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_03"); //Chcê poznaæ szczegó³y.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_04"); //Ostatnio kilka osób zalega mi z zap³at¹. Chcê, abyœ œci¹gn¹³ d³ugi. Nic trudnego. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_05"); //D³ugi maj¹: Joru, Darrion i Gor Na Idon. Tutaj masz listê z informacj¹ ile kto jest d³u¿ny.
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_06"); //Porozmawiajmy o zap³acie.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_07"); //Ile chcesz?
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
    Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "25 bry³ek rudy.", DIA_Patros_QUEST1_POMOC_25);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "50 bry³ek rudy.", DIA_Patros_QUEST1_POMOC_50);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "100 bry³ek rudy.", DIA_Patros_QUEST1_POMOC_100);

};

func void RunQuest_OszukanyHandlarz ()
{
    MIS_OszukanyHandlarz = LOG_RUNNING;
	CreateInvItems (self, ItCH1_ListaDlugowPatrosa, 1);
    B_GiveInvItems (self, other, ItCH1_ListaDlugowPatrosa, 1);
    Log_CreateTopic          (CH1_OszukanyHandlarz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OszukanyHandlarz, LOG_RUNNING);
    B_LogEntry               (CH1_OszukanyHandlarz,"Starkad kaza³ mi zebraæ rudê od zalegaj¹cych mu j¹ mieszkañców obozu: Gor Na Idona, Joru i Darriona.");
};

func void DIA_Patros_QUEST1_POMOC_25 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC25_15_01"); //25 bry³ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC25_03_02"); //Co? Za zebranie d³ugów?! A zreszt¹... niech bêdzie.
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 25;
};

func void DIA_Patros_QUEST1_POMOC_50 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_01"); //50 bry³ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_02"); //Przecie¿ to rozbój!
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_03"); //Wiem, ¿e handlarze maj¹ przy sobie wiêksze sumy... Nikt inny tego dla ciebie nie zrobi.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_04"); //No dobra. Tylko siê poœpiesz!
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 50;
};

func void DIA_Patros_QUEST1_POMOC_100 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC100_15_01"); //100 bry³ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC100_03_02"); //Szkoda na ciebie czasu!
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> QUEST1_OK
//========================================

INSTANCE DIA_Patros_QUEST1_OK (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 4;
   condition    = DIA_Patros_QUEST1_OK_Condition;
   information  = DIA_Patros_QUEST1_OK_Info;
   permanent	= FALSE;
   description	= "Mam twoje dobra.";
};

FUNC INT DIA_Patros_QUEST1_OK_Condition()
{
    if (MIS_OszukanyHandlarz == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=250)
	&& (Npc_KnowsInfo (hero, DIA_GorNaToth_IdonDebt))
	&& (Npc_KnowsInfo (hero, DIA_Joru_ORE))
	&& (Npc_KnowsInfo (hero, DIA_Darrion_ORE))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Patros_QUEST1_OK_Info()
{
    AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_01"); //Mam rudê, któr¹ zalegali mieszkañcy Obozu. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_02"); //Nawet t¹ od Gor Na Idona?
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_03"); //Tak, nawet j¹.
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_04"); //Œwietna robota.
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_05"); //Nie tak prêdko! Dawaj nagrodê. Umawialiœmy siê przecie¿.
	AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_06"); //Ach tak. Proszê.
    B_LogEntry               (CH1_OszukanyHandlarz,"Odda³em rudê Starkadowi, a w zamian otrzyma³em tyle bry³ek, ile wczeœniej wynegocjowa³em.");
    Log_SetTopicStatus       (CH1_OszukanyHandlarz, LOG_SUCCESS);
    MIS_OszukanyHandlarz = LOG_SUCCESS;
	
	CreateInvItems (self, itminugget, prize_Starkad_loans);
    B_GiveInvItems (self, other, itminugget, prize_Starkad_loans);
	
	B_GiveInvItems (other, self, itminugget, 250);
	B_GiveXP (200);
};

//========================================
//-----------------> Dostawa
//========================================

INSTANCE DIA_Patros_Dostawa (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 3;
   condition    = DIA_Patros_Dostawa_Condition;
   information  = DIA_Patros_Dostawa_Info;
   permanent	= FALSE;
   description	= "Mam dostawê od Emanuela.";
};

FUNC INT DIA_Patros_Dostawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Emanuel_REPUTACJA))
    && (Npc_HasItems (other, ItFoMutton) >=30)
    && (Npc_HasItems (other, ItFoSoup) >=5)
   // && (Npc_HasItems (other, ItFoCrawlersoup) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patros_Dostawa_Info()
{
    AI_Output (other, self ,"DIA_Patros_Dostawa_15_01"); //Mam dostawê od Emanuela.
    AI_Output (self, other ,"DIA_Patros_Dostawa_15_02"); //Dlaczego nie przyszed³ sam? Mia³ siê spotkaæ z Shine. To on ma rudê.
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_03"); //Emanuel nie mia³ czasu i przys³a³ mnie. Shine nie ¿yje. Napad³o go kilku Nowicjuszy, którzy widocznie wiedzieli o transakcji. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_04"); //Cholera, nastêpnym razem muszê byæ ostro¿niejszy. A co z rud¹? Pewnie mam ci zap³aciæ. Bêdzie z tym problem...
	if Npc_HasItems (other, rudaemanuela) || Npc_KnowsInfo (hero, DIA_Emanuel_RUDAOK)
	{
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_05"); //Nie trzeba. Zabi³em tych zdrajców i znalaz³em to czego szuka³em. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_06"); //Doskonale. A wiêc jedyn¹ strat¹ jak¹ ponieœliœmy jest Shine...
	}
	else
	{
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_07"); //Spróbujê jej jeszcze poszukaæ.  
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_08"); //Przeszukaj dok³adnie okolice miejsca transakcji. Przecie¿ ci Nowicjusze nie zapadli siê pod ziemiê, a do Obozu wróciæ siê nie odwa¿¹. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_09"); //Ju¿ ja bym przetrzepa³ tych sukinsynów!
	};
	
	B_GiveInvItems (other, self, ItFoMutton, 30);
	B_GiveInvItems (other, self, ItFoSoup, 5);
    B_LogEntry                     (CH1_HandelEmanuela,"Zanios³em towary Starkadowi i powiedzia³em mu o tym co siê wydarzy³o.");

    B_GiveXP (150);
};

//========================================
//-----------------> LifeIDsa
//========================================

INSTANCE DIA_Patros_LifeIDsa (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 1;
   condition    = DIA_Patros_LifeIDsa_Condition;
   information  = DIA_Patros_LifeIDsa_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patros_LifeIDsa_Condition()
{
    if (listLearn == true)
    && (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patros_LifeIDsa_Info()
{
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_01"); //Ca³e szczêœcie, ¿e ciê widzê.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_02"); //Byli u ciebie Poszukiwacze?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_03"); //A wiêc tak nazywaj¹ siê te istoty.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_04"); //Zjawili siê noc¹. Chcieli bym stan¹³ po ich stronie, ale odmówi³em.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_05"); //Wiêc jakim cudem ¿yjesz?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_06"); //Nie mam pojêcia. Ucieka³em przed tymi postaciami, a¿ nagle przesta³y mnie œcigaæ.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_07"); //Mo¿liwe, ¿e coœ je przestraszy³o.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_08"); //Lub ktoœ... W którym miejscu to siê sta³o?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_09"); //Skoñczyli mnie œcigaæ na pomostach w centrum Obozu.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_10"); //Mo¿liwe, ¿e to ktoœ z góry.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_11"); //Wiesz, gdzie mo¿e siê znajdowaæ Czarny Mag?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_12"); //Jaki Czarny Mag? 
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_13"); //Czarny Mag stoi za pojawieniem siê Poszukiwaczy w Kolonii.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_14"); //W takim razie nie mam pojêcia, gdzie móg³by egzystowaæ.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_15"); //Mo¿liwe, ¿e wskazówki przy cia³ach doprowadz¹ mnie do jego kryjówki.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_16"); //Opowiedz mi o tym.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_17"); //Teraz nie mam czasu. Mo¿e póŸniej.
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_WlakaZczarym,"Patros jest ostatnim ¿yj¹cym z listy. Poszukiwacze porzucili za nim poœcig. Wypada³oby ustaliæ dlaczego.");
	Wld_InsertNpc				(NON_3072_Jefrey,"PSI_START");
    B_GiveXP (300);
};

// poprawione b³êdy - 30 paŸdziernik 2012
//========================================
//-----------------> PLOTY
//========================================

INSTANCE DIA_Patros_PLOTY (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 1;
   condition    = DIA_Patros_PLOTY_Condition;
   information  = DIA_Patros_PLOTY_Info;
   permanent	= FALSE;
   description	= "Masz mo¿e jakieœ plotki?";
};

FUNC INT DIA_Patros_PLOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_PLOTY_Info()
{
    AI_Output (other, self ,"DIA_Patros_PLOTY_15_01"); //Masz mo¿e jakieœ plotki?
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_02"); //Ludzie mówi¹, ¿e jeden z Nowicjuszy rozpocz¹³ badania na w³asn¹ rêkê.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_03"); //Podobno przesiaduje w pobli¿u ma³ej palisady przy placu Baal Tondrala.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_04"); //Je¿eli Shawn siê o tym dowie, zacznie go szukaæ.
};


