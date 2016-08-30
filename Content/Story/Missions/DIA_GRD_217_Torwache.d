//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_217_Exit (C_INFO)
{
	npc			= Grd_217_Torwache;
	nr			= 999;
	condition	= DIA_Grd_217_Exit_Condition;
	information	= DIA_Grd_217_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_217_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_217_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Hallo
// **************************************************

INSTANCE DIA_Grd_217_First (C_INFO)
{
	npc				= Grd_217_Torwache;
	nr				= 1;
	condition		= DIA_Grd_217_First_Condition;
	information		= DIA_Grd_217_First_Info;
	permanent		= 1;
	description		= "Cze��!";
};

FUNC INT DIA_Grd_217_First_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grd_217_First_Info()
{
	AI_Output (other, self,"DIA_Grd_217_First_15_00"); //Cze��!
	AI_Output (self, other,"DIA_Grd_217_First_06_01"); //Rusz swoje cztery litery! Wchod� albo wychod� - mam to gdzie�. Tylko zejd� mi wreszcie z oczu!
	AI_StopProcessInfos	( self );
};
// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> SOUTH_BANDYCI
//========================================


INSTANCE DIA_Torwache_SOUTH_BANDYCI (C_INFO)
{
   npc          = Grd_217_Torwache;
   nr           = 1;
   condition    = DIA_Torwache_SOUTH_BANDYCI_Condition;
   information  = DIA_Torwache_SOUTH_BANDYCI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torwache_SOUTH_BANDYCI_Condition()
{
	var C_ITEM	armor_bandyty;			armor_bandyty 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty;	armorInstance_bandyty	= Hlp_GetInstanceID		(armor_bandyty);
	if (armorInstance_bandyty == BAU_ARMOR_L) || (armorInstance_bandyty == BAU_ARMOR_M) || (armorInstance_bandyty == BAU_ARMOR_H)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Torwache_SOUTH_BANDYCI_Info()
{
    AI_Output (self, other ,"DIA_Torwache_SOUTH_BANDYCI_03_01"); //Ej ty, co to za pancerz? Widzia�em ju� go u kogo�. A tak, walczyli�my kiedy� w lesie z lud�mi w takich zbrojach. Czego tu szukasz?
    AI_Output (other, self ,"DIA_Torwache_SOUTH_BANDYCI_15_02"); //Spokojnie, przyszed�em w pokojowych zamiarach.
    AI_Output (self, other ,"DIA_Torwache_SOUTH_BANDYCI_03_03"); //No nie wiem, czy ci� wpu�ci�, nie chcia�bym �adnych problem�w z Thorusem. Jednak zaryzykowa�bym za kilka bry�ek w ramach rekompensaty.
};

//========================================
//-----------------> SOUTH_BANDYCI1
//========================================

INSTANCE DIA_Torwache_SOUTH_BANDYCI1 (C_INFO)
{
   npc          = Grd_217_Torwache;
   nr           = 2;
   condition    = DIA_Torwache_SOUTH_BANDYCI1_Condition;
   information  = DIA_Torwache_SOUTH_BANDYCI1_Info;
   permanent	= FALSE;
   description	= "W porz�dku, oto 10 bry�ek rudy.";
};

FUNC INT DIA_Torwache_SOUTH_BANDYCI1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torwache_SOUTH_BANDYCI))
    && (Npc_HasItems (hero, ItMiNugget)>=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torwache_SOUTH_BANDYCI1_Info()
{
    AI_Output (other, self ,"DIA_Torwache_SOUTH_BANDYCI1_15_01"); //W porz�dku, oto 10 bry�ek rudy.
    AI_Output (self, other ,"DIA_Torwache_SOUTH_BANDYCI1_03_02"); //Wypije sobie za to piwo w karczmie. Przechod� �mia�o. 
};

//========================================
//-----------------> WARN
//========================================

INSTANCE DIA_Torwache_WARN (C_INFO)
{
   npc          = Grd_217_Torwache;
   nr           = 1;
   condition    = DIA_Torwache_WARN_Condition;
   information  = DIA_Torwache_WARN_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Torwache_WARN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torwache_SOUTH_BANDYCI))
    && (!Npc_KnowsInfo (hero, DIA_Torwache_SOUTH_BANDYCI1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torwache_WARN_Info()
{
    AI_Output (self, other ,"DIA_Torwache_WARN_03_01"); //Hej! M�wi�em ci ju�, �e dop�ki nie zap�acisz, to nie wejdziesz!
    AI_Output (self, other ,"DIA_Torwache_WARN_03_02"); //Nie pr�buj mnie oszuka�!
	AI_GotoWP (hero, "OC2"); 
};

