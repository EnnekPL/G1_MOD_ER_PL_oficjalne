//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Shan_EXIT(C_INFO)
{
	npc             = TPL_5004_Shan;
	nr              = 999;
	condition	= DIA_Shan_EXIT_Condition;
	information	= DIA_Shan_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Shan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Shan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Shan_WORK (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_WORK_Condition;
   information  = DIA_Shan_WORK_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Shan_WORK_Condition()
{
	if (kapitel < 3) {
    return TRUE; };
};

FUNC VOID DIA_Shan_WORK_Info()
{
    AI_Output (other, self ,"DIA_Shan_WORK_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Shan_WORK_03_02"); //S�u�� Y'Berionowi rad�, opiekuj� si� �wi�tyni�, dbam o drobne sprawy.
    AI_Output (other, self ,"DIA_Shan_WORK_15_03"); //Pewnie du�o z tym zamieszania.
    AI_Output (self, other ,"DIA_Shan_WORK_03_04"); //Nie jest tak �le. Pal� ziele, aby uspokoi� mojego ducha.
};


//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Shan_HELLO (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_HELLO_Condition;
   information  = DIA_Shan_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Shan_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Shan_HELLO_03_01"); //Witaj, przybyszu! Nazywam si� Shan, pokorny s�uga �ni�cego.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_02"); //Jestem pomocnikiem Y'Beriona. Wydaj� tak�e polecenia.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_03"); //Je�eli szukasz pracy, zg�o� si� do mnie.
};

///////////////////////////
// GURU 
//////////////////////////

//========================================
//-----------------> SZEF
//========================================

INSTANCE DIA_Shan_SZEF (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SZEF_Condition;
   information  = DIA_Shan_SZEF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_SZEF_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Shan_SZEF_Info()
{
    AI_Output (self, other ,"DIA_Shan_SZEF_03_01"); //Mistrzu, mamy kilka spraw, kt�rymi natychmiast musisz si� zaj��.
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Shan_QUEST1 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_QUEST1_Condition;
   information  = DIA_Shan_QUEST1_Info;
   permanent	= FALSE;
   description	= "Od czego zaczynamy?";
};

FUNC INT DIA_Shan_QUEST1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Shan_SZEF))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Shan_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_01"); //Od czego zaczynamy?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_02"); //Podczas rytua�u przywo�ania �ni�cego na palcu jak i w �wi�tyni by�o niema�e zamieszanie.
	AI_Output (other, self ,"DIA_Shan_QUEST1_15_03"); //Co w zwi�zku z tym?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_04"); //Wszed� tu jeden z Nowicjuszy i zabra� Kostur �wiat�a nale��cy do Y'Beriona. 
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_05"); //To bardzo wa�ne, aby go odzyska�. Jest nam potrzebny do ceremonii pogrzebu Mistrza.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_06"); //Kostur musi si� znale�� w jego grobie. 
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_07"); //Gdzie mam zacz�� poszukiwania?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_08"); //Popytaj ludzi b�d�cych na placu. M�wi si�, �e z�odziej bardzo szybko wybieg� i wpad� po drodze na naszych braci.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_09"); //Mo�e kto� co� wie...
    MIS_StolenStaff = LOG_RUNNING;

    Log_CreateTopic          (CH3_StolenStaff, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StolenStaff, LOG_RUNNING);
    B_LogEntry               (CH3_StolenStaff,"Shan kaza� mi znale�� z�odzieja, kt�ry w�ama� si� do �wi�tyni podczas rytua�u przywo�ania i ukrad� kostur Y'Beriona. Rabu� wypad� ze �wi�tyni jak oszala�y. Z pewno�ci� potr�ci� kogo� na placu. Tam powinienem szuka� wskaz�wek.");
};
//========================================
//-----------------> QUEST1_WIN
//========================================

INSTANCE DIA_QUEST1_QUEST1_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 3;
   condition    = DIA_QUEST1_QUEST1_WIN_Condition;
   information  = DIA_QUEST1_QUEST1_WIN_Info;
   permanent	= FALSE;
   description	= "Odzyska�em skradziony kostur.";
};

