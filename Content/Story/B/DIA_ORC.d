// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Orc_EXIT(C_INFO)
{
	nr              = 999;
	condition	= DIA_ORC_EXIT_Condition;
	information	= DIA_ORC_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_ORC_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_ORC_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ORC_CAMP
//========================================

INSTANCE DIA_Ash_ORC_CAMP (C_INFO)
{
   nr           = 1;
   condition    = DIA_Ash_ORC_CAMP_Condition;
   information  = DIA_Ash_ORC_CAMP_Info;
   permanent	= TRUE;
   description	= "Co mo�esz mi powiedzie� o tym obozie?";
};

FUNC INT DIA_Ash_ORC_CAMP_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ash_ORC_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_01"); //Co mo�esz mi powiedzie� o tym obozie?
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_02"); //A czemu Morra interesowa� si� tym? To, �e Morra nosi ULU-MULU, nie znaczy�, �e my wielbi� Morra.
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_03"); //Nie mam z�ych zamiar�w. Jestem po prostu ciekawy. 
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_04"); //Nasz ob�z by� pradawny, my orki �y� w Dolina G�rnicza od wiek�w.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_05"); //Nasz ob�z powsta� jeszcze przed wybudowaniem �wi�tyni KRUSHAK.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_06"); //Pi�ciu VARRAG dowodzi� nami wtedy. My by� bardzo pot�ni.
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_07"); //VARRAG?
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_08"); //Morry m�wi� szaman.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_09"); //My zwalcza� Morry i obce orkowe klany.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_10"); //Teraz tu nie by� inny klan. My by� pot�g� i ostoj� ork�w z g�r.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_11"); //My polowa� na k�sacze, patrolowa� teren i oddawa� ho�d KRUSHAK.
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_12"); //Rozumiem.
};

//========================================
//-----------------> ORC_LANGUAGE
//========================================

INSTANCE DIA_Ash_ORC_LANGUAGE (C_INFO)
{
   nr           = 2;
   condition    = DIA_Ash_ORC_LANGUAGE_Condition;
   information  = DIA_Ash_ORC_LANGUAGE_Info;
   permanent	= FALSE;
   description	= "Sk�d orkowie znaj� ludzki j�zyk?";
};

FUNC INT DIA_Ash_ORC_LANGUAGE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ash_ORC_LANGUAGE_Info()
{
    AI_Output (other, self ,"DIA_Ash_ORC_LANGUAGE_15_01"); //Sk�d orkowie znaj� ludzki j�zyk?
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_02"); //My �y� tu wraz z Morry d�ugi czas. My uwa�nie s�ucha� w czasie bitew.
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_03"); //Wielu ork by� niewolniki z kopal�. Wielu wydosta� si� i przekazywa� wiedz� o j�zyk Morr dalej.
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_04"); //My orki nie by� tak g�upie jak Morry my�le�. My by� pot�ne. 
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_05"); //Na tyle pot�ne, �e ju� wkr�tce, gdy KRUSHAK si� przebudzi� my zdoby� ca�� Dolin�!
    AI_Output (other, self ,"DIA_Ash_ORC_LANGUAGE_15_06"); //Co? O czym ty m�wisz?
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_07"); //Morra przekona� si� ju� wkr�tce!
};

//========================================
//-----------------> ORC_SZEF
//========================================

INSTANCE DIA_Ash_ORC_SZEF (C_INFO)
{
   nr           = 3;
   condition    = DIA_Ash_ORC_SZEF_Condition;
   information  = DIA_Ash_ORC_SZEF_Info;
   permanent	= FALSE;
   description	= "Kto wami dowodzi?";
};

FUNC INT DIA_Ash_ORC_SZEF_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ash_ORC_SZEF_Info()
{
    AI_Output (other, self ,"DIA_Ash_ORC_SZEF_15_01"); //Kto wami dowodzi?
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_02"); //My by� pos�uszni VARRAG. Jednak my mie� w�dz, jak ka�dy klan.
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_03"); //Nasz w�dz nazywa� si� Ur-Gran i by� pot�ny wojownik. On dobrze dowodzi� nami, orkami.
    AI_Output (other, self ,"DIA_Ash_ORC_SZEF_15_04"); //Gdzie go znajd�?
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_05"); //RUSHTASOK, ale Morra by� ciekawska. Morra i�� w stron� �wi�tynia KRUSHAK. 
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_06"); //Morra min�� orkowy totem, do kt�rego modli� si� VARRAG i skr�ci� w prawy korytarz.
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_07"); //Tam Morra znale�� wielki w�dz. On by� w sala tronowa.
};

FUNC VOID B_AssignAmbientInfos_Orcs(var c_NPC slf)
{
	DIA_Orc_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_CAMP.npc				= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_LANGUAGE.npc			= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_SZEF.npc				= Hlp_GetInstanceID(slf);
};