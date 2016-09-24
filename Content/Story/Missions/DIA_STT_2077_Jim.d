// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_JIM_EXIT(C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 999;
	condition	= DIA_JIM_EXIT_Condition;
	information	= DIA_JIM_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_JIM_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_JIM_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_JIM_Hello (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_Hello_Condition;
	information	= DIA_JIM_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_JIM_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_JIM_Hello_Info()
{	
	AI_Output (other, self,"DIA_JIM_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_JIM_Hello_08_01"); //Nazywam si� Jim. Jestem kurierem Mag�w Ognia.
	AI_Output (self, other,"DIA_JIM_Hello_08_02"); //S�u�� pomoc� ka�demu, kto tego potrzebuje. Ponadto sprzedaj� mikstury i banda�e.
	AI_Output (self, other,"DIA_JIM_Hello_08_03"); //Mam bardzo dobre kontakty, wi�c jestem w stanie za�atwi� sporo spraw.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Kurier mag�w, Jim, sprzedaje magiczne przedmioty, mikstury i banda�e. Ponadto ma bardzo dobre kontakty z Magami Ognia."); 
};


// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_JIM_Frau (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_Frau_Condition;
	information	= DIA_JIM_Frau_Info;
	permanent	= 0;
	description = "Mog� do��czy� do Mag�w Ognia?";
};                       

FUNC INT DIA_JIM_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello)) &&  (Npc_GetTrueGuild(hero) != GIL_KDF) 
	{
		return 1;
	};
};

FUNC VOID DIA_JIM_Frau_Info()
{	
	AI_Output (other, self,"DIA_JIM_Frau_15_00"); //Mog� do��czy� do Mag�w Ognia?
	AI_Output (self, other,"DIA_JIM_Frau_08_01"); //Ty? Chyba kpisz. Obecnie jeste� wy��cznie zwyczajnym skaza�cem. Jednym z brudas�w, kt�rych jest tutaj pe�no.
	AI_Output (self, other,"DIA_JIM_Frau_08_02"); //Aby zosta� Magiem Ognia, trzeba wykaza� si� wielkimi czynami, oraz cechowa� inteligencj�, rozwag� i wielk� mi�o�ci� do Innosa. 
	AI_Output (other, self,"DIA_JIM_Frau_15_03"); //Za��my, �e w przysz�o�ci chcia�bym to osi�gn��. Co powinienem ju� teraz robi�, �eby zbli�a� si� do celu?
	AI_Output (self, other,"DIA_JIM_Frau_08_04"); //Doprawdy intrygujesz mnie. Po pierwsze powiniene� do��czy� do Starego Obozu. 
	AI_Output (self, other,"DIA_JIM_Frau_08_05"); //Jedynych mieszka�c�w innych oboz�w jakich toleruj� Magowie Ognia to pos�a�cy. Zreszt� Gomez pewnie by si� wkurzy� na Corristo, gdyby przyj�� jakiego� Szkodnika do Kr�gu Ognia, he he. 
	AI_Output (other, self,"DIA_JIM_Frau_15_06"); //A co ze szkoleniem bojowym?
	AI_Output (self, other,"DIA_JIM_Frau_08_07"); //Oczywi�cie o nauce kr�g�w magii nie masz co marzy�, ale magowie ch�tnie naucz� ci� kontrolowa� moc magiczn�. Mo�esz sobie �wiczy� korzystaj�c ze zwoj�w. 
	AI_Output (self, other,"DIA_JIM_Frau_08_08"); //Osobi�cie radz� ci jednak teraz si� tym nie zajmowa�, lecz skupi� si� na walce wr�cz. Tak, dobrze s�yszysz. 
	AI_Output (self, other,"DIA_JIM_Frau_08_09"); //Magowie w zwarciu korzystaj� z kostur�w. 
	AI_Output (self, other,"DIA_JIM_Frau_08_10"); //Je�li teraz nauczysz si� porz�dnie macha� dwur�czn� broni�, a do tego wyrobisz sobie krzep�, to je�li zostaniesz magiem, phi, b�dziesz m�g� si� skupi� wy��cznie na kwestiach run i kr�g�w.
	AI_Output (self, other,"DIA_JIM_Frau_08_11"); //Walki dwur�czn� broni� nauczy ci� Thorus. Ja bra�em u niego lekcje i jestem zadowolony. 
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_JIM_PERM (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_PERM_Condition;
	information	= DIA_JIM_PERM_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT DIA_JIM_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_JIM_PERM_Info()
{	
	AI_Output (other, self,"DIA_JIM_PERM_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_JIM_PERM_08_01"); //Nienajgorzej. Interes si� kr�ci. 
};

//========================================
//-----------------> Leczenie
//========================================

INSTANCE DIA_Jim_Leczenie (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_Leczenie_Condition;
   information  = DIA_Jim_Leczenie_Info;
   permanent	= FALSE;
   description	= "Potrafisz leczy� si� banda�ami?";
};

FUNC INT DIA_Jim_Leczenie_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello)) 
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Jim_Leczenie_Info()
{
    AI_Output (other, self ,"DIA_Jim_Leczenie_15_01"); //Potrafisz leczy� si� banda�ami?
    AI_Output (self, other ,"DIA_Jim_Leczenie_03_02"); //Jasne! Mog� ci sprzeda� kilka. S� skuteczne i ta�sze od mikstur.
	CreateInvItems (self,ItMi_Bandaz40,20);
};


