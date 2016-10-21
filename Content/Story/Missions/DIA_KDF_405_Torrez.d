//poprawione i sprawdzone - Nocturn

//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Torrez_Exit (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  999;
	condition	=  DIA_Torrez_Exit_Condition;
	information	=  DIA_Torrez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Torrez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFirebolt))
	{
	CreateInvItem (self, ItArRuneFirebolt);
	};
};

//***********************************************
//					Hallo	
//***********************************************

instance  DIA_Torrez_Hello (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_Hello_Condition;
	information	=  DIA_Torrez_Hello_Info;
	permanent	=  0;
	description =  "Szukam Arcymistrza Magów Ognia!";
};                       

FUNC int  DIA_Torrez_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Hello_Info()
{
	AI_Output (other, self,"DIA_Torrez_Hello_15_00"); //Szukam Arcymistrza Magów Ognia!
	AI_Output (self, other,"DIA_Torrez_Hello_04_01"); //Zg³oœ siê do Miltena. A teraz znikaj!
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					Belohnung WÄHLEN	
//***********************************************

instance  DIA_Torrez_Belohnung (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_Belohnung_Condition;
	information	=  DIA_Torrez_Belohnung_Info;
	permanent	=  0;
	description =  "Przynios³em mu list z zewn¹trz i mam sobie wybraæ nagrodê.";
};                       

FUNC int  DIA_Torrez_Belohnung_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_Belohnung_Info()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_15_00"); //Przysy³a mnie Corristo. Przynios³em mu list z zewn¹trz i mam sobie wybraæ nagrodê.
	AI_Output (self, other,"DIA_Torrez_Belohnung_04_01"); //Wyœwiadczy³eœ nam wielk¹ przys³ugê i otrzymasz ka¿d¹ nagrodê, jakiej za¿¹dasz.
	
	Info_ClearChoices	(DIA_Torrez_Belohnung);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Chcia³bym dostaæ ten napój!(Max Mana +3)" 	,DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice		(DIA_Torrez_Belohnung,"3 zwoje, (Kula Ognia, Piorun Kulisty i Przemiana w Œcierwojada)"	,DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Wezmê pierœcieñ zwinnoœci (+2)."	,DIA_Torrez_Belohnung_Dex);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Wezmê ten pierœcieñ si³y (+2)."	,DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Str_15_00"); //Wezmê ten pierœcieñ si³y.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Str_04_01"); //Tak jak siê spodziewa³em. Proszê, oto on.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems (self, hero, Staerkering, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Dex_15_00"); //Wezmê pierœcieñ zwinnoœci.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Dex_04_01"); //Zwinnoœæ zawsze powinna iœæ przed si³¹. To by³ m¹dry wybór.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems (self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Wezmê te zwoje z zaklêciami.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Wykorzystaj je m¹drze! Ka¿dego z nich mo¿esz u¿yæ tylko raz!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems (self, hero, ItArScrollFireball, 3);//Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //Chcia³bym dostaæ ten napój!
	AI_Output (self, other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //M¹dra decyzja! To najcenniejszy z przedmiotów, które mog³eœ wybraæ. Wypij ten napój, a twoja si³a znacznie wroœnie!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

//***********************************************
//					Brief TAUSCH
//***********************************************

instance  DIA_Torrez_BriefTausch (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_BriefTausch_Condition;
	information	=  DIA_Torrez_BriefTausch_Info;
	permanent	=  0;
	description =  "Mam dla ciebie list! Ale najpierw chcê dostaæ swoj¹ nagrodê!";
};                       

FUNC int  DIA_Torrez_BriefTausch_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_BriefTausch_Info()
{
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_00"); //Mam dla ciebie list! Ale najpierw chcê dostaæ swoj¹ nagrodê!
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_01"); //Dlaczego nie porozmawiasz z Miltenem?
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_02"); //Ju¿ to zrobi³em.
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_03"); //Rozumiem. Mam tu twoj¹ nagrodê. Poka¿ mi list. Teraz!
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_04"); //Oto on!
		
	if (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_05"); //W nagrodê otrzymasz pierœcieñ si³y. To niezwykle rzadki artefakt. Z pewnoœci¹ bardzo ci siê przyda.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_06"); //A teraz idŸ st¹d!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self,other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_07"); //Pieczêæ zosta³a z³amana.
		AI_Output (other, self,"DIA_Torrez_BriefTausch_15_08"); //Có¿, wypadki siê zdarzaj¹.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_09"); //Jako zap³atê dostaniesz napój uzdrawiaj¹cy. Ciesz siê, pos³añcy, którzy przynosz¹ otwarte listy zwykle nie dostaj¹ nic!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_02, 1);
		CreateInvItems(self, ItFo_Potion_Health_03, 1);
		B_GiveInvItems(self, other, ItFo_Potion_Health_03, 1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	var C_NPC corristo; corristo = Hlp_GetNpc(KdF_402_Corristo);
	
	CreateInvItems(corristo, ItWr_Fire_Letter_02, 1);
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					PERM
//***********************************************

instance  DIA_Torrez_PERM (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_PERM_Condition;
	information	=  DIA_Torrez_PERM_Info;
	permanent	=  1;
	description =  "Co s³ychaæ w œwiecie magii?";
};                       

FUNC int  DIA_Torrez_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_PERM_Info()
{
	AI_Output (other, self,"DIA_Torrez_PERM_15_00"); //Co s³ychaæ w œwiecie magii?
	AI_Output (self, other,"DIA_Torrez_PERM_04_01"); //Nie twój interes!
	AI_StopProcessInfos	( self );
};










///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3   ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					WÄHREND DER AUFNAHME	
//---------------------------------------------------------
instance KDF_405_Torrez_BOOK (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_BOOK_Condition;
	information		= KDF_405_Torrez_BOOK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_405_Torrez_BOOK_Condition()
{	
	if    (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&&    (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};
func void  KDF_405_Torrez_BOOK_Info()
{
	
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_01"); //Dla ka¿dego Krêgu Magii powsta³a ksiêga, opisuj¹ca jego zasady. Powinieneœ je uwa¿nie przestudiowaæ. Wiedza to potêga!
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_02"); //WeŸ ksiêgê Pierwszego Krêgu i przeczytaj j¹ uwa¿nie. Zrozumiesz naturê Ognia.
	CreateInvItem (self,ItWr_Book_Circle_01);
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01, 1);
	AI_StopProcessInfos	( self );
};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDF_405_Torrez_SELLBOOKS (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_SELLBOOKS_Condition;
	information		= KDF_405_Torrez_SELLBOOKS_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poszukujê magicznych ksi¹g."; 
	trade 			= 1;
};

FUNC int  KDF_405_Torrez_SELLBOOKS_Condition()
	{	
		if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
		{
			return TRUE;
		};
	
	};
FUNC void  KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Poszukujê magicznych ksi¹g.
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_GREET (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_GREET_Condition;
	information		= KDF_405_Torrez_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, Magu!"; 
};

FUNC int  KDF_405_Torrez_GREET_Condition()
	{
		return TRUE;
	};


FUNC void  KDF_405_Torrez_GREET_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_GREET_Info_15_01"); //Witaj, Magu!
	AI_Output (self, other,"KDF_405_Torrez_GREET_Info_04_02"); //Niech Innos zawsze ma ciê w swojej opiece! Zajmujê siê sprzeda¿¹ magicznych artefaktów i mogê ci pokazaæ, jak zwiêkszyæ twoje zdolnoœci magiczne!
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Torrez sprzedaje zwoje z zaklêciami i runy. W ci¹gu dnia znajdê go na dziedziñcu.");

	Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Torrez mo¿e mi pokazaæ, jak zwiêkszyæ moj¹ manê. W ci¹gu dnia znajdê go na dziedziñcu.");
};
// 
instance  KDF_405_Torrez_MANA (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_MANA_Condition;
	information		= KDF_405_Torrez_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
};

FUNC int  KDF_405_Torrez_MANA_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_MANA_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output (self, other,"KDF_405_Torrez_MANA_Info_04_02"); //Poka¿ê ci, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystaæ, zale¿y ju¿ tylko od ciebie.
	
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK							,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_1);
};  
func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices	(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_1);

};

func void KDF_405_Torrez_MANA_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)"		,KDF_405_Torrez_MANA_MAN_1);

};
/*------------------------------------------------------------------------
							Magier Werden?									
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_WANNABEMAGE (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_WANNABEMAGE_Condition;
	information		= KDF_405_Torrez_WANNABEMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co powinienem zrobiæ, ¿eby zostaæ magiem?"; 
};

FUNC int  KDF_405_Torrez_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, KDF_405_Torrez_GREET))
	&& (Npc_GetTrueGuild (hero) != GIL_KDF)
	&& (!Npc_KnowsInfo (hero, KDF_402_Corristo_WANNBEKDF))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Co powinienem zrobiæ, ¿eby zostaæ Magiem?
	AI_Output (self, other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Porozmawiaj z mistrzem Corristo, jeœli znajdzie czas, ¿eby ciê wys³uchaæ.
};  

//========================================
//-----------------> CourierQuest
//========================================

INSTANCE DIA_Torrez_CourierQuest (C_INFO)
{
   npc          = KDF_405_Torrez;
   nr           = 1;
   condition    = DIA_Torrez_CourierQuest_Condition;
   information  = DIA_Torrez_CourierQuest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torrez_CourierQuest_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_STT)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torrez_CourierQuest_Info()
{
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_01"); //Hej, zaczekaj chwilê. 
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_02"); //Widzê, ¿e Gomez przyj¹³ ciê w szeregi Cieni.
    AI_Output (other, self ,"DIA_Torrez_CourierQuest_15_03"); //To prawda.
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_04"); //IdŸ do Mistrza Corristo, chce siê z tob¹ widzieæ.
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_05"); //Mo¿esz wejœæ do naszych komnat, tylko zachowaj szacunek i pokorê.
    MIS_CourierFireMage = LOG_RUNNING;

    Log_CreateTopic          (CH2_CourierFireMage, LOG_MISSION);
    Log_SetTopicStatus       (CH2_CourierFireMage, LOG_RUNNING);
    B_LogEntry               (CH2_CourierFireMage,"Torrez zaczepi³ mnie, gdy chodzi³em po placu zamkowym. Mam siê zg³osiæ do Corristo po zadanie.");
    AI_StopProcessInfos	(self);
};


//////////////////////////////////////////////////////////////////////////////////
// USUNIÊTE POZOSTA£OŒÆI PO NOWICJUSZACH OGNIA
// BY GOTHIC1210 PATCH 1.4.02
//////////////////////////////////////////////////////////////////////////////////
//========================================
//-----------------> NOWICJUSZ
//========================================

INSTANCE DIA_Torrez_NOWICJUSZ (C_INFO)
{
   npc          = KDF_405_Torrez;
   nr           = 1;
   condition    = DIA_Torrez_NOWICJUSZ_Condition;
   information  = DIA_Torrez_NOWICJUSZ_Info;
   permanent	= FALSE;
   description	= "Chcia³bym zostaæ Nowicjuszem Ognia.";
};

FUNC INT DIA_Torrez_NOWICJUSZ_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_NONE)
    && (Npc_KnowsInfo (hero, DIA_Jim_QUEST_END1))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torrez_NOWICJUSZ_Info()
{
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_01"); //Chcia³bym zostaæ Nowicjuszem Ognia.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_03"); //Tak. Mam pierœcieñ i aprobatê Jima.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_04"); //To zmienia postaæ rzeczy. Przeszed³eœ test?
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_05"); //Czy zadanie od Jima mo¿na uznaæ za stosowny test? Je¿eli tak, to przeszed³em.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_06"); //Doskonale. Przydasz nam siê. Gomez szuka pewnego cz³owieka do szpiegowskiego zadania.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_07"); //Pewnie bêdzie chcia³ ukryæ czêœæ zdobytych informacji przed nami, przed Magami Ognia.
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_08"); //Co? Nie rozumiem.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_09"); //Przepraszam. Zamyœli³em siê. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_10"); //No dobrze. Przyjmiemy ciê, ale najpierw musisz zostaæ cz³onkiem Starego Obozu. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_11"); //IdŸ do Gomeza i powiedz mu, ¿e zyska³eœ aprobatê magów. Na potwierdzenie weŸ ten dokument.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_12"); //TYLKO B¥D DELIKATNY NA LITOŒÆ INNOSA. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_13"); //Gomez to bardzo porywczy cz³owiek.
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_14"); //Dobrze. Bêdê pamiêta³.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_15"); //Wróæ potem do mnie.
    B_LogEntry                     (CH1_FireNovize,"Mam delikatnie oznajmiæ Gomezowi, ¿e zyska³em aprobatê Magów Ognia.");
	CreateInvItem(self, it_GlejtMagow);
	B_GiveInvItems (self, hero, it_GlejtMagow, 1);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> PRZYWILEJE
//========================================

INSTANCE DIA_Torrez_PRZYWILEJE (C_INFO)
{
   npc          = KDF_405_Torrez;
   nr           = 1;
   condition    = DIA_Torrez_PRZYWILEJE_Condition;
   information  = DIA_Torrez_PRZYWILEJE_Info;
   permanent	= FALSE;
   description	= "Czy Nowicjuszom Ognia przys³uguj¹ jakieœ przywileje?";
};

FUNC INT DIA_Torrez_PRZYWILEJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torrez_NOWICJUSZ))
    && (hero.guild == GIL_STT)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torrez_PRZYWILEJE_Info()
{
    AI_Output (other, self ,"DIA_Torrez_PRZYWILEJE_15_01"); //Czy Nowicjuszom Ognia przys³uguj¹ jakieœ przywileje?
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_02"); //Ale¿ oczywiœcie! Nowicjusze Ognia maj¹ te same przywileje co Cienie.
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_03"); //Mo¿esz swobodnie chodziæ po Wewnêtrznym Pierœcieniu i zamku.
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_04"); //Ponadto Jim nauczy ciê pierwszych trzech Krêgów Magii. 
};


//========================================
//-----------------> Gomez_success
//========================================

INSTANCE DIA_Torrez_Gomez_success (C_INFO)
{
   npc          = KDF_405_Torrez;
   nr           = 1;
   condition    = DIA_Torrez_Gomez_success_Condition;
   information  = DIA_Torrez_Gomez_success_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Gomezem.";
};

FUNC INT DIA_Torrez_Gomez_success_Condition()
{
    if (MIS_FireNovize == LOG_RUNNING)
    && (hero.guild == gil_stt)
    && (hero_join_fn == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torrez_Gomez_success_Info()
{
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_01"); //Rozmawia³em z Gomezem.
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_02"); //Wspaniale. A wiêc witaj wœród Nowicjuszy Ognia.
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_03"); //Czy mogê wejœæ do œwi¹tyni?
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_04"); //Nie! Dostêp do œwi¹tyni jest zarezerwowany wy³¹cznie dla Magów.
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_05"); //Nie mamy te¿ dla ciebie ¿adnego lokum. Musisz sobie jakoœ poradziæ sam. 
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_06"); //Po prostu œwietnie. Czy poza robot¹ dostanê jakiœ skromny pancerz i miecz?
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_07"); //Ale¿ oczywiœcie. Zbrojê i miecz dostajesz ca³kiem za darmo.
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_08"); //(ironicznie) Dziêkujê za ³askê zacny Magu.
    CreateInvItem		(hero, NOV2_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
    CreateInvItems (self, Miecz1H14, 1);
    B_GiveInvItems (self, other, Miecz1H14, 1);
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_09"); //PrzyjdŸ do mnie, gdy otrzymasz zlecenie od Kruka. Chyba, ¿e ju¿ ci coœ zleci³. 
    B_LogEntry                     (CH1_fire_novize,"Dosta³em broñ i strój godny Nowicjusza Ognia. Mam pogadaæ z Torrezem, gdy otrzymam zlecenie od Kruka. ");

    B_GiveXP (250);
};
//========================================
//-----------------> BRACTWO
//========================================

INSTANCE DIA_Torrez_BRACTWO (C_INFO)
{
   npc          = KDF_405_Torrez;
   nr           = 1;
   condition    = DIA_Torrez_BRACTWO_Condition;
   information  = DIA_Torrez_BRACTWO_Info;
   permanent	= FALSE;
   description	= "Kruk kaza³ mi szpiegowaæ Bractwo.";
};

FUNC INT DIA_Torrez_BRACTWO_Condition()
{
    if (Raven_SpySect == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torrez_BRACTWO_Info()
{
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_01"); //Kruk kaza³ mi szpiegowaæ Bractwo.
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_02"); //Doskonale. 
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_03"); //Jakieœ konkretne wskazówki? Mam ci coœ przynieœæ przy okazji?
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_04"); //Nie, nie. Dzia³aj spokojnie. A jak coœ wyszpiegujesz, to przyjdŸ natychmiast do mnie. 
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_05"); //Nie wahaj siê te¿ zajrzeæ, gdy bêdziesz potrzebowaæ pomocy z tym zadaniem.
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_06"); //Informacja o przedsiêwziêciach planowanych przez Bractwo jest dla nas bardzo wa¿na.
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_07"); //Muszê udaæ siê do Obozu Bractwa. Droga wzd³u¿ rzeki jest bardzo niebezpieczna...
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_08"); //Rozumiem. WeŸ te cztery eliksiry. Przydadz¹ ci siê podczas drogi.
    B_LogEntry                     (CH1_firenovize,"Mam wykonaæ zadanie od Kruka i przy okazji informowaæ Torreza o postêpach. W razie problemów mogê zapytaæ go o radê.");

    B_GiveXP (50);
    CreateInvItems (self, ItFo_Potion_Mana_01, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_01, 2);
    CreateInvItems (self, ItFo_Potion_Health_01, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 2);
    AI_StopProcessInfos	(self);
};
 
