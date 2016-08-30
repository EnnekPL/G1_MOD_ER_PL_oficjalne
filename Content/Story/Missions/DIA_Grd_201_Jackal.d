//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> JACKAL_THIEF_BANDIT
//========================================

INSTANCE DIA_Jackal_JACKAL_THIEF_BANDIT (C_INFO)
{
   npc          = GRD_201_Jackal;
   nr           = 1;
   condition    = DIA_Jackal_JACKAL_THIEF_BANDIT_Condition;
   information  = DIA_Jackal_JACKAL_THIEF_BANDIT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jackal_JACKAL_THIEF_BANDIT_Condition()
{
 var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)     {    
    return TRUE;
    };
};


FUNC VOID DIA_Jackal_JACKAL_THIEF_BANDIT_Info()
{
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_01"); //Ach, widz�, �e masz na sobie interesuj�cy pancerz.
    AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_02"); //Ilu jeszcze osobom b�d� musia� powtarza�, �e nie jestem Bandyt�?
    AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_03"); //Zdj��em ten pancerz z trupa. Pracuj� sam.
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_04"); //Tak, tak, to bardzo ciekawe. 
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_05"); //Musisz by� dobrym wojownikiem, skoro sam pokona�e� Bandyt�. 
    if (hero.attribute[ATR_DEXTERITY] <= 55)
    {
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_06"); //Tak, z pewno�ci� tak jest. 
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_07"); //Bardzo si� ciesz�. Musz� ju� i��. 
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_08"); //Do zobaczenia.
		var int polowa_rudy_gracza;
		polowa_rudy_gracza = Npc_hasitems (hero, itminugget);   
		polowa_rudy_gracza = polowa_rudy_gracza / 2;
		Npc_RemoveInvItems(hero,itminugget,polowa_rudy_gracza);
		
		odliczanie_po_kradziezy = 30; 
	}
    else
    {
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_09"); //Chwila! Co ty robisz? 
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_10"); //Pr�bujesz mnie okra��?
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_11"); //Powiniene� si� cieszy�, �e jeszcze �yjesz. Kilka os�b w Obozie czyha na twoje �ycie.
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_12"); //I w ko�cu dopniemy swego. Jeszcze zobaczysz. 
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_13"); //Radz� ci i�� pr�dko do Thorusa i powiedzie� mu, gdzie jest gniazdo tej pieprzonej zarazy. 
    };
    AI_StopProcessInfos	(self);
};



// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 1) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24 //1.4.02
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ach! Nowa twarz!
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Czego chcesz?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chc� ci zaoferowa� pomoc. Jeste� tu nowy, a nowi zawsze pakuj� si� w k�opoty... Mo�esz sobie zaoszcz�dzi� nieprzyjemno�ci ofiaruj�c mi... drobny datek.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Marne 10 bry�ek rudy. To� to grosze...
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A je�li nie zap�ac�?" ,Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co b�d� z tego mia�?" ,Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Masz tu 10 bry�ek. Ale pomo�esz mi, w razie potrzeby?" ,Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Masz tu 10 bry�ek. Ale pomo�esz mi, w razie potrzeby?
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Je�li tylko b�d� w pobli�u, mo�esz na mnie liczy�. Znajdziesz mnie pomi�dzy targowiskiem a po�udniow� bram�.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Reszt� Obozu obstawiaj� Fletcher i Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
		B_GiveInvItems (hero, self, itminugget, 10);//fix er1.4
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, masz mnie za idiot�?! Wr��, jak b�dziesz mia� do�� rudy!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co b�d� z tego mia�?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Dopilnuj�, �eby nic z�ego ci si� nie przydarzy�o na moim terenie.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Jak go�cie z Nowego Obozu nadepn� ci na odcisk albo wkurzy ci� jaki� �wir z Sekty, mo�esz na mnie liczy�.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Je�li we�miesz si� za �by z jakim� Kopaczem, pomo�emy temu z was, kt�ry zap�aci� podatek - proste, nie?
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A je�li oka�e si�, �e obydwaj zap�acili�my?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Wtedy b�dziemy spokojnie patrze�, jak si� zarzynacie. Ale to si� nie zdarza zbyt cz�sto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A je�li nie zap�ac�?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Cz�owieku, nie nara�aj si� na niepotrzebny stres! Jeste� tu nowy - rozejrzyj si� dooko�a. Zbierz troch� rudy, a jak b�dziesz mia� ju� do�� - zap�a�. Tak jest bezpieczniej.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Mo�esz to zrobi� teraz, albo p�niej. Tylko nie licz na moj� pomoc, dop�ki nie dostan� rudy. Mam nadziej�, �e si� rozumiemy?
	Info_AddChoice		(Info_Jackal_Hello,"Do zobaczenia." ,Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Do zobaczenia.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Miej oczy szeroko otwarte.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "Przemy�la�em sobie to, co powiedzia�e�. Oto 10 bry�ek rudy.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) ) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24 //1.4.02
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Przemy�la�em sobie to, co powiedzia�e�. Oto 10 bry�ek rudy.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //M�dra decyzja, kolego. Od tej pory mo�esz liczy� na moj� pomoc.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nie widz� u ciebie �adnych 10 bry�ek. Wr��, jak b�dziesz mia� ca�� kwot�.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "No i, jak leci?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //No i, jak leci?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Mo�esz na mnie liczy�, ch�opcze!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Widz�, �e szybko pniesz si� do g�ry. Dobra robota, stary!
};

