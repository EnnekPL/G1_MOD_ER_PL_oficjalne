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
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Do zobaczenia nastêpnym razem!
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Snipes_ABOUT_TEACH_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Snipes_ABOUT_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Snipes_ABOUT_TEACH_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_02"); //Ha! Dawno nikt mnie o to nie pyta³!
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_03"); //Mogê nauczyæ ciê opró¿niaæ sakiewki i skrzynie.
	//notatka
	Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
	B_LogEntry			(GE_TeacherOM,"Snipes mo¿e mnie nauczyæ okradania, skradania oraz otwierania zamków.");
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
	description		= "Czego mo¿esz mnie nauczyæ?"; 
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
	AI_Output (other, self,"DIA_Snipes_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Snipes_Lehrer_05_01"); //To zale¿y... A co chcesz wiedzieæ?
	

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
	AI_Output (other, self,"DIA_Snipes_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
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
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
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
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
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
	AI_Output (other, self,"DIA_Snipes_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
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
		AI_Output (self, other,"DIA_Snipes_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Snipes_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
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
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mam dla ciebie pewn¹ propozycjê.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Spraw, ¿eby Aaron odczepi³ siê od tej skrzyni, a zap³acê ci 10 bry³ek rudy.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Kopacz Snipes zaoferowa³ mi 10 bry³ek rudy w zamian za odci¹gniêcie Aarona od jego skrzyni.");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nale¿y mi siê 10 bry³ek rudy!"; 
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
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Nale¿y mi siê 10 bry³ek rudy!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Proszê, zas³u¿y³eœ na nie.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach, i jeszcze coœ: mam przy sobie klucz do tej skrzyni. Jak dla ciebie - 30 bry³ek.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Za kolejne 30 bry³ek Snipes zaoferowa³ mi klucz do skrzyni Aarona."); 
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
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Wezmê ten klucz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Trafi³a ci siê nie lada okazja.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zastanawiam siê co TY z tego masz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Zawsze siê cieszê, kiedy mogê daæ prztyczka w nos któremuœ ze Stra¿ników. Zreszt¹, gdyby znaleŸli przy mnie rzeczy z tej skrzyni, by³bym martwy.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Kupi³em od Snipesa klucz od skrzyni! Ciekawe, co zrobi Aaron, gdy mu o tym powiem?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ma byæ 30 bry³ek! Daj mi rudê, to dostaniesz klucz.
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
   description	= "Widzê, ¿e i tym razem uda³o ci siê wykiwaæ Stra¿ników!";
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
    AI_Output (other, self ,"DIA_Snipes_POGADUCHY_K4_15_01"); //Widzê, ¿e i tym razem uda³o ci siê wykiwaæ Stra¿ników!
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_02"); //Hehe... Masz racjê. Choæ tym razem myœla³em, ¿e nam siê nie uda.
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_03"); //Uciekliœmy dos³ownie w ostatniej chwili. Jak chcesz znaæ szczegó³y, to gadaj z Wê¿em.
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
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_02"); //NieŸle. Nikt siê tu nie krêci poza kilkoma œcierwojadami, ale nimi siê akurat nie martwiê. Jest na co polowaæ.
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_03"); //Poza tym jesteœmy tu bezpieczni. Stra¿nicy Gomeza raczej tu nie zagl¹daj¹, mimo i¿ krêc¹ siê w pobli¿u bram. 
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_04"); //Gadaliœcie z nimi?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_05"); //Nie, na razie nas nie wykryli i lepiej ¿eby tak zosta³o.
};

