//========================================
//-----------------> OPCJA *KONIEC* 
//========================================
//poprawne g1210
INSTANCE DIA_Firn_EXIT(C_INFO)
{
	npc             = NON_5601_Firn;
	nr              = 999;
	condition	= DIA_Firn_EXIT_Condition;
	information	= DIA_Firn_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Firn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Firn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Firn_HELLO1 (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_HELLO1_Condition;
   information  = DIA_Firn_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Firn_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Firn_HELLO1_03_01"); //Czego tu szukasz?
    AI_Output (self, other ,"DIA_Firn_HELLO1_03_02"); //Zgubi³eœ siê, czy jesteœ w interesach?
	Npc_ExchangeRoutine (self, "after_start");
    Info_ClearChoices		(DIA_Firn_HELLO1);
    Info_AddChoice		(DIA_Firn_HELLO1, "Mam interesy z myœliwymi.", DIA_Firn_HELLO1_Interes);
    Info_AddChoice		(DIA_Firn_HELLO1, "Chcia³em siê rozejrzeæ.", DIA_Firn_HELLO1_Zgubiony);
};

FUNC VOID DIA_Firn_HELLO1_Interes()
{
    AI_Output (other, self ,"DIA_Firn_HELLO1_Interes_15_01"); //Mam interesy z myœliwymi.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Interes_03_02"); //No dobra. WejdŸ.
    Info_ClearChoices		(DIA_Firn_HELLO1);
};

FUNC VOID DIA_Firn_HELLO1_Zgubiony()
{
    AI_Output (other, self ,"DIA_Firn_HELLO1_Zgubiony_15_01"); //Chcia³em siê rozejrzeæ.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Zgubiony_03_02"); //Tylko, ¿eby nic nie zginê³o po tym twoim przygl¹daniu.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Zgubiony_03_03"); //Na wszystko co tutaj widzisz uczciwie zapracowaliœmy. 
    Info_ClearChoices		(DIA_Firn_HELLO1);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Firn_HELLO2 (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 2;
   condition    = DIA_Firn_HELLO2_Condition;
   information  = DIA_Firn_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co to za miejsce?";
};

FUNC INT DIA_Firn_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Firn_HELLO2_15_01"); //Co to za miejsce?
    AI_Output (self, other ,"DIA_Firn_HELLO2_03_02"); //To obóz myœliwych.
    AI_Output (self, other ,"DIA_Firn_HELLO2_03_03"); //Pracujemy na w³asn¹ rêkê zdobywaj¹c po¿ywienie i skóry.
    AI_Output (self, other ,"DIA_Firn_HELLO2_03_04"); //Handlujemy nimi z innymi obozami.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Firn_HELLO3 (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 3;
   condition    = DIA_Firn_HELLO3_Condition;
   information  = DIA_Firn_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Firn_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Firn_HELLO3_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Firn_HELLO3_03_02"); //Mogê ci powiedzieæ wszystko, co chcesz wiedzieæ o skórach.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Firn nauczy mnie wszystkiego o skórach."); //1210 fixed
};

//========================================
//-----------------> OtherTeacher
//========================================

INSTANCE DIA_Firn_OtherTeacher (C_INFO)
{
   npc          		= NON_5601_Firn;
   nr           		= 3;
   condition    	= DIA_Firn_OtherTeacher_Condition;
   information  	= DIA_Firn_OtherTeacher_Info;
   permanent	= FALSE;
   description		= "Znajdê tu jakichœ nauczycieli?";
};

