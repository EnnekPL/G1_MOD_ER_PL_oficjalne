//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Will_EXIT(C_INFO)
{
	npc             = NON_5635_Will;
	nr              = 999;
	condition		= DIA_Will_EXIT_Condition;
	information		= DIA_Will_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Will_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Will_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Will_HELLO1 (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_HELLO1_Condition;
   information  = DIA_Will_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Will_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Will_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Will_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Will_HELLO1_03_02"); //By³em górnikiem. Teraz zajmujê siê w³asnymi sprawami...
    AI_Output (other, self ,"DIA_Will_HELLO1_15_03"); //Coœ wiêcej?
    AI_Output (self, other ,"DIA_Will_HELLO1_03_04"); //Tyle ci wystarczy, gówniarzu.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Will_HELLO2 (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 2;
   condition    = DIA_Will_HELLO2_Condition;
   information  = DIA_Will_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chyba chcesz dostaæ w mordê.";
};

FUNC INT DIA_Will_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Will_HELLO1)) && (!Npc_KnowsInfo (hero, DIA_Will_HELLO3)) && (MIS_WillQuest != LOG_RUNNING) && (MIS_WillQuest != LOG_SUCCESS) && (MIS_WillQuest != LOG_FAILED) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Will_HELLO2_15_01"); //Chyba chcesz dostaæ w mordê.
    AI_Output (self, other ,"DIA_Will_HELLO2_03_02"); //No dawaj, gnojku!
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HELLO3
//========================================
var int can_killthopson_dia;
INSTANCE DIA_Will_HELLO3 (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 3;
   condition    = DIA_Will_HELLO3_Condition;
   information  = DIA_Will_HELLO3_Info;
   permanent	= TRUE;
   description	= "Porozmawiajmy spokojnie. Dowiem siê czegoœ wiêcej?";
};

FUNC INT DIA_Will_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Will_HELLO1)) && (!Npc_KnowsInfo (hero, DIA_Will_HELLO2)) && (can_killthopson_dia == false) && (MIS_WillQuest != LOG_RUNNING) && (MIS_WillQuest != LOG_SUCCESS) && (MIS_WillQuest != LOG_FAILED) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Will_HELLO3_15_01"); //Porozmawiajmy spokojnie. Dowiem siê czegoœ wiêcej?
    AI_Output (self, other ,"DIA_Will_HELLO3_03_02"); //Pos³uchaj. Muszê pozbyæ siê jednego goœcia.
	if (kapitel >= 2) && (kapitel < 4)
	{
    AI_Output (self, other ,"DIA_Will_HELLO3_03_03"); //Jak go zabijesz, to pogadamy o interesach.
    AI_Output (self, other ,"DIA_Will_HELLO3_03_04"); //Wchodzisz w to?
	DIA_Will_HELLO3.permanent = 0;
	can_killthopson_dia = true;
    Info_ClearChoices		(DIA_Will_HELLO3);
    Info_AddChoice		(DIA_Will_HELLO3, "Oczywiœcie.", DIA_Will_HELLO3_Zawsze);
    Info_AddChoice		(DIA_Will_HELLO3, "Nie bêdê nikogo zabija³.", DIA_Will_HELLO3_Nie);
	}
	else
	{
	AI_Output (self, other ,"DIA_Will_HELLO3_03_05"); //Ale nie wygl¹dasz mi na kogoœ, kto móg³by siê zaj¹æ t¹ spraw¹.
	AI_Output (self, other ,"DIA_Will_HELLO3_03_06"); //Wróæ do mnie jak siê trochê podszkolisz i lepiej poznasz to miejsce.
	can_killthopson_dia = false; 
	};
};

