//***poprawny***

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Marius_EXIT(C_INFO)
{
	npc             = NON_3923_Wiezien;
	nr              = 999;
	condition	= DIA_Marius_EXIT_Condition;
	information	= DIA_Marius_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Marius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Marius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Marius_HELLO1 (C_INFO)
{
   npc          = NON_3923_Wiezien;
   nr           = 1;
   condition    = DIA_Marius_HELLO1_Condition;
   information  = DIA_Marius_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Marius_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Marius_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_01"); //Ach, tylko nie ty! Zostaw mnie w spokoju, jestem niewinny! To wszystko wina Bloodwyna!
	if (Npc_GetTrueGuild(other) != GIL_GRD)
	{
    AI_Output (other, self ,"DIA_Marius_HELLO1_15_02"); //O czym ty m�wisz? Nie jestem Stra�nikiem Gomeza.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_03"); //Ach, faktycznie nie wygl�dasz jak Bullit. S�uchaj, musisz mi pom�c si� st�d wydosta�, ten sukinsyn mnie torturuje!
	AI_Output (self, other ,"DIA_Marius_HELLO1_03_04"); //Bloodwyn to jego przyjaciel, a ta gnida zn�ca�a si� nade mn� tylko dlatego, �e nie mia�em z czego zap�aci� mu za ochron�.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_05"); //Musisz mi pom�c! D�u�ej tego nie znios�!
    AI_Output (other, self ,"DIA_Marius_HELLO1_15_06"); //A co ja mog� teraz zrobi�? Przebra� si� za s�u�ebnic� Adanosa i ci� wyzwoli�? Nie jestem nikim wa�nym w Starym Obozie.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_07"); //Niech ci� Beliar poch�onie, psie! Ciebie i tych przekl�tych Stra�nik�w.
	};
};

//========================================
//-----------------> GomezDie
//========================================

INSTANCE DIA_Wiezien_GomezDie (C_INFO)
{
   npc          = NON_3923_Wiezien;
   nr           = 1;
   condition    = DIA_Wiezien_GomezDie_Condition;
   information  = DIA_Wiezien_GomezDie_Info;
   permanent	= FALSE;
   description	= "Gomez nie �yje. Jeste� wolny. ";
};

FUNC INT DIA_Wiezien_GomezDie_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0)) && (Npc_KnowsInfo (hero, DIA_Marius_HELLO1))  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wiezien_GomezDie_Info()
{
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_01"); //Gomez nie �yje. Jeste� wolny. 
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_02"); //Co? Jak to mo�liwe?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_03"); //Kto tego dokona�?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_04"); //Zreszt�, nieistotne. Ten sukinsyn gryzie ziemi�? Nie mog� w to uwierzy�! 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_05"); //Kruk wraz ze spor� cz�ci� zaufanych ludzi opu�ci� Stary Obozu. Jest ju� tu w miar� bezpiecznie. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_06"); //Wielu Stra�nik�w zgin�o w Wolenej Kopalni, pozosta�a cz�� z nich zosta�a zabita przez Bandyt�w. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_07"); //Tutaj zosta�y ju� same niedobitki. 
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_08"); //Niesamowite. Poczekam jeszcze troch� i wyjd� na g�r�. My�lisz, �e uda mi si� tam znale�� jak�� bro� i ubranie?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_09"); //Nie mog� uciec z pustymi r�koma. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_10"); //Na g�rze le�y pe�no trup�w Stra�nik�w. Wielu skaza�c�w opusci�o swoje chaty. My�l�, �e b�dziesz w stanie co� znale��.
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_11"); //Doskonale. Dzi�ki. Mo�e si� jeszcze zobaczymy! 
    AI_StopProcessInfos	(self);
};