FUNC INT DIA_Firn_OtherTeacher_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_OtherTeacher_Info()
{
    AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_01"); //Znajdê tu jakiœ nauczycieli?
    AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_02"); //Jasne. Nauczycieli, handlarzy, byæ mo¿e nawet jak¹œ robotê. 
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_03"); //Stanley mo¿e ciê nauczyæ machaæ mieczem. Warto z nim pogadaæ, bo w innych obozach nikt ciê nie nauczy nawet podstaw dopóki nie do³¹czysz do gildii.
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_04"); //Dlaczego?
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_05"); //Trening bojowy wymaga du¿ego nak³adu pracy i daje niez³e efekty. Jeœli nauczysz siê porz¹dnie machaæ mieczem, to stajesz siê nagle cennym nabytkiem dla Gomeza, Lee lub Guru. Dlatego nikt nie chce szkoliæ nie swoich ludzi. 
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_06"); //WyobraŸ sobie, ¿e pobiera³byœ nauki od Thorusa, a póŸniej zosta³byœ Szkodnikiem. 
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_07"); //Rozumiem. Ktoœ jeszcze warty jest rozmowy?
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_08"); //Alex mo¿e ci daæ pracê, Claw pouczyæ alchemii, a Mil ma sporo rzeczy na sprzeda¿. 
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_09"); //Dziêki. 
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Firn_TEACH (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 3;
   condition    = DIA_Firn_TEACH_Condition;
   information  = DIA_Firn_TEACH_Info;
   permanent	= 1;
   description	= "No dobrze. Ucz mnie.";
};

FUNC INT DIA_Firn_TEACH_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Firn_HELLO3)) && ((Knows_GetFur == false) ||  (Knows_GetHide == false))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Firn_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Firn_TEACH_15_01"); //No dobrze. Ucz mnie.
    AI_Output (self, other ,"DIA_Firn_TEACH_03_02"); //Zaczynajmy.
	Info_ClearChoices		(DIA_Firn_TEACH);
	Info_AddChoice		(DIA_Firn_TEACH, DIALOG_BACK, DIA_Firn_TEACH_BACK);
	if Knows_GetFur == false
	{
    Info_AddChoice		(DIA_Firn_TEACH, "Naucz mnie œci¹gaæ futra. (50 bry³ek, 1 PN)", DIA_Firn_TEACH_Futra);
	};
	if Knows_GetHide == false
	{
    Info_AddChoice		(DIA_Firn_TEACH, "Naucz mnie zdzieraæ skórê z gadów. (50 bry³ek, 1 PN)", DIA_Firn_TEACH_Gady);
	};
};

func void DIA_Firn_TEACH_BACK ()
{
Info_ClearChoices		(DIA_Firn_TEACH);
};

func void DIA_Firn_TEACH_Futra ()
{
	 AI_Output (other, self ,"DIA_Firn_HELLO4_15_01"); //Naucz mnie œci¹gaæ futra.
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
		if (hero.lp >= 1)
		{
        AI_Output (self, other ,"DIA_Firn_HELLO4_03_02"); //Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
        AI_Output (self, other ,"DIA_Firn_HELLO4_03_03"); //Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
		B_GiveInvItems (hero, self, ItMiNugget, 50);
		Knows_GetFur = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli"); //fix1210
		//DIA_Firn_HELLO4.permanent = false;
		hero.lp = hero.lp - 1;
		}
		else
		{
		AI_Output (self, other ,"DIA_Firn_HELLO4_03_05"); //Brakuje ci doœwiadczenia!
		//DIA_Firn_HELLO4.permanent = true;
		};
    }
    else
    {
        AI_Output (self, other ,"DIA_Firn_HELLO4_03_04"); //Brakuje ci rudy!
		//DIA_Firn_HELLO4.permanent = true;
    };
};

func void DIA_Firn_TEACH_Gady ()
{
	AI_Output (other, self ,"DIA_Firn_HELLO5_15_01"); //Naucz mnie zdzieraæ skórê z gadów.
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
		if (hero.lp >= 1)
		{
		Knows_GetHide = TRUE;	
		PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		B_GiveInvItems (hero, self, ItMiNugget, 50); //fix
        AI_Output (self, other ,"DIA_Firn_HELLO5_03_02"); //Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
        AI_Output (self, other ,"DIA_Firn_HELLO5_03_03"); //Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
		//DIA_Firn_HELLO5.permanent = false;
		hero.lp = hero.lp - 1;
		}
		else
		{
		AI_Output (self, other ,"DIA_Firn_HELLO4_03_05"); //Brakuje ci doœwiadczenia!
		//DIA_Firn_HELLO4.permanent = true;
		};
    }
    else
    {
        AI_Output (self, other ,"DIA_Firn_HELLO5_03_04"); //Nie masz rudy!
		//DIA_Firn_HELLO5.permanent = true;
    };
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Firn_HELLO6 (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 6;
   condition    = DIA_Firn_HELLO6_Condition;
   information  = DIA_Firn_HELLO6_Info;
   permanent	= FALSE;
   description	= "Potrzebujesz pomocy?";
};