FUNC INT DIA_QUEST1_QUEST1_WIN_Condition()
{
    if (Npc_HasItems (other, Stab_des_Lichts) >=1) && (MIS_StolenStaff == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_QUEST1_QUEST1_WIN_Info()
{
    AI_Output (other, self ,"DIA_QUEST1_QUEST1_WIN_15_01"); //Odzyska�em skradziony kostur.
    AI_Output (self, other ,"DIA_QUEST1_QUEST1_WIN_03_02"); //Prosz�, daj mi go. Zajm� si� jego przechowaniem.
    B_LogEntry           (CH3_StolenStaff,"Odda�em skradziony kostur Shanowi. On dopilnuje, by bro� zosta�a zabezpieczona razem z cia�em Y'Beriona.");
    Log_SetTopicStatus   (CH3_StolenStaff, LOG_SUCCESS);
    MIS_StolenStaff = LOG_SUCCESS;
	
    B_GiveInvItems (other, self, Stab_des_Lichts, 1);

    B_GiveXP (150);
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_Shan_QUEST2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 4;
   condition    = DIA_Shan_QUEST2_Condition;
   information  = DIA_Shan_QUEST2_Info;
   permanent	= FALSE;
   description	= "Co jeszcze jest do zrobienia?";
};

FUNC INT DIA_Shan_QUEST2_Condition()
{
    if (MIS_StolenStaff == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_01"); //Co jeszcze jest do zrobienia?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_02"); //Ca�kiem sporo...
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_03"); //Dowiedzia�em si�, �e w Obozie odbywa si� utajniony obr�t amuletami i talizmanami. Kto� sprzedaje takie artefakty po zawy�onej cenie.
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_04"); //Nie podoba mi si� to. Tylko Guru maj� wy��czno�� na sprzeda� magicznych przedmiot�w. Powiniene� si� tym jak najszybciej zaj��.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_05"); //Dlaczego to takie wa�ne?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_06"); //Sk�d to pytanie? Magiczne artefakty maj� pot�na moc. W niepowo�anych r�kach mog� wyrz�dzi� wiele szk�d. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_07"); //Tylko Guru maj� wystarczaj�co du�o do�wiadczenia, by m�c oceni�, czy Nowicjusz ma czyste intencje. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_08"); //Miej te� na uwadze, �e od kiedy dowiedzieli�my si�, �e �ni�cy jest demonem, ludzie w Obozie zaczynaj� wariowa�. 
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_09"); //Po prostu znajd� tego cz�owieka i naka� mu odda� wszystkie b�yskotki Baal Cadarowi.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_10"); //Mo�esz mnie jako� naprowadzi�?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_11"); //Twoim punktem zaczepienia powinna by� rozmowa z Talasem. To on poinformowa� mnie o tym procederze.
    MIS_StrangeResearcher = LOG_RUNNING;

    Log_CreateTopic          (CH3_StrangeResearcher, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_RUNNING);
    B_LogEntry               (CH3_StrangeResearcher,"Shan kaza� mi odkry� kto w Obozie prowadzi badania nad bagnem. Wskaz�wk� jest to, �e osoba handluje poszukiwanymi przez Y'Beriona przedmiotami.");
};

//========================================
//-----------------> QUEST2_WIN
//========================================

INSTANCE DIA_Shan_QUEST2_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 5;
   condition    = DIA_Shan_QUEST2_WIN_Condition;
   information  = DIA_Shan_QUEST2_WIN_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em tego handlarza.";
};

FUNC INT DIA_Shan_QUEST2_WIN_Condition()
{
    if (MIS_StrangeResearcher == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Steh_QUEST2_YOU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_WIN_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_01"); //Odnalaz�em tego handlarza. Nie b�dzie ju� sprzedawa� artefakt�w.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_02"); //Zgodzi� si� nawet odda� je do �wi�tyni. Nazywa si� Steh.
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_03"); //Doskonale. Teraz amulety i pier�cienie nie wpadn� w niepowo�ane r�ce. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_04"); //Mimo to odczuli�my ju� skutki niepos�usze�stwa Steha.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_05"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_06"); //Porozmawiamy o tym za chwil�. Mistrzu, we� t� rud� ze skrzyni Y'Beriona.
    B_LogEntry               (CH3_StrangeResearcher,"Powiedzia�em Shanowi o mojej rozmowie ze Stehem. By� zadowolony, ale jednocze�nie zaniepokojony. Widocznie sta�o si� co� z�ego.");
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_SUCCESS);
    MIS_StrangeResearcher = LOG_SUCCESS;

    B_GiveXP (120);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> QUEST3
//========================================

