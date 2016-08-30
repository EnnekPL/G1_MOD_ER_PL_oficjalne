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
   description	= "Potrzebuj� alkoholu.";
};

FUNC INT DIA_Jeremiah_HelpMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6))
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebuj� alkoholu.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //To sobie kup!
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Nie, nie dla siebie.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //Zbieracze planuj� bunt. Chcemy potajemnie w nocy zabi� Lewusa i Ry�owego Ksi�cia.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_05"); //Potrzebujemy alkoholu, aby uprzednio ich upi�.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Ch�tnie bym pom�g�, ale Najemnicy regularnie sprawdzaj�, czy nie da�em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj� ka�d� bry�k� zysku. Licz� butelki...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_08"); //Nie mog� wam pom�c, inaczej zostan� ukarany!
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //Kt�rzy Najemnicy ci� rewiduj�?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Torlof, z polecenia Lee.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_11"); //Spr�buj� z nim porozmawia�.
	Jeremiah_AlcoGiv = false;
    B_LogEntry                     (CH1_BuntZbieraczy,"Jeremiasz nie wyda mi alkoholu, dop�ki nie za�atwi� problemu z Najemnikami, kt�rzy licz� wszystkie jego dochody. Je�li odda mi w�dk� za darmo, zostanie ukarany. W tym celu musz� pogada� z Torlofem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveMeSomeAlco
//========================================

INSTANCE DIA_Jeremiah_GiveMeSomeAlco (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_GiveMeSomeAlco_Condition;
   information  = DIA_Jeremiah_GiveMeSomeAlco_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Torlofem. Mo�esz mi da� kilka butelek.";
};

FUNC INT DIA_Jeremiah_GiveMeSomeAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_HelpMe))
    && (Jeremiah_AlcoGiv == true)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_GiveMeSomeAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_GiveMeSomeAlco_15_01"); //Rozmawia�em z Torlofem. Mo�esz mi da� kilka butelek.
    AI_Output (self, other ,"DIA_Jeremiah_GiveMeSomeAlco_03_02"); //Trzymaj. Ju� je uwarzy�em.
    AI_Output (self, other ,"DIA_Jeremiah_GiveMeSomeAlco_03_03"); //Tylko uwa�aj z tym. He he...
    AI_Output (other, self ,"DIA_Jeremiah_GiveMeSomeAlco_15_04"); //Spokojna g�owa.
	//log
    B_LogEntry                     (CH1_BuntZbieraczy,"Dosta�em od Jeremiasza kilka butelek czystego alkoholu. Lewusa i jego ludzi mamy ju� w gar�ci.");
	//items
    CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 12);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 12);
};

//========================================
//-----------------> BoughtAlco
//========================================

INSTANCE DIA_Jeremiah_BoughtAlco (C_INFO) //#todo: perm check
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_BoughtAlco_Condition;
   information  = DIA_Jeremiah_BoughtAlco_Info;
   permanent	= true;
   description	= "[Kup alkohol (100 bry�ek rudy)]";
};

FUNC INT DIA_Jeremiah_BoughtAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6))  
    && (If_BuyAlco_Jer == false)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_BoughtAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_BoughtAlco_15_01"); //Kupi� ten alkohol za swoj� rud�.
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
        AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Prosz� bardzo.
        CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 12);
        B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 12);
        B_GiveInvItems (other, self, ItMiNugget, 100);
        If_BuyAlco_Jer = true;
        B_LogEntry                     (CH1_BuntZbieraczy,"Dosta�em od Jeremiasza kilka butelek czystego alkoholu. Lewusa i jego ludzi mamy ju� w gar�ci.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_03"); //Nie widz� tu stu bry�ek. Pr�bujesz mnie oszuka�?
        If_BuyAlco_Jer = false;
    };
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