FUNC INT DIA_Firn_HELLO6_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Firn_HELLO6_15_01"); //Potrzebujesz pomocy?
    AI_Output (self, other ,"DIA_Firn_HELLO6_03_02"); //Tak. Przez ostatnie miesi¹ce handlowa³em skórami z cz³owiekiem imieniem Œwistak.
    AI_Output (self, other ,"DIA_Firn_HELLO6_03_03"); //Dowiedz siê, czemu zerwa³ ze mn¹ kontakty.
    MIS_SprawaFirna = LOG_RUNNING;

    Log_CreateTopic            (CH1_SprawaFirna, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SprawaFirna, LOG_RUNNING);
    B_LogEntry                     (CH1_SprawaFirna,"Mam sprawdziæ, czemu Œwistak zerwa³ kontakty handlowe z Firnem. ");
};

//========================================
//-----------------> WhistlerSpotkanie
//========================================

INSTANCE DIA_Firn_WhistlerSpotkanie (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_WhistlerSpotkanie_Condition;
   information  = DIA_Firn_WhistlerSpotkanie_Info;
   permanent	= FALSE;
   description	= "Masz siê spotkaæ ze Œwistakiem. ";
};

FUNC INT DIA_Firn_WhistlerSpotkanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_RobotnicyNowi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_WhistlerSpotkanie_Info()
{
    AI_Output (other, self ,"DIA_Firn_WhistlerSpotkanie_15_01"); //Masz siê spotkaæ ze Œwistakiem. 
    AI_Output (self, other ,"DIA_Firn_WhistlerSpotkanie_03_02"); //Wreszcie. Moje skrzynie ze skórami s¹ ju¿ pe³ne.
    AI_Output (self, other ,"DIA_Firn_WhistlerSpotkanie_03_03"); //Dziêkujê za pomoc.
    B_LogEntry                     (CH1_SprawaFirna,"Firn mo¿e siê ju¿ spotkaæ ze Œwistakiem.");
    Log_SetTopicStatus       (CH1_SprawaFirna, LOG_SUCCESS);
    MIS_SprawaFirna = LOG_SUCCESS;

    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
};

//========================================
//-----------------> ThiefInCamp
//========================================

INSTANCE DIA_Firn_ThiefInCamp (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_ThiefInCamp_Condition;
   information  = DIA_Firn_ThiefInCamp_Info;
   permanent	= FALSE;
   description	= "Podobno z obozu zginê³o kilka przedmiotów.";
};

FUNC INT DIA_Firn_ThiefInCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_SrongArmor))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_ThiefInCamp_Info()
{
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_01"); //Podobno z obozu zginê³o kilka przedmiotów. 
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_02"); //Cholera... No wiem. 
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_03"); //Co w zwi¹zku z tym? Wygl¹dasz jakbyœ mia³ coœ do ukrycia.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_04"); //Pos³uchaj, to musi zostaæ miêdzy nami. Jasne?
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_05"); //Jak zawsze.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_06"); //Kradzie¿y dokonano kilka dni temu. Sta³em wtedy na stra¿y. To by³a noc, dla œcis³oœci.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_07"); //Z nudów postanowi³em przejœæ siê po Kolonii. Tylko nikomu nie mów.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_08"); //Co w tym z³ego, ¿e poszed³eœ siê przejœæ?
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_09"); //Opuœci³em posterunek. Powinienem by³ pilnowaæ obozu. Zw³aszcza, ¿e wszyscy tego dnia byli zmêczeni po polowaniu.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_10"); //Nie chcê, ¿eby to wysz³o na jaw. Inaczej stracê zaufanie towarzyszy.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_11"); //Ale wracaj¹c do mojej przechadzki po okolicy. Wybra³em siê w okolice Starego Obozu. Konkretnie szed³em w stronê ziem orków trzymaj¹c siê obozu.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_12"); //Gdy dotar³em do œciany skalnej, us³ysza³em coœ zdumiewaj¹cego. 
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_13"); //Kobiecy krzyk.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_14"); //Doprawdy? Opowiedz mi o tym coœ wiêcej.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_15"); //Widzê drwinê w twoich oczach.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_16"); //Spokojnie. Rozumiem ciê. W koñcu w obozie s¹ sami mê¿czyŸni...
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_17"); //Uwierz mi. Ja naprawdê s³ysza³em...
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_18"); //Gdzie dok³adnie to by³o?
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_19"); //Przy œcianie skalnej. DŸwiêki dochodzi³y z góry. 
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_20"); //Dziwi mnie, ¿e sam nie postanowi³eœ sprawdziæ...
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_21"); //Magnus ci¹gle gada coœ o jakimœ duchu. A je¿eli to jakaœ sztuczka tych przeklêtych istot? Nigdy nic nie wiadomo.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_22"); //Rozejrzê siê tam.
    MIS_StrangeVoices = LOG_RUNNING;

    Log_CreateTopic            (CH1_StrangeVoices, LOG_MISSION);
    Log_SetTopicStatus       (CH1_StrangeVoices, LOG_RUNNING);
    B_LogEntry                     (CH1_StrangeVoices,"Kilka nocy temu Firn opuœci³ swój posterunek i uda³ siê na przechadzkê po Kolonii. Przy œcianie skalnej us³ysza³ kobiecy krzyk. Przyznam, ¿e ta sprawa nie daje mi spokoju. ");

    B_GiveXP (150);
};



