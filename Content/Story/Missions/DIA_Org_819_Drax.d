// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 1
// Zadania r�nych gildii
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> AboutRatford
//========================================

INSTANCE DIA_Drax_AboutRatford (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_AboutRatford_Condition;
   information  = DIA_Drax_AboutRatford_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Ratfordzie?";
};

FUNC INT DIA_Drax_AboutRatford_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ratford_KillEmil))
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_AboutRatford_Info()
{
    AI_Output (other, self ,"DIA_Drax_AboutRatford_15_01"); //Co mo�esz mi powiedzie� o Ratfordzie?
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_02"); //Daj spok�j. Wkurwia mnie ostatnio, jak ma�o kto.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_03"); //Kilka dni temu w naszym Obozie by� z wizyt� niejaki Fortuno z obozu Sekty.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_04"); //Kupili�my od niego spory zapas niezwykle mocnego ziela. 
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_05"); //Cz�owieku, ale mieli�my ubaw.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_06"); //Tak si� zjarali�my, �e pomyli�my Stra�nik�w mostu z orkami.
    AI_Output (other, self ,"DIA_Drax_AboutRatford_15_07"); //Co to ma wsp�lnego z twoim przyjacielem? 
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_08"); //Jak to co?! Ziele si� sko�czy�o, a on zacz�� narzeka� jak stara baba. Mam ju� tego do��. 
	//log
    B_LogEntry                     (CH1_CourierFireMage,"Wychodzi na to, �e Ratford lubi sobie zapali� co� mocniejszego. Mo�e to b�dzie klucz do jego zagadki? Ostatnio Bandyci kupili sporo ziela u Fortuno. Powinienem si� do niego uda�. ");
	//exit
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 1
// Dialogi og�lne
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Widz�, �e jeste� my�liwym.";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Widz�, �e jeste� my�liwym.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Na to wygl�da... Czego chcesz?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //M�g�by� nauczy� mnie polowa�?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Par� sztuczek m�g�bym ci pokaza�, ale to b�dzie kosztowa�.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Ile dok�adnie?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Na pocz�tek wystarczy �yk dobrego piwa, potem zobaczymy.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Prosz�, oto piwo. Teraz opowiedz mi o polowaniu.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Prosz�, oto piwo. Teraz opowiedz mi o polowaniu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //�cierwojady - tak nazywamy te wielkie ptaszyska - nale�y atakowa� jeden po drugim. Na szcz�cie �atwo odci�gn�� jednego osobnika od reszty stada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Je�li podejdziesz do nich zbyt blisko, zaczn� si� denerwowa�, a� wreszcie rzuc� si� w twoj� stron�. Lepiej, �eby� w tej chwili mia� bro� w pogotowiu.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Je�li uda ci si� trafi� �cierwojada zanim on dziobnie ciebie, jak najszybciej wyprowad� kolejne uderzenie. Przy odrobinie szcz�cia uda ci si� go pokona� bez zadra�ni�cia.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //A je�li ON dziobnie ci� pierwszy... C�, lepiej, �eby nie dziobn��.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nie mam piwa.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //To poszukaj! To najlepsza rada, jak� otrzymasz ode mnie za darmo. A skoro ju� b�dziesz szuka�, znajd� dla mnie jeszcze par� bry�ek rudy.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mog� ci wiele opowiedzie� o r�nych zwierzakach, ale to ci� b�dzie kosztowa�o.
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherBAN, LOG_NOTE);
	B_LogEntry		(GE_TeacherBAN, "Drax mo�e mnie nauczy� patroszenia zwierzyny, je�li zap�ac� cen�, kt�rej za��da. Znajd� go na drodze pomi�dzy Starym Obozem a miejscem wymiany.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Czego jeszcze mo�esz mnie nauczy�?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Czego jeszcze mo�esz mnie nauczy�?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Wielu rzeczy, ale g�upie piwo nie wystarczy.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny �owca potrafi zdoby� k�y, pazury i sk�r� zwierzyny. Nie jest to �atwe, ale do�� op�acalne.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka�dym razie ka�dy kupiec ch�tnie je od ciebie odkupi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures, "Du�o ��dasz za swoje us�ugi." 				,Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures, "Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 		,Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"		,Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)" 	,Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)"	,Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Powiedzia�em ci ju� wszystko co wiem.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du�o ��dasz za swoje us�ugi.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //By� mo�e, ale wiedza, kt�r� mog� ci przekaza� pozwoli ci szybko odzyska� zainwestowan� kwot�.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Wszystkie zwierz�ta, kt�re zabijesz nie wiedz�c jak je oprawi�, po prostu zgnij�.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich sk�r� m�g�by� zarobi� sporo pieni�dzy.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spr�bowa�bym mo�liwie szybko posi��� te umiej�tno�ci.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak mog� zdoby� k�y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie k��w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak mog� zdoby� sk�ry upolowanej zwierzyny? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie pazur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Poka� mi jak zdoby� pazury upolowanej zwierzyny.  
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Najpierw chc� zobaczy� troch� rudy. W tej Kolonii nic nie ma za darmo!
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 1
// Przy��czenie do obozu bandyt�w
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> BANDITOS_CAMP
//========================================

INSTANCE DIA_Drax_BANDITOS_CAMP (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 2;
   condition    = DIA_Drax_BANDITOS_CAMP_Condition;
   information  = DIA_Drax_BANDITOS_CAMP_Info;
   permanent	= FALSE;
   description	= "Do jakiego obozu nale�ysz?";
};

FUNC INT DIA_Drax_BANDITOS_CAMP_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drax_BANDITOS_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Drax_BANDITOS_CAMP_15_01"); //Do jakiego obozu nale�ysz?
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_02"); //Widz�, �e jeste� tu nowy i masz du�o pyta�, a mi nie za bardzo chce si� teraz z tob� rozmawia�. 
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_03"); //Powiem ci wi�c tak: Ratford i ja nie przepadamy za Gomezem i jego Stra�nikami.
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_04"); //Stary Ob�z to banda wieprzy i pupilk�w Kr�la, najwi�kszego w�r�d sukinsyn�w. 
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_05"); //Wi�c, je�li chcesz z nimi trzyma�, lepiej st�d odejd�. 
};
var int Drax_choice;
//========================================
//-----------------> O_BANDYTACH
//========================================

INSTANCE DIA_Drax_O_BANDYTACH (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 3;
   condition    = DIA_Drax_O_BANDYTACH_Condition;
   information  = DIA_Drax_O_BANDYTACH_Info;
   permanent	= FALSE;
   description	= "Mo�e powiesz mi co� wi�cej o waszej 'grupie'? ";
};

