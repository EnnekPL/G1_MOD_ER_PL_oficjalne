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
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_01"); //Ach, widzê, ¿e masz na sobie interesuj¹cy pancerz.
    AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_02"); //Ilu jeszcze osobom bêdê musia³ powtarzaæ, ¿e nie jestem Bandyt¹?
    AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_03"); //Zdj¹³em ten pancerz z trupa. Pracujê sam.
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_04"); //Tak, tak, to bardzo ciekawe. 
    AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_05"); //Musisz byæ dobrym wojownikiem, skoro sam pokona³eœ Bandytê. 
    if (hero.attribute[ATR_DEXTERITY] <= 55)
    {
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_06"); //Tak, z pewnoœci¹ tak jest. 
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_07"); //Bardzo siê cieszê. Muszê ju¿ iœæ. 
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
        AI_Output (other, self ,"DIA_Jackal_JACKAL_THIEF_BANDIT_15_10"); //Próbujesz mnie okraœæ?
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_11"); //Powinieneœ siê cieszyæ, ¿e jeszcze ¿yjesz. Kilka osób w Obozie czyha na twoje ¿ycie.
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_12"); //I w koñcu dopniemy swego. Jeszcze zobaczysz. 
        AI_Output (self, other ,"DIA_Jackal_JACKAL_THIEF_BANDIT_03_13"); //Radzê ci iœæ prêdko do Thorusa i powiedzieæ mu, gdzie jest gniazdo tej pieprzonej zarazy. 
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
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chcê ci zaoferowaæ pomoc. Jesteœ tu nowy, a nowi zawsze pakuj¹ siê w k³opoty... Mo¿esz sobie zaoszczêdziæ nieprzyjemnoœci ofiaruj¹c mi... drobny datek.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Marne 10 bry³ek rudy. To¿ to grosze...
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A jeœli nie zap³acê?" ,Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co bêdê z tego mia³?" ,Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Masz tu 10 bry³ek. Ale pomo¿esz mi, w razie potrzeby?" ,Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Masz tu 10 bry³ek. Ale pomo¿esz mi, w razie potrzeby?
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Jeœli tylko bêdê w pobli¿u, mo¿esz na mnie liczyæ. Znajdziesz mnie pomiêdzy targowiskiem a po³udniow¹ bram¹.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Resztê Obozu obstawiaj¹ Fletcher i Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
		B_GiveInvItems (hero, self, itminugget, 10);//fix er1.4
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, masz mnie za idiotê?! Wróæ, jak bêdziesz mia³ doœæ rudy!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co bêdê z tego mia³?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Dopilnujê, ¿eby nic z³ego ci siê nie przydarzy³o na moim terenie.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Jak goœcie z Nowego Obozu nadepn¹ ci na odcisk albo wkurzy ciê jakiœ œwir z Sekty, mo¿esz na mnie liczyæ.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Jeœli weŸmiesz siê za ³by z jakimœ Kopaczem, pomo¿emy temu z was, który zap³aci³ podatek - proste, nie?
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A jeœli oka¿e siê, ¿e obydwaj zap³aciliœmy?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Wtedy bêdziemy spokojnie patrzeæ, jak siê zarzynacie. Ale to siê nie zdarza zbyt czêsto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A jeœli nie zap³acê?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Cz³owieku, nie nara¿aj siê na niepotrzebny stres! Jesteœ tu nowy - rozejrzyj siê dooko³a. Zbierz trochê rudy, a jak bêdziesz mia³ ju¿ doœæ - zap³aæ. Tak jest bezpieczniej.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Mo¿esz to zrobiæ teraz, albo póŸniej. Tylko nie licz na moj¹ pomoc, dopóki nie dostanê rudy. Mam nadziejê, ¿e siê rozumiemy?
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
	description = "Przemyœla³em sobie to, co powiedzia³eœ. Oto 10 bry³ek rudy.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Przemyœla³em sobie to, co powiedzia³eœ. Oto 10 bry³ek rudy.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //M¹dra decyzja, kolego. Od tej pory mo¿esz liczyæ na moj¹ pomoc.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nie widzê u ciebie ¿adnych 10 bry³ek. Wróæ, jak bêdziesz mia³ ca³¹ kwotê.
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
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Mo¿esz na mnie liczyæ, ch³opcze!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Widzê, ¿e szybko pniesz siê do góry. Dobra robota, stary!
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
   description	= "Chcesz sobie zapaliæ?";
};