FUNC VOID DIA_Will_HELLO3_Zawsze()
{
    AI_Output (other, self ,"DIA_Will_HELLO3_Zawsze_15_01"); //Oczywiœcie.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_02"); //Widzê, ¿e mam do czynienia z porz¹dnym cz³owiekiem.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_03"); //Koleœ, którego masz sprz¹tn¹æ nazywa siê Thompson. Pewnie zaszy³ siê w jakiejœ karczmie, albo innej melinie.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_04"); //Tylko uwa¿aj. Ma sporo znajomych. Za³atw go po cichu.
	MIS_WillQuest = LOG_RUNNING;
	Log_CreateTopic		(CH2_WillQuest,		LOG_MISSION);
	Log_SetTopicStatus	(CH2_WillQuest,		LOG_RUNNING);
    B_LogEntry          (CH2_WillQuest,"Will kaza³ mi zabiæ cz³owieka imieniem Thompson. Mam uwa¿aæ na jego obstawê. Nie dosta³em informacji dotycz¹cych jego aktualnego miejsca pobytu.");
    Info_ClearChoices		(DIA_Will_HELLO3);
    AI_StopProcessInfos	(self);
	will_herosay_zawsze = true;
};

FUNC VOID DIA_Will_HELLO3_Nie()
{
    AI_Output (other, self ,"DIA_Will_HELLO3_Nie_15_01"); //Nie bêdê nikogo zabija³.
    AI_Output (self, other ,"DIA_Will_HELLO3_Nie_03_02"); //Cz³owieku, spadaj.
    Info_ClearChoices		(DIA_Will_HELLO3);
    AI_StopProcessInfos	(self);
	will_herosay_zawsze = false;
};

//========================================
//-----------------> ThompsonDED
//========================================

INSTANCE DIA_Will_ThompsonDED (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 4;
   condition    = DIA_Will_ThompsonDED_Condition;
   information  = DIA_Will_ThompsonDED_Info;
   permanent	= FALSE;
   description	= "Thompson nie ¿yje.";
};

