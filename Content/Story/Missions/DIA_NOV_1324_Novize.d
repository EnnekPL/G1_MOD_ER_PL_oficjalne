// ************************ EXIT **************************

instance  Nov_1324_Davson_Exit (C_INFO)
{
	npc			=  NOV_1324_Novize;
	nr			=  999;
	condition	=  Nov_1324_Davson_Exit_Condition;
	information	=  Nov_1324_Davson_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1324_Davson_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1324_Davson_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> Quest123
//========================================

INSTANCE DIA_Novize_Quest123 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_Quest123_Condition;
   information  = DIA_Novize_Quest123_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Novize_Quest123_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    || (Npc_GetTrueGuild (hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Quest123_Info()
{
    AI_Output (self, other ,"DIA_Novize_Quest123_03_01"); //Hej! Zaczekaj!
    AI_Output (other, self ,"DIA_Novize_Quest123_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_03"); //Pomo¿esz nam.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_04"); //Niby w czym?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_05"); //Opracowaliœmy w³aœnie nowe ziele.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_06"); //Jest bardzo mocne. Z pewnoœci¹ sporo mo¿na na tym zarobiæ.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_07"); //Podzielimy siê z tob¹ zyskami, je¿eli za³atwisz nam handlarzy.
    MIS_NoweZiele = LOG_RUNNING;
    CreateInvItems (self, MegaJoint, 4);
    B_GiveInvItems (self, other, MegaJoint, 4);		
	Log_CreateTopic            (CH1_NoweZiele, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NoweZiele, LOG_RUNNING);
    B_LogEntry                     (CH1_NoweZiele,"Nowicjusz Davson opracowa³ now¹ odmianê ziela. Uwa¿a, ¿e mo¿na na niej sporo zarobiæ. Podzieli siê ze mn¹ zyskami, je¿eli znajdê jakichœ kupców na jego towar.");
};

//========================================
//-----------------> KUPCy
//========================================

INSTANCE DIA_Novize_KUPCy (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_KUPCy_Condition;
   information  = DIA_Novize_KUPCy_Info;
   permanent	= FALSE;
   description	= "Gdzie niby mia³bym znaleŸæ kupców?";
};

FUNC INT DIA_Novize_KUPCy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_Quest123))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_KUPCy_Info()
{
    AI_Output (other, self ,"DIA_Novize_KUPCy_15_01"); //Gdzie niby mia³bym znaleŸæ kupców?
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_02"); //Hmmm. Najwiêkszy skup jest w Nowym Obozie. Mo¿e spróbuj tam.
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_03"); //Mo¿e dogadasz siê z jakimœ Baalem.
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_04"); //Spróbuj mu udowodniæ, ¿e nasz towar warto sprzedaæ.
    B_LogEntry                     (CH1_NoweZiele,"Najlepiej przekonaæ kogoœ w Nowym Obozie do handlu zielem.");
};

//========================================
//-----------------> Ifindkupiec
//========================================

INSTANCE DIA_Novize_Ifindkupiec (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_Ifindkupiec_Condition;
   information  = DIA_Novize_Ifindkupiec_Info;
   permanent	= FALSE;
   description	= "Znalaz³em kupca.";
};

FUNC INT DIA_Novize_Ifindkupiec_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_SkrzynaPelna))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_Ifindkupiec_Info()
{
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_01"); //Znalaz³em kupca.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_03"); //To Baal Kagan, handlarz zielem z Nowego Obozu.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_04"); //Czym go przekupi³eœ?
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_05"); //Wiele razy probowaliœmy mu sprzedaæ nasze ziele.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_06"); //Podmieni³em ziele z jego skrzyni na nasze.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_07"); //Przez przypadek wypali³ i by³ zachwycony.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_08"); //Bêdzie nam p³aci³ 35 bry³ek rudy za sztukê.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_09"); //Œwietna robota. Zg³aszaj siê tu codziennie po swoj¹ dzia³kê.
    B_LogEntry                     (CH1_NoweZiele,"Davson wielce siê uradowa³, gdy us³ysza³, ¿e znalaz³em kupca na jego ziele. Mogê codziennie przychodziæ po moj¹ dzia³kê.");
    Log_SetTopicStatus       (CH1_NoweZiele, LOG_SUCCESS);
    MIS_NoweZiele = LOG_SUCCESS;

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KasaKasa
//========================================

INSTANCE DIA_Novize_KasaKasa (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_KasaKasa_Condition;
   information  = DIA_Novize_KasaKasa_Info;
   permanent	= true;
   description	= "Przyszed³em po moj¹ dzia³kê.";
};