//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Jim_SELLSTUFF (C_INFO)
{
	npc				= STT_2077_Jim;
	nr				= 900;
	condition		= KDW_604_Jim_SELLSTUFF_Condition;
	information		= KDW_604_Jim_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Jim_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,DIA_JIM_Hello))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Jim_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Jim_SELLSTUFF_Info_15_01"); //Chc� pohandlowa�. 
	
};  

//========================================
//-----------------> HELP_WARRIOR
//========================================

INSTANCE DIA_Jim_HELP_WARRIOR (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_HELP_WARRIOR_Condition;
   information  = DIA_Jim_HELP_WARRIOR_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� mikstury, kt�ra ca�kowicie zregeneruje cia�o.";
};

FUNC INT DIA_Jim_HELP_WARRIOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_HELP)) && (Npc_KnowsInfo (hero,DIA_JIM_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_HELP_WARRIOR_Info()
{
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_01"); //Potrzebuj� mikstury, kt�ra ca�kowicie zregeneruje cia�o.
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_02"); //M�j obecny asortyment obejmuje jedynie to, co widzisz.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_03"); //Kto wytwarza sprzedawane przez ciebie eliksiry?
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_04"); //Mag Damarok, jednak prawie nigdy nie opuszcza swojej pracowni.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_05"); //Mimo wszystko musz� z nim porozmawia� i zdoby� ten eliksir. Mo�esz mi jako� w tym pom�c?
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_06"); //Owszem, jednak b�dziesz mi winien przys�ug�.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_07"); //Ehh...
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_08"); //Jeste� wojownikiem, wi�c nie powinno ci to sprawi� problemu. To jak b�dzie?
    B_LogEntry                     (CH1_RannyWojownik,"Jim mo�e mi pom�c, jednak b�d� mu winien przys�ug�.");

    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    Info_AddChoice		(DIA_Jim_HELP_WARRIOR, "Niech b�dzie, pomog� ci.", DIA_Jim_HELP_WARRIOR_POMOGE);
    Info_AddChoice		(DIA_Jim_HELP_WARRIOR, "Nie jestem zainteresowany.", DIA_Jim_HELP_WARRIOR_NIE);
};