//========================================
//-----------------> PALENIE
//========================================

INSTANCE DIA_Jackal_PALENIE (C_INFO)
{
   npc          = GRD_201_Jackal;
   nr           = 1;
   condition    = DIA_Jackal_PALENIE_Condition;
   information  = DIA_Jackal_PALENIE_Info;
   permanent	= FALSE;
   description	= "Chcesz sobie zapali�?";
};

FUNC INT DIA_Jackal_PALENIE_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (Jackal_Pali == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jackal_PALENIE_Info()
{
    AI_Output (other, self ,"DIA_Jackal_PALENIE_15_01"); //Chcesz sobie zapali�?
    AI_Output (self, other ,"DIA_Jackal_PALENIE_03_02"); //A masz mo�e Zew Nocy?
    B_LogEntry                     (CH1_Cpuny,"Szakal chce zapali� Zew Nocy.");
};

//========================================
//-----------------> ZEW_NOCY
//========================================
//edit by Nocturn
INSTANCE DIA_Jackal_ZEW_NOCY (C_INFO)
{
   npc          = GRD_201_Jackal;
   nr           = 2;
   condition    = DIA_Jackal_ZEW_NOCY_Condition;
   information  = DIA_Jackal_ZEW_NOCY_Info;
   permanent	= FALSE;
   description	= "Zapal sobie. (daj Zew Nocy)";
};

FUNC INT DIA_Jackal_ZEW_NOCY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jackal_PALENIE))
    && (Npc_HasItems (other, ItMiJoint_3) >=1)
	&& (Jackal_pali == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jackal_ZEW_NOCY_Info()
{
    B_GiveInvItems (other, self, ItMiJoint_3, 1);
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_01"); //Zapal sobie.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_02"); //Dzi�ki.
    AI_UseItem (self, ItMiJoint_3);
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_03"); //O tak! Tego mi by�o trzeba. 

    if (Npc_HasItems (other, RecruitJoint) >=1)
    {
        AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_04"); //Spr�buj te� tego.
        B_GiveInvItems (other, self, RecruitJoint, 1);
        AI_UseItem (self, RecruitJoint);
        AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_05"); //Hmmm. R�wnie� niez�e.
        Jackal_drugs_level = Jackal_drugs_level +1;
    };
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_06"); //Zajrzyj do Baal Tarana po wi�cej.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_07"); //Do tego oszusta?! Nigdy!
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_09"); //Kupowa�em ziele przez d�ugie miesi�ce u tego sukinsyna, a on nawet nie opu�ci� ceny.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_10"); //Zdziera z nas ile si� da. Tymczasem Baal Parvez ju� dawno obni�y� ceny, bo wiedzia�, �e jest popyt.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_11"); //Baal Taran chyba nie rozumie, �e po�owa Kopaczy nie ma za co kupi� chleba, a co dopiero czego� do palenia.
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_12"); //A gdybym zaproponowa� ci ni�sz� stawk�?
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_13"); //Ile opuszczasz?

    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "1 bry�k� rudy.", DIA_Jackal_ZEW_NOCY_1ORE);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "2 bry�ki rudy.", DIA_Jackal_ZEW_NOCY_2ORE);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "5 bry�ek rudy.", DIA_Jackal_ZEW_NOCY_5ORE);
};
//fixed by gothic1210
FUNC VOID DIA_Jackal_ZEW_NOCY_1ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_1ORE_15_01"); //1 bry�k� rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_1ORE_03_02"); //Troch� s�abo. Mo�e kiedy� zajrz� do Baal Tarana, ale nie zdarzy si� to pr�dko.
    Jackal_drugs_level = Jackal_drugs_level + 1;
    Jackal_pali = true;
	jackal_ore = 1;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Cpuny,"Nieco spu�ci�em z ceny. Powinienem teraz porozmawia� z Baal Taranem.");
};