FUNC INT DIA_Drax_O_BANDYTACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_BANDITOS_CAMP)) && (kapitel ==1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_O_BANDYTACH_Info()
{
    AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_01"); //Mo�e powiesz mi co� wi�cej o waszej "grupie"? 
    AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_02"); //A ty co? Szpieg Gomeza? 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_03"); //Nie, dopiero co tu trafi�em i chc� si� zorientowa� co si� tu dzieje. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_04"); //To lepiej id� si� orientowa� gdzie� indziej. 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_05"); //Nie mo�esz mi po prostu powiedzie�, kim jeste�cie? 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_06"); //A dlaczego chcesz to wiedzie�?
	Info_ClearChoices	(DIA_Drax_O_BANDYTACH);
	Info_AddChoice		(DIA_Drax_O_BANDYTACH,"Zastanawiam si� kt�ry ob�z wybra�.",DIA_Drax_O_BANDYTACH_DECYZJA);
	Info_AddChoice		(DIA_Drax_O_BANDYTACH,"M�czyzna w czerwonej zbroi uderzy� mnie w twarz. Szukam zemsty.",DIA_Drax_O_BANDYTACH_ZEMSTA);  
};

func void DIA_Drax_O_BANDYTACH_DECYZJA ()
{
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_DECYZJA_15_01"); //Zastanawiam si� kt�ry ob�z wybra�.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_DECYZJA_03_02"); //To nie jest jaka� pieprzona karczma, tylko G�rnicza Dolina.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_DECYZJA_03_03"); //Zje�d�aj st�d!
	Drax_choice = false;
	Info_ClearChoices	(DIA_Drax_O_BANDYTACH);
	AI_StopProcessInfos	(self);
};

func void DIA_Drax_O_BANDYTACH_ZEMSTA ()
{
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_15_01"); //M�czyzna w czerwonej zbroi uderzy� mnie w twarz. Szukam zemsty.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_02"); //Doprawdy? Szukasz zemsty? Ha ha... Nie roz�mieszaj mnie.
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_15_03"); //Ta gnida by�a ze Starego Obozu, tak? Do tego zmierzasz? 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_04"); //Brawo, ch�opcze. Ten typ to Bullit, kawa� sukinsyna. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_05"); //Podobnie jak po�owa tego zawszonego 'obozu czerwonych'.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_06"); //Oni nie s� tacy jak my. Ludzie nie maj� dla nich �adnej warto�ci. Liczy si� tylko ruda i pertraktacje z kr�lem. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_07"); //My, Bandyci jeste�my inni. 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_08"); //A wi�c Bandyci.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_09"); //Staramy si� prze�y�. Trzymamy si� w grupie.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_10"); //Tymczasem Gomez wykorzystuje Kopaczy do ci�kich prac, a Stra�nik�w nazywa "str�ami sprawiedliwo�ci".
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_11"); //G�wno prawda! Wszyscy jeste�my bandytami i nikt nie trafi� tu bez powodu.
	Drax_choice = true;
	Info_ClearChoices	(DIA_Drax_O_BANDYTACH);
};

//========================================
//-----------------> PRZYJECIE
//========================================

INSTANCE DIA_Drax_PRZYJECIE (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 4;
   condition    = DIA_Drax_PRZYJECIE_Condition;
   information  = DIA_Drax_PRZYJECIE_Info;
   permanent	= FALSE;
   description	= "Czy mog� do was do��czy�? ";
};

FUNC INT DIA_Drax_PRZYJECIE_Condition()
{
  if (Npc_KnowsInfo (hero, DIA_Drax_O_BANDYTACH))
  && (Npc_GetTrueGuild(other) == GIL_NONE)//fix logic
  && (kapitel == 1)
 
  {
    return TRUE;
};
};

FUNC VOID DIA_Drax_PRZYJECIE_Info()
{
    AI_Output (other, self ,"DIA_Drax_PRZYJECIE_15_01"); //Czy mog� do was do��czy�? 
	if (Drax_choice == true)
	{
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_04"); //Nie wiem co� ty za jeden, ale my�l�, �e masz potencja�.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_05"); //Zdajesz sobie spraw�, �e to nie b�dzie spacerek? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_06"); //Jeste�my �miertelnymi wrogami z Cieniami i Stra�nikami ze Starego Obozu. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_07"); //B�d�c jednym z nas, nie b�dziesz mia� tam lekkiego �ycia. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_08"); //Nasza przewaga nad Stra�nikami polega g��wnie na tym, �e te p�m�zgi nie wiedz� do ko�ca gdzie znajduje si� nasz Ob�z. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_09"); //Dlatego musz� by� pewien, �e jeste� po naszej stronie i nas nie wydasz. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_10"); //Nie wpuszczamy byle kogo do naszego Obozu, jasne? 
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_15_11"); //Co mam zrobi�, �eby zdoby� twoje zaufanie? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_12"); //Przede wszystkim musisz si� liczy� z tym, �e odprowadzenie ci� do naszej kryj�wki b�dzie r�wnoznaczne z pozostaniem lojalnym i wyrzeczeniem si� przez ciebie innych oboz�w. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_13"); //Dobrze si� zastan�w. Cho� to, �e zawracasz mi g�ow� jest chyba r�wnoznaczne z tym, �e jeste� pewien czego tak naprawd� chcesz.
	Info_ClearChoices	(DIA_Drax_PRZYJECIE);
	Info_AddChoice		(DIA_Drax_PRZYJECIE,"Jestem gotowy, by do was do��czy�.",DIA_Drax_PRZYJECIE_TRUE);
	Info_AddChoice		(DIA_Drax_PRZYJECIE,"Jeszcze to przemy�l�.",DIA_Drax_PRZYJECIE_LOSE); 
	}
	else
	{
    AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_02"); //Ty? Przesta�o ci si� podoba� dostawanie po pysku od ludzi Gomeza?  
    AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_03"); //Szczerze, to mi si� nie podobasz. Lepiej znajd� sobie inne miejsce w Kolonii.
    AI_StopProcessInfos	(self);
	};
};

func void DIA_Drax_PRZYJECIE_TRUE ()
{
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_TRUE_15_01"); //Jestem gotowy, by do was do��czy�.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_02"); //To bardzo wa�ne, co ci za chwil� powiem. Musisz zachowa� dyskrecje.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_03"); //Jaki� czas temu wracali�my z Ratfordem z polowania w lesie.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_04"); //Gdy ju� dochodzili�my do naszego Obozu, zauwa�yli�my, �e jeste�my �ledzeni przez jakiego� Stra�nika ze Starego Obozu.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_05"); //Ruszy�em w po�cig, a Ratford pr�bowa� rozwali� mu �eb strza��. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_06"); //Sukinsyn mia� szcz�cie, strza�a przelecia�a tu� obok jego g�owy. 
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_TRUE_15_07"); //Nie uda�o ci si� go dogoni�? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_08"); //Nie, widocznie zaopatrzy� si� u jakiego� maga w odpowiednie mikstury. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_09"); //P�dzi� jakby go sam Beliar goni�.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_10"); //Obawiamy si�, �e ten szczur ma informacje, kt�re mog� pom�c Magnatom zlokalizowa� nasz Ob�z. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_11"); //Id� do Starego Obozu i wykorzystaj to, �e nikt ci� nie zna. Dowiedz si� jak najwi�cej.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_12"); //Pami�taj, �eby uwa�a� na s�owa i nikomu nie ufa�.
	
	MIS_DraxTest = LOG_RUNNING;
    Log_CreateTopic          (CH1_DraxTest, LOG_MISSION);
    Log_SetTopicStatus       (CH1_DraxTest, LOG_RUNNING);
    B_LogEntry               (CH1_DraxTest,"Je�eli chc�, aby Drax zaprowadzi� mnie do Obozu Bandyt�w, musz� zdoby� jego zaufanie i szacunek. Jaki� czas temu Drax i Ratford padli ofiar� szpiega, kt�ry zdoby� wa�ne informacje na temat po�o�enia Obozu. Musz� uda� si� do Starego Obozu i odkry� czego dowiedzieli si� Stra�nicy. ");
	Info_ClearChoices	(DIA_Drax_PRZYJECIE);
};

