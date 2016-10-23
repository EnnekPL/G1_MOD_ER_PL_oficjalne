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
    AI_Output (self, other ,"DIA_Firn_HELLO1_03_02"); //Zgubi�e� si�, czy jeste� w interesach?
	Npc_ExchangeRoutine (self, "after_start");
    Info_ClearChoices		(DIA_Firn_HELLO1);
    Info_AddChoice		(DIA_Firn_HELLO1, "Mam interesy z my�liwymi.", DIA_Firn_HELLO1_Interes);
    Info_AddChoice		(DIA_Firn_HELLO1, "Chcia�em si� rozejrze�.", DIA_Firn_HELLO1_Zgubiony);
};

FUNC VOID DIA_Firn_HELLO1_Interes()
{
    AI_Output (other, self ,"DIA_Firn_HELLO1_Interes_15_01"); //Mam interesy z my�liwymi.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Interes_03_02"); //No dobra. Wejd�.
    Info_ClearChoices		(DIA_Firn_HELLO1);
};

FUNC VOID DIA_Firn_HELLO1_Zgubiony()
{
    AI_Output (other, self ,"DIA_Firn_HELLO1_Zgubiony_15_01"); //Chcia�em si� rozejrze�.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Zgubiony_03_02"); //Tylko, �eby nic nie zgin�o po tym twoim przygl�daniu.
    AI_Output (self, other ,"DIA_Firn_HELLO1_Zgubiony_03_03"); //Na wszystko co tutaj widzisz uczciwie zapracowali�my. 
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
    AI_Output (self, other ,"DIA_Firn_HELLO2_03_02"); //To ob�z my�liwych.
    AI_Output (self, other ,"DIA_Firn_HELLO2_03_03"); //Pracujemy na w�asn� r�k� zdobywaj�c po�ywienie i sk�ry.
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
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Firn_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Firn_HELLO3_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Firn_HELLO3_03_02"); //Mog� ci powiedzie� wszystko, co chcesz wiedzie� o sk�rach.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Firn nauczy mnie wszystkiego o sk�rach."); //1210 fixed
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
   description		= "Znajd� tu jakich� nauczycieli?";
};

FUNC INT DIA_Firn_OtherTeacher_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Firn_OtherTeacher_Info()
{
    AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_01"); //Znajd� tu jaki� nauczycieli?
    AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_02"); //Jasne. Nauczycieli, handlarzy, by� mo�e nawet jak�� robot�. 
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_03"); //Stanley mo�e ci� nauczy� macha� mieczem. Warto z nim pogada�, bo w innych obozach nikt ci� nie nauczy nawet podstaw dop�ki nie do��czysz do gildii.
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_04"); //Dlaczego?
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_05"); //Trening bojowy wymaga du�ego nak�adu pracy i daje niez�e efekty. Je�li nauczysz si� porz�dnie macha� mieczem, to stajesz si� nagle cennym nabytkiem dla Gomeza, Lee lub Guru. Dlatego nikt nie chce szkoli� nie swoich ludzi. 
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_06"); //Wyobra� sobie, �e pobiera�by� nauki od Thorusa, a p�niej zosta�by� Szkodnikiem. 
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_07"); //Rozumiem. Kto� jeszcze warty jest rozmowy?
	AI_Output (self, other ,"DIA_Firn_OtherTeacher_03_08"); //Alex mo�e ci da� prac�, Claw pouczy� alchemii, a Mil ma sporo rzeczy na sprzeda�. 
	AI_Output (other, self ,"DIA_Firn_OtherTeacher_15_09"); //Dzi�ki. 
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
    Info_AddChoice		(DIA_Firn_TEACH, "Naucz mnie �ci�ga� futra. (50 bry�ek, 1 PN)", DIA_Firn_TEACH_Futra);
	};
	if Knows_GetHide == false
	{
    Info_AddChoice		(DIA_Firn_TEACH, "Naucz mnie zdziera� sk�r� z gad�w. (50 bry�ek, 1 PN)", DIA_Firn_TEACH_Gady);
	};
};

