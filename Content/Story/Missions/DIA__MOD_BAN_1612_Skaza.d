// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Skaza_EXIT(C_INFO)
{
	npc             = BAN_1612_Skaza;
	nr              = 999;
	condition	= DIA_Skaza_EXIT_Condition;
	information	= DIA_Skaza_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Skaza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Skaza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Skaza
// Rozdzia³ 1
// Przyjêcie do Bandytów
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> SpyHelp
//========================================

INSTANCE DIA_Bandyta_SpyHelp (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 1;
   condition    = DIA_Bandyta_SpyHelp_Condition;
   information  = DIA_Bandyta_SpyHelp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_SpyHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_AboutSpy))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_SpyHelp_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_01"); //Hej, Ty!
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_15_02"); //Tak?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_03"); //Mam ci coœ do powiedzenia. WyjdŸmy na zewn¹trz.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_03_04"); //Tutaj œciany maj¹ uszy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_15_05"); //W porz¹dku, prowadŸ.
    Npc_ExchangeRoutine (self, "guide");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SpyHelp_NearCamp
//========================================

INSTANCE DIA_Bandyta_SpyHelp_NearCamp (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 2;
   condition    = DIA_Bandyta_SpyHelp_NearCamp_Condition;
   information  = DIA_Bandyta_SpyHelp_NearCamp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_SpyHelp_NearCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp))
    && (Npc_GetDistToWP (self, "OC_ROUND_27") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_03_01"); //Podobno interesujesz siê spraw¹ zdemaskowania Bandytów.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_03_02"); //Powiedz mi, jaki masz w tym interes?

    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "A co ci do tego? ", DIA_Bandyta_SpyHelp_NearCamp_CO_CI);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "Jesteœ Bandyt¹? Takim w przebraniu?", DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT);
    Info_AddChoice		(DIA_Bandyta_SpyHelp_NearCamp, "Pracujê dla Draxa. ", DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK);
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_CO_CI()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_CO_CI_15_01"); //A co ci do tego? 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_CO_CI_03_02"); //To, ¿e to bardzo wa¿ne. Gadaj!
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_01"); //Jesteœ Bandyt¹? Takim w przebraniu?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_02"); //Tak, dok³adnie tak. Pracujê dla Quentina.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_03"); //Dlaczego mi to mówisz? Sk¹d wiesz, ¿e nie pracujê dla Gomeza?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_04"); //To proste, je¿eli byœ pracowa³, nie zd¹¿y³byœ nawet dobiec do Obozu. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_05"); //Mogê ciê zabiæ w ka¿dej chwili, a moj¹ tajemnice zaniesiesz do grobu. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_06"); //Cieszê siê, ¿e trafi³em na swojego cz³owieka.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_07"); //Co?
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_08"); //Pracujê dla Draxa. Mam zbadaæ sprawê Obozu Bandytów. Konkretniej mam ustaliæ, co wiedz¹ Stra¿nicy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_09"); //Uda³o mi siê dowiedzieæ, ¿e szpiegiem jest Trip. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_10"); //Nie wyci¹gn¹³em jednak od niego nic konkretnego. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_11"); //Mam dla ciebie informacjê.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_12"); //Gdy Trip przyby³ do karczmy, pods³ucha³em pewn¹ rozmowê.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_13"); //Chwali³ siê karczmarzowi, ¿e sporz¹dzi³ specjalne notatki na bazie których Graham mia³ opracowaæ mapê wskazuj¹c¹ drogê do Obozu Bandytów.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_14"); //Mo¿esz uknuæ podstêp i powiedzieæ kartografowi Grahamowi, ¿e masz zanieœæ mapê i notatki do obozu przed kopalni¹.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_15"); //Powiedz, ¿e tamtejsi Stra¿nicy chc¹ rozpocz¹æ poszukiwania na w³asn¹ rêkê.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_16"); //Dlaczego mieliby chcieæ to zrobiæ?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_17"); //Bo Bandyci nieŸle zaszli im za skórê atakuj¹c konwoje z kopalni.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_18"); //I po tym wszystkim tak po prostu mi to odda?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_19"); //Oczywiœcie, ¿e nie. Musisz ubraæ siê wiarygodnie i mieæ specjalne pismo od Thorusa.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_03_20"); //Zakup spodnie Kopacza, a ja w miêdzyczasie podrobiê pismo.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_ARE_YOU_BANDIT_15_21"); //Œwietnie. W takim razie idê po spodnie.
    B_LogEntry                     (CH1_DraxTest,"Nareszcie jakieœ konkrety. Skaza poleci³ mi, bym powiedzia³ Grahamowi, ¿e mam zanieœæ mapê i notatki do obozu przed kopalni¹. W tym celu jednak powinienem kupiæ spodnie Kopacza. Skaza w miêdzyczasie podrobi pismo od Thorusa.");

    B_GiveXP (150);
    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK()
{
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_01"); //Pracujê dla Draxa. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_02"); //To masz dziœ szczêœcie. Gdybyœ powiedzia³ to komuœ nieodpowiedniemu, ju¿ gryz³byœ ziemiê.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_03"); //Spodziewa³em siê, ¿e jesteœ Bandyt¹.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_04"); //Powiem ci tak: w naszej pracy lepiej byæ ostro¿nym.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_05"); //Przeczucie mo¿e zawieœæ. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_06"); //PrzejdŸmy do konkretów.
	AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_08"); //Pracujê dla Draxa. Mam zbadaæ sprawê Obozu Bandytów. Konkretniej mam ustaliæ, co wiedz¹ Stra¿nicy.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_09"); //Uda³o mi siê ustaliæ, ¿e szpiegiem jest Trip. 
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_10"); //Nie wyci¹gn¹³em jednak od niego nic konkretnego. 
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_11"); //Mam dla ciebie informacjê.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_12"); //Gdy Trip przyby³ do karczmy, pods³ucha³em pewn¹ rozmowê.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_13"); //Chwali³ siê karczmarzowi, ¿e sporz¹dzi³ specjalne notatki na bazie których Graham mia³ opracowaæ mapê wskazuj¹c¹ drogê do Obozu Bandytów.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_14"); //Mo¿esz uknuæ podstêp i powiedzieæ kartografowi Grahamowi, ¿e masz zanieœæ mapê i notatki do obozu przed kopalni¹.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_15"); //Powiedz, ¿e tamtejsi Stra¿nicy chc¹ rozpocz¹æ poszukiwania na w³asn¹ rêkê.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_16"); //Dlaczego mieliby chcieæ to zrobiæ?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_17"); //Bo Bandyci nieŸle zaszli im za skórê atakuj¹c konwoje z kopalni.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_18"); //I po tym wszystkim tak po prostu mi to odda?
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_19"); //Oczywiœcie, ¿e nie. Musisz ubraæ siê wiarygodnie i mieæ specjalne pismo od Thorusa.
    AI_Output (self, other ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_03_20"); //Zakup spodnie Kopacza, a ja w miêdzyczasie podrobiê pismo.
    AI_Output (other, self ,"DIA_Bandyta_SpyHelp_NearCamp_DRAX_WORK_15_21"); //Œwietnie. W takim razie idê po spodnie.
    B_LogEntry                     (CH1_DraxTest,"Nareszcie jakieœ konkrety. Skaza poleci³ mi, bym powiedzia³em Grahamowi, ¿e mam zanieœæ mapê i notatki do obozu przed kopalni¹. W tym celu jednak powinienem kupiæ spodnie Kopacza. Skaza w miêdzyczasie podrobi pismo od Thorusa.");
    Info_ClearChoices		(DIA_Bandyta_SpyHelp_NearCamp);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BuddlerEQ
//========================================

INSTANCE DIA_Bandyta_BuddlerEQ (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 3;
   condition    = DIA_Bandyta_BuddlerEQ_Condition;
   information  = DIA_Bandyta_BuddlerEQ_Info;
   permanent	= FALSE;
   description	= "Mam spodnie Kopacza.";
};

FUNC INT DIA_Bandyta_BuddlerEQ_Condition()
{
	var C_Item obecny_pancerz;
	obecny_pancerz = Npc_GetEquippedArmor(hero);
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp)) && (MIS_DraxTest == LOG_RUNNING)
    //&& ((obecny_pancerz == VLK_ARMOR_L) || (obecny_pancerz == VLK_ARMOR_M) || (obecny_pancerz == VLK_ARMOR_H))
	&& ((Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_L)) ||  (Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_M)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_BuddlerEQ_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_BuddlerEQ_15_01"); //Mam spodnie Kopacza.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_02"); //Doskonale. Napisa³em ju¿ list.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_03"); //Proszê, weŸ go i zanieœ Grahamowi.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_04"); //Ja tymczasem wracam do karczmy goln¹æ sobie trochê ry¿ówki.
    AI_Output (other, self ,"DIA_Bandyta_BuddlerEQ_15_05"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Bandyta_BuddlerEQ_03_06"); //Mam nadzieje, ¿e jeszcze siê spotkamy.
    B_LogEntry                     (CH1_DraxTest,"Mam podrobiony list Thorusa. W takim razie czas za³o¿yæ spodnie i iœæ do Grahama.");

    B_GiveXP (125);
    CreateInvItems (self, ItMis_Thorus_Safe_conduct, 1);
    B_GiveInvItems (self, other, ItMis_Thorus_Safe_conduct, 1);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Bandyta_HELLO5 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 5;
   condition    = DIA_Bandyta_HELLO5_Condition;
   information  = DIA_Bandyta_HELLO5_Info;
   permanent	= FALSE;
   description	= "Dlaczego nosisz strój Szkodnika?";
};

