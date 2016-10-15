// *Script was make in Easy Dialog Maker (EDM)
//edit by Nocturn
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gerard_EXIT(C_INFO)
{
	npc             = NON_3900_Gerard;
	nr              = 999;
	condition	= DIA_Gerard_EXIT_Condition;
	information	= DIA_Gerard_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gerard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gerard_HELLO1 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_HELLO1_Condition;
   information  = DIA_Gerard_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Gerard_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gerard_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO1_15_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gerard_HELLO1_03_03"); //Nazywam si� Gerard. Dawniej walczy�em na arenie, teraz staram si� jako� prze�y�.
	AI_Output (other, self ,"DIA_Gerard_HELLO1_15_04"); //Jak wi�c tu trafi�e�?
	AI_Output (self, other ,"DIA_Gerard_HELLO1_03_05"); //Nie powinno ci� to interesowa�...
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gerard_HELLO2 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_HELLO2_Condition;
   information  = DIA_Gerard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co robisz na tym odludziu?";
};

FUNC INT DIA_Gerard_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gerard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO2_15_01"); //Co robisz na tym odludziu?
    AI_Output (self, other ,"DIA_Gerard_HELLO2_03_02"); //Tymczasowo mieszkam. Mam tu wszystko czego mi potrzeba, wi�c po co mia�bym i�� do kt�regokolwiek obozu?
	AI_Output (self, other ,"DIA_Gerard_HELLO2_03_03"); //Poza tym �adne mam st�d widoki.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gerard_HELLO3 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 3;
   condition    = DIA_Gerard_HELLO3_Condition;
   information  = DIA_Gerard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz na sobie interesuj�cy pancerz.";
};

FUNC INT DIA_Gerard_HELLO3_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gerard_HELLO2))
		{
    return TRUE;
};
};
FUNC VOID DIA_Gerard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO3_15_01"); //Masz na sobie interesuj�cy pancerz. Identyczne mieli na sobie �o�nierze Kr�la, kt�rzy mnie tutaj zrzucili.
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_02"); //W rzeczy samej. Identyczne, mo�e nawet te same.
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_03"); //Mam jeszcze drugi taki pancerz.
    AI_Output (other, self ,"DIA_Gerard_HELLO3_15_04"); //Jak je zdoby�e�?
    AI_Output (self, other ,"DIA_Gerard_HELLO3_03_05"); //To d�uga historia.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gerard_HELLO4 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 4;
   condition    = DIA_Gerard_HELLO4_Condition;
   information  = DIA_Gerard_HELLO4_Info;
   permanent	= FALSE;
   description	= "Opowiadaj. Nigdzie mi si� nie spieszy.";
};

FUNC INT DIA_Gerard_HELLO4_Condition()
{

    if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO3))
    {
    return TRUE;
};
};
FUNC VOID DIA_Gerard_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO4_15_01"); //Opowiadaj. Nigdzie mi si� nie spieszy.
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_02"); //W porz�dku. M�j przyjaciel przekupi� stra�nika loch�w i wr�czy� mi kr�tki sztylet.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_03"); //Pewnego dnia zosta�em zaci�gni�ty nad urwisko przez dw�ch �o�nierzy, gdzie stary S�dzia z Khorinis wyg�osi� swoje przem�wienie. 
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_04");	//Nie by�em skuty, wi�c korzystaj�c z ich nieuwagi wyci�gn��em sztylet i zrani�em nim �o�nierza w nog�, po czym zacz��em ucieka� w stron� g�r.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_05"); //Dw�ch �o�nierzy wyruszy�o za mn� w po�cig, a S�dzia pobieg� zawiadomi� pobliski oddzia� rycerzy o tym incydencie. Ukry�em si� w grocie i znienacka poder�n��em jednemu gard�o. 
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_06");	//Drugi zauwa�y� ka�u�� krwi i powoli podszed� z kusz�. Tym razem ukry�em si� za ska�� i oczekiwa�em na dogodny moment do ataku. 
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_07");	//W pewnym momencie rzuci�em si� na �o�nierza i wbi�em mu sztylet w serce, ten jednak odruchowo strzeli� z kuszy rani�c mnie w bark.
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_08"); //Cia�a zepchn��em za Barier�, po czym us�ysza�em alarm wydobywaj�cy si� z rogu. By� to wyra�ny znak, �e oddzia� wyruszy� w po�cig. 
	AI_Output (self, other ,"DIA_Gerard_HELLO4_03_09"); //Mog�em ucieka�, jednak stra�nicy i tak by mnie znale�li.
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_10"); //Moj� ostatni� nadziej� na prze�ycie by�a Bariera. Rycerze nigdy nie odwa�yliby si� tu dobrowolnie wkroczy�...
    AI_Output (self, other ,"DIA_Gerard_HELLO4_03_11"); //Tak wyl�dowa�em tutaj.
};

