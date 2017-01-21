//*** SHIT POPRAWIONY ****
// Zrobione porz¹dnie, gothic1210
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
   description	= "Jak siê maj¹ sprawy?";
};

FUNC INT DIA_Balam_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO1_15_01"); //Jak siê maj¹ sprawy?
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_02"); //Widzê ¿e jesteœ tu nowy. Jestem Balam, kucharz Gomeza. Jeden z najlepszych kucharzy na ca³ej wyspie Khorinis i najlepszy kucharz w ca³ej Kolonii.
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_03"); //Zajmujê siê tym od ponad dwudziestu lat. Wspólnie z Omidem zwiedziliœmy spory kawa³ek œwiata i znamy rozmaite przepisy.
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
   description	= "Co mo¿esz mi powiedzieæ o zamku?";
};

FUNC INT DIA_Balam_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO2_15_01"); //Co mo¿esz mi powiedzieæ o zamku?
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_02"); //W sumie to niewiele. Pracujê dla Gomeza od niedawna i nie mam zazwyczaj czasu na w³óczenie siê po zamku.
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_03"); //Zreszt¹, nie wszêdzie jesteœmy wpuszczani.
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
   description	= "Czym siê wczeœniej zajmowa³eœ?";
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
    AI_Output (other, self ,"DIA_Balam_HELLO3_15_01"); //Czym siê wczeœniej zajmowa³eœ?
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_02"); //By³em, a w³aœciwie wci¹¿ jestem Cieniem. Zanim przydzielono nas do kuchni, pomagaliœmy w prowadzeniu karczmy w Zewnêtrznym Pierœcieniu.
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_03"); //Do kuchni trafiliœmy przez przypadek. Poprzedni kucharz mia³ ma³y wypadek. Poparzy³ siê ogniem. Kilka dni póŸniej zmar³.
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
   description	= "Twój przyjaciel nie jest zbyt rozmowny. ";
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
    AI_Output (other, self ,"DIA_Balam_HELLO4_15_01"); //Twój przyjaciel nie jest zbyt rozmowny. 
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_02"); //To prawda. To g³ównie dlatego, ¿e dosta³ ostatnio burê od Bartholo. Omid strasznie nie lubi krytyki i zawsze siê obra¿a.
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_03"); //Do mnie na szczêœcie Magnaci nie maj¹ zastrze¿eñ, dlatego mo¿emy zamieniæ kilka s³ów.
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
   description	= "W Zewnêtrznym Pierœcieniu spotka³em innego kucharza, Snafa.";
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
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_01"); //W Zewnêtrznym Pierœcieniu spotka³em innego kucharza, Snafa.
    AI_Output (self, other ,"DIA_Balam_HELLO5_03_02"); //Dalej próbuje przerobiæ chrz¹szcze na ¿arcie?
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Balam_HELLO5_03_04"); //Ha ha! Sukinsynowi, chyba nigdy siê to nie znudzi. 
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
    AI_Output (self, other ,"DIA_Balam_HELLO6_03_02"); //¯eby ¿ycie mia³o smaczek, raz kotlecik, raz ziemniaczek. He he...
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
   description	= "Wiesz coœ o pierœcieniach Magnatów?";
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
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_01"); //Wiesz coœ o pierœcieniach Magnatów?
    AI_Output (self, other ,"DIA_Balam_LookingForRings_03_02"); //Hej, kolego. Wiem, co ci chodzi po g³owie. Moja cena to 60 bry³ek rudy.
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_03"); //Nie za du¿o?
	AI_Output (self, other ,"DIA_Balam_LookingForRings_03_04"); //Mo¿esz szukaæ sam...
	B_LogEntry    (CH1_BaronsRings,"Balam wie coœ o trzecim pierœcieniu, jednak ta informacja kosztuje 60 bry³ek rudy.");
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
   description	= "Dobra, mów co wiesz. (Zap³aæ 60 bry³ek)";
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
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_01"); //Dobra, mów co wiesz.
    AI_Output (self, other ,"DIA_Balam_PayForInfo_03_02"); //Poszukaj w naszej kuchni. Tej w wie¿y. 
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_03"); //Naprawdê? W kuchni? Chyba sobie ze mnie nie ¿artujesz.
	AI_Output (self, other ,"DIA_Balam_PayForInfo_03_04"); //Nie, mówiê powa¿nie. Te¿ bym go schowa³ gdzieœ indziej, ale Gomez to têpak.
	B_GiveInvItems (hero,self,itminugget,60);
	B_LogEntry    (CH1_BaronsRings,"Balam powiedzia³ mi, ¿ebym szuka³ pierœcienia w kuchni Magnatów, która znajduje siê w wie¿y.");
};