FUNC INT DIA_Bandyta_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO5_15_01"); //Dlaczego nosisz strój Szkodnika?
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_02"); //Nie rozumiesz?! Nie mog¹ mnie rozpoznaæ.
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_03"); //Tylko kilka osób wie, kim naprawdê jestem. 
    AI_Output (self, other ,"DIA_Bandyta_HELLO5_03_04"); //Muszê zachowaæ œrodki ostro¿noœci, inaczej Stra¿nicy bêd¹ mnie torturowaæ!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Bandyta_HELLO4 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 4;
   condition    = DIA_Bandyta_HELLO4_Condition;
   information  = DIA_Bandyta_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto dowodzi waszym Obozem?";
};

FUNC INT DIA_Bandyta_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_SpyHelp_NearCamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO4_15_01"); //Kto dowodzi waszym Obozem?
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_02"); //Quentin, to najtwardszy z Bandytów.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_03"); //Sporo prze¿y³ w Kolonii, a wczeœniej podobno zadawa³ siê z piratami.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_04"); //Du¿e wp³ywy ma tak¿e Doyle i Rocky.
    AI_Output (self, other ,"DIA_Bandyta_HELLO4_03_05"); //Warto mieæ z nimi dobre stosunki.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Skaza
// Rozdzia³ 1
// Wieœci od Skazy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAPORT
//========================================