INSTANCE DIA_Shan_QUEST3 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 6;
   condition    = DIA_Shan_QUEST3_Condition;
   information  = DIA_Shan_QUEST3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_QUEST3_Condition()
{
    if (MIS_StrangeResearcher == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST3_Info()
{
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_01"); //Wr��my do tego o czym wspomina�em...
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_02"); //Podczas twojej pracy na rzecz Bractwa sta�o si� co� okropnego.
	AI_Output (self, other ,"DIA_Shan_QUEST3_03_03"); //W Obozie dokonano trzech zab�jstw. Jedno po drugim. Ka�de kilka godzin po poprzednim.
    AI_Output (other, self ,"DIA_Shan_QUEST3_15_04"); //Masz jakich� podejrzanych?
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_05"); //Nie. Musisz popyta� w�r�d ludzi, kt�rzy kr�cili si� ko�o miejsc zbrodni. Obejrzyj te� trupy.
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_06"); //Jeden le�y za wielkim drzewem, na kt�rym stoi chata Kaloma.
    AI_Output (self, other ,"DIA_Shan_QUEST3_15_07"); //Drugi przy palisadzie - niedaleko Steha.
    AI_Output (self, other ,"DIA_Shan_QUEST3_03_08"); //A trzeci na bagnie w pobli�u chaty drwala.
    AI_Output (other, self ,"DIA_Shan_QUEST3_15_09"); //W porz�dku. Bior� si� do roboty.
    MIS_PsionicCSI = LOG_RUNNING;
	
	Wld_InsertNpc				(NOV_5011_Martwy_Nowicjusz,"PSI_START");
	B_KillNPC	(NOV_5011_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5010_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5010_Martwy_nowicjusz);
	Wld_InsertNpc				(NOV_5009_Martwy_nowicjusz,"PSI_START");	
	B_KillNPC	(NOV_5009_Martwy_nowicjusz);
    Log_CreateTopic            (CH3_PsionicCSI, LOG_MISSION);
    Log_SetTopicStatus       (CH3_PsionicCSI, LOG_RUNNING);
	
    B_LogEntry                     (CH3_PsionicCSI,"Kto� zabi� trzech Nowicjuszy z Obozu Bractwa. Mam ustali� kim jest zab�jca. Cia�a le�� na miejscach zbrodni: za drzewem na kt�rym stoi laboratorium, przy palisadzie (okolice Steha) i na bagnach w pobli�u chaty drwala.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KILLTOOL
//========================================

INSTANCE DIA_Shan_KILLTOOL (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 6;
   condition    = DIA_Shan_KILLTOOL_Condition;
   information  = DIA_Shan_KILLTOOL_Info;
   permanent	= FALSE;
   description	= "Znalaz�em narz�dzia zbrodni.";
};

FUNC INT DIA_Shan_KILLTOOL_Condition()
{
    if (MIS_StrangeResearcher == LOG_SUCCESS) && (Npc_HasItems (other, ItMw_SiekieraCSI) >=1) && (Npc_HasItems (other, ItMi_OstrzeCSI) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_KILLTOOL_Info()
{
	AI_Output (other, self ,"DIA_Shan_KILLTOOL_15_01"); //Znalaz�em narz�dzia zbrodni.
    AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_02"); //Poka� mi je.
	AI_Output (other, self ,"DIA_Shan_KILLTOOL_15_03"); //To jakie� ostrza i siekiery.
    AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_04"); //Siekiery nosi wielu Nowicjuszy. Wykorzystywali je do budowy chat.
	AI_Output (self, other ,"DIA_Shan_KILLTOOL_03_05"); //Ale te ostrza s� jakie� dziwne. Wygl�daj� jak z tartaku. Rozmawia�e� z Hansonem? Mo�e to on jest zab�jc�?
    B_LogEntry                     (CH3_PsionicCSI,"Pokaza�em narz�dzia zbrodni Shanowi. Powiedzia� mi, �ebym sprawdzi� Hansona, poniewa� tylko on pracuje w tartaku.");
};


//========================================
//-----------------> QUEST3_OK
//========================================

INSTANCE DIA_Shan_QUEST3_OK (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 7;
   condition    = DIA_Shan_QUEST3_OK_Condition;
   information  = DIA_Shan_QUEST3_OK_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z zab�jc�.";
};

FUNC INT DIA_Shan_QUEST3_OK_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Hanson_QUEST2_D))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST3_OK_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_01"); //Rozmawia�em z zab�jc�.
    AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_02"); //Czy stanowi on jeszcze zagro�enie?
	AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_03"); //Nie, ju� nie.
    AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_04"); //Kim on jest?
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_05"); //To Hanson - miejscowy drwal. Powodem morderstw by�a zemsta za d�ugi.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_06"); //Ju� si� ba�em, �e to przez wp�yw �ni�cego ludzie zaczynaj� zachowywa� si� dziwnie.
    AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_07"); //Bo faktycznie zaczynaj�. Trac� wiar� i to sk�ania ich do �amania zasad. Steh, Hanson... Ta lista wkr�tce mo�e si� wyd�u�y�.
	AI_Output (other, self ,"DIA_Shan_QUEST3_OK_15_08"); //Bractwo zaczyna si� rozpada�.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_09"); //Spr�buj� za�agodzi� sytuacj�. Porozmawiam z pozosta�ymi Guru. Powiem im, �eby dostosowali S�owo do nowych warunk�w.
	AI_Output (self, other ,"DIA_Shan_QUEST3_OK_03_10"); //Mistrzu, twoja praca na razie jest zako�czona. Musz� si� teraz zaj�� t� spraw�. 
    B_LogEntry               (CH3_PsionicCSI,"Opowiedzia�em Shanowi o Hansonie. Okazuje si�, �e sytuacja w Obozie robi si� coraz mniej ciekawa. Aby zapobiec kolejnym incydentom Shan porozmawia z pozosta�ymi Guru.");
    Log_SetTopicStatus       (CH3_PsionicCSI, LOG_SUCCESS);
    MIS_PsionicCSI = LOG_SUCCESS;

    B_GiveXP (300);
};

//========================================
//-----------------> QuestsBractwo2
//========================================

INSTANCE DIA_Shan_QuestsBractwo2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_QuestsBractwo2_Condition;
   information  = DIA_Shan_QuestsBractwo2_Info;
   permanent	= FALSE;
   description	= "Czy Bractwo ma dla mnie jakie� zlecenia?";
};

FUNC INT DIA_Shan_QuestsBractwo2_Condition()
{
    if (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QuestsBractwo2_Info()
{
    AI_Output (other, self ,"DIA_Shan_QuestsBractwo2_15_01"); //Czy Bractwo ma dla mnie jakie� zlecenia?
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_02"); //Na pewno co� si� znajdzie. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_03"); //Ostatnio zgin�� nasz badacz. Dosy� stary, brodaty m�czyzna. Wykonywa� pewne zlecenie dla Y'Beriona.
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_04"); //By� te� naszym drugim alchemikiem. Kilka dni temu wyruszy� na bagna, jednak do tej pory nie wr�ci�. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_05"); //Nosi� pancerz Stra�nika �wi�tynnego.  To powinno ci pom�c go odnale��. 
    AI_Output (self, other ,"DIA_Shan_QuestsBractwo2_03_06"); //B�d� ostro�ny i unikaj b�otnych w�y. 
    MIS_OldAlchemist = LOG_RUNNING;
	
    Log_CreateTopic          (CH2_OldAlchemist, LOG_MISSION);
    Log_SetTopicStatus       (CH2_OldAlchemist, LOG_RUNNING);
    B_LogEntry               (CH2_OldAlchemist,"Shan kaza� mi odnale�� starego alchemika, kt�ry przeprowadza� dla Bractwa badania nad bagnem. M�czyzna by� brodaty i nosi� pancerz Stra�nika �wi�tynnego.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Shan_HELLO2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_HELLO2_Condition;
   information  = DIA_Shan_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czyta�em notatki alchemika.";
};

FUNC INT DIA_Shan_HELLO2_Condition()
{
    if (MIS_OldAlchemist == LOG_RUNNING)
    && (czytane_NotatkiAlchemika == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Shan_HELLO2_15_01"); //Czyta�em notatki alchemika. Wynika z nich, �e uda� si� w kierunku Cmentarzyska Ork�w. 
    AI_Output (self, other ,"DIA_Shan_HELLO2_03_02"); //Nawet nie my�l o tym, �eby tam p�j��. To zbyt niebezpieczne. Nasz badacz w ko�cu wr�ci.
    AI_Output (self, other ,"DIA_Shan_HELLO2_03_03"); //Masz przy sobie jego notatki?
    if (Npc_HasItems (other, NotatkiAlchemika) >=1)
    {
        AI_Output (other, self ,"DIA_Shan_HELLO2_15_04"); //Tak. We� je.
        AI_Output (self, other ,"DIA_Shan_HELLO2_03_05"); //Dzi�kuj�.
        CreateInvItems (self, ItMiNugget, 50);
        B_GiveInvItems (self, other, ItMiNugget, 50);
        B_GiveInvItems (other, self, NotatkiAlchemika, 1);
        B_LogEntry                     (CH2_OldAlchemist,"Odda�em Shanowi notatki, kt�re znalaz�em na bagnie. Najpewniej nale�a�y do alchemika.");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_HELLO2_15_06"); //Nie.
        AI_Output (self, other ,"DIA_Shan_HELLO2_03_07"); //Mo�esz ju� i��.
    };
    B_LogEntry                     (CH2_OldAlchemist,"Rozmawia�em z Shanem o moim znalezisku z bagna. Notatki alchemika wykaza�y, �e uda� si� on na Cmentarzysko Ork�w. Nie mam zamiaru tam i�� w najbli�szym czasie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TalkAboutStones
//========================================

INSTANCE DIA_Shan_TalkAboutStones (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_TalkAboutStones_Condition;
   information  = DIA_Shan_TalkAboutStones_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z alchemikiem.";
};

FUNC INT DIA_Shan_TalkAboutStones_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO1))
	&& (MIS_OldAlchemist == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_TalkAboutStones_Info()
{
    AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_01"); //Rozmawia�em z alchemikiem.
    AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_02"); //I co? Gdzie on jest?
    AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_03"); //Nie �yje. Znalaz�em go umieraj�cego na Cmentarzysku Ork�w.
    AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_04"); //Wielka to b�dzie strata. Uda�o ci si� pozna� wyniki jego bada�?
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_HELLO4))
    {
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_05"); //Tak. Cmentarzysko Ork�w nie ma nic wsp�lnego z obiektami na bagnie. 
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_06"); //Te swoiste kaplice to czary �ycia i energii.
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_07"); //Przebywaj�c wok� nich mo�na zregenerowa� swoj� energi� i nie tylko.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_08"); //Gdyby�my mogli panowa� nad ich moc�, mogliby�my zrobi� wiele dobrego.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_09"); //Dzi�kuj� ci za tw� odwag� i po�wi�cenie.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_10"); //We� to jako zap�at�.
        B_LogEntry               (CH2_OldAlchemist,"Shan by� zadowolony, gdy pozna� wyniki bada� alchemika. Szkoda, �e on sam nie m�g� mu o nich opowiedzie�.");
        Log_SetTopicStatus       (CH2_OldAlchemist, LOG_SUCCESS);
        MIS_OldAlchemist = LOG_SUCCESS;

        B_GiveXP (400);
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_11"); //Niestety nie.
        AI_Output (other, self ,"DIA_Shan_TalkAboutStones_15_12"); //Zmar� przedwcze�nie.
        AI_Output (self, other ,"DIA_Shan_TalkAboutStones_03_13"); //Trudno...
        B_LogEntry                     (CH2_OldAlchemist,"Niestety nie uzyska�em kluczowych informacji od alchemika.");
        Log_SetTopicStatus       (CH2_OldAlchemist, LOG_FAILED);
        MIS_OldAlchemist = LOG_FAILED;
		//PrintScreen	("Anulowano zadanie: Poszukiwania alchemika! ", 1,-1,"font_new_10_red.tga",2);	

        B_GiveXP (200);
    };
    CreateInvItems (self, ItMiNugget, 75);
    B_GiveInvItems (self, other, ItMiNugget, 75);
    AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
//////////////////////////////////////////////

//========================================
//-----------------> QuestCH3
//========================================

INSTANCE DIA_Shan_QuestCH3 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_QuestCH3_Condition;
   information  = DIA_Shan_QuestCH3_Info;
   permanent	= FALSE;
   description	= "Mog� co� dla ciebie zrobi�?";
};

FUNC INT DIA_Shan_QuestCH3_Condition()
{
    if (Kapitel >= 3)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QuestCH3_Info()
{
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_01"); //Mog� co� dla ciebie zrobi�?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_02"); //Jest pewna sprawa, kt�r� m�g�by� si� zaj��.
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_04"); //Kto� z naszych sprzedaje eliksir z wn�trzno�ci pe�zaczy do pozosta�ych oboz�w.
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_05"); //Dowiedz si�, kto to jest i natychmiast mi o tym powiedz. Nie wiem od czego mia�by� zacz��. Spr�buj pogada� z handlarzami.
    MIS_SellElixer = LOG_RUNNING;

    Log_CreateTopic          (CH3_SellElixer, LOG_MISSION);
    Log_SetTopicStatus       (CH3_SellElixer, LOG_RUNNING);
    B_LogEntry               (CH3_SellElixer,"Shan kaza� mi odkry�, kto nielegalnie sprzedaje eliksir z wn�trzno�ci pe�zaczy. Towar trafia do pozosta�ych oboz�w. Powinienem popyta� w�r�d handlarzy.");
    AI_StopProcessInfos	(self);
	
	var c_npc dexter;
	dexter = Hlp_GetNpc(STT_329_Dexter);
	CreateInvItems (dexter, ItFo_Potion_Elixier_Egg, 3);
};

//========================================
//-----------------> SellElixirCaine
//========================================

INSTANCE DIA_Shan_SellElixirCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SellElixirCaine_Condition;
   information  = DIA_Shan_SellElixirCaine_Info;
   permanent	= FALSE;
   description	= "Uda�o mi si� odnale�� sprzedawc� eliksiru.";
};

