// ************************ EXIT **************************

instance  Info_Smith_EXIT (C_INFO)
{
	npc			= BAN_1609_Smith;
	nr			= 999;
	condition	= Info_Smith_EXIT_Condition;
	information	= Info_Smith_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Smith_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Smith_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ -
// Nauka
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
// 						Lehrer
// **************************************************
var int log_Smithtrain;
INSTANCE DIA_Smith_Lehrer (C_INFO)
{
	npc				= BAN_1609_Smith;
	nr				= 2;
	condition		= DIA_Smith_Lehrer_Condition;
	information		= DIA_Smith_Lehrer_Info;
	permanent		= 1;
	description		= "Mo¿esz mnie nauczyæ czegoœ o myœlistwie?"; 
};

FUNC INT DIA_Smith_Lehrer_Condition()
{	
		return 1;	
};

FUNC VOID DIA_Smith_Lehrer_Info()
{
	if (log_Smithtrain == FALSE)
	{
		//edit by Nocturn
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,"Smith jest myœliwym. Mo¿e mnie nauczyæ skradania siê, strzelania z ³uku, a tak¿e mo¿e mi pomóc staæ siê zrêczniejszym. Mieszka w Obozie Bandytów.");
		log_Smithtrain = TRUE;
	};
	AI_Output (other, self,"DIA_Smith_Lehrer_15_00"); //Mo¿esz mnie nauczyæ czegoœ o myœlistwie?
	AI_Output (self, other,"DIA_Smith_Lehrer_12_01"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
	
	Info_ClearChoices	(DIA_Smith_Lehrer );
	Info_AddChoice		(DIA_Smith_Lehrer,DIALOG_BACK															,DIA_Smith_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_Smith_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_Smith_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_Smith_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Smith_LehrerDEX5);
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Smith_LehrerDEX1);
};

func void DIA_Smith_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_Smith_Lehrer );
};
func void DIA_Smith_LehrerDEX1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(DIA_Smith_Lehrer );
	Info_AddChoice		(DIA_Smith_Lehrer,DIALOG_BACK															,DIA_Smith_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_Smith_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_Smith_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_Smith_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Smith_LehrerDEX5);
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Smith_LehrerDEX1);
};

