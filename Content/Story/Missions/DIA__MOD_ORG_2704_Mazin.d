// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Mazin_EXIT(C_INFO)
{
	npc             = ORG_2704_Mazin;
	nr              = 999;
	condition		= DIA_Mazin_EXIT_Condition;
	information		= DIA_Mazin_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Mazin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mazin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Mazin2
//========================================

INSTANCE DIA_Mazin_Mazin2 (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 2;
   condition    = DIA_Mazin_Mazin2_Condition;
   information  = DIA_Mazin_Mazin2_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Mazin_Mazin2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_Mazin2_Info()
{
    AI_Output (other, self ,"DIA_Mazin_Mazin2_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_02"); //Nazywam si� Mazin. Jestem tu karczmarzem, a raczej wsp�lnikiem Silasa.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_03"); //Mam tu spory ruch. Na g�r� zagl�da wielu Szkodnik�w. Krety wol� pi� na dole.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_04"); //Przyda�by mi si� kto� do pomocy. Nie jestem w stanie sam wszystkiego doprowadzi� do porz�dku.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_05"); //Ci mordercy robi� tu niema�y ba�agan.
	AI_Output (self, other ,"DIA_Mazin_Mazin2_03_06"); //Wracaj�c do interes�w, chcesz co� kupi�?
	var int heroknow_mazinsell;
	if (heroknow_mazinsell == FALSE)
	{
		Log_CreateTopic (GE_TraderNC,LOG_NOTE);
		B_LogEntry		(GE_TraderNC,"Mazin jest drugim karczmarzem w tawernie na jeziorze. Sprzeda mi w�dk� i co� na zak�sk�.");
		heroknow_mazinsell = TRUE;
	};
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Mazin_Trade (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 3;
   condition    = DIA_Mazin_Trade_Condition;
   information  = DIA_Mazin_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� si� napi�.";
};

FUNC INT DIA_Mazin_Trade_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_Trade_Info()
{
    AI_Output (other, self ,"DIA_Mazin_Trade_15_01"); //Chc� si� napi�.
    AI_Output (self, other ,"DIA_Mazin_Trade_03_02"); //To zap�a�.
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Mazin_HELLO1 (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 1;
   condition    = DIA_Mazin_HELLO1_Condition;
   information  = DIA_Mazin_HELLO1_Info;
   permanent	= FALSE;
   description	= "Shrat szuka pracy.";
};

FUNC INT DIA_Mazin_HELLO1_Condition()
{
    if  (MIS_UCieczkaShrata == LOG_RUNNING)
    && (ShratHaveWork == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Mazin_HELLO1_15_01"); //Shrat szuka pracy.
    AI_Output (self, other ,"DIA_Mazin_HELLO1_03_02"); //Kim jest Shrat?
    AI_Output (other, self ,"DIA_Mazin_HELLO1_15_03"); //To Nowicjusz z Bractwa. Stwierdzi�, �e nie chce mie� z nimi nic wsp�lnego.
    AI_Output (self, other ,"DIA_Mazin_HELLO1_03_04"); //W sumie to przyda mi si� pomocnik w karczmie.
    AI_Output (self, other ,"DIA_Mazin_HELLO1_03_05"); //Przyprowad� go tu.
    ShratHaveWork = true;
    B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo�e zacz�� prac� w karczmie Mazina. ");

    B_GiveXP (300);
};


//========================================
//-----------------> GOR_NA_LIN
//========================================

INSTANCE DIA_Mazin_GOR_NA_LIN (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 1;
   condition    = DIA_Mazin_GOR_NA_LIN_Condition;
   information  = DIA_Mazin_GOR_NA_LIN_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� informacji o Gor Na Linie.";
};

FUNC INT DIA_Mazin_GOR_NA_LIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaLin_HELLO1))
    && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_GOR_NA_LIN_Info()
{
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_01"); //Potrzebuj� informacji o Gor Na Linie.
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_02"); //Co konkretnie?
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_03"); //Co si� z nim sta�o? Jakim cudem ze Stra�nika �wi�tynnego zosta� popychad�em? Co tu si� dzia�o w og�le?
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_04"); //170 bry�ek rudy. Oto cena tej informacji.
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_05"); //Czemu tak drogo?
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_06"); //Sporo ryzykuj�. Taka sytuacja jest komu� wp�ywowemu na r�k�. 
    B_LogEntry                     (CH2_MissedSpy,"Mazin za 170 bry�ek rudy sprzeda mi informacj� o tym co si� dzia�o z Gor Na Linem przez ostatnie tygodnie. ");
};

//========================================
//-----------------> BUY_INFO
//========================================

INSTANCE DIA_Mazin_BUY_INFO (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 2;
   condition    = DIA_Mazin_BUY_INFO_Condition;
   information  = DIA_Mazin_BUY_INFO_Info;
   permanent	= FALSE;
   description	= "No dobra, chc� wiedzie� co� wi�cej.";
};

FUNC INT DIA_Mazin_BUY_INFO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mazin_GOR_NA_LIN))
    && (MIS_MissedSpy == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=170)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_BUY_INFO_Info()
{
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_01"); //No dobra, chc� wiedzie� co� wi�cej.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_02"); //Tw�j kole�ka przylaz� tu kilka tygodni temu.
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_03"); //To ju� wiem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_04"); //Daj mi sko�czy�, do cholery.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_05"); //No wi�c tw�j przyjaciel mia� zapewne szpiegowa� dla Bractwa. �ledzi�em ka�dy jego ruch. Od pocz�tku wygl�da� podejrzanie.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_06"); //Po jakim� tygodniu zobaczy�em, �e jest bezradny. Nawiasem m�wi�c zacz�� to �ledztwo z dupy strony. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_07"); //Postanowi� wi�c zaprzyja�ni� si� z naszymi lud�mi. My�la�, �e si� czego� dowie. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_08"); //Te sukinsyny nie s� takie g�upie na jakich wygl�daj�. Tyle ci powiem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_09"); //No, ale do rzeczy. Kole�ka skombinowa� troch� ziela i zacz�� zagadywa� ludzi Laresa.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_10"); //W ko�cu da� si� zaprosi� na wieczorn� popijaw�. Kolejnego wieczora na drug�... i tak raz za razem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_11"); //Go�� si� nie�le uzale�ni�. Po kilku nockach robi� wszystko co kazali mu Szkodnicy.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_12"); //Tak te� dla zabawy pobi� Bustera. Butch nie�le si� wtedy wkurzy�. Pobi� Gor Na Lina i zabra� mu pancerz. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_13"); //Od tamtego wieczora banda ma go w dupie, za przeproszeniem. Nie chc� mie� na pie�ku z Butchem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_14"); //Zacz�� wi�c pi� sam. Tak si� spi�, �e nie�le ugnoi� Silasowi pod�og�. Ha ha. Silas bardzo nie lubi ba�aganu. Wkurzy� si�.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_15"); //Zabroni� sprzedawania mu nawet wody. 
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_16"); //Przecie� go�� jest nie�le spity. Sk�d bierze alkohol?
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_17"); //To ci� b�dzie kosztowa� dodatkowe 50 bry�ek. 
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_18"); //No jasne...
	B_LogEntry                     (CH2_MissedSpy,"Kupi�em informacj� o Gor Na Linie od Mazina. Okazuje si�, �e Gor Na Lin za bardzo spoufali� si� z lud�mi Laresa. Szkodniki zabra�y mu pancerz i pewnie reszt� ekwipunku. Stra�nik zacz�� pi� samotnie. Niestety za informacj� sk�d bierze alkohol b�d� musia� dop�aci�. ");
	B_GiveInvItems (hero, self, ItMiNugget, 170);
    B_GiveXP (270);
};

