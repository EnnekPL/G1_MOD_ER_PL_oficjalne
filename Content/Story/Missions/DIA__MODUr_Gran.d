// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ur_Gran_EXIT(C_INFO)
{
	npc             = Ur_Gran;
	nr              = 999;
	condition	= DIA_Ur_Gran_EXIT_Condition;
	information	= DIA_Ur_Gran_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ur_Gran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ur_Gran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ur_Gran_HELLO1 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 1;
   condition    = DIA_Ur_Gran_HELLO1_Condition;
   information  = DIA_Ur_Gran_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ur_Gran_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ur_Gran_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_01"); //KHROTOK JABARTH!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_02"); //Czego tu szukasz cz�owiek?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_03"); //Nie wolno ci si� tu pa��ta�. Tu by� sala tronowa miasta ork�w.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_04"); //No, no. Widz�, �e nawet lepiej w�adasz j�zykiem ludzi ni� reszta twoich pobratymc�w.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_05"); //Ja by� do�wiadczony wojownik, stoczy� wiele bitew przeciwko czerwonym �o�nierzom.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_06"); //Te przekl�te szubrawcy zniewala� moich ludzi i zmusza� do niewolniczej pracy w kopalniach.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_07"); //Ale ju� wkr�tce nadej�� dzie� zap�aty i �mierdz�cy Gomez utonie we w�asnej krwi!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_08"); //Tu si� zgadzamy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Ur_Gran_HELLO2 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 2;
   condition    = DIA_Ur_Gran_HELLO2_Condition;
   information  = DIA_Ur_Gran_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czy wiesz jak mog� dosta� si� do �wi�tyni �ni�cego?";
};

FUNC INT DIA_Ur_Gran_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO2_15_01"); //Czy wiesz jak mog� dosta� si� do �wi�tyni �ni�cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_02"); //RUSHTASOK Cz�owiek by� g�upi, czy jak?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_03"); //�wi�tynia KRUSHAK jest zamkni�ta, nie dostanie si� tam nikt - ani cz�owiek ani ork.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_04"); //Tylko syn ducha zna� spos�b na dostanie si� do �wi�tyni KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_05"); //I z pewno�ci� nie podziel� si� wiedz� z Obcym, takim jak ty!
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Ur_Gran_HELLO3 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 3;
   condition    = DIA_Ur_Gran_HELLO3_Condition;
   information  = DIA_Ur_Gran_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy znasz szamana imieniem Ur-Shak?";
};

FUNC INT DIA_Ur_Gran_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO3_15_01"); //Czy znasz szamana imieniem Ur-Shak?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_02"); //Czy Ur-Gran zna�? Oczywi�cie, �e tak!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_03"); //Za kogo ty mnie masz cz�owiek?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_04"); //Ur-Shak by� zdrajca! On si� wyprze� KRUSHAK i m�wi� o nim blu�nierstwa.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_05"); //Gdy Ur-Gran spotka� Ur-Shak, pola� si� krew!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_06"); //Nasz b�g nie tolerowa� takiej zdrady!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Ur_Gran_HELLO4 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 4;
   condition    = DIA_Ur_Gran_HELLO4_Condition;
   information  = DIA_Ur_Gran_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o �ni�cym?";
};

FUNC INT DIA_Ur_Gran_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_01"); //Co mo�esz mi powiedzie� o �ni�cym?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_02"); //On by� naszym bogiem od wiek�w. �wi�tynia powsta�a w czasach Pradawnych.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_03"); //My ofiarowa� mu podarki i oddawa� cze��. My d��y� do wielkie przebudzenie KRUSHAK!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_04"); //Wielkie przebudzenie?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_05"); //Cz�owiek sam si� przekona ju� nied�ugo!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_06"); //Gdy KRUSHAK si� przebudzi�, zniszczy� wszystkie siedliska Morr na �wiecie. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_07"); //Jeszcze po�a�ujecie tego, �e nie poddali�cie si� w tej wojnie!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_08"); //Pierwsi za grzechy zap�ac� wstr�tne ludzie z bagien. Oni by� zdrajcy i przesta� wierzy� w KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_09"); //Ich Ob�z ju� wkr�tce b�dzie nasz!
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Ur_Gran_HELLO5 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 5;
   condition    = DIA_Ur_Gran_HELLO5_Condition;
   information  = DIA_Ur_Gran_HELLO5_Info;
   permanent	= FALSE;
   description	= "Sk�d wiesz, �e Bractwo przesta�o wyznawa� �ni�cego?";
};

