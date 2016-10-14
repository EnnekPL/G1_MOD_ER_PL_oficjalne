//*************************************************** MERDARION ! ******************************************************************************************************************
// ************************ EXIT **************************

instance  Info_Merdarion_EXIT (C_INFO)
{
	npc			= KDW_602_Merdarion;
	nr			= 999;
	condition	= Info_Merdarion_EXIT_Condition;
	information	= Info_Merdarion_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Quest
//========================================

INSTANCE DIA_Merdarion_Quest (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_Quest_Condition;
   information  = DIA_Merdarion_Quest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Merdarion_Quest_Condition()
{
    if (Kapitel >= 4) && ( (Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_KDW) ) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_Quest_Info()
{
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_01"); //Stój!
    AI_Output (other, self ,"DIA_Merdarion_Quest_15_02"); //Co siê dzieje?!
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_03"); //Mam dla ciebie bardzo wa¿ne zadanie.
    AI_Output (other, self ,"DIA_Merdarion_Quest_15_04"); //O co chodzi?
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_05"); //Przeszukuj¹c stare ksiêgi, znalaz³em historiê pewnego szlachcica zamieszkuj¹cego te ziemie. 
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_06"); //Bogacz chcia³ zagrabiæ tereny nale¿¹ce do innych Magnatów.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_07"); //Kaza³ wiêc swemu magowi rzuciæ na nich kl¹twê. Jednak mag po pewnym czasie mia³ wyrzuty sumienia. Chcia³ odwróciæ czar.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_08"); //Szlachcic szybko to wyczu³ i sam rzuci³ kl¹twê na zdradliwego maga.
    AI_Output (other, self ,"DIA_Merdarion_Quest_15_09"); //Co to ma wspólnego ze mn¹?
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_10"); //Daj mi dokoñczyæ.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_11"); //Kl¹twa powodowa³a wieczny ob³êd u wszystkich, których dotknê³a. Prawdopodobnie nieumar³e cia³a Magnatów i maga wci¹¿ s¹ w Kolonii.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_12"); //Ich si³a roœnie z ka¿dym dniem i mo¿e siê wymkn¹æ spod kontroli. Ju¿ teraz odczuwam coraz to wiêksze zaburzenia mocy. 
	AI_Output (self, other ,"DIA_Merdarion_Quest_03_13"); //Gdzieœ w Kolonii rodz¹ siê oœrodki mrocznej magii, które przy okazji wp³ywaj¹ na przeklêtych. 
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_14"); //Musisz uwolniæ ich od wiecznej kl¹twy, nim siê zbudz¹ i w pe³ni nabior¹ si³. Ob³êdni genera³owie armii nieumar³ych... Ca³kiem prawdopodobny scenariusz. 
    AI_Output (other, self ,"DIA_Merdarion_Quest_15_15"); //Gdzie mam ich szukaæ?
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_16"); //Rycerza Teodrika znajdziesz w starej latarni morskiej. Nazywano ja Wie¿¹ Mgie³.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_17"); //Rycerz Armand spoczywa w jaskini przy zamku swego pana. Z kolei mag Mertinos zajmuje stary Klasztor.
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_18"); //Wystarczy, ¿e ich pokonasz, ale uwa¿aj, bo to nie bêd¹ ³atwe pojedynki. 
    AI_Output (self, other ,"DIA_Merdarion_Quest_03_19"); //WeŸ ze sob¹ te zwoje i mikstury. W ksiêdze znalaz³em te¿ przepis na klucz. Widocznie jeden z nieumar³ych jest zamkniêty. 
	AI_Output (self, other ,"DIA_Merdarion_Quest_03_20"); //Skryba, który sporz¹dzi³ te notatki mia³ plan zabiæ o¿ywieñców. Niestety, chyba mu siê nie uda³o. 
	AI_Output (self, other ,"DIA_Merdarion_Quest_03_21"); //Tutejsi Szkodnicy z ³atwoœci¹ odtworzyli ten klucz wed³ug przepisu. Zatrzymaj go.
    MIS_ThreeLords = LOG_RUNNING;
	Wld_InsertNpc				(NONE_DarkLord_Castle,"LORD3");	
	B_SetPermAttitude			(NONE_DarkLord_Castle,	ATT_HOSTILE);
	Wld_InsertNpc				(NONE_DarkLord_Monestry,"LORD1"); //ten ma dialog
	Wld_InsertNpc				(NONE_DarkLord_Tower,"LORD2");	
	B_SetPermAttitude			(NONE_DarkLord_Tower,	ATT_HOSTILE);
	CreateInvItems (self, It_KeyLord, 1);
    B_GiveInvItems (self, other, It_KeyLord, 1);
    Log_CreateTopic            (CH4_ThreeLords, LOG_MISSION);
    Log_SetTopicStatus       (CH4_ThreeLords, LOG_RUNNING);
    B_LogEntry                     (CH4_ThreeLords,"Merdarion kaza³ mi odnaleŸæ i zlikwidowaæ nieumar³ych rycerzy i nieumar³ego maga. Teodrika znajdê w starej latarni morskiej, Armanda w jaskini przy Górskiej Fortecy, a Mertinosa w starym Klasztorze Zmiennokszta³tnych.");
    CreateInvItems (self, ItFo_Potion_Mana_01, 5);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_01, 5);
    CreateInvItems (self, ItFo_Potion_Health_01, 10);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 10);
    CreateInvItems (self, ItArScrollFireball, 5);
    B_GiveInvItems (self, other, ItArScrollFireball, 5);
    CreateInvItems (self, ItArScrollIceCube, 5);
    B_GiveInvItems (self, other, ItArScrollIceCube, 5);
};
//========================================
//-----------------> SzlachtaPadla
//========================================

