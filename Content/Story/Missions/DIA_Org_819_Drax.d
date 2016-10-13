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
// Rozdzia³ 1
// Zadania ró¿nych gildii
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
   description	= "Co mo¿esz mi powiedzieæ o Ratfordzie?";
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
    AI_Output (other, self ,"DIA_Drax_AboutRatford_15_01"); //Co mo¿esz mi powiedzieæ o Ratfordzie?
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_02"); //Daj spokój. Wkurwia mnie ostatnio, jak ma³o kto.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_03"); //Kilka dni temu w naszym Obozie by³ z wizyt¹ niejaki Fortuno z obozu Sekty.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_04"); //Kupiliœmy od niego spory zapas niezwykle mocnego ziela. 
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_05"); //Cz³owieku, ale mieliœmy ubaw.
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_06"); //Tak siê zjaraliœmy, ¿e pomyliœmy Stra¿ników mostu z orkami.
    AI_Output (other, self ,"DIA_Drax_AboutRatford_15_07"); //Co to ma wspólnego z twoim przyjacielem? 
    AI_Output (self, other ,"DIA_Drax_AboutRatford_03_08"); //Jak to co?! Ziele siê skoñczy³o, a on zacz¹³ narzekaæ jak stara baba. Mam ju¿ tego doœæ. 
	//log
    B_LogEntry                     (CH1_CourierFireMage,"Wychodzi na to, ¿e Ratford lubi sobie zapaliæ coœ mocniejszego. Mo¿e to bêdzie klucz do jego zagadki? Ostatnio Bandyci kupili sporo ziela u Fortuno. Powinienem siê do niego udaæ. ");
	//exit
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia³ 1
// Dialogi ogólne
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
	description = "Widzê, ¿e jesteœ myœliwym.";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Widzê, ¿e jesteœ myœliwym.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Na to wygl¹da... Czego chcesz?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Móg³byœ nauczyæ mnie polowaæ?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Parê sztuczek móg³bym ci pokazaæ, ale to bêdzie kosztowaæ.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Ile dok³adnie?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Na pocz¹tek wystarczy ³yk dobrego piwa, potem zobaczymy.
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
	description = "Proszê, oto piwo. Teraz opowiedz mi o polowaniu.";
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
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Proszê, oto piwo. Teraz opowiedz mi o polowaniu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Œcierwojady - tak nazywamy te wielkie ptaszyska - nale¿y atakowaæ jeden po drugim. Na szczêœcie ³atwo odci¹gn¹æ jednego osobnika od reszty stada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Jeœli podejdziesz do nich zbyt blisko, zaczn¹ siê denerwowaæ, a¿ wreszcie rzuc¹ siê w twoj¹ stronê. Lepiej, ¿ebyœ w tej chwili mia³ broñ w pogotowiu.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Jeœli uda ci siê trafiæ œcierwojada zanim on dziobnie ciebie, jak najszybciej wyprowadŸ kolejne uderzenie. Przy odrobinie szczêœcia uda ci siê go pokonaæ bez zadraœniêcia.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //A jeœli ON dziobnie ciê pierwszy... Có¿, lepiej, ¿eby nie dziobn¹³.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nie mam piwa.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //To poszukaj! To najlepsza rada, jak¹ otrzymasz ode mnie za darmo. A skoro ju¿ bêdziesz szuka³, znajdŸ dla mnie jeszcze parê bry³ek rudy.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mogê ci wiele opowiedzieæ o ró¿nych zwierzakach, ale to ciê bêdzie kosztowa³o.
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherBAN, LOG_NOTE);
	B_LogEntry		(GE_TeacherBAN, "Drax mo¿e mnie nauczyæ patroszenia zwierzyny, jeœli zap³acê cenê, której za¿¹da. Znajdê go na drodze pomiêdzy Starym Obozem a miejscem wymiany.");
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
	description = "Czego jeszcze mo¿esz mnie nauczyæ?";
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
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Czego jeszcze mo¿esz mnie nauczyæ?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Wielu rzeczy, ale g³upie piwo nie wystarczy.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny ³owca potrafi zdobyæ k³y, pazury i skórê zwierzyny. Nie jest to ³atwe, ale doœæ op³acalne.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka¿dym razie ka¿dy kupiec chêtnie je od ciebie odkupi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures, "Du¿o ¿¹dasz za swoje us³ugi." 				,Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures, "Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 		,Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"		,Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 	,Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"	,Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Powiedzia³em ci ju¿ wszystko co wiem.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du¿o ¿¹dasz za swoje us³ugi.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Byæ mo¿e, ale wiedza, któr¹ mogê ci przekazaæ pozwoli ci szybko odzyskaæ zainwestowan¹ kwotê.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Wszystkie zwierzêta, które zabijesz nie wiedz¹c jak je oprawiæ, po prostu zgnij¹.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich skórê móg³byœ zarobiæ sporo pieniêdzy.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spróbowa³bym mo¿liwie szybko posi¹œæ te umiejêtnoœci.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak mogê zdobyæ k³y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Warto zabieraæ k³y wilków, cieniostworów i zêbaczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak mogê zdobyæ skóry upolowanej zwierzyny? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.  
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia³ 1
// Przy³¹czenie do obozu bandytów
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
   description	= "Do jakiego obozu nale¿ysz?";
};

