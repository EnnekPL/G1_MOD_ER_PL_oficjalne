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
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_01"); //Masz sporo odwagi, ¿eby siê tu pokazywaæ.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_02"); //Ca³y Obóz chce ciê dorwaæ. 
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_03"); //Pos³uchaj, to nie tak jak myœlisz...
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_04"); //Wszyscy w kó³ko powtarzaj¹ twoj¹ wymówkê, znam ju¿ j¹. Nie musisz mi powtarzaæ.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_05"); //Niektórzy w ni¹ wierz¹. Có¿, ja potrafiê wyczuæ k³amstwo z odleg³oœci mili. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_06"); //Nie nabierzesz mnie, ch³opcze.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_07"); //Czego wiêc chcesz?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_08"); //Przypuszczam, ¿e masz ju¿ doœæ tych przeœladowañ. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_09"); //Mogê byæ twoim najgorszym koszmarem, ale mogê tak¿e daæ ci spokój.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_10"); //Ile to mnie bêdzie kosztowaæ?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_11"); //400 bry³ek rudy. Przyznasz, ¿e to niewiele, jak na cenê spokoju. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_12"); //Pamiêtaj, ¿e to co ja mogê ci zrobiæ, bêdzie piek³em.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_13"); //To jak? Dogadamy siê?

    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Masz tê rudê i daj mi spokój.", DIA_Cutter_DISS_BANDIT_GIVE_ORE);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Nie mam tyle rudy. ", DIA_Cutter_DISS_BANDIT_NIE_MAM);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Zapomnij. Nie uda ci siê mnie zastraszyæ!", DIA_Cutter_DISS_BANDIT_ZAPOMNIJ);
};

FUNC VOID DIA_Cutter_DISS_BANDIT_GIVE_ORE()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_15_01"); //Masz tê rudê i daj mi spokój.
    if (Npc_HasItems (hero, ItMiNugget)>=400)
    {
        B_GiveInvItems (other, self, ItMiNugget, 400);
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_02"); //Œwietnie. Ju¿ nigdy o mnie nie us³yszysz. 
        Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
        AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_03"); //Masz jeszcze czelnoœæ mnie oszukiwaæ?! 
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_04"); //Zmów ostatni¹ modlitwê do Innosa. 
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
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_NIE_MAM_03_02"); //A wiêc nie masz te¿ ¿ycia w tym Obozie!
	GRD_208_Cutter.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Cutter_DISS_BANDIT_ZAPOMNIJ()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_15_01"); //Zapomnij. Nie uda ci siê mnie zastraszyæ!
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_03_02"); //Zobaczymy! Zmów ostatni¹ modlitwê do Innosa!
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
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_03_01"); //Nie masz ¿ycia w tym Obozie! 
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
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_01"); //To niemo¿liwe. Jestem jednym z najlepszych wojowników w ca³ym Starym Obozie. 
    AI_Output (other, self ,"DIA_Cutter_AFTER_FIGHT_WIN_15_02"); //Treningi u Bandytów potrafi¹ zdzia³aæ cuda.
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_03"); //OdejdŸ st¹d! Nie chcê ciê tu widzieæ!
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
	description = "Wasz zamek jest bardzo du¿y.";
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
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Wasz zamek jest bardzo du¿y.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba ciê jeszcze tutaj nie widzia³em. Kim jesteœ?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jestem tu nowy. Chcia³em siê trochê rozejrzeæ.
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
	description = "Mo¿esz mi opowiedzieæ o tym zamku?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo¿esz mi opowiedzieæ o tym zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu du¿o mówiæ: Gomez i jego ludzie zajêli go po wielkim buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz¹tku wiedzia³em, ¿e warto bêdzie stan¹æ po jego stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wiêŸniowie zamkniêci w lochach lub zmuszani do pracy w kopalni, uznawa³o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj¹ siê pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz œwiec¹ pustk¹. Nikt tam nie schodzi³ od czasu wielkiego buntu.
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
	description = "Jak wygl¹da ¿ycie Stra¿nika?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl¹da ¿ycie Stra¿nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jesteœmy najwiêkszym i najsilniejszym Obozem w Kolonii. Nikt nie œmie nas zaczepiaæ.
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
    AI_Output (other, self ,"DIA_Cutter_SzukaszBulita_15_02"); //Mo¿liwe.
    AI_Output (self, other ,"DIA_Cutter_SzukaszBulita_03_03"); //Poszed³ w³aœnie na plac wymian. Podobno zrzucili kogoœ nowego.
    B_LogEntry                     (CH2_BullitBadass,"Bullit poszed³ na plac wymian. Teraz mam szansê zdobyæ jakiœ dowód na niego.");
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dokona³eœ w³aœciwego wyboru. Spodoba ci siê bycie Stra¿nikiem!
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
   description	= "Podobno porwaliœcie myœliwego.";
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
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_01"); //Podobno porwaliœcie myœliwego.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_02"); //Mo¿liwe.
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_03"); //Dlaczego to zrobiliœcie?
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_04"); //O to musisz ju¿ spytaæ Kruka.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_05"); //To on zleci³ nam to zadanie.
    B_LogEntry                     (CH3_Kidnapping,"Za porwaniem Alexa stoi Kruk. Muszê z nim porozmawiaæ.");

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
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_02"); //Nie wiem. D³ugo rozmawiali z Krukiem. 
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_03"); //Nie wiem, co z nim zrobi³. 
    AI_Output (other, self ,"DIA_Cutter_WhereAlex_15_04"); //Mo¿e trochê rudy odœwie¿y ci pamiêæ?
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_05"); //Napi³bym siê piwka w karczmie. 
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_06"); //Niech bêdzie 100 bry³ek rudy.
    AI_Output (self, other ,"DIA_Cutter_WhereAlex_03_07"); //Chcê siê dziœ porz¹dnie napiæ.
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
   description	= "Dobra, niech bêdzie 100 bry³ek rudy.";
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
    AI_Output (other, self ,"DIA_Cutter_100OreZaInfo_15_01"); //Dobra niech bêdzie 100 bry³ek.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_02"); //Dziêki. Twój kolega jest w lochu. Klucz ma Stra¿nik. 
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_03"); //Mo¿e ci go oddaæ z polecenia któregoœ z Magnatów.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_04"); //Chyba, ¿e chcesz to za³atwiæ si³owo.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_05"); //Przed czym ciê ostrzegam.
    AI_Output (self, other ,"DIA_Cutter_100OreZaInfo_03_06"); //Jeœli nie chcesz mieæ k³opotów, to wstrzymuj siê.
    B_LogEntry                     (CH3_Kidnapping,"Myœliwy jest uwiêziony w lochu. Klucz ma Stra¿nik, którego pobicie nie jest najlepszym pomys³em. Los Alexa jest zale¿ny od Magnatów, wiêc powinienem z nimi porozmawiaæ.");

    B_GiveXP (200);
};