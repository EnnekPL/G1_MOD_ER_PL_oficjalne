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
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jestem myœliwym. Utrzymujê siê ze sprzeda¿y skór i k³ów zabitych zwierz¹t.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Da siê z tego wy¿yæ?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Jeœli potrafi siê zrêcznie oporz¹dzaæ zwierzynê - tak, i to ca³kiem nieŸle!

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,	"Aidan, myœliwy mieszkaj¹cy na drodze pomiêdzy Starym a Nowym Obozem, mo¿e mnie nauczyæ, jak patroszyæ upolowan¹ zwierzynê.");
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
	description = "Chcia³bym siê nauczyæ oprawiaæ zwierzynê.";
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
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chcia³bym siê nauczyæ oprawiaæ zwierzynê.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //A co chcesz wiedzieæ?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures, "Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 		,Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"			,Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 		,Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"	,Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nauczy³em ciê ju¿ wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak mogê zdobyæ k³y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Warto zabieraæ k³y wilków, cieniostworów i zêbaczy.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak mogê zdobyæ skóry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
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
   description	= "Witam. Jesteœ z Nowego Obozu?";
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
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_15_01"); //Witam. Jesteœ z Nowego Obozu?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_03_02"); //Tak. O co chodzi?

    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Chcia³bym do³¹czyæ do Obozu. Mo¿e mi coœ o nim opowiesz?", DIA_Aidan_SZPIEGOWANIE_OPCJA1);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Opowiedz mi o waszym Obozie.", DIA_Aidan_SZPIEGOWANIE_OPCJA2);
    Info_AddChoice		(DIA_Aidan_SZPIEGOWANIE, "Co oferuje wasz Obóz?", DIA_Aidan_SZPIEGOWANIE_OPCJA3);
};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA1()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_15_01"); //Chcia³bym do³¹czyæ do Obozu. Mo¿e mi coœ o nim opowiesz?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_02"); //No có¿. Najemnicy s¹ s³ugami Magów Wody. Szkodniki robi¹, co chc¹.
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_03"); //A zbieracze pracuj¹ na polach ry¿owych.
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_15_04"); //Co robicie z ry¿em?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_05"); //Nie wiem, co siê dok³adnie z nim dzieje. Ka¿dy codziennie dostaje swoj¹ porcjê, a reszta trafia do magazynu. 
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA1_03_06"); //Poza tym to pytanie nie do mnie. Pogadaj mo¿e z Ry¿owym Ksiêciem.
    B_LogEntry                     (CH1_TestOC,"Rozmawia³em z Aidanem. Jeœli chcê siê dowiedzieæ czegoœ wiêcej o uprawach ry¿u, to muszê pogadaæ z niejakim Ry¿owym Ksiêciem.");
    wiecejRice = true;

    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);

};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA2()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_15_01"); //Opowiedz mi o waszym Obozie.
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_03_02"); //Co tu du¿o mówiæ? Krety wydobywaj¹ rudê, a Najemnicy s¹ s³ugusami Magów Wody.
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_15_03"); //A co ze Szkodnikami? 
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA2_03_04"); //Robi¹, co chc¹.
    B_LogEntry                     (CH1_TestOC,"Nie dowiedzia³em siê zbyt du¿o o Obozie. Muszê próbowaæ dalej.");
    Info_ClearChoices		(DIA_Aidan_SZPIEGOWANIE);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Aidan_SZPIEGOWANIE_OPCJA3()
{
    AI_Output (other, self ,"DIA_Aidan_SZPIEGOWANIE_OPCJA3_15_01"); //Co oferuje wasz Obóz?
    AI_Output (self, other ,"DIA_Aidan_SZPIEGOWANIE_OPCJA3_03_02"); //Przede wszystkim wolnoœæ.
    B_LogEntry                     (CH1_TestOC,"Nie dowiedzia³em siê zbyt du¿o o Obozie. Muszê próbowaæ dalej.");
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
   description	= "Mo¿e napijesz siê piwa?";
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
    AI_Output (other, self ,"DIA_Aidan_BROWAE_15_01"); //Mo¿e napijesz siê piwa?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_03_02"); //O! Chêtnie. To mi³o z twojej strony.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_Output (self, other ,"DIA_Aidan_BROWAE_03_03"); //Dziêki ci.
	AI_UseItem (self, ItFoBeer);

    Info_ClearChoices		(DIA_Aidan_BROWAE);
    Info_AddChoice		(DIA_Aidan_BROWAE, "Czym zajmuj¹ siê Krety?", DIA_Aidan_BROWAE_KRETY);
	if (wiecejRice == false)
	{
    Info_AddChoice		(DIA_Aidan_BROWAE, "Opowiedz mi o dostawach ry¿u.", DIA_Aidan_BROWAE_RYZ);
	};
};

