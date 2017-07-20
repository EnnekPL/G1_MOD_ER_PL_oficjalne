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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Will_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Will_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Will_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Will_HELLO1_03_02"); //By�em g�rnikiem. Teraz zajmuj� si� w�asnymi sprawami...
    AI_Output (other, self ,"DIA_Will_HELLO1_15_03"); //Co� wi�cej?
    AI_Output (self, other ,"DIA_Will_HELLO1_03_04"); //Tyle ci wystarczy, g�wniarzu.
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
   description	= "Chyba chcesz dosta� w mord�.";
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
    AI_Output (other, self ,"DIA_Will_HELLO2_15_01"); //Chyba chcesz dosta� w mord�.
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
   description	= "Porozmawiajmy spokojnie. Dowiem si� czego� wi�cej?";
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
    AI_Output (other, self ,"DIA_Will_HELLO3_15_01"); //Porozmawiajmy spokojnie. Dowiem si� czego� wi�cej?
    AI_Output (self, other ,"DIA_Will_HELLO3_03_02"); //Pos�uchaj. Musz� pozby� si� jednego go�cia.
	if (kapitel >= 2) && (kapitel < 4)
	{
    AI_Output (self, other ,"DIA_Will_HELLO3_03_03"); //Jak go zabijesz, to pogadamy o interesach.
    AI_Output (self, other ,"DIA_Will_HELLO3_03_04"); //Wchodzisz w to?
	DIA_Will_HELLO3.permanent = 0;
	can_killthopson_dia = true;
    Info_ClearChoices		(DIA_Will_HELLO3);
    Info_AddChoice		(DIA_Will_HELLO3, "Oczywi�cie.", DIA_Will_HELLO3_Zawsze);
    Info_AddChoice		(DIA_Will_HELLO3, "Nie b�d� nikogo zabija�.", DIA_Will_HELLO3_Nie);
	}
	else
	{
	AI_Output (self, other ,"DIA_Will_HELLO3_03_05"); //Ale nie wygl�dasz mi na kogo�, kto m�g�by si� zaj�� t� spraw�.
	AI_Output (self, other ,"DIA_Will_HELLO3_03_06"); //Wr�� do mnie jak si� troch� podszkolisz i lepiej poznasz to miejsce.
	can_killthopson_dia = false; 
	};
};

FUNC VOID DIA_Will_HELLO3_Zawsze()
{
    AI_Output (other, self ,"DIA_Will_HELLO3_Zawsze_15_01"); //Oczywi�cie.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_02"); //Widz�, �e mam do czynienia z porz�dnym cz�owiekiem.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_03"); //Kole�, kt�rego masz sprz�tn�� nazywa si� Thompson. Pewnie zaszy� si� w jakiej� karczmie, albo innej melinie.
    AI_Output (self, other ,"DIA_Will_HELLO3_Zawsze_03_04"); //Tylko uwa�aj. Ma sporo znajomych. Za�atw go po cichu.
	MIS_WillQuest = LOG_RUNNING;
	Log_CreateTopic		(CH2_WillQuest,		LOG_MISSION);
	Log_SetTopicStatus	(CH2_WillQuest,		LOG_RUNNING);
    B_LogEntry          (CH2_WillQuest,"Will kaza� mi zabi� cz�owieka imieniem Thompson. Mam uwa�a� na jego obstaw�. Nie dosta�em informacji dotycz�cych jego aktualnego miejsca pobytu.");
    Info_ClearChoices		(DIA_Will_HELLO3);
    AI_StopProcessInfos	(self);
	will_herosay_zawsze = true;
};

