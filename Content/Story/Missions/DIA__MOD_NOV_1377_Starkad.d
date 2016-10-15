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
    AI_Output (self, other ,"DIA_Patros_HELLO_03_01"); //Ej, nowy! Jestem Starkad. Handluj� �ywno�ci�. U mnie wszystko po niskich cenach.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"Starkad z Obozu Bractwa handluje �ywno�ci�. Znajd� go pod chat� Kaloma.");
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
   description	= "Szukam pracy. Handlarze cz�sto czego� potrzebuj�.";
};

FUNC INT DIA_Patros_QUEST1_POMOC_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_QUEST1_POMOC_Info()
{
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_01"); //Szukam pracy. Handlarze cz�sto czego� potrzebuj�.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_02"); //Mam pewne zlecenie dla kogo� takiego jak ty. Podejmiesz si�?
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_03"); //Chc� pozna� szczeg�y.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_04"); //Ostatnio kilka os�b zalega mi z zap�at�. Chc�, aby� �ci�gn�� d�ugi. Nic trudnego. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_05"); //D�ugi maj�: Joru, Darrion i Gor Na Idon. Tutaj masz list� z informacj� ile kto jest d�u�ny.
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_06"); //Porozmawiajmy o zap�acie.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_07"); //Ile chcesz?
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
    Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "25 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_25);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "50 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_50);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "100 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_100);

};

func void RunQuest_OszukanyHandlarz ()
{
    MIS_OszukanyHandlarz = LOG_RUNNING;
	CreateInvItems (self, ItCH1_ListaDlugowPatrosa, 1);
    B_GiveInvItems (self, other, ItCH1_ListaDlugowPatrosa, 1);
    Log_CreateTopic          (CH1_OszukanyHandlarz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OszukanyHandlarz, LOG_RUNNING);
    B_LogEntry               (CH1_OszukanyHandlarz,"Starkad kaza� mi zebra� rud� od zalegaj�cych mu j� mieszka�c�w obozu: Gor Na Idona, Joru i Darriona.");
};

func void DIA_Patros_QUEST1_POMOC_25 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC25_15_01"); //25 bry�ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC25_03_02"); //Co? Za zebranie d�ug�w?! A zreszt�... niech b�dzie.
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 25;
};

func void DIA_Patros_QUEST1_POMOC_50 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_01"); //50 bry�ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_02"); //Przecie� to rozb�j!
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_03"); //Wiem, �e handlarze maj� przy sobie wi�ksze sumy... Nikt inny tego dla ciebie nie zrobi.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_04"); //No dobra. Tylko si� po�piesz!
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 50;
};