FUNC INT DIA_Will_ThompsonDED_Condition()
{
    if (MIS_WillQuest == LOG_RUNNING)
    && (Npc_IsDead(NON_5636_Thompson))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Will_ThompsonDED_Info()
{
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_01"); //Thompson nie ¿yje.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_02"); //Powa¿nie? Jestem pe³en podziwu. W koñcu to nie by³ byle kto! Mo¿emy teraz pogadaæ o interesach.
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_03"); //Zamieniam siê w s³uch.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_04"); //Pos³uchaj, znalaz³em ¿y³ê z³ota. Tu, w cholernej Górniczej Dolinie pe³nej orków i szumowin takich jak Thompson. Potrzebujê kilku ludzi, którzy pomog¹ mi to wszystko ogarn¹æ.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_05"); //Ty ju¿ zdoby³eœ moje zaufanie. Podzielê siê z tob¹ zyskami, ale sami nie damy rady. Przyda siê jeszcze kilku wspólników, którzy nie bêd¹ zbyt wymagaj¹cy.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_06"); //Mo¿emy zarobiæ krocie... Rozumiesz to? Trzeba to tylko dobrze rozegraæ i dopilnowaæ, ¿eby nikt niepowo³any siê nie dowiedzia³. 
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_07"); //Jeden trup ju¿ nam wystarczy. Osobiœcie nic do niego nie mia³em, ale goœæ by³ zbyt wœcibski, a do tego arogancki. 
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_08"); //Bêdziemy zbieraæ z³oto, czêœæ puœcimy w obieg wœród zaufanych handlarzy, a resztê fortunki zachowamy na czas, gdy Bariera opadnie. 
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_09"); //O ile w ogóle opadnie. 
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_10"); //Teraz siê nad tym nie zastanawiaj. Myœlê, ¿e nawet tutaj znajdzie siê sporo ludzi, którzy wymieni¹ z³oto na rudê.
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_11"); //Gdzie ta kopalnia?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_12"); //Nie tak prêdko!
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_13"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_14"); //Szybko siê uczysz. TRZY ZAUFANE OSOBY, tylko o tyle ciê proszê. Postaraj siê! Dwóch robotników i jeden ma³o wygadany ochroniarz. Zapamiêtasz?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_15"); //Zadbaj, ¿eby mieli kompetencje, a jak ju¿ zbierzesz ekipê, to przyjdŸ do mnie.
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_16"); //Niby gdzie mia³bym ich szukaæ?
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_17"); //U¿yj g³owy. Nawi¹¿ jakieœ przydatne znajomoœci. Poszukaj jakichœ desperatów, cokolwiek. Mo¿e nawet tutaj kogoœ znajdziesz. Pogadaj z ludŸmi w karczmie. 
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_18"); //Z tego co mi wiadomo to niejaki Kosa by³ niegdyœ ³owc¹ g³ów. Mo¿e on da ci jak¹œ wskazówkê?
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_19"); //W porz¹dku. Zacznê od karczmy a rozejrzê siê dalej. 
    B_LogEntry               (CH2_WillQuest,"Thompson nie ¿yje, a Will by³ pe³en podziwu. Co wiêcej, ten tajemniczy cz³owiek opowiedzia³ mi o ¿yle z³ota, któr¹ znalaz³ w Kolonii. Wiedzia³em, ¿e znajomoœæ z nim siê op³aci.");
    Log_SetTopicStatus       (CH2_WillQuest, LOG_SUCCESS);
    MIS_WillQuest = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItMiNugget, 75);
    B_GiveInvItems (self, other, ItMiNugget, 75);
    MIS_GoldMine = LOG_RUNNING;

    Log_CreateTopic          (CH2_GoldMine, LOG_MISSION);
    Log_SetTopicStatus       (CH2_GoldMine, LOG_RUNNING);
    B_LogEntry               (CH2_GoldMine,"Will w sekrecie zdradzi³ mi, ¿e odnalaz³ w Kolonii ¿y³ê z³ota. Oznacza to dla nas ca³kiem niez³y zarobek, o ile pomogê mu zorganizowaæ wydobycie. Mam zebraæ ekipê, która podjê³aby siê pracy w ma³ej kopalni z³ota. Potrzebni s¹ dwaj robotnicy i jeden ochroniarz. Will poleci³ mi zacz¹æ poszukiwania od karczmy. Poza tym Najemnik Kosa byæ mo¿e bêdzie mi móg³ coœ doradziæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Rekrut_Shutfer
//========================================

INSTANCE DIA_Will_Rekrut_Shutfer (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Rekrut_Shutfer_Condition;
   information  = DIA_Will_Rekrut_Shutfer_Info;
   permanent	= FALSE;
   description	= "Shutfer bêdzie twoim nowym górnikiem.";
};

FUNC INT DIA_Will_Rekrut_Shutfer_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Schuerfer_Kopalnia))
    && (MIS_GoldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_Rekrut_Shutfer_Info()
{
    AI_Output (other, self ,"DIA_Will_Rekrut_Shutfer_15_01"); //Shutfer bêdzie twoim nowym górnikiem.
    AI_Output (self, other ,"DIA_Will_Rekrut_Shutfer_03_02"); //Znam go. Mog³em sam o nim pomyœleæ. Myœlê, ¿e siê spisze.
};

//========================================
//-----------------> Rekrut_Shrat
//========================================

INSTANCE DIA_Will_Rekrut_Shrat (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Rekrut_Shrat_Condition;
   information  = DIA_Will_Rekrut_Shrat_Info;
   permanent	= FALSE;
   description	= "Ghorim chce dla ciebie pracowaæ.";
};

FUNC INT DIA_Will_Rekrut_Shrat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shrat_GoldMine))
    && (MIS_GoldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_Rekrut_Shrat_Info()
{
    AI_Output (other, self ,"DIA_Will_Rekrut_Shrat_15_01"); //Ghorim chce dla ciebie pracowaæ.
    AI_Output (self, other ,"DIA_Will_Rekrut_Shrat_03_02"); //Dobra robota. Robotnicy s¹ mi potrzebni.
};

//========================================
//-----------------> Rekrut_Magnus
//========================================

INSTANCE DIA_Will_Rekrut_Magnus (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Rekrut_Magnus_Condition;
   information  = DIA_Will_Rekrut_Magnus_Info;
   permanent	= FALSE;
   description	= "Magnus bêdzie ochrania³ kopalniê.";
};

FUNC INT DIA_Will_Rekrut_Magnus_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka))
    && (MIS_GoldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_Rekrut_Magnus_Info()
{
    AI_Output (other, self ,"DIA_Will_Rekrut_Magnus_15_01"); //Magnus bêdzie ochrania³ kopalniê.
    AI_Output (self, other ,"DIA_Will_Rekrut_Magnus_03_02"); //Oby by³ wystarczaj¹co silny, aby poradziæ sobie z zêbaczami!

};

//========================================
//-----------------> Werbowanie
//========================================

INSTANCE DIA_Will_Werbowanie (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Werbowanie_Condition;
   information  = DIA_Will_Werbowanie_Info;
   permanent	= false;
   description	= "Co do ludzi, których mia³em zwerbowaæ...";
};

FUNC INT DIA_Will_Werbowanie_Condition()
{
    if (MIS_GoldMine == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Will_Rekrut_Magnus)) && (Npc_KnowsInfo (hero, DIA_Will_Rekrut_Shrat)) && (Npc_KnowsInfo (hero, DIA_Will_Rekrut_Shutfer))
    {
    return TRUE;
    };
};

