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
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chc� ci� ostrzec. Id�c dalej wejdziesz na nasze tereny �owieckie.
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
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //G��wnie na �cierwojady. Da si� je zje��, no i nietrudno je zabi�... Je�li wie si� jak to zrobi�.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Naprawd�? Macie jak�� specjaln� metod�?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zapytaj mojego kumpla, Draxa. Nikt nie wie wi�cej o �cierwojadach ni� on.
};

// **************************************************
//					Warum gef�hrlich
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
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Jeste� tu nowy, co? W ca�ej Kolonii jest mn�stwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //�cie�ki pomi�dzy obozami s� do�� bezpieczne, ale nawet tam mo�na natkn�� si� na stado wilk�w, kt�re b�d� chcia�y zje�� ci� na kolacj�.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Dlatego lepiej nie rusza� si� nigdzie bez odpowiedniego or�a i zbroi.
};

// **************************************************
//					Wo Ausr�stung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Sk�d mog� wzi�� lepsze wyposa�enie?";
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
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Sk�d mog� wzi�� lepsze wyposa�enie?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Najbli�ej b�dzie pewnie Stary Ob�z. Id� dalej t� sam� �cie�k�, na pewno trafisz.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale lepsze ceny znajdziesz - w Nowym Obozie. Oczywi�cie pod warunkiem, �e znasz w�a�ciwych ludzi. 
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Kiedy trafisz do Starego Obozu, poszukaj m�czyzny imieniem Mordrag. To jeden ze Szkodnik�w. Za kilka bry�ek rudy mo�na u niego kupi� wiele warto�ciowych rzeczy.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_04"); //Oczywi�cie mo�esz te� zajrze� do Obozu Bandyt�w. Martin i Briam maj� naprawd� atrakcyjne ceny. Najlepiej pogadaj z Draxem - on zajmuje si� rekrutacj�. 
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC, "Szkodnik Mordrag handluje w Starym Obozie r�nymi towarami. Pono� ma bardzo przyst�pne ceny.");
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Bandyci Martin i Briam oferuj� atrakcyjne ceny za przer�ne towary.");
	
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
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Je�li zamierzasz podr�owa� mi�dzy obozami, przyda ci si� mapa z wszystkimi �cie�kami i �lepymi zau�kami.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Niekt�re �cie�ki prowadz� do niebezpiecznych kanion�w, gdzie mo�na wpa�� na istoty, na kt�re... lepiej nie wpada�.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Pod �adnym pozorem nie w��cz si� w pobli�u starych ruin. Wi�kszo�� z nich pami�ta jeszcze pierwsz� wojn� z orkami. Niekt�re s� nawet pozosta�o�ciami po ich osiedlach.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Cz�sto kr�c� si� tam orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika�bym takich miejsc jak ognia. Zw�aszcza noc�.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //I jeszcze jedna rada - nie wchod� do lasu!
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
	description = "Gdzie mog� zdoby� jak�� map�?";
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
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Gdzie mog� zdoby� jak�� map�?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Mo�e uda ci si� gwizdn�� mu jak�� map�. Przy okazji m�g�by� zwin�� tak�e jedn� dla mnie!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte, "Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!" 	,Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte, "Dlaczego? Jego mapy nie s� na sprzeda�?" 										,Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //R�wny z ciebie go��! Powiniene� pomy�le� o do��czeniu do Nowego Obozu. Gdyby� kiedy� tam trafi�, pytaj o Laresa. To on zajmuje si� nowymi. Na pewno znajdzie dla ciebie jakie� zaj�cie!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_03"); //Mo�esz tak�e przy��czy� si� do Bandyt�w. Nasze obozy �yj� ze sob� w zgodzie. 
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_04"); //Jeste� Bandyt� czy Szkodnikiem?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_05"); //Ja? Jestem Szkodnikiem, jednak poluj� z Bandytami. Posprzecza�em si� z Aidanem i nie chc� wraca� w rejony Nowego Obozu. �cierwojad�w tu nie brakuje.  
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
    	MIS_MapForRatford = LOG_RUNNING;

 	   Log_CreateTopic            (CH1_MapForRatford, LOG_MISSION);
 	   Log_SetTopicStatus       (CH1_MapForRatford, LOG_RUNNING);
 	   B_LogEntry                     (CH1_MapForRatford,"Ratford kaza� przynie�� sobie map� Kolonii. Powinienem znale�� jedn� w Starym Obozie.");


};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Dlaczego? Jego mapy nie s� na sprzeda�?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Je�li sta� ci� na tak ogromny wydatek...
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
	description = "Dzi�ki za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Dzi�ki za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Tylko nie my�l, �e wszyscy tutaj s� tacy mili!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Niewiele mo�na znale�� w kieszeniach Nowego, ale w Kolonii s� ludzie, kt�rzy roz�upaliby ci czaszk� za stary kilof.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //B�d� o tym pami�ta�.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Ratford