FUNC VOID DIA_Jackal_ZEW_NOCY_2ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_2ORE_15_01"); //2 bry�ki rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_2ORE_03_02"); //To ju� brzmi lepiej. Wkr�tce zajrz� do Tarana.
    Jackal_drugs_level = Jackal_drugs_level + 2;
    Jackal_pali = true;
	jackal_ore = 2;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Cpuny,"Nieco spu�ci�em z ceny. Powinienem teraz porozmawia� z Baal Taranem.");
};

FUNC VOID DIA_Jackal_ZEW_NOCY_5ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_5ORE_15_01"); //5 bry�ek rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_5ORE_03_02"); //No, no! Nie�le. Bior� ca�� swoj� rud� i id� si� zaopatrzy�.
    Jackal_drugs_level = Jackal_drugs_level +1;
	jackal_ore = 5;
	 Jackal_pali = true;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Cpuny,"Nieco spu�ci�em z ceny. Powinienem teraz porozmawia� z Baal Taranem.");
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Patrzcie pa�stwo. To� to nasz arcy-zdrajca!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Gdyby� nie zadawa� si� z tymi fajt�apami, m�g�by� nadal by� jednym z nas!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, patrzcie! To ten facet z Nowego Obozu, przez kt�rego mamy tyle k�opot�w.
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Gdyby� wykaza� wtedy cho� odrobin� rozs�dku, m�g�by� teraz by� po stronie zwyci�zc�w... po NASZEJ stronie!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Patrzcie no! To ten go�� z Obozu na bagnie.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Za d�ugo zadawa�e� si� z tymi �wirami z Sekty. Zd��yli ci zrobi� wod� z m�zgu.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teraz nie uratuj� ci� nawet pieni�dze, kt�re zap�aci�e� mi za ochron�!
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Trzeba mi by�o zap�aci�, kiedy mia�e� okazj�.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Posun�li�cie si� za daleko. Atak na kopalni� by� powa�nym b��dem.
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Ale wygl�da na to, �e si� uda�o. A tobie ju� nic do tego!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //DALEJ, CH�OPCY! WYKO�CZMY GO!!!
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Nadszed� czas na walk� z Szakalem, jednym z najlepszych Stra�nik�w Gomeza. ");
	//Wida�, �e Stra�nicy dorwali si� do komnat Mag�w Ognia, bowiem Szakal dzier�y magiczn� bro�, kt�ra mo�e by� dla mnie k�opotliwa. 
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
	
};

instance TRIA_UrbanFighter (C_INFO)
{
    npc         = GRD_201_Jackal;
    nr          = 1;
    condition   = TRIA_UrbanFighter_condition;
    information = TRIA_UrbanFighter_info;
    important   = true;
    permanent   = false;
    //description = "TRIALOGTEST";
};

func int TRIA_UrbanFighter_condition()
{
	if MIS_ZmianaLorenza == LOG_RUNNING && UrbanIdzie == true
	// (VLK_565_Buddler.aivar[AIV_PARTYMEMBER] == TRUE) && 
	{
    return TRUE;
	};
};

