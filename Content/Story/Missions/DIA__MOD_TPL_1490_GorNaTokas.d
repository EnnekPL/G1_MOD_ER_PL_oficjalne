//poprawione i sprawdzone - Nocturn

//poprawne g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorNaTokas_EXIT(C_INFO)
{
	npc             = TPL_1490_GorNaTokas;
	nr              = 999;
	condition	= DIA_GorNaTokas_EXIT_Condition;
	information	= DIA_GorNaTokas_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorNaTokas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorNaTokas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1_ZWYKLY
//========================================

INSTANCE DIA_GorNaTokas_HELLO1_ZWYKLY (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_HELLO1_ZWYKLY_Condition;
   information  = DIA_GorNaTokas_HELLO1_ZWYKLY_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_GorNaTokas_HELLO1_ZWYKLY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaTokas_HELLO1_ZWYKLY_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_ZWYKLY_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_ZWYKLY_03_02"); //Jestem Gor Na Tokas, Stra�nik �wi�tynny. 
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_ZWYKLY_03_03"); //Ale kim ty jeste�, �ebym w og�le z tob� rozmawia�?
};

//========================================
//-----------------> IF_NOT_MAGNUS
//========================================

INSTANCE DIA_GorNaTokas_IF_NOT_MAGNUS (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 2;
   condition    = DIA_GorNaTokas_IF_NOT_MAGNUS_Condition;
   information  = DIA_GorNaTokas_IF_NOT_MAGNUS_Info;
   permanent	= FALSE;
   description	= "Widz�, �e masz ciekawy miecz.";
};

FUNC INT DIA_GorNaTokas_IF_NOT_MAGNUS_Condition()
{
    if (MIS_NieSpelnionaZemsta =! LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_IF_NOT_MAGNUS_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_IF_NOT_MAGNUS_15_01"); //Widz�, �e masz ciekawy miecz.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_02"); //Ciekawy?
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_03"); //Ch�opaczku, lepiej st�d odejd�. Nie chcia�by� by ten miecz znalaz� si� w twoich trzewiach, wierz mi.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_04"); //Nie sko�czy�oby si� to dla ciebie za dobrze.
    AI_Output (other, self ,"DIA_GorNaTokas_IF_NOT_MAGNUS_15_05"); //Grozisz mi?
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_06"); //Gro��? Ale� nie! Wierz�, �e m�j Pan rozprawi si� z takimi jak ty we w�a�ciwym czasie.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_07"); //A teraz odejd� st�d, bo poznasz jego gniew! 
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaTokas_HELLO1 (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_HELLO1_Condition;
   information  = DIA_GorNaTokas_HELLO1_Info;
   permanent	= FALSE;
   description	= "Zabi�e� my�liwego Biorna!";
};

FUNC INT DIA_GorNaTokas_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Duch_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_01"); //Zabi�e� my�liwego Biorna!
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_02"); //Mia� zgin��! To jego przeznaczenie.
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_03"); //O czym ty w og�le m�wisz?
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_04"); //Co to ziele z wami robi, do cholery?!
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_05"); //Czas na tego cz�owieka ju� nadszed�...
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_06"); //Jakim prawem decydujesz o ludzkim �yciu?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_07"); //Jestem tylko narz�dziem w r�kach czego� pot�niejszego.
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_08"); //Kogo�, komu ten cz�owiek przeszkadza�.
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_09"); //O czym ty m�wisz?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_10"); //Jestem wys�annikiem, emisariuszem...
	B_LogEntry                     (CH1_NieSpelnionaZemsta,"Rozmawia�em z Tokasem. Bredzi� co� o tym, �e jest tylko narz�dziem w r�kach kogo� znacznie pot�niejszego. Co� mi tu �mierdzi mrocznymi si�ami...");

};
//========================================
//-----------------> Sword
//========================================

INSTANCE DIA_GorNaTokas_Sword (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_Sword_Condition;
   information  = DIA_GorNaTokas_Sword_Info;
   permanent	= FALSE;
   description	= "Oddaj mi sw�j miecz!";
};

