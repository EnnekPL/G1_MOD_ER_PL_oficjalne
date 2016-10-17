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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Mazin_Mazin2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_Mazin2_Info()
{
    AI_Output (other, self ,"DIA_Mazin_Mazin2_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_02"); //Nazywam siê Mazin. Jestem tu karczmarzem, a raczej wspólnikiem Silasa.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_03"); //Mam tu spory ruch. Na górê zagl¹da wielu Szkodników. Krety wol¹ piæ na dole.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_04"); //Przyda³by mi siê ktoœ do pomocy. Nie jestem w stanie sam wszystkiego doprowadziæ do porz¹dku.
    AI_Output (self, other ,"DIA_Mazin_Mazin2_03_05"); //Ci mordercy robi¹ tu niema³y ba³agan.
	AI_Output (self, other ,"DIA_Mazin_Mazin2_03_06"); //Wracaj¹c do interesów, chcesz coœ kupiæ?
	var int heroknow_mazinsell;
	if (heroknow_mazinsell == FALSE)
	{
		Log_CreateTopic (GE_TraderNC,LOG_NOTE);
		B_LogEntry		(GE_TraderNC,"Mazin jest drugim karczmarzem w tawernie na jeziorze. Sprzeda mi wódkê i coœ na zak¹skê.");
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
   description	= "Chcê siê napiæ.";
};

FUNC INT DIA_Mazin_Trade_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_Trade_Info()
{
    AI_Output (other, self ,"DIA_Mazin_Trade_15_01"); //Chcê siê napiæ.
    AI_Output (self, other ,"DIA_Mazin_Trade_03_02"); //To zap³aæ.
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
    AI_Output (other, self ,"DIA_Mazin_HELLO1_15_03"); //To Nowicjusz z Bractwa. Stwierdzi³, ¿e nie chce mieæ z nimi nic wspólnego.
    AI_Output (self, other ,"DIA_Mazin_HELLO1_03_04"); //W sumie to przyda mi siê pomocnik w karczmie.
    AI_Output (self, other ,"DIA_Mazin_HELLO1_03_05"); //PrzyprowadŸ go tu.
    ShratHaveWork = true;
    B_LogEntry                     (CH1_UcieczkaShrata,"Shrat mo¿e zacz¹æ pracê w karczmie Mazina. ");

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
   description	= "Potrzebujê informacji o Gor Na Linie.";
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
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_01"); //Potrzebujê informacji o Gor Na Linie.
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_02"); //Co konkretnie?
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_03"); //Co siê z nim sta³o? Jakim cudem ze Stra¿nika Œwi¹tynnego zosta³ popychad³em? Co tu siê dzia³o w ogóle?
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_04"); //170 bry³ek rudy. Oto cena tej informacji.
    AI_Output (other, self ,"DIA_Mazin_GOR_NA_LIN_15_05"); //Czemu tak drogo?
    AI_Output (self, other ,"DIA_Mazin_GOR_NA_LIN_03_06"); //Sporo ryzykujê. Taka sytuacja jest komuœ wp³ywowemu na rêkê. 
    B_LogEntry                     (CH2_MissedSpy,"Mazin za 170 bry³ek rudy sprzeda mi informacjê o tym co siê dzia³o z Gor Na Linem przez ostatnie tygodnie. ");
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
   description	= "No dobra, chcê wiedzieæ coœ wiêcej.";
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
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_01"); //No dobra, chcê wiedzieæ coœ wiêcej.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_02"); //Twój kole¿ka przylaz³ tu kilka tygodni temu.
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_03"); //To ju¿ wiem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_04"); //Daj mi skoñczyæ, do cholery.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_05"); //No wiêc twój przyjaciel mia³ zapewne szpiegowaæ dla Bractwa. Œledzi³em ka¿dy jego ruch. Od pocz¹tku wygl¹da³ podejrzanie.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_06"); //Po jakimœ tygodniu zobaczy³em, ¿e jest bezradny. Nawiasem mówi¹c zacz¹³ to œledztwo z dupy strony. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_07"); //Postanowi³ wiêc zaprzyjaŸniæ siê z naszymi ludŸmi. Myœla³, ¿e siê czegoœ dowie. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_08"); //Te sukinsyny nie s¹ takie g³upie na jakich wygl¹daj¹. Tyle ci powiem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_09"); //No, ale do rzeczy. Kole¿ka skombinowa³ trochê ziela i zacz¹³ zagadywaæ ludzi Laresa.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_10"); //W koñcu da³ siê zaprosiæ na wieczorn¹ popijawê. Kolejnego wieczora na drug¹... i tak raz za razem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_11"); //Goœæ siê nieŸle uzale¿ni³. Po kilku nockach robi³ wszystko co kazali mu Szkodnicy.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_12"); //Tak te¿ dla zabawy pobi³ Bustera. Butch nieŸle siê wtedy wkurzy³. Pobi³ Gor Na Lina i zabra³ mu pancerz. 
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_13"); //Od tamtego wieczora banda ma go w dupie, za przeproszeniem. Nie chc¹ mieæ na pieñku z Butchem.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_14"); //Zacz¹³ wiêc piæ sam. Tak siê spi³, ¿e nieŸle ugnoi³ Silasowi pod³ogê. Ha ha. Silas bardzo nie lubi ba³aganu. Wkurzy³ siê.
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_15"); //Zabroni³ sprzedawania mu nawet wody. 
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_16"); //Przecie¿ goœæ jest nieŸle spity. Sk¹d bierze alkohol?
    AI_Output (self, other ,"DIA_Mazin_BUY_INFO_03_17"); //To ciê bêdzie kosztowaæ dodatkowe 50 bry³ek. 
    AI_Output (other, self ,"DIA_Mazin_BUY_INFO_15_18"); //No jasne...
	B_LogEntry                     (CH2_MissedSpy,"Kupi³em informacjê o Gor Na Linie od Mazina. Okazuje siê, ¿e Gor Na Lin za bardzo spoufali³ siê z ludŸmi Laresa. Szkodniki zabra³y mu pancerz i pewnie resztê ekwipunku. Stra¿nik zacz¹³ piæ samotnie. Niestety za informacjê sk¹d bierze alkohol bêdê musia³ dop³aciæ. ");
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
   description	= "Sk¹d Gor Na Lin bierze alkohol?";
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
    
    AI_Output (other, self ,"DIA_Mazin_ALCO_15_01"); //Sk¹d Gor Na Lin bierze alkohol?
    if (Npc_HasItems (hero, ItMiNugget) >=50)
    {
	 DIA_Mazin_ALCO.permanent = false; 
	 B_GiveInvItems (hero, self, ItMiNugget, 50);
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_02"); //Ostatnio bra³ go od Szkodników w jaskini. 
if (Npc_IsDead(ORG_860_Renyu)) && (Npc_IsDead(ORG_861_Killian)) && (Npc_IsDead(ORG_862_Jacko))
{
       /* if (Npc_KnowsInfo (hero, DIA_Mazin_DelteOrg))
        {
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_03"); //Przecie¿ sam kaza³eœ mi siê pozbyæ mieszaczy! K³amiesz.
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_04"); //Nie próbuj ze mn¹ pogrywaæ.
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_05"); //Kto sprzedaje alkohol Gor Na Linowi?! Przecie¿ ci zap³aci³em.
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_06"); //Cholera. Jesteœ zbyt ciekawski.
			AI_StopProcessInfos	(self);
            B_LogEntry                     (CH2_MissedSpy,"Mazin uleg³ emocjom i odwa¿y³ siê mnie zaatakowaæ. Z pewnoœci¹ ma coœ do ukrycia.");
            Npc_SetTarget (self, other);
            AI_StartState (self, ZS_ATTACK, 1, "");
        }*/
        //else 
		if (Kalom_DrugMonopol == LOG_SUCCESS) || ((Kalom_DrugMonopol == LOG_RUNNING) && (Npc_IsDead(ORG_860_Renyu)) && (Npc_IsDead(ORG_861_Killian)) && (Npc_IsDead(ORG_862_Jacko)))
        {
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_07"); //Mieszacze nie ¿yj¹ ju¿ od dawna.
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_08"); //Co? Jjj... jak to?
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_09"); //Nie udawaj niewini¹tka. Nie mów mi, ¿e nie wiedzia³eœ. 
            AI_Output (other, self ,"DIA_Mazin_ALCO_15_10"); //Gadaj, kto daje alkohol temu Stra¿nikowi!
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_11"); //Nie bêdziesz mi grozi³! To ty zabi³eœ mieszaczy! To ty! Dla tych skurwysynów z bagien. 
            AI_Output (self, other ,"DIA_Mazin_ALCO_03_12"); //Zaraz poznasz moj¹ stal.
            AI_StopProcessInfos	(self);
            B_LogEntry                     (CH2_MissedSpy,"Mazin uleg³ emocjom i odwa¿y³ siê mnie zaatakowaæ. Z pewnoœci¹ ma coœ do ukrycia.");
            Npc_SetTarget (self, other);
            AI_StartState (self, ZS_ATTACK, 1, "");
        };
		} else {
        AI_Output (other, self ,"DIA_Mazin_ALCO_15_13"); //Dziêki. Pójdê to sprawdziæ.
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_14"); //Aha. IdŸ noc¹. W dzieñ ten twój kole¿ka tam nie chodzi.
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_15"); //Jeszcze jedno: Cronos sprzeda ci herbatkê, która pomaga na kaca. 
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_16"); //Daj j¹ temu ca³emu Stra¿nikowi Œwi¹tynnemu i bierz go st¹d. 
        AI_Output (self, other ,"DIA_Mazin_ALCO_03_17"); //Tylko nie rób scen w karczmie. Poczekaj, a¿ pójdzie do jaskini. Potem z nim gadaj. 
        B_LogEntry                     (CH2_MissedSpy,"Jak siê okazuje Gor Na Lin noc¹ chodzi po trunki do jaskini mieszaczy. Muszê udaremniæ jego nocne popijawy, bo nied³ugo nie bêdzie czego ratowaæ. Cronos ma na sprzeda¿ herbatkê lecz¹c¹ objawy zatrucia alkoholowego. ");
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
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_01"); //Dobra, dobra! Wygra³eœ!
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_02"); //Dawa³em potajemnie wódkê Jeremiasza Gor Na Linowi.
    AI_Output (other, self ,"DIA_Mazin_PRZEGRAL_WALKE_15_03"); //Doprowadziliœcie tego cz³owieka do ruiny i wykorzystywaliœcie go przez wystarczaj¹co d³ugi czas. Powiedz mi, czyj to pomys³.
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_04"); //Nn.. nie wiem.
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_05"); //Dobra! To pomys³ Bruce'a. 
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_06"); //Daj mi ju¿ spokój. Cronos sprzeda ci specyfik, który ocuci tego twojego kolegê. 
    AI_Output (self, other ,"DIA_Mazin_PRZEGRAL_WALKE_03_07"); //Bierz go w cholerê.
    B_LogEntry                     (CH2_MissedSpy,"To Mazin dawa³ wódkê Linowi, ¿eby podtrzymaæ jego na³óg. Za wszystkim stoi Bruce, który zniszczy³ Gor Na Lina ot tak - dla zabawy. Cronos ma na sprzeda¿ herbatkê lecz¹c¹ objawy zatrucia alkoholowego. ");
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
    AI_Output (self, other ,"DIA_Mazin_HELLO3_03_01"); //Przegra³eœ! Jesteœ frajerem. Nie masz ju¿ ¿ycia w tym Obozie.
    B_LogEntry                     (CH2_MissedSpy,"Przegra³em walkê z Mazinem. Szkodnik czuje siê teraz zbyt pewnie. Skopa³em sprawê po ca³ej linii.");
	Npc_ExchangeRoutine (ORG_828_Bruce, "karczma");
	//przydaliby siê ludzie Bruce'a
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
   description	= "Szukam dobrze p³atnej roboty.";
};

FUNC INT DIA_Mazin_ITALIAN_JOB_XD_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mazin_ITALIAN_JOB_XD_Info()
{
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_01"); //Szukam dobrze p³atnej roboty.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_02"); //Ja nie mogê ci du¿o zap³aciæ. Jestem biednym karczmarzem.
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_03"); //Jasne... Masz tu utarg jak w dobrym burdelu. ZnajdŸ mi coœ.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_04"); //No dobra. Spróbujemy ten utarg zwiêkszyæ...
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_15_05"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_06"); //Te obszczymury wpadaj¹ do karczmy g³ównie gdy coœ siê dzieje. 
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_07"); //Zorganizuj jak¹œ burdê. Wyzwij na pojedynek Bruce'a. Nowy ³obuz w Obozie. To bêdzie coœ! Wszyscy bêd¹ o tobie gadaæ!
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_08"); //Bruce zjawia siê tutaj wieczorami. PóŸno po zachodzie s³oñca. 
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_09"); //Je¿eli wygrasz z nim pojedynek, dam ci 300 bry³ek rudy.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_03_10"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Mazin_ITALIAN_JOB_XD);
    Info_AddChoice		(DIA_Mazin_ITALIAN_JOB_XD, "Jasne.", DIA_Mazin_ITALIAN_JOB_XD_SURE);
    Info_AddChoice		(DIA_Mazin_ITALIAN_JOB_XD, "Nie mam na to czasu.", DIA_Mazin_ITALIAN_JOB_XD_BACK);
};