FUNC INT DIA_Drax_BANDITOS_CAMP_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drax_BANDITOS_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Drax_BANDITOS_CAMP_15_01"); //Do jakiego obozu nale¿ysz?
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_02"); //Widzê, ¿e jesteœ tu nowy i masz du¿o pytañ, a mi nie za bardzo chce siê teraz z tob¹ rozmawiaæ. 
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_03"); //Powiem ci wiêc tak: Ratford i ja nie przepadamy za Gomezem i jego Stra¿nikami.
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_04"); //Stary Obóz to banda wieprzy i pupilków Króla, najwiêkszego wœród sukinsynów. 
    AI_Output (self, other ,"DIA_Drax_BANDITOS_CAMP_03_05"); //Wiêc, jeœli chcesz z nimi trzymaæ, lepiej st¹d odejdŸ. 
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
   description	= "Mo¿e powiesz mi coœ wiêcej o waszej 'grupie'? ";
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
    AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_01"); //Mo¿e powiesz mi coœ wiêcej o waszej "grupie"? 
    AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_02"); //A ty co? Szpieg Gomeza? 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_03"); //Nie, dopiero co tu trafi³em i chcê siê zorientowaæ co siê tu dzieje. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_04"); //To lepiej idŸ siê orientowaæ gdzieœ indziej. 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_15_05"); //Nie mo¿esz mi po prostu powiedzieæ, kim jesteœcie? 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_03_06"); //A dlaczego chcesz to wiedzieæ?
	Info_ClearChoices	(DIA_Drax_O_BANDYTACH);
	Info_AddChoice		(DIA_Drax_O_BANDYTACH,"Zastanawiam siê który obóz wybraæ.",DIA_Drax_O_BANDYTACH_DECYZJA);
	Info_AddChoice		(DIA_Drax_O_BANDYTACH,"Mê¿czyzna w czerwonej zbroi uderzy³ mnie w twarz. Szukam zemsty.",DIA_Drax_O_BANDYTACH_ZEMSTA);  
};

func void DIA_Drax_O_BANDYTACH_DECYZJA ()
{
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_DECYZJA_15_01"); //Zastanawiam siê który obóz wybraæ.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_DECYZJA_03_02"); //To nie jest jakaœ pieprzona karczma, tylko Górnicza Dolina.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_DECYZJA_03_03"); //Zje¿d¿aj st¹d!
	Drax_choice = false;
	Info_ClearChoices	(DIA_Drax_O_BANDYTACH);
	AI_StopProcessInfos	(self);
};

func void DIA_Drax_O_BANDYTACH_ZEMSTA ()
{
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_15_01"); //Mê¿czyzna w czerwonej zbroi uderzy³ mnie w twarz. Szukam zemsty.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_02"); //Doprawdy? Szukasz zemsty? Ha ha... Nie rozœmieszaj mnie.
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_15_03"); //Ta gnida by³a ze Starego Obozu, tak? Do tego zmierzasz? 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_04"); //Brawo, ch³opcze. Ten typ to Bullit, kawa³ sukinsyna. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_05"); //Podobnie jak po³owa tego zawszonego 'obozu czerwonych'.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_06"); //Oni nie s¹ tacy jak my. Ludzie nie maj¹ dla nich ¿adnej wartoœci. Liczy siê tylko ruda i pertraktacje z królem. 
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_07"); //My, Bandyci jesteœmy inni. 
	AI_Output (other, self ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_08"); //A wiêc Bandyci.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_09"); //Staramy siê prze¿yæ. Trzymamy siê w grupie.
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_10"); //Tymczasem Gomez wykorzystuje Kopaczy do ciê¿kich prac, a Stra¿ników nazywa "stró¿ami sprawiedliwoœci".
	AI_Output (self, other ,"DIA_Drax_O_BANDYTACH_ZEMSTA_03_11"); //Gówno prawda! Wszyscy jesteœmy bandytami i nikt nie trafi³ tu bez powodu.
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
   description	= "Czy mogê do was do³¹czyæ? ";
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
    AI_Output (other, self ,"DIA_Drax_PRZYJECIE_15_01"); //Czy mogê do was do³¹czyæ? 
	if (Drax_choice == true)
	{
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_04"); //Nie wiem coœ ty za jeden, ale myœlê, ¿e masz potencja³.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_05"); //Zdajesz sobie sprawê, ¿e to nie bêdzie spacerek? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_06"); //Jesteœmy œmiertelnymi wrogami z Cieniami i Stra¿nikami ze Starego Obozu. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_07"); //Bêd¹c jednym z nas, nie bêdziesz mia³ tam lekkiego ¿ycia. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_08"); //Nasza przewaga nad Stra¿nikami polega g³ównie na tym, ¿e te pó³mózgi nie wiedz¹ do koñca gdzie znajduje siê nasz Obóz. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_09"); //Dlatego muszê byæ pewien, ¿e jesteœ po naszej stronie i nas nie wydasz. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_10"); //Nie wpuszczamy byle kogo do naszego Obozu, jasne? 
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_15_11"); //Co mam zrobiæ, ¿eby zdobyæ twoje zaufanie? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_12"); //Przede wszystkim musisz siê liczyæ z tym, ¿e odprowadzenie ciê do naszej kryjówki bêdzie równoznaczne z pozostaniem lojalnym i wyrzeczeniem siê przez ciebie innych obozów. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_13"); //Dobrze siê zastanów. Choæ to, ¿e zawracasz mi g³owê jest chyba równoznaczne z tym, ¿e jesteœ pewien czego tak naprawdê chcesz.
	Info_ClearChoices	(DIA_Drax_PRZYJECIE);
	Info_AddChoice		(DIA_Drax_PRZYJECIE,"Jestem gotowy, by do was do³¹czyæ.",DIA_Drax_PRZYJECIE_TRUE);
	Info_AddChoice		(DIA_Drax_PRZYJECIE,"Jeszcze to przemyœlê.",DIA_Drax_PRZYJECIE_LOSE); 
	}
	else
	{
    AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_02"); //Ty? Przesta³o ci siê podobaæ dostawanie po pysku od ludzi Gomeza?  
    AI_Output (self, other ,"DIA_Drax_PRZYJECIE_03_03"); //Szczerze, to mi siê nie podobasz. Lepiej znajdŸ sobie inne miejsce w Kolonii.
    AI_StopProcessInfos	(self);
	};
};

