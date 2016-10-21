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
	description =  "Szukam Arcymistrza Mag�w Ognia!";
};                       

FUNC int  DIA_Torrez_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Hello_Info()
{
	AI_Output (other, self,"DIA_Torrez_Hello_15_00"); //Szukam Arcymistrza Mag�w Ognia!
	AI_Output (self, other,"DIA_Torrez_Hello_04_01"); //Zg�o� si� do Miltena. A teraz znikaj!
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					Belohnung W�HLEN	
//***********************************************

instance  DIA_Torrez_Belohnung (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_Belohnung_Condition;
	information	=  DIA_Torrez_Belohnung_Info;
	permanent	=  0;
	description =  "Przynios�em mu list z zewn�trz i mam sobie wybra� nagrod�.";
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
	AI_Output (other, self,"DIA_Torrez_Belohnung_15_00"); //Przysy�a mnie Corristo. Przynios�em mu list z zewn�trz i mam sobie wybra� nagrod�.
	AI_Output (self, other,"DIA_Torrez_Belohnung_04_01"); //Wy�wiadczy�e� nam wielk� przys�ug� i otrzymasz ka�d� nagrod�, jakiej za��dasz.
	
	Info_ClearChoices	(DIA_Torrez_Belohnung);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Chcia�bym dosta� ten nap�j!(Max Mana +3)" 	,DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice		(DIA_Torrez_Belohnung,"3 zwoje, (Kula Ognia, Piorun Kulisty i Przemiana w �cierwojada)"	,DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Wezm� pier�cie� zwinno�ci (+2)."	,DIA_Torrez_Belohnung_Dex);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Wezm� ten pier�cie� si�y (+2)."	,DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Str_15_00"); //Wezm� ten pier�cie� si�y.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Str_04_01"); //Tak jak si� spodziewa�em. Prosz�, oto on.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems (self, hero, Staerkering, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Dex_15_00"); //Wezm� pier�cie� zwinno�ci.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Dex_04_01"); //Zwinno�� zawsze powinna i�� przed si��. To by� m�dry wyb�r.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems (self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Wezm� te zwoje z zakl�ciami.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Wykorzystaj je m�drze! Ka�dego z nich mo�esz u�y� tylko raz!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems (self, hero, ItArScrollFireball, 3);//Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //Chcia�bym dosta� ten nap�j!
	AI_Output (self, other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //M�dra decyzja! To najcenniejszy z przedmiot�w, kt�re mog�e� wybra�. Wypij ten nap�j, a twoja si�a znacznie wro�nie!
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
	description =  "Mam dla ciebie list! Ale najpierw chc� dosta� swoj� nagrod�!";
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
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_00"); //Mam dla ciebie list! Ale najpierw chc� dosta� swoj� nagrod�!
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_01"); //Dlaczego nie porozmawiasz z Miltenem?
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_02"); //Ju� to zrobi�em.
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_03"); //Rozumiem. Mam tu twoj� nagrod�. Poka� mi list. Teraz!
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_04"); //Oto on!
		
	if (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_05"); //W nagrod� otrzymasz pier�cie� si�y. To niezwykle rzadki artefakt. Z pewno�ci� bardzo ci si� przyda.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_06"); //A teraz id� st�d!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self,other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_07"); //Piecz�� zosta�a z�amana.
		AI_Output (other, self,"DIA_Torrez_BriefTausch_15_08"); //C�, wypadki si� zdarzaj�.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_09"); //Jako zap�at� dostaniesz nap�j uzdrawiaj�cy. Ciesz si�, pos�a�cy, kt�rzy przynosz� otwarte listy zwykle nie dostaj� nic!
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
	description =  "Co s�ycha� w �wiecie magii?";
};                       

FUNC int  DIA_Torrez_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_PERM_Info()
{
	AI_Output (other, self,"DIA_Torrez_PERM_15_00"); //Co s�ycha� w �wiecie magii?
	AI_Output (self, other,"DIA_Torrez_PERM_04_01"); //Nie tw�j interes!
	AI_StopProcessInfos	( self );
};