FUNC INT DIA_Jackal_PALENIE_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Jackal_Pali == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jackal_PALENIE_Info()
{
    AI_Output (other, self ,"DIA_Jackal_PALENIE_15_01"); //Chcesz sobie zapaliæ?
    AI_Output (self, other ,"DIA_Jackal_PALENIE_03_02"); //A masz mo¿e Zew Nocy?
    B_LogEntry                     (CH1_Druggy,"Szakal chce zapaliæ Zew Nocy.");
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
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_02"); //Dziêki.
    AI_UseItem (self, ItMiJoint_3);
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_03"); //O tak! Tego mi by³o trzeba. 

    if (Npc_HasItems (other, RecruitJoint) >=1)
    {
        AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_04"); //Spróbuj te¿ tego.
        B_GiveInvItems (other, self, RecruitJoint, 1);
        AI_UseItem (self, RecruitJoint);
        AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_05"); //Hmmm. Równie¿ niez³e.
        Jackal_drugs_level = Jackal_drugs_level +1;
    };
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_06"); //Zajrzyj do Baal Tarana po wiêcej.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_07"); //Do tego oszusta?! Nigdy!
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_09"); //Kupowa³em ziele przez d³ugie miesi¹ce u tego sukinsyna, a on nawet nie opuœci³ ceny.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_10"); //Zdziera z nas ile siê da. Tymczasem Baal Parvez ju¿ dawno obni¿y³ ceny, bo wiedzia³, ¿e jest popyt.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_11"); //Baal Taran chyba nie rozumie, ¿e po³owa Kopaczy nie ma za co kupiæ chleba, a co dopiero czegoœ do palenia.
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_15_12"); //A gdybym zaproponowa³ ci ni¿sz¹ stawkê?
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_03_13"); //Ile opuszczasz?

    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "1 bry³kê rudy.", DIA_Jackal_ZEW_NOCY_1ORE);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "2 bry³ki rudy.", DIA_Jackal_ZEW_NOCY_2ORE);
    Info_AddChoice		(DIA_Jackal_ZEW_NOCY, "5 bry³ek rudy.", DIA_Jackal_ZEW_NOCY_5ORE);
};
//fixed by gothic1210
FUNC VOID DIA_Jackal_ZEW_NOCY_1ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_1ORE_15_01"); //1 bry³kê rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_1ORE_03_02"); //Trochê s³abo. Mo¿e kiedyœ zajrzê do Baal Tarana, ale nie zdarzy siê to prêdko.
    Jackal_drugs_level = Jackal_drugs_level + 1;
    Jackal_pali = true;
	jackal_ore = 1;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Druggy,"Nieco spuœci³em z ceny. Powinienem teraz porozmawiaæ z Baal Taranem.");
};

FUNC VOID DIA_Jackal_ZEW_NOCY_2ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_2ORE_15_01"); //2 bry³ki rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_2ORE_03_02"); //To ju¿ brzmi lepiej. Wkrótce zajrzê do Tarana.
    Jackal_drugs_level = Jackal_drugs_level + 2;
    Jackal_pali = true;
	jackal_ore = 2;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Druggy,"Nieco spuœci³em z ceny. Powinienem teraz porozmawiaæ z Baal Taranem.");
};

