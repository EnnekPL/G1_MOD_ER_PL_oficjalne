//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Miguel_EXIT(C_INFO)
{
	npc             = BAN_1600_Miguel;
	nr              = 999;
	condition	= DIA_Miguel_EXIT_Condition;
	information	= DIA_Miguel_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Miguel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Miguel_HELLO1 (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_HELLO1_Condition;
   information  = DIA_Miguel_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Miguel_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Miguel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Miguel_HELLO1_03_02"); //Nazywam si� Miguel. Tyle powinno ci wystarczy�.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Miguel_HELLO2 (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_HELLO2_Condition;
   information  = DIA_Miguel_HELLO2_Info;
   permanent	= FALSE;
   description	= "Podobno masz mi pom�c z magnackimi pier�cieniami.";
};

FUNC INT DIA_Miguel_HELLO2_Condition()
{
    if (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_01"); //Podobno masz mi pom�c z magnackimi pier�cieniami.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_02"); //Quentin jeszcze sobie nie da� z nimi spokoju?
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_03"); //Najwyra�niej nie.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_04"); //No dobra. Uda�o mi si� namierzy� jedn� z tych b�yskotek.
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_05"); //Zamieniam si� w s�uch.
	if (Npc_KnowsInfo(hero,DIA_Bartholo_DOWODY))
	{
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_06"); //Jeszcze nie skojarzy�e�?
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_07"); //Jeden z tych pier�cieni odda�e� Bartholo. Pami�tasz?
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_08"); //Cholera! Co teraz?
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_09"); //Spokojnie. Wiem, gdzie go schowa�.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_10"); //Jest w skrzyni ukrytej nad strzelnic�. Strzelnica to ta wielka szopa w kt�rej znajduj� si� tarcze. By� mo�e trzeba b�dzie tam wej�� przez pokoje Stra�nik�w.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_11"); //Tak si� sk�ada, �e ukrad�em ten klucz. Stra�nicy jednak niezbyt za mn� przepadaj�. Jeste� nowy, u�pij ich czujno��.
    B_LogEntry                     (CH1_BaronsRings,"Miguel zdradzi� mi, �e jeden z pier�cieni znajduje si� w skrzyni nad dawn� sal� treningow�. Gdy odnajd� pier�cie�, mam go zanie�� Miguelowi.");
	CreateInvItems (self, ItKe_Miguel, 1);
    B_GiveInvItems (self, other, ItKe_Miguel, 1);
	}
	else 
	{
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_12"); //Pier�cie� zosta� ukradziony kilka lat temu przez pewnego Cienia. Wo�aj� na niego �wistak.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_13"); //Kojarzysz go�cia? Mieszka nieopodal. Sprawd� jego chat�.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_14"); //Wierni ludzie Gomeza. Ha! W�a�nie wida�. �a�osne...
	B_LogEntry                     (CH1_BaronsRings,"Poszukiwania pier�cienia powinienem zacz�� od chaty �wistaka.");
	};
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_15"); //Jak ju� ukradniesz pier�cie�, przynie� mi go. Dam ci dalsze wskaz�wki.
};
//========================================
//-----------------> FindFirstRing
//========================================

INSTANCE DIA_Miguel_FindFirstRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_FindFirstRing_Condition;
   information  = DIA_Miguel_FindFirstRing_Info;
   permanent	= FALSE;
   description	= "Mam pier�cie�.";
};

FUNC INT DIA_Miguel_FindFirstRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_FindFirstRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_FindFirstRing_15_01"); //Mam pier�cie�.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_02"); //Widzisz? To nie by�o takie trudne.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_03"); //B�dzie z ciebie dobry z�odziej.
    AI_Output (other, self ,"DIA_Miguel_FindFirstRing_15_04"); //Uprzejmo�ci potem. Co robimy dalej?
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_05"); //Proponuj� przeszuka� pokoje Magnat�w.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_06"); //Na pewno zostawili jakie� wskaz�wki. Musisz dok�adnie poszuka�.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_07"); //Tylko nie daj si� z�apa� Stra�nikom!
    B_LogEntry                     (CH1_BaronsRings,"Kolejne wskaz�wki dotycz�ce pier�cieni znajd� w pokojach Magnat�w.");

    B_GiveXP (125);
};
//========================================
//-----------------> MagnaciEnter
//========================================