///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3   ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					W�HREND DER AUFNAHME	
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
	
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_01"); //Dla ka�dego Kr�gu Magii powsta�a ksi�ga, opisuj�ca jego zasady. Powiniene� je uwa�nie przestudiowa�. Wiedza to pot�ga!
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_02"); //We� ksi�g� Pierwszego Kr�gu i przeczytaj j� uwa�nie. Zrozumiesz natur� Ognia.
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
	description		= "Poszukuj� magicznych ksi�g."; 
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
	AI_Output (other, self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Poszukuj� magicznych ksi�g.
};  
/*------------------------------------------------------------------------
						BEGR�SSUNG						
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
	AI_Output (self, other,"KDF_405_Torrez_GREET_Info_04_02"); //Niech Innos zawsze ma ci� w swojej opiece! Zajmuj� si� sprzeda�� magicznych artefakt�w i mog� ci pokaza�, jak zwi�kszy� twoje zdolno�ci magiczne!
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Torrez sprzedaje zwoje z zakl�ciami i runy. W ci�gu dnia znajd� go na dziedzi�cu.");

	Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Torrez mo�e mi pokaza�, jak zwi�kszy� moj� man�. W ci�gu dnia znajd� go na dziedzi�cu.");
};
// 
instance  KDF_405_Torrez_MANA (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_MANA_Condition;
	information		= KDF_405_Torrez_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebuj� wi�kszej mocy magicznej."; 
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
	AI_Output (other, self,"KDF_405_Torrez_MANA_Info_15_01"); //Potrzebuj� wi�kszej mocy magicznej.
	AI_Output (self, other,"KDF_405_Torrez_MANA_Info_04_02"); //Poka�� ci, jak zwi�kszy� twoje zdolno�ci magiczne. Jak je wykorzysta�, zale�y ju� tylko od ciebie.
	
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK							,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 5 (koszt: 5 punkt�w umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 1 (koszt: 1 punkt umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_1);
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
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 5 (koszt: 5 punkt�w umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 1 (koszt: 1 punkt umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_1);

};

func void KDF_405_Torrez_MANA_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 5 (koszt: 5 punkt�w umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwi�ksz mana o 1 (koszt: 1 punkt umiej�tno�ci)"		,KDF_405_Torrez_MANA_MAN_1);

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
	description		= "Co powinienem zrobi�, �eby zosta� magiem?"; 
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
	AI_Output (other, self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Co powinienem zrobi�, �eby zosta� Magiem?
	AI_Output (self, other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Porozmawiaj z mistrzem Corristo, je�li znajdzie czas, �eby ci� wys�ucha�.
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
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_01"); //Hej, zaczekaj chwil�. 
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_02"); //Widz�, �e Gomez przyj�� ci� w szeregi Cieni.
    AI_Output (other, self ,"DIA_Torrez_CourierQuest_15_03"); //To prawda.
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_04"); //Id� do Mistrza Corristo, chce si� z tob� widzie�.
    AI_Output (self, other ,"DIA_Torrez_CourierQuest_03_05"); //Mo�esz wej�� do naszych komnat, tylko zachowaj szacunek i pokor�.
    MIS_CourierFireMage = LOG_RUNNING;

    Log_CreateTopic          (CH2_CourierFireMage, LOG_MISSION);
    Log_SetTopicStatus       (CH2_CourierFireMage, LOG_RUNNING);
    B_LogEntry               (CH2_CourierFireMage,"Torrez zaczepi� mnie, gdy chodzi�em po placu zamkowym. Mam si� zg�osi� do Corristo po zadanie.");
    AI_StopProcessInfos	(self);
};


//////////////////////////////////////////////////////////////////////////////////
// USUNI�TE POZOSTA�O��I PO NOWICJUSZACH OGNIA
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
   description	= "Chcia�bym zosta� Nowicjuszem Ognia.";
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
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_01"); //Chcia�bym zosta� Nowicjuszem Ognia.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_03"); //Tak. Mam pier�cie� i aprobat� Jima.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_04"); //To zmienia posta� rzeczy. Przeszed�e� test?
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_05"); //Czy zadanie od Jima mo�na uzna� za stosowny test? Je�eli tak, to przeszed�em.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_06"); //Doskonale. Przydasz nam si�. Gomez szuka pewnego cz�owieka do szpiegowskiego zadania.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_07"); //Pewnie b�dzie chcia� ukry� cz�� zdobytych informacji przed nami, przed Magami Ognia.
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_08"); //Co? Nie rozumiem.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_09"); //Przepraszam. Zamy�li�em si�. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_10"); //No dobrze. Przyjmiemy ci�, ale najpierw musisz zosta� cz�onkiem Starego Obozu. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_11"); //Id� do Gomeza i powiedz mu, �e zyska�e� aprobat� mag�w. Na potwierdzenie we� ten dokument.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_12"); //TYLKO B�D� DELIKATNY NA LITO�� INNOSA. 
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_13"); //Gomez to bardzo porywczy cz�owiek.
    AI_Output (other, self ,"DIA_Torrez_NOWICJUSZ_15_14"); //Dobrze. B�d� pami�ta�.
    AI_Output (self, other ,"DIA_Torrez_NOWICJUSZ_03_15"); //Wr�� potem do mnie.
    B_LogEntry                     (CH1_FireNovize,"Mam delikatnie oznajmi� Gomezowi, �e zyska�em aprobat� Mag�w Ognia.");
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
   description	= "Czy Nowicjuszom Ognia przys�uguj� jakie� przywileje?";
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
    AI_Output (other, self ,"DIA_Torrez_PRZYWILEJE_15_01"); //Czy Nowicjuszom Ognia przys�uguj� jakie� przywileje?
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_02"); //Ale� oczywi�cie! Nowicjusze Ognia maj� te same przywileje co Cienie.
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_03"); //Mo�esz swobodnie chodzi� po Wewn�trznym Pier�cieniu i zamku.
    AI_Output (self, other ,"DIA_Torrez_PRZYWILEJE_03_04"); //Ponadto Jim nauczy ci� pierwszych trzech Kr�g�w Magii. 
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
   description	= "Rozmawia�em z Gomezem.";
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
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_01"); //Rozmawia�em z Gomezem.
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_02"); //Wspaniale. A wi�c witaj w�r�d Nowicjuszy Ognia.
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_03"); //Czy mog� wej�� do �wi�tyni?
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_04"); //Nie! Dost�p do �wi�tyni jest zarezerwowany wy��cznie dla Mag�w.
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_05"); //Nie mamy te� dla ciebie �adnego lokum. Musisz sobie jako� poradzi� sam. 
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_06"); //Po prostu �wietnie. Czy poza robot� dostan� jaki� skromny pancerz i miecz?
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_07"); //Ale� oczywi�cie. Zbroj� i miecz dostajesz ca�kiem za darmo.
    AI_Output (other, self ,"DIA_Torrez_Gomez_success_15_08"); //(ironicznie) Dzi�kuj� za �ask� zacny Magu.
    CreateInvItem		(hero, NOV2_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
    CreateInvItems (self, Miecz1H14, 1);
    B_GiveInvItems (self, other, Miecz1H14, 1);
    AI_Output (self, other ,"DIA_Torrez_Gomez_success_03_09"); //Przyjd� do mnie, gdy otrzymasz zlecenie od Kruka. Chyba, �e ju� ci co� zleci�. 
    B_LogEntry                     (CH1_fire_novize,"Dosta�em bro� i str�j godny Nowicjusza Ognia. Mam pogada� z Torrezem, gdy otrzymam zlecenie od Kruka. ");

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
   description	= "Kruk kaza� mi szpiegowa� Bractwo.";
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
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_01"); //Kruk kaza� mi szpiegowa� Bractwo.
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_02"); //Doskonale. 
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_03"); //Jakie� konkretne wskaz�wki? Mam ci co� przynie�� przy okazji?
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_04"); //Nie, nie. Dzia�aj spokojnie. A jak co� wyszpiegujesz, to przyjd� natychmiast do mnie. 
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_05"); //Nie wahaj si� te� zajrze�, gdy b�dziesz potrzebowa� pomocy z tym zadaniem.
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_06"); //Informacja o przedsi�wzi�ciach planowanych przez Bractwo jest dla nas bardzo wa�na.
    AI_Output (other, self ,"DIA_Torrez_BRACTWO_15_07"); //Musz� uda� si� do Obozu Bractwa. Droga wzd�u� rzeki jest bardzo niebezpieczna...
    AI_Output (self, other ,"DIA_Torrez_BRACTWO_03_08"); //Rozumiem. We� te cztery eliksiry. Przydadz� ci si� podczas drogi.
    B_LogEntry                     (CH1_firenovize,"Mam wykona� zadanie od Kruka i przy okazji informowa� Torreza o post�pach. W razie problem�w mog� zapyta� go o rad�.");

    B_GiveXP (50);
    CreateInvItems (self, ItFo_Potion_Mana_01, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_01, 2);
    CreateInvItems (self, ItFo_Potion_Health_01, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 2);
    AI_StopProcessInfos	(self);
};
 
