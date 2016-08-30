//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  Tpl_1433_GorNaVid_Exit (C_INFO)
{
	npc			= Tpl_1433_GorNaVid;
	nr			= 999;
	condition	= Tpl_1433_GorNaVid_Exit_Condition;
	information	= Tpl_1433_GorNaVid_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Niech nadejdzie przebudzenie �ni�cego.
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_HEALTH (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebuj� twojej pomocy."; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Potrzebuj� twojej pomocy.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Szukam wydzieliny pe�zaczy dla Kaloma, i chyba wiem ju�, gdzie znajduje si� gniazdo tych drapie�c�w.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Pomo�esz mi po otwarciu przej�cia?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Walka z pe�zaczami to niebezpieczne zadanie. Przynie� mi nap�j uzdrawiaj�cy, wtedy ci pomog�.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam gniazda pe�zaczy."; 
};

FUNC int  Tpl_1433_GorNaVid_IAN_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING
	&&	!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

FUNC void  Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Szukam gniazda pe�zaczy.
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //W pobli�u g��wnego szybu znajduje si� wiele jaski�, ale nie uda�o si� nam jeszcze odnale�� gniazda.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj nap�j uzdrawiaj�cy)"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1433_GorNaVid_HEALTH )) &&
		(Npc_HasItems (hero, Itfo_Potion_Health_01)  || 
		 Npc_HasItems (hero, Itfo_Potion_Health_02)  ||
		 Npc_HasItems (hero, Itfo_Potion_Health_03))	
	{
		return 1;
	};

};
FUNC void  Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Prosz�, mo�e to ci pomo�e.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Dzi�ki. Mo�esz na mnie liczy�. Spotkamy si� na dole, u Asghana.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //B�d� czeka�.
	
	if Npc_HasItems (hero,Itfo_Potion_Health_01)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_01, 1);
	}
	else if Npc_HasItems (hero,Itfo_Potion_Health_02)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_02, 1);
	}	 
	else if Npc_HasItems (hero,Itfo_Potion_Health_03)
	{
	 	B_GiveInvItems (hero, self,Itfo_Potion_Health_03, 1);
	}
	else 
	{
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNM�GLICH");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,	"Musia�em da� Gor Na Vidowi nap�j uzdrawiaj�cy, zanim zgodzi� si� do��czy� do oddzia�u przy bramie Asghana.");	

	AI_StopProcessInfos	(self);
};

//---------EIER GEFUNDEN------------------------------------------------------
instance  Tpl_1433_GorNavid_VICTORY (C_INFO)
{
	npc				= Tpl_1433_GorNavid;
	condition		= Tpl_1433_GorNavid_VICTORY_Condition;
	information		= Tpl_1433_GorNavid_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em gniazdo kr�lowej!"; 
};

FUNC int  Tpl_1433_GorNavid_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Znalaz�em gniazdo kr�lowej!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Dzi�kuj� ci w imieniu ca�ego Bractwa!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Oby �ni�cy nigdy nie odwr�ci� od ciebie swego przychylnego spojrzenia.
};     
 
//========================================
//-----------------> SZPIEG
//========================================
//edit by Nocturn

INSTANCE DIA_GorNaVid_SZPIEG (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 1;
   condition    = DIA_GorNaVid_SZPIEG_Condition;
   information  = DIA_GorNaVid_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Co wiesz o waszej wsp�pracy ze Stra�nikami?";
};

FUNC INT DIA_GorNaVid_SZPIEG_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaVid_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_SZPIEG_15_01"); //Co wiesz o waszej wsp�pracy ze Stra�nikami?
    AI_Output (self, other ,"DIA_GorNaVid_SZPIEG_03_02"); //Niezbyt wiele. Porozmawiaj z Gor Na Barem. On wie wi�cej. Przyszed� do kopalni niedawno.
    B_LogEntry                     (CH1_PSIcampWORK,"Gor Na Bar mo�e udzieli� mi przydatnych informacji.");

    B_GiveXP (50);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaVid_HELLO1 (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 1;
   condition    = DIA_GorNaVid_HELLO1_Condition;
   information  = DIA_GorNaVid_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_GorNaVid_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaVid_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_HELLO1_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_02"); //Witaj, co ci� tu sprowadza? 
    AI_Output (other, self ,"DIA_GorNaVid_HELLO1_15_03"); //Mam kilka spraw do za�atwienia w Kopalni. A ty, czym si� zajmujesz?
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_04"); //Wszyscy Stra�nicy �wi�tynni przebywaj�cy w Kopalni poluj� na pe�zacze.
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_05"); //To niebezpieczne zadanie. Pe�zacze s� bardzo gro�ne. Stra�nicy Gomeza nie poradzili by sobie bez naszej pomocy.
	AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_06"); //Wydzielina pe�zaczy jest potrzebna Cor Kalomowi do bada�. 
};

//========================================
//-----------------> Mine
//========================================

INSTANCE DIA_GorNaVid_Mine (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 2;
   condition    = DIA_GorNaVid_Mine_Condition;
   information  = DIA_GorNaVid_Mine_Info;
   permanent	= FALSE;
   description	= "Co wiesz o dnie Kopalni?";
};

FUNC INT DIA_GorNaVid_Mine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaVid_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaVid_Mine_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_Mine_15_01"); //Co wiesz o dnie Kopalni?
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_02"); //Znajduje si� tu kilka istotnych dla ca�ego wydobycia rzeczy. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_03"); //Najwa�niejsz� z nich jest piec hutniczy i rozdrabniacz. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_04"); //Widzisz tego orkowego niewolnika? Stra�nicy nie�le go poskromili. Jest spokojny jak baranek. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_05"); //Nieopodal jest tak�e magazyn, kt�rego strze�e Draco. Nie wiem, co si� tam znajduje. To nie moja sprawa.
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_06"); //Za magazynem jest kolejny rozdrabniacz. Dalej nie ma nic ciekawego. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_07"); //Szyb jest zamkni�ty, a przej�cia strze�e Ashgan. Roi si� tam od pe�zaczy. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_08"); //Zreszt� okoliczne tunele te� wcale nie s� bezpieczne. Pe�no tu nie tylko pe�zaczy, ale te� trolli ziemnych. 
};