func void DIA_Firn_TEACH_BACK ()
{
Info_ClearChoices		(DIA_Firn_TEACH);
};

func void DIA_Firn_TEACH_Futra ()
{
	 AI_Output (other, self ,"DIA_Firn_HELLO4_15_01"); //Naucz mnie �ci�ga� futra.
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
		if (hero.lp >= 1)
		{
        AI_Output (self, other ,"DIA_Firn_HELLO4_03_02"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
        AI_Output (self, other ,"DIA_Firn_HELLO4_03_03"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
		B_GiveInvItems (hero, self, ItMiNugget, 50);
		Knows_GetFur = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli"); //fix1210
		//DIA_Firn_HELLO4.permanent = false;
		hero.lp = hero.lp - 1;
		}
		else
		{
		AI_Output (self, other ,"DIA_Firn_HELLO4_03_05"); //Brakuje ci do�wiadczenia!
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
	AI_Output (other, self ,"DIA_Firn_HELLO5_15_01"); //Naucz mnie zdziera� sk�r� z gad�w.
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
		if (hero.lp >= 1)
		{
		Knows_GetHide = TRUE;	
		PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		B_GiveInvItems (hero, self, ItMiNugget, 50); //fix
        AI_Output (self, other ,"DIA_Firn_HELLO5_03_02"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
        AI_Output (self, other ,"DIA_Firn_HELLO5_03_03"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
		//DIA_Firn_HELLO5.permanent = false;
		hero.lp = hero.lp - 1;
		}
		else
		{
		AI_Output (self, other ,"DIA_Firn_HELLO4_03_05"); //Brakuje ci do�wiadczenia!
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
    AI_Output (self, other ,"DIA_Firn_HELLO6_03_02"); //Tak. Przez ostatnie miesi�ce handlowa�em sk�rami z cz�owiekiem imieniem �wistak.
    AI_Output (self, other ,"DIA_Firn_HELLO6_03_03"); //Dowiedz si�, czemu zerwa� ze mn� kontakty.
    MIS_SprawaFirna = LOG_RUNNING;

    Log_CreateTopic            (CH1_SprawaFirna, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SprawaFirna, LOG_RUNNING);
    B_LogEntry                     (CH1_SprawaFirna,"Mam sprawdzi�, czemu �wistak zerwa� kontakty handlowe z Firnem. ");
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
   description	= "Masz si� spotka� ze �wistakiem. ";
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
    AI_Output (other, self ,"DIA_Firn_WhistlerSpotkanie_15_01"); //Masz si� spotka� ze �wistakiem. 
    AI_Output (self, other ,"DIA_Firn_WhistlerSpotkanie_03_02"); //Wreszcie. Moje skrzynie ze sk�rami s� ju� pe�ne.
    AI_Output (self, other ,"DIA_Firn_WhistlerSpotkanie_03_03"); //Dzi�kuj� za pomoc.
    B_LogEntry                     (CH1_SprawaFirna,"Firn mo�e si� ju� spotka� ze �wistakiem.");
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
   description	= "Podobno z obozu zgin�o kilka przedmiot�w.";
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
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_01"); //Podobno z obozu zgin�o kilka przedmiot�w. 
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_02"); //Cholera... No wiem. 
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_03"); //Co w zwi�zku z tym? Wygl�dasz jakby� mia� co� do ukrycia.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_04"); //Pos�uchaj, to musi zosta� mi�dzy nami. Jasne?
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_05"); //Jak zawsze.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_06"); //Kradzie�y dokonano kilka dni temu. Sta�em wtedy na stra�y. To by�a noc, dla �cis�o�ci.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_07"); //Z nud�w postanowi�em przej�� si� po Kolonii. Tylko nikomu nie m�w.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_08"); //Co w tym z�ego, �e poszed�e� si� przej��?
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_09"); //Opu�ci�em posterunek. Powinienem by� pilnowa� obozu. Zw�aszcza, �e wszyscy tego dnia byli zm�czeni po polowaniu.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_10"); //Nie chc�, �eby to wysz�o na jaw. Inaczej strac� zaufanie towarzyszy.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_11"); //Ale wracaj�c do mojej przechadzki po okolicy. Wybra�em si� w okolice Starego Obozu. Konkretnie szed�em w stron� ziem ork�w trzymaj�c si� obozu.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_12"); //Gdy dotar�em do �ciany skalnej, us�ysza�em co� zdumiewaj�cego. 
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_13"); //Kobiecy krzyk.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_14"); //Doprawdy? Opowiedz mi o tym co� wi�cej.
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_15"); //Widz� drwin� w twoich oczach.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_16"); //Spokojnie. Rozumiem ci�. W ko�cu w obozie s� sami m�czy�ni...
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_17"); //Uwierz mi. Ja naprawd� s�ysza�em...
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_18"); //Gdzie dok�adnie to by�o?
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_19"); //Przy �cianie skalnej. D�wi�ki dochodzi�y z g�ry. 
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_20"); //Dziwi mnie, �e sam nie postanowi�e� sprawdzi�...
    AI_Output (self, other ,"DIA_Firn_ThiefInCamp_03_21"); //Magnus ci�gle gada co� o jakim� duchu. A je�eli to jaka� sztuczka tych przekl�tych istot? Nigdy nic nie wiadomo.
    AI_Output (other, self ,"DIA_Firn_ThiefInCamp_15_22"); //Rozejrz� si� tam.
    MIS_StrangeVoices = LOG_RUNNING;

    Log_CreateTopic            (CH1_StrangeVoices, LOG_MISSION);
    Log_SetTopicStatus       (CH1_StrangeVoices, LOG_RUNNING);
    B_LogEntry                     (CH1_StrangeVoices,"Kilka nocy temu Firn opu�ci� sw�j posterunek i uda� si� na przechadzk� po Kolonii. Przy �cianie skalnej us�ysza� kobiecy krzyk. Przyznam, �e ta sprawa nie daje mi spokoju. ");

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
   description	= "Mamy naprawi� palisad�.";
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
    AI_Output (other, self ,"DIA_Firn_Palisada_15_01"); //Mamy naprawi� palisad�.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_02"); //Alex ci� przys�a�?
    AI_Output (other, self ,"DIA_Firn_Palisada_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_04"); //Zagoni�bym ci� od razu do roboty, ale nie mam sprz�tu.
    AI_Output (other, self ,"DIA_Firn_Palisada_15_05"); //Na pewno le�y tu gdzie� jaki� m�otek...
    AI_Output (self, other ,"DIA_Firn_Palisada_03_06"); //Nie chodzi o m�otek. Potrzebujemy gwo�dzi.
    AI_Output (other, self ,"DIA_Firn_Palisada_15_07"); //Gwo�dzie? Gdzie je znajd�?
    AI_Output (self, other ,"DIA_Firn_Palisada_03_08"); //W Starym Obozie. Poszukaj w okolicy zawalonej wie�y. Podobno Gomez nakaza� j� odbudowa�.
    AI_Output (self, other ,"DIA_Firn_Palisada_03_09"); //B�dzie nam potrzebne 30 sztuk.
    B_LogEntry                     (CH1_JobInHuntersCamp,"�eby naprawi� palisad� potrzebujemy 30 gwo�dzi. Musz� ich szuka� w Starym Obozie. ");
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
   description	= "Mam gwo�dzie.";
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
    AI_Output (other, self ,"DIA_Firn_Gwozdzie_15_01"); //Mam gwo�dzie.
    AI_Output (self, other ,"DIA_Firn_Gwozdzie_03_02"); //Dobra. Mo�esz bra� si� do pracy.
    AI_Output (other, self ,"DIA_Firn_Gwozdzie_15_03"); //Co?
    AI_Output (self, other ,"DIA_Firn_Gwozdzie_03_04"); //No, do roboty!
    B_LogEntry                     (CH1_JobInHuntersCamp,"Mam SAM naprawi� palisad�. No dobra. To dla mnie nie pierwszyzna. ");
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
   description	= "Odwali�em ca�� robot� za ciebie.";
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
    AI_Output (other, self ,"DIA_Firn_palisadaSkonczone_15_01"); //Odwali�em ca�� robot� za ciebie.
    AI_Output (self, other ,"DIA_Firn_palisadaSkonczone_03_02"); //I dobrze. Przyda ci si�. 
    AI_Output (other, self ,"DIA_Firn_palisadaSkonczone_15_03"); //Cholera, mia�e� mi pom�c.
    AI_Output (self, other ,"DIA_Firn_palisadaSkonczone_03_04"); //No dobrze. Wynagrodz� ci to. Mo�esz sobie wzi�� t� rud�. 
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Naprawi�em zniszczony wa�. Otrzyma�em 50 bry�ek rudy w nagrod�. ");

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
   description	= "Sprawdzi�em te twoje ha�asy...";
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
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_01"); //Sprawdzi�em te twoje ha�asy...
    AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_02"); //I...? Co to by�o?
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_03"); //W�r�d skalnych p�ek znajduje si� jaskinia. Przesiaduje tam pewien banita ze Starego Obozu. Mieszka tam tak�e kobieta.
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_04"); //Reszt� doko�cz sobie sam. 
    AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_05"); //Cholera. Naprawd� jest tam jaka� kobieta?
    AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_06"); //Tak.
     AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_07"); //Nie do wiary. Staruszek nie�le si� ustawi�.
        B_LogEntry                     (CH1_StrangeVoices,"Przyczyn� rubasznych krzyk�w by� banita ze Starego Obozu i by�a niewolnica Gomeza. Firn nie�le si� zdziwi�. ");
        Log_SetTopicStatus       (CH1_StrangeVoices, LOG_SUCCESS);
        MIS_StrangeVoices = LOG_SUCCESS;

        B_GiveXP (250);
        if (Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2)) && (BaalTondral_GetNewGuy == LOG_SUCCESS)
        {
            AI_Output (other, self ,"DIA_Firn_StaryZaruchal_15_08"); //Zdradz� ci, �e Gilbert rozpocz�� nowe �ycie w Bractwie. Jaskinia jest wi�c wolna. 
            AI_Output (self, other ,"DIA_Firn_StaryZaruchal_03_09"); //Zas�u�y�e� na rud�. Nale�y ci si�.
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
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_01"); //Dobrze, �e jeste�!
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_02"); //Te sukinsyny porwa�y Alexa.
    AI_Output (self, other ,"DIA_Firn_PorwanieInicjacja_03_03"); //Pogadaj ze Stanleyem. On wie najwi�cej.
    MIS_Kidnapping = LOG_RUNNING;

    Log_CreateTopic          (CH3_Kidnapping, LOG_MISSION);
    Log_SetTopicStatus       (CH3_Kidnapping, LOG_RUNNING);
    B_LogEntry               (CH3_Kidnapping,"Firn by� bardzo roztrz�siony. Kto� porwa� Alexa, a ja mam pogada� o tym ze Stanleyem. ");
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
    AI_Output (self, other ,"DIA_Firn_CHAPTER_5_03_01"); //Ej! Jest sprawa. Alex chyba ma dla ciebie jak�� robot�.
    MIS_BigTroll = LOG_RUNNING;

    Log_CreateTopic            (CH5_BigTroll, LOG_MISSION);
    Log_SetTopicStatus       (CH5_BigTroll, LOG_RUNNING);
    B_LogEntry                     (CH5_BigTroll,"Firn twierdzi, �e Alex ma dla mnie jakie� zadanie.");
    AI_StopProcessInfos	(self);
};

