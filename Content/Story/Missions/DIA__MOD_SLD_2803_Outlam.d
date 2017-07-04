// **************************************************
//						 EXIT 
// **************************************************

instance  SLD_2803_Outlam_Exit (C_INFO)
{
	npc			= SLD_2803_Outlam;
	nr			= 999;
	condition	= SLD_2803_Outlam_Exit_Condition;
	information	= SLD_2803_Outlam_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  SLD_2803_Outlam_Exit_Condition()
{
	return 1;
};

FUNC VOID  SLD_2803_Outlam_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////////////
// POGADUCHY
//////////////////////////////////////////////////////

// **************************************************
//				Animaltrophies
// **************************************************

instance  SLD_2803_Outlam_Creatures (C_INFO)
{
	npc			= SLD_2803_Outlam;
	nr			= 1;
	condition	= SLD_2803_Outlam_Creatures_Condition;
	information	= SLD_2803_Outlam_Creatures_Info;
	permanent	= 1;
	description = "Skoro jeste� my�liwym, to pewnie mo�esz mnie czego� nauczy�.";
};                       

FUNC int  SLD_2803_Outlam_Creatures_Condition()
{
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  SLD_2803_Outlam_Creatures_Info()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_15_00"); //Skoro jeste� my�liwym, to pewnie mo�esz mnie czego� nauczy�.
	var int wpis_Outlam;
	if (wpis_Outlam == false)
	{
	wpis_Outlam = 1;
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
    B_LogEntry      (GE_TeacherNC,"Outlam nauczy mnie oprawia� zwierzyn�. Spotkam po drodze z Nowego Obozu do Kot�a.");
	}
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_01"); //Z pewno�ci�, ale nie za darmo. 
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_02"); //Wprawny �owca potrafi zdoby� k�y, pazury i sk�r� zwierzyny. Nie jest to �atwe, ale do�� op�acalne.
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_03"); //Tak czy inaczej ka�dy kupiec ch�tnie je od ciebie odkupi.
		
		Info_ClearChoices(SLD_2803_Outlam_Creatures);
		Info_AddChoice   (SLD_2803_Outlam_Creatures, DIALOG_BACK 													,SLD_2803_Outlam_Creatures_BACK);
		Info_AddChoice   (SLD_2803_Outlam_Creatures, "Du�o ��dasz za swoje us�ugi." 				,SLD_2803_Outlam_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (SLD_2803_Outlam_Creatures, "Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 		,SLD_2803_Outlam_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"		,SLD_2803_Outlam_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 	,SLD_2803_Outlam_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"	,SLD_2803_Outlam_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_TaughtAll_06_00"); //Powiedzia�em ci ju� wszystko co wiem.
	};
};

func void SLD_2803_Outlam_Creatures_BACK()
{
	Info_ClearChoices(SLD_2803_Outlam_Creatures);
};

func void SLD_2803_Outlam_Creatures_PrettyMuch()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_PrettyMuch_15_00"); //Du�o ��dasz za swoje us�ugi.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_01"); //By� mo�e, ale wiedza, kt�r� mog� ci przekaza� pozwoli ci szybko odzyska� zainwestowan� kwot�.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_02"); //Wszystkie zwierz�ta, kt�re zabijesz nie wiedz�c jak je oprawi�, po prostu zgnij�.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich sk�r� m�g�by� zarobi� sporo pieni�dzy.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spr�bowa�bym mo�liwie szybko posi��� te umiej�tno�ci.
};

func void SLD_2803_Outlam_Creatures_Zahn()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_Zahn_15_00"); //Jak mog� zdoby� k�y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiej�tno��: Zdobywanie k��w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Zahn_06_02"); //Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_00"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Fell()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_Fell_15_00"); //Jak mog� zdoby� sk�ry upolowanej zwierzyny? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Fell_06_01"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Fell_06_02"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_01"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiej�tno��: Zdobywanie pazur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"SLD_2803_Outlam_Creatures_Kralle_15_00"); //Poka� mi jak zdoby� pazury upolowanej zwierzyny.  
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Kralle_06_01"); //Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Kralle_06_02"); //Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_02"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"SLD_2803_Outlam_Creatures_Haut_15_00"); //Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Haut_06_01"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Haut_06_02"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_03"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

//////////////////////////////////////////////////////
// ZADANIA
//////////////////////////////////////////////////////

//========================================
//-----------------> CAVALORN_TEST
//========================================

INSTANCE DIA_Outlam_CAVALORN_TEST (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_CAVALORN_TEST_Condition;
   information  = DIA_Outlam_CAVALORN_TEST_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o tym obozie?";
};

