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
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_15_02"); //Jacy wy wszyscy jesteœcie domyœlni.
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_03"); //No ³azisz ci¹gle wokó³ jego chaty to chyba widzê, ¿e jest coœ na rzeczy. 
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_04"); //Poszed³ razem z takim jasnow³osym goœciem przed Obóz. Powiedzieli, ¿e musz¹ pogadaæ na osobnoœci. 
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_15_05"); //Dziêki za pomoc.
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_03_06"); //Ej, czekaj. Daj na na butelkê ry¿ówki. Przecie¿ ci pomog³em.

    Info_ClearChoices		(DIA_Organisator_LookingForWedge);
    Info_AddChoice		(DIA_Organisator_LookingForWedge, "Ca³uj mnie w dupê. ", DIA_Organisator_LookingForWedge_KissMyAss);
    Info_AddChoice		(DIA_Organisator_LookingForWedge, "W sumie racja. (Daj 5 bry³ek rudy)", DIA_Organisator_LookingForWedge_Ok);
	
	B_LogEntry                     (CH1_HandDed,"Od pewnego Szkodnika dowiedzia³em siê, ¿e R¹czka wraz z Klinem wyszli przed Obóz, ¿eby o czymœ pogadaæ.");
	
};

FUNC VOID DIA_Organisator_LookingForWedge_KissMyAss()
{
    AI_Output (other, self ,"DIA_Organisator_LookingForWedge_KissMyAss_15_01"); //Ca³uj mnie w dupê. 
    AI_Output (self, other ,"DIA_Organisator_LookingForWedge_KissMyAss_03_02"); //Z przyjemnoœci¹. 
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
        AI_Output (self, other ,"DIA_Organisator_LookingForWedge_Ok_03_02"); //Dziêki.
        B_GiveInvItems (other, self, ItMiNugget, 5);
    }
    else
    {
        AI_Output (other, self ,"DIA_Organisator_LookingForWedge_Ok_15_03"); //Niestety nic ju¿ nie mam.
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
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... ChodŸ no tutaj!
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
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jesteœ tu nowy, co? Od razu zauwa¿y³em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz siê jeszcze wiele nauczyæ. Móg³bym ci pokazaæ, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa¿aæ z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze¿ siê go!
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
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby³ych. Na twoim miejscu unika³bym go jak ognia.
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
	description		= "Czego mo¿esz mnie nauczyæ?"; 
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
		B_LogEntry			(GE_TeacherNC, "Szkodnik o przezwisku Klin mo¿e mnie nauczyæ skradania siê, otwierania zamków i kradzie¿y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale¿y... A co chcesz wiedzieæ?
	

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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
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
   description	= "Wiesz coœ o kluczu Baal Kagana?";
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
    AI_Output (other, self ,"DIA_Wedge_KluczBaala_15_01"); //Wiesz coœ o kluczu Baal Kagana?
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_02"); //Mo¿e wiem, mo¿e nie wiem.
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_03"); //Masz 50 bry³ek rudy?
    B_LogEntry                     (CH1_KeyKagan,"Klin sprzeda mi klucz Kagana za 50 bry³ek rudy.");

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
   description	= "(Kup klucz - 50 bry³ek) ";
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
    AI_Output (self, other ,"DIA_Wedge_KeyBuy_03_02"); //Bardzo proszê.
    CreateInvItems (self, ItKe_Ncbaal, 1);
    B_GiveInvItems (self, other, ItKe_Ncbaal, 1);
    B_LogEntry                     (CH1_KeyKagan,"Odkupi³em klucz od Klina. Mogê go oddaæ Baal Kaganowi. Chocia¿ warto by by³o zajrzeæ do jego skrzyni...");

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
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_01"); //Ostatnio roi siê tutaj od z³odziei.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_02"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_03"); //Ktoœ ukrad³ moj¹ rodzinn¹ pami¹tkê.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_04"); //To niewielki pos¹¿ek jakiegoœ nieznanego mi bóstwa.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_05"); //Chêtnie bym go poszuka³, ale muszê pilnowaæ swojej chaty.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_06"); //Odzyskasz go dla mnie?
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_07"); //Czemu nie?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_08"); //Niestety nie mogê ci daæ ¿adnej wskazówki.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_09"); //Po prostu rozgl¹daj siê tu i tam.
    MIS_FindPosazekKlina = LOG_RUNNING;

    Log_CreateTopic            (CH1_FindPosazekKlina, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindPosazekKlina, LOG_RUNNING);
    B_LogEntry                     (CH1_FindPosazekKlina,"Klin chce, abym odnalaz³ jego rodzinn¹ pami¹tkê. To ma³y pos¹¿ek przedstawiaj¹cy dziwne bóstwo.");
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
   description	= "Mam pos¹¿ek.";
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
    AI_Output (other, self ,"DIA_Wedge_Posog_15_01"); //Mam pos¹¿ek.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_02"); //Gdzie go znalaz³eœ?
    AI_Output (other, self ,"DIA_Wedge_Posog_15_03"); //Kupi³em go od handlarza Fiska.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_04"); //A to pod³a gnida!
    AI_Output (other, self ,"DIA_Wedge_Posog_15_05"); //Myœlisz, ¿e sam tu przyszed³ i ci go ukrad³?
    AI_Output (self, other ,"DIA_Wedge_Posog_03_06"); //Nie wiem tego.
    B_LogEntry                     (CH1_FindPosazekKlina,"Znalaz³em pos¹¿ek Klina w ofercie handlarza Fiska.");
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
   description	= "Dowiedzia³eœ siê, kto ci go ukrad³?";
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
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_01"); //Dowiedzia³eœ siê kto ci go ukrad³?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_02"); //Jeszcze nie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_03"); //Jednak widzê, ¿e ty masz wielk¹ chêæ to ustaliæ.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_04"); //Powiedzmy, ¿e to by³o moje ¿yciowe marzenie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_05"); //Œwietnie! Gdy coœ ustalisz, zg³oœ siê do mnie.
    MIS_ZnowuZapierdalam = LOG_RUNNING;

    Log_CreateTopic            (CH1_ZnowuZapierdalam, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_RUNNING);
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Klin do tej pory nie ustali³, kto ukrad³ jego pos¹¿ek. T¹ spraw¹ mam siê zaj¹æ ja.");
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
   description	= "Wiem, kto ukrad³ pos¹¿ek.";
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
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_15_01"); //Wiem, kto ukrad³ pos¹¿ek.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_03_02"); //Kto to taki?

    Info_ClearChoices	(DIA_Wedge_WiemWiemWiemHehehe);
    Info_AddChoice		(DIA_Wedge_WiemWiemWiemHehehe, "To Butch!", DIA_Wedge_WiemWiemWiemHehehe_Butch);
    Info_AddChoice		(DIA_Wedge_WiemWiemWiemHehehe, "To Sharky!", DIA_Wedge_WiemWiemWiemHehehe_Sharky);
};

