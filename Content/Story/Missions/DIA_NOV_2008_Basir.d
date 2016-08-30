//*****************************************
// SPRAWDZONE - GOTHIC1210
//*****************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Basir_EXIT(C_INFO)
{
	npc             = NOV_2008_Basir;
	nr              = 999;
	condition	= DIA_Basir_EXIT_Condition;
	information	= DIA_Basir_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Basir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Basir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Basir_HELLO5 (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 5;
   condition    = DIA_Basir_HELLO5_Condition;
   information  = DIA_Basir_HELLO5_Info;
   permanent	= FALSE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Basir_HELLO5_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Basir_HELLO5_15_01"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Basir_HELLO5_03_02"); //Jestem kucharzem. Troch� gotuj�, troch� pal�. Jak ka�dy.
    AI_Output (other, self ,"DIA_Basir_HELLO5_15_03"); //Mo�esz mi sprzeda� przepisy?
    AI_Output (self, other ,"DIA_Basir_HELLO5_03_04"); //Jasne. Je�li zap�acisz.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Basir z Obozu Bractwa sprzeda mi przepisy.");//fix
};
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Basir_TRADE (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 5;
   condition    = DIA_Basir_TRADE_Condition;
   information  = DIA_Basir_TRADE_Info;
   permanent	= true;
   trade 		= true;
   description	= "Co oferujesz?";
};

FUNC INT DIA_Basir_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Basir_TRADE_15_01"); //Co oferujesz?
    AI_Output (self, other ,"DIA_Basir_TRADE_03_02"); //Sam zobacz.
};
//========================================
//-----------------> LIFE
//========================================
//edit by Nocturn
INSTANCE DIA_Basir_LIFE (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 3;
   condition    = DIA_Basir_LIFE_Condition;
   information  = DIA_Basir_LIFE_Info;
   permanent	= FALSE;
   description	= "Jak wygl�da �ycie tutaj?";
};

FUNC INT DIA_Basir_LIFE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_LIFE_Info()
{
    AI_Output (other, self ,"DIA_Basir_LIFE_15_01"); //Jak wygl�da �ycie tutaj?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_02"); //Nie jest �le. Mamy co je�� i pali�. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_03"); //Bractwo jest nie�le zorganizowane.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_04"); //Ka�dy ma swoj� sta�� prac�. Przyk�adowo ja gotuj�.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_05"); //Inni handluj�, odbieraj� dostawy lub po prostu zbieraj� ziele.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_06"); //Z tym jest najwi�cej k�opot�w.
    AI_Output (other, self ,"DIA_Basir_LIFE_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_08"); //Gdy przepracujesz ca�y dzie�, masz prawo odpoczywa� drugi dzie�. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_09"); //Jednak stanowisko pracy mo�na opu�ci� wy��cznie, je�eli kto� przyjdzie ci� zmieni�. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_10"); //Cz�sto kto� po prostu nie przychodzi...
    AI_Output (other, self ,"DIA_Basir_LIFE_15_11"); //Baalowie nie reaguj�?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_12"); //Nie. Wol� nie wtr�ca� si� w sprawy Nowicjuszy.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Basir_HELLO4 (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 4;
   condition    = DIA_Basir_HELLO4_Condition;
   information  = DIA_Basir_HELLO4_Info;
   permanent	= FALSE;
   description	= "Czy ka�dy w Bractwie wierzy w �ni�cego?";
};

FUNC INT DIA_Basir_HELLO4_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Basir_HELLO4_15_01"); //Czy ka�dy w Bractwie wierzy w �ni�cego?
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_02"); //Tak w�a�ciwie to nie. Wielu przybywa do Obozu, szukaj�c �atwego �ycia.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_03"); //Nienawidz� takich wyzyskiwaczy. My pracujemy, a oni licz�, �e dostan� co� za darmo. 
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_04"); //Uwa�am, �e ka�dy Nowicjusz powinien przej�� pr�b� wiary, ot co.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_05"); //Z pewno�ci� by�oby mniej ch�tnych. 
    AI_Output (other, self ,"DIA_Basir_HELLO4_15_06"); //Rozumiem, �e aby do��czy� do Obozu nie trzeba si� zbytnio wysila�.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_07"); //W sumie to wystarczy dobrze k�ama�. Baalowie praktycznie ca�y czas s� odurzeni zielem.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_08"); //Nie potrafi� oceni�, jakie kto ma intencje. 
};

//////////////////////////////////////////////////////////////////
// SERIA ZAB�JSTW W Bractwie
///////////////////////////////////////////////////////////////////

//========================================
//-----------------> ABOUT_KILLER
//========================================

INSTANCE DIA_Basir_ABOUT_KILLER (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 4;
   condition    = DIA_Basir_ABOUT_KILLER_Condition;
   information  = DIA_Basir_ABOUT_KILLER_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o ostatnim morderstwie?";
};

FUNC INT DIA_Basir_ABOUT_KILLER_Condition()
{
    if (MIS_SeryjneZabojstwa == LOG_RUNNING)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Basir_ABOUT_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Basir_ABOUT_KILLER_15_01"); //Wiesz co� o ostatnim morderstwie?
    AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_02"); //Chyba jako jedyny odwa�y�em si� p�j�� i obejrze� cia�o.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_03"); //Zauwa�y�em, �e w trupa jest co� wbite. Cholera, ten go�� to jaki� szaleniec. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_04"); //Zab�jstwo z zimn� krwi�, krwi�, kt�ra sp�ywa�a mu po r�kach. Co� okropnego. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_05"); //Zrozumiem wiele... walk�, wojn�, zemst�, ale to?
	AI_Output (other, self ,"DIA_Basir_ABOUT_KILLER_15_06"); //Masz jakie� podejrzenia?
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_07"); //Nie. Talas ca�y czas bredzi, �e to na pewno Harlok. Nie wierz� w to. By�em w jego chacie i nie znalaz�em nic podejrzanego.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_08"); //Zreszt� ten go�� si� troch� uspokoi�. Po tej ca�ej aferze z przywo�aniem spokornia�. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_09"); //M�wi� mi, �e wiele rzeczy �a�uje. Ufam mu. Spr�buj znale�� inny punkt zaczepienia. W ko�cu zgin�o trzech ludzi, a nie jeden.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_10"); //Przeszukaj inne miejsca zbrodni i dopiero wtedy wyci�gnij wnioski. Na razie nie masz nic konkretnego.
	B_LogEntry               (CH1_SeryjneZabojstwa,"Basir powiedzia� mi, �e w cia�o ofiary wbito jakie� przedmioty. Zdradzi� te�, �e Talas podejrzewa o zab�jstwo Harloka. On si� z tym zdaniem jednak w og�le nie zgadza. Poradzi� mi, aby zbada� inne miejsca zbrodni i dopiero wtedy wyci�gn�� wnioski.");
};