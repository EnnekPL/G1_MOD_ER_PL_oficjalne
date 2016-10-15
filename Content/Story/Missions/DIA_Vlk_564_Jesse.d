//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Co s�ycha�?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jeste� tu nowy, co? Zapami�taj sobie, �eby nigdy nie w�azi� w drog� Stra�nikom.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Jak za��daj� od ciebie pieni�dzy - zap�a�. Inaczej �ci�gniesz sobie na g�ow� po�ow� Obozu.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! S�ysza�em, �e nie chcesz p�aci� Bloodwynowi za ochron�!
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Chc� ci� ostrzec! Bloodwyn zap�aci� paru ludziom, �eby ci� za�atwili.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Widzia�em, jak rozmawia� z paroma osobami, na przyk�ad z tamtym go�ciem, Herekiem. B�g wie, kogo jeszcze wynaj��!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Je�li chodzi o Hereka, to twoje ostrze�enie jest nieco sp�nione.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Na pewno rozmawia� z kim� jeszcze, mo�esz mi wierzy�. Uwa�aj na siebie.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Dlaczego opowiedzia�e� mi o Bloodwynie?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Warn)) //g1210 fixed
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Dlaczego opowiedzia�e� mi o Bloodwynie?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Bo za przys�ug� nale�y si� przys�uga. Jeste� m�drym ch�opcem. Chyba si� rozumiemy?
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //JA wy�wiadczy�em ci w�a�nie przys�ug�, wi�c teraz TWOJA kolej, �eby mi si� odwdzi�czy�!
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Nie jestem ci nic winien!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co dok�adnie masz na my�li?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nie jestem ci nic winien!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Wi�c nie mamy o czym m�wi�!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co dok�adnie masz na my�li?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Nie mam ju� rudy, a Bloodwyn i mnie zaczyna dobiera� si� do ty�ka.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Pomog�em ci, wi�c m�g�by� zap�aci� za mnie te 10 bry�ek, kt�re zalegam, co? Powiedz mu, �e to ode mnie!
	//Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Ja, mia�bym zap�aci� za ciebie? Chyba �nisz!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Zobacz� co si� da zrobi�.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Zobacz� co si� da zrobi�.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Dzi�ki, stary! Ocali�e� mi �ycie! Daj mi zna�, jak ju� wszystko za�atwisz, dobra?
	Jesse_PayForMe = LOG_RUNNING;
	Log_CreateTopic(CH1_HelpJesse, LOG_MISSION); //fix
	Log_SetTopicStatus       (CH1_HelpJesse, LOG_RUNNING);
    B_LogEntry               (CH1_HelpJesse,"Kopacz Jesse ostrzeg� mnie przed Herekiem i prosi teraz o przys�ug�. Mam zap�aci� za niego 10 bry�ek rudy u Bloodwyna. ");
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Ja, mia�bym zap�aci� za ciebie? Chyba �nisz!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Widz�, �e myli�em si� co do ciebie. W przysz�o�ci nie oczekuj ode mnie pomocy.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Zap�aci�em Bloodwynowi!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Zap�aci�em Bloodwynowi!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? To �wietnie! No to teraz jeste�my kwita.
	//Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	Log_SetTopicStatus       (CH1_HelpJesse, LOG_SUCCESS);
	B_LogEntry               (CH1_HelpJesse,"Sp�aci�em sw�j d�ug u Jesse, mimo �e jego informacja o Hereku by�a nieco sp�niona. No c�, niech si� cieszy. ");
	b_givexp (50);
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COOO??? Wyda�em 10 bry�ek na cynk o kt�rym i tak ju� wiedzia�em?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Dok�adnie. R�ka r�k� myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COOO??? Wyda�em 10 bry�ek na cynk o kt�rym i tak ju� wiedzia�em?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Na to wygl�da.
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Dok�adnie. R�ka r�k� myje.
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
//========================================
//-----------------> NEK
//========================================

