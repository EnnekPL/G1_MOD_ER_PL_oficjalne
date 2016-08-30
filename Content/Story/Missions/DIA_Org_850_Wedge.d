//========================================
//-----------------> LookingForWedge
//========================================
INSTANCE DIA_Organisator_LookingForWedge (C_INFO)
{
   npc          = ORG_811_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_LookingForWedge_Condition;
   information  = DIA_Organisator_LookingForWedge_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_LookingForWedge_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shrike_FINGERS)) && (MIS_HandDed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_LookingForWedge_Info()
{
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_01"); //Pewnie szukasz Klina.
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_15_02"); //Jacy wy wszyscy jeste�cie domy�lni.
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_03"); //No �azisz ci�gle wok� jego chaty to chyba widz�, �e jest co� na rzeczy. 
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_04"); //Poszed� razem z takim jasnow�osym go�ciem przed Ob�z. Powiedzieli, �e musz� pogada� na osobno�ci. 
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_15_05"); //Dzi�ki za pomoc.
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_06"); //Ej, czekaj. Daj na na butelk� ry��wki. Przecie� ci pomog�em.

    Info_ClearChoices		(DIA_Organisator_LookingForWedge);
    Info_AddChoice		(DIA_Organisator_LookingForWedge, "Ca�uj mnie w dup�. ", DIA_Organisator_LookingForWedge_KissMyAss);
    Info_AddChoice		(DIA_Organisator_LookingForWedge, "W sumie racja. (Daj 5 bry�ek rudy)", DIA_Organisator_LookingForWedge_Ok);
	
	B_LogEntry                     (CH1_HandDed,"Od pewnego Szkodnika dowiedzia�em si�, �e R�czka wraz z Klinem wyszli przed Ob�z, �eby o czym� pogada�.");
	
};

FUNC VOID DIA_Organisator_LookingForWedge_KissMyAss()
{
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_KissMyAss_15_01"); //Ca�uj mnie w dup�. 
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_KissMyAss_03_02"); //Z przyjemno�ci�. 
    Info_ClearChoices		(DIA_Organisator_LookingForWedge);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Organisator_LookingForWedge_Ok()
{
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_Ok_15_01"); //W sumie racja.
    if (Npc_HasItems (hero, ItMiNugget)>=5)
    {
        AI_Output (self, other ,"DIA_Organisator_LookingForWedge_Ok_03_02"); //Dzi�ki.
        B_GiveInvItems (other, self, ItMiNugget, 5);
    }
    else
    {
        AI_Output (other, self ,"DIA_Organisator_LookingForWedge_Ok_15_03"); //Niestety nic ju� nie mam.
        AI_Output (self, other ,"DIA_Organisator_LookingForWedge_Ok_03_04"); //No trudno. 
    };
    Info_ClearChoices		(DIA_Organisator_LookingForWedge);
    AI_StopProcessInfos	(self);
};
// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Ciiii... Hej, ty!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Co? Ja?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... Chod� no tutaj!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czego ode mnie chcesz?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jeste� tu nowy, co? Od razu zauwa�y�em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz si� jeszcze wiele nauczy�. M�g�bym ci pokaza�, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa�a� z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze� si� go!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co z nim jest nie tak?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //A co z nim jest nie tak?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby�ych. Na twoim miejscu unika�bym go jak ognia.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo�esz mnie nauczy�?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC, "Szkodnik o przezwisku Klin mo�e mnie nauczy� skradania si�, otwierania zamk�w i kradzie�y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale�y... A co chcesz wiedzie�?
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};
//========================================
//-----------------> KluczBaala
//========================================

INSTANCE DIA_Wedge_KluczBaala (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_KluczBaala_Condition;
   information  = DIA_Wedge_KluczBaala_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o kluczu Baal Kagana?";
};

FUNC INT DIA_Wedge_KluczBaala_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_nfosKey))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KluczBaala_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KluczBaala_15_01"); //Wiesz co� o kluczu Baal Kagana?
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_02"); //Mo�e wiem, mo�e nie wiem.
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_03"); //Masz 50 bry�ek rudy?
    B_LogEntry                     (CH1_KeyKagan,"Klin sprzeda mi klucz Kagana za 50 bry�ek rudy.");

    B_GiveXP (50);
};

//========================================
//-----------------> KeyBuy
//========================================

INSTANCE DIA_Wedge_KeyBuy (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_KeyBuy_Condition;
   information  = DIA_Wedge_KeyBuy_Info;
   permanent	= FALSE;
   description	= "(Kup klucz - 50 bry�ek) ";
};