//========================================
//-----------------> Palisada
//========================================

INSTANCE DIA_Firn_Palisada (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 2;
   condition    = DIA_Firn_Palisada_Condition;
   information  = DIA_Firn_Palisada_Info;
   permanent	= FALSE;
   description	= "Mamy naprawiæ palisadê.";
};

FUNC INT DIA_Firn_Palisada_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_Palisada_Info()
{
    AI_Output (other, self ,"DIA_Firn_Palisada_15_01"); //Mamy naprawiæ palisadê.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_02"); //Alex ciê przys³a³?
    AI_Output (other, self ,"DIA_Firn_Palisada_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_04"); //Zagoni³bym ciê od razu do roboty, ale nie mam sprzêtu.
    AI_Output (other, self ,"DIA_Firn_Palisada_15_05"); //Na pewno le¿y tu gdzieœ jakiœ m³otek...
    AI_Output (self, other ,"DIA_Firn_Palisada_03_06"); //Nie chodzi o m³otek. Potrzebujemy gwoŸdzi.
    AI_Output (other, self ,"DIA_Firn_Palisada_15_07"); //GwoŸdzie? Gdzie je znajdê?
    AI_Output (self, other ,"DIA_Firn_Palisada_03_08"); //W Starym Obozie. Poszukaj w okolicy zawalonej wie¿y. Podobno Gomez nakaza³ j¹ odbudowaæ.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_09"); //Bêdzie nam potrzebne 30 sztuk.
    B_LogEntry                     (CH1_JobInHuntersCamp,"¯eby naprawiæ palisadê potrzebujemy 30 gwoŸdzi. Muszê ich szukaæ w Starym Obozie. ");
};

//========================================
//-----------------> Gwozdzie
//========================================

INSTANCE DIA_Firn_Gwozdzie (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_Gwozdzie_Condition;
   information  = DIA_Firn_Gwozdzie_Info;
   permanent	= FALSE;
   description	= "Mam gwoŸdzie.";
};