FUNC VOID DIA_Will_HELLO3_Nie()
{
    AI_Output (other, self ,"DIA_Will_HELLO3_Nie_15_01"); //Nie b�d� nikogo zabija�.
    AI_Output (self, other ,"DIA_Will_HELLO3_Nie_03_02"); //Cz�owieku, spadaj.
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
   description	= "Thompson nie �yje.";
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
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_01"); //Thompson nie �yje.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_02"); //Powa�nie? Jestem pe�en podziwu. W ko�cu to nie by� byle kto! Mo�emy teraz pogada� o interesach.
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_03"); //Zamieniam si� w s�uch.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_04"); //Pos�uchaj, znalaz�em �y�� z�ota. Tu, w cholernej G�rniczej Dolinie pe�nej ork�w i szumowin takich jak Thompson. Potrzebuj� kilku ludzi, kt�rzy pomog� mi to wszystko ogarn��.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_05"); //Ty ju� zdoby�e� moje zaufanie. Podziel� si� z tob� zyskami, ale sami nie damy rady. Przyda si� jeszcze kilku wsp�lnik�w, kt�rzy nie b�d� zbyt wymagaj�cy.
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_06"); //Mo�emy zarobi� krocie... Rozumiesz to? Trzeba to tylko dobrze rozegra� i dopilnowa�, �eby nikt niepowo�any si� nie dowiedzia�. 
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_07"); //Jeden trup ju� nam wystarczy. Osobi�cie nic do niego nie mia�em, ale go�� by� zbyt w�cibski, a do tego arogancki. 
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_08"); //B�dziemy zbiera� z�oto, cz�� pu�cimy w obieg w�r�d zaufanych handlarzy, a reszt� fortunki zachowamy na czas, gdy Bariera opadnie. 
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_09"); //O ile w og�le opadnie. 
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_10"); //Teraz si� nad tym nie zastanawiaj. My�l�, �e nawet tutaj znajdzie si� sporo ludzi, kt�rzy wymieni� z�oto na rud�.
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_11"); //Gdzie ta kopalnia?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_12"); //Nie tak pr�dko!
    AI_Output (other, self ,"DIA_Will_ThompsonDED_15_13"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_14"); //Szybko si� uczysz. TRZY ZAUFANE OSOBY, tylko o tyle ci� prosz�. Postaraj si�! Dw�ch robotnik�w i jeden ma�o wygadany ochroniarz. Zapami�tasz?
    AI_Output (self, other ,"DIA_Will_ThompsonDED_03_15"); //Zadbaj, �eby mieli kompetencje, a jak ju� zbierzesz ekip�, to przyjd� do mnie.
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_16"); //Niby gdzie mia�bym ich szuka�?
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_17"); //U�yj g�owy. Nawi�� jakie� przydatne znajomo�ci. Poszukaj jakich� desperat�w, cokolwiek. Mo�e nawet tutaj kogo� znajdziesz. Pogadaj z lud�mi w karczmie. 
	AI_Output (self, other ,"DIA_Will_ThompsonDED_03_18"); //Z tego co mi wiadomo to niejaki Kosa by� niegdy� �owc� g��w. Mo�e on da ci jak�� wskaz�wk�?
	AI_Output (other, self ,"DIA_Will_ThompsonDED_15_19"); //W porz�dku. Zaczn� od karczmy a rozejrz� si� dalej. 
    B_LogEntry               (CH2_WillQuest,"Thompson nie �yje, a Will by� pe�en podziwu. Co wi�cej, ten tajemniczy cz�owiek opowiedzia� mi o �yle z�ota, kt�r� znalaz� w Kolonii. Wiedzia�em, �e znajomo�� z nim si� op�aci.");
    Log_SetTopicStatus       (CH2_WillQuest, LOG_SUCCESS);
    MIS_WillQuest = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItMiNugget, 75);
    B_GiveInvItems (self, other, ItMiNugget, 75);
    MIS_GoldMine = LOG_RUNNING;

    Log_CreateTopic          (CH2_GoldMine, LOG_MISSION);
    Log_SetTopicStatus       (CH2_GoldMine, LOG_RUNNING);
    B_LogEntry               (CH2_GoldMine,"Will w sekrecie zdradzi� mi, �e odnalaz� w Kolonii �y�� z�ota. Oznacza to dla nas ca�kiem niez�y zarobek, o ile pomog� mu zorganizowa� wydobycie. Mam zebra� ekip�, kt�ra podj�aby si� pracy w ma�ej kopalni z�ota. Potrzebni s� dwaj robotnicy i jeden ochroniarz. Will poleci� mi zacz�� poszukiwania od karczmy. Poza tym Najemnik Kosa by� mo�e b�dzie mi m�g� co� doradzi�.");
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
   description	= "Shutfer b�dzie twoim nowym g�rnikiem.";
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
    AI_Output (other, self ,"DIA_Will_Rekrut_Shutfer_15_01"); //Shutfer b�dzie twoim nowym g�rnikiem.
    AI_Output (self, other ,"DIA_Will_Rekrut_Shutfer_03_02"); //Znam go. Mog�em sam o nim pomy�le�. My�l�, �e si� spisze.
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
   description	= "Ghorim chce dla ciebie pracowa�.";
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
    AI_Output (other, self ,"DIA_Will_Rekrut_Shrat_15_01"); //Ghorim chce dla ciebie pracowa�.
    AI_Output (self, other ,"DIA_Will_Rekrut_Shrat_03_02"); //Dobra robota. Robotnicy s� mi potrzebni.
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
   description	= "Magnus b�dzie ochrania� kopalni�.";
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
    AI_Output (other, self ,"DIA_Will_Rekrut_Magnus_15_01"); //Magnus b�dzie ochrania� kopalni�.
    AI_Output (self, other ,"DIA_Will_Rekrut_Magnus_03_02"); //Oby by� wystarczaj�co silny, aby poradzi� sobie z z�baczami!

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
   description	= "Co do ludzi, kt�rych mia�em zwerbowa�...";
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

    AI_Output (other, self ,"DIA_Will_Werbowanie_15_01"); //Co do ludzi, kt�rych mia�em zwerbowa�...
    AI_Output (self, other ,"DIA_Will_Werbowanie_03_02"); //Mamy ju� trzech. To wystarczy. Dobrze si� spisa�e�
	AI_Output (self, other ,"DIA_Will_Werbowanie_03_03"); //Wkr�tce wybierzemy si� do kopalni. Tam przedyskutujemy pozosta�e sprawy.
	AI_Output (self, other ,"DIA_Will_Werbowanie_03_04"); //Powiedz, gdy b�dziesz got�w. 
	B_LogEntry               (CH2_GoldMine,"Zebra�em ca�� ekip� potrzebn� do pracy w kopalni. Mam da� znak Willowi, gdy b�dziemy mogli rusza�.");
    Log_SetTopicStatus       (CH2_GoldMine, LOG_SUCCESS);
    MIS_GoldMine = LOG_SUCCESS;
	B_GiveXP (250);
	/*
    Info_ClearChoices		(DIA_Will_Werbowanie);
	if (wybrany_chroniarz == false) && (Npc_KnowsInfo (hero, DIA_Bandyta_HELLO2))
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Kereth b�dzie ochrania� kopalni�.", DIA_Will_Werbowanie_Kereth);
	};
	if (wybrany_chroniarz == false) && Calash_gototavern == true
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Calash zajmie si� obron� kopalni. ", DIA_Will_Werbowanie_Calash);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Schuerfer_Kopalnia)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Shutfer potrafi kopa� z�oto.", DIA_Will_Werbowanie_Shutfer);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Glen_GoldMine)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Glen wkr�tce si� tu zjawi.", DIA_Will_Werbowanie_Glen);
	};
	if (wybrany_chroniarz == false) && (Npc_KnowsInfo (hero, DIA_Magnus_Ucieczka)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Magnus nam pomo�e.", DIA_Will_Werbowanie_Mysliwy);
	};
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && Shrat_gototavern == true
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Shrat zajmie si� wydobyciem.", DIA_Will_Werbowanie_Shrat);
	};
	
	if ((wybrany_kopacz1 == false) || (wybrany_kopacz2 == false)) && (Npc_KnowsInfo (hero, DIA_Senyan_GoldMine)) 
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "Senyan b�dzie wydobywa� z�oto.", DIA_Will_Werbowanie_Senyan);
	};
	if (wybrany_kopacz1 == true) && (wybrany_kopacz1 == true) && (wybrany_chroniarz == true)
	{
    Info_AddChoice		(DIA_Will_Werbowanie, "To ju� wszyscy!", DIA_Will_Werbowanie_EnDQuest);
	};
    Info_AddChoice		(DIA_Will_Werbowanie, DIALOG_BACK, DIA_Will_Werbowanie_BACK);*/
};