FUNC INT DIA_Wedge_KeyBuy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_KluczBaala))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KeyBuy_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KeyBuy_15_01"); //Daj mi ten klucz.
    AI_Output (self, other ,"DIA_Wedge_KeyBuy_03_02"); //Bardzo prosz�.
    CreateInvItems (self, ItKe_Ncbaal, 1);
    B_GiveInvItems (self, other, ItKe_Ncbaal, 1);
    B_LogEntry                     (CH1_KeyKagan,"Odkupi�em klucz od Klina. Mog� go odda� Baal Kaganowi. Chocia� warto by by�o zajrze� do jego skrzyni...");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zlodzieje
//========================================

INSTANCE DIA_Wedge_Zlodzieje (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_Zlodzieje_Condition;
   information  = DIA_Wedge_Zlodzieje_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Wedge_Zlodzieje_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Psst)) && (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Zlodzieje_Info()
{
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_01"); //Ostatnio roi si� tutaj od z�odziei.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_02"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_03"); //Kto� ukrad� moj� rodzinn� pami�tk�.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_04"); //To niewielki pos��ek jakiego� nieznanego mi b�stwa.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_05"); //Ch�tnie bym go poszuka�, ale musz� pilnowa� swojej chaty.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_06"); //Odzyskasz go dla mnie?
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_07"); //Czemu nie?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_08"); //Niestety nie mog� ci da� �adnej wskaz�wki.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_09"); //Po prostu rozgl�daj si� tu i tam.
    MIS_FindPosazekKlina = LOG_RUNNING;

    Log_CreateTopic            (CH1_FindPosazekKlina, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindPosazekKlina, LOG_RUNNING);
    B_LogEntry                     (CH1_FindPosazekKlina,"Klin chce, abym odnalaz� jego rodzinn� pami�tk�. To ma�y pos��ek przedstawiaj�cy dziwne b�stwo.");
	//CreateInvItems (Stt_311_Fisk, JakBylPosazekPoAngielskuDoZCholery, 1); ***FIX*** TWORZONY W INNYM SKRYPCIE!!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Posog
//========================================

INSTANCE DIA_Wedge_Posog (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_Posog_Condition;
   information  = DIA_Wedge_Posog_Info;
   permanent	= FALSE;
   description	= "Mam pos��ek.";
};

FUNC INT DIA_Wedge_Posog_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Zlodzieje))
    && (Npc_HasItems (other, JakBylPosazekPoAngielskuDoZCholery) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Posog_Info()
{
    AI_Output (other, self ,"DIA_Wedge_Posog_15_01"); //Mam pos��ek.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_02"); //Gdzie go znalaz�e�?
    AI_Output (other, self ,"DIA_Wedge_Posog_15_03"); //Kupi�em go od handlarza Fiska.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_04"); //A to pod�a gnida!
    AI_Output (other, self ,"DIA_Wedge_Posog_15_05"); //My�lisz, �e sam tu przyszed� i ci go ukrad�?
    AI_Output (self, other ,"DIA_Wedge_Posog_03_06"); //Nie wiem tego.
    B_LogEntry                     (CH1_FindPosazekKlina,"Znalaz�em pos��ek Klina w ofercie handlarza Fiska.");
    Log_SetTopicStatus       (CH1_FindPosazekKlina, LOG_SUCCESS);
    MIS_FindPosazekKlina = LOG_SUCCESS;

    B_GiveXP (250);
    B_GiveInvItems (other, self, JakBylPosazekPoAngielskuDoZCholery, 1);
    CreateInvItems (self, ItMiNugget, 35);
    B_GiveInvItems (self, other, ItMiNugget, 35);
};

//========================================
//-----------------> Zlodzieje2
//========================================

INSTANCE DIA_Wedge_Zlodzieje2 (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 3;
   condition    = DIA_Wedge_Zlodzieje2_Condition;
   information  = DIA_Wedge_Zlodzieje2_Info;
   permanent	= FALSE;
   description	= "Dowiedzia�e� si�, kto ci go ukrad�?";
};

FUNC INT DIA_Wedge_Zlodzieje2_Condition()
{
    if (MIS_FindPosazekKlina == LOG_SUCCESS)
    && (Npc_KnowsInfo (hero, Org_843_Sharky_Fisk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Zlodzieje2_Info()
{
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_01"); //Dowiedzia�e� si� kto ci go ukrad�?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_02"); //Jeszcze nie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_03"); //Jednak widz�, �e ty masz wielk� ch�� to ustali�.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_04"); //Powiedzmy, �e to by�o moje �yciowe marzenie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_05"); //�wietnie! Gdy co� ustalisz, zg�o� si� do mnie.
    MIS_ZnowuZapierdalam = LOG_RUNNING;

    Log_CreateTopic            (CH1_ZnowuZapierdalam, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_RUNNING);
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Klin do tej pory nie ustali�, kto ukrad� jego pos��ek. T� spraw� mam si� zaj�� ja.");
    AI_StopProcessInfos	(self);
};
var int WedgeKnowsSharky;
//========================================
//-----------------> WiemWiemWiemHehehe
//========================================

INSTANCE DIA_Wedge_WiemWiemWiemHehehe (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_WiemWiemWiemHehehe_Condition;
   information  = DIA_Wedge_WiemWiemWiemHehehe_Info;
   permanent	= FALSE;
   description	= "Wiem, kto ukrad� pos��ek.";
};

FUNC INT DIA_Wedge_WiemWiemWiemHehehe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_UkradzionyPosag))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_WiemWiemWiemHehehe_Info()
{
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_15_01"); //Wiem, kto ukrad� pos��ek.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_03_02"); //Kto to taki?

    Info_ClearChoices	(DIA_Wedge_WiemWiemWiemHehehe);
    Info_AddChoice		(DIA_Wedge_WiemWiemWiemHehehe, "To Butch!", DIA_Wedge_WiemWiemWiemHehehe_Butch);
    Info_AddChoice		(DIA_Wedge_WiemWiemWiemHehehe, "To Sharky!", DIA_Wedge_WiemWiemWiemHehehe_Sharky);
};