FUNC INT DIA_Firn_Gwozdzie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_Palisada))
    && (Npc_HasItems (other, ItMiGwozdz) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_Gwozdzie_Info()
{
    AI_Output (other, self ,"DIA_Firn_Gwozdzie_15_01"); //Mam gwoŸdzie.
    AI_Output (self, other ,"DIA_Firn_Gwozdzie_03_02"); //Dobra. Mo¿esz braæ siê do pracy.
    AI_Output (other, self ,"DIA_Firn_Gwozdzie_15_03"); //Co?
    AI_Output (self, other ,"DIA_Firn_Gwozdzie_03_04"); //No, do roboty!
    B_LogEntry                     (CH1_JobInHuntersCamp,"Mam SAM naprawiæ palisadê. No dobra. To dla mnie nie pierwszyzna. ");
Palisada_Mysliwych = false;
    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> palisadaSkonczone
//========================================

INSTANCE DIA_Firn_palisadaSkonczone (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 2;
   condition    = DIA_Firn_palisadaSkonczone_Condition;
   information  = DIA_Firn_palisadaSkonczone_Info;
   permanent	= FALSE;
   description	= "Odwali³em ca³¹ robotê za ciebie.";
};

FUNC INT DIA_Firn_palisadaSkonczone_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_Gwozdzie))
    && (Palisada_Mysliwych == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_palisadaSkonczone_Info()
{
    AI_Output (other, self ,"DIA_Firn_palisadaSkonczone_15_01"); //Odwali³em ca³¹ robotê za ciebie.
    AI_Output (self, other ,"DIA_Firn_palisadaSkonczone_03_02"); //I dobrze. Przyda ci siê. 
    AI_Output (other, self ,"DIA_Firn_palisadaSkonczone_15_03"); //Cholera, mia³eœ mi pomóc.
    AI_Output (self, other ,"DIA_Firn_palisadaSkonczone_03_04"); //No dobrze. Wynagrodzê ci to. Mo¿esz sobie wzi¹æ tê rudê. 
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Naprawi³em zniszczony wa³. Otrzyma³em 50 bry³ek rudy w nagrodê. ");

    B_GiveXP (100);
};

//========================================
//-----------------> StaryZaruchal
//========================================

INSTANCE DIA_Firn_StaryZaruchal (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_StaryZaruchal_Condition;
   information  = DIA_Firn_StaryZaruchal_Info;
   permanent	= FALSE;
   description	= "Sprawdzi³em te twoje ha³asy...";
};

FUNC INT DIA_Firn_StaryZaruchal_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_Kobieta))
    && (MIS_StrangeVoices == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_StaryZaruchal_Info()
{
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_01"); //Sprawdzi³em te twoje ha³asy...
    AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_02"); //I...? Co to by³o?
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_03"); //Wœród skalnych pó³ek znajduje siê jaskinia. Przesiaduje tam pewien banita ze Starego Obozu. Mieszka tam tak¿e kobieta.
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_04"); //Resztê dokoñcz sobie sam. 
    AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_05"); //Cholera. Naprawdê jest tam jakaœ kobieta?
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_06"); //Tak.
     AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_07"); //Nie do wiary. Staruszek nieŸle siê ustawi³.
        B_LogEntry                     (CH1_StrangeVoices,"Przyczyn¹ rubasznych krzyków by³ banita ze Starego Obozu i by³a niewolnica Gomeza. Firn nieŸle siê zdziwi³. ");
        Log_SetTopicStatus       (CH1_StrangeVoices, LOG_SUCCESS);
        MIS_StrangeVoices = LOG_SUCCESS;

        B_GiveXP (250);
        if (Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2)) && (BaalTondral_GetNewGuy == LOG_SUCCESS)
        {
            AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_08"); //Zdradzê ci, ¿e Gilbert rozpocz¹³ nowe ¿ycie w Bractwie. Jaskinia jest wiêc wolna. 
            AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_09"); //Zas³u¿y³eœ na rudê. Nale¿y ci siê.
            CreateInvItems (self, ItMiNugget, 70);
            B_GiveInvItems (self, other, ItMiNugget, 70);
        };
        AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PorwanieInicjacja
//========================================

INSTANCE DIA_Firn_PorwanieInicjacja (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_PorwanieInicjacja_Condition;
   information  = DIA_Firn_PorwanieInicjacja_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Firn_PorwanieInicjacja_Condition()
{
    if (Kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_PorwanieInicjacja_Info()
{
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_01"); //Dobrze, ¿e jesteœ!
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_02"); //Te sukinsyny porwa³y Alexa.
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_03"); //Pogadaj ze Stanleyem. On wie najwiêcej.
    MIS_Kidnapping = LOG_RUNNING;

    Log_CreateTopic          (CH3_Kidnapping, LOG_MISSION);
    Log_SetTopicStatus       (CH3_Kidnapping, LOG_RUNNING);
    B_LogEntry               (CH3_Kidnapping,"Firn by³ bardzo roztrzêsiony. Ktoœ porwa³ Alexa, a ja mam pogadaæ o tym ze Stanleyem. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CHAPTER_5
//========================================

INSTANCE DIA_Firn_CHAPTER_5 (C_INFO)
{
   npc          = NON_5601_Firn;
   nr           = 1;
   condition    = DIA_Firn_CHAPTER_5_Condition;
   information  = DIA_Firn_CHAPTER_5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Firn_CHAPTER_5_Condition()
{
    if (kapitel == 5) && (MIS_Kidnapping == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Firn_CHAPTER_5_Info()
{
    AI_Output (self, other ,"DIA_Firn_CHAPTER_5_03_01"); //Ej! Jest sprawa. Alex chyba ma dla ciebie jak¹œ robotê.
    MIS_BigTroll = LOG_RUNNING;

    Log_CreateTopic            (CH5_BigTroll, LOG_MISSION);
    Log_SetTopicStatus       (CH5_BigTroll, LOG_RUNNING);
    B_LogEntry                     (CH5_BigTroll,"Firn twierdzi, ¿e Alex ma dla mnie jakieœ zadanie.");
    AI_StopProcessInfos	(self);
};

