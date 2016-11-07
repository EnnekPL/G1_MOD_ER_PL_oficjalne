//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Ricelord_EXIT (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 999;
	condition	= DIA_Ricelord_EXIT_Condition;
	information	= DIA_Ricelord_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Ricelord_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Ricelord_Hello (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_Hello_Condition;
	information	= DIA_Ricelord_Hello_Info;
	permanent	= 0;
	description	= "Troszczysz siê o pola ry¿owe, czy¿ nie?";
};                       

FUNC INT DIA_Ricelord_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Ricelord_Hello_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_Hello_15_00"); //Troszczysz siê o pola ry¿owe, czy¿ nie?
	AI_Output (self, other,"DIA_Ricelord_Hello_12_01"); //Czemu pytasz? Szukasz pracy?
};

// ************************************************************
// 						Arbeit
// ************************************************************

INSTANCE DIA_Ricelord_Arbeit (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_Arbeit_Condition;
	information	= DIA_Ricelord_Arbeit_Info;
	permanent	= 0;
	description	= "A masz dla mnie jakieœ zajêcie?";
};                       

FUNC INT DIA_Ricelord_Arbeit_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Ricelord_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Lefty_First)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakieœ zajêcie?
	AI_Output (self, other,"DIA_Ricelord_Arbeit_12_01"); //Porozmawiaj z Lewusem. Krêci siê zwykle na prawo od szopy.
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_Ricelord_TRADE (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 800;
	condition	= DIA_Ricelord_TRADE_Condition;
	information	= DIA_Ricelord_TRADE_Info;
	permanent	= 1;
	description	= "Mo¿e siê dogadamy...";
	trade 		= 1;
};                       

FUNC INT DIA_Ricelord_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ricelord_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_TRADE_15_00"); //Mo¿e siê dogadamy...
	AI_Output (self, other,"DIA_Ricelord_TRADE_12_01"); //A co mo¿esz mi zaoferowaæ?
	var int wpis_handel_ricelord;
	if wpis_handel_ricelord == false
	{
	wpis_handel_ricelord = true;
	Log_CreateTopic   	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry			(GE_TraderNC,	"Jak siê okazuje z Ry¿owym Ksiêciem mo¿na handlowaæ. Sprzedaje czêœæ towarów z magazynu. ");
	};
};
	
// ************************************************************
// 						Lefty Mission
// ************************************************************
INSTANCE DIA_Ricelord_LeftySentMe (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_LeftySentMe_Condition;
	information	= DIA_Ricelord_LeftySentMe_Info;
	permanent	= 0;
	description	= "Przysy³a mnie Lewus.";
};                       

FUNC INT DIA_Ricelord_LeftySentMe_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Ricelord_Hello)
	&&	(Lefty_Mission == LOG_RUNNING)
	&&	(Ricelord_AskedForWater == FALSE)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_LeftySentMe_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_LeftySentMe_15_00"); //Przysy³a mnie Lewus.
	AI_Output (self, other,"DIA_Ricelord_LeftySentMe_12_01"); //Tak? I co powiedzia³?
	Ricelord_AskedForWater = TRUE;
};

// ************************************************************
// 						Lefty Mission
// ************************************************************

INSTANCE DIA_Ricelord_GetWater (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_GetWater_Condition;
	information	= DIA_Ricelord_GetWater_Info;
	permanent	= 1;
	description	= "Mam zanieœæ wodê zbieraczom ry¿u!";
};                       

FUNC INT DIA_Ricelord_GetWater_Condition()
{
	if (Ricelord_AskedForWater == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_GetWater_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_GetWater_15_00"); //Mam zanieœæ wodê zbieraczom ry¿u!
	
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_01"); //Dobra. Masz tu tuzin butelek.
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_02"); //To jakieœ dwa razy wiêcej ni¿ liczba zbieraczy, wiêc postaraj siê rozdzieliæ je sprawiedliwie.

		CreateInvItems		(self, ItFo_Potion_Water_01, 12);
		B_GiveInvItems		(self, other, ItFo_Potion_Water_01, 12);

		Ricelord_AskedForWater = FALSE;
		B_LogEntry			(CH1_CarryWater,	"Ry¿owy Ksi¹¿e da³ mi tuzin butelek z wod¹.");

		AI_StopProcessInfos	(self);
	}
	else if (Lefty_WorkDay == Wld_GetDay()-1)
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_00"); //To by³o wczoraj, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_01"); //To by³o parê dni temu, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
		AI_StopProcessInfos	(self);
	};
};

//========================================
//-----------------> RYZ
//========================================

INSTANCE DIA_Ricelord_RYZ (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_RYZ_Condition;
   information  = DIA_Ricelord_RYZ_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o polach ry¿owych?";
};

