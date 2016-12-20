//poprawione i sprawdzone - Nocturn

// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Co tu robisz?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jestem my�liwym. Utrzymuj� si� ze sprzeda�y sk�r i k��w zabitych zwierz�t.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Da si� z tego wy�y�?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Je�li potrafi si� zr�cznie oporz�dza� zwierzyn� - tak, i to ca�kiem nie�le!

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,	"Aidan, my�liwy mieszkaj�cy na drodze pomi�dzy Starym a Nowym Obozem, mo�e mnie nauczy�, jak patroszy� upolowan� zwierzyn�.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Chcia�bym si� nauczy� oprawia� zwierzyn�.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chcia�bym si� nauczy� oprawia� zwierzyn�.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //A co chcesz wiedzie�?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures, "Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 		,Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"			,Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 		,Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"	,Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nauczy�em ci� ju� wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak mog� zdoby� k�y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiej�tno��: Zdobywanie k��w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiej�tno��: Zdobywanie pazur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

//========================================
//-----------------> SZPIEGOWANIE
//========================================

INSTANCE DIA_Aidan_SZPIEGOWANIE (C_INFO)
{
   npc          = Org_859_Aidan;
   nr           = 1;
   condition    = DIA_Aidan_SZPIEGOWANIE_Condition;
   information  = DIA_Aidan_SZPIEGOWANIE_Info;
   permanent	= FALSE;
   description	= "Witam. Jeste� z Nowego Obozu?";
};

FUNC INT DIA_Aidan_SZPIEGOWANIE_Condition()
{
    if (szpiegostwoON == true)
    && (MIS_TestOC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aidan_SZPIEGOWANIE_Info()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_15_01"); //Witam. Jeste� z Nowego Obozu?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_03_02"); //Tak. O co chodzi?

    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Chcia�bym do��czy� do Obozu. Mo�e mi co� o nim opowiesz?", DIA_Aidan_SZPIEGOWANIE_OPCJA1);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Opowiedz mi o waszym Obozie.", DIA_Aidan_SZPIEGOWANIE_OPCJA2);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Co oferuje wasz Ob�z?", DIA_Aidan_SZPIEGOWANIE_OPCJA3);
};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA1()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_15_01"); //Chcia�bym do��czy� do Obozu. Mo�e mi co� o nim opowiesz?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_02"); //No c�. Najemnicy s� s�ugami Mag�w Wody. Szkodniki robi�, co chc�.
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_03"); //A zbieracze pracuj� na polach ry�owych.
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_15_04"); //Co robicie z ry�em?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_05"); //Nie wiem, co si� dok�adnie z nim dzieje. Ka�dy codziennie dostaje swoj� porcj�, a reszta trafia do magazynu. 
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_06"); //Poza tym to pytanie nie do mnie. Pogadaj mo�e z Ry�owym Ksi�ciem.
    B_LogEntry                     (CH1_TestOC,"Rozmawia�em z Aidanem. Je�li chc� si� dowiedzie� czego� wi�cej o uprawach ry�u, to musz� pogada� z niejakim Ry�owym Ksi�ciem.");
    wiecejRice = true;

    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);

};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA2()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_15_01"); //Opowiedz mi o waszym Obozie.
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_03_02"); //Co tu du�o m�wi�? Krety wydobywaj� rud�, a Najemnicy s� s�ugusami Mag�w Wody.
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_15_03"); //A co ze Szkodnikami? 
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_03_04"); //Robi�, co chc�.
    B_LogEntry                     (CH1_TestOC,"Nie dowiedzia�em si� zbyt du�o o Obozie. Musz� pr�bowa� dalej.");
    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA3()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA3_15_01"); //Co oferuje wasz Ob�z?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA3_03_02"); //Przede wszystkim wolno��.
    B_LogEntry                     (CH1_TestOC,"Nie dowiedzia�em si� zbyt du�o o Obozie. Musz� pr�bowa� dalej.");
    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BROWAE
//========================================

