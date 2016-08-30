//poprawione i sprawdzone - Nocturn

// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Cze��! Dok�d si� wybieracie?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Cze��! Dok�d si� wybieracie?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Zabieramy wydzielin� pe�zaczy zdobyt� przez naszych braci w Starej Kopalni do Cor Kaloma.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Codziennie udajemy si� do kopalni po now� porcj� wydzieliny.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Co to za wydzielina?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Co to za wydzielina?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Pozyskujemy j� z wn�trzno�ci pe�zaczy. Przy odrobinie ostro�no�ci mo�na wyci�� ich gruczo�y jadowe.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "Mo�esz mnie nauczy� pozyskiwa� wydzielin� pe�zaczy?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Mo�esz mnie nauczy� pozyskiwa� wydzielin� pe�zaczy?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Oczywi�cie! Natychmiast po zabiciu potwora wytnij jego gruczo�y jadowe. Tylko pod �adnym pozorem nie wolno ci ich uszkodzi�!
	
	PrintScreen	("Nowa umiej�tno��: Wycinanie wn�trzno�ci pe�zaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Jak usuwa� wn�trzno�ci pe�zaczy.");
};

// **************************************************
//			 	Wof�r ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Po co Cor Kalomowi ta wydzielina?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Po co Cor Kalomowi ta wydzielina?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Z tego co wiem, przyrz�dza z nich nap�j, kt�ry zwi�ksza magiczne zdolno�ci Nowicjuszy.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Przygotowujemy si� teraz do wielkiego przyzwania, wi�c potrzebujemy jak najwi�cej tej wydzieliny.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Przy pomocy tego napoju Nowicjusze przywo�aj� �ni�cego.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Niestety! Nasi my�liwi poluj� na pe�zacze dniem i noc�, ale wci�� nie mamy do�� wydzieliny.
};

//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_GorNaDrak_SZPIEG (C_INFO)
{
   npc          = Tpl_1439_GorNaDrak;
   nr           = 1;
   condition    = DIA_GorNaDrak_SZPIEG_Condition;
   information  = DIA_GorNaDrak_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Co wiesz o waszej wsp�pracy ze Stra�nikami?";
};

FUNC INT DIA_GorNaDrak_SZPIEG_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaDrak_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_01"); //Co wiesz o waszej wsp�pracy ze Stra�nikami?
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_02"); //Co? Nic o tym nie s�ysza�em. Ja tylko odbieram dostawy wydzieliny.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_03"); //Zaczekaj. Przypomnia�o mi si�, �e jeszcze kilka dni temu do kopalni uda� si� pos�aniec z Bractwa.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_04"); //Zapyta�em go, jak� wiadomo�� niesie. Odpowiedzia�, �e to jakie� nowe postanowienie.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_05"); //Przypuszczam, �e by�a to wiadomo�� do Iana.
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_06"); //Ta informacja by�a bardzo pomocna.
    AI_StopProcessInfos	(self);
};