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
// Rozdzia� -
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
	description		= "Mo�esz mnie nauczy� czego� o my�listwie?"; 
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
		B_LogEntry		(GE_TeacherBAN,"Smith jest my�liwym. Mo�e mnie nauczy� skradania si�, strzelania z �uku, a tak�e mo�e mi pom�c sta� si� zr�czniejszym. Mieszka w Obozie Bandyt�w.");
		log_Smithtrain = TRUE;
	};
	AI_Output (other, self,"DIA_Smith_Lehrer_15_00"); //Mo�esz mnie nauczy� czego� o my�listwie?
	AI_Output (self, other,"DIA_Smith_Lehrer_12_01"); //To zale�y tylko od tego, co chcia�by� wiedzie�.
	
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
		AI_Output (other, self,"DIA_Smith_Lehrer_Bow_15_00"); //Mo�esz mnie nauczy�, jak sprawniej pos�ugiwa� si� �ukiem?
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_01"); //Jako pocz�tkuj�cy powiniene� zawsze pami�ta�, �e skuteczno�� strzelania z �uku zale�y przede wszystkim od przyj�tej postawy.
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unie� na t� sam� wysoko��, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_03"); //Je�li uda ci si� trafi� w szczeg�lnie wra�liwe punkty cia�a ofiary, nie b�dzie potrzeby oddawania drugiego strza�u. Oczywi�cie pocz�tkuj�cy strzelcy mog� tylko pomarzy� o trafieniu w czu�y punkt.
		AI_Output (self, other,"DIA_Smith_Lehrer_Bow_12_04"); //Ale je�li zastosujesz si� do moich wskaz�wek, mo�esz liczy� na wi�cej trafie� w cel.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_Smith_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void DIA_Smith_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_Smith_Lehrer_Schleichen_15_00"); //Chcia�bym porusza� si� bezszelestnie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_01"); //I s�usznie. Skradanie pozwoli ci dosta� si� niepostrze�enie do cudzych dom�w, albo po cichu zaj�� od ty�u przeciwnika.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_02"); //Chodz�c na lekko ugi�tych nogach b�dziesz m�g� uwa�niej obserwowa� grunt, po kt�rym st�pasz, no i �atwiej b�dzie ci balansowa� cia�em.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_03"); //Oczywi�cie kto� obserwuj�cy ci� z boku natychmiast nabierze podejrze�, wi�c skradaj si� zawsze nie b�d�c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_04"); //Zapami�taj sobie dobrze co ci powiedzia�em, i przede wszystkim nie daj si� z�apa�!
	};
};
func void DIA_Smith_Lehrer_Bow_2()
{
	if (hero.attribute[ATR_Dexterity] >= 60)
	{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_02"); //Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_03"); //Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output (self, other,"DIA_Smith_Lehrer_Bow_2_Info_12_05"); //Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_Smith_NO_ENOUGHT_STR_1"); //Popracuj jeszcze nad swoj� zr�czno�ci�.
	PrintScreen	("Warunek: Zr�czno�� 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia� -
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
	description		= "Chc� kupi� �uk."; 
	trade 			= 1;
};

FUNC int  BAN_1609_Smith_TRADE_Condition()
{	
		return TRUE;
};
FUNC void  BAN_1609_Smith_TRADE_Info()
{
	AI_Output (other, self,"BAN_1609_Smith_TRADE_Info_15_01"); //Chc� kupi� �uk.
	var int wpis_Smithtrader;
	if wpis_Smithtrader == false
	{
	wpis_Smithtrader = true;
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Smith handluje �ukami w Obozie Bandyt�w.");
	};
	
};  

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia� 1
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
   description	= "Podobno Jens chcia�, aby� pom�g� mu odnale�� miecz.";
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
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_01"); //Podobno Jens chcia�, aby� pom�g� mu odnale�� miecz.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_02"); //Tak, tak by�o. Czy to jaki� problem?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_03"); //Nie, ale Jens ma do ciebie pewn� pro�b�. Chce, aby� powiedzia� to samo Quentinowi.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_04"); //Nie ma sprawy. M�g�bym wiedzie� tylko po co?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_05"); //Kereth chce wrobi� Jensa w zab�jstwo Rayana.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_06"); //Ten sukinsyn wiecznie co� kombinuje. Ju� kt�ry� raz pr�buje pozby� si� Jensa. Ja na jego miejscu ju� dawno spu�ci�bym mu �omot.
	
	B_LogEntry                     (CH1_DestroyedGrave,"Smith po�wiadczy za Jensa. Powiedzia� mi nawet, �e to nie pierwszy raz kiedy Kereth pr�buje si� pozby� rymarza z Obozu. Dobrze, �e nie da�em si� nabra�.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia� -
// Usuni�te dialogi
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
   description	= "�ucznicy walcz� wr�cz?";
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
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_01"); //�ucznicy walcz� wr�cz?
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_02"); //Oczywi�cie, �e tak. Jednak tylko, gdy zmusi ich do tego przeciwnik. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_03"); //Je�eli chcesz by� dobrym �owc�, to staraj si� zawsze utrzymywa� dystans pomi�dzy tob�, a przeciwnikiem.
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_04"); //Mo�esz mi poleci� jakie� lekkie, ale skuteczne bronie? Nie mam do�� si�y na ci�kie miecze i topory.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_05"); //To zrozumia�e. �ucznicy pracuj� nad lekko�ci� i zwinno�ci�, a nie nad si��.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_06"); //Kowale ju� dawno o nas pomy�leli i zacz�li wykuwa� lekkie, ale bardzo ostre miecze. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_07"); //Koszt wykucia takiego miecza jest olbrzymi, a znalezienie planu graniczy z cudem. 
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_08"); //Powiesz mi wreszcie o jakie bronie chodzi?
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_09"); //Ach tak, zapomnia�em. Do najl�ejszych broni zalicza si� przer�ne rapiery, pa�asze i sztylety.
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_10"); //Kr��� tak�e legendy o mieczach mistrzowskich. By�y to niezwykle ostre i precyzyjne bronie. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_11"); //Pono� sam Rhobar zam�wi� u najlepszych kowali w kr�lestwie tylko 100 sztuk tej broni i obdarowa� nimi swoich najlepszych �ucznik�w. Szczeg�lnie tych, kt�rzy brali udzia� w bitwie o Varant. 
    AI_Output (self, other ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_03_12"); //Tylko kilka sztuk tej broni ostatecznie trafi�o do Khorinis. Przywie�li je ze sob� w�a�nie �ucznicy Rhobara, kt�rzy po sko�czonej s�u�bie u kr�la szukali nowego miejsca dla siebie.
    AI_Output (other, self ,"DIA_Raeuber_FIGHT_WITHOUT_ARROWS_15_13"); //To naprawd� wspania�a historia. Dzi�kuj� za opowiedzenie jej. 
	
};

*/