INSTANCE DIA_Jesse_NEK (C_INFO)
{
   npc          = Vlk_564_Jesse;
   nr           = 8;
   condition    = DIA_Jesse_NEK_Condition;
   information  = DIA_Jesse_NEK_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zab�jstwie Neka?";
};

FUNC INT DIA_Jesse_NEK_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_NEK_Info()
{
    AI_Output (other, self ,"DIA_Jesse_NEK_15_01"); //Co wiesz o zab�jstwie Neka?
    AI_Output (self, other ,"DIA_Jesse_NEK_03_02"); //Czemu tak w�szysz? Dla kogo pracujesz?
    AI_Output (other, self ,"DIA_Jesse_NEK_15_03"); //Na pewno nie dla Z�ego. S�ysza�em, �e kto� st�d by� �wiadkiem, ale to ukrywa. 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_04"); //Po co ci �wiadek? 
    AI_Output (other, self ,"DIA_Jesse_NEK_15_05"); //Chc�, �eby przedstawi� wszystko Thorusowi. Musz� ubrudzi� Z�ego w b�ocie, je�li wiesz co mam na my�li.
    AI_Output (self, other ,"DIA_Jesse_NEK_03_06"); //Rozumiem. To faktycznie by� Z�y. Nie wiem sk�d o tym wiesz, ale dam ci rad�. Dop�ki siepacze Z�ego terroryzuj� okolic�, nikt ci nic nie po�wiadczy.
    AI_Output (other, self ,"DIA_Jesse_NEK_15_07"); //Dlaczego wcze�niej nie powiedzieli�cie? 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_08"); //To dzia�o si� bardzo szybko. My�leli�my o tym, ale te dwa zbiry pojawi�y si� z dnia na dzie�. Nie wiem sk�d on ich wytrzasn��. 
    AI_Output (other, self ,"DIA_Jesse_NEK_15_09"); //Kto jeszcze o tym wie?
    AI_Output (self, other ,"DIA_Jesse_NEK_03_10"); //Poza mn� tylko Kyle i Tippler. Mo�e oni ci opowiedz� jak to by�o. Ja nie mam zamiaru. Przynajmniej do czasu, a� tych dw�ch nie przestanie czyha� na moje �ycie. 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_11"); //Poza tym Kyle chyba woli siedzie� cicho. Ca�a ta sytuacja by�a do�� dwuznaczna.
    AI_Output (other, self ,"DIA_Jesse_NEK_15_12"); //Lepiej trzymaj ju� j�zyk za z�bami. 
    B_LogEntry                     (CH1_SpysProblems,"Kopacze s� zastraszani przez Z�ego. Wynaj�� siepaczy, aby terroryzowali okolic�. Poza Jesse o zab�jstwie wiedz� tak�e Tippler i Kyle.");
	HeroKnowsSlyKillNek = true;
};
//========================================
//-----------------> OKKKKKKK
//========================================

INSTANCE DIA_Jesse_OKKKKKKK (C_INFO)
{
   npc          = Vlk_564_Jesse;
   nr           = 7;
   condition    = DIA_Jesse_OKKKKKKK_Condition;
   information  = DIA_Jesse_OKKKKKKK_Info;
   permanent	= FALSE;
   description	= "Pozby�em si� twoich k�opot�w.";
};

