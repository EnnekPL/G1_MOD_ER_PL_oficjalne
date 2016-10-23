//poprawione i sprawdzone - Nocturn

//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> DISS_BANDIT
//========================================

INSTANCE DIA_Cutter_DISS_BANDIT (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_DISS_BANDIT_Condition;
   information  = DIA_Cutter_DISS_BANDIT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_DISS_BANDIT_Condition()
{
var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)     {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_DISS_BANDIT_Info()
{
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_01"); //Masz sporo odwagi, �eby si� tu pokazywa�.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_02"); //Ca�y Ob�z chce ci� dorwa�. 
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_03"); //Pos�uchaj, to nie tak jak my�lisz...
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_04"); //Wszyscy w k�ko powtarzaj� twoj� wym�wk�, znam ju� j�. Nie musisz mi powtarza�.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_05"); //Niekt�rzy w ni� wierz�. C�, ja potrafi� wyczu� k�amstwo z odleg�o�ci mili. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_06"); //Nie nabierzesz mnie, ch�opcze.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_07"); //Czego wi�c chcesz?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_08"); //Przypuszczam, �e masz ju� do�� tych prze�ladowa�. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_09"); //Mog� by� twoim najgorszym koszmarem, ale mog� tak�e da� ci spok�j.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_10"); //Ile to mnie b�dzie kosztowa�?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_11"); //400 bry�ek rudy. Przyznasz, �e to niewiele, jak na cen� spokoju. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_12"); //Pami�taj, �e to co ja mog� ci zrobi�, b�dzie piek�em.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_13"); //To jak? Dogadamy si�?

    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Masz t� rud� i daj mi spok�j.", DIA_Cutter_DISS_BANDIT_GIVE_ORE);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Nie mam tyle rudy. ", DIA_Cutter_DISS_BANDIT_NIE_MAM);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Zapomnij. Nie uda ci si� mnie zastraszy�!", DIA_Cutter_DISS_BANDIT_ZAPOMNIJ);
};

FUNC VOID DIA_Cutter_DISS_BANDIT_GIVE_ORE()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_15_01"); //Masz t� rud� i daj mi spok�j.
    if (Npc_HasItems (hero, ItMiNugget)>=400)
    {
        B_GiveInvItems (other, self, ItMiNugget, 400);
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_02"); //�wietnie. Ju� nigdy o mnie nie us�yszysz. 
        Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
        AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_03"); //Masz jeszcze czelno�� mnie oszukiwa�?! 
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_04"); //Zm�w ostatni� modlitw� do Innosa. 
		GRD_208_Cutter.guild = GIL_NONE;
		Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
		Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
        AI_StopProcessInfos	(self);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
    };
};

FUNC VOID DIA_Cutter_DISS_BANDIT_NIE_MAM()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_NIE_MAM_15_01"); //Nie mam tyle rudy. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_NIE_MAM_03_02"); //A wi�c nie masz te� �ycia w tym Obozie!
	GRD_208_Cutter.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Cutter_DISS_BANDIT_ZAPOMNIJ()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_15_01"); //Zapomnij. Nie uda ci si� mnie zastraszy�!
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_03_02"); //Zobaczymy! Zm�w ostatni� modlitw� do Innosa!
	GRD_208_Cutter.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> AFTER_FIGHT
//========================================

INSTANCE DIA_Cutter_AFTER_FIGHT (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_AFTER_FIGHT_Condition;
   information  = DIA_Cutter_AFTER_FIGHT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_AFTER_FIGHT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_DISS_BANDIT))
    && (GRD_208_Cutter.aivar[AIV_HASDEFEATEDSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_AFTER_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_03_01"); //Nie masz �ycia w tym Obozie! 
	GRD_208_Cutter.guild = GIL_GRD;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_GRD);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AFTER_FIGHT_WIN
//========================================

INSTANCE DIA_Cutter_AFTER_FIGHT_WIN (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 2;
   condition    = DIA_Cutter_AFTER_FIGHT_WIN_Condition;
   information  = DIA_Cutter_AFTER_FIGHT_WIN_Info;
   permanent	= FALSE;
   description	= "";
};

FUNC INT DIA_Cutter_AFTER_FIGHT_WIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_DISS_BANDIT))
    && (GRD_208_Cutter.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_AFTER_FIGHT_WIN_Info()
{
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_01"); //To niemo�liwe. Jestem jednym z najlepszych wojownik�w w ca�ym Starym Obozie. 
    AI_Output (other, self ,"DIA_Cutter_AFTER_FIGHT_WIN_15_02"); //Treningi u Bandyt�w potrafi� zdzia�a� cuda.
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_03"); //Odejd� st�d! Nie chc� ci� tu widzie�!
    AI_StopProcessInfos	(self);
	GRD_208_Cutter.guild = GIL_GRD;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_GRD);
};


