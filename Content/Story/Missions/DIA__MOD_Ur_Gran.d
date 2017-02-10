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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_02"); //Czego tu w�szy� MORRA?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_03"); //Jabarath nie wolno by� w sala tronowa wodza ork�w. 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_04"); //No, no. Widz�, �e nawet lepiej w�adasz j�zykiem ludzi ni� reszta twoich pobratymc�w.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_05"); //Ja by� do�wiadczona wojownik, stoczy� wiele URR-GARRGH z czerwoni �o�nierze.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_06"); //Przekl�te szubrawcy �apa� moich bracia. Oni zmusza� moich bracia do ci�ka praca w kopalnia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_07"); //Ju� wkr�tce dzie� zap�ata i �mierdz�ca w�dz wrednych morr, GOMASH uton�� we w�asna krew!
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_02"); //RUSHTASOK! JABARTH by� g�upia?! Chcie� dosta� si� �wi�tynia!? Do KARRASH!?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_03"); //�wi�tynia KRUSHAK zamkni�ta, nie wej�� tam nikt - ani MORRA ani ork.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_04"); //Tylko NAKK, syny ducha, morry m�wi� na nich szaman, zna� jak dosta� si� do KARRASH KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_05"); //Ale �adna NAKK nigdy nie podzieli� wiedz� z Obcym, taka jak ty!
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_02"); //Czy Ur-Gran zna�? Oczywi�cie, �e Ur-Gran zna� ta g�upia NAKK!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_03"); //Za kogo ty mnie ma JABARTH?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_04"); //Ur-Shak by� zdrajca! G�upia NAKK Ur-Shak si� wyprze� KRUSHAK. Ur-Shak m�wi� o nim blu�nierstwa.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_05"); //Gdy Ur-Gran spotka� Ur-Shak, pola� si� krew!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_06"); //KRUSHAK nie tolerowa� zdrady!
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_02"); //KRUSHAK by� nasza b�g od wiele wieka. KARRASH KRUSHAK by� wzniesiona przez przodkowie nasza przodk�w.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_03"); //My sk�ada� NRVUHR dla KRUSHAK i oddawa� cze��. My d��y� do wielkie przebudzenie KRUSHAK!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_04"); //Wielkie przebudzenie?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_05"); //JABARTH si� przekona� ju� nied�ugo!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_06"); //Gdy KRUSHAK si� przebudzi�, zniszczy� wszystkie siedliska Morr na �wiecie. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_07"); //MORRA i ich kr�l jeszcze po�a�owa�, �e nie by� podda� si� w ta wojna dla nas ork�w!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_08"); //KRUSHAK ukara� wpierw g�upie MORRA z bagien. Oni by� zdrajcy i przesta� wierzy� w KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_09"); //Ich HESH-GHURG na bagnach ju� wkr�tce by� nasz! My go zr�wna� z ziemia. 
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_02"); //Powiedzie� nam Kalom. On nasza GHARRESH - nasza przyjaciel i najwierniejsza s�uga KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_03"); //KRUSHAK zes�a� wizja i powiedzie�, �e do nasza SHER-KHURGH przyj�� najwierniejsza s�uga KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_04"); //My musie� pom�c s�uga, my wesprze� s�uga!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_05"); //GHARRESH Kalom by� bardzo pot�na NAKK, przyprowadzi� wiele wojownik i wyznawca KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_06"); //My ugo�ci� Kalom i wpu�ci� go do KARRASH - do morra m�wi� �wi�tynia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_07"); //KRUSHAK powiedzie�, to Kalom mie� zbudzi� KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_08"); //Kalom powiedzie� o zdrada MORRA z HESH-GHURG na bagno. NAKK Kalom poleci� nam zniszczy� ich najpierw.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_09"); //C� za ironia, sam nale�a� do Bractwa. Zawsze wiedzia�em, �e to kawa� sukinsyna...
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_10"); //Obcy uwa�a� co m�wi! Kalom by� wielki GHERRESH dla ork i NAKK. Ork nie pozwoli� go obra�a�, MORRA. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_11"); //Jedna z�a s�owo, a KRUSH Ur-Grana str�ci� �eb g�upia MORRA! 
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_02"); //On z wyznawcy obudzi� KRUSHAK i zosta� jego wielki NAKK. Zosta� arcykap�an KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_03"); //On wyzwoli� pot�ga orkowa serc. Nasze przodki w ko�cu przesta� by� �ywa i martwa naraz.
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_02"); //ULU-MULU by� symbol przyja�� orkowie i JABARTH.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_03"); //Tylko zr�czna ork potrafi wyku� ULU-MULU i mo�e da� go godna JABARTH.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_04"); //Sk�d obcy zdoby� ULU-MULU?
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_05"); //Zrobi� go dla mnie Tarrok, uwolni�em go z kopalni.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_06"); //Wielka czyn JABARTH. KRUSHAK ci to wkr�tce wynagrodzi�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_07"); //ULU-MULU by� zwyczaj nasz klan. Nie ka�da inna klan orka go uznawa�.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_08"); //Berserker we w�asna osoba zakaza� stosowania ULU-MULU w�r�d innych ork�w. Nie wszystkie plemiona go pos�ucha�. 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_09"); //Kim jest Berserker?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_10"); //To by� kr�l ork�w. Ju� dawno nie �y�. On przewodzi� dla wielu szczepom. Kan obwo�a� si� kr�l po nim. Ur-Gran Kana nie uzna�. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_11"); //Kan zjednoczy� ju� i sprzymierzy� wiele plemion za wielka woda. Kan zawrze� te� przymierze z wieloma orkowie z naszych g�r. 
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
