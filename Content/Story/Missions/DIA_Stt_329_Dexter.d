// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (!Wld_IsTime	(02,00,03,00))
	&& (Kapitel < 4)
	&& (MIS_FingersSeeking != LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Sprzedaj� bagienne ziele i r�ne wywary z obozu na bagnach. Mo�e czego� potrzebujesz?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Co to jest 'bagienne ziele'?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	if (Kapitel < 4)
	&& (Npc_KnowsInfo (hero,DIA_Dexter_First))
	&& (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	{
	return 1; 
	};
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co to jest "bagienne ziele"?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jeste� tu nowy, co? Bagienne ziele mo�na pali�. To bardzo odpr�aj�ce.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Poka� mi swoje towary.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	if (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	&& (Kapitel < 4)
	{
	return 1;
	};
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Poka� mi swoje towary.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mam tu tylko towar najwy�szej jako�ci...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC, "Cie� o imieniu Dexter handluje bagiennym zielem i napojami z Obozu Bractwa.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Chcia�bym do��czy� do Obozu. Chc� zosta� Cieniem.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK))  && (Kapitel < 4) 
	//&& ((MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chcia�bym do��czy� do Obozu. Chc� zosta� Cieniem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //O, i szukasz pewnie okazji, �eby pokaza�, na co ci� sta�, tak?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobra - mo�esz wy�wiadczy� mi pewn� przys�ug�. Je�li dobrze si� spiszesz, wstawi� si� za tob� u Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //O co chodzi?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //W obozie Sekty mieszka m�czyzna imieniem Kalom. To wielka szycha - jeden z Guru ca�ej tej pomylonej zgrai.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom jest alchemikiem. Posiada przepis na niezwykle skuteczny nap�j uzdrawiaj�cy.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chcia�bym go od niego odkupi�, wtedy sam m�g�bym zacz�� produkcj� tego napoju.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ale do Kaloma trudno si� zbli�y�, zw�aszcza ludziom z zewn�trz.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A czego oczekujesz ode mnie?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Te �wiry z Sekty bez przerwy szukaj� nowych ludzi. Jeste� tu nowy, nikt ci� nie zna. Udawaj, �e chcesz do nich do��czy�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom jest jednym z Guru, wi�c to on sprawdza nowych kandydat�w. Je�li uda ci si� z nim spotka�, spr�buj zdoby� dla mnie t� receptur�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Czy za ni� zap�acisz, czy nie - to ju� nie moja sprawa.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Dobrze, zobacz� co si� da zrobi�."						,DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "To nie b�dzie �atwe. Co b�d� z tego mia�?"	,DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobrze, zobacz� co si� da zrobi�.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cie� z targowiska, kaza� mi odwiedzi� Guru Kaloma w obozie sekty i zdoby� pewn� receptur�.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi� mi, �ebym udawa� sympatyka Sekty �ni�cego.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //To nie b�dzie �atwe. Co b�d� z tego mia�?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Pr�dzej czy p�niej Diego zapyta mnie co o tobie s�dz�. Zgadnij od czego b�dzie zale�a�a moja odpowied�.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Mo�e b�d� mu musia� zap�aci� za t� receptur�. Potrzebuj� 50 bry�ek rudy."	,DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Mo�e b�d� mu musia� zap�aci� za t� receptur�. Potrzebuj� 50 bry�ek rudy jako zaliczk�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Nie ma mowy.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie ma rudy - nie ma receptury!"	,DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Nie ma rudy - nie ma receptury!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //No dobra, ale o rudzie porozmawiamy jak b�dziesz mia� receptur� w r�ku.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie! Albo zap�acisz mi z g�ry, albo sam sobie id� na bagno."	,DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nie! Albo zap�acisz mi z g�ry, albo sam sobie id� do obozu na bagnie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Jest tu wielu ��todziob�w. Chyba jednak zlec� to zadanie komu� innemu...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "�wietnie! Zapomnijmy o ca�ej sprawie."	,DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //�wietnie! Zapomnijmy o ca�ej sprawie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Zaraz, powoli! Chcia�em tylko zobaczy�, jak daleko si� posuniesz... 50 bry�ek to troch� du�o jak na ��todzioba, nie s�dzisz?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To ju� lepiej...
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //A niech ci� szlag! Masz tu swoje 50 bry�ek! Tylko nie pr�buj mnie wykiwa�, ma�y!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cie� z targowiska, kaza� mi odwiedzi� Guru Kaloma w obozie Sekty i zdoby� pewn� receptur�.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi� mi, �ebym udawa� sympatyka Sekty �ni�cego.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 0;
	description	= "Gdzie jest ten ca�y ob�z na bagnie?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Gdzie jest ten ca�y ob�z na bagnie?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Wyjd� z Zewn�trznego Pier�cienia przez po�udniow� bram�, potem skieruj si� na wsch�d. Najlepiej b�dzie, jak we�miesz map�...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Bj�rn
		{																						//Bj�rn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mam tu jedn�. Kosztuje 50 bry�ek...
		};																						//Bj�rn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Po�udniowa brama to ta przy zawalonej wie�y, tak?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Dok�adnie.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Ob�z Sekty le�y na wsch�d od Starego Obozu.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Mam dla ciebie receptur�, o kt�r� prosi�e�!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mam dla ciebie receptur�, o kt�r� prosi�e�!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //To �wietnie! Poka� j�!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Znakomicie! Teraz sam b�d� m�g� wytwarza� nap�j uzdrawiaj�cy.
	if ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //R�wny z ciebie ch�op! Wspomn� o tobie Diego.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //We� to. To w nagrod�...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by� pod wra�eniem. Na pewno wspomni Diego o moich dokonaniach.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by� pod wra�eniem, ale co z tego? I tak nie mog� ju� zosta� Cieniem.");
	};
	B_GiveXP (XP_DexterKalom);
	
	}
	else
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //We� to jako swoj� nagrod�...
	
	CreateInvItems (other,itminugget,50);
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	};
};