func void DIA_Drax_PRZYJECIE_LOSE ()
{
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_LOSE_15_01"); //Jeszcze to przemy�l�.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_LOSE_03_02"); //Jasne, oczywi�cie. Albo poczekaj, zaraz ci pomog�. 
	Info_ClearChoices	(DIA_Drax_PRZYJECIE);
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
};

//========================================
//-----------------> BANDYCI_STOSUNKI
//========================================
//edit by Nocturn

INSTANCE DIA_Drax_BANDYCI_STOSUNKI (C_INFO)
{
   npc          = ORG_819_Drax;
   nr           = 5;
   condition    = DIA_Drax_BANDYCI_STOSUNKI_Condition;
   information  = DIA_Drax_BANDYCI_STOSUNKI_Info;
   permanent	= FALSE;
   description	= "Jak wygl�daj� stosunki Obozu Bandyt�w z pozosta�ymi obozami?";
};

FUNC INT DIA_Drax_BANDYCI_STOSUNKI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_O_BANDYTACH))
	&& (Drax_choice == true)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_BANDYCI_STOSUNKI_Info()
{
    AI_Output (other, self ,"DIA_Drax_BANDYCI_STOSUNKI_15_01"); //Jak wygl�daj� stosunki Obozu Bandyt�w z pozosta�ymi obozami? W ko�cu nazywaj� was oni Bandytami.
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_02"); //Owszem jeste�my tak nazywani, ale to tylko dlatego, �e aby prze�y� chwytamy si� r�nych zaj��, jak na przyk�ad rabowanie konwoj�w z rud�. 
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_03");	//Ludzie uwa�aj�, �e to robota typowa dla rzezimieszk�w.
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_04"); //Co do relacji, c�, ludzie ze Starego Obozu nas nienawidz� i najch�tniej wydaliby nas na po�arcie z�baczom. 
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_05");	//Nie maj� jednak poj�cia, gdzie si� ukrywamy. Nasz Ob�z jest w pobli�u Kanionu Trolli, kt�ry Stra�nicy Gomeza omijaj� szerokim �ukiem.
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_06"); //W Obozie Bractwa cz�sto jeste�my traktowani jako najemnicy, Stra�nicy �wi�tynni na polecenie Guru wynajmuj� nas do brudnej roboty.
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_07"); //Je�li chodzi o Nowy Ob�z, �yjemy w przyjaznych stosunkach, ludzie Laresa s� mile widziani w naszym Obozie. 
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_08");	//W Kolonii jest tak�e ob�z my�liwych i �owc�w ork�w, jednak s� oni do nas nastawieni neutralnie i nie wchodzimy sobie w drog�.
	};
	
//========================================
//-----------------> DraxTest_Succes
//========================================

INSTANCE DIA_Drax_DraxTest_Succes (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_DraxTest_Succes_Condition;
   information  = DIA_Drax_DraxTest_Succes_Info;
   permanent	= FALSE;
   description	= "Troch� nam�ci�em w Starym Obozie.";
};

FUNC INT DIA_Drax_DraxTest_Succes_Condition()
{
    if (Npc_HasItems (other, ItMis_TripMap) >=1)
    && (Npc_HasItems (other, ItMis_TripNotes) >=1)
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_DraxTest_Succes_Info()
{
	
    AI_Output (other, self ,"DIA_Drax_DraxTest_Succes_15_01"); //Troch� nam�ci�em w Starym Obozie.
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_02"); //S�ysza�em ju� wie�ci od Ratforda, kt�ry gada� ze Skaz�.
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_03"); //Ca�y Ob�z oszala�. Thorus szuka winnych. 
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_04"); //Wkr�tce si� zorientuj�, �e to ty. 
    AI_Output (other, self ,"DIA_Drax_DraxTest_Succes_15_05"); //Nie mo�esz pozwoli� mi cieszy� si� ostatnimi chwilami spokoju? 
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_06"); //Ha ha. Masz racj�, zas�u�y�e�. 
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_07"); //Gdy ju� wypoczniesz, daj mi znak. Mam dla ciebie kolejne zadanie, kt�rym udowodnisz swoj� lojalno��.
	B_LogEntry                     (CH1_DraxTest,"Uda�o mi si� dostarczy� do Draxa notatki Tripa oraz map� od Grahama. Wreszcie zdoby�em szacunek i zaufanie Bandyty. Mimo to czeka mnie kolejne zadanie.");
    Log_SetTopicStatus       (CH1_DraxTest, LOG_SUCCESS);
    MIS_DraxTest = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItMis_TripNotes, 1);
	B_GiveInvItems (other, self, ItMis_TripMap, 1);
    B_GiveXP (275);
	
	}
	else if (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)
	{
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_08"); //Chcesz zrobi� ze mnie idiot�. Wyno� si�!
	B_LogEntry               (CH1_DraxTest,"Jako cz�onek Starego Obozu nie powinienem by� rozmawia� z Draxem. Kaza� mi si� wynosi�. W sumie te� by�bym w�ciek�y.");
    Log_SetTopicStatus       (CH1_DraxTest, LOG_Failed);
    MIS_DraxTest = LOG_Failed;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_09"); //Troch� ju� na to za p�no.
	B_LogEntry               (CH1_DraxTest,"B�d�c cz�onkiem innego obozu nie mam czego szuka� w�r�d Bandyt�w.");
    Log_SetTopicStatus       (CH1_DraxTest, LOG_Failed);
    MIS_DraxTest = LOG_Failed;
	};
};

//========================================
//-----------------> WORKFLOW
//========================================

INSTANCE DIA_Drax_WORKFLOW (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 3;
   condition    = DIA_Drax_WORKFLOW_Condition;
   information  = DIA_Drax_WORKFLOW_Info;
   permanent	= FALSE;
   description	= "Co jeszcze mam zrobi�?";
};