FUNC VOID DIA_Wedge_WiemWiemWiemHehehe_Butch()
{
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_15_01"); //To Butch!
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_03_02"); //Wiedzia�em, �e z niego kawa� sukinsyna!
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_03_03"); //Dzi�ki.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Zaufa�em Sharkiemu i powiedzia�em, �e to Butch okrad� Klina.");
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_SUCCESS);
    MIS_ZnowuZapierdalam = LOG_SUCCESS;
	WedgeKnowsSharky = false;
    B_GiveXP (50);
    Info_ClearChoices		(DIA_Wedge_WiemWiemWiemHehehe);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wedge_WiemWiemWiemHehehe_Sharky()
{
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_01"); //To Sharky!

    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_03"); //Co wi�cej, pr�bowa� mnie przekupi�.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_03_04"); //Sk�d wiesz, �e to on?
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_05"); //To w�a�nie Sharky jest nowym paserem Fiska.
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_06"); //Sam za�atwia�em mu t� robot�.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_03_07"); //Ju� ja go dorw�!
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Nie ufam Sharky'emu. Powiedzia�em, �e to on okrad� Klina. ");
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_SUCCESS);
    MIS_ZnowuZapierdalam = LOG_SUCCESS;
	WedgeKnowsSharky = true;
    B_GiveXP (200);
    Info_ClearChoices		(DIA_Wedge_WiemWiemWiemHehehe);
    AI_StopProcessInfos	(self);
};

//********************************************************************
//********* POGADUCHY KARCZMA 1
//********************************************************************
//========================================
//-----------------> KARCZMA_1
//========================================

INSTANCE DIA_Wedge_KARCZMA_1 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_KARCZMA_1_Condition;
   information  = DIA_Wedge_KARCZMA_1_Info;
   permanent	= FALSE;
   description	= "Dobry maj� tu alkohol?";
};

FUNC INT DIA_Wedge_KARCZMA_1_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_1_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_1_15_01"); //Dobry maj� tu alkohol?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_02"); //Nie jest mo�e tak dobry, jak piwo spoza Bariery, ale nie wybrzydzam.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_03"); //W naszym Obozie p�dzi si� g��wnie ry��wk�. Na piwo mo�esz si� tu natkn�� tylko po obrabowaniu konwoj�w ze Starego Obozu.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_04"); //Ostrzegam, �e bardzo szybko si� sprzedaje!
};

//========================================
//-----------------> KARCZMA_2
//========================================

INSTANCE DIA_Wedge_KARCZMA_2 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_KARCZMA_2_Condition;
   information  = DIA_Wedge_KARCZMA_2_Info;
   permanent	= FALSE;
   description	= "Mo�e piwko? ";
};