FUNC INT DIA_Shan_SellElixirCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_SellElixirCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_01"); //Uda�o mi si� odnale�� sprzedawc� eliksiru. To Nowicjusz Caine.
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_02"); //Pr�bowa� mnie przekupi�, ale nie przyj��em jego propozycji.
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_03"); //Caine? Nieprawdopodobne. Nie spodziewa�em si� tego po nim. Jest zaufanym cz�owiekiem Cor Kaloma.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_04"); //Ju� chyba nim nie b�dzie...
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_05"); //Oczywi�cie, spotka go kara, jednak w�tpi�, �e zniknie z Obozu. Jego do�wiadczenie jest dla nas bardzo wa�ne.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_06"); //Jaki problem przyuczy� kogo� nowego do pomocy?
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Wiesz, to wymaga czasu. Mamy teraz wa�niejsze sprawy na g�owie. Jednak porozmawiam o tym z mistrzem Kalomem.
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Tak czy inaczej, dobrze si� spisa�e�. Oto twoja nagroda. 
	
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
	
    B_LogEntry               (CH3_SellElixer,"Powiedzia�em o wszystkim Shanowi. Caina chyba jednak nie spotka tak bolesna kara, jak s�dzi�em. Niemniej jednak zachowa�em si� uczciwie, za co Shan mnie wynagrodzi�.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_SUCCESS);
    MIS_SellElixer = LOG_SUCCESS;

    B_GiveXP (XP_SellElixer);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LieAboutCaine
//========================================

INSTANCE DIA_Shan_LieAboutCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_LieAboutCaine_Condition;
   information  = DIA_Shan_LieAboutCaine_Info;
   permanent	= FALSE;
   description	= "Nie uda�o mi si� znale�� sprzedawcy eliksiru.";
};