FUNC INT DIA_Outlam_CAVALORN_TEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aidan_SZPIEGOWANIE)) && (MIS_TestOC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_CAVALORN_TEST_Info()
{
    AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_01"); //Co mo�esz mi powiedzie� o tym obozie?
    AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_02"); //Co tu du�o m�wi�. Polujemy tutaj za zgod� Lee.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_03"); //W Nowym Obozie jest zapotrzebowanie na mi�so, tym bardziej, �e zbli�a si� zima.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_04"); //Dlatego z grup� ch�opak�w zamiast siedzie� przed chat� i czeka� na rozkazy Lee, czy Orika...
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_05"); //...postanowili�my wyj�� z inicjatyw� i za�o�y� ten ob�z.
	AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_06"); //Na co polujecie?
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_07"); //G��wnie na wilki i �cierwojady, czasami te� na dziki.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_08"); //Mi�so dostarczamy Silasowi do karczmy na jeziorze.
	AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_09"); //Kto odpowiada za transport?
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_10"); //Cyrus. Ka�dego dnia wysy�a kogo� z mi�sem.
	B_LogEntry   (CH1_TestOC,"Od Outlama dowiedzia�em si� co nieco o obozie najemnik�w-my�liwych. Podobno powsta� niedawno za zgod� Lee. Najemnicy nie chcieli siedzie� bezczynie, wi�c postanowili zaj�� si� czym� po�ytecznym. Poluj� g��wnie na wilki, �cierwojady i dziki. Zdobyte mi�so transportowane jest do karczmy na jeziorze.");
};

//========================================
//-----------------> HELLO1
//========================================
INSTANCE DIA_Outlam_HELLO1 (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_HELLO1_Condition;
   information  = DIA_Outlam_HELLO1_Info;
   permanent	= FALSE;
   description	= "Wygl�dasz na zamy�lonego.";
};

FUNC INT DIA_Outlam_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Outlam_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_01"); //Wygl�dasz na zamy�lonego.
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_02"); //Bo tak rzeczywi�cie jest.
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_03"); //Nad czym tak rozmy�lasz?
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_04"); //Trzy dni temu spad� mi na g�ow� pami�tnik. Wiem, �e to brzmi dziwnie, ale to prawda.
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_05"); //Pami�tnik?
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_06"); //Nie mam poj�cia sk�d si� tu wzi��. Pr�buj� rozwik�a� t� zagadk�.

    MIS_FlyingBook = LOG_RUNNING;

    Log_CreateTopic            (CH1_FlyingBook, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FlyingBook, LOG_RUNNING);
    B_LogEntry                     (CH1_FlyingBook,"My�liwemu Outlamowi spad� na g�ow� stary pami�tnik. Zastanawia si�, jak to si� mog�o sta�...");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Outlam_HELLO2 (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_HELLO2_Condition;
   information  = DIA_Outlam_HELLO2_Info;
   permanent	= FALSE;
   description	= "Daj mi ten pami�tnik.";
};

FUNC INT DIA_Outlam_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Outlam_HELLO2_15_01"); //Daj mi ten pami�tnik.
    AI_Output (self, other ,"DIA_Outlam_HELLO2_03_02"); //We� go. Tylko uwa�aj! Jest bardzo stary.
    CreateInvItems (self, Mis_PamietnikStarca, 1);
    B_GiveInvItems (self, other, Mis_PamietnikStarca, 1);
};
//========================================
//-----------------> Zagadka
//========================================

INSTANCE DIA_Outlam_Zagadka (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_Zagadka_Condition;
   information  = DIA_Outlam_Zagadka_Info;
   permanent	= FALSE;
   description	= "Chyba rozwi�za�em zagadk�.";
};