// nieaktualne
var int KerethOK;
var int CalashOK;
var int ShutferOK;
var int GlenOK;
var int MAgnusOK;
var int ShratOK;
var int SenyanOK;
var int liczba_ochroniarzy;

FUNC VOID DIA_Will_Werbowanie_Info()
{

    AI_Output (other, self ,"DIA_Will_Werbowanie_15_01"); //Co do ludzi, których mia³em zwerbowaæ...
    AI_Output (self, other ,"DIA_Will_Werbowanie_03_02"); //Mamy ju¿ trzech. To wystarczy. Dobrze siê spisa³eœ
	AI_Output (self, other ,"DIA_Will_Werbowanie_03_03"); //Wkrótce wybierzemy siê do kopalni. Tam przedyskutujemy pozosta³e sprawy.
	AI_Output (self, other ,"DIA_Will_Werbowanie_03_04"); //Powiedz, gdy bêdziesz gotów. 
	B_LogEntry               (CH2_GoldMine,"Zebra³em ca³¹ ekipê potrzebn¹ do pracy w kopalni. Mam daæ znak Willowi, gdy bêdziemy mogli ruszaæ.");
    Log_SetTopicStatus       (CH2_GoldMine, LOG_SUCCESS);
    MIS_GoldMine = LOG_SUCCESS;
	B_GiveXP (250);
	/*
    Info_ClearChoices		(DIA_Will_Werbowanie);
	if (wybrany_chroniarz == false) && (Npc_KnowsInfo (hero, DIA_Bandyta_HELLO2))
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Kereth bêdzie ochrania³ kopalniê.", DIA_Will_Werbowanie_Kereth);
	};
	if (wybrany_chroniarz == false) && Calash_gototavern == true
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Calash zajmie siê obron¹ kopalni. ", DIA_Will_Werbowanie_Calash);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Schuerfer_Kopalnia)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Shutfer potrafi kopaæ z³oto.", DIA_Will_Werbowanie_Shutfer);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Glen_GoldMine)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Glen wkrótce siê tu zjawi.", DIA_Will_Werbowanie_Glen);
	};
	if (wybrany_chroniarz == false) && (Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Magnus nam pomo¿e.", DIA_Will_Werbowanie_Mysliwy);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && Shrat_gototavern == true
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Shrat zajmie siê wydobyciem.", DIA_Will_Werbowanie_Shrat);
	};
	
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Senyan_GoldMine)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Senyan bêdzie wydobywa³ z³oto.", DIA_Will_Werbowanie_Senyan);
	};
	if (wybrany_kopacz1 == true) && (wybrany_kopacz1 == true) && (wybrany_chroniarz == true)
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "To ju¿ wszyscy!", DIA_Will_Werbowanie_EnDQuest);
	};
    Info_AddChoice		(DIA_Will_Werbowanie, DIALOG_BACK, DIA_Will_Werbowanie_BACK);*/
};