INSTANCE DIA_Skaza_RAPORT (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 5;
   condition    = DIA_Skaza_RAPORT_Condition;
   information  = DIA_Skaza_RAPORT_Info;
   permanent	= FALSE;
   description	= "Przyszed³em po raport.";
};

FUNC INT DIA_Skaza_RAPORT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_WORKFLOW))
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_RAPORT_Info()
{
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_01"); //Przyszed³em po raport.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_02"); //Kto ciê przysy³a?
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_03"); //Drax. Mówi³ te¿, ¿e masz jakieœ problemy.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_04"); //Widzê, ¿e nie oszczêdza ¿ó³todziobów. Zaraz siê za wszystko zabierzemy.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_05"); //WprowadŸ mnie w szczegó³y. 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_06"); //Kilku ludzi zaczê³o snuæ podejrzenia i wêszyæ wokó³ mojej osoby. A to tylko dlatego, ¿e wiem o grzeszkach dwóch doœæ wp³ywowych Cieni. 
	AI_Output (self, other ,"DIA_Skaza_RAPORT_03_07"); //Uwa¿aj¹ mnie za zagro¿enie i za wszelk¹ cenê chc¹ zdemaskowaæ. Musimy coœ z nimi zrobiæ. 
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_08"); //O kogo konkretnie chodzi?
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_09"); //O Œwistaka i Z³ego. Wiem o nich bardzo wiele.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_10"); //Co na przyk³ad? 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_11"); //Œwistak ukrad³ wiele rzeczy Magnatom. Myœlisz, ¿e sk¹d ma tyle rudy i spodnie którymi handluje? 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_12"); //Kosztownoœci sprzedawa³ rozbójnikom w zamian za rudê. Wiem, ¿e brzmi to dziwnie, ale to prawda. Poœredniczy³em kilka lat temu w tym procederze. 
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_13"); //A Z³y?
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_14"); //O tym, ¿e Z³y zabi³ Neka wie ju¿ ca³y Obóz. Popytaj Kopaczy mieszkaj¹cych niedaleko chaty Z³ego, a sam siê dowiesz. Tego zabójstwa równie¿ by³em œwiadkiem.
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_25"); //Gdyby uda³o ci siê wtr¹ciæ ich do lochów, mia³bym trochê spokoju. 
    AI_Output (self, other ,"DIA_Skaza_RAPORT_03_26"); //Musisz znaleŸæ na nich dowody. Niestety moje poœwiadczenia na nic siê tu nie zdadz¹. Thorus nie ufa ludziom takim jak ja czy Mordrag.
    AI_Output (other, self ,"DIA_Skaza_RAPORT_15_27"); //Spróbujê coœ wykombinowaæ. Od czego mam zacz¹æ?
    AI_Output (self, other ,"DIA_Skaza_GOOOO_03_02"); //Proponujê, ¿ebyœ pogada³ z Bartholo. To on opiekuje siê rzeczami Magnatów.
    AI_Output (other, self ,"DIA_Skaza_GOOOO_15_03"); //Mo¿e nie zauwa¿y³eœ, ale nie mogê wejœæ do zamku...
    AI_Output (self, other ,"DIA_Skaza_GOOOO_03_04"); //Dogadaj siê z jak¹œ wp³ywow¹ osob¹ w Obozie. Mo¿e ktoœ ci pomo¿e?
	AI_Output (self, other ,"DIA_Skaza_GOOOO_03_05"); //Poci¹gnij te¿ za jêzyk Kopaczy mieszkaj¹cych w okolicach chaty Z³ego. 
	
    B_LogEntry                     (CH1_NewsFromSpy,"Zanim dostanê raport, muszê pomóc Skazie z jego k³opotami w obozie.");
	
    MIS_SpysProblems = LOG_RUNNING;
    Log_CreateTopic          (CH1_SpysProblems, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SpysProblems, LOG_RUNNING);
    B_LogEntry               (CH1_SpysProblems,"Skaza kaza³ mi znaleŸæ dowody na to, ¿e Z³y zabi³ Neka, a Œwistak okrad³ Magnatów. Kopacze mieszkaj¹cy w pobli¿u chaty Z³ego powinni wiedzieæ coœ wiêcej o zabójstwie. O kradzie¿y natomiast dowiem siê od Bartholo, jednak muszê jakoœ za³atwiæ sobie spotkanie z tym Magnatem.");
};