FUNC INT DIA_Outlam_Zagadka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_HELLO2))
    && (Npc_HasItems (other, Mis_KrysztalzKotla) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_Zagadka_Info()
{
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_01"); //Chyba rozwi�za�em zagadk�.
    AI_Output (self, other ,"DIA_Outlam_Zagadka_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_03"); //W g�rach znalaz�em szcz�tki starszego m�czyzny. Mia� przy magiczny kryszta�. Wed�ug pami�tnika, kilka lat temu ukrad� go z Kot�a.
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_04"); //Przypuszczam, �e to jego pami�tnik. Po prostu przywia� go tu wiatr. 
    AI_Output (self, other ,"DIA_Outlam_Zagadka_03_05"); //W g�rach �atwo o wiatr. To co m�wisz ma sens. W nagrod� mo�esz zachowa� kryszta�.
    B_LogEntry                     (CH1_FlyingBook,"Tajemnica rozwi�zana. Pami�tnik nale�a� do starca z g�r, kt�ry przed laty ukrad� magiczny kryszta� z Wolnej Kopalni.");
    Log_SetTopicStatus       (CH1_FlyingBook, LOG_SUCCESS);
    MIS_FlyingBook = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KOCIOL
//========================================

INSTANCE DIA_Outlam_KOCIOL (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_KOCIOL_Condition;
   information  = DIA_Outlam_KOCIOL_Info;
   permanent	= FALSE;
   description	= "Wiesz co� na temat dostaw do Kot�a?";
};

FUNC INT DIA_Outlam_KOCIOL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_WORK_FIND))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_KOCIOL_Info()
{
    AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_01"); //Wiesz co� na temat dostaw do Kot�a?
    if (Npc_KnowsInfo (hero, DIA_Cyrus_DOSTAWY))
    {
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_02"); //Cyrus kaza� mi na ciebie uwa�a�. M�wi�, �e o to spytasz! Odejd�.
		
		B_LogEntry         (CH1_Scams,"Cyrus dowiedzia� si�, �e w�sz� i nam�wi� przeciwko mnie swoich towarzyszy. Nie mam szans na wykonanie tego zadania.");
		Log_SetTopicStatus (CH1_Scams, LOG_FAILED);
		MIS_Scams = LOG_FAILED;
    }
    else
    {
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_03"); //O co ci konkretnie chodzi? Dostawy jak dostawy. Nic szczeg�lnego. Troch� jedzenia, zi�, pochodni.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_04"); //Podobno strasznie si� sp�niacie z dostarczeniem tych "drobnych" rzeczy do kopalni, pomimo i� Okyl kilkakrotnie was upomina�.
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_05"); //Pos�uchaj, ja nie jestem za to odpowiedzialny. Nie chc� mie� zatarg�w z Okylem.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_06"); //B�dziesz mia�, je�eli nie powiesz mi czego� wi�cej.
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_07"); //Dobra, dobra. Cyrus spotyka si� z Nowicjuszem, na kt�rego wo�aj� Isidro. Nic wi�cej nie wiem.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_08"); //Tyle na razie mi wystarczy.
        B_LogEntry                     (CH1_Scams,"Cyrus spotyka si� z Nowicjuszem imieniem Isidro. Najpewniej maj� razem jakie� interesy.");
    };
    AI_StopProcessInfos	(self);
};

///**********************************************
//*****   OUTLAM - HANDEL
///*****************************************************
//========================================
//-----------------> TRADE_ASK
//========================================

INSTANCE DIA_Outlam_TRADE_ASK (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_TRADE_ASK_Condition;
   information  = DIA_Outlam_TRADE_ASK_Info;
   permanent	= FALSE;
   description	= "Handlujesz? ";
};

FUNC INT DIA_Outlam_TRADE_ASK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Outlam_TRADE_ASK_Info()
{
    AI_Output (other, self ,"DIA_Outlam_TRADE_ASK_15_01"); //Handlujesz? 
    AI_Output (self, other ,"DIA_Outlam_TRADE_ASK_03_02"); //Jasne. Mog� ci sprzeda� troch� trofe�w. 
Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry (GE_TraderOW,"Outlam sprzedaje trofea my�liwskie i przydatne przedmioty. Znajd� go w ma�ym przycz�ku my�liwych za Nowym Obozem.");
};
//========================================
//-----------------> TRADE_DIA
//========================================

INSTANCE DIA_Outlam_TRADE_DIA (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 2;
   condition    = DIA_Outlam_TRADE_DIA_Condition;
   information  = DIA_Outlam_TRADE_DIA_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Outlam_TRADE_DIA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_TRADE_ASK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_TRADE_DIA_Info()
{
    AI_Output (other, self ,"DIA_Outlam_TRADE_DIA_15_01"); //Chc� co� kupi�.
    AI_Output (self, other ,"DIA_Outlam_TRADE_DIA_03_02"); //No dawaj. A mo�e chcesz co� sprzeda�?
};

//#####################################################################################
//####### ROZDZIA� 5
//####### ZAST�PSTWO DLA GORNA
//#####################################################################################
//========================================
//-----------------> CALL_OF_DUTY
//========================================

INSTANCE DIA_Outlam_CALL_OF_DUTY (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_CALL_OF_DUTY_Condition;
   information  = DIA_Outlam_CALL_OF_DUTY_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Lee. My�liwi-najemnicy maj� zaj�� si� obron� Wolnej Kopalni.";
};

FUNC INT DIA_Outlam_CALL_OF_DUTY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBRONA_WK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_CALL_OF_DUTY_Info()
{
    AI_Output (other, self ,"DIA_Outlam_CALL_OF_DUTY_15_01"); //Przysy�a mnie Lee. My�liwi-najemnicy maj� zaj�� si� obron� Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_02"); //No tak, mog�em si� domy�li�.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_03"); //Nasz ob�z znajduje si� na tyle blisko Wolnej Kopalni, �e Lee na pewno to wykorzysta.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_04"); //Ale skoro taka jest wola szefa, to udamy si� tam.
    AI_Output (other, self ,"DIA_Outlam_CALL_OF_DUTY_15_05"); //�wietnie.
    B_LogEntry                     (CH5_ObronaWK,"Ludzie Outlama udali si� do Wolnej Kopalni. ");

    B_GiveXP (200);
	//rutyny
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (SLD_2803_Outlam,"FMCstart");
	Npc_ExchangeRoutine (SLD_2805_Najemnik,"FMCstart");
	Npc_ExchangeRoutine (SLD_2802_Soldier,"FMCstart");
};
