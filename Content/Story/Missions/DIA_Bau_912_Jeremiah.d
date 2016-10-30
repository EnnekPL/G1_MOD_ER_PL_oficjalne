//poprawione i sprawdzone - Nocturn

// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Co robisz?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowuj� ry��wk�, ch�opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Prosz� - we� sobie jedn� butelk�. Tylko nie m�w Silasowi.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Jak idzie destylacja?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak idzie destylacja?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad��am z zam�wieniami. Ci to potrafi� wypi�!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na r�k�. Przynajmniej psy Ry�owego Ksi�cia zostawiaj� mnie w spokoju.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj� s�abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, kt�ra mog�aby si� mu przeciwstawi� to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S�ysza�em, jak kiedy� powiedzia�, �e ma ochot� pogruchota� Ksi�ciu ko�ci, ale tak naprawd� nigdy by tego nie zrobi�.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by�o wbrew jego zasadom.
};

//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_Jeremiah_HelpMe (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_HelpMe_Condition;
   information  = DIA_Jeremiah_HelpMe_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� twojego specjalnego trunku.";
};

FUNC INT DIA_Jeremiah_HelpMe_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebuj� twojego specjalnego trunku.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //Podobno na polach ry�owych zrobi� si� niez�y ba�agan.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Tak, nikt nie pracuje.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //To jak b�dzie z tym 'specja�em'? Chcia�em pocz�stowa� kilku 'koleg�w'...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Ch�tnie bym pom�g�, ale Najemnicy regularnie sprawdzaj�, czy nie da�em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj� ka�d� bry�k� zysku. Licz� butelki... Je�li ci pomog�, zostan� ukarany.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //A gdybym zap�aci�?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Wtedy nie by�oby problemu. M�g�bym ci da� 12 butelek za 240 bry�ek rudy.
	
    B_LogEntry                     (CH1_BuntZbieraczy,"B�d� musia� zap�aci� Jeremiaszowi za alkohol. Najemnicy skrupulatnie podliczaj� ka�d� wyprodukowan� przez niego butelk�.");
};

//========================================
//-----------------> BoughtAlco
//========================================

INSTANCE DIA_Jeremiah_BoughtAlco (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_BoughtAlco_Condition;
   information  = DIA_Jeremiah_BoughtAlco_Info;
   permanent	= 0;
   description	= "Daj mi ten trunek.";
};

FUNC INT DIA_Jeremiah_BoughtAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_HelpMe))  
    && (Quest_GetAlcoForBandits == LOG_RUNNING)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItMiNugget)>=240)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_BoughtAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_BoughtAlco_15_01"); //Daj mi ten trunek.
    AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Prosz� bardzo.
    CreateInvItems (self, ItMi_SpecialBooze, 12);
    B_GiveInvItems (self, other, ItMi_SpecialBooze, 12);
    B_GiveInvItems (other, self, ItMiNugget, 240);
    
    B_LogEntry     (CH1_BuntZbieraczy,"Dosta�em od Jeremiasza kilka butelek jego specjalnego trunku. Lewusa i jego ludzi mamy ju� w gar�ci.");
};

//========================================
//-----------------> MOCNA_WODA
//========================================

INSTANCE DIA_Jeremiah_MOCNA_WODA (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_MOCNA_WODA_Condition;
   information  = DIA_Jeremiah_MOCNA_WODA_Info;
   permanent	= FALSE;
   description	= "Potrafisz przyrz�dzi� jaki� specjalny trunek?";
};

FUNC INT DIA_Jeremiah_MOCNA_WODA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_MOCNA_WODA_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_01"); //Potrafisz przyrz�dzi� jaki� specjalny trunek?
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_02"); //Specjalny? M�wisz o czym� znacznie lepszym od ry��wki?
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_03"); //Owszem.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_04"); //Znam pewien przepis, jednak nie posiadam wszystkich sk�adnik�w.
	//klasyg!
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_05"); //Cholera, znowu b�d� musia� biega� po ca�ej Kolonii.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_06"); //Spokojnie, wszystko mog� kupi� na miejscu, jednak potrzebuj� 50 bry�ek rudy.
	//log
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz mo�e przygotowa� specjalny nap�j alkoholowy, jednak potrzebuje 50 bry�ek rudy na sk�adniki.");
	//exp
    B_GiveXP (50);
};

//========================================
//-----------------> ORE_50
//========================================

INSTANCE DIA_Jeremiah_ORE_50 (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_ORE_50_Condition;
   information  = DIA_Jeremiah_ORE_50_Info;
   permanent	= FALSE;
   description	= "Oto 50 bry�ek rudy.";
};

FUNC INT DIA_Jeremiah_ORE_50_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_MOCNA_WODA))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_ORE_50_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_ORE_50_15_01"); //Oto 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Jeremiah_ORE_50_03_02"); //Wr�� jutro, przyrz�dzenie tego napoju mo�e zaj�� sporo czasu.
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz zajmie si� wszystkim. Nap�j powinien by� gotowy na jutro.");
	dzien_Jeremiash =	wld_getday();
	B_GiveInvItems (other, self, ItMiNugget, 50);
};

//========================================
//-----------------> WODA_TROLO
//========================================

INSTANCE DIA_Jeremiah_WODA_TROLO (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 3;
   condition    = DIA_Jeremiah_WODA_TROLO_Condition;
   information  = DIA_Jeremiah_WODA_TROLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jeremiah_WODA_TROLO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_ORE_50))
    && (dzien_Jeremiash != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_WODA_TROLO_Info()
{
    AI_Output (self, other ,"DIA_Jeremiah_WODA_TROLO_03_01"); //Pracowa�em przez wi�kszo�� nocy, ale przeszed�em samego siebie. Ten trunek to po prostu raj zamkni�ty w butelce. Oto nap�j. Uwa�aj na niego, jest wart fortun�.
    B_LogEntry                     (CH1_SzponyTopielca,"Ten nap�j wygl�da smakowicie... Lepiej udam si� od razu do Bartholo. Mam nadziej�, �e przypadnie mu do gustu.");
	CreateInvItems (self, JeremiahMoonshine, 1);
    B_GiveInvItems (self, other, JeremiahMoonshine, 1);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};