FUNC VOID DIA_Will_Werbowanie_Kereth()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Kereth_15_01"); //Kereth b�dzie ochrania� kopalni�. 
    AI_Output (self, other ,"DIA_Will_Werbowanie_Kereth_03_02"); //Mam nadziej�, �e masz do niego zaufanie.
	if (wybrany_chroniarz == false) 
	{
	wybrany_chroniarz = true;
	};
	KerethOK = true;
	DIA_Will_Werbowanie.permanent = true;
};

FUNC VOID DIA_Will_Werbowanie_Calash()
{
    AI_Output (other, self ,"DIA_Will_Werbowanie_Calash_15_01"); //Calash zajmie si� obron� kopalni.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Calash_03_02"); //Znam Calasha. To twardy kole�.
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
    AI_Output (other, self ,"DIA_Will_Werbowanie_Shutfer_15_01"); //Shutfer potrafi kopa� z�oto.
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
    AI_Output (other, self ,"DIA_Will_Werbowanie_Glen_15_01"); //Glen wkr�tce si� tu zjawi.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Glen_03_02"); //�wietnie!
	
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
    AI_Output (other, self ,"DIA_Will_Werbowanie_Mysliwy_15_01"); //Magnus zajmie si� ochron� kopalni
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
    AI_Output (other, self ,"DIA_Will_Werbowanie_Shrat_15_01"); //Shrat pomo�e pozby� si� niechcianych go�ci z kopalni.
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
    AI_Output (other, self ,"DIA_Will_Werbowanie_Senyan_15_01"); //Senyan b�dzie wydobywa� z�oto.
    AI_Output (self, other ,"DIA_Will_Werbowanie_Senyan_03_02"); //S�ysza�em, �e zna si� na rzeczy. Dobra robota!
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

    AI_Output (other, self ,"DIA_Will_Werbowanie_EnDQuest_15_01"); //To ju� wszyscy!
	if (wybrany_chroniarz == true) && (wybrany_kopacz1 == true) && (wybrany_kopacz2 == true)
	{
    AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_02"); //Uda�o ci si� skompletowa� ca�� dru�yn�.
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_03"); //Wkr�tce wybierzemy si� do kopalni. Tam przedyskutujemy pozosta�e sprawy.
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_04"); //Powiedz, gdy b�dziesz got�w. 
	B_LogEntry                     (CH2_GoldMine,"Zgodnie z poleceniem Willa zebra�em ca�� ekip� potrzebn� do pracy w kopalni. Powinienem da� znak, gdy b�d� gotowy do wyj�cia.");
    //Log_SetTopicStatus       (CH2_GoldMine, LOG_SUCCESS);
    //MIS_GoldMine = LOG_SUCCESS;
	DIA_Will_Werbowanie.permanent = false;
	B_giveXP (500);
	} 
	else
	{
	 AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_05"); //Chyba jednak nie. Do trzech nie zliczysz?!
	AI_Output (self, other ,"DIA_Will_Werbowanie_EnDQuest_03_06"); //Wr�� p�niej. 
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
   description	= "Mo�emy rusza�.";
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

    AI_Output (other, self ,"DIA_Will_Ruchy_15_01"); //Mo�emy rusza�.
    AI_Output (self, other ,"DIA_Will_Ruchy_03_02"); //Zbieraj ludzi i za mn�!
	AI_Output (self, other ,"DIA_Will_Ruchy_03_03"); //Tylko b�d�cie ostro�ni. Wola�bym, �eby �aden idiota nie spad�.
    MIS_DrogaDoKopalni = LOG_RUNNING;

    //Log_CreateTopic          (CH1_DrogaDoKopalni, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_DrogaDoKopalni, LOG_RUNNING);
    //B_LogEntry               (CH1_DrogaDoKopalni,"Pora wyruszy� do sekretnej kopalni z�ota. Musimy mie� si� na baczno�ci.");
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
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_01"); //Jeste�my na miejscu.
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_02"); //Dobra robota, panowie. Mo�ecie zabiera� si� do pracy.
    AI_Output (other, self ,"DIA_Will_PrzystanekZamosc_15_03"); //A co z zap�at� i podzia�em zysk�w?
    AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_04"); //Racja. Te bry�ki rudy s� dla ciebie za dobr� robot�.
	AI_Output (self, other ,"DIA_Will_PrzystanekZamosc_03_05"); //Teraz musimy porozmawia� o kryj�wce na z�oto i o ewentualnej wymianie. 
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    
    B_LogEntry               (CH2_GoldMine,"Zadanie wykonane. Stan�li�my przed kopalni�. Pora zacz�� prac�... Przypuszczam, �e dla mnie znajdzie si� co� specjalnego. ");
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
   description	= "Gdzie ukryjemy z�oto?";
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
    AI_Output (other, self ,"DIA_Will_GoldKryjowka_15_01"); //Gdzie ukryjemy z�oto?
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_02"); //To w�a�nie zadanie dla ciebie. Musisz znale�� jak�� miejsc�wk�, w kt�rej b�dzie mo�na bezpiecznie przechowa� �adunek.
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_03"); //Mo�e okolice jakiego� grobowca do kt�rego ludzie boj� si� podej��?
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_04"); //Oczywi�cie pami�taj, �e potrzebujemy sporo miejsca...
    AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_05"); //No to do dzie�a. Licz� na ciebie.
	AI_Output (self, other ,"DIA_Will_GoldKryjowka_03_06"); //Jeszcze jedno! We� te map� Kolonii. Bez niej nic nie zaznaczysz.
	CreateInvItems (self, ItWrWorldmap, 1);
    B_GiveInvItems (self, other, ItWrWorldmap, 1);
    MIS_Treasury = LOG_RUNNING;

    Log_CreateTopic          (CH2_Treasury, LOG_MISSION);
    Log_SetTopicStatus       (CH2_Treasury, LOG_RUNNING);
    B_LogEntry               (CH2_Treasury,"Mam poszuka� jakiego� specjalnego miejsca, w kt�rym mo�na by przechowa� z�oto. ");
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
   description	= "Znalaz�em dobr� kryj�wk�. ";
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
    AI_Output (other, self ,"DIA_Will_Kryjowka_15_01"); //Znalaz�em dobr� kryj�wk�. 
    AI_Output (self, other ,"DIA_Will_Kryjowka_03_02"); //Tak? A masz map�?
    if (Npc_HasItems (other, ItWrWorldmap_Edit1) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_03"); //Tak. We� j�.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit1, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_04"); //Dobra robota. B�d� z ciebie ludzie.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_05"); //To miejsce b�dzie �wietne.
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia�em Willowi o odnalezionej przeze mnie kryj�wce. Odda�em mu r�wnie� map� na kt�rej zaznaczy�em jej po�o�enie. Nagrod� by�y kolejne bry�ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
    }
    else if (Npc_HasItems (other, ItWrWorldmap_Edit2) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_06"); //Jasne, �e mam map�.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_07"); //Dobra. Dawaj j�.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_08"); //Dobrze si� spisa�e�.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit2, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia�em Willowi o odnalezionej przeze mnie kryj�wce. Odda�em mu r�wnie� map� na kt�rej zaznaczy�em jej po�o�enie. Nagrod� by�y kolejne bry�ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
    }
    else if (Npc_HasItems (other, ItWrWorldmap_Edit3) >=1)
    {
        AI_Output (other, self ,"DIA_Will_Kryjowka_15_09"); //Prosz�, we� j�.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_10"); //Dobra nasza. 
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_11"); //�wietnie si� sprawi�e�.
        AI_Output (self, other ,"DIA_Will_Kryjowka_03_12"); //We� to jako nagrod�.
        B_GiveInvItems (other, self, ItWrWorldmap_Edit3, 1);
        CreateInvItems (self, ItMiNugget, 150);
        B_GiveInvItems (self, other, ItMiNugget, 150);
        b_givexp (350);
		B_LogEntry                     (CH2_Treasury,"Powiedzia�em Willowi o odnalezionej przeze mnie kryj�wce. Odda�em mu r�wnie� map� na kt�rej zaznaczy�em jej po�o�enie. Nagrod� by�y kolejne bry�ki rudy.");
		Log_SetTopicStatus       (CH2_Treasury, LOG_SUCCESS);
		MIS_Treasury = LOG_SUCCESS;
		DIA_Will_Kryjowka.permanent = 0;
		kryjowka_znaleziona = true;
	}
	else
	{
		AI_Output (other, self ,"DIA_Will_Kryjowka_15_13"); //Jeszcze nad tym pracuj�. 
		AI_Output (self, other ,"DIA_Will_Kryjowka_03_14"); //No to do roboty.
		//DIA_Will_Kryjowka.permanent = true;
	};
};
//poprawione liter�wki