//========================================
//-----------------> PART1
//========================================

INSTANCE DIA_Skaza_PART1 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 8;
   condition    = DIA_Skaza_PART1_Condition;
   information  = DIA_Skaza_PART1_Info;
   permanent	= FALSE;
   description	= "Za³atwi³em sprawê ze Œwistakiem.";
};

FUNC INT DIA_Skaza_PART1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_DOWODY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_PART1_Info()
{
    AI_Output (other, self ,"DIA_Skaza_PART1_15_01"); //Za³atwi³em sprawê ze Œwistakiem.
    AI_Output (self, other ,"DIA_Skaza_PART1_03_02"); //Jak posz³o?
	AI_Output (other, self ,"DIA_Skaza_PART1_15_03"); //Dowiedzia³em siê od Bartholo, co zosta³o skradzione, a póŸniej zacz¹³em szukaæ tych rzeczy w chacie Œwistaka.
	AI_Output (other, self ,"DIA_Skaza_PART1_15_04"); //Uda³o mi siê znaleŸæ kilka przedmiotów zgodnych z opisami Magnata. Pos³u¿y³y mi one za dowody.
	AI_Output (self, other ,"DIA_Skaza_PART1_03_05"); //Cholera, zaskakujesz mnie.
};

//========================================
//-----------------> PART2
//========================================