FUNC VOID DIA_Mazin_ITALIAN_JOB_XD_SURE()
{
    AI_Output (other, self ,"DIA_Mazin_ITALIAN_JOB_XD_SURE_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Mazin_ITALIAN_JOB_XD_SURE_03_02"); //No dobra. Wiêc do dzie³a.
    MIS_Italian_Job = LOG_RUNNING;

    Log_CreateTopic            (CH1_Italian_Job, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Italian_Job, LOG_RUNNING);
    B_LogEntry                     (CH1_Italian_Job,"Mazin chce, ¿ebym wyzwa³ na pojedynek Bruce'a. Bójki zwiêkszaj¹ zainteresowanie karczm¹.");
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
   description	= "Walczy³em z Bruce'm. ";
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
    AI_Output (other, self ,"DIA_Mazin_FIGHTBRUCE_15_01"); //Walczy³em z Bruce'm. 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_02"); //S³ysza³em, to znaczy ca³y Obóz s³ysza³! 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_03"); //Ludzie przychodz¹ do mnie i wypytuj¹ o ciebie, a przy okazji zamawiaj¹ ry¿ówkê! Dobra robota. 
    AI_Output (self, other ,"DIA_Mazin_FIGHTBRUCE_03_04"); //Oto twoja nale¿noœæ.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
	B_LogEntry                     (CH1_Italian_Job,"Walczy³em z Bruce'm. Otrzyma³em nagrodê od Mazina i przy okazji trochê s³awy. ");
	MIS_Italian_Job = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_Italian_Job, LOG_SUCCESS);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