//========================================
//-----------------> HELLO5
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_HELLO5 (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 5;
   condition    = DIA_Gerard_HELLO5_Condition;
   information  = DIA_Gerard_HELLO5_Info;
   permanent	= FALSE;
   description	= "Jeste� ranny?";
};

FUNC INT DIA_Gerard_HELLO5_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO1)) {
    return TRUE; };
};
FUNC VOID DIA_Gerard_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELLO5_15_01"); //Jeste� ranny?
    AI_Output (self, other ,"DIA_Gerard_HELLO5_15_02"); //Tak. Uda�o mi si� opatrzy� ran� miejscowymi zio�ami, jednak czasami b�l powraca.
};

//========================================
//-----------------> HELP
//========================================

INSTANCE DIA_Gerard_HELP (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_HELP_Condition;
   information  = DIA_Gerard_HELP_Info;
   permanent	= FALSE;
   description	= "Mog� ci jako� pom�c?";
};

FUNC INT DIA_Gerard_HELP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_HELP_Info()
{
    AI_Output (other, self ,"DIA_Gerard_HELP_15_01"); //Mog� ci jako� pom�c?
    AI_Output (self, other ,"DIA_Gerard_HELP_03_02"); //Przynie� mi lekarstwo, kt�re ca�kowicie wyleczy moje rany, a otrzymasz zbroj� �o�nierza kr�lewskiego.
    AI_Output (other, self ,"DIA_Gerard_HELP_15_03"); //Zobacz�, co da si� zrobi�.
    AI_Output (self, other ,"DIA_Gerard_HELP_03_04"); //Doceniam tw�j zapa�, ale znalezienie takiego lekarstwa nie b�dzie �atwe. 
    AI_Output (other, self ,"DIA_Gerard_HELP_15_05"); //Wiem o tym. Postaraj si� wytrzyma�. B�d� si� stara� przynie�� je jak najszybciej.
    MIS_RannyWojownik = LOG_RUNNING;

    Log_CreateTopic            (CH1_RannyWojownik, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RannyWojownik, LOG_RUNNING);
    B_LogEntry                     (CH1_RannyWojownik,"Gerard zosta� postrzelony z kuszy i potrzebuje lekarstwa, kt�re ca�kowicie wyleczy rany. W zamian za przyniesienie leku otrzymam zbroj� �o�nierza kr�lewskiego.");
};

//========================================
//-----------------> FIND_POTION
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_FIND_POTION (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_FIND_POTION_Condition;
   information  = DIA_Gerard_FIND_POTION_Info;
   permanent	= FALSE;
   description	= "Przynios�em lekarstwo, kt�re ca�kowicie wyleczy twoje rany.";
};

