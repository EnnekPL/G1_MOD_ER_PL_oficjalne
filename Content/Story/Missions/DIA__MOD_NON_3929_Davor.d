// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Davor_EXIT(C_INFO)
{
	npc             = NON_3929_Davor;
	nr              = 999;
	condition	= DIA_Davor_EXIT_Condition;
	information	= DIA_Davor_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Davor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Davor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Davor_HELLO1 (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_HELLO1_Condition;
   information  = DIA_Davor_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Davor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Davor_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_02"); //Ja? Nazywam siê Davor. Jestem samotnym myœliwym. 
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_03"); //Polujê g³ównie przy u¿yciu ³uku. Zbli¿am siê tylko do MARTWEJ zwierzyny.
};

//========================================
//-----------------> NAUKA_KOSZTA
//========================================

INSTANCE DIA_Davor_NAUKA_KOSZTA (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 2;
   condition    = DIA_Davor_NAUKA_KOSZTA_Condition;
   information  = DIA_Davor_NAUKA_KOSZTA_Info;
   permanent	= FALSE;
   description	= "Nauczysz mnie strzelaæ z ³uku?";
};

FUNC INT DIA_Davor_NAUKA_KOSZTA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_NAUKA_KOSZTA_Info()
{
    AI_Output (other, self ,"DIA_Davor_NAUKA_KOSZTA_15_01"); //Nauczysz mnie strzelaæ z ³uku?
    AI_Output (self, other ,"DIA_Davor_NAUKA_KOSZTA_03_02"); //Jasne. Szukam okazji, ¿eby dorobiæ. Mogê ciê te¿ nauczyæ strzelaæ z kuszy.
    AI_Output (other, self ,"DIA_Davor_NAUKA_KOSZTA_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Davor_NAUKA_KOSZTA_03_04"); //200 bry³ek za naukê strzelania z ³uku i drugie 200 za naukê kusznictwa. Im bardziej bêdziesz chcia³ siê rozwijaæ, tym wiêcej bêdziesz mi musia³ zap³aciæ. 
	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Davor, myœliwy i ³owca orków nauczy mnie strzelaæ z ³uku i kuszy. Bêdê mu jednak musia³ zap³aciæ 200 bry³ek rudy za tê przyjemnoœæ.");
};

//========================================
//-----------------> LEARN_BOW_START
//========================================

INSTANCE DIA_Davor_LEARN_BOW_START (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 3;
   condition    = DIA_Davor_LEARN_BOW_START_Condition;
   information  = DIA_Davor_LEARN_BOW_START_Info;
   permanent	= FALSE;
   description	= "Chce siê u ciebie uczyæ strzelaæ z ³uku.";
};

FUNC INT DIA_Davor_LEARN_BOW_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_NAUKA_KOSZTA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_LEARN_BOW_START_Info()
{
	AI_Output (other, self ,"DIA_Davor_LEARN_BOW_START_15_01"); //Chce siê u ciebie uczyæ strzelaæ z ³uku.
	if (Npc_HasItems (hero, ItMiNugget) >=200)
	{
    AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_02"); //Jasne. Powiedz, gdy bêdziesz gotów.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_LEARN_BOW_START.permanent = false;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_03"); //PrzyjdŸ, gdy bêdziesz mia³ wystarczaj¹c¹ iloœæ rudy!
	DIA_Davor_LEARN_BOW_START.permanent = true;
	};
};



INSTANCE DIA_davor_Lehrer (C_INFO)
{
	npc				= NON_3929_Davor;
	nr				= 2;
	condition		= DIA_davor_Lehrer_Condition;
	information		= DIA_davor_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie strzelaæ z ³uku."; 
};

FUNC INT DIA_davor_Lehrer_Condition()
{	
if ( Npc_KnowsInfo(hero, DIA_Davor_LEARN_BOW_START))
{
		return 1;	
};
};
FUNC VOID DIA_davor_Lehrer_Info()
{
	
	AI_Output (other, self,"DIA_davor_Lehrer_15_00"); //Naucz mnie strzelaæ z ³uku.
	AI_Output (self, other,"DIA_davor_Lehrer_12_01"); //Do dzie³a.
	
	Info_ClearChoices	(DIA_davor_Lehrer );
	Info_AddChoice		(DIA_davor_Lehrer,DIALOG_BACK															,DIA_davor_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,200)	,DIA_davor_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,100)	,DIA_davor_Lehrer_Bow);
	};
	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_davor_LehrerDEX5);
	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_davor_LehrerDEX1);
};

func void DIA_davor_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_davor_Lehrer );
};
func void DIA_davor_LehrerDEX1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(DIA_davor_Lehrer );
	Info_AddChoice		(DIA_davor_Lehrer,DIALOG_BACK															,DIA_davor_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_davor_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_davor_Lehrer_Bow);
	};
	

	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_davor_LehrerDEX5);
	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_davor_LehrerDEX1);
};