FUNC INT DIA_Drax_WORKFLOW_Condition()
{
    if (MIS_DraxTest == LOG_SUCCESS) && (Npc_GetTrueGuild(other) == GIL_NONE) && (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_WORKFLOW_Info()
{
    AI_Output (other, self ,"DIA_Drax_WORKFLOW_15_01"); //Co jeszcze mam zrobi�?
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_02"); //P�jdziesz do Skazy - znasz go ju�. 
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_03"); //Musisz odebra� od niego raport zawieraj�cy wa�ne informacje. Najpewniej dostaniesz go w formie ustnej. Postaraj si� zapami�ta�.
    AI_Output (other, self ,"DIA_Drax_WORKFLOW_15_04"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_05"); //To nie b�dzie takie proste. Skaza ma jakie� k�opoty. Opowiada� mi o nich przy ostatniej rozmowie. Pom� mu z nich wyskoczy�. Jasne?
    BANMordragRaport = LOG_RUNNING;

    Log_CreateTopic          (CH1_BANMordragRaport, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BANMordragRaport, LOG_RUNNING);
    B_LogEntry               (CH1_BANMordragRaport,"Drax kaza� mi przynie�� raport od Skazy, kt�rego znajd� w Starym Obozie... Przy okazji musz� pom�c Bandycie z jego k�opotami. Jeszcze nie wiem, co mnie czeka."); //fix 1210
};

//========================================
//-----------------> RAPORT
//========================================

INSTANCE DIA_Drax_RAPORT (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 4;
   condition    = DIA_Drax_RAPORT_Condition;
   information  = DIA_Drax_RAPORT_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie raport.";
};

FUNC INT DIA_Drax_RAPORT_Condition()
{
    if (BANMordragRaport == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Skaza_ALLWORKSOK))
	&& (Npc_GetTrueGuild(other) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_RAPORT_Info()
{
    AI_Output (other, self ,"DIA_Drax_RAPORT_15_01"); //Mam dla ciebie raport.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_02"); //No, nareszcie! Gadaj!
    AI_Output (other, self ,"DIA_Drax_RAPORT_15_03"); //Bractwo zawar�o g��bsz� wsp�prac� z Gomezem. Stary Ob�z otrzyma du�e ilo�ci ziela w zamian za jakie� us�ugi w kopalni. Y'Berion widocznie czego� tam szuka.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_04"); //Wiesz co� wi�cej?
    AI_Output (other, self ,"DIA_Drax_RAPORT_15_05"); //Niestety nie. Skaza mia� ostatnio do�� ograniczone mo�liwo�ci.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_06"); //Przeka�� te wie�ci Quentinowi. On zdecyduje, co z tym zrobimy. Musimy mie� te gnidy ze Starego Obozu na oku.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_09"); //A co do ciebie: wykona�e� kawa� dobrej roboty.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_10"); //M�g�bym ci zap�aci�, ale chyba nie zale�y ci na rudzie, tylko na zaufaniu.
	AI_Output (other, self ,"DIA_Drax_RAPORT_15_11"); //Nie pogardzi�bym kilkoma bry�kami na zakup lepszego rynsztunku...
	AI_Output (self, other ,"DIA_Drax_RAPORT_03_12"); //Niech ci b�dzie. Dosta�em to za dwie sk�ry wilk�w. 
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH1_BANMordragRaport,"Przekaza�em raport Draxowi tym samym wykonuj�c moje pierwsze powa�ne zlecenie. Jestem coraz bli�ej wej�cia w szeregi Bandyt�w.");
    Log_SetTopicStatus       (CH1_BANMordragRaport, LOG_SUCCESS);
    BANMordragRaport = LOG_SUCCESS;
    B_GiveXP (XP_MordragRaport);
};

//========================================
//-----------------> DOKOPALNI
//========================================

INSTANCE DIA_Drax_DOKOPALNI (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 5;
   condition    = DIA_Drax_DOKOPALNI_Condition;
   information  = DIA_Drax_DOKOPALNI_Info;
   permanent	= FALSE;
   description	= "Co teraz mam zrobi�?";
};

FUNC INT DIA_Drax_DOKOPALNI_Condition()
{
    if (BANMordragRaport == LOG_SUCCESS)
    && (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_DOKOPALNI_Info()
{
    AI_Output (other, self ,"DIA_Drax_DOKOPALNI_15_01"); //Co teraz mam zrobi�?
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_02"); //Sporo ju� wykona�e�, ale mam dla ciebie jeszcze jedn� robot�.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_03"); //Je�eli tego nie spaprasz, powitamy ci� w naszych szeregach.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_04"); //Ale przejd�my do rzeczy...
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_05"); //Musisz odebra� rud� od naszego cz�owieka. Nazywa si� Josh. Znajdziesz go w Kopalni lub ewentualnie przed ni�.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_06"); //Pami�taj przy tym, �eby dzia�a� dyskretnie. Gdyby kto� niepowo�any si� o tym dowiedzia�, by�oby po Joshu.
 
    MIS_OreInOM = LOG_RUNNING;
	//Wld_InsertNpc			(BAN_1606_Josh,"OM_122");
	//B_KillNpc  				(BAN_1606_Josh);   
    Log_CreateTopic           (CH1_OreInOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OreInOM, LOG_RUNNING);
    B_LogEntry               	(CH1_OreInOM,"Drax kaza� mi p�j�� do Starej Kopalni i poszuka� Josha. Mam odebra� od niego dostaw� zdobytej na lewo rudy.");
};

//========================================
//-----------------> ENDEDD
//========================================

INSTANCE DIA_Drax_ENDEDD (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 6;
   condition    = DIA_Drax_ENDEDD_Condition;
   information  = DIA_Drax_ENDEDD_Info;
   permanent	= FALSE;
   description	= "Odzyska�em rud� z Kopalni.";
};

FUNC INT DIA_Drax_ENDEDD_Condition()
{
    if (Npc_HasItems (other, itmi_joshpocket) >=1)
	&& (MIS_OreInOM == LOG_RUNNING)
    //|| (part1p2 == true))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_ENDEDD_Info()
{
    AI_Output (other, self ,"DIA_Drax_ENDEDD_15_01"); //Odzyska�em rud� z Kopalni. Mam j� w sakiewce.
    AI_Output (self, other ,"DIA_Drax_ENDEDD_03_02"); //Doskonale. Wszystko przebieg�o pomy�lnie?
    AI_Output (other, self ,"DIA_Drax_ENDEDD_15_03"); //Niezbyt. Josh mia� k�opoty i musia� opu�ci� Kopalnie. Spotka�em go w obozie przed Kopalni�. By� bardzo zdenerwowany.
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_04"); //Podczas ucieczki zgubi� sakw� z ca�� rud�. Znalaz� j� jaki� Kopacz. Po ma�ym dochodzeniu uda�o mi si� ustali�, kto j� ma.
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_05"); //Ukrad�em klucz, zabra�em rud� i..
	if (Npc_KnowsInfo (hero, DIA_Joel_JoshDie))
	{
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_06"); //...wr�ci�em do Josha jednak ten ju� nie �y�. Ian poinformowa� o wszystkim Stra�nik�w.
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_07"); //Cholera. Szkoda go�cia. By� w porz�dku i dobrze odwala� swoj� robot�. 
	}
	else
	{
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_08"); //...chcia�em wr�ci� do Josha. Wszed�em do obozu i zobaczy�em Stra�nika stoj�cego nad stygn�cym cia�em. Postanowi�em si� nie zbli�a�.
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_09"); //M�dre posuni�cie. Stra�nicy mog� ci� teraz podejrzewa� o wsp�prac� z nami. Musisz mie� si� na baczno�ci.
	};
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_10"); //Tak czy inaczej, dobrze si� spisa�e�. 
		
		B_GiveInvItems (other, self, itmi_joshpocket, 1);
		B_LogEntry               (CH1_OreInOM,"Zanios�em  Draxowi znalezion� rud�. Nie by� zadowolony ze �mierci Josha, ale nic nie mog�em z tym zrobi�.");
		Log_SetTopicStatus       (CH1_OreInOM, LOG_SUCCESS);
		MIS_OreInOM = LOG_SUCCESS;
		B_GiveXP (XP_RudaZKopalni);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 1
// Przy��czenie do obozu
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> DOOBOZU
//========================================

INSTANCE DIA_Drax_DOOBOZU (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 7;
   condition    = DIA_Drax_DOOBOZU_Condition;
   information  = DIA_Drax_DOOBOZU_Info;
   permanent	= FALSE;
   description	= "Co z moim przyj�ciem?";
};

FUNC INT DIA_Drax_DOOBOZU_Condition()
{
	if (MIS_OreInOM == LOG_SUCCESS) && (kapitel == 1) && (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_DOOBOZU_Info()
{
    AI_Output (other, self ,"DIA_Drax_DOOBOZU_15_01"); //Co z moim przyj�ciem?
    AI_Output (self, other ,"DIA_Drax_DOOBOZU_03_02"); //C�, przeszed�e� skompilowane testy. Wykona�e� ryzykowne zadania. Udowodni�e�, �e potrafisz by� dyskretny i nie dasz sob� manipulowa�. 
    AI_Output (self, other ,"DIA_Drax_DOOBOZU_03_03"); //JA jestem na TAK, ale czy TY tego chcesz?
};

//========================================
//-----------------> JustGetGuild
//========================================

INSTANCE DIA_Drax_JustGetGuild (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 7;
   condition    = DIA_Drax_JustGetGuild_Condition;
   information  = DIA_Drax_JustGetGuild_Info;
   permanent	= FALSE;
   description	= "CHC� zosta� Bandyt�!";
};

FUNC INT DIA_Drax_JustGetGuild_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Drax_DOOBOZU) && (kapitel == 1) && (Npc_GetTrueGuild (hero) == GIL_NONE) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_JustGetGuild_Info()
{
    AI_Output (other, self ,"DIA_Drax_JustGetGuild_15_01"); //CHC� zosta� Bandyt�!
    AI_Output (self, other ,"DIA_Drax_JustGetGuild_03_02"); //Takiej odpowiedzi oczekiwa�em, ch�opcze. Witaj w�r�d nas, wyrzutk�w!
    AI_Output (self, other ,"DIA_Drax_JustGetGuild_03_03"); //Powiedz, gdy b�dziesz got�w, a zaprowadz� ci� do Obozu. Tam dostaniesz pancerz i dowiesz si� co i jak.
	
	//guild and quest status
	hero.guild = GIL_BAU;
	Npc_SetTrueGuild (hero,GIL_BAU);
	HeroJoinToBAN ();
	//HeroJoinToBAN ();
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Od teraz jestem Bandyt�! Czekaj� na mnie nowe wyzwania.");
    //Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_SUCCESS);
    MIS_BANDITOS_CAMP = LOG_SUCCESS;
	//esperience
    B_GiveXP (XP_HeroJoinToBandit);
	//logs other quests
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinOC,	"Bandyta nie mo�e do��czy� do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry				(CH1_JoinPsi,	"Bractwo b�dzie musia�o radzi� sobie beze mnie. Od dzi� moim domem jest Ob�z Bandyt�w!");
		
		Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinNC,	"Lares b�dzie musia� o mnie zapomnie�.");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_EasyJoinOC,	"Zosta�em Bandyt�. Nic nie wysz�o z mojego u�atwionego przyj�cia do Starego Obozu.");  
};


//========================================
//-----------------> GOTO_BANDITOS
//========================================

INSTANCE DIA_Drax_GOTO_BANDITOS (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 6;
   condition    = DIA_Drax_GOTO_BANDITOS_Condition;
   information  = DIA_Drax_GOTO_BANDITOS_Info;
   permanent	= FALSE;
   description	= "Chod�my do Obozu Bandyt�w!";
};

FUNC INT DIA_Drax_GOTO_BANDITOS_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_GOTO_BANDITOS_Info() //fix nazwy z du�ej 1.4
{
    AI_Output (other, self ,"DIA_Drax_GOTO_BANDITOS_15_01"); //Chod�my do Obozu Bandyt�w!
    AI_Output (self, other ,"DIA_Drax_GOTO_BANDITOS_03_02"); //Id� za mn�! Tylko uwa�aj na dzik� zwierzyn�.
    BANDITOS_CAMP = LOG_RUNNING;

    //Log_CreateTopic            (CH1_BANDITOS_CAMP, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_RUNNING);
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Zdoby�em zaufanie Draxa. Teraz jestem got�w by wyruszy� do Obozu Bandyt�w. Diego powiedzia�, �e w ko�cu b�d� musia� znale�� jak�� organizacje do kt�rej si� przy��cz�. Mam nadziej�, �e znowu nie wpakowa�em si� w k�opoty.");
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"camp");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CAMPGO
//========================================

INSTANCE DIA_Drax_CAMPGO (C_INFO)
{
	npc          = Org_819_Drax;
	nr           = 7;
	condition    = DIA_Drax_CAMPGO_Condition;
	information  = DIA_Drax_CAMPGO_Info;
	important	= 1;
	permanent	= 0;
};

FUNC INT DIA_Drax_CAMPGO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_GOTO_BANDITOS))
    && (Npc_GetDistToWP(self, "OW_PATH_188")<1000)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_CAMPGO_Info()
{
    AI_Output (self, other ,"DIA_Drax_CAMPGO_03_01"); //No i jeste�my. Witaj w Obozie Bandyt�w. Pogadaj z Doylem i powiedz mu, �e ci� przysy�am.
    AI_Output (self, other ,"DIA_Drax_CAMPGO_03_02"); //Wr�cimy z Ratfordem nied�ugo. Pewnie Emanuel wkr�tce przy�le ci� do nas po zapasy.
	AI_Output (self, other ,"DIA_Drax_CAMPGO_03_03"); //Aha, we� sakw� z rud� Josha i daj j� Quentinowi.
	
	B_GiveInvItems (self, other, itmi_joshpocket, 1);
	//B_LogEntry                     (CH1_BANDITOS_CAMP,"Drax przyprowadzi� mnie do Obozu. Mam pogada� ze stra�nikiem przy bramie - Doylem, a potem uda� si� do Quentina.");
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 1
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> ZIOLA
//========================================

INSTANCE DIA_Drax_ZIOLA (C_INFO)
{
   npc          = ORG_819_Drax;
   nr           = 8;
   condition    = DIA_Drax_ZIOLA_Condition;
   information  = DIA_Drax_ZIOLA_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po mi�so i zio�a.";
};

FUNC INT DIA_Drax_ZIOLA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Emanuel_QUEST1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_ZIOLA_Info()
{
    AI_Output (other, self ,"DIA_Drax_ZIOLA_15_01"); //Przyszed�em po mi�so i zio�a.
    AI_Output (self, other ,"DIA_Drax_ZIOLA_03_02"); //Dobrze, �e pozna�e� Emanuela. To sw�j ch�op.
    AI_Output (self, other ,"DIA_Drax_ZIOLA_03_03"); //Masz tu wszystko, co uda�o nam si� zdoby�.
	//give items
    CreateInvItems (self, ItFo_Plants_mushroom_01, 10);
    B_GiveInvItems (self, other, ItFo_Plants_mushroom_01, 10);
    CreateInvItems (self, ItFo_Plants_RavenHerb_01, 2);
    B_GiveInvItems (self, other, ItFo_Plants_RavenHerb_01, 2);
    CreateInvItems (self, ItAt_Meatbug_01, 5);
    B_GiveInvItems (self, other, ItAt_Meatbug_01, 5);
    CreateInvItems (self, ItFoMuttonRaw, 13);
    B_GiveInvItems (self, other, ItFoMuttonRaw, 13);
	//log
    B_LogEntry     (CH1_DostawaEmanuela,"Drax przekaza� mi to, co uda�o im si� zdoby�. Teraz musz� szybko zanie�� to do Emanuela. Jest tu: oko�o 20 grzyb�w, dwie sztuki ziela, pi�� kawa�k�w mi�sa chrz�szcza i 13 kawa�k�w mi�sa �cierwojada.");
	//experience
    B_GiveXP (50);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia� 4
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Ded
//========================================

INSTANCE DIA_Drax_Ded (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_Ded_Condition;
   information  = DIA_Drax_Ded_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_Ded_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_Ded_Info()
{
    AI_Output (self, other ,"DIA_Drax_Ded_03_01"); //On nie �yje! S�yszysz?! Te gnidy go zabi�y!
    AI_Output (other, self ,"DIA_Drax_Ded_15_02"); //Spokojnie. O co chodzi?
    AI_Output (self, other ,"DIA_Drax_Ded_03_03"); //Stra�nicy ze Starego Obozu rozbiegli si� jak wilki! Atakuj� wszystko co si� rusza.
    AI_Output (self, other ,"DIA_Drax_Ded_03_04"); //Ostatnio oddzia� zwiadowc�w t�dy szed�. Zabili Ratforda!
    AI_Output (self, other ,"DIA_Drax_Ded_03_05"); //A ja nie mog�em z tym nic zrobi�! 
    AI_Output (other, self ,"DIA_Drax_Ded_15_06"); //Z pewno�ci� on czuje si� teraz lepiej ni� my.
    AI_Output (other, self ,"DIA_Drax_Ded_15_07"); //Opowiedz mi co� o tych zwiadowcach.
    AI_Output (self, other ,"DIA_Drax_Ded_03_08"); //Szli w stron� Opuszczonej Kopalni. Pewnie szukaj� nowych �r�de� rudy dla Gomeza.
    AI_Output (self, other ,"DIA_Drax_Ded_03_09"); //POZABIJAM TYCH SUKINSYN�W! Wkr�tce ruszamy prosto na nich.
    AI_Output (other, self ,"DIA_Drax_Ded_15_10"); //Uspok�j si�! Stra�nicy posiek� ci� na kawa�eczki!  
    AI_Output (self, other ,"DIA_Drax_Ded_03_11"); //O nie! Poleje si� krew.
    AI_Output (other, self ,"DIA_Drax_Ded_15_12"); //Przemy�l to!
    AI_Output (self, other ,"DIA_Drax_Ded_03_13"); //Przesta�!
	
	if (MIS_InfoDlaLaresa == LOG_RUNNING)
	{
	B_LogEntry  (CH1_InfoDlaLaresa,"Sytuacja w Obozie Bandyt�w nie wygl�da najlepiej. Stra�nicy zabili Ratforda. Drax chce pom�ci� �mier� przyjaciela. Zebra� grup� Bandyt�w i szykuje atak na Stra�nik�w. Musz� szybko wr�ci� do Laresa.");
	};
	
	/*
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	if (MIS_RozwalaUBnadytow == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Quentin_HELLO35))
	{
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Drax oszala� po tym, gdy Ratford zgin�� z r�ki Stra�nik�w. Bandyta powzi�� zemst� na ludziach Gomeza. Przypuszczam, �e Bandyci, kt�rzy uciekli z Obozu chc� razem z nim walczy�. Musz� szybko ostzrec Quentina.");
	}
	else if (!Npc_KnowsInfo (hero, DIA_Quentin_HELLO35)) && (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
	{
	MIS_RozwalaUBnadytow = LOG_RUNNING;
    Log_CreateTopic            (CH1_RozwalaUBnadytow, LOG_MISSION);
	Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
	B_LogEntry                     (CH1_RozwalaUBnadytow,"To o czym m�wi� Diego zacz�o si� sprawdza�. Rozproszeni po Kolonii Stra�nicy zabijaj� ka�dego, kto nie ma na sobie czerwonego pancerza. Jedn� z ich pierwszych ofiar sta� si� Ratford. Drax jest zrozpaczony �mierci� przyjaciela. Musz� jak najszybciej poinformowa� Quentina o sytuacji zanim Drax zrobi co� g�upiego. ");
	};
	}
	*/
};

//========================================
//-----------------> WTFCH4
//========================================

INSTANCE DIA_Drax_WTFCH4 (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 2;
   condition    = DIA_Drax_WTFCH4_Condition;
   information  = DIA_Drax_WTFCH4_Info;
   permanent	= FALSE;
   description	= "Co tu robi� ci Bandyci?";
};

FUNC INT DIA_Drax_WTFCH4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded))
	&& (MIS_RozwalaUBnadytow == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_WTFCH4_Info()
{
    AI_Output (other, self ,"DIA_Drax_WTFCH4_15_01"); //Co tu robi� ci Bandyci?
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_02"); //Przyszli mi z pomoc�. Zaatakujemy kilka oddzia��w Stra�nik�w rozproszonych wok� Starego Obozu. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_03"); //Cz�� z nich ukrywa si� te� w lasach.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_15_04"); //Dlaczego Quentin o niczym nie wie?
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_05"); //My�lisz, �e b�dzie chcia� walczy�?! Jest pewien, �e w�r�d tych cholernych ska� jest nie�miertelny! G�upiec!
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_06"); //Pr�dzej czy p�niej dojdzie do konfrontacji! On po prostu pr�buje odsun�� od siebie t� my�l. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_07"); //Ale ty jeste� inny... Wiele przeszed�e� i jeste� got�w do po�wi�ce�! Widzia�em jak ze Starego Obozu wychodzi�a du�a grupa Stra�nik�w. S� teraz os�abieni! To najlepszy moment!

    Info_ClearChoices	(DIA_Drax_WTFCH4);
    Info_AddChoice		(DIA_Drax_WTFCH4, "Jestem z wami!", DIA_Drax_WTFCH4_JA);
    Info_AddChoice		(DIA_Drax_WTFCH4, "Nie dam si� w to wci�gn��.", DIA_Drax_WTFCH4_NO);
	
	B_LogEntry              (CH1_RozwalaUBnadytow,"Musze porozmawia� z Quentinem. Draxa ju� nie da si� odci�gn�� od jego plan�w. Quentin musi nas wesprze� kilkoma lud�mi.");
};

FUNC VOID DIA_Drax_WTFCH4_JA()
{
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_01"); //Jestem z wami!
    AI_Output (self, other ,"DIA_Drax_WTFCH4_JA_03_02"); //To �wietnie. Musimy si� przygotowa�.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_03"); //Zanim jednak to zrobimy, powiem o wszystkim Quentinowi. Spr�buj� go nam�wi� na atak.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_04"); //Uwierz mi, �e stanie po naszej stronie. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_JA_03_05"); //W takim razie trzymam ci� za s�owo. Tylko si� po�piesz!
    
    Info_ClearChoices		(DIA_Drax_WTFCH4);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Drax_WTFCH4_NO()
{
    AI_Output (other, self ,"DIA_Drax_WTFCH4_NO_15_01"); //Nie dam si� w to wci�gn��.
    AI_Output (self, other ,"DIA_Drax_WTFCH4_NO_03_02"); //Wi�c id� precz!
	
    Info_ClearChoices		(DIA_Drax_WTFCH4);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUENTINInfosHelp
//========================================

INSTANCE DIA_Drax_QUENTINInfosHelp (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_QUENTINInfosHelp_Condition;
   information  = DIA_Drax_QUENTINInfosHelp_Info;
   permanent	= FALSE;
   description	= "Quentin kaza� ci poczeka� z atakiem.";
};

FUNC INT DIA_Drax_QUENTINInfosHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_DraxInfos))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_QUENTINInfosHelp_Info()
{
    AI_Output (other, self ,"DIA_Drax_QUENTINInfosHelp_15_01"); //Quentin kaza� ci poczeka� z atakiem.
    AI_Output (other, self ,"DIA_Drax_QUENTINInfosHelp_15_02"); //Zosta�cie tu i nie zwracajcie na siebie uwagi Stra�nik�w. My przygotujemy or� i do was do��czymy.
	AI_Output (self, other ,"DIA_Drax_QUENTINInfosHelp_03_03"); //Dobrze, ale po�pieszcie si�!
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Przekaza�em informacj� o planach Quentina Draxowi. Pora zn�w wr�ci� do szefa i czeka� na nast�pne polecenie.");
	
	B_GiveXP (200);
};

//========================================
//-----------------> EndPrzygotowan
//========================================

INSTANCE DIA_Drax_EndPrzygotowan (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_EndPrzygotowan_Condition;
   information  = DIA_Drax_EndPrzygotowan_Info;
   permanent	= FALSE;
   description	= "Przygotowania sko�czone.";
};

FUNC INT DIA_Drax_EndPrzygotowan_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Quentin_WykonanoXD))
	{
    return TRUE;
	};
};
FUNC VOID DIA_Drax_EndPrzygotowan_Info()
{
    AI_Output (other, self ,"DIA_Drax_EndPrzygotowan_15_01"); //Przygotowania sko�czone. Masz ju� jaki� plan?
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_06"); //Zbada�em okolic� i rozrysowa�em wszystko na mapie. Najpierw zaatakujemy Stra�nik�w, kt�rzy za�o�yli ob�z na skarpie. 
	AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_06"); //S� najbli�ej nas i pewnie sporo widzieli. Na pewno prowadz� te� jakie� zwiady.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_07"); //Gdy ju� si� z nimi rozprawimy przejdziemy przez most. Wzd�u� rzeki jest kolejny ob�z. Trzeba tam uwa�a�, poniewa� jest to bardzo blisko bramy. 
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_08"); //Nast�pna grupa znajduje si� przy lesie i w starej chacie przy drugiej bramie. Obejdziemy Stary Ob�z z lewej strony. 
    AI_Output (other, self ,"DIA_Drax_EndPrzygotowan_15_09"); //To ca�y plan?
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_10"); //Tak, to chyba wszystko. Teraz mam dla ciebie szczeg�le zadanie. B�dziesz pilnowa� szereg�w Bandyt�w.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_11"); //Dbaj, �eby si� nie rozle�li i nie rozpocz�li za wcze�nie atak�w. 
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_12"); //Nie r�bcie du�o ha�asu, po prostu id�cie za mn�.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_13"); //We� t� map�, z�ap oddech przed walk� i powiedz, gdy b�dziesz got�w. Zaraz wyruszamy. 
	B_GiveInvItems (self, other, ItWrWorldmapDrax, 1);
    MIS_AtakNaSO = LOG_RUNNING;

    Log_CreateTopic          (CH1_AtakNaSO, LOG_MISSION);
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_RUNNING);
    B_LogEntry               (CH1_AtakNaSO,"Spotka�em wszystkich w miejscu, w kt�rym pierwszy raz widzia�em Ratforda i Draxa. Drax da� mi map� z planami dzia�ania. Mam pilnowa� szereg�w Bandyt�w. Gdy b�d� gotowy, wyruszymy zaatakowa� Stra�nik�w.");
};

