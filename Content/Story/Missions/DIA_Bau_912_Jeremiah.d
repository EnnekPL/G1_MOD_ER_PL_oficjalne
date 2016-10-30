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
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowujê ry¿ówkê, ch³opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Proszê - weŸ sobie jedn¹ butelkê. Tylko nie mów Silasowi.
	
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
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad¹¿am z zamówieniami. Ci to potrafi¹ wypiæ!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na rêkê. Przynajmniej psy Ry¿owego Ksiêcia zostawiaj¹ mnie w spokoju.
	
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
	description = "Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?";
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
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj¹ s³abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, która mog³aby siê mu przeciwstawiæ to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S³ysza³em, jak kiedyœ powiedzia³, ¿e ma ochotê pogruchotaæ Ksiêciu koœci, ale tak naprawdê nigdy by tego nie zrobi³.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by³o wbrew jego zasadom.
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
   description	= "Potrzebujê twojego specjalnego trunku.";
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
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebujê twojego specjalnego trunku.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //Podobno na polach ry¿owych zrobi³ siê niez³y ba³agan.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Tak, nikt nie pracuje.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //To jak bêdzie z tym 'specja³em'? Chcia³em poczêstowaæ kilku 'kolegów'...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Chêtnie bym pomóg³, ale Najemnicy regularnie sprawdzaj¹, czy nie da³em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj¹ ka¿d¹ bry³kê zysku. Licz¹ butelki... Jeœli ci pomogê, zostanê ukarany.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //A gdybym zap³aci³?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Wtedy nie by³oby problemu. Móg³bym ci daæ 12 butelek za 240 bry³ek rudy.
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Bêdê musia³ zap³aciæ Jeremiaszowi za alkohol. Najemnicy skrupulatnie podliczaj¹ ka¿d¹ wyprodukowan¹ przez niego butelkê.");
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
    AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Proszê bardzo.
    CreateInvItems (self, ItMi_SpecialBooze, 12);
    B_GiveInvItems (self, other, ItMi_SpecialBooze, 12);
    B_GiveInvItems (other, self, ItMiNugget, 240);
    
    B_LogEntry     (CH1_BuntZbieraczy,"Dosta³em od Jeremiasza kilka butelek jego specjalnego trunku. Lewusa i jego ludzi mamy ju¿ w garœci.");
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
   description	= "Potrafisz przyrz¹dziæ jakiœ specjalny trunek?";
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
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_01"); //Potrafisz przyrz¹dziæ jakiœ specjalny trunek?
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_02"); //Specjalny? Mówisz o czymœ znacznie lepszym od ry¿ówki?
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_03"); //Owszem.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_04"); //Znam pewien przepis, jednak nie posiadam wszystkich sk³adników.
	//klasyg!
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_05"); //Cholera, znowu bêdê musia³ biegaæ po ca³ej Kolonii.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_06"); //Spokojnie, wszystko mogê kupiæ na miejscu, jednak potrzebujê 50 bry³ek rudy.
	//log
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz mo¿e przygotowaæ specjalny napój alkoholowy, jednak potrzebuje 50 bry³ek rudy na sk³adniki.");
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
   description	= "Oto 50 bry³ek rudy.";
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
    AI_Output (other, self ,"DIA_Jeremiah_ORE_50_15_01"); //Oto 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jeremiah_ORE_50_03_02"); //Wróæ jutro, przyrz¹dzenie tego napoju mo¿e zaj¹æ sporo czasu.
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz zajmie siê wszystkim. Napój powinien byæ gotowy na jutro.");
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
    AI_Output (self, other ,"DIA_Jeremiah_WODA_TROLO_03_01"); //Pracowa³em przez wiêkszoœæ nocy, ale przeszed³em samego siebie. Ten trunek to po prostu raj zamkniêty w butelce. Oto napój. Uwa¿aj na niego, jest wart fortunê.
    B_LogEntry                     (CH1_SzponyTopielca,"Ten napój wygl¹da smakowicie... Lepiej udam siê od razu do Bartholo. Mam nadziejê, ¿e przypadnie mu do gustu.");
	CreateInvItems (self, JeremiahMoonshine, 1);
    B_GiveInvItems (self, other, JeremiahMoonshine, 1);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};