FUNC INT DIA_Gerard_FIND_POTION_Condition()
{
    if (MIS_RannyWojownik == LOG_RUNNING)
    && (Npc_HasItems (other, GerardPotion) >=1)
    {
    return TRUE;
    };
};
FUNC VOID DIA_Gerard_FIND_POTION_Info()
{
    AI_Output (other, self ,"DIA_Gerard_FIND_POTION_15_01"); //Przynios�em lekarstwo, kt�re ca�kowicie wyleczy twoje rany.
    B_GiveInvItems (other, self, GerardPotion, 1);
	AI_Output (self, other ,"DIA_Gerard_FIND_POTION_03_02"); //Wielkie dzi�ki.
    AI_UseItem (self, GerardPotion);
    AI_Output (self, other ,"DIA_Gerard_FIND_POTION_03_03"); //Oto obiecana nagroda. Niech ten pancerz chroni ci� przed wrogami.
	
    
    
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItems (hero, GRD_ARMOR_I, 1);
    B_LogEntry                     (CH1_RannyWojownik,"Zanios�em Gerardowi lekarstwo. W nagrod� otrzyma�em ciekawy pancerz.");
    Log_SetTopicStatus       (CH1_RannyWojownik, LOG_SUCCESS);
    MIS_RannyWojownik = LOG_SUCCESS;

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TROFEUM
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_TROFEUM (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_TROFEUM_Condition;
   information  = DIA_Gerard_TROFEUM_Info;
   permanent	= FALSE;
   Important    = TRUE;
};
FUNC INT DIA_Gerard_TROFEUM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_FIND_POTION))
    && (Npc_HasItems (other, ItAt_DamLurker_01) >=1)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_TROFEUM_Info()
{
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_01"); //Masz przy sobie interesuj�ce trofeum... Wida�, �e bestia by�a znacznie wi�ksza i silniejsza od swoich braci.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_02"); //M�wisz o tych pazurach topielca?
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_03"); //Tak. Pewien kupiec z Khorinis poszukuje pazur�w wyj�tkowej bestii. Nazywa si� Lutero. My�l�, �e mog�oby go to zainteresowa�.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_04"); //Jak mam si� z nim skontaktowa�?
    AI_Output (self, other ,"DIA_Gerard_TROFEUM_03_05"); //Kt�ry� ob�z prowadzi handel ze �wiatem Zewn�trznym, wi�c tam powiniene� poszuka� pomocy.
    AI_Output (other, self ,"DIA_Gerard_TROFEUM_15_06"); //Rozumiem, dzi�ki za informacje.
    MIS_SzponyTopielca = LOG_RUNNING;

    Log_CreateTopic          (CH1_SzponyTopielca, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SzponyTopielca, LOG_RUNNING);
    B_LogEntry               (CH1_SzponyTopielca,"Gerard wspomnia� o kupcu z Khorinis, kt�ry m�g�by by� zainteresowany pazurami topielca z Nowego Obozu. Chyba powinienem porozmawia� z Magnatami.");
};

//========================================
//-----------------> KOLCZY
//========================================
//edit by Nocturn
INSTANCE DIA_Gerard_KOLCZY (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_KOLCZY_Condition;
   information  = DIA_Gerard_KOLCZY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};