func void DIA_Drax_PRZYJECIE_TRUE ()
{
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_TRUE_15_01"); //Jestem gotowy, by do was do³¹czyæ.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_02"); //To bardzo wa¿ne, co ci za chwilê powiem. Musisz zachowaæ dyskrecje.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_03"); //Jakiœ czas temu wracaliœmy z Ratfordem z polowania w lesie.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_04"); //Gdy ju¿ dochodziliœmy do naszego Obozu, zauwa¿yliœmy, ¿e jesteœmy œledzeni przez jakiegoœ Stra¿nika ze Starego Obozu.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_05"); //Ruszy³em w poœcig, a Ratford próbowa³ rozwaliæ mu ³eb strza³¹. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_06"); //Sukinsyn mia³ szczêœcie, strza³a przelecia³a tu¿ obok jego g³owy. 
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_TRUE_15_07"); //Nie uda³o ci siê go dogoniæ? 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_08"); //Nie, widocznie zaopatrzy³ siê u jakiegoœ maga w odpowiednie mikstury. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_09"); //Pêdzi³ jakby go sam Beliar goni³.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_10"); //Obawiamy siê, ¿e ten szczur ma informacje, które mog¹ pomóc Magnatom zlokalizowaæ nasz Obóz. 
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_11"); //IdŸ do Starego Obozu i wykorzystaj to, ¿e nikt ciê nie zna. Dowiedz siê jak najwiêcej.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_TRUE_03_12"); //Pamiêtaj, ¿eby uwa¿aæ na s³owa i nikomu nie ufaæ.
	
	MIS_DraxTest = LOG_RUNNING;
    Log_CreateTopic          (CH1_DraxTest, LOG_MISSION);
    Log_SetTopicStatus       (CH1_DraxTest, LOG_RUNNING);
    B_LogEntry               (CH1_DraxTest,"Je¿eli chcê, aby Drax zaprowadzi³ mnie do Obozu Bandytów, muszê zdobyæ jego zaufanie i szacunek. Jakiœ czas temu Drax i Ratford padli ofiar¹ szpiega, który zdoby³ wa¿ne informacje na temat po³o¿enia Obozu. Muszê udaæ siê do Starego Obozu i odkryæ czego dowiedzieli siê Stra¿nicy. ");
	Info_ClearChoices	(DIA_Drax_PRZYJECIE);
};