FUNC VOID DIA_Wedge_WiemWiemWiemHehehe_Butch()
{
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_15_01"); //To Butch!
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_03_02"); //Wiedzia³em, ¿e z niego kawa³ sukinsyna!
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Butch_03_03"); //Dziêki.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Zaufa³em Sharkiemu i powiedzia³em, ¿e to Butch okrad³ Klina.");
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

    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_03"); //Co wiêcej, próbowa³ mnie przekupiæ.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_03_04"); //Sk¹d wiesz, ¿e to on?
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_05"); //To w³aœnie Sharky jest nowym paserem Fiska.
    AI_Output (other, self ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_15_06"); //Sam za³atwia³em mu tê robotê.
    AI_Output (self, other ,"DIA_Wedge_WiemWiemWiemHehehe_Sharky_03_07"); //Ju¿ ja go dorwê!
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Nie ufam Sharky'emu. Powiedzia³em, ¿e to on okrad³ Klina. ");
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
   description	= "Dobry maj¹ tu alkohol?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_1_15_01"); //Dobry maj¹ tu alkohol?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_02"); //Nie jest mo¿e tak dobry, jak piwo spoza Bariery, ale nie wybrzydzam.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_03"); //W naszym Obozie pêdzi siê g³ównie ry¿ówkê. Na piwo mo¿esz siê tu natkn¹æ tylko po obrabowaniu konwojów ze Starego Obozu.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_04"); //Ostrzegam, ¿e bardzo szybko siê sprzedaje!
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
   description	= "Mo¿e piwko? ";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_01"); //Mo¿e piwko? 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_02"); //Spadasz mi z nieba kolego! Tak dawno nie pi³em piwa. Zazwyczaj ca³e piwo koñczy wypite przez sta³ych bywalców.
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_03"); //Proszê, wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_04"); //Dziêki.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_05"); //Jakich sta³ych bywalców masz na myœli?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_06"); //Jest parê osób, które ca³ymi dniami tu siedz¹. Taki na przyk³ad Isidro. Dziwiê siê, ¿e ten koleœ jeszcze nie wylecia³ z Sekty za swoje pijañstwo. Poza tym kilku ch³opków lubi sobie popiæ, jak na przyk³ad Cipher. 
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
   description	= "Co w ogóle s³ychaæ w Obozie?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_3_15_01"); //Co w ogóle s³ychaæ w Obozie?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_02"); //Jak zwykle pe³no burd pomiêdzy Najemnikami i Szkodnikami. Ostatnio jednak mia³ miejsce pewien zabawny incydent. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_03"); //Krzykacz, jeden z najbardziej rozzuchwalonych Szkodników zwin¹³ nieco stali kowalowi Huanowi. 
	AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_04"); //Ten odkry³ to i mia³a miejsce bardzo ciekawa walka. Krzykacz tak oberwa³, ¿e a¿ ze strachu przeniós³ siê do chat Najemników.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_05"); //Krzykacz nie doceni³ jak¹ si³¹ mo¿e dysponowaæ kowal. 
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
   description	= "Za co trafi³eœ do Kolonii?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_4_15_01"); //Za co trafi³eœ do Kolonii?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_02"); //Najogólniej za liczne kradzie¿e dokonywane na s³ugach Króla. Mieszka³em w Myrtanie, w okolicach Gothy, twierdzy paladynów.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_03"); //Pewnego wieczoru mój prze³o¿ony poleci³ mi, bym okrad³ kapitana Garonda, jednego z najlepszych paladynów w królestwie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_04"); //Niestety Garond nie bez powodu nosi tytu³ kapitana. Szybko mnie wykry³ i by³ gotów wymierzyæ sprawiedliwoœæ.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_05"); //Gdyby do tej sprawy nie w³¹czy³ siê Lord Hagen - wielki mistrz zakonu paladynów, by³bym martwy.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_06"); //Paladyni wys³ali mnie do stolicy, a Rhobar skaza³ na wrzucenie za Barierê. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_07"); //Gdy by³em transportowany statkiem do Khorinis, zarzyga³em ca³¹ kajutê. Nienawidzê podró¿y morskich!
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_08"); //Ot i ca³a moja historia. 
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
   description	= "Mi³o siê rozmawia³o.";
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
    AI_Output (other, self ,"DIA_Wedge_ZAKONCZENIE_15_01"); //Mi³o siê rozmawia³o.
    AI_Output (self, other ,"DIA_Wedge_ZAKONCZENIE_03_02"); //Wpadnij jeszcze, koleœ. Pamiêtaj, ¿e mogê ciê wiele nauczyæ o z³odziejstwie. 
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
    var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm gehört der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
	
    //TRIA_Invite(Fingers);   // Lade Robotnik in diesen Dialog ein
	TRIA_Invite(Wedge); 
    TRIA_Invite(Fingers); // Lade Fingers in diesen Dialog ein
    TRIA_Start();         // Starte das Gespräch
    // Der Held und Wedge müssen/dürfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Wedge (self = Wedge, other = Hero)
    TRIA_Next(Wedge);

    DIAG_Reset();
	AI_Output (self, other, "TRIA_KillFingers_0F"); //OdejdŸ st¹d! Nie mieszaj siê! Ten sukinsyn na to zas³uguje. 
	AI_TurnToNpc(self, STT_331_Fingers);
    AI_Output (self, other, "TRIA_KillFingers_00"); //Najwy¿sza pora wyrównaæ rachunki! 

    // Held redet nun mit Fingers (self = Fingers, other = Hero)
    TRIA_Next(Fingers);
	DIAG_Reset();

	AI_GotoNpc(self, hero);
    AI_TurnToNpc(self, hero);
	
    AI_Output (self, hero, "TRIA_KillFingers_01"); //Zrób coœ, do cholery! 
	AI_Output (HERO, self, "TRIA_KillFingers_02"); //Moment! O co tu w ogóle chodzi?
	AI_Output (self, hero, "TRIA_KillFingers_03"); //Ten kretyn chce mnie zabiæ! Nie pozwól mu na to!
	
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
    AI_Output (self, other, "TRIA_KillFingers_04"); //Mówi³em ci, ¿ebyœ siê nie wtr¹ca³. D³ugo czeka³em na ten moment... 
	AI_Output (self, other, "TRIA_KillFingers_05"); //Wszystko zaczê³o siê jakieœ kilkanaœcie lat temu... To by³o jeszcze gdy obaj byliœmy wolni.
	AI_Output (self, other, "TRIA_KillFingers_06"); //Co tu du¿o mówiæ. Nasze ¿ycie wygl¹da³o podobnie. Obaj byliœmy cz³onkami Gidli Z³odziei w Khorinis. 
	AI_Output (self, other, "TRIA_KillFingers_07"); //Ja do³¹czy³em trochê póŸniej. R¹czka mia³ ju¿ wtedy tytu³ arcymistrza z³odziejskiego fachu na wyspie. By³ najlepszym z³odziejem. 
	AI_Output (self, other, "TRIA_KillFingers_08"); //Jednak ja tak¿e szybko robi³em postêpy. Zna³em na pamiêæ schematy budowy zamków, potrafi³em poruszaæ siê bezszelestnie. 
	AI_Output (self, other, "TRIA_KillFingers_09"); //Mia³em smyka³kê do brudnych interesów i zawsze potrafi³em siê wypl¹taæ z niewygodnych zarzutów. 
	AI_Output (self, other, "TRIA_KillFingers_10"); //Jako, ¿e R¹czka mia³ w rêku ca³¹ Gildiê to wszyscy musieli wykonywaæ jego zlecenia. Ja nie by³em wyj¹tkiem.
	AI_Output (self, other, "TRIA_KillFingers_11"); //Mia³em obrabowaæ bogatego mieszczanina. Grubas, lubi¹cy lekkie kobiety i alkohol by³ szanowany, bo zap³aci³ za budowê jednego z okrêtów wojennych. 
	AI_Output (self, other, "TRIA_KillFingers_12"); //Nic prostszego. Wszed³em do chaty, zabra³em to co trzeba, a gdy wychodzi³em przez okno spostrzeg³em, ¿e ca³y dom jest otoczony przez stra¿ników miejskich.
	AI_Output (self, other, "TRIA_KillFingers_13"); //Spogl¹dali na mnie z ch³odnymi wyrazami twarzy i poprawiali spusty od wycelowanych prosto w moj¹ g³owê kusz. Wiedzia³em, ¿e ktoœ mnie wsypa³. 
	AI_Output (self, other, "TRIA_KillFingers_14"); //To by³ R¹czka! Trafi³em do Kolonii! 
	TRIA_Cam("");
	TRIA_Next(Fingers);
	DIAG_Reset();
	AI_TurnToNpc(self, Wedge);
	AI_Output (self, other, "TRIA_KillFingers_15"); //Ty nic nie rozumiesz! To nie ciebie mieli pojmaæ stra¿nicy, tylko tego bogacza! To wszystko to by³ czysty zbieg okolicznoœci. Przypadek! Niefart!
	AI_Output (self, other, "TRIA_KillFingers_16"); //Okaza³o siê, ¿e jego fortuna zosta³a zbudowana na oszustwach i machlojkach. Nie wyda³bym nikogo nale¿¹cego do Gildii. Nie wa¿ne o ile lepszy by³by ode mnie!
	AI_Output (self, other, "TRIA_KillFingers_17"); //Ten mieszczanin równie¿ trafi³ do Kolonii. Kilka dni po tobie. Do³¹czy³ do Starego Obozu, a raczej zosta³ zagoniony do pracy w kopalni.
	AI_Output (self, other, "TRIA_KillFingers_18"); //Jak widaæ fortuna mu nie pomog³a. Œmia³o, zostaw mnie i idŸ do Starej Kopalni zapytaæ o niego jakiegoœ dostatecznie starego Stra¿nika. 
	
	TRIA_Cam("");
    // Held redet nun wieder mit Wedge (self = Wedge, other = Hero)
    TRIA_Next(Wedge);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, Fingers);
    AI_Output (self, other, "TRIA_KillFingers_19"); //Myœlisz, ¿e w to uwierzê? Ju¿ po tobie!
	
    // Kamerafahrt Ende
    TRIA_Cam("");


    TRIA_Finish(); // und Ende
	
	Info_ClearChoices	(TRIA_KillFingers);
    Info_AddChoice		(TRIA_KillFingers, "(pomó¿ R¹czce)", TRIA_KillFingers_HELP);
    Info_AddChoice		(TRIA_KillFingers, "(nic nie rób)", TRIA_KillFingers_NOPE);
	
	B_LogEntry                     (CH1_HandDed,"Przed Nowym Obozem znalaz³em R¹czkê i Klina. Obaj k³ócili siê o jak¹œ za¿y³oœæ z przesz³oœci. Klin uwa¿a, ¿e R¹czka wyda³ go stra¿y miejskiej przez co ten trafi³ do Kolonii. Z kolei Cieñ przedstawia doœæ silne alibi, które jednak wymaga potwierdzenia. Muszê stan¹æ przed wyborem komu zaufam. ");
};