FUNC INT DIA_Wedge_KARCZMA_2_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_2_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_01"); //Mo�e piwko? 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_02"); //Spadasz mi z nieba kolego! Tak dawno nie pi�em piwa. Zazwyczaj ca�e piwo ko�czy wypite przez sta�ych bywalc�w.
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_03"); //Prosz�, wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_04"); //Dzi�ki.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_05"); //Jakich sta�ych bywalc�w masz na my�li?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_06"); //Jest par� os�b, kt�re ca�ymi dniami tu siedz�. Taki na przyk�ad Isidro. Dziwi� si�, �e ten kole� jeszcze nie wylecia� z Sekty za swoje pija�stwo. Poza tym kilku ch�opk�w lubi sobie popi�, jak na przyk�ad Cipher. 
};

//========================================
//-----------------> KARCZMA_3
//========================================

INSTANCE DIA_Wedge_KARCZMA_3 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 3;
   condition    = DIA_Wedge_KARCZMA_3_Condition;
   information  = DIA_Wedge_KARCZMA_3_Info;
   permanent	= FALSE;
   description	= "Co w og�le s�ycha� w Obozie?";
};

FUNC INT DIA_Wedge_KARCZMA_3_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_3_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_3_15_01"); //Co w og�le s�ycha� w Obozie?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_02"); //Jak zwykle pe�no burd pomi�dzy Najemnikami i Szkodnikami. Ostatnio jednak mia� miejsce pewien zabawny incydent. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_03"); //Krzykacz, jeden z najbardziej rozzuchwalonych Szkodnik�w zwin�� nieco stali kowalowi Huanowi. 
	AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_04"); //Ten odkry� to i mia�a miejsce bardzo ciekawa walka. Krzykacz tak oberwa�, �e a� ze strachu przeni�s� si� do chat Najemnik�w.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_05"); //Krzykacz nie doceni� jak� si�� mo�e dysponowa� kowal. 
};

//========================================
//-----------------> KARCZMA_4
//========================================

INSTANCE DIA_Wedge_KARCZMA_4 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 4;
   condition    = DIA_Wedge_KARCZMA_4_Condition;
   information  = DIA_Wedge_KARCZMA_4_Info;
   permanent	= FALSE;
   description	= "Za co trafi�e� do Kolonii?";
};

FUNC INT DIA_Wedge_KARCZMA_4_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_4_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_4_15_01"); //Za co trafi�e� do Kolonii?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_02"); //Najog�lniej za liczne kradzie�e dokonywane na s�ugach Kr�la. Mieszka�em w Myrtanie, w okolicach Gothy, twierdzy paladyn�w.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_03"); //Pewnego wieczoru m�j prze�o�ony poleci� mi, bym okrad� kapitana Garonda, jednego z najlepszych paladyn�w w kr�lestwie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_04"); //Niestety Garond nie bez powodu nosi tytu� kapitana. Szybko mnie wykry� i by� got�w wymierzy� sprawiedliwo��.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_05"); //Gdyby do tej sprawy nie w��czy� si� Lord Hagen - wielki mistrz zakonu paladyn�w, by�bym martwy.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_06"); //Paladyni wys�ali mnie do stolicy, a Rhobar skaza� na wrzucenie za Barier�. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_07"); //Gdy by�em transportowany statkiem do Khorinis, zarzyga�em ca�� kajut�. Nienawidz� podr�y morskich!
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_08"); //Ot i ca�a moja historia. 
};

//========================================
//-----------------> ZAKONCZENIE
//========================================

INSTANCE DIA_Wedge_ZAKONCZENIE (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 5;
   condition    = DIA_Wedge_ZAKONCZENIE_Condition;
   information  = DIA_Wedge_ZAKONCZENIE_Info;
   permanent	= FALSE;
   description	= "Mi�o si� rozmawia�o.";
};

FUNC INT DIA_Wedge_ZAKONCZENIE_Condition()
{
    if  (Wld_IsTime     (21,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_1))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_2))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_3))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_ZAKONCZENIE_Info()
{
    AI_Output (other, self ,"DIA_Wedge_ZAKONCZENIE_15_01"); //Mi�o si� rozmawia�o.
    AI_Output (self, other ,"DIA_Wedge_ZAKONCZENIE_03_02"); //Wpadnij jeszcze, kole�. Pami�taj, �e mog� ci� wiele nauczy� o z�odziejstwie. 
    AI_StopProcessInfos	(self);
};

instance TRIA_KillFingers (C_INFO)
{
    npc         = ORG_850_Wedge;
    nr          = 10;
    condition   = TRIA_KillFingers_condition;
    information = TRIA_KillFingers_info;
    important   = true;
    permanent   = false;
};