FUNC INT DIA_Shan_LieAboutCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_LieAboutCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_01"); //Nie uda�o mi si� znale�� sprzedawcy eliksiru.
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_02"); //Sprawdzi�em wszystkie poszlaki, jednak trop si� urwa�.
    AI_Output (self, other ,"DIA_Shan_LieAboutCaine_03_03"); //Nie cieszy mnie ta wiadomo��. Oznacza to, �e zdrajca jest wci�� na wolno�ci. 
	AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_04"); //C�, b�d� musia� poleci� pozosta�ym �wi�tynnym by mieli t� spraw� na uwadze. 
    
    B_LogEntry               (CH3_SellElixer,"Powiedzia�em Shanowi, �e trop w sprawie si� urwa�. Wprawdzie zawali�em zadanie, jednak sporo zarobi�em.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_FAILED);
    MIS_SellElixer = LOG_FAILED;
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Questdadasd
//========================================

INSTANCE DIA_Shan_Questdadasd (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_Questdadasd_Condition;
   information  = DIA_Shan_Questdadasd_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� zadanie?";
};

FUNC INT DIA_Shan_Questdadasd_Condition()
{
    if (Kapitel == 10)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_Questdadasd_Info()
{
    AI_Output (other, self ,"DIA_Shan_Questdadasd_15_01"); //Masz dla mnie jakie� zadanie?
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_02"); //Akurat mia�em ci� prosi� o pomoc.
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_03"); //Podobno zawali�a si� Stara Kopalnia. 
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_04"); //Wiesz co si� sta�o z naszymi bra�mi z tego miejsca?
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_05"); //Polowali na pe�zacze i nie wiem czy zdo�ali uciec.
    AI_Output (self, other ,"DIA_Shan_Questdadasd_03_06"); //Spr�buj ich odszuka�.
    MIS_HelpBrothersBra = LOG_RUNNING;
	B_ExchangeRoutine			(BAN_1603_Martin, "patrol");
    Log_CreateTopic            (CH1_HelpBrothersBra, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_RUNNING);
    B_LogEntry                     (CH1_HelpBrothersBra,"Shan kaza� mi sprawdzi� co sta�o si� z naszymi bra�mi ze Starej Kopalni.");
};

//========================================
//-----------------> Uwolnieni
//========================================

INSTANCE DIA_Shan_Uwolnieni (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_Uwolnieni_Condition;
   information  = DIA_Shan_Uwolnieni_Info;
   permanent	= FALSE;
   description	= "Uwolni�em braci!";
};

FUNC INT DIA_Shan_Uwolnieni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaKosh_Ocaleni))
    && (MIS_HelpBrothersBra == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_Uwolnieni_Info()
{
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_01"); //Uwolni�em braci!
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_02"); //Zostali uwi�zieni za wielk� krat� s�u��c� jako brama do Starej Kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_03"); //Dobra robota, Stra�niku.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_04"); //Masz ze sob� jakie� wie�ci z tamtej cz�ci Kolonii?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_05"); //Sytuacja nie wygl�da najlepiej.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_06"); //Artegor si� zbuntowa� i utworzy� w�asny ob�z przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_07"); //Ob�z ten nie podlega� Gomezowi.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_08"); //Jednak, gdy Magnat dowiedzia� si� o buncie, wys�a� olbrzymi oddzia� swoich ludzi w kierunku kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_09"); //Co si� sta�o potem?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_10"); //Wszyscy zgin�li! Pozosta� tylko Artegor, kt�ry pozwoli� mi uwolni� Gor Na Kosha i innych.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_11"); //Wykaza�e� si� nie lada odwag�.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_12"); //Jestem pe�en podziwu.
    B_LogEntry                     (CH1_HelpBrothersBra,"Przekaza�em Shanowi informacje o wydarzeniach z Kolonii. Przy okazji zosta�em wynagrodzony za uwolnienie braci z kopalni.");
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_SUCCESS);
    MIS_HelpBrothersBra = LOG_SUCCESS;

    B_GiveXP (550);
    //CreateInvItems (self, ItMiNugget, 200);
    //B_GiveInvItems (self, other, ItMiNugget, 200);
    CreateInvItems (self, ItMw_2H_Sword_Heavy_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Sword_Heavy_01, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BAN_THREAD
//========================================

INSTANCE DIA_Shan_BAN_THREAD (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_BAN_THREAD_Condition;
   information  = DIA_Shan_BAN_THREAD_Info;
   permanent	= FALSE;
   description	= "Co si� sta�o?";
};

FUNC INT DIA_Shan_BAN_THREAD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ezehiel_VERY_IMPORTANT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_BAN_THREAD_Info()
{
    AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_01"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_02"); //Dosz�y do nas wie�ci o tym, co wyprawia Gomez.
    if FMTaken
    {
        AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_03"); //Tak, te� o tym s�ysza�em. Stara Kopalnia zosta�a zalana przez podziemn� rzek�. Gomez oszala�.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_04"); //Dobrze, �e jeste� poinformowany.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_05"); //S�ysza�em te� o planach Bandyt�w. Chc�, aby� si� tym zaj�� i zda� mi raport. 
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_06"); //Pogadaj z cz�owiekiem imieniem Drax. Pono� planuje on jak�� rewolucj�.
        if (Npc_KnowsInfo (hero, DIA_Drax_Ded)) && (MIS_HuntersSupport == LOG_SUCCESS)
        {
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_07"); //Ju� rozmawia�em z Draxem. Bandyci chc� pozby� si� patrol�w Stra�nik�w w okolicach Obozu.
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_08"); //Pomog�em im zdoby� wsparcie �owc�w ork�w. Mam nadziej�, �e jako� sobie poradz�.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_09"); //To wszystko?
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_10"); //Tak. Nic wi�cej si� nie wydarzy�o.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_11"); //C�... Pozosta�o czeka� nam na rozw�j wydarze�.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_12"); //Proponuj� ci, aby� uda� si� w okolice Nowego Obozu. Grupa Najemnik�w prowadzi tam walki ze Stra�nikami.
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_13"); //Powiniene� im pom�c.
            AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_14"); //Dlaczego?
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_15"); //Stra�nicy staj� si� coraz wi�kszym zagro�eniem r�wnie� dla naszego Obozu. 
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_16"); //Dlatego musisz wesprze� naszych braci z Nowego Obozu.
			second_d_Shan = false;
			go_help_torlof = true;
			B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Od Shana nie dowiedzia�em si� nic nowego. Sytuacja w Kolonii jest kiepska. Moim zadaniem by�o wsparcie Bandyt�w w ich dzia�aniach. Uprzedzi�em polecenie Shana i ju� to zrobi�em. Teraz musz� i�� do Nowego Obozu i pom�c Najemnikom w walce ze Stra�nikami.");
        }
        else
        {
            AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_17"); //No dobrze. P�jd� z nim pogada�.
			second_d_Shan = true;
			B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Shan martwi si� sytuacj� w Kolonii. Musz� pogada� z Bandyt� Draxem, kt�ry pono� planuje jaki� atak na patrole Gomeza.");
   go_help_torlof = false;
        };
    }
    else
    {
        AI_Output (other, self ,"DIA_Shan_BAN_THREAD_15_18"); //Dosta�em si� tutaj najszybciej jak si� da. Mo�esz mi kr�tko stre�ci� co si� dzieje?
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_19"); //Ot� Stara Kopalnia uleg�a zalaniu przez podziemn� rzek�. Gomez oszala� i kaza� swoim Stra�nikom atakowa� kogo popadnie.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_20"); //Pono� Bandyci planuj� to ukr�ci�. Musisz porozmawia� z niejakim Draxem. Go�� pono� zajmuje si� t� wypraw�.
        AI_Output (self, other ,"DIA_Shan_BAN_THREAD_03_21"); //Gdy to zrobisz, wr�� zda� mi raport.
		B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Shan martwi si� sytuacj� w Kolonii. Musz� pogada� z Bandyt� Draxem, kt�ry pono� planuje jaki� atak na patrole Gomeza.");
   second_d_Shan = true;
   go_help_torlof = false;
    };
};	
	//========================================