FUNC VOID DIA_Will_Werbowanie_Kereth()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Kereth_15_01"); //Kereth bêdzie ochrania³ kopalniê. 
    AI_Output (self, other ,"DIA_Will_Werbowanie_Kereth_03_02"); //Mam nadziejê, ¿e masz do niego zaufanie.
	if (wybrany_chroniarz == false) 
	{
	wybrany_chroniarz = true;
	};
	KerethOK = true;
	DIA_Will_Werbowanie.permanent = true;
};

FUNC VOID DIA_Will_Werbowanie_Calash()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Calash_15_01"); //Calash zajmie siê obron¹ kopalni.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Calash_03_02"); //Znam Calasha. To twardy koleœ.
	if (wybrany_chroniarz == false) 
	{
	wybrany_chroniarz = true;
	};
	Wld_InsertNpc				(ORG_857_Calash,"OC1");	
	Npc_ExchangeRoutine (ORG_857_Calash, "karczma");
	CalashOK = true;
	DIA_Will_Werbowanie.permanent = true;
};

FUNC VOID DIA_Will_Werbowanie_Shutfer()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Shutfer_15_01"); //Shutfer potrafi kopaæ z³oto.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Shutfer_03_02"); //Dobrze ci idzie.
	ShutferOK = true;
	if (wybrany_kopacz1 == false) 
	{
	wybrany_kopacz1 = true;
	}
	else if (wybrany_kopacz2 == false) 
	{
	wybrany_kopacz1 = true;
	DIA_Will_Werbowanie.permanent = true;
	};
};

FUNC VOID DIA_Will_Werbowanie_Glen()
{
	var int glen_resp;
    AI_Output (other, self ,"DIA_Will_Werbowanie_Glen_15_01"); //Glen wkrótce siê tu zjawi.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Glen_03_02"); //Œwietnie!
	
	if (glen_resp == false)
	{
	Npc_ExchangeRoutine (VLK_583_Glen, "robol");
	Wld_InsertNpc				(VLK_583_Glen,"OC1");	
	glen_resp = true;
	};
	glenok = true;
	if (wybrany_kopacz1 == false) 
	{
	wybrany_kopacz1 = true;
	}
	else if (wybrany_kopacz2 == false) 
	{
	wybrany_kopacz1 = true;
	DIA_Will_Werbowanie.permanent = true;
	};
};

FUNC VOID DIA_Will_Werbowanie_Mysliwy()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Mysliwy_15_01"); //Magnus zajmie siê ochron¹ kopalni
    AI_Output (self, other ,"DIA_Will_Werbowanie_Mysliwy_03_02"); //Doskonale!
	if (wybrany_chroniarz == false) 
	{
	wybrany_chroniarz = true;
	};
	magnusok = true;
	DIA_Will_Werbowanie.permanent = true;
};
//1.24 fixed 
FUNC VOID DIA_Will_Werbowanie_Shrat()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Shrat_15_01"); //Shrat pomo¿e pozbyæ siê niechcianych goœci z kopalni.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Shrat_03_02"); //Dobra robota!
	SenyanOK = true;
	if (wybrany_kopacz1 == false) 
	{
	wybrany_kopacz1 = true;
	}
	else if (wybrany_kopacz2 == false) 
	{
	wybrany_kopacz1 = true;
	DIA_Will_Werbowanie.permanent = true;
	};
};

FUNC VOID DIA_Will_Werbowanie_Senyan()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Senyan_15_01"); //Senyan bêdzie wydobywa³ z³oto.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Senyan_03_02"); //S³ysza³em, ¿e zna siê na rzeczy. Dobra robota!
	if (wybrany_kopacz1 == false) 
	{
	wybrany_kopacz1 = true;
	}
	else if (wybrany_kopacz2 == false) 
	{
	wybrany_kopacz1 = true;
	DIA_Will_Werbowanie.permanent = true;
	};
}; 