FUNC VOID DIA_Jackal_ZEW_NOCY_5ORE()
{
    AI_Output (other, self ,"DIA_Jackal_ZEW_NOCY_5ORE_15_01"); //5 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jackal_ZEW_NOCY_5ORE_03_02"); //No, no! NieŸle. Biorê ca³¹ swoj¹ rudê i idê siê zaopatrzyæ.
    Jackal_drugs_level = Jackal_drugs_level +1;
	jackal_ore = 5;
	 Jackal_pali = true;
    Info_ClearChoices		(DIA_Jackal_ZEW_NOCY);
    AI_StopProcessInfos	(self);
	B_LogEntry                     (CH1_Druggy,"Nieco spuœci³em z ceny. Powinienem teraz porozmawiaæ z Baal Taranem.");
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Patrzcie pañstwo. To¿ to nasz arcy-zdrajca!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Gdybyœ nie zadawa³ siê z tymi fajt³apami, móg³byœ nadal byæ jednym z nas!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, patrzcie! To ten facet z Nowego Obozu, przez którego mamy tyle k³opotów.
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Gdybyœ wykaza³ wtedy choæ odrobinê rozs¹dku, móg³byœ teraz byæ po stronie zwyciêzców... po NASZEJ stronie!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Patrzcie no! To ten goœæ z Obozu na bagnie.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Za d³ugo zadawa³eœ siê z tymi œwirami z Sekty. Zd¹¿yli ci zrobiæ wodê z mózgu.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teraz nie uratuj¹ ciê nawet pieni¹dze, które zap³aci³eœ mi za ochronê!
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Trzeba mi by³o zap³aciæ, kiedy mia³eœ okazjê.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Posunêliœcie siê za daleko. Atak na kopalniê by³ powa¿nym b³êdem.
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Ale wygl¹da na to, ¿e siê uda³o. A tobie ju¿ nic do tego!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //DALEJ, CH£OPCY! WYKOÑCZMY GO!!!
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Nadszed³ czas na walkê z Szakalem, jednym z najlepszych Stra¿ników Gomeza. ");
	//Widaæ, ¿e Stra¿nicy dorwali siê do komnat Magów Ognia, bowiem Szakal dzier¿y magiczn¹ broñ, która mo¿e byæ dla mnie k³opotliwa. 
	
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
    TRIA_Start();         // Starte das Gespräch

    TRIA_Next(Szakal);

    DIAG_Reset();
	MDL_REMOVEOVERLAYMDS (Urban, "HUMANS_DRUNKEN.MDS");	
	AI_GotoNpc(Szakal, Urban);
	AI_GotoNpc(hero, Urban);
	AI_Output (self, other, "TRIA_UrbanFighter_S"); //Czego tu?
	AI_Output (hero, self, "TRIA_UrbanFighter_0F"); //CZEŒÆ!
	AI_TurnToNpc(self, hero);
    AI_Output (self, other, "TRIA_UrbanFighter_00"); //Co, do cholery?!
	
    
	DIAG_Reset();
	TRIA_Next(Urban);
	DIAG_Reset();
	AI_TurnToNpc(Urban, hero);
	AI_Output (self, hero, "TRIA_UrbanFighter_01"); //Ju¿ dotarliœmy? To on? Ten sukinsyn siê awanturuje? 
	//AI_GotoNpc(Urban, Szakal);
    DIAG("Nervous", 1, 2);
	TRIA_Cam("CAMERASTART");
    AI_GotoNpc(self, Szakal);
    DIAG("No", 0, 1);
	AI_TurnToNpc(self, Szakal);
	
    AI_Output (Urban, other, "TRIA_UrbanFighter_02"); //Ej ty! Zaraz dostaniesz w mordê!
	
	//AI_TurnToNpc (self,other);
    // Held soll sich während des nächsten Satzes verschwörerisch umsehen
    

   // AI_Output (other, self, "TRIA_UrbanFighter_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Geschäft?

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
    AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_01"); //Ciebie te¿ mam skasowaæ? To twój kumpel?
	AI_Output (other, self ,"DIA_Jackal_ANGRYMAN_15_02"); //Nie, po prostu zatacza³ siê za mn¹. Chcia³em siê tylko z tob¹ przywitaæ.
	AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_03"); //Nie wiem coœcie za jedni, ale dopilnujê ¿eby ten sukinsyn zgni³ w Kopalni.
	AI_Output (other, self ,"DIA_Jackal_ANGRYMAN_15_04"); //Mo¿e ja móg³bym siê tym zaj¹æ? Pracujê dla Lorenzo.
	AI_Output (self, other ,"DIA_Jackal_ANGRYMAN_03_05"); //Dobra, mam ju¿ tego œmiecia wiêcej nie widzieæ!
    B_LogEntry               (CH1_ZmianaLorenza,"Uda³o siê. Urban rzuci³ siê na Szakala, a ten bez problemu go pokona³. Wœciek³ siê i kaza³ mi zabraæ Kopacza do Starej Kopalni.");	
};