INSTANCE DIA_Miguel_MagnaciEnter (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_MagnaciEnter_Condition;
   information  = DIA_Miguel_MagnaciEnter_Info;
   permanent	= FALSE;
   description	= "Jak niby mam wej�� do siedziby Magnat�w?";
};

FUNC INT DIA_Miguel_MagnaciEnter_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_FindFirstRing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_MagnaciEnter_Info()
{
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_01"); //Jak niby mam wej�� do siedziby Magnat�w?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_02"); //Cholera, nie pomy�la�em o tym. Ale spokojnie, zaraz znajd� jakie� wyj�cie...
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_03"); //My�l�, �e kt�ry� z wp�ywowych Cieni pomo�e ci si� tam dosta�. 
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_04"); //Sk�d mam wiedzie�, kt�ry Cie� mi pomo�e? I czy zrobi to za darmo? A mo�e wystarczy przekupi� Stra�nik�w?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_05"); //Nigdy nie uda nam si� przekupi� Stra�nik�w. 
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_06"); //S� a� tak wierni Gomezowi?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_07"); //Nie, sk�d�e. Po prostu s� ci�ci na Bandyt�w. Gdy tylko zauwa��, �e kr�cisz z Quentinem, wydadz� ci� w r�ce Thorusa. A wtedy czeka ci� rych�a �mier�.
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_08"); //Co do tego Cienia... hmm... On raczej te� nie b�dzie si� pali� do pomocy. Powiniene� znale�� na kogo� haka, zaszanta�owa� go.
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_09"); //Tutejsi informatorzy z pewno�ci� ci w tym pomog�. Pami�taj, �eby w takich sprawach nie oszcz�dza� rudy. Ka�da wiadomo�� jest cenna i mo�e ci si� zwr�ci� potr�jnie.
    B_LogEntry                     (CH1_BaronsRings,"Aby wej�� do komnat Magnat�w, b�d� musia� zaszanta�owa� kt�rego� z Cieni, by za mnie por�czy�. Wi�cej informacji uzyskam od lokalnych informator�w.");
};

//========================================
//-----------------> FindSecondRing
//========================================

INSTANCE DIA_Miguel_FindSecondRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_FindSecondRing_Condition;
   information  = DIA_Miguel_FindSecondRing_Info;
   permanent	= FALSE;
   description	= "Mam kolejny pier�cie�.";
};

FUNC INT DIA_Miguel_FindSecondRing_Condition()
{
    if (Npc_HasItems (other, EBR_Ring2) >=1) && (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_FindSecondRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_01"); //Mam kolejny pier�cie�.
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_02"); //By� w komnacie Gomeza.
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_03"); //Pewnie le�a� sobie na stole.
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_04"); //Dok�adnie tak.
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_05"); //Ha ha ha. Co za g�upiec!
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_06"); //Dobra robota.
    B_GiveXP (150);
	B_LogEntry      (CH1_BaronsRings,"Odda�em Miguelowi pier�cie�, kt�ry znalaz�em na stole w pokoju Gomeza. Pora poszuka� ostatniego.");
};

//========================================
//-----------------> AboutThirdRing
//========================================

INSTANCE DIA_Miguel_AboutThirdRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_AboutThirdRing_Condition;
   information  = DIA_Miguel_AboutThirdRing_Info;
   permanent	= FALSE;
   description	= "Gdzie szuka� trzeciego pier�cienia?";
};