FUNC VOID DIA_Will_Werbowanie_EnDQuest()
{

    AI_Output (other, self ,"DIA_Will_Werbowanie_EnDQuest_15_01"); //To ju¿ wszyscy!
	if (wybrany_chroniarz == true) && (wybrany_kopacz1 == true) && (wybrany_kopacz2 == true)
	{
    AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_02"); //Uda³o ci siê skompletowaæ ca³¹ dru¿ynê.
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_03"); //Wkrótce wybierzemy siê do kopalni. Tam przedyskutujemy pozosta³e sprawy.
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_04"); //Powiedz, gdy bêdziesz gotów. 
	B_LogEntry                     (CH2_GoldMine,"Zgodnie z poleceniem Willa zebra³em ca³¹ ekipê potrzebn¹ do pracy w kopalni. Powinienem daæ znak, gdy bêdê gotowy do wyjœcia.");
    //Log_SetTopicStatus       (CH2_GoldMine, LOG_SUCCESS);
    //MIS_GoldMine = LOG_SUCCESS;
	DIA_Will_Werbowanie.permanent = false;
	B_giveXP (500);
	} 
	else
	{
	 AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_05"); //Chyba jednak nie. Do trzech nie zliczysz?!
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_06"); //Wróæ póŸniej. 
	DIA_Will_Werbowanie.permanent = true;
	AI_STOPPROCESSINFOS (self);
	};
};
FUNC VOID DIA_Will_Werbowanie_BACK()
{
    Info_ClearChoices		(DIA_Will_Werbowanie);
};

//========================================
//-----------------> Ruchy
//========================================

INSTANCE DIA_Will_Ruchy (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Ruchy_Condition;
   information  = DIA_Will_Ruchy_Info;
   permanent	= FALSE;
   description	= "Mo¿emy ruszaæ.";
};

FUNC INT DIA_Will_Ruchy_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Will_Werbowanie)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_Ruchy_Info()
{

    AI_Output (other, self ,"DIA_Will_Ruchy_15_01"); //Mo¿emy ruszaæ.
    AI_Output (self, other ,"DIA_Will_Ruchy_03_02"); //Zbieraj ludzi i za mn¹!
	AI_Output (self, other ,"DIA_Will_Ruchy_03_03"); //Tylko b¹dŸcie ostro¿ni. Wola³bym, ¿eby ¿aden idiota nie spad³.
    MIS_DrogaDoKopalni = LOG_RUNNING;

    //Log_CreateTopic          (CH1_DrogaDoKopalni, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_DrogaDoKopalni, LOG_RUNNING);
    //B_LogEntry               (CH1_DrogaDoKopalni,"Pora wyruszyæ do sekretnej kopalni z³ota. Musimy mieæ siê na bacznoœci.");
	var c_npc will; will = Hlp_GetNpc (NON_5635_Will);
    Npc_ExchangeRoutine (will, "guide");
	will.flags = 2;
	AI_StopProcessInfos	(will);
	var c_npc shrat; shrat = Hlp_GetNpc (NOV_1310_Ghorim);
	var c_npc schut; schut = Hlp_GetNpc (SFB_1001_Schuerfer);
	var c_npc magnus; magnus = Hlp_GetNpc (NON_5675_Magnus);
	Npc_ExchangeRoutine (shrat, "FOLLOW");
	shrat.flags = 2;
	Npc_ExchangeRoutine (schut, "FOLLOW");
	schut.flags = 2;
	Npc_ExchangeRoutine (magnus, "FOLLOW");
	magnus.flags = 2;
	
	will.aivar[AIV_PARTYMEMBER] = TRUE;
	shrat.aivar[AIV_PARTYMEMBER] = TRUE;
	schut.aivar[AIV_PARTYMEMBER] = TRUE;
	magnus.aivar[AIV_PARTYMEMBER] = TRUE;
	/*
	if (KerethOK == true)
	{
	BAN_1608_Kereth.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (BAN_1608_Kereth, "FOLLOW");
	};
	if (CalashOK == true)
	{
	ORG_857_Calash.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (ORG_857_Calash, "FOLLOW");
	};
	if (MagnusOK == true)
	{
	NON_5675_Magnus.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NON_5675_Magnus, "FOLLOW");
	};	
	if (shratOK == true)
	{
	NOV_1356_Shrat.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NOV_1356_Shrat, "FOLLOW");
	};	
	if (glenOK == true)
	{
	NOV_1356_Shrat.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NOV_1356_Shrat, "FOLLOW");
	};	
	if (ShutferOK == true)
	{
	SFB_1001_Schuerfer.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (SFB_1001_Schuerfer, "FOLLOW");
	};
	if (SenyanOK == true)
	{
	SFB_1000_Senyan.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (SFB_1000_Senyan, "FOLLOW");
	};*/
   
};