FUNC INT DIA_Jesse_OKKKKKKK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jesse_NEK))
    && (MIS_SpysProblems == LOG_RUNNING)
	&& (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_OKKKKKKK_Info()
{
    AI_Output (other, self ,"DIA_Jesse_OKKKKKKK_15_01"); //Pozby�em si� twoich k�opot�w.
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_02"); //Twierdzisz, �e zabi�e� tych dryblas�w?
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_03"); //Zaczynam si� ciebie ba�. Nie wiem, czy ci pomog�.
    AI_Output (other, self ,"DIA_Jesse_OKKKKKKK_15_04"); //Ostatnio �piewa�e� inaczej. 
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_05"); //Dobra, dobra. P�jd� do Thorusa.
    B_LogEntry                     (CH1_SpysProblems,"Jesse potwierdzi zab�jstwo Neka Thorusowi.");
    AI_StopProcessInfos	(self);
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================
INSTANCE DIA_Jesse_Eskel (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 2;
   condition    = DIA_Jesse_Eskel_Condition;
   information  = DIA_Jesse_Eskel_Info;
   important	= TRUE;
   description	= ".";
};

FUNC INT DIA_Jesse_Eskel_Condition()
{
   if (Npc_KnowsInfo(other, DIA_Uscan_Flour) && (UscanDay <= Wld_GetDay()))
   {
		return TRUE;
   };
};

FUNC VOID DIA_Jesse_Eskel_Info()
{
   AI_Output (self, other ,"DIA_Jesse_Eskel_03_00"); //Ha ha ha... S�ysza�e�?
   AI_Output (other, self ,"DIA_Jesse_Eskel_15_01"); //Co takiego?
	AI_Output (self, other ,"DIA_Jesse_Eskel_03_02"); //Kto� dosypa� Eskelowi piasku do m�ki zupe�nie jak on za dawnych czas�w.
	AI_Output (self, other ,"DIA_Jesse_Eskel_03_03"); //Dra� upiek� sobie taki chleb i zawy� z b�lu, trac�c z�by, gdy spr�bowa� go ugry��.
	AI_Output (other, self ,"DIA_Jesse_Eskel_15_04"); //C�, kto mieczem wojuje, ten od miecza ginie.
	
	B_LogEntry(CH1_WhoeverPoursSand, "Uda�o si�! Od Jesse dowiedzia�em si�, �e Eskel ma teraz problemy z uz�bieniem. Intryga si� powiod�a.");
};

//========================================
//-----------------> ucieczka
//========================================

INSTANCE DIA_Jesse_ucieczka (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 1;
   condition    = DIA_Jesse_ucieczka_Condition;
   information  = DIA_Jesse_ucieczka_Info;
   permanent	= FALSE;
   description	= "Uciek�e� ze Starego Obozu?";
};

FUNC INT DIA_Jesse_ucieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Jesse_ucieczka_15_01"); //Uciek�e� ze Starego Obozu?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_02"); //A co mia�em innego do wyboru?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_03"); //Zosta� s�ugusem Gomeza i tyra� w Opuszczonej Kopalni?!
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_04"); //Powiem ci, �e tu te� nie jest najlepiej. 
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_05"); //Nawet nie chcieli mnie wpu�ci� do Obozu. 
    AI_Output (other, self ,"DIA_Jesse_ucieczka_15_06"); //Wi�c jakim cudem tu jeste�?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_07"); //Zosta�em zbieraczem.
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_08"); //Najch�tniej to bym st�d zwia� do jakiego� cichego miejsca.
};

//========================================
//-----------------> gotocav
//========================================

INSTANCE DIA_Jesse_gotocav (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 2;
   condition    = DIA_Jesse_gotocav_Condition;
   information  = DIA_Jesse_gotocav_Info;
   permanent	= FALSE;
   description	= "Chod� do Cavalorna!";
};

FUNC INT DIA_Jesse_gotocav_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jesse_ucieczka))
    && (Npc_KnowsInfo (hero, DIA_Cavalorn_Help455675))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_gotocav_Info()
{
    AI_Output (other, self ,"DIA_Jesse_gotocav_15_01"); //Chod� do Cavalorna!
    AI_Output (self, other ,"DIA_Jesse_gotocav_03_02"); //Tego Cienia?
    AI_Output (other, self ,"DIA_Jesse_gotocav_15_03"); //Nie jest ju� Cieniem. Szuka nowego czeladnika.
    AI_Output (self, other ,"DIA_Jesse_gotocav_03_04"); //Hmm. No dobra. Mo�e tam b�dzie mi lepiej.

    Npc_ExchangeRoutine (self,"cava");
    B_LogEntry                     (CH1_NowyVart,"Jesse zgodzi� si� towarzyszy� Cavalornowi.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
