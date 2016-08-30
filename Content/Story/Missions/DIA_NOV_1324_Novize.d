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
    AI_Output (self, other ,"DIA_Novize_Quest123_03_03"); //Pomo�esz nam.
    AI_Output (other, self ,"DIA_Novize_Quest123_15_04"); //Niby w czym?
    AI_Output (self, other ,"DIA_Novize_Quest123_03_05"); //Opracowali�my w�a�nie nowe ziele.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_06"); //Jest bardzo mocne. Z pewno�ci� sporo mo�na na tym zarobi�.
    AI_Output (self, other ,"DIA_Novize_Quest123_03_07"); //Podzielimy si� z tob� zyskami, je�eli za�atwisz nam handlarzy.
    MIS_NoweZiele = LOG_RUNNING;
    CreateInvItems (self, MegaJoint, 4);
    B_GiveInvItems (self, other, MegaJoint, 4);		
	Log_CreateTopic            (CH1_NoweZiele, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NoweZiele, LOG_RUNNING);
    B_LogEntry                     (CH1_NoweZiele,"Nowicjusz Davson opracowa� now� odmian� ziela. Uwa�a, �e mo�na na niej sporo zarobi�. Podzieli si� ze mn� zyskami, je�eli znajd� jakich� kupc�w na jego towar.");
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
   description	= "Gdzie niby mia�bym znale�� kupc�w?";
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
    AI_Output (other, self ,"DIA_Novize_KUPCy_15_01"); //Gdzie niby mia�bym znale�� kupc�w?
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_02"); //Hmmm. Najwi�kszy skup jest w Nowym Obozie. Mo�e spr�buj tam.
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_03"); //Mo�e dogadasz si� z jakim� Baalem.
    AI_Output (self, other ,"DIA_Novize_KUPCy_03_04"); //Spr�buj mu udowodni�, �e nasz towar warto sprzeda�.
    B_LogEntry                     (CH1_NoweZiele,"Najlepiej przekona� kogo� w Nowym Obozie do handlu zielem.");
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
   description	= "Znalaz�em kupca.";
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
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_01"); //Znalaz�em kupca.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_03"); //To Baal Kagan, handlarz zielem z Nowego Obozu.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_04"); //Czym go przekupi�e�?
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_05"); //Wiele razy probowali�my mu sprzeda� nasze ziele.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_06"); //Podmieni�em ziele z jego skrzyni na nasze.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_07"); //Przez przypadek wypali� i by� zachwycony.
    AI_Output (other, self ,"DIA_Novize_Ifindkupiec_15_08"); //B�dzie nam p�aci� 35 bry�ek rudy za sztuk�.
    AI_Output (self, other ,"DIA_Novize_Ifindkupiec_03_09"); //�wietna robota. Zg�aszaj si� tu codziennie po swoj� dzia�k�.
    B_LogEntry                     (CH1_NoweZiele,"Davson wielce si� uradowa�, gdy us�ysza�, �e znalaz�em kupca na jego ziele. Mog� codziennie przychodzi� po moj� dzia�k�.");
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
   description	= "Przyszed�em po moj� dzia�k�.";
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
    AI_Output (other, self ,"DIA_Novize_KasaKasa_15_01"); //Przyszed�em po moj� dzia�k�.
    AI_Output (self, other ,"DIA_Novize_KasaKasa_03_02"); //Prosz� bardzo!
    CreateInvItems (self, ItMiNugget, 40);
    B_GiveInvItems (self, other, ItMiNugget, 40);
    CreateInvItems (self, MegaJoint, 2);
    B_GiveInvItems (self, other, MegaJoint, 2);
    day = wld_getday();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DawacPrzepis
//========================================

INSTANCE DIA_Novize_DawacPrzepis (C_INFO)
{
   npc          = NOV_1324_Novize;
   nr           = 1;
   condition    = DIA_Novize_DawacPrzepis_Condition;
   information  = DIA_Novize_DawacPrzepis_Info;
   permanent	= FALSE;
   description	= "Podobno macie jaki� przepis...";
};

FUNC INT DIA_Novize_DawacPrzepis_Condition()
{
    if (MIS_NoweZiele2BAU == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_BaalKagan_NamesNovize))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_DawacPrzepis_Info()
{
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_01"); //Podobno macie jaki� przepis...
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_02"); //Nast�pny dure�, kt�ry my�li, �e dostanie co� za darmo.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_03"); //He he he. Przepis mog� ci da� za 3000 bry�ek rudy.
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_05"); //Zaraz nie b�dzie ci tak do �miechu.
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_06"); //Sam sobie wezm� ten przepis.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_07"); //Nie, nie. Bicie mnie nic ci nie da.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_08"); //Nie mam go przy sobie.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_09"); //Jest dobrze ukryty. He he.
    AI_Output (self, other ,"DIA_Novize_DawacPrzepis_03_10"); //Niech ci nawet nie przejdzie przez my�l myszkowa� w naszej chacie.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Novize_DawacPrzepis_15_11"); //G�upcy.
    B_LogEntry                     (CH1_NoweZiele2BAU,"Nie uda�o mi si� uzyska� przepisu od Davsona. Przypuszczam, �e jest w jego chacie. Je�eli wejd� tam od razu, zostan� zaatakowany przez Stra�nik�w �wi�tynnych. Musz� jako� pozby� si� Nowicjuszy.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
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
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_01"); //Ty pieprzony sukinsynie! Wyda�e� nas!
    AI_Output (other, self ,"DIA_Novize_ImportantAngry_15_02"); //Spokojnie. Popracujecie troch� w winnicy. Nic wam si� nie stanie.
    AI_Output (self, other ,"DIA_Novize_ImportantAngry_03_03"); //Id� precz! Zjed� mi z oczu! 
    AI_StopProcessInfos	(self);
};

// *Script was make in Easy Dialog Maker (EDM)

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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Novize_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_02"); //Jestem Davson - Nowicjusz pierwszego stopnia.
    AI_Output (other, self ,"DIA_Novize_HELLO1_15_03"); //Czym si� tu zajmujesz?
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_04"); //Nie powinno ci� to obchodzi�. W og�le daj mi spok�j, nie po to do��czy�em do Bractwa, aby u�era� si� z ��todziobami.
    AI_Output (self, other ,"DIA_Novize_HELLO1_03_05"); //Gdybym chcia� si� z nimi m�czy�, to zosta�bym w Starym Obozie. 
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
   description	= "A wi�c by�e� Kopaczem?";
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
    AI_Output (other, self ,"DIA_Novize_HELLO2_15_01"); //A wi�c by�e� Kopaczem?
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_02"); //Taa... Ale nie mia�em tam lekkiego �ycia.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_03"); //Stra�nicy, z Bloodwynem na czele, ca�y czas okradali mnie z rudy i usi�owali si� nade mn� zn�ca�.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_04"); //Nie m�wi�c ju� o tych cwaniaczkach Cieniach. Uczciwo�ci� to oni nie grzesz�.
    AI_Output (self, other ,"DIA_Novize_HELLO2_03_05"); //Ca�e szcz�cie, �e pozna�em Baal Parveza, kt�ry wtajemniczy� mnie w sprawy Bractwa.
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
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_02"); //Nie wkurzaj mnie, kole�!
    }
    else
    {
        AI_Output (self, other ,"DIA_Novize_HowAreYou_03_03"); //By�o dobrze, dop�ki nie przyszed�e�...
    };
    AI_StopProcessInfos	(self);
};