FUNC INT DIA_GorNaTokas_Sword_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_HELLO1)) && (!Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Sword_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Sword_15_01"); //Oddaj mi sw�j miecz!
    AI_Output (self, other ,"DIA_GorNaTokas_Sword_03_02"); //To ostrze zosta�o mi przekazane przez wys�annik�w mojego Pana.
    AI_Output (other, self ,"DIA_GorNaTokas_Sword_15_03"); //Oddaj mi je!
    AI_Output (self, other ,"DIA_GorNaTokas_Sword_03_04"); //Po moim trupie!
	TPL_1490_GorNaTokas.guild = GIL_NONE;
	Npc_SetTrueGuild (TPL_1490_GorNaTokas,GIL_NONE);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};


//========================================
//-----------------> Dogadanie
//========================================

INSTANCE DIA_GorNaTokas_Dogadanie (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_Dogadanie_Condition;
   information  = DIA_GorNaTokas_Dogadanie_Info;
   permanent	= FALSE;
   description	= "Mo�e si� jako� dogadamy.";
};

FUNC INT DIA_GorNaTokas_Dogadanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_HELLO1))
    && (!Npc_KnowsInfo (hero, DIA_GorNaTokas_Sword))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Dogadanie_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_01"); //Mo�e si� jako� dogadamy.
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_02"); //He? O co ci chodzi?
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_03"); //Po prostu chc� uwolni� tego cz�owieka.
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_04"); //Rozumiem, �e czym� ci zawini�. Pozby�e� si� go, wi�c dlaczego ma dalej cierpie�?
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_05"); //Nie obchodzi mnie jego los, ale sam fakt, �e nie zaatakowa�e� mnie jest godzien pochwa�y.
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_06"); //Mo�esz go zabi� przy u�yciu ognia. Na inne obra�enia jest odporny. 
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Mog� zabi� Biorna przy u�yciu ognia. Na inne obra�enia jest odporny.");

    B_GiveXP (250);
    CreateInvItems (self, ItArScrollFireball, 2);
    B_GiveInvItems (self, other, ItArScrollFireball, 2);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Bezlitosny
//========================================

INSTANCE DIA_GorNaTokas_Bezlitosny (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 2;
   condition    = DIA_GorNaTokas_Bezlitosny_Condition;
   information  = DIA_GorNaTokas_Bezlitosny_Info;
   permanent	= FALSE;
   description	= "Zabi�em Biorna.";
};

FUNC INT DIA_GorNaTokas_Bezlitosny_Condition()
{
    
    if (Npc_IsDead(NON_5632_Duch)) && (Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Bezlitosny_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Bezlitosny_15_01"); //Zabi�em Biorna.
    AI_Output (self, other ,"DIA_GorNaTokas_Bezlitosny_03_02"); //To nie moja sprawa. Zrobi�e� jak uwa�a�e�.
    AI_Output (self, other ,"DIA_GorNaTokas_Bezlitosny_03_03"); //Doceniam, �e mnie nie zaatakowa�e�. Nie mia�by� najmniejszych szans. Dobrze, �e znasz swoje miejsce.
};

//========================================
//-----------------> Sworddd
//========================================

INSTANCE DIA_GorNaTokas_Sworddd (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 3;
   condition    = DIA_GorNaTokas_Sworddd_Condition;
   information  = DIA_GorNaTokas_Sworddd_Info;
   permanent	= FALSE;
   description	= "Sk�d masz ten miecz?";
};

FUNC INT DIA_GorNaTokas_Sworddd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Bezlitosny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Sworddd_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Sworddd_15_01"); //Sk�d masz ten miecz?
    AI_Output (self, other ,"DIA_GorNaTokas_Sworddd_03_02"); //To dziedzictwo skrytob�jc�w, kt�rzy dzia�ali na tych ziemiach.
    AI_Output (self, other ,"DIA_GorNaTokas_Sworddd_03_03"); //Nie musisz wszystkiego wiedzie�.
};