// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tr�nke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysy�a mnie Saturas.";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Przysy�a mnie Saturas.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ach, chod� bli�ej. Ju� mi o wszystkim doniesiono.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Prosz�, we� to. Znajdziesz tu najr�niejsze wywary.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Teraz mo�esz ju� rusza� na poszukiwanie kamieni ogniskuj�cych. Jeste� nasz� jedyn� nadziej�.

	CreateInvItems (self, ItFo_Potion_Health_01,	20); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	20); //Notwendig f�r die Ausschrift "20 Items �bergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	15);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	//balans
	//CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	//CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas powiedzia�, �e masz dla mnie nagrod�.";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas powiedzia�, �e masz dla mnie nagrod�.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ach, chod�, chod�!
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Nasz przyw�dca opowiedzia� mi o twoich bohaterskich czynach.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Ca�y nasz Ob�z... Ach, co ja m�wi� - ca�a KOLONIA powinna ci by� dozgonnie wdzi�czna.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Przyjmij t� skromn� nagrod� w uznaniu twoich zas�ug.

	CreateInvItems		(self, ItFo_Potion_Health_02,		20);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 20);//Notwenidg f�r Ausschrift "20 Items �bergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		15);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			5);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,	"Riordian by� jak zwykle uprzejmy. Otrzyma�em od niego zapas magicznych wywar�w. To niezwykle cenny i przydatny dar.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Ciesz� si�, �e ju� jeste�. Czeka�em na ciebie!
};
/*
//========================================
//-----------------> Geshenke
//========================================

INSTANCE DIA_Riordian_Geshenke (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 1;
   condition    = DIA_Riordian_Geshenke_Condition;
   information  = DIA_Riordian_Geshenke_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Riordian_Geshenke_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_KillCzarnyDebil))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Geshenke_Info()
{
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_01"); //Podobno pozby�e� si� Czarnego Maga.
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_02"); //Twoja odwaga i si�a budz� we mnie podziw.
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_03"); //We� te eliksiry. Z pewno�ci� pomog� ci wyleczy� rany.
    AI_Output (other, self ,"DIA_Riordian_Geshenke_15_04"); //Dzi�ki.
    CreateInvItems (self, ItFo_Potion_Mana_03, 10);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_03, 10);
    CreateInvItems (self, ItFo_Potion_Health_03, 10);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 10);
    CreateInvItems (self, ItFo_Potion_Haste_01, 15);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_01, 15);
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
    AI_StopProcessInfos	(self);
};

*/
//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czeka�e�? Jak to?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Czeka�e�? Jak to?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn prosi� mnie, �ebym ci� do niego przys�a�, gdy tylko si� zjawisz.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //O co chodzi?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Ma plan, jak odzyska� zaj�t� kopalni�.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Czy wci�� pilnuje wej�cia do kopalni?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Tak! Prosz�, zajrzyj do niego mo�liwie jak najszybciej!
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Ciesz� si�, �e do nas do��czy�e�.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Je�li jeste� ranny, mog� ci pom�c.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo�esz co� na to poradzi�?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo�esz co� na to poradzi�?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s�owy przywo�uj� uzdrawiaj�c� si��! Niech twe cia�o i duch zn�w zaznaj� spokoju!
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Witaj, magu!
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgaduj�, �e szukasz magicznego napoju?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, jeden z Mag�w Wody, sprzedaje magiczne wywary. Znajd� go w laboratorium alchemicznym, na g�rnym poziomie.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka� mi co masz do zaoferowania."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Poka� mi co masz do zaoferowania.
	
};  
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_riordian_KnowsAlchemy2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_riordian_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_riordian_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_riordian_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_riordian_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_L2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_riordian_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury, b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To z czym b�dziesz mia� do czynienia to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_riordian_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_riordian_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