INSTANCE DIA_Aidan_BROWAE (C_INFO)
{
   npc          = Org_859_Aidan;
   nr           = 2;
   condition    = DIA_Aidan_BROWAE_Condition;
   information  = DIA_Aidan_BROWAE_Info;
   permanent	= FALSE;
   description	= "Mo�e napijesz si� piwa?";
};

FUNC INT DIA_Aidan_BROWAE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aidan_SZPIEGOWANIE))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aidan_BROWAE_Info()
{
    AI_Output (other, self ,"DIA_Aidan_BROWAE_15_01"); //Mo�e napijesz si� piwa?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_03_02"); //O! Ch�tnie. To mi�o z twojej strony.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_Output (self, other ,"DIA_Aidan_BROWAE_03_03"); //Dzi�ki ci.
	AI_UseItem (self, ItFoBeer);

    Info_ClearChoices		(DIA_Aidan_BROWAE);
    Info_AddChoice		(DIA_Aidan_BROWAE, "Czym zajmuj� si� Krety?", DIA_Aidan_BROWAE_KRETY);
	if (wiecejRice == false)
	{
    Info_AddChoice		(DIA_Aidan_BROWAE, "Opowiedz mi o dostawach ry�u.", DIA_Aidan_BROWAE_RYZ);
	};
};

FUNC VOID DIA_Aidan_BROWAE_KRETY()
{
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_01"); //Czym zajmuj� si� Krety?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_02"); //Jak sama nazwa wskazuje, kopi� w ziemi.
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_03"); //Co wydobywacie?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_04"); //To chyba oczywiste, �e rud�.
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_05"); //Du�o jej tam macie?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_06"); //Nie wiem. Rzadko bywam w Obozie. Cronos tego wszystkiego pilnuje.
    B_LogEntry                     (CH1_TestOC,"Cronos pilnuje rudy. Mo�e od niego czego� si� dowiem. Ewentualnie od Kret�w w Kot�a. Aidan nie ma nic konkretnego do powiedzenia. Przypuszczam, �e Cavalorn dobrze o tym wiedzia�.");
    wiecejOre = true;
  //  Info_ClearChoices		(DIA_Aidan_BROWAE);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Aidan_BROWAE_RYZ()
{
    AI_Output (other, self ,"DIA_Aidan_BROWAE_RYZ_15_01"); //Opowiedz mi o dostawach ry�u.
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_02"); //Jakich dostawach?
    AI_Output (other, self ,"DIA_Aidan_BROWAE_RYZ_15_03"); //Nie handlujecie ry�em?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_04"); //Ty chyba co� kr�cisz. Nagl� ci� to tak zainteresowa�o? 
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_05"); //To zawracaj g�ow� komu� innemu. Najlepiej Ry�owemu Ksi�ciu!
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_06"); //Dzi�ki za piwo.
   // Info_ClearChoices		(DIA_Aidan_BROWAE);
	wiecejRice = true;
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_TestOC,"Nie wysz�o z Aidanem. Dowiedzia�em si� jednak, �e o dostawach ry�u dowiem si� wi�cej od Ry�owego Ksi�cia.");
};
//========================================
//-----------------> OTHERS
//========================================

INSTANCE DIA_Aidan_OTHERS (C_INFO)
{
   npc          = Org_859_Aidan;
   nr           = 3;
   condition    = DIA_Aidan_OTHERS_Condition;
   information  = DIA_Aidan_OTHERS_Info;
   permanent	= FALSE;
   description	= "Zajmujesz si� jeszcze czym� innym?";
};

FUNC INT DIA_Aidan_OTHERS_Condition()
{
    if (szpiegostwoON == true)
	&& (Npc_KnowsInfo (hero, DIA_Aidan_BROWAE))
    && (MIS_TestOC == LOG_RUNNING) 
	{
    return TRUE;
    };
};


