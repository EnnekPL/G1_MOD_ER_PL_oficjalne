//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rakus_EXIT(C_INFO)
{
	npc             = NON_2705_Rakus;
	nr              = 999;
	condition	= DIA_Rakus_EXIT_Condition;
	information	= DIA_Rakus_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rakus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rakus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Rakus_WhoYou (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_WhoYou_Condition;
   information  = DIA_Rakus_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Rakus_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Rakus_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Rakus_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_02"); //Jestem Rakus, �owca ork�w.
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_03"); //Nale�� do najbardziej zaufanych towarzyszy Wilsona.
};


//========================================
//-----------------> IWannaArmor
//========================================

INSTANCE DIA_Rakus_IWannaArmor (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_IWannaArmor_Condition;
   information  = DIA_Rakus_IWannaArmor_Info;
   permanent	= FALSE;
   description	= "Nosicie ciekawe zbroje.";
};

FUNC INT DIA_Rakus_IWannaArmor_Condition()
{
    return TRUE; 
};


FUNC VOID DIA_Rakus_IWannaArmor_Info()
{
    AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_01"); //Nosicie ciekawe zbroje.
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_02"); //Tak, to pancerze wykonane z szczeg�ln� dba�o�ci� o szczeg�y. Zapewniaj� ochron� przed uderzeniami ci�kich broni.
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_03"); //M�j pancerz nie raz ocali� mi �ycie. Dlatego tak o niego dbam...
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_04"); //Czy macie jeszcze jakie� sztuki na sprzeda�?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_05"); //Mam jeden egzemplarz, jednak trzymam go na ci�kie czasy. Zreszt�, w�tpi�, aby by�o ci� sta�.
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_06"); //Za��my, �e nasta�y ci�kie czasy. Ile by� za niego chcia�?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_07"); //Jakie� 3200 bry�ek rudy... Tak, to by�aby zdecydowanie uczciwa cena.
	
	PrintS_Ext("Warunek: Rozdzia� 4", COL_White);
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"�owca ork�w Rakus ma przy sobie dodatkowy egzemplarz solidnego pancerza. M�g�by mi go sprzeda�, jednak zrobi to tylko, gdy stwierdzi, �e sytuacja w G�rniczej Dolinie jest naprawd� niebezpieczna. Cena takiego pancerza wynosi u niego 3200 bry�ek rudy. (Parametry zbroi: ochrona przed broni� bia��: 54, ochrona przed strza�ami: 15, ochrona przed ogniem: 30, ochrona przed magi�: 25)");
};

var int rakus_sell_armor;
//========================================
//-----------------> BuyOrchunterArmor
//========================================

INSTANCE DIA_Rakus_BuyOrchunterArmor (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_BuyOrchunterArmor_Condition;
   information  = DIA_Rakus_BuyOrchunterArmor_Info;
   permanent	= TRUE;
   description	= "Chc� kupi� pancerz �owcy ork�w.";
};

FUNC INT DIA_Rakus_BuyOrchunterArmor_Condition()
{
	if (kapitel >= 4) && (Npc_KnowsInfo (hero, DIA_Rakus_IWannaArmor)) && (rakus_sell_armor == false)
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Rakus_BuyOrchunterArmor_Info()
{
    AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_01"); //Czasy s� ju� chyba wystarczaj�co ci�kie. Nie s�dzisz?
    AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_02"); //Masz racj�. Ci�g�e zagro�enie ze strony Gomeza, napi�ta sytuacja pomi�dzy obozami... Ju� nawet orkowie zrobili si� bardo niespokojni. 
	AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_03"); //Chc� kupi� ten pancerz.
	AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_04"); //Cena si� nie zmieni�a: 3200 bry�ek rudy. Nie mog� nic spu�ci�. 
    if (Npc_HasItems (hero, ItMiNugget)>=3200)
    {
        AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_05"); //Oto twoja zap�ata. Daj mi to, za co zap�aci�em. 
        AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_06"); //Niech ci s�u�y.
        B_GiveInvItems (other, self, ItMiNugget, 3200);
		
		CreateInvItem		(hero, NON_ORCHUNTERARMOR_01);
	
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);

		DIA_Rakus_BuyOrchunterArmor.permanent = false;
		rakus_sell_armor = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_07"); //Nie ma rudy, nie ma pancerza.
		DIA_Rakus_BuyOrchunterArmor.permanent = true; 
    };
};

//========================================
//-----------------> QUEST1_RAKUS
//========================================

INSTANCE DIA_Rakus_QUEST1_RAKUS (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_QUEST1_RAKUS_Condition;
   information  = DIA_Rakus_QUEST1_RAKUS_Info;
   permanent	= FALSE;
   description	= "Szukam pracy.";
};

FUNC INT DIA_Rakus_QUEST1_RAKUS_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rakus_QUEST1_RAKUS_Info()
{
    AI_Output (other, self ,"DIA_Rakus_QUEST1_RAKUS_15_01"); //Szukam pracy.
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_02"); //Jest jedna rzecz dla cz�owieka z zewn�trz.
    AI_Output (other, self ,"DIA_Rakus_QUEST1_RAKUS_15_03"); //Co konkretnie?
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_04"); //Musisz odebra� dostaw� �ywno�ci od Wilka. To Najemnik mieszkaj�cy w Nowym Obozie.
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_05"); //Masz tu 400 bry�ek rudy jako zap�at� dla Wilka. My�l�, �e mo�na si� z nim potargowa�.
    MIS_DostawaLowcow = LOG_RUNNING;

    Log_CreateTopic            (CH1_DostawaLowcow, LOG_MISSION);
    Log_SetTopicStatus       (CH1_DostawaLowcow, LOG_RUNNING);
    B_LogEntry                     (CH1_DostawaLowcow,"Rakus zleci� mi przyniesienie dostawy �ywno�ci od Wilka. Mog� si� z nim potargowa�. ");

    CreateInvItems (self, ItMiNugget, 400);
    B_GiveInvItems (self, other, ItMiNugget, 400);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Rakus_DOSTAWA_Q1 (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_DOSTAWA_Q1_Condition;
   information  = DIA_Rakus_DOSTAWA_Q1_Info;
   permanent	= FALSE;
   description	= "Mam wasz� �ywno��.";
};

FUNC INT DIA_Rakus_DOSTAWA_Q1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_DOSTAWA_LOWCOW))
    && (Npc_HasItems (other, foodlowcow) >=1)
    && (MIS_DostawaLowcow == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rakus_DOSTAWA_Q1_Info()
{
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_01"); //Mam wasz� �ywno��.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_02"); //No nareszcie.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_03"); //Wielkie dzi�ki. To z pewno�ci� pomo�e nam przetrwa� kolejne dni.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_04"); //Ko�czy nam si� ruda, a zbli�a si� zima. B�dzie ci�ko z dostawami. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_05"); //Chyba trzeba znale�� jakie� �owne miejsce pe�ne zwierzyny.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_06"); //Przecie� polujecie na ork�w. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_07"); //Niby tak, ale oni nie s� zbyt smaczni.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_08"); //Chcesz powiedzie�, �e pr�bowa�e�? 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_09"); //Ech...
	AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_10"); //Mog�em nie pyta�...
    B_LogEntry                     (CH1_DostawaLowcow,"Rakus otrzyma� dostaw�. Zadanie wykonane. ");
    Log_SetTopicStatus       (CH1_DostawaLowcow, LOG_SUCCESS);
    MIS_DostawaLowcow = LOG_SUCCESS;
	B_GiveInvItems (other, self, foodlowcow, 1);
    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