//-----------------> DRAX_IMPORTANT
//========================================

INSTANCE DIA_Shan_DRAX_IMPORTANT (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_DRAX_IMPORTANT_Condition;
   information  = DIA_Shan_DRAX_IMPORTANT_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Draxem.";
};

FUNC INT DIA_Shan_DRAX_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded))
    && (MIS_HuntersSupport == LOG_SUCCESS)
    && (second_d_Shan == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_DRAX_IMPORTANT_Info()
{
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_01"); //Rozmawia�em z Draxem.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_03"); //Pomog�em Bandytom zorganizowa� atak na patrole Gomeza. �ci�gn��em im do pomocy �owc�w ork�w.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_04"); //Mam nadziej�, �e sobie poradz�.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_05"); //No dobrze. Proponuj� ci, aby� uda� si� w okolice Nowego Obozu. Grupa Najemnik�w prowadzi tam walki ze Stra�nikami.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_06"); //Powiniene� im pom�c.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_08"); //Stra�nicy staj� si� coraz wi�kszym zagro�eniem r�wnie� dla naszego Obozu. 
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_09"); //Dlatego musisz wesprze� naszych braci z Nowego Obozu.
    B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Musz� uda� si� w kierunku Nowego Obozu i pom�c Najemnikom w walce ze Stra�nikami. ");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELP_TORLOF
//========================================

INSTANCE DIA_Shan_HELP_TORLOF (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_HELP_TORLOF_Condition;
   information  = DIA_Shan_HELP_TORLOF_Info;
   permanent	= FALSE;
   description	= "Pomog�em Torlofowi. ";
};

FUNC INT DIA_Shan_HELP_TORLOF_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_SUCCESS)
    && (go_help_torlof == true) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_HELP_TORLOF_Info()
{
    AI_Output (other, self ,"DIA_Shan_HELP_TORLOF_15_01"); //Pomog�em Torlofowi. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_02"); //�wietnie. Mo�e to da Gomezowi do my�lenia. Ostatnio Stra�nicy zabili Nowicjusza zbieraj�cego zio�a. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_03"); //Nie podoba mi si� to. Je�eli takie zdarzenia b�d� si� powtarza�, b�dziemy musieli przy��czy� si� do tej wojny. 
    AI_Output (self, other ,"DIA_Shan_HELP_TORLOF_03_04"); //Na razie mo�esz ju� i��.
    Log_SetTopicStatus       (CH4_BanditNeedPsionicHelp, LOG_SUCCESS);
    MIS_BanditNeedPsionicHelp = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
};