FUNC VOID DIA_Aidan_OTHERS_Info()
{
    AI_Output (other, self ,"DIA_Aidan_OTHERS_15_01"); //Zajmujesz si� jeszcze czym� innym?
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_02"); //Czasem wykonuj� jakie� ma�e zadanie.
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_03"); //Na przyk�ad ostatnio eskortowali�my dostaw� rudy do Obozu.
    AI_Output (other, self ,"DIA_Aidan_OTHERS_15_04"); //Ile tego by�o?
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_05"); //Z osiem skrzy� pe�nych rudy. 
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_06"); //Jedn� ze skrzy� podzielono mi�dzy eskortuj�cych.
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_07"); //Przypad�o mi 300 bry�ek. 
    B_LogEntry                     (CH1_TestOc,"Aidan pomaga� przy eskortowaniu rudy do Nowego Obozu. Wszystkiego by�o oko�o osiem skrzy�.");
	knowsAidan = true;
    B_GiveXP (50);
};


//========================================
//-----------------> Quest_Aidan_Start
//========================================

INSTANCE DIA_Aidan_Quest_Aidan_Start (C_INFO)
{
   npc          = ORG_859_Aidan;
   nr           = 1;
   condition    = DIA_Aidan_Quest_Aidan_Start_Condition;
   information  = DIA_Aidan_Quest_Aidan_Start_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Aidan_Quest_Aidan_Start_Condition()
{
    if (kapitel >= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aidan_Quest_Aidan_Start_Info()
{
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_01"); //Hej ty! Widz�, �e cz�sto podr�ujesz po Kolonii.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_02"); //Mia�bym do ciebie drobn� pro�b�.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_03"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_04"); //Nie obawiaj si�, dla cz�owieka twojego pokroju to b�dzie spacerek.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_03_05"); //M�w wi�c, w czym rzecz.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_06"); //Mia�em kiedy� przyjaciela, nazywa� si� Gorth.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_07"); //By� Szkodnikiem, tak jak ja i razem mieszkali�my w tej chacie.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_08"); //Wszystko by�o w porz�dku, jednak pewnego dnia wyruszy� na polowanie i ju� nigdy nie wr�ci�.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_09"); //Mam go odszuka�?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_10"); //Nie. Gorth po�yczy� ode mnie m�j najlepszy sprz�t �owiecki.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_11"); //�uk, oraz �elazny sztylet - idealny do �ci�gania sk�r.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_12"); //Chcia�bym te rzeczy odzyska�. 
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_13"); //Gdzie mam zacz�� poszukiwania?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_14"); //Ten stary skurczybyk chowa� swoje skarby w jaskini niedaleko kotliny, w kt�rej mieszka Cavalorn. Jaskinia znajduje si� przy �cie�ce do starej orkowej areny. 
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_15"); //Niestety zadomowi�y si� tam z�bacze, a ja nie jestem do�� silny, by je pokona�.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_16"); //Je�li mi pomo�esz, dam ci sporo rudy. Zainteresowany?

    Info_ClearChoices		(DIA_Aidan_Quest_Aidan_Start);
    Info_AddChoice		(DIA_Aidan_Quest_Aidan_Start, "Jasne. Spora ilo�� rudy jest wystarczaj�c� motywacj�. ", DIA_Aidan_Quest_Aidan_Start_Sure);
    Info_AddChoice		(DIA_Aidan_Quest_Aidan_Start, "Nie mam czasu na takie rzeczy. ", DIA_Aidan_Quest_Aidan_Start_Not);
};

FUNC VOID DIA_Aidan_Quest_Aidan_Start_Sure()
{
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_Sure_15_01"); //Jasne. Spora ilo�� rudy jest wystarczaj�c� motywacj�. 
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_Sure_03_02"); //Wielkie dzi�ki. Licz�, �e szybko wr�cisz. 
	Info_ClearChoices		(DIA_Aidan_Quest_Aidan_Start);
    AI_StopProcessInfos	(self);
	B_Story_Aidan_Quest_CH3 ();
};

