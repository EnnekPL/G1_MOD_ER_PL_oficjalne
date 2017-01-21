//*** SHIT POPRAWIONY ****
// Zrobione porz�dnie, gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Balam_EXIT(C_INFO)
{
	npc             = STT_324_Balam;
	nr              = 999;
	condition	= DIA_Balam_EXIT_Condition;
	information	= DIA_Balam_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Balam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balam_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Balam_HELLO1 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 1;
   condition    = DIA_Balam_HELLO1_Condition;
   information  = DIA_Balam_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak si� maj� sprawy?";
};

FUNC INT DIA_Balam_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO1_15_01"); //Jak si� maj� sprawy?
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_02"); //Widz� �e jeste� tu nowy. Jestem Balam, kucharz Gomeza. Jeden z najlepszych kucharzy na ca�ej wyspie Khorinis i najlepszy kucharz w ca�ej Kolonii.
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_03"); //Zajmuj� si� tym od ponad dwudziestu lat. Wsp�lnie z Omidem zwiedzili�my spory kawa�ek �wiata i znamy rozmaite przepisy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Balam_HELLO2 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 2;
   condition    = DIA_Balam_HELLO2_Condition;
   information  = DIA_Balam_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o zamku?";
};

FUNC INT DIA_Balam_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO2_15_01"); //Co mo�esz mi powiedzie� o zamku?
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_02"); //W sumie to niewiele. Pracuj� dla Gomeza od niedawna i nie mam zazwyczaj czasu na w��czenie si� po zamku.
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_03"); //Zreszt�, nie wsz�dzie jeste�my wpuszczani.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Balam_HELLO3 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 3;
   condition    = DIA_Balam_HELLO3_Condition;
   information  = DIA_Balam_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czym si� wcze�niej zajmowa�e�?";
};

FUNC INT DIA_Balam_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Balam_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO3_15_01"); //Czym si� wcze�niej zajmowa�e�?
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_02"); //By�em, a w�a�ciwie wci�� jestem Cieniem. Zanim przydzielono nas do kuchni, pomagali�my w prowadzeniu karczmy w Zewn�trznym Pier�cieniu.
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_03"); //Do kuchni trafili�my przez przypadek. Poprzedni kucharz mia� ma�y wypadek. Poparzy� si� ogniem. Kilka dni p�niej zmar�.
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_04"); //Nieciekawa sprawa...
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Balam_HELLO4 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 4;
   condition    = DIA_Balam_HELLO4_Condition;
   information  = DIA_Balam_HELLO4_Info;
   permanent	= FALSE;
   description	= "Tw�j przyjaciel nie jest zbyt rozmowny. ";
};

FUNC INT DIA_Balam_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Omid_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO4_15_01"); //Tw�j przyjaciel nie jest zbyt rozmowny. 
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_02"); //To prawda. To g��wnie dlatego, �e dosta� ostatnio bur� od Bartholo. Omid strasznie nie lubi krytyki i zawsze si� obra�a.
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_03"); //Do mnie na szcz�cie Magnaci nie maj� zastrze�e�, dlatego mo�emy zamieni� kilka s��w.
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Balam_HELLO5 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_HELLO5_Condition;
   information  = DIA_Balam_HELLO5_Info;
   permanent	= FALSE;
   description	= "W Zewn�trznym Pier�cieniu spotka�em innego kucharza, Snafa.";
};

FUNC INT DIA_Balam_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_01"); //W Zewn�trznym Pier�cieniu spotka�em innego kucharza, Snafa.
    AI_Output (self, other ,"DIA_Balam_HELLO5_03_02"); //Dalej pr�buje przerobi� chrz�szcze na �arcie?
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Balam_HELLO5_03_04"); //Ha ha! Sukinsynowi, chyba nigdy si� to nie znudzi. 
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Balam_HELLO6 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 6;
   condition    = DIA_Balam_HELLO6_Condition;
   information  = DIA_Balam_HELLO6_Info;
   permanent	= TRUE;
   description	= "Jak tam robota?";
};

FUNC INT DIA_Balam_HELLO6_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO6_15_01"); //Jak tam robota?
    AI_Output (self, other ,"DIA_Balam_HELLO6_03_02"); //�eby �ycie mia�o smaczek, raz kotlecik, raz ziemniaczek. He he...
};

//========================================
//-----------------> LookingForRings
//========================================

INSTANCE DIA_Balam_LookingForRings (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_LookingForRings_Condition;
   information  = DIA_Balam_LookingForRings_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o pier�cieniach Magnat�w?";
};

FUNC INT DIA_Balam_LookingForRings_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_AboutThirdRing)) && (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_LookingForRings_Info()
{
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_01"); //Wiesz co� o pier�cieniach Magnat�w?
    AI_Output (self, other ,"DIA_Balam_LookingForRings_03_02"); //Hej, kolego. Wiem, co ci chodzi po g�owie. Moja cena to 60 bry�ek rudy.
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_03"); //Nie za du�o?
	AI_Output (self, other ,"DIA_Balam_LookingForRings_03_04"); //Mo�esz szuka� sam...
	B_LogEntry    (CH1_BaronsRings,"Balam wie co� o trzecim pier�cieniu, jednak ta informacja kosztuje 60 bry�ek rudy.");
};

//========================================
//-----------------> PayForInfo
//========================================

INSTANCE DIA_Balam_PayForInfo (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_PayForInfo_Condition;
   information  = DIA_Balam_PayForInfo_Info;
   permanent	= FALSE;
   description	= "Dobra, m�w co wiesz. (Zap�a� 60 bry�ek)";
};

FUNC INT DIA_Balam_PayForInfo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Balam_LookingForRings)) && (MIS_BaronsRings == LOG_RUNNING) && (Npc_HasItems (hero, ItMiNugget)>=60)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_PayForInfo_Info()
{
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_01"); //Dobra, m�w co wiesz.
    AI_Output (self, other ,"DIA_Balam_PayForInfo_03_02"); //Poszukaj w naszej kuchni. Tej w wie�y. 
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_03"); //Naprawd�? W kuchni? Chyba sobie ze mnie nie �artujesz.
	AI_Output (self, other ,"DIA_Balam_PayForInfo_03_04"); //Nie, m�wi� powa�nie. Te� bym go schowa� gdzie� indziej, ale Gomez to t�pak.
	B_GiveInvItems (hero,self,itminugget,60);
	B_LogEntry    (CH1_BaronsRings,"Balam powiedzia� mi, �ebym szuka� pier�cienia w kuchni Magnat�w, kt�ra znajduje si� w wie�y.");
};