func void DIA_Drax_PRZYJECIE_LOSE ()
{
	AI_Output (other, self ,"DIA_Drax_PRZYJECIE_LOSE_15_01"); //Jeszcze to przemyœlê.
	AI_Output (self, other ,"DIA_Drax_PRZYJECIE_LOSE_03_02"); //Jasne, oczywiœcie. Albo poczekaj, zaraz ci pomogê. 
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
   description	= "Jak wygl¹daj¹ stosunki Obozu Bandytów z pozosta³ymi obozami?";
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
    AI_Output (other, self ,"DIA_Drax_BANDYCI_STOSUNKI_15_01"); //Jak wygl¹daj¹ stosunki Obozu Bandytów z pozosta³ymi obozami? W koñcu nazywaj¹ was oni Bandytami.
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_02"); //Owszem jesteœmy tak nazywani, ale to tylko dlatego, ¿e aby prze¿yæ chwytamy siê ró¿nych zajêæ, jak na przyk³ad rabowanie konwojów z rud¹. 
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_03");	//Ludzie uwa¿aj¹, ¿e to robota typowa dla rzezimieszków.
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_04"); //Co do relacji, có¿, ludzie ze Starego Obozu nas nienawidz¹ i najchêtniej wydaliby nas na po¿arcie zêbaczom. 
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_05");	//Nie maj¹ jednak pojêcia, gdzie siê ukrywamy. Nasz Obóz jest w pobli¿u Kanionu Trolli, który Stra¿nicy Gomeza omijaj¹ szerokim ³ukiem.
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_06"); //W Obozie Bractwa czêsto jesteœmy traktowani jako najemnicy, Stra¿nicy Œwi¹tynni na polecenie Guru wynajmuj¹ nas do brudnej roboty.
    AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_07"); //Jeœli chodzi o Nowy Obóz, ¿yjemy w przyjaznych stosunkach, ludzie Laresa s¹ mile widziani w naszym Obozie. 
	AI_Output (self, other ,"DIA_Drax_BANDYCI_STOSUNKI_03_08");	//W Kolonii jest tak¿e obóz myœliwych i ³owców orków, jednak s¹ oni do nas nastawieni neutralnie i nie wchodzimy sobie w drogê.
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
   description	= "Trochê nam¹ci³em w Starym Obozie.";
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
	
    AI_Output (other, self ,"DIA_Drax_DraxTest_Succes_15_01"); //Trochê nam¹ci³em w Starym Obozie.
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_02"); //S³ysza³em ju¿ wieœci od Ratforda, który gada³ ze Skaz¹.
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_03"); //Ca³y Obóz oszala³. Thorus szuka winnych. 
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_04"); //Wkrótce siê zorientuj¹, ¿e to ty. 
    AI_Output (other, self ,"DIA_Drax_DraxTest_Succes_15_05"); //Nie mo¿esz pozwoliæ mi cieszyæ siê ostatnimi chwilami spokoju? 
    AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_06"); //Ha ha. Masz racjê, zas³u¿y³eœ. 
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_07"); //Gdy ju¿ wypoczniesz, daj mi znak. Mam dla ciebie kolejne zadanie, którym udowodnisz swoj¹ lojalnoœæ.
	B_LogEntry                     (CH1_DraxTest,"Uda³o mi siê dostarczyæ do Draxa notatki Tripa oraz mapê od Grahama. Wreszcie zdoby³em szacunek i zaufanie Bandyty. Mimo to czeka mnie kolejne zadanie.");
    Log_SetTopicStatus       (CH1_DraxTest, LOG_SUCCESS);
    MIS_DraxTest = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItMis_TripNotes, 1);
	B_GiveInvItems (other, self, ItMis_TripMap, 1);
    B_GiveXP (275);
	
	}
	else if (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)
	{
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_08"); //Chcesz zrobiæ ze mnie idiotê. Wynoœ siê!
	B_LogEntry               (CH1_DraxTest,"Jako cz³onek Starego Obozu nie powinienem by³ rozmawiaæ z Draxem. Kaza³ mi siê wynosiæ. W sumie te¿ by³bym wœciek³y.");
    Log_SetTopicStatus       (CH1_DraxTest, LOG_Failed);
    MIS_DraxTest = LOG_Failed;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Drax_DraxTest_Succes_03_09"); //Trochê ju¿ na to za póŸno.
	B_LogEntry               (CH1_DraxTest,"Bêd¹c cz³onkiem innego obozu nie mam czego szukaæ wœród Bandytów.");
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
   description	= "Co jeszcze mam zrobiæ?";
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
    AI_Output (other, self ,"DIA_Drax_WORKFLOW_15_01"); //Co jeszcze mam zrobiæ?
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_02"); //Pójdziesz do Skazy - znasz go ju¿. 
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_03"); //Musisz odebraæ od niego raport zawieraj¹cy wa¿ne informacje. Najpewniej dostaniesz go w formie ustnej. Postaraj siê zapamiêtaæ.
    AI_Output (other, self ,"DIA_Drax_WORKFLOW_15_04"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Drax_WORKFLOW_03_05"); //To nie bêdzie takie proste. Skaza ma jakieœ k³opoty. Opowiada³ mi o nich przy ostatniej rozmowie. Pomó¿ mu z nich wyskoczyæ. Jasne?
    BANMordragRaport = LOG_RUNNING;

    Log_CreateTopic          (CH1_BANMordragRaport, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BANMordragRaport, LOG_RUNNING);
    B_LogEntry               (CH1_BANMordragRaport,"Drax kaza³ mi przynieœæ raport od Skazy, którego znajdê w Starym Obozie... Przy okazji muszê pomóc Bandycie z jego k³opotami. Jeszcze nie wiem, co mnie czeka."); //fix 1210
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
    AI_Output (other, self ,"DIA_Drax_RAPORT_15_03"); //Bractwo zawar³o g³êbsz¹ wspó³pracê z Gomezem. Stary Obóz otrzyma du¿e iloœci ziela w zamian za jakieœ us³ugi w kopalni. Y'Berion widocznie czegoœ tam szuka.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_04"); //Wiesz coœ wiêcej?
    AI_Output (other, self ,"DIA_Drax_RAPORT_15_05"); //Niestety nie. Skaza mia³ ostatnio doœæ ograniczone mo¿liwoœci.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_06"); //Przeka¿ê te wieœci Quentinowi. On zdecyduje, co z tym zrobimy. Musimy mieæ te gnidy ze Starego Obozu na oku.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_09"); //A co do ciebie: wykona³eœ kawa³ dobrej roboty.
    AI_Output (self, other ,"DIA_Drax_RAPORT_03_10"); //Móg³bym ci zap³aciæ, ale chyba nie zale¿y ci na rudzie, tylko na zaufaniu.
	AI_Output (other, self ,"DIA_Drax_RAPORT_15_11"); //Nie pogardzi³bym kilkoma bry³kami na zakup lepszego rynsztunku...
	AI_Output (self, other ,"DIA_Drax_RAPORT_03_12"); //Niech ci bêdzie. Dosta³em to za dwie skóry wilków. 
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH1_BANMordragRaport,"Przekaza³em raport Draxowi tym samym wykonuj¹c moje pierwsze powa¿ne zlecenie. Jestem coraz bli¿ej wejœcia w szeregi Bandytów.");
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
   description	= "Co teraz mam zrobiæ?";
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
    AI_Output (other, self ,"DIA_Drax_DOKOPALNI_15_01"); //Co teraz mam zrobiæ?
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_02"); //Sporo ju¿ wykona³eœ, ale mam dla ciebie jeszcze jedn¹ robotê.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_03"); //Je¿eli tego nie spaprasz, powitamy ciê w naszych szeregach.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_04"); //Ale przejdŸmy do rzeczy...
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_05"); //Musisz odebraæ rudê od naszego cz³owieka. Nazywa siê Josh. Znajdziesz go w Kopalni lub ewentualnie przed ni¹.
    AI_Output (self, other ,"DIA_Drax_DOKOPALNI_03_06"); //Pamiêtaj przy tym, ¿eby dzia³aæ dyskretnie. Gdyby ktoœ niepowo³any siê o tym dowiedzia³, by³oby po Joshu.
 
    MIS_OreInOM = LOG_RUNNING;
	//Wld_InsertNpc			(BAN_1606_Josh,"OM_122");
	//B_KillNpc  				(BAN_1606_Josh);   
    Log_CreateTopic           (CH1_OreInOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OreInOM, LOG_RUNNING);
    B_LogEntry               	(CH1_OreInOM,"Drax kaza³ mi pójœæ do Starej Kopalni i poszukaæ Josha. Mam odebraæ od niego dostawê zdobytej na lewo rudy.");
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
   description	= "Odzyska³em rudê z Kopalni.";
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
    AI_Output (other, self ,"DIA_Drax_ENDEDD_15_01"); //Odzyska³em rudê z Kopalni. Mam j¹ w sakiewce.
    AI_Output (self, other ,"DIA_Drax_ENDEDD_03_02"); //Doskonale. Wszystko przebieg³o pomyœlnie?
    AI_Output (other, self ,"DIA_Drax_ENDEDD_15_03"); //Niezbyt. Josh mia³ k³opoty i musia³ opuœciæ Kopalnie. Spotka³em go w obozie przed Kopalni¹. By³ bardzo zdenerwowany.
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_04"); //Podczas ucieczki zgubi³ sakwê z ca³¹ rud¹. Znalaz³ j¹ jakiœ Kopacz. Po ma³ym dochodzeniu uda³o mi siê ustaliæ, kto j¹ ma.
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_05"); //Ukrad³em klucz, zabra³em rudê i..
	if (Npc_KnowsInfo (hero, DIA_Joel_JoshDie))
	{
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_06"); //...wróci³em do Josha jednak ten ju¿ nie ¿y³. Ian poinformowa³ o wszystkim Stra¿ników.
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_07"); //Cholera. Szkoda goœcia. By³ w porz¹dku i dobrze odwala³ swoj¹ robotê. 
	}
	else
	{
	AI_Output (other, self ,"DIA_Drax_ENDEDD_15_08"); //...chcia³em wróciæ do Josha. Wszed³em do obozu i zobaczy³em Stra¿nika stoj¹cego nad stygn¹cym cia³em. Postanowi³em siê nie zbli¿aæ.
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_09"); //M¹dre posuniêcie. Stra¿nicy mog¹ ciê teraz podejrzewaæ o wspó³pracê z nami. Musisz mieæ siê na bacznoœci.
	};
	AI_Output (self, other ,"DIA_Drax_ENDEDD_03_10"); //Tak czy inaczej, dobrze siê spisa³eœ. 
		
		B_GiveInvItems (other, self, itmi_joshpocket, 1);
		B_LogEntry               (CH1_OreInOM,"Zanios³em  Draxowi znalezion¹ rudê. Nie by³ zadowolony ze œmierci Josha, ale nic nie mog³em z tym zrobiæ.");
		Log_SetTopicStatus       (CH1_OreInOM, LOG_SUCCESS);
		MIS_OreInOM = LOG_SUCCESS;
		B_GiveXP (XP_RudaZKopalni);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia³ 1
