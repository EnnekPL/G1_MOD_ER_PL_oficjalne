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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_02"); //Czego tu wêszyæ MORRA?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_03"); //Jabarath nie wolno byæ w sala tronowa wodza orków. 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_04"); //No, no. Widzê, ¿e nawet lepiej w³adasz jêzykiem ludzi ni¿ reszta twoich pobratymców.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_05"); //Ja byæ doœwiadczona wojownik, stoczyæ wiele URR-GARRGH z czerwoni ¿o³nierze.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_06"); //Przeklête szubrawcy ³apaæ moich bracia. Oni zmuszaæ moich bracia do ciê¿ka praca w kopalnia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_07"); //Ju¿ wkrótce dzieñ zap³ata i œmierdz¹ca wódz wrednych morr, GOMASH uton¹æ we w³asna krew!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_08"); //Tu siê zgadzamy.
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
   description	= "Czy wiesz jak mogê dostaæ siê do Œwi¹tyni Œni¹cego?";
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
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO2_15_01"); //Czy wiesz jak mogê dostaæ siê do Œwi¹tyni Œni¹cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_02"); //RUSHTASOK! JABARTH byæ g³upia?! Chcieæ dostaæ siê œwi¹tynia!? Do KARRASH!?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_03"); //Œwi¹tynia KRUSHAK zamkniêta, nie wejœæ tam nikt - ani MORRA ani ork.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_04"); //Tylko NAKK, syny ducha, morry mówiæ na nich szaman, znaæ jak dostaæ siê do KARRASH KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_05"); //Ale ¿adna NAKK nigdy nie podzieliæ wiedz¹ z Obcym, taka jak ty!
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_02"); //Czy Ur-Gran znaæ? Oczywiœcie, ¿e Ur-Gran znaæ ta g³upia NAKK!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_03"); //Za kogo ty mnie ma JABARTH?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_04"); //Ur-Shak byæ zdrajca! G³upia NAKK Ur-Shak siê wyprzeæ KRUSHAK. Ur-Shak mówiæ o nim bluŸnierstwa.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_05"); //Gdy Ur-Gran spotkaæ Ur-Shak, polaæ siê krew!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_06"); //KRUSHAK nie tolerowaæ zdrady!
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
   description	= "Co mo¿esz mi powiedzieæ o Œni¹cym?";
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
	AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_01"); //Co mo¿esz mi powiedzieæ o Œni¹cym?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_02"); //KRUSHAK byæ nasza bóg od wiele wieka. KARRASH KRUSHAK byæ wzniesiona przez przodkowie nasza przodków.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_03"); //My sk³adaæ NRVUHR dla KRUSHAK i oddawaæ czeœæ. My d¹¿yæ do wielkie przebudzenie KRUSHAK!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_04"); //Wielkie przebudzenie?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_05"); //JABARTH siê przekonaæ ju¿ nied³ugo!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_06"); //Gdy KRUSHAK siê przebudziæ, zniszczyæ wszystkie siedliska Morr na œwiecie. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_07"); //MORRA i ich król jeszcze po¿a³owaæ, ¿e nie byæ poddaæ siê w ta wojna dla nas orków!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_08"); //KRUSHAK ukaraæ wpierw g³upie MORRA z bagien. Oni byæ zdrajcy i przestaæ wierzyæ w KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_09"); //Ich HESH-GHURG na bagnach ju¿ wkrótce byæ nasz! My go zrównaæ z ziemia. 
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
   description	= "Sk¹d wiesz, ¿e Bractwo przesta³o wyznawaæ Œni¹cego?";
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
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_01"); //Sk¹d wiesz, ¿e Bractwo przesta³o wyznawaæ Œni¹cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_02"); //Powiedzieæ nam Kalom. On nasza GHARRESH - nasza przyjaciel i najwierniejsza s³uga KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_03"); //KRUSHAK zes³aæ wizja i powiedzieæ, ¿e do nasza SHER-KHURGH przyjœæ najwierniejsza s³uga KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_04"); //My musieæ pomóc s³uga, my wesprzeæ s³uga!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_05"); //GHARRESH Kalom byæ bardzo potê¿na NAKK, przyprowadziæ wiele wojownik i wyznawca KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_06"); //My ugoœciæ Kalom i wpuœciæ go do KARRASH - do morra mówiæ œwi¹tynia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_07"); //KRUSHAK powiedzieæ, to Kalom mieæ zbudziæ KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_08"); //Kalom powiedzieæ o zdrada MORRA z HESH-GHURG na bagno. NAKK Kalom poleciæ nam zniszczyæ ich najpierw.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_09"); //Có¿ za ironia, sam nale¿a³ do Bractwa. Zawsze wiedzia³em, ¿e to kawa³ sukinsyna...
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_10"); //Obcy uwa¿aæ co mówi! Kalom byæ wielki GHERRESH dla ork i NAKK. Ork nie pozwoliæ go obra¿aæ, MORRA. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_11"); //Jedna z³a s³owo, a KRUSH Ur-Grana str¹ciæ ³eb g³upia MORRA! 
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
   description	= "Na czym bêdzie polega³ rytua³ Cor Kaloma?";
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
	AI_Output (other, self ,"DIA_Ur_Gran_HELLO6_15_01"); //Na czym bêdzie polega³ rytua³ Cor Kaloma?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_02"); //On z wyznawcy obudziæ KRUSHAK i zostaæ jego wielki NAKK. Zostaæ arcykap³an KRUSHAK. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_03"); //On wyzwoliæ potêga orkowa serc. Nasze przodki w koñcu przestaæ byæ ¿ywa i martwa naraz.
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
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_02"); //ULU-MULU byæ symbol przyjaŸñ orkowie i JABARTH.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_03"); //Tylko zrêczna ork potrafi wykuæ ULU-MULU i mo¿e daæ go godna JABARTH.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_04"); //Sk¹d obcy zdobyæ ULU-MULU?
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_05"); //Zrobi³ go dla mnie Tarrok, uwolni³em go z kopalni.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_06"); //Wielka czyn JABARTH. KRUSHAK ci to wkrótce wynagrodziæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_07"); //ULU-MULU byæ zwyczaj nasz klan. Nie ka¿da inna klan orka go uznawaæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_08"); //Berserker we w³asna osoba zakazaæ stosowania ULU-MULU wœród innych orków. Nie wszystkie plemiona go pos³uchaæ. 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_09"); //Kim jest Berserker?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_10"); //To byæ król orków. Ju¿ dawno nie ¿yæ. On przewodziæ dla wielu szczepom. Kan obwo³aæ siê król po nim. Ur-Gran Kana nie uznaæ. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_11"); //Kan zjednoczyæ ju¿ i sprzymierzyæ wiele plemion za wielka woda. Kan zawrzeæ te¿ przymierze z wieloma orkowie z naszych gór. 
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
   description	= "[SPROWOKUJ] Orkowe œcierwo musi zdechn¹æ!";
};

FUNC INT DIA_Ur_Gran_HELLO8_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ur_Gran_HELLO8_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_01"); //Orkowe œcierwo musi zdechn¹æ! Niszczycie ludzkie osady, zabijacie i niewolicie! 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_02"); //Nie masz prawa do niszczenia w imiê Beliara!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_03"); //HA HA HA! Czy cz³owiek wie co mówi?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_04"); //Te s³owa zerwaæ przymierze ork - cz³owiek. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_05"); //Skazujesz siê na œmieræ, Obcy.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_06"); //Zaraz zbroczysz wasze "œwiête podziemia" krwi¹!
    AI_StopProcessInfos	(self);
	Ur_Gran.guild = GIL_MEATBUG;
	Npc_SetTrueGuild (Ur_Gran,GIL_MEATBUG);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
*/