FUNC INT DIA_Ur_Gran_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_01"); //Sk�d wiesz, �e Bractwo przesta�o wyznawa� �ni�cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_02"); //Powiedzie� nam o tym przyjaciel Kalom.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_03"); //Jaki� czas temu KRUSHAK zes�a� nam wizj�, w kt�rej powiedzie�, �e nied�ugo do miasta przyj�� jego najwierniejszy s�uga.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_04"); //My musie� pom�c s�uga, my wesprze� s�uga!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_05"); //Przyjaciel Kalom by� bardzo pot�na mag, przyprowadzi� ze sob� wielu wojownik�w i wyznawc�w.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_06"); //My ugo�ci� Kalom i wpu�ci� go do �wi�tynia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_07"); //KRUSHAK powiedzie�, �e to Kalom go zbudzi�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_08"); //Podczas wizyty w naszym mie�cie Kalom powiedzie� o zdradzie ludzi z bagna. On poleci� nam zniszczy� ich w pierwszej kolejno�ci.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_09"); //C� za ironia, sam nale�a� do Bractwa. Zawsze wiedzia�em, �e to kawa� sukinsyna...
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_10"); //Obcy uwa�a� co m�wi! Kalom by� wielki Guru i mag. My nie pozwolimy go obra�a�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_11"); //Jedno z�e s�owo, a m�j KRUSH skr�ci� cz�owiek o �eb.
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Ur_Gran_HELLO6 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 6;
   condition    = DIA_Ur_Gran_HELLO6_Condition;
   information  = DIA_Ur_Gran_HELLO6_Info;
   permanent	= FALSE;
   description	= "Na czym b�dzie polega� rytua� Cor Kaloma?";
};

FUNC INT DIA_Ur_Gran_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO6_15_01"); //Na czym b�dzie polega� rytua� Cor Kaloma?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_02"); //On wsp�lnie z wyznawcami obudzi� KRUSHAK i zosta� jego arcykap�anem.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_03"); //On wyzwoli� pot�ga orkowych serc. Nasi przodkowie w ko�cu przestan� by� �ywi i martwi w jednym.
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Ur_Gran_HELLO7 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 7;
   condition    = DIA_Ur_Gran_HELLO7_Condition;
   information  = DIA_Ur_Gran_HELLO7_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o ULU-MULU.";
};

FUNC INT DIA_Ur_Gran_HELLO7_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO6))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO7_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_01"); //Opowiedz mi o ULU-MULU.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_02"); //ULU-MULU by� symbol przyja�ni ork�w i ludzi.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_03"); //Tylko zr�czny orkowy kowal potrafi wyku� ULU-MULU i mo�e on przekaza� go cz�owiek, kt�ry jest temu godzien.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_04"); //Sk�d Obcy zdoby� ULU-MULU?
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_05"); //Zrobi� go dla mnie Tarrok, uwolni�em go z kopalni.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_06"); //To wielki czyn. KRUSHAK z pewno�ci� ci to wynagrodzi�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_07"); //W ka�dym b�d� razie ULU-MULU to zwyczaj naszego klanu. Nie wszyscy nasi pobratymcy go popiera�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_08"); //Berserker we w�asnej osobie zakaza� stosowania ULU-MULU w�r�d innych ork�w.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_09"); //Kim jest Berserker?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_10"); //To by� poprzedni kr�l ork. Cz�owiek go nie spotka, on nie �y�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_11"); //Jego miejsce zaj�� Kan, nasz nowy kr�l. On poprowadzi� orki przeciwko ludzie z Myrtany.
};
/*
//========================================
//-----------------> HELLO8
//========================================

INSTANCE DIA_Ur_Gran_HELLO8 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 8;
   condition    = DIA_Ur_Gran_HELLO8_Condition;
   information  = DIA_Ur_Gran_HELLO8_Info;
   permanent	= FALSE;
   description	= "[SPROWOKUJ] Orkowe �cierwo musi zdechn��!";
};

FUNC INT DIA_Ur_Gran_HELLO8_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ur_Gran_HELLO8_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_01"); //Orkowe �cierwo musi zdechn��! Niszczycie ludzkie osady, zabijacie i niewolicie! 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_02"); //Nie masz prawa do niszczenia w imi� Beliara!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_03"); //HA HA HA! Czy cz�owiek wie co m�wi?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_04"); //Te s�owa zerwa� przymierze ork - cz�owiek. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_05"); //Skazujesz si� na �mier�, Obcy.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_06"); //Zaraz zbroczysz wasze "�wi�te podziemia" krwi�!
    AI_StopProcessInfos	(self);
	Ur_Gran.guild = GIL_MEATBUG;
	Npc_SetTrueGuild (Ur_Gran,GIL_MEATBUG);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
*/