func void DIA_Smith_LehrerDEX5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(DIA_Smith_Lehrer );
	Info_AddChoice		(DIA_Smith_Lehrer,DIALOG_BACK															,DIA_Smith_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_Smith_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_Smith_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_Smith_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Smith_LehrerDEX5);
	Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Smith_LehrerDEX1);
};
func void DIA_Smith_Lehrer_Bow()
{
	if (hero.attribute[ATR_Dexterity] >= 30)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_Smith_Lehrer_Bow_15_00"); //Mo¿esz mnie nauczyæ, jak sprawniej pos³ugiwaæ siê ³ukiem?
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_01"); //Jako pocz¹tkuj¹cy powinieneœ zawsze pamiêtaæ, ¿e skutecznoœæ strzelania z ³uku zale¿y przede wszystkim od przyjêtej postawy.
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unieœ na tê sam¹ wysokoœæ, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_03"); //Jeœli uda ci siê trafiæ w szczególnie wra¿liwe punkty cia³a ofiary, nie bêdzie potrzeby oddawania drugiego strza³u. Oczywiœcie pocz¹tkuj¹cy strzelcy mog¹ tylko pomarzyæ o trafieniu w czu³y punkt.
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_04"); //Ale jeœli zastosujesz siê do moich wskazówek, mo¿esz liczyæ na wiêcej trafieñ w cel.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_Smith_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void DIA_Smith_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_Smith_Lehrer_Schleichen_15_00"); //Chcia³bym poruszaæ siê bezszelestnie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_01"); //I s³usznie. Skradanie pozwoli ci dostaæ siê niepostrze¿enie do cudzych domów, albo po cichu zajœæ od ty³u przeciwnika.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_02"); //Chodz¹c na lekko ugiêtych nogach bêdziesz móg³ uwa¿niej obserwowaæ grunt, po którym st¹pasz, no i ³atwiej bêdzie ci balansowaæ cia³em.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_03"); //Oczywiœcie ktoœ obserwuj¹cy ciê z boku natychmiast nabierze podejrzeñ, wiêc skradaj siê zawsze nie bêd¹c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_04"); //Zapamiêtaj sobie dobrze co ci powiedzia³em, i przede wszystkim nie daj siê z³apaæ!
	};
};
func void DIA_Smith_Lehrer_Bow_2()
{
	if (hero.attribute[ATR_Dexterity] >= 60)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_02"); //Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_03"); //Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_05"); //Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_Smith_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj¹ zrêcznoœci¹.
	PrintScreen	("Warunek: Zrêcznoœæ 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ -
// Handel
///////////////////////////////////////////////////////////////////////////////////////////

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  BAN_1609_Smith_TRADE (C_INFO)
{
	npc				= BAN_1609_Smith;
	condition		= BAN_1609_Smith_TRADE_Condition;
	information		= BAN_1609_Smith_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcê kupiæ ³uk."; 
	trade 			= 1;
};

FUNC int  BAN_1609_Smith_TRADE_Condition()
{	
		return TRUE;
};
FUNC void  BAN_1609_Smith_TRADE_Info()
{
	AI_Output (other, self,"BAN_1609_Smith_TRADE_Info_15_01"); //Chcê kupiæ ³uk.
	var int wpis_Smithtrader;
	if wpis_Smithtrader == false
	{
	wpis_Smithtrader = true;
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Smith handluje ³ukami w Obozie Bandytów.");
	};
	
};  

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ 1
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FindSwordAlibi
//========================================

INSTANCE DIA_Smith_FindSwordAlibi (C_INFO)
{
   npc          = BAN_1609_Smith;
   nr           = 1;
   condition    = DIA_Smith_FindSwordAlibi_Condition;
   information  = DIA_Smith_FindSwordAlibi_Info;
   permanent	= FALSE;
   description	= "Podobno Jens chcia³, abyœ pomóg³ mu odnaleŸæ miecz.";
};

FUNC INT DIA_Smith_FindSwordAlibi_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_DoyleAboutJens))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Smith_FindSwordAlibi_Info()
{
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_01"); //Podobno Jens chcia³, abyœ pomóg³ mu odnaleŸæ miecz.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_02"); //Tak, tak by³o. Czy to jakiœ problem?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_03"); //Nie, ale Jens ma do ciebie pewn¹ proœbê. Chce, abyœ powiedzia³ to samo Quentinowi.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_04"); //Nie ma sprawy. Móg³bym wiedzieæ tylko po co?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_05"); //Kereth chce wrobiæ Jensa w zabójstwo Rayana.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_06"); //Ten sukinsyn wiecznie coœ kombinuje. Ju¿ któryœ raz próbuje pozbyæ siê Jensa. Ja na jego miejscu ju¿ dawno spuœci³bym mu ³omot.
	
	B_LogEntry                     (CH1_DestroyedGrave,"Smith poœwiadczy za Jensa. Powiedzia³ mi nawet, ¿e to nie pierwszy raz kiedy Kereth próbuje siê pozbyæ rymarza z Obozu. Dobrze, ¿e nie da³em siê nabraæ.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ -
// Usuniête dialogi
///////////////////////////////////////////////////////////////////////////////////////////

/*
//========================================
//-----------------> FIGHT_WITHOUT_ARROWS
//========================================

INSTANCE DIA_Raeuber_FIGHT_WITHOUT_ARROWS (C_INFO)
{
   npc          = BAN_1609_Smith;
   nr           = 1;
   condition    = DIA_Raeuber_FIGHT_WITHOUT_ARROWS_Condition;
   information  = DIA_Raeuber_FIGHT_WITHOUT_ARROWS_Info;
   permanent	= FALSE;
   description	= "£ucznicy walcz¹ wrêcz?";
};

FUNC INT DIA_Raeuber_FIGHT_WITHOUT_ARROWS_Condition()
{
    if (HeroKnowAboutNoSTRwps == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_FIGHT_WITHOUT_ARROWS_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_01"); //£ucznicy walcz¹ wrêcz?
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_02"); //Oczywiœcie, ¿e tak. Jednak tylko, gdy zmusi ich do tego przeciwnik. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_03"); //Je¿eli chcesz byæ dobrym ³owc¹, to staraj siê zawsze utrzymywaæ dystans pomiêdzy tob¹, a przeciwnikiem.
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_04"); //Mo¿esz mi poleciæ jakieœ lekkie, ale skuteczne bronie? Nie mam doœæ si³y na ciê¿kie miecze i topory.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_05"); //To zrozumia³e. £ucznicy pracuj¹ nad lekkoœci¹ i zwinnoœci¹, a nie nad si³¹.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_06"); //Kowale ju¿ dawno o nas pomyœleli i zaczêli wykuwaæ lekkie, ale bardzo ostre miecze. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_07"); //Koszt wykucia takiego miecza jest olbrzymi, a znalezienie planu graniczy z cudem. 
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_08"); //Powiesz mi wreszcie o jakie bronie chodzi?
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_09"); //Ach tak, zapomnia³em. Do najl¿ejszych broni zalicza siê przeró¿ne rapiery, pa³asze i sztylety.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_10"); //Kr¹¿¹ tak¿e legendy o mieczach mistrzowskich. By³y to niezwykle ostre i precyzyjne bronie. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_11"); //Ponoæ sam Rhobar zamówi³ u najlepszych kowali w królestwie tylko 100 sztuk tej broni i obdarowa³ nimi swoich najlepszych ³uczników. Szczególnie tych, którzy brali udzia³ w bitwie o Varant. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_12"); //Tylko kilka sztuk tej broni ostatecznie trafi³o do Khorinis. PrzywieŸli je ze sob¹ w³aœnie ³ucznicy Rhobara, którzy po skoñczonej s³u¿bie u króla szukali nowego miejsca dla siebie.
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_13"); //To naprawdê wspania³a historia. Dziêkujê za opowiedzenie jej. 
	
};

*/