//========================================
//-----------------> Iglica
//========================================

INSTANCE DIA_Dexter_Iglica (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Iglica_Condition;
   information  = DIA_Dexter_Iglica_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� ro�liny zwanej iglic�.";
};

FUNC INT DIA_Dexter_Iglica_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_MessengerIngredients))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Iglica_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Iglica_15_01"); //Potrzebuj� ro�liny zwanej iglic�.
    AI_Output (self, other ,"DIA_Dexter_Iglica_03_02"); //To dobrze. 
    AI_Output (other, self ,"DIA_Dexter_Iglica_15_03"); //Jestem got�w sporo zap�aci�. 
    AI_Output (self, other ,"DIA_Dexter_Iglica_03_04"); //Nie w�tpi�. Spotka� t� ro�lin� u kogokolwiek teraz jest r�wne z cudem. Musisz poczeka� kilka miesi�cy.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_05"); //Zatem do zobaczenia.
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_06"); //Tak si� jednak sk�ada, �e mam ostatni zasuszony okaz. B�dzie on kosztowa� 250 bry�ek rudy i wizyt� w Nowym Obozie.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_07"); //Po co?
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_08"); //Dasz moj� przesy�k� pewnemu Szkodnikowi z Nowego Obozu imieniem Cipher. 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_09"); //Powiedz mu, �e je�li jeszcze raz przy�le tu kogo�, kto b�dzie podbiera� mi klient�w to gorzko tego po�a�uje.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_10"); //Daj t� paczk�. 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_11"); //Trzymaj. Pospiesz si�.
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_12"); //Co tak cuchnie?
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_13"); //G�wno. Dos�ownie. 
	AI_Output (other, self ,"DIA_Dexter_Iglica_15_14"); //Ciekawe... Z zewn�trz wygl�da jak dostawa skr�t�w. Dlaczego sam mu tego nie dostarczysz? 
	AI_Output (self, other ,"DIA_Dexter_Iglica_03_15"); //Je�li chcesz �eby�my dobili targu, to mu to przeka�esz. W razie czego zwiewaj szybko. 
	
	B_LogEntry(CH2_MessengerRecall, "To ju� robi si� naprawd� durne. Dexter chce, aby dostarczy� Cipherowi z Nowego Obozu pewn� �mierdz�c� przesy�k�. Dopiero wtedy sprzeda mi zio�o za 250 bry�ek rudy.");
	
	CreateInvItems (self, ItMi_FakeJoints, 1);
	B_GiveInvItems (self,other, ItMi_FakeJoints,1);
};