//========================================
//-----------------> AtakNaSO
//========================================

INSTANCE DIA_Drax_AtakNaSO (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 1;
   condition    = DIA_Drax_AtakNaSO_Condition;
   information  = DIA_Drax_AtakNaSO_Info;
   permanent	= FALSE;
   description	= "Mo�emy zaczyna�!";
};

FUNC INT DIA_Drax_AtakNaSO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_EndPrzygotowan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_AtakNaSO_Info()
{
    AI_Output (other, self ,"DIA_Drax_AtakNaSO_15_01"); //Mo�emy zaczyna�!
    AI_Output (self, other ,"DIA_Drax_AtakNaSO_03_02"); //Pora wzi�� si� za te gnidy! Chod�cie za mn�!
	
	Org_819_Drax.aivar[AIV_PARTYMEMBER] = TRUE;
	Org_819_Drax.flags = 2;
    Npc_ExchangeRoutine (Org_819_Drax,"atak1");
	AI_StopProcessInfos	(Org_819_Drax);
	
		//------------ Rozproszenie stra�nik�w --------------------------------------
		Npc_ExchangeRoutine (Grd_237_Gardist,"atak");
		Npc_ExchangeRoutine (GRD_266_Gardist,"atak"); 
		Npc_ExchangeRoutine (GRD_206_Gardist,"atak");  
		Npc_ExchangeRoutine (GRD_209_Gardist,"atak");  
		Npc_ExchangeRoutine (STT_310_Schatten,"atak");   
		Npc_ExchangeRoutine (STT_310_Schatten,"atak");  
		
		Wld_InsertNpc				(GRD_305_Gardist,"OC1");	
		Wld_InsertNpc				(GRD_307_Gardist,"OC1");
		Wld_InsertNpc				(GRD_308_Gardist,"OC1");
		Wld_InsertNpc				(GRD_5094_Gardist,"OC1");
		Wld_InsertNpc				(GRD_303_Gardist,"OC1");
		Wld_InsertNpc				(GRD_7788_Gardist,"OC1");
		Wld_InsertNpc				(GRD_7789_Gardist,"OC1");
		
    B_ExchangeRoutine (ORG_858_Quentin , "atak");
	ORG_858_Quentin.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine (NON_2705_Rakus,"burdel");
	B_ChangeGuild (NON_2705_Rakus,GIL_BAU);
	NON_2705_Rakus.guild = GIL_BAU;
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine (NON_2706_osko,"burdel");
	B_ChangeGuild (NON_2706_osko,GIL_BAU);
	NON_2706_osko.guild = GIL_BAU;
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine (ORG_870_Raeuber,"help");
	ORG_870_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	
    //B_ExchangeRoutine (BAN_1603_Martin , "atak");
    //B_ExchangeRoutine (BAN_1606_Josh , "atak");
    //B_ExchangeRoutine (BAN_1604_Jens , "atak");
	//B_ExchangeRoutine (NON_2702_SZEFU , "atak");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"burdel");
	//Npc_ExchangeRoutine (ORG_864_Raeuber,"help");	
	//Npc_ExchangeRoutine (ORG_869_Raeuber,"help");
};

