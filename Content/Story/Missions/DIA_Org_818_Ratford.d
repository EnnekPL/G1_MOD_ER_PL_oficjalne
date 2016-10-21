// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hej, ty!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Czego chcesz?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chcê ciê ostrzec. Id¹c dalej wejdziesz na nasze tereny ³owieckie.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Na co polujecie?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Na co polujecie?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //G³ównie na œcierwojady. Da siê je zjeœæ, no i nietrudno je zabiæ... Jeœli wie siê jak to zrobiæ.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Naprawdê? Macie jak¹œ specjaln¹ metodê?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zapytaj mojego kumpla, Draxa. Nikt nie wie wiêcej o œcierwojadach ni¿ on.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Dlaczego ten teren jest tak niebezpieczny?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Dlaczego ten teren jest tak niebezpieczny?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Jesteœ tu nowy, co? W ca³ej Kolonii jest mnóstwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Œcie¿ki pomiêdzy obozami s¹ doœæ bezpieczne, ale nawet tam mo¿na natkn¹æ siê na stado wilków, które bêd¹ chcia³y zjeœæ ciê na kolacjê.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Dlatego lepiej nie ruszaæ siê nigdzie bez odpowiedniego orê¿a i zbroi.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Sk¹d mogê wzi¹æ lepsze wyposa¿enie?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Sk¹d mogê wzi¹æ lepsze wyposa¿enie?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Najbli¿ej bêdzie pewnie Stary Obóz. IdŸ dalej t¹ sam¹ œcie¿k¹, na pewno trafisz.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale lepsze ceny znajdziesz - w Nowym Obozie. Oczywiœcie pod warunkiem, ¿e znasz w³aœciwych ludzi. 
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Kiedy trafisz do Starego Obozu, poszukaj mê¿czyzny imieniem Mordrag. To jeden ze Szkodników. Za kilka bry³ek rudy mo¿na u niego kupiæ wiele wartoœciowych rzeczy.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_04"); //Oczywiœcie mo¿esz te¿ zajrzeæ do Obozu Bandytów. Martin i Briam maj¹ naprawdê atrakcyjne ceny. Najlepiej pogadaj z Draxem - on zajmuje siê rekrutacj¹. 
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC, "Szkodnik Mordrag handluje w Starym Obozie ró¿nymi towarami. Ponoæ ma bardzo przystêpne ceny.");
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Bandyci Martin i Briam oferuj¹ atrakcyjne ceny za przeró¿ne towary.");
	
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o Kolonii.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Opowiedz mi jeszcze o Kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Jeœli zamierzasz podró¿owaæ miêdzy obozami, przyda ci siê mapa z wszystkimi œcie¿kami i œlepymi zau³kami.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Niektóre œcie¿ki prowadz¹ do niebezpiecznych kanionów, gdzie mo¿na wpaœæ na istoty, na które... lepiej nie wpadaæ.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Pod ¿adnym pozorem nie w³ócz siê w pobli¿u starych ruin. Wiêkszoœæ z nich pamiêta jeszcze pierwsz¹ wojnê z orkami. Niektóre s¹ nawet pozosta³oœciami po ich osiedlach.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Czêsto krêc¹ siê tam orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika³bym takich miejsc jak ognia. Zw³aszcza noc¹.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //I jeszcze jedna rada - nie wchodŸ do lasu!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Gdzie mogê zdobyæ jak¹œ mapê?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Gdzie mogê zdobyæ jak¹œ mapê?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Mo¿e uda ci siê gwizdn¹æ mu jak¹œ mapê. Przy okazji móg³byœ zwin¹æ tak¿e jedn¹ dla mnie!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte, "Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!" 	,Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte, "Dlaczego? Jego mapy nie s¹ na sprzeda¿?" 										,Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Równy z ciebie goœæ! Powinieneœ pomyœleæ o do³¹czeniu do Nowego Obozu. Gdybyœ kiedyœ tam trafi³, pytaj o Laresa. To on zajmuje siê nowymi. Na pewno znajdzie dla ciebie jakieœ zajêcie!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_03"); //Mo¿esz tak¿e przy³¹czyæ siê do Bandytów. Nasze obozy ¿yj¹ ze sob¹ w zgodzie. 
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_04"); //Jesteœ Bandyt¹ czy Szkodnikiem?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_05"); //Ja? Jestem Szkodnikiem, jednak polujê z Bandytami. Posprzecza³em siê z Aidanem i nie chcê wracaæ w rejony Nowego Obozu. Œcierwojadów tu nie brakuje.  
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
    	MIS_MapForRatford = LOG_RUNNING;

 	   Log_CreateTopic            (CH1_MapForRatford, LOG_MISSION);
 	   Log_SetTopicStatus       (CH1_MapForRatford, LOG_RUNNING);
 	   B_LogEntry                     (CH1_MapForRatford,"Ratford kaza³ przynieœæ sobie mapê Kolonii. Powinienem znaleŸæ jedn¹ w Starym Obozie.");


};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Dlaczego? Jego mapy nie s¹ na sprzeda¿?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jeœli staæ ciê na tak ogromny wydatek...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Dziêki za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Dziêki za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Tylko nie myœl, ¿e wszyscy tutaj s¹ tacy mili!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Niewiele mo¿na znaleŸæ w kieszeniach Nowego, ale w Kolonii s¹ ludzie, którzy roz³upaliby ci czaszkê za stary kilof.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Bêdê o tym pamiêta³.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Ratford
// Rozdzia³ 1
// Zadanie z map¹
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Map
//========================================