// Przy³¹czenie do obozu
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
   description	= "Co z moim przyjêciem?";
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
    AI_Output (other, self ,"DIA_Drax_DOOBOZU_15_01"); //Co z moim przyjêciem?
    AI_Output (self, other ,"DIA_Drax_DOOBOZU_03_02"); //Có¿, przeszed³eœ skompilowane testy. Wykona³eœ ryzykowne zadania. Udowodni³eœ, ¿e potrafisz byæ dyskretny i nie dasz sob¹ manipulowaæ. 
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
   description	= "CHCÊ zostaæ Bandyt¹!";
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
    AI_Output (other, self ,"DIA_Drax_JustGetGuild_15_01"); //CHCÊ zostaæ Bandyt¹!
    AI_Output (self, other ,"DIA_Drax_JustGetGuild_03_02"); //Takiej odpowiedzi oczekiwa³em, ch³opcze. Witaj wœród nas, wyrzutków!
    AI_Output (self, other ,"DIA_Drax_JustGetGuild_03_03"); //Powiedz, gdy bêdziesz gotów, a zaprowadzê ciê do Obozu. Tam dostaniesz pancerz i dowiesz siê co i jak.
	
	//guild and quest status
	hero.guild = GIL_BAU;
	Npc_SetTrueGuild (hero,GIL_BAU);
	HeroJoinToBAN ();
	//HeroJoinToBAN ();
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Od teraz jestem Bandyt¹! Czekaj¹ na mnie nowe wyzwania.");
    //Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_SUCCESS);
    MIS_BANDITOS_CAMP = LOG_SUCCESS;
	//esperience
    B_GiveXP (XP_HeroJoinToBandit);
	//logs other quests
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinOC,	"Bandyta nie mo¿e do³¹czyæ do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry				(CH1_JoinPsi,	"Bractwo bêdzie musia³o radziæ sobie beze mnie. Od dziœ moim domem jest Obóz Bandytów!");
		
		Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinNC,	"Lares bêdzie musia³ o mnie zapomnieæ.");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_EasyJoinOC,	"Zosta³em Bandyt¹. Nic nie wysz³o z mojego u³atwionego przyjêcia do Starego Obozu.");  
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
   description	= "ChodŸmy do Obozu Bandytów!";
};