FUNC INT DIA_Miguel_AboutThirdRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_FindSecondRing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_AboutThirdRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_AboutThirdRing_15_01"); //Gdzie szuka� trzeciego pier�cienia?
    AI_Output (self, other ,"DIA_Miguel_AboutThirdRing_03_02"); //Ci�ko powiedzie�. Nie wiem dok�adnie, ale na pewno gdzie� na zamku.
    AI_Output (self, other ,"DIA_Miguel_AboutThirdRing_03_03"); //My�l�, �e powiniene� poci�gn�� za j�zyk s�u�b� Gomeza. Mo�e kto� co� wie. Lepiej naszykuj sakiewk�.
    B_LogEntry                     (CH1_BaronsRings,"Miguel nie wie, gdzie znajduje si� trzeci pier�cie�. Aby go odnale�� musz� zasi�gn�� j�zyka w�r�d zamkowego personelu. ");
};

//========================================
//-----------------> IFindThirdRing
//========================================

INSTANCE DIA_Miguel_IFindThirdRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_IFindThirdRing_Condition;
   information  = DIA_Miguel_IFindThirdRing_Info;
   permanent	= FALSE;
   description	= "Mam nast�pny pier�cie�.";
};

FUNC INT DIA_Miguel_IFindThirdRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    && (Npc_HasItems (other, EBR_Ring3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_IFindThirdRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_IFindThirdRing_15_01"); //Mam nast�pny pier�cie�.
    AI_Output (self, other ,"DIA_Miguel_IFindThirdRing_03_02"); //�wietnie.
    B_GiveXP (200);
	B_LogEntry                     (CH1_BaronsRings,"Odda�em Miguelowi pier�cie�, kt�ry znalaz�em w kuchni Magnat�w. To by� ju� ostatni.");
	
	AI_StopProcessInfos (Self);
};

//========================================
//-----------------> AllRings
//========================================

INSTANCE DIA_Miguel_AllRings (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_AllRings_Condition;
   information  = DIA_Miguel_AllRings_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Miguel_AllRings_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_IFindThirdRing))
    && (Npc_KnowsInfo (hero, DIA_Miguel_FindSecondRing))
    && (Npc_KnowsInfo (hero, DIA_Miguel_FindFirstRing))
    && (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_AllRings_Info()
{
    AI_Output (self, other ,"DIA_Miguel_AllRings_03_01"); //Pokaza�e� mi wszystkie pier�cienie. Mo�esz zanie�� je Quentinowi.
    AI_Output (self, other ,"DIA_Miguel_AllRings_03_02"); //B�dzie bardzo zadowolony.
    B_LogEntry                     (CH1_BaronsRings,"Odnalezione pier�cienie musz� trafi� do Quentina.");

    B_GiveXP (400);
};

//========================================
//-----------------> QuentinUcieczka
//========================================

INSTANCE DIA_Miguel_QuentinUcieczka (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_QuentinUcieczka_Condition;
   information  = DIA_Miguel_QuentinUcieczka_Info;
   permanent	= FALSE;
   description	= "Nie wr�ci�e� do Obozu Bandyt�w?";
};

FUNC INT DIA_Miguel_QuentinUcieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_QuentinUcieczka_Info()
{
    AI_Output (other, self ,"DIA_Miguel_QuentinUcieczka_15_01"); //Nie wr�ci�e� do Obozu Bandyt�w?
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_02"); //Nie! I nie mam zamiaru...
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_03"); //Dexter nam�wi� mnie do ucieczki. Powiedzia�, �e z Krukiem mam wi�ksze szanse na prze�ycie ni� z Quentinem.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_04"); //I chyba mia� troch� racji.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_05"); //Gdybym wr�ci� do Obozu ju� gryz�bym ziemi�.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_06"); //S�ysza�em, �e Stra�nicy wreszcie go odkryli. 
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_07"); //Teraz zosta�o mi tylko czeka�, a� Kruk wr�ci ze Starego Obozu i liczy� na pozytywny bieg zdarze�.
    AI_Output (other, self ,"DIA_Miguel_QuentinUcieczka_15_08"); //Wiesz po co Kruk tam poszed�?
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_09"); //Nie, to jego sprawy. Gomez nawet nie wie o naszej ucieczce. 
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_10"); //Przypuszczam, �e Kruk chce wszystko zatuszowa�, albo jeszcze co� zrobi� w Obozie.
};