func int TRIA_KillFingers_condition()
{
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Npc_KnowsInfo (hero, DIA_Organisator_LookingForWedge)) && (MIS_HandDed == LOG_RUNNING) )
	{
		return TRUE;
	};
};

func void TRIA_KillFingers_info()
{
    var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm geh�rt der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
	
    //TRIA_Invite(Fingers);   // Lade Robotnik in diesen Dialog ein
    TRIA_Invite(Fingers); // Lade Fingers in diesen Dialog ein
    TRIA_Start();         // Starte das Gespr�ch
    // Der Held und Wedge m�ssen/d�rfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Wedge (self = Wedge, other = Hero)
    TRIA_Next(Wedge);

    DIAG_Reset();
	AI_Output (self, other, "TRIA_KillFingers_0F"); //Odejd� st�d! Nie mieszaj si�! Ten sukinsyn na to zas�uguje. 
	AI_TurnToNpc(self, STT_331_Fingers);
    AI_Output (self, other, "TRIA_KillFingers_00"); //Najwy�sza pora wyr�wna� rachunki! 

    // Held redet nun mit Fingers (self = Fingers, other = Hero)
    TRIA_Next(Fingers);
	DIAG_Reset();

	AI_GotoNpc(self, hero);
    AI_TurnToNpc(self, hero);
	
    AI_Output (self, hero, "TRIA_KillFingers_01"); //Zr�b co�, do cholery! 
	AI_Output (HERO, self, "TRIA_KillFingers_02"); //Moment! O co tu w og�le chodzi?
	AI_Output (self, hero, "TRIA_KillFingers_03"); //Ten kretyn chce mnie zabi�! Nie pozw�l mu na to!
	
    DIAG("Nervous", 1, 2);

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Fingers (self = Fingers, other = Hero)
    TRIA_Next(Wedge);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (self,other);
    AI_Output (self, other, "TRIA_KillFingers_04"); //M�wi�em ci, �eby� si� nie wtr�ca�. D�ugo czeka�em na ten moment... 
	AI_Output (self, other, "TRIA_KillFingers_05"); //Wszystko zacz�o si� jakie� kilkana�cie lat temu... To by�o jeszcze gdy obaj byli�my wolni.
	AI_Output (self, other, "TRIA_KillFingers_06"); //Co tu du�o m�wi�. Nasze �ycie wygl�da�o podobnie. Obaj byli�my cz�onkami Gidli Z�odziei w Khorinis. 
	AI_Output (self, other, "TRIA_KillFingers_07"); //Ja do��czy�em troch� p�niej. R�czka mia� ju� wtedy tytu� arcymistrza z�odziejskiego fachu na wyspie. By� najlepszym z�odziejem. 
	AI_Output (self, other, "TRIA_KillFingers_08"); //Jednak ja tak�e szybko robi�em post�py. Zna�em na pami�� schematy budowy zamk�w, potrafi�em porusza� si� bezszelestnie. 
	AI_Output (self, other, "TRIA_KillFingers_09"); //Mia�em smyka�k� do brudnych interes�w i zawsze potrafi�em si� wypl�ta� z niewygodnych zarzut�w. 
	AI_Output (self, other, "TRIA_KillFingers_10"); //Jako, �e R�czka mia� w r�ku ca�� Gildi� to wszyscy musieli wykonywa� jego zlecenia. Ja nie by�em wyj�tkiem.
	AI_Output (self, other, "TRIA_KillFingers_11"); //Mia�em obrabowa� bogatego mieszczanina. Grubas, lubi�cy lekkie kobiety i alkohol by� szanowany, bo zap�aci� za budow� jednego z okr�t�w wojennych. 
	AI_Output (self, other, "TRIA_KillFingers_12"); //Nic prostszego. Wszed�em do chaty, zabra�em to co trzeba, a gdy wychodzi�em przez okno spostrzeg�em, �e ca�y dom jest otoczony przez stra�nik�w miejskich.
	AI_Output (self, other, "TRIA_KillFingers_13"); //Spogl�dali na mnie z ch�odnymi wyrazami twarzy i poprawiali spusty od wycelowanych prosto w moj� g�ow� kusz. Wiedzia�em, �e kto� mnie wsypa�. 
	AI_Output (self, other, "TRIA_KillFingers_14"); //To by� R�czka! Trafi�em do Kolonii! 
	TRIA_Cam("");
	TRIA_Next(Fingers);
	DIAG_Reset();
	AI_TurnToNpc(self, Wedge);
	AI_Output (self, other, "TRIA_KillFingers_15"); //Ty nic nie rozumiesz! To nie ciebie mieli pojma� stra�nicy, tylko tego bogacza! To wszystko to by� czysty zbieg okoliczno�ci. Przypadek! Niefart!
	AI_Output (self, other, "TRIA_KillFingers_16"); //Okaza�o si�, �e jego fortuna zosta�a zbudowana na oszustwach i machlojkach. Nie wyda�bym nikogo nale��cego do Gildii. Nie wa�ne o ile lepszy by�by ode mnie!
	AI_Output (self, other, "TRIA_KillFingers_17"); //Ten mieszczanin r�wnie� trafi� do Kolonii. Kilka dni po tobie. Do��czy� do Starego Obozu, a raczej zosta� zagoniony do pracy w kopalni.
	AI_Output (self, other, "TRIA_KillFingers_18"); //Jak wida� fortuna mu nie pomog�a. �mia�o, zostaw mnie i id� do Starej Kopalni zapyta� o niego jakiego� dostatecznie starego Stra�nika. 
	
	TRIA_Cam("");
    // Held redet nun wieder mit Wedge (self = Wedge, other = Hero)
    TRIA_Next(Wedge);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, Fingers);
    AI_Output (self, other, "TRIA_KillFingers_19"); //My�lisz, �e w to uwierz�? Ju� po tobie!
	
    // Kamerafahrt Ende
    TRIA_Cam("");


    TRIA_Finish(); // und Ende
	
	Info_ClearChoices	(TRIA_KillFingers);
    Info_AddChoice		(TRIA_KillFingers, "(pom� R�czce)", TRIA_KillFingers_HELP);
    Info_AddChoice		(TRIA_KillFingers, "(nic nie r�b)", TRIA_KillFingers_NOPE);
	
	B_LogEntry                     (CH1_HandDed,"Przed Nowym Obozem znalaz�em R�czk� i Klina. Obaj k��cili si� o jak�� za�y�o�� z przesz�o�ci. Klin uwa�a, �e R�czka wyda� go stra�y miejskiej przez co ten trafi� do Kolonii. Z kolei Cie� przedstawia do�� silne alibi, kt�re jednak wymaga potwierdzenia. Musz� stan�� przed wyborem komu zaufam. ");
};