func void DIA_davor_LehrerDEX5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(DIA_davor_Lehrer );
	Info_AddChoice		(DIA_davor_Lehrer,DIALOG_BACK															,DIA_davor_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_davor_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_davor_Lehrer_Bow);
	};
	
	
	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_davor_LehrerDEX5);
	Info_AddChoice		(DIA_davor_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_davor_LehrerDEX1);
};
func void DIA_davor_Lehrer_Bow()
{
	if (hero.attribute[ATR_Dexterity] >= 15)
	{
	if (Npc_HasItems (hero, ItMiNugget) >=100)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_davor_Lehrer_Bow_15_00"); //Mo¿esz mnie nauczyæ, jak sprawniej pos³ugiwaæ siê ³ukiem?
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_01"); //Jako pocz¹tkuj¹cy powinieneœ zawsze pamiêtaæ, ¿e skutecznoœæ strzelania z ³uku zale¿y przede wszystkim od przyjêtej postawy.
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unieœ na tê sam¹ wysokoœæ, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_03"); //Jeœli uda ci siê trafiæ w szczególnie wra¿liwe punkty cia³a ofiary, nie bêdzie potrzeby oddawania drugiego strza³u. Oczywiœcie pocz¹tkuj¹cy strzelcy mog¹ tylko pomarzyæ o trafieniu w czu³y punkt.
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_04"); //Ale jeœli zastosujesz siê do moich wskazówek, mo¿esz liczyæ na wiêcej trafieñ w cel.
		B_GiveInvItems (hero,other,ItMiNugget,100);
	};
	}
	else
	{
	AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_05"); //Na pocz¹tek chcia³bym zobaczyæ 100 bry³ek rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_Davor_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 15", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};