INSTANCE DIA_Merdarion_SzlachtaPadla (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_SzlachtaPadla_Condition;
   information  = DIA_Merdarion_SzlachtaPadla_Info;
   permanent	= FALSE;
   description	= "Dusze Magnatów s¹ wolne.";
};

FUNC INT DIA_Merdarion_SzlachtaPadla_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NONE_DarkLord_Castle);
    var C_NPC whodie1; 	whodie1 = Hlp_GetNpc(NONE_DarkLord_Monestry);
    var C_NPC whodie2; 	whodie2 = Hlp_GetNpc(NONE_DarkLord_Tower);
    if (MIS_ThreeLords == LOG_RUNNING)
    && (Npc_IsDead(whodie0))
    && (Npc_IsDead(whodie1))
    && (Npc_IsDead(whodie2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_SzlachtaPadla_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_SzlachtaPadla_15_01"); //Dusze Magnatów s¹ wolne.
    AI_Output (self, other ,"DIA_Merdarion_SzlachtaPadla_03_02"); //Naprawdê uda³o ci siê tego dokonaæ?
    AI_Output (other, self ,"DIA_Merdarion_SzlachtaPadla_15_03"); //Tak. Uwolni³em ich od mêczarni.
    AI_Output (other, self ,"DIA_Merdarion_SzlachtaPadla_15_04"); //Wszyscy byli we wskazanych przez ciebie miejscach.
    AI_Output (self, other ,"DIA_Merdarion_SzlachtaPadla_03_05"); //Œwietnie. Nieprzyjaciel straci³ sojuszników.
    AI_Output (self, other ,"DIA_Merdarion_SzlachtaPadla_03_06"); //WeŸ w nagrodê te eliksiry.
    CreateInvItems (self, ItFo_Potion_Mana_03, 5);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_03, 5);
    CreateInvItems (self, ItFo_Potion_Health_03, 5);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 5);
    CreateInvItems (self, ItFo_Potion_Strength_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Strength_01, 1);
    B_LogEntry                     (CH4_ThreeLords,"Uda³o mi siê zg³adziæ nieumar³ych Magnatów, uwalniaj¹c ich przy tym od kl¹twy.");
    Log_SetTopicStatus       (CH4_ThreeLords, LOG_SUCCESS);
    MIS_ThreeLords = LOG_SUCCESS;

    B_GiveXP (750);
};

//========================================
//-----------------> MieczTokasa
//========================================

INSTANCE DIA_Merdarion_MieczTokasa (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_MieczTokasa_Condition;
   information  = DIA_Merdarion_MieczTokasa_Info;
   permanent	= FALSE;
   description	= "Ponoæ znasz siê na zaklêtych mieczach.";
};