FUNC INT DIA_Novize_KasaKasa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_Ifindkupiec))
    && (day != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_KasaKasa_Info()
{
    AI_Output (other, self ,"DIA_Novize_KasaKasa_15_01"); //Przyszed³em po moj¹ dzia³kê.
    AI_Output (self, other ,"DIA_Novize_KasaKasa_03_02"); //Proszê bardzo!
    CreateInvItems (self, ItMiNugget, 40);
    B_GiveInvItems (self, other, ItMiNugget, 40);
    CreateInvItems (self, MegaJoint, 2);
    B_GiveInvItems (self, other, MegaJoint, 2);
    day = wld_getday();
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Novize_HELLO1 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_HELLO1_Condition;
   information  = DIA_Novize_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Novize_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_02"); //Jestem Davson - Nowicjusz pierwszego stopnia.
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_03"); //Czym siê tu zajmujesz?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_04"); //Nie powinno ciê to obchodziæ. W ogóle daj mi spokój, nie po to do³¹czy³em do Bractwa, aby u¿eraæ siê z ¿ó³todziobami.
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_05"); //Gdybym chcia³ siê z nimi mêczyæ, to zosta³bym w Starym Obozie. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Novize_HELLO2 (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_HELLO2_Condition;
   information  = DIA_Novize_HELLO2_Info;
   permanent	= FALSE;
   description	= "A wiêc by³eœ Kopaczem?";
};

FUNC INT DIA_Novize_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO2_15_01"); //A wiêc by³eœ Kopaczem?
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_02"); //Taa... Ale nie mia³em tam lekkiego ¿ycia.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_03"); //Stra¿nicy, z Bloodwynem na czele, ca³y czas okradali mnie z rudy i usi³owali siê nade mn¹ znêcaæ.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_04"); //Nie mówi¹c ju¿ o tych cwaniaczkach Cieniach. Uczciwoœci¹ to oni nie grzesz¹.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_05"); //Ca³e szczêœcie, ¿e pozna³em Baal Parveza, który wtajemniczy³ mnie w sprawy Bractwa.
};
//========================================
//-----------------> ImportantAngry
//========================================

INSTANCE DIA_Novize_ImportantAngry (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 2;
   condition    = DIA_Novize_ImportantAngry_Condition;
   information  = DIA_Novize_ImportantAngry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Novize_ImportantAngry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_Kapus1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_ImportantAngry_Info()
{
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_01"); //Ty pieprzony sukinsynie! Wyda³eœ nas!
    AI_Output (other, self ,"DIA_Novize_ImportantAngry_15_02"); //Spokojnie. Popracujecie trochê w winnicy. Nic wam siê nie stanie.
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_03"); //IdŸ precz! ZjedŸ mi z oczu! 
    AI_StopProcessInfos	(self);
};

// *Script was make in Easy Dialog Maker (EDM)

///////////////////////////
// KALOM
//////////////////////////

//========================================
//-----------------> Kapus1
//========================================

INSTANCE DIA_CorKalom_Kapus1 (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_Kapus1_Condition;
   information  = DIA_CorKalom_Kapus1_Info;
   permanent	= FALSE;
   description	= "Nowicjusze sprzedaj¹ przerobione ziele.";
};

FUNC INT DIA_CorKalom_Kapus1_Condition()
{
    if (MIS_NoweZiele == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_Kapus1_Info()
{
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_01"); //Nowicjusze sprzedaj¹ przerobione ziele.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_02"); //Jacy Nowicjusze?
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_03"); //Ci mieszkaj¹cy nieopodal twojej chaty.
    AI_Output (other, self ,"DIA_CorKalom_Kapus1_15_04"); //W swoich domach maj¹ laboratoria, w których wyrabiaj¹ nowe odmiany ziela.
    AI_Output (self, other ,"DIA_CorKalom_Kapus1_03_05"); //Ceniê sobie dobrych kapusiów.
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	Npc_ExchangeRoutine (NOV_1324_Novize,"wino");
	Npc_ExchangeRoutine (NOV_1323_Novize,"work");

    B_LogEntry                     (CH1_NoweZiele,"Poinformowa³em Cor Kaloma o nielegalnej produkcji ziela przez Davsona. Takie dzia³ania nie powinny mieæ racji bytu.");
    Log_SetTopicStatus       (CH1_NoweZiele, LOG_FAILED);
    MIS_NoweZiele = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Nowe, mocne ziele! ", 1,-1,"font_new_10_red.tga",2);	
	
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Novize_HowAreYou (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 3;
   condition    = DIA_Novize_HowAreYou_Condition;
   information  = DIA_Novize_HowAreYou_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_Novize_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Novize_HowAreYou_15_01"); //Jak leci?
    if (Npc_KnowsInfo (hero, DIA_Novize_ImportantAngry))
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_02"); //Nie wkurzaj mnie, koleœ!
    }
    else
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_03"); //By³o dobrze, dopóki nie przyszed³eœ...
    };
    AI_StopProcessInfos	(self);
};

