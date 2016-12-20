//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Do zobaczenia nast�pnym razem!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Jasne!
	
	AI_StopProcessInfos	( self );
};

// **************** Edycja Rozszerzona - nauka ************************
//========================================
//-----------------> ABOUT_TEACH
//========================================

INSTANCE DIA_Snipes_ABOUT_TEACH (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_ABOUT_TEACH_Condition;
   information  = DIA_Snipes_ABOUT_TEACH_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Snipes_ABOUT_TEACH_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Snipes_ABOUT_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Snipes_ABOUT_TEACH_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_02"); //Ha! Dawno nikt mnie o to nie pyta�!
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_03"); //Mog� nauczy� ci� opr�nia� sakiewki i skrzynie.
	//notatka
	Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
	B_LogEntry			(GE_TeacherOM,"Snipes mo�e mnie nauczy� okradania, skradania oraz otwierania zamk�w.");
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Snipes_Lehrer (C_INFO)
{
	npc				= VLK_584_Snipes;
	nr				= 2;
	condition		= DIA_Snipes_Lehrer_Condition;
	information		= DIA_Snipes_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo�esz mnie nauczy�?"; 
};

FUNC INT DIA_Snipes_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Snipes_ABOUT_TEACH))
	{
		return 1;	
	};
};

FUNC VOID DIA_Snipes_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Snipes_Lehrer_05_01"); //To zale�y... A co chcesz wiedzie�?
	

	Info_ClearChoices	(DIA_Snipes_Lehrer );
	Info_AddChoice		(DIA_Snipes_Lehrer,DIALOG_BACK																,DIA_Snipes_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Snipes_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Snipes_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Snipes_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Snipes_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Snipes_Lehrer_Schleichen);
	};
};


func void DIA_Snipes_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Snipes_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Snipes_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Snipes_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Snipes_Lehrer );
};
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
if  (kapitel < 4)
{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Jak leci?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mam dla ciebie pewn� propozycj�.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Spraw, �eby Aaron odczepi� si� od tej skrzyni, a zap�ac� ci 10 bry�ek rudy.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Kopacz Snipes zaoferowa� mi 10 bry�ek rudy w zamian za odci�gni�cie Aarona od jego skrzyni.");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nale�y mi si� 10 bry�ek rudy!"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS) && (kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Nale�y mi si� 10 bry�ek rudy!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Prosz�, zas�u�y�e� na nie.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach, i jeszcze co�: mam przy sobie klucz do tej skrzyni. Jak dla ciebie - 30 bry�ek.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Za kolejne 30 bry�ek Snipes zaoferowa� mi klucz do skrzyni Aarona."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(kup klucz)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02)) && (kapitel < 4)
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Wezm� ten klucz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Trafi�a ci si� nie lada okazja.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zastanawiam si� co TY z tego masz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Zawsze si� ciesz�, kiedy mog� da� prztyczka w nos kt�remu� ze Stra�nik�w. Zreszt�, gdyby znale�li przy mnie rzeczy z tej skrzyni, by�bym martwy.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Kupi�em od Snipesa klucz od skrzyni! Ciekawe, co zrobi Aaron, gdy mu o tym powiem?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ma by� 30 bry�ek! Daj mi rud�, to dostaniesz klucz.
	};
};  

//========================================
//-----------------> POGADUCHY_K4
//========================================

INSTANCE DIA_Snipes_POGADUCHY_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_POGADUCHY_K4_Condition;
   information  = DIA_Snipes_POGADUCHY_K4_Info;
   permanent	= FALSE;
   description	= "Widz�, �e i tym razem uda�o ci si� wykiwa� Stra�nik�w!";
};

FUNC INT DIA_Snipes_POGADUCHY_K4_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_POGADUCHY_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_POGADUCHY_K4_15_01"); //Widz�, �e i tym razem uda�o ci si� wykiwa� Stra�nik�w!
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_02"); //Hehe... Masz racj�. Cho� tym razem my�la�em, �e nam si� nie uda.
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_03"); //Uciekli�my dos�ownie w ostatniej chwili. Jak chcesz zna� szczeg�y, to gadaj z W�em.
};

//========================================
//-----------------> HOW_YOU_ARE_K4
//========================================

INSTANCE DIA_Snipes_HOW_YOU_ARE_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_HOW_YOU_ARE_K4_Condition;
   information  = DIA_Snipes_HOW_YOU_ARE_K4_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Snipes_HOW_YOU_ARE_K4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_POGADUCHY_K4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_HOW_YOU_ARE_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_02"); //Nie�le. Nikt si� tu nie kr�ci poza kilkoma �cierwojadami, ale nimi si� akurat nie martwi�. Jest na co polowa�.
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_03"); //Poza tym jeste�my tu bezpieczni. Stra�nicy Gomeza raczej tu nie zagl�daj�, mimo i� kr�c� si� w pobli�u bram. 
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_04"); //Gadali�cie z nimi?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_05"); //Nie, na razie nas nie wykryli i lepiej �eby tak zosta�o.
};