//========================================
//-----------------> PierwszyOboz
//========================================

INSTANCE DIA_Drax_PierwszyOboz (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 6;
   condition    = DIA_Drax_PierwszyOboz_Condition;
   information  = DIA_Drax_PierwszyOboz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_PierwszyOboz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AtakNaSO))
    && (Npc_GetDistToWP (self, "ATAK_WP") < 3000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_PierwszyOboz_Info()
{
    AI_Output (self, other ,"DIA_Drax_PierwszyOboz_03_01"); //Uwa�ajcie. To pierwsze obozowisko.
    AI_Output (self, other ,"DIA_Drax_PierwszyOboz_03_02"); //Do ataku!
    AI_DrawWeapon (self);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pokanoani1
//========================================

INSTANCE DIA_Drax_Pokanoani1 (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 7;
   condition    = DIA_Drax_Pokanoani1_Condition;
   information  = DIA_Drax_Pokanoani1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_Pokanoani1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AtakNaSO))
    && (Npc_IsDead(GRD_206_Gardist ))
    && (Npc_IsDead(GRD_209_Gardist ))
   // && (Npc_IsDead(GRD_266_Gardist ))
    && (Npc_IsDead(GRD_237_Gardist ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_Pokanoani1_Info()
{
    AI_Output (self, other ,"DIA_Drax_Pokanoani1_03_01"); //Pierwsza krew!
    AI_Output (self, other ,"DIA_Drax_Pokanoani1_03_02"); //Zabierzcie ich ekwipunek i idziemy dalej.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"ATAK2");
    AI_StopProcessInfos	(self);
    
};

//========================================
//-----------------> Atak2
//========================================

INSTANCE DIA_Drax_Atak2 (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 8;
   condition    = DIA_Drax_Atak2_Condition;
   information  = DIA_Drax_Atak2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_Atak2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Pokanoani1))
    && (Npc_GetDistToWP (self, "OC_ROUND_22_CF_2_MOVEMENT2") < 3000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_Atak2_Info()
{
    AI_Output (self, other ,"DIA_Drax_Atak2_03_01"); //Tu s� kolejne gnidy!
    AI_Output (self, other ,"DIA_Drax_Atak2_03_02"); //Rozwalmy ich!
    //AI_Output (other, self ,"DIA_Drax_Atak2_15_03"); //Do ataku!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> pokonani2
//========================================

INSTANCE DIA_Drax_pokonani2 (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 9;
   condition    = DIA_Drax_pokonani2_Condition;
   information  = DIA_Drax_pokonani2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_pokonani2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AtakNaSO))
    && (Npc_IsDead(GRD_308_Gardist))
    && (Npc_IsDead(GRD_305_Gardist))
    && (Npc_IsDead(GRD_307_Gardist))    
	{
    return TRUE;
    };
};


FUNC VOID DIA_Drax_pokonani2_Info()
{
    AI_Output (other, self ,"DIA_Drax_pokonani2_15_01"); //Zosta�a ostatnia grupa. 
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_02"); //Musimy by� cicho, �eby nikt si� nie zorientowa�. 
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_03"); //Wi�kszo�� si� i tak uda�a si� w kierunku Nowego Obozu, ale to nie znaczy, �e nie musimy by� czujni.
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_04"); //Teraz idziemy do po�udniowej bramy. Zebrali si� w starej chacie za Obozem.
    //AI_Output (other, self ,"DIA_Drax_pokonani2_15_05"); //Chod�my! Musimy szybko wr�ci� do obozu.
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_06"); //Za mn�!
    
    AI_StopProcessInfos	(self);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak3");
};

//========================================
//-----------------> Atak3_XD
//========================================

INSTANCE DIA_Drax_Atak3_XD (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 15;
   condition    = DIA_Drax_Atak3_XD_Condition;
   information  = DIA_Drax_Atak3_XD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_Atak3_XD_Condition()
{
    if (Npc_GetDistToWP (self, "MAM_WAS_KURDE") < 3000)
    && (Npc_KnowsInfo (hero, DIA_Drax_pokonani2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_Atak3_XD_Info()
{
    AI_Output (self, other ,"DIA_Drax_Atak3_XD_03_01"); //Tutaj s� ostatni. Szybki atak i wracamy!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pokonani3
//========================================

INSTANCE DIA_Drax_Pokonani3 (C_INFO)
{
   npc          = Org_819_Drax;
   nr           = 16;
   condition    = DIA_Drax_Pokonani3_Condition;
   information  = DIA_Drax_Pokonani3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Drax_Pokonani3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AtakNaSO))
    && (Npc_IsDead(GRD_303_Gardist))
    && (Npc_IsDead(GRD_7788_Gardist))
    && (Npc_IsDead(GRD_7789_Gardist ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_Pokonani3_Info()
{
    AI_Output (other, self ,"DIA_Drax_Pokonani3_15_01"); //To ju� chyba wszyscy.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_02"); //Tak, masz racj�. Teraz wreszcie mo�emy wr�ci� do Obozu i odetchn��.
    AI_Output (other, self ,"DIA_Drax_Pokonani3_15_03"); //Chyba ju� pom�ci�e� Ratforda, co?
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_04"); //Te sukinsyny ponios�y kar�. My�l�, �e Quentin mi jeszcze kiedy� podzi�kuje za ten wypad. Okolica stanie si� bezpieczniejsza na pewien czas. 
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_05"); //Zbierajmy si�. Zanim p�jd� chcia�bym ci podzi�kowa� za pomoc.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_06"); //We� to w dow�d mojej wdzi�czno�ci.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_07"); //Nie umiem pos�ugiwa� si� t� broni�. Tobie z pewno�ci� si� przyda. Zagadaj jeszcze do Quentina zanim p�jdziemy. 

    CreateInvItems (self, ItMw_1H_Sword_Broad_02, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Broad_02, 1);
    B_LogEntry               (CH1_AtakNaSO,"Pozbyli�my wszystkich Stra�nik�w kr�c�cych si� wok� Starego Obozu. Drax jest usatysfakcjonowany. Pora pogada� z Quentinem i wraca� do Obozu.");
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_SUCCESS);
    MIS_AtakNaSO = LOG_SUCCESS;

    B_GiveXP (1000);
	Org_819_Drax.flags = 0;
	Npc_ExchangeRoutine (ORG_819_Drax, "ded");
	CreateInvItems 		(ORG_819_Drax, ItMi_Listdraxa,1);
    AI_StopProcessInfos	(self);
    //Npc_ExchangeRoutine (self, "START");
	
};