FUNC VOID DIA_Jim_HELP_WARRIOR_POMOGE()
{
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_POMOGE_15_01"); //Niech b�dzie, pomog� ci.
    B_LogEntry                     (CH1_RannyWojownik,"Przyj��em ofert� Jima. Przed �wi�tyni� Innosa mam si� spotka� z magiem Damarokiem. Mag jest dost�pny tylko podczas nabo�e�stwa. Wychodzi wtedy przed kaplic� odprawia� msz�.");
	Jim_odrzucilem = false;
    B_GiveXP (50);
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_02"); //Udaj si� do zamku. Przed �wi�tyni� znajdziesz Damaroka. Z pewno�ci� ci pomo�e.
	AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_03"); //Wychodzi na zewn�trz tylko w godzinie nabo�e�stwa dla mieszka�c�w Obozu. Tylko wtedy mo�na z nim pogada�. Nabo�e�stwo odbywa si� w samo po�udnie.
	AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_04"); //Pami�taj, �e za t� informacj� w przysz�o�ci b�dziesz mi winien przys�ug�. 
    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Jim_HELP_WARRIOR_NIE()
{
	Jim_odrzucilem = true;
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_NIE_15_01"); //Nie jestem zainteresowany.
    B_LogEntry                     (CH1_RannyWojownik,"Odrzuci�em propozycj� Jima. Poszukam kogo� innego.");
    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Church
//========================================

INSTANCE DIA_Jim_Church (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_Church_Condition;
   information  = DIA_Jim_Church_Info;
   permanent	= FALSE;
   description	= "O jakich nabo�e�stwach m�wi�e�?";
};

FUNC INT DIA_Jim_Church_Condition()
{
    if (Jim_odrzucilem == FALSE)
    && (Npc_KnowsInfo (hero, DIA_Jim_HELP_WARRIOR))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_Church_Info()
{
    AI_Output (other, self ,"DIA_Jim_Church_15_01"); //O jakich nabo�e�stwach m�wi�e�?
    AI_Output (self, other ,"DIA_Jim_Church_03_02"); //Tych ku czci Innosa. Ma�o kto na nie przychodzi. Tutejsi ludzie stracili wiar�.
    AI_Output (self, other ,"DIA_Jim_Church_03_03"); //Mimo to Damarok dzie� w dzie� wychodzi przed kaplic�, by modli� si� do Innosa.
};

//========================================
//-----------------> OBIETNICA
//========================================

INSTANCE DIA_Jim_OBIETNICA (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_OBIETNICA_Condition;
   information  = DIA_Jim_OBIETNICA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jim_OBIETNICA_Condition()
{
    if (Jim_odrzucilem == false)
    && (Npc_KnowsInfo (hero, DIA_Jim_HELP_WARRIOR))
    && (MIS_RannyWojownik == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_OBIETNICA_Info()
{
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_03_01"); //Nareszcie! Obowi�zuje nas umowa, jeste� mi winien przys�ug�.

    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    Info_AddChoice		(DIA_Jim_OBIETNICA, "Co mam zrobi�?", DIA_Jim_OBIETNICA_POMOGE);
    Info_AddChoice		(DIA_Jim_OBIETNICA, "Nie zamierzam ci pomaga�.", DIA_Jim_OBIETNICA_NIE_DAM);
};

FUNC VOID DIA_Jim_OBIETNICA_POMOGE()
{
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_POMOGE_15_01"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_02"); //No c�, gdy tu przyby�em nie by�em zbyt utalentowanym wojownikiem. 
	AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_03"); //Pewnego dnia wybra�em si� na plac wymian, gdy na mej drodze stan�a wataha wilk�w. Wola�em ratowa� si� ucieczk�, ni� zgin�� w walce z tymi bestiami. 
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_04"); //Niestety, podczas ucieczki zgubi�em m�j pierwszy miecz. Nie jest wiele warty, ale ma dla mnie warto�� sentymentaln�.
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_POMOGE_15_05"); //W porz�dku, spr�buj� go odnale��.
    MIS_JimsSword = LOG_RUNNING;

    Log_CreateTopic            		(CH1_JimsSword, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_JimsSword, LOG_RUNNING);
    B_LogEntry                      (CH1_JimsSword,"Mam odnale�� miecz Jima, kt�ry zgubi� nieopodal placu wymian. To nie powinno by� zbyt trudne...");
    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Jim_OBIETNICA_NIE_DAM()
{
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_NIE_DAM_15_01"); //Nie zamierzam ci pomaga�.
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_NIE_DAM_03_02"); //Zap�acisz mi za to, oszu�cie.
    B_LogEntry                     (CH1_JimsSword,"Naiwny Jim naprawd� uwierzy�, �e mu pomog�. Mimo wszystko z�ama�em dane s�owo, wi�c musz� pogodzi� si� z pora�k�.");
    Log_SetTopicStatus       (CH1_JimsSword, LOG_FAILED);
    MIS_JimsSword = LOG_FAILED;
    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> SWORD_MAM
//========================================

INSTANCE DIA_Jim_SWORD_MAM (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 2;
   condition    = DIA_Jim_SWORD_MAM_Condition;
   information  = DIA_Jim_SWORD_MAM_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em tw�j miecz.";
};

FUNC INT DIA_Jim_SWORD_MAM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jim_OBIETNICA))
    && (MIS_JimsSword == LOG_RUNNING)
    && (Npc_HasItems (other, ALTESSCHWERT) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_SWORD_MAM_Info()
{
    AI_Output (other, self ,"DIA_Jim_SWORD_MAM_15_01"); //Odnalaz�em tw�j miecz.
    AI_Output (self, other ,"DIA_Jim_SWORD_MAM_03_02"); //Dzi�kuj� ci, we� ten eliksir.
    B_LogEntry                     (CH1_JimsSword,"Odnalaz�em miecz Jima i trafi� on ju� w jego r�ce. Wywi�za�em si� tym samym z obietnicy, jak� mu niegdy� z�o�y�em.");
    Log_SetTopicStatus       (CH1_JimsSword, LOG_SUCCESS);
    MIS_JimsSword = LOG_SUCCESS;

    B_GiveXP (50);
    CreateInvItems (self, ItFo_Potion_Health_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 1);
	B_GiveInvItems (hero, self, ALTESSCHWERT, 1);
	Npc_RemoveInvItems (self, ALTESSCHWERT, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zlecenie
//========================================

INSTANCE DIA_Jim_Zlecenie (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 2;
   condition    = DIA_Jim_Zlecenie_Condition;
   information  = DIA_Jim_Zlecenie_Info;
   permanent	= FALSE;
   description	= "Szukam zlecenia.";
};

FUNC INT DIA_Jim_Zlecenie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_JIM_Hello))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Jim_Zlecenie_Info()
{
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_01"); //Szukam zlecenia.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_02"); //Chcesz pom�c magom? Mam ma�e zadanie. M�g�bym ci je odst�pi�.
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_03"); //Zamieniam si� w s�uch. 
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_04"); //Trzeba zaj�� si� starym o�tarzem Beliara w jaskini za Obozem. O�tarz zosta� sprofanowany przez kilku Kopaczy.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_05"); //Taki sprofanowany o�tarz jest bardzo niebezpieczny. Nie mo�emy dopu�ci�, �eby zal�gli si� tu nieumarli.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_06"); //Dam ci butelk� wody �wi�conej. Id� do o�tarza i pokrop go wod�.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_07"); //Aha. Zajrzyj te� na stary cmentarz. Obawiam si�, �e i tam dotarli.
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_08"); //Gdzie znajd� ten cmentarz?
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_09"); //Cmentarz poleg�ych Kopaczy znajduje si� nad Opuszczon� Kopalni�. 
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_10"); //Le�� tam g��wnie ci, kt�rzy zgin�li w katastrofie. 
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_11"); //Rozumiem.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_12"); //No. Masz t� wod� i wr�� jak sko�czysz. 
    B_Story_JimQuest ();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUEST_END1
//========================================

INSTANCE DIA_Jim_QUEST_END1 (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_QUEST_END1_Condition;
   information  = DIA_Jim_QUEST_END1_Info;
   permanent	= FALSE;
   description	= "Zrobi�em co kaza�e�.";
};

FUNC INT DIA_Jim_QUEST_END1_Condition()
{
    if (MIS_ZlecenieJima == LOG_RUNNING)
	// ORYGINA�(Npc_KnowsInfo (hero, DIA_Jim_NOVIZE))
    && (kaplica_oczyszczona == true)
    && (Npc_IsDead(NON_7501_Opetany_Kopacz))
    && (Npc_IsDead(NON_7504_Opetany_Kopacz))
    && (Npc_IsDead(NON_7503_Opetany_Kopacz))
	&& (Npc_IsDead(NON_7502_Opetany_Kopacz))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_QUEST_END1_Info()
{
    AI_Output (other, self ,"DIA_Jim_QUEST_END1_15_01"); //Oczy�ci�em o�tarz i pozby�em si� Kopaczy z cmentarza.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_02"); //Naprawd�? Jestem pod wra�eniem.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_03"); //Chyba �le ci� oceni�em. We� te sto bry�ek rudy w nagrod�.
	B_Story_JimQuest_Success ();
	/*	if (Npc_GetTrueGuild(hero) == GIL_NONE) 
	{
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_04"); //No dobrze. Dam ci specjalny pier�cie�.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_05"); //Oka� go Thorusowi, a zostaniesz wpuszczony za bram�. 
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_06"); //Nast�pnie pogadaj z Torrezem. 
	*/
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_07"); //Aha! Mam do ciebie jeszcze jedno pytanie. Znalaz�e� co� przy starym o�tarzu? 
	Info_ClearChoices		(DIA_Jim_QUEST_END1);
    Info_AddChoice		(DIA_Jim_QUEST_END1, "Nic nie znalaz�em.", DIA_Jim_QUEST_END1_NIE);
	if  (Npc_HasItems (hero, StoneOfKnowledge) >=1) 
	{
    Info_AddChoice		(DIA_Jim_QUEST_END1, "Mam tu dziwny kamie�.", DIA_Jim_QUEST_END1_TAK);
	};
   // B_LogEntry                     (CH1_FireNovize,"Uda�o mi si� przekona� do siebie Jima. Dosta�em pier�cie� dzi�ki kt�remu Stra�nicy przy bramie nie b�d� mi robi� k�opot�w. Mam si� skontaktowa� z Torrezem.  ");
    
    //AI_StopProcessInfos	(self);
   // CreateInvItems (self, it_firering, 1);
   // B_GiveInvItems (self, other, it_firering, 1);
	/*}
	else
	{
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_06"); //Niestety w mi�dzyczasie do��czy�e� do innej gildii. No c�...
	B_GiveXP (350);
	MIS_Fire_Novize = LOG_FAILED;
	Log_SetTopicStatus       (CH1_Fire_Novize, LOG_FAILED);
    B_LogEntry               (CH1_Fire_Novize,"Pomimo i� wykona�em zadanie, jest ju� za p�no na do��czenie do kurier�w mag�w.");

	};*/
};

func void DIA_Jim_QUEST_END1_NIE ()
{
AI_Output (other, self ,"DIA_Jim_QUEST_END1_NIE_15_01"); //Nic nie znalaz�em.
AI_Output (self, other ,"DIA_Jim_QUEST_END1_NIE_03_02"); //No dobra. Id� ju�.
Info_ClearChoices		(DIA_Jim_QUEST_END1);
if  (Npc_HasItems (hero, StoneOfKnowledge) >=1) 
{
B_LogEntry                     (CH1_ZlecenieJima,"Jim pyta� czy czasem czego� nie znalaz�em podczas oczyszczania o�tarza. Spos�b w jaki to zapyta� by� dziwny. Gdybym musia� co� znale��, pewnie by mi o tym powiedzia� wcze�niej. Postanowi�em, �e zachowam Kamie� Wiedzy dla siebie.");
}
else
{
B_LogEntry                     (CH1_ZlecenieJima,"Jim pyta� czy czasem czego� nie znalaz�em podczas oczyszczania o�tarza. Nic nie przyku�o mojej uwagi.");
};
};

func void DIA_Jim_QUEST_END1_TAK ()
{
AI_Output (other, self ,"DIA_Jim_QUEST_END1_TAK_15_01"); //Znalaz�em dziwny kamie�.
AI_Output (self, other ,"DIA_Jim_QUEST_END1_TAK_03_02"); //To bardzo niebezpieczny artefakt. Daj mi go.
B_LogEntry   (CH1_ZlecenieJima,"Ledwie wspomnia�em o kamieniu, kt�ry znalaz�em na cmentarzu Kopaczy, a ju� by� on w r�kach Jima. To podejrzane, ale to nie m�j problem.");
 B_GiveInvItems (other, self, StoneOfKnowledge, 1);
 Npc_RemoveInvItems (self, StoneOfKnowledge, 1);
 Info_ClearChoices		(DIA_Jim_QUEST_END1);
};