/*
//========================================
//-----------------> LekPotrzebny
//========================================

INSTANCE DIA_Riordian_LekPotrzebny (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 1;
   condition    = DIA_Riordian_LekPotrzebny_Condition;
   information  = DIA_Riordian_LekPotrzebny_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� leku na zatrucia!";
};

FUNC INT DIA_Riordian_LekPotrzebny_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_DajMiLek))
    && (MIS_lekiDlaAva == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_LekPotrzebny_Info()
{
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_01"); //Potrzebuj� leku na zatrucia!
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_02"); //I to pilnie!
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_03"); //Niedobrze. Nie mam sk�adnik�w.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_04"); //Ostatni eliksir da�em Najemnikowi pogryzionemu przez w�a.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_05"); //Teraz nie mam ju� tej mikstury.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_06"); //Zale�y ci na czasie?
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_07"); //Tak, i to bardzo.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_08"); //Je�eli chcesz mo�esz mi przynie�� sk�adniki, a ja przyrz�dz� ci ten wywar.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_09"); //Mog� te� da� ci przepis i p�jdziesz z nim do innego alchemika.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_10"); //Jak chcesz?
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_11"); //Mi potrzebne s�: z�bate ziele, 3 du�e ro�liny lecznicze, serafis i nasiona czerwonego buka.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_12"); //Cholera, sporo tego.
    B_LogEntry                     (CH1_lekiDlaAva,"Riordian nie ma odpowiednich sk�adnik�w, �eby uwarzy� mikstur�. Musz� mu je przynie�� lub wzi�� mikstur� i poszuka� innego alchemika.");

    B_GiveXP (100);
};

//========================================
//-----------------> Skaldniki
//========================================

INSTANCE DIA_Riordian_Skaldniki (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 2;
   condition    = DIA_Riordian_Skaldniki_Condition;
   information  = DIA_Riordian_Skaldniki_Info;
   permanent	= FALSE;
   description	= "Mam ska�dniki.";
};

FUNC INT DIA_Riordian_Skaldniki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_LekPotrzebny))
    && (Npc_HasItems (other, ItFo_Plants_Herb_03) >=3)
    && (Npc_HasItems (other, ItFo_Plants_Seraphis_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_Bloodwood_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_Speed01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Skaldniki_Info()
{
    AI_Output (other, self ,"DIA_Riordian_Skaldniki_15_01"); //Mam ska�dniki.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_02"); //Wida�, �e Adanos jest z tob�.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_03"); //Daj mi je.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_04"); //Podejd� tu za chwil�.
    B_LogEntry                     (CH1_lekiDlaAva,"Przynios�em Riordianowi sk�adniki. Za chwilie uwarzy mi mikstur�.");

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Mixtura
//========================================

INSTANCE DIA_Riordian_Mixtura (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 3;
   condition    = DIA_Riordian_Mixtura_Condition;
   information  = DIA_Riordian_Mixtura_Info;
   permanent	= FALSE;
   description	= "Mikstura gotowa?";
};

FUNC INT DIA_Riordian_Mixtura_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_Skaldniki))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Mixtura_Info()
{
    AI_Output (other, self ,"DIA_Riordian_Mixtura_15_01"); //Mikstura gotowa?
    AI_Output (self, other ,"DIA_Riordian_Mixtura_03_02"); //Tak. Prosz�.
    CreateInvItems (self, LekAva, 1);
    B_GiveInvItems (self, other, LekAva, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveRezepte
//========================================

INSTANCE DIA_Riordian_GiveRezepte (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_Riordian_GiveRezepte_Condition;
   information  = DIA_Riordian_GiveRezepte_Info;
   permanent	= FALSE;
   description	= "Daj mi t� receptur�.";
};

FUNC INT DIA_Riordian_GiveRezepte_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_LekPotrzebny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_GiveRezepte_Info()
{
    AI_Output (other, self ,"DIA_Riordian_GiveRezepte_15_01"); //Daj mi t� receptur�.
    AI_Output (self, other ,"DIA_Riordian_GiveRezepte_03_02"); //Oto ona.
    CreateInvItems (self, Receptura_LekAva, 1);
    B_GiveInvItems (self, other, Receptura_LekAva, 1);
    B_LogEntry                     (CH1_lekiDlaAva,"Podj��em si� odnalezienia innego alchemika.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

*/