//========================================
//-----------------> ALCO
//========================================

INSTANCE DIA_Mazin_ALCO (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 1;
   condition    = DIA_Mazin_ALCO_Condition;
   information  = DIA_Mazin_ALCO_Info;
   permanent	= FALSE;
   description	= "Sk�d Gor Na Lin bierze alkohol?";
};

FUNC INT DIA_Mazin_ALCO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mazin_BUY_INFO))
    && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_ALCO_Info()
{
    
    AI_Output (other, self ,"DIA_Mazin_ALCO_15_01"); //Sk�d Gor Na Lin bierze alkohol?
    if (Npc_HasItems (hero, ItMiNugget) >=50)
    {
	 DIA_Mazin_ALCO.permanent = false; 
	 B_GiveInvItems (hero, self, ItMiNugget, 50);
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_02"); //Ostatnio bra� go od Szkodnik�w w jaskini. 
if (Npc_IsDead(ORG_860_Renyu)) && (Npc_IsDead(ORG_861_Killian)) && (Npc_IsDead(ORG_862_Jacko))
{
       /* if (Npc_KnowsInfo (hero, DIA_Mazin_DelteOrg))
        {
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_03"); //Przecie� sam kaza�e� mi si� pozby� mieszaczy! K�amiesz.
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_04"); //Nie pr�buj ze mn� pogrywa�.
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_05"); //Kto sprzedaje alkohol Gor Na Linowi?! Przecie� ci zap�aci�em.
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_06"); //Cholera. Jeste� zbyt ciekawski.
			AI_StopProcessInfos	(self);
            B_LogEntry                     (CH2_MissedSpy,"Mazin uleg� emocjom i odwa�y� si� mnie zaatakowa�. Z pewno�ci� ma co� do ukrycia.");
            Npc_SetTarget (self, other);
            AI_StartState (self, ZS_ATTACK, 1, "");
        }*/
        //else 
		if (Kalom_DrugMonopol == LOG_SUCCESS) || ((Kalom_DrugMonopol == LOG_RUNNING) && (Npc_IsDead(ORG_860_Renyu)) && (Npc_IsDead(ORG_861_Killian)) && (Npc_IsDead(ORG_862_Jacko)))
        {
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_07"); //Mieszacze nie �yj� ju� od dawna.
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_08"); //Co? Jjj... jak to?
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_09"); //Nie udawaj niewini�tka. Nie m�w mi, �e nie wiedzia�e�. 
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_10"); //Gadaj, kto daje alkohol temu Stra�nikowi!
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_11"); //Nie b�dziesz mi grozi�! To ty zabi�e� mieszaczy! To ty! Dla tych skurwysyn�w z bagien. 
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_12"); //Zaraz poznasz moj� stal.
            AI_StopProcessInfos	(self);
            B_LogEntry                     (CH2_MissedSpy,"Mazin uleg� emocjom i odwa�y� si� mnie zaatakowa�. Z pewno�ci� ma co� do ukrycia.");
            Npc_SetTarget (self, other);
            AI_StartState (self, ZS_ATTACK, 1, "");
        };
		} else {
        AI_Output (other, self ,"DIA_Mazin_ALCO_15_13"); //Dzi�ki. P�jd� to sprawdzi�.
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_14"); //Aha. Id� noc�. W dzie� ten tw�j kole�ka tam nie chodzi.
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_15"); //Jeszcze jedno: Cronos sprzeda ci herbatk�, kt�ra pomaga na kaca. 
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_16"); //Daj j� temu ca�emu Stra�nikowi �wi�tynnemu i bierz go st�d. 
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_17"); //Tylko nie r�b scen w karczmie. Poczekaj, a� p�jdzie do jaskini. Potem z nim gadaj. 
        B_LogEntry                     (CH2_MissedSpy,"Jak si� okazuje Gor Na Lin noc� chodzi po trunki do jaskini mieszaczy. Musz� udaremni� jego nocne popijawy, bo nied�ugo nie b�dzie czego ratowa�. Cronos ma na sprzeda� herbatk� lecz�c� objawy zatrucia alkoholowego. ");
		herbatka_crnonos = true;
		Npc_ExchangeRoutine (TPL_3928_GorNaLin,"pijus");
        B_GiveXP (200);
        AI_StopProcessInfos	(self);
    };
}
else
{
 AI_Output (self, other ,"DIA_Mazin_ALCO_03_18"); //Nie ma rudy - nie ma informacji! 
 DIA_Mazin_ALCO.permanent = true;
};
};