//========================================
//-----------------> PrzystanekZamosc
//========================================

INSTANCE DIA_Will_PrzystanekZamosc (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_PrzystanekZamosc_Condition;
   information  = DIA_Will_PrzystanekZamosc_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Will_PrzystanekZamosc_Condition()
{
    if (Npc_GetDistToWP (self, "OW_PATH_07_15_CAVE2") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Will_Ruchy))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_PrzystanekZamosc_Info()
{
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_01"); //Jesteœmy na miejscu.
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_02"); //Dobra robota, panowie. Mo¿ecie zabieraæ siê do pracy.
    AI_Output (other, self ,"DIA_Will_PrzystanekZamosc_15_03"); //A co z zap³at¹ i podzia³em zysków?
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_04"); //Racja. Te bry³ki rudy s¹ dla ciebie za dobr¹ robotê.
	AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_05"); //Teraz musimy porozmawiaæ o kryjówce na z³oto i o ewentualnej wymianie. 
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    
    B_LogEntry               (CH2_GoldMine,"Zadanie wykonane. Stanêliœmy przed kopalni¹. Pora zacz¹æ pracê... Przypuszczam, ¿e dla mnie znajdzie siê coœ specjalnego. ");
    Log_SetTopicStatus       (CH2_GoldMine, LOG_SUCCESS);
    MIS_GoldMine = LOG_SUCCESS;
    B_GiveXP (100);
	
	var c_npc will; will = Hlp_GetNpc (NON_5635_Will);
	var c_npc shrat; shrat = Hlp_GetNpc (NOV_1310_Ghorim);
	var c_npc schut; schut = Hlp_GetNpc (SFB_1001_Schuerfer);
	var c_npc magnus; magnus = Hlp_GetNpc (NON_5675_Magnus);
	
	Npc_ExchangeRoutine (will, "mine");
	Npc_ExchangeRoutine (schut, "mine");
	Npc_ExchangeRoutine (shrat, "mine");
	Npc_ExchangeRoutine (magnus, "mine");
	
	will.flags = 0;
	shrat.flags = 0;
	schut.flags = 0;
	magnus.flags = 0;
	
	will.aivar[AIV_PARTYMEMBER] = FALSE;
	shrat.aivar[AIV_PARTYMEMBER] = FALSE;
	schut.aivar[AIV_PARTYMEMBER] = FALSE;
	magnus.aivar[AIV_PARTYMEMBER] = FALSE;
	/*
	if (KerethOK == true)
	{
	BAN_1608_Kereth.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (BAN_1608_Kereth, "FOLLOW");
	};
	if (CalashOK == true)
	{
	ORG_857_Calash.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (ORG_857_Calash, "FOLLOW");
	};
	if (MagnusOK == true)
	{
	NON_5675_Magnus.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NON_5675_Magnus, "FOLLOW");
	};	
	if (shratOK == true)
	{
	NOV_1356_Shrat.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NOV_1356_Shrat, "FOLLOW");
	};	
	if (glenOK == true)
	{
	NOV_1356_Shrat.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (NOV_1356_Shrat, "FOLLOW");
	};	
		if (ShutferOK == true)
	{
	SFB_1001_Schuerfer.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (SFB_1001_Schuerfer, "FOLLOW");
	};*/
};

//========================================
//-----------------> GoldKryjowka
//========================================

INSTANCE DIA_Will_GoldKryjowka (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 2;
   condition    = DIA_Will_GoldKryjowka_Condition;
   information  = DIA_Will_GoldKryjowka_Info;
   permanent	= FALSE;
   description	= "Gdzie ukryjemy z³oto?";
};

FUNC INT DIA_Will_GoldKryjowka_Condition()
{
    if (MIS_DrogaDoKopalni == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_GoldKryjowka_Info()
{
    AI_Output (other, self ,"DIA_Will_GoldKryjowka_15_01"); //Gdzie ukryjemy z³oto?
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_02"); //To w³aœnie zadanie dla ciebie. Musisz znaleŸæ jak¹œ miejscówkê, w której bêdzie mo¿na bezpiecznie przechowaæ ³adunek.
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_03"); //Mo¿e okolice jakiegoœ grobowca do którego ludzie boj¹ siê podejœæ?
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_04"); //Oczywiœcie pamiêtaj, ¿e potrzebujemy sporo miejsca...
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_05"); //No to do dzie³a. Liczê na ciebie.
	AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_06"); //Jeszcze jedno! WeŸ te mapê Kolonii. Bez niej nic nie zaznaczysz.
	CreateInvItems (self, ItWrWorldmap, 1);
    B_GiveInvItems (self, other, ItWrWorldmap, 1);
    MIS_Treasury = LOG_RUNNING;

    Log_CreateTopic          (CH2_Treasury, LOG_MISSION);
    Log_SetTopicStatus       (CH2_Treasury, LOG_RUNNING);
    B_LogEntry               (CH2_Treasury,"Mam poszukaæ jakiegoœ specjalnego miejsca, w którym mo¿na by przechowaæ z³oto. ");
};

//========================================
//-----------------> Kryjowka
//========================================
var int kryjowka_znaleziona;
INSTANCE DIA_Will_Kryjowka (C_INFO)
{
   npc          = NON_5635_Will;
   nr           = 1;
   condition    = DIA_Will_Kryjowka_Condition;
   information  = DIA_Will_Kryjowka_Info;
   permanent	= true;
   description	= "Znalaz³em dobr¹ kryjówkê. ";
};

FUNC INT DIA_Will_Kryjowka_Condition()
{
    if (MIS_Treasury == LOG_RUNNING) && (kryjowka_znaleziona == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Will_Kryjowka_Info()
{
    AI_Output (other, self ,"DIA_Will_Kryjowka_15_01"); //Znalaz³em dobr¹ kryjówkê. 
    AI_Output (self, other ,"DIA_Will_Kryjowka_03_02"); //Tak? A masz mapê?
    if (Npc_HasItems (other, ItWrWorldmap_Edit1) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_03"); //Tak. WeŸ j¹.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit1, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_04"); //Dobra robota. Bêd¹ z ciebie ludzie.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_05"); //To miejsce bêdzie œwietne.
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia³em Willowi o odnalezionej przeze mnie kryjówce. Odda³em mu równie¿ mapê na której zaznaczy³em jej po³o¿enie. Nagrod¹ by³y kolejne bry³ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
    }
    else if (Npc_HasItems (other, ItWrWorldmap_Edit2) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_06"); //Jasne, ¿e mam mapê.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_07"); //Dobra. Dawaj j¹.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_08"); //Dobrze siê spisa³eœ.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit2, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia³em Willowi o odnalezionej przeze mnie kryjówce. Odda³em mu równie¿ mapê na której zaznaczy³em jej po³o¿enie. Nagrod¹ by³y kolejne bry³ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
    }
    else if (Npc_HasItems (other, ItWrWorldmap_Edit3) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_09"); //Proszê, weŸ j¹.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_10"); //Dobra nasza. 
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_11"); //Œwietnie siê sprawi³eœ.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_12"); //WeŸ to jako nagrodê.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit3, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia³em Willowi o odnalezionej przeze mnie kryjówce. Odda³em mu równie¿ mapê na której zaznaczy³em jej po³o¿enie. Nagrod¹ by³y kolejne bry³ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
	}
	else
	{
		AI_Output (other, self ,"DIA_Will_Kryjowka_15_13"); //Jeszcze nad tym pracujê. 
		AI_Output (self, other ,"DIA_Will_Kryjowka_03_14"); //No to do roboty.
		//DIA_Will_Kryjowka.permanent = true;
	};
};
//poprawione literówki