INSTANCE DIA_Skaza_PART2 (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 9;
   condition    = DIA_Skaza_PART2_Condition;
   information  = DIA_Skaza_PART2_Info;
   permanent	= FALSE;
   description	= "Z³y ju¿ nie bêdzie ci przeszkadza³.";
};

FUNC INT DIA_Skaza_PART2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_ICHTROJE))
    && (MIS_SpysProblems == LOG_RUNNING)    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_PART2_Info()
{
    AI_Output (other, self ,"DIA_Skaza_PART2_15_01"); //Z³y ju¿ nie bêdzie ci przeszkadza³.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_02"); //Uda³o ci siê znaleŸæ na niego dowody?
    AI_Output (other, self ,"DIA_Skaza_PART2_15_03"); //Tak. O jego wystêpku wiedzia³a dosyæ du¿a liczba Kopaczy. Jednak byli oni szanta¿owani przez siepaczy Cienia.
    AI_Output (other, self ,"DIA_Skaza_PART2_15_04"); //Pozby³em siê ochroniarzy Z³ego i wtedy zaczêli mówiæ.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_05"); //Œwietnie to sobie wykombinowa³eœ.
    AI_Output (self, other ,"DIA_Skaza_PART2_03_06"); //Moim zdaniem zas³ugujesz ju¿ na miano Bandyty.
	HeroKnowsSlyKillNek = true;
};

//========================================
//-----------------> LIFEBANDITOS
//========================================

INSTANCE DIA_Skaza_LIFEBANDITOS (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 10;
   condition    = DIA_Skaza_LIFEBANDITOS_Condition;
   information  = DIA_Skaza_LIFEBANDITOS_Info;
   permanent	= FALSE;
   description	= "Co wiesz o ¿yciu Bandytów?";
};

FUNC INT DIA_Skaza_LIFEBANDITOS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_PART2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_LIFEBANDITOS_Info()
{
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_01"); //Co wiesz o ¿yciu Bandytów?
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_02"); //Jest ciê¿kie. Dla nich liczy siê ka¿da bry³ka. To najbiedniejszy z Obozów.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_03"); //Jaki jest ich cel w Kolonii?
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_04"); //Wiêkszoœæ Bandytów to uciekinierzy z Nowego Obozu.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_05"); //Ich celem jest po prostu prze¿yæ, a przy okazji wzbogaciæ siê solidnie.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_06"); //Nie rozumiem po co komuœ maj¹tek w Kolonii.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_07"); //To proste. ¯eby godnie ¿yæ. Nawet w Górniczej Dolinie jest to mo¿liwe.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_08"); //Z drugiej strony wielu Bandytów uwa¿a, ¿e nied³ugo Bariera opadnie.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_09"); //Ukrywaj¹ wiêc skrzynie pe³ne rudy i skarbów, licz¹c, ¿e kiedyœ tu wróc¹.
    AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_10"); //Jako Bandyta czeka ciê sporo walki, napadów na konwoje z rud¹, kradzie¿ dóbr czy misje szpiegowskie.
    AI_Output (other, self ,"DIA_Skaza_LIFEBANDITOS_15_11"); //Brzmi ciekawie. 
   // AI_Output (self, other ,"DIA_Skaza_LIFEBANDITOS_03_12"); //Bo jest. Ch³opcze, jesteœ jeszcze m³ody, masz du¿o si³y. ¯ycie przed tob¹.
};

//========================================
//-----------------> ALLWORKSOK
//========================================