FUNC VOID DIA_Aidan_BROWAE_KRETY()
{
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_01"); //Czym zajmuj¹ siê Krety?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_02"); //Jak sama nazwa wskazuje, kopi¹ w ziemi.
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_03"); //Co wydobywacie?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_04"); //To chyba oczywiste, ¿e rudê.
    AI_Output (other, self ,"DIA_Aidan_BROWAE_KRETY_15_05"); //Du¿o jej tam macie?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_KRETY_03_06"); //Nie wiem. Rzadko bywam w Obozie. Cronos tego wszystkiego pilnuje.
    B_LogEntry                     (CH1_TestOC,"Cronos pilnuje rudy. Mo¿e od niego czegoœ siê dowiem. Ewentualnie od Kretów w Kot³a. Aidan nie ma nic konkretnego do powiedzenia. Przypuszczam, ¿e Cavalorn dobrze o tym wiedzia³.");
    wiecejOre = true;
  //  Info_ClearChoices		(DIA_Aidan_BROWAE);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Aidan_BROWAE_RYZ()
{
    AI_Output (other, self ,"DIA_Aidan_BROWAE_RYZ_15_01"); //Opowiedz mi o dostawach ry¿u.
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_02"); //Jakich dostawach?
    AI_Output (other, self ,"DIA_Aidan_BROWAE_RYZ_15_03"); //Nie handlujecie ry¿em?
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_04"); //Ty chyba coœ krêcisz. Naglê ciê to tak zainteresowa³o? 
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_05"); //To zawracaj g³owê komuœ innemu. Najlepiej Ry¿owemu Ksiêciu!
    AI_Output (self, other ,"DIA_Aidan_BROWAE_RYZ_03_06"); //Dziêki za piwo.
   // Info_ClearChoices		(DIA_Aidan_BROWAE);
	wiecejRice = true;
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_TestOC,"Nie wysz³o z Aidanem. Dowiedzia³em siê jednak, ¿e o dostawach ry¿u dowiem siê wiêcej od Ry¿owego Ksiêcia.");
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
   description	= "Zajmujesz siê jeszcze czymœ innym?";
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
    AI_Output (other, self ,"DIA_Aidan_OTHERS_15_01"); //Zajmujesz siê jeszcze czymœ innym?
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_02"); //Czasem wykonujê jakieœ ma³e zadanie.
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_03"); //Na przyk³ad ostatnio eskortowaliœmy dostawê rudy do Obozu.
    AI_Output (other, self ,"DIA_Aidan_OTHERS_15_04"); //Ile tego by³o?
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_05"); //Z osiem skrzyñ pe³nych rudy. 
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_06"); //Jedn¹ ze skrzyñ podzielono miêdzy eskortuj¹cych.
    AI_Output (self, other ,"DIA_Aidan_OTHERS_03_07"); //Przypad³o mi 300 bry³ek. 
    B_LogEntry                     (CH1_TestOc,"Aidan pomaga³ przy eskortowaniu rudy do Nowego Obozu. Wszystkiego by³o oko³o osiem skrzyñ.");
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
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_01"); //Hej ty! Widzê, ¿e czêsto podró¿ujesz po Kolonii.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_02"); //Mia³bym do ciebie drobn¹ proœbê.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_03"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_04"); //Nie obawiaj siê, dla cz³owieka twojego pokroju to bêdzie spacerek.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_03_05"); //Mów wiêc, w czym rzecz.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_06"); //Mia³em kiedyœ przyjaciela, nazywa³ siê Gorth.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_07"); //By³ Szkodnikiem, tak jak ja i razem mieszkaliœmy w tej chacie.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_08"); //Wszystko by³o w porz¹dku, jednak pewnego dnia wyruszy³ na polowanie i ju¿ nigdy nie wróci³.
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_09"); //Mam go odszukaæ?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_10"); //Nie. Gorth po¿yczy³ ode mnie mój najlepszy sprzêt ³owiecki.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_11"); //£uk, oraz ¿elazny sztylet - idealny do œci¹gania skór.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_12"); //Chcia³bym te rzeczy odzyskaæ. 
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_15_13"); //Gdzie mam zacz¹æ poszukiwania?
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_14"); //Ten stary skurczybyk chowa³ swoje skarby w jaskini niedaleko kotliny, w której mieszka Cavalorn. Jaskinia znajduje siê przy œcie¿ce do starej orkowej areny. 
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_15"); //Niestety zadomowi³y siê tam zêbacze, a ja nie jestem doœæ silny, by je pokonaæ.
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_03_16"); //Jeœli mi pomo¿esz, dam ci sporo rudy. Zainteresowany?

    Info_ClearChoices		(DIA_Aidan_Quest_Aidan_Start);
    Info_AddChoice		(DIA_Aidan_Quest_Aidan_Start, "Jasne. Spora iloœæ rudy jest wystarczaj¹c¹ motywacj¹. ", DIA_Aidan_Quest_Aidan_Start_Sure);
    Info_AddChoice		(DIA_Aidan_Quest_Aidan_Start, "Nie mam czasu na takie rzeczy. ", DIA_Aidan_Quest_Aidan_Start_Not);
};