FUNC INT DIA_Merdarion_MieczTokasa_Condition()
{
    if (MerdarionTalk_Sword == true)
    && (Npc_HasItems (other, Tokas_Sword) >=1)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_MieczTokasa_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_01"); //Ponoæ znasz siê na zaklêtych mieczach.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_02"); //Hmm? Czego chcesz?
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_03"); //Mam tutaj miecz, który skazuje ka¿dego kto od niego zginie na wieczn¹ tu³aczkê.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_04"); //Niestety broñ trafi³a w rêce œwira z Sekty, a ofiar¹ miecza sta³ siê myœliwy Biorn.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_05"); //Chcê zniszczyæ ten orê¿, aby uwolniæ Biorna od kl¹twy. 
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_06"); //Ju¿ rozumiem. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_07"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_08"); //Skoro to takie wa¿ne, dokonam rytua³u oczyszczenia miecza, ale potrzebujê...
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_09"); //...o³tarza oczyszczenia. Mam go znaleŸæ?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_10"); //Widzê, ¿e coœ ju¿ wiesz. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_11"); //Jak ma wygl¹daæ ten o³tarz?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_12"); //Orkowie wykorzystywali go podczas ceremonii pogrzebowych.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_13"); //To dok³adnie ociosany kamienny blok otoczony znakami runicznymi.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_14"); //W¹tpiê, abyœ znalaz³ coœ takiego w Kolonii. Nawet na Ziemiach Orków.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Bez o³tarza oczyszczenia mogê zapomnieæ o zniszczeniu miecza. Mo¿e gdzieœ w Górniczej Dolinie uda mi siê znaleŸæ coœ takiego. Ponoæ bez walki z orkami siê nie obejdzie...");
	finf_olt = true;
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Find
//========================================

INSTANCE DIA_Merdarion_Find (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_Find_Condition;
   information  = DIA_Merdarion_Find_Info;
   permanent	= FALSE;
   description	= "Znalaz³em o³tarz.";
};

FUNC INT DIA_Merdarion_Find_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_MieczTokasa))
    && (oltarzLOC == true)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_Find_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_Find_15_01"); //Znalaz³em o³tarz.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_02"); //Doprawdy? Na pewno nie pomyli³eœ go z niczym innym.
    AI_Output (other, self ,"DIA_Merdarion_Find_15_03"); //Nie, to na pewno o³tarz. Znajduje siê w pobli¿u Cmentarzyska Orków. 
    AI_Output (other, self ,"DIA_Merdarion_Find_15_04"); //Id¹c do Bractwa nale¿y skrêciæ w kierunku gór, ale nieznacznie, po czym przejœæ przez most.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_05"); //No dobrze. Postaram siê przybyæ tam jak najszybciej. 
    AI_Output (self, other ,"DIA_Merdarion_Find_03_06"); //Spotkamy siê na miejscu.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Mam siê spotkaæ z Merdarionem przy o³tarzu. ");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
	AI_Teleport                    (KDW_602_Merdarion,"OLTARZ_OCZYSZCZENIA"); 
	Npc_ExchangeRoutine (KDW_602_Merdarion,"rytual");
};
//========================================
//-----------------> RytualOczyszczenia
//========================================

INSTANCE DIA_Merdarion_RytualOczyszczenia (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_RytualOczyszczenia_Condition;
   information  = DIA_Merdarion_RytualOczyszczenia_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Merdarion_RytualOczyszczenia_Condition()
{
    if (Npc_GetDistToWP (self, "OLTARZ_OCZYSZCZENIA") < 500)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
	&& (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_RytualOczyszczenia_Info()
{
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_01"); //Œwietnie. Mo¿emy zaczynaæ.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_02"); //Jesteœ pewien, ¿e chcesz oczyœciæ to ostrze?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_03"); //Oczyœciæ? Myœla³em, ¿e chcemy je zniszczyæ!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_04"); //Myœlê, ¿e to nie bêdzie konieczne. Pieczêæ na klindze odpowiada za kl¹twê.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_05"); //Ostrze bêdziesz móg³ zachowaæ. Bêdzie jednak trochê s³absze. 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_06"); //Jesteœ pewien, ¿e chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_07"); //A co je¿eli chcê to prze³o¿yæ?
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_08"); //Myœlisz, ¿e bêdziesz mi zawraca³ g³owê kiedy ci siê spodoba? 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_09"); //Wybieraj. 

    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Oczyœæ ostrze!", DIA_Merdarion_RytualOczyszczenia_Clear);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Rozmyœli³em siê. Wracaj do Obozu.", DIA_Merdarion_RytualOczyszczenia_Pozostaw);
};

FUNC VOID DIA_Merdarion_RytualOczyszczenia_Clear()
{
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Clear_15_01"); //Oczyœæ ostrze!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_02"); //W porz¹dku!
	AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_03"); //Oto oczyszczona broñ.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Rytua³ oczyszczenia miecza dobieg³ koñca. Ciekawe co z Biornem...");
	B_GiveInvItems (other, self, Tokas_Sword, 1);
	Npc_RemoveInvItems (KDW_602_Merdarion, Tokas_Sword, 1);
	CreateInvItems (self, Cleared_Tokas_Sword, 1);
    B_GiveInvItems (self, other, Cleared_Tokas_Sword, 1);
	Npc_ExchangeRoutine (KDW_602_Merdarion,"start");
	SwordClear = true;
    B_GiveXP (250);
    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Merdarion_RytualOczyszczenia_Pozostaw()
{
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_15_01"); //Rozmyœli³em siê. Wracaj do Obozu.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_03_02"); //Drugiej szansy ju¿ nie bêdzie.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Zachowa³em miecz dla siebie. Jedna dusza nie jest warta utraty tak potê¿nej broni. ");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_FAILED);
    MIS_NieSpelnionaZemsta = LOG_FAILED;
    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> INFOS_PODST