INSTANCE DIA_Skaza_ALLWORKSOK (C_INFO)
{
   npc          = BAN_1612_Skaza;
   nr           = 11;
   condition    = DIA_Skaza_ALLWORKSOK_Condition;
   information  = DIA_Skaza_ALLWORKSOK_Info;
   permanent	= FALSE;
   description	= "Pomog³em ci. Podaj mi raport.";
};

FUNC INT DIA_Skaza_ALLWORKSOK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_PART2))
    && (Npc_KnowsInfo (hero, DIA_Skaza_PART1))
    && (MIS_SpysProblems == LOG_RUNNING)  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_ALLWORKSOK_Info()
{
    AI_Output (other, self ,"DIA_Skaza_ALLWORKSOK_15_01"); //Pomog³em ci. Podaj mi raport.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_02"); //Jasne. Zas³u¿y³eœ.
	if (Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_BAU) 
	{
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_04"); //Powiedz Draxowi, ¿e Gomez ostatnio prowadzi liczne pertraktacje z Bractwem.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_05"); //Podobno Y'Berion oferuje du¿e iloœci ziela w zamian za jakieœ us³ugi Stra¿ników w kopalni.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_06"); //Nie wiem o co dok³adnie chodzi, ale Stra¿nicy Œwi¹tynni wyraŸnie czegoœ szukaj¹ w Starej Kopalni.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_07"); //Jednak Gomez mimo wszystko im nie ufa. Wœród rekrutów szukaj¹ szpiega, który wywêszy o co chodzi.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_08"); //Zauwa¿y³eœ, ¿e w Obozie jest wiêcej wys³anników Bractwa?
    AI_Output (other, self ,"DIA_Skaza_ALLWORKSOK_15_09"); //Tak.
    AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_10"); //Dobra, teraz ju¿ idŸ do Draxa.
	
    B_LogEntry                     (CH1_SpysProblems,"Rozwi¹za³em problemy Skazy w Obozie za co otrzyma³em raport, który mogê wreszcie zanieœæ Draxowi.");
	Log_SetTopicStatus       (CH1_SpysProblems, LOG_SUCCESS);
	MIS_SpysProblems = LOG_SUCCESS;
	
	 B_LogEntry                     (CH1_NewsFromSpy,"Skaza powiedzia³, ¿e Bractwo zawar³o umowê z Gomezem. Stary Obóz w zamian za du¿e iloœci ziela ma pomagaæ w kopalni Stra¿nikom Œwi¹tynnym. Ci z kolei szukaj¹ czegoœ w Starej Kopalni.");
	}
	else
	{
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_11"); //Jednak wybra³eœ ju¿ inn¹ gildiê. Jestem ci naprawdê bardzo wdziêczny, ale nie mogê przekazaæ ci tego raportu.
	if (Npc_GetTrueGuild(other) == GIL_VLK) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD)
	{
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_12"); //Dziwi mnie tylko, ¿e jesteœ cz³onkiem Starego Obozu, a postanowi³eœ mi pomóc. Naprawdê nie wiem, dlaczego to zrobi³eœ.
	AI_Output (self, other ,"DIA_Skaza_ALLWORKSOK_03_13"); //Mo¿e jesteœ g³upcem? Albo masz w tym jakiœ ukryty cel? Wiesz co, lepiej ju¿ idŸ. 
	};
	B_LogEntry               (CH1_SpysProblems,"Pomog³em Skazie z jego problemami, jednak nie przekaza³ mi raportu, poniewa¿ do³¹czy³em do innej gildii.");
	Log_SetTopicStatus       (CH1_SpysProblems, LOG_SUCCESS);
	MIS_SpysProblems = LOG_SUCCESS;
	
	MIS_NewsFromSpy = LOG_FAILED;
	Log_SetTopicStatus       (CH1_NewsFromSpy, LOG_FAILED);
	B_LogEntry      	(CH1_NewsFromSpy,"Do³¹czy³em do innego Obozu, wiêc to zadanie jest ju¿ dla mnie bez sensu.");
	B_Givexp (100);
	};
};