FUNC INT DIA_Gerard_KOLCZY_Condition()
{ //FUNC C_Item Npc_GetEquippedArmor 		(VAR C_NPC n0 ) { };
    if (Npc_HasItems (hero, ketpal) >=1)
	&& (stan_kaptura == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_KOLCZY_Info()
{
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_01"); //Zabij� ci�, rycerzyku!
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_02"); //Uspok�j si�, to ja...
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_03"); //Wybacz, nie rozpozna�em ci�. My�la�em, �e to jaka� n�dzna namiastka rycerza.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_04"); //Raczej �aden skazaniec nie lubi �o�nierzy kr�la.
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_05"); //Jedyna zbrodnia jak� pope�ni�em, to zabicie tych �o�nierzy, kt�rzy pr�bowali mnie tu zrzuci�.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_06"); //Jak to?
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_07"); //Ci�ko trenowa�em i pewnego dnia zdoby�em tytu� mistrza areny.
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_08"); //M�j poprzednik by� synem wp�ywowego kupca, kt�remu nie u�miecha�a si� utrata tytu�u przez syna. 
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_09"); //Przekupi� wi�c dow�dc� oddzia�u paladyn�w i nast�pnego dnia zosta�em wyzwany na pojedynek.
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_10"); //Walka nie by�a �atwa, jednak po kr�tkiej wymianie cios�w zyska�em znaczn� przewag�. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_11"); //Po pewnym czasie zorientowa�em si�, �e m�j miecz pulsuje dziwn� aur� z r�koje�ci. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_12");	//Ignorowa�em to, w ko�cu by�em zaj�ty walk�. W pewnym momencie rycerz zacz�� p�on��.	
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_13"); //Zarzucono mi nielegalne praktykowanie magii, oszustwo podczas walki, a przede wszystkim zab�jstwo rycerza. 
	AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_14");	//Jedynie cud uratowa� mnie przed �mierci�. Orkowie najechali na miasto i wybuch�o wielkie zamieszanie. Dzi�ki temu �yj�.
    AI_Output (other, self ,"DIA_Gerard_KOLCZY_15_15"); //Wrobili ci�...
    AI_Output (self, other ,"DIA_Gerard_KOLCZY_03_16"); //Dlatego przed do��czeniem do �owc�w ork�w stroni�em od innych Oboz�w.
};
var int gerard_proba;
//========================================
//-----------------> LOWCA_ORKOW
//========================================

INSTANCE DIA_Gerard_LOWCA_ORKOW (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_LOWCA_ORKOW_Condition;
   information  = DIA_Gerard_LOWCA_ORKOW_Info;
   permanent	= FALSE;
   description	= "Widzisz siebie jako �owc� ork�w?";
};

FUNC INT DIA_Gerard_LOWCA_ORKOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_ROBOTA))
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero, DIA_Gerard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_LOWCA_ORKOW_Info()
{
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_01"); //Widzisz siebie jako �owc� ork�w?
    AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_02"); //Ja? �owc� ork�w?
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_03"); //Tak. My�l�, �e si� nadajesz. Nie bez powodu wspina�em si� na sam� g�r�.
    AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_04"); //Pomy�l, co ci� tu trzyma?
    AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_05"); //W sumie masz racj�.
    if (MIS_RannyWojownik == LOG_RUNNING)
    {
        AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_06"); //Ale nie przynios�e� mi jeszcze lekarstwa. Nie mog� st�d i�� w takim stanie.
        AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_07"); //Musz� szybko znale�� jaki� skuteczny lek.
		gerard_proba = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_08"); //No dobra. To gdzie jest ten ob�z?
        AI_Output (other, self ,"DIA_Gerard_LOWCA_ORKOW_15_09"); //Przy przej�ciu na ziemie ork�w. We wn�ce skalnej. 
		AI_Output (self, other ,"DIA_Gerard_LOWCA_ORKOW_03_10"); //Wkr�tce si� tam zjawi�. Musz� si� przygotowa�, zebra� moje rzeczy z obozowiska...
	B_LogEntry                     (CH3_NewBloodForOrcHunters,"Gerard to dobra osoba do obozu �owc�w ork�w. To twardy cz�owiek. D�ugo wytrzyma� bez lekarstwa. Z pewno�ci� da sobie rad� z orkami. ");
	gerard_proba = false;
    B_GiveXP (200);
    Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);
	gerard_lowca = true;
    };

};

//========================================
//-----------------> GOTO_ORCS
//========================================

INSTANCE DIA_Gerard_GOTO_ORCS (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 2;
   condition    = DIA_Gerard_GOTO_ORCS_Condition;
   information  = DIA_Gerard_GOTO_ORCS_Info;
   permanent	= FALSE;
   description	= "Teraz ju� mo�esz i��.";
};

