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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Davor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Davor_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_02"); //Ja? Nazywam si� Davor. Jestem samotnym my�liwym. 
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_03"); //Poluj� g��wnie przy u�yciu �uku. Zbli�am si� tylko do MARTWEJ zwierzyny.
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
   description	= "Nauczysz mnie strzela� z �uku?";
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
    AI_Output (other, self ,"DIA_Davor_NAUKA_KOSZTA_15_01"); //Nauczysz mnie strzela� z �uku?
    AI_Output (self, other ,"DIA_Davor_NAUKA_KOSZTA_03_02"); //Jasne. Szukam okazji, �eby dorobi�. Mog� ci� te� nauczy� strzela� z kuszy.
    AI_Output (other, self ,"DIA_Davor_NAUKA_KOSZTA_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Davor_NAUKA_KOSZTA_03_04"); //200 bry�ek za nauk� strzelania z �uku i drugie 200 za nauk� kusznictwa. Im bardziej b�dziesz chcia� si� rozwija�, tym wi�cej b�dziesz mi musia� zap�aci�. 
	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Davor, my�liwy i �owca ork�w nauczy mnie strzela� z �uku i kuszy. B�d� mu jednak musia� zap�aci� 200 bry�ek rudy za t� przyjemno��.");
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
   description	= "Chce si� u ciebie uczy� strzela� z �uku.";
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
	AI_Output (other, self ,"DIA_Davor_LEARN_BOW_START_15_01"); //Chce si� u ciebie uczy� strzela� z �uku.
	if (Npc_HasItems (hero, ItMiNugget) >=200)
	{
    AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_02"); //Jasne. Powiedz, gdy b�dziesz got�w.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_LEARN_BOW_START.permanent = false;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_03"); //Przyjd�, gdy b�dziesz mia� wystarczaj�c� ilo�� rudy!
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
	description		= "Naucz mnie strzela� z �uku."; 
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
	
	AI_Output (other, self,"DIA_davor_Lehrer_15_00"); //Naucz mnie strzela� z �uku.
	AI_Output (self, other,"DIA_davor_Lehrer_12_01"); //Do dzie�a.
	
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
		AI_Output (other, self,"DIA_davor_Lehrer_Bow_15_00"); //Mo�esz mnie nauczy�, jak sprawniej pos�ugiwa� si� �ukiem?
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_01"); //Jako pocz�tkuj�cy powiniene� zawsze pami�ta�, �e skuteczno�� strzelania z �uku zale�y przede wszystkim od przyj�tej postawy.
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unie� na t� sam� wysoko��, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_03"); //Je�li uda ci si� trafi� w szczeg�lnie wra�liwe punkty cia�a ofiary, nie b�dzie potrzeby oddawania drugiego strza�u. Oczywi�cie pocz�tkuj�cy strzelcy mog� tylko pomarzy� o trafieniu w czu�y punkt.
		AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_04"); //Ale je�li zastosujesz si� do moich wskaz�wek, mo�esz liczy� na wi�cej trafie� w cel.
		B_GiveInvItems (hero,other,ItMiNugget,100);
	};
	}
	else
	{
	AI_Output (self, other,"DIA_davor_Lehrer_Bow_12_05"); //Na pocz�tek chcia�bym zobaczy� 100 bry�ek rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_Davor_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 15", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_02"); //Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_03"); //Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_05"); //Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
			B_GiveInvItems (hero,other,ItMiNugget,200);
	};
	}
	else
	{
	AI_Output (self, other,"DIA_davor_Lehrer_Bow_2_Info_12_06"); //Nie masz wystarczaj�co du�o rudy! Chc� zobaczy� 200 bry�ek.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_Davor_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
   description	= "Chc� si� uczy� jak strzela� z kuszy.";
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
    AI_Output (other, self ,"DIA_Davor_CROSSBOW_LEARN_START_15_01"); //Chc� si� uczy� jak strzela� z kuszy.
    AI_Output (self, other ,"DIA_Davor_CROSSBOW_LEARN_START_03_02"); //Dobra! Zaczniemy, gdy b�dziesz gotowy.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_CROSSBOW_LEARN_START.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Davor_CROSSBOW_LEARN_START_03_03"); //Mia�o by� DWIE�CIE BRY�EK RYDY �ebym w og�le po�wi�ci� ci czas.
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
	description		= "Poka� mi podstawy strzelania z kuszy."; 
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

	AI_Output (other, self,"non_205_davor_CROSSBOW_Info_15_01"); //Poka� mi podstawy strzelania z kuszy.
	if (hero.attribute[ATR_Dexterity] >= 20)
	{
		if (Npc_HasItems (hero, ItMiNugget) >=100)
		{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_02"); //Dobra. Bierzmy si� do roboty.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_03"); //Z�ap kusz� mocno i oprzyj j� o rami�. To powinno zwi�kszy� celno�� strza�u.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_04"); //Przez kilka pierwszych dni twoje rami� da ci si� nie�le we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_05"); //Po jakim� tygodniu b�dziesz mia� r�ce ze stali!
			AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_06"); //Wyceluj spokojnie i powoli �ci�gnij spust. Be�t niesie ze sob� wi�cej si�y ni� strza�a, dlatego powoduje wi�ksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,100);
			non_205_davor_CROSSBOW.permanent = 0;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_07"); //Je�eli chcesz pozna� podstawy musisz mi zap�aci� 100 bry�ek rudy!
		non_205_davor_CROSSBOW.permanent = 1;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_08_DEX"); //Musisz by� zr�czniejszy!
		PrintScreen	("Warunek: Zr�czno�� 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	description		= "Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy."; 
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
	AI_Output (other, self,"non_205_davor_CROSSBOW2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy.
	if (hero.attribute[ATR_Dexterity] >= 40)
	{
		if (Npc_HasItems (hero, ItMiNugget) >=200)
		{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (other, self,"non_205_davor_CROSSBOW2_OK_15_02"); //Zaczynajmy.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_03"); //Dobra. Twoje strza�y b�d� celniejsze, je�li przed �ci�gni�ciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_04"); //Naucz si� poprawnie ocenia� pr�dko�� z jak� porusza si� tw�j cel.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_05"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci�� �cie�k�, kt�r� porusza si� cel.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_06"); //Je�li atakujesz wi�cej ni� jeden cel, nie tra� czasu: musisz mo�liwie szybko przygwo�dzi� jeden za drugim dobrze wymierzonymi strza�ami.
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_07"); //To by by�o na tyle.
		B_GiveInvItems (hero,other,ItMiNugget,200);
		non_205_davor_CROSSBOW2.permanent = 0;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW2_OK_13_08"); //Chcia�bym �eby� najpierw mi zap�aci� 200 bry�ek rudy.
		non_205_davor_CROSSBOW2.permanent = 1;
		};
		}
		else
		{
		AI_Output (self, other,"non_205_davor_CROSSBOW_Info_13_08_DEX"); //Musisz by� zr�czniejszy!
		PrintScreen	("Warunek: Zr�czno�� 40", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
   description	= "Mo�e chcesz do��czy� do obozu �owc�w ork�w?";
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
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_01"); //Mo�e chcesz do��czy� do obozu �owc�w ork�w?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_02"); //W grupie zawsze ra�niej. Ju� od pewnego czasu planowa�em opu�ci� to miejsce, jednak co� mnie tu trzyma.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_04"); //To troch� g�upie, ale zgubi�em sw�j �uk gdzie� w okolicy.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_05"); //Jak mo�na zgubi� �uk?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_06"); //Zwyczajnie. Pewnie zsun�� mi si� z ramienia. 
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_07"); //M�g�by� go poszuka�?
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Davor uda si� do obozu �owc�w ork�w, je�eli znajd� jego �uk. Powinien by� gdzie� w okolicy.");
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
   description	= "Mam tw�j �uk.";
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
    AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_01"); //Mam tw�j �uk.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_02"); //�wietnie. Pewnie by� gdzie� w okolicy.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_03"); //Teraz mog� i�� do obozu �owc�w ork�w.
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_04"); //Powodzenia w polowaniu na ork�w.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_05"); //Dzi�ki. Trzymaj si�.
        Npc_ExchangeRoutine (self, "lowcy");
		B_GiveInvItems      (hero, self, It_DavorsBow, 1);//fix
        AI_StopProcessInfos	(self);
        B_LogEntry                     (CH3_NewBloodForOrcHunters,"Znalaz�em �uk Davora. My�liwy uda� si� do obozu �owc�w. ");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_06"); //Niestety rekrutacja jest ju� zako�czona.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_07"); //No c�. Mimo wszystko dzi�ki za �uk.
       B_GiveXP (200);       
	   AI_StopProcessInfos	(self);
    };
};