FUNC VOID TRIA_KillFingers_HELP ()
{
var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm gehört der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
		AI_Output (other, self, "TRIA_KillFingers_HELP_01"); //Nie pozwolê na to!
		
		//ScreenFX_FadeAndPassTime(0,0,0,"later...",1000);
		PlayVideo ("er_cutscene_fingersalive.bik"); 
		
		AI_Output (self, other, "TRIA_KillFingers_HELP_02"); //Argh! Rani³eœ mnie! Ty sukinsynu! 
		AI_Output (other, self, "TRIA_KillFingers_HELP_03"); //Lepiej wróæ do obozu i opatrz tê ranê. My ju¿ lepiej pójdziemy.
		
		Info_ClearChoices	(TRIA_KillFingers);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(Wedge, "start");
		
		B_LogEntry                     (CH1_HandDed,"Nie pozwoli³em na œmieræ R¹czki. Rani³em Klina moj¹ broni¹ zanim ten zd¹¿y³ cokolwiek zrobiæ.");
		HeroPermitToKillFingers = false;
};

FUNC VOID TRIA_KillFingers_NOPE ()
{
var c_npc Wedge;    	Wedge = Hlp_GetNpc(ORG_850_Wedge); // Ihm gehört der Dialog
    var c_npc Fingers; 		Fingers = Hlp_GetNpc(STT_331_Fingers);
		AI_Output (other, self, "TRIA_KillFingers_NOPE_01"); //To nie moja sprawa.
		
		PlayVideo ("er_cutscene_fingersdie.bik"); 
		//ScreenFX_FadeAndPassTime(0,0,0,"later...",1000);
		Npc_ExchangeRoutine	(STT_331_Fingers, "upadek");
		B_KillNPC (STT_331_Fingers);
		AI_Output (self, other, "TRIA_KillFingers_NOPE"); //M¹dry wybór. Sprawiedliwoœci sta³o siê zadoœæ.
		
		Info_ClearChoices	(TRIA_KillFingers);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(Wedge, "start");
		
		B_LogEntry                     (CH1_HandDed,"Pozwoli³em Klinowi zabiæ R¹czkê. Przypuszczam, ¿e to co mówi³ by³o prawd¹ i Cieñ zas³u¿y³ na œmieræ. Zreszt¹ to nie moja sprawa. Muszê powiedzieæ Diego, ¿e jego cz³owiek nie ¿yje.");
		HeroPermitToKillFingers = true;
};