FUNC INT DIA_Ricelord_RYZ_Condition()
{
    if (wiecejRice == true)
    && (Npc_KnowsInfo (hero, DIA_Aidan_SZPIEGOWANIE))
    && (MIS_TestOC == LOG_RUNNING)    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_RYZ_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_01"); //Co mo¿esz mi powiedzieæ o polach ry¿owych?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_02"); //Ja jestem tu szefem. Zarz¹dzam ca³¹ prac¹.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_03"); //Pomaga mi Lewus.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_04"); //I jak zbiory?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_05"); //Du¿e. Ostatnio idzie coraz lepiej.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_06"); //To z pewnoœci¹ twoja zas³uga... 
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_07"); //Tak, masz racjê.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_08"); //Co robicie z nadwy¿k¹ ry¿u?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_09"); //Zatrzymujemy w magazynach. Niewielk¹ czêœæ sprzedajemy do innych obozów.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_10"); //G³ównie do Bractwa. Ale s¹ to naprawdê ma³e iloœci.
    knowsRice = true;
    B_LogEntry                     (CH1_TestOc,"Sporo siê dowiedzia³em od Ry¿owego Ksiêcia. Nadwy¿ka ry¿u jest sprzedawana do Bractwa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ALCO_BUNT
//========================================

INSTANCE DIA_Ricelord_ALCO_BUNT (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_ALCO_BUNT_Condition;
   information  = DIA_Ricelord_ALCO_BUNT_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Homer, mam dla ciebie ry¿ówkê od Jeremiasza.";
};

FUNC INT DIA_Ricelord_ALCO_BUNT_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_ALCO_BUNT_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_01"); //Przysy³a mnie Homer, mam dla ciebie ry¿ówkê od Jeremiasza.
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_02"); //¯e co? Ten leñ nie móg³ siê sam ruszyæ i teraz wysy³a ch³opca na posy³ki?
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_03"); //Dobra, daj mi trzy butelki. Resztê zanieœ Lewusowi i ch³opakom.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_04"); //Nie ma sprawy.
		B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
		b_givexp (50);
		DIA_Ricelord_ALCO_BUNT.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_05"); //Próbujesz mnie oszukaæ?! 
        AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_06"); //Nie masz tu trzech butelek!
        DIA_Ricelord_ALCO_BUNT.permanent = true;
    };
    AI_StopProcessInfos	(self);
    
};

////////////////////////////////////////////
//	Ring Theft
////////////////////////////////////////////

INSTANCE DIA_Ricelord_RingTheft (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_RingTheft_Condition;
   information  = DIA_Ricelord_RingTheft_Info;
   permanent	= FALSE;
   description	= "Lewus podarowa³ twój pierœcieñ Pock'owi.";
};

FUNC INT DIA_Ricelord_RingTheft_Condition()
{
    if (Quest_StealRing == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_RingTheft_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_RingTheft_15_01"); //Lewus podarowa³ twój pierœcieñ Pock'owi. To mia³ byæ dowód wdziêcznoœci za pomoc.
    AI_Output (self, other ,"DIA_Ricelord_RingTheft_03_02"); //Co? Ten sukinsyn ju¿ od dawna sadzi³ siê na mój pierœcieñ. Nie widzia³em, ¿e bêdzie na tyle bezczelny!
    AI_Output (self, other ,"DIA_Ricelord_RingTheft_03_03"); //LEWUS, ZDRAJCA! BRAÆ GO!
    
	Bau_900_Ricelord.flags = 2;

    AI_StopProcessInfos	(Bau_900_Ricelord);
	AI_GotoNpc(Bau_900_Ricelord, Org_844_Lefty);
	
	Npc_SetTarget (Bau_900_Ricelord, Org_844_Lefty);
    AI_StartState (Org_844_Lefty, ZS_ATTACK, 1, "");
	
	B_ChangeGuild (Org_844_Lefty, GIL_DMB);
};

////////////////////////////////////////////
//	Peace
////////////////////////////////////////////

INSTANCE DIA_Ricelord_Peace (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_Peace_Condition;
   information  = DIA_Ricelord_Peace_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Ricelord_Peace_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ricelord_RingTheft)) && (Npc_IsDead(Org_844_Lefty))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_Peace_Info()
{
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_02"); //Tfu, ten pod³y sukinsyn gryzie piach.
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_03"); //Skoñczcie ju¿ tê dziecinadê. Przystanê na wszystkie warunki. Dostaniecie lepsze ¿arcie i wiêcej spania.
	AI_Output (self, other ,"DIA_Ricelord_Peace_03_04"); //Tylko niech ci imbecyle wróc¹ do pracy.
    AI_Output (other, self ,"DIA_Ricelord_Peace_15_01"); //W porz¹dku. To ju¿ koniec.
	
	self.flags = 2;
	
    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (self, "start");
	
	B_LogEntry                     (CH1_BuntZbieraczy,"To ju¿ koniec rebelii Zbieraczy. Lewus nie ¿yje, a Ry¿owy Ksi¹¿ê przysta³ na warunki buntowników. Najwy¿szy czas pogadaæ z Rufusem.");
};
