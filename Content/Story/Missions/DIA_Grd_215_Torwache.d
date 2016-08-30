//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_215_Torwache_Exit (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 999;
	condition	= DIA_Grd_215_Torwache_Exit_Condition;
	information	= DIA_Grd_215_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Grd_215_Torwache_First (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Grd_215_Torwache_First_Condition;
	information		= DIA_Grd_215_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grd_215_Torwache_First_Condition()
{	
	if	(!Npc_KnowsInfo(hero,DIA_Grd_216_First))  //Wenn der SC nicht durchs Hintertor rein ist.
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //A ty dok�d si� wybierasz?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //Do Obozu.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //Chyba nie przyszed�e� tu, �eby sprawia� k�opoty, co?
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Jasne, zamierzam przej�� kontrol� nad ca�ym Obozem!"		,DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Chcia�em si� tylko troch� rozejrze�."		,DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Diego powiedzia�, �e mam si� z nim spotka� w Obozie."	,DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Jasne, zamierzam przej�� kontrol� nad ca�ym Obozem!
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Hej, facet jest ca�kiem zabawny... Nie lubi� zabawnych facet�w.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Chcia�em si� tylko troch� rozejrze�.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //To ci� b�dzie kosztowa� 10 bry�ek rudy.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Niewa�ne."					,DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"10 bry�ek..."	,DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego powiedzia�, �e mam si� z nim spotka� w Obozie.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //W takim razie - w�a�.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Niewa�ne.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //W takim razie - spadaj.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Dobrze, masz tu swoje 10 bry�ek.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Dobra. Zapraszam do �rodka.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Nie mam tyle przy sobie.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //C�. Tym razem zrobi� wyj�tek, bo jeste� tu nowy.
		
	};
		
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						PERM
// **************************************************

INSTANCE DIA_Grd_215_Torwache_PERM (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 1;
	condition	= DIA_Grd_215_Torwache_PERM_Condition;
	information	= DIA_Grd_215_Torwache_PERM_Info;
	permanent	= 1;
	description = "Co� nowego?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Co� nowego?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Nie. Wszystko po staremu.
};
// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> ARTO_BOSS
//========================================

INSTANCE DIA_Torwache_ARTO_BOSS (C_INFO)
{
   npc          = Grd_215_Torwache;
   nr           = 1;
   condition    = DIA_Torwache_ARTO_BOSS_Condition;
   information  = DIA_Torwache_ARTO_BOSS_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Torwache_ARTO_BOSS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Arto_LetsGo))
    && (Ebr_102_Arto.aivar[AIV_PARTYMEMBER] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torwache_ARTO_BOSS_Info()
{
    AI_Output (self, other ,"DIA_Torwache_ARTO_BOSS_03_01"); //Hej, gdzie si� wybieracie?
    AI_Output (other, self ,"DIA_Torwache_ARTO_BOSS_15_02"); //Mam odeskortowa� Arto do obozu przed kopalni�. 
    AI_Output (self, other ,"DIA_Torwache_ARTO_BOSS_03_03"); //Uwa�ajcie na Bandyt�w. Zwiadowcy donie�li nam, �e widzieli du�� grup� tych zbir�w w lesie. 
    AI_Output (self, other ,"DIA_Torwache_ARTO_BOSS_03_04"); //Przypuszczam, �e kto� wyni�s� z Obozu informacj� o twoim zadaniu.
    AI_Output (other, self ,"DIA_Torwache_ARTO_BOSS_15_05"); //Niech zajmie si� tym kto� inny. Jak widzisz, mam teraz wa�niejsze zlecenie. 
    AI_Output (self, other ,"DIA_Torwache_ARTO_BOSS_03_06"); //Jasne, porozmawiam na ten temat z Thorusem. 
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> NORTH_BANDYTA
//========================================
//edit by Nocturn

INSTANCE DIA_Torwache_NORTH_BANDYTA (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Torwache_NORTH_BANDYTA_Condition;
	information		= DIA_Torwache_NORTH_BANDYTA_Info;
	permanent		= 0;
	important		= 1;
};
FUNC INT DIA_Torwache_NORTH_BANDYTA_Condition()
{	
	var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	{
		return 1;
	};
};


FUNC VOID DIA_Torwache_NORTH_BANDYTA_Info()
{
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA_00"); //Hej! Co to za pancerz? Gadaj, sk�d go masz? Chwila, poznaj�! To pancerz Bandyty! Zmiesza�e� si� z band� Quentina?!
	
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Tak, nale�� do bandy Quentina. Masz jaki� problem?"		,DIA_Torwache_NORTH_BANDYTA1);
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Nie, pracuj� sam."		,DIA_Torwache_NORTH_BANDYTA2);
};

func void DIA_Torwache_NORTH_BANDYTA1()
{
	AI_Output (other, self,"DIA_Torwache_NORTH_BANDYTA1_00"); //Tak, nale�� do bandy Quentina. Masz jaki� problem?
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA1_01"); //I masz czelno�� tu przychodzi�? Bra� tego sukinsyna!
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Torwache_NORTH_BANDYTA2()
{
	AI_Output (other, self,"DIA_Torwache_NORTH_BANDYTA2_00"); //Nie, pracuj� sam.
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA2_01"); //Doprawdy? Pracujesz na w�asn� r�k�? To sk�d masz ten pancerz?
	
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Uszy� go dla mnie pewien my�liwy."					,DIA_Torwache_NORTH_BANDYTA2A);
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Zdj��em go z jednego martwego Bandyty. Napad� na mnie w lesie. Musia�em si� broni�. Akurat jego pancerz by� niezniszczony i przypad� mi do gustu."	,DIA_Torwache_NORTH_BANDYTA2B);
};


	func void DIA_Torwache_NORTH_BANDYTA2A()
	{
	AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2A_01"); //Uszy� go dla mnie pewien my�liwy.
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_02"); //I zupe�nie przypadkowo przypomina on str�j tych bandzior�w? Nie roz�mieszaj mnie. 
	AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_03"); //My�l�, �e dzia�asz sam, ale masz dost�p do Obozu Bandyt�w. Dogada�e� si� z jaki� bandyckim rzemie�lnikiem. 
	AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_04"); //Gadaj, gdzie to jest? M�w albo po�a�ujesz.
    AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2A_05"); //Chwila. Je�li mnie zabijesz, nigdy si� tego nie dowiesz!
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_06"); //Jeszcze znajd� na ciebie spos�b!
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};

	func void DIA_Torwache_NORTH_BANDYTA2B()
	{

    AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2B_01"); //Zdj��em go z jednego martwego Bandyty. Napad� na mnie w lesie. Musia�em si� broni�. Akurat jego pancerz by� niezniszczony i przypad� mi do gustu.
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2B_02"); //Tak trzymaj! Trzeba t�pi� t� plag�.
    B_GiveXP (150);
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA);
    AI_StopProcessInfos	(self);
	};