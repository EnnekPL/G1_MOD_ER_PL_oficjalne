//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  GRD_261_Brandick_Exit (C_INFO)
{
	npc			=  GRD_261_Brandick;
	nr			= 999;
	condition	=  GRD_261_Brandick_Exit_Condition;
	information	=  GRD_261_Brandick_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  GRD_261_Brandick_ALEPH (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_ALEPH_Condition;
	information		= GRD_261_Brandick_ALEPH_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Wydaj Alepha)"; 
};

FUNC int  GRD_261_Brandick_ALEPH_Condition()
{	
	if ( Npc_KnowsInfo ( hero, VLK_585_Aleph_GUARDS) )
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_ALEPH_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_ALEPH_Info_15_01"); //S�uchaj, za ka�dym razem, kiedy si� odwracasz, Aleph siedzi bezczynnie i zbija b�ki.
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Czy�by?
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Wiesz jakich ludzi nienawidz� jeszcze bardziej od obibok�w? Donosicieli! Zejd� mi z oczu!
	
	AI_StopProcessInfos	(self);
};  

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_HELLO1 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_HELLO1_Condition;
   information  = DIA_brandick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_brandick_HELLO1_Condition()
{
//po co?
   // if (Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
   //{
    //return TRUE;
    //};]
	if (kapitel < 4) 
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_02"); //Brandick. Pilnuj� porz�dku w Kopalni i dbam o to, �eby nasi ludzie si� nie obijali. Masz jaki� problem?
	AI_Output (other, self ,"DIA_brandick_HELLO1_15_03"); //Nie, a ty?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_04"); //Ca�� mas� problem�w. W bocznych szybach roi si� od pe�zaczy i trolli ziemnych. Te skurwiele potrafi� napsu� nerw�w. 
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_05"); //Trolle ziemne? My�la�em, �e trolle nie �yj� pod ziemi�, tylko w g�rach.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_06"); //Zwyk�e i czarne trolle jak najbardziej. Jednak ziemne trolle nieco si� r�ni� od swych pobratymc�w.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_07"); //S� mniejszej postury i lubi� ciemno�ci. Jak b�dziesz mia� pecha, to spotkasz jakiego� w jaskini na powierzchni. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_08"); //To, �e s� mniejsze, nie czyni ich jednak mniej niebezpiecznymi.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_09"); //Jaki� czas temu grupa �wi�tynnych Stra�nik�w wybra�a si�, �eby troch� zredukowa� liczb� tego ta�atajstwa. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_10"); //To, co z nich zosta�o nie nadawa�o si� nawet na naw�z, he he. Chyba przecenili swoje si�y.
};

//========================================
//-----------------> OldTownsman
//========================================

INSTANCE DIA_Brandick_OldTownsman (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_Brandick_OldTownsman_Condition;
   information  = DIA_Brandick_OldTownsman_Info;
   permanent	= FALSE;
   description	= "Podobno kiedy� do Kopalni trafi� pewien zamo�ny mieszczanin.";
};

FUNC INT DIA_Brandick_OldTownsman_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_FingersStayAlive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brandick_OldTownsman_Info()
{
    AI_Output (other, self ,"DIA_Brandick_OldTownsman_15_01"); //Podobno kiedy� do Kopalni trafi� pewien zamo�ny mieszczanin.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_02"); //Trafi�o tu naprawd� wielu, od gwa�cicieli, przez z�odziei, a� po kleryka��w, kt�rym nagle si� co� odwidzia�o.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_03"); //Nie spos�b wszystkich spami�ta�. O kogo konkretnie ci chodzi? 
    AI_Output (other, self ,"DIA_Brandick_OldTownsman_15_04"); //Pono� go�� sfinansowa� zakup pewnego okr�tu, a p�niej okaza�o si�, �e jego fortuna to jeden wielki przekr�t.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_05"); //Ha ha ha. Chodzi ci pewnie o Hrabiego Robena. Kawa� gnoja z niego, ale nie widzia�em go ju� jaki� czas.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_06"); //Nie wiem nawet czy �yje. Kilka razy pr�bowa� ucieka�, nie chcia� pracowa�, podburza� za�og�... 
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_07"); //Jak chcesz pozna� jakie� szczeg�y to zapytaj lepiej Asghana. On jest tu wystarczaj�co d�ugo.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_08"); //Gdy zrzucali tu Robena ja dopiero zaczyna�em s�u�b� i mia�em wa�niejsze sprawy na g�owie.
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_brandick_HELLO2 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 2;
   condition    = DIA_brandick_HELLO2_Condition;
   information  = DIA_brandick_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_brandick_HELLO2_Condition()
{
if (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_brandick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO2_15_01"); //Jak leci?
    if (!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_02"); //S�yszysz? Tam na dole, w dziurze czaj� si� pe�zacze. Mam nadziej�, �e nie towarzysz� im ziemne trolle...
    }
    else
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_03"); //G�wno ci� to obchodzi. Powiedzia�em, �e nie toleruj� donosicieli! Spadaj st�d darmozjadzie!
    
    AI_StopProcessInfos	(self);
};
};

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Brandick_DIE (C_INFO)
{
	npc			= GRD_261_Brandick;
	condition	= Info_Brandick_DIE_Condition;
	information	= Info_Brandick_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Brandick_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Brandick_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomy�le�, �e uwa�ali�my ci� za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Mag�w Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog� ci nawet znajomo�ci w�r�d Cieni!
		};			

		AI_Output		(hero,self,"Info_Brandick_DIE_15_04"); //O czym ty do diab�a m�wisz, Brandick?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz si� z tymi bandziorami z Nowego Obozu! A mo�e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //My�la�e�, �e si� nie domy�limy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada�e� zmys�y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale� sk�d. Za to TY za chwil� stracisz G�OW�, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GI�, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa� si� przy tylnej bramie. Na m�j widok zareagowa� podobnie jak Brandick. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Brandick, kt�ry strze�e teraz g��wnej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No prosz�. To go�� z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To go�� z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jaki� problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mie�, to ja b�d� wasz� ma�� kopalni�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy�by? Chyba �nisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k�opot�w.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by�o o tym pomy�le� zanim tutaj przyszed�e�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch�opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTAKEN2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_261_Brandick,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};