INSTANCE DIA_Ratford_Map (C_INFO)
{
   npc          = Org_818_Ratford;
   nr           = 1;
   condition    = DIA_Ratford_Map_Condition;
   information  = DIA_Ratford_Map_Info;
   permanent	= FALSE;
   description	= "Mam mapê!";
};

FUNC INT DIA_Ratford_Map_Condition()
{
    if (MIS_MapForRatford == LOG_RUNNING)
    && (Npc_HasItems (other, ItWrWorldmap) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ratford_Map_Info()
{
    AI_Output (other, self ,"DIA_Ratford_Map_15_01"); //Mam mapê!
    AI_Output (self, other ,"DIA_Ratford_Map_03_02"); //Œwietna robota!
    AI_Output (self, other ,"DIA_Ratford_Map_03_03"); //Dziêki, ch³opcze. WeŸ ten ko³czan, pe³en strza³ jako nagrodê. 
    B_LogEntry                     (CH1_MapForRatford,"Zanios³em Ratfordowi mapê Kolonii.");
    Log_SetTopicStatus       (CH1_MapForRatford, LOG_SUCCESS);
    MIS_MapForRatford = LOG_SUCCESS;
	B_GiveInvItems (other, self, ItWrWorldmap, 1);
    B_GiveXP (150);
	CreateInvItems (self, ItAm_Quiver, 1);
    B_GiveInvItems (self, other, ItAm_Quiver, 1);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Ratford
// Rozdzia³ 2
// Zadanie z kurierem magów
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> KillEmil
//========================================

INSTANCE DIA_Ratford_KillEmil (C_INFO)
{
   npc          = Org_818_Ratford;
   nr           = 1;
   condition    = DIA_Ratford_KillEmil_Condition;
   information  = DIA_Ratford_KillEmil_Info;
   permanent	= FALSE;
   description	= "Podobno zabi³eœ Cienia Emila.";
};

FUNC INT DIA_Ratford_KillEmil_Condition()
{
    if (hero_knows_RatfordKiller == true)
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ratford_KillEmil_Info()
{
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_01"); //Podobno zabi³eœ Cienia Emila.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_02"); //A podobno Gomez sypia z owcami.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_03"); //Zabi³em, no i co z tego?
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_04"); //Emil przenosi³ pewn¹ przesy³kê, któr¹ mia³ dostarczyæ do Magów Wody.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_05"); //Corristo kaza³ mi j¹ odzyskaæ. 
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_06"); //Mówisz o tej paczce z kilkoma pierœcieniami?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_07"); //Ta, przej¹³em j¹.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_08"); //Mogê wiedzieæ gdzie j¹ trzymasz?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_09"); //Ha ha ha. Nie oddam ci jej. Po upadku Bariery zamierzam sprzedaæ j¹ w Khorinis.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_10"); //Znam pewnego cz³owieka mieszkaj¹cego na farmie Onara, który kolekcjonuje stare monety i rzadkie artefakty.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_11"); //Ile chcesz za te pierœcienie?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_12"); //Zapomnij o tym. Rudy mam pod dostatkiem, po upadku Bariery bardziej bêdê potrzebowa³ z³ota.
	//log
    B_LogEntry                     (CH2_CourierFireMage,"To prawda, Ratford zabi³ Emila i przej¹³ przesy³kê Corristo. Nie chce mi jej jednak oddaæ. Mo¿e znajdê jakiœ jego czu³y punkt? Najlepiej zapytam jego kolegi.");
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SuperJoin
//========================================

INSTANCE DIA_Ratford_SuperJoin (C_INFO)
{
   npc          = Org_818_Ratford;
   nr           = 1;
   condition    = DIA_Ratford_SuperJoin_Condition;
   information  = DIA_Ratford_SuperJoin_Info;
   permanent	= FALSE;
   description	= "Spójrz co ci przynios³em.";
};

FUNC INT DIA_Ratford_SuperJoin_Condition()
{
    if (Npc_HasItems (other, ItMis_SlepperBreathJoint) >=1)
    && (MIS_CourierFireMage == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Ratford_KillEmil))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ratford_SuperJoin_Info()
{
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_01"); //Spójrz co ci przynios³em.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_02"); //Jasna cholera. Spad³eœ mi z nieba, ch³opcze.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_03"); //Tak dawno nie mia³em nic DOBREGO do palenia. Ach...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_04"); //Daj mi tego skrêta.
    B_GiveInvItems (other, self, ItMis_SlepperBreathJoint, 1);
    AI_UseItem (self, ItMis_SlepperBreathJoint);
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_05"); //A teraz powiedz mi, gdzie znajdê przesy³kê dla Magów Wody?
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_06"); //Ale ten towar mocny! Zaraz...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_07"); //Nadja, to ty? ChodŸ do mnie ma³a... Zabawimy siê. 
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_08"); //To Drax, pajacu. Daj mi przesy³kê, któr¹ mi obieca³eœ.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_09"); //Nie widzisz, ¿e zagadujê do panienki? O jak¹ przesy³kê ci chodzi?
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_10"); //O tê z listem. Daj mi j¹ i sobie pójdê, a ty zajmiesz siê swoj¹ towarzyszk¹...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_11"); //Masz i zje¿d¿aj. 
    CreateInvItems (self, ItMis_PaczkaMagowOgnia, 1);
    B_GiveInvItems (self, other, ItMis_PaczkaMagowOgnia, 1);
    B_LogEntry                     (CH2_CourierFireMage,"Ratford nieŸle odlecia³ po zielu Fortuno, a ja zdoby³em przesy³kê. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};