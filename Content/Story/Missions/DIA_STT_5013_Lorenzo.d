//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Lorenzo_EXIT(C_INFO)
{
	npc             = STT_5013_Lorenzo;
	nr              = 999;
	condition		= DIA_Lorenzo_EXIT_Condition;
	information		= DIA_Lorenzo_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Lorenzo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lorenzo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Lorenzo_HELLO1 (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_HELLO1_Condition;
   information  = DIA_Lorenzo_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Lorenzo_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lorenzo_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Lorenzo_HELLO1_03_02"); //A co� ty za jeden, �e ci� to interesuje? Chcesz pracowa� w Kopalni? Za�atwiam zmiany i ludzi do pracy Ianowi.
	AI_Output (self, other ,"DIA_Lorenzo_HELLO1_03_03"); //Nie ma si� czego ba�. Uczciwa praca ka�demu si� przyda. No co si� tak gapisz?
};

//========================================
//-----------------> YOURWORK
//========================================

INSTANCE DIA_Lorenzo_YOURWORK (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_YOURWORK_Condition;
   information  = DIA_Lorenzo_YOURWORK_Info;
   permanent	= 0;
   description	= "Na czym dok�adnie polega twoja praca?";
};

FUNC INT DIA_Lorenzo_YOURWORK_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lorenzo_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_YOURWORK_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_YOURWORK_15_01"); //Na czym dok�adnie polega twoja praca?
    AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_02"); //Cholera, co za upierdliwy typ. Dbam o to, by r�ne szumowiny bez przysz�o�ci mia�y co robi�. Organizuj� zmiany ludzi do Starej Kopalni i przyjmuj� nowych.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_03"); //To JA decyduj� kogo Artegor przepuszcza, a kto dostaje kopa w dup�.
	AI_Output (other, self ,"DIA_Lorenzo_YOURWORK_15_04"); //Do Kopalni nie mo�na swobodnie wchodzi�? 
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_05"); //Nie! I to ju� od jakiego� czasu. C�, rozporz�dzenie odg�rne. Po korytarzach i magazynach pod ziemi� kr�ci�o si� zbyt du�o obibok�w i marnych z�odziejaszk�w.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_06"); //Szczeg�lnie tych brudas�w z Nowego Obozu. Wsz�dzie si� wepchaj�. Kupowali ubrania od Kopaczy, przekupywali Stra�nik�w, a niekt�rzy durnie nawet pr�bowali ich zastrasza�.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_07"); //Ale takie numery to nie z naszymi lud�mi. Teraz te bandziory dyndaj� na wietrze, he he...
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_08"); //A i pami�taj: moi ludzie to Graham i Petro, tak�e nie wkurzaj ich, bo to silne ch�opaki. 
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_09"); //Graham mo�e wygl�da niepozornie, ale to bardzo dobry rysownik i kartograf. Niezwykle przydatny cz�owiek.
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_Lorenzo_PERM (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_PERM_Condition;
   information  = DIA_Lorenzo_PERM_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_Lorenzo_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lorenzo_PERM_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_PERM_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Lorenzo_PERM_03_02"); //Mhm...
	AI_Output (other, self ,"DIA_Lorenzo_PERM_15_03"); //Co?
	AI_Output (self, other ,"DIA_Lorenzo_PERM_03_04"); //Jazda do roboty, a nie mi si� po chacie b�dziesz kr�ci�!
};


//========================================
//-----------------> BRINGLIST
//========================================

INSTANCE DIA_Lorenzo_BRINGLIST (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_BRINGLIST_Condition;
   information  = DIA_Lorenzo_BRINGLIST_Info;
   permanent	= 0;
   description	= "Potrzebuj� przepustki do Kopalni.";
};

FUNC INT DIA_Lorenzo_BRINGLIST_Condition()
{
	if  (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_BRINGLIST_Info()
{

    AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_01"); //Potrzebuj� przepustki do Kopalni.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_02"); //A ja potrzebuj� flaszki najlepszego wina na Khorinis i czterech nowych ludzi do pracy. Jak widzisz nie mo�emy sobie pom�c.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_03"); //Za�atwi� ludzi.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_04"); //Ambitny, co? Po grzyba ci ta przepustka? Szukasz uczciwej pracy?
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_05"); //Diego zleci� mi pewne zadanie...
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_06"); //Ha ha... Diego zleci�... Doprawdy? Nie mog� ci wyda� przepustki.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_07"); //A to dlaczego?
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_08"); //To proste. Nie mam ludzi do pracy, wi�c jak chcesz dosta� si� do Kopalni, b�dziesz musia� zosta� Kopaczem. Za�atwisz mi jeszcze trzech ludzi i wyruszycie od razu.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_09"); //Gdy ju� znajdziesz si� pod ziemi�, wtedy wykonasz swoje zlecenie i mo�e Ian uwierzy w twoj� historyjk�.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_10"); //A je�li tego nie zrobi? Znaj�c was, jest to bardzo mo�liwe.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_11"); //Wtedy b�dziesz musia� chwyci� za kilof i zacz�� kopa�. Im szybciej wykopiesz rud�, tym szybciej spotkasz si� z powrotem z Diegiem.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_12"); //O ile to co m�wisz jest prawd�...
	
	
	MIS_ZmianaLorenza = LOG_RUNNING;
	Log_CreateTopic          (Ch1_ZmianaLorenza, LOG_MISSION);
    Log_SetTopicStatus       (Ch1_ZmianaLorenza, LOG_RUNNING);
    B_LogEntry               (Ch1_ZmianaLorenza,"Je�li chc� wej�� do Starej Kopalni, b�d� musia� zosta� Kopaczem. Lorenzo nie da� mi nawet cienia nadziei na to, �e za�atwi mi przepustk�. Musz� za�atwi� trzech nowych ludzi na zmian� do pracy w Kopalni. Najlepiej pogada� z Kopaczami b�d�cymi w Obozie.");
	}
	else
	{
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_13"); //Zje�d�aj, dobra?!
	AI_StopProcessInfos (self);
	};
};

