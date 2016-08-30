//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler514_EXIT(C_INFO)
{
	npc             = VLK_514_Buddler;
	nr              = 999;
	condition		= DIA_Buddler514_EXIT_Condition;
	information		= DIA_Buddler514_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Buddler514_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler514_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Buddler_HELLO1 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_HELLO1_Condition;
   information  = DIA_Buddler_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Buddler_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_02"); //Jestem Rono. Kiedy� by�em robotnikiem w jednej z vengardzkich stoczni. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_03"); //Z tamtego warsztatu wychodzi�y ogromne okr�ty. Kupcy z gildii Araxos wydawali krocie na ich zakup. Ale to jednak nic w por�wnaniu z tymi bogactwami, jakie gildia przewozi�a na tych statkach. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_04"); //Jako prosty robotnik nie zarabia�em jednak zbyt wiele, wi�c musia�em sobie jako� radzi�. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_05"); //Wielu z nas wynosi�o narz�dzia ze stoczni, by je potem opchn�� na czarnym rynku. Troch� chyba jednak przesadzili�my, bo w�a�ciciel zacz�� w�szy�. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_06"); //Pech chcia�, �e pewnego razu przy�apa� w�a�nie mnie. Tak wyl�dowa�em w tym zat�ch�ym miejscu. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Buddler_HELLO2 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_HELLO2_Condition;
   information  = DIA_Buddler_HELLO2_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Buddler_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO2_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Buddler_HELLO2_03_02"); //Stara bieda.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Buddler_HELLO3 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_HELLO3_Condition;
   information  = DIA_Buddler_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jak�� rad�?";
};

FUNC INT DIA_Buddler_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO3_15_01"); //Masz dla mnie jak�� rad�?
    AI_Output (self, other ,"DIA_Buddler_HELLO3_03_02"); //Jak b�dziesz mia� k�opoty z kim� wp�ywowym w tym obozie, zg�o� si� do Gravo. Nie raz pomaga� wychodzi� Kopaczom z r�nych opresji.
    AI_Output (self, other ,"DIA_Buddler_HELLO3_03_03"); //Oczywi�cie nie za darmo. 
};

//========================================
//-----------------> YourHut
//========================================

INSTANCE DIA_Buddler_YourHut (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_YourHut_Condition;
   information  = DIA_Buddler_YourHut_Info;
   permanent	= FALSE;
   description	= "Nie przeszkadza ci, �e wszyscy przechodz� przez twoj� chat�?";
};

FUNC INT DIA_Buddler_YourHut_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_YourHut_Info()
{
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_01"); //Nie przeszkadza ci, �e wszyscy przechodz� przez twoj� chat�?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_02"); //He he he... Pewnie rozmawia�e� ju� z Kyle'm. On si� nigdy nie zmieni...
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_03"); //Wracaj�c do pytania, z pocz�tku mi to przeszkadza�o, jednak przywyk�em. W mojej chacie i tak nie ma nic warto�ciowego.
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_04"); //No mo�e pr�cz pewnego talerza, lecz on ma warto�� wy��cznie sentymentaln�. 
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_05"); //Nie boisz si�, �e kto� mimo to spr�buje go ukra��?    
	AI_Output (self, other ,"DIA_Buddler_YourHut_03_06"); //Nie, bo nawet ja sam nie jestem w stanie si� do niego dosta�. 
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_07"); //Jak to?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_08"); //Skrzynia zatrzasn�a si� kilka lat temu. Jest okropnie stara i zamek zardzewia�.
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_09"); //W�a�ciwie to m�g�bym poprosi� R�czk� o pomoc w jej otwarciu, ale tak si� sk�ada, �e nienawidz� tego sukinsyna.
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_10"); //Dlaczego?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_11"); //Pewna stara za�y�o��. Nie rozmawiajmy o tym. A ty znasz si� na otwieraniu zamk�w? Chcesz spr�bowa� otworzy� ten kufer?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_12"); //Droga wolna. Je�eli ci si� uda, dam ci 25 bry�ek rudy, albo szepn� o tobie dobre s��wko Relgharowi. 
	
	MIS_ChestAndPlate = LOG_RUNNING;

    Log_CreateTopic         	(CH1_ChestAndPlate, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ChestAndPlate, LOG_RUNNING);
    B_LogEntry              		(CH1_ChestAndPlate,"Kopacz Rono ma w swojej chacie zatrza�ni�t� skrzyni�, w kt�rej znajduje si� sentymentalny talerz. Je�li uda mi si� do niej w�ama�, zyskam poparcie Cienia Relghara, albo nagrod� w postaci kilku bry�ek rudy.");
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Je�li pomog� Kopaczowi Rono odzyska� sentymentalny talerz, to szepnie o mnie Cienowi Relgharowi. ");
};

//========================================
//-----------------> GivePlate
//========================================

INSTANCE DIA_Buddler_GivePlate (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 5;
   condition    = DIA_Buddler_GivePlate_Condition;
   information  = DIA_Buddler_GivePlate_Info;
   permanent	= FALSE;
   description	= "Mam tw�j talerz.";
};

FUNC INT DIA_Buddler_GivePlate_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_YourHut))
    && (Npc_HasItems (other, ItMi_RonosPlate) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_GivePlate_Info()
{
    AI_Output (other, self ,"DIA_Buddler_GivePlate_15_01"); //Mam tw�j talerz.
    AI_Output (self, other ,"DIA_Buddler_GivePlate_03_02"); //Niemo�liwe. Masz talent do tej roboty!
	
	MIS_ChestAndPlate = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_ChestAndPlate, LOG_SUCCESS);
	B_LogEntry               (CH1_ChestAndPlate,"Otwarcie skrzyni faktycznie by�o trudne, jednak uda�o mi si�. Zwr�ci�em w�a�cicielowi jego w�asno��.");
	B_GiveXP (100);
	
	B_GiveInvItems (other, self, ItMi_RonosPlate,1);
	
    if (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_03"); //Widz�, �e nie do��czy�e� jeszcze do �adnego z oboz�w. Szepn� o tobie dobre s��wko Relgharowi. 
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_04"); //Na wszelki wypadek. Gdyby� chcia� zosta� u nas na d�u�ej. 
		
		B_LogEntry (CH1_JoinOC,"Pomog�em Rono odzyska� talerz. Zapewni� mnie, �e b�d� mia� poparcie Cienia Relghara. Najlepiej jednak jak zapytam go osobi�cie.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_05"); //Nie wiem jak mam ci dzi�kowa�. Widz�, �e masz ju� swoj� frakcj�, wi�c na nic ci poparcie u Relghara
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_06"); //Masz wi�c 30 bry�ek rudy. Obieca�em mniej, ale naprawd� zas�u�y�e�. Daruj� sobie jedn� kolejk� w karczmie wieczorem.
		
		CreateInvItems (self, itminugget, 30);
		B_GiveInvItems (self, other, itminugget,30);
    };
};