func void TRIA_UrbanFighter_info()
{
    var c_npc Szakal;    	Szakal = Hlp_GetNpc(GRD_201_Jackal); 
    var c_npc Urban; 		Urban = Hlp_GetNpc(VLK_565_Buddler);
	
    TRIA_Invite(Urban); // Lade Gardist in diesen Dialog ein
    TRIA_Start();         // Starte das Gespr�ch

    TRIA_Next(Szakal);

    DIAG_Reset();
	MDL_REMOVEOVERLAYMDS (Urban, "HUMANS_DRUNKEN.MDS");	
	AI_GotoNpc(Szakal, Urban);
	AI_GotoNpc(hero, Urban);
	AI_Output (self, other, "TRIA_UrbanFighter_S"); //Czego tu?
	AI_Output (hero, self, "TRIA_UrbanFighter_0F"); //CZE��!
	AI_TurnToNpc(self, hero);
    AI_Output (self, other, "TRIA_UrbanFighter_00"); //Co, do cholery?!
	
    
	DIAG_Reset();
	TRIA_Next(Urban);
	DIAG_Reset();
	AI_TurnToNpc(Urban, hero);
	AI_Output (self, hero, "TRIA_UrbanFighter_01"); //Ju� dotarli�my? To on? Ten sukinsyn si� awanturuje? 
	//AI_GotoNpc(Urban, Szakal);
    DIAG("Nervous", 1, 2);
	TRIA_Cam("CAMERASTART");
    AI_GotoNpc(self, Szakal);
    DIAG("No", 0, 1);
	AI_TurnToNpc(self, Szakal);
	
    AI_Output (Urban, other, "TRIA_UrbanFighter_02"); //Ej ty! Zaraz dostaniesz w mord�!
	
	//AI_TurnToNpc (self,other);
    // Held soll sich w�hrend des n�chsten Satzes verschw�rerisch umsehen
    

   // AI_Output (other, self, "TRIA_UrbanFighter_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Gesch�ft?

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    

    // Held redet nun mit Gardist (self = Gardist, other = Hero)
    //TRIA_Next(Urban);
	//DIAG_Reset();
	

    TRIA_Finish(); // und Ende
	//Npc_ExchangeRoutine (Urban,"Start");
	AI_StopProcessInfos (Szakal);
	AI_StopProcessInfos (Urban);
	Npc_SetTarget (Urban,Szakal);
    AI_StartState (Urban,ZS_ATTACK,1,"");
	Npc_SetTarget (Szakal,Urban);
    AI_StartState (Szakal,ZS_ATTACK,1,"");
	UrbanPobity = true;
};

//========================================
//-----------------> ANGRYMAN
//========================================

INSTANCE DIA_Jackal_ANGRYMAN (C_INFO)
{
   npc          = GRD_201_Jackal;
   nr           = 1;
   condition    = DIA_Jackal_ANGRYMAN_Condition;
   information  = DIA_Jackal_ANGRYMAN_Info;
   permanent	= FALSE;
   important 	= TRUE;
};

FUNC INT DIA_Jackal_ANGRYMAN_Condition()
{
    if (UrbanPobity == true)
    && MIS_ZmianaLorenza == LOG_RUNNING
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jackal_ANGRYMAN_Info()
{
    AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_01"); //Ciebie te� mam skasowa�? To tw�j kumpel?
	AI_Output (other, self ,"DIA_Jackal_ANGRYMAN_15_02"); //Nie, po prostu zatacza� si� za mn�. Chcia�em si� tylko z tob� przywita�.
	AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_03"); //Nie wiem co�cie za jedni, ale dopilnuj� �eby ten sukinsyn zgni� w Kopalni.
	AI_Output (other, self ,"DIA_Jackal_ANGRYMAN_15_04"); //Mo�e ja m�g�bym si� tym zaj��? Pracuj� dla Lorenzo.
	AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_05"); //Dobra, mam ju� tego �miecia wi�cej nie widzie�!
    B_LogEntry               (CH1_ZmianaLorenza,"Uda�o si�. Urban rzuci� si� na Szakala, a ten bez problemu go pokona�. W�ciek� si� i kaza� mi zabra� Kopacza do Starej Kopalni.");	
};