FUNC INT DIA_Gerard_GOTO_ORCS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_LOWCA_ORKOW))
    && (MIS_RannyWojownik == LOG_SUCCESS)
    && (gerard_proba == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_GOTO_ORCS_Info()
{
    AI_Output (other, self ,"DIA_Gerard_GOTO_ORCS_15_01"); //Teraz ju� mo�esz i��.
    AI_Output (self, other ,"DIA_Gerard_GOTO_ORCS_03_02"); //Naprawd� si� ciesz�. Tu na g�rze powietrze jest ci�kie. 
	AI_Output (self, other ,"DIA_Gerard_GOTO_ORCS_03_03"); //Nied�ugo wyrusz�. Wkr�tce pojawi� si� w obozie. 
    Npc_ExchangeRoutine (NON_3900_Gerard, "camp");//fix
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Gerard to dobra osoba do obozu �owc�w ork�w. To twardy cz�owiek. D�ugo wytrzyma� bez lekarstwa. Z pewno�ci� da sobie rad� z orkami. ");
	gerard_lowca = true;
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NEED_HELP
//========================================

INSTANCE DIA_Gerard_NEED_HELP (C_INFO)
{
   npc          = NON_3900_Gerard;
   nr           = 1;
   condition    = DIA_Gerard_NEED_HELP_Condition;
   information  = DIA_Gerard_NEED_HELP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gerard_NEED_HELP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Straznik_SYTUACJA_GERARDA)) && (kapitel ==10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gerard_NEED_HELP_Info()
{
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_01"); //Dzi�ki! Zjawi�e� si� w ostatniej chwili.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_02"); //Orkowie wzi�li mnie z zaskoczenia! Na szcz�cie to tylko s�abo uzbrojeni zwiadowcy.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_03"); //Dobrze, �e si� zjawi�e�.
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_04"); //Odbi�o ci? Dlaczego nie poszed�e� z Wilsonem?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_05"); //Nie mam zamiaru w��czy� si� po Kolonii. Wsz�dzie kr�c� si� Stra�nicy. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_06"); //Do tego z�bacze maj� teraz okres godowy i schodz� z g�rskich zboczy niebezpiecznie zbli�aj�c si� do ludzkich osad. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_07"); //Szukaj� jedzenia i partner�w do god�w. 
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_08"); //A co b�dzie, gdy orkowie znajd� twoj� kryj�wk�?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_09"); //Nie znajd�. Zabi�em ich zwiadowc�w. 
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_10"); //A co je�li zaczn� ich szuka�?
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_11"); //Teraz b�d� gotowy. Nie dam si� zaskoczy�.
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_12"); //B�d� cz�ciej patrolowa� teren, rozpala� mniejsze ognisko... Wystarczy troch� pomy�le�.
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_13"); //Orkowe psy w ka�dej chwili mog� poczu� zapach pieczonego mi�sa...
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_14"); //Z tym te� sobie poradz�. Nie pr�buj mnie przekonywa�, bo nic ci to nie da!
    AI_Output (other, self ,"DIA_Gerard_NEED_HELP_15_15"); //Dobra, ju� sko�czy�em. Po prostu uwa�aj na siebie. 
    AI_Output (self, other ,"DIA_Gerard_NEED_HELP_03_16"); //Dzi�ki. Ty r�wnie�.
    B_LogEntry                     (CH1_Stan_gerarda,"Gdy wchodzi�em do obozu Gerard walczy� z grup� orkowych zwiadowc�w. Na szcz�cie zd��y�em na czas i uda�o mi si� mu pom�c. Pomimo zagro�enia nadal upiera si� nad wy�szo�ci� tej kryj�wki nad innymi. ");
    Log_SetTopicStatus       (CH1_Stan_gerarda, LOG_SUCCESS);
    MIS_Stan_gerarda = LOG_SUCCESS;
	Log_CreateTopic            (OtherInfos, LOG_NOTE);  
	B_LogEntry    (OtherInfos,"Gerard zdradzi� mi, �e w�a�nie zacz�� si� okres godowy z�baczy. Zwierz�ta wychodz� ze swoich g�rskich kryj�wek w poszukiwaniu partner�w i jedzenia. Musze uwa�a�.");
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};