//========================================

INSTANCE DIA_Merdarion_INFOS_PODST (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_INFOS_PODST_Condition;
   information  = DIA_Merdarion_INFOS_PODST_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Merdarion_INFOS_PODST_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Merdarion_INFOS_PODST_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_INFOS_PODST_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Merdarion_INFOS_PODST_03_02"); //Nazywam siê Merdarion, Mag Wody oraz mistrz teleportacji. W czym mogê ci pomóc?
};

//========================================
//-----------------> TELEPORT_INFOS
//========================================

INSTANCE DIA_Merdarion_TELEPORT_INFOS (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 2;
   condition    = DIA_Merdarion_TELEPORT_INFOS_Condition;
   information  = DIA_Merdarion_TELEPORT_INFOS_Info;
   permanent	= FALSE;
   description	= "Interesujê mnie kwestia teleportacji.";
};

FUNC INT DIA_Merdarion_TELEPORT_INFOS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_INFOS_PODST)) && InfoManager_HasFinished()
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_TELEPORT_INFOS_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_TELEPORT_INFOS_15_01"); //Interesuje mnie kwestia teleportacji.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_02"); //Heh, no có¿... Jeœli chcesz korzystaæ z tej dziedziny magii, powinieneœ wyposa¿yæ siê w runy teleportacji.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_03"); //Mog¹ nimi w³adaæ jednak tylko zas³u¿eni cz³onkowie danej spo³ecznoœci. Wiem o istnieniu trzech run dzia³aj¹cych na terenie Kolonii.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_04"); //Runa teleportacji do obozu na bagnie zosta³a utworzona przez samego mistrza Y'Beriona, który by³ jej posiadaczem. 
	AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_05"); //Jednak podejrzewam, ¿e mieli te¿ do niej dostêp Cor Kalom i Cor Angar.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_06"); //Runê teleportacji do Nowego Obozu wytworzy³em ja. Odda³em j¹ Saturasowi. 
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_07"); //Natomiast przenosz¹ca do Starego Obozu zaginê³a lata temu. Zdaje siê, ¿e w jej posiadaniu by³ Xardas, który opuœci³ Kr¹g Ognia.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_08"); //Nie wykluczam tak¿e wystêpowania innych run teleportacji na terenie Górniczej Doliny.
};

//========================================
//-----------------> OTHER_TELE
//========================================

INSTANCE DIA_Merdarion_OTHER_TELE (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 3;
   condition    = DIA_Merdarion_OTHER_TELE_Condition;
   information  = DIA_Merdarion_OTHER_TELE_Info;
   permanent	= FALSE;
   description	= "Czy istniej¹ jeszcze jakieœ inne sposoby teleportacji?";
};

FUNC INT DIA_Merdarion_OTHER_TELE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_TELEPORT_INFOS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_OTHER_TELE_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_01"); //Czy istniej¹ jeszcze jakieœ inne sposoby teleportacji?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_02"); //Tak, gdy tworzyliœmy Magiczn¹ Barierê u¿ywaliœmy platform teleportacyjnych, znajduj¹cych siê w miejscach jej tworzenia. Zdaje siê, ¿e by³o ich piêæ.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_03"); //Platformy znajdowa³y siê w Górskiej Fortecy, ruinach Klasztoru Zmiennokszta³tnych, w Kanionie Trolli, przy kamiennym krêgu na Ziemiach Orków...
	AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_04"); //...oraz na szczycie œwi¹tynnego wzgórza po³o¿onego nad dzisiejszym Bractwem Œni¹cego.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_05"); //Po tym jak Bariera powsta³a, zdezaktywowaliœmy platformy.
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_06"); //Myœlisz, ¿e takie platformy mog¹ znajdowaæ siê tak¿e poza Górnicz¹ Dolin¹?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_07"); //Wydaje mi siê, ¿e tak. Pochodz¹ one z pradawnych czasów, wiêc mog¹ byæ rozsiane po ca³ej wyspie Khorinis. Jeœli uda nam siê obaliæ Barierê, z pewnoœci¹ ich poszukam. 
};