FUNC VOID DIA_Aidan_Quest_Aidan_Start_Sure()
{
    AI_Output (other, self ,"DIA_Aidan_Quest_Aidan_Start_Sure_15_01"); //Jasne. Spora iloœæ rudy jest wystarczaj¹c¹ motywacj¹. 
    AI_Output (self, other ,"DIA_Aidan_Quest_Aidan_Start_Sure_03_02"); //Wielkie dziêki. Liczê, ¿e szybko wrócisz. 
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
   description	= "By³em w jaskini.";
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
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Key_15_01"); //By³em w jaskini.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_02"); //To œwietnie. Masz moje rzeczy?
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Key_15_03"); //Nie, natkn¹³em siê za to na solidnie zabezpieczon¹ skrzyniê. Bez klucza nic nie poradzê.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_04"); //O bogowie, na œmieræ zapomnia³em.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_05"); //WeŸ ten klucz, powinien pasowaæ.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Key_03_06"); //Znalaz³em go w kieszeni starego p³aszcza Gortha. 
    CreateInvItems (self, ItMis_AidanKey, 1);
    B_GiveInvItems (self, other, ItMis_AidanKey, 1);
    B_LogEntry                     (CH3_Aidan_Quest,"Aidan da³ mi klucz do skrzyni z jaskini. ");
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
   description	= "Odzyska³em twoje rzeczy.";
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
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_01"); //Odzyska³em twoje rzeczy.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_02"); //Œwietna robota, ju¿ siê ba³em, ¿e gdzieœ z nimi znikniesz. 
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_03"); //Proszê, weŸ te 300 bry³ek rudy.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_04"); //Ja na tym odludziu ich nie potrzebujê.
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_05"); //Dziêki.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_06"); //A w³aœnie, nie chcia³byœ zostaæ myœliwym i polowaæ razem ze mn¹?
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_07"); //Wygl¹dasz na silnego cz³owieka i nieŸle sobie poradzi³eœ z tymi zêbaczami.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_08"); //Wiesz, odk¹d pok³óci³em siê z Ratfordem, a ten uciek³ do Obozu Quentina jest mi strasznie ciê¿ko.
    AI_Output (other, self ,"DIA_Aidan_Aidan_Quest_Success_15_09"); //Nie zagrzewam nigdzie zbyt d³ugo miejsca, ale dziêki za propozycje.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_10"); //No có¿, jak zmienisz zdanie, to daj mi znaæ.
    AI_Output (self, other ,"DIA_Aidan_Aidan_Quest_Success_03_11"); //Powodzenia na szlaku. 
    B_LogEntry                     (CH3_Aidan_Quest,"Odda³em Aidanowi jego ³uk i sztylet.");
    Log_SetTopicStatus       (CH3_Aidan_Quest, LOG_SUCCESS);
    MIS_Aidan_Quest = LOG_SUCCESS;

    B_GiveXP (200);
    B_GiveInvItems (other, self, ItMis_AidanBow, 1);
	B_GiveInvItems (other, self, ItMis_AidanDagger, 1);
	
	CreateInvItems (self, itminugget,300);
	B_GiveInvItems (self, other, itminugget, 300);
};