func void DIA_Patros_QUEST1_POMOC_100 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC100_15_01"); //100 bry�ek rudy.
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
    AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_01"); //Mam rud�, kt�r� zalegali mieszka�cy Obozu. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_02"); //Nawet t� od Gor Na Idona?
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_03"); //Tak, nawet j�.
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_04"); //�wietna robota.
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_05"); //Nie tak pr�dko! Dawaj nagrod�. Umawiali�my si� przecie�.
	AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_06"); //Ach tak. Prosz�.
    B_LogEntry               (CH1_OszukanyHandlarz,"Odda�em rud� Starkadowi, a w zamian otrzyma�em tyle bry�ek, ile wcze�niej wynegocjowa�em.");
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
   description	= "Mam dostaw� od Emanuela.";
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
    AI_Output (other, self ,"DIA_Patros_Dostawa_15_01"); //Mam dostaw� od Emanuela.
    AI_Output (self, other ,"DIA_Patros_Dostawa_15_02"); //Dlaczego nie przyszed� sam? Mia� si� spotka� z Shine. To on ma rud�.
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_03"); //Emanuel nie mia� czasu i przys�a� mnie. Shine nie �yje. Napad�o go kilku Nowicjuszy, kt�rzy widocznie wiedzieli o transakcji. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_04"); //Cholera, nast�pnym razem musz� by� ostro�niejszy. A co z rud�? Pewnie mam ci zap�aci�. B�dzie z tym problem...
	if Npc_HasItems (other, rudaemanuela) || Npc_KnowsInfo (hero, DIA_Emanuel_RUDAOK)
	{
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_05"); //Nie trzeba. Zabi�em tych zdrajc�w i znalaz�em to czego szuka�em. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_06"); //Doskonale. A wi�c jedyn� strat� jak� ponie�li�my jest Shine...
	}
	else
	{
	AI_Output (other, self ,"DIA_Patros_Dostawa_15_07"); //Spr�buj� jej jeszcze poszuka�.  
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_08"); //Przeszukaj dok�adnie okolice miejsca transakcji. Przecie� ci Nowicjusze nie zapadli si� pod ziemi�, a do Obozu wr�ci� si� nie odwa��. 
	AI_Output (self, other ,"DIA_Patros_Dostawa_15_09"); //Ju� ja bym przetrzepa� tych sukinsyn�w!
	};
	
	B_GiveInvItems (other, self, ItFoMutton, 30);
	B_GiveInvItems (other, self, ItFoSoup, 5);
    B_LogEntry                     (CH1_HandelEmanuela,"Zanios�em towary Starkadowi i powiedzia�em mu o tym co si� wydarzy�o.");

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
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_01"); //Ca�e szcz�cie, �e ci� widz�.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_02"); //Byli u ciebie Poszukiwacze?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_03"); //A wi�c tak nazywaj� si� te istoty.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_04"); //Zjawili si� noc�. Chcieli bym stan�� po ich stronie, ale odm�wi�em.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_05"); //Wi�c jakim cudem �yjesz?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_06"); //Nie mam poj�cia. Ucieka�em przed tymi postaciami, a� nagle przesta�y mnie �ciga�.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_07"); //Mo�liwe, �e co� je przestraszy�o.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_08"); //Lub kto�... W kt�rym miejscu to si� sta�o?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_09"); //Sko�czyli mnie �ciga� na pomostach w centrum Obozu.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_10"); //Mo�liwe, �e to kto� z g�ry.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_11"); //Wiesz, gdzie mo�e si� znajdowa� Czarny Mag?
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_12"); //Jaki Czarny Mag? 
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_13"); //Czarny Mag stoi za pojawieniem si� Poszukiwaczy w Kolonii.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_14"); //W takim razie nie mam poj�cia, gdzie m�g�by egzystowa�.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_15"); //Mo�liwe, �e wskaz�wki przy cia�ach doprowadz� mnie do jego kryj�wki.
    AI_Output (self, other ,"DIA_Patros_LifeIDsa_03_16"); //Opowiedz mi o tym.
    AI_Output (other, self ,"DIA_Patros_LifeIDsa_15_17"); //Teraz nie mam czasu. Mo�e p�niej.
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_WlakaZczarym,"Patros jest ostatnim �yj�cym z listy. Poszukiwacze porzucili za nim po�cig. Wypada�oby ustali� dlaczego.");
	Wld_InsertNpc				(NON_3072_Jefrey,"PSI_START");
    B_GiveXP (300);
};

// poprawione b��dy - 30 pa�dziernik 2012
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
   description	= "Masz mo�e jakie� plotki?";
};

FUNC INT DIA_Patros_PLOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_PLOTY_Info()
{
    AI_Output (other, self ,"DIA_Patros_PLOTY_15_01"); //Masz mo�e jakie� plotki?
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_02"); //Ludzie m�wi�, �e jeden z Nowicjuszy rozpocz�� badania na w�asn� r�k�.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_03"); //Podobno przesiaduje w pobli�u ma�ej palisady przy placu Baal Tondrala.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_04"); //Je�eli Shawn si� o tym dowie, zacznie go szuka�.
};