//========================================
//-----------------> Gunwo
//========================================

INSTANCE DIA_Dexter_Gunwo (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Gunwo_Condition;
   information  = DIA_Dexter_Gunwo_Info;
   permanent	= FALSE;
   description	= "Dostarczy�em przesy�k�.";
};

FUNC INT DIA_Dexter_Gunwo_Condition()
{
    if (Npc_KnowsInfo (hero, Org_873_Cipher_Gunwo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Gunwo_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Gunwo_15_01"); //Dostarczy�em przesy�k�.
    AI_Output (self, other ,"DIA_Dexter_Gunwo_03_02"); //Jak ci si� podoba�o zlecenie?
    AI_Output (other, self ,"DIA_Dexter_Gunwo_15_03"); //G�wniane... 
    AI_Output (self, other ,"DIA_Dexter_Gunwo_03_04"); //Ha ha ha... Dobrze powiedziane. 
	AI_Output (other, self ,"DIA_Dexter_Gunwo_15_05"); //Sprzedasz mi wreszcie ten cholerny li��?
	AI_Output (self, other ,"DIA_Dexter_Gunwo_03_06"); //Tak, tak. Nawet obni�� cen�. 200 bry�ek rudy i jest twoja. 
	
	B_LogEntry(CH2_MessengerRecall, "Dextera tak rozbawi�a moja satyra, �e z �aski swojej obni�y� cen� za iglic� o 50 bry�ek rudy. ");
};

//========================================
//-----------------> GivePlant
//========================================

INSTANCE DIA_Dexter_GivePlant (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_GivePlant_Condition;
   information  = DIA_Dexter_GivePlant_Info;
   permanent	= FALSE;
   description	= "Dawaj t� ro�lin�.";
};

FUNC INT DIA_Dexter_GivePlant_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_Gunwo)) && (Npc_HasItems ( hero, itminugget ) >= 200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_GivePlant_Info()
{
    AI_Output (other, self ,"DIA_Dexter_GivePlant_15_01"); //Dawaj t� ro�lin�.
    AI_Output (self, other ,"DIA_Dexter_GivePlant_03_02"); //Oto ona. 
    AI_Output (other, self ,"DIA_Dexter_GivePlant_15_03"); //Dzi�ki. 
   
	CreateInvItems (self, ItFo_Plants_Iglica, 1);
	B_GiveInvItems (self,other, ItFo_Plants_Iglica,1);
	
	B_GiveInvItems (hero,self, itminugget,200);
	
	B_LogEntry(CH2_MessengerRecall, "Kupi�em ro�lin�. Mog� wraca� do Bractwa. ");
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
//////////////////////////////////////////////

//========================================
//-----------------> SellElixer
//========================================

INSTANCE DIA_Dexter_SellElixer (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_SellElixer_Condition;
   information  = DIA_Dexter_SellElixer_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wn�trzno�ci pe�zaczy?";
};

FUNC INT DIA_Dexter_SellElixer_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_SellElixer_Info()
{
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_01"); //Sprzedajesz eliksir z wn�trzno�ci pe�zaczy?
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_02"); //Jasne! To nowy towar. Widz�, �e jeste� zainteresowany.
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_03"); //Bardziej mnie interesuje, kto ci go sprzeda�?  
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_04"); //To nie twoja sprawa.
	AI_DrawWeapon (hero);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_05"); //Jak zrobisz jak�� burd�, to natychmiast wezw� Stra�nik�w i zrobi� ci z dupy Nowy Ob�z.
    AI_RemoveWeapon (other);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_06"); //Po prostu st�d spadaj. Chyba, �e co� bierzesz...
	
    B_LogEntry                     (CH3_SellElixer,"Okazuje si�, �e Dexter tak�e ma w swojej ofercie nasz eliksir. Jednak nie uda�o mi si� ustali�, od kogo go skupuje.");
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Dexter_Angry (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Angry_Condition;
   information  = DIA_Dexter_Angry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dexter_Angry_Condition()
{
    if (CaineFriend == false)
    && (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Angry_Info()
{
    AI_Output (self, other ,"DIA_Dexter_Angry_03_01"); //Gdzie moja dostawa eliksir�w?
    AI_Output (other, self ,"DIA_Dexter_Angry_15_02"); //Ju� nigdy jej nie zobaczysz. Mo�na powiedzie�, �e Caine wstrzyma� dzia�alno��.
    AI_Output (other, self ,"DIA_Dexter_Angry_15_03"); //Ty sukinsynu! Kiedy� mi za to zap�acisz.
    AI_Output (self, other ,"DIA_Dexter_Angry_03_04"); //Id� precz!
    AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////////
//  CSI: KRYMINALNE ZAGADKI STAREGO OBOZU
/////////////////////////////////////////////////////

//========================================
//-----------------> CSI_SO
//========================================

INSTANCE DIA_Dexter_CSI_SO (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_CSI_SO_Condition;
   information  = DIA_Dexter_CSI_SO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dexter_CSI_SO_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_CSI_SO_Info()
{
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_03_01"); //Dobrze, �e ci� widz�! Mamy razem prowadzi� �ledztwo zwi�zane z zagini�ciem R�czki.
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_15_02"); //Ju� rozmawia�em na ten temat z Diego. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_03_03"); //To �wietnie. Od czego zaczynamy? 

    Info_ClearChoices		(DIA_Dexter_CSI_SO);
    Info_AddChoice		(DIA_Dexter_CSI_SO, "Znalaz�e� co� w chacie? Jakie� poszlaki? ", DIA_Dexter_CSI_SO_HUT);
    Info_AddChoice		(DIA_Dexter_CSI_SO, "Kto mo�e za tym sta�? Czy R�czka mia� jaki� wrog�w? ", DIA_Dexter_CSI_SO_MOTYW);
};
var int hero_choice_dexter;
FUNC VOID DIA_Dexter_CSI_SO_HUT()
{
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_HUT_15_01"); //Znalaz�e� co� w chacie? Jakie� poszlaki? 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_02"); //Przyjrza�em si� troch� gratom wewn�trz. Nic nadzwyczajnego, masa �mieci i troch� kosztowno�ci. Jest jednak co�, co przyku�o moj� uwag�. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_03"); //To ma�a, solidnie zabezpieczona skrzynka. Pr�bowa�em j� otworzy�, ale bez klucza nic nie wsk�ramy. 
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_HUT_15_04"); //Sk�d wiesz, �e w �rodku nie znajdziemy kolejnych grat�w?
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_HUT_03_05"); //Nie przekonamy si� dop�ki jej nie otworzymy. 

    B_LogEntry                     (CH2_FingersSeeking,"Dexter znalaz� w chacie R�czki ma�� solidnie zamkni�t� skrzynk�. Musz� spr�bowa� poszuka� do niej klucza.");
	
	Wld_InsertItem (ItMis_KeyFingers,"OC_MIS_SPAWNKEYFINGERS");
	if hero_choice_dexter == false
	{
	hero_choice_dexter = true;
	}
	else
	{
	Info_ClearChoices		(DIA_Dexter_CSI_SO);
	AI_StopProcessInfos	(self);
	};
};

FUNC VOID DIA_Dexter_CSI_SO_MOTYW()
{
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_MOTYW_15_01"); //Kto mo�e za tym sta�? Czy R�czka mia� jakich� wrog�w? 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_MOTYW_03_02"); //Nie wiem, by� mo�e. R�czka by� w ko�cu z�odziejem. M�g� komu� podpa��. 
    AI_Output (self, other ,"DIA_Dexter_CSI_SO_MOTYW_03_03"); //Musia�by� zapyta� o to Diego. Dobrze si� znali. 
    AI_Output (other, self ,"DIA_Dexter_CSI_SO_MOTYW_15_04"); //W takim razie p�jd� z nim pogada�.
	
    B_LogEntry                     (CH2_FingersSeeking,"Nie wiemy, czy R�czka mia� jaki� wrog�w. Musz� spyta� o to Diego, kt�ry go dobrze zna.");

	if hero_choice_dexter == false
	{
	hero_choice_dexter = true;
	}
	else
	{
	Info_ClearChoices		(DIA_Dexter_CSI_SO);
	AI_StopProcessInfos	(self);
	};
};

//========================================
//-----------------> FindKey
//========================================

INSTANCE DIA_Dexter_FindKey (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_FindKey_Condition;
   information  = DIA_Dexter_FindKey_Info;
   permanent	= FALSE;
   description	= "Znalaz�em w chacie ten klucz.";
};

FUNC INT DIA_Dexter_FindKey_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING) && (Npc_HasItems(other,ItMis_KeyFingers) >= 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_FindKey_Info()
{
    AI_Output (other, self ,"DIA_Dexter_FindKey_15_01"); //Znalaz�em w chacie ten klucz.
    AI_Output (self, other ,"DIA_Dexter_FindKey_03_02"); //Daj mi go. Powinien pasowa�. 
	B_GiveInvItems (other,self,itmis_keyfingers,1);
	Npc_removeinvitems (self, itmis_keyfingers,1);
	B_GiveXP (20);
	//#ToDO Doda� efekt �ciemnienia ekranu  
	
	AI_Output (self, other ,"DIA_Dexter_FindKey_03_03"); //Hmmm... To jaki� notatnik. Przejrzyj go. Mo�e znajdziemy tu jakie� wskaz�wki. 
	B_GiveInvItems (self,other,ItMis_FingersSecretBook,1);
	
	B_LogEntry                     (CH2_FingersSeeking,"Znalaz�em w chacie znalaz�em klucz, kt�ry powinien pasowa� do skrzynki. Wewn�trz niej by� pami�tnik R�czki. Musz� go przeczyta�. By� mo�e znajd� tam co�, co mnie naprowadzi.");
};

//========================================
//-----------------> ReadBook
//========================================

INSTANCE DIA_Dexter_ReadBook (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_ReadBook_Condition;
   information  = DIA_Dexter_ReadBook_Info;
   permanent	= FALSE;
   description	= "Przeczyta�em notatnik R�czki.";
};

FUNC INT DIA_Dexter_ReadBook_Condition()
{
    if (MIS_FingersSeeking == LOG_RUNNING) && (ItemUsed_FingersSecretBook == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_ReadBook_Info()
{
    AI_Output (other, self ,"DIA_Dexter_ReadBook_15_01"); //Przeczyta�em notatnik R�czki.
    AI_Output (self, other ,"DIA_Dexter_ReadBook_03_02"); //Dowiedzia�e� si� czego�?
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_03"); //R�czka najprawdopodobniej wybra� si� do Nowego Obozu okra�� karczm� Silasa. Tam powinni�my go szuka�.
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_04"); //Chcia� okra�� karczm� pe�n� Szkodnik�w? W takim razie na pewno ju� nie �yje.
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_05"); //Tego jeszcze nie wiemy. Udam si� do Nowego Obozu i poszukam o nim informacji.
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_06"); //Powodzenia. Ja nie mog� z tob� p�j��. Szkodnicy urwali by mi �eb. W Nowym Obozie nas nienawidz�. 
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_07"); //M�g�by� mi powiedzie� co�, czego jeszcze nie wiem? Takie og�lniki niewiele mi pomog�. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_08"); //S�uchaj, je�li chcesz zna� moje zdanie to ta gra jest nie warta �wieczki. Ten kretyn pewnie ju� nie �yje. Nie ma sensu nadstawia� za niego karku. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_09"); //Sam zgotowa� sobie taki los. Wiedzia� na co si� porywa.
	AI_Output (other, self ,"DIA_Dexter_ReadBook_15_10"); //Diego chce, abym go odnalaz�. 
	AI_Output (self, other ,"DIA_Dexter_ReadBook_03_11"); //Widz�, �e ci� nie przekonam. Masz tu 50 bry�ek rudy. Je�li kto� b�dzie chcia� ci� obi�, lepiej zap�a�. Tylko tak mog� ci pom�c.
	
	CreateInvItems (self,itminugget,50);
	B_GiveInvItems (self,other,itminugget,50);
	
	B_LogEntry                     (CH2_FingersSeeking,"Pomoc Dextera w tym momencie si� ko�czy. M�j dotychczasowy pomocnik uwa�a, �e R�czka na pewno nie �yje, a p�j�cie do Nowego Obozu to samob�jstwo. By�em ju� kilka razy w Nowym Obozie, wi�c to dla mnie nie pierwszyzna. Wypytam o naszego zaginionego Cienia i wr�c� do Diego.");
	
	Npc_ExchangeRoutine (self,"start");
};

//////////////////////////////////////////////
//	Zadanie: Nowe ziele
//////////////////////////////////////////////

//========================================
//-----------------> NovizeJoints
//========================================

INSTANCE DIA_Dexter_NovizeJoints (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_NovizeJoints_Condition;
   information  = DIA_Dexter_NovizeJoints_Info;
   permanent	= FALSE;
   description	= "Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.";
};

FUNC INT DIA_Dexter_NovizeJoints_Condition()
{
    if (MIS_NewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_NovizeJoints_Info()
{
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_02"); //Doprawdy? Nowicjusze? Czy Guru wiedz� o tym zielu.
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_03"); //C�...
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_04"); //Tak my�la�em. Wsp�pracuj� z wysoko po�o�onymi i szanowanymi cz�onkami Bractwa. Baal Parvez i Baal Taran ci�gle patrz� mi na r�ce. 
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_05"); //Nie mam zamiaru ryzykowa� moich dobrych kontakt�w...

    B_LogEntry                     (CH1_NewWeed,"Dexter nie jest zainteresowany naszym towarem. �ci�le wsp�pracuje z innymi Nowicjuszami.");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kapitel4_dialog
//========================================

INSTANCE DIA_Dexter_Kapitel4_dialog (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Kapitel4_dialog_Condition;
   information  = DIA_Dexter_Kapitel4_dialog_Info;
   permanent	= FALSE;
   description	= "Wci�� sprzedajesz bagienne ziele?";
};

FUNC INT DIA_Dexter_Kapitel4_dialog_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Kapitel4_dialog_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_01"); //Wci�� sprzedajesz bagienne ziele?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_02"); //Ju� nie. Po tym jak zostali zamordowani Magowie Ognia, urwa� mi si� kontakt z Bractwem.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_03"); //Straci�em dostawc�w. Nie mia�em wyboru i musia�em zwin�� interes.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_04"); //Teraz jestem zwiadowc� Kruka i jego lew� r�k�.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_05"); //Kto� jeszcze si� liczy?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_06"); //Bloodwyn, ale jego na razie tu nie ma. Za�atwia porachunki w Obozie.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_07"); //Czym sobie zas�u�y�e� na ten zaszczyt?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_08"); //Dobrze si� sprawowa�em. To dzi�ki moim poradom Kruk zabra� ze sob� Toma. Taki cz�owiek bardzo nam si� przyda.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_09"); //Ponadto szef darzy mnie wielkim zaufaniem.
};