//========================================
//-----------------> OFERTA
//========================================

INSTANCE DIA_Lorenzo_OFERTA (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_OFERTA_Condition;
   information  = DIA_Lorenzo_OFERTA_Info;
   permanent	= 0;
   description	= "Podobno trzeba odnie�� raport do zamku.";
};

FUNC INT DIA_Lorenzo_OFERTA_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_LorenzoCourier)) && MIS_ZmianaLorenza == LOG_RUNNING
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_OFERTA_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_OFERTA_15_01"); //Podobno trzeba odnie�� raport z Kopalni do zamku. Przeczyta�e� go ju�?
    AI_Output (self, other ,"DIA_Lorenzo_OFERTA_03_02"); //Ha ha! Spryciarz! My�lisz, �e w ten spos�b dostaniesz si� do zamku? Nie tak �atwo kolego. Raport PRZED CHWIL� trafi� do Eckera.
	AI_Output (self, other ,"DIA_Lorenzo_OFERTA_03_03"); //Troch� si� sp�ni�e�.
	B_LogEntry(CH1_ZmianaLorenza, "Idealnie si� z�o�y�o. Raport w�a�nie przed chwil� trafi� w r�ce Cienia Eckera. Musz� go szybko ukra��.");
};

//========================================
//-----------------> ITS_ALL
//========================================

INSTANCE DIA_Lorenzo_ITS_ALL (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_ITS_ALL_Condition;
   information  = DIA_Lorenzo_ITS_ALL_Info;
   permanent	= 0;
   description	= "Mam ju� trzech ludzi do pracy!";
};

FUNC INT DIA_Lorenzo_ITS_ALL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Erens_NALDURLOSE)) && (Npc_KnowsInfo (hero, DIA_Urban_OHMYHEAD)) && TogardPrzekonany == true && MIS_ZmianaLorenza == LOG_RUNNING
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_ITS_ALL_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_ITS_ALL_15_01"); //Mam ju� trzech ludzi do pracy!
    AI_Output (self, other ,"DIA_Lorenzo_ITS_ALL_03_02"); //Dobra robota. B�d� z ciebie ludzie. My�l�, �e mog� ci� teraz przyj�� do Kopaczy. Wtedy uzyskasz dost�p do wn�trza Kopalni.
	AI_Output (self, other ,"DIA_Lorenzo_ITS_ALL_03_03"); //Chcesz tego?
	
	B_LogEntry                     (CH1_ZmianaLorenza,"Zorganizowa�em zmian� do Kopalni. Mog� teraz zosta� Kopaczem, a tym samym do��czy� do Starego Obozu i zrobi� pierwszy krok ku zostaniu Cieniem.");
    Log_SetTopicStatus       (CH1_ZmianaLorenza, LOG_SUCCESS);
    MIS_ZmianaLorenza = LOG_SUCCESS;
};

//========================================
//-----------------> GET_GUILD
//========================================

INSTANCE DIA_Lorenzo_GET_GUILD (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_GET_GUILD_Condition;
   information  = DIA_Lorenzo_GET_GUILD_Info;
   permanent	= 0;
   description	= "Chc� zosta� Kopaczem.";
};

FUNC INT DIA_Lorenzo_GET_GUILD_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lorenzo_ITS_ALL)) && (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_GET_GUILD_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_GET_GUILD_15_01"); //Chc� zosta� Kopaczem.
    AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_02"); //Rozs�dny wyb�r skoro naprawd� chcesz si� dosta� do Starej Kopalni. Petro czeka ju� przed Obozem. Zaprowadzi was do Kopalni. 
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_03"); //Przy wej�ciu zaczepi ci� Artegor. Powiedz, �e przysy�a ci� Lorenzo i �e do nas do��czy�e�. Nie powinien robi� k�opot�w. 
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_04"); //Zw�aszcza je�li zobaczy z wami Petro. Gdy ju� wejdziesz do Kopalni, twoim zwierzchnikiem stanie si� Ian. To on rz�dzi w Kopalni.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_05"); //By� mo�e �yknie twoj� histori� o zadaniu dla Diego. Je�li nie, to b�dziesz musia� wykopa� okre�lon� ilo�� rudy. Ale to ju� z nim uzgodnisz.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_06"); //Acha, nie dostaniesz od nas �adnego pancerza. Kup sobie ubranie robocze u Fiska, je�li jeszcze tego nie zrobi�e�.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_07"); //Jako �e dobrze si� spisa�e� z t� zmian�, mog� cz�ciowo ufundowa� ci uniform. Te sto bry�ek rudy b�dzie w sam raz na pocz�tek. 
	
	CreateInvItems (self, itminugget,100);
	B_GiveInvItems (self,other,itminugget,100);
	B_GiveXP (XP_BecomeVlk);
	B_LogEntry     (CH1_BringList,"Do��czy�em do Kopaczy, wi�c nie b�d� mia� ju� problem�w z wej�ciem do Starej Kopalni.");
	hero.guild = GIL_VLK;
	Npc_SetTrueGuild (hero,GIL_VLK);
	HeroJoinToOC ();
	
	
};