//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Wasz zamek jest bardzo du�y.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Wasz zamek jest bardzo du�y.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba ci� jeszcze tutaj nie widzia�em. Kim jeste�?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jestem tu nowy. Chcia�em si� troch� rozejrze�.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 0;
	description = "Mo�esz mi opowiedzie� o tym zamku?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo�esz mi opowiedzie� o tym zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu du�o m�wi�: Gomez i jego ludzie zaj�li go po wielkim buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz�tku wiedzia�em, �e warto b�dzie stan�� po jego stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wi�niowie zamkni�ci w lochach lub zmuszani do pracy w kopalni, uznawa�o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj� si� pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz �wiec� pustk�. Nikt tam nie schodzi� od czasu wielkiego buntu.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Jak wygl�da �ycie Stra�nika?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl�da �ycie Stra�nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jeste�my najwi�kszym i najsilniejszym Obozem w Kolonii. Nikt nie �mie nas zaczepia�.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Rozumiem.
	AI_StopProcessInfos	(self);
};

	

//========================================
//-----------------> SzukaszBulita
//========================================

INSTANCE DIA_Cutter_SzukaszBulita (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_SzukaszBulita_Condition;
   information  = DIA_Cutter_SzukaszBulita_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_SzukaszBulita_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_QuestGRD1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_SzukaszBulita_Info()
{
    AI_Output (self, other ,"DIA_Cutter_SzukaszBulita_03_01"); //Szukasz Bullita?
    AI_Output (other, self ,"DIA_Cutter_SzukaszBulita_15_02"); //Mo�liwe.
    AI_Output (self, other ,"DIA_Cutter_SzukaszBulita_03_03"); //Poszed� w�a�nie na plac wymian. Podobno zrzucili kogo� nowego.
    B_LogEntry                     (CH2_BullitBadass,"Bullit poszed� na plac wymian. Teraz mam szans� zdoby� jaki� dow�d na niego.");
    AI_StopProcessInfos	(self);
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dokona�e� w�a�ciwego wyboru. Spodoba ci si� bycie Stra�nikiem!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PorwanieMysliwego
//========================================

INSTANCE DIA_Cutter_PorwanieMysliwego (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_PorwanieMysliwego_Condition;
   information  = DIA_Cutter_PorwanieMysliwego_Info;
   permanent	= FALSE;
   description	= "Podobno porwali�cie my�liwego.";
};

FUNC INT DIA_Cutter_PorwanieMysliwego_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_Porwanie))
    && (MIS_Kidnapping == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_PorwanieMysliwego_Info()
{
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_01"); //Podobno porwali�cie my�liwego.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_02"); //Mo�liwe.
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_03"); //Dlaczego to zrobili�cie?
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_04"); //O to musisz ju� spyta� Kruka.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_05"); //To on zleci� nam to zadanie.
    B_LogEntry                     (CH3_Kidnapping,"Za porwaniem Alexa stoi Kruk. Musz� z nim porozmawia�.");

    B_GiveXP (150);
};

//========================================
//-----------------> WhereAlex
//========================================

INSTANCE DIA_Cutter_WhereAlex (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 2;
   condition    = DIA_Cutter_WhereAlex_Condition;
   information  = DIA_Cutter_WhereAlex_Info;
   permanent	= FALSE;
   description	= "Gdzie jest teraz Alex?";
};

FUNC INT DIA_Cutter_WhereAlex_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_PorwanieMysliwego))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_WhereAlex_Info()
{
    AI_Output (other, self ,"DIA_Cutter_WhereAlex_15_01"); //Gdzie jest teraz Alex?
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_02"); //Nie wiem. D�ugo rozmawiali z Krukiem. 
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_03"); //Nie wiem, co z nim zrobi�. 
    AI_Output (other, self ,"DIA_Cutter_WhereAlex_15_04"); //Mo�e troch� rudy od�wie�y ci pami��?
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_05"); //Napi�bym si� piwka w karczmie. 
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_06"); //Niech b�dzie 100 bry�ek rudy.
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_07"); //Chc� si� dzi� porz�dnie napi�.
};

//========================================
//-----------------> 100OreZaInfo
//========================================

INSTANCE DIA_Cutter_100OreZaInfo (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 3;
   condition    = DIA_Cutter_100OreZaInfo_Condition;
   information  = DIA_Cutter_100OreZaInfo_Info;
   permanent	= FALSE;
   description	= "Dobra, niech b�dzie 100 bry�ek rudy.";
};

FUNC INT DIA_Cutter_100OreZaInfo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_WhereAlex))
    && (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_100OreZaInfo_Info()
{
    AI_Output (other, self ,"DIA_Cutter_100OreZaInfo_15_01"); //Dobra niech b�dzie 100 bry�ek.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_02"); //Dzi�ki. Tw�j kolega jest w lochu. Klucz ma Stra�nik. 
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_03"); //Mo�e ci go odda� z polecenia kt�rego� z Magnat�w.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_04"); //Chyba, �e chcesz to za�atwi� si�owo.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_05"); //Przed czym ci� ostrzegam.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_06"); //Je�li nie chcesz mie� k�opot�w, to wstrzymuj si�.
    B_LogEntry                     (CH3_Kidnapping,"My�liwy jest uwi�ziony w lochu. Klucz ma Stra�nik, kt�rego pobicie nie jest najlepszym pomys�em. Los Alexa jest zale�ny od Magnat�w, wi�c powinienem z nimi porozmawia�.");

    B_GiveXP (200);
};