FUNC INT DIA_Drax_GOTO_BANDITOS_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drax_GOTO_BANDITOS_Info() //fix nazwy z du¿ej 1.4
{
    AI_Output (other, self ,"DIA_Drax_GOTO_BANDITOS_15_01"); //ChodŸmy do Obozu Bandytów!
    AI_Output (self, other ,"DIA_Drax_GOTO_BANDITOS_03_02"); //IdŸ za mn¹! Tylko uwa¿aj na dzik¹ zwierzynê.
    BANDITOS_CAMP = LOG_RUNNING;

    //Log_CreateTopic            (CH1_BANDITOS_CAMP, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_RUNNING);
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Zdoby³em zaufanie Draxa. Teraz jestem gotów by wyruszyæ do Obozu Bandytów. Diego powiedzia³, ¿e w koñcu bêdê musia³ znaleŸæ jak¹œ organizacje do której siê przy³¹czê. Mam nadziejê, ¿e znowu nie wpakowa³em siê w k³opoty.");
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
    AI_Output (self, other ,"DIA_Drax_CAMPGO_03_01"); //No i jesteœmy. Witaj w Obozie Bandytów. Pogadaj z Doylem i powiedz mu, ¿e ciê przysy³am.
    AI_Output (self, other ,"DIA_Drax_CAMPGO_03_02"); //Wrócimy z Ratfordem nied³ugo. Pewnie Emanuel wkrótce przyœle ciê do nas po zapasy.
	AI_Output (self, other ,"DIA_Drax_CAMPGO_03_03"); //Aha, weŸ sakwê z rud¹ Josha i daj j¹ Quentinowi.
	
	B_GiveInvItems (self, other, itmi_joshpocket, 1);
	//B_LogEntry                     (CH1_BANDITOS_CAMP,"Drax przyprowadzi³ mnie do Obozu. Mam pogadaæ ze stra¿nikiem przy bramie - Doylem, a potem udaæ siê do Quentina.");
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia³ 1
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
   description	= "Przyszed³em po miêso i zio³a.";
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
    AI_Output (other, self ,"DIA_Drax_ZIOLA_15_01"); //Przyszed³em po miêso i zio³a.
    AI_Output (self, other ,"DIA_Drax_ZIOLA_03_02"); //Dobrze, ¿e pozna³eœ Emanuela. To swój ch³op.
    AI_Output (self, other ,"DIA_Drax_ZIOLA_03_03"); //Masz tu wszystko, co uda³o nam siê zdobyæ.
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
    B_LogEntry     (CH1_DostawaEmanuela,"Drax przekaza³ mi to, co uda³o im siê zdobyæ. Teraz muszê szybko zanieœæ to do Emanuela. Jest tu: oko³o 20 grzybów, dwie sztuki ziela, piêæ kawa³ków miêsa chrz¹szcza i 13 kawa³ków miêsa œcierwojada.");
	//experience
    B_GiveXP (50);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Drax
// Rozdzia³ 4
// W¹tek g³ówny
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
    AI_Output (self, other ,"DIA_Drax_Ded_03_01"); //On nie ¿yje! S³yszysz?! Te gnidy go zabi³y!
    AI_Output (other, self ,"DIA_Drax_Ded_15_02"); //Spokojnie. O co chodzi?
    AI_Output (self, other ,"DIA_Drax_Ded_03_03"); //Stra¿nicy ze Starego Obozu rozbiegli siê jak wilki! Atakuj¹ wszystko co siê rusza.
    AI_Output (self, other ,"DIA_Drax_Ded_03_04"); //Ostatnio oddzia³ zwiadowców têdy szed³. Zabili Ratforda!
    AI_Output (self, other ,"DIA_Drax_Ded_03_05"); //A ja nie mog³em z tym nic zrobiæ! 
    AI_Output (other, self ,"DIA_Drax_Ded_15_06"); //Z pewnoœci¹ on czuje siê teraz lepiej ni¿ my.
    AI_Output (other, self ,"DIA_Drax_Ded_15_07"); //Opowiedz mi coœ o tych zwiadowcach.
    AI_Output (self, other ,"DIA_Drax_Ded_03_08"); //Szli w stronê Opuszczonej Kopalni. Pewnie szukaj¹ nowych Ÿróde³ rudy dla Gomeza.
    AI_Output (self, other ,"DIA_Drax_Ded_03_09"); //POZABIJAM TYCH SUKINSYNÓW! Wkrótce ruszamy prosto na nich.
    AI_Output (other, self ,"DIA_Drax_Ded_15_10"); //Uspokój siê! Stra¿nicy posiek¹ ciê na kawa³eczki!  
    AI_Output (self, other ,"DIA_Drax_Ded_03_11"); //O nie! Poleje siê krew.
    AI_Output (other, self ,"DIA_Drax_Ded_15_12"); //Przemyœl to!
    AI_Output (self, other ,"DIA_Drax_Ded_03_13"); //Przestañ!
	
	if (MIS_InfoDlaLaresa == LOG_RUNNING)
	{
	B_LogEntry  (CH1_InfoDlaLaresa,"Sytuacja w Obozie Bandytów nie wygl¹da najlepiej. Stra¿nicy zabili Ratforda. Drax chce pomœciæ œmieræ przyjaciela. Zebra³ grupê Bandytów i szykuje atak na Stra¿ników. Muszê szybko wróciæ do Laresa.");
	};
	
	/*
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	if (MIS_RozwalaUBnadytow == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Quentin_HELLO35))
	{
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Drax oszala³ po tym, gdy Ratford zgin¹³ z rêki Stra¿ników. Bandyta powzi¹³ zemstê na ludziach Gomeza. Przypuszczam, ¿e Bandyci, którzy uciekli z Obozu chc¹ razem z nim walczyæ. Muszê szybko ostzrec Quentina.");
	}
	else if (!Npc_KnowsInfo (hero, DIA_Quentin_HELLO35)) && (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
	{
	MIS_RozwalaUBnadytow = LOG_RUNNING;
    Log_CreateTopic            (CH1_RozwalaUBnadytow, LOG_MISSION);
	Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
	B_LogEntry                     (CH1_RozwalaUBnadytow,"To o czym mówi³ Diego zaczê³o siê sprawdzaæ. Rozproszeni po Kolonii Stra¿nicy zabijaj¹ ka¿dego, kto nie ma na sobie czerwonego pancerza. Jedn¹ z ich pierwszych ofiar sta³ siê Ratford. Drax jest zrozpaczony œmierci¹ przyjaciela. Muszê jak najszybciej poinformowaæ Quentina o sytuacji zanim Drax zrobi coœ g³upiego. ");
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
   description	= "Co tu robi¹ ci Bandyci?";
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
    AI_Output (other, self ,"DIA_Drax_WTFCH4_15_01"); //Co tu robi¹ ci Bandyci?
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_02"); //Przyszli mi z pomoc¹. Zaatakujemy kilka oddzia³ów Stra¿ników rozproszonych wokó³ Starego Obozu. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_03"); //Czêœæ z nich ukrywa siê te¿ w lasach.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_15_04"); //Dlaczego Quentin o niczym nie wie?
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_05"); //Myœlisz, ¿e bêdzie chcia³ walczyæ?! Jest pewien, ¿e wœród tych cholernych ska³ jest nieœmiertelny! G³upiec!
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_06"); //Prêdzej czy póŸniej dojdzie do konfrontacji! On po prostu próbuje odsun¹æ od siebie tê myœl. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_03_07"); //Ale ty jesteœ inny... Wiele przeszed³eœ i jesteœ gotów do poœwiêceñ! Widzia³em jak ze Starego Obozu wychodzi³a du¿a grupa Stra¿ników. S¹ teraz os³abieni! To najlepszy moment!

    Info_ClearChoices	(DIA_Drax_WTFCH4);
    Info_AddChoice		(DIA_Drax_WTFCH4, "Jestem z wami!", DIA_Drax_WTFCH4_JA);
    Info_AddChoice		(DIA_Drax_WTFCH4, "Nie dam siê w to wci¹gn¹æ.", DIA_Drax_WTFCH4_NO);
	
	B_LogEntry              (CH1_RozwalaUBnadytow,"Musze porozmawiaæ z Quentinem. Draxa ju¿ nie da siê odci¹gn¹æ od jego planów. Quentin musi nas wesprzeæ kilkoma ludŸmi.");
};

FUNC VOID DIA_Drax_WTFCH4_JA()
{
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_01"); //Jestem z wami!
    AI_Output (self, other ,"DIA_Drax_WTFCH4_JA_03_02"); //To œwietnie. Musimy siê przygotowaæ.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_03"); //Zanim jednak to zrobimy, powiem o wszystkim Quentinowi. Spróbujê go namówiæ na atak.
    AI_Output (other, self ,"DIA_Drax_WTFCH4_JA_15_04"); //Uwierz mi, ¿e stanie po naszej stronie. 
    AI_Output (self, other ,"DIA_Drax_WTFCH4_JA_03_05"); //W takim razie trzymam ciê za s³owo. Tylko siê poœpiesz!
    
    Info_ClearChoices		(DIA_Drax_WTFCH4);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Drax_WTFCH4_NO()
{
    AI_Output (other, self ,"DIA_Drax_WTFCH4_NO_15_01"); //Nie dam siê w to wci¹gn¹æ.
    AI_Output (self, other ,"DIA_Drax_WTFCH4_NO_03_02"); //Wiêc idŸ precz!
	
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
   description	= "Quentin kaza³ ci poczekaæ z atakiem.";
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
    AI_Output (other, self ,"DIA_Drax_QUENTINInfosHelp_15_01"); //Quentin kaza³ ci poczekaæ z atakiem.
    AI_Output (other, self ,"DIA_Drax_QUENTINInfosHelp_15_02"); //Zostañcie tu i nie zwracajcie na siebie uwagi Stra¿ników. My przygotujemy orê¿ i do was do³¹czymy.
	AI_Output (self, other ,"DIA_Drax_QUENTINInfosHelp_03_03"); //Dobrze, ale poœpieszcie siê!
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Przekaza³em informacjê o planach Quentina Draxowi. Pora znów wróciæ do szefa i czekaæ na nastêpne polecenie.");
	
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
   description	= "Przygotowania skoñczone.";
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
    AI_Output (other, self ,"DIA_Drax_EndPrzygotowan_15_01"); //Przygotowania skoñczone. Masz ju¿ jakiœ plan?
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_06"); //Zbada³em okolicê i rozrysowa³em wszystko na mapie. Najpierw zaatakujemy Stra¿ników, którzy za³o¿yli obóz na skarpie. 
	AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_06"); //S¹ najbli¿ej nas i pewnie sporo widzieli. Na pewno prowadz¹ te¿ jakieœ zwiady.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_07"); //Gdy ju¿ siê z nimi rozprawimy przejdziemy przez most. Wzd³u¿ rzeki jest kolejny obóz. Trzeba tam uwa¿aæ, poniewa¿ jest to bardzo blisko bramy. 
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_08"); //Nastêpna grupa znajduje siê przy lesie i w starej chacie przy drugiej bramie. Obejdziemy Stary Obóz z lewej strony. 
    AI_Output (other, self ,"DIA_Drax_EndPrzygotowan_15_09"); //To ca³y plan?
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_10"); //Tak, to chyba wszystko. Teraz mam dla ciebie szczególe zadanie. Bêdziesz pilnowa³ szeregów Bandytów.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_11"); //Dbaj, ¿eby siê nie rozleŸli i nie rozpoczêli za wczeœnie ataków. 
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_12"); //Nie róbcie du¿o ha³asu, po prostu idŸcie za mn¹.
    AI_Output (self, other ,"DIA_Drax_EndPrzygotowan_03_13"); //WeŸ tê mapê, z³ap oddech przed walk¹ i powiedz, gdy bêdziesz gotów. Zaraz wyruszamy. 
	B_GiveInvItems (self, other, ItWrWorldmapDrax, 1);
    MIS_AtakNaSO = LOG_RUNNING;

    Log_CreateTopic          (CH1_AtakNaSO, LOG_MISSION);
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_RUNNING);
    B_LogEntry               (CH1_AtakNaSO,"Spotka³em wszystkich w miejscu, w którym pierwszy raz widzia³em Ratforda i Draxa. Drax da³ mi mapê z planami dzia³ania. Mam pilnowaæ szeregów Bandytów. Gdy bêdê gotowy, wyruszymy zaatakowaæ Stra¿ników.");
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
   description	= "Mo¿emy zaczynaæ!";
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
    AI_Output (other, self ,"DIA_Drax_AtakNaSO_15_01"); //Mo¿emy zaczynaæ!
    AI_Output (self, other ,"DIA_Drax_AtakNaSO_03_02"); //Pora wzi¹æ siê za te gnidy! ChodŸcie za mn¹!
	
	Org_819_Drax.aivar[AIV_PARTYMEMBER] = TRUE;
	Org_819_Drax.flags = 2;
    Npc_ExchangeRoutine (Org_819_Drax,"atak1");
	AI_StopProcessInfos	(Org_819_Drax);
	
		//------------ Rozproszenie stra¿ników --------------------------------------
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
    AI_Output (self, other ,"DIA_Drax_PierwszyOboz_03_01"); //Uwa¿ajcie. To pierwsze obozowisko.
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
    AI_Output (self, other ,"DIA_Drax_Atak2_03_01"); //Tu s¹ kolejne gnidy!
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
    AI_Output (other, self ,"DIA_Drax_pokonani2_15_01"); //Zosta³a ostatnia grupa. 
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_02"); //Musimy byæ cicho, ¿eby nikt siê nie zorientowa³. 
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_03"); //Wiêkszoœæ si³ i tak uda³a siê w kierunku Nowego Obozu, ale to nie znaczy, ¿e nie musimy byæ czujni.
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_04"); //Teraz idziemy do po³udniowej bramy. Zebrali siê w starej chacie za Obozem.
    //AI_Output (other, self ,"DIA_Drax_pokonani2_15_05"); //ChodŸmy! Musimy szybko wróciæ do obozu.
    AI_Output (self, other ,"DIA_Drax_pokonani2_03_06"); //Za mn¹!
    
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
    AI_Output (self, other ,"DIA_Drax_Atak3_XD_03_01"); //Tutaj s¹ ostatni. Szybki atak i wracamy!
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
    AI_Output (other, self ,"DIA_Drax_Pokonani3_15_01"); //To ju¿ chyba wszyscy.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_02"); //Tak, masz racjê. Teraz wreszcie mo¿emy wróciæ do Obozu i odetchn¹æ.
    AI_Output (other, self ,"DIA_Drax_Pokonani3_15_03"); //Chyba ju¿ pomœci³eœ Ratforda, co?
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_04"); //Te sukinsyny ponios³y karê. Myœlê, ¿e Quentin mi jeszcze kiedyœ podziêkuje za ten wypad. Okolica stanie siê bezpieczniejsza na pewien czas. 
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_05"); //Zbierajmy siê. Zanim pójdê chcia³bym ci podziêkowaæ za pomoc.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_06"); //WeŸ to w dowód mojej wdziêcznoœci.
    AI_Output (self, other ,"DIA_Drax_Pokonani3_03_07"); //Nie umiem pos³ugiwaæ siê t¹ broni¹. Tobie z pewnoœci¹ siê przyda. Zagadaj jeszcze do Quentina zanim pójdziemy. 

    CreateInvItems (self, ItMw_1H_Sword_Broad_02, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Broad_02, 1);
    B_LogEntry               (CH1_AtakNaSO,"Pozbyliœmy wszystkich Stra¿ników krêc¹cych siê wokó³ Starego Obozu. Drax jest usatysfakcjonowany. Pora pogadaæ z Quentinem i wracaæ do Obozu.");
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_SUCCESS);
    MIS_AtakNaSO = LOG_SUCCESS;

    B_GiveXP (1000);
	Org_819_Drax.flags = 0;
	Npc_ExchangeRoutine (ORG_819_Drax, "ded");
	CreateInvItems 		(ORG_819_Drax, ItMi_Listdraxa,1);
    AI_StopProcessInfos	(self);
    //Npc_ExchangeRoutine (self, "START");
	
};