func void DIA_davor_Lehrer_Bow_2()
{
		if (hero.attribute[ATR_Dexterity] >= 30)
	{
if (Npc_HasItems (hero, ItMiNugget) >=200)
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_02"); //Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_03"); //Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_05"); //Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
			B_GiveInvItems (hero,other,ItMiNugget,200);
	};
	}
	else
	{
	AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_06"); //Nie masz wystarczaj¹co du¿o rudy! Chcê zobaczyæ 200 bry³ek.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_Davor_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

//========================================
//-----------------> CROSSBOW_LEARN_START
//========================================

INSTANCE DIA_Davor_CROSSBOW_LEARN_START (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 4;
   condition    = DIA_Davor_CROSSBOW_LEARN_START_Condition;
   information  = DIA_Davor_CROSSBOW_LEARN_START_Info;
   permanent	= FALSE;
   description	= "Chcê siê uczyæ jak strzelaæ z kuszy.";
};

FUNC INT DIA_Davor_CROSSBOW_LEARN_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_NAUKA_KOSZTA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_CROSSBOW_LEARN_START_Info()
{
	if (Npc_HasItems (hero, ItMiNugget) >=200)
	{
    AI_Output (other, self ,"DIA_Davor_CROSSBOW_LEARN_START_15_01"); //Chcê siê uczyæ jak strzelaæ z kuszy.
    AI_Output (self, other ,"DIA_Davor_CROSSBOW_LEARN_START_03_02"); //Dobra! Zaczniemy, gdy bêdziesz gotowy.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_CROSSBOW_LEARN_START.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Davor_CROSSBOW_LEARN_START_03_03"); //Mia³o byæ DWIEŒCIE BRY£EK RYDY ¿ebym w ogóle poœwiêci³ ci czas.
	DIA_Davor_CROSSBOW_LEARN_START.permanent = true;
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/

instance  non_205_davor_CROSSBOW (C_INFO)
{
	npc				= NON_3929_Davor;
	condition		= non_205_davor_CROSSBOW_Condition;
	information		= non_205_davor_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka¿ mi podstawy strzelania z kuszy."; 
};

FUNC int  non_205_davor_CROSSBOW_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Davor_CROSSBOW_LEARN_START)) 
	&& (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 0) 
	{
		return TRUE;
	};

};
FUNC void  non_205_davor_CROSSBOW_Info()
{

	AI_Output (other, self,"non_205_davor_CROSSBOW_Info_15_01"); //Poka¿ mi podstawy strzelania z kuszy.
	if (hero.attribute[ATR_Dexterity] >= 20)
	{
		if (Npc_HasItems (hero, ItMiNugget) >=100)
		{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_02"); //Dobra. Bierzmy siê do roboty.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_03"); //Z³ap kuszê mocno i oprzyj j¹ o ramiê. To powinno zwiêkszyæ celnoœæ strza³u.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_04"); //Przez kilka pierwszych dni twoje ramiê da ci siê nieŸle we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_05"); //Po jakimœ tygodniu bêdziesz mia³ rêce ze stali!
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_06"); //Wyceluj spokojnie i powoli œci¹gnij spust. Be³t niesie ze sob¹ wiêcej si³y ni¿ strza³a, dlatego powoduje wiêksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,100);
			non_205_davor_CROSSBOW.permanent = 0;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_07"); //Je¿eli chcesz poznaæ podstawy musisz mi zap³aciæ 100 bry³ek rudy!
		non_205_davor_CROSSBOW.permanent = 1;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_08_DEX"); //Musisz byæ zrêczniejszy!
		PrintScreen	("Warunek: Zrêcznoœæ 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		non_205_davor_CROSSBOW.permanent = 1;
		};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  non_205_davor_CROSSBOW2 (C_INFO)
{
	npc				= NON_3929_Davor;
	condition		= non_205_davor_CROSSBOW2_Condition;
	information		= non_205_davor_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy."; 
};

FUNC int  non_205_davor_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	&& (Npc_KnowsInfo (hero, DIA_Davor_CROSSBOW_LEARN_START))
	{
		return TRUE;
	};

};
FUNC void  non_205_davor_CROSSBOW2_Info()
{
	AI_Output (other, self,"non_205_davor_CROSSBOW2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy.
	if (hero.attribute[ATR_Dexterity] >= 40)
	{
		if (Npc_HasItems (hero, ItMiNugget) >=200)
		{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (other, self,"non_205_davor_CROSSBOW2_OK_15_02"); //Zaczynajmy.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_03"); //Dobra. Twoje strza³y bêd¹ celniejsze, jeœli przed œci¹gniêciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_04"); //Naucz siê poprawnie oceniaæ prêdkoœæ z jak¹ porusza siê twój cel.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_05"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci¹³ œcie¿kê, któr¹ porusza siê cel.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_06"); //Jeœli atakujesz wiêcej ni¿ jeden cel, nie traæ czasu: musisz mo¿liwie szybko przygwoŸdziæ jeden za drugim dobrze wymierzonymi strza³ami.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_07"); //To by by³o na tyle.
		B_GiveInvItems (hero,other,ItMiNugget,200);
		non_205_davor_CROSSBOW2.permanent = 0;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_08"); //Chcia³bym ¿ebyœ najpierw mi zap³aci³ 200 bry³ek rudy.
		non_205_davor_CROSSBOW2.permanent = 1;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_08_DEX"); //Musisz byæ zrêczniejszy!
		PrintScreen	("Warunek: Zrêcznoœæ 40", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		non_205_davor_CROSSBOW2.permanent = 1;
		};
};

//========================================
//-----------------> OBOZ
//========================================

INSTANCE DIA_Davor_OBOZ (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 5;
   condition    = DIA_Davor_OBOZ_Condition;
   information  = DIA_Davor_OBOZ_Info;
   permanent	= FALSE;
   description	= "Mo¿e chcesz do³¹czyæ do obozu ³owców orków?";
};

FUNC INT DIA_Davor_OBOZ_Condition()
{
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Davor_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_OBOZ_Info()
{
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_01"); //Mo¿e chcesz do³¹czyæ do obozu ³owców orków?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_02"); //W grupie zawsze raŸniej. Ju¿ od pewnego czasu planowa³em opuœciæ to miejsce, jednak coœ mnie tu trzyma.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_04"); //To trochê g³upie, ale zgubi³em swój ³uk gdzieœ w okolicy.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_05"); //Jak mo¿na zgubiæ ³uk?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_06"); //Zwyczajnie. Pewnie zsun¹³ mi siê z ramienia. 
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_07"); //Móg³byœ go poszukaæ?
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Davor uda siê do obozu ³owców orków, je¿eli znajdê jego ³uk. Powinien byæ gdzieœ w okolicy.");
};

//========================================
//-----------------> FIND_BOW
//========================================

INSTANCE DIA_Davor_FIND_BOW (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_FIND_BOW_Condition;
   information  = DIA_Davor_FIND_BOW_Info;
   permanent	= FALSE;
   description	= "Mam twój ³uk.";
};

FUNC INT DIA_Davor_FIND_BOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_OBOZ))
    && (Npc_HasItems (other, It_DavorsBow) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_FIND_BOW_Info()
{
    AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_01"); //Mam twój ³uk.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_02"); //Œwietnie. Pewnie by³ gdzieœ w okolicy.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_03"); //Teraz mogê iœæ do obozu ³owców orków.
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_04"); //Powodzenia w polowaniu na orków.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_05"); //Dziêki. Trzymaj siê.
        Npc_ExchangeRoutine (self, "lowcy");
		B_GiveInvItems      (hero, self, It_DavorsBow, 1);//fix
        AI_StopProcessInfos	(self);
        B_LogEntry                     (CH3_NewBloodForOrcHunters,"Znalaz³em ³uk Davora. Myœliwy uda³ siê do obozu ³owców. ");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_06"); //Niestety rekrutacja jest ju¿ zakoñczona.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_07"); //No có¿. Mimo wszystko dziêki za ³uk.
       B_GiveXP (200);       
	   AI_StopProcessInfos	(self);
    };
};


