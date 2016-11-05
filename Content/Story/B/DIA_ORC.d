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
   description	= "Co mo¿esz mi powiedzieæ o tym obozie?";
};

FUNC INT DIA_Ash_ORC_CAMP_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ash_ORC_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_01"); //Co mo¿esz mi powiedzieæ o tym obozie?
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_02"); //A czemu Morra interesowaæ siê tym? To, ¿e Morra nosi ULU-MULU, nie znaczyæ, ¿e my wielbiæ Morra.
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_03"); //Nie mam z³ych zamiarów. Jestem po prostu ciekawy. 
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_04"); //Nasz obóz byæ pradawny, my orki ¿yæ w Dolina Górnicza od wieków.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_05"); //Nasz obóz powstaæ jeszcze przed wybudowaniem œwi¹tyni KRUSHAK.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_06"); //Piêciu VARRAG dowodziæ nami wtedy. My byæ bardzo potê¿ni.
    AI_Output (other, self ,"DIA_Ash_ORC_CAMP_15_07"); //VARRAG?
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_08"); //Morry mówiæ szaman.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_09"); //My zwalczaæ Morry i obce orkowe klany.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_10"); //Teraz tu nie byæ inny klan. My byæ potêg¹ i ostoj¹ orków z gór.
    AI_Output (self, other ,"DIA_Ash_ORC_CAMP_03_11"); //My polowaæ na k¹sacze, patrolowaæ teren i oddawaæ ho³d KRUSHAK.
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
   description	= "Sk¹d orkowie znaj¹ ludzki jêzyk?";
};

FUNC INT DIA_Ash_ORC_LANGUAGE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ash_ORC_LANGUAGE_Info()
{
    AI_Output (other, self ,"DIA_Ash_ORC_LANGUAGE_15_01"); //Sk¹d orkowie znaj¹ ludzki jêzyk?
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_02"); //My ¿yæ tu wraz z Morry d³ugi czas. My uwa¿nie s³uchaæ w czasie bitew.
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_03"); //Wielu ork byæ niewolniki z kopalñ. Wielu wydostaæ siê i przekazywaæ wiedzê o jêzyk Morr dalej.
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_04"); //My orki nie byæ tak g³upie jak Morry myœleæ. My byæ potê¿ne. 
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_05"); //Na tyle potê¿ne, ¿e ju¿ wkrótce, gdy KRUSHAK siê przebudziæ my zdobyæ ca³¹ Dolinê!
    AI_Output (other, self ,"DIA_Ash_ORC_LANGUAGE_15_06"); //Co? O czym ty mówisz?
    AI_Output (self, other ,"DIA_Ash_ORC_LANGUAGE_03_07"); //Morra przekonaæ siê ju¿ wkrótce!
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
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_02"); //My byæ pos³uszni VARRAG. Jednak my mieæ wódz, jak ka¿dy klan.
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_03"); //Nasz wódz nazywaæ siê Ur-Gran i byæ potê¿ny wojownik. On dobrze dowodziæ nami, orkami.
    AI_Output (other, self ,"DIA_Ash_ORC_SZEF_15_04"); //Gdzie go znajdê?
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_05"); //RUSHTASOK, ale Morra byæ ciekawska. Morra iœæ w stronê Œwi¹tynia KRUSHAK. 
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_06"); //Morra min¹æ orkowy totem, do którego modliæ siê VARRAG i skrêciæ w prawy korytarz.
    AI_Output (self, other ,"DIA_Ash_ORC_SZEF_03_07"); //Tam Morra znaleŸæ wielki wódz. On byæ w sala tronowa.
};

FUNC VOID B_AssignAmbientInfos_Orcs(var c_NPC slf)
{
	DIA_Orc_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_CAMP.npc				= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_LANGUAGE.npc			= Hlp_GetInstanceID(slf);
	DIA_Ash_ORC_SZEF.npc				= Hlp_GetInstanceID(slf);
};