//========================================
//-----------------> PRZEGRAL_WALKE
//========================================

INSTANCE DIA_Mazin_PRZEGRAL_WALKE (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 2;
   condition    = DIA_Mazin_PRZEGRAL_WALKE_Condition;
   information  = DIA_Mazin_PRZEGRAL_WALKE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Mazin_PRZEGRAL_WALKE_Condition()
{
    var C_NPC whodie1; 	whodie1 = Hlp_GetNpc(ORG_860_Renyu);
    if (Npc_KnowsInfo (hero, DIA_Mazin_ALCO))
    && (Npc_IsDead(ORG_860_Renyu))
    && (ORG_2704_Mazin.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_PRZEGRAL_WALKE_Info()
{
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_01"); //Dobra, dobra! Wygra�e�!
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_02"); //Dawa�em potajemnie w�dk� Jeremiasza Gor Na Linowi.
    AI_Output (other, self ,"DIA_Mazin_PRZEGRAL_WALKE_15_03"); //Doprowadzili�cie tego cz�owieka do ruiny i wykorzystywali�cie go przez wystarczaj�co d�ugi czas. Powiedz mi, czyj to pomys�.
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_04"); //Nn.. nie wiem.
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_05"); //Dobra! To pomys� Bruce'a. 
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_06"); //Daj mi ju� spok�j. Cronos sprzeda ci specyfik, kt�ry ocuci tego twojego koleg�. 
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_07"); //Bierz go w choler�.
    B_LogEntry                     (CH2_MissedSpy,"To Mazin dawa� w�dk� Linowi, �eby podtrzyma� jego na��g. Za wszystkim stoi Bruce, kt�ry zniszczy� Gor Na Lina ot tak - dla zabawy. Cronos ma na sprzeda� herbatk� lecz�c� objawy zatrucia alkoholowego. ");
	herbatka_crnonos = true;
    B_GiveXP (250);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Mazin_HELLO3 (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 3;
   condition    = DIA_Mazin_HELLO3_Condition;
   information  = DIA_Mazin_HELLO3_Info;
   permanent	= FALSE;
   important = true;
};

FUNC INT DIA_Mazin_HELLO3_Condition()
{
     if (Npc_KnowsInfo (hero, DIA_Mazin_ALCO))
    && (Npc_IsDead(ORG_860_Renyu))
    && (ORG_2704_Mazin.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_HELLO3_Info()
{
    AI_Output (self, other ,"DIA_Mazin_HELLO3_03_01"); //Przegra�e�! Jeste� frajerem. Nie masz ju� �ycia w tym Obozie.
    B_LogEntry                     (CH2_MissedSpy,"Przegra�em walk� z Mazinem. Szkodnik czuje si� teraz zbyt pewnie. Skopa�em spraw� po ca�ej linii.");
	Npc_ExchangeRoutine (ORG_828_Bruce, "karczma");
	//przydaliby si� ludzie Bruce'a
	B_KillNPC (TPL_3928_GorNaLin);
    AI_StopProcessInfos	(ORG_2704_Mazin);
};

//========================================
//-----------------> ITALIAN_JOB_XD
//========================================

INSTANCE DIA_Mazin_ITALIAN_JOB_XD (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 888;
   condition    = DIA_Mazin_ITALIAN_JOB_XD_Condition;
   information  = DIA_Mazin_ITALIAN_JOB_XD_Info;
   permanent	= FALSE;
   description	= "Szukam dobrze p�atnej roboty.";
};

FUNC INT DIA_Mazin_ITALIAN_JOB_XD_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_ITALIAN_JOB_XD_Info()
{
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_01"); //Szukam dobrze p�atnej roboty.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_02"); //Ja nie mog� ci du�o zap�aci�. Jestem biednym karczmarzem.
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_03"); //Jasne... Masz tu utarg jak w dobrym burdelu. Znajd� mi co�.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_04"); //No dobra. Spr�bujemy ten utarg zwi�kszy�...
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_05"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_06"); //Te obszczymury wpadaj� do karczmy g��wnie gdy co� si� dzieje. 
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_07"); //Zorganizuj jak�� burd�. Wyzwij na pojedynek Bruce'a. Nowy �obuz w Obozie. To b�dzie co�! Wszyscy b�d� o tobie gada�!
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_08"); //Bruce zjawia si� tutaj wieczorami. P�no po zachodzie s�o�ca. 
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_09"); //Je�eli wygrasz z nim pojedynek, dam ci 300 bry�ek rudy.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_10"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Mazin_ITALIAN_JOB_XD);
    Info_AddChoice		(DIA_Mazin_ITALIAN_JOB_XD, "Jasne.", DIA_Mazin_ITALIAN_JOB_XD_SURE);
    Info_AddChoice		(DIA_Mazin_ITALIAN_JOB_XD, "Nie mam na to czasu.", DIA_Mazin_ITALIAN_JOB_XD_BACK);
};

FUNC VOID DIA_Mazin_ITALIAN_JOB_XD_SURE()
{
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_SURE_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_SURE_03_02"); //No dobra. Wi�c do dzie�a.
    MIS_Italian_Job = LOG_RUNNING;

    Log_CreateTopic            (CH1_Italian_Job, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Italian_Job, LOG_RUNNING);
    B_LogEntry                     (CH1_Italian_Job,"Mazin chce, �ebym wyzwa� na pojedynek Bruce'a. B�jki zwi�kszaj� zainteresowanie karczm�.");
    Info_ClearChoices		(DIA_Mazin_ITALIAN_JOB_XD);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Mazin_ITALIAN_JOB_XD_BACK()
{
    Info_ClearChoices		(DIA_Mazin_ITALIAN_JOB_XD);
};

//========================================
//-----------------> FIGHTBRUCE
//========================================

INSTANCE DIA_Mazin_FIGHTBRUCE (C_INFO)
{
   npc          = ORG_2704_Mazin;
   nr           = 1;
   condition    = DIA_Mazin_FIGHTBRUCE_Condition;
   information  = DIA_Mazin_FIGHTBRUCE_Info;
   permanent	= FALSE;
   description	= "Walczy�em z Bruce'm. ";
};

FUNC INT DIA_Mazin_FIGHTBRUCE_Condition()
{
    if ((Npc_KnowsInfo (hero, DIA_Bruce_WYGRANA_BITKA)) || (Npc_KnowsInfo (hero, DIA_Bruce_FAIL_BITKA)))
    && (MIS_Italian_Job == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mazin_FIGHTBRUCE_Info()
{
    AI_Output (other, self ,"DIA_Mazin_FIGHTBRUCE_15_01"); //Walczy�em z Bruce'm. 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_02"); //S�ysza�em, to znaczy ca�y Ob�z s�ysza�! 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_03"); //Ludzie przychodz� do mnie i wypytuj� o ciebie, a przy okazji zamawiaj� ry��wk�! Dobra robota. 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_04"); //Oto twoja nale�no��.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
	B_LogEntry                     (CH1_Italian_Job,"Walczy�em z Bruce'm. Otrzyma�em nagrod� od Mazina i przy okazji troch� s�awy. ");
	MIS_Italian_Job = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_Italian_Job, LOG_SUCCESS);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