FUNC VOID TRIA_KillFingers_HELP ()
{
var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm geh�rt der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
		AI_Output (other, self, "TRIA_KillFingers_HELP_01"); //Nie pozwol� na to!
		
		//ScreenFX_FadeAndPassTime(0,0,0,"later...",1000);
		PlayVideo ("er_cutscene_fingersalive.bik"); 
		
		AI_Output (self, other, "TRIA_KillFingers_HELP_02"); //Argh! Rani�e� mnie! Ty sukinsynu! 
		AI_Output (other, self, "TRIA_KillFingers_HELP_03"); //Lepiej wr�� do obozu i opatrz t� ran�. My ju� lepiej p�jdziemy.
		
		Info_ClearChoices	(TRIA_KillFingers);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(Wedge, "start");
		
		B_LogEntry                     (CH1_HandDed,"Nie pozwoli�em na �mier� R�czki. Rani�em Klina moj� broni� zanim ten zd��y� cokolwiek zrobi�.");
		HeroPermitToKillFingers = false;
};

FUNC VOID TRIA_KillFingers_NOPE ()
{
var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm geh�rt der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
		AI_Output (other, self, "TRIA_KillFingers_NOPE_01"); //To nie moja sprawa.
		
		PlayVideo ("er_cutscene_fingersdie.bik"); 
		//ScreenFX_FadeAndPassTime(0,0,0,"later...",1000);
		Npc_ExchangeRoutine	(STT_331_Fingers, "upadek");
		B_KillNPC (STT_331_Fingers);
		AI_Output (self, other, "TRIA_KillFingers_NOPE"); //M�dry wyb�r. Sprawiedliwo�ci sta�o si� zado��.
		
		Info_ClearChoices	(TRIA_KillFingers);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(Wedge, "start");
		
		B_LogEntry                     (CH1_HandDed,"Pozwoli�em Klinowi zabi� R�czk�. Przypuszczam, �e to co m�wi� by�o prawd� i Cie� zas�u�y� na �mier�. Zreszt� to nie moja sprawa. Musz� powiedzie� Diego, �e jego cz�owiek nie �yje.");
		HeroPermitToKillFingers = true;
};