FUNC VOID DIA_Aidan_Quest_Aidan_Start_Not()
{
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_Not_15_01"); //Nie mam czasu na takie rzeczy. 
    Info_ClearChoices		(DIA_Aidan_Quest_Aidan_Start);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Aidan_Quest_Key
//========================================

INSTANCE DIA_Aidan_Aidan_Quest_Key (C_INFO)
{
   npc          = ORG_859_Aidan;
   nr           = 2;
   condition    = DIA_Aidan_Aidan_Quest_Key_Condition;
   information  = DIA_Aidan_Aidan_Quest_Key_Info;
   permanent	= FALSE;
   description	= "By�em w jaskini.";
};

FUNC INT DIA_Aidan_Aidan_Quest_Key_Condition()
{
    if (hero_explore_aidanquestcave == true)
    && (MIS_Aidan_Quest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aidan_Aidan_Quest_Key_Info()
{
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Key_15_01"); //By�em w jaskini.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_02"); //To �wietnie. Masz moje rzeczy?
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Key_15_03"); //Nie, natkn��em si� za to na solidnie zabezpieczon� skrzyni�. Bez klucza nic nie poradz�.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_04"); //O bogowie, na �mier� zapomnia�em.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_05"); //We� ten klucz, powinien pasowa�.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_06"); //Znalaz�em go w kieszeni starego p�aszcza Gortha. 
    CreateInvItems (self, ItMis_AidanKey, 1);
    B_GiveInvItems (self, other, ItMis_AidanKey, 1);
    B_LogEntry                     (CH3_Aidan_Quest,"Aidan da� mi klucz do skrzyni z jaskini. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Aidan_Quest_Success
//========================================

INSTANCE DIA_Aidan_Aidan_Quest_Success (C_INFO)
{
   npc          = ORG_859_Aidan;
   nr           = 3;
   condition    = DIA_Aidan_Aidan_Quest_Success_Condition;
   information  = DIA_Aidan_Aidan_Quest_Success_Info;
   permanent	= FALSE;
   description	= "Odzyska�em twoje rzeczy.";
};

FUNC INT DIA_Aidan_Aidan_Quest_Success_Condition()
{
    if (MIS_Aidan_Quest == LOG_RUNNING)
    && (Npc_HasItems (other, ItMis_AidanBow) >=1)
    && (Npc_HasItems (other, ItMis_AidanDagger) >=1)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Aidan_Aidan_Quest_Success_Info()
{
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_01"); //Odzyska�em twoje rzeczy.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_02"); //�wietna robota, ju� si� ba�em, �e gdzie� z nimi znikniesz. 
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_03"); //Prosz�, we� te 300 bry�ek rudy.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_04"); //Ja na tym odludziu ich nie potrzebuj�.
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_05"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_06"); //A w�a�nie, nie chcia�by� zosta� my�liwym i polowa� razem ze mn�?
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_07"); //Wygl�dasz na silnego cz�owieka i nie�le sobie poradzi�e� z tymi z�baczami.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_08"); //Wiesz, odk�d pok��ci�em si� z Ratfordem, a ten uciek� do Obozu Quentina jest mi strasznie ci�ko.
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_09"); //Nie zagrzewam nigdzie zbyt d�ugo miejsca, ale dzi�ki za propozycje.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_10"); //No c�, jak zmienisz zdanie, to daj mi zna�.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_11"); //Powodzenia na szlaku. 
    B_LogEntry                     (CH3_Aidan_Quest,"Odda�em Aidanowi jego �uk i sztylet.");
    Log_SetTopicStatus       (CH3_Aidan_Quest, LOG_SUCCESS);
    MIS_Aidan_Quest = LOG_SUCCESS;

    B_GiveXP (200);
    B_GiveInvItems (other, self, ItMis_AidanBow, 1);
	B_GiveInvItems (other, self, ItMis_AidanDagger, 1);
	
	CreateInvItems (self, itminugget,300);
	B_GiveInvItems (self, other, itminugget, 300);
};