// Rozdzia� 1
// Zadanie z map�
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
   description	= "Mam map�!";
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
    AI_Output (other, self ,"DIA_Ratford_Map_15_01"); //Mam map�!
    AI_Output (self, other ,"DIA_Ratford_Map_03_02"); //�wietna robota!
    AI_Output (self, other ,"DIA_Ratford_Map_03_03"); //Dzi�ki, ch�opcze. We� ten ko�czan, pe�en strza� jako nagrod�. 
    B_LogEntry                     (CH1_MapForRatford,"Zanios�em Ratfordowi map� Kolonii.");
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
// Rozdzia� 2
// Zadanie z kurierem mag�w
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
   description	= "Podobno zabi�e� Cienia Emila.";
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
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_01"); //Podobno zabi�e� Cienia Emila.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_02"); //A podobno Gomez sypia z owcami.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_03"); //Zabi�em, no i co z tego?
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_04"); //Emil przenosi� pewn� przesy�k�, kt�r� mia� dostarczy� do Mag�w Wody.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_05"); //Corristo kaza� mi j� odzyska�. 
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_06"); //M�wisz o tej paczce z kilkoma pier�cieniami?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_07"); //Ta, przej��em j�.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_08"); //Mog� wiedzie� gdzie j� trzymasz?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_09"); //Ha ha ha. Nie oddam ci jej. Po upadku Bariery zamierzam sprzeda� j� w Khorinis.
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_10"); //Znam pewnego cz�owieka mieszkaj�cego na farmie Onara, kt�ry kolekcjonuje stare monety i rzadkie artefakty.
    AI_Output (other, self ,"DIA_Ratford_KillEmil_15_11"); //Ile chcesz za te pier�cienie?
    AI_Output (self, other ,"DIA_Ratford_KillEmil_03_12"); //Zapomnij o tym. Rudy mam pod dostatkiem, po upadku Bariery bardziej b�d� potrzebowa� z�ota.
	//log
    B_LogEntry                     (CH1_CourierFireMage,"To prawda, Ratford zabi� Emila i przej�� przesy�k� Corristo. Nie chce mi jej jednak odda�. Mo�e znajd� jaki� jego czu�y punkt? Najlepiej zapytam jego kolegi.");
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
   description	= "Sp�jrz co ci przynios�em.";
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
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_01"); //Sp�jrz co ci przynios�em.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_02"); //Jasna cholera. Spad�e� mi z nieba, ch�opcze.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_03"); //Tak dawno nie mia�em nic DOBREGO do palenia. Ach...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_04"); //Daj mi tego skr�ta.
    B_GiveInvItems (other, self, ItMis_SlepperBreathJoint, 1);
    AI_UseItem (self, ItMis_SlepperBreathJoint);
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_05"); //A teraz powiedz mi, gdzie znajd� przesy�k� dla Mag�w Wody?
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_06"); //Ale ten towar mocny! Zaraz...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_07"); //Nadja, to ty? Chod� do mnie ma�a... Zabawimy si�. 
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_08"); //To Drax, pajacu. Daj mi przesy�k�, kt�r� mi obieca�e�.
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_09"); //Nie widzisz, �e zagaduj� do panienki? O jak� przesy�k� ci chodzi?
    AI_Output (other, self ,"DIA_Ratford_SuperJoin_15_10"); //O t� z listem. Daj mi j� i sobie p�jd�, a ty zajmiesz si� swoj� towarzyszk�...
    AI_Output (self, other ,"DIA_Ratford_SuperJoin_03_11"); //Masz i zje�d�aj. 
    CreateInvItems (self, ItMis_PaczkaMagowOgnia, 1);
    B_GiveInvItems (self, other, ItMis_PaczkaMagowOgnia, 1);
    B_LogEntry                     (CH1_CourierFireMage,"Ratford nie�le odlecia� po zielu Fortuno, a ja